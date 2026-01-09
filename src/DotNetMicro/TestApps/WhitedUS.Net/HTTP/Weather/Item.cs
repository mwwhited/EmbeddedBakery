using System;
using Microsoft.SPOT;

namespace WhitedUS.Net.HTTP.Weather
{
    public class Item
    {
        public Item()
        {
            this.Condition = new Condition();
            this.Forcasts = new ForcastCollection();
        }

        public string Title { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string Link { get; set; }
        public string Date { get; set; }
        public Condition Condition { get; set; }
        public string Description { get; set; }
        public ForcastCollection Forcasts { get; set; }
        public string Guid { get; set; }
    }
}
