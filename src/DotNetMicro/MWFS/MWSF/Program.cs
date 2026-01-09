using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WhitedUS.MWFS;

namespace MWSF
{
    class Program
    {
        static void Main(string[] args)
        {
            BootBlock bb = new BootBlock();
            var buf = bb.ToArray();
            var b2 = bb.GetBytes();
        }
    }
}
