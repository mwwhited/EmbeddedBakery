using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace SimpleTests
{
    [TestClass]
    public class BitwiseTests
    {
        public TestContext TestContext { get; set; }

        [TestMethod]
        public void BitwiseVoodooTest()
        {
            for (var digit = 0; digit < 20; digit++)
            {
                var PORTB = 0xff;

                TestContext.WriteLine($"{nameof(digit)}={digit}");
                PORTB &= 0xf0;
                PORTB |= 0x0f & ~(1 << (digit % 4));
                TestContext.WriteLine($"{nameof(PORTB)}={PORTB:x2}");
            }
        }

        [TestMethod]
        public void IntegerToBCD()
        {
            var digit = 12345678;
            TestContext.WriteLine($"{nameof(digit)}={digit}");
            var bcd = Int2BCD(digit);
            TestContext.WriteLine($"{nameof(bcd)}={bcd:x8} ({bcd})");
        }

        [TestMethod]
        public void BCDToInteger()
        {
            var bcd = 0x12345678;
            TestContext.WriteLine($"{nameof(bcd)}  ={bcd:x8} ({bcd})");
            var digit = BCD2Int(bcd);
            TestContext.WriteLine($"{nameof(digit)}={digit}");
        }


        [TestMethod]
        public void AddMinuteTest()
        {
            var before = 0x1234;
            for (var x = 0; x < 100; x++)
            {
                TestContext.WriteLine($"{nameof(before)}={before:x4} ({before})");
                var after = AddMinute(before);
                TestContext.WriteLine($"{nameof(after)} ={after:x4} ({after})");

                before = after;
            }
        }


        [DataTestMethod]
        [DataRow(0x120000, 1, 0x120001)]
        [DataRow(0x120000, 60, 0x120100)]
        [DataRow(0x120000, -60, 0x115900)]
        [DataRow(0x120059, 1, 0x120100)]
        [DataRow(0x125959, 1, 0x130000)]
        [DataRow(0x235959, 1, 0x000000)]
        [DataRow(0x120000, 60 * 60, 0x130000)]
        [DataRow(0x120000, -60 * 60, 0x110000)]
        [DataRow(0x235959, (60 * 60) + 1, 0x010000)]
        [DataRow(0x235959, (60 * 60) + 2, 0x010001)]
        [DataRow(0x235959, -60 * 60 - 1 , 0x225958)]
        public void AddSecondsTest(int before, int seconds, int expected)
        {
            TestContext.WriteLine($"{nameof(before)}  ={before:x6} ({before})");
            var after = AddSeconds(before, seconds);
            TestContext.WriteLine($"{nameof(after)}   ={after:x6} ({after})");
            TestContext.WriteLine($"{nameof(expected)}={expected:x6} ({expected})");
            Assert.AreEqual(expected, after);
        }

        int AddSeconds(int input, int seconds)
        {
            int h = BCD2Int((input & 0xff0000) >> 16);
            int m = BCD2Int((input & 0x00ff00) >> 8);
            int s = BCD2Int((input & 0x0000ff) >> 0);

            s += seconds;
            while (s < 0)
            {
                s += 60;
                m--;
            }
            while (s > 59)
            {
                s -= 60;
                m++;
            }

            while (m < 0)
            {
                m += 60;
                h--;
            }
            while (m > 59)
            {
                m -= 60;
                h++;
            }
            while (h < 0)
            {
                h += 24;
            }
            while (h > 23)
            {
                h -= 24;
            }

            return
                Int2BCD(h) << 16 |
                Int2BCD(m) << 8 |
                Int2BCD(s) << 0
                ;
        }


        int AddMinute(int input)
        {
            int h = BCD2Int((input & 0xff00) >> 8);
            int m = BCD2Int((input & 0x00ff) >> 0);

            m++;
            if (m > 59)
            {
                m = 0;
                h++;
            }
            if (h > 24)
            { h = 0; }

            return Int2BCD(h) << 8 | Int2BCD(m);
        }


        int BCD2Int(int bcd)
        {
            return
              (bcd & 0x0f) +
              (bcd >> 4 & 0x0f) * 10 +
              (bcd >> 8 & 0x0f) * 100 +
              (bcd >> 12 & 0x0f) * 1000 +
              (bcd >> 16 & 0x0f) * 10000 +
              (bcd >> 20 & 0x0f) * 100000 +
              (bcd >> 24 & 0x0f) * 1000000 +
              (bcd >> 28 & 0x0f) * 10000000
              ;
        }

        int Int2BCD(int digit)
        {
            return
              (((digit / 10000000) % 10) << 28) |
              (((digit / 1000000) % 10) << 24) |
              (((digit / 100000) % 10) << 20) |
              (((digit / 10000) % 10) << 16) |
              (((digit / 1000) % 10) << 12) |
              (((digit / 100) % 10) << 8) |
              (((digit / 10) % 10) << 4) |
              (digit % 10);
        }

    }
}
