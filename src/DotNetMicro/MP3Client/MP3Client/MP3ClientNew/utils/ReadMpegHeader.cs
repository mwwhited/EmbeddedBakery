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

/// <summary>
/// This class searches for a valid MPEG header in a byte array
/// It can be used to get information for a mp3 file or mp3 radio station.
/// 
/// It's based on a class written by:
/// Robert A. Wlodarczyk
/// http://rob.wincereview.com:8080
/// rwlodarc@hotmail.com
///
/// It's has the following modifications:
/// - It uses a byte array instead of a file so it can be used for internet radio
/// - Multidimension arrays are converted. This is to support the .NET Micro framework
/// - XING VBR header support is removed, sorry
/// 
/// Resources used:
/// http://www.codeproject.com/KB/audio-video/mpegaudioinfo.aspx
/// http://mpgedit.org/mpgedit/mpeg_format/mpeghdr.htm
/// 
/// </summary>
/// <remarks>
/// 
/// Copyright (c) 2008 Elze F.R. Kool [ efrkool@live.nl ]
/// 
/// Licence: 
/// Creative Commons, Attribution-Share Alike 3.0 Netherlands
/// http://creativecommons.org/licenses/by-sa/3.0/nl/deed.en
/// 
/// </remarks>
public class MP3HeaderReader
{
    // Header position 
    public int HeaderPosition;

    // Storage for header
    private ulong bithdr;


    /// <summary>
    /// Read MPEG Header from byte[] array
    /// </summary>
    /// <param name="InputBuffer">Array of bytes from mpeg file/stream</param>
    /// <param name="Startposition">Position to start searching for mpeg header</param>
    /// <param name="EndPosition">Position to end searching for mpeg header</param>
    /// <returns>True is header is found, False if header not found</returns>
    public bool ReadMP3Information(ref byte[] InputBuffer,Int32 Startposition, Int32 EndPosition)
    {
        // Storage of Headers
        byte[] bytHeader = new byte[4];
        byte[] bytVBitRate = new byte[12];

        /*
        // Check end position
        if (EndPosition > InputBuffer.Length)
             return false;

        // Check start position
        if (Startposition > (EndPosition - 4))
            return false;
        */

        // Position in InputBuffer
        Int32 intPos = Startposition;

        // Keep reading 4 bytes from the header until end of buffer
        do
        {
            // Copy 4 bytes from input buffer to byteArray
            Array.Copy(InputBuffer, intPos, bytHeader, 0, 4);

            // Increase positions
            intPos++;

            // Load header
            LoadMP3Header(bytHeader);
        }
        while (!IsValidHeader() && (intPos < (EndPosition - 4)));

        // Check if valid header is found
        if (IsValidHeader())
        {
            // Store position of header
            HeaderPosition = intPos;

            // Return true -> header found
            return true;
        }

        // Return false -> header not found
        return false;
    }

    /// <summary>
    /// Load MPEG Header from byte[] array to single long int.
    /// Stores it in bithdr.
    /// </summary>
    /// <param name="c">byte[4] array of header</param>
    private void LoadMP3Header(byte[] c)
    {
        // c[0] is moved 3 bytes to the left
        // c[1] is moved 2 bytes to the left
        // c[2] is moved 1 byte to the left
        // c[3] is kept on original position
        //
        // Result: 33333333222222221111111100000000
        //
        bithdr = (ulong)(((c[0] & 255) << 24) | ((c[1] & 255) << 16) | ((c[2] & 255) << 8) | ((c[3] & 255)));
    }

    /// <summary>
    /// Check if header CAN be a valid header
    /// </summary>
    /// <returns>True = Header CAN be valid, False Header is not valid</returns>
    public bool IsValidHeader()
    {
        return (((getFrameSync() & 2047) == 2047) &&   // Framesync 
                ((getVersionIndex() & 3) != 1) &&      // Version index 1 is invalid
                ((getLayerIndex() & 3) != 0) &&        // Layer IIII doesn't exsist yet
                ((getBitrateIndex() & 15) != 0) &&     // "free" kbps i don't know
                ((getBitrateIndex() & 15) != 15) &&    // "bad" kpbs sounds.. bad :P
                ((getFrequencyIndex() & 3) != 3) &&    // "reserved" is same word as "bad"
                ((getEmphasisIndex() & 3) != 2));      // "reserved" is same word as "bad" 
    }

