/*
 * MP3 Shoutcast client with VS1002 Decoder. 
 * 
 * This program lets the user select a radiostation. 
 * It connects and streams the MP3 data to the VS1002 device. 
 * It contains a simple FIFO implementation.
 * 
 * @copyright (c) 2008 EFR Kool
 * @licence: Creative Commons, Attribution-Share Alike 3.0 Netherlands, http://creativecommons.org/licenses/by-sa/3.0/nl/deed.en
 * 
 */

using System;
using System.Threading;

using Microsoft.SPOT;
using Microsoft.SPOT.Input;
using Microsoft.SPOT.Presentation;
using Microsoft.SPOT.Presentation.Controls;
using Microsoft.SPOT.Presentation.Shapes;
using Microsoft.SPOT.Presentation.Media;

namespace MP3Client
{

    public class Program : Microsoft.SPOT.Application
    {
       
        /// <summary>
        /// Starting point for our app
        /// </summary>
        public static void Main()
        {
            // Start System Manager
            GHIElectronics.System.SystemManager.Start(null);

            // Create Application
            Program myApplication = new Program();

            // Create mainWindow
            Window mainWindow = myApplication.CreateWindow();

            // Create the object that configures the GPIO pins to buttons.
            GPIOButtonInputProvider inputProvider = new GPIOButtonInputProvider(null);

            // Open VS1200
            VS1002.Initialize();

            // Start the application
            myApplication.Run(mainWindow);

            // Close VS1200
            VS1002.Shutdown();

        }

        /// <summary>
        /// Main program window. Displays a list of radio stations to choose from
        /// </summary>
        private Window mainWindow;

        /// <summary>
        /// Canvas for main program window
        /// </summary>
        private Canvas mainWindowCanvas;

        /// <summary>
        /// Listbox used for selection of radio station
        /// </summary>
        private ListBox lstRadioStations;


        /// <summary>
        /// Radiostation Class. Holds information for a radiostation
        /// </summary>
        class RadioStation
        {
            /// <summary>
            /// Title of station
            /// </summary>
            public String Title;

            /// <summary>
            /// Host for radiostation
            /// </summary>
            public String Host;

            /// <summary>
            /// Port for radiostation
            /// </summary>
            public Int32 Port;

            /// <summary>
            /// Path for stream. Always starts with '/' 
            /// </summary>
            public String Path;

            /// <summary>
            /// Constructor
            /// </summary>
            /// <param name="nTitle">Title</param>
            /// <param name="nHost">Host</param>
            /// <param name="nPort">Port</param>
            /// <param name="nPath">Stream Path</param>
            public RadioStation(String nTitle, String nHost, Int32 nPort, String nPath)
            {
                Title = nTitle;
                Host = nHost;
                Port = nPort;
                Path = nPath;
            }
        }

        /// <summary>
        /// List of radiostations.
        /// </summary>
        private RadioStation[] Stations = 
        {
            new RadioStation("Veronica","217.196.35.28", 80, "/mp3/radioveronica"),
            new RadioStation("Radio 1NL","shoutcast2.omroep.nl",8100,"/"),
            new RadioStation("Radio 2NL","shoutcast2.omroep.nl",8102,"/"),
            new RadioStation("3FM","shoutcast2.omroep.nl",8104,"/"),
            new RadioStation("Radio 4NL","shoutcast2.omroep.nl",8106,"/"),
            new RadioStation("Radio 538","82.201.100.9",8000,"/radio538"),
            new RadioStation("Q-music","live1.prostream.nl",8000,"/qmusic"),
            new RadioStation("80's Disco classics","64.62.252.130",8100,"/"),
            new RadioStation("1.FM Heavy Metal","66.220.3.52",8035,"/"),
            new RadioStation("1.FM Country","64.62.194.11",8020,"/")
            
         };



        ///////////////////////////////////////////////////////////////////////////////////////////
        ///
        ///                 Main Window -> Select Radio Station
        ///
        ///////////////////////////////////////////////////////////////////////////////////////////

