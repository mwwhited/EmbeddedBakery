using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using DeviceSolutions.SPOT.Hardware;

namespace WhitedUS.Devices.VS1011E
{
    internal sealed class VS1011eData : VS1011eBase
    {
        #region Constructor

        private VS1011eData() : base(VS1011eBase.PIN_BSYNC, 4000) { }

        #endregion

        #region Singleton

        private static VS1011eData _instance;
        public static VS1011eData Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new VS1011eData();
                    if (!VS1011eControl.Instance.Initialized)
                        VS1011eControl.Instance.Reset();
                }
                return _instance;
            }
        }

        #endregion

        #region Public methods

        public void Enable()
        {
            VS1011eControl.Instance.Enable();
        }

        public void Disabled()
        {
            VS1011eControl.Instance.Disabled();
        }

        public void Write(byte data)
        {
            this.SPIWrite(new byte[] { data });
        }

        public void Write(byte[] buffer)
        {
            this.Write(buffer, 0, buffer.Length);
        }

        public void Write(byte[] buffer, int offset, int length)
        {
            if (length <= 0)
                return;

            BlockUntilReady();

            byte[] packetBuffer = null;
            if (buffer.Length == 32)
            {
                this.SPIWrite(buffer);
            }
            else if (length <= 32)
            {
                packetBuffer = new byte[length];
                Array.Copy(buffer, offset, packetBuffer, 0, length);
                this.SPIWrite(packetBuffer);
            }
            else
            {
                this.SPIWrite(buffer);
                //packetBuffer = new byte[32];
                //for (int i = offset; i < length; i += 32)
                //{
                //    Array.Copy(buffer, i, packetBuffer, 0, Math.Min(32, buffer.Length -i));
                //    BlockUntilReady();
                //    this.SPIWrite(packetBuffer);
                //}
            }
        }

        #endregion
    }
}
