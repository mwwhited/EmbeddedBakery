using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using System.Net;

namespace SocketTest
{
    public class MulticastSocket
    {
        //Socket creation, regular UDP socket   
        private Socket UDPSocket = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);
        private string Target_IP = "224.10.10.10";
        private int Target_Port = 31337;

        //set the target IP   
        IPEndPoint RemoteIPEndPoint = null;
        IPAddress ipaddress = null;

        //socket initialization 
        public MulticastSocket()
        {
            ipaddress = IPAddress.Parse(Target_IP);
            RemoteIPEndPoint = new IPEndPoint(ipaddress, this.Target_Port);
            //nothing should go wrong in here 
            try
            {
                //recieve data from any source   
                IPEndPoint LocalHostIPEnd = new IPEndPoint(IPAddress.Any, Target_Port);

                //init Socket properties:   
                UDPSocket.SetSocketOption(SocketOptionLevel.Udp, SocketOptionName.NoDelay, 1);

                //allow for loopback testing 
                UDPSocket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.ReuseAddress, 1);

                //extremly important to bind the Socket before joining multicast groups 
                UDPSocket.Bind(LocalHostIPEnd);

                //set multicast flags, sending flags - TimeToLive (TTL)   
                // 0 - LAN   
                // 1 - Single Router Hop   
                // 2 - Two Router Hops...        
                UDPSocket.SetSocketOption(SocketOptionLevel.IP, SocketOptionName.MulticastTimeToLive, 0);

                //join multicast group   
                UDPSocket.SetSocketOption(SocketOptionLevel.IP, SocketOptionName.AddMembership, new MulticastOption(ipaddress));

                //get in waiting mode for data - always (this doesn't halt code execution)   
                Recieve();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message + " " + ex.StackTrace);
            }
        }

        //client send function 
        public void Send(string sendData)
        {
            byte[] bytesToSend = Encoding.ASCII.GetBytes(sendData);
            EndPoint RemoteEndPoint = (EndPoint)RemoteIPEndPoint;

            //do asynchronous send 
            UDPSocket.BeginSendTo(bytesToSend, 0,
                bytesToSend.Length, SocketFlags.None, RemoteEndPoint,
                new AsyncCallback(SendCallback), UDPSocket);
        }

        //executes the asynchronous send 
        private void SendCallback(IAsyncResult ar)
        {
            try
            {
                // Retrieve the socket from the state object. 
                Socket client = (Socket)ar.AsyncState;

                // Complete sending the data to the remote device. 
                int bytesSent = client.EndSendTo(ar);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
        }

        //initial receive function - called only once 
        private void Recieve()
        {
            try
            {
                IPEndPoint LocalIPEndPoint = new
                IPEndPoint(IPAddress.Any, Target_Port);
                EndPoint LocalEndPoint = (EndPoint)LocalIPEndPoint;

                // Create the state object. 
                StateObject state = new StateObject();
                state.workSocket = UDPSocket;

                // Begin receiving the data from the remote device. 
                UDPSocket.BeginReceiveFrom(state.buffer, 0, StateObject.BufferSize,
                    0, ref LocalEndPoint,
                    new AsyncCallback(ReceiveCallback), state);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
        }

        //executes the asynchronous receive - executed everytime data is received on the port 
        private void ReceiveCallback(IAsyncResult ar)
        {
            try
            {
                IPEndPoint LocalIPEndPoint = new
                IPEndPoint(IPAddress.Any, Target_Port);
                EndPoint LocalEndPoint = (EndPoint)LocalIPEndPoint;

                // Retrieve the state object and the client socket   
                // from the async state object.   
                StateObject state = (StateObject)ar.AsyncState;
                Socket client = state.workSocket;

                // Read data from the remote device.
                int bytesRead = client.EndReceiveFrom(ar, ref LocalEndPoint);

                //keep listening   
                client.BeginReceiveFrom(
                    state.buffer, 0, StateObject.BufferSize, 0, ref LocalEndPoint,
                    new AsyncCallback(ReceiveCallback), state);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
        }
    }

    public class StateObject
    {
        public const int BufferSize = 1024;
        public Socket workSocket;
        public byte[] buffer = new byte[BufferSize];
    }
}
