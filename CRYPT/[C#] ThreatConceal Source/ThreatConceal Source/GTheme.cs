using System.Drawing;

namespace CybeR_CryptZ
{

    internal class GTheme : Theme
    {

        private Color C1;
        private Color C2;
        private Pen P1;
        private Pen P2;

        public GTheme()
        {
            Color color;

            MoveHeight = 29;
            C1 = Color.FromArgb(41, 41, 41);
            C2 = Color.FromArgb(25, 25, 25);
            P1 = new Pen(Color.FromArgb(58, 58, 58));
            P2 = new Pen(C2);
            BackColor = C1;
            ForeColor = Color.FromArgb(100, 100, 100);
            TransparencyKey = Color.Fuchsia;
        }

        public override void PaintHook()
        {
            // trial
        }

    } // class GTheme

}

