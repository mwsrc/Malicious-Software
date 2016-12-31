using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    public class CyperxProgressbar : Control
    {

        private double _Current;
        private object _DarkColor;
        private Color _Lightcolor;
        private double _Maximum;
        private int _Progress;
        private bool _UseColor;
        private Color BC1;
        private Color BC2;
        private Color FC;
        private Color PC1;
        private Color PC2;
        private double Perc;
        private bool Showt;

        private static List<WeakReference> __ENCList;

        public bool Colorize
        {
            get
            {
                return _UseColor;
            }
            set
            {
                _UseColor = value;
                Invalidate();
            }
        }

        public double Current
        {
            get
            {
                return _Current;
            }
            set
            {
                _Current = value;
                value = value / _Maximum * 100.0;
                Invalidate();
            }
        }

        public Color DarkColor
        {
            get
            {
                // decompiler error
            }
            set
            {
                _DarkColor = value;
                Invalidate();
            }
        }

        public Color Lightcolor
        {
            get
            {
                return _Lightcolor;
            }
            set
            {
                _Lightcolor = value;
                Invalidate();
            }
        }

        public double Maximum
        {
            get
            {
                return _Maximum;
            }
            set
            {
                _Maximum = value;
                value = _Current / value * 100.0;
                Invalidate();
            }
        }

        public double Percentage
        {
            get
            {
                return Perc;
            }
        }

        public bool ShowText
        {
            get
            {
                return Showt;
            }
            set
            {
                Showt = value;
                Invalidate();
            }
        }

        public double Value
        {
            get
            {
                return (double)_Progress;
            }
            set
            {
                bool flag = value < 0.0;
                if (flag)
                {
                    value = 0.0;
                }
                else
                {
                    flag = value > Maximum;
                    if (flag)
                        value = Maximum;
                }
                _Progress = checked((int)Math.Round(value));
                _Current = value * 0.01 * _Maximum;
                Invalidate();
            }
        }

        [DebuggerNonUserCode]
        static CyperxProgressbar()
        {
            CyperxProgressbar.__ENCList = new List<WeakReference>();
        }

        public CyperxProgressbar()
        {
            Color color;

            CyperxProgressbar.__ENCAddToList(this);
            _UseColor = false;
            Perc = 0.0;
            BC1 = Color.FromArgb(90, 90, 90);
            BC2 = Color.FromArgb(71, 71, 71);
            PC1 = Color.FromArgb(50, 50, 50);
            PC2 = Color.FromArgb(83, 83, 83);
            FC = Color.FromArgb(124, 195, 255);
            Showt = true;
            _Maximum = 100.0;
            _Lightcolor = BC2;
            _DarkColor = BC1;
            Font = new Font("Arial", 8.0F);
            ForeColor = Color.White;
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

            List<WeakReference> list = CyperxProgressbar.__ENCList;
            lock (list)
            {
                bool flag1 = CyperxProgressbar.__ENCList.get_Count() == CyperxProgressbar.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(CyperxProgressbar.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = CyperxProgressbar.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                CyperxProgressbar.__ENCList.set_Item(i1, CyperxProgressbar.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    CyperxProgressbar.__ENCList.RemoveRange(i1, checked(CyperxProgressbar.__ENCList.get_Count() - i1));
                    CyperxProgressbar.__ENCList.set_Capacity(CyperxProgressbar.__ENCList.get_Count());
                }
                CyperxProgressbar.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class CyperxProgressbar

}

