using System;

namespace DeviceSolutions.SPOT
{
    /// <summary>Simple class for representing a point in 2D space.</summary>
    public struct Point
    {
        /// <summary>Creates a new point with specified coordinates</summary>
        /// <param name="x">x position</param>
        /// <param name="y">y position</param>
        public Point(int x, int y)
        {
            this.x = x;
            this.y = y;
        }

        /// <summary>Horizontal position of the point</summary>
        public int x;

        /// <summary>Vertical position of the point</summary>
        public int y;

        /// <summary>Determines the distance between this point and an arbitraryt point</summary>
        /// <param name="P2">The point to determine the distance from</param>
        /// <returns>Truncated integer distance between this point's position and the position of P2</returns>
        public int DistanceFrom(Point P2)
        {
            uint dx = (uint)System.Math.Abs(this.x - P2.x);
            uint dy = (uint)System.Math.Abs(this.y - P2.y);
            return isqrt((dx * dx) + (dy * dy));
        }

        /// <summary>Creates a new random point between (0,0)[inclusive] and (MaxX, MaxY)[Exclusive]</summary>
        /// <param name="MaxX">Maximum allowed x value</param>
        /// <param name="MaxY">Maximum allowed y value</param>
        /// <returns>New random point</returns>
        public static Point RandomPoint(int MaxX, int MaxY)
        {
            return new Point(Microsoft.SPOT.Math.Random(MaxX), Microsoft.SPOT.Math.Random(MaxY));
        }

        /// <summary>Converts the Point to a human readable string</summary>
        /// <returns>Point as a string</returns>
        public override string ToString()
        {
            return "(" + x.ToString() + ", " + y.ToString() + " )";
        }

        #region Operator overloads
        /// <summary>Gets a Hash code for the point</summary>
        /// <returns>hash code</returns>
        public override int GetHashCode()
        {
            return x ^ y;
        }

        /// <summary>Compares this Point with another one</summary>
        /// <param name="obj">object that must be convertable to Point</param>
        /// <returns>true if the coordinates are identical</returns>
        public override bool Equals(object obj)
        {
 	         return obj is Point && this == (Point)obj;
        }

        /// <summary>Compares two points</summary>
        /// <param name="L">Left side of comparison</param>
        /// <param name="R">Right side of comparison</param>
        /// <returns>true if the coordinates are identical</returns>
        public static bool operator==(Point L, Point R)
        {
            // Check for null and compare run-time types.
            return (L.x == R.x) && (L.y == R.y);
        }

        /// <summary>Compares this Point with another one</summary>
        /// <param name="L">Left side of comparison</param>
        /// <param name="R">Right side of comparison</param>
        /// <returns>true if the coordinates are identical</returns>
        public static bool operator!=(Point L, Point R)
        {
            // Check for null and compare run-time types.
            return (L.x != R.x) || (L.y != R.y);
        }

        /// <summary>Adds 2 points together</summary>
        /// <param name="a">left hand side of addition</param>
        /// <param name="b">right hand side of the addition</param>
        /// <returns>New point with summed axes values</returns>
        /// <remarks>
        /// Provides operator overload for adding two points together 
        /// to form an offset position.
        /// </remarks>
        public static Point operator +(Point a, Point b)
        {
            return new Point(a.x + b.x, a.y + b.y);
        }

        /// <summary>subtracts 2 points </summary>
        /// <param name="a">left hand side of addition</param>
        /// <param name="b">right hand side of the addition</param>
        /// <returns>New point with result of subtraction on each axis</returns>
        /// <remarks>
        /// Provides operator overload for subtracting two points
        /// to form an offset position.
        /// </remarks>
        public static Point operator -(Point a, Point b)
        {
            return new Point(a.x - b.x, a.y - b.y);
        }
        #endregion

        #region Internal Implementation
        /// <summary>Computes an integer square root</summary>
        /// <param name="a">value to take the quare root of</param>
        /// <returns>Square root of the parameter a</returns>
        /// <remarks>
        /// <para>Computes an integer square root. Unfortunately, the
        /// .Net Micro Framework does not have any Square root function
        /// in System.Math nor in Microsoft.SPOT.Math.</para>
        /// 
        /// <para>Algoritm from:</para>
        /// Jack Crenshaw, Embedded Systems Programming magazine
        /// </remarks>
        private static ushort isqrt(uint a)
        {
            uint rem = 0;
            uint root = 0;
            uint divisor = 0;
            for(int i = 0; i < 16; i++)
            {
                root <<= 1;
                rem = ((rem << 2) + (a >> 30));
                a <<= 2;
                divisor = (root << 1) + 1;
                if(divisor <= rem)
                {
                    rem -= divisor;
                    root++;
                }
            }
            return (ushort)(root);
        }
        #endregion
    }
}