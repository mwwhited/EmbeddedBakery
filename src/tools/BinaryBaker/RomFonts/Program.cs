using System;
using System.Collections;
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


                var data = File.ReadAllBytes(file);
                foreach (var i in from b in data.Select((v, i) => new { v, i })
                                  let g = b.i / 8
                                  group b by g)
                {
                    var hex = $"CharacterMap[{i.Key.ToString("000")}] <= 64'h{string.Join("_", i.Select(e => e.v.ToString("X2")))};";
                    await Console.Out.WriteLineAsync(hex);
                    await outHexMapStream.WriteLineAsync(hex);
                }

                foreach (var i in data.Select((v, i) => new { v, i }))
                {
                    var bits = new BitArray(new[] { i.v });
                    var bools = bits.Cast<bool>().Select(c => c ? "@" : " ");
                    var dis = string.Join("", bools);

                    var outLine = $"{i.i:X3}\t{i.v:X2}\t{dis}";
                    await Console.Out.WriteLineAsync(outLine);
                    await outStream.WriteLineAsync(outLine);
                    await outRevStream.WriteLineAsync($"{i.i:X3}\t{i.v:X2}\t{string.Join("", dis.Reverse())}");

                    await outHexStream.WriteLineAsync($"{i.v:X2} // {i.i:X4}: {dis}");
                    byte[] outByte = new byte[1];
                    new BitArray(bits.Cast<bool>().Reverse().ToArray()).CopyTo(outByte, 0);
                    await outRevHexStream.WriteLineAsync($"{outByte[0]:X2} // {i.i:X4}: {string.Join("", dis.Reverse())}");

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
            }
        }
    }
}
