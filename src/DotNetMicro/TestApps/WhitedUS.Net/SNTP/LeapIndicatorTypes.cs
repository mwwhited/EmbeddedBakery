
namespace WhitedUS.Net.SNTP
{
    /// <summary>
    /// Leap Indicator (LI)
    /// </summary>
    /// <remarks>
    ///  Code warning of impending leap-second to be inserted at the end of
    ///  the last day of the current month.
    /// </remarks>
    public enum LeapIndicatorTypes : byte //really it's half a nibble
    {
        /// <summary>
        /// no warning
        /// </summary>
        NoWarning = 0,

        /// <summary>
        /// +1 second (following minute has 61 seconds)
        /// </summary>
        Plus1Second = 1,

        /// <summary>
        /// -1 second (following minute has 59 seconds)
        /// </summary>
        Minus1Second = 2,

        /// <summary>
        /// Clock not synchronized
        /// </summary>
        Alarm = 3
    }
}
