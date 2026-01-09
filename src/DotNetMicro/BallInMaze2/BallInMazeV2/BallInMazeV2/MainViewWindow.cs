using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using System.Threading;
using DeviceSolutions.SPOT;
using Microsoft.SPOT.Input;
using Microsoft.SPOT.Presentation;
using Microsoft.SPOT.Presentation.Media;
using Microsoft.SPOT.Presentation.Controls;

namespace BallInMazeV2
{
    /// <summary>Main Window For the application</summary>
    /// <remarks>
    /// This Window acts as the container and controller for the MazeView.
    /// It creates the child MazeView and provides the animation timer
    /// </remarks>
    public class MainViewWindow : Window
    {  
        MazeWithBall Maze;
        IPanTiltProvider Provider;
        MazeView MazeView;

                
        /// <summary> Constructor for the window</summary>
        public MainViewWindow()
        {
            this.Provider = PanTiltData.GetProvider();
            this.Maze = new MazeWithBall(16, 11, Provider);
            this.MazeView = new MazeView( this.Maze );
            this.Child = MazeView;
            this.Child.HorizontalAlignment = HorizontalAlignment.Stretch;
            this.Child.VerticalAlignment = VerticalAlignment.Stretch;
            StartTimer();
        }

        /// <summary>Handles Button donw events for the class</summary>
        /// <param name="e">args identifying the button event</param>
        /// <remarks>
        /// This method generates a new maze when the "select" button is pressed
        /// </remarks>
        protected override void OnButtonDown(ButtonEventArgs e)
        {
            if(e.Button == Button.VK_SELECT)
            {
                this.Maze.RegenerateMaze();
                e.Handled = true;
            }
            if( e.Button == Button.VK_HOME )
            {
                this.Provider.Calibrate();
                e.Handled = true;
            }
            if( e.Button == Button.VK_UP )
            {
                this.MazeView.ChangeBall();
                
                e.Handled = true;
            }
        }

        #region Animation Timer
        private Thread TimerThread;

        /// <summary>Starts the timer thread for the animation</summary>
        void StartTimer()
        {
            TimerThread = new Thread(new ThreadStart(TimerThreadProc));
            TimerThread.Start();
        }
        
        delegate void VoidProc();

        /// <summary>Thread for the animation timer</summary>
        /// <remarks>
        /// This thread simply invokes the maze.UpdateTick() handler)
        /// sleeps for 25ms and then calls it again in a continuous loop
        /// until the thread is shutdown.
        /// </remarks>
        void TimerThreadProc()
        {
            // Don't bother with an invoke if the thread state indicates 
            // something other than the running state (e.g. StopRequested)
            while(this.TimerThread.ThreadState == ThreadState.Running)
            {
                DispatcherOperation op = this.Dispatcher.BeginInvoke(new VoidProc(this.Maze.UpdateTick));
                op.Wait();
                Thread.Sleep(25);
            }
        }
        #endregion
    }
}
