using System;
using Microsoft.SPOT;
using DeviceSolutions.SPOT.Hardware;

namespace WhitedUS.Devices
{
    public class TSC2046
    {
        private TSC2046() { }

        private static TSC2046 _instance;
        public static TSC2046 Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new TSC2046();
                return _instance;
            }
        }

        public float Battery
        {
            get { return TahoeII.Tsc2046.ReadBat(); }
        }

        public float Auxilery
        {
            get { return TahoeII.Tsc2046.ReadAux(); }
        }

        public float TempatureC
        {
            get { return TahoeII.Tsc2046.ReadTemperature(); }
        }

        public float TempatureF
        {
            get { return TempatureC * 9/5 + 32; }
        }
    }
}
