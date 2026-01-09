//Copyright (C) Microsoft Corporation.  All rights reserved.

using System;
using System.Threading;
using System.Windows.Forms;
using Microsoft.SPOT.Emulator;

namespace Microsoft.SPOT.Emulator.Sample
{
    /// <summary>
    /// This sample shows ....
    /// </summary>
    public class SampleEmulator : Emulator
    {
        private SampleEmulatorForm _form;

        /// <summary>
        /// Called by the emulator after all components were setup and registered
        /// </summary>
        public override void InitializeComponent()
        {
            base.InitializeComponent();

            _form = new SampleEmulatorForm(this.Emulator);
            
            _form.OnInitializeComponent();

            // Launch the UI thread.
            Thread uiThread = new Thread(RunForm);
            uiThread.SetApartmentState(ApartmentState.STA);
            uiThread.Start();            
        }

        /// <summary>
        /// Called by the emulator after the program exits
        /// </summary>
        public override void UninitializeComponent()
        {
            base.UninitializeComponent();

            //When the Micro Framework is shutting down, inform the the WinForm application 
            //to exit as well.
            Application.Exit();
        }

        /// <summary>
        /// Calling the .Net method that will handle all the UI magic
        /// </summary>        
        private void RunForm()
        {
            Application.Run(_form);

            //When this WinForm exits, inform the emulator to shut down.            
            this.Emulator.Stop();
        }

        [STAThread]
        public static void Main()
        {
            (new SampleEmulator()).Start();
        }
        
    }
}
