using System.Collections.Generic;
using System.Linq;

namespace ImageBuilder
{
    public static class CharacterBuffer
    {
        public static ushort GetValue(int index) => _buffer[index];
        public static readonly IDictionary<int, ushort> _buffer = (
            from i in Enumerable.Range(0, 3600)
            let bg = (i / 16) & 0xf
            let fg = (i % 16) & 0xf
            let c = (i % 256) & 0xff
            let v = bg << 12 | fg << 8 | c
            select (i, (ushort)v)
            ).ToDictionary(v => v.i, v => v.Item2);

    }
}