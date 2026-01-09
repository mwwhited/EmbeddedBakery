#if UseMySPIBus
using System;
using DeviceSolutions.SPOT.Hardware;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using System.Collections;
using System.Linq;
using System.Runtime.InteropServices;

namespace WhitedUS.IO
{
    public class OutputPortInstance
    {
        private OutputPortInstance(Cpu.Pin pin)
        {
            this.Pin = pin;
            this.Port = new OutputPort(pin, true);
        }

        public readonly Cpu.Pin Pin;
        public readonly OutputPort Port;

        private static ArrayList ports = new ArrayList();
        public static OutputPort GetPort(Cpu.Pin pin)
        {
            lock (ports)
            {
                var port = (OutputPortInstance)(ports.Where(p => ((OutputPortInstance)p).Pin == pin).First());
                if (port == null)
                {
                    port = new OutputPortInstance(pin);
                    ports.Add(port);
                }
                return port.Port;
            }
        }
    }

    public class MySPIBus : ISPIBus, IDisposable
    {
        public const Cpu.Pin PIN_SO = Meridian.Pins.SPI_MOSI; //.SSI_TXFS; //.SPI_MOSI;
        public const Cpu.Pin PIN_SI = Meridian.Pins.SPI_MISO; //.SSI_TXCLK; //.SPI_MISO;
        public const Cpu.Pin PIN_SCLK = Meridian.Pins.SPI_SCLK; //.SSI_TXDAT; //.SPI_SCLK;

        private static InputPort mosi = new InputPort(PIN_SI, true, Port.ResistorMode.PullUp);
        private static OutputPort miso = new OutputPort(PIN_SO, true);
        private static OutputPort sclk = new OutputPort(PIN_SCLK, true);

