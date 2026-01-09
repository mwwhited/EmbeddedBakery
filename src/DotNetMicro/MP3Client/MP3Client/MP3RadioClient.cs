/*
 * MP3 Shoutcast client with VS1002 Decoder. 
 * 
 * This program lets the user select a radiostation. 
 * It connects and streams the MP3 data to the VS1002 device. 
 * It contains a simple FIFO implementation.
 * 
 * @copyright (c) 2008 EFR Kool
 * @licence: Creative Commons, Attribution-Share Alike 3.0 Netherlands, http://creativecommons.org/licenses/by-sa/3.0/nl/deed.en
 * 
 */

using System;
using System.Threading;
using System.Text;
using System.Collections;

using Microsoft.SPOT;

using System.Net;
using System.Net.Sockets;
using Socket = System.Net.Sockets.Socket;

using GHIElectronics.Hardware;

/// <summary>
/// This class connects to the shoutcast server. Buffers the data in a FIFO
/// and passes the data to the VS1002 device.
/// </summary>
public class MP3RadioClient
{
    //////////////////////////////////////////////////////////////////
    ///             
    ///                     PRIVATE PARAMETERS
    ///
    //////////////////////////////////////////////////////////////////

    // Socket and buffer for connecting to Radio
    private Socket RadioSocket = null;
    private byte[] RadioBuffer;
    
    // Connection details
    private IPHostEntry RadioServer;
    private String sHost;
    private Int32 sPort;
    private String sPath;

    /// <summary>
    /// Object for locking VS1002
    /// </summary>
    private static object VS1002_Device_Lock = new Object();

    /// <summary>
    /// FIFO for VS1002 Output
    /// </summary>
    private RingBuffer FIFO = new RingBuffer(512*1024);

    /// <summary>
    /// Thread for reading FIFO and output to VS1002 device
    /// </summary>
    private Thread tOutPutStream;

    /// <summary>
    /// Variabele indicating that thread for outputing FIFO should stop or not
    /// </summary>
    private bool OutputOn = true;

    /// <summary>
    /// Debug PWM output
    /// </summary>
    private PWM pwm0;

    /// <summary>
    /// HTTP Response header is stored here
    /// </summary>
    private String HTTPHeader = "";

    /// <summary>
    /// When set this contains the interval for reading the icy metadata
    /// </summary>
    private int IcyMetaInterval = 0;

    /// <summary>
    /// bytesRead will hold the actual number of bytes that are read from the buffer 
    /// </summary>
    Int32 bytesRead = 0;

    //////////////////////////////////////////////////////////////////
    ///             
    ///                     PUBLIC PARAMETERS
    ///
    //////////////////////////////////////////////////////////////////

    /// <summary>
    /// This constant defines how large the blocks are that are read from the Radio Stream
    /// </summary>
    public const Int32 RadioBufferSize = 4800; // 1K blocks

    /// <summary>
    /// This string is filled when an error happened
    /// </summary>
    public String ErrorString = "";

    /// <summary>
    /// MPEG Header information. Valid when OnMP3InfoUpdated is raised.
    /// </summary>
    public MP3HeaderReader Mp3Info;

    /// <summary>
    /// If set connection is closed. 
    /// After closing connection create a new MP3RadioClient to open new connection.
    /// </summary>
    public bool CloseConnection = false;

    /// <summary>
    /// Current Status for player
    /// </summary>
    public StatusOptions status = StatusOptions.Stopped;

    /// <summary>
    /// Status values
    /// </summary>
    public enum StatusOptions
    {
        /// <summary>
        /// Connecting to radio station
        /// </summary>
        Connecting = 0,

        /// <summary>
        /// Buffering
        /// </summary>
        Buffering = 1,

        /// <summary>
        /// Playing
        /// </summary>
        Playing = 2,

        /// <summary>
        /// Stopped
        /// </summary>
        Stopped = 3,

