using System;
using Microsoft.SPOT;

namespace WhitedUS.Devices.VS1011E
{
    internal enum Direction : byte
    {
        Read = 0x3,
        Write = 0x2
    }
}
