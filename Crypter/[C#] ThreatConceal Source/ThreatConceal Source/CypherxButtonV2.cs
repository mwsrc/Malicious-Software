using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    public class CypherxButtonV2 : Control
    {

        private enum State
        {
            MouseDown,
            MouseEnter,
            MouseLeft
        }

        private int _time;
        private int alpha;
        private Color FC;
        private Color GC1;
        private Color GC2;
        private Color GC3;
        private Color GC4;
        private Color GC5;
        private Color GC6;
        private Color GC7;
        private int last;
        private CypherxButtonV2.State MouseState;
        private Pen P;
        private Color PC1;
        private Color PC2;
        private Color PC3;
        private SolidBrush sb;
        private Timer T;

        private static List<WeakReference> __ENCList;

        public int FadeInTime
        {
            get
            {
                return _time;
            }
            set
            {
                _time = value;
                T.Interval = checked((int)Math.Round((double)value / 10.0));
            }
        }

        [DebuggerNonUserCode]
        static CypherxButtonV2()
        {
            CypherxButtonV2.__ENCList = new List<WeakReference>();
        }

        public CypherxButtonV2()
        {
            Color color;

            CypherxButtonV2.__ENCAddToList(this);
            _time = 200;
            last = 0;
            alpha = 0;
            GC1 = Color.FromArgb(75, 75, 75);
            GC2 = Color.FromArgb(65, 65, 65);
            GC3 = Color.FromArgb(63, 63, 63);
            GC4 = Color.FromArgb(100, 100, 100);
            GC5 = Color.FromArgb(130, 130, 130);
            GC6 = Color.FromArgb(120, 120, 120);
            GC7 = Color.FromArgb(80, 80, 80);
            PC1 = Color.FromArgb(50, 50, 50);
            PC2 = Color.FromArgb(83, 83, 83);
            PC3 = Color.FromArgb(30, 30, 30);
            FC = Color.FromArgb(124, 195, 255);
            MouseState = CypherxButtonV2.State.MouseLeft;
            Font = new Font("Arial", 8.0F);
            ForeColor = FC;
            T = new Timer();
            T.Interval = checked((int)Math.Round((double)_time / 10.0));
            T.Tick += new EventHandler(_Lambda$__5);
        }

        [DebuggerStepThrough]
        [CompilerGenerated]
        private void _Lambda$__5(object a0, EventArgs a1)
        {
            // trial
        }

        public int CalculateAlpha(int Opacity)
        {
            return checked((int)Math.Round(2.55 * (double)Opacity));
        }

        public void FadeIn()
        {
            // trial
        }

        protected override void OnMouseDown(MouseEventArgs e)
        {
            // trial
        }

        protected override void OnMouseEnter(EventArgs e)
        {
            MouseState = CypherxButtonV2.State.MouseEnter;
            alpha = 0;
            last = 0;
            T.Start();
        }

        protected override void OnMouseLeave(EventArgs e)
        {
            // trial
        }

        protected override void OnMouseUp(MouseEventArgs e)
        {
            alpha = 255;
            MouseState = CypherxButtonV2.State.MouseEnter;
            Invalidate();
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            // trial
        }

        protected override void OnPaintBackground(PaintEventArgs pevent)
        {
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            int i4;

            List<WeakReference> list = CypherxButtonV2.__ENCList;
            lock (list)
            {
                bool flag1 = CypherxButtonV2.__ENCList.get_Count() == CypherxButtonV2.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(CypherxButtonV2.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = CypherxButtonV2.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                CypherxButtonV2.__ENCList.set_Item(i1, CypherxButtonV2.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    CypherxButtonV2.__ENCList.RemoveRange(i1, checked(CypherxButtonV2.__ENCList.get_Count() - i1));
                    CypherxButtonV2.__ENCList.set_Capacity(CypherxButtonV2.__ENCList.get_Count());
                }
                CypherxButtonV2.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class CypherxButtonV2

}

