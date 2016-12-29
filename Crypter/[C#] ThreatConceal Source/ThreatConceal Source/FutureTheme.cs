using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Runtime.CompilerServices;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    internal class FutureTheme : Control
    {

        private Bitmap B;
        private SolidBrush B1;
        private LinearGradientBrush B2;
        private LinearGradientBrush B3;
        private Color C1;
        private Color C2;
        private Color C3;
        private Graphics G;
        private Pen P1;
        private Pen P2;
        private Pen P3;
        private Rectangle R1;
        private Rectangle R2;

        private static List<WeakReference> __ENCList;

        [DebuggerNonUserCode]
        static FutureTheme()
        {
            FutureTheme.__ENCList = new List<WeakReference>();
        }

        public FutureTheme()
        {
            FutureTheme.__ENCAddToList(this);
            SetStyle(ControlStyles.UserPaint | ControlStyles.AllPaintingInWmPaint, true);
            C1 = Color.FromArgb(28, 28, 28);
            C2 = Color.FromArgb(49, 49, 49);
            C3 = Color.FromArgb(22, 22, 22);
            P1 = new Pen(Color.Black);
            P2 = new Pen(C1);
            P3 = new Pen(C2);
            B1 = new SolidBrush(C2);
            Font = new Font("Verdana", 7.0F, FontStyle.Bold);
        }

        protected override void OnHandleCreated(EventArgs e)
        {
            // trial
        }

        protected override void OnMouseDown(MouseEventArgs e)
        {
            Point point1 = Parent.Location;
            Point point2 = Parent.Location;
            Rectangle rectangle1 = new Rectangle(point1.X, point2.Y, Width, 22);
            Rectangle rectangle3 = rectangle1;
            Point point3 = Control.MousePosition;
            Point point4 = Control.MousePosition;
            Rectangle rectangle2 = new Rectangle(point3.X, point4.Y, 1, 1);
            bool flag = rectangle3.IntersectsWith(rectangle2);
            if (flag)
            {
                Capture = false;
                IntPtr intPtr = new IntPtr(2);
                Message message = Message.Create(Parent.Handle, 161, intPtr, IntPtr.Zero);
                DefWndProc(ref message);
            }
            base.OnMouseDown(e);
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

            List<WeakReference> list = FutureTheme.__ENCList;
            lock (list)
            {
                bool flag1 = FutureTheme.__ENCList.get_Count() == FutureTheme.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(FutureTheme.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = FutureTheme.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                FutureTheme.__ENCList.set_Item(i1, FutureTheme.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    FutureTheme.__ENCList.RemoveRange(i1, checked(FutureTheme.__ENCList.get_Count() - i1));
                    FutureTheme.__ENCList.set_Capacity(FutureTheme.__ENCList.get_Count());
                }
                FutureTheme.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class FutureTheme

}

