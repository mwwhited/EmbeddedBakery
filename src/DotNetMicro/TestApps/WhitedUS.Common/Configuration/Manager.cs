using System;
using Microsoft.SPOT;

namespace WhitedUS.Common.Configuration
{
    public static class Manager
    {
        private static readonly int PRIORITY = (int)ExtendedWeakReference.PriorityLevel.System;
        private static readonly uint REFERENCE_ID = 0;
        private static readonly uint FLAGS = ExtendedWeakReference.c_SurvivePowerdown;

        private static object _syncLock = new object();
        private static ExtendedWeakReference _settings = null;

        public static Settings Settings
        {
            get
            {
                lock (_syncLock)
                {
                    if (_settings == null)
                    {
                        _settings = ExtendedWeakReference.RecoverOrCreate(
                            typeof(Settings),
                            REFERENCE_ID,
                            FLAGS);
                        _settings.Priority = PRIORITY;
                    }
                    else if (!_settings.IsAlive)
                    {
                        _settings = ExtendedWeakReference.RecoverOrCreate(
                            typeof(Settings),
                            REFERENCE_ID,
                            FLAGS);
                        _settings.Priority = PRIORITY;
                    }
                }
                if (_settings.Target == null)
                    new Settings().Save();
                return (Settings)_settings.Target;
            }
        }

        public static Settings Save()
        {
            return Settings.Save();
        }

        public static Settings Save(this Settings settings)
        {
            if (settings == null)
                settings = new Settings();

            lock (_syncLock)
            {
                _settings = new ExtendedWeakReference(
                     settings,
                     typeof(Settings),
                     REFERENCE_ID,
                     FLAGS);
                _settings.Priority = PRIORITY;
            }

            return settings;
        }

        //public static string GetIPAddress(this byte[] ipaddress)
        //{
        //    if (ipaddress == null)
        //        throw new ArgumentNullException("ipaddress must not be null");
        //    if (ipaddress.Length != 4)
        //        throw new ArgumentException("IPv4 address have 4 octets");
        //    return 
        //        ipaddress[0].ToString() + "." +
        //        ipaddress[1].ToString() + "." +
        //        ipaddress[2].ToString() + "." +
        //        ipaddress[3].ToString();
        //}
    }
}
