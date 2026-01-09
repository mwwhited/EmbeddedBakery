using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Input;

namespace WhitedUS.UI
{
    public interface IButtonController
    {
        void OnButtonUp(object sender, ButtonEventArgs e);
    }
}
