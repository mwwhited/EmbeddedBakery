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
using Microsoft.SPOT.Hardware;

using System.Threading;
using GHIElectronics.Hardware;
using GHIElectronics.System;


/// <summary>
/// VS1002 Interface class. For outputting MP3 streams/data from a GHI Electronics .NET Device to a VS1002
/// device. It's a rewrite of the code in the GHI Example library. 
/// 
/// What is different between the GHI VS1002 Class and this one:
/// - Registers names are the same as in the VS1002 Datasheet
/// - Senddata now accepts any size of byte array
/// - Faster, Thread.Sleep() times are drasticly cut down
/// 
/// Usage:
/// - Before using the VS1002 device call VS1002.Initialize()
/// - To stop using VS1002 device call VS1002.Shutdown()
/// - To reset VS1002 device call VS1002.Reset()
/// 
/// - To output data use VS1002.SendData(Byte array)
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
public static class VS1002
{
    /// <summary>
    /// Crystal frequency for VS1002
    /// 24.576Mhz is default for VS1002
    /// 12.288MHz For Sparkfun Breakout module
    /// 12.288MHz For Olimex MOD-MP3
    /// </summary>
    public static UInt32 Xtal = 12288800;

    /// <summary>
    /// SPI device used for data transfer
    /// </summary>
    private static SPI SpiPort;

    /// <summary>
    /// Command CS Pin
    /// </summary>
    private static OutputPort XCS;

    /// <summary>
    /// Data CS Pin
    /// </summary>
    private static OutputPort XDCS;

    /// <summary>
    /// Reset Pin
    /// </summary>
    private static OutputPort RESET;

    /// <summary>
    /// Data request Pin
    /// </summary>
    private static InputPort DREQ;

    /// <summary>
    /// Set direction for SCI call
    /// </summary>
    public enum SCIDirection
    {
        Write = 0x02,
        Read = 0x03
    }

    /// <summary>
    /// VS1002 Registers
    /// </summary>
    public enum VS1002Registers
    {
        MODE = 0x00,
        STATUS = 0x01,
        BASS = 0x02,
        CLOCKF = 0x03,
        DECODE_TIME = 0x04,
        AUDATA = 0x05,
        WRAM = 0x06,
        WRAMADDR = 0x07,
        HDAT0 = 0x08,
        HDAT1 = 0x09,
        AIADDR = 0x0A,
        VOL = 0x0B,
        AICTRL0 = 0x0C,
        AICTRL1 = 0x0D,
        AICTRL2 = 0x0E
    }

    /// <summary>
    /// Open Pins and SPI port for VS1002.
    /// Reset VS1002
    /// </summary>
    public static void Initialize()
    {
        // Initialize SPI
        // Chip Select : Disable, we have two separate chip selects
        // Clock : Active High, Data clocked in on rising edge, Rate 3KHz
        // SPI Port: SPI1
        SpiPort = new SPI(new SPI.Configuration(Cpu.Pin.GPIO_NONE, false, 0, 0, false, false, 3000, SPI.SPI_module.SPI1));

        // Initialize Pins
        try
        {
            XCS = new OutputPort(EmbeddedMaster.Pins.E11x, false);
            XDCS = new OutputPort(EmbeddedMaster.Pins.E26x, false);
            RESET = new OutputPort(EmbeddedMaster.Pins.E28x, false);
            DREQ = new InputPort(EmbeddedMaster.Pins.E29x, false, Port.ResistorMode.PullUp);
        }
        catch
        {
        }

        // Reset VS1002
        Reset();
    }

    
    /// <summary>
    /// Release Pins used for communication with VS1002.
    /// </summary>
    public static void Shutdown()
    {
        // Dispose Pins
        XCS.Dispose();
        XDCS.Dispose();
        DREQ.Dispose();
        RESET.Dispose();
    }


