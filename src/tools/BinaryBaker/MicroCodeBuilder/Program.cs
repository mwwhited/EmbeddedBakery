namespace MicroCodeBuilder
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var definition = File.ReadAllLines("MicroCode.tsv");

            //var expanded = Expand("0000000mxxx").ToArray();
            //var x2 = expanded.Select(c => Convert.ToInt32(c == 'm' ? '1' : c, 2)).OrderBy(c => c).ToArray();

            var lines = (
                from l in definition
                where !string.IsNullOrWhiteSpace(l)
                let trimmed = l.Trim()
                let ts = trimmed.Split("\t", StringSplitOptions.TrimEntries)
                where ts.Length > 1
                select ts
            ).ToArray();

            var keys = (
                from k in lines
                select new
                {
                    k = k[0],
                    x = Expand(k[0]).ToArray(),
                }
            ).ToDictionary(k => k.k, v => v.x);

            var parts = from part in lines.Select((ii, jj) => new { ii, jj })
                        let row = part.ii[0]
                        let high = part.ii[1].Substring(0, 8)
                        let low = part.ii[1].Substring(8, 8)
                        let x = keys[row]
                        from b in new[]
                        {
                            (row.Replace("m", "0"), high, "0"),
                            (row.Replace("m", "1"), low, "1"),
                        }
                        from i in x
                        let o = Convert.ToUInt32(i.Replace("m", b.Item3), 2)
                        let v = Convert.ToUInt32(b.Item2, 2)
                        orderby o
                        select (o, (byte)v, part.jj, part.ii); //, b.Item1, x, i, row, high, low, part[1],b.Item3

            var mem = parts.Select(p => p).ToArray();
            var bytes = mem.Select(b=>b.Item2).ToArray();
            File.WriteAllBytes(@"C:\Repos\notes\shared\Notes\SAP-1 - Eater 8-bit\microCode5.bin", bytes);
        }

        public static IEnumerable<string> Expand(string expand)
        {
            if (!expand.Contains('x')) //&& !expand.Contains('m'))
            {
                yield return expand;
                yield break;
            }

            var index = expand.IndexOf('x') switch
            {
                // -1 => expand.IndexOf('m'),
                int x => x
            };

            var pre = expand.Substring(0, index);
            var post = expand.Substring(index + 1);

            var tries = new[] { $"{pre}0{post}", $"{pre}1{post}" }.SelectMany(Expand);

            foreach (var t in tries)
                yield return t;
        }
    }
}
