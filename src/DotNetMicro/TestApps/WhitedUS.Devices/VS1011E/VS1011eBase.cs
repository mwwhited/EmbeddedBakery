using System;
using Microsoft.SPOT;
using DeviceSolutions.SPOT.Hardware;
using Microsoft.SPOT.Hardware;
using WhitedUS.IO;

namespace WhitedUS.Devices.VS1011E
{
    internal abstract class VS1011eBase : SPISlaveDevice, IDisposable
    {
        #region Constants

        public const Cpu.Pin PIN_DREQ = Meridian.Pins.SPI_RDY; //SSI_RXDAT; //.SPI_RDY;
        public const Cpu.Pin PIN_RST = Meridian.Pins.TIN;

        /// <summary>
        /// Data Chip Select
        /// </summary>
        public const Cpu.Pin PIN_BSYNC = Meridian.Pins.GPIO10;

        /// <summary>
        /// Control Chip Select
        /// </summary>
        public const Cpu.Pin PIN_CS = Meridian.Pins.TMR2OUT;

        #endregion

        #region Constructor

        internal VS1011eBase(Cpu.Pin chipSelect, uint clockRateKHz) :  base (chipSelect, clockRateKHz) { }

        #endregion

        #region Fields 

        protected static InputPort _DataRequest = new InputPort(PIN_DREQ, false, Port.ResistorMode.PullUp);
        protected static OutputPort _Reset = new OutputPort(PIN_RST, false);

        #endregion

        #region Methods

        internal static void BlockUntilReady() { while (!_DataRequest.Read()) ; }

        #endregion

        #region IDisposable Members

        public void Dispose()
        {
            if (_DataRequest != null) _DataRequest.Dispose();
            if (_Reset != null) _Reset.Dispose();
        }

        ~VS1011eBase()
        {
            this.Dispose();
        }

        #endregion
    }
}
