using System;
using System.IO;
using System.Threading;
using Microsoft.SPOT;
using WhitedUS.Common;
using WhitedUS.IO;
using WhitedUS.Common.Configuration;

namespace WhitedUS.Devices
{
    public class AR1010 : I2CSlaveDevice
    {
        #region Constants

        private readonly byte[] _volumeSettings = new byte[] 
        {
            0x0f, 0xcf, 0xdf, 0xef, 0xff, 0xee, 0xfe, 0xed,
            0xfd, 0xfb, 0xfa, 0xf9, 0xf7, 0xe6, 0xf6, 0xe5,
            0xf5, 0xe3, 0xf3, 0xf2, 0xf1, 0xf0
        };

        #endregion

        #region Fields

        private int _currentVolumeLevel = Constants.DEFAULT_VOLUME_LEVEL_RADIO;

        #endregion

        #region Constructor

        public AR1010() : base(0x10) { }

        #endregion

        #region Indexer Registers

        public ushort this[byte index]
        {
            get { return this.GetUShort(index); }
            internal set { this.PutUShort(index, value); }
        }

        #endregion

        #region Singleton

        private static AR1010 _instance;
        public static AR1010 Instance
        {
            get
            {
                if (_instance == null)
                {
                    try
                    {
                        _instance = new AR1010();
                        _instance.Init();
                        _instance.CurrentVolume = Constants.DEFAULT_VOLUME_LEVEL_RADIO;
                        _instance.Mute();

                        //var settings = Manager.Settings;
                        //_instance.CurrentVolume = settings.LastRadioVolume;
                        //_instance.Station = settings.LastRadioStation;
                    }
                    catch (Exception ex)
                    {
                        Debug.Print("Make sure the AR1010 is turned on");
                        Debug.Print(ex.Message);
                    }
                }
                return _instance;
            }
        }

        #endregion

        #region Properties

        public ushort Channel
        {
            get { return this[0x13].GetBits(0x01ff, 7); }
        }
        public ushort Station
        {
            get { return (ushort)(this.Channel + 690); }
            set { this.Tune(value); }
        }
        public ushort RFSignalStrength
        {
            get { return this[0x12].GetBits(0x01ff, 0); }
        }
        public ushort IFFrequencyCounty
        {
            get { return this[0x12].GetBits(0x003f, 9); }
        }
        public ushort SeekThreshhold
        {
            get { return this[3].GetBits(0x007f, 0); }
        }

        #endregion

