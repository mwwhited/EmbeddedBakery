using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.IO;
//using System.Diagnostics;
using WhitedUS.Net.HTTP;

namespace SocketTest
{
    //public static class Utilities
    //{
    //    public static readonly string[] dat = new string[] {
    //        "0: 65534",
    //        "1: 49535",
    //        "2: 52224",
    //        "3: 32768",
    //        "4: 50176",
    //        "5: 10410",
    //        "6: 0",
    //        "7: 7168",
    //        "8: 320",
    //        "9: 125",
    //        "10: 33154",
    //        "11: 72",
    //        "12: 46336",
    //        "13: 33344",
    //        "14: 1048",
    //        "15: 32904",
    //        "16: 1088",
    //        "17: 40963",
    //        "18: 0",
    //        "19: 0",
    //        "20: 0",
    //        "21: 0",
    //        "22: 0",
    //        "23: 0",
    //        "24: 0",
    //        "25: 0",
    //        "26: 0",
    //        "27: 26033",
    //        "28: 4112"
    //    };

    //    public static byte[] ToByteArray(this string input)
    //    {
    //        return ToByteArray(input.ToCharArray());
    //    }

    //    public static byte[] ToByteArray(this char[] chars)
    //    {
    //        var length = chars.Length;
    //        var bytes = new byte[length];

    //        for (int i = 0; i < length; i++)
    //            bytes[i] = (byte)chars[i];

    //        return bytes;
    //    }

    //    public static string FromByteArray(this byte[] bytes)
    //    {
    //        var length = bytes.Length;
    //        var chars = new char[length];

    //        for (int i = 0; i < length; i++)
    //            chars[i] = (char)bytes[i];

    //        return new string(chars);
    //    }

    //    public static string FromByteArray(this byte[] bytes, int start, int length)
    //    {
    //        var buffer = new byte[length];
    //        Array.Copy(bytes, start, buffer, 0, length);
    //        return buffer.FromByteArray();
    //    }
    //}

    class Program
    {
        //const int BUFFER_SIZE = 1024;

