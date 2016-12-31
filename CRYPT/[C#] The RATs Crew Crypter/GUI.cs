using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;

namespace The_RATs_Crew_Crypter
{
    class Pigment
    {
        public string Name { get; set; }
        public Color Value { get; set; }

        public Pigment()
        {
        }

        public Pigment(string n, Color v)
        {
            Name = n;
            Value = v;
        }

        public Pigment(string n, byte a, byte r, byte g, byte b)
        {
            Name = n;
            Value = Color.FromArgb(a, r, g, b);
        }

        public Pigment(string n, byte r, byte g, byte b)
        {
            Name = n;
            Value = Color.FromArgb(r, g, b);
        }
    }
    class FButton : Control
    {

        private bool Shadow_ = true;
        public bool Shadow
        {
            get { return Shadow_; }
            set
            {
                Shadow_ = value;
                Invalidate();
            }
        }

        public FButton()
        {
            SetStyle((ControlStyles)8198, true);
            Colors = new Pigment[] {
            new Pigment("Border", 254, 133, 0),
            new Pigment("Backcolor", 25, 25, 25),
            new Pigment("Highlight", 255, 197, 19),
            new Pigment("Gradient1", 255, 175, 12),
            new Pigment("Gradient2", 255, 127, 1),
            new Pigment("Text Color", Color.White),
            new Pigment("Text Shadow", 30, 0, 0, 0)
        };
            Font = new Font("Verdana", 8);
        }

        const byte Count = 7;
        private Pigment[] C;
        public Pigment[] Colors
        {
            get { return C; }
            set
            {
                if (value.Length != Count)
                    throw new IndexOutOfRangeException();

                P1 = new Pen(value[0].Value);
                P2 = new Pen(value[2].Value);

                B1 = new SolidBrush(value[6].Value);
                B2 = new SolidBrush(value[5].Value);

                C = value;
                Invalidate();
            }
        }

        private Pen P1;
        private Pen P2;
        private SolidBrush B1;
        private SolidBrush B2;
        private LinearGradientBrush B3;
        private Size SZ;

        private Point PT;
        private Graphics G;
        private Bitmap B;
        protected override void OnPaint(PaintEventArgs e)
        {
            B = new Bitmap(Width, Height);
            G = Graphics.FromImage(B);

            if (Down)
            {
                B3 = new LinearGradientBrush(ClientRectangle, C[4].Value, C[3].Value, 90f);
            }
            else
            {
                B3 = new LinearGradientBrush(ClientRectangle, C[3].Value, C[4].Value, 90f);
            }
            G.FillRectangle(B3, ClientRectangle);

            if (!string.IsNullOrEmpty(Text))
            {
                SZ = G.MeasureString(Text, Font).ToSize();
                PT = new Point(Convert.ToInt32(Width / 2 - SZ.Width / 2), Convert.ToInt32(Height / 2 - SZ.Height / 2));
                if (Shadow_)
                    G.DrawString(Text, Font, B1, PT.X + 1, PT.Y + 1);
                G.DrawString(Text, Font, B2, PT);
            }

            G.DrawRectangle(P1, new Rectangle(0, 0, Width - 1, Height - 1));
            G.DrawRectangle(P2, new Rectangle(1, 1, Width - 3, Height - 3));

            B.SetPixel(0, 0, C[1].Value);
            B.SetPixel(Width - 1, 0, C[1].Value);
            B.SetPixel(Width - 1, Height - 1, C[1].Value);
            B.SetPixel(0, Height - 1, C[1].Value);

            e.Graphics.DrawImage(B, 0, 0);
            B3.Dispose();
            G.Dispose();
            B.Dispose();
        }

        private bool Down;
        protected override void OnMouseDown(System.Windows.Forms.MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                Down = true;
                Invalidate();
            }
            base.OnMouseDown(e);
        }
        protected override void OnMouseUp(System.Windows.Forms.MouseEventArgs e)
        {
            Down = false;
            Invalidate();
            base.OnMouseUp(e);
        }

    }

    class FutureButton : Control
    {

        Bitmap B;
        Graphics G;
        Rectangle R1;
        Color C1;
        Color C2;
        Color C3;
        Color C4;
        Pen P1;
        Pen P2;
        Pen P3;
        Pen P4;
        Brush B1;
        Brush B2;
        Brush B5;
        LinearGradientBrush B3;
        LinearGradientBrush B4;
        private int State;

        public FutureButton()
        {
            SetStyle(ControlStyles.AllPaintingInWmPaint | ControlStyles.UserPaint, true);

            C1 = Color.FromArgb(34, 34, 34);
            //Background
            C2 = Color.FromArgb(49, 49, 49);
            //Highlight
            C3 = Color.FromArgb(39, 39, 39);
            //Lesser Highlight
            C4 = Color.FromArgb(60, Color.Black);
            P1 = new Pen(Color.FromArgb(22, 22, 22));
            //Shadow
            P2 = new Pen(Color.FromArgb(20, Color.White));
            P3 = new Pen(Color.FromArgb(10, Color.White));
            P4 = new Pen(Color.FromArgb(30, Color.Black));
            B1 = new SolidBrush(C1);
            B2 = new SolidBrush(C3);
            //B5 = new SolidBrush(Color.FromArgb(12, 12, 12));
            B5 = new SolidBrush(Color.Lime);
            //B5 = new SolidBrush(Color.FromArgb(239, 131, 35));
            //Text Color
            Font = new Font("Verdana", 8f);
        }
        protected override void OnMouseLeave(EventArgs e)
        {
            State = 0;
            Invalidate();
        }
        protected override void OnMouseUp(MouseEventArgs e)
        {
            State = 1;
            Invalidate();
        }
        protected override void OnMouseEnter(EventArgs e)
        {
            State = 1;
            Invalidate();
        }
        protected override void OnMouseDown(MouseEventArgs e)
        {
            State = 2;
            Invalidate();
        }
        protected override void OnResize(EventArgs e)
        {
            R1 = new Rectangle(2, 2, Width - 4, 4);
            B3 = new LinearGradientBrush(ClientRectangle, C3, C2, 90f);
            B4 = new LinearGradientBrush(R1, C4, Color.Transparent, 90f);
            Invalidate();
        }
        protected override void OnPaint(PaintEventArgs e)
        {
            B = new Bitmap(Width, Height);
            G = Graphics.FromImage(B);

            G.FillRectangle(B3, ClientRectangle);

            switch (State)
            {
                case 0:
                    //Up
                    G.FillRectangle(B1, 1, 1, Width - 2, Height - 2);
                    G.DrawLine(P2, 2, 2, Width - 3, 2);
                    G.DrawLine(P3, 2, Height - 3, Width - 3, Height - 3);
                    break;
                case 1:
                    //Over
                    G.FillRectangle(B2, 1, 1, Width - 2, Height - 2);
                    G.DrawLine(P2, 2, 2, Width - 3, 2);
                    G.DrawLine(P3, 2, Height - 3, Width - 3, Height - 3);
                    break;
                case 2:
                    //Down
                    G.FillRectangle(B2, 1, 1, Width - 2, Height - 2);
                    G.FillRectangle(B4, R1);
                    G.DrawLine(P4, 2, 2, 2, Height - 3);
                    break;
            }

            SizeF S = G.MeasureString(Text, Font);
            G.DrawString(Text, Font, B5, Convert.ToInt32(Width / 2 - S.Width / 2), Convert.ToInt32(Height / 2 - S.Height / 2));

            G.DrawRectangle(P1, 1, 1, Width - 3, Height - 3);

            e.Graphics.DrawImage(B, 0, 0);
            G.Dispose();
            B.Dispose();
        }
        protected override void OnPaintBackground(PaintEventArgs e) { }
    }
}
