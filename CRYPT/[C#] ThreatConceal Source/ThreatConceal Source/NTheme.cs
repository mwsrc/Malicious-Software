using System.Drawing;

namespace CybeR_CryptZ
{

    internal class NTheme : Theme
    {

        private Color C1;
        private Pen P1;

        public NTheme()
        {
            Color color;

            MoveHeight = 34;
            C1 = Color.FromArgb(235, 235, 235);
            P1 = new Pen(Color.FromArgb(150, 150, 150));
            BackColor = Color.White;
            ForeColor = Color.FromArgb(110, 110, 110);
            TransparencyKey = Color.Fuchsia;
        }

        public override void PaintHook()
        {
            // trial
        }

    } // class NTheme

}

