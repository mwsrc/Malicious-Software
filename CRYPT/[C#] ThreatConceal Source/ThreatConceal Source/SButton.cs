using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    internal class SButton : ThemeControl
    {

        [DebuggerNonUserCode]
        public SButton()
        {
        }

        public override void PaintHook()
        {
            ThemeControl.State state;

            switch ((byte)MouseState)
            {
                case 1:
                    DrawGradient(Color.FromArgb(0, 235, 22), Color.FromArgb(0, 210, 22), 0, 0, Width, Height, 90.0F);
                    break;

                case 2:
                    DrawGradient(Color.FromArgb(0, 195, 22), Color.FromArgb(0, 220, 27), 0, 0, Width, Height, 90.0F);
                    break;

                case 0:
                    DrawGradient(Color.FromArgb(0, 220, 27), Color.FromArgb(0, 195, 22), 0, 0, Width, Height, 90.0F);
                    break;
            }
            bool flag = MouseState != ThemeControl.State.MouseDown;
            if (flag)
            {
                Rectangle rectangle = new Rectangle(0, 0, Width, Height / 2);
                LinearGradientBrush linearGradientBrush = new LinearGradientBrush(rectangle, Color.FromArgb(150, Color.Lime), Color.FromArgb(50, Color.Lime), 90.0F);
                G.FillRectangle(linearGradientBrush, rectangle);
            }
            DrawText(HorizontalAlignment.Center, Color.FromArgb(0, 230, 30), 1, 1);
            DrawText(HorizontalAlignment.Center, Color.FromArgb(0, 130, 15), 0);
            DrawBorders(new Pen(Color.FromArgb(0, 190, 20)), new Pen(Color.FromArgb(0, 240, 30)), ClientRectangle);
            DrawCorners(BackColor, ClientRectangle);
        }

    } // class SButton

}

