using System;
using Microsoft.SPOT;

namespace WhitedUS.Net.HTTP.Weather
{
    public class Condition
    {
        public string Text { get; set; }
        public string Code { get; set; }
        public string Temperature { get; set; }
        public string Date { get; set; }

        public string Url
        {
            get { return "http://l.yimg.com/a/i/us/we/52/" + this.Code + ".gif"; }
        }

        private string _lastCode = null;
        private Bitmap _lastIcon = null;
        public Bitmap Icon
        {
            get
            {
                if (_lastCode == null || (Code != null && _lastCode != Code))
                {
                    try
                    {
                        _lastIcon = HttpStream.GetImage(Url, Bitmap.BitmapImageType.Gif);
                        _lastCode = Code;
                    }
                    catch (Exception ex)
                    {
                        Debug.Print(ex.ToString());
                    }
                }
                return _lastIcon;
            }
        }
    }
}
