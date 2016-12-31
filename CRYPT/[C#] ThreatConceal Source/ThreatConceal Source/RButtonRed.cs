using System;
using System.Drawing;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    internal class RButtonRed : ThemeControl
    {

        private SolidBrush B1;
        private Color C1;
        private Color C2;
        private Color C3;
        private Color C4;
        private int I1;
        private Pen P1;
        private TextureBrush Tile;

        public RButtonRed()
        {
            C1 = Color.FromArgb(40, 40, 40);
            C2 = Color.FromArgb(30, 30, 30);
            C3 = Color.FromArgb(20, Color.White);
            C4 = Color.FromArgb(35, 255, 255, 255);
            B1 = new SolidBrush(Color.FromArgb(10, Color.White));
            P1 = new Pen(Color.FromArgb(65, 65, 65));
            CreateTile();
        }

        private void CreateTile()
        {
            // trial
        }

        public override void PaintHook()
        {
            ThemeControl.State state;

            G.Clear(C1);
            DrawGradient(C2, C1, 0, 0, Width, checked((int)Math.Round((double)Height * 0.85)), 90.0F);
            G.FillRectangle(Tile, ClientRectangle);
            I1 = checked((int)Math.Round((double)Height * 0.45));
            switch ((byte)MouseState)
            {
                case 0:
                    DrawGradient(C3, Color.Transparent, 0, 0, Width, I1, 90.0F);
                    break;

                case 1:
                    DrawGradient(C3, Color.Transparent, 0, 0, Width, I1, 90.0F);
                    G.FillRectangle(B1, ClientRectangle);
                    break;
            }
            DrawText(HorizontalAlignment.Center, Color.Red, ImageWidth);
            DrawIcon(HorizontalAlignment.Left, 0);
            DrawBorders(Pens.Black, P1, ClientRectangle);
            DrawGradient(Color.Transparent, C4, 1, 0, 1, Height / 2, 90.0F);
            DrawGradient(Color.Transparent, C4, checked(Width - 2), 0, 1, Height / 2, 90.0F);
        }

    } // class RButtonRed

}

