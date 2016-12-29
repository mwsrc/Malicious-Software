using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    internal class BButton : ThemeControl
    {

        [DebuggerNonUserCode]
        public BButton()
        {
        }

        public override void PaintHook()
        {
            bool flag = MouseState == ThemeControl.State.MouseDown;
            if (flag)
            {
                G.Clear(Color.FromArgb(9, 9, 9));
            }
            else
            {
                G.Clear(Color.FromArgb(10, 10, 10));
                G.DrawRectangle(new Pen(Color.FromArgb(15, 15, 15)), 2, 2, checked(Width - 4), checked(Height - 4));
            }
            DrawText(HorizontalAlignment.Center, Color.Black, 1, 1);
            DrawText(HorizontalAlignment.Center, Color.FromArgb(200, 0, 0), 0);
            DrawBorders(new Pen(Color.FromArgb(15, 15, 15)), Pens.Black, ClientRectangle);
            DrawCorners(BackColor, ClientRectangle);
        }

    } // class BButton

}

