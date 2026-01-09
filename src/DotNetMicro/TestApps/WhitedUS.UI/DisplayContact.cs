using System;
using Microsoft.SPOT;
using WhitedUS.Net.HTTP.Outlook;
using Microsoft.SPOT.Presentation.Media;
using Microsoft.SPOT.Input;
using WhitedUS.Common.Configuration;
using Microsoft.SPOT.Hardware;

namespace WhitedUS.UI
{
    public partial class DisplayContact : IButtonController
    {
        //partial void OnComponentsInitialized();

        private int _curretIndex = 0;
        private int _skip = 0;
        private int _take = 0;
        private int _total = 0;
        private DateTime _nextUpdate = DateTime.MinValue;
        private Contacts _contacts;
        public Contacts ContactList
        {
            get
            {
                if (_contacts == null ||
                    _nextUpdate <= DateTime.Now)
                {
                    try
                    {
                        _contacts = Contact.GetFeed(_skip, _take);

                        if (_contacts != null)
                        {
                            _skip = _contacts.Skip;
                            _take = _contacts.Take;
                            _total = _contacts.Total;
                        }

                        _nextUpdate = DateTime.Now + Manager.Settings.ServiceContactAge;
                    }
                    catch (Exception ex)
                    {
                        Debug.Print(ex.Message);
                    }
                }
                return _contacts;
            }
        }

        public void NextRecord()
        {
            _curretIndex++;

            if (_curretIndex >= this.ContactList.Count)
                this.NextPage();
            else
                this.Invalidate();
        }

        public void PreviousRecord()
        {
            _curretIndex--;

            if (_curretIndex < 0)
                this.PreviousPage();
            else
                this.Invalidate();
        }

        public void NextPage()
        {
            _nextUpdate = DateTime.MinValue;
            _curretIndex = 0;
            _skip += _take;
            this.Invalidate();
        }

        public void PreviousPage()
        {
            _nextUpdate = DateTime.MinValue;
            _skip -= _take;
            _curretIndex = _take - 1;
            this.Invalidate();
        }

        public Contact Current
        {
            get
            {
                if (this.ContactList == null || this.ContactList.Count <= 0)
                    return null;

                if (_curretIndex < 0)
                    _curretIndex = 0;
                if (_curretIndex >= this.ContactList.Count)
                    _curretIndex = this.ContactList.Count -1;

                return this.ContactList[_curretIndex];
            }
        }

        public override void OnRender(DrawingContext dc)
        {
            var contact = this.Current;
            if (contact == null)
            {
                FullName.TextContent = "<Full Name>";
                FileAs.TextContent = "<File As>";
                HomeTelephoneNumber.TextContent = "<Home>";
                MobileTelephoneNumber.TextContent = "<Mobile>";
                BusinessTelephoneNumber.TextContent = "<Business>";
            }
            else
            {
                FullName.TextContent = contact.FullName ?? string.Empty;
                FileAs.TextContent = contact.FileAs ?? string.Empty;
                    //_skip.ToString() + " " +
                    //_take.ToString() + " " +
                    //_total.ToString() + " " +
                    //_curretIndex.ToString();

                //// demo code
                //HomeTelephoneNumber.TextContent = "H: 614-555-1234";
                //MobileTelephoneNumber.TextContent = "M: 614-555-1235";
                //BusinessTelephoneNumber.TextContent = "B: 614-555-1236";

                // real code
                HomeTelephoneNumber.TextContent = "H: " + (contact.HomeTelephoneNumber ?? string.Empty);
                MobileTelephoneNumber.TextContent = "M: " + (contact.MobileTelephoneNumber ?? string.Empty);
                BusinessTelephoneNumber.TextContent = "B: " + (contact.BusinessTelephoneNumber ?? string.Empty);
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
                        this.PreviousPage();
                        break;
                    case Button.VK_HOME: //36
                        this.NextPage();
                        break;

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
