using System.Drawing;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    internal class Seperator : ThemeControl
    {

        private Color _Color1;
        private Color _Color2;
        private Orientation _Direction;

        public Color Color1
        {
            get
            {
                return _Color1;
            }
            set
            {
                _Color1 = value;
                Invalidate();
            }
        }

        public Color Color2
        {
            get
            {
                return _Color2;
            }
            set
            {
                _Color2 = value;
                Invalidate();
            }
        }

        public Orientation Direction
        {
            get
            {
                return _Direction;
            }
            set
            {
                _Direction = value;
                Invalidate();
            }
        }

        public Seperator()
        {
            _Color1 = Color.FromArgb(90, Color.Black);
            _Color2 = Color.FromArgb(14, Color.White);
            AllowTransparent();
        }

        public override void PaintHook()
        {
            bool flag = BackColor != Color.Transparent;
            if (flag)
                G.Clear(BackColor);
            flag = _Direction == Orientation.Horizontal;
            if (flag)
            {
                G.DrawLine(new Pen(_Color1), 0, Height / 2, Width, Height / 2);
                G.DrawLine(new Pen(_Color2), 0, checked((Height / 2) + 1), Width, checked((Height / 2) + 1));
            }
            else
            {
                G.DrawLine(new Pen(_Color1), Width / 2, 0, Width / 2, Height);
                G.DrawLine(new Pen(_Color2), checked((Width / 2) + 1), 0, checked((Width / 2) + 1), Height);
            }
        }

    } // class Seperator

}