    /// <summary>
    /// Returns framesync
    /// </summary>
    /// <returns>2047 if valid frame sync else it's a invalid framesync</returns>
    private int getFrameSync()
    {
        return (int)((bithdr >> 21) & 2047);
    }

    /// <summary>
    /// Returns MPEG version 
    /// </summary>
    /// <returns>MPEG version as stored in header</returns>
    private int getVersionIndex()
    {
        return (int)((bithdr >> 19) & 3);
    }

    /// <summary>
    /// Returns Layer version
    /// </summary>
    /// <returns>MPEG Layer version as stored in header</returns>
    private int getLayerIndex()
    {
        return (int)((bithdr >> 17) & 3);
    }

    /// <summary>
    /// Returns protected bit
    /// </summary>
    /// <returns>Protected bit as stored in header</returns>
    private int getProtectionBit()
    {
        return (int)((bithdr >> 16) & 1);
    }

    /// <summary>
    /// Returns bitrate as index.
    /// Use getBitrate() to get bitrate in kbps
    /// </summary>
    /// <returns>Bitrate as stored in header</returns>
    private int getBitrateIndex()
    {
        return (int)((bithdr >> 12) & 15);
    }

    /// <summary>
    /// Returns frequency as index.
    /// User getFrequency() to get frequency in Hz
    /// </summary>
    /// <returns>Frequency as stored in header</returns>
    private int getFrequencyIndex()
    {
        return (int)((bithdr >> 10) & 3);
    }

    /// <summary>
    /// Returns padding bit.
    /// </summary>
    /// <returns>0 = Frame is not padded, 1 frame is padded</returns>
    private int getPaddingBit()
    {
        return (int)((bithdr >> 9) & 1);
    }

    /// <summary>
    /// Returns private bit
    /// </summary>
    /// <returns>Private bit as stored in header</returns>
    private int getPrivateBit()
    {
        return (int)((bithdr >> 8) & 1);
    }

    /// <summary>
    /// Returns mode as index
    /// Use getMode() to return mode as string
    /// </summary>
    /// <returns>MPEG mode as stored in header</returns>
    private int getModeIndex()
    {
        return (int)((bithdr >> 6) & 3);
    }

    /// <summary>
    /// Returns mode extension as index
    /// Only used with Joint Stereo 
    /// </summary>
    /// <returns>MPEG extended mode as stored in header</returns>
    private int getModeExtIndex()
    {
        return (int)((bithdr >> 4) & 3);
    }

    /// <summary>
    /// Returns copyrighted bit
    /// </summary>
    /// <returns>Copyright bit as stored in header</returns>
    private int getCoprightBit()
    {
        return (int)((bithdr >> 3) & 1);
    }

    /// <summary>
    /// Return Original
    /// </summary>
    /// <returns>Original bit as stored in header</returns>
    private int getOrginalBit()
    {
        return (int)((bithdr >> 2) & 1);
    }

    /// <summary>
    /// Return Emphasis
    /// </summary>
    /// <returns>Emphasis as stored in header</returns>
    private int getEmphasisIndex()
    {
        return (int)(bithdr & 3);
    }

    /// <summary>
    /// Return MPEG version
    /// </summary>
    /// <returns>MPEG Version</returns>
    public double getVersion()
    {
        double[] table = { 2.5, 0.0, 2.0, 1.0 };
        return table[getVersionIndex()];
    }

    /// <summary>
    /// Return Layer 
    /// </summary>
    /// <returns>1 = Layer I, 2 = Layer II, 3 = Layer III</returns>
    public int getLayer()
    {
        return (int)(4 - getLayerIndex());
    }

