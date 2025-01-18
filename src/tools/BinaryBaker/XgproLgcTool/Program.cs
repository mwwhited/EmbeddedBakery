using System.Collections.Generic;
using System.IO;


namespace XgproLgcTool;

public class Program
{
    public static void Main()
    {
        var lgc = LgcFile.ParseLGCFile(@"C:\Wincupl\WinCupl\Mine\ram.lgc");
    }
}

