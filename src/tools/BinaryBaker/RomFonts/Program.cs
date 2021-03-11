using System;
using System.Collections;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace RomFonts
{
    class Program
    {
        static async Task Main(string[] args)
        {
            var files = Directory.GetFiles(@".\fonts", "*.bin");
            foreach (var file in files)
            {
                await Console.Out.WriteLineAsync(file);

                var outfile = Path.ChangeExtension(file, ".txt");
                using var outStream = File.CreateText(outfile);

                var outRevfile = Path.ChangeExtension(file, ".rev.txt");
                using var outRevStream = File.CreateText(outRevfile);

                var outHexfile = Path.ChangeExtension(file, ".mem.txt");
                using var outHexStream = File.CreateText(outHexfile);

                var outRevHexfile = Path.ChangeExtension(file, ".rev.mem.txt");
                using var outRevHexStream = File.CreateText(outRevHexfile);

                var outHexMapfile = Path.ChangeExtension(file, ".map.txt");
                using var outHexMapStream = File.CreateText(outHexMapfile);

                var outBitFile = Path.ChangeExtension(file, ".bit.txt");
                using var outBitStream = File.CreateText(outBitFile);
                var outRevBitFile = Path.ChangeExtension(file, ".rev.bit.txt");
                using var outRevBitStream = File.CreateText(outRevBitFile);

                //var pngPixels = (8 * 8);
                //var outPngFile = Path.ChangeExtension(file, ".png");
                //using var outPngBitmap = new Bitmap(pngPixels, pngPixels);

                //var outRevPngFile = Path.ChangeExtension(file, ".rev.png");
                //using var outRevPngBitmap = new Bitmap(pngPixels, pngPixels);

                var data = File.ReadAllBytes(file);
                foreach (var i in from b in data.Select((v, i) => new { v, i, m = i % 8, q = i / 8 })
                                  group b by b.q)
                {
                    var hex = $"CharacterMap[{i.Key.ToString("000")}] <= 64'h{string.Join("_", i.Select(e => e.v.ToString("X2")))};";
                    await Console.Out.WriteLineAsync(hex);
                    await outHexMapStream.WriteLineAsync(hex);

                    //foreach (var iy in i)
                    //{
                    //    for (var px = 0; px < 8; px++)
                    //    {
                    //        var b = (iy.v >> px & 0x1) == 0x1;
                    //        var rx = (px + iy.q) % pngPixels;
                    //        var ry = iy.m + (iy.q / 8);

                    //        outPngBitmap.SetPixel(rx, ry, b ? Color.White : Color.Black);
                    //    }

                    //}
                }

                //outPngBitmap.Save(outPngFile, ImageFormat.Png);
                //outRevPngBitmap.Save(outRevPngFile, ImageFormat.Png);

                foreach (var i in data.Select((v, i) => new { v, i }))
                {
                    var bits = new BitArray(new[] { i.v });
                    var bools = bits.Cast<bool>().Select(c => c ? "@" : " ");
                    var dis = string.Join("", bools);

                    var bitText = bits.Cast<bool>().Select(c => c ? "1" : "0");

                    var outLine = $"{i.i:X3}\t{i.v:X2}\t{dis}";
                    await Console.Out.WriteLineAsync(outLine);
                    await outStream.WriteLineAsync(outLine);
                    await outRevStream.WriteLineAsync($"{i.i:X3}\t{i.v:X2}\t{string.Join("", dis.Reverse())}");
                    await outHexStream.WriteLineAsync($"{i.v:X2} // {i.i:X4}: {dis}");
                    byte[] outByte = new byte[1];
                    new BitArray(bits.Cast<bool>().Reverse().ToArray()).CopyTo(outByte, 0);
                    await outRevHexStream.WriteLineAsync($"{outByte[0]:X2} // {i.i:X4}: {string.Join("", dis.Reverse())}");

                    await outBitStream.WriteLineAsync($"{string.Join("", bitText)}");
                    await outRevBitStream.WriteLineAsync($"{string.Join("", bitText.Reverse())}");


                    if (i.i % 8 == 7)
                    {
                        var splitter = new string('-', 32);
                        await Console.Out.WriteLineAsync(splitter);
                        await outStream.WriteLineAsync(splitter);
                        await outRevStream.WriteLineAsync(splitter);

                        await outHexStream.WriteLineAsync("// " + splitter);
                        await outRevHexStream.WriteLineAsync("// " + splitter);
                    }
                }


                // var outPngBitmapData = outPngBitmap.LockBits(new Rectangle(0, 0, pngPixels, pngPixels), ImageLockMode.ReadWrite, PixelFormat.Format1bppIndexed);
                // outPngBitmap.UnlockBits(outPngBitmapData);
                // outRevPngBitmap.UnlockBits(outRevPngBitmapData);
                //for (int x = 0; x < 8; x++)
                //    for (int y = 0; y < 8; y++)
                //    {
                //        var cb = data[y * 8 + x];
                //        //var outPngBitmapData = outPngBitmap.LockBits(new Rectangle(x * 9, x * 9, pngPixels, pngPixels), ImageLockMode.ReadWrite, PixelFormat.Format1bppIndexed);
                //        //outPngBitmap.UnlockBits(outPngBitmapData);

                //    }


            }
        }
    }
}
