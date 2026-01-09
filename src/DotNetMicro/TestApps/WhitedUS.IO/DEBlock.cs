using System;
using Microsoft.SPOT;

namespace WhitedUS.IO
{
    [Serializable]
    internal sealed class DEBlock : IDisposable
    {
        public DEBlock() { }

        private bool _isDisposing = false;
        [NonSerialized]
        public DEBlock Head;
        public byte[] Data;
        public DEBlock Tail;

        public DEBlock Root { get { return this.Head == null ? this : this.Root; } }

        #region IDisposable Members

        ~DEBlock() { this.Dispose(); }

        public void Dispose()
        {
            if (this._isDisposing)
                return;

            this._isDisposing = true;
            if (this.Head != null)
            {
                this.Head.Dispose();
                this.Head = null;
            }
            this.Data = null;
            if (this.Tail != null)
            {
                this.Tail.Dispose();
                this.Tail = null;
            }
        }

        #endregion
    }
}
