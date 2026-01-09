using System;
using Microsoft.SPOT;
using System.Xml;

namespace WhitedUS.Net.HTTP.Outlook
{
    public static class AppointmentsSerializer
    {
        public static Appointments ParseAppointments(this XmlTextReader xml)
        {
            var collection = new Appointments();
            while (xml.Read())
            {
                switch (xml.Name)
                {
                    case "AppointmentItem":
                        //collection.Take = int.Parse((xml.GetAttribute("take") ?? "0"));
                        //collection.Skip = int.Parse((xml.GetAttribute("skip") ?? "0"));
                        //collection.Total = int.Parse((xml.GetAttribute("total") ?? "0"));

                        while (xml.Read())
                        {
                            switch (xml.Name)
                            {
                                case "AppointmentItem":
                                    var contact = new Appointment()
                                    {
                                        CreationTime = (xml.GetAttribute("CreationTime") ?? string.Empty),
                                        LastModificationTime = (xml.GetAttribute("LastModificationTime") ?? string.Empty),
                                        End = (xml.GetAttribute("End") ?? string.Empty),
                                        Start = (xml.GetAttribute("Start") ?? string.Empty),
                                        Subject = (xml.GetAttribute("Subject") ?? string.Empty),
                                        Body = (xml.GetAttribute("Body") ?? string.Empty)
                                    };

                                    if (contact.Subject != string.Empty)
                                        collection.Add(contact);
                                    break;
                                default:
                                    break;
                            }
                        }
                        break;
                    default:
                        break;
                }
            }
            return collection;
        }

    }
}
