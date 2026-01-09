using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;

namespace WhitedUS.UI
{
    public static class SupportedButtons
    {
        //  18      27  |   Menu            Escape  | this row is reserved for state machine
        //  08      36  |   Back            Home    |
        //      38      |           UP              |
        //  37  41  39  |   Left    Select  Right   |
        //      40      |           Down            |

        public static readonly Button Back = Button.VK_BACK; // 8
        public static readonly Button Menu = Button.VK_MENU; // 18
        public static readonly Button Escape = Button.VK_ESCAPE; // 27
        public static readonly Button Home = Button.VK_HOME; // 36
        public static readonly Button Left = Button.VK_LEFT; // 37
        public static readonly Button Up = Button.VK_UP; // 38
        public static readonly Button Right = Button.VK_RIGHT; // 39
        public static readonly Button Down = Button.VK_DOWN; // 40
        public static readonly Button Select = Button.VK_SELECT; // 41

        //case Button.VK_MENU : //18
        //case Button.VK_ESCAPE : //27

        //case Button.VK_BACK : //8
        //case Button.VK_HOME : //36
        //case Button.VK_LEFT : //37
        //case Button.VK_UP : //38
        //case Button.VK_RIGHT : //39
        //case Button.VK_DOWN : //40
        //case Button.VK_SELECT : //41

    }
}

        //public void OnButtonUp(object sender, ButtonEventArgs e)
        //{
        //    if (e != null)
        //    {
        //        var settings = Manager.Settings;
        //        switch (e.Button)
        //        {
        //            case Button.VK_RIGHT: //39
        //                break;
        //            case Button.VK_LEFT: //37
        //                break;
        //            case Button.VK_UP: //38
        //                break;
        //            case Button.VK_SELECT: //41
        //                break;
        //            case Button.VK_DOWN: //40
        //                break;
        //            case Button.VK_BACK: //8
        //            case Button.VK_HOME: //36
        //            default:
        //                Debug.Print("this does not handle button \"" + e.Button.ToString() + "\"");
        //                break;
        //        }
        //    }
        //}

