using System;
using Microsoft.SPOT;

namespace WhitedUS.Devices.DOSonCHIP
{
    public class Version
    {
        public FixedPoint Firmware { get; internal set; }
        public FixedPoint Boot { get; internal set; }

        public override string ToString()
        {
            return "Firmware:" + Firmware.ToString() + " Boot:" + Boot.ToString();
        }
    }
}
