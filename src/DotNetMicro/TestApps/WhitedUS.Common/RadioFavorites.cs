using System;
using Microsoft.SPOT;
using System.Collections;

namespace WhitedUS.Common
{
    [Serializable]
    public class RadioFavorites : ICollection, IEnumerable, ICloneable //IList
    {
        public RadioFavorites() { }
        private RadioFavorites(ArrayList items)
        {
            if (items != null)
                _items = items;
        }

        private ArrayList _items = new ArrayList();

        public virtual int Capacity
        {
            get { return _items.Capacity; }
            set { _items.Capacity = value; }
        }
        public virtual int Count
        {
            get { return _items.Count; }
        }
        public virtual bool IsFixedSize
        {
            get { return _items.IsFixedSize; }
        }
        public virtual bool IsReadOnly
        {
            get { return _items.IsReadOnly; }
        }
        public virtual bool IsSynchronized
        {
            get { return _items.IsSynchronized; }
        }
        public virtual object SyncRoot
        {
            get { return _items.Count; }
        }

        public virtual ushort this[int index]
        {
            get { return (ushort)_items[index]; }
            set { _items[index] = value; }
        }

        public virtual int Add(ushort value)
        {
            return _items.Add(value);
        }
        public virtual int BinarySearch(ushort value, IComparer comparer)
        {
            return _items.BinarySearch(value, comparer);
        }
        public virtual void Clear()
        {
            _items.Clear();
        }
        public virtual object Clone()
        {
            return new RadioFavorites(_items.Clone() as ArrayList);
        }
        public virtual bool Contains(ushort item)
        {
            return _items.Contains(item);
        }
        public virtual void CopyTo(Array array)
        {
            _items.CopyTo(array);
        }
        public virtual void CopyTo(Array array, int arrayIndex)
        {
            _items.CopyTo(array, arrayIndex);
        }
        public virtual IEnumerator GetEnumerator()
        {
            return _items.GetEnumerator();
        }
        public virtual int IndexOf(ushort value)
        {
            return _items.IndexOf(value);
        }
        public virtual int IndexOf(ushort value, int startIndex)
        {
            return _items.IndexOf(value, startIndex);
        }
        public virtual int IndexOf(ushort value, int startIndex, int count)
        {
            return _items.IndexOf(value, startIndex, count);
        }
        public virtual void Insert(int index, ushort value)
        {
            _items.Insert(index, value);
        }
        public virtual void Remove(ushort obj)
        {
            _items.Remove(obj);
        }
        public virtual void RemoveAt(int index)
        {
            _items.RemoveAt(index);
        }
        public virtual ushort[] ToArray()
        {
            return (ushort[])_items.ToArray(typeof(ushort));
        }
        public virtual Array ToArray(Type type)
        {
            return _items.ToArray(type);
        }
    }
}
