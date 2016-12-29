using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Runtime.CompilerServices;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    internal class FutureButtonCrypt : Control
    {

        private Bitmap B;
        private Brush B1;
        private Brush B2;
        private LinearGradientBrush B3;
        private LinearGradientBrush B4;
        private Brush B5;
        private Color C1;
        private Color C2;
        private Color C3;
        private Color C4;
        private Graphics G;
        private Pen P1;
        private Pen P2;
        private Pen P3;
        private Pen P4;
        private Rectangle R1;
        private int State;

        private static List<WeakReference> __ENCList;

        [DebuggerNonUserCode]
        static FutureButtonCrypt()
        {
            FutureButtonCrypt.__ENCList = new List<WeakReference>();
        }

        public FutureButtonCrypt()
        {
            FutureButtonCrypt.__ENCAddToList(this);
            SetStyle(ControlStyles.UserPaint | ControlStyles.AllPaintingInWmPaint, true);
            C1 = Color.FromArgb(34, 34, 34);
            C2 = Color.FromArgb(49, 49, 49);
            C3 = Color.FromArgb(39, 39, 39);
            C4 = Color.FromArgb(60, Color.Black);
            P1 = new Pen(Color.FromArgb(22, 22, 22));
            P2 = new Pen(Color.FromArgb(20, Color.White));
            P3 = new Pen(Color.FromArgb(10, Color.White));
            P4 = new Pen(Color.FromArgb(30, Color.Black));
            B1 = new SolidBrush(C1);
            B2 = new SolidBrush(C3);
            B5 = new SolidBrush(Color.FromArgb(0, 192, 255));
            Font = new Font("Verdana", 8.0F);
        }

        protected override void OnMouseDown(MouseEventArgs e)
        {
            State = 2;
            Invalidate();
        }

        protected override void OnMouseEnter(EventArgs e)
        {
            // trial
        }

        protected override void OnMouseLeave(EventArgs e)
        {
            // trial
        }

        protected override void OnMouseUp(MouseEventArgs e)
        {
            State = 1;
            Invalidate();
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            int i1;

            B = new Bitmap(Width, Height);
            G = Graphics.FromImage(B);
            G.FillRectangle(B3, ClientRectangle);
            switch (State)
            {
                case 0:
                    G.FillRectangle(B1, 1, 1, checked(Width - 2), checked(Height - 2));
                    G.DrawLine(P2, 2, 2, checked(Width - 3), 2);
                    G.DrawLine(P3, 2, checked(Height - 3), checked(Width - 3), checked(Height - 3));
                    break;

                case 1:
                    G.FillRectangle(B2, 1, 1, checked(Width - 2), checked(Height - 2));
                    G.DrawLine(P2, 2, 2, checked(Width - 3), 2);
                    G.DrawLine(P3, 2, checked(Height - 3), checked(Width - 3), checked(Height - 3));
                    break;

                case 2:
                    G.FillRectangle(B2, 1, 1, checked(Width - 2), checked(Height - 2));
                    G.FillRectangle(B4, R1);
                    G.DrawLine(P4, 2, 2, 2, checked(Height - 3));
                    break;
            }
            SizeF sizeF = G.MeasureString(Text, Font);
            G.DrawString(Text, Font, B5, (float)Convert.ToInt32(((double)Width / 2.0) - (double)(sizeF.Width / 2.0F)), (float)Convert.ToInt32(((double)Height / 2.0) - (double)(sizeF.Height / 2.0F)));
            G.DrawRectangle(P1, 1, 1, checked(Width - 3), checked(Height - 3));
            e.Graphics.DrawImage(B, 0, 0);
            G.Dispose();
            B.Dispose();
        }

        protected override void OnPaintBackground(PaintEventArgs e)
        {
            // trial
        }

        protected override void OnResize(EventArgs e)
        {
            // trial
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            int i4;

            List<WeakReference> list = FutureButtonCrypt.__ENCList;
            lock (list)
            {
                bool flag1 = FutureButtonCrypt.__ENCList.get_Count() == FutureButtonCrypt.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(FutureButtonCrypt.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = FutureButtonCrypt.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                FutureButtonCrypt.__ENCList.set_Item(i1, FutureButtonCrypt.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    FutureButtonCrypt.__ENCList.RemoveRange(i1, checked(FutureButtonCrypt.__ENCList.get_Count() - i1));
                    FutureButtonCrypt.__ENCList.set_Capacity(FutureButtonCrypt.__ENCList.get_Count());
                }
                FutureButtonCrypt.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class FutureButtonCrypt

}

