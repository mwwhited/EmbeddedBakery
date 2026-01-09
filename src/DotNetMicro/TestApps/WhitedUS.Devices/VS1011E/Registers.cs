using System;
using Microsoft.SPOT;

namespace WhitedUS.Devices.VS1011E
{
    internal enum Registers : byte
    {
        Mode = 0x0,
        Status = 0x1,
        Bass = 0x2,
        ClockF = 0x3,
        DecodeTime = 0x4,
        AudioData = 0x5,
        WRAM = 0x6,
        WRAMAddress = 0x7,
        HDAT0 = 0x8,
        HDAT1 = 0x9,
        ApplicationAddress = 0xA,
        Volume = 0xB,
        ApplicationControl0 = 0xC,
        ApplicationControl1 = 0xD,
        ApplicationControl2 = 0xE,
        ApplicationControl3 = 0xF
    }
}
