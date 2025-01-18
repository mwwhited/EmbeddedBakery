namespace MicroCodeBuilder
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var definition = @"
0000000mxxx	0011111110100011
0000001mxxx	0011111110100011
0000010mxxx	0011111110100011
0000011mxxx	0011111110100011
0000100mxxx	0011111110100011
0000101mxxx	0011111110100011
0000110mxxx	0011111110100011
0000111m0xx	0011111110100011
0000111m1xx	0011111110100011
0001000mx0x	0011111110100011
0001000mx1x	0011111110100011
0001110mxxx	0011111110100011
0001111mxxx	0011111110100011
0010000mxxx	0110101110101111
0010001mxxx	0110101110101111
0010010mxxx	0110101110101111
0010011mxxx	0110101110101111
0010100mxxx	0110101110101111
0010101mxxx	0110101110101111
0010110mxxx	0110101110101111
0010111m0xx	0110101110101111
0010111m1xx	0110101110101111
0011000mx0x	0110101110101111
0011000mx1x	0110101110101111
0011110mxxx	0110101110101111
0011111mxxx	0110101110101111
0100000mxxx	0111111110100111
0100001mxxx	0011011110100111
0100010mxxx	0011011110100111
0100011mxxx	0011011110100111
0100100mxxx	0011011110100111
0100101mxxx	0111010110100111
0100110mxxx	0111011110100101
0100111m0xx	0111111110100111
0100111m1xx	0111011110100101
0101000mx0x	0111111110100111
0101000mx1x	0111011110100101
0101110mxxx	0111111010110111
0101111mxxx	1111111110100111
0110000mxxx	0111111110100111
0110001mxxx	0110111110000111
0110010mxxx	0110111110000111
0110011mxxx	0110111110000111
0110100mxxx	0101111010100111
0110101mxxx	0111111110100111
0110110mxxx	0111111110100111
0110111m0xx	0111111110100111
0110111m1xx	0111111110100111
0111000mx0x	0111111110100111
0111000mx1x	0111111110100111
0111110mxxx	0111111110100111
0111111mxxx	0111111110100111
1000000mxxx	0111111110100111
1000001mxxx	0111111110100111
1000010mxxx	0111110100100101
1000011mxxx	0111110101100101
1000100mxxx	0111111110100111
1000101mxxx	0111111110100111
1000110mxxx	0111111110100111
1000111m0xx	0111111110100111
1000111m1xx	0111111110100111
1001000mx0x	0111111110100111
1001000mx1x	0111111110100111
1001110mxxx	0111111110100111
1001111mxxx	0111111110100111
1010000mxxx	0111111110100111
1010001mxxx	0111111110100111
1010010mxxx	0111111110100111
1010011mxxx	0111111110100111
1010100mxxx	0111111110100111
1010101mxxx	0111111110100111
1010110mxxx	0111111110100111
1010111m0xx	0111111110100111
1010111m1xx	0111111110100111
1011000mx0x	0111111110100111
1011000mx1x	0111111110100111
1011110mxxx	0111111110100111
1011111mxxx	0111111110100111
1100000mxxx	0111111110100111
1100001mxxx	0111111110100111
1100010mxxx	0111111110100111
1100011mxxx	0111111110100111
1100100mxxx	0111111110100111
1100101mxxx	0111111110100111
1100110mxxx	0111111110100111
1100111m0xx	0111111110100111
1100111m1xx	0111111110100111
1101000mx0x	0111111110100111
1101000mx1x	0111111110100111
1101110mxxx	0111111110100111
1101111mxxx	0111111110100111
1110000mxxx	0111111110100111
1110001mxxx	0111111110100111
1110010mxxx	0111111110100111
1110011mxxx	0111111110100111
1110100mxxx	0111111110100111
1110101mxxx	0111111110100111
1110110mxxx	0111111110100111
1110111m0xx	0111111110100111
1110111m1xx	0111111110100111
1111000mx0x	0111111110100111
1111000mx1x	0111111110100111
1111110mxxx	0111111110100111
1111111mxxx	0111111110100111
xxx1001mxxx	0111111110100111
xxx1010mxxx	0111111110100111
xxx1011mxxx	0111111110100111
xxx1100mxxx	0111111110100111
xxx1101mxxx	0111111110100111
";

            var expanded = Expand("0000000mxxx").ToArray();
            //var x2 = expanded.Select(c => Convert.ToInt32(c == 'm' ? '1' : c, 2)).OrderBy(c => c).ToArray();

            var lines = (
                from l in definition.Split('\n')
                where !string.IsNullOrWhiteSpace(l)
                let trimmed = l.Trim()
                select trimmed.Split("\t") //.Select(t=>new string(t.Reverse().ToArray())).ToArray()
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
                        let ko = new string(i.Reverse().ToArray())
                        let o = Convert.ToUInt32(ko.Replace("m", b.Item3), 2)
                        let v = Convert.ToUInt32(b.Item2, 2)
                        orderby o
                        select (o, (byte)v, part.jj, part.ii); //, b.Item1, x, i, row, high, low, part[1],b.Item3

            var mem = parts.Select(p => p).ToArray();
            var bytes = mem.Select(b=>b.Item2).ToArray();
            File.WriteAllBytes("microCode.bin", bytes);
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
