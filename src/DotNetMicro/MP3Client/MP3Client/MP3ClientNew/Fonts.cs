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
    /// This class defines the fonts used in this project.
    /// </summary>
    class Fonts
    {
        /// <summary>
        /// Small TinyFont
        /// </summary>
        public static Font smallFont = Resources.GetFont(Resources.FontResources.Font8);

        /// <summary>
        /// Small TinyFont No. 2
        /// </summary>
        public static Font smallFont2 = Resources.GetFont(Resources.FontResources.small);

        /// <summary>
        /// Large TinyFont
        /// </summary>
        public static Font bigFont = Resources.GetFont(Resources.FontResources.NinaB);

        /// <summary>
        /// Large TinyFont No. 2
        /// </summary>
        public static Font bigFont2 = Resources.GetFont(Resources.FontResources.SegoeUI9);
    }
}
