using System;
using Microsoft.SPOT;


class RingBuffer
{
    /// <summary>
    /// Actual Buffer
    /// </summary>
    private byte[] Data;

    /// <summary>
    /// Begin of Data
    /// </summary>
    private int BOD;

    /// <summary>
    /// End of Data
    /// </summary>
    private int EOD;

    /// <summary>
    /// Producer point
    /// </summary>
    private int PP;

    /// <summary>
    /// Consumer point
    /// </summary>
    private int CP;

    /// <summary>
    /// Size of buffer
    /// </summary>
    public int Size;

    /// <summary>
    /// Constructor
    /// </summary>
    /// <param name="size">Size of ringbuffer</param>
    public RingBuffer(int nSize)
    {
        // Make byte array for data
        Size = nSize;
        Data = new byte[Size + 1];

        // Set begin of data and consumer point
        BOD = 0;
        CP = 0;

        // Set end of data and producer point
        EOD = 1;
        PP = 1;
    }

    /// <summary>
    /// Read data from RingBuffer into byte array
    /// </summary>
    /// <param name="nData">Byte array for storing RingBuffer read data</param>
    public void Read(ref byte[] nData)
    {
        // Check if requested data doesn't exceed bytes in buffer
        if (nData.Length > inBuffer())
        {
            throw new Exception("RingBuffer Underrun");
        }

        // Init buffer for return data

        // Check if data flips around the end of the array
        if ((CP+nData.Length) > Data.Length)
        {
            // First read data till array ends
            int BytesRemaining = Data.Length - CP;
            Array.Copy(Data, CP, nData, 0, BytesRemaining);
            CP = 0;
            BOD = 0;


            // Then read second part of data
            Array.Copy(Data, CP, nData, BytesRemaining, nData.Length - BytesRemaining);
            CP = nData.Length - BytesRemaining;
            BOD = nData.Length - BytesRemaining;
        }
        else
        {
            // No just read bytes from buffer
            Array.Copy(Data, CP, nData, 0, nData.Length);
            CP += nData.Length;
            BOD += nData.Length;
        }
    }

    /// <summary>
    /// Add byte array to RingBuffer
    /// </summary>
    /// <param name="nData"></param>
    public void Add(ref byte[] nData)
    {
        Add(ref nData, nData.Length);
    }

    public void Add(ref byte[] nData, int nBytes)
    {
        // If nBytes is bigger then size of nData then error
        if (nBytes > nData.Length)
            throw new Exception("Add Buffer size to small");

        // Check if data is data doesn't exceed left data space
        if (nBytes > Available())
        {
            throw new Exception("RingBuffer Overflow");
        }

        // Check if data flips around the end of the array
        if ((nBytes + PP) > Size)
        {
            // First add data till array ends
            int BytesRemaining = Data.Length - PP;
            Array.Copy(nData, 0, Data, PP, BytesRemaining);
            PP = 0;
            EOD = 0;

            // Then add second part of data
            Array.Copy(nData, BytesRemaining, Data, PP, nBytes - BytesRemaining);
            PP = nBytes - BytesRemaining;
            EOD = nBytes - BytesRemaining;
        }
        else
        {
            // No, Just add bytes to buffer
            Array.Copy(nData, 0, Data, PP, nBytes);
            PP += nBytes;
            EOD += nBytes;
        }

        //dbg("Add()");
    }

    /// <summary>
    /// Returns available data space
    /// </summary>
    /// <returns>Available data space</returns>
    public int Available()
    {
        return Size - inBuffer();
    }

    /// <summary>
    /// Return bytes currently in buffer
    /// </summary>
    /// <returns>Bytes in buffer</returns>
    public int inBuffer()
    {
        if (EOD > BOD)
        {
            // Array isn't flipped
            return ((EOD - BOD) - 1);
        }
        else
        {
            // Array is flipped 
            return ((BOD - EOD) - 1);
        }
    }

}