        /// <summary>
        /// Error 
        /// </summary>
        Error = 4,

        /// <summary>
        /// Message (Not for errors)
        /// </summary>
        Message = 5
    }

    /// <summary>
    /// When status is StatusOptions.Message then this variable should contain the message
    /// </summary>
    public string Message = "";

    /// <summary>
    /// Subtext for Message
    /// </summary>
    public string SubMessage1 = "";

    /// <summary>
    /// Subtext for Message
    /// </summary>
    public string SubMessage2 = "";

    /// <summary>
    /// Number of bytes currently in the socket buffer
    /// </summary>
    public Int32 inBuffer = 0;

    /// <summary>
    /// When ICY Metadata is found this gets filled
    /// </summary>
    public string ICYStreamName = "";

    //////////////////////////////////////////////////////////////////
    ///             
    ///                         EVENTS
    ///
    //////////////////////////////////////////////////////////////////

    /// <summary>
    /// Delegate for OnMP3InfoUpdated event
    /// </summary>
    public delegate void Mp3InfoUpdatedEvent();
    
    /// <summary>
    /// Event is triggered when valid MPEG header data is available
    /// </summary>
    public event Mp3InfoUpdatedEvent OnMP3InfoUpdated;

    /// <summary>
    /// Delegate for OnRadioConnectionLost event.
    /// </summary>
    public delegate void RadioConnectionLostEvent();

    /// <summary>
    /// Event is triggered when connection to radio server is lost.
    /// </summary>
    public event RadioConnectionLostEvent OnRadioConnectionLost;

    /// <summary>
    /// Try to send string to RadioSocket.
    /// </summary>
    /// <param name="StrToSend">True on succes, False on failure</param>
    /// <returns></returns>
    private bool SocketSendString(String StrToSend)
    {
        // Try to send string
        try 
        {
            RadioSocket.Send(Encoding.UTF8.GetBytes(StrToSend));
        } 
        catch 
        {
            // Failed sending string
            ErrorString = "Error sending string to server";
            return false;
        }

        // String send
        return true;
    }

    /// <summary>
    /// Constructor for MP3RadioClient. Connects to the Radio Server and requests for the correct stream.
    /// ErrorString should be checked after this function is called.
    /// </summary>
    /// <param name="Host">Hostname of Radioserver</param>
    /// <param name="Port">Port number of Radioserver</param>
    /// <param name="Path">Path of Radiostream</param>
    public MP3RadioClient(String Host, Int32 Port, String Path)
    {
        pwm0 = new PWM(PWM.PWMChannel.Channel_0);

        // Try to get host adres for Radio Server
        try 
        {
            RadioServer = Dns.GetHostEntry(Host);
        } 
        catch 
        {
            // Server adres not found
            ErrorString = "Error resolving adres";
            return;
        }

        // Make IPV4 Stream Socket
        RadioSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
        RadioSocket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.ReceiveBuffer, 10000);
        RadioSocket.SetSocketOption(SocketOptionLevel.Tcp, SocketOptionName.NoDelay, 1);