    /// <summary>
    /// Read/Write byte from/to SPI
    /// </summary>
    /// <param name="Data">Byte to write</param>
    /// <returns>Read byte</returns>
    public static byte SPI_ReadWriteByte(byte Data)
    {
        byte[] BufferIn = new byte[1];
        byte[] BufferOut = new byte[1];

        BufferOut[0] = Data;

        SpiPort.WriteRead(BufferOut, BufferIn);

        return BufferIn[0];
    }

    /// <summary>
    /// Read/Write integer from/to SPI
    /// </summary>
    /// <param name="Data">Integer to write</param>
    /// <returns>Read integer</returns>
    public static UInt16 SPI_ReadWriteInt(UInt16 Data)
    {
        byte[] BufferIn = new byte[2];
        byte[] BufferOut = new byte[2];

        BufferOut[0] = ((byte)((Data >> 8) & 0xFF));
        BufferOut[1] = ((byte)(Data & 0xFF));

        SpiPort.WriteRead(BufferOut, BufferIn);

        return ((UInt16)((BufferIn[0] << 8) | BufferIn[1]));
    }

    /// <summary>
    /// Write SCI Register
    /// </summary>
    /// <param name="Adress">Register to write</param>
    /// <param name="Data">Data to write</param>
    public static void SCI_Write(VS1002Registers Adress, UInt16 Data)
    {
        // Assert XCS
        XCS.Write(false);

        // tXCSS min 5ns
        Thread.Sleep(50);

        // Set SCI Adres
        SPI_ReadWriteByte((byte)SCIDirection.Write);
        SPI_ReadWriteByte((byte)Adress);

        // Write Command
        SPI_ReadWriteInt(Data);

        // De-Assert XCS
        XCS.Write(true);
    }

    /// <summary>
    /// Read SCI Register
    /// </summary>
    /// <param name="Adress">Register to read from</param>
    /// <returns>Register contents</returns>
    public static UInt16 SCI_Read(VS1002Registers Adress)
    {
        // Assert XCS
        XCS.Write(false);

        // tXCSS min 5ns
        Thread.Sleep(50);

        // Set register adres for reading
        SPI_ReadWriteByte((byte)SCIDirection.Read);
        SPI_ReadWriteByte((byte)Adress);

        // Read int from VS1002
        UInt16 Result = SPI_ReadWriteInt(0);

        // De-Assert XCS
        XCS.Write(true);

        // Return integer
        return Result;
    }

    /// <summary>
    /// Reset VS1002 in known state
    /// </summary>
    public static void Reset()
    {
        // Reset Pins
        RESET.Write(false);
        XCS.Write(true);
        XDCS.Write(true);

        // Sleep at least 10ms
        Thread.Sleep(10);

        // De-Assert RESET
        RESET.Write(true);

        // Wait for VS1002 to accept data from us
        WaitForDataReady();

        // Sleep at least 10ms
        Thread.Sleep(50);

        // Set Communication to new native method
        SCI_Write(VS1002Registers.MODE, 0x0800);

        // Set Clock Speed
        // CLOCKF = Xtal speed / 2Khz
        // When clock is below 24.576Mhz then set MSB for double freq
        if (Xtal < 24576000)
        {
            SCI_Write(VS1002Registers.CLOCKF, (UInt16)((Xtal / 2000) | 0x8000));
        }
        else
        {
            SCI_Write(VS1002Registers.CLOCKF, (UInt16)(Xtal / 2000));
        }

        // Sleep at least 10ms
        Thread.Sleep(10);

        // Set full volume
        SetVolume(30, 30);

        // For compatibility with GHI VS1002.cs 
        if (SCI_Read(VS1002Registers.VOL) != 0x1E1E)
        {
            throw new Exception("Failed to initialize VS1002 encoder");
        }

    }

    /// <summary>
    /// Wait until VS1002 is ready to recieve data
    /// </summary>
    public static void WaitForDataReady()
    {
        while (DREQ.Read() == false) ; 
    }

