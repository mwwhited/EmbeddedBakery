using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using System.IO;
using WhitedUS.IO;
using WhitedUS.Common;

namespace WhitedUS.Devices.RTC
{
    public static class RTCUtilities
    {
        internal static DateTime Decode(this byte[] input)
        {
            return input.DecodeUTC().ToLocalTime();
        }
        internal static DateTime DecodeUTC(this byte[] input)
        {
            if (input.Length < 7)
                throw new ArgumentOutOfRangeException("input");

            int second = input[0].BCDtoInt(0x70);
            int minute = input[1].BCDtoInt(0x70);

            byte tempHour = input[2];
            int hour;
            if (tempHour.CheckMask(0x40))
            {
                //12 hour clock
                hour = tempHour.BCDtoInt(0x10);
                if (tempHour.CheckMask(0x20))
                    hour += 12;
            }
            else
                hour = tempHour.BCDtoInt(0x30);

            // 3; day of week
            int day = input[4].BCDtoInt(0x30);
            int month = input[5].BCDtoInt(0x10);
            int year = input[6].BCDtoInt(0x30) + 2000;

            var dateTime = new DateTime(year, month, day, hour, minute, second);
            dateTime = DateTime.SpecifyKind(dateTime, DateTimeKind.Utc);
            return dateTime;
        }

        internal static byte[] Encode(this DateTime input)
        {
            return input.ToUniversalTime().EncodeUTC();
        }
        internal static byte[] EncodeUTC(this DateTime input)
        {
            return new byte[8]
            {
                input.Second.InttoBCDByte(),
                input.Minute.InttoBCDByte(),
                input.Hour.InttoBCDByte(),
                ((int)input.DayOfWeek).InttoBCDByte(),
                input.Day.InttoBCDByte(),
                input.Month.InttoBCDByte(),
                (input.Year - 2000).InttoBCDByte(),
                0x03
            };
        }
    }
}
