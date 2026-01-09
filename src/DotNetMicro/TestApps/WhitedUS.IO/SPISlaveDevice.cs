using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using System.Collections;

namespace WhitedUS.IO
{
    public abstract class SPISlaveDevice 
    {
        public const bool SPI_CLOCK_EDGE = true;
        public const bool SPI_CLOCK_IDLE = false;
        public const uint SPI_CLOCK_RATE = 2000;

        public const bool SPI_SS_ACTIVE = false;
        public const uint SPI_SS_SETUP = 0;
        public const uint SPI_SS_HOLD = 0;

        protected ISPIBus _spiBus =
#if UseMySPIBus
            MySPIBus.Instance;
#else
            SPIBus.Instance;
#endif

        public SPISlaveDevice(SPI.Configuration config)
        {
            this._slaveConfig = config;
        }

        public SPISlaveDevice(Cpu.Pin chipSelect, uint clockRateKHz)
        {
            this._slaveConfig = new SPI.Configuration(
                chipSelect,
                SPI_SS_ACTIVE,
                SPI_SS_SETUP,
                SPI_SS_HOLD,
                SPI_CLOCK_IDLE,
                SPI_CLOCK_EDGE,
                clockRateKHz,
#if UseMySPIBus
                SPI.SPI_module.SPI1
#else
                SPIBus.MODULE
#endif
                );
        }

        public SPISlaveDevice(Cpu.Pin chipSelect)
        {
            this._slaveConfig = new SPI.Configuration(
                chipSelect, 
                SPI_SS_ACTIVE,
                SPI_SS_SETUP, 
                SPI_SS_HOLD,
                SPI_CLOCK_IDLE, 
                SPI_CLOCK_EDGE, 
                SPI_CLOCK_RATE,
#if UseMySPIBus
                SPI.SPI_module.SPI1
#else
                SPIBus.MODULE
#endif
);
        }

        protected SPI.Configuration _slaveConfig;

        //protected void SPIInternalWriteRead(byte[] writeBuffer, byte[] readBuffer, int readOffset)
        //{
        //    this._spiBus.InternalWriteRead(this._slaveConfig, writeBuffer, readBuffer, readOffset);
        //}

        //protected void SPIInternalWriteRead(ushort[] writeBuffer, ushort[] readBuffer, int readOffset)
        //{
        //    this._spiBus.InternalWriteRead(this._slaveConfig, writeBuffer, readBuffer, readOffset);
        //}

        protected void SPIWrite(byte[] writeBuffer)
        {
            this._spiBus.Write(this._slaveConfig, writeBuffer);
        }

        protected void SPIWrite(ushort[] writeBuffer)
        {
            this._spiBus.Write(this._slaveConfig, writeBuffer);
        }

        protected void SPIWriteRead(byte[] writeBuffer, byte[] readBuffer)
        {
            this._spiBus.WriteRead(this._slaveConfig, writeBuffer, readBuffer);
        }

        protected void SPIWriteRead(ushort[] writeBuffer, ushort[] readBuffer)
        {
            this._spiBus.WriteRead(this._slaveConfig, writeBuffer, readBuffer);
        }

        protected void SPIWriteRead(byte[] writeBuffer, byte[] readBuffer, int readOffset)
        {
            this._spiBus.WriteRead(this._slaveConfig, writeBuffer, readBuffer, readOffset);
        }

        protected void SPIWriteRead(ushort[] writeBuffer, ushort[] readBuffer, int readOffset)
        {
            this._spiBus.WriteRead(this._slaveConfig, writeBuffer, readBuffer, readOffset);
        }
    }
}
