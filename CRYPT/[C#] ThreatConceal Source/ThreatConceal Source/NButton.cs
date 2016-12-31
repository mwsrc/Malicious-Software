using System.Drawing;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    internal class NButton : ThemeControl
    {

        private Color C1;
        private Color C2;
        private Pen P1;

        public NButton()
        {
            AllowTransparent();
            C1 = Color.FromArgb(220, 220, 220);
            C2 = Color.FromArgb(250, 250, 250);
            P1 = new Pen(Color.FromArgb(180, 180, 180));
        }

        public override void PaintHook()
        {
            bool flag = MouseState == ThemeControl.State.MouseDown;
            if (flag)
                DrawGradient(C1, C2, 0, 0, Width, Height, 90.0F);
            else
                DrawGradient(C2, C1, 0, 0, Width, Height, 90.0F);
            G.DrawLine(Pens.White, 0, 1, Width, 1);
            DrawGradient(Color.White, Color.Transparent, 1, 0, 1, Height, 90.0F);
            DrawText(HorizontalAlignment.Center, ForeColor, ImageWidth);
            DrawIcon(HorizontalAlignment.Left, 0);
            G.DrawRectangle(P1, 0, 0, checked(Width - 1), checked(Height - 1));
            DrawCorners(BackColor, ClientRectangle);
        }

    } // class NButton

}

