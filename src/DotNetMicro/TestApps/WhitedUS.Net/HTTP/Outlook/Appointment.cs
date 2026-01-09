using System;
using Microsoft.SPOT;
using WhitedUS.Common.Configuration;

namespace WhitedUS.Net.HTTP.Outlook
{
    public class Appointment
    {
        public string CreationTime { get; set; }
        public string LastModificationTime { get; set; }
        public string End { get; set; }
        public string Start { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }

        public static Appointments GetFeed(DateTime date)
        {
            return GetFeed(date.Year, date.Month, date.Day);
        }

        public static Appointments GetFeed(int year, int month, int day)
        {
            Appointments rets;

            using (var xml = (
                Manager.Settings.ServiceAppointmentsUri +
                "/" + year.ToString() +
                "/" + month.ToString() +
                "/" + day.ToString()
                //"?skip=" + skip.ToString() +
                //"&take=" + take.ToString()
                ).GetFeed())
            {
                rets = xml.ParseAppointments();
                xml.Close();
            }

            return rets;
        }
    }
}
