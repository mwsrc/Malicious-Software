using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    internal abstract class Theme : ContainerControl
    {

        private struct Pointer
        {

            public readonly Cursor Cursor;
            public readonly byte Position;

            public Pointer(Cursor c, byte p)
            {
                this = new Theme.Pointer();
                Cursor = c;
                Position = p;
            }

        }

        private SolidBrush _Brush;
        private LinearGradientBrush _Gradient;
        private Image _Image;
        private int _MoveHeight;
        private Rectangle _Rectangle;
        private bool _Resizable;
        private Size _Size;
        private Color _TransparencyKey;
        private Theme.Pointer Current;
        private bool F1;
        private bool F2;
        private bool F3;
        private bool F4;
        private IntPtr Flag;
        protected Graphics G;
        protected Rectangle Header;
        private bool ParentIsForm;
        private Theme.Pointer Pending;
        private Point PTC;

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

        public int MoveHeight
        {
            get
            {
                return _MoveHeight;
            }
            set
            {
                _MoveHeight = value;
                Header = new Rectangle(7, 7, checked(Width - 14), checked(_MoveHeight - 7));
            }
        }

        public bool Resizable
        {
            get
            {
                return _Resizable;
            }
            set
            {
                _Resizable = value;
            }
        }

        public Color TransparencyKey
        {
            get
            {
                return _TransparencyKey;
            }
            set
            {
                _TransparencyKey = value;
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

        public Theme()
        {
            _Resizable = true;
            _MoveHeight = 24;
            SetStyle(ControlStyles.UserPaint | ControlStyles.Opaque | ControlStyles.AllPaintingInWmPaint | ControlStyles.OptimizedDoubleBuffer, true);
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
                        G.DrawImage(_Image, x, checked(checked((_MoveHeight / 2) - (_Image.Height / 2)) + y));
                        break;

                    case 1:
                        G.DrawImage(_Image, checked(checked(Width - _Image.Width) - x), checked(checked((_MoveHeight / 2) - (_Image.Height / 2)) + y));
                        break;

                    case 2:
                        G.DrawImage(_Image, checked((Width / 2) - (_Image.Width / 2)), checked((_MoveHeight / 2) - (_Image.Height / 2)));
                        break;
                }
            }
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
                        G.DrawString(Text, Font, _Brush, (float)x, (float)checked(checked((_MoveHeight / 2) - (_Size.Height / 2)) + y));
                        break;

                    case 1:
                        G.DrawString(Text, Font, _Brush, (float)checked(checked(Width - _Size.Width) - x), (float)checked(checked((_MoveHeight / 2) - (_Size.Height / 2)) + y));
                        break;

                    case 2:
                        G.DrawString(Text, Font, _Brush, (float)checked(checked((Width / 2) - (_Size.Width / 2)) + x), (float)checked(checked((_MoveHeight / 2) - (_Size.Height / 2)) + y));
                        break;
                }
            }
        }

        protected void DrawText(HorizontalAlignment a, Color c, int x)
        {
            // trial
        }

        private Theme.Pointer GetPointer()
        {
            // trial
            return null;
        }

        public abstract void PaintHook();

        private void SetCurrent()
        {
            Pending = GetPointer();
            bool flag = Current.Position == Pending.Position;
            if (flag)
            {
            }
            else
            {
                Current = GetPointer();
                Cursor = Current.Cursor;
            }
        }

        protected override void OnHandleCreated(EventArgs e)
        {
            // trial
        }

        protected override void OnMouseDown(MouseEventArgs e)
        {
            bool flag2;
            IntPtr intPtr;

            bool flag1 = e.Button != MouseButtons.Left;
            if (flag1)
            {
            }
            else
            {
                flag1 = ParentIsForm;
                if (flag1)
                {
                    flag2 = ParentForm.WindowState == FormWindowState.Maximized;
                    if (flag2) goto label_1;
                }
                else
                {
                label_1:
                    flag2 = Header.Contains(e.Location);
                    if (flag2)
                    {
                        Flag = new IntPtr(2);
                    }
                    else
                    {
                        flag2 = (Current.Position == 0) | !_Resizable;
                        if (flag2)
                            goto label_2;
                        else
                            Flag = new IntPtr(Current.Position);
                    }
                    Capture = false;
                    Message message = Message.Create(Parent.Handle, 161, Flag, intPtr);
                    DefWndProc(ref message);
                    base.OnMouseDown(e);
                }
            }
        label_2:;
        }

        protected override void OnMouseMove(MouseEventArgs e)
        {
            // trial
        }

        protected sealed override void OnPaint(PaintEventArgs e)
        {
            bool flag = (Width != 0) && (Height != 0) ? true : false;
            if (flag)
            {
            }
            else
            {
                G = e.Graphics;
                PaintHook();
            }
        }

        protected override void OnSizeChanged(EventArgs e)
        {
            bool flag = (Width != 0) && (Height != 0) ? true : false;
            if (flag)
            {
            }
            else
            {
                Header = new Rectangle(7, 7, checked(Width - 14), checked(_MoveHeight - 7));
                Invalidate();
                base.OnSizeChanged(e);
            }
        }

    } // class Theme

}

