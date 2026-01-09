using System;
using Microsoft.SPOT;

namespace WhitedUS.Common
{
    public static class CRCUtilities
    {
        public static byte CRC7(this byte[] input)
        {
            return input.CRC7(0, input.Length);
        }
        public static byte CRC7(this byte[] input, int length)
        {
            return input.CRC7(0, length);
        }
        public static byte CRC7(this byte[] input, int offset, int length)
        {
            byte crc = 0, data;
            for (int a = 0; a < length; a++)
            {
                data = input[a];
                for (int i = 0; i < 8; i++)
                {
                    crc <<= 1;
                    if (((data & 0x80) ^ (crc & 0x80)) != 0)
                        crc ^= 0x09;
                    data <<= 1;
                }
            }
            return (byte)((crc << 1) | 1);
        }

        public static byte[] FillToEnd(this byte[] data, byte value)
        {
            return data.FillToEnd(value, 0);
        }
        public static byte[] FillToEnd(this byte[] data, byte value, int offset)
        {
            var length = data.Length;
            for (int i = offset; i < length; i++)
                data[i] = value;
            return data;
        }
    }
}
