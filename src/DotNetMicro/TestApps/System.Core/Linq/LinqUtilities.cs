using System;
using Microsoft.SPOT;
using System.Collections;

namespace System.Linq
{
    public static class LinqUtilities
    {
        public static IEnumerable Where(this IEnumerable e, Predicate p)
        {
            return new Filter(e, p);
        }

        public static int Count(this IEnumerable e)
        {
            var n = 0;
            foreach (var o in e)
                n++;
            return n;
        }

        public static object First(this IEnumerable e)
        {
            foreach (var o in e)
                return o;
            throw new Exception("IEnumerable \"e\" is empty");
        }

        public static object FirstOrDefault(this IEnumerable e)
        {
            foreach (var o in e)
                return o;
            return null;
        }

        public static IEnumerable Select(this IEnumerable source)
        {
            if (source == null)
            {
                throw new ArgumentNullException("source");
            }
            return source;
        }


    }
}
