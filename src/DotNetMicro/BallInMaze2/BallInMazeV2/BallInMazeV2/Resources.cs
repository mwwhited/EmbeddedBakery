using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Presentation.Media;
using DeviceSolutions.SPOT;
using FusionWare.SPOT;

namespace BallInMazeV2
{
    internal class BitMaps
    {
        /// <summary>Retrieves the resources for a transparent bitmap and composites it against a solid background to create a bitmap</summary>
        /// <param name="Id">Id of the resource for the bitmap.</param>
        /// <param name="BkgColor">Background color to use for the alpha blend</param>
        /// <returns>Bitmap the composite image</returns>
        /// <remarks>
        /// <para>The Micro Framework does not have any direct support for
        /// alpha blend compositing so it has to be done in managed code,
        /// which is a bit of an expensive process in terms of CPU cycles.</para>
        /// <para>This method is used to perform the blending once to composite
        /// to a background color. After that is done the pure background color
        /// parts are marked as a transparency map to get the actual image to
        /// render nice and smooth. This trick only works with a solid color 
        /// background.</para> 
        /// </remarks>
        internal static Bitmap CompositedBitMap(Resources.BinaryResources Id, Color BkgColor)
        {
            // Alpha blend the bitmaps onto the background color
            Bitmap bitmap = BitmapHelper.CompositeOnColor(Resources.GetBytes(Id), BkgColor);
            bitmap.MakeTransparent(BkgColor);

            return bitmap;
        }
    }
}
