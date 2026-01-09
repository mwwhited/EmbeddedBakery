using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WhitedUS.MWFS
{
    public class BootBlock
    {
        public const ushort BLOCK_SIZE = 32*8;

        public BootBlock()
        {
        }

        public BootBlock(byte[] dataBuffer)
        {
            if (dataBuffer == null || dataBuffer.Length != BLOCK_SIZE)
                throw new ArgumentOutOfRangeException("dataBuffer.Length must be BLOCK_SIZE bytes");

            _BootFileID = BitConverter.ToUInt32(dataBuffer, 0);
            _LastFileID = BitConverter.ToUInt32(dataBuffer, 4);
            _Attributes = BitConverter.ToUInt32(dataBuffer, 8);
            Array.Copy(dataBuffer, 12, _FSID, 0, FSID_LENGTH);
            Array.Copy(dataBuffer, 12 + FSID_LENGTH, _Data, 0, BUFFER_MAX_LENGTH);
        }

        public byte[] GetBytes()
        {
            var dataBuffer = new byte[BLOCK_SIZE];
            Array.Copy(BitConverter.GetBytes(_BootFileID), 0, dataBuffer, 0, 4);
            Array.Copy(BitConverter.GetBytes(_LastFileID), 0, dataBuffer, 4, 4);
            Array.Copy(BitConverter.GetBytes(_Attributes), 0, dataBuffer, 8, 4);
            Array.Copy(_FSID, 0, dataBuffer, 12, 4);
            Array.Copy(_Data, 0, dataBuffer, 12 + FSID_LENGTH, BUFFER_MAX_LENGTH);
            return dataBuffer;
        }

        public byte[] ToArray()
        {
            if (this.BlockLength == 0)
                return null;
            var buffer = new byte[this.BlockLength];
            Array.Copy(this.Data, 0, buffer, 0, this.BlockLength);
            return buffer;
        }

        private uint _BootFileID = 0; // if 0 then there is not boot record
        private byte[] _FSID = Encoding.UTF8.GetBytes("MWFS"); //new byte[FSID_LENGTH];
        public const byte FSID_LENGTH = 4;

        private uint _LastFileID = 0;
        private uint _Attributes            = 0x0affffe0;
        public uint Attributes { get { return _Attributes; } }
        public const uint LENGTH_MASK       = 0x0000001f;
        public const byte LENGTH_SHIFT      = 0;
        public const uint RESERVED_MASK     = 0x00ffffe0;
        public const byte RESERVED_SHIFT    = 5;
        public const uint VERSION_MASK      = 0xff000000;
        public const byte VERSION_SHIFT     = 24;

        private byte[] _Data = new byte[BUFFER_MAX_LENGTH];
        public const ushort BUFFER_MAX_LENGTH = 128 - 16;

        public uint BlockLength
        {
            get { return (_Attributes & LENGTH_MASK) >> LENGTH_SHIFT; }
        }

        public uint ReservedBits
        {
            get { return (_Attributes & RESERVED_MASK) >> RESERVED_SHIFT; }
        }

        public byte Version
        {
            get { return (byte)((_Attributes & VERSION_MASK) >> VERSION_SHIFT); }
        }

        public string FSID
        {
            get { return Encoding.UTF8.GetString(_FSID); }
        }

        public byte[] Data
        {
            get { return this.ToArray(); }
            internal set
            {
                if (value.Length > BUFFER_MAX_LENGTH)
                    throw new ArgumentOutOfRangeException("value.Length must be <= BUFFER_MAX_LENGTH");
                _Attributes &= RESERVED_MASK;
                uint len = (uint)(value.Length & LENGTH_MASK);
                _Attributes |= (len << LENGTH_SHIFT);
            }
        }
    }
}
