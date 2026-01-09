using System;
using System.Collections;
using System.Ext;
using System.IO;
using System.Xml;
using Microsoft.SPOT;
using WhitedUS.Net.HTTP;

// http://developer.yahoo.com/traffic/rest/V1/index.html
namespace WhitedUS.Net
{
    class Traffic
    {
        public static ArrayList GetTrafficFeed(string city, string state)
        {
#if SAFE_CHECKS
            if (feedUri == null || feedUri == "")
                throw new ArgumentNullException("feedUri");
#endif

            ArrayList rssItems = new ArrayList();
            // &city=columbus&state=OH
            string feedUri = "http://local.yahooapis.com/MapsService/V1/trafficData" +
                "?appid=Q9eeFEnV34FtazMM7C7zmrRHeDK.jky6pLi56XLAyU8D3ceTQUIQbJk8wmatP14-" +
                "&city=" + city + "&state=" + state;
            using (var xmlStream = HttpStream.GetHttpStream(new Uri(feedUri), "GET"))
            {
                xmlStream.Seek(0, SeekOrigin.Begin);
                HttpStream.SeekNextEmptyOrEnd(xmlStream);

                using (var xml = new XmlTextReader(xmlStream))
                {
                    RssItem rssItem = new RssItem();
                    while (xml.Read())
                    {
                        if (xml.Name == "title")
                            rssItem.Title = xml.ReadString().ToCharArray();
                        else if (xml.Name == "enclosure")
                            rssItem.Uri = xml.ReadString().ToCharArray();
                        else if (xml.Name == "item")
                        {
                            if (rssItem.Title != null && rssItem.Uri != null)
                                rssItems.Add(rssItem);
                            rssItem = new RssItem();
                        }
                    }
                    xml.Close();
                    //xml.Dispose();
                }
                xmlStream.Close();
                xmlStream.Dispose();
            }

            return rssItems;
        }

    }
}
