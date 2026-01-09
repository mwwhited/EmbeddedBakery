using System;
using Microsoft.SPOT;

namespace WhitedUS.Graphics
{
    public struct Point
    {
        public int X;
        public int Y;

        public Point ByAngle(int angle, int dist)
        {
            return new Point()
            {
                X = this.X + (int)(dist * Microsoft.SPOT.Math.Cos(angle - 90) / 1000f),
                Y = this.Y + (int)(dist * Microsoft.SPOT.Math.Sin(angle - 90) / 1000f)
            };
        }
    }
}
