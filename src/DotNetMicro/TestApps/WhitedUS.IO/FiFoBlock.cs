#define ASYNC_ENABLE_

using System;
using System.Text;
using System.IO;
using System.Collections;
using System.Net.Sockets;
using System.Threading;

namespace WhitedUS.IO
{
    public class FiFoBlock : Stream
    {
        #region Constructors

        public FiFoBlock() { }

        #endregion

        /// TODO: MultiRead, Defragment, Rebalance, Inject, Paging

        #region Fields

        //private Thread _asyncWriteThread = null;

        private DEBlock _head;
        private DEBlock _tail;

        private long _currentLength;
        private DEBlock _currentBlock;
        private long _currentBlockPosition;
        private long _currentPosition;

        #endregion

        #region Properties

        public override bool CanRead { get { return true; } }

        public override bool CanSeek { get { return true; } }

        public override bool CanWrite { get { return true; } }

        public override long Position
        {
            get { return _currentPosition; }
            set { this.Seek(value, SeekOrigin.Begin); }
        }

        public override long Length { get { return _currentLength; } }

        #endregion

        #region Stream Methods

        public override void Flush() { }

        public override void SetLength(long value) { throw new NotImplementedException(); }

        public override int Read(byte[] buffer, int offset, int count)
        {
            lock (this)
            {
                if (buffer == null)
                    throw new ArgumentNullException("buffer");
                if (offset < 0)
                    throw new ArgumentOutOfRangeException("offset");
                if (count < 0)
                    throw new ArgumentOutOfRangeException("count");
                if ((buffer.Length - offset) < count)
                    throw new ArgumentException("Invaild offset & length");


                var workBlock = _currentBlock;
                if (workBlock == null)
                {
                    _currentBlock = _tail;
                    if (_currentBlock != null)
                        _currentBlockPosition = _currentBlock.Data.Length;
                    _currentPosition = _currentLength;
                    return -1;
                }
                if (_currentPosition >= _currentLength)
                    return -1;

                int workPos = (int)_currentBlockPosition;
                int workCount = count;
                int workLength = workPos + workCount;
                int workOffset = offset;
                int workTotal = (int)_currentPosition;
                int workGrab = 0;

                int workGet = 0;

                while (workCount > 0)
                {
                    workGet = Math.Min(workBlock.Data.Length - workPos, workCount);
                    if (workGet > 0)
                    {
                        Array.Copy(workBlock.Data, workPos, buffer, workOffset, workGet);
                        workCount -= workGet;
                        workPos += workGet;
                        workOffset += workGet;
                        workTotal += workGet;
                        workGrab += workGet;
                    }
                    if (workPos >= workBlock.Data.Length)
                    {
                        workPos -= workBlock.Data.Length;
                        workBlock = workBlock.Tail;

                        this.TruncateBefore();

                        if (workBlock == null)
                            break;
                    }
                }

                _currentBlock = workBlock;
                _currentBlockPosition = workPos;
                _currentPosition = workTotal;

                return workGrab;
            }
        }

        public override long Seek(long offset, SeekOrigin origin)
        {
            lock (this)
            {
                var workBlock = _currentBlock;
                var workPosition = _currentPosition;
                var workBlockPosition = _currentBlockPosition;

                if (workBlock == null)
                {
                    workBlock = _head;
                    workPosition = 0;
                    workBlockPosition = 0;
                }

                //find offset
                switch (origin)
                {
                    case SeekOrigin.Begin:
                        if (offset < 0)
                            throw new ArgumentOutOfRangeException("offset must be >= 0 when searching from the begining");

                        workBlock = _head;
                        workBlockPosition = 0;
                        workPosition = 0;

                        break;

                    default:
                    case SeekOrigin.Current:
                        break;

                    case SeekOrigin.End:
                        if (offset > 0)
                            throw new ArgumentOutOfRangeException("offset must be <= 0 when searching from end");

                        workBlock = _tail;
                        workBlockPosition = _tail.Data.Length;
                        workPosition = _currentLength;
                        break;
                }

                if (workBlock == null)
                    return 0;
                //throw new InvalidOperationException("No Data in Stream");

                //Seek to position
                workBlockPosition += offset;
                workPosition += offset;
                while (true)
                {
                    if (workBlockPosition < 0)
                    {
                        if (workBlock.Head == null)
                            throw new ArgumentOutOfRangeException("offset past beginning of stream");

                        workBlock = workBlock.Head;
                        workBlockPosition += workBlock.Data.Length;
                    }
                    else if (workBlockPosition > workBlock.Data.Length)
                    {
                        if (workBlock.Tail == null)
                            throw new ArgumentOutOfRangeException("offset past end of stream");

                        workBlockPosition -= workBlock.Data.Length;
                        workBlock = workBlock.Tail;
                    }
                    else
                        break;
                }

                _currentBlock = workBlock;
                _currentBlockPosition = workBlockPosition;
                _currentPosition = workPosition;
                return _currentPosition;
            }
        }

