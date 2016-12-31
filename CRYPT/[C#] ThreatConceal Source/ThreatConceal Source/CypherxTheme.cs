using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    public class CypherxTheme : Control
    {

        private Icon _Icon;
        private Rectangle Balk;
        private Color BC1;
        private Color BC2;
        private Color BgC;
        private SolidBrush Br;
        private bool EnteredMinimize;
        private bool EntredClose;
        private bool FadingOut;
        private bool Minibox;
        private bool needtopaintbg;
        private Pen P;
        private Color PC1;
        private Color PC2;
        private Color PC3;
        private Point Point;
        private int X;
        private int Y;

        private static List<WeakReference> __ENCList;

        public Icon Icon
        {
            get
            {
                return _Icon;
            }
            set
            {
                _Icon = value;
                bool flag = Parent is Form;
                if (flag)
                {
                    Form form = (Form)Parent;
                    form.Icon = value;
                    _Icon = value;
                    Invalidate();
                    form = null;
                }
            }
        }

        public bool MinimizeBox
        {
            get
            {
                return Minibox;
            }
            set
            {
                Minibox = value;
                Invalidate();
            }
        }

        public bool UseFadeOut
        {
            get
            {
                return FadingOut;
            }
            set
            {
                FadingOut = value;
            }
        }

        [DebuggerNonUserCode]
        static CypherxTheme()
        {
            CypherxTheme.__ENCList = new List<WeakReference>();
        }

        public CypherxTheme()
        {
            CypherxTheme.__ENCAddToList(this);
            needtopaintbg = true;
            Balk = new Rectangle(4, 4, checked(Width - 8), 27);
            BgC = Color.FromArgb(28, 28, 28);
            PC1 = Color.FromArgb(50, 50, 50);
            PC2 = Color.FromArgb(66, 66, 66);
            PC3 = Color.FromArgb(79, 79, 79);
            BC1 = Color.FromArgb(86, 86, 86);
            BC2 = Color.FromArgb(71, 71, 71);
            EnteredMinimize = false;
            EntredClose = false;
            FadingOut = true;
            Minibox = true;
            Point = new Point();
            Dock = DockStyle.Fill;
            DoubleBuffered = true;
        }

        public object FadeOut()
        {
            double d2;

            bool flag = Parent is Form;
            if (flag)
            {
                Form form = (Form)Parent;
                double d1 = 1.0;
                do
                {
                    form.Opacity = d1;
                    Thread.Sleep(50);
                    d1 += -0.1;
                    d2 = 0.0;
                } while (d1 >= d2);
                form = null;
            }
            return 1;
        }

        public bool IconCheck()
        {
            // decompiler error
        }

        public Bitmap ResizeIcon()
        {
            // trial
            return null;
        }

        protected override void OnHandleCreated(EventArgs e)
        {
            // trial
        }

        protected override void OnMouseDown(MouseEventArgs e)
        {
            // trial
        }

        protected override void OnMouseMove(MouseEventArgs e)
        {
            Point point3;

            bool flag1 = EnteredMinimize;
            Rectangle rectangle2 = new Rectangle(checked(Width - 32), 16, 9, 5);
            bool flag2 = rectangle2.Contains(e.Location);
            if (flag2)
                EnteredMinimize = true;
            else
                EnteredMinimize = false;
            flag2 = flag1 != EnteredMinimize;
            if (flag2)
                Invalidate();
            flag1 = EntredClose;
            Rectangle rectangle1 = new Rectangle(checked(Width - 20), 5, 16, 16);
            flag2 = rectangle1.Contains(e.Location);
            if (flag2)
                EntredClose = true;
            else
                EntredClose = false;
            flag2 = flag1 != EntredClose;
            if (flag2)
                Invalidate();
            flag2 = Parent is Form;
            if (flag2)
            {
                Form form = (Form)Parent;
                Point point1 = e.Location;
                Point point2 = e.Location;
                bool flag3 = (e.Button == MouseButtons.Left) & (point1.X < Width) & (point2.Y < Balk.Height);
                if (flag3)
                {
                    Point = Control.MousePosition;
                    Point.X = checked(Point.X - X);
                    Point.Y = checked(Point.Y - Y);
                    form.Location = Point;
                }
                form = null;
            }
            base.OnMouseMove(e);
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            // trial
        }

        protected override void OnSizeChanged(EventArgs e)
        {
            Invalidate();
            base.OnSizeChanged(e);
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            int i4;

            List<WeakReference> list = CypherxTheme.__ENCList;
            lock (list)
            {
                bool flag1 = CypherxTheme.__ENCList.get_Count() == CypherxTheme.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(CypherxTheme.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = CypherxTheme.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                CypherxTheme.__ENCList.set_Item(i1, CypherxTheme.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    CypherxTheme.__ENCList.RemoveRange(i1, checked(CypherxTheme.__ENCList.get_Count() - i1));
                    CypherxTheme.__ENCList.set_Capacity(CypherxTheme.__ENCList.get_Count());
                }
                CypherxTheme.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class CypherxTheme

}

