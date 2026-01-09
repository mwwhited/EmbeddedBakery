using System;
using Microsoft.SPOT;

namespace WhitedUS.Devices.DOSonCHIP
{
    internal class Commands
    {
        internal const byte GET_ID = 0x40;

        internal const byte GET_NAME = 0x47;
        internal const byte SET_HANDLE = 0x48;
        internal const byte SET_BLOCK_LEN = 0x4c;
        internal const byte SET_NAME_LEN = 0x4D;
        internal const byte SET_NAME = 0x4E;

        internal const byte SET_TIME_ON_OFF = 0x52;
        internal const byte SET_TIME = 0x53;
        internal const byte GET_TIME = 0x54;
        internal const byte GET_VERSION = 0x56;
        internal const byte MOUNT = 0x5f;

        internal const byte WRITE_PREALLOCATE = 0x61;
        internal const byte CLOSE = 0x63;
        internal const byte CHANGE_DIR = 0x6c;
        internal const byte MAKE_DIR = 0x6d;

        internal const byte OPEN_WRITE = 0x6f;
        internal const byte OPEN_READ = 0x70;

        internal const byte GET_FREE_SECTORS = 0x75;
        internal const byte WRITE_DATA = 0x77;
        internal const byte DOS_DATA_NAME = 0x7B;
        internal const byte DOS_DATA_BLOCK = 0x7C;
        internal const byte DOS_DATA_BLOCK_END = 0x7D;

    }
}
