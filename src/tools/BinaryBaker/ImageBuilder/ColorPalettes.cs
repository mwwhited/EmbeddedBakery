using System;
using System.Collections.Generic;

namespace ImageBuilder
{
    public static class ColorPalettes
    {
        public static ushort GetValue(byte index) => _palette[index];
        public static readonly IDictionary<byte, ushort> _palette = new Dictionary<byte, ushort>
        {
            { 0x0, 0x000 },
            { 0x1, 0x00A },
            { 0x2, 0xA00 },
            { 0x3, 0xA0A },
            { 0x4, 0x0A0 },
            { 0x5, 0x0AA },
            { 0x6, 0xAA0 },
            { 0x7, 0xAAA },
            { 0x8, 0x666 },
            { 0x9, 0x00F },
            { 0xA, 0xF00 },
            { 0xB, 0xF0F },
            { 0xC, 0x0F0 },
            { 0xD, 0x0FF },
            { 0xE, 0xFF0 },
            { 0xF, 0xFFF },
        };
    }
}
