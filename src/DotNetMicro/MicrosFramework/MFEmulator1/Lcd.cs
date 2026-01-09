//Copyright (C) Microsoft Corporation.  All rights reserved.

using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Collections.Generic;
using System.Diagnostics;
using System.Reflection;
using Microsoft.SPOT.Emulator;
using System.Windows.Forms;
using System.Windows.Forms.Design;
using System.ComponentModel;
using System.Runtime.InteropServices;
using System.Drawing.Drawing2D;
using Microsoft.SPOT.Emulator.Lcd;

namespace Microsoft.SPOT.Emulator.Sample
{    
    /// <summary>
    /// A WinForm control to display the contents of an LCD of a MicroFramework application
    /// </summary>
    public class LcdControl : Control
    {
        //The MicroFramework lcd emulator component
        Lcd.LcdDisplay _lcd;
        //A bitmap to store the current lcd contents
        Bitmap _bitmap;

        public LcdControl()
        {            
            this.SetStyle(ControlStyles.AllPaintingInWmPaint, true);
            this.SetStyle(ControlStyles.Opaque, true);            
        }

        /// <summary>
        /// The lcd emulator component
        /// </summary>
        public Lcd.LcdDisplay LcdDisplay
        {
            get { return _lcd; }
            set
            {
                if (_lcd != null)
                {
                    _lcd.OnDevicePaint -= new OnDevicePaintEventHandler(OnDevicePaint);
                }
                
                _lcd = value;

                if (_lcd != null)
                {
                    _lcd.OnDevicePaint += new OnDevicePaintEventHandler(OnDevicePaint);
                }
            }
        }
        
        /// <summary>
        /// Callback that occurs when the MicroFramework application flushes the lcd buffer to the screen.
        /// </summary>
        /// <param name="sender">The emulator component firing the event</param>
        /// <param name="args">What is being redrawn</param>
        private void OnDevicePaint(object sender, OnDevicePaintEventArgs args)
        {
            Bitmap bitmap = args.Bitmap;

            if (_bitmap == null)
            {
                //The first time the callback occurs, make a copy of the lcd contents.
                //It is necessary to create a copy because when this callback returns, the MicroFramework 
                //is able to write on the frame buffer.
                _bitmap = (Bitmap)bitmap.Clone();
            }
            else
            {
                //Lock the _bitmap object.  This bitmap is accessed on the MicroFramework thread, during this callback,
                //as well as the UI thread, during paint.
                lock (_bitmap)
                {
                    Rectangle rectangle = new Rectangle(0, 0, _bitmap.Width, _bitmap.Height);

                    //Copy bitmap data.
                    BitmapData bdSrc =  bitmap.LockBits(rectangle, System.Drawing.Imaging.ImageLockMode.ReadOnly, bitmap.PixelFormat);
                    BitmapData bdDst = _bitmap.LockBits(rectangle, System.Drawing.Imaging.ImageLockMode.WriteOnly, bitmap.PixelFormat);

                    //Copying the entire frame buffer can be substantially slower in safe code
                    //Copy the bitmap data, 4 bytes at a time.
                    unsafe
                    {
                        int* src = (int*)bdSrc.Scan0.ToPointer();
                        int* dst = (int*)bdDst.Scan0.ToPointer();
                        int cInts = bdSrc.Stride / 4 * bitmap.Height;

                        Debug.Assert(bdSrc.Stride > 0);
                        Debug.Assert(bitmap.Width == _bitmap.Width);
                        Debug.Assert(bitmap.Height == _bitmap.Height);
                        Debug.Assert(bitmap.PixelFormat == _bitmap.PixelFormat);

                        for (int i = 0; i < cInts; i++)
                        {
                            *dst++ = *src++;
                        }
                    }
                    
                     bitmap.UnlockBits(bdSrc);
                    _bitmap.UnlockBits(bdDst);                     
                }
            }            

            this.Invalidate(); 
        }
        
        protected override void OnPaint(PaintEventArgs e)
        {
            if (_bitmap != null)
            {
                //synchonize access to the bitmap with the MicroFramwork thread
                lock (_bitmap)
                {
                    e.Graphics.DrawImage(_bitmap, 0, 0);
                }
            }
            else
            {
                base.OnPaintBackground(e);
            }

            if (this.DesignMode)
            {             
                //In design time, paint a dotted outline of the control.
                OnPaintDesignMode(e);
            }

            base.OnPaint(e);
        }

        /// <summary>
        /// A very simple design mode to allow this control to be used with the WinForm designer
        /// </summary>
        private void OnPaintDesignMode(PaintEventArgs e)
        {
            Rectangle rc = this.ClientRectangle;
            Color penColor;

            // Black or white pen?  Depends on the color of the control.
            //
            if (this.BackColor.GetBrightness() < .5)
            {
                penColor = ControlPaint.Light(this.BackColor);
            }
            else
            {
                penColor = ControlPaint.Dark(this.BackColor); ;
            }

            using (Pen pen = new Pen(penColor))
            {
                pen.DashStyle = DashStyle.Dash;

                rc.Width--;
                rc.Height--;
                e.Graphics.DrawRectangle(pen, rc);
            }
        }
    }
}
