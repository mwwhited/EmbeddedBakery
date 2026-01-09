using System;
using Microsoft.SPOT;
using System.Collections;

namespace WhitedUS.Net.HTTP.Outlook
{
    public class Contacts : IEnumerable, ICollection
    {
        public int Take { get; set; }
        public int Skip { get; set; }
        public int Total { get; set; }

        private ArrayList _innerList = new ArrayList();

        public Contact this[int index]
        {
            get { return (Contact)_innerList[index]; }
            set { _innerList[index] = value; }
        }

        public void Add(Contact item)
        {
            _innerList.Add(item);
        }
        public void Remove(Contact item)
        {
            _innerList.Remove(item);
        }

        #region IEnumerable Members

        public IEnumerator GetEnumerator()
        {
            return _innerList.GetEnumerator();
        }

        #endregion

        #region ICollection Members

        public void CopyTo(Array array, int index)
        {
            _innerList.CopyTo(array, index);
        }

        public int Count
        {
            get { return _innerList.Count; }
        }

        public bool IsSynchronized
        {
            get { return _innerList.IsSynchronized; }
        }

        public object SyncRoot
        {
            get { return _innerList.SyncRoot; }
        }

        #endregion
    }
}
