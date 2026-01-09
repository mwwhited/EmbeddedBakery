using System;
using Microsoft.SPOT;

namespace WhitedUS.Net.HTTP.Weather
{
    public class Atmosphere
    {
        public string Humidity { get; set; }
        public string Visibilty { get; set; }
        public string Pressure { get; set; }
        public bool Rising { get; set; }
    }
}
