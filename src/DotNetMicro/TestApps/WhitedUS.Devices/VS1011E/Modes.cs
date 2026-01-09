using System;
using Microsoft.SPOT;

namespace WhitedUS.Devices.VS1011E
{
    [Flags]
    public enum Modes : ushort
    {
        /// <summary>
        /// Left Channel Inverted
        /// </summary>
        Diff = 0x0001,

        /// <summary>
        /// Enable MPEG 1 & 2
        /// </summary>
        Layer12 = 0x0002,

        /// <summary>
        /// Software Reset
        /// </summary>
        Reset = 0x0004,

        /// <summary>
        /// Jump out of WAV decoding
        /// </summary>
        OutOfWav = 0x0008,

        //SetToZero1 = 0x0010,

        /// <summary>
        /// Allow SDI Tests
        /// </summary>
        Tests = 0x0020,

        /// <summary>
        /// Active Clock Edge (0 = raising, 1 = falling)
        /// </summary>
        DACT = 0x0040,

        /// <summary>
        /// Stream Mode
        /// </summary>
        Stream = 0x0080,

        //SetToZero2 = 0x0100,

        /// <summary>
        /// SDI Bit Order (0 = MSBF, 1 = MSBL),
        /// </summary>
        SdiOrder = 0x0200,

        /// <summary>
        /// SDI chip share
        /// </summary>
        SdiShare = 0x0400,

        /// <summary>
        /// VS1002 Native SPI
        /// </summary>
        SdiNew = 0x0800,

        //SetToZero3 = 0x1000,

        //ZetToZero4 =0x2000,
    }
}
