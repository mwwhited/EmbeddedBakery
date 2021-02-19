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
                var outfile = Path.ChangeExtension(file, ".txt");
                using var outStream = File.CreateText(outfile);

                var outRevfile = Path.ChangeExtension(file, ".rev.txt");
                using var outRevStream = File.CreateText(outRevfile);

                var data = File.ReadAllBytes(file);
                foreach (var i in data.Select((v, i) => new { v, i }))
                {
                    var bits = new BitArray(new[] { i.v });
                    var bools = bits.Cast<bool>().Select(c => c ? "@" : " ");
                    var dis = string.Join("", bools);

                    var outLine = $"{i.i:X3}\t{i.v:X2}\t{dis}";
                    await Console.Out.WriteLineAsync(outLine);
                    await outStream.WriteLineAsync(outLine);
                    await outRevStream.WriteLineAsync($"{i.i:X3}\t{i.v:X2}\t{string.Join("",dis.Reverse())}");

                    if (i.i % 8 == 7)
                    {
                        var splitter = new string('-', 32);
                        await Console.Out.WriteLineAsync(splitter);
                        await outStream.WriteLineAsync(splitter);
                        await outRevStream.WriteLineAsync(splitter);
                    }
                }
            }
        }
    }
}
