using System;
using Microsoft.SPOT;
using System.Threading;

namespace WhitedUS.Devices.VS1011E
{
    internal static class VS1011eTest
    {
        public static void TestTone(byte freq)
        {
            VS1011eControl.Instance.Mode = Modes.SdiNew | Modes.Reset | Modes.Tests;
            VS1011eBase.BlockUntilReady();
            VS1011eData.Instance.Write(new byte[] { 0x53, 0xef, 0x6e, freq, 0, 0, 0, 0 });
        }

        public static void EndTestTone()
        {
            VS1011eBase.BlockUntilReady();
            VS1011eData.Instance.Write(new byte[] { 0x45, 0x78, 0x69, 0x74, 0, 0, 0, 0 });
        }

        public static bool TestMemory()
        {
            VS1011eControl.Instance.Mode = Modes.SdiNew | Modes.Reset | Modes.Tests;
            VS1011eBase.BlockUntilReady();
            VS1011eData.Instance.Write(new byte[] { 0x4d, 0xea, 0x6d, 0x54, 0, 0, 0, 0 });
            Thread.Sleep(100);
            var ret = VS1011eControl.Instance[Registers.HDAT0];
            return ret == 0x807f;
        }
    }
}