        /*
        internal void Init()
        {
            var r0 = this[0]
                .TurnOffBit(0)  //Enable
                .TurnOnBit(1);  //External Oscillator
            this[0] = r0;

            var r1 = this[1]
                .TurnOnBit(0)   //hmute
                .TurnOnBit(1)   //smute
                .TurnOffBit(2)  //mono/stereo 
                .TurnOffBit(3)  //deemp (0 = -50db, 1= -75db)
                .TurnOffBit(4)  //stc interrupt
                .TurnOffBit(5)  //rds interrupt
                .TurnOffBit(6); //rds enable
            this[1] = r1;

            var r2 = this[2]
                .TurnOffBit(9)                  //tune 
                .SetBits(875 - 690, 0x01FF, 0); //channel
            this[2] = r2;

            r2 = r2.TurnOnBit(9);               //tune
            this[2] = r2;
            var t2 = this[0x13].CheckBit(1);
            this.BlockUntilSTC();

            var r3 = this[3]
                .SetBits(0, 0x007f, 0)      //SEEK Threshold
                .SetBits(0, 0x000f, 7)         //Volume
                .SetBits(0, 0x0003, 11)     //Band (0 = US/EU 87.5-108, 1 = Japan 76-90, 2 = Japan Wide 76-108)
                .TurnOnBit(13)              //Space (0 = 200k, 1 = 100k)
                .TurnOffBit(14)             //Seek
                .TurnOffBit(15);            //Seek Direction (0=down, 1=up)
            this[3] = r3;

            var r10 = this[10]
                .TurnOnBit(0);   //seek wrap
            this[10] = r10;

            //var r11 = this[11]
            //    .TurnOffBit(0)  // High Side control bit 2
            //    .TurnOffBit(1)  // High Side control bit 1
            //    .TurnOffBit(2); // AFC high side and lowside injection control
            //this[11] = r11;

            var r13 = this[13]
                .SetBits(0, 0x0003, 0)  //GPIO1 disabled, reserved, logic0, logic1
                .SetBits(0, 0x0003, 2)  //GPIO2 disabled, STC/RDS,  logic0, logic1
                .SetBits(0, 0x0003, 4); //GPIO3 disabled, stereo,   logic0, logic1
            this[13] = r13;

            var r14 = this[14] //Volume2
                .SetBits(0xf, 0x000f, 0);
            this[14] = r14;

            var r15 = this[15]
                .TurnOffBit(0)          //RDS Mode
                .SetBits(0, 0x0003, 1)  //rds mecc
                .TurnOffBit(3);         //rds stat en
            this[15] = r15;

            r0 = r0.TurnOnBit(0);
            this[0] = r0;

            var rssi = this[0x12];
            var ifFreqCounter = rssi.GetBits(0x01ff, 0);
            var signalStrength = rssi.GetBits(0x003f, 9);

            var status = this[0x13];
            var stereo = status.CheckBit(0);//Stereo (1=stereo, 0=mono)
            var sf = status.CheckBit(1);    //Seek Fail (0=success, 1=fail)
            var stc = status.CheckBit(2);   //Seek/Tune Complete (1=complete, 0=incomplete)
            var rdsr = status.CheckBit(3);  //RDS Ready (1=ready, 0-not ready)
            var readChan = status.GetBits(0x01ff, 4);   //current channel

            var devid = this[27];
            var version = devid.GetBits(0x000f, 12);
            var mfid = devid.GetBits(0x0fff, 0);

            var chipid = this[28];
        }
        */

        #region Control Methods

        internal void Init()
        {
            this.Disable();
            Thread.Sleep(10);
            this.Mute();

            //this[3] = this[3].SetBits(v1, 0x000f, 7);
            //this[14] = this[14].SetBits(v2, 0x000f, 12);
            ushort[] defaultValues = new ushort[] {
                0xFFFB,		// R0 -- the first writable register .
                0x5B15,		// R1.
                0xD0B9,		// R2.
                0xAF10,		// R3, seekTHD = 16     (0xA010)
                0x0780,		// R4
                0x28AB,		// R5
                0x6400,		// R6
                0x1EE7,		// R7
                0x7141,		// R8
                0x007D,		// R9
                0x82C6,		// R10  disable wrap
                0x4E55,		// R11. <--- 
                0x970C,		// R12.
                0xB845,		// R13
                0x0C2D,		// R14                  (0xFC2D)
                0x8097,		// R15
                0x04A1,		// R16
                0xDF6A		// R17
            };

            byte[] values = new byte[(defaultValues.Length * 2) + 1];

            for (int i = 0; i < defaultValues.Length; i++)
            {
                values[(i * 2) + 1] = (byte)((defaultValues[i] & 0xff00) >> 8);
                values[(i * 2) + 2] = (byte)(defaultValues[i] & 0x00ff);
            }

            this.Write(values);
            Thread.Sleep(100);
            this.Volume(_currentVolumeLevel);
        }
        public void Enable()
        {
            this[0] = this[0].TurnOnBit(0);
            this.Init();
        }
        public void Disable()
        {
            this[0] = this[0].TurnOffBit(0);
        }

        #endregion

        #region Audio Level Methods

        public int CurrentVolume
        {
            get { return _currentVolumeLevel; }
            set { Volume(value); }
        }

