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

namespace WhitedUS.Net.HTTP
{
    public struct RssItem
    {
        public char[] Title;
        public char[] Uri;

        public override string ToString()
        {
            return new string(Title) + " - " + new string(Uri);
        }

        public static ArrayList GetRssFeed(string feedUri)
        {
#if SAFE_CHECKS
            if (feedUri == null || feedUri == "")
                throw new ArgumentNullException("feedUri");
#endif

            ArrayList rssItems = new ArrayList();
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
