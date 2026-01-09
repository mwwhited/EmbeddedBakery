using System;
using System.IO;
using System.Net;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using WhitedUS.Common.Configuration;
using WhitedUS.Devices.RTC;
using WhitedUS.Net.SNTP;
using WhitedUS.Common;

namespace WhitedUS.Adapters
{
    public static class DateTimeAdapter
    {
        public static void Init()
        {
            DateTimeAdapter.SetTimeZone();
            Debug.Print("Boot Time: " + DateTime.Now.ToString());
            DateTimeAdapter.SyncTime();
            Debug.Print("Current Time: " + DateTime.Now.ToString());
        }

        public static DateTime RTCTime
        {
            get
            {
                try
                {
                    return GetRTCTime();
                }
                catch (Exception ex)
                {
                    Debug.Print(ex.Message);
                    return DateTime.MinValue;
                }
            }
            set { value.SetRTCTime(); }
        }
        public static DateTime SNTPTime
        {
            get
            {
                try
                {
                    return GetSNTPTime();
                }
                catch (Exception ex)
                {
                    Debug.Print(ex.Message);
                    return DateTime.MinValue;
                }
            }
        }
        public static DateTime Internal
        {
            get { return DateTime.Now; }
            set { value.SetTime(Manager.Settings.TimeZoneID); }
        }

        public static void SetTime()
        {
            GetRTCTime().SetTime();
        }
        public static void SetTime(this TimeZoneId timeZoneId)
        {
            GetRTCTime().SetTime(timeZoneId);
        }
        public static void SetTime(this IPAddress address)
        {
            address.GetSNTPTime().SetTime();
        }
        public static void SetTime(this IPAddress address, int port)
        {
            address.GetSNTPTime(port).SetTime();
        }
        public static void SetTime(this IPAddress address, int port, int timeout)
        {
            address.GetSNTPTime(port, timeout).SetTime();
        }
        public static void SetTime(this IPAddress address, TimeZoneId timeZoneId)
        {
            address.GetSNTPTime().SetTime(timeZoneId);
        }
        public static void SetTime(this IPAddress address, int port, TimeZoneId timeZoneId)
        {
            address.GetSNTPTime(port).SetTime(timeZoneId);
        }
        public static void SetTime(this IPAddress address, int port, int timeout, TimeZoneId timeZoneId)
        {
            address.GetSNTPTime(port, timeout).SetTime(timeZoneId);
        }
        public static void SetTime(this DateTime input)
        {
            Utility.SetLocalTime(input);
        }
        public static void SetTime(this DateTime input, TimeZoneId timeZoneId)
        {
            timeZoneId.SetTimeZone();
            Utility.SetLocalTime(input);
        }

        public static void SetTimeZone()
        {
            Manager.Settings.TimeZoneID.SetTimeZone();
        }
        public static void SetTimeZone(this TimeZoneId timeZoneId)
        {
            ExtendedTimeZone.SetTimeZone(timeZoneId);
        }

        public static DateTime SyncTime()
        {
            return Manager.Settings.SNTPServer.SyncTime();
        }
        public static DateTime SyncTime(this IPAddress address)
        {
            return address.SyncTime(Constants.DEFAULT_PORT_NTP);
        }
        public static DateTime SyncTime(this IPAddress address, int port)
        {
            return address.SyncTime(port, Constants.DEFAULT_TIMEOUT_NTP);
        }
        public static DateTime SyncTime(this IPAddress address, int port, int timeout)
        {
            DateTime currentTime = DateTime.Now;
            try
            {
                currentTime = address.GetSNTPTime(port, timeout);
                currentTime.SetTime();
                try
                {
                    currentTime.SetRTCTime();
                }
                catch (IOException ioe2)
                {
                    Debug.Print("RTC SYNC Failed" + ioe2.Message);
                }
            }
            catch (Exception ioe)
            {
                try
                {
                    Debug.Print("SNTP SYNC Failed" + ioe.Message);
                    currentTime = GetRTCTime();
                }
                catch (IOException ioe2)
                {
                    Debug.Print("RTC SYNC Failed" + ioe2.Message);
                }
            }
            return currentTime;
        }
        public static DateTime SyncTime(this IPAddress address, TimeZoneId timeZoneId)
        {
            timeZoneId.SetTimeZone();
            return address.SyncTime();
        }
        public static DateTime SyncTime(this IPAddress address, int port, TimeZoneId timeZoneId)
        {
            timeZoneId.SetTimeZone();
            return address.SyncTime(port);
        }
        public static DateTime SyncTime(this IPAddress address, int port, int timeout, TimeZoneId timeZoneId)
        {
            timeZoneId.SetTimeZone();
            return address.SyncTime(port, timeout);
        }

        public static DateTime GetRTCTime()
        {
            return DS1307.RTC;
        }
        public static void SetRTCTime(this DateTime time)
        {
            DS1307.RTC = time;
        }

        public static DateTime GetSNTPTime()
        {
            var settings = Manager.Settings;
            return settings.SNTPServer.GetSNTPTime(settings.SNTPPort, settings.SNTPTimeout);
        }
        public static DateTime GetSNTPTime(this IPAddress address)
        {
            return SNTPClient.GetLocal(address);
        }
        public static DateTime GetSNTPTime(this IPAddress address, int port)
        {
            return SNTPClient.GetLocal(address, port);
        }
        public static DateTime GetSNTPTime(this IPAddress address, int port, int timeout)
        {
            return SNTPClient.GetLocal(address, port, timeout);
        }
    }
}
