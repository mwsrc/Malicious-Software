using System.Drawing;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    internal class RTheme : Theme
    {

        private SolidBrush B1;
        private SolidBrush B2;
        private Color C1;
        private Color C2;
        private Pen P1;
        private Pen P2;
        private TextureBrush Tile;

        public RTheme()
        {
            Color color;

            MoveHeight = 26;
            C1 = Color.FromArgb(40, 40, 40);
            C2 = Color.FromArgb(30, 30, 30);
            B1 = new SolidBrush(Color.FromArgb(12, Color.White));
            B2 = new SolidBrush(Color.FromArgb(28, 28, 28));
            P1 = new Pen(Color.FromArgb(90, 90, 90));
            P2 = new Pen(Color.FromArgb(70, 70, 70));
            CreateTile();
            BackColor = B2.Color;
            ForeColor = Color.White;
            TransparencyKey = Color.Fuchsia;
        }

        private void CreateTile()
        {
            // trial
        }

        public override void PaintHook()
        {
            G.Clear(C1);
            DrawGradient(C2, C1, 0, 0, Width, 24, 90.0F);
            G.FillRectangle(Tile, 0, 0, Width, 28);
            G.FillRectangle(B1, 0, 0, Width, 12);
            G.FillRectangle(B2, 6, 26, checked(Width - 12), checked(Height - 32));
            DrawText(HorizontalAlignment.Left, Color.White, checked(ImageWidth + 5));
            DrawIcon(HorizontalAlignment.Left, 5);
            DrawBorders(Pens.Black, P1, ClientRectangle);
            Rectangle rectangle = new Rectangle(6, 26, checked(Width - 12), checked(Height - 32));
            DrawBorders(P2, Pens.Black, rectangle);
            DrawCorners(Color.Fuchsia, ClientRectangle);
        }

    } // class RTheme

}

