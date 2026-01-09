using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;

namespace WhitedUS.IO
{
    public abstract class I2CSlaveDevice
    {
        protected const int DEFAULT_I2C_SPEED = 400;
        protected int I2C_TIMEOUT = 5000;

        protected I2CBus i2cBus;
        protected I2CDevice.Configuration _slaveConfig;

        public I2CSlaveDevice(ushort chipid)
        {
            this.i2cBus = I2CBus.Instance;
            this._slaveConfig = new I2CDevice.Configuration(chipid, DEFAULT_I2C_SPEED);
        }

        protected bool Write(byte[] buffer)
        {
            return this.i2cBus.Write(this._slaveConfig, buffer, I2C_TIMEOUT);
        }

        protected bool Write(byte data)
        {
            return this.Write(new byte[] { data });
        }

        protected bool Read(ref byte[] data)
        {
            return this.i2cBus.Read(this._slaveConfig, data, I2C_TIMEOUT);
        }

        protected byte GetByte(byte register)
        {
            return i2cBus.ReadRegByte(this._slaveConfig, register, I2C_TIMEOUT);
        }

        protected bool PutByte(byte register, byte value)
        {
            return this.i2cBus.Write(this._slaveConfig, new byte[] { register, value }, I2C_TIMEOUT);
        }

        protected ushort GetUShort(byte register)
        {
            return i2cBus.ReadRegUShort(this._slaveConfig, register, I2C_TIMEOUT);
        }

        protected bool PutUShort(byte register, ushort value)
        {
            byte[] buffer = new byte[3];
            buffer[0] = register;
            buffer[2] = (byte)(value & 0x00ff);
            buffer[1] = (byte)((value & 0xff00) >> 8);
            return this.i2cBus.Write(this._slaveConfig, buffer, I2C_TIMEOUT);
        }

        protected int WriteRead(byte[] input, byte[] output)
        {
            return this.i2cBus.WriteRead(this._slaveConfig, input, output, I2C_TIMEOUT);
        }
    }
}
