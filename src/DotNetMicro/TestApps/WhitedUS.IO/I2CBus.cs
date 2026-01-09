using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;

namespace WhitedUS.IO
{
    public sealed class I2CBus : IDisposable
    {
        /*
        for (byte i = 0; i < 127; i++)
        {
            try
            {
                if (new AR1010(bus, i).Write(new byte[] { 0x40, 0 }))
                    Debug.Print("DeviceID: " + i.ToString());
            }
            catch (Exception ex)
            {
                Debug.Print(ex.Message);
            }
        }
        */

        private I2CDevice _slaveDevice;
        private I2CBus()
        {
            this._slaveDevice = new I2CDevice(new I2CDevice.Configuration(0, 0));
        }

        private static I2CBus _instance;
        public static I2CBus Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new I2CBus();
                return _instance;
            }
        }

        public bool Write(I2CDevice.Configuration config, byte[] writeBuffer, int timeOut)
        {
            this._slaveDevice.Config = config;
            I2CDevice.I2CTransaction[] xact = new I2CDevice.I2CTransaction[] {
                _slaveDevice.CreateWriteTransaction(writeBuffer)
            };
            lock (_slaveDevice)
            {
                int bytesCount = _slaveDevice.Execute(xact, timeOut);
                return bytesCount == writeBuffer.Length;
            }
        }

        public bool Read(I2CDevice.Configuration config, byte[] readBuffer, int timeOut)
        {
            this._slaveDevice.Config = config;
            I2CDevice.I2CTransaction[] xact = new I2CDevice.I2CTransaction[] {
                _slaveDevice.CreateReadTransaction(readBuffer)
            };
            lock (_slaveDevice)
            {
                int bytesCount = _slaveDevice.Execute(xact, timeOut);
                return bytesCount == readBuffer.Length;
            }
        }

        public byte ReadRegByte(I2CDevice.Configuration config, byte address, int timeOut)
        {
            return ReadReg(config, address, timeOut)[0];
        }

        public ushort ReadRegUShort(I2CDevice.Configuration config, byte address, int timeOut)
        {
            this._slaveDevice.Config = config;
            var buffer = new byte[2];
            I2CDevice.I2CTransaction[] xact = new I2CDevice.I2CTransaction[] {
                _slaveDevice.CreateWriteTransaction(new byte[]{address}),
                _slaveDevice.CreateReadTransaction(buffer)
            };
            lock (_slaveDevice)
            {
                _slaveDevice.Execute(xact, timeOut);
            }

            return (ushort)(buffer[1] | (buffer[0] << 8));

            //return BitConverter.ToUInt16(buffer, 0);
        }

        public byte[] ReadReg(I2CDevice.Configuration config, byte address, int timeOut)
        {
            this._slaveDevice.Config = config;
            var buffer = new byte[4];
            I2CDevice.I2CTransaction[] xact = new I2CDevice.I2CTransaction[] {
                _slaveDevice.CreateWriteTransaction(new byte[]{address}),
                _slaveDevice.CreateReadTransaction(buffer)
            };
            lock (_slaveDevice)
            {
                _slaveDevice.Execute(xact, timeOut);
                return buffer;
            }
        }

        public int WriteRead(I2CDevice.Configuration config, byte[] input, byte[] output, int timeOut)
        {
            this._slaveDevice.Config = config;
            I2CDevice.I2CTransaction[] xact = new I2CDevice.I2CTransaction[] {
                _slaveDevice.CreateWriteTransaction(input),
                _slaveDevice.CreateReadTransaction(output)
            };
            lock (_slaveDevice)
            {
                return _slaveDevice.Execute(xact, timeOut);
            }
        }

        public void Dispose()
        {
            this._slaveDevice.Dispose();
        }
    }
}