        private static MySPIBus _instance;
        public static MySPIBus Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new MySPIBus();
                return _instance;
            }
        }

        public void WriteRead(Cpu.Pin chipSelect, byte[] buffer, byte[] outBuffer)
        {
            var cs = OutputPortInstance.GetPort(chipSelect);

            var bufferLength = buffer.Length;

            var clockLength = 1;
            var clockLengthRead = clockLength;

            var boolBuffer = new bl[bufferLength];
            for (int byteIndex = 0; byteIndex < bufferLength; byteIndex++)
            {
                boolBuffer[byteIndex].v = new bool[]
                    {
                        (buffer[byteIndex] & bl.masks[0]) == bl.masks[0],
                        (buffer[byteIndex] & bl.masks[1]) == bl.masks[1],
                        (buffer[byteIndex] & bl.masks[2]) == bl.masks[2],
                        (buffer[byteIndex] & bl.masks[3]) == bl.masks[3],
                        (buffer[byteIndex] & bl.masks[4]) == bl.masks[4],
                        (buffer[byteIndex] & bl.masks[5]) == bl.masks[5],
                        (buffer[byteIndex] & bl.masks[6]) == bl.masks[6],
                        (buffer[byteIndex] & bl.masks[7]) == bl.masks[7]
                    };
            }
            var boolBufferLength = boolBuffer.Length;

            unsafe
            {
                miso.Write(true);
                sclk.Write(true);
                cs.Write(true);
                for (int i = 0; i < 100; i++) ;
                cs.Write(false); //cs is active low

                fixed (byte* pOutBuffer = outBuffer)
                {
                    byte* pob = pOutBuffer;
                    //fixed (bl* pBoolBuffer = boolBuffer)
                    //{
                    //    bl* pb = pBoolBuffer;
                    for (int i = 0; i < bufferLength; i++)
                    {
                        fixed (bool* pBools = boolBuffer[i].v)
                        {
                            bool* it = pBools;
                            miso.Write(*(it++));
                            sclk.Write(true);
                            *it = mosi.Read();
                            sclk.Write(false);

                            miso.Write(*(it++));
                            sclk.Write(true);
                            *it = mosi.Read();
                            sclk.Write(false);

                            miso.Write(*(it++));
                            sclk.Write(true);
                            *it = mosi.Read();
                            sclk.Write(false);

                            miso.Write(*(it++));
                            sclk.Write(true);
                            *it = mosi.Read();
                            sclk.Write(false);

                            miso.Write(*(it++));
                            sclk.Write(true);
                            *it = mosi.Read();
                            sclk.Write(false);

                            miso.Write(*(it++));
                            sclk.Write(true);
                            *it = mosi.Read();
                            sclk.Write(false);

                            miso.Write(*(it++));
                            sclk.Write(true);
                            *it = mosi.Read();
                            sclk.Write(false);

                            miso.Write(*(it++));
                            sclk.Write(true);
                            *it = mosi.Read();
                            sclk.Write(false);
                        }
                        *(pob++) = boolBuffer[i].Value;
                    }
                    //}
                    miso.Write(true);
                    sclk.Write(true);
                    cs.Write(true);
                }
            }
        }

        #region IDisposable Members

        public void Dispose()
        {
            if (mosi != null) mosi.Dispose();
            if (miso != null) miso.Dispose();
            if (sclk != null) sclk.Dispose();
        }

        #endregion

        internal struct bl
        {
            public bool[] v;

            public readonly static byte[] masks = new byte[]
            {
                1 << 7,
                1 << 6,
                1 << 5,
                1 << 4,
                1 << 3,
                1 << 2,
                1 << 1,
                1 << 0
            };

            public byte Value
            {
                get
                {
                    var outByte = 0;
                    outByte |= v[0] ? masks[0] : 0;
                    outByte |= v[1] ? masks[1] : 0;
                    outByte |= v[2] ? masks[2] : 0;
                    outByte |= v[3] ? masks[3] : 0;
                    outByte |= v[4] ? masks[4] : 0;
                    outByte |= v[5] ? masks[5] : 0;
                    outByte |= v[6] ? masks[6] : 0;
                    outByte |= v[7] ? masks[7] : 0;
                    return (byte)outByte;
                }
            }
        }

        #region ISPIBus Members

        public void InternalWriteRead(SPI.Configuration config, byte[] writeBuffer, byte[] readBuffer, int readOffset)
        {
            throw new NotImplementedException();
        }

        public void InternalWriteRead(SPI.Configuration config, ushort[] writeBuffer, ushort[] readBuffer, int readOffset)
        {
            throw new NotImplementedException();
        }

        public void Write(SPI.Configuration config, byte[] writeBuffer)
        {
            lock (this)
                this.WriteRead(config.ChipSelect_Port, writeBuffer, new byte[writeBuffer.Length]);
        }

        public void Write(SPI.Configuration config, ushort[] writeBuffer)
        {
            throw new NotImplementedException();
        }

        public void WriteRead(SPI.Configuration config, byte[] writeBuffer, byte[] readBuffer)
        {
            lock (this)
                this.WriteRead(config.ChipSelect_Port, writeBuffer, readBuffer);
        }

        public void WriteRead(SPI.Configuration config, ushort[] writeBuffer, ushort[] readBuffer)
        {
            throw new NotImplementedException();
        }

        public void WriteRead(SPI.Configuration config, byte[] writeBuffer, byte[] readBuffer, int readOffset)
        {
            throw new NotImplementedException();
        }

        public void WriteRead(SPI.Configuration config, ushort[] writeBuffer, ushort[] readBuffer, int readOffset)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
#endif




//VS1011e.Reset();
//VS1011e.Test();

//Debug.Print("Waiting for Unsafe");
//Thread.Sleep(10000);
//try
//{
//    var sendBuf = new byte[16];
//    var recvBuf = new byte[sendBuf.Length];
//    for (int i = 0; i < sendBuf.Length; i++)
//        sendBuf[i] = (byte)i;
//    MySPIBus.Instance.WriteRead(Meridian.Pins.GPIO10, sendBuf, recvBuf);
//}
//catch (Exception ex)
//{
//    Debug.Print(ex.ToString());
//}


