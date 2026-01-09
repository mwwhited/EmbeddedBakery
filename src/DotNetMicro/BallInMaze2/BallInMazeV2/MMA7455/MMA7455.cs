using System;
using Microsoft.SPOT;
using FusionWare.SPOT;
using Microsoft.SPOT.Hardware;
using FusionWare.SPOT.Hardware;

namespace DeviceSolutions.SPOT.Hardware
{
    /// <summary>Managed Driver for the emulated Simple I2CDevice</summary>
    /// <remarks>
    /// This demonstrates a managed code driver for an I2C Device. The device
    /// is the emulated <see cref="EmbeddedFusion.SPOT.Emulator.SimpleI2CDevice" />.
    /// It has only one 16 bit "Chip ID" register (or command/response if you like).
    /// 
    /// While the device communication and "register set" is simplistic this
    /// sample is a complete driver illustrating best practices for managed drivers.
    /// This includes encapsulating internal details, isolating the device driver from
    /// the bus ther device is on and supporting IDisposable so that GPIO Pin
    /// resources are properly freed by deriving from <see cref="I2CDeviceDriver" />. 
    /// This may seem like an academic excercise, however it is vitally important for
    /// re-usablity of drivers in different systems. It is possible that a system could
    /// share the GPIO Pins for the underlying bus via an external multiplexer. If
    /// proper encapsulation and IDisposable are not used correctly then the driver
    /// would not work on such a system. 
    /// </remarks>
    public partial class MMA7455 : I2CDeviceDriver
    {
        const int ClockRateKhz = 100;

        private enum Registers : byte
        {
            ChipID = 0x5A
        }

        /// <summary>Creates a new device instance</summary>
        /// <param name="Address">Address of the bus (including read write bit of 0)</param>
        /// <remarks>
        /// This will create a new device instance of the driver at the specified address.
        /// The address is the same as used by the I2CDevice.Configuration. 
        /// </remarks>
        public MMA7455(I2CBus Bus, ushort Address)
            : base(Bus, Address, ClockRateKhz)
        {
        }

        /// <summary>Gets the Chip ID</summary>
        /// <value>Chip ID retrieved from the device</value>
        /// <remarks>
        /// This property will cache the ID so that it is actually read from the
        /// device only once. This is a read only register.
        /// </remarks>
        /// <Note>This is just a sample of a possible register. No known real device actually implements this particular functionality</Note>
        public ChipIDReg ChipID
        {
            get
            {
                // 0 is the initial state of the value
                // it is also an invalid ID so use that
                // to check if the data is cached already.
                if (this._ChipID.Value == 0)
                    this._ChipID.Value = base.ReadReg16((byte)Registers.ChipID, ByteOrder.LittleEndian);

                return this._ChipID;
            }
        }

        public byte I2CAddress()
        {
            return base.ReadReg8(0x0d);
        }

        public enum Mma7455Mode
        {
            modeStandby        = 0,
            modeMeasurement    = 1,
            modeLevelDetection = 2,
            modePulseDetection = 3
        }

        public enum Mma7455gSelect
        {
            g8 = 0,
            g2 = 1,
            g4 = 2
        }

        public void SetMode( Mma7455Mode Mode, Mma7455gSelect gLevel )
        {
            // Mode register has Mode in bits 0 and 1, followed by gLevel in bits 2 and 3
            WriteRegister(0x16, (byte)((byte)Mode + (byte)((int)gLevel << 2)));
        }

        private Int16 averageCount = 3;
        public Int16 AverageCount {
            set { averageCount = value; }
            get { return averageCount; }
        }

        private Int16 ReadAxisAverage(byte Channel) {
            Int16 total = 0;

            for (int i = 0; i < averageCount; i++)
                total += ReadAxis(Channel);

            total /= averageCount;

            return total;
        }

        private Int16 ReadAxis(byte Channel)
        {
            try
            {
                ushort Value = base.ReadReg16(Channel, ByteOrder.LittleEndian);
                
                // and sign extend...
                if ((Value & 0x0200) != 0)
                    Value |= 0xfc00;

                return (Int16)Value;
            }
            catch
            {
                return 0;
            }
        }

        public Int16 XData() { return ReadAxis(0); }
        public Int16 YData() { return ReadAxis(2); }
        public Int16 ZData() { return ReadAxis(4); }

        public Int16 XDataAverage() { return ReadAxisAverage(0); }
        public Int16 YDataAverage() { return ReadAxisAverage(2); }
        public Int16 ZDataAverage() { return ReadAxisAverage(4); }

        public bool ReadAll(ref Int16 X, ref Int16 Y, ref Int16 Z)
        {
            // wait until the status bit is set
            byte StatusReg;

            try
            {
                StatusReg = base.ReadReg8(9);
            }
            catch
            {
                return false;
            }

            if ((StatusReg & 0x01) == 0)
                return false;

            // Read each channel
            X = ReadAxis(0);
            Y = ReadAxis(2);
            Z = ReadAxis(4);

            return true;
        }

        public ushort ReadRegister(byte Address)
        {
            try { return base.ReadReg16(Address, ByteOrder.LittleEndian); }
            catch { return 0; }
        }

        public void WriteRegister(byte Address, byte Data)
        {
            try { base.WriteReg8(Address, Data); }
            catch {}
        }

        private ChipIDReg _ChipID;
    }
}
