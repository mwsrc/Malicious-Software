
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;
namespace Cryptex1
{
    internal abstract class Control15 : ContainerControl
    {
        private struct Struct0
        {
            public readonly Cursor cursor_0;
            public readonly byte byte_0;
            public Struct0(Cursor c, byte p)
            {
                this.cursor_0 = c;
                this.byte_0 = p;
            }
        }
        protected Graphics graphics_0;
        private bool bool_0;
        private bool bool_1 = true;
        private int int_0 = 24;
        private Message message_0;
        private System.IntPtr intptr_0;
        private bool bool_2;
        private bool bool_3;
        private bool bool_4;
        private bool bool_5;
        private Point point_0;
        private Control15.Struct0 struct0_0;
        private Control15.Struct0 struct0_1;
        protected Rectangle rectangle_0;
        private Color color_0;
        private Image image_0;
        private Size size_0;
        private Rectangle rectangle_1;
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
                return this.bool_1;
            }
            set
            {
                this.bool_1 = value;
            }
        }
        public int Int32_0
        {
            get
            {
                return this.int_0;
            }
            set
            {
                this.int_0 = value;
                this.rectangle_0 = new Rectangle(7, 7, base.Width - 14, this.int_0 - 7);
            }
        }
        public Color Color_0
        {
            get
            {
                return this.color_0;
            }
            set
            {
                this.color_0 = value;
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
        public int Int32_1
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
        public Control15()
        {
            base.SetStyle(ControlStyles.UserPaint | ControlStyles.Opaque | ControlStyles.AllPaintingInWmPaint | ControlStyles.OptimizedDoubleBuffer, true);
        }
        protected override void OnHandleCreated(System.EventArgs e)
        {
            this.Dock = DockStyle.Fill;
            this.bool_0 = (base.Parent is Form);
            if (this.bool_0)
            {
                if (!(this.color_0 == Color.Empty))
                {
                    base.ParentForm.TransparencyKey = this.color_0;
                }
                base.ParentForm.FormBorderStyle = FormBorderStyle.None;
            }
            base.OnHandleCreated(e);
        }
        protected override void OnMouseDown(MouseEventArgs e)
        {
            if (e.Button != MouseButtons.Left)
            {
                return;
            }
            if (this.bool_0 && base.ParentForm.WindowState == FormWindowState.Maximized)
            {
                return;
            }
            if (this.rectangle_0.Contains(e.Location))
            {
                this.intptr_0 = new System.IntPtr(2);
            }
            else
            {
                if (this.struct0_0.byte_0 == 0 | !this.bool_1)
                {
                    return;
                }
                this.intptr_0 = new System.IntPtr((int)this.struct0_0.byte_0);
            }
            base.Capture = false;
            this.message_0 = Message.Create(base.Parent.Handle, 161, this.intptr_0, System.IntPtr.Zero);
            this.DefWndProc(ref this.message_0);
            base.OnMouseDown(e);
        }
        private Control15.Struct0 method_0()
        {
            this.point_0 = base.PointToClient(Control.MousePosition);
            this.bool_2 = (this.point_0.X < 7);
            this.bool_3 = (this.point_0.X > base.Width - 7);
            this.bool_4 = (this.point_0.Y < 7);
            this.bool_5 = (this.point_0.Y > base.Height - 7);
            if (this.bool_2 && this.bool_4)
            {
                return new Control15.Struct0(Cursors.SizeNWSE, 13);
            }
            if (this.bool_2 && this.bool_5)
            {
                return new Control15.Struct0(Cursors.SizeNESW, 16);
            }
            if (this.bool_3 && this.bool_4)
            {
                return new Control15.Struct0(Cursors.SizeNESW, 14);
            }
            if (this.bool_3 && this.bool_5)
            {
                return new Control15.Struct0(Cursors.SizeNWSE, 17);
            }
            if (this.bool_2)
            {
                return new Control15.Struct0(Cursors.SizeWE, 10);
            }
            if (this.bool_3)
            {
                return new Control15.Struct0(Cursors.SizeWE, 11);
            }
            if (this.bool_4)
            {
                return new Control15.Struct0(Cursors.SizeNS, 12);
            }
            if (this.bool_5)
            {
                return new Control15.Struct0(Cursors.SizeNS, 15);
            }
            return new Control15.Struct0(Cursors.Default, 0);
        }
        private void method_1()
        {
            this.struct0_1 = this.method_0();
            if (this.struct0_0.byte_0 == this.struct0_1.byte_0)
            {
                return;
            }
            this.struct0_0 = this.method_0();
            this.Cursor = this.struct0_0.cursor_0;
        }
        protected override void OnMouseMove(MouseEventArgs e)
        {
            if (this.bool_1)
            {
                this.method_1();
            }
            base.OnMouseMove(e);
        }
        protected override void OnSizeChanged(System.EventArgs e)
        {
            if (base.Width != 0 && base.Height != 0)
            {
                this.rectangle_0 = new Rectangle(7, 7, base.Width - 14, this.int_0 - 7);
                base.Invalidate();
                base.OnSizeChanged(e);
                return;
            }
        }
        public abstract void PaintHook();
        protected sealed override void OnPaint(PaintEventArgs e)
        {
            if (base.Width != 0 && base.Height != 0)
            {
                this.graphics_0 = e.Graphics;
                this.PaintHook();
                return;
            }
        }
        protected void method_2(Color color_1, Rectangle rectangle_2)
        {
            this.solidBrush_0 = new SolidBrush(color_1);
            this.graphics_0.FillRectangle(this.solidBrush_0, rectangle_2.X, rectangle_2.Y, 1, 1);
            this.graphics_0.FillRectangle(this.solidBrush_0, rectangle_2.X + (rectangle_2.Width - 1), rectangle_2.Y, 1, 1);
            this.graphics_0.FillRectangle(this.solidBrush_0, rectangle_2.X, rectangle_2.Y + (rectangle_2.Height - 1), 1, 1);
            this.graphics_0.FillRectangle(this.solidBrush_0, rectangle_2.X + (rectangle_2.Width - 1), rectangle_2.Y + (rectangle_2.Height - 1), 1, 1);
        }
        protected void method_3(Pen pen_0, Pen pen_1, Rectangle rectangle_2)
        {
            this.graphics_0.DrawRectangle(pen_0, rectangle_2.X, rectangle_2.Y, rectangle_2.Width - 1, rectangle_2.Height - 1);
            this.graphics_0.DrawRectangle(pen_1, rectangle_2.X + 1, rectangle_2.Y + 1, rectangle_2.Width - 3, rectangle_2.Height - 3);
        }
        protected void method_4(HorizontalAlignment horizontalAlignment_0, Color color_1, int int_1)
        {
            this.method_5(horizontalAlignment_0, color_1, int_1, 0);
        }
        protected void method_5(HorizontalAlignment horizontalAlignment_0, Color color_1, int int_1, int int_2)
        {
            if (string.IsNullOrEmpty(this.Text))
            {
                return;
            }
            this.size_0 = this.graphics_0.MeasureString(this.Text, this.Font).ToSize();
            this.solidBrush_0 = new SolidBrush(color_1);
            switch (horizontalAlignment_0)
            {
                case HorizontalAlignment.Left:
                    {
                        this.graphics_0.DrawString(this.Text, this.Font, this.solidBrush_0, (float)int_1, (float)(this.int_0 / 2 - this.size_0.Height / 2 + int_2));
                        return;
                    }
                case HorizontalAlignment.Right:
                    {
                        this.graphics_0.DrawString(this.Text, this.Font, this.solidBrush_0, (float)(base.Width - this.size_0.Width - int_1), (float)(this.int_0 / 2 - this.size_0.Height / 2 + int_2));
                        return;
                    }
                case HorizontalAlignment.Center:
                    {
                        this.graphics_0.DrawString(this.Text, this.Font, this.solidBrush_0, (float)(base.Width / 2 - this.size_0.Width / 2 + int_1), (float)(this.int_0 / 2 - this.size_0.Height / 2 + int_2));
                        return;
                    }
                default:
                    {
                        return;
                    }
            }
        }
        protected void method_6(HorizontalAlignment horizontalAlignment_0, int int_1)
        {
            this.method_7(horizontalAlignment_0, int_1, 0);
        }
        protected void method_7(HorizontalAlignment horizontalAlignment_0, int int_1, int int_2)
        {
            if (this.image_0 == null)
            {
                return;
            }
            switch (horizontalAlignment_0)
            {
                case HorizontalAlignment.Left:
                    {
                        this.graphics_0.DrawImage(this.image_0, int_1, this.int_0 / 2 - this.image_0.Height / 2 + int_2, this.Image_0.Width, this.Image_0.Height);
                        return;
                    }
                case HorizontalAlignment.Right:
                    {
                        this.graphics_0.DrawImage(this.image_0, base.Width - this.image_0.Width - int_1, this.int_0 / 2 - this.image_0.Height / 2 + int_2, this.Image_0.Width, this.Image_0.Height);
                        return;
                    }
                case HorizontalAlignment.Center:
                    {
                        this.graphics_0.DrawImage(this.image_0, base.Width / 2 - this.image_0.Width / 2, this.int_0 / 2 - this.image_0.Height / 2, this.Image_0.Width, this.Image_0.Height);
                        return;
                    }
                default:
                    {
                        return;
                    }
            }
        }
        protected void method_8(Color color_1, Color color_2, int int_1, int int_2, int int_3, int int_4, float float_0)
        {
            this.rectangle_1 = new Rectangle(int_1, int_2, int_3, int_4);
            this.linearGradientBrush_0 = new LinearGradientBrush(this.rectangle_1, color_1, color_2, float_0);
            this.graphics_0.FillRectangle(this.linearGradientBrush_0, this.rectangle_1);
        }
    }
}
