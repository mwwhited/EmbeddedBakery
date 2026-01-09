using System;
using Microsoft.SPOT;

namespace WhitedUS.Net.HTTP.Weather
{
    public class Forcast
    {
        public string Day { get; set; }
        public string Date { get; set; }
        public string Low { get; set; }
        public string High { get; set; }
        public string Text { get; set; }
        public string Code { get; set; }
    }
}
