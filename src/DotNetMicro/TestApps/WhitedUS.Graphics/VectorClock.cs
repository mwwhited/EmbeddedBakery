using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Presentation;
using Microsoft.SPOT.Presentation.Media;

namespace WhitedUS.Graphics
{
    public class VectorClock
    {
        private Bitmap bmp;
        private readonly Point pnt;
        private readonly int max;
        public readonly int Width = 0;
        public readonly int Height = 0;

        public VectorClock(int width, int height)
        {
            this.Width = width;
            this.Height = height;
            this.bmp = new Bitmap(Width, Height);
            this.pnt = new Point() { X = Width / 2, Y = Height / 2 };
            this.max = System.Math.Min(pnt.X, pnt.Y) - 1;
            this.FaceBorder = Colors.Red;
            this.SecondHand = Colors.White;
            this.MinuteHand = Colors.Green;
            this.HourHand = Colors.Blue;
        }

        public VectorClock()
            : this( SystemMetrics.ScreenWidth, 
                    SystemMetrics.ScreenHeight)
        {
        }

        public Color FaceBorder { get; set; }
        public Color SecondHand { get; set; }
        public Color MinuteHand { get; set; }
        public Color HourHand { get; set; }

        public Bitmap ShowClock()
        {
            return this.ShowClock(DateTime.Now);
        }
        public Bitmap ShowClock(DateTime time)
        {
            bmp.Clear();
            bmp.DrawEllipse(this.FaceBorder, pnt.X, pnt.Y, max, max);

            var hourP = ((time.Hour % 12) * 30);// -90;
            var minuteP = (time.Minute * 6);// -90;
            var secondP = (time.Second * 6);// -90;

            var secondPnt = pnt.ByAngle(secondP, max);
            bmp.DrawLine(this.SecondHand, 50, pnt.X, pnt.Y, secondPnt.X, secondPnt.Y);

            var minutePnt = pnt.ByAngle(minuteP, max / 3 * 2);
            bmp.DrawLine(this.MinuteHand, 100, pnt.X, pnt.Y, minutePnt.X, minutePnt.Y);

            var hourPnt = pnt.ByAngle(hourP, max / 2);
            bmp.DrawLine(this.HourHand, 200, pnt.X, pnt.Y, hourPnt.X, hourPnt.Y);

            return bmp;
        }
    }
}
