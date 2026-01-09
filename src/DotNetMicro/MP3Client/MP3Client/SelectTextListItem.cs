/*
 * MP3 Shoutcast client with VS1002 Decoder. 
 * 
 * This program lets the user select a radiostation. 
 * It connects and streams the MP3 data to the VS1002 device. 
 * It contains a simple FIFO implementation.
 * 
 * @copyright (c) 2008 EFR Kool
 * @licence: Creative Commons, Attribution-Share Alike 3.0 Netherlands, http://creativecommons.org/licenses/by-sa/3.0/nl/deed.en
 * 
 */

using System;
using Microsoft.SPOT;
using Microsoft.SPOT.Presentation;
using Microsoft.SPOT.Presentation.Controls;

namespace MP3Client
{
    /// <summary>
    /// Simple listbox item. Inverses on selection
    /// </summary>
    class SelectTextListItem : ListBoxItem
    {
        private Text TextItem;

        public SelectTextListItem(String txtForItem)
        {
            Font TextItemFont = Fonts.smallFont2;

            this.Width = 128;
            this.Height = TextItemFont.Height + 4;

            Canvas Can = new Canvas();
            Can.Width = 128;
            Can.Height = TextItemFont.Height + 4;

            TextItem = new Text(TextItemFont, "" + txtForItem);
            TextItem.ForeColor = Colors.ForeColor;
            
            TextItem.Width = 123;
            TextItem.Height = TextItemFont.Height;

            Canvas.SetTop(TextItem, 2);
            Canvas.SetLeft(TextItem, 5);

            Can.Children.Add(TextItem);

            this.Child = Can;

            this.Background = new Microsoft.SPOT.Presentation.Media.SolidColorBrush(Colors.BackColor);



        }

        protected override void OnIsSelectedChanged(bool isSelected)
        {
            if (isSelected)
            {
                this.Background = new Microsoft.SPOT.Presentation.Media.SolidColorBrush(Colors.ForeColor);
                TextItem.ForeColor = Colors.BackColor;
            }
            else
            {
                this.Background = new Microsoft.SPOT.Presentation.Media.SolidColorBrush(Colors.BackColor);
                TextItem.ForeColor = Colors.ForeColor;
            }

        }
    }
}
