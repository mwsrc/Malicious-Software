using System.Drawing;

namespace CybeR_CryptZ
{

    internal class STheme : Theme
    {

        public STheme()
        {
            Color color;

            BackColor = Color.White;
            ForeColor = Color.FromArgb(0, 130, 15);
            TransparencyKey = Color.Fuchsia;
            MoveHeight = 32;
        }

        public override void PaintHook()
        {
            // trial
        }

    } // class STheme

}

