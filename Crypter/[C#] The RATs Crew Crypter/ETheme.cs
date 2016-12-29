using Microsoft.VisualBasic;
using System;
using System.Drawing.Drawing2D;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace The_RATs_Crew_Crypter
{
    //Author:   TheDarky
    abstract class Theme : ContainerControl
    {

        #region " Initialization "

        protected Graphics G;
        public Theme()
        {
            SetStyle((ControlStyles)139270, true);
        }

        private bool ParentIsForm;
        protected override void OnHandleCreated(EventArgs e)
        {
            Dock = DockStyle.Fill;
            ParentIsForm = Parent is Form;
            if (ParentIsForm)
            {
                if (!(_TransparencyKey == Color.Empty))
                    ParentForm.TransparencyKey = _TransparencyKey;
                ParentForm.FormBorderStyle = FormBorderStyle.None;
            }
            base.OnHandleCreated(e);
        }

        public override string Text
        {
            get { return base.Text; }
            set
            {
                base.Text = value;
                Invalidate();
            }
        }
        #endregion

        #region " Sizing and Movement "

        private bool _Resizable = true;
        public bool Resizable
        {
            get { return _Resizable; }
            set { _Resizable = value; }
        }

        private int _MoveHeight = 24;
        public int MoveHeight
        {
            get { return _MoveHeight; }
            set
            {
                _MoveHeight = value;
                Header = new Rectangle(7, 7, Width - 14, _MoveHeight - 7);
            }
        }

        private IntPtr Flag;
        protected override void OnMouseDown(MouseEventArgs e)
        {
            if (!(e.Button == MouseButtons.Left))
                return;
            if (ParentIsForm)
                if (ParentForm.WindowState == FormWindowState.Maximized)
                    return;

            if (Header.Contains(e.Location))
            {
                Flag = new IntPtr(2);
            }
            else if (Current.Position == 0 | !_Resizable)
            {
                return;
            }
            else
            {
                Flag = new IntPtr(Current.Position);
            }

            Capture = false;
            Message msg = Message.Create(Parent.Handle, 161, Flag, IntPtr.Zero);
            DefWndProc(ref msg);

            base.OnMouseDown(e);
        }

        private struct Pointer
        {
            public readonly Cursor Cursor;
            public readonly byte Position;
            public Pointer(Cursor c, byte p)
            {
                Cursor = c;
                Position = p;
            }
        }

        private bool F1;
        private bool F2;
        private bool F3;
        private bool F4;
        private Point PTC;
        private Pointer GetPointer()
        {
            PTC = PointToClient(MousePosition);
            F1 = PTC.X < 7;
            F2 = PTC.X > Width - 7;
            F3 = PTC.Y < 7;
            F4 = PTC.Y > Height - 7;

            if (F1 & F3)
                return new Pointer(Cursors.SizeNWSE, 13);
            if (F1 & F4)
                return new Pointer(Cursors.SizeNESW, 16);
            if (F2 & F3)
                return new Pointer(Cursors.SizeNESW, 14);
            if (F2 & F4)
                return new Pointer(Cursors.SizeNWSE, 17);
            if (F1)
                return new Pointer(Cursors.SizeWE, 10);
            if (F2)
                return new Pointer(Cursors.SizeWE, 11);
            if (F3)
                return new Pointer(Cursors.SizeNS, 12);
            if (F4)
                return new Pointer(Cursors.SizeNS, 15);
            return new Pointer(Cursors.Default, 0);
        }

        private Pointer Current;
        private Pointer Pending;
        private void SetCurrent()
        {
            Pending = GetPointer();
            if (Current.Position == Pending.Position)
                return;
            Current = GetPointer();
            Cursor = Current.Cursor;
        }

        protected override void OnMouseMove(MouseEventArgs e)
        {
            if (_Resizable)
                SetCurrent();
            base.OnMouseMove(e);
        }

        protected Rectangle Header;
        protected override void OnSizeChanged(EventArgs e)
        {
            if (Width == 0 || Height == 0)
                return;
            Header = new Rectangle(7, 7, Width - 14, _MoveHeight - 7);
            Invalidate();
            base.OnSizeChanged(e);
        }

        #endregion

        #region " Convienence "

        public abstract void PaintHook();
        protected override sealed void OnPaint(PaintEventArgs e)
        {
            if (Width == 0 || Height == 0)
                return;
            G = e.Graphics;
            PaintHook();
        }

        private Color _TransparencyKey;
        public Color TransparencyKey
        {
            get { return _TransparencyKey; }
            set
            {
                _TransparencyKey = value;
                Invalidate();
            }
        }

        private Image _Image;
        public Image Image
        {
            get { return _Image; }
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
                if (_Image == null)
                    return 0;
                return _Image.Width;
            }
        }

        private Size _Size;
        private Rectangle _Rectangle;
        private LinearGradientBrush _Gradient;

        private SolidBrush _Brush;
        protected void DrawCorners(Color c, Rectangle rect)
        {
            _Brush = new SolidBrush(c);
            G.FillRectangle(_Brush, rect.X, rect.Y, 1, 1);
            G.FillRectangle(_Brush, rect.X + (rect.Width - 1), rect.Y, 1, 1);
            G.FillRectangle(_Brush, rect.X, rect.Y + (rect.Height - 1), 1, 1);
            G.FillRectangle(_Brush, rect.X + (rect.Width - 1), rect.Y + (rect.Height - 1), 1, 1);
        }

        protected void DrawBorders(Pen p1, Pen p2, Rectangle rect)
        {
            G.DrawRectangle(p1, rect.X, rect.Y, rect.Width - 1, rect.Height - 1);
            G.DrawRectangle(p2, rect.X + 1, rect.Y + 1, rect.Width - 3, rect.Height - 3);
        }

        protected void DrawText(HorizontalAlignment a, Color c, int x)
        {
            DrawText(a, c, x, 0);
        }
        protected void DrawText(HorizontalAlignment a, Color c, int x, int y)
        {
            if (string.IsNullOrEmpty(Text))
                return;
            _Size = G.MeasureString(Text, Font).ToSize();
            _Brush = new SolidBrush(c);

            switch (a)
            {
                case HorizontalAlignment.Left:
                    G.DrawString(Text, Font, _Brush, x, _MoveHeight / 2 - _Size.Height / 2 + y);
                    break;
                case HorizontalAlignment.Right:
                    G.DrawString(Text, Font, _Brush, Width - _Size.Width - x, _MoveHeight / 2 - _Size.Height / 2 + y);
                    break;
                case HorizontalAlignment.Center:
                    G.DrawString(Text, Font, _Brush, Width / 2 - _Size.Width / 2 + x, _MoveHeight / 2 - _Size.Height / 2 + y);
                    break;
            }
        }

        protected void DrawIcon(HorizontalAlignment a, int x)
        {
            DrawIcon(a, x, 0);
        }
        protected void DrawIcon(HorizontalAlignment a, int x, int y)
        {
            if (_Image == null)
                return;
            switch (a)
            {
                case HorizontalAlignment.Left:
                    G.DrawImage(_Image, x, _MoveHeight / 2 - _Image.Height / 2 + y);
                    break;
                case HorizontalAlignment.Right:
                    G.DrawImage(_Image, Width - _Image.Width - x, _MoveHeight / 2 - _Image.Height / 2 + y);
                    break;
                case HorizontalAlignment.Center:
                    G.DrawImage(_Image, Width / 2 - _Image.Width / 2, _MoveHeight / 2 - _Image.Height / 2);
                    break;
            }
        }

        protected void DrawGradient(Color c1, Color c2, int x, int y, int width, int height, float angle)
        {
            _Rectangle = new Rectangle(x, y, width, height);
            _Gradient = new LinearGradientBrush(_Rectangle, c1, c2, angle);
            G.FillRectangle(_Gradient, _Rectangle);
        }

        #endregion

    }
    abstract class ThemeControl : Control
    {

        #region " Initialization "

        protected Graphics G;
        protected Bitmap B;
        public ThemeControl()
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

        public override string Text
        {
            get { return base.Text; }
            set
            {
                base.Text = value;
                Invalidate();
            }
        }
        #endregion

        #region " Mouse Handling "

        protected enum State : byte
        {
            MouseNone = 0,
            MouseOver = 1,
            MouseDown = 2
        }

        protected State MouseState;
        protected override void OnMouseLeave(EventArgs e)
        {
            ChangeMouseState(State.MouseNone);
            base.OnMouseLeave(e);
        }
        protected override void OnMouseEnter(EventArgs e)
        {
            ChangeMouseState(State.MouseOver);
            base.OnMouseEnter(e);
        }
        protected override void OnMouseUp(MouseEventArgs e)
        {
            ChangeMouseState(State.MouseOver);
            base.OnMouseUp(e);
        }
        protected override void OnMouseDown(MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
                ChangeMouseState(State.MouseDown);
            base.OnMouseDown(e);
        }

        private void ChangeMouseState(State e)
        {
            MouseState = e;
            Invalidate();
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

        private Image _Image;
        public Image Image
        {
            get { return _Image; }
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
                if (_Image == null)
                    return 0;
                return _Image.Width;
            }
        }
        public int ImageTop
        {
            get
            {
                if (_Image == null)
                    return 0;
                return Height / 2 - _Image.Height / 2;
            }
        }

        private Size _Size;
        private Rectangle _Rectangle;
        private LinearGradientBrush _Gradient;

        private SolidBrush _Brush;
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

        protected void DrawText(HorizontalAlignment a, Color c, int x)
        {
            DrawText(a, c, x, 0);
        }
        protected void DrawText(HorizontalAlignment a, Color c, int x, int y)
        {
            if (string.IsNullOrEmpty(Text))
                return;
            _Size = G.MeasureString(Text, Font).ToSize();
            _Brush = new SolidBrush(c);

            switch (a)
            {
                case HorizontalAlignment.Left:
                    G.DrawString(Text, Font, _Brush, x, Height / 2 - _Size.Height / 2 + y);
                    break;
                case HorizontalAlignment.Right:
                    G.DrawString(Text, Font, _Brush, Width - _Size.Width - x, Height / 2 - _Size.Height / 2 + y);
                    break;
                case HorizontalAlignment.Center:
                    G.DrawString(Text, Font, _Brush, Width / 2 - _Size.Width / 2 + x, Height / 2 - _Size.Height / 2 + y);
                    break;
            }
        }

        protected void DrawIcon(HorizontalAlignment a, int x)
        {
            DrawIcon(a, x, 0);
        }
        protected void DrawIcon(HorizontalAlignment a, int x, int y)
        {
            if (_Image == null)
                return;
            switch (a)
            {
                case HorizontalAlignment.Left:
                    G.DrawImage(_Image, x, Height / 2 - _Image.Height / 2 + y);
                    break;
                case HorizontalAlignment.Right:
                    G.DrawImage(_Image, Width - _Image.Width - x, Height / 2 - _Image.Height / 2 + y);
                    break;
                case HorizontalAlignment.Center:
                    G.DrawImage(_Image, Width / 2 - _Image.Width / 2, Height / 2 - _Image.Height / 2);
                    break;
            }
        }

        protected void DrawGradient(Color c1, Color c2, int x, int y, int width, int height, float angle)
        {
            _Rectangle = new Rectangle(x, y, width, height);
            _Gradient = new LinearGradientBrush(_Rectangle, c1, c2, angle);
            G.FillRectangle(_Gradient, _Rectangle);
        }
        #endregion

    }
    class eTheme : Theme
    {
        public eTheme()
        {
            BackColor = Color.FromArgb(53, 53, 53);
            MoveHeight = 30;
        }

        public override void PaintHook()
        {
            G.Clear(Color.FromArgb(53, 53, 53));
            DrawGradient(Color.FromArgb(50, 50, 50), Color.FromArgb(50, 50, 50), 0, 1, Width, 14, 90);
            DrawGradient(Color.FromArgb(29, 29, 29), Color.FromArgb(29, 29, 29), 2, 16, Width, 14, 90);
            G.DrawLine(Pens.Black, 0, 30, Width, 30);
            DrawBorders(Pens.Gray, Pens.Black, ClientRectangle);
            DrawText(HorizontalAlignment.Center, Color.Gray, 0);

        }
    }

    class eButton : ThemeControl
    {
        public override void PaintHook()
        {
            switch (MouseState)
            {
                case State.MouseNone:
                    G.Clear(Color.FromArgb(49, 49, 49));
                    DrawGradient(Color.FromArgb(50, 50, 50), Color.FromArgb(40, 40, 40), ClientRectangle.X, ClientRectangle.Y, ClientRectangle.Width, ClientRectangle.Height, 90);
                    break;
                case State.MouseDown:
                    G.Clear(Color.FromArgb(49, 49, 49));
                    DrawGradient(Color.FromArgb(40, 40, 40), Color.FromArgb(50, 50, 50), ClientRectangle.X, ClientRectangle.Y, ClientRectangle.Width, ClientRectangle.Height, 90);
                    break;
                case State.MouseOver:
                    G.Clear(Color.FromArgb(49, 49, 49));
                    DrawGradient(Color.FromArgb(60, 60, 60), Color.FromArgb(50, 50, 50), ClientRectangle.X, ClientRectangle.Y, ClientRectangle.Width, ClientRectangle.Height, 90);
                    break;
            }
            DrawText(HorizontalAlignment.Center, Color.Gray, 0);
            DrawBorders(Pens.Black, Pens.DimGray, ClientRectangle);
            DrawCorners(Color.FromArgb(53, 53, 53), ClientRectangle);

        }
    }

    class eGroupBox : ThemeContainerControl
    {
        public eGroupBox()
        {
            AllowTransparent();
        }
        public override void PaintHook()
        {
            G.Clear(Color.FromArgb(45, 45, 45));
            DrawBorders(new Pen(Color.FromArgb(25, Color.White)), new Pen(Color.FromArgb(90, Color.Black)), ClientRectangle);
            DrawCorners(BackColor, ClientRectangle);
        }
    }

    class eLabel : ThemeControl
    {
        public override void PaintHook()
        {
            G.Clear(BackColor);
            DrawText(HorizontalAlignment.Center, Color.Gray, 0);
        }
    }

    class eSeperator : ThemeControl
    {
        public override void PaintHook()
        {
            G.Clear(BackColor);
            G.DrawLine(Pens.Gray, 0, Convert.ToInt32(ClientRectangle.Y / 2), Width, 0);
        }
    }

}
