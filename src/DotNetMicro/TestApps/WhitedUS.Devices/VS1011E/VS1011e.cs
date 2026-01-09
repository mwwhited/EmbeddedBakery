using System;
using Microsoft.SPOT;
using System.Threading;

namespace WhitedUS.Devices.VS1011E
{
    public static class VS1011e
    {
        public static void Enable()
        {
            VS1011eControl.Instance.Enable();
        }

        public static void Disabled()
        {
            VS1011eControl.Instance.Disabled();
        }

        public static void Reset()
        {
            VS1011eControl.Instance.Reset();
        }

        public static int SetVolume(int level)
        {
            return VS1011eControl.Instance.SetVolume(level);
        }

#if DEBUG
        public static void Write(byte data)
        {
            VS1011eData.Instance.Write(data);
        }
#endif

        public static void Write(byte[] buffer)
        {
            VS1011eData.Instance.Write(buffer);
        }

        public static void Write(byte[] buffer, int offset, int length)
        {
            VS1011eData.Instance.Write(buffer, offset, length);
        }

#if DEBUG
        public static void SetVolume(byte left, byte right)
        {
            VS1011eControl.Instance.SetVolume(left, right);
        }
#endif

        public static void SoftReset()
        {
            VS1011eControl.Instance.SoftReset();
        }

#if DEBUG
        public static void Test()
        {
            VS1011eControl.Instance.Reset();
            Debug.Print("TestMemory()::" + VS1011eTest.TestMemory());
            Thread.Sleep(100);
            Debug.Print("TestTone(126)");
            VS1011eTest.TestTone(126);
            Thread.Sleep(10000);
            VS1011eTest.EndTestTone();
        }
#endif
    }
}
