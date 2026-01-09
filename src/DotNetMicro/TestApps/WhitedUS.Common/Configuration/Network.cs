using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Net.NetworkInformation;

namespace WhitedUS.Common.Configuration
{
    public static class Network
    {
        public static NetworkInterface Interface
        {
            get
            {
                //there is only one interface on this board
                return NetworkInterface.GetAllNetworkInterfaces()[0];
            }
        }

        public static string IPAddress
        {
            get { return Interface.IPAddress; }
            set { Interface.EnableStaticIP(value, SubnetMask, GatewayAddress); }
        }
        public static string SubnetMask
        {
            get { return Interface.IPAddress; }
            set { Interface.EnableStaticIP(IPAddress, value, GatewayAddress); }
        }
        public static string GatewayAddress
        {
            get { return Interface.IPAddress; }
            set { Interface.EnableStaticIP(IPAddress, SubnetMask, value); }
        }

        public static bool UseDHCP
        {
            get { return Interface.IsDhcpEnabled; }
            set
            {
                if (value && !UseDHCP)
                    Interface.EnableDhcp();
                else if (!value && UseDHCP)
                    IPAddress = IPAddress;
            }
        }
    }
}
