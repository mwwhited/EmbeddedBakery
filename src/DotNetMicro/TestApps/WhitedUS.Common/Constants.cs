using System;
using Microsoft.SPOT;
using System.Net;

namespace WhitedUS.Common
{
    public class Constants
    {
        public static readonly int DEFAULT_PORT_NTP = 123;
        public static readonly int DEFAULT_TIMEOUT_NTP = 30000;
        public static readonly IPAddress DEFAULT_IPADDRESS_NTP = new IPAddress(new byte[] { 192, 168, 2, 110 });

        public static readonly string DEFAULT_ZIPCODE = "43004";
        public static readonly TimeZoneId DEFAULT_TIMEZONEID = TimeZoneId.Eastern;

        public static readonly TimeSpan DEFAULT_TIMEOUT_SCREEN = new TimeSpan(0, 0, 20);
        public static readonly TimeSpan DEFAULT_LIFETIME_TIMESYNC = new TimeSpan(1, 0, 0);

        public static readonly TimeSpan DEFAULT_LIFETIME_WEATHER = new TimeSpan(1, 0, 0);

        public static readonly RadioFavorites DEFAULT_FAVORITES_RADIO = new RadioFavorites() { DEFAULT_LAST_STATION_RADIO };
        public static readonly ushort DEFAULT_LAST_STATION_RADIO = 997;

        public static readonly int MAX_VOLUME_LEVEL_RADIO = 21;
        public static readonly int DEFAULT_VOLUME_LEVEL_RADIO = 9;

        public static readonly int MAX_VOLUME_LEVEL_MP3 = MAX_VOLUME_LEVEL_RADIO;
        public static readonly int DEFAULT_VOLUME_LEVEL_MP3 = DEFAULT_VOLUME_LEVEL_RADIO;
        public static readonly int VOLUME_STEP_MP3 = 255 / Constants.MAX_VOLUME_LEVEL_MP3;

        public static readonly string DEFAULT_SERVICE_CONTACTS = "http://192.168.2.110:8080/outlook/contacts/simple";
        public static readonly TimeSpan DEFAULT_LIFETIME_CONTACTS = new TimeSpan(1, 0, 0);
        public static readonly string DEFAULT_SERVICE_APPOINTMENTS = "http://192.168.2.110:8080/outlook/appointments/simple/";
        public static readonly TimeSpan DEFAULT_LIFETIME_APPOINTMENTS = new TimeSpan(1, 0, 0);
    }
}
