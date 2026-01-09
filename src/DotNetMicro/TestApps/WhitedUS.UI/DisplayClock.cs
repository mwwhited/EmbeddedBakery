using System;
using Microsoft.SPOT;
using WhitedUS.UI.Controls;
using Microsoft.SPOT.Input;
using Microsoft.SPOT.Hardware;
using WhitedUS.Devices;

namespace WhitedUS.UI
{
    public partial class DisplayClock : IButtonController 
    {
        private Clock clock;

        partial void OnComponentsInitialized()
        {
            clock = new Clock(this.Width, this.Height);
            this.Child = clock;
        }

        protected override void OnGotFocus(FocusChangedEventArgs e)
        {
            if (clock != null)
                clock.DoActivate(this, e);
            base.OnGotFocus(e);
        }

        protected override void OnLostFocus(FocusChangedEventArgs e)
        {
            if (clock != null)
                clock.DoDeactivate(this, e);
            base.OnLostFocus(e);
        }

        #region IButtonController Members

        /// <summary>
        /// Remap Button commands received by the clock to the radio
        /// </summary>
        /// <param name="sender">object sending the event</param>
        /// <param name="e">event message</param>
        public void OnButtonUp(object sender, ButtonEventArgs e)
        {
            if (!(sender is DisplayClock))
                return;

            var radio = WindowController.Instance
                .GetWindow(States.Radio) as IButtonController;
            if (radio != null)
                radio.OnButtonUp(this, e);
        }

        #endregion
    }
}
