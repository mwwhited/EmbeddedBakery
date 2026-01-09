using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;

namespace WhitedUS.IO
{
    public interface ISPIBus
    {
        //void InternalWriteRead(SPI.Configuration config, byte[] writeBuffer, byte[] readBuffer, int readOffset);
        //void InternalWriteRead(SPI.Configuration config, ushort[] writeBuffer, ushort[] readBuffer, int readOffset);
        void Write(SPI.Configuration config, byte[] writeBuffer);
        void Write(SPI.Configuration config, ushort[] writeBuffer);
        void WriteRead(SPI.Configuration config, byte[] writeBuffer, byte[] readBuffer);
        void WriteRead(SPI.Configuration config, ushort[] writeBuffer, ushort[] readBuffer);
        void WriteRead(SPI.Configuration config, byte[] writeBuffer, byte[] readBuffer, int readOffset);
        void WriteRead(SPI.Configuration config, ushort[] writeBuffer, ushort[] readBuffer, int readOffset);
    }
}
