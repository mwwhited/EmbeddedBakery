using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using Microsoft.SPOT.Input;
using WhitedUS.Common.Configuration;
using WhitedUS.Devices;
using WhitedUS.UI.Controls;
using System.Threading;

namespace WhitedUS.UI
{
    public partial class DisplayRadio : IButtonController
    {
        private const int REFRESH_SLEEP = 5000;
        private Thread loop;

        partial void OnComponentsInitialized()
        {
            var radio = AR1010.Instance;
            var settings = Manager.Settings;
            radio.Station = settings.LastRadioStation;
            radio.CurrentVolume = settings.LastRadioVolume;

            loop = new Thread(UpdateRadio);
            loop.Start();
        }

        ~DisplayRadio()
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

        private void UpdateRadio()
        {
            while (true)
            {
                var check = this.Dispatcher.BeginInvoke(new InvokeInvalidateHandler(InvokeInvalidate));
                Thread.Sleep(REFRESH_SLEEP);
            }
        }

        private delegate void InvokeInvalidateHandler();

        private void InvokeInvalidate()
        {
            this.Invalidate();
        }

        #endregion

        public override void OnRender(Microsoft.SPOT.Presentation.Media.DrawingContext dc)
        {
            var radio = AR1010.Instance;
            //<Text x:Name="station" TextAlignment="Center" Font="small">station</Text>
            double stationVal = (((double)radio.Station) / 10);
            station.TextContent = stationVal.ToString("F1");

            //<Text x:Name="volume" TextAlignment="Center" Font="small">volume</Text>
            volume.TextContent = "Volume: " + radio.CurrentVolume.ToString();

            //<Text x:Name="signal" TextAlignment="Center" Font="small">signal</Text>
            signal.TextContent = "Signal Strength: " + radio.RFSignalStrength.ToString();

            //<Text x:Name="channel" TextAlignment="Center" Font="small">channel</Text>
            channel.TextContent = "Channel: " + radio.Channel.ToString();

            base.OnRender(dc);
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

        #region IButtonController Members

        public void OnButtonUp(object sender, ButtonEventArgs e)
        {
            if (e != null)
            {
                var radio = AR1010.Instance;
                if (radio == null)
                    return;

                var settings = Manager.Settings;

                switch (e.Button)
                {
                    case Button.VK_RIGHT: //39
                        settings.LastRadioStation = radio.TuneUp();
                        settings.Save();
                        break;
                    case Button.VK_LEFT: //37
                        settings.LastRadioStation = radio.TuneDown();
                        settings.Save();
                        break;

                    case Button.VK_UP: //38
                        settings.LastRadioVolume = radio.VolumeUp();
                        settings.Save();
                        break;
                    case Button.VK_SELECT: //41
                        radio.ToggleMute();
                        break;
                    case Button.VK_DOWN: //40
                        settings.LastRadioVolume = radio.VolumeDown();
                        settings.Save();
                        break;

                    case Button.VK_BACK: //8
                        //mode
                    case Button.VK_HOME: //36
                        //function
                    default:
                        Debug.Print("DisplayRadio does not handle button \"" + e.Button.ToString() + "\"");
                        break;
                }
            }
        }

        #endregion
    }
}