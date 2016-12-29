
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Windows.Forms;
namespace Cryptex1

{
    internal abstract class Control8 : ContainerControl
    {
        protected Graphics graphics_0;
        private Rectangle rectangle_0;
        protected Enum0 enum0_0;
        private Point point_0;
        private bool bool_0;
        private bool bool_1;
        private bool bool_2;
        private bool bool_3;
        private int int_0;
        private int int_1;
        private Message[] message_0 = new Message[9];
        private Color color_0;
        private bool bool_4 = true;
        private bool bool_5 = true;
        private int int_2 = 24;
        private bool bool_6;
        private Color color_1;
        private FormBorderStyle formBorderStyle_0;
        private bool bool_7;
        private Image image_0;
        private Size size_0;
        private bool bool_8;
        private int int_3;
        private int int_4;
        private System.Collections.Generic.Dictionary<string, Color> dictionary_0 = new System.Collections.Generic.Dictionary<string, Color>();
        private string string_0;
        private Point point_1;
        private Bitmap bitmap_0;
        private Graphics graphics_1;
        private SolidBrush solidBrush_0;
        private Point point_2;
        private Size size_1;
        private Point point_3;
        private LinearGradientBrush linearGradientBrush_0;
        private Rectangle rectangle_1;
        public override Color BackColor
        {
            get
            {
                return base.BackColor;
            }
            set
            {
                if (base.IsHandleCreated)
                {
                    if (!this.bool_6)
                    {
                        base.Parent.BackColor = value;
                    }
                    base.BackColor = value;
                    return;
                }
                this.color_0 = value;
            }
        }
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden), EditorBrowsable(EditorBrowsableState.Never), Browsable(false)]
        public override Color ForeColor
        {
            get
            {
                return Color.Empty;
            }
            set
            {
            }
        }
        [EditorBrowsable(EditorBrowsableState.Never), Browsable(false), DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
        public override Image BackgroundImage
        {
            get
            {
                return null;
            }
            set
            {
            }
        }
        [Browsable(false), DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden), EditorBrowsable(EditorBrowsableState.Never)]
        public override ImageLayout BackgroundImageLayout
        {
            get
            {
                return ImageLayout.None;
            }
            set
            {
            }
        }
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
        public override Font Font
        {
            get
            {
                return base.Font;
            }
            set
            {
                base.Font = value;
                base.Invalidate();
            }
        }
        public bool Boolean_0
        {
            get
            {
                return this.bool_4;
            }
            set
            {
                this.bool_4 = value;
            }
        }
        public bool Boolean_1
        {
            get
            {
                return this.bool_5;
            }
            set
            {
                this.bool_5 = value;
            }
        }
        protected int Int32_0
        {
            get
            {
                return this.int_2;
            }
            set
            {
                if (value < 8)
                {
                    return;
                }
                this.rectangle_0 = new Rectangle(7, 7, base.Width - 14, value - 7);
                this.int_2 = value;
                base.Invalidate();
            }
        }
        protected bool Boolean_2
        {
            get
            {
                return this.bool_6;
            }
            set
            {
                this.bool_6 = value;
            }
        }
        public Color Color_0
        {
            get
            {
                if (this.bool_8 && !this.bool_6)
                {
                    return base.ParentForm.TransparencyKey;
                }
                return this.color_1;
            }
            set
            {
                if (this.bool_8 && !this.bool_6)
                {
                    base.ParentForm.TransparencyKey = value;
                }
                this.color_1 = value;
            }
        }
        public FormBorderStyle FormBorderStyle_0
        {
            get
            {
                if (this.bool_8 && !this.bool_6)
                {
                    return base.ParentForm.FormBorderStyle;
                }
                return this.formBorderStyle_0;
            }
            set
            {
                if (this.bool_8 && !this.bool_6)
                {
                    base.ParentForm.FormBorderStyle = value;
                }
                this.formBorderStyle_0 = value;
            }
        }
        public bool Boolean_3
        {
            get
            {
                return this.bool_7;
            }
            set
            {
                this.bool_7 = value;
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
                if (value == null)
                {
                    this.size_0 = Size.Empty;
                }
                else
                {
                    this.size_0 = value.Size;
                }
                this.image_0 = value;
                base.Invalidate();
            }
        }
        protected Size Size_0
        {
            get
            {
                return this.size_0;
            }
        }
        protected bool Boolean_4
        {
            get
            {
                return this.bool_8;
            }
        }
        protected int Int32_1
        {
            get
            {
                return this.int_3;
            }
            set
            {
                this.int_3 = value;
                if (this.Int32_1 != 0 && base.IsHandleCreated)
                {
                    base.Width = this.Int32_1;
                }
            }
        }
        protected int Int32_2
        {
            get
            {
                return this.int_4;
            }
            set
            {
                this.int_4 = value;
                if (this.Int32_2 != 0 && base.IsHandleCreated)
                {
                    base.Height = this.Int32_2;
                }
            }
        }
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        public Class0[] Class0_0
        {
            get
            {
                System.Collections.Generic.List<Class0> list = new System.Collections.Generic.List<Class0>();
                System.Collections.Generic.Dictionary<string, Color>.Enumerator enumerator = this.dictionary_0.GetEnumerator();
                while (enumerator.MoveNext())
                {
                    System.Collections.Generic.List<Class0> arg_38_0 = list;
                    System.Collections.Generic.KeyValuePair<string, Color> current = enumerator.Current;
                    string arg_33_0 = current.Key;
                    System.Collections.Generic.KeyValuePair<string, Color> current2 = enumerator.Current;
                    arg_38_0.Add(new Class0(arg_33_0, current2.Value));
                }
                return list.ToArray();
            }
            set
            {
                for (int i = 0; i < value.Length; i++)
                {
                    Class0 @class = value[i];
                    if (this.dictionary_0.ContainsKey(@class.String_0))
                    {
                        this.dictionary_0[@class.String_0] = @class.Color_0;
                    }
                }
                this.method_9();
                this.ColorHook();
                base.Invalidate();
            }
        }
        public string String_0
        {
            get
            {
                return this.string_0;
            }
            set
            {
                if (value == this.string_0)
                {
                    return;
                }
                Class0[] class0_ = this.Class0_0;
                try
                {
                    byte[] value2 = System.Convert.FromBase64String(value);
                    for (int i = 0; i <= class0_.Length - 1; i++)
                    {
                        class0_[i].Color_0 = Color.FromArgb(System.BitConverter.ToInt32(value2, i * 4));
                    }
                }
                catch
                {
                    return;
                }
                this.string_0 = value;
                this.Class0_0 = class0_;
                this.ColorHook();
                base.Invalidate();
            }
        }
        public Control8()
        {
            base.SetStyle(ControlStyles.UserPaint | ControlStyles.Opaque | ControlStyles.AllPaintingInWmPaint | ControlStyles.OptimizedDoubleBuffer, true);
            this.size_0 = Size.Empty;
            this.bitmap_0 = new Bitmap(1, 1);
            this.graphics_1 = Graphics.FromImage(this.bitmap_0);
            this.Font = new Font("Verdana", 8f);
            this.method_9();
        }
        protected override void SetBoundsCore(int x, int y, int width, int height, BoundsSpecified specified)
        {
            if (this.int_3 != 0)
            {
                width = this.int_3;
            }
            if (this.int_4 != 0)
            {
                height = this.int_4;
            }
            base.SetBoundsCore(x, y, width, height, specified);
        }
        protected sealed override void OnSizeChanged(System.EventArgs e)
        {
            base.OnSizeChanged(e);
            if (this.bool_4 && !this.bool_6)
            {
                this.rectangle_0 = new Rectangle(7, 7, base.Width - 14, this.int_2 - 7);
            }
            base.Invalidate();
        }
        protected sealed override void OnPaint(PaintEventArgs e)
        {
            if (base.Width != 0 && base.Height != 0)
            {
                this.graphics_0 = e.Graphics;
                this.PaintHook();
                return;
            }
        }
        protected sealed override void OnHandleCreated(System.EventArgs e)
        {
            this.method_3();
            this.method_9();
            this.ColorHook();
            this.bool_8 = (base.Parent is Form);
            if (!this.bool_6)
            {
                this.Dock = DockStyle.Fill;
            }
            if (this.int_3 != 0)
            {
                base.Width = this.int_3;
            }
            if (this.int_4 != 0)
            {
                base.Height = this.int_4;
            }
            this.BackColor = this.color_0;
            if (this.bool_8 && !this.bool_6)
            {
                base.ParentForm.FormBorderStyle = this.formBorderStyle_0;
                base.ParentForm.TransparencyKey = this.color_1;
            }
            this.OnCreation();
            base.OnHandleCreated(e);
        }
        protected virtual void OnCreation()
        {
        }
        private void method_0(Enum0 enum0_1)
        {
            this.enum0_0 = enum0_1;
            base.Invalidate();
        }
        protected override void OnMouseMove(MouseEventArgs e)
        {
            if (this.bool_5 && !this.bool_6)
            {
                this.method_2();
            }
            base.OnMouseMove(e);
        }
        protected override void OnEnabledChanged(System.EventArgs e)
        {
            if (base.Enabled)
            {
                this.method_0(Enum0.const_0);
            }
            else
            {
                this.method_0(Enum0.const_3);
            }
            base.OnEnabledChanged(e);
        }
        protected override void OnMouseEnter(System.EventArgs e)
        {
            this.method_0(Enum0.const_1);
            base.OnMouseEnter(e);
        }
        protected override void OnMouseUp(MouseEventArgs e)
        {
            this.method_0(Enum0.const_1);
            base.OnMouseUp(e);
        }
        protected override void OnMouseLeave(System.EventArgs e)
        {
            this.method_0(Enum0.const_0);
            if (this.bool_5 && !this.bool_6 && base.GetChildAtPoint(base.PointToClient(Control.MousePosition)) != null)
            {
                this.Cursor = Cursors.Default;
                this.int_1 = 0;
            }
            base.OnMouseLeave(e);
        }
        protected override void OnMouseDown(MouseEventArgs e)
        {
            base.OnMouseDown(e);
            if (e.Button != MouseButtons.Left)
            {
                return;
            }
            this.method_0(Enum0.const_2);
            if ((this.bool_8 && base.ParentForm.WindowState == FormWindowState.Maximized) || this.bool_6)
            {
                return;
            }
            if (this.bool_4 && this.rectangle_0.Contains(e.Location))
            {
                base.Capture = false;
                this.DefWndProc(ref this.message_0[0]);
                return;
            }
            if (this.bool_5 && this.int_1 != 0)
            {
                base.Capture = false;
                this.DefWndProc(ref this.message_0[this.int_1]);
            }
        }
        private int method_1()
        {
            this.point_0 = base.PointToClient(Control.MousePosition);
            this.bool_0 = (this.point_0.X < 7);
            this.bool_1 = (this.point_0.X > base.Width - 7);
            this.bool_2 = (this.point_0.Y < 7);
            this.bool_3 = (this.point_0.Y > base.Height - 7);
            if (this.bool_0 && this.bool_2)
            {
                return 4;
            }
            if (this.bool_0 && this.bool_3)
            {
                return 7;
            }
            if (this.bool_1 && this.bool_2)
            {
                return 5;
            }
            if (this.bool_1 && this.bool_3)
            {
                return 8;
            }
            if (this.bool_0)
            {
                return 1;
            }
            if (this.bool_1)
            {
                return 2;
            }
            if (this.bool_2)
            {
                return 3;
            }
            if (this.bool_3)
            {
                return 6;
            }
            return 0;
        }
        private void method_2()
        {
            this.int_0 = this.method_1();
            if (this.int_0 == this.int_1)
            {
                return;
            }
            this.int_1 = this.int_0;
            switch (this.int_1)
            {
                case 0:
                    {
                        this.Cursor = Cursors.Default;
                        return;
                    }
                case 1:
                case 2:
                    {
                        this.Cursor = Cursors.SizeWE;
                        return;
                    }
                case 3:
                case 6:
                    {
                        this.Cursor = Cursors.SizeNS;
                        return;
                    }
                case 4:
                case 8:
                    {
                        this.Cursor = Cursors.SizeNWSE;
                        return;
                    }
                case 5:
                case 7:
                    {
                        this.Cursor = Cursors.SizeNESW;
                        return;
                    }
                default:
                    {
                        return;
                    }
            }
        }
        private void method_3()
        {
            this.message_0[0] = Message.Create(base.Parent.Handle, 161, new System.IntPtr(2), System.IntPtr.Zero);
            for (int i = 1; i <= 8; i++)
            {
                this.message_0[i] = Message.Create(base.Parent.Handle, 161, new System.IntPtr(i + 9), System.IntPtr.Zero);
            }
        }
        protected Color method_4(string string_1)
        {
            return this.dictionary_0[string_1];
        }
        protected void method_5(string string_1, Color color_2)
        {
            if (this.dictionary_0.ContainsKey(string_1))
            {
                this.dictionary_0[string_1] = color_2;
                return;
            }
            this.dictionary_0.Add(string_1, color_2);
        }
        protected void method_6(string string_1, byte byte_0, byte byte_1, byte byte_2)
        {
            this.method_5(string_1, Color.FromArgb((int)byte_0, (int)byte_1, (int)byte_2));
        }
        protected void method_7(string string_1, byte byte_0, byte byte_1, byte byte_2, byte byte_3)
        {
            this.method_5(string_1, Color.FromArgb((int)byte_0, (int)byte_1, (int)byte_2, (int)byte_3));
        }
        protected void method_8(string string_1, byte byte_0, Color color_2)
        {
            this.method_5(string_1, Color.FromArgb((int)byte_0, color_2));
        }
        private void method_9()
        {
            System.IO.MemoryStream memoryStream = new System.IO.MemoryStream(this.dictionary_0.Count * 4);
            Class0[] class0_ = this.Class0_0;
            for (int i = 0; i < class0_.Length; i++)
            {
                Class0 @class = class0_[i];
                memoryStream.Write(System.BitConverter.GetBytes(@class.Color_0.ToArgb()), 0, 4);
            }
            memoryStream.Close();
            this.string_0 = System.Convert.ToBase64String(memoryStream.ToArray());
        }
        protected abstract void ColorHook();
        protected abstract void PaintHook();
        protected Point method_10(Rectangle rectangle_2, Size size_2)
        {
            this.point_1 = new Point(rectangle_2.Width / 2 - size_2.Width / 2 + rectangle_2.X, rectangle_2.Height / 2 - size_2.Height / 2 + rectangle_2.Y);
            return this.point_1;
        }
        protected Point method_11(Rectangle rectangle_2, Rectangle rectangle_3)
        {
            return this.method_10(rectangle_2, rectangle_3.Size);
        }
        protected Point method_12(int int_5, int int_6, int int_7, int int_8)
        {
            this.point_1 = new Point(int_5 / 2 - int_7 / 2, int_6 / 2 - int_8 / 2);
            return this.point_1;
        }
        protected Point method_13(Size size_2, Size size_3)
        {
            return this.method_12(size_2.Width, size_2.Height, size_3.Width, size_3.Height);
        }
        protected Point method_14(Rectangle rectangle_2)
        {
            return this.method_12(base.ClientRectangle.Width, base.ClientRectangle.Height, rectangle_2.Width, rectangle_2.Height);
        }
        protected Point method_15(Size size_2)
        {
            return this.method_12(base.Width, base.Height, size_2.Width, size_2.Height);
        }
        protected Point method_16(int int_5, int int_6)
        {
            return this.method_12(base.Width, base.Height, int_5, int_6);
        }
        protected Size method_17(string string_1)
        {
            return this.graphics_1.MeasureString(string_1, this.Font, base.Width).ToSize();
        }
        protected Size method_18()
        {
            return this.graphics_1.MeasureString(this.Text, this.Font).ToSize();
        }
        protected void method_19(Color color_2)
        {
            this.method_21(color_2, 0, 0, base.Width, base.Height);
        }
        protected void method_20(Color color_2, Rectangle rectangle_2)
        {
            this.method_21(color_2, rectangle_2.X, rectangle_2.Y, rectangle_2.Width, rectangle_2.Height);
        }
        protected void method_21(Color color_2, int int_5, int int_6, int int_7, int int_8)
        {
            if (this.bool_7)
            {
                return;
            }
            this.solidBrush_0 = new SolidBrush(color_2);
            this.graphics_0.FillRectangle(this.solidBrush_0, int_5, int_6, 1, 1);
            this.graphics_0.FillRectangle(this.solidBrush_0, int_5 + (int_7 - 1), int_6, 1, 1);
            this.graphics_0.FillRectangle(this.solidBrush_0, int_5, int_6 + (int_8 - 1), 1, 1);
            this.graphics_0.FillRectangle(this.solidBrush_0, int_5 + (int_7 - 1), int_6 + (int_8 - 1), 1, 1);
        }
        protected void method_22(Pen pen_0, int int_5, int int_6, int int_7, int int_8, int int_9)
        {
            this.method_25(pen_0, int_5 + int_9, int_6 + int_9, int_7 - int_9 * 2, int_8 - int_9 * 2);
        }
        protected void method_23(Pen pen_0, int int_5)
        {
            this.method_22(pen_0, 0, 0, base.Width, base.Height, int_5);
        }
        protected void method_24(Pen pen_0, Rectangle rectangle_2, int int_5)
        {
            this.method_22(pen_0, rectangle_2.X, rectangle_2.Y, rectangle_2.Width, rectangle_2.Height, int_5);
        }
        protected void method_25(Pen pen_0, int int_5, int int_6, int int_7, int int_8)
        {
            this.graphics_0.DrawRectangle(pen_0, int_5, int_6, int_7 - 1, int_8 - 1);
        }
        protected void method_26(Pen pen_0)
        {
            this.method_25(pen_0, 0, 0, base.Width, base.Height);
        }
        protected void method_27(Pen pen_0, Rectangle rectangle_2)
        {
            this.method_25(pen_0, rectangle_2.X, rectangle_2.Y, rectangle_2.Width, rectangle_2.Height);
        }
        protected void method_28(Brush brush_0, HorizontalAlignment horizontalAlignment_0, int int_5, int int_6)
        {
            this.method_31(brush_0, this.Text, horizontalAlignment_0, int_5, int_6);
        }
        protected void method_29(Brush brush_0, Point point_4)
        {
            this.method_33(brush_0, this.Text, point_4.X, point_4.Y);
        }
        protected void method_30(Brush brush_0, int int_5, int int_6)
        {
            this.method_33(brush_0, this.Text, int_5, int_6);
        }
        protected void method_31(Brush brush_0, string string_1, HorizontalAlignment horizontalAlignment_0, int int_5, int int_6)
        {
            if (string_1.Length == 0)
            {
                return;
            }
            this.size_1 = this.method_17(string_1);
            this.point_2 = new Point(base.Width / 2 - this.size_1.Width / 2, this.Int32_0 / 2 - this.size_1.Height / 2);
            switch (horizontalAlignment_0)
            {
                case HorizontalAlignment.Left:
                    {
                        this.method_33(brush_0, string_1, int_5, this.point_2.Y + int_6);
                        return;
                    }
                case HorizontalAlignment.Right:
                    {
                        this.method_33(brush_0, string_1, base.Width - this.size_1.Width - int_5, this.point_2.Y + int_6);
                        return;
                    }
                case HorizontalAlignment.Center:
                    {
                        this.method_33(brush_0, string_1, this.point_2.X + int_5, this.point_2.Y + int_6);
                        return;
                    }
                default:
                    {
                        return;
                    }
            }
        }
        protected void method_32(Brush brush_0, string string_1, Point point_4)
        {
            this.method_33(brush_0, string_1, point_4.X, point_4.Y);
        }
        protected void method_33(Brush brush_0, string string_1, int int_5, int int_6)
        {
            if (string_1.Length == 0)
            {
                return;
            }
            this.graphics_0.DrawString(string_1, this.Font, brush_0, (float)int_5, (float)int_6);
        }
        protected void method_34(HorizontalAlignment horizontalAlignment_0, int int_5, int int_6)
        {
            this.method_37(this.image_0, horizontalAlignment_0, int_5, int_6);
        }
        protected void method_35(Point point_4)
        {
            this.method_39(this.image_0, point_4.X, point_4.Y);
        }
        protected void method_36(int int_5, int int_6)
        {
            this.method_39(this.image_0, int_5, int_6);
        }
        protected void method_37(Image image_1, HorizontalAlignment horizontalAlignment_0, int int_5, int int_6)
        {
            if (image_1 == null)
            {
                return;
            }
            this.point_3 = new Point(base.Width / 2 - image_1.Width / 2, this.Int32_0 / 2 - image_1.Height / 2);
            switch (horizontalAlignment_0)
            {
                case HorizontalAlignment.Left:
                    {
                        this.method_39(image_1, int_5, this.point_3.Y + int_6);
                        return;
                    }
                case HorizontalAlignment.Right:
                    {
                        this.method_39(image_1, base.Width - image_1.Width - int_5, this.point_3.Y + int_6);
                        return;
                    }
                case HorizontalAlignment.Center:
                    {
                        this.method_39(image_1, this.point_3.X + int_5, this.point_3.Y + int_6);
                        return;
                    }
                default:
                    {
                        return;
                    }
            }
        }
        protected void method_38(Image image_1, Point point_4)
        {
            this.method_39(image_1, point_4.X, point_4.Y);
        }
        protected void method_39(Image image_1, int int_5, int int_6)
        {
            if (image_1 == null)
            {
                return;
            }
            this.graphics_0.DrawImage(image_1, int_5, int_6, image_1.Width, image_1.Height);
        }
        protected void method_40(ColorBlend colorBlend_0, int int_5, int int_6, int int_7, int int_8)
        {
            this.method_42(colorBlend_0, int_5, int_6, int_7, int_8, 90f);
        }
        protected void method_41(Color color_2, Color color_3, int int_5, int int_6, int int_7, int int_8)
        {
            this.method_43(color_2, color_3, int_5, int_6, int_7, int_8, 90f);
        }
        protected void method_42(ColorBlend colorBlend_0, int int_5, int int_6, int int_7, int int_8, float float_0)
        {
            this.rectangle_1 = new Rectangle(int_5, int_6, int_7, int_8);
            this.method_44(colorBlend_0, this.rectangle_1, float_0);
        }
        protected void method_43(Color color_2, Color color_3, int int_5, int int_6, int int_7, int int_8, float float_0)
        {
            this.rectangle_1 = new Rectangle(int_5, int_6, int_7, int_8);
            this.method_45(color_2, color_3, this.rectangle_1, float_0);
        }
        protected void method_44(ColorBlend colorBlend_0, Rectangle rectangle_2, float float_0)
        {
            this.linearGradientBrush_0 = new LinearGradientBrush(rectangle_2, Color.Empty, Color.Empty, float_0);
            this.linearGradientBrush_0.InterpolationColors = colorBlend_0;
            this.graphics_0.FillRectangle(this.linearGradientBrush_0, rectangle_2);
        }
        protected void method_45(Color color_2, Color color_3, Rectangle rectangle_2, float float_0)
        {
            this.linearGradientBrush_0 = new LinearGradientBrush(rectangle_2, color_2, color_3, float_0);
            this.graphics_0.FillRectangle(this.linearGradientBrush_0, rectangle_2);
        }
    }
}