    /// <summary>
    /// Buffer used for SendData32. Garbage Collector happy SendData function
    /// </summary>
    private static byte[] SendData32Buffer = new byte[32];

    /// <summary>
    /// Send Datablock to VS1002. Size of Data blocks must be a multiple of 32 
    /// </summary>
    /// <param name="Data">Data to send</param>
    public static void SendData32(ref byte[] Data)
    {
        // Enable Chip Select
        XDCS.Write(false);

        for (int x = 0; x < (Data.Length / 32); x++)
        {
            // Copy Data to temporary buffer
            Array.Copy(Data, x * 32, SendData32Buffer, 0, 32);

            // Wait until VS1002 is ready to recieve data
            WaitForDataReady();

            // Write Data
            SpiPort.Write(SendData32Buffer);
        }

        // Disable Chip Select
        XDCS.Write(true);
    }

    /// <summary>
    /// Send Data to VS1002
    /// </summary>
    /// <param name="Data">Data to send</param>
    public static void SendData(ref byte[] Data)
    {
        // Enable Chip Select
        XDCS.Write(false);

        // First Send 32 bytes blocks
        if (Data.Length >= 32)
        {
            for (int x = 0; x < ((Data.Length) / 32); x++)
            {
                // Copy Data to temporary buffer
                Array.Copy(Data, x * 32, SendData32Buffer, 0, 32);

                // Wait until VS1002 is ready to recieve data
                WaitForDataReady();

                // Write Data
                SpiPort.Write(SendData32Buffer);
            }
        }

        // Calculate remaining size
        int Remaining = Data.Length % 32;
        
        // When there are remaining bytes send them
        if (Remaining != 0)
        {
            // Create and load buffer for remaining bytes
            byte[] BufferForRemain = new byte[Remaining];
            Array.Copy(Data, Data.Length - Remaining, BufferForRemain, 0, Remaining);

            // Wait until VS1002 is ready to recieve data
            WaitForDataReady();

            // Write Data
            SpiPort.Write(BufferForRemain);
        }

        // Disable Chip Select
        XDCS.Write(true);



    }

    /// <summary>
    /// Set volume control
    /// </summary>
    /// <param name="Left">Volume for left channel (0x00 - 0xFF)</param>
    /// <param name="Right">Volume for right channel (0x00 - 0xFF)</param>
    public static void SetVolume(Byte Left, Byte Right)
    {
        SCI_Write(VS1002Registers.VOL, (UInt16)((Left << 8) | Right));
        Thread.Sleep(1);
    }

    /// <summary>
    /// Set Bass Boost
    /// </summary>
    /// <param name="Boost">Boost in dB (0-15dB)</param>
    /// <param name="LowerLimit">Lower frequency (*10Hz, 20-150Hz) </param>
    public static void SetBassBoost(UInt16 Boost, UInt16 LowerLimit)
    {
        if (LowerLimit < 2) LowerLimit = 2;
        if (LowerLimit > 15) LowerLimit = 15;

        if (Boost < 0) Boost = 0;
        if (Boost > 15) Boost = 15;

        SCI_Write(VS1002Registers.BASS,((UInt16) (((Boost << 4) & 0xF0) | (LowerLimit & 0x0F))));
        Thread.Sleep(1);
    }

    /// <summary>
    /// Read MP3 Header from VS1002.
    /// Note: When decoding WAV it always returns byte[] {0x76,0x65,0x77,0x61}
    /// </summary>
    /// <returns>Header data</returns>
    public static byte[] ReadMP3Header()
    {
        UInt16 HeaderH;
        UInt16 HeaderL;
        byte[] Header = new byte[4];

        HeaderH = SCI_Read(VS1002Registers.HDAT1);
        HeaderL = SCI_Read(VS1002Registers.HDAT0);

        Header[0] = ((byte)(HeaderH >> 8));
        Header[1] = ((byte)(HeaderH));
        Header[2] = ((byte)(HeaderL >> 8));
        Header[3] = ((byte)(HeaderL));

        return Header;
    }



}
