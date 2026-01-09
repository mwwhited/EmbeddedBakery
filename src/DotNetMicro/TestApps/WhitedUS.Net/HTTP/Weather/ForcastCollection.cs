using System;
using Microsoft.SPOT;
using System.Collections;

namespace WhitedUS.Net.HTTP.Weather
{
    public class ForcastCollection : IEnumerable, ICollection
    {
        private ArrayList _innerList = new ArrayList();

        public Forcast this[int index]
        {
            get { return (Forcast)_innerList[index]; }
            set { _innerList[index] = value; }
        }

        public void Add(Forcast forcast)
        {
            _innerList.Add(forcast);
        }
        public void Remove(Forcast forcast)
        {
            _innerList.Remove(forcast);
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