    /// <summary>
    /// Return bitrate
    /// </summary>
    /// <returns>Bitrate in kbps</returns>
    public int getBitrate()
    {
        int[] table = new int[16];

        // A little tweaked version of a multidimention array :)

        if ((getVersionIndex() & 1) == 0) // MPEG 2.5
        {
            if ((getLayerIndex() - 1) == 0)
            {
                table = new int[] { 0, 8, 16, 24, 32, 40, 48, 56, 64, 80, 96, 112, 128, 144, 160, 0 }; // Layer III
            }

            if ((getLayerIndex() - 1) == 1)
            {
                table = new int[] { 0, 8, 16, 24, 32, 40, 48, 56, 64, 80, 96, 112, 128, 144, 160, 0 }; // Layer II
            }

            if ((getLayerIndex() - 1) == 2)
            {
                table = new int[] { 0, 32, 48, 56, 64, 80, 96, 112, 128, 144, 160, 176, 192, 224, 256, 0 }; // Layer I
            }

        }

        if ((getVersionIndex() & 1) == 1) // MPEG 1 & MPEG2
        {
            if ((getLayerIndex() - 1) == 0)
            {
                table = new int[]  { 0, 32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256, 320, 0 }; // Layer III
            }

            if ((getLayerIndex() - 1) == 1)
            {
                table = new int[] { 0, 32, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256, 320, 384, 0 }; // Layer II
            }

            if ((getLayerIndex() - 1) == 2)
            {
                table = new int[] { 0, 32, 64, 96, 128, 160, 192, 224, 256, 288, 320, 352, 384, 416, 448, 0 }; // Layer I
            }
        }

        return table[getBitrateIndex()];
    }

    /// <summary>
    /// Returns audio frequency
    /// </summary>
    /// <returns>Audio frequency in Hz</returns>
    public int getFrequency()
    {
        int[] table;

        switch (getVersionIndex())
        {
            case 0:
                table = new int[] {32000, 16000,  8000}; // MPEG 2.5
                return table[getFrequencyIndex()];
                
            case 1:
                table = new int[] { 0, 0, 0 }; // reserved
                return table[getFrequencyIndex()];
            
            case 2:
                table = new int[] { 22050, 24000, 16000 }; // MPEG 2
                return table[getFrequencyIndex()];
            
            case 3:
                table = new int[] { 44100, 48000, 32000 };  // MPEG 1
                return table[getFrequencyIndex()];
        }

        return 0;
    }

    /// <summary>
    /// Returns audio mode as a String
    /// </summary>
    /// <returns>MPEG Audio Mode</returns>
    public string getMode()
    {
        switch (getModeIndex())
        {
            default:
                return "Stereo";
            case 1:
                return "Joint Stereo";
            case 2:
                return "Dual Channel";
            case 3:
                return "Single Channel";
        }
    }

  
    /// <summary>
    /// Return Samples per frame
    /// </summary>
    /// <returns>Samples per Frame</returns>
    private int GetSamplesPerFrame()
    {
        int[] table;           
        switch (getLayerIndex()-1)
        {
            case 0:  // Layer III
                table = new int[] {576,0,576,1152};
                return  table[getVersionIndex()];

            case 1: // Layer II
                table = new int[] {1152,0,1152,1152};
                return  table[getVersionIndex()];

            case 2: // Layer I
                table = new int[] { 384, 0, 384, 384 };
                return  table[getVersionIndex()];
        }

        // Something went wrong :(
        return 0;
    }

    /// <summary>
    /// Calculate Frame Size used for calculating next header position
    /// Only works for Layer II and Layer III
    /// Padding is wrong for Layer I :(
    /// </summary>
    /// <returns>Frame Size in Bytes</returns>
    public int GetFrameSize()
    {
        double FrameSize = (((double)GetSamplesPerFrame() / 8) * (double)getBitrate() * 1000) / (double)getFrequency();

        if (getPaddingBit() == 1)
        {
            FrameSize += 1;
        }
        
        return ((int) FrameSize);
    }


}

