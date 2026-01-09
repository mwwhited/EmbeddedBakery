#if !UseMySPIBus
using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using DeviceSolutions.SPOT.Hardware;

namespace WhitedUS.IO
{
    public sealed class SPIBus : ISPIBus, IDisposable
    {
        public const Cpu.Pin PIN_SO = Meridian.Pins.SPI_MISO;
        public const Cpu.Pin PIN_SI = Meridian.Pins.SPI_MOSI;
        public const Cpu.Pin PIN_SCLK = Meridian.Pins.SPI_SCLK;
        public const Cpu.Pin PIN_SS = Meridian.Pins.SPI_SS;
        public const SPI.SPI_module MODULE = SPI.SPI_module.SPI1;

        private static SPIBus _instance;
        public static SPIBus Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new SPIBus();
                return _instance;
            }
        }

        private SPIBus()
        {
            _slaveDevice = new SPI(new SPI.Configuration(Cpu.Pin.GPIO_NONE, false, 0, 0, false, false, 1, SPI.SPI_module.SPI1));
        }
        private SPI _slaveDevice;

        //public void InternalWriteRead(SPI.Configuration config, byte[] writeBuffer, byte[] readBuffer, int readOffset)
        //{
        //    _slaveDevice.Config = config;
        //    lock (_slaveDevice)
        //    {
        //        _slaveDevice.InternalWriteRead(writeBuffer, readBuffer, readOffset);
        //    }
        //}

        //public void InternalWriteRead(SPI.Configuration config, ushort[] writeBuffer, ushort[] readBuffer, int readOffset)
        //{
        //    _slaveDevice.Config = config;
        //    lock (_slaveDevice)
        //    {
        //        _slaveDevice.InternalWriteRead(writeBuffer, readBuffer, readOffset);
        //    }
        //}

        public void Write(SPI.Configuration config, byte[] writeBuffer)
        {
            _slaveDevice.Config = config;
            lock (_slaveDevice)
            {
                _slaveDevice.Write(writeBuffer);
            }
        }

        public void Write(SPI.Configuration config, ushort[] writeBuffer)
        {
            _slaveDevice.Config = config;
            lock (_slaveDevice)
            {
                _slaveDevice.Write(writeBuffer);
            }
        }

        public void WriteRead(SPI.Configuration config, byte[] writeBuffer, byte[] readBuffer)
        {
            _slaveDevice.Config = config;
            lock (_slaveDevice)
            {
                _slaveDevice.WriteRead(writeBuffer, readBuffer);
            }
        }

        public void WriteRead(SPI.Configuration config, ushort[] writeBuffer, ushort[] readBuffer)
        {
            _slaveDevice.Config = config;
            lock (_slaveDevice)
            {
                _slaveDevice.WriteRead(writeBuffer, readBuffer);
            }
        }

        public void WriteRead(SPI.Configuration config, byte[] writeBuffer, byte[] readBuffer, int readOffset)
        {
            _slaveDevice.Config = config;
            lock (_slaveDevice)
            {
                _slaveDevice.WriteRead(writeBuffer, readBuffer, readOffset);
            }
        }

        public void WriteRead(SPI.Configuration config, ushort[] writeBuffer, ushort[] readBuffer, int readOffset)
        {
            _slaveDevice.Config = config;
            lock (_slaveDevice)
            {
                _slaveDevice.WriteRead(writeBuffer, readBuffer, readOffset);
            }
        }

        #region IDisposable Members

        public void Dispose()
        {
            if (_slaveDevice != null)
                _slaveDevice.Dispose();
        }

        #endregion
    }
}
#endif