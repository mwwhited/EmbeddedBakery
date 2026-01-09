using System;
using Microsoft.SPOT;
using System.Xml;

namespace WhitedUS.Net.HTTP.Outlook
{
    public static class ContactsSerializer
    {
        public static Contacts ParseContacts(this XmlTextReader xml)
        {
            var contacts = new Contacts();
            while (xml.Read())
            {
                switch (xml.Name)
                {
                    case "ContactItem":
                        contacts.Take = int.Parse((xml.GetAttribute("take") ?? "0"));
                        contacts.Skip = int.Parse((xml.GetAttribute("skip") ?? "0"));
                        contacts.Total = int.Parse((xml.GetAttribute("total") ?? "0"));

                        while (xml.Read())
                        {
                            switch (xml.Name)
                            {
                                case "ContactItem":
                                    var contact = new Contact();
                                    contact.FileAs = (xml.GetAttribute("FileAs") ?? string.Empty);
                                    contact.FullName = (xml.GetAttribute("FullName") ?? string.Empty);
                                    contact.MobileTelephoneNumber = (xml.GetAttribute("MobileTelephoneNumber") ?? string.Empty);
                                    contact.HomeTelephoneNumber = (xml.GetAttribute("HomeTelephoneNumber") ?? string.Empty);
                                    contact.BusinessTelephoneNumber = (xml.GetAttribute("BusinessTelephoneNumber") ?? string.Empty);

                                    if (contact.FileAs != string.Empty)
                                        contacts.Add(contact);
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
            return contacts;
        }
    }
}
