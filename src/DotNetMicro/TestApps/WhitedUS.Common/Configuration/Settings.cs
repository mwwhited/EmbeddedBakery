using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using System.Net;
using System.Collections;

namespace WhitedUS.Common.Configuration
{
    [Serializable]
    public class Settings
    {
        public Settings() { }

        private string _zipCode = Constants.DEFAULT_ZIPCODE;
        public string ZipCode
        {
            get { return _zipCode; }
            set
            {
                if (value == null)
                    throw new ArgumentNullException("value must not be null");
                if (value.Length != 5)
                    throw new ArgumentException("only 5 digit zipcodes are supported");
                _zipCode = value;
            }
        }

        private TimeSpan _weatherLifetime = Constants.DEFAULT_LIFETIME_WEATHER;
        public TimeSpan WeatherLifeTime
        {
            get { return _weatherLifetime; }
            set { _weatherLifetime = value; }
        }

        private TimeSpan _screenTimeout = Constants.DEFAULT_TIMEOUT_SCREEN;
        public TimeSpan ScreenTimeout
        {
            get { return _screenTimeout; }
            set { _screenTimeout = value; }
        }

        private TimeZoneId _timezoneid = Constants.DEFAULT_TIMEZONEID;
        public TimeZoneId TimeZoneID
        {
            get { return _timezoneid; }
            set { _timezoneid = value; }
        }

        private TimeSpan _timeSyncSpan = Constants.DEFAULT_LIFETIME_TIMESYNC;
        public TimeSpan TimeSyncSpan
        {
            get { return _timeSyncSpan; }
            set { _timeSyncSpan = value; }
        }

        private IPAddress _sntpServer = Constants.DEFAULT_IPADDRESS_NTP;
        public IPAddress SNTPServer
        {
            get { return _sntpServer; }
            set { _sntpServer = value; }
        }

        private int _sntpPort = Constants.DEFAULT_PORT_NTP;
        public int SNTPPort
        {
            get { return _sntpPort; }
            set { _sntpPort = value; }
        }

        private int _sntpTimeout = Constants.DEFAULT_TIMEOUT_NTP;
        public int SNTPTimeout
        {
            get { return _sntpTimeout; }
            set { _sntpTimeout = value; }
        }

        private RadioFavorites _favorites = Constants.DEFAULT_FAVORITES_RADIO;
        public RadioFavorites Favorites
        {
            get { return _favorites; }
        }

        private ushort _lastRadio = Constants.DEFAULT_LAST_STATION_RADIO;
        public ushort LastRadioStation
        {
            get { return _lastRadio; }
            set { _lastRadio = value; }
        }

        private int _lastVolume = Constants.DEFAULT_VOLUME_LEVEL_RADIO;
        public int LastRadioVolume
        {
            get { return _lastVolume; }
            set { _lastVolume = value; }
        }

        private string _serviceContacts = Constants.DEFAULT_SERVICE_CONTACTS;
        public string ServiceContactsUri
        {
            get { return _serviceContacts; }
            set { _serviceContacts = value; }
        }

        private TimeSpan _serviceContactAge = Constants.DEFAULT_LIFETIME_CONTACTS;
        public TimeSpan ServiceContactAge
        {
            get { return _serviceContactAge; }
            set { _serviceContactAge = value; }
        }

        private string _serviceAppointments = Constants.DEFAULT_SERVICE_APPOINTMENTS;
        public string ServiceAppointmentsUri
        {
            get { return _serviceAppointments; }
            set { _serviceAppointments = value; }
        }

        private TimeSpan _serviceAppointmentAge = Constants.DEFAULT_LIFETIME_APPOINTMENTS;
        public TimeSpan ServiceAppointmentAge
        {
            get { return _serviceAppointmentAge; }
            set { _serviceAppointmentAge = value; }
        }
    }
}
