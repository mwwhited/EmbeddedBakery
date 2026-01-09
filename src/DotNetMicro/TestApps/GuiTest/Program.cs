using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using Microsoft.SPOT.Input;
using Microsoft.SPOT.Presentation;
using Microsoft.SPOT.Presentation.Controls;
using Microsoft.SPOT.Presentation.Media;
using WhitedUS.UI;
using WhitedUS.Common.Configuration;

namespace GuiTest
{
    public class Program : Microsoft.SPOT.Application
    {
        public static void Main()
        {
            Program myApplication = new Program();

            Window mainWindow = WindowController.Window(States.Appointments);

            // Start the application
            myApplication.Run(mainWindow);
        }

    }
}