        static void Main(string[] args)
        {
            //var ret = HttpStream.GetWeatherFeed("43004");

            var bits = (byte)24;
            var shft = 32 - bits;
            var full = uint.MaxValue;
            var mask = (uint)((full >> shft) << shft);
            var addr = new byte[]{
                (byte)((mask & 0xff000000) >> 24),
                (byte)((mask & 0x00ff0000) >> 16),
                (byte)((mask & 0x0000ff00) >> 8),
                (byte)((mask & 0x000000ff) >> 0)
            };
            var ipaddr =
                addr[0].ToString() + "." +
                addr[1].ToString() + "." +
                addr[2].ToString() + "." +
                addr[3].ToString();

            var myIP = new byte[] { 192, 168, 2, 51 };
            var myAddr =
                ((uint)myIP[0]) << 24 |
                ((uint)myIP[1]) << 16 |
                ((uint)myIP[2]) << 8 |
                ((uint)myIP[3]) << 0;
            var myIpaddr =
                myIP[0].ToString() + "." +
                myIP[1].ToString() + "." +
                myIP[2].ToString() + "." +
                myIP[3].ToString();

            var myNet = myAddr & mask;
            var netAddr = new byte[]{
                (byte)((myNet & 0xff000000) >> 24),
                (byte)((myNet & 0x00ff0000) >> 16),
                (byte)((myNet & 0x0000ff00) >> 8),
                (byte)((myNet & 0x000000ff) >> 0)
            };
            var myNetIpAddr =
                netAddr[0].ToString() + "." +
                netAddr[1].ToString() + "." +
                netAddr[2].ToString() + "." +
                netAddr[3].ToString();

            var urIP = new byte[] { 192, 168, 2, 101 };
            var urAddr =
                ((uint)myIP[0]) << 24 |
                ((uint)myIP[1]) << 16 |
                ((uint)myIP[2]) << 8 |
                ((uint)myIP[3]) << 0;
            var urIpaddr =
                urIP[0].ToString() + "." +
                urIP[1].ToString() + "." +
                urIP[2].ToString() + "." +
                urIP[3].ToString();

            var urNet = urAddr & mask;

            var checkNet = urNet == myNet;

            return;

            //var t1 = (ushort)(1 << 8);
            //var t2 = (ushort)~t1;
            //var t3 = (ushort)0xffff;
            //ushort t5 = (ushort)~t3;
            //var t4 = (ushort)(t3 & t2);

            //return;

            //string outVal = string.Join("\r\n",
            //    Utilities.dat.Select(s => string.Join(",",
            //        s.Split(new char[] { ':' }).Select(s2 =>
            //            "0x" + int.Parse(s2.Trim()).ToString("X2")
            //            ).ToArray()
            //        )).ToArray());


            //var ipAddr = IPAddress.Parse("192.168.2.1");
            //var localEndPoint = new IPEndPoint(IPAddress.Any, 9999) as EndPoint;
            //var remoteEndPoint = new IPEndPoint(ipAddr, 80) as EndPoint;
            ////SocketAddress sockAddr = new SocketAddress(AddressFamily.InterNetwork, 
            //using (Socket sock = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp))
            //{
            //    try
            //    {
            //        sock.Bind(localEndPoint);
            //        sock.Connect(remoteEndPoint);

            //        sock.ReceiveTimeout = 9000;
            //        sock.SendTimeout = 9000;

            //        var httpRequest = Utilities.ToByteArray("GET / HTTP/1.1\r\nHOST: www.whited.us\r\n\r\n");
            //        var buffer = new byte[1024];

            //        int sendSize = sock.Send(httpRequest);
            //        int recvSize = 1;
            //        while (recvSize > 0)
            //        {
            //            recvSize = sock.Receive(buffer);
            //            if (recvSize > 0)
            //            {
            //                var bufStr = buffer.FromByteArray();
            //                Debug.Print(bufStr);
            //                if (bufStr == "\r\n")
            //                    break;
            //            }
            //        }
            //    }
            //    catch { }
            //    sock.Close();
            //}
            ////================

            //var upnpMultiCastAddressString = "239.255.255.250";
            //int upnpPort = 1900;

            //var encoding = Encoding.ASCII;
            //var upnpMultiCastAddress = IPAddress.Parse(upnpMultiCastAddressString);
            //var upnpMultiCastEndPoint = new IPEndPoint(upnpMultiCastAddress, upnpPort);

            //var upnpNotify = encoding.GetBytes(string.Format(
            //    "M-SEARCH * HTTP/1.1\r\n" +
            //    "HOST: {0}:{1}\r\n" +
            //    "MAN: ssdp:discover\r\n" +
            //    "MX: {3}\r\n" +
            //    "ST: {2}\r\n" +
            //    "\r\n"
            //    , upnpMultiCastAddress, upnpPort, false ? "upnp:rootdevice" : "ssdp:all", 10));

            //using (var upnpSocket = new Socket(
            //    AddressFamily.InterNetwork,
            //    SocketType.Dgram,
            //    ProtocolType.Udp))
            //using (var upnpOutStream = File.Open(
            //    ".\\outFile.txt",
            //    FileMode.OpenOrCreate,
            //    FileAccess.Write,
            //    FileShare.Read
            //    ))
            //{
            //    var log = encoding.GetBytes(string.Format("== {0} ==\r\n", DateTime.Now));
            //    upnpOutStream.Write(log, 0, log.Length);


            //    var endPoint = new IPEndPoint(IPAddress.Any, IPEndPoint.MaxPort);

            //    while (true)
            //    {
            //        try
            //        {
            //            upnpSocket.Bind(endPoint);
            //            break;
            //        }
            //        catch (SocketException)
            //        {
            //            endPoint.Port--;
            //            if (endPoint.Port < IPEndPoint.MinPort)
            //                break;
            //        }
            //    }

            //    upnpSocket.SetSocketOption(
            //        SocketOptionLevel.IP,
            //        SocketOptionName.AddMembership,
            //        new MulticastOption(upnpMultiCastAddress));

            //    upnpSocket.SetSocketOption(
            //        SocketOptionLevel.IP,
            //        SocketOptionName.MulticastTimeToLive,
            //        2);

            //    int sendLenght = upnpSocket.SendTo(upnpNotify, SocketFlags.None, upnpMultiCastEndPoint);
            //    var buffer = new byte[BUFFER_SIZE];
            //    int receiveLength = 1;
            //    EndPoint lastEndPoint = upnpMultiCastEndPoint;

            //    while (receiveLength > 0)
            //    {
            //        receiveLength = upnpSocket.ReceiveFrom(buffer, ref lastEndPoint);
            //        if (receiveLength > 0)
            //        {
            //            var outMesg = string.Format(
            //                ">EP: {0}< ({1})\r\n", lastEndPoint, receiveLength) +
            //                "|\r\n" + encoding.GetString(buffer, 0, receiveLength) + "|";
            //            log = encoding.GetBytes(outMesg);
            //            upnpOutStream.Write(log, 0, log.Length);

            //            var lines = outMesg
            //                .Split('\r')
            //                .Select(l => l.Trim().Replace("\n", ""))
            //                .Where(l => !string.IsNullOrEmpty(l));

            //            var location = lines
            //                .Where(l => l.ToUpper().StartsWith("LOCATION:"))
            //                .Select(l => l.Substring(9).Trim())
            //                .FirstOrDefault();

            //            var nt = lines
            //                .Where(l => l.ToUpper().StartsWith("NT:"))
            //                .Select(l => l.Substring(3).Trim())
            //                .FirstOrDefault();

            //            //Console.WriteLine(outMesg);
            //            Console.WriteLine(string.Format("{0}|{1}|{2}", location, nt, lastEndPoint));
            //        }
            //        upnpOutStream.Flush();
            //    }
            //}
        }
    }
}
