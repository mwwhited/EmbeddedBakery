#define NETWORK_
#define CLOCK_
#define SDCARD
#define SDCARD2_
#define FMRADIO_
#define SNTP_

#region Using Statements

using System;
using System.Ext;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading;
using DeviceSolutions.SPOT.Hardware;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using Microsoft.SPOT.Input;
using Microsoft.SPOT.IO;
using Microsoft.SPOT.Presentation;
using Microsoft.SPOT.Presentation.Controls;
using WhitedUS.Adapters;
using WhitedUS.Common;
using WhitedUS.Devices;
using WhitedUS.Devices.VS1011E;
using WhitedUS.Graphics;
using WhitedUS.IO;
using WhitedUS.IO.Linq;
using WhitedUS.Net.HTTP;
using WhitedUS.Net.SNTP;

#endregion

namespace VS1302sinTest
{
    public class Program : Microsoft.SPOT.Application
    {
        static Thread sdthread;

        public static void Main()
        {
            //==== Prevents infinite loops from blocking the debugger ====
            Debug.Print("WAIT!!!");
            Thread.Sleep(5000);
            Debug.Print("GO!!!");

            Program myApplication = new Program();
            Window mainWindow = myApplication.CreateWindow();
            // Create the object that configures the GPIO pins to buttons.
            GPIOButtonInputProvider inputProvider = new GPIOButtonInputProvider(null);

            var selectedVolume = VolumeInfo.GetVolumes()
                .Where(v => ((VolumeInfo)v).Name == "SD1")
                .First() as VolumeInfo;

            bool isLoadedSD = false;
            int toBuffer = 1024 * 512; 
            using (var deStreamSD = new FiFoBlock())
            {
                Debug.Print("SD Card Thread");
                sdthread = new Thread(new ThreadStart(delegate()
                {
                    try
                    {
                        //In_Too_Deep track06 wordup
                        if (selectedVolume != null)
                        {
                            string mp3File = selectedVolume.RootDirectory + "\\In_Too_Deep.mp3";
                            if (File.Exists(mp3File))
                            {
                                var fi = new FileInfo(mp3File).Length;
                                var fileData = File.OpenRead(mp3File);
                                //Fill Buffer
                                Debug.Print("Load Buffer");
                                int bufferLen = 0;
                                const int NETWORK_BUFFER_SIZE = 512;
                                byte[] buffer = new byte[NETWORK_BUFFER_SIZE];
                                deStreamSD.Write(new byte[2], 0, 2);
                                long downloaded = 0;

                                do
                                {
                                    bufferLen = fileData.Read(buffer, 0, NETWORK_BUFFER_SIZE);
                                    if (bufferLen > 0)
                                        deStreamSD.Write(buffer, 0, bufferLen);
                                    downloaded += bufferLen;
                                } while (bufferLen > 0 && downloaded < fi);
                                fileData.Close();
                                fileData.Dispose();
                                fileData = null;
                                deStreamSD.Write(new byte[2048], 0, 2048);

                                Debug.Print("Loaded from SD Card");
                                Debug.Print(bufferLen.ToString());
                                Debug.Print(downloaded.ToString());
                                Debug.Print(fi.ToString());
                            }
                            else
                            {
                                Debug.Print("File Not Found");
                            }
                        }
                        else
                        {
                            Debug.Print("No SD Card in Device");
                        }

                    }
                    catch (Exception ex)
                    {
                        Debug.Print("Error SD Card Load");
                        Debug.Print(ex.Message);
                    }
                    isLoadedSD = true;
                }));
                sdthread.Start();

                Debug.Print("Buffering...");
                var lstDwnSD = 0L;
                while (deStreamSD.Length < toBuffer && !isLoadedSD) //1024
                {
                    if (lstDwnSD != deStreamSD.Length)
                    {
                        lstDwnSD = deStreamSD.Length;
                        Debug.Print("Read: " + lstDwnSD.ToString());
                    }
                    Thread.Sleep(100);
                }

                Debug.Print("start play (SD)");
                deStreamSD.Seek(0, SeekOrigin.Begin);
                int bufferSizeSD = 0;
                const int STREAMSIZESD = 32;
                byte[] bufferDataSD = new byte[STREAMSIZESD];
                VS1011e.SetVolume(25);
                Thread.CurrentThread.Priority = ThreadPriority.AboveNormal;

                while (true)
                {
                    bufferSizeSD = deStreamSD.Read(bufferDataSD, 0, STREAMSIZESD);
                    VS1011e.Write(bufferDataSD, 0, bufferSizeSD);
                    if (bufferSizeSD <= 0 && isLoadedSD) break;
                }
            }

            // Start the application
            myApplication.Run(mainWindow);
        }

        #region controls

        private Window mainWindow;
        public Window CreateWindow()
        {
            // Create a window object and set its size to the
            // size of the display.
            mainWindow = new Window();
            mainWindow.Height = SystemMetrics.ScreenHeight;
            mainWindow.Width = SystemMetrics.ScreenWidth;

            // Create a single text control.
            Text text = new Text();

            text.Font = Resources.GetFont(Resources.FontResources.small);
            text.TextContent = Resources.GetString(Resources.StringResources.String1);
            text.HorizontalAlignment = Microsoft.SPOT.Presentation.HorizontalAlignment.Center;
            text.VerticalAlignment = Microsoft.SPOT.Presentation.VerticalAlignment.Center;

            // Add the text control to the window.
            mainWindow.Child = text;

            // Connect the button handler to all of the buttons.
            mainWindow.AddHandler(Buttons.ButtonUpEvent, new ButtonEventHandler(OnButtonUp), false);

            // Set the window visibility to visible.
            mainWindow.Visibility = Visibility.Visible;

            // Attach the button focus to the window.
            Buttons.Focus(mainWindow);

            return mainWindow;
        }

        private void OnButtonUp(object sender, ButtonEventArgs e)
        {
            // Print the button code to the Visual Studio output window.
            Debug.Print(e.Button.ToString());

            switch (e.Button)
            {
                //case Button.AppDefined1:
                //    AR1010.Instance.Tune(--freq);
                //    break;
                //case Button.AppDefined2:
                //    AR1010.Instance.Tune(++freq);
                //    break;
                //case Button.AppDefined3:
                //    Debug.Print(freq.ToString());
                //    break;
                //case Button.AppDefined4:
                //    break;

                case Button.VK_LEFT:
                    AR1010.Instance.Seek(false);
                    break;
                case Button.VK_RIGHT:
                    AR1010.Instance.Seek(true);
                    break;
                case Button.VK_UP:
                    AR1010.Instance.VolumeUp();
                    break;
                case Button.VK_DOWN:
                    AR1010.Instance.VolumeDown();
                    break;
                case Button.VK_SELECT:
                    AR1010.Instance.ToggleMute();
                    break;
            }

            Debug.Print(AR1010.Instance.ToString());
        }

        #endregion
    }
}
