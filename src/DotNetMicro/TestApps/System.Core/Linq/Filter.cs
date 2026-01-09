using System.Collections;

namespace System.Linq
{
    public sealed class Filter : IEnumerable
    {
        IEnumerable e;
        Predicate p;

        internal Filter(IEnumerable e, Predicate p)
        {
            this.e = e;
            this.p = p;
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return new Enumerator(e.GetEnumerator(), p);
        }
    }
}
