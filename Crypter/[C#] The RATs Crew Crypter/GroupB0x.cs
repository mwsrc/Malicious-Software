using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;

namespace The_RATs_Crew_Crypter
{
    abstract class ThemeContainerControl : ContainerControl
    {

        #region " Initialization "

        protected Graphics G;
        protected Bitmap B;
        public ThemeContainerControl()
        {
            SetStyle((ControlStyles)139270, true);
            B = new Bitmap(1, 1);
            G = Graphics.FromImage(B);
        }

        public void AllowTransparent()
        {
            SetStyle(ControlStyles.Opaque, false);
            SetStyle(ControlStyles.SupportsTransparentBackColor, true);
        }

        #endregion

        #region " Convienence "

        public abstract void PaintHook();
        protected override sealed void OnPaint(PaintEventArgs e)
        {
            if (Width == 0 || Height == 0)
                return;
            PaintHook();
            e.Graphics.DrawImage(B, 0, 0);
        }

        protected override void OnSizeChanged(EventArgs e)
        {
            if (!(Width == 0) && !(Height == 0))
            {
                B = new Bitmap(Width, Height);
                G = Graphics.FromImage(B);
                Invalidate();
            }
            base.OnSizeChanged(e);
        }

        private bool _NoRounding;
        public bool NoRounding
        {
            get { return _NoRounding; }
            set
            {
                _NoRounding = value;
                Invalidate();
            }
        }

        private Rectangle _Rectangle;

        private LinearGradientBrush _Gradient;
        protected void DrawCorners(Color c, Rectangle rect)
        {
            if (_NoRounding)
                return;
            B.SetPixel(rect.X, rect.Y, c);
            B.SetPixel(rect.X + (rect.Width - 1), rect.Y, c);
            B.SetPixel(rect.X, rect.Y + (rect.Height - 1), c);
            B.SetPixel(rect.X + (rect.Width - 1), rect.Y + (rect.Height - 1), c);
        }

        protected void DrawBorders(Pen p1, Pen p2, Rectangle rect)
        {
            G.DrawRectangle(p1, rect.X, rect.Y, rect.Width - 1, rect.Height - 1);
            G.DrawRectangle(p2, rect.X + 1, rect.Y + 1, rect.Width - 3, rect.Height - 3);
        }

        protected void DrawGradient(Color c1, Color c2, int x, int y, int width, int height, float angle)
        {
            _Rectangle = new Rectangle(x, y, width, height);
            _Gradient = new LinearGradientBrush(_Rectangle, c1, c2, angle);
            G.FillRectangle(_Gradient, _Rectangle);
        }
        #endregion

    }

    class GroupBox : ThemeContainerControl
    {

        public GroupBox()
        {
            AllowTransparent();
            _Border1 = new Pen(Color.FromArgb(90, Color.Black));
            _Border2 = new Pen(Color.FromArgb(14, Color.White));
        }

        private Pen _Border1;
        public Color Border1
        {
            get { return _Border1.Color; }
            set
            {
                _Border1 = new Pen(value);
                Invalidate();
            }
        }

        private Pen _Border2;
        public Color Border2
        {
            get { return _Border2.Color; }
            set
            {
                _Border2 = new Pen(value);
                Invalidate();
            }
        }

        private Color _FillColor = Color.Transparent;
        public Color FillColor
        {
            get { return _FillColor; }
            set
            {
                _FillColor = value;
                Invalidate();
            }
        }

        public override void PaintHook()
        {
            G.Clear(_FillColor);
            DrawBorders(_Border1, _Border2, ClientRectangle);
            DrawCorners(BackColor, ClientRectangle);
        }

    }

}
