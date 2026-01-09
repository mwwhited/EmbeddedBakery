using System;
using System.Collections;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Xml;
using System.Drawing;

namespace WhitedUS.Net.HTTP
{
    public static class Debug
    {
        public static void Print(string message)
        {
            System.Diagnostics.Debug.WriteLine(message);
        }
    }


    public class HttpStream
    {
        public static Stream GetHttpStream(Uri uri, string method)
        {
#if SAFE_CHECKS
            if (uri == null)
                throw new ArgumentNullException("uri");
            if (method == null || method == "")
                throw new ArgumentNullException("method");
#endif

            var host = Dns.GetHostEntry(uri.Host);
            var ipAddr = host.AddressList[0];
            var localEndPoint = new IPEndPoint(IPAddress.Any, 0);
            var remoteEndPoint = new IPEndPoint(ipAddr, uri.Port) as EndPoint;

            var dataStream = new MemoryStream();

            using (Socket sock = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp))
            {
                sock.Bind(localEndPoint);
                sock.Connect(remoteEndPoint);
                using (var nStream = new NetworkStream(sock))
                {
                    var httpRequest = Encoding.UTF8.GetBytes(
                        method + " " + uri.PathAndQuery + " HTTP/1.1\r\n" +
                        "HOST: " + uri.Host + ":" + uri.Port.ToString() + "\r\n" +
                        "Connection: close\r\n" +
                        "\r\n");
                    int bufferLen = 1024;
                    var buffer = new byte[bufferLen];
                    nStream.Write(httpRequest, 0, httpRequest.Length);
                    nStream.Flush();
                    while (!nStream.DataAvailable) ; int recvSize = 1;
                    //nStream.ReadTimeout = 100;
                    while (recvSize > 0)
                    {
                        recvSize = nStream.Read(buffer, 0, bufferLen);
                        //recvSize = nStream.DataAvailable ? nStream.Read(buffer, 0, bufferLen) : -1;
                        if (recvSize > 0)
                            dataStream.Write(buffer, 0, recvSize);
                    }
                    nStream.Close();
                    nStream.Dispose();
                    dataStream.Flush();
                }
                sock.Close();
            }
            return dataStream;
        }
        public static void SendToStream(string uri, Stream inputStream)
        {
            SendToStream(new Uri(uri), inputStream);
        }
        public static void SendToStream(Uri uri, Stream inputStream)
        {
            //In_Too_Deep track06 wordup
            var netObject = HttpStream.GetRawStream(uri, "GET");
            var fileData = netObject.Stream;
            //Fill Buffer
            Debug.Print("Load Buffer");
            int bufferLen = 0;
            const int NETWORK_BUFFER_SIZE = 1024;
            byte[] buffer = new byte[NETWORK_BUFFER_SIZE];
            inputStream.Write(new byte[2], 0, 2);
            long downloaded = 0;
            do
            {
                bufferLen = fileData.Read(buffer, 0, NETWORK_BUFFER_SIZE);
                if (bufferLen > 0)
                    inputStream.Write(buffer, 0, bufferLen);
                downloaded += bufferLen;
                //Thread.Sleep(5);
            } while (bufferLen > 0 && downloaded < netObject.Length);
            fileData.Close();
            fileData.Dispose();
            fileData = null;
            inputStream.Write(new byte[2048], 0, 2048);
        }
        public static void SeekNextEmptyOrEnd(Stream stream)
        {
#if SAFE_CHECKS
            if (stream == null)
                throw new ArgumentNullException("stream");
            if (!stream.CanSeek)
                throw new ArgumentException("stream can not seek");                
#endif

            //int offset = 0;
            var littleBuffer = new byte[4];
            int littleBufferLen = 0;
            while (true)
            {
                littleBufferLen = stream.Read(littleBuffer, 0, 4);
                if ((littleBuffer[0] == '\r' && littleBuffer[1] == '\n' &&
                    littleBuffer[2] == '\r' && littleBuffer[3] == '\n') ||
                    (littleBufferLen < 4))
                    break;
                stream.Seek(-3, SeekOrigin.Current);
            }
        }
        public static ArrayList GetRssFeed(string feedUri)
        {
#if SAFE_CHECKS
            if (feedUri == null || feedUri == "")
                throw new ArgumentNullException("feedUri");
#endif

            ArrayList rssItems = new ArrayList();
            using (var xmlStream = GetHttpStream(new Uri(feedUri), "GET"))
            {
                xmlStream.Seek(0, SeekOrigin.Begin);
                SeekNextEmptyOrEnd(xmlStream);

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
        public static Weather.Nested.WeatherCollection GetWeatherFeed(string zipCode)
        {
#if SAFE_CHECKS
            if (feedUri == null || feedUri == "")
                throw new ArgumentNullException("feedUri");
#endif
            Weather.Nested.WeatherCollection weathers; 
            string feedUri = "http://weather.yahooapis.com/forecastrss?p=" + zipCode;
            using (var xmlStream = GetHttpStream(new Uri(feedUri), "GET"))
            {
                xmlStream.Seek(0, SeekOrigin.Begin);
                SeekNextEmptyOrEnd(xmlStream);

                using (var xml = new XmlTextReader(xmlStream))
                {
                    weathers = Weather.Create(xml);
                    xml.Close();
                }
                xmlStream.Close();
                xmlStream.Dispose();
            }

            return weathers;
        }

        public static ArrayList GetTrafficFeed(string city, string state)
        {
#if SAFE_CHECKS
            if (feedUri == null || feedUri == "")
                throw new ArgumentNullException("feedUri");
#endif

            ArrayList rssItems = new ArrayList();
            //&city=columbus&state=OH
            string feedUri = "http://local.yahooapis.com/MapsService/V1/trafficData" +
                "?appid=Q9eeFEnV34FtazMM7C7zmrRHeDK.jky6pLi56XLAyU8D3ceTQUIQbJk8wmatP14-" +
                "&city=" + city + "&state=" + state;
            using (var xmlStream = GetHttpStream(new Uri(feedUri), "GET"))
            {
                xmlStream.Seek(0, SeekOrigin.Begin);
                SeekNextEmptyOrEnd(xmlStream);

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

        //        public static Bitmap GetImage(string imageUri, Bitmap.BitmapImageType imageType)
        //        {
        //#if SAFE_CHECKS
        //            if (feedUri == null || feedUri == "")
        //                throw new ArgumentNullException("feedUri");
        //#endif

        //            const int BUFFER_SIZE = 1024;
        //            Bitmap image = null;
        //            using (var dataStream = GetHttpStream(new Uri(imageUri), "GET"))
        //            {
        //                dataStream.Seek(0, SeekOrigin.Begin);
        //                SeekNextEmptyOrEnd(dataStream);

        //                using (var dataBuffer = new MemoryStream())
        //                {
        //                    int bufferLen = 1;
        //                    byte[] buffer = new byte[BUFFER_SIZE];
        //                    while (bufferLen > 0)
        //                    {
        //                        bufferLen = dataStream.Read(buffer, 0, BUFFER_SIZE);
        //                        if (bufferLen > 0)
        //                            dataBuffer.Write(buffer, 0, bufferLen);
        //                    }

        //                    dataBuffer.Flush();
        //                    image = new Bitmap(dataBuffer.ToArray(), imageType);

        //                    dataBuffer.Close();
        //                    dataBuffer.Dispose();
        //                }

        //                dataStream.Close();
        //                dataStream.Dispose();
        //            }

        //            return image;
        //        }

        public static Stream GetFile(string imageUri)
        {
#if SAFE_CHECKS
            if (feedUri == null || feedUri == "")
                throw new ArgumentNullException("feedUri");
#endif

            using (var dataStream = GetHttpStream(new Uri(imageUri), "GET"))
            {
                dataStream.Seek(0, SeekOrigin.Begin);
                SeekNextEmptyOrEnd(dataStream);

                return dataStream;
            }
        }

        public static DataObject GetRawStream(Uri uri, string method)
        {
            var host = Dns.GetHostEntry(uri.Host);
            int addressOffset = 0;
            var localEndPoint = new IPEndPoint(IPAddress.Any, 0);

            Socket sock = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            sock.Bind(localEndPoint);
            var remoteEndPoint = new IPEndPoint(host.AddressList[addressOffset], uri.Port) as EndPoint;
            sock.Connect(remoteEndPoint);
            var nStream = new NetworkStream(sock);
            //var httpRequest = Encoding.UTF8.GetBytes(
            //    method + " " + uri.AbsolutePath + " HTTP/1.1\r\n" +
            //    "HOST: " + uri.Host + ":" + uri.Port.ToString() + "\r\n" +
            //    "Connection: close\r\n" +
            //    "\r\n");
            var httpRequest = Encoding.UTF8.GetBytes(
                method + " " + uri.AbsolutePath + " HTTP/1.0\r\n" +
                "HOST: " + uri.Host + ":" + uri.Port.ToString() + "\r\n" +
                "Connection: close\r\n" +
                "\r\n");
            nStream.Write(httpRequest, 0, httpRequest.Length);
            nStream.Flush();

            var checkBuffer = new byte[4];
            int currentPos = 0;

            //Content-Length: 568552
            string contentLengthStr = string.Empty;
            long contentLength = -1;

            while (true)
            {
                var val = (byte)nStream.ReadByte();
                if (val == 10 || val == 13)
                {
                    checkBuffer[currentPos++] = val;
                    if (contentLength < 0)
                    {
                        if (contentLengthStr.Length > 15 &&
                            contentLengthStr.Substring(0, 15) == "Content-Length:")
                        {
                            contentLengthStr = contentLengthStr.Substring(15, contentLengthStr.Length - 15).Trim();
                            contentLength = long.Parse(contentLengthStr);
                        }
                        contentLengthStr = String.Empty;
                    }
                }
                else
                {
                    if (contentLength < 0)
                        contentLengthStr += (char)val;
                    currentPos = checkBuffer[0] = checkBuffer[1] = checkBuffer[2] = checkBuffer[3] = 0;
                }

                if (checkBuffer[0] == 13 && checkBuffer[1] == 10 &&
                    checkBuffer[2] == 13 && checkBuffer[3] == 10)
                    break;
            }

            return new DataObject()
            {
                Stream = nStream,
                Socket = sock,
                Length = contentLength
            };
        }
    }
}
