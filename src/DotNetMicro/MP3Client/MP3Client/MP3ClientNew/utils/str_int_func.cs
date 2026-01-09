using System;
using Microsoft.SPOT;

/// <summary>
/// Provides some commonly used functions for converting from/to integers and strings
/// </summary>
static public class Str_Int_Func
{

    /// <summary>
    /// Make string from integer with 0 as padding
    /// </summary>
    /// <param name="Number">Integer to convert</param>
    /// <param name="Size">Minimum string size</param>
    /// <returns></returns>
    static public String IntToString(Int32 Number, Int32 Size)
    {
        // Make string from Integer
        String RetString = Number.ToString();

        // Pad with zeros
        while (RetString.Length < Size)
            RetString = "0" + RetString;

        // Return string
        return RetString;
    }


    /// <summary>
    /// Make a integer from a string (int.Parse)
    /// </summary>
    /// <param name="s">String to parse</param>
    /// <returns>Integer from String</returns>
    static public int StrVal(String s)
    {
        // Value to return
        int val = 0;

        // Make array of chars 
        char[] sToChar = s.ToCharArray();

        // Process al chars in string
        for (int x = 0; x < sToChar.Length; x++)
        {
            // Convert char to byte
            byte sValue = ((byte)sToChar[x]);

            // If char is in 0-9
            if ((sValue >= 48) & (sValue <= 57))
            {
                // Multiply by 10 and add number
                val *= 10;
                val += sValue - 48;
            }
        }

        return val;
    }

}
