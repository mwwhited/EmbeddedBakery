using System;
using Microsoft.SPOT;

namespace WhitedUS.UI
{
    public interface IDeactivator
    {
        void DoDeactivate(object sender, EventArgs e);
    }
}
