
namespace WhitedUS.Net.SNTP
{
    /// <summary>
    /// Mode
    /// </summary>
    /// <remarks>
    /// This is a three-bit integer indicating the mode
    /// </remarks>
    public enum NTPModeTypes : byte
    {
        Reserved = 0,
        SymmetricActive = 1,
        SymmetricPassive = 2,
        Client = 3,
        Server = 4,
        Broadcast = 5,
        ReservedForNTPControlMessage = 6,
        ReservedForPrivateUse = 7
    }
}