        public Window CreateWindow()
        {
            // Create a window object and set its size to the
            // size of the display.
            mainWindow = new Window();
            mainWindow.Height = SystemMetrics.ScreenHeight;
            mainWindow.Width = SystemMetrics.ScreenWidth;
            mainWindow.Background = new SolidColorBrush(Colors.BackColor);

            // First make basic Canvas object
            mainWindowCanvas = new Canvas();

            // Add Radio Stations List to Canvas
            lstRadioStations = new ListBox();
            lstRadioStations.Width = 128;
            lstRadioStations.Height = 64;

            Canvas.SetLeft(lstRadioStations, 0);
            Canvas.SetTop(lstRadioStations, 0);
            mainWindowCanvas.Children.Add(lstRadioStations);

            // Add ButtonUp event to radio station list
            lstRadioStations.AddHandler(Buttons.ButtonUpEvent, new ButtonEventHandler(LstButtonUp), false);
            
            // Add Radio Stations to List
            for (int i = 0; i < Stations.Length ; i++)
            {
                SelectTextListItem Item = new SelectTextListItem(((int)(i + 1)).ToString() + ". " + Stations[i].Title);
                lstRadioStations.Items.Add(Item);
            }

            // Select first item
            lstRadioStations.SelectedIndex = 0;

            // Add canvas control to the window.
            mainWindow.Child = mainWindowCanvas;

            // Set the window visibility to visible.
            mainWindow.Visibility = Visibility.Visible;

            // Attach the button focus to the Radio List.
            Buttons.Focus(lstRadioStations);

            return mainWindow;
        }

        /// <summary>
        /// Event handler for Station Selectbox
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void LstButtonUp(object sender, ButtonEventArgs e)
        {
            if (e.Button == Button.Select)
            {
                while (Buttons.IsButtonDown(Button.Select)) { Thread.Sleep(10); }

                showListenRadioDialog(Stations[lstRadioStations.SelectedIndex]);
            }
        }



        ///////////////////////////////////////////////////////////////////////////////////////////
        ///
        ///                 ListenRadioDialog Window -> Radio Station Information
        ///
        ///////////////////////////////////////////////////////////////////////////////////////////

        /// <summary>
        /// Window for displaying details while playing
        /// </summary>
        private Window ListenRadioDialog;

        /// <summary>
        /// Canvas object for Listen Radio Dialog
        /// </summary>
        private Canvas ListenRadioDialogCanvas;

        /// <summary>
        /// Stackpanel to stack the lines of details
        /// </summary>
        private StackPanel RadioInfoStackPanel;

        /// <summary>
        /// Radio client. Used for recieving radio stream
        /// </summary>
        private MP3RadioClient RadioClient;
        
        /// <summary>
        /// Thread for RadiClient->PollForData
        /// </summary>
        private Thread DoListenRadio;

        /// <summary>
        /// Start time for radio 
        /// </summary>        
        private DateTime StartTime;

        /// <summary>
        /// Current time
        /// </summary>
        private DateTime CurrentTime;

        /// <summary>
        /// When displaying a message we don't want it to dissapear right away so 
        /// this var tells us when we can show another text
        /// </summary>
        private DateTime MessageTime = DateTime.Now;

        /// <summary>
        /// Delegate for closing Listen Radio Dialog
        /// </summary>
        /// <param name="Sender">Sender</param>
        public delegate void CloseListenRadioDialogDelegate(Object Sender);

        /// <summary>
        /// Delegate for Updating Listen Window Text
        /// </summary>
        /// <param name="Text1">Text for LCD line 1</param>
        /// <param name="Text2">Text for LCD line 2</param>
        /// <param name="Text3">Text for LCD line 3</param>
        public delegate void UpdateDialogText(String Text1, String Text2, String Text3);

