using System.Threading;
using Microsoft.SPOT;
using Microsoft.SPOT.Presentation;
using WhitedUS.UI;
using WhitedUS.Common.Configuration;
using WhitedUS.Common;

namespace VS1302sinTest
{
    public class Program : Microsoft.SPOT.Application
    {
        public static void Main()
        {
            //==== Prevents infinite loops from blocking the debugger ====
            Debug.Print("WAIT!!!");
            Thread.Sleep(5000);
            Debug.Print("GO!!!");

            //==== App Body ====
            Program myApplication = new Program();
            Window mainWindow = WindowController.Window();

            // Start the application
            myApplication.Run(mainWindow);
        }

    }
}
