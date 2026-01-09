using System;

namespace WhitedUS.Net.SNTP
{
    public class BitConverter
    {
        public static uint ToUInt32(byte[] buffer, int offset)
        {
            return
                (uint)buffer[offset] << 24 |
                (uint)buffer[offset + 1] << 16 |
                (uint)buffer[offset + 2] << 8 |
                (uint)buffer[offset + 3];
        }

        public static byte[] GetBytes(uint input)
        {
            return new byte[]
            {
                (byte)((input & 0xff000000) >> 24),
                (byte)((input & 0x00ff0000) >> 16),
                (byte)((input & 0x0000ff00) >> 8),
                (byte)((input & 0x000000ff)),
            };
        }

        public static ulong ToUInt64(byte[] buffer, int offset)
        {
            return
                (ulong)buffer[offset + 0] << 56 |
                (ulong)buffer[offset + 1] << 48 |
                (ulong)buffer[offset + 2] << 40 |
                (ulong)buffer[offset + 3] << 32 |
                (ulong)buffer[offset + 4] << 24 |
                (ulong)buffer[offset + 5] << 16 |
                (ulong)buffer[offset + 6] << 8 |
                (ulong)buffer[offset + 7] << 0;
        }

        public static byte[] GetBytes(ulong input)
        {
            return new byte[]
            {
                (byte)((input & 0xFF00000000000000) >> 56),
                (byte)((input & 0x00FF000000000000) >> 48),
                (byte)((input & 0x0000FF0000000000) >> 40),
                (byte)((input & 0x000000FF00000000) >> 32),
                (byte)((input & 0x00000000FF000000) >> 24),
                (byte)((input & 0x0000000000FF0000) >> 16),
                (byte)((input & 0x000000000000FF00) >> 8),
                (byte)((input & 0x00000000000000FF))
            };
        }
    }
}
