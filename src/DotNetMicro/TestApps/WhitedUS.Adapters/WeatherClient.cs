using System;
using Microsoft.SPOT;
using WhitedUS.Net.HTTP;
using WhitedUS.Common.Configuration;
using WhitedUS.Net.HTTP.Weather;

namespace WhitedUS.Adapters
{
    public class WeatherClient
    {
        private DateTime _nextUpdate = DateTime.MinValue;

        public WeatherClient() { }

        private Weather _weather = null;
        public Weather Weather
        {
            get
            {
                if (_nextUpdate < DateTime.Now)
                {
                    try
                    {
                        var ret = Weather.GetFeed();
                        if (ret != null && ret.Count > 0)
                        {
                            _weather = ret[0];
                            _nextUpdate = DateTime.Now + Manager.Settings.WeatherLifeTime;
                        }
                    }
                    catch (Exception ex)
                    {
                        Debug.Print(ex.Message);
                    }
                }
                return _weather;
            }
        }

        private string _lastIconUrl = null;
        private Bitmap _weatherIcon = null;
        public Bitmap WeatherIcon
        {
            get
            {
                if (this.Weather != null &&
                    this.Weather.Item != null &&
                    this.Weather.Item.Condition != null &&
                    this.Weather.Item.Condition.Url != null &&
                    this.Weather.Item.Condition.Url != string.Empty &&
                    this.Weather.Item.Condition.Url != _lastIconUrl)
                {
                    try
                    {
                        var imgUrl = this.Weather.Item.Condition.Url;
                        _weatherIcon = HttpStream.GetImage(imgUrl, Bitmap.BitmapImageType.Gif);
                        _lastIconUrl = imgUrl;
                    }
                    catch (Exception ex)
                    {
                        Debug.Print(ex.Message);
                    }
                }
                return _weatherIcon;
            }
        }

    }
}
