using System;
using System.Drawing;

namespace CybeR_CryptZ
{

    internal class ButtonPane : ThemeControl
    {

        private Pen _Border1;
        private Pen _Border2;
        private Color _Color1A;
        private Color _Color1B;
        private Color _Color2A;
        private Color _Color2B;
        private Font _Font1;
        private Font _Font2;
        private Pen _InnerBorder;
        private bool _NoGradient;
        private bool _Selection;
        private bool _SelectionToggle;
        private string _Text1;
        private string _Text2;
        private SolidBrush _TextColor1;
        private SolidBrush _TextColor2;
        private Graphics GO;
        private int ImageOS;
        private byte Push;
        private int StringTO;
        private Size TextSize1;
        private Size TextSize2;

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

        public Color Color1A
        {
            get
            {
                return _Color1A;
            }
            set
            {
                _Color1A = value;
                Invalidate();
            }
        }

        public Color Color1B
        {
            get
            {
                return _Color1B;
            }
            set
            {
                _Color1B = value;
                Invalidate();
            }
        }

        public Color Color2A
        {
            get
            {
                return _Color2A;
            }
            set
            {
                _Color2A = value;
                Invalidate();
            }
        }

        public Color Color2B
        {
            get
            {
                return _Color2B;
            }
            set
            {
                _Color2B = value;
                Invalidate();
            }
        }

        public Font Font1
        {
            get
            {
                return _Font1;
            }
            set
            {
                _Font1 = value;
                UpdateSize();
            }
        }

        public Font Font2
        {
            get
            {
                return _Font2;
            }
            set
            {
                _Font2 = value;
                UpdateSize();
            }
        }

        public Color InnerBorder
        {
            get
            {
                return _InnerBorder.Color;
            }
            set
            {
                _InnerBorder = new Pen(value);
                Invalidate();
            }
        }

        public bool NoGradient
        {
            get
            {
                return _NoGradient;
            }
            set
            {
                _NoGradient = value;
                Invalidate();
            }
        }

        public bool Selection
        {
            get
            {
                return _Selection;
            }
            set
            {
                _Selection = value;
                Invalidate();
            }
        }

        public bool SelectionToggle
        {
            get
            {
                return _SelectionToggle;
            }
            set
            {
                _SelectionToggle = value;
            }
        }

        public string Text1
        {
            get
            {
                return _Text1;
            }
            set
            {
                _Text1 = value;
                UpdateSize();
            }
        }

        public string Text2
        {
            get
            {
                return _Text2;
            }
            set
            {
                _Text2 = value;
                UpdateSize();
            }
        }

        public Color TextColor1
        {
            get
            {
                return _TextColor1.Color;
            }
            set
            {
                _TextColor1 = new SolidBrush(value);
                Invalidate();
            }
        }

        public Color TextColor2
        {
            get
            {
                return _TextColor2.Color;
            }
            set
            {
                _TextColor2 = new SolidBrush(value);
                Invalidate();
            }
        }

        public ButtonPane()
        {
            _Text1 = "Name";
            _Text2 = "Description";
            _Color1A = Color.White;
            _Color1B = Color.FromArgb(245, 245, 245);
            _Color2A = Color.FromArgb(205, 230, 255);
            _Color2B = Color.FromArgb(195, 220, 255);
            AllowTransparent();
            _InnerBorder = new Pen(Color.FromArgb(50, Color.White));
            _Border1 = new Pen(Color.FromArgb(190, 215, 250));
            _Border2 = new Pen(Color.FromArgb(175, 200, 230));
            _Font1 = Font;
            _Font2 = new Font(Font.Name, Font.Size - 1.0F);
            _TextColor1 = new SolidBrush(Color.Blue);
            _TextColor2 = new SolidBrush(Color.Black);
            GO = Graphics.FromHwndInternal(Handle);
            UpdateSize();
        }

        private void DrawDescription()
        {
            bool flag = String.IsNullOrEmpty(Text1);
            if (flag)
                G.DrawString(_Text2, _Font2, _TextColor2, (float)checked(checked(checked(ImageWidth + ImageOS) + 10) + Push), (float)checked(checked(StringTO + TextSize1.Height) + Push));
            else
                G.DrawString(_Text2, _Font2, _TextColor2, (float)checked(checked(checked(ImageWidth + ImageOS) + 10) + Push), (float)checked(checked(StringTO + TextSize1.Height) + Push));
        }

        private void DrawMouseDown()
        {
            bool flag = !_NoGradient;
            if (flag)
                DrawGradient(_Color2A, _Color2B, 0, 0, Width, Height, 90.0F);
            DrawBorders(_Border2, _InnerBorder, ClientRectangle);
            DrawCorners(BackColor, ClientRectangle);
        }

        private void DrawMouseOver()
        {
            // trial
        }

        private void UpdateSize()
        {
            // trial
        }

        protected override void OnClick(EventArgs e)
        {
            bool flag = _SelectionToggle;
            if (flag)
                Selection = !_Selection;
            Invalidate();
            base.OnClick(e);
        }

        public override void PaintHook()
        {
            // trial
        }

    } // class ButtonPane

}

