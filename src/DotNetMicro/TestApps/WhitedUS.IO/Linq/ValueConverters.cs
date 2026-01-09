using System;
using Microsoft.SPOT;

namespace WhitedUS.IO.Linq
{
    public static class ValueConverters
    {
        public static uint ToUInt(this byte[] input)
        {
            return input.ToUInt(0);
        }
        public static uint ToUInt(this byte[] input, int offset)
        {
            if (input == null || input.Length - offset <= 0)
                return 0;

            byte[] from;

            if (input.Length - offset >= 4)
                from = input;
            else
            {
                from = new byte[4];
                var len = input.Length - offset;
                Array.Copy(input, offset, from, 4 - len, len);
            }


            // new byte[4]; 
            //TODO: make this safe later

            uint ret = 0;
            ret |= (uint)(from[0]) << 24;
            ret |= (uint)(from[1]) << 16;
            ret |= (uint)(from[2]) << 8;
            ret |= (uint)(from[3]) << 0;

            return ret;
        }

        public static byte[] ToArray(this uint input)
        {
            return new byte[] {
                (byte)(input >> 24),
                (byte)(input >> 16),
                (byte)(input >> 8),
                (byte)(input >> 0)
            };
        }
    }
}
