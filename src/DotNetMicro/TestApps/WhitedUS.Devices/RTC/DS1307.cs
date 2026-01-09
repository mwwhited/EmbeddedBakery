using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using System.IO;
using WhitedUS.IO;
using WhitedUS.Common;

namespace WhitedUS.Devices.RTC
{
    public class DS1307 : I2CSlaveDevice
    {
        private DS1307() : base(0x68) { }

        private static DS1307 _instance;
        internal static DS1307 Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new DS1307();
                return _instance;
            }
        }

        /// <summary>
        /// Get/Set Local Time
        /// </summary>
        public static DateTime RTC
        {
            get { return Instance.GetPacket().Decode(); }
            set { Instance.WritePacket(value); }
        }

        internal byte[] GetPacket()
        {
            var buffer = new byte[8];
            if (this.WriteRead(new byte[] { 0 }, buffer) != 9)
                throw new IOException();
            return buffer;
        }

        internal void WritePacket(DateTime input)
        {
            var buffer = input.Encode(); 
            var writeBuffer = new byte[9];
            Array.Copy(buffer, 0, writeBuffer, 1, 8);
            this.Write(writeBuffer);
        }

        public static void SetTime()
        {
            SetTime(TimeZoneId.Eastern);
        }
        public static void SetTime(TimeZoneId timezone)
        {
            ExtendedTimeZone.SetTimeZone(timezone);
            Utility.SetLocalTime(RTC);
        }
    }
}
