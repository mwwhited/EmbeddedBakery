using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using Microsoft.SPOT.Input;
using Microsoft.SPOT.Presentation;
using WhitedUS.Adapters;
using WhitedUS.Devices;

namespace WhitedUS.UI
{
    public class WindowController
    {
        static WindowController()
        {
            // ==== Sets time based on SNTP or RTC ====
            try
            {
                DateTimeAdapter.Init();
            }
            catch (Exception ex)
            {
                Debug.Print(ex.Message);
            }
            // ==== Mute radio on boot ====
            try
            {
                AR1010.Instance.Mute();
            }
            catch (Exception ex)
            {
                Debug.Print(ex.Message);
            }
        }

        private static WindowController _instance = null;
        public static WindowController Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new WindowController();
                return _instance;
            }
        }

        private delegate void DoWork();
        private Window[] windows = null;

        public readonly int Count = (int)States.Max;
        public readonly GPIOButtonInputProvider inputProvider = new GPIOButtonInputProvider(null);

        private WindowController()
        {
            windows = new Window[this.Count];
        }

        public static Window Window(States window)
        {
            return Instance.GetWindow(window);
        }
        public Window GetWindow(States window)
        {
            var selectedWindow = windows[(int)window];
            if (selectedWindow == null)
            {
                switch (window)
                {
                    case States.Clock:
                        selectedWindow = new DisplayClock();
                        break;
                    case States.Weather:
                        selectedWindow = new WeatherReport();
                        break;
                    case States.Radio:
                        selectedWindow = new DisplayRadio();
                        break;
                    case States.Contacts:
                        selectedWindow = new DisplayContact();
                        break;
                    case States.Appointments :
                        selectedWindow = new DisplayAppointments();
                        break;
                    default:
                        throw new InvalidOperationException();
                }
                windows[(int)window] = selectedWindow;
                selectedWindow.AddHandler(Buttons.ButtonUpEvent, new ButtonEventHandler(OnButtonUp), false);
            }
            return selectedWindow; 
        }

        public static Window Window(ref int index)
        {
            return Instance.GetWindow(ref index);
        }
        public Window GetWindow(ref int index)
        {
            if (index >= windows.Length)
                index = 0;
            else if (index < 0)
                index = windows.Length - 1;

            var selectedWindow = GetWindow((States)index);

            for (int i = 0; i < windows.Length; i++)
            {
                var worker = windows[i];
                if (worker != null)
                {
                    worker.Visibility = (i == index) ? Visibility.Visible : Visibility.Hidden;
                    worker.Dispatcher.BeginInvoke(new DoWork(worker.Invalidate));
                }
            }

            Buttons.Focus(selectedWindow);
            return selectedWindow;
        }
        public static Window Window()
        {
            return Instance.GetWindow();
        }
        public Window GetWindow()
        {
            return GetWindow(ref windowPointer);
        }

        private int windowPointer = 0;
        private int lastWindowPointer = 0;
        private void OnButtonUp(object sender, ButtonEventArgs e)
        {
            var sWindow = sender as Window;
            var cWindow = GetWindow();

            if (sWindow != null && cWindow != null && sWindow == cWindow)
            {
#if false   //set this to true for testing in emulator
                if (e.Button == SupportedButtons.Left) windowPointer++;
                if (e.Button == SupportedButtons.Right) windowPointer--;
#else
                if (e.Button == SupportedButtons.Escape) windowPointer++;
                if (e.Button == SupportedButtons.Menu) windowPointer--;
#endif
                if (lastWindowPointer != windowPointer)
                {
                    var aWindow = GetWindow(ref windowPointer);
                    if (lastWindowPointer != windowPointer)
                    {
                        var activator = aWindow as IActivator;
                        if (activator != null)
                            activator.DoActivate(sender, e);
                        lastWindowPointer = windowPointer;
                    }
                }
                else
                {
                    var buttonController = cWindow as IButtonController;
                    if (buttonController != null)
                        buttonController.OnButtonUp(sender, e);
                }

                // Print the button code to the Visual Studio output window.
                //Debug.Print("e.Button: " + e.Button.ToString());
            }
        }

    }
}
