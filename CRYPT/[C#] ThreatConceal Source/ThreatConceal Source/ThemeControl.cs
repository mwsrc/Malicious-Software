using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    internal abstract class ThemeControl : Control
    {

        protected enum State : byte
        {
            MouseNone,
            MouseOver,
            MouseDown
        }

        private SolidBrush _Brush;
        private LinearGradientBrush _Gradient;
        private Image _Image;
        private bool _NoRounding;
        private Rectangle _Rectangle;
        private Size _Size;
        protected Bitmap B;
        protected Graphics G;
        protected ThemeControl.State MouseState;

        public Image Image
        {
            get
            {
                return _Image;
            }
            set
            {
                _Image = value;
                Invalidate();
            }
        }

        public int ImageTop
        {
            get
            {
                int i;

                bool flag = _Image == null;
                if (flag)
                    i = 0;
                else
                    i = checked((Height / 2) - (_Image.Height / 2));
                return i;
            }
        }

        public int ImageWidth
        {
            get
            {
                int i;

                bool flag = _Image == null;
                if (flag)
                    i = 0;
                else
                    i = _Image.Width;
                return i;
            }
        }

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

        public override string Text
        {
            get
            {
                return base.Text;
            }
            set
            {
                base.Text = value;
                Invalidate();
            }
        }

        public ThemeControl()
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

        private void ChangeMouseState(ThemeControl.State e)
        {
            // trial
        }

        protected void DrawBorders(Pen p1, Pen p2, Rectangle rect)
        {
            G.DrawRectangle(p1, rect.X, rect.Y, checked(rect.Width - 1), checked(rect.Height - 1));
            G.DrawRectangle(p2, checked(rect.X + 1), checked(rect.Y + 1), checked(rect.Width - 3), checked(rect.Height - 3));
        }

        protected void DrawCorners(Color c, Rectangle rect)
        {
            // trial
        }

        protected void DrawGradient(Color c1, Color c2, int x, int y, int width, int height, float angle)
        {
            // trial
        }

        protected void DrawIcon(HorizontalAlignment a, int x)
        {
            // trial
        }

        protected void DrawIcon(HorizontalAlignment a, int x, int y)
        {
            HorizontalAlignment horizontalAlignment;

            bool flag = _Image == null;
            if (flag)
            {
            }
            else
            {
                switch ((int)a)
                {
                    case 0:
                        G.DrawImage(_Image, x, checked(checked((Height / 2) - (_Image.Height / 2)) + y));
                        break;

                    case 1:
                        G.DrawImage(_Image, checked(checked(Width - _Image.Width) - x), checked(checked((Height / 2) - (_Image.Height / 2)) + y));
                        break;

                    case 2:
                        G.DrawImage(_Image, checked((Width / 2) - (_Image.Width / 2)), checked((Height / 2) - (_Image.Height / 2)));
                        break;
                }
            }
        }

        protected void DrawText(HorizontalAlignment a, Color c, int x)
        {
            // trial
        }

        protected void DrawText(HorizontalAlignment a, Color c, int x, int y)
        {
            HorizontalAlignment horizontalAlignment;

            bool flag = String.IsNullOrEmpty(Text);
            if (flag)
            {
            }
            else
            {
                SizeF sizeF = G.MeasureString(Text, Font);
                _Size = sizeF.ToSize();
                _Brush = new SolidBrush(c);
                switch ((int)a)
                {
                    case 0:
                        G.DrawString(Text, Font, _Brush, (float)x, (float)checked(checked((Height / 2) - (_Size.Height / 2)) + y));
                        break;

                    case 1:
                        G.DrawString(Text, Font, _Brush, (float)checked(checked(Width - _Size.Width) - x), (float)checked(checked((Height / 2) - (_Size.Height / 2)) + y));
                        break;

                    case 2:
                        G.DrawString(Text, Font, _Brush, (float)checked(checked((Width / 2) - (_Size.Width / 2)) + x), (float)checked(checked((Height / 2) - (_Size.Height / 2)) + y));
                        break;
                }
            }
        }

        public abstract void PaintHook();

        protected override void OnMouseDown(MouseEventArgs e)
        {
            bool flag = e.Button == MouseButtons.Left;
            if (flag)
                ChangeMouseState(ThemeControl.State.MouseDown);
            base.OnMouseDown(e);
        }

        protected override void OnMouseEnter(EventArgs e)
        {
            ChangeMouseState(ThemeControl.State.MouseOver);
            base.OnMouseEnter(e);
        }

        protected override void OnMouseLeave(EventArgs e)
        {
            // trial
        }

        protected override void OnMouseUp(MouseEventArgs e)
        {
            // trial
        }

        protected sealed override void OnPaint(PaintEventArgs e)
        {
            // trial
        }

        protected override void OnSizeChanged(EventArgs e)
        {
            if (Width == 0)
                goto label_0;
            bool flag = Height != 0 ? true : false;
            if (flag)
            {
                B = new Bitmap(Width, Height);
                G = Graphics.FromImage(B);
                Invalidate();
            }
            base.OnSizeChanged(e);
        }

    } // class ThemeControl

}

