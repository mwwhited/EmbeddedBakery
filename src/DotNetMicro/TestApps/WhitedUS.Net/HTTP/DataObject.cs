using System.Net.Sockets;

namespace WhitedUS.Net.HTTP
{
    public class DataObject
    {
        public NetworkStream Stream;
        public Socket Socket;
        public long Length;
    }
}