        /// <summary>
        /// Show Listen to Radio Dialog
        /// </summary>
        /// <param name="SelectedRadioStation"></param>
        private void showListenRadioDialog(RadioStation SelectedRadioStation)
        {
            // Create Listen Dialog
            ListenRadioDialog = new Window();
            ListenRadioDialog.Height = SystemMetrics.ScreenHeight;
            ListenRadioDialog.Width = SystemMetrics.ScreenWidth;
            ListenRadioDialog.Background = new SolidColorBrush(Colors.BackColor);

            // Create Main Canvas
            ListenRadioDialogCanvas = new Canvas();

            // Dialog Title - Canvas
            Canvas WindowTitlePanel = new Canvas();
            WindowTitlePanel.Height = Fonts.bigFont.Height+4;
            WindowTitlePanel.Width = ListenRadioDialog.Width;

            // Dialog Title - Rectangle for background
            Rectangle WindowTitleBack = new Rectangle();
            WindowTitleBack.Width = WindowTitlePanel.Width;
            WindowTitleBack.Height = WindowTitlePanel.Height;
            WindowTitleBack.Fill = new SolidColorBrush(Colors.ForeColor);
            Canvas.SetTop(WindowTitleBack, 0); Canvas.SetLeft(WindowTitleBack, 0); 
            WindowTitlePanel.Children.Add(WindowTitleBack);

            // Dialog Title - Text
            Text WindowTitleText = new Text(Fonts.bigFont,SelectedRadioStation.Title);
            WindowTitleText.Width = WindowTitlePanel.Width;
            WindowTitleText.Height = WindowTitlePanel.Height;
            WindowTitleText.ForeColor = Colors.BackColor;
            WindowTitleText.TextAlignment = TextAlignment.Center;
            Canvas.SetTop(WindowTitleText, 2); Canvas.SetLeft(WindowTitleText, 0); 
            WindowTitlePanel.Children.Add(WindowTitleText);

            // Add Window title to dialog
            Canvas.SetTop(WindowTitlePanel, 0);
            Canvas.SetLeft(WindowTitlePanel, 0);
            ListenRadioDialogCanvas.Children.Add(WindowTitlePanel);

            // Add panel for displaying stream info
            RadioInfoStackPanel = new StackPanel();
            RadioInfoStackPanel.Width = ListenRadioDialog.Width - 4;
            RadioInfoStackPanel.Height = ListenRadioDialog.Height - WindowTitlePanel.Height - 8;
            RadioInfoStackPanel.Orientation = Orientation.Vertical;

         
            // Add Text controls for displaying stream info
            for (int x = 0; x < 3; x++)
            {
                Text mp3InfoText = new Text(Fonts.smallFont, "");
                mp3InfoText.Width = 128;
                mp3InfoText.Height = Fonts.smallFont.Height+1;
                mp3InfoText.ForeColor = Colors.ForeColor;
                mp3InfoText.TextAlignment = TextAlignment.Center;
                RadioInfoStackPanel.Children.Add(mp3InfoText);
            }

            // Change font for Text Control 0 - Playing time 
            ((Text)RadioInfoStackPanel.Children[0]).Font = Fonts.bigFont2;
            ((Text)RadioInfoStackPanel.Children[0]).Height = Fonts.bigFont2.Height + 6;

            // Add RadioInfoStack panel to dialog
            Canvas.SetTop(RadioInfoStackPanel, WindowTitlePanel.Height + 8);
            Canvas.SetLeft(RadioInfoStackPanel, 2);
            ListenRadioDialogCanvas.Children.Add(RadioInfoStackPanel);

            // Add Canvas to Dialog
            ListenRadioDialog.Child = ListenRadioDialogCanvas;

            // Add Dialog Button Event Handler
            ListenRadioDialog.AddHandler(Buttons.ButtonUpEvent, new ButtonEventHandler(showListenRadioDialog_ButtonUp), false);

            // Set the window visibility to visible.
            ListenRadioDialog.Visibility = Visibility.Visible;

            // Focus on Window
            Buttons.Focus(ListenRadioDialog);

            // Force render dialog
            ListenRadioDialog.Invalidate();
            Thread.Sleep(10);

            // Initialize Radio Client
            RadioClient = new MP3RadioClient(SelectedRadioStation.Host, SelectedRadioStation.Port, SelectedRadioStation.Path);

            // Add OnMP3InfoUpdated Event Handler
            RadioClient.OnMP3InfoUpdated += new MP3RadioClient.Mp3InfoUpdatedEvent(RadioClient_OnMP3InfoUpdated);
            RadioClient.OnRadioConnectionLost += new MP3RadioClient.RadioConnectionLostEvent(RadioClient_OnRadioConnectionLost);

            // Check if error happened while init Radio Client
            if (RadioClient.ErrorString == "")
            {
                StartTime = DateTime.MinValue;

                // Make thread for polling stream data
                DoListenRadio = new Thread(new ThreadStart(RadioClient.PollForData)); ;
                DoListenRadio.Start();
            }


        }

   
        /// <summary>
        /// Event Handler for ListenRadioDialog Window
        /// </summary>
        /// <param name="sender">Sender</param>
        /// <param name="e">Event Parameters</param>
        private void showListenRadioDialog_ButtonUp(object sender, ButtonEventArgs e)
        {
            // Check if Select button is pressed
            if (e.Button == Button.Select)
            {
                // Check is DoListenRadio Thread is started
                if (DoListenRadio != null)
                {
                    // Close radio stream
                    RadioClient.CloseConnection = true;
                }
            }

            // Check if Up Button is pressed
            if (e.Button == Button.Up)
            {
                if (DoListenRadio != null)
                {
                    RadioClient.VolumeChange(10);
                }

            }
            // Check if Down Button is pressed
            if (e.Button == Button.Down)
            {
                if (DoListenRadio != null)
                {
                    RadioClient.VolumeChange(-10);
                }

            }

            if (e.Button == Button.Right)
            {
                if (DoListenRadio != null)
                {
                    RadioClient.SetBassBoost(6, 10);
                }
            }

            if (e.Button == Button.Left)
            {
                if (DoListenRadio != null)
                {
                    RadioClient.SetBassBoost(0, 10);
                }
            }

        }
        /// <summary>
        /// Close the Radio Dialog
        /// </summary>
        /// <param name="Sender">Sender</param>
        void CloseListenRadioDialog(Object Sender)
        {
            // Close ListenRadioDialog window 
            ListenRadioDialog.Close();

            while (Buttons.IsButtonDown(Button.Select)) { Thread.Sleep(10); }

            // Attach the button focus to the window.
            Buttons.Focus(mainWindow);
            Buttons.Focus(lstRadioStations);
        }

