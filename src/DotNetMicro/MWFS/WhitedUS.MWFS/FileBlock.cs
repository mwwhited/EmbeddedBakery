using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace WhitedUS.MWFS
{
    public class FileBlock
    {
        public const ushort BLOCK_SIZE = 512;
        public FileBlock(byte[] dataBuffer)
        {
            if (dataBuffer == null || dataBuffer.Length != BLOCK_SIZE)
                throw new ArgumentOutOfRangeException("dataBuffer.Length must be BLOCK_SIZE bytes");

            _FileID = BitConverter.ToUInt32(dataBuffer, 0);
            _PreviousBlock = BitConverter.ToUInt32(dataBuffer, 4);
            _NextBlock = BitConverter.ToUInt32(dataBuffer, 8);
            _Attributes = BitConverter.ToUInt32(dataBuffer, 12);
            Array.Copy(dataBuffer, 16, _Data, 0, BUFFER_MAX_LENGTH);
        }

        public byte[] GetBytes()
        {
            var dataBuffer = new byte[BLOCK_SIZE];
            Array.Copy(BitConverter.GetBytes(_FileID), 0, dataBuffer, 0, 4);
            Array.Copy(BitConverter.GetBytes(_PreviousBlock), 0, dataBuffer, 4, 4);
            Array.Copy(BitConverter.GetBytes(_NextBlock), 0, dataBuffer, 8, 4);
            Array.Copy(BitConverter.GetBytes(_Attributes), 0, dataBuffer, 12, 4);
            Array.Copy(_Data, 0, dataBuffer, 16, BUFFER_MAX_LENGTH);
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

        private uint _FileID = 0; //this must not be 0
        public uint FileID { get { return _FileID; } }
        private uint _PreviousBlock = 0; //if = 0 then this is the begining of the file
        public uint PreviousBlock { get { return _PreviousBlock; } }
        private uint _NextBlock = 0; // if = 0 then this is the end of the file
        public uint NextBlock { get { return _NextBlock; } }

        private uint _Attributes;
        public uint Attributes { get { return _Attributes; } }
        public const uint LENGTH_MASK = 0x000001ff;
        public const byte LENGTH_SHIFT = 0;
        public const uint RESERVED_MASK = 0xfffffe00;
        public const byte RESERVED_SHIFT = 9;

        private byte[] _Data = new byte[BUFFER_MAX_LENGTH];
        public const ushort BUFFER_MAX_LENGTH = 496;

        public uint BlockLength
        {
            get { return (_Attributes & LENGTH_MASK) >> LENGTH_SHIFT; }
        }

        public uint ReservedBits
        {
            get { return (_Attributes & RESERVED_MASK) >> RESERVED_SHIFT; }
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
