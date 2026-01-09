using System;
using Microsoft.SPOT;

namespace WhitedUS.Devices.DOSonCHIP
{
    public struct FixedPoint
    {
        public ushort Value { get; set; }
        public byte HighByte { get { return (byte)(Value >> 8); } }
        public byte LowByte { get { return (byte)(Value); } }

        public override string ToString()
        {
            return HighByte.ToString() + "." + LowByte.ToString();
        }

        public static implicit operator FixedPoint(ushort input)
        {
            return new FixedPoint() { Value = input };
        }

        public static implicit operator ushort(FixedPoint input)
        {
            return input.Value;
        }
    }
}
