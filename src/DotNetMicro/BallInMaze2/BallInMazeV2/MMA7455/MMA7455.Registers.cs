using System;
using Microsoft.SPOT;
using FusionWare.SPOT;
using Microsoft.SPOT.Hardware;
using FusionWare.SPOT.Hardware;

namespace DeviceSolutions.SPOT.Hardware
{
    // This is in a separate file using a partial class to isolate it from the rest
    // of the actual driver code and to lay the groundwork for generating this file
    // from a simpler text/XML register definition file and custom "designer" of
    // some sort in the future.
    partial class MMA7455
    {
        /// <summary>struct for accessing bit fields in the values for the ChipID register</summary>
        /// <remarks>
        /// This is a struct and not a class to make sure its size is minimized and that
        /// it maintains the value semantics of the underlying ushort type.
        /// </remarks>
        /// <Note>
        /// You will most likely not use this class AS-IS. It is intended to serve as a guide
        /// and a skeleton template for device specific register bit field access.
        /// </Note>
        public struct ChipIDReg
        {
            #region Private Field Definitions

            /// <summary>Enumeration for all bit fields in the value</summary>
            /// <remarks>
            /// This enumeration is used internally to name all the fields within the register.
            /// the value of member of the enumeration is used as an index to the FiledMasks
            /// static array.
            /// </remarks>
            /// <Note>
            /// You should changes these to reflect the names of the device specifications
            /// this driver is for
            /// </Note>
            enum Fields
            {
                Minor,
                Major
            }

            /// <summary>static table describing the bit positions of fields in the register</summary>
            /// <Note>
            /// You should changes the bit positions and number of fields to reflect the device
            /// specifications this driver is for.
            /// </Note>
            static readonly BitFieldMask[] FieldMasks = {
                        new BitFieldMask(0, 7),   // Minor [Low byte]
                        new BitFieldMask(8, 15),  // Major [High Byte]
                    };
            #endregion

            public ChipIDReg(ushort Value)
            {
                this.Value = Value;
            }

            #region Bit Field value enumerations
            // enumerations for values of the various fields go here
            // these are all "right shifted" values so they are easier to follow
            // in the code and debugger. 
            #endregion

            #region Bit Field Properties
            // These properties provide public accessors for the bit fields within the value

            public byte Major
            {
                get { return (byte)FieldMasks[(int)Fields.Major].GetBitField(this.Value); }
                set { FieldMasks[(int)Fields.Major].SetBitField(ref this.Value, (ushort)value); }
            }
            public byte Minor
            {
                get { return (byte)FieldMasks[(int)Fields.Minor].GetBitField(this.Value); }
                set { FieldMasks[(int)Fields.Minor].SetBitField(ref this.Value, (ushort)value); }
            }
            #endregion

            /// <summary>Raw Value containing bit fields described by this structure</summary>
            public ushort Value;
        }

        public struct I2CAD
        {
            enum Fields
            {
                DAD,
                I2CDIS
            }

            static readonly BitFieldMask[] FieldMasks = {
              new BitFieldMask(0, 6 ),  //  DAD
              new BitFieldMask(7, 7 )   // I2CDIS  - !!! We never want to set this!!
            };

            public I2CAD(byte Value)
            {
                this.Value = Value;
            }

            public byte DeviceAddress
            {
                get { return FieldMasks[(int)Fields.DAD].GetBitField(this.Value); }
            }

            public byte Value;
        }
    }
}
