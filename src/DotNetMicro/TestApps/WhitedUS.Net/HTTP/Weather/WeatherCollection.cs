using System;
using Microsoft.SPOT;
using System.Collections;

namespace WhitedUS.Net.HTTP.Weather
{
    public class WeatherCollection : IEnumerable, ICollection
    {
        private ArrayList _innerList = new ArrayList();

        public Weather this[int index]
        {
            get { return (Weather)_innerList[index]; }
            set { _innerList[index] = value; }
        }

        public void Add(Weather forcast)
        {
            _innerList.Add(forcast);
        }
        public void Remove(Weather forcast)
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
