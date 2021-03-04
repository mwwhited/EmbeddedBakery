using System;
using System.Collections;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;

namespace ImageBuilder
{
    class Program
    {
        static void Main(string[] args)
        {
            //var q = from character in CharacterBuffer._buffer
            //        select $"{(character.Value >> 12 & 0xf).ToString("x")}_{(character.Value >> 8 & 0xf).ToString("x")}_{(character.Value & 0xff).ToString("x2")}";


            //foreach(var i in CharacterBuffer._buffer)
            //    Console.WriteLine($"{i.Key.ToString("0000")}\t{i.Value.ToString("X4")}");

            //foreach (var i in ColorPalettes._palette)
            //    Console.WriteLine($"{i.Key.ToString("X1")}\t{i.Value.ToString("X3")}");

            //foreach (var i in CharacterRom._map)
            //{
            //    /*
            //        01      3C24247E62626200

            //                ..@@@@..
            //                ..@..@..
            //                ..@..@..
            //                .@@@@@@.
            //                .@@...@.
            //                .@@...@.
            //                .@@...@.
            //                ........
            //        */
            //    Console.WriteLine($"{i.Key.ToString("X2")}\t{i.Value.ToString("X16")}");
            //    Console.WriteLine();
            //    var bytes = BitConverter.GetBytes(i.Value).Reverse();
            //    foreach (var b in bytes)
            //    {
            //        var bits = new BitArray(new[] { b });
            //        var bools = bits.Cast<bool>().Reverse().Select(c => c ? "@" : ".");
            //        var dis = string.Join("", bools);
            //        Console.WriteLine($"\t{dis}");
            //    }
            //    Console.WriteLine();
            //}

            var columns = 60;
            var rows = 33;
            var charPixelWidth = 8;
            var charPixelHeight = 8;

            //var query = from character in CharacterBuffer._buffer

            //            let bg = (character.Value >> 12) & 0xf
            //            let fg = (character.Value >> 08) & 0xf
            //            let @char = (character.Value >> 00) & 0xff

            //            let position = character.Key
            //            let x = position % columns
            //            let y = position / columns

            //            select new
            //            {
            //                bg,
            //                fg,
            //                @char,

            //                //position,
            //                x,
            //                y,
            //            };

            //foreach (var i in query)
            //{
            //    Console.BackgroundColor = (ConsoleColor)i.bg;
            //    Console.ForegroundColor = (ConsoleColor)i.fg;
            //    Console.SetCursorPosition(i.x, i.y);
            //    Console.Write((char)i.@char);
            //}

            var pixelsWidth = columns * charPixelWidth;
            var pixelsHeight = rows * charPixelHeight;

            var pixels = from y in Enumerable.Range(0, 1080) //pixelsHeight)
                         from x in Enumerable.Range(0, 1920) //pixelsWidth)

                         let realY = y / 4
                         let realX = x / 4

                         // Find the current character postion and subpixels
                         let cx = realX / charPixelWidth % columns
                         let cy = realY / charPixelHeight
                         let ci = cy * columns + cx
                         let sp = realX % charPixelWidth+1
                         let sl = realY % charPixelHeight+1

                         // Get character from buffer
                         let charBuffer = CharacterBuffer.GetValue(ci)
                         let bg = (byte)(charBuffer >> 12 & 0xf)
                         let fg = (byte)(charBuffer >> 8 & 0xf)
                         let @char = (byte)(charBuffer & 0xff)

                         // Get charcter data from character map
                         let charMap = CharacterRom.GetValue(@char)
                         let charMapLine = (charMap >> (8 - sl) * 8) & 0xff
                         //1C 22 4A 56 4C 20 1E 00
                         let charMapPixel = (charMapLine >> (8 - sp) & 0x1) == 0x1

                         // get actual colors from palette
                         //let fgc = ColorPalettes.GetValue(fg)
                         //let bgc = ColorPalettes.GetValue(bg)
                         let clr = ColorPalettes.GetValue(charMapPixel ? fg : bg)
                         //let clr = ColorPalettes.GetValue(charMapPixel ? 0xf : 0x0)

                         select new
                         {
                             x,
                             y,
                             realX,
                             realY,

                             cx,
                             cy,

                             //sp,
                             //sl,

                             //@char,
                             //fgc,
                             //bgc,

                             //charMap = charMap.ToString("X16"),
                             //charMapLine = charMapLine.ToString("X2"),
                             p = charMapPixel ? '@' : '.',
                             clr,
                         };

            //var targetChar = new
            //{
            //    cx = 2,
            //    cy = 0
            //};
            //var targetedPixels = pixels.Where(l => l.cx == targetChar.cx && l.cy == targetChar.cy);

            //foreach (var i in targetedPixels)
            //{
            //    Console.WriteLine(i);
            //}

            //foreach (var line in targetedPixels.GroupBy(l => l.y))
            //{
            //    foreach (var i in line)
            //        Console.Write(i.p);
            //    Console.WriteLine();
            //}

            static Color getColor(ulong clr) =>
                Color.FromArgb(
                        (int)(clr >> 8 & 0xf) << 4,
                        (int)(clr >> 4 & 0xf) << 4,
                        (int)(clr >> 0 & 0xf) << 4
                        );

            //using var bmp = new Bitmap(pixelsWidth, pixelsHeight);
            using var bmp = new Bitmap(1920, 1080);
            foreach (var i in pixels) //.Take(500)
                bmp.SetPixel(i.x, i.y, getColor(i.clr));
            bmp.Save("result.png", ImageFormat.Png);

            //Console.Read();

        }
    }
}