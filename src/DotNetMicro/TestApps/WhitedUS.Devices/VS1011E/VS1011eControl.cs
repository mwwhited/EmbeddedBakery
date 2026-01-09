using System;
using Microsoft.SPOT;
using System.Threading;
using WhitedUS.Common;

namespace WhitedUS.Devices.VS1011E
{
    internal sealed class VS1011eControl : VS1011eBase
    {
        public ushort this[Registers register]
        {
            get { return this.Read(register); }
            internal set { this.Write(register, value); }
        }

        #region Constants

        public const bool RESET = false;

        #endregion

        #region Constructor

        private VS1011eControl() : base(VS1011eBase.PIN_CS, 2000) { }

        #endregion

        #region Singleton

        private static VS1011eControl _instance;
        public static VS1011eControl Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new VS1011eControl();
                    _instance.Reset();
                }
                return _instance;
            }
        }

        #endregion

        #region Fields

        private bool _initialized = false;
        private int _currentVolume = Constants.DEFAULT_VOLUME_LEVEL_MP3;

        #endregion

        #region Properties

        public Modes Mode
        {
            get { return (Modes)this.Read(Registers.Mode); }
            internal set { Write(Registers.Mode, (ushort)value); }
        }

        public bool Initialized { get { return _initialized; } }

        #endregion

        #region Internal Methods

        private ushort Read(Registers register)
        {
            var buffer = new byte[4];
            BlockUntilReady();
            this.SPIWriteRead(new byte[] { (byte)Direction.Read, (byte)register, 0, 0 }, buffer);

            return (ushort)((buffer[2] << 8) | buffer[3]);
        }

        private void Write(Registers register, byte data1, byte date2)
        {
            BlockUntilReady();
            this.SPIWrite(new byte[] { (byte)Direction.Write, (byte)register, data1, date2 });
        }

        private void Write(Registers register, ushort data)
        {
            Write(register, (byte)(data >> 8 & 0xff), (byte)(data & 0xff));
        }

        #endregion

        #region Public Methods

        public void Enable()
        {
            if (!_initialized)
                this.Reset();
        }

        public void Disabled()
        {
            _initialized = false;
            _Reset.Write(RESET);
        }

        public void Reset()
        {
            _initialized = false;
            _Reset.Write(RESET);
            Thread.Sleep(20);

            _Reset.Write(!RESET);
            this.SoftReset();

            //Communication test
            this.SetVolume((_currentVolume & ~0x1) | 0x2);
            var returnVal = this[Registers.Volume];
            if (returnVal == 0xffff || returnVal == 0x0000)
                throw new InvalidOperationException("Communication to VS1011e failed");

            _initialized = true;
        }

        public int SetVolume(int level)
        {
            if (level < 0)
                level = 0;
            else if (level > Constants.MAX_VOLUME_LEVEL_MP3)
                level = Constants.MAX_VOLUME_LEVEL_MP3;

            _currentVolume = level;

            byte value = (byte)(255-(level * Constants.VOLUME_STEP_MP3));
            SetVolume(value, value);
            return level;
        }

        internal void SetVolume(byte left, byte right)
        {
            this.Write(Registers.Volume, left, right);
        }

        public void SoftReset()
        {
            BlockUntilReady();
            this.Mode = Modes.SdiNew | Modes.Reset | Modes.Stream;
            Thread.Sleep(20);
            this.Write(Registers.ClockF, (ushort)(0x9800)); //conversion factor for Sparkfun Board
            Thread.Sleep(10);
            this.Write(Registers.AudioData, 0xAC45);
            Thread.Sleep(50);
        }

        #endregion
    }
}
