using System;

using Microsoft.SPOT;
using Microsoft.SPOT.Input;
using Microsoft.SPOT.Hardware;
using Microsoft.SPOT.Presentation;
using Microsoft.SPOT.Presentation.Media;

using DeviceSolutions.SPOT.Hardware;
using FusionWare.SPOT.Hardware;

namespace BallInMazeV2 {
    /// <summary>Core apllication object for the application</summary>
    public class App : FusionWare.SPOT.Application {
        #region Application Entry Point
        /// <summary>Main entry point for the application</summary>
        public static void Main() {
        reset:
            bool reset = false;
            try {   // Init and run the application main window
                App theApp = new App();
                theApp.Run(theApp.MainWindow);
            }
            catch {
                reset = true;
            }
            if (reset)
                goto reset;
        }
        #endregion

        #region Constructor
        /// <summary>Constructor for the application object</summary>
        /// <remarks>
        /// Creates a new Full Screen BouncyViewWindow as the
        /// main window for the application.
        /// </remarks>
        App()
            : base(App.ButtonDefs) {
            this.MainWindow = new MainViewWindow();
            this.MainWindow.Height = SystemMetrics.ScreenHeight;
            this.MainWindow.Width = SystemMetrics.ScreenWidth;
        }
        #endregion

        #region Button Definitions
        /// <summary>Button Definitions for this application</summary>
        /// <remarks>
        /// For Demo purposes defines all the directions and select button. 
        /// Currently the only one actually used in this application is the select button.
        /// </remarks>
        static ButtonDefinition[] ButtonDefs = {
                new ButtonDefinition(Button.VK_UP, true),
                new ButtonDefinition(Button.VK_SELECT, false),
                new ButtonDefinition(Button.VK_HOME, true) 
        };
        #endregion
    }
}
