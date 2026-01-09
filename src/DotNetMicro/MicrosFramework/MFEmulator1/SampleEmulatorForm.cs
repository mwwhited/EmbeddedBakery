//Copyright (C) Microsoft Corporation.  All rights reserved.

using System;
using System.Drawing;
using System.Threading;
using System.Windows.Forms;

namespace Microsoft.SPOT.Emulator.Sample
{
    /// <summary>
    /// This is the UI for the LCD sample
    /// </summary>
    public partial class SampleEmulatorForm : Form
    {
        Emulator _emulator;

        public SampleEmulatorForm(Emulator emulator)
        {
            _emulator = emulator;

            // Initializing the component on the UI form
            InitializeComponent();
        }

        protected override void OnLoad(EventArgs e)
        {
            //Give the buttonCollection focus to allow it to handle keyboard events
            this.buttonCollection.Select();
            
            base.OnLoad(e);
        }

        /// <summary>
        /// Helper method to initialize buttons.
        /// </summary>
        /// <param name="button">The button to be initialized.</param>
        /// <param name="componentId">The string identifying the button, found in the config file</param>
        /// <param name="key">The key that this button should respond to.</param>
        private void InitializeButton(Button button, string componentId, Keys key)
        {
            button.Port = _emulator.FindComponentById(componentId) as Gpio.GpioPort;
            button.Key = key;
        }

        public void OnInitializeComponent()
        {
            //initialize the lcd control with the lcd emulator component
            this.lcdDisplay.LcdDisplay = _emulator.LcdDisplay;

            //Grab the GPIO pins from the config file.  This can allow overriding 
            //the specific gpio pin numbers, for example, without having to change code.
            InitializeButton(this.buttonDown, "Pin_Down", Keys.Down);
            InitializeButton(this.buttonLeft, "Pin_Left", Keys.Left);
            InitializeButton(this.buttonRight, "Pin_Right", Keys.Right);
            InitializeButton(this.buttonUp, "Pin_Up", Keys.Up);
            InitializeButton(this.buttonSelect, "Pin_Select", Keys.Enter);
        }
    }
}