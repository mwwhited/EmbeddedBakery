using System;
using System.Threading;
using DeviceSolutions.SPOT.Hardware;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using WhitedUS.IO;
using System.IO;
using WhitedUS.IO.Linq;
using System.Text;

namespace WhitedUS.Devices.DOSonCHIP
{
    public class CD17B10 : SPISlaveDevice
    {
        #region Nested Classes

        #endregion

        #region Constants

        public const Cpu.Pin PIN_RESET = Meridian.Pins.SSI_TXFS;
        public const Cpu.Pin PIN_CHIP_SELECT = Meridian.Pins.SPI_SS;
        public const uint CLOCK_RATE = 2400;

        internal const int TIMEOUT = 10000;

        internal const int DOS_PACKET_LENGTH_HEADER = 1;
        internal const int DOS_HANDSHAKE_WAIT = 0x00;
        internal const byte DOS_HANDSHAKE_GO = 0xEA;
        internal const byte DOS_RES_NOERROR = 0x80;

        internal const byte DOS_HOST_WRITE_NOT_COMPLETE = 0xd1;
        internal const byte DOS_HOST_COMMUNICATION_ERROR = 0xd2;
        internal const byte DOS_ERROR_RANGE_MAX = 0xdf;
        internal const byte DOS_RES_INVALID_PACKET_TYPE = 0x91;

        internal const byte DOS_HANDSHAKE_OFF = 0xff;
        internal const byte DOS_HOST_ERROR_TIMEOUT = DOS_HANDSHAKE_OFF;

        #endregion

        #region Constructor

        public CD17B10() : base(PIN_CHIP_SELECT, CLOCK_RATE) { Init(); }
        public CD17B10(Cpu.Pin chipSelect) : base(chipSelect, CLOCK_RATE) { Init(); }
        public CD17B10(Cpu.Pin chipSelect, uint clockRate) : base(chipSelect, clockRate) { Init(); }

        #endregion

        protected static OutputPort _reset = new OutputPort(PIN_RESET, false);

        #region Singleton