        /// <summary>
        /// Event handler for Radio Client - OnRadioConnectionLost closes ListenRadioDialog
        /// </summary>
        void RadioClient_OnRadioConnectionLost()
        {
            this.Dispatcher.BeginInvoke(new CloseListenRadioDialogDelegate(CloseListenRadioDialog), new object[] { RadioClient });
        }



        /// <summary>
        /// Update Listen Window Text
        /// </summary>
        /// <param name="StatusText">Text for LCD line 1</param>
        /// <param name="SubText1">Text for LCD line 2</param>
        /// <param name="SubText2">Text for LCD line 3</param>
        void DoUpdateWindowText(String StatusText, String SubText1, String SubText2)
        {
            // Text 1
            if (StatusText != ((Text)RadioInfoStackPanel.Children[0]).TextContent)
            {
                ((Text)RadioInfoStackPanel.Children[0]).TextContent = StatusText;
                ((Text)RadioInfoStackPanel.Children[0]).Invalidate();
            }

            // Text 2
            if (SubText1 != ((Text)RadioInfoStackPanel.Children[1]).TextContent)
            {
                ((Text)RadioInfoStackPanel.Children[1]).TextContent = SubText1;
                ((Text)RadioInfoStackPanel.Children[1]).Invalidate();
            }

            // Text 3
            if (SubText2 != ((Text)RadioInfoStackPanel.Children[2]).TextContent)
            {
                ((Text)RadioInfoStackPanel.Children[2]).TextContent = SubText2;
                ((Text)RadioInfoStackPanel.Children[2]).Invalidate();
            }
        }


