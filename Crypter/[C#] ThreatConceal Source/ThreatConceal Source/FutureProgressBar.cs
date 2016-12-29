using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Runtime.CompilerServices;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    internal class FutureProgressBar : Control
    {

        private double _Current;
        private double _Maximum;
        private int _Progress;
        private Bitmap B;
        private LinearGradientBrush B1;
        private LinearGradientBrush B2;
        private SolidBrush B3;
        private Color C1;
        private Color C2;
        private Color C3;
        private Graphics G;
        private Pen P1;
        private Pen P2;
        private Pen P3;
        private Rectangle R1;
        private Rectangle R2;
        private ColorBlend X;

        private static List<WeakReference> __ENCList;

        public Color Color1
        {
            get
            {
                return C2;
            }
            set
            {
                C2 = value;
                UpdateColors();
                Invalidate();
            }
        }

        public Color Color2
        {
            get
            {
                return C3;
            }
            set
            {
                C3 = value;
                UpdateColors();
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
                Progress = value / _Maximum * 100.0;
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
                Progress = _Current / value * 100.0;
                Invalidate();
            }
        }

        public double Progress
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
                    flag = value > 100.0;
                    if (flag)
                        value = 100.0;
                }
                _Progress = Convert.ToInt32(value);
                _Current = value * 0.01 * _Maximum;
                flag = Width > 0;
                if (flag)
                    UpdateProgress();
                Invalidate();
            }
        }

        [DebuggerNonUserCode]
        static FutureProgressBar()
        {
            FutureProgressBar.__ENCList = new List<WeakReference>();
        }

        public FutureProgressBar()
        {
            Color color;

            FutureProgressBar.__ENCAddToList(this);
            _Maximum = 100.0;
            C2 = Color.FromArgb(6, 96, 149);
            C3 = Color.FromArgb(70, 167, 220);
            C1 = Color.FromArgb(22, 22, 22);
            P1 = new Pen(Color.FromArgb(70, Color.White), 2.0F);
            P2 = new Pen(C2);
            P3 = new Pen(Color.FromArgb(49, 49, 49));
            B3 = new SolidBrush(Color.FromArgb(100, Color.White));
            X = new ColorBlend(4);
            Color[] colorArr = new Color[4];
            colorArr[0] = C2;
            colorArr[1] = C3;
            colorArr[2] = C3;
            colorArr[3] = C2;
            X.Colors = colorArr;
            float[] fArr = new float[] { 0.0F, 0.1F, 0.9F, 1.0F };
            X.Positions = fArr;
            R2 = new Rectangle(2, 2, 2, 2);
            B2 = new LinearGradientBrush(R2, color, color, 180.0F);
            B2.InterpolationColors = X;
        }

        public void UpdateColors()
        {
            Color color;

            P2.Color = C2;
            Color[] colorArr = new Color[4];
            colorArr[0] = C2;
            colorArr[1] = C3;
            colorArr[2] = C3;
            colorArr[3] = C2;
            X.Colors = colorArr;
            B2.InterpolationColors = X;
        }

        public void UpdateProgress()
        {
            Color color;

            bool flag = _Progress == 0;
            if (flag)
            {
            }
            else
            {
                R2 = new Rectangle(2, 2, Convert.ToInt32((double)checked(Width - 4) * ((double)_Progress * 0.01)), checked(Height - 4));
                B2 = new LinearGradientBrush(R2, color, color, 180.0F);
                B2.InterpolationColors = X;
            }
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            // trial
        }

        protected override void OnPaintBackground(PaintEventArgs pevent)
        {
            // trial
        }

        protected override void OnSizeChanged(EventArgs e)
        {
            // trial
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            int i4;

            List<WeakReference> list = FutureProgressBar.__ENCList;
            lock (list)
            {
                bool flag1 = FutureProgressBar.__ENCList.get_Count() == FutureProgressBar.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(FutureProgressBar.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = FutureProgressBar.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                FutureProgressBar.__ENCList.set_Item(i1, FutureProgressBar.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    FutureProgressBar.__ENCList.RemoveRange(i1, checked(FutureProgressBar.__ENCList.get_Count() - i1));
                    FutureProgressBar.__ENCList.set_Capacity(FutureProgressBar.__ENCList.get_Count());
                }
                FutureProgressBar.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class FutureProgressBar

}