        public int VolumeUp()
        {
            return this.Volume(++_currentVolumeLevel);
        }
        public int VolumeDown()
        {
            return this.Volume(--_currentVolumeLevel);
        }
        public int Volume(int level)
        {
            if (level < 0)
                level = 0;
            else if (level > Constants.MAX_VOLUME_LEVEL_RADIO)
                level = Constants.MAX_VOLUME_LEVEL_RADIO;

            this.Unmute();

            _currentVolumeLevel = level;
            //Volume  = R3 D7-D10 
            //Volume2 = R4 D12-D15

            var v1 = (ushort)(_volumeSettings[level] & 0x0f);
            var v2 = (ushort)((_volumeSettings[level] & 0xf0) >> 4);

            this[3] = this[3].SetBits(v1, 0x000f, 7);
            this[14] = this[14].SetBits(v2, 0x000f, 12);

            return level;
        }

        public void Mute() { this[1] = this[1].TurnOnBit(1); }
        public void Unmute() { this[1] = this[1].TurnOffBit(1); }
        public void ToggleMute() { this[1] = this[1].ToggleBit(1); }

        #endregion

        #region Station Methods

        public ushort TuneUp() { return Tune((ushort)(this.Station + 1)); }
        public ushort TuneDown() { return Tune((ushort)(this.Station - 1)); }
        public ushort Tune(ushort freq)
        {
            if (freq < 760)
                freq = 1080;
            else if (freq> 1080)
                freq = 760;

            //* 1) Set hmute
            this[1] = this[1].TurnOnBit(0);

            //* 2) Clear Tune
            var r2 = this[2].TurnOffBit(9); //tune 
            this[2] = r2;

            //* 3) Clear Seek
            var r3 = this[3].TurnOffBit(14); //Seek
            this[3] = r3;

            //* 4) Set Band/Space/Channel
            r2 = this[2].SetBits((ushort)(freq - 690), 0x01FF, 0); //channel
            this[2] = r2;

            r3 = this[3]
               .SetBits(0, 0x0003, 11)     //Band (0 = US/EU 87.5-108, 1 = Japan 76-90, 2 = Japan Wide 76-108)
               .TurnOnBit(13);             //Space (0 = 200k, 1 = 100k)
            this[3] = r3;

            //* 5) Enable Tune
            r2 = r2.TurnOnBit(9);               //tune
            this[2] = r2;

            //* 6) Wait on STC
            //this.BlockUntilSTC();
            Thread.Sleep(100);

            //* 7) Clear hmute
            this[1] = this[1].TurnOffBit(0);

            //* 8) Update Functions (optional)

            return freq;
        }
        public void Seek(bool up)
        {
            // 1) Set hmute
            this[1] = this[1].TurnOnBit(0);

            // 2) Clear Tune
            this[2] = this[2].TurnOffBit(9); //tune 

            // 4) Clear Seek
            this[3] = this[3].TurnOffBit(14); //Seek

            // 3) Set Channel (CHAN <= REALCHAN)
            this[2] = this[2].SetBits(this.Channel, 0x01FF, 0); //channel   (ushort)(this.Channel+ (up ? 5 : -5))

            // 5) Set SeekUp/Space/Band/SeekThreshhold
            //.SetBits(0, 0x007f, 0)      //SEEK Threshold
            //.SetBits(0, 0x0003, 11)     //Band (0 = US/EU 87.5-108, 1 = Japan 76-90, 2 = Japan Wide 76-108)
            //.TurnOnBit(13)              //Space (0 = 200k, 1 = 100k)
            //.TurnOffBit(14)             //Seek
            //.TurnOffBit(15);            //Seek Direction (0=down, 1=up)
            this[3] = this[3]
                //.SetBits(0, 0x007f, 0)
                .SetBit(15, up);

            // 6) Enable Seek
            this[3] = this[3].TurnOnBit(14);

            // 7) Wait on STC
            Thread.Sleep(100);

            // 8) Clear hmute
            this[1] = this[1].TurnOffBit(0);

            // 9) Update Functions (optional)
        }

        #endregion

        public override string ToString()
        {
            return
                "Stat: " + this.Station.ToString() +
                " Chan: " + this.Channel.ToString() +
                " IF: " + this.IFFrequencyCounty.ToString() +
                " RF: " + this.RFSignalStrength.ToString() +
                " Thrsh: " + this.SeekThreshhold.ToString()
                ;
        }
    }
}
