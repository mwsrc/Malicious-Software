using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    internal abstract class ThemeContainerControl : ContainerControl
    {

        private LinearGradientBrush _Gradient;
        private bool _NoRounding;
        private Rectangle _Rectangle;
        protected Bitmap B;
        protected Graphics G;

        public bool NoRounding
        {
            get
            {
                return _NoRounding;
            }
            set
            {
                _NoRounding = value;
                Invalidate();
            }
        }

        public ThemeContainerControl()
        {
            SetStyle(ControlStyles.UserPaint | ControlStyles.Opaque | ControlStyles.AllPaintingInWmPaint | ControlStyles.OptimizedDoubleBuffer, true);
            B = new Bitmap(1, 1);
            G = Graphics.FromImage(B);
        }

        public void AllowTransparent()
        {
            SetStyle(ControlStyles.Opaque, false);
            SetStyle(ControlStyles.SupportsTransparentBackColor, true);
        }

        protected void DrawBorders(Pen p1, Pen p2, Rectangle rect)
        {
            // trial
        }

        protected void DrawCorners(Color c, Rectangle rect)
        {
            bool flag = _NoRounding;
            if (flag)
            {
            }
            else
            {
                B.SetPixel(rect.X, rect.Y, c);
                B.SetPixel(checked(rect.X + checked(rect.Width - 1)), rect.Y, c);
                B.SetPixel(rect.X, checked(rect.Y + checked(rect.Height - 1)), c);
                B.SetPixel(checked(rect.X + checked(rect.Width - 1)), checked(rect.Y + checked(rect.Height - 1)), c);
            }
        }

        protected void DrawGradient(Color c1, Color c2, int x, int y, int width, int height, float angle)
        {
            _Rectangle = new Rectangle(x, y, width, height);
            _Gradient = new LinearGradientBrush(_Rectangle, c1, c2, angle);
            G.FillRectangle(_Gradient, _Rectangle);
        }

        public abstract void PaintHook();

        protected sealed override void OnPaint(PaintEventArgs e)
        {
            bool flag = (Width != 0) && (Height != 0) ? true : false;
            if (flag)
            {
            }
            else
            {
                PaintHook();
                e.Graphics.DrawImage(B, 0, 0);
            }
        }

        protected override void OnSizeChanged(EventArgs e)
        {
            // trial
        }

    } // class ThemeContainerControl

}

