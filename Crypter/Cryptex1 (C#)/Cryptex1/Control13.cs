
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;
namespace Cryptex1
{
    internal abstract class Control13 : Control
    {
        protected enum Enum2 : byte
        {
            const_0,
            const_1,
            const_2
        }
        protected Graphics graphics_0;
        protected Bitmap bitmap_0;
        protected Control13.Enum2 enum2_0;
        private bool bool_0;
        private Image image_0;
        private Size size_0;
        private Rectangle rectangle_0;
        private LinearGradientBrush linearGradientBrush_0;
        private SolidBrush solidBrush_0;
        public override string Text
        {
            get
            {
                return base.Text;
            }
            set
            {
                base.Text = value;
                base.Invalidate();
            }
        }
        public bool Boolean_0
        {
            get
            {
                return this.bool_0;
            }
            set
            {
                this.bool_0 = value;
                base.Invalidate();
            }
        }
        public Image Image_0
        {
            get
            {
                return this.image_0;
            }
            set
            {
                this.image_0 = value;
                base.Invalidate();
            }
        }
        public int Int32_0
        {
            get
            {
                if (this.image_0 == null)
                {
                    return 0;
                }
                return this.image_0.Width;
            }
        }
        public int Int32_1
        {
            get
            {
                if (this.image_0 == null)
                {
                    return 0;
                }
                return base.Height / 2 - this.image_0.Height / 2;
            }
        }
        public Control13()
        {
            base.SetStyle(ControlStyles.UserPaint | ControlStyles.Opaque | ControlStyles.AllPaintingInWmPaint | ControlStyles.OptimizedDoubleBuffer, true);
            this.bitmap_0 = new Bitmap(1, 1);
            this.graphics_0 = Graphics.FromImage(this.bitmap_0);
        }
        public void method_0()
        {
            base.SetStyle(ControlStyles.Opaque, false);
            base.SetStyle(ControlStyles.SupportsTransparentBackColor, true);
        }
        protected override void OnMouseLeave(System.EventArgs e)
        {
            this.method_1(Control13.Enum2.const_0);
            base.OnMouseLeave(e);
        }
        protected override void OnMouseEnter(System.EventArgs e)
        {
            this.method_1(Control13.Enum2.const_1);
            base.OnMouseEnter(e);
        }
        protected override void OnMouseUp(MouseEventArgs e)
        {
            this.method_1(Control13.Enum2.const_1);
            base.OnMouseUp(e);
        }
        protected override void OnMouseDown(MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                this.method_1(Control13.Enum2.const_2);
            }
            base.OnMouseDown(e);
        }
        private void method_1(Control13.Enum2 enum2_1)
        {
            this.enum2_0 = enum2_1;
            base.Invalidate();
        }
        public abstract void PaintHook();
        protected sealed override void OnPaint(PaintEventArgs e)
        {
            if (base.Width != 0 && base.Height != 0)
            {
                this.PaintHook();
                e.Graphics.DrawImage(this.bitmap_0, 0, 0);
                return;
            }
        }
        protected override void OnSizeChanged(System.EventArgs e)
        {
            if (base.Width != 0 && base.Height != 0)
            {
                this.bitmap_0 = new Bitmap(base.Width, base.Height);
                this.graphics_0 = Graphics.FromImage(this.bitmap_0);
                base.Invalidate();
            }
            base.OnSizeChanged(e);
        }
        protected void method_2(Color color_0, Rectangle rectangle_1)
        {
            if (this.bool_0)
            {
                return;
            }
            this.bitmap_0.SetPixel(rectangle_1.X, rectangle_1.Y, color_0);
            this.bitmap_0.SetPixel(rectangle_1.X + (rectangle_1.Width - 1), rectangle_1.Y, color_0);
            this.bitmap_0.SetPixel(rectangle_1.X, rectangle_1.Y + (rectangle_1.Height - 1), color_0);
            this.bitmap_0.SetPixel(rectangle_1.X + (rectangle_1.Width - 1), rectangle_1.Y + (rectangle_1.Height - 1), color_0);
        }
        protected void method_3(Pen pen_0, Pen pen_1, Rectangle rectangle_1)
        {
            this.graphics_0.DrawRectangle(pen_0, rectangle_1.X, rectangle_1.Y, rectangle_1.Width - 1, rectangle_1.Height - 1);
            this.graphics_0.DrawRectangle(pen_1, rectangle_1.X + 1, rectangle_1.Y + 1, rectangle_1.Width - 3, rectangle_1.Height - 3);
        }
        protected void method_4(HorizontalAlignment horizontalAlignment_0, Color color_0, int int_0)
        {
            this.method_5(horizontalAlignment_0, color_0, int_0, 0);
        }
        protected void method_5(HorizontalAlignment horizontalAlignment_0, Color color_0, int int_0, int int_1)
        {
            if (string.IsNullOrEmpty(this.Text))
            {
                return;
            }
            this.size_0 = this.graphics_0.MeasureString(this.Text, this.Font).ToSize();
            this.solidBrush_0 = new SolidBrush(color_0);
            switch (horizontalAlignment_0)
            {
                case HorizontalAlignment.Left:
                    {
                        this.graphics_0.DrawString(this.Text, this.Font, this.solidBrush_0, (float)int_0, (float)(base.Height / 2 - this.size_0.Height / 2 + int_1));
                        return;
                    }
                case HorizontalAlignment.Right:
                    {
                        this.graphics_0.DrawString(this.Text, this.Font, this.solidBrush_0, (float)(base.Width - this.size_0.Width - int_0), (float)(base.Height / 2 - this.size_0.Height / 2 + int_1));
                        return;
                    }
                case HorizontalAlignment.Center:
                    {
                        this.graphics_0.DrawString(this.Text, this.Font, this.solidBrush_0, (float)(base.Width / 2 - this.size_0.Width / 2 + int_0), (float)(base.Height / 2 - this.size_0.Height / 2 + int_1));
                        return;
                    }
                default:
                    {
                        return;
                    }
            }
        }
        protected void method_6(HorizontalAlignment horizontalAlignment_0, int int_0)
        {
            this.method_7(horizontalAlignment_0, int_0, 0);
        }
        protected void method_7(HorizontalAlignment horizontalAlignment_0, int int_0, int int_1)
        {
            if (this.image_0 == null)
            {
                return;
            }
            switch (horizontalAlignment_0)
            {
                case HorizontalAlignment.Left:
                    {
                        this.graphics_0.DrawImage(this.image_0, int_0, base.Height / 2 - this.image_0.Height / 2 + int_1);
                        return;
                    }
                case HorizontalAlignment.Right:
                    {
                        this.graphics_0.DrawImage(this.image_0, base.Width - this.image_0.Width - int_0, base.Height / 2 - this.image_0.Height / 2 + int_1);
                        return;
                    }
                case HorizontalAlignment.Center:
                    {
                        this.graphics_0.DrawImage(this.image_0, base.Width / 2 - this.image_0.Width / 2, base.Height / 2 - this.image_0.Height / 2);
                        return;
                    }
                default:
                    {
                        return;
                    }
            }
        }
        protected void method_8(Color color_0, Color color_1, int int_0, int int_1, int int_2, int int_3, float float_0)
        {
            this.rectangle_0 = new Rectangle(int_0, int_1, int_2, int_3);
            this.linearGradientBrush_0 = new LinearGradientBrush(this.rectangle_0, color_0, color_1, float_0);
            this.graphics_0.FillRectangle(this.linearGradientBrush_0, this.rectangle_0);
        }
    }
}
