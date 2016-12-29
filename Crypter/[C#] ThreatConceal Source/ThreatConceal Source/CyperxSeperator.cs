using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Runtime.CompilerServices;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    public class CyperxSeperator : Control
    {

        public enum Direction
        {
            Horizontal,
            Vertical
        }

        private Color Bg;
        private CyperxSeperator.Direction Dir;
        private Color FC;
        private int H;
        private Pen p;
        private Color PC2;
        private SolidBrush sb;

        private static List<WeakReference> __ENCList;

        public CyperxSeperator.Direction Style
        {
            get
            {
                return Dir;
            }
            set
            {
                Dir = value;
                Invalidate();
            }
        }

        public int Thickness
        {
            get
            {
                return H;
            }
            set
            {
                H = value;
                Invalidate();
            }
        }

        [DebuggerNonUserCode]
        static CyperxSeperator()
        {
            CyperxSeperator.__ENCList = new List<WeakReference>();
        }

        public CyperxSeperator()
        {
            CyperxSeperator.__ENCAddToList(this);
            Bg = Color.FromArgb(28, 28, 28);
            PC2 = Color.FromArgb(83, 83, 83);
            FC = Color.FromArgb(124, 195, 255);
            Dir = CyperxSeperator.Direction.Horizontal;
            H = 2;
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            bool flag;
            CyperxSeperator.Direction direction;
            Point point1, point2;

            Bitmap bitmap = new Bitmap(Width, Height);
            try
            {
                Graphics graphics = Graphics.FromImage(bitmap);
                try
                {
                    graphics.Clear(BackColor);
                    sb = new SolidBrush(Bg);
                    Rectangle rectangle3 = new Rectangle(0, 0, Width, Height);
                    graphics.FillRectangle(sb, rectangle3);
                    switch ((int)Dir)
                    {
                        case 0:
                            Rectangle rectangle1 = new Rectangle(0, checked((int)Math.Round((double)Height / 2.0)), checked((int)Math.Round((double)Width / 5.0)), H);
                            LinearGradientBrush linearGradientBrush1 = new LinearGradientBrush(rectangle1, Color.Transparent, FC, LinearGradientMode.Horizontal);
                            try
                            {
                                graphics.FillRectangle(linearGradientBrush1, rectangle1);
                            }
                            finally
                            {
                                flag = linearGradientBrush1 != null;
                                if (flag)
                                    linearGradientBrush1.Dispose();
                            }
                            p = new Pen(FC, (float)H);
                            int i1 = checked((int)Math.Round(Math.Floor((double)H / 2.0)));
                            point1 = new Point(rectangle1.Width, checked(rectangle1.Y + i1));
                            point2 = new Point(checked(checked(Width - rectangle1.Width) + 1), checked(rectangle1.Y + i1));
                            graphics.DrawLine(p, point1, point2);
                            rectangle1 = new Rectangle(checked((int)Math.Round((double)Width - ((double)Width / 5.0))), checked((int)Math.Round((double)Height / 2.0)), checked((int)Math.Round((double)Width / 5.0)), H);
                            LinearGradientBrush linearGradientBrush2 = new LinearGradientBrush(rectangle1, FC, Color.Transparent, LinearGradientMode.Horizontal);
                            try
                            {
                                graphics.FillRectangle(linearGradientBrush2, rectangle1);
                            }
                            finally
                            {
                                flag = linearGradientBrush2 != null;
                                if (flag)
                                    linearGradientBrush2.Dispose();
                            }
                            goto label_0;
                            break;

                        case 1:
                            Rectangle rectangle2 = new Rectangle(checked((int)Math.Round((double)Width / 2.0)), 0, H, checked((int)Math.Round((double)Height / 5.0)));
                            LinearGradientBrush linearGradientBrush3 = new LinearGradientBrush(rectangle2, Color.Transparent, FC, LinearGradientMode.Vertical);
                            try
                            {
                                graphics.FillRectangle(linearGradientBrush3, rectangle2);
                            }
                            finally
                            {
                                flag = linearGradientBrush3 != null;
                                if (flag)
                                    linearGradientBrush3.Dispose();
                            }
                            p = new Pen(FC, (float)H);
                            int i2 = checked((int)Math.Round(Math.Floor((double)H / 2.0)));
                            point2 = new Point(checked(rectangle2.X + i2), checked((int)Math.Round((double)Height / 5.0)));
                            point1 = new Point(checked(rectangle2.X + i2), checked((int)Math.Round((double)Height - ((double)Height / 5.0))));
                            graphics.DrawLine(p, point2, point1);
                            rectangle2 = new Rectangle(rectangle2.X, checked((int)Math.Round((double)Height - ((double)Height / 5.0) - 1.0)), H, checked((int)Math.Round((double)Height / 5.0)));
                            LinearGradientBrush linearGradientBrush4 = new LinearGradientBrush(rectangle2, FC, Color.Transparent, LinearGradientMode.Vertical);
                            try
                            {
                                graphics.FillRectangle(linearGradientBrush4, rectangle2);
                            }
                            finally
                            {
                                flag = linearGradientBrush4 != null;
                                if (flag)
                                    linearGradientBrush4.Dispose();
                            }
                            e.Graphics.DrawImage(bitmap, 0, 0);
                            break;
                    }
                }
                finally
                {
                    flag = graphics != null;
                    if (flag)
                        graphics.Dispose();
                }
            }
            finally
            {
                flag = bitmap != null;
                if (flag)
                    bitmap.Dispose();
            }
            base.OnPaint(e);
        }

        protected override void OnPaintBackground(PaintEventArgs pevent)
        {
            // trial
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            int i4;

            List<WeakReference> list = CyperxSeperator.__ENCList;
            lock (list)
            {
                bool flag1 = CyperxSeperator.__ENCList.get_Count() == CyperxSeperator.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(CyperxSeperator.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = CyperxSeperator.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                CyperxSeperator.__ENCList.set_Item(i1, CyperxSeperator.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    CyperxSeperator.__ENCList.RemoveRange(i1, checked(CyperxSeperator.__ENCList.get_Count() - i1));
                    CyperxSeperator.__ENCList.set_Capacity(CyperxSeperator.__ENCList.get_Count());
                }
                CyperxSeperator.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class CyperxSeperator

}

