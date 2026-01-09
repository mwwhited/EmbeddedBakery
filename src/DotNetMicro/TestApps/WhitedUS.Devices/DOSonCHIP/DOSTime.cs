using System;
using Microsoft.SPOT;

namespace WhitedUS.Devices.DOSonCHIP
{
    public struct DOSTime
    {
        static DOSTime()
        {
            DAYS_TO_MONTH = new int[] { 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365 };
        }
        public static readonly int[] DAYS_TO_MONTH;

        public byte Second { get; set; }
        public byte Minute { get; set; }
        public byte Hour { get; set; }
        public byte Day { get; set; }
        public byte Month { get; set; }
        public byte Year { get; set; }

        public uint Binary
        {
            get
            {
                uint binaryTime = 0;
                uint day;

                /* +80 adjustment near this.year is conversion from DOS Epoch year to Unix Epoch year */
                /* Calculate number of non-leap year days since January 1, 1970 */
                day = (uint)(365 * (this.Year - 70 + 80) + DAYS_TO_MONTH[this.Month - 1] + (this.Day - 1));

                /* Add extra days for the number of leap year periods since 1970 */
                day += (uint)((this.Year - 69 + 80) / 4);

                /* Add extra day If the current year is a leap year and past February */
                if ((this.Month > 2) && ((this.Year % 4) == 0)) day++;

                binaryTime = (24 * day);
                binaryTime += this.Hour;
                binaryTime *= 60;
                binaryTime += this.Minute;
                binaryTime *= 60;
                binaryTime += this.Second;

                return binaryTime;
            }
            set
            {
                int wholeMinutes;
                int wholeHours;
                int wholeDays;
                int wholeDaysSince1968;
                byte leapYearPeriods;
                int daysSinceCurrentLeapYear;
                byte wholeYears;
                int daysSinceFirstOfYear;     /* days since January 1: [0,365] */
                int daysToMonth;
                /* unsigned char dayOfWeek; */
                /* days since Sunday: [0,6] */

                wholeMinutes = (int)(value) / 60;
                this.Second = (byte)(value - (60 * wholeMinutes)); /* leftover seconds */

                wholeHours = wholeMinutes / 60;
                this.Minute = (byte)(wholeMinutes - (60 * wholeHours)); /* leftover minutes */

                wholeDays = wholeHours / 24;
                this.Hour = (byte)(wholeHours - (24 * wholeDays));    /* leftover hours */

                wholeDaysSince1968 = wholeDays + 365 + 366;
                leapYearPeriods = (byte)(wholeDaysSince1968 / ((4 * 365) + 1));

                daysSinceCurrentLeapYear = wholeDaysSince1968 % ((4 * 365) + 1);

                /* if days are after a current leap year then add a leap year period */
                if ((daysSinceCurrentLeapYear >= (31 + 29))) leapYearPeriods++;

                wholeYears = (byte)((wholeDaysSince1968 - leapYearPeriods) / 365);
                daysSinceFirstOfYear = (byte)(wholeDaysSince1968 - (wholeYears * 365) - leapYearPeriods);

                if ((daysSinceCurrentLeapYear <= 365) && (daysSinceCurrentLeapYear >= 60)) daysSinceFirstOfYear++;
                this.Year = (byte)(wholeYears + 68 /* adjust for DOS epoch */ - 80);

                /* search for what month it is based on how many days have past within the current year */
                this.Month = 13;
                daysToMonth = 366;
                while (daysSinceFirstOfYear < daysToMonth)
                {
                    this.Month--;
                    daysToMonth = DAYS_TO_MONTH[this.Month];
                    if ((this.Month >= 2) && ((this.Year % 4) == 0)) daysToMonth++;
                }
                this.Month++;
                this.Day = (byte)(daysSinceFirstOfYear - daysToMonth + 1);

                /* dayOfWeek = (wholeDays  + 4) % 7; */
            }
        }

        public byte[] Bytes
        {
            get
            {
                var binaryTime = this.Binary;
                return new byte[]{
                        (byte)(binaryTime >>24),
                        (byte)(binaryTime >>16),
                        (byte)(binaryTime >>8),
                        (byte)(binaryTime >>0)
                    };
            }
            set
            {
                if (value.Length != 4)
                    throw new ArgumentOutOfRangeException("value must be Length=4");

                uint binaryTime =
                    (uint)(value[0] << 24) |
                    (uint)(value[1] << 16) |
                    (uint)(value[2] << 8) |
                    (uint)(value[3] << 0);

                this.Binary = binaryTime;
            }
        }

        public static DOSTime Create(byte[] input)
        {
            return new DOSTime() { Bytes = input };
        }

        public static DOSTime Create(uint input)
        {
            return new DOSTime() { Binary = input };
        }

        public static DOSTime Create(DateTime input)
        {
            return (DOSTime)input;
        }

        public static DOSTime Now { get { return (DOSTime)DateTime.Now; } }

        public DateTime ToDateTime()
        {
            return new DateTime(
                this.Year + 1980,
                this.Month,
                this.Day,
                this.Hour,
                this.Minute,
                this.Second);
        }

        public override string ToString()
        {
            return this.ToDateTime().ToString();
        }

        public static implicit operator DateTime(DOSTime input)
        {
            return input.ToDateTime();
        }

        public static explicit operator DOSTime(DateTime input)
        {
            if (input.Year < 1980)
                throw new ArgumentOutOfRangeException("year must be greater than or equal to 1980");
            return new DOSTime()
            {
                Year = (byte)(input.Year - 1980),
                Month = (byte)(input.Month),
                Day = (byte)(input.Day),
                Hour = (byte)(input.Hour),
                Minute = (byte)(input.Minute),
                Second = (byte)(input.Second)
            };
        }
    }
}