        public override void Write(byte[] buffer, int offset, int count)
        {
            lock (this)
            {
                byte[] dataBuffer = null;
                if (buffer == null || buffer.Length == 0 || offset < 0 || count <= 0)
                    return;

                int chunkStart = Math.Min(buffer.Length, offset);
                int chunkLength = Math.Min(buffer.Length - chunkStart, count);
                dataBuffer = new byte[chunkLength];
                Array.Copy(buffer, chunkStart, dataBuffer, 0, chunkLength);

                _currentLength += dataBuffer.Length;

                if (_head == null)
                {
                    _head = new DEBlock()
                    {
                        Head = null,
                        Data = dataBuffer,
                        Tail = null
                    };
                    _tail = _head;
                }
                else
                {
                    if (_tail == null)
                        throw new InvalidOperationException();

                    var newBlock = new DEBlock()
                    {
                        Head = _tail,
                        Data = dataBuffer,
                        Tail = null
                    };
                    _tail.Tail = newBlock;
                    _tail = newBlock;
                }
            }
        }

        #endregion

        public void TruncateBefore()
        {
            lock (this)
            {
                if (_currentBlock == null ||
                    _currentBlock == _head ||
                    _currentBlock.Head == null)
                    return;

                this._currentBlock.Head.Tail = null;
                this._currentBlock.Head = null;

                var workLength = 0L;
                var workHead = _head;
                while (workHead != null)
                {
                    workLength += workHead.Data.Length;
                    workHead = workHead.Tail;
                }
                this._head.Dispose();
                this._head = _currentBlock;

                var lastLength = _currentLength;
                _currentLength -= workLength;
                _currentPosition -= workLength;
                if (_currentPosition <= 0)
                    _currentPosition = _currentBlockPosition;
            }
        }

#if ASYNC_ENABLE
        public void AsyncWrite(Stream input) { this.AsyncWrite(input, 1024); }
        public void AsyncWrite(Stream input, int bufferSize)
        {
            if (_asyncWriteThread != null)
                throw new InvalidOperationException("stream is already in asyncwrite mode");

            if (input == null)
                return;

            int bufferLen = 0;
            byte[] buffer = new byte[bufferSize];

            do
            {
                if (input.CanRead)
                    bufferLen = input.Read(buffer, 0, bufferSize);
                if (bufferLen > 0)
                    this.Write(buffer, 0, bufferLen);
            } while (bufferLen >= 0);
        }

        public void AsyncWrite(NetworkStream input) { this.AsyncWrite(input, 1024); }
        public void AsyncWrite(NetworkStream input, int bufferSize)
        {
            if (_asyncWriteThread != null)
                throw new InvalidOperationException("stream is already in asyncwrite mode");

            _asyncWriteThread = new Thread(new ThreadStart(
                delegate()
                {
                    if (input == null)
                        return;

                    int bufferLen = 0;
                    byte[] buffer = new byte[bufferSize];

                    do
                    {
                        if (input.CanRead && input.DataAvailable)
                            bufferLen = input.Read(buffer, 0, bufferSize);
                        if (bufferLen > 0)
                            this.Write(buffer, 0, bufferLen);
                    } while (bufferLen >= 0 && input.DataAvailable);
                }));
            _asyncWriteThread.Start();
        }

        public void EndAsyncWrite()
        {
            if (_asyncWriteThread == null)
                return;

            try
            {
                _asyncWriteThread.Abort();
            }
            catch { }
            _asyncWriteThread.Join();
        }
#endif
    }
}
