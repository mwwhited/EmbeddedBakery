using System;
using Microsoft.SPOT;
using WhitedUS.Common.Configuration;

namespace WhitedUS.Net.HTTP.Outlook
{
    public class Contact
    {
        public string FileAs { get; set; }
        public string FullName { get; set; }
        public string MobileTelephoneNumber { get; set; }
        public string HomeTelephoneNumber { get; set; }
        public string BusinessTelephoneNumber { get; set; }

        public static Contacts GetFeed(int skip, int take)
        {
            Contacts rets;

            using (var xml = (
                Manager.Settings.ServiceContactsUri +
                "?skip=" + skip.ToString() +
                "&take=" + take.ToString()
                ).GetFeed())
            {
                rets = xml.ParseContacts();
                xml.Close();
            }

            return rets;
        }
    }
}
