using System;
using Microsoft.SPOT;
using System.Text;

namespace WhitedUS.Common
{
    public static class Utilities
    {
        public static char[] GetChars(this byte[] source, int offset, int length)
        {
            if (length == 0)
                throw new ArgumentOutOfRangeException("length");
            if (source == null)
                throw new ArgumentNullException("source");
            if (length + offset > source.Length)
                throw new ArgumentOutOfRangeException("length+offset is longer than source.Lenght");

            var tempBuffer = new byte[length];
            var charResult = new char[length];
            Array.Copy(source, 3, tempBuffer, 0, length);
            charResult = Encoding.UTF8.GetChars(tempBuffer);

            return charResult;
        }

        public static int BCDtoInt(this ushort input)
        {
            var highByte = (byte)((input & 0xff00) >> 8);
            var lowByte = (byte)(input & 0x00ff);
            return highByte.BCDtoInt() * 100 + lowByte;
        }

        public static int BCDtoInt(this byte input, byte highMask, byte lowMask)
        {
            return (input & lowMask) + (((input & highMask) >> 4) * 10);
        }

        public static int BCDtoInt(this byte input)
        {
            return BCDtoInt(input, 0xf0, 0x0f);
        }

        public static int BCDtoInt(this byte input, byte highMask)
        {
            return BCDtoInt(input, highMask, 0x0f);
        }

        public static byte InttoBCDByte(this int input)
        {
            return (byte)(((input / 10) << 4) | (input % 10));
        }

        //public static byte InttoBCDUShort(this int input)
        //{
        //}

        public static ushort TurnOnBit(this ushort input, byte bit)
        {
            if (bit > 15)
                throw new ArgumentOutOfRangeException("bit");

            input |= (ushort)(1 << bit);
            return input;
        }

        public static byte TurnOnBit(this byte input, byte bit)
        {
            if (bit > 7)
                throw new ArgumentOutOfRangeException("bit");

            input |= (byte)(1 << bit);
            return input;
        }

        public static ushort TurnOffBit(this ushort input, byte bit)
        {
            if (bit > 15)
                throw new ArgumentOutOfRangeException("bit");

            var mask = (ushort)~(1 << bit);
            input &= mask;
            return input;
        }

        public static byte TurnOffBit(this byte input, byte bit)
        {
            if (bit > 7)
                throw new ArgumentOutOfRangeException("bit");

            var mask = (byte)~(1 << bit);
            input &= mask;
            return input;
        }

        public static ushort SetBit(this ushort input, byte bit, bool value)
        {
            return value ? input.TurnOnBit(bit) : input.TurnOffBit(bit);
        }

        public static byte SetBit(this byte input, byte bit, bool value)
        {
            return value ? input.TurnOnBit(bit) : input.TurnOffBit(bit);
        }

        public static ushort ToggleBit(this ushort input, byte bit)
        {
            if (bit > 15)
                throw new ArgumentOutOfRangeException("bit");

            input ^= (ushort)(1 << bit);
            return input;
        }

        public static ushort SetBits(this ushort input, ushort value, ushort mask, byte offset)
        {
            if (offset > 15)
                throw new ArgumentOutOfRangeException("offset");

            value = (ushort)(value & mask);
            value = (ushort)(value << offset);

            mask = (ushort)(mask << offset);
            mask = (ushort)~mask;

            input &= mask;
            input |= value;

            return input;
        }

        public static bool CheckMask(this byte input, byte mask)
        {
            return (input & mask) == mask;
        }

        public static bool CheckMask(this ushort input, ushort mask)
        {
            return (input & mask) == mask;
        }

        public static bool CheckBit(this ushort input, byte bit)
        {
            if (bit > 15)
                throw new ArgumentOutOfRangeException("bit");

            ushort mask = (ushort)(1 << bit);
            return input.CheckMask(mask);
        }

        public static bool CheckBit(this byte input, byte bit)
        {
            if (bit > 7)
                throw new ArgumentOutOfRangeException("bit");

            byte mask = (byte)(1 << bit);
            return input.CheckMask(mask);
        }

        public static byte GetBits(this byte input, byte mask, byte offset)
        {
            if (offset > 7)
                throw new ArgumentOutOfRangeException("offset");

            input = (byte)(input >> offset);
            input &= mask;
            return input;
        }

        public static ushort GetBits(this ushort input, ushort mask, byte offset)
        {
            if (offset > 15)
                throw new ArgumentOutOfRangeException("offset");

            input = (ushort)(input >> offset);
            input &= mask;
            return input;
        }

    }
}
