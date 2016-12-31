using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    public class CypherxButton : Control
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
        private int last;
        private CypherxButton.State MouseState;
        private Pen P;
        private Color PC1;
        private Color PC2;
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
        static CypherxButton()
        {
            CypherxButton.__ENCList = new List<WeakReference>();
        }

        public CypherxButton()
        {
            Color color;

            CypherxButton.__ENCAddToList(this);
            _time = 200;
            last = 0;
            alpha = 0;
            GC1 = Color.FromArgb(75, 75, 75);
            GC2 = Color.FromArgb(65, 65, 65);
            GC3 = Color.FromArgb(63, 63, 63);
            GC4 = Color.FromArgb(100, 100, 100);
            GC5 = Color.FromArgb(130, 130, 130);
            GC6 = Color.FromArgb(120, 120, 120);
            PC1 = Color.FromArgb(50, 50, 50);
            PC2 = Color.FromArgb(83, 83, 83);
            FC = Color.FromArgb(124, 195, 255);
            MouseState = CypherxButton.State.MouseLeft;
            Font = new Font("Arial", 8.0F);
            ForeColor = FC;
            T = new Timer();
            T.Interval = checked((int)Math.Round((double)_time / 10.0));
            T.Tick += new EventHandler(_Lambda$__1);
        }

        [CompilerGenerated]
        [DebuggerStepThrough]
        private void _Lambda$__1(object a0, EventArgs a1)
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
            MouseState = CypherxButton.State.MouseEnter;
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

            List<WeakReference> list = CypherxButton.__ENCList;
            lock (list)
            {
                bool flag1 = CypherxButton.__ENCList.get_Count() == CypherxButton.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(CypherxButton.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = CypherxButton.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                CypherxButton.__ENCList.set_Item(i1, CypherxButton.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    CypherxButton.__ENCList.RemoveRange(i1, checked(CypherxButton.__ENCList.get_Count() - i1));
                    CypherxButton.__ENCList.set_Capacity(CypherxButton.__ENCList.get_Count());
                }
                CypherxButton.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class CypherxButton

}

