using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    internal class FutureSeperator : Control
    {

        private Orientation _Orientation;
        private Bitmap B;
        private Color C1;
        private Graphics G;
        private int I;
        private Pen P1;
        private Pen P2;

        private static List<WeakReference> __ENCList;

        public Orientation Orientation
        {
            get
            {
                return _Orientation;
            }
            set
            {
                _Orientation = value;
                UpdateOffset();
                Invalidate();
            }
        }

        [DebuggerNonUserCode]
        static FutureSeperator()
        {
            FutureSeperator.__ENCList = new List<WeakReference>();
        }

        public FutureSeperator()
        {
            FutureSeperator.__ENCAddToList(this);
            SetStyle(ControlStyles.UserPaint | ControlStyles.AllPaintingInWmPaint, true);
            C1 = Color.FromArgb(34, 34, 34);
            P1 = new Pen(Color.FromArgb(22, 22, 22));
            P2 = new Pen(Color.FromArgb(49, 49, 49));
        }

        public void UpdateOffset()
        {
            I = Convert.ToInt32(_Orientation == Orientation.Horizontal ? ((double)Height / 2.0) - 1.0 : ((double)Width / 2.0) - 1.0);
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            // trial
        }

        protected override void OnPaintBackground(PaintEventArgs pevent)
        {
        }

        protected override void OnSizeChanged(EventArgs e)
        {
            // trial
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            int i4;

            List<WeakReference> list = FutureSeperator.__ENCList;
            lock (list)
            {
                bool flag1 = FutureSeperator.__ENCList.get_Count() == FutureSeperator.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(FutureSeperator.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = FutureSeperator.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                FutureSeperator.__ENCList.set_Item(i1, FutureSeperator.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    FutureSeperator.__ENCList.RemoveRange(i1, checked(FutureSeperator.__ENCList.get_Count() - i1));
                    FutureSeperator.__ENCList.set_Capacity(FutureSeperator.__ENCList.get_Count());
                }
                FutureSeperator.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class FutureSeperator

}

