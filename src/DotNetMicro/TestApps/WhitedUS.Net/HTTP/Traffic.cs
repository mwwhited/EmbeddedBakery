using System;
using System.Collections;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Xml;
using System.Ext;
using Microsoft.SPOT;
using WhitedUS.Common.Configuration;

//http://developer.yahoo.com/traffic/rest/V1/index.html
namespace WhitedUS.Net.HTTP
{
    public class Traffic
    {
        public static ArrayList GetFeed()
        {
#if SAFE_CHECKS
            if (feedUri == null || feedUri == "")
                throw new ArgumentNullException("feedUri");
#endif

            ArrayList rssItems = new ArrayList();
            //&city=columbus&state=OH
            string feedUri = "http://local.yahooapis.com/MapsService/V1/trafficData" +
                "?appid=Q9eeFEnV34FtazMM7C7zmrRHeDK.jky6pLi56XLAyU8D3ceTQUIQbJk8wmatP14-" +
                "&zip=" + Manager.Settings.ZipCode;
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
