using System;
using System.Collections;
using System.Ext;
using System.IO;
using System.Xml;
using Microsoft.SPOT;
using WhitedUS.Common.Configuration;
using WhitedUS.Net.HTTP;

namespace WhitedUS.Net.HTTP.Weather
{
    public class Weather
    {
        public Weather()
        {
            this.Location = new Location();
            this.Units = new Units();
            this.Wind = new Wind();
            this.Atmosphere = new Atmosphere();
            this.Astronomy = new Astronomy();
            this.Image = new Image();
            this.Item = new Item();
        }

        public string Title { get; set; }
        public string Description { get; set; }
        public string Language { get; set; }
        public string LastBuildDate { get; set; }
        public string TTL { get; set; }
        public Location Location { get; set; }
        public Units Units { get; set; }
        public Wind Wind { get; set; }
        public Atmosphere Atmosphere { get; set; }
        public Astronomy Astronomy { get; set; }
        public Image Image { get; set; }
        public Item Item { get; set; }

        private static Weather _cachedWeather = null;
        private static DateTime _NextUpdate = DateTime.MinValue;
        private static string _lastZipCode = null;
        public static Weather Check()
        {
            if (_cachedWeather == null ||
                _NextUpdate < DateTime.Now ||
                _lastZipCode == null ||
                _lastZipCode != Manager.Settings.ZipCode)
            {
                try
                {
                    var getweather = GetFeed()[0];
                    _lastZipCode = Manager.Settings.ZipCode;
                    _NextUpdate = DateTime.Now + Manager.Settings.WeatherLifeTime;
                }
                catch (Exception ex)
                {
                    Debug.Print(ex.Message);
                }
            }
            return _cachedWeather;
        }

        public static WeatherCollection GetFeed()
        {
#if SAFE_CHECKS
            if (feedUri == null || feedUri == "")
                throw new ArgumentNullException("feedUri");
#endif
            WeatherCollection weathers;
            string feedUri = "http://weather.yahooapis.com/forecastrss?p=" + Manager.Settings.ZipCode;

            using (var xml = feedUri.GetFeed())
            {
                weathers = xml.ParseWeather();
                xml.Close();
            }

            return weathers;
        }

    }
}
