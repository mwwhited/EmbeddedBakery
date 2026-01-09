using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using Microsoft.SPOT.Input;
using Microsoft.SPOT.Presentation.Media;
using WhitedUS.Common.Configuration;
using WhitedUS.Net.HTTP.Outlook;

namespace WhitedUS.UI
{
    public partial class DisplayAppointments : IButtonController
    {
        //partial void OnComponentsInitialized();

        private int _curretIndex = 0;
        //private int _skip = 0;
        //private int _take = 0;
        //private int _total = 0;
        private DateTime _lastUpdate = DateTime.MinValue;
        private Appointments _appointments;
        public Appointments AppointmentList
        {
            get
            {
                var runTime = DateTime.Now.Date;
                if (_appointments == null ||
                    _lastUpdate != runTime)
                {
                    try
                    {
                        _appointments = Appointment.GetFeed(runTime);

                        //if (_appointments != null)
                        //{
                        //    _skip = _appointments.Skip;
                        //    _take = _appointments.Take;
                        //    _total = _appointments.Total;
                        //}

                        _lastUpdate = runTime;
                    }
                    catch (Exception ex)
                    {
                        Debug.Print(ex.Message);
                    }
                }
                return _appointments;
            }
        }

        public void NextRecord()
        {
            _curretIndex++;

            //if (_curretIndex >= this.ContactList.Count)
            //    this.NextPage();
            //else
                this.Invalidate();
        }

        public void PreviousRecord()
        {
            _curretIndex--;

            //if (_curretIndex < 0)
            //    this.PreviousPage();
            //else
                this.Invalidate();
        }

        //public void NextPage()
        //{
        //    _nextUpdate = DateTime.MinValue;
        //    _curretIndex = 0;
        //    _skip += _take;
        //    this.Invalidate();
        //}

        //public void PreviousPage()
        //{
        //    _nextUpdate = DateTime.MinValue;
        //    _skip -= _take;
        //    _curretIndex = _take - 1;
        //    this.Invalidate();
        //}

        public Appointment Current
        {
            get
            {
                if (this.AppointmentList == null || this.AppointmentList.Count <= 0)
                    return null;

                if (_curretIndex < 0)
                    _curretIndex = 0;
                if (_curretIndex >= this.AppointmentList.Count)
                    _curretIndex = this.AppointmentList.Count - 1;

                return this.AppointmentList[_curretIndex];
            }
        }

        public override void OnRender(DrawingContext dc)
        {
            //<Text x:Name="Subject" TextAlignment="Center" Font="small">Subject</Text>
            //<Text x:Name="StartTime" TextAlignment="Center" Font="small">Start</Text>
            //<Text x:Name="EndTime" TextAlignment="Center" Font="small">End</Text>
            //<Text x:Name="Body" TextAlignment="Center" Font="small">Body</Text>

            var current = this.Current;
            if (current == null)
            {
                Subject.TextContent = "<Subject>";
                StartTime.TextContent = "<Start Time>";
                EndTime.TextContent = "<End Time>";
                Body.TextContent = "<Body>";
            }
            else
            {
                Subject.TextContent = current.Subject ?? string.Empty;
                StartTime.TextContent = current.Start ?? string.Empty;
                EndTime.TextContent = current.End ?? string.Empty;
                Body.TextContent = current.Body ?? string.Empty;
            }
            base.OnRender(dc);
        }


        #region IButtonController Members

        public void OnButtonUp(object sender, ButtonEventArgs e)
        {
            if (e != null)
            {
                var settings = Manager.Settings;
                switch (e.Button)
                {
                    case Button.VK_RIGHT: //39
                        this.NextRecord();
                        break;
                    case Button.VK_LEFT: //37
                        this.PreviousRecord();
                        break;
                    case Button.VK_BACK: //8
                    //this.PreviousPage();
                    //break;
                    case Button.VK_HOME: //36
                    //this.NextPage();
                    //break;

                    case Button.VK_UP: //38
                    case Button.VK_SELECT: //41
                    case Button.VK_DOWN: //40
                    default:
                        //Debug.Print("this does not handle button \"" + e.Button.ToString() + "\"");
                        ((IButtonController)WindowController.Window(States.Radio)).OnButtonUp(sender, e);
                        break;
                }
            }
        }

        #endregion
    }
}
