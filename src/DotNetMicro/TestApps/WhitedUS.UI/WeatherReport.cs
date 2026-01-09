using System;
using System.Threading;
using Microsoft.SPOT;
using Microsoft.SPOT.Input;
using Microsoft.SPOT.Presentation;
using Microsoft.SPOT.Presentation.Controls;
using Microsoft.SPOT.Presentation.Media;
using WhitedUS.Common.Configuration;
using WhitedUS.Net.HTTP;
using WhitedUS.Net.HTTP.Weather;

namespace WhitedUS.UI
{
    public partial class WeatherReport : IButtonController
    {
        private Weather weather;
        private Thread loop;

        #region Other Thread

        ~WeatherReport()
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

        private void InvalidateWeather()
        {
            while (true)
            {
                try
                {
                    var report = this;
                    if (report != null)
                    {
                        report.weather = Weather.GetFeed()[0];
                        var check = report.Dispatcher.BeginInvoke(new InvokeInvalidateHandler(report.InvokeInvalidate));
                    }
                }
                catch (Exception ex)
                {
                    Debug.Print(ex.ToString());
                }

                var waitSpan = Manager.Settings.WeatherLifeTime;
                var wait = ((((waitSpan.Hours * 60) + waitSpan.Minutes) * 60) + waitSpan.Seconds) * 1000;

                Thread.Sleep(wait);
            }
        }

        private delegate void InvokeInvalidateHandler();

        private void InvokeInvalidate()
        {
            this.Invalidate();
        }

        #endregion

        partial void OnComponentsInitialized()
        {
            if (loop == null)
            {
                loop = new Thread(new ThreadStart(InvalidateWeather));
                loop.Start();
            }
        }

        private void OnUpdateValues()
        {
            if (weather != null)
            {
                //<Text x:Name="title" Font="small">Yahoo weather</Text>
                this.title.TextContent = weather.Title;
                this.title.InvalidateMeasure();
                this.title.InvalidateArrange();

                //<Text x:Name="location" Font="small" >City, State - Country</Text>
                if (weather.Location != null)
                {
                    this.location.TextContent =
                        (weather.Location.City ?? string.Empty) + ", " +
                        (weather.Location.Region ?? string.Empty) + " - " +
                        (weather.Location.Country ?? string.Empty);
                    this.location.InvalidateMeasure();
                    this.location.InvalidateArrange();
                }

                if (weather.Wind != null & weather.Units != null)
                {
                    //<Text x:Name="temperature" Font="small" >63 F</Text>
                    this.temperature.TextContent =
                        (weather.Wind.Chill ?? string.Empty) + " " +
                        (weather.Units.Temperature ?? string.Empty);
                    this.temperature.InvalidateMeasure();
                    this.temperature.InvalidateArrange();

                    //<Text x:Name="wind" Font="small" >5 mph</Text>
                    this.wind.TextContent =
                        (weather.Wind.Speed ?? string.Empty) + " " +
                        (weather.Units.Speed ?? string.Empty) + " (" +
                        (weather.Wind.Direction ?? string.Empty) + ")"; //+ (char)(148)
                    this.wind.TextAlignment = TextAlignment.Center;
                }

                //<Text x:Name="astronomy" HorizontalAlignment="Center" Font="small" >sunrise sunset</Text>
                if (weather.Astronomy != null)
                    this.astronomy.TextContent =
                        "Rise: " + (weather.Astronomy.SunRise ?? string.Empty) +
                        " Set: " + (weather.Astronomy.SunSet ?? string.Empty);

                if (weather.Item != null)
                {
                    if (weather.Item.Condition != null)
                    {
                        //<Text x:Name="condition" HorizontalAlignment="Center" Font="small" >cloudy</Text>
                        this.condition.TextContent = weather.Item.Condition.Text;

                        //<Image x:Name="icon" HorizontalAlignment="Center" Bitmap="Broken" />
                        this.icon.Bitmap =
                            weather.Item.Condition.Icon ??
                            Resources.GetBitmap(Resources.BitmapResources.Broken);
                    }

                    //<ListBox x:Name="forcast" VerticalAlignment="Center" Width="320" />
                    Font smallfont = Resources.GetFont(Resources.FontResources.small);
                    if (weather.Item.Forcasts != null && weather.Item.Forcasts.Count > 0)
                    {
                        var forcasts = weather.Item.Forcasts;
                        var cnt = weather.Item.Forcasts.Count;
                        var lbCnt = forcast.Items.Count;
                        for (int i = 0; i < cnt; i++)
                        {
                            if (i >= lbCnt)
                                break;
                            var text = forcast.Items[i].Child as Text;
                            if (text == null)
                                continue;

                            var item = forcasts[i];

                            string mesg =
                                (item.Day ?? string.Empty) + " (" +
                                (item.Date ?? string.Empty) + ") " +
                                "Low: " + (item.Low ?? string.Empty) + " " +
                                "High: " + (item.High ?? string.Empty) + " " +
                                "\"" + (item.Text ?? string.Empty) + "\"";

                                text.TextContent = mesg;                            
                        }
                    }
                }
            }
        }

        public override void OnRender(DrawingContext dc)
        {
            this.OnUpdateValues();
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

        #region IWindowController Members

        public void OnButtonUp(object sender, ButtonEventArgs e)
        {
            Debug.Print("I'm gona do work!!!");
        }

        #endregion
    }
}
