using System;
using Microsoft.SPOT;
using System.Xml;

namespace WhitedUS.Net.HTTP.Weather
{
    public static class WeatherSerializer
    {
        public static WeatherCollection ParseWeather(this XmlTextReader xml)
        {
            var weathers = new WeatherCollection();
            while (xml.Read())
            {
                switch (xml.Name)
                {
                    case "channel":
                        var weather = new Weather();
                        while (xml.Read())
                        {
                            if (xml.Name == "channel")
                                break;
                            //Debug.Print(xml.Name);
                            switch (xml.Name)
                            {
                                case "title":
                                    xml.Read();
                                    weather.Title = xml.Value;
                                    xml.Read();
                                    break;
                                case "description":
                                    xml.Read();
                                    weather.Description = xml.Value;
                                    xml.Read();
                                    break;
                                case "language":
                                    xml.Read();
                                    weather.Language = xml.Value;
                                    xml.Read();
                                    break;
                                case "lastBuildDate":
                                    xml.Read();
                                    weather.LastBuildDate = xml.Value;
                                    xml.Read();
                                    break;
                                case "ttl":
                                    xml.Read();
                                    weather.TTL = (xml.Value ?? "0");
                                    xml.Read();
                                    break;
                                case "yweather:location":
                                    weather.Location.City = xml.GetAttribute("city");
                                    weather.Location.Region = xml.GetAttribute("region");
                                    weather.Location.Country = xml.GetAttribute("country");
                                    break;
                                case "yweather:units":
                                    weather.Units.Temperature = xml.GetAttribute("temperature");
                                    weather.Units.Distance = xml.GetAttribute("distance");
                                    weather.Units.Pressure = xml.GetAttribute("pressure");
                                    weather.Units.Speed = xml.GetAttribute("speed");
                                    break;
                                case "yweather:wind":
                                    weather.Wind.Chill = (xml.GetAttribute("chill") ?? "0");
                                    weather.Wind.Direction = (xml.GetAttribute("direction") ?? "0");
                                    weather.Wind.Speed = (xml.GetAttribute("speed") ?? "0");
                                    break;
                                case "yweather:atmosphere":
                                    weather.Atmosphere.Humidity = (xml.GetAttribute("humidity") ?? "0");
                                    weather.Atmosphere.Visibilty = (xml.GetAttribute("visibility") ?? "0");
                                    weather.Atmosphere.Pressure = (xml.GetAttribute("pressure") ?? "0");
                                    weather.Atmosphere.Rising = (xml.GetAttribute("rising") ?? "0") == "1";
                                    break;
                                case "yweather:astronomy":
                                    weather.Astronomy.SunRise = xml.GetAttribute("sunrise");
                                    weather.Astronomy.SunSet = xml.GetAttribute("sunset");
                                    break;
                                case "image":
                                    while (xml.Read())
                                    {
                                        if (xml.Name == "image")
                                            break;
                                        switch (xml.Name)
                                        {
                                            case "title":
                                                xml.Read();
                                                weather.Image.Title = xml.Value;
                                                xml.Read();
                                                break;
                                            case "width":
                                                xml.Read();
                                                weather.Image.Width = int.Parse(xml.Value ?? "0");
                                                xml.Read();
                                                break;
                                            case "height":
                                                xml.Read();
                                                weather.Image.Height = int.Parse(xml.Value ?? "0");
                                                xml.Read();
                                                break;
                                            case "link":
                                                xml.Read();
                                                weather.Image.Link = xml.Value;
                                                xml.Read();
                                                break;
                                            case "url":
                                                xml.Read();
                                                weather.Image.Url = xml.Value;
                                                xml.Read();
                                                break;

                                            default:
                                                break;
                                        }
                                    }
                                    break;
                                case "item":
                                    while (xml.Read())
                                    {
                                        if (xml.Name == "item")
                                            break;
                                        switch (xml.Name)
                                        {
                                            case "title":
                                                xml.Read();
                                                weather.Item.Title = xml.Value;
                                                xml.Read();
                                                break;
                                            case "geo:lat":
                                                xml.Read();
                                                weather.Item.Latitude = (xml.Value ?? "0");
                                                xml.Read();
                                                break;
                                            case "geo:long":
                                                xml.Read();
                                                weather.Item.Longitude = (xml.Value ?? "0");
                                                xml.Read();
                                                break;
                                            case "link":
                                                xml.Read();
                                                weather.Item.Link = xml.Value;
                                                xml.Read();
                                                break;
                                            case "pubDate":
                                                xml.Read();
                                                weather.Item.Date = xml.Value;
                                                xml.Read();
                                                break;
                                            case "yweather:condition":
                                                weather.Item.Condition.Text = xml.GetAttribute("text");
                                                weather.Item.Condition.Code = xml.GetAttribute("code");
                                                weather.Item.Condition.Temperature = (xml.GetAttribute("temp") ?? "0");
                                                weather.Item.Condition.Date = xml.GetAttribute("date");
                                                break;
                                            case "description":
                                                xml.Read();
                                                weather.Item.Description = xml.Value;
                                                xml.Read();
                                                break;
                                            case "yweather:forecast":
                                                weather.Item.Forcasts.Add(
                                                    new Forcast()
                                                    {
                                                        Code = xml.GetAttribute("code"),
                                                        Date = xml.GetAttribute("date"),
                                                        Day = xml.GetAttribute("day"),
                                                        High = (xml.GetAttribute("high") ?? "0"),
                                                        Low = (xml.GetAttribute("low") ?? "0"),
                                                        Text = xml.GetAttribute("text")
                                                    });
                                                break;
                                            case "guid":
                                                xml.Read();
                                                weather.Item.Guid = xml.Value;
                                                xml.Read();
                                                break;

                                            default:
                                                break;
                                        }
                                    }
                                    break;

                                default:
                                    continue;
                            }
                        }
                        weathers.Add(weather);
                        break;

                    default:
                        break;
                }
            }
            return weathers;
        }

    }
}
