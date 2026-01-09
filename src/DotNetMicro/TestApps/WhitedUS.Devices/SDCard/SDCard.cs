//using System;
//using System.IO;
//using DeviceSolutions.SPOT.Hardware;
//using Microsoft.SPOT;
//using Microsoft.SPOT.Hardware;
//using WhitedUS.Common;
//using WhitedUS.IO;

//namespace WhitedUS.Devices.SDCard
//{
//    public class SDCard : SPISlaveDevice, IDisposable
//    {
//        #region Constants

//        public const Cpu.Pin PIN_CARD_DETECT = Meridian.Pins.GPIO12;
//        public const Cpu.Pin PIN_WRITE_PROTECT = Meridian.Pins.GPIO13;
//        public const Cpu.Pin PIN_CHIP_SELECT = Meridian.Pins.GPIO15;
//        public const uint CLOCK_RATE = 400; //12500; //25000;

//        private const int ARGS_LENGTH = 4;
//        private const int CMD_LENGTH = 6;
//        private const byte CMD_LIMIT_MASK = 0x3f;
//        private const byte CMD_MASK = 0x40;
//        private const int RECV_RETURN = 4;

//        private const uint BLOCK_SIZE = 512;

//        #endregion

//        #region Constructor

//        public SDCard() : base(PIN_CHIP_SELECT, CLOCK_RATE) { Init(); }
//        public SDCard(Cpu.Pin chipSelect) : base(chipSelect, CLOCK_RATE) { Init(); }
//        public SDCard(Cpu.Pin chipSelect, uint clockRate) : base(chipSelect, clockRate) { Init(); }

//        #endregion

//        #region Input Ports

//        protected static InputPort _cardDetect = new InputPort(PIN_CARD_DETECT, false, Port.ResistorMode.Disabled);
//        protected static InputPort _writeProtect = new InputPort(PIN_WRITE_PROTECT, false, Port.ResistorMode.Disabled);

//        #endregion

//        #region Properties

//        public bool CardDetected { get { return _cardDetect.Read(); } }
//        public bool WriteProtected { get { return _writeProtect.Read(); } }

//        #endregion

//        private void Init()
//        {
//            var bufc = new byte[10];
//            for (int i = 0; i < 0xfffe; i++)
//            {
//                this.SPIWriteRead(new byte[] { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff }, bufc);
//                var rep = this.Command(SDCommands.GO_IDLE_STATE);
//                if (rep[0] == 0xff && rep[1] == 0x01)
//                    goto jumpOut1;
//            };
//            throw new IOException("SD Card Failed to Init()");
//        jumpOut1:

//            var ret1 = this.Command(SDCommands.SEND_OP_COND);
//            var ret2 = this.Command(SDCommands.SEND_OP_COND);

//            var ret3 = this.Command(SDCommands.CRC_ON_OFF, SDCommands.ON);
//            var ret4 = this.Command(SDCommands.SET_BLOCK_LEN, BLOCK_SIZE);
//        }

//        /// <summary>
//        /// Command processor for SD cards
//        /// </summary>
//        /// <param name="command">command number</param>
//        /// <param name="args">args array</param>
//        /// <returns>response array</returns>
//        private byte[] Command(byte command, params byte[] args)
//        {
//            var sendBuffer = new byte[CMD_LENGTH + RECV_RETURN];
//            var recvBuffer = new byte[sendBuffer.Length];

//            sendBuffer[0] = (byte)((command & CMD_LIMIT_MASK) | CMD_MASK);
//            Array.Copy(args, 0, sendBuffer, 1, args.Length < ARGS_LENGTH ? args.Length : ARGS_LENGTH);
//            sendBuffer[CMD_LENGTH - 1] = sendBuffer.CRC7(CMD_LENGTH - 1);
//            sendBuffer.FillToEnd(0xff, 6);

//            this.SPIWriteRead(sendBuffer, recvBuffer);

//            var retBuffer = new byte[RECV_RETURN];
//            Array.Copy(recvBuffer, recvBuffer.Length - RECV_RETURN, retBuffer, 0, RECV_RETURN);

//            return retBuffer;
//        }
//        private byte[] Command(byte command, uint arg)
//        {
//            return this.Command(command, BitConverter.GetBytes(arg));
//        }

//        public byte[] ReadSingleBlock(uint startBlock)
//        {
//            var resp = this.Command(SDCommands.READ_SINGLE_BLOCK, (uint)(startBlock << 9));
//            var ret = new byte[] { 0xff };

//            for (int i = 0; i < 0xfffe; i++)
//            {
//                this.SPIWriteRead(new byte[] { 0xff }, ret);
//                if (ret[0] == 0x00)
//                    goto jumpOut1;
//            }
//            throw new IOException("READ_SINGLE_BLOCK not ready");
//        jumpOut1:

//            for (int i = 0; i < 0xfffe; i++)
//            {
//                this.SPIWriteRead(new byte[] { 0xff }, ret);
//                if (ret[0] == 0xfe)
//                    goto jumpOut2;
//            }
//            throw new IOException("READ timeout");
//        jumpOut2:

//            var outBuffer = new byte[512];
//            this.SPIWriteRead(new byte[512].FillToEnd(0xff), outBuffer);
//            this.SPIWrite(new byte[3].FillToEnd(0xff));
//            return outBuffer;
//        }

//        #region IDisposable Members

//        public void Dispose()
//        {
//            if (_writeProtect != null)
//                _writeProtect.Dispose();
//            if (_cardDetect != null)
//                _cardDetect.Dispose();
//        }

//        #endregion
//    }
//}
