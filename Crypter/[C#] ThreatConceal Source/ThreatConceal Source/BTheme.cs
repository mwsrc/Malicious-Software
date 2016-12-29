using System.Drawing;

namespace CybeR_CryptZ
{

    internal class BTheme : Theme
    {

        public BTheme()
        {
            Color color;

            BackColor = Color.FromArgb(10, 10, 10);
            ForeColor = Color.FromArgb(200, 0, 0);
            TransparencyKey = Color.Fuchsia;
            MoveHeight = 32;
        }

        public override void PaintHook()
        {
            // trial
        }

    } // class BTheme

}

