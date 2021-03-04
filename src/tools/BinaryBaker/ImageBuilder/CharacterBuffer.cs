using System.Collections.Generic;
using System.Linq;

namespace ImageBuilder
{
    public static class CharacterBuffer
    {
        public static ushort GetValue(int index) => _buffer[index];
        public static readonly IDictionary<int, ushort> _buffer = (
            from i in Enumerable.Range(0, 3600)
            let bg = i % 80 // (i >> 12) & 0xf // 0x0
            let fg = i / 80 // ((i >> 8) & 0xf) + 1 //0xf
            let c = i % 256
            let v = (bg << 4 | fg) << 8 | c
            select (i, (ushort)v)
            ).ToDictionary(v => v.i, v => v.Item2);

    }
}