using System.Drawing;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    internal class GButton : ThemeControl
    {

        private Color C1;
        private Color C2;
        private Pen P1;
        private Pen P2;

        public GButton()
        {
            P1 = new Pen(Color.FromArgb(25, 25, 25));
            P2 = new Pen(Color.FromArgb(11, Color.White));
            C1 = Color.FromArgb(41, 41, 41);
            C2 = Color.FromArgb(51, 51, 51);
        }

        public override void PaintHook()
        {
            bool flag = MouseState == ThemeControl.State.MouseDown;
            if (flag)
                DrawGradient(C1, C2, 0, 0, Width, Height, 90.0F);
            else
                DrawGradient(C2, C1, 0, 0, Width, Height, 90.0F);
            DrawText(HorizontalAlignment.Center, ForeColor, 0);
            DrawIcon(HorizontalAlignment.Left, 0);
            DrawBorders(P1, P2, ClientRectangle);
            DrawCorners(BackColor, ClientRectangle);
        }

    } // class GButton

}

