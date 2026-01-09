using System;
using System.Net;
using System.Net.Sockets;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using WhitedUS.Common;

namespace WhitedUS.Net.SNTP
{
    public class SNTPClient
    {
        public static void SetTime(IPAddress address)
        {
            SetTime(address, Constants.DEFAULT_PORT_NTP);
        }
        public static void SetTime(IPAddress address, int port)
        {
            SetTime(address, port, TimeZoneId.Eastern);
        }
        public static void SetTime(IPAddress address, int port, TimeZoneId timezone)
        {
            ExtendedTimeZone.SetTimeZone(timezone);
            Utility.SetLocalTime(GetLocal(address, port));
        }

        public static DateTime GetLocal(IPAddress address)
        {
            return GetUTC(address, Constants.DEFAULT_PORT_NTP, Constants.DEFAULT_TIMEOUT_NTP).ToLocalTime();
        }
        public static DateTime GetLocal(IPAddress address, int port)
        {
            return GetUTC(address, port, Constants.DEFAULT_TIMEOUT_NTP).ToLocalTime();
        }
        public static DateTime GetLocal(IPAddress address, int port, int timeout)
        {
            return GetUTC(address, port, timeout).ToLocalTime();
        }

        public static DateTime GetUTC(IPAddress address)
        {
            return GetUTC(address, Constants.DEFAULT_PORT_NTP, Constants.DEFAULT_TIMEOUT_NTP);
        }
        public static DateTime GetUTC(IPAddress address, int port)
        {
            return GetUTC(address, port, Constants.DEFAULT_TIMEOUT_NTP);
        }
        public static DateTime GetUTC(IPAddress address, int port, int timeout)
        {
            var dateTime = DateTime.UtcNow;

            using (var sock = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp))
            {
                var local = new IPEndPoint(IPAddress.Any, port);
                sock.Bind(local);

                var server = new IPEndPoint(address, port);
                var timePacket = new NTPPacket()
                {
                    LeapIndicator = LeapIndicatorTypes.Alarm,
                    Mode = NTPModeTypes.Client,
                    VersionNumber = 3,
                    TransmitTimestamp = DateTime.UtcNow
                }.ToBinary();

                sock.SendTo(timePacket, server);

                var returnBuffer = new byte[48];
                var returnEndPoint = (EndPoint)server;
                sock.ReceiveTimeout = timeout;
                sock.ReceiveFrom(returnBuffer, ref returnEndPoint);
                var inpck = NTPPacket.Create(returnBuffer);

                dateTime = DateTime.SpecifyKind(inpck.TransmitTimestamp, DateTimeKind.Utc);
            }

            return dateTime;
        }
    }
}