        private static CD17B10 _instance;
        public static CD17B10 Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new CD17B10();
                return _instance;
            }
        }

        #endregion

        internal void Reset()
        {
            _reset.Write(false);
            Thread.Sleep(1);
            _reset.Write(true);
            Thread.Sleep(1);
        }
        internal void Init()
        {
            Reset();

            byte[] initSend = new byte[2];
            byte[] initRevc = new byte[initSend.Length];
            byte initTemp = 0xff;
            int initTimeOut = TIMEOUT;
            while (initTemp == 0xff)
            {
                WriteRead(initSend, initRevc);
                initTemp = initRevc[1];
                if (--initTimeOut <= 0)
                    throw new IOException("IC \"CD17B10\" timeout");
            }
            Write(new byte[] { DOS_HANDSHAKE_GO }); //host ready

            this.Time = DateTime.Now;
            this.EnableRTC(true);
        }

        internal byte GetNotBusy()
        {
            var tempSend = new byte[1];
            var tempRecv = new byte[tempSend.Length];
            int initTimeOut = TIMEOUT;
            byte temp = DOS_HANDSHAKE_WAIT;
            while (temp == DOS_HANDSHAKE_WAIT)
            {
                WriteRead(tempSend, tempRecv);
                temp = tempRecv[0];
                Thread.Sleep(1);
                if (--initTimeOut <= 0)
                {
                    Debug.Print("ASSERT!!!! CD17B10::GetNotBusy() TIMEOUT!!!");
                    //throw new IOException("IC \"CD17B10\" timeout");
                    break;
                }
            }
            return temp;
        }
        internal byte[] SendCommand(byte command, params byte[] sendBuffer)
        {
            lock (this)
            {
                byte[] realSend = null;
                if (sendBuffer == null)
                    realSend = new byte[2];
                else
                {
                    if (sendBuffer.Length <= 4)
                        realSend = new byte[5];
                    else
                        realSend = new byte[sendBuffer.Length + 1];
                    Array.Copy(sendBuffer, 0, realSend, realSend.Length - sendBuffer.Length, sendBuffer.Length);
                }
                realSend[0] = command;

                var nb = GetNotBusy();
                if (nb != DOS_HANDSHAKE_GO)
                {
                    Debug.Print("ASSERT!!! CD17B10::SendCommand(GO) NB: " + nb.ToString() + " Comand:" + command.ToString());
                }
                Write(realSend);
                nb = GetNotBusy();
                if (nb != DOS_RES_NOERROR)
                {
                    switch (nb)
                    {
                        case 0x90:
                            Debug.Print("Invalid Command");
                            goto default;
                        case 0x91:
                            Debug.Print("Invalid Packet Type");
                            goto default;
                        case 0x92:
                            Debug.Print("Invalid Parameter our of range");
                            goto default;
                        case 0x93:
                            Debug.Print("Invalid Operation");
                            goto default;
                        default:
                            Debug.Print("ASSERT!!! CD17B10::SendCommand(Error) NB: " + nb.ToString() + " Comand:" + command.ToString());
                            break;
                    }
                }

                var recvPacket = new byte[4];
                WriteRead(new byte[4], recvPacket);

                return recvPacket;
            }
        }

        private byte _icVersion = 0;
        public byte ICVersion
        {
            get
            {
                if (_icVersion == 0)
                    _icVersion = this.SendCommand(Commands.GET_ID)[3];
                return _icVersion;
            }
        }

        private Version _version = null;
        public Version FWVersion
        {
            get
            {
                if (_version == null)
                {
                    var recvPacket = this.SendCommand(Commands.GET_VERSION);
                    _version = new Version()
                    {
                        Boot = (ushort)(recvPacket[0] << 8 | recvPacket[1]),
                        Firmware = (ushort)(recvPacket[2] << 8 | recvPacket[3])
                    };
                }
                return _version;
            }
        }

        public DateTime Time
        {
            get { return DOSTime.Create(this.SendCommand(Commands.GET_TIME)); }
            internal set { this.SendCommand(Commands.SET_TIME, ((DOSTime)value).Bytes); }
        }
        public void EnableRTC(bool input)
        {
            var ret = this.SendCommand(Commands.SET_TIME_ON_OFF, (byte)(input ? 1 : 0));
        }

        public uint FreeSectorCount
        {
            get
            {
                this.Mount();
                return this.SendCommand(Commands.GET_FREE_SECTORS).ToUInt();
            }
        }

        private uint _mountedId = 0;
        public uint Mount()
        {
            return this.Mount(uint.MaxValue);
        }
        public uint Mount(uint freeAllocateSize)
        {
            if (_mountedId == 0)
                _mountedId = this.SendCommand(Commands.MOUNT, freeAllocateSize.ToArray()).ToUInt();
            return _mountedId;
        }
        public void Unmount()
        {
            _mountedId = 0;
        }

        public byte MakeDirectory(string directory)
        {
            return this.MakeDirectory(directory, true);
        }
        public byte MakeDirectory(string directory, bool throwException)
        {
            return this.DoCommandAndName(Commands.MAKE_DIR, directory, throwException);
        }

        public byte ChangeDirectory(string directory)
        {
            return this.DoCommandAndName(Commands.CHANGE_DIR, directory);
        }

        public uint Open(bool toRead, string fileName, byte handle)
        {
            byte ret;
            byte[] retb = null;

            if ((ret = SetName(fileName)) == 0) /* Set file name */
                if ((ret = SetHandle(handle)) == 0) /* Set handle */
                    if ((ret = PacketPut((byte)(toRead ? Commands.OPEN_READ : Commands.OPEN_WRITE))) == 0) /* Open file */
                        if ((retb = PacketGet())[0] == DOS_RES_NOERROR)
                            ret = 0;

            if (ret != 0)
                throw new IOException(ThrowException(ret).ToString());

            return retb.ToUInt(1);
        }

        public uint WritePreallocate(byte handle, uint numBytes)
        {
            byte ret;
            byte[] retb = null;

            /* Set handle */
            if ((ret = SetHandle(handle)) == 0)

                /* Send the number of bytes to preallocate/append to the file */
                if ((ret = PacketPut(Commands.WRITE_PREALLOCATE, numBytes.ToArray())) == 0)
                    if ((retb = PacketGet())[0] == DOS_RES_NOERROR)
                        ret = 0;

            /* Return the new file size */

            if (ret != 0)
                throw new IOException(ThrowException(ret).ToString());

            return retb.ToUInt(1);
        }

        public byte Write(byte handle, byte[] buffer, uint numBytes)
        {
            byte ret;
            byte[] retb;
            byte err;

            if ((ret = SetHandle(handle)) == 0)/* Set handle */
                if ((err = PacketPut(Commands.WRITE_DATA, numBytes.ToArray())) != 0)   /* Send write command */
                    return (err);

            uint packetPayloadLength = 0;
            do
            {
                ret = (retb = this.PacketGetResponse(packetPayloadLength))[0];
                switch (ret)
                {
                    case Commands.SET_BLOCK_LEN:
                        packetPayloadLength = retb.ToUInt(3);
                        break;
                    case DOS_HANDSHAKE_GO:

                        var sendBuffer = new byte[packetPayloadLength + 1];
                        sendBuffer[0] = Commands.DOS_DATA_BLOCK;

                        var sourceStart = (int)(buffer.Length - numBytes);
                        var length = (int)(packetPayloadLength);
                        Array.Copy(
                            buffer, sourceStart,
                            sendBuffer, 1,
                            length);

                        numBytes -= packetPayloadLength; /* adjust number of bytes left to send */
                        break;
                    case Commands.DOS_DATA_BLOCK_END:
                        if (numBytes == 0) return (0); /* no error */
                        else return (DOS_HOST_WRITE_NOT_COMPLETE); /* did not complete writing the specified number of bytes */
                    default:
                        if ((ret > DOS_RES_NOERROR) && (ret <= DOS_ERROR_RANGE_MAX)) return (ret);
                        return (DOS_RES_INVALID_PACKET_TYPE); /* packet number is out of range */
                }
            } while (true); /* loop exit is within switch */
        }

        public byte Close(byte handle)
        {
            byte ret;
            byte[] retb = null;

            /* Set handle */
            if ((ret = SetHandle(handle)) == 0)
                if ((ret = PacketPut(Commands.CLOSE)) == 0)
                    if ((ret = (retb = PacketGet())[0]) == DOS_RES_NOERROR)
                        ret = 0;
            return ret;
        }


        internal byte[] PacketGetResponse(uint packetPayloadLength) /* Receive a response packet from DOSonCHIP */
        {
            uint len = 0;
            /* Clear error detail */
            var DOScommandResponse = new byte[5];

            var ret = GetNotBusy();   /* get packet header */
            DOScommandResponse[0] = ret;
            switch (ret)
            {
                case DOS_HANDSHAKE_GO:
                    /* len = 0; */
                    break;
                case DOS_HANDSHAKE_WAIT:
                    /* DOScommandResponse[0] = DOS_HOST_ERROR_TIMEOUT; */
                    ret = DOS_HOST_ERROR_TIMEOUT;
                    /* len = 0; */
                    break;
                case DOS_HANDSHAKE_OFF:
                    /* DOScommandResponse[0] = DOS_HOST_COMMUNICATION_ERROR; */
                    ret = DOS_HOST_COMMUNICATION_ERROR;
                    /* len = 0; */
                    break;
                case Commands.DOS_DATA_NAME:
                    ret = DOS_RES_INVALID_PACKET_TYPE;
                    len = packetPayloadLength;         /* current packet payload length */
                    break;
                case Commands.DOS_DATA_BLOCK:
                    ret = DOS_RES_INVALID_PACKET_TYPE;
                    len = packetPayloadLength;        /* current packet payload length */
                    break;
                default:
                    /* get response packet payload */
                    var temp = new byte[4];
                    this.SPIInternalWriteRead(new byte[4], temp, 0);
                    Array.Copy(temp, 0, DOScommandResponse, 1, 4);
                    /* len = 0; */
                    break;
            }

            /* Absorb improper payload from DOSonCHIP IC if improper data packet */
            if (len > 0)
                this.SPIWrite(new byte[len]);

            /* No footer */
            return DOScommandResponse;                              /* return packet header | error */
        }


        internal byte DoCommandAndName(byte command, string name)
        {
            return this.DoCommandAndName(command, name, true);
        }
        internal byte DoCommandAndName(byte command, string name, bool throwException)
        {
            this.Mount();
            byte ret = 0;
            if ((ret = SetName(name)) == 0)
                if ((ret = PacketPut(command)) == 0)
                    if ((ret = PacketGet()[0]) == DOS_RES_NOERROR)
                        ret = 0;
            if (throwException)
                ThrowException(ret);
            return ret;
        }

        internal byte ThrowException(byte error)
        {
            switch (error)
            {
                case 0x90:
                    throw new IOException("invalid command");
                case 0x91:
                    throw new IOException("improper packet type than expected");
                case 0x92:
                    throw new IOException("parameter out of range");
                case 0x93:
                    throw new IOException("cannot perform this operation--not allowed");

                case 0x98:
                    throw new IOException("card file system is not supported");
                case 0x99:
                    throw new IOException("disk full error");
                case 0x9A:
                    throw new IOException("root directory full error (FAT16)");

                case 0xA0:
                    throw new IOException("invalid directory name/not a directory/filename error");
                case 0xA1:
                    throw new IOException("file/directory not found; entry does not exist in specified dir");
                case 0xA2:
                    throw new IOException("duplicate name error; file/directory already exists");

                case 0xA8:
                    throw new IOException("invalid handle/handle out of range");
                case 0xA9:
                    throw new IOException("handle previously assigned");

                default:
                    break;
            }
            return error;
        }

        private int _packetPayloadLengthName;
        internal byte SetName(string name)
        {
            var nameBuffer = Encoding.UTF8.GetBytes(name);

            /* Set current name */
            /* (1 of 2) Set length */
            byte len = (byte)(nameBuffer.Length); /* get byte length (must be < 256 bytes AND < DOS_PACKET_LENGTH_PAYLOAD_NAME) */
            byte ret;
            byte[] retb;

            if (len != _packetPayloadLengthName)
            {
                if ((ret = PacketPut(Commands.SET_NAME_LEN, len)) != 0) return ret;
                if ((retb = PacketGet())[0] != DOS_RES_NOERROR) return (retb ?? new byte[1])[0];
                _packetPayloadLengthName = len; /* keep last name length sent to DOSonCHIP IC */
            }

            /* (2 of 2) Send name string */
            if ((ret = PacketPut(Commands.SET_NAME)) != 0) return ret;
            if ((ret = PacketPut(Commands.DOS_DATA_NAME, nameBuffer)) != 0) return ret;
            if ((ret = PacketGet()[0]) != DOS_RES_NOERROR) return ret;

            return 0; /* no error */
        }

        private byte _currentHandle = 0xff;
        internal byte SetHandle(byte handle)
        {
            byte response = 0;

            /* Set handle */
            if (handle != _currentHandle)
            {
                if ((response = PacketPut(Commands.SET_HANDLE, handle)) == 0)
                    if ((response = PacketGet()[0]) == DOS_RES_NOERROR)
                        response = 0;
                _currentHandle = handle; /* keep last handle sent to DOSonCHIP IC */
            }

            return response; /* no error */
        }

        internal byte PacketPut(byte command)
        {
            //Debug.Print("PacketPut(b)");
            return this.PacketPut(command, null);
        }
        internal byte PacketPut(byte command, byte input)
        {
            //Debug.Print("PacketPut(b,b)");
            return this.PacketPut(command, new byte[] { 0, 0, 0, input });
        }
        internal byte PacketPut(byte command, byte[] input)
        {
            //Debug.Print("PacketPut(b,b[])");
            lock (this)
            {
                byte[] realSend = null;
                if (input == null)
                    realSend = new byte[2];
                else
                {
                    //if (input.Length <= 4)
                    //    realSend = new byte[5];
                    //else
                    realSend = new byte[input.Length + 1];
                    Array.Copy(input, 0, realSend, realSend.Length - input.Length, input.Length);
                }
                realSend[0] = command;

                var nb = GetNotBusy();
                if (nb != DOS_HANDSHAKE_GO)
                    Debug.Print("ASSERT!!! CD17B10::PacketPut() NB: " + nb.ToString() + " Command:" + command.ToString());
                else
                {
                    var ret = new byte[realSend.Length];
                    this.WriteRead(realSend, ret);
                    nb = 0;
                }
                return nb;
            }
        }

        internal byte[] PacketGet()
        {
            return PacketGet(4);
        }
        internal byte[] PacketGet(byte length)
        {
            var nb = GetNotBusy();
            if (nb != DOS_RES_NOERROR)
            {
                switch (nb)
                {
                    case 0x90:
                        Debug.Print("Invalid Command");
                        goto default;
                    case 0x91:
                        Debug.Print("Invalid Packet Type");
                        goto default;
                    case 0x92:
                        Debug.Print("Invalid Parameter our of range");
                        goto default;
                    case 0x93:
                        Debug.Print("Invalid Operation");
                        goto default;
                    default:
                        Debug.Print("ASSERT!!! CD17B10::PacketGet() NB: " + nb.ToString());
                        break;
                }
            }
            var recv = new byte[length];
            WriteRead(new byte[length], recv);
            var ret = new byte[length + 1];
            Array.Copy(recv, 0, ret, 1, length);
            ret[0] = nb;
            return ret;
        }

        internal void WriteRead(byte[] input, byte[] output)
        {
            this.SPIInternalWriteRead(input, output, 0);
        }
        internal void Write(byte[] input)
        {
            this.SPIWrite(input);
        }
    }
}
