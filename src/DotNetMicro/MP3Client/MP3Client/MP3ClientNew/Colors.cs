/*
 * MP3 Shoutcast client with VS1002 Decoder. 
 * 
 * This program lets the user select a radiostation. 
 * It connects and streams the MP3 data to the VS1002 device. 
 * It contains a simple FIFO implementation.
 * 
 * @copyright (c) 2008 EFR Kool
 * @licence: Creative Commons, Attribution-Share Alike 3.0 Netherlands, http://creativecommons.org/licenses/by-sa/3.0/nl/deed.en
 * 
 */

using System;
using Microsoft.SPOT;

namespace MP3Client
{
    /// <summary>
    /// This class defines the colors used in this project
    /// </summary>
    class Colors
    {
        public static Microsoft.SPOT.Presentation.Media.Color ForeColor = Microsoft.SPOT.Presentation.Media.Color.White;
        public static Microsoft.SPOT.Presentation.Media.Color BackColor = Microsoft.SPOT.Presentation.Media.Color.Black;
    }
}
