using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Presentation;
using WhitedUS.Graphics;
using Microsoft.SPOT.Presentation.Media;
using Microsoft.SPOT.Input;
using System.Threading;

namespace WhitedUS.UI.Controls
{
    public class Clock : UIElement, IDeactivator, IActivator
    {
        private VectorClock vectorClock;
        private Thread loop;

        public Clock() :
            this(SystemMetrics.ScreenWidth, SystemMetrics.ScreenHeight)
        {
        }

        public Clock(int width, int height)
        {
            this.InvalidateMeasure();
            vectorClock = new VectorClock(width, height);
            loop = new Thread(InvalidateImage);
            loop.Start();
        }

        ~Clock()
        {
            try
            {
                if (loop != null)
                {
                    loop.Abort();
                    loop.Join();
                    loop = null;
                }
            }
            catch (Exception ex)
            {
                Debug.Assert(true, ex.ToString());
            }
       }

        #region Other Thread

        private void InvalidateImage()
        {
            while (true)
            {
                var check = this.Dispatcher.BeginInvoke(new InvokeInvalidateHandler(InvokeInvalidate));
                Thread.Sleep(500);
            }
        }

        private delegate void InvokeInvalidateHandler();

        private void InvokeInvalidate()
        {
            this.Invalidate();
        }

        #endregion

        protected override void MeasureOverride(int availableWidth, int availableHeight, out int desiredWidth, out int desiredHeight)
        {
            desiredWidth = vectorClock.Width;
            desiredHeight = vectorClock.Height;
        }

        public override void OnRender(DrawingContext dc)
        {
            dc.DrawImage(this.vectorClock.ShowClock(), 0, 0);
        }

        protected override void OnGotFocus(FocusChangedEventArgs e)
        {
            if (loop != null && loop.ThreadState == ThreadState.Suspended)
                loop.Resume();
            base.OnGotFocus(e);
        }

        protected override void OnLostFocus(FocusChangedEventArgs e)
        {
            if (loop != null && loop.ThreadState == ThreadState.Running)
                loop.Suspend();
            base.OnLostFocus(e);
        }


        #region IDeactivator Members

        public void DoDeactivate(object sender, EventArgs e)
        {
            var f = e as FocusChangedEventArgs;
            if (f != null)
                OnLostFocus(f);
        }

        #endregion

        #region IActivator Members

        public void DoActivate(object sender, EventArgs e)
        {
            var f = e as FocusChangedEventArgs;
            if (f != null)
                OnGotFocus(f);
        }

        #endregion
    }
}
