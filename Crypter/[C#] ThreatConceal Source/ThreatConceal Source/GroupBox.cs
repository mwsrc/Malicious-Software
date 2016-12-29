using System.Drawing;

namespace CybeR_CryptZ
{

    internal class GroupBox : ThemeContainerControl
    {

        private Pen _Border1;
        private Pen _Border2;
        private Color _FillColor;

        public Color Border1
        {
            get
            {
                return _Border1.Color;
            }
            set
            {
                _Border1 = new Pen(value);
                Invalidate();
            }
        }

        public Color Border2
        {
            get
            {
                return _Border2.Color;
            }
            set
            {
                _Border2 = new Pen(value);
                Invalidate();
            }
        }

        public Color FillColor
        {
            get
            {
                return _FillColor;
            }
            set
            {
                _FillColor = value;
                Invalidate();
            }
        }

        public GroupBox()
        {
            _FillColor = Color.Transparent;
            AllowTransparent();
            _Border1 = new Pen(Color.FromArgb(90, Color.Black));
            _Border2 = new Pen(Color.FromArgb(14, Color.White));
        }

        public override void PaintHook()
        {
            // trial
        }

    } // class GroupBox

}