        /// <summary>
        /// Event Handler for Radio Client - OnMP3InfoUpdated Event. Displays stream information
        /// </summary>
        void RadioClient_OnMP3InfoUpdated()
        {
            if (RadioClient.status == MP3RadioClient.StatusOptions.Message)
            {
                String StatusText = RadioClient.Message;
                String SubText1 = RadioClient.SubMessage1;
                String SubText2 = RadioClient.SubMessage2;

                // Message should disappear in 1 second
                MessageTime = DateTime.Now + TimeSpan.FromTicks(1 * TimeSpan.TicksPerSecond);

                // Invoke DoUpdateWindowText for updating text
                this.Dispatcher.BeginInvoke(new UpdateDialogText(DoUpdateWindowText), new String[] { StatusText, SubText1, SubText2 });
            }

            // This is for messages. Stop displaying other text until message should dissapear
            if (DateTime.Now < MessageTime)
                return;


            // Update text while connecting
            if (RadioClient.status == MP3RadioClient.StatusOptions.Connecting)
            {
                String StatusText = "Connecting";
                String SubText1 = "";
                String SubText2 = "";

                // Invoke DoUpdateWindowText for updating text
                this.Dispatcher.BeginInvoke(new UpdateDialogText(DoUpdateWindowText), new String[] { StatusText, SubText1, SubText2 });
            }


            // Update text while buffering 
            if (RadioClient.status == MP3RadioClient.StatusOptions.Buffering)
            {
                String StatusText = "Buffering";
                String SubText1 = RadioClient.inBuffer.ToString() + "Bytes";
                String SubText2 = "";

                // Invoke DoUpdateWindowText for updating text
                this.Dispatcher.BeginInvoke(new UpdateDialogText(DoUpdateWindowText), new String[] { StatusText, SubText1, SubText2 });
            }

            // Update text while playing
            if (RadioClient.status == MP3RadioClient.StatusOptions.Playing)
            {
                // Store Starting Time
                if (StartTime == DateTime.MinValue) { StartTime = DateTime.Now; }

                // Update current time
                CurrentTime = DateTime.Now;

                // Calculate playing time
                TimeSpan PlayingTime = CurrentTime - StartTime;

                String StatusText = Str_Int_Func.IntToString(PlayingTime.Hours, 2) + ":" + Str_Int_Func.IntToString(PlayingTime.Minutes, 2) + ":" + Str_Int_Func.IntToString(PlayingTime.Seconds, 2);
                String SubText1 = RadioClient.Mp3Info.getBitrate().ToString() + "kbps, " + RadioClient.Mp3Info.getFrequency() + "Hz";

                String SubText2;

                if (RadioClient.ICYStreamName != "")
                    SubText2 = RadioClient.ICYStreamName;
                else
                    SubText2 = RadioClient.Mp3Info.getMode();

                // Invoke DoUpdateWindowText for updating text
                this.Dispatcher.BeginInvoke( new UpdateDialogText(DoUpdateWindowText), new String[] { StatusText, SubText1, SubText2 });

            }

            // Update text for error
            if (RadioClient.status == MP3RadioClient.StatusOptions.Error)
            {
                String StatusText = "Error!";
                String SubText1 = "";
                String SubText2 = RadioClient.ErrorString;

                // Invoke DoUpdateWindowText for updating text
                this.Dispatcher.BeginInvoke(new UpdateDialogText(DoUpdateWindowText), new String[] { StatusText, SubText1, SubText2 });
            }

        }
   
    }
}
