namespace TruthExpander;

internal class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");
    }

    public string[] Tables = [
        @"
| CLK | CTR/MI || MAR Cp |
|-----|--------||--------|
| 0	  |      0 ||      0 |
| 0   |      1 ||      0 |
| 1   |      0 ||      0 |
| 1   |      1 ||      1 | 
",
        @"
| Program | CTR HLT || HaltOut |
|---------|---------||---------|
|       0 |       0 ||       0 | 
|       0 |       1 ||       1 | 
|       1 |       X ||       1 |
",
        @"
| CTR/RI | CTR/RO | Program | Write | Inspect || RAM/CE | RAM/WE | RAM/OE | User/OE | User/Dir | Bus/OE | Bus Dir |
|--------|--------|---------|-------|---------||--------|--------|--------|---------|----------|--------|---------|
|      0 |      0 |       0 |     X |       X ||      1 |      1 |      1 |       1 |        X |      1 |       X |
|      0 |      1 |       0 |     X |       X ||      0 |      1 |      0 |       1 |        X |      0 |       0 |
|      1 |      0 |       0 |     X |       X ||      0 |      0 |      1 |       1 |        X |      0 |       1 |
|      1 |      1 |       0 |     X |       X ||      1 |      1 |      1 |       1 |        X |      1 |       X |
|      X |      X |       1 |     0 |       0 ||      1 |      1 |      1 |       1 |        1 |      1 |       X |
|      X |      X |       1 |     0 |       1 ||      1 |      1 |      0 |       1 |        X |      1 |       X |
|      X |      X |       1 |     1 |       0 ||      0 |      0 |      1 |       0 |        1 |      1 |       X |
|      X |      X |       1 |     1 |       1 ||      1 |      1 |      0 |       1 |        X |      1 |       X |
",
    ];

}