        // Store connection details
        sHost = Host;
        sPort = Port;
        sPath = Path;
    }

    /// <summary>
    /// Search for Http Header,  Used for reading the icy-metaint header
    /// </summary>
    private void ParseHeader()
    {

        // Search for start of stream. This is indicated with \r\n
        byte[] ValidStart = Encoding.UTF8.GetBytes("\r\n\r\n");
        int ValidStartPos = 0;

        // Single byte array, used to read from FIFO
        byte[] FindStartBuffer = new byte[1];

        // Used for reading available bytes
        int inBuf = 0;

        // Loop until we break on header start
        while (true)
        {
            while(true)
            {
                inBuf = 0;
                lock(FIFO) { inBuf = FIFO.inBuffer(); }
                if (inBuf != 0)
                    break;
                Thread.Sleep(5);
            }

            lock (FIFO)
            {
                // Maybe we should check if we have data in the buffer, ignore this:P
                FIFO.Read(ref FindStartBuffer);
            }

            // Add character to header
            HTTPHeader += ((char)FindStartBuffer[0]).ToString();

            // Check if byte is expected byte
            if (ValidStart[ValidStartPos] == FindStartBuffer[0])
            {
                // Go te next char to check
                ValidStartPos++;

                // If al chars are checked we've found the end of the header !
                if (ValidStartPos == ValidStart.Length)
                    break;
            }
            else
            {
                // Char is not the expected char so reset ValidStart position
                ValidStartPos = 0;
            }

            Thread.Sleep(1);
        }

        // Debug HTTP Header 
        Debug.Print(HTTPHeader);

        // Read ICY Metadata interval 
        int sIcyMetaInt = HTTPHeader.IndexOf("icy-metaint:");
        int eIcyMetaInt = 0;

        // When header found try to parse it
        if (sIcyMetaInt > 0)
        {
            // Search for end of data
            eIcyMetaInt = HTTPHeader.IndexOf("\r\n", sIcyMetaInt);

            // Skip 12 chars ("icy-metaint:")
            sIcyMetaInt += 12;

            // Read icy-metaint and convert to int
            if (eIcyMetaInt > sIcyMetaInt)
            {
                IcyMetaInterval = Str_Int_Func.StrVal(HTTPHeader.Substring(sIcyMetaInt, eIcyMetaInt - sIcyMetaInt));
            }
        }
    }


    /// <summary>
    /// Thread that monitors FIFO and outputs data when available
    /// </summary>
    private void OutputStream()
    {
        int ReadSize = 3200;

        // Used for reading available bytes
        int inBuf = 0;

        // Used when parsing ICY metadata
        String ParseICYMeta = "";
        int sParseICYMeta = -1;

        // First try to parse HTTP header
        ParseHeader();

        // Buffer used to Read FIFO and outputs to VS1002
        // Byte size MUST be a multiple of 32
        byte[] OutBuffer = new byte[ReadSize];

        // Indicates we've loaded data from the FIFO
        bool DataInOutBuffer = false;

        // Single byte buffer used for reading icy meta data size
        byte[] IcyMetaSize = new byte[1];

        // Holds number of bytes to next metadata block
        int IcyMetaCount = IcyMetaInterval;

        // Continue until requested
        while (OutputOn)
        {
            // Check if we should read Icy Metadata
            if ((IcyMetaCount == 0) && (IcyMetaInterval != 0))
            {
                // Check if byte is inbuffer
                while (true)
                {
                    inBuf = 0;
                    lock (FIFO) { inBuf = FIFO.inBuffer(); }
                    if (inBuf != 0)
                        break;
                    Thread.Sleep(5);
                }

                // Read size of metadata block
                FIFO.Read(ref IcyMetaSize);

                // If there is metadata
                if (IcyMetaSize[0] != 0)
                {
                    // Check if header is in buffer
                    while (true)
                    {
                        inBuf = 0;
                        lock (FIFO) { inBuf = FIFO.inBuffer(); }
                        if (inBuf >= (IcyMetaSize[0] * 16))
                            break;
                        Thread.Sleep(5);
                    }

                    // Create and fill meta data buffer
                    byte[] IcyMeta = new byte[IcyMetaSize[0] * 16];
                    FIFO.Read(ref IcyMeta);

                    // Try parsing it
                    ParseICYMeta = "";
                    sParseICYMeta = -1;
                    try
                    {
                        ParseICYMeta = new String(Encoding.UTF8.GetChars(IcyMeta));
                        sParseICYMeta = ParseICYMeta.IndexOf("StreamTitle='");
                    }
                    catch
                    {
                    }

                    if (sParseICYMeta != -1)
                    {
                        sParseICYMeta += 13;
 
                        ICYStreamName = ParseICYMeta.Substring(sParseICYMeta, ParseICYMeta.IndexOf("'",sParseICYMeta) - sParseICYMeta);
                        Debug.Print("IcyStreamName: {" + ICYStreamName+"}");
                    }

                    
                }

                // Reset counter
                IcyMetaCount = IcyMetaInterval;
            }

            // Reset DataInOutBuffer
            DataInOutBuffer = false;

            if ((IcyMetaCount >= ReadSize) || (IcyMetaInterval == 0))
            {

                // Check if enough data in buffer
                while (true)
                {
                    inBuf = 0;
                    lock (FIFO) { inBuf = FIFO.inBuffer(); }
                    if (inBuf >= ReadSize)
                        break;
                    Thread.Sleep(1);
                }

                // Lock Outputbuffer
                lock (FIFO)
                {
                    // Read into array
                    FIFO.Read(ref OutBuffer);

                    // Set DataInOutBuffer
                    DataInOutBuffer = true;
                }

                // Debug: Let PWM0 indicate buffer content
                lock (FIFO)
                {
                    pwm0.Set(1000, ((FIFO.inBuffer() * 100) / FIFO.Size));
                }


                // When DataInOutBuffer is not set try again
                if (DataInOutBuffer == false)
                    continue;

                // Lock and output to VS1002 
                lock (VS1002_Device_Lock)
                {
                    // Send data to VS1002
                    // We use SendData so no temporary byte arrays are needed
                    VS1002.SendData32(ref OutBuffer);
                }

                // Reset Meta interval
                if (IcyMetaInterval != 0)
                    IcyMetaCount -= ReadSize;
            }
            else
            {
                if (IcyMetaCount != 0)
                {
                    byte[] OutBufferT = new byte[IcyMetaCount];

                    // Check if enough data in buffer
                    while (true)
                    {
                        inBuf = 0;
                        lock (FIFO) { inBuf = FIFO.inBuffer(); }
                        if (inBuf >= IcyMetaCount)
                            break;
                        Thread.Sleep(1);
                    }

                    // Lock Outputbuffer
                    lock (FIFO)
                    {
                        // Read into array
                        FIFO.Read(ref OutBufferT);

                        // Set DataInOutBuffer
                        DataInOutBuffer = true;
                    }

                    // Debug: Let PWM0 indicate buffer content
                    lock (FIFO)
                    {
                        pwm0.Set(1000, ((FIFO.inBuffer() * 100) / FIFO.Size));
                    }


                    // When DataInOutBuffer is not set try again
                    if (DataInOutBuffer == false)
                        continue;

                    // Lock and output to VS1002 
                    lock (VS1002_Device_Lock)
                    {
                        // Send data to VS1002
                        VS1002.SendData(ref OutBufferT);
                    }

                    // Clear counter becouse all remaining bytes are read
                    IcyMetaCount = 0;
                }
            }

            // Check if valid header is already found
            if (Mp3Info.IsValidHeader() == false)
            {
                // If not, try reading header
                lock (VS1002_Device_Lock)
                {
                    byte[] Mp3Header = VS1002.ReadMP3Header();
                    Mp3Info.ReadMP3Information(ref Mp3Header, 0, 4);
                }

            }
            else
            {
                // Update Text 
                DoMp3InfoUpdated();
            }
        }
    }

    /// <summary>
    /// Open connection and read stream. Should be called as ThreadStart 
    /// </summary>
    public void PollForData()
    {
        // Start FIFO Output thread
        tOutPutStream = new Thread(new ThreadStart(OutputStream));

        ////////////////////////////////////////////////////////////////////////////////////////
        ///
        ///                                 1 - Connecting
        ///
        ////////////////////////////////////////////////////////////////////////////////////////

        // Set status and trigger event
        status = StatusOptions.Connecting;
        DoMp3InfoUpdated();
        Thread.Sleep(1);

        // Connect to Radio server
        try
        {
            RadioSocket.Connect(new IPEndPoint(RadioServer.AddressList[0], sPort));
        }
        catch
        {
            // Connection failed
            ErrorString = "Error connecting";
            status = StatusOptions.Error;
            DoMp3InfoUpdated();
            Thread.Sleep(1000);
            DoRadioConnectionLost();
            return;
        }

        // Do a GET request
        if (SocketSendString("GET " + sPath + " HTTP/1.1\r\nIcy-MetaData: 1\r\n\r\n"))
        {            
            // Initialize Recieve buffer
            RadioBuffer = new byte[RadioBufferSize];

            // Initialize class to parse mpeg headers
            Mp3Info = new MP3HeaderReader();
        }
        else
        {
            ErrorString = "GET request n-ack";
            status = StatusOptions.Error;
            DoMp3InfoUpdated();
            Thread.Sleep(1000);
            DoRadioConnectionLost();
            return;
        }


        // Give stream some time to fill
        while ((RadioSocket.Available == 0) & (CloseConnection == false)) { Thread.Sleep(1); }



        ////////////////////////////////////////////////////////////////////////////////////////
        ///
        ///                                 2 - Buffer
        ///
        ////////////////////////////////////////////////////////////////////////////////////////


        while (CloseConnection == false)
        {
            // Fill the socket buffer. 
            while (RadioSocket.Poll(10 * 1000000, SelectMode.SelectRead))
            {
                // Set status buffering
                status = StatusOptions.Buffering;

                // Check if we want to close the connection
                if (CloseConnection)
                    break;

                // bytesRead will hold the actual number of bytes that are read from the buffer
                bytesRead = 0;

                // Read bytes into buffer
                try
                {
                    bytesRead = RadioSocket.Receive(RadioBuffer);
                }
                catch
                {

                    // Signal Closure
                    DoRadioConnectionLost();

                    // Exit
                    return;
                }

                // Add data to FIFO
                lock (FIFO)
                {
                    FIFO.Add(ref RadioBuffer, bytesRead);

                    inBuffer = FIFO.inBuffer();

                    // Check if we have enough bytes in buffer
                    if (inBuffer > (32*1024)) // 32Kb = 2 sec @ 128Kbit
                        break;
                }

                // Trigger event
                DoMp3InfoUpdated();
                Thread.Sleep(1);
            }

            lock (FIFO)
            {
                inBuffer = FIFO.inBuffer();

                // Check if we have enough bytes in buffer
                if (inBuffer > (32 * 1024)) // 128Kb = 8 sec @ 128Kbit
                    break;
            }

        }

        // Make sure we read enough data else exit stream
        if (inBuffer < 2048)
        {
            // Signal Closure
            DoRadioConnectionLost();

            // Exit
            return;
        }

        // Reset inBuffer, it has no use from now on.
        inBuffer = 0;


        // Reset VS1002 to known state
        lock (VS1002_Device_Lock)
        {
            VS1002.Reset();
        }


        // Start Thread
        tOutPutStream.Start();



        ////////////////////////////////////////////////////////////////////////////////////////
        ///
        ///                                 3 - Playing
        ///
        ////////////////////////////////////////////////////////////////////////////////////////

        // Poll for data until connection is closed
        while (CloseConnection == false)
        {
            // Poll for data until no bytes are available or connection is closed
            while (RadioSocket.Poll(1000, SelectMode.SelectRead))
            //while(true)
            {
                // Set status buffering
                status = StatusOptions.Playing;

                // Check if we want to close the connection
                if (CloseConnection)
                    break;

                // bytesRead will hold the actual number of bytes that are read from the buffer
                bytesRead = 0;

                // Read bytes into buffer
                try
                {
                    bytesRead = RadioSocket.Receive(RadioBuffer);
                }
                catch
                {
                    // Signal Closure
                    DoRadioConnectionLost();

                    // Exit
                    return;
                }

                // If read buffer isn't empty
                if (bytesRead != 0)
                {

                    // Wait until FIFO has space
                    while (true)
                    {
                        lock (FIFO)
                        {
                            if (FIFO.Available() > bytesRead)
                                break;
                        }

                        // Give other thread some time to read from FIFO
                        Thread.Sleep(1);
                    }

                    // Add data to FIFO
                    lock (FIFO)
                    {
                        FIFO.Add(ref RadioBuffer, bytesRead);
                    }

                    // Give FIFO thread some time to fill up VS1002 buffer.
                    inBuffer = 0; lock (FIFO) { inBuffer = FIFO.inBuffer(); }
                    if (inBuffer > 2048) { Thread.Sleep(1); }
                }
            }

            inBuffer = 0; lock (FIFO) { inBuffer = FIFO.inBuffer(); }
            if (inBuffer > 2048) { Thread.Sleep(1); }

        }

        ////////////////////////////////////////////////////////////////////////////////////////
        ///
        ///                                 4 - Closed
        ///
        ////////////////////////////////////////////////////////////////////////////////////////

        // Trigger event
        DoRadioConnectionLost();

    }

    /// <summary>
    /// Set Bassboost for VS1002
    /// </summary>
    /// <param name="Boost">Boost in dB</param>
    /// <param name="LowerLimit">Lower frequency in (*10Hz)</param>
    public void SetBassBoost(UInt16 Boost, UInt16 LowerLimit)
    {
        lock (VS1002_Device_Lock)
        {
            VS1002.SetBassBoost(Boost, LowerLimit);
        }
    }

    /// <summary>
    /// Change volume
    /// </summary>
    /// <param name="Change">Amount of volume change</param>
    public void VolumeChange(Int16 Change)
    {
        UInt16 OldVol = 0x0000;

        lock (VS1002_Device_Lock)
        {
            OldVol = VS1002.SCI_Read(VS1002.VS1002Registers.VOL);
        }

        byte Left = ((byte) ((OldVol >> 8) & 0xFF));
        byte Right = ((byte) ((OldVol) & 0xFF));

        if (((Left + Change) > 0) & ((Left + Change) < 255))
        {
            Left = ((byte)(Left + Change));
        }

        if (((Right + Change) > 0) & ((Right + Change) < 255))
        {
            Right = ((byte)(Right + Change));
        }

        lock (VS1002_Device_Lock)
        {
            VS1002.SetVolume(Left, Right);
        }

        status = StatusOptions.Message;
        Message = "Volume";
        SubMessage1 = Left.ToString();
        SubMessage2 = Right.ToString();

        DoMp3InfoUpdated();
        Thread.Sleep(1);
    }

    /// <summary>
    /// Trigger OnMP3InfoUpdated event
    /// Called by PollForData when MPEG Header is found.
    /// </summary>
    private void DoMp3InfoUpdated()
    {
        // When event handler is set execute it
        if (OnMP3InfoUpdated != null)
        {
            OnMP3InfoUpdated();
        }
    }



    /// <summary>
    /// Trigger OnRadioConnectionLost event
    /// Called by PollForData when connection is lost.
    /// </summary>
    private void DoRadioConnectionLost()
    {
        // Debug: Close debug pwm output
        pwm0.Dispose();

        // Try closing Socket
        try { RadioSocket.Close(); }
        catch { };

        // Close output thread
        if (tOutPutStream.IsAlive)
        {
            // Indicate we want to stop sending data
            OutputOn = false;

            // Give thread 100mS to stop
            if (!tOutPutStream.Join(TimeSpan.FromTicks(100 * TimeSpan.TicksPerMillisecond)))
            {
                // Else kill thread
                tOutPutStream.Abort();
            }
        }

        // When event handler is set excecute it
        if (OnRadioConnectionLost != null)
        {
            OnRadioConnectionLost();
        }
    }

}

