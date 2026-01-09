using System;
using System.Collections;
using System.Xml;

namespace WhitedUS.Net.HTTP
{
    public class Weather
    {
        public Weather()
        {
            this.Location = new Nested.Location();
            this.Units = new Nested.Units();
            this.Wind = new Nested.Wind();
            this.Atmosphere = new Nested.Atmosphere();
            this.Astronomy = new Nested.Astronomy();
            this.Image = new Nested.Image();
            this.Item = new Nested.Item();
        }

        public string Title { get; set; }
        public string Description { get; set; }
        public string Language { get; set; }
        public string LastBuildDate { get; set; }
        public float TTL { get; set; }
        public Nested.Location Location { get; set; }
        public Nested.Units Units { get; set; }
        public Nested.Wind Wind { get; set; }
        public Nested.Atmosphere Atmosphere { get; set; }
        public Nested.Astronomy Astronomy { get; set; }
        public Nested.Image Image { get; set; }
        public Nested.Item Item { get; set; }

        public static Nested.WeatherCollection Create(XmlTextReader xml)
        {
            var weathers = new Weather.Nested.WeatherCollection();
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
                            Debug.Print(xml.Name);
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
                                    weather.TTL = float.Parse(xml.Value ?? "0");
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
                                    weather.Wind.Chill = float.Parse(xml.GetAttribute("chill") ?? "0");
                                    weather.Wind.Direction = float.Parse(xml.GetAttribute("direction") ?? "0");
                                    weather.Wind.Speed = float.Parse(xml.GetAttribute("speed") ?? "0");
                                    break;
                                case "yweather:atmosphere":
                                    weather.Atmosphere.Humidity = float.Parse(xml.GetAttribute("humidity") ?? "0");
                                    weather.Atmosphere.Visibilty = float.Parse(xml.GetAttribute("visibility") ?? "0");
                                    weather.Atmosphere.Pressure = float.Parse(xml.GetAttribute("pressure") ?? "0");
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
                                                weather.Item.Latitude = float.Parse(xml.Value ?? "0");
                                                xml.Read();
                                                break;
                                            case "geo:long":
                                                xml.Read();
                                                weather.Item.Longitude = float.Parse(xml.Value ?? "0");
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
                                                weather.Item.Condition.Temperature = float.Parse(xml.GetAttribute("temp") ?? "0");
                                                weather.Item.Condition.Date = xml.GetAttribute("date");
                                                break;
                                            case "description":
                                                xml.Read();
                                                weather.Item.Description = xml.Value;
                                                xml.Read();
                                                break;
                                            case "yweather:forecast":
                                                weather.Item.Forcasts.Add(
                                                    new Weather.Nested.Forcast()
                                                    {
                                                        Code = xml.GetAttribute("code"),
                                                        Date = xml.GetAttribute("date"),
                                                        Day = xml.GetAttribute("day"),
                                                        High = float.Parse(xml.GetAttribute("high") ?? "0"),
                                                        Low = float.Parse(xml.GetAttribute("low") ?? "0"),
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

        public class Nested
        {
            public class Location
            {
                public string City { get; set; }
                public string Region { get; set; }
                public string Country { get; set; }
            }
            public class Units
            {
                public string Temperature { get; set; }
                public string Distance { get; set; }
                public string Pressure { get; set; }
                public string Speed { get; set; }
            }
            public class Wind
            {
                public float Chill { get; set; }
                public float Direction { get; set; }
                public float Speed { get; set; }
            }
            public class Atmosphere
            {
                public float Humidity { get; set; }
                public float Visibilty { get; set; }
                public float Pressure { get; set; }
                public bool Rising { get; set; }
            }
            public class Astronomy
            {
                public string SunRise { get; set; }
                public string SunSet { get; set; }
            }
            public class Image
            {
                public string Title { get; set; }
                public int Width { get; set; }
                public int Height { get; set; }
                public string Link { get; set; }
                public string Url { get; set; }
            }
            public class Item
            {
                public Item()
                {
                    this.Condition = new Nested.Condition();
                    this.Forcasts = new Nested.ForcastCollection();
                }

                public string Title { get; set; }
                public float Latitude { get; set; }
                public float Longitude { get; set; }
                public string Link { get; set; }
                public string Date { get; set; }
                public Nested.Condition Condition { get; set; }
                public string Description { get; set; }
                public Nested.ForcastCollection Forcasts { get; set; }
                public string Guid { get; set; }
            }
            public class Condition
            {
                public string Text { get; set; }
                public string Code { get; set; }
                public float Temperature { get; set; }
                public string Date { get; set; }
            }
            public class ForcastCollection : IEnumerable, ICollection
            {
                private ArrayList _innerList = new ArrayList();

                public Forcast this[int index]
                {
                    get { return (Forcast)_innerList[index]; }
                    set { _innerList[index] = value; }
                }

                public void Add(Forcast forcast)
                {
                    _innerList.Add(forcast);
                }
                public void Remove(Forcast forcast)
                {
                    _innerList.Remove(forcast);
                }

                #region IEnumerable Members

                public IEnumerator GetEnumerator()
                {
                    return _innerList.GetEnumerator();
                }

                #endregion

                #region ICollection Members

                public void CopyTo(Array array, int index)
                {
                    _innerList.CopyTo(array, index);
                }

                public int Count
                {
                    get { return _innerList.Count; }
                }

                public bool IsSynchronized
                {
                    get { return _innerList.IsSynchronized; }
                }

                public object SyncRoot
                {
                    get { return _innerList.SyncRoot; }
                }

                #endregion
            }
            public class Forcast
            {
                public string Day { get; set; }
                public string Date { get; set; }
                public float Low { get; set; }
                public float High { get; set; }
                public string Text { get; set; }
                public string Code { get; set; }
            }
            public class WeatherCollection : IEnumerable, ICollection
            {
                private ArrayList _innerList = new ArrayList();

                public Weather this[int index]
                {
                    get { return (Weather)_innerList[index]; }
                    set { _innerList[index] = value; }
                }

                public void Add(Weather forcast)
                {
                    _innerList.Add(forcast);
                }
                public void Remove(Weather forcast)
                {
                    _innerList.Remove(forcast);
                }

                #region IEnumerable Members

                public IEnumerator GetEnumerator()
                {
                    return _innerList.GetEnumerator();
                }

                #endregion

                #region ICollection Members

                public void CopyTo(Array array, int index)
                {
                    _innerList.CopyTo(array, index);
                }

                public int Count
                {
                    get { return _innerList.Count; }
                }

                public bool IsSynchronized
                {
                    get { return _innerList.IsSynchronized; }
                }

                public object SyncRoot
                {
                    get { return _innerList.SyncRoot; }
                }

                #endregion
            }
        }
    }
}
