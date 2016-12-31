
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Windows.Forms;
namespace Cryptex1
{
    internal abstract class Control0 : Control
    {
        protected Graphics graphics_0;
        protected Bitmap bitmap_0;
        protected Enum0 enum0_0;
        private Color color_0;
        private bool bool_0;
        private Image image_0;
        private Size size_0;
        private int int_0;
        private int int_1;
        private bool bool_1;
        private System.Collections.Generic.Dictionary<string, Color> dictionary_0 = new System.Collections.Generic.Dictionary<string, Color>();
        private string string_0;
        private Point point_0;
        private Bitmap bitmap_1;
        private Graphics graphics_1;
        private SolidBrush solidBrush_0;
        private Point point_1;
        private Size size_1;
        private Point point_2;
        private LinearGradientBrush linearGradientBrush_0;
        private Rectangle rectangle_0;
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
        [Browsable(false), DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden), EditorBrowsable(EditorBrowsableState.Never)]
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
        protected int Int32_0
        {
            get
            {
                return this.int_0;
            }
            set
            {
                this.int_0 = value;
                if (this.Int32_0 != 0 && base.IsHandleCreated)
                {
                    base.Width = this.Int32_0;
                }
            }
        }
        protected int Int32_1
        {
            get
            {
                return this.int_1;
            }
            set
            {
                this.int_1 = value;
                if (this.Int32_1 != 0 && base.IsHandleCreated)
                {
                    base.Height = this.Int32_1;
                }
            }
        }
        public bool Boolean_1
        {
            get
            {
                return this.bool_1;
            }
            set
            {
                if (!value && this.BackColor.A != 255)
                {
                    throw new System.Exception("Unable to change value to false while a transparent BackColor is in use.");
                }
                base.SetStyle(ControlStyles.Opaque, !value);
                base.SetStyle(ControlStyles.SupportsTransparentBackColor, value);
                if (value)
                {
                    this.method_1();
                }
                else
                {
                    this.bitmap_0 = null;
                }
                this.bool_1 = value;
                base.Invalidate();
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
        public Control0()
        {
            base.SetStyle(ControlStyles.UserPaint | ControlStyles.Opaque | ControlStyles.AllPaintingInWmPaint | ControlStyles.OptimizedDoubleBuffer, true);
            this.size_0 = Size.Empty;
            this.bitmap_1 = new Bitmap(1, 1);
            this.graphics_1 = Graphics.FromImage(this.bitmap_1);
            this.Font = new Font("Verdana", 8f);
            this.method_9();
        }
        protected override void SetBoundsCore(int x, int y, int width, int height, BoundsSpecified specified)
        {
            if (this.int_0 != 0)
            {
                width = this.int_0;
            }
            if (this.int_1 != 0)
            {
                height = this.int_1;
            }
            base.SetBoundsCore(x, y, width, height, specified);
        }
        protected sealed override void OnSizeChanged(System.EventArgs e)
        {
            if (this.bool_1 && base.Width != 0 && base.Height != 0)
            {
                this.bitmap_0 = new Bitmap(base.Width, base.Height);
                this.graphics_0 = Graphics.FromImage(this.bitmap_0);
            }
            base.Invalidate();
            base.OnSizeChanged(e);
        }
        protected sealed override void OnPaint(PaintEventArgs e)
        {
            if (base.Width == 0 || base.Height == 0)
            {
                return;
            }
            if (this.bool_1)
            {
                this.PaintHook();
                e.Graphics.DrawImage(this.bitmap_0, 0, 0);
                return;
            }
            this.graphics_0 = e.Graphics;
            this.PaintHook();
        }
        protected override void OnHandleCreated(System.EventArgs e)
        {
            this.method_9();
            this.ColorHook();
            if (this.int_0 != 0)
            {
                base.Width = this.int_0;
            }
            if (this.int_1 != 0)
            {
                base.Height = this.int_1;
            }
            this.BackColor = this.color_0;
            this.OnCreation();
            base.OnHandleCreated(e);
        }
        protected virtual void OnCreation()
        {
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
        protected override void OnMouseDown(MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                this.method_0(Enum0.const_2);
            }
            base.OnMouseDown(e);
        }
        protected override void OnMouseLeave(System.EventArgs e)
        {
            this.method_0(Enum0.const_0);
            base.OnMouseLeave(e);
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
        private void method_0(Enum0 enum0_1)
        {
            this.enum0_0 = enum0_1;
            base.Invalidate();
        }
        private void method_1()
        {
            if (base.Width != 0 && base.Height != 0)
            {
                this.bitmap_0 = new Bitmap(base.Width, base.Height);
                this.graphics_0 = Graphics.FromImage(this.bitmap_0);
                return;
            }
        }
        protected Pen method_2(string string_1)
        {
            return new Pen(this.dictionary_0[string_1]);
        }
        protected SolidBrush method_3(string string_1)
        {
            return new SolidBrush(this.dictionary_0[string_1]);
        }
        protected Color method_4(string string_1)
        {
            return this.dictionary_0[string_1];
        }
        protected void method_5(string string_1, Color color_1)
        {
            if (this.dictionary_0.ContainsKey(string_1))
            {
                this.dictionary_0[string_1] = color_1;
                return;
            }
            this.dictionary_0.Add(string_1, color_1);
        }
        protected void method_6(string string_1, byte byte_0, byte byte_1, byte byte_2)
        {
            this.method_5(string_1, Color.FromArgb((int)byte_0, (int)byte_1, (int)byte_2));
        }
        protected void method_7(string string_1, byte byte_0, byte byte_1, byte byte_2, byte byte_3)
        {
            this.method_5(string_1, Color.FromArgb((int)byte_0, (int)byte_1, (int)byte_2, (int)byte_3));
        }
        protected void method_8(string string_1, byte byte_0, Color color_1)
        {
            this.method_5(string_1, Color.FromArgb((int)byte_0, color_1));
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
        protected Point method_10(Rectangle rectangle_1, Size size_2)
        {
            this.point_0 = new Point(rectangle_1.Width / 2 - size_2.Width / 2 + rectangle_1.X, rectangle_1.Height / 2 - size_2.Height / 2 + rectangle_1.Y);
            return this.point_0;
        }
        protected Point method_11(Rectangle rectangle_1, Rectangle rectangle_2)
        {
            return this.method_10(rectangle_1, rectangle_2.Size);
        }
        protected Point method_12(int int_2, int int_3, int int_4, int int_5)
        {
            this.point_0 = new Point(int_2 / 2 - int_4 / 2, int_3 / 2 - int_5 / 2);
            return this.point_0;
        }
        protected Point method_13(Size size_2, Size size_3)
        {
            return this.method_12(size_2.Width, size_2.Height, size_3.Width, size_3.Height);
        }
        protected Point method_14(Rectangle rectangle_1)
        {
            return this.method_12(base.ClientRectangle.Width, base.ClientRectangle.Height, rectangle_1.Width, rectangle_1.Height);
        }
        protected Point method_15(Size size_2)
        {
            return this.method_12(base.Width, base.Height, size_2.Width, size_2.Height);
        }
        protected Point method_16(int int_2, int int_3)
        {
            return this.method_12(base.Width, base.Height, int_2, int_3);
        }
        protected Size method_17(string string_1)
        {
            return this.graphics_1.MeasureString(string_1, this.Font, base.Width).ToSize();
        }
        protected Size method_18()
        {
            return this.graphics_1.MeasureString(this.Text, this.Font, base.Width).ToSize();
        }
        protected void method_19(Color color_1)
        {
            this.method_21(color_1, 0, 0, base.Width, base.Height);
        }
        protected void method_20(Color color_1, Rectangle rectangle_1)
        {
            this.method_21(color_1, rectangle_1.X, rectangle_1.Y, rectangle_1.Width, rectangle_1.Height);
        }
        protected void method_21(Color color_1, int int_2, int int_3, int int_4, int int_5)
        {
            if (this.bool_0)
            {
                return;
            }
            if (this.bool_1)
            {
                this.bitmap_0.SetPixel(int_2, int_3, color_1);
                this.bitmap_0.SetPixel(int_2 + (int_4 - 1), int_3, color_1);
                this.bitmap_0.SetPixel(int_2, int_3 + (int_5 - 1), color_1);
                this.bitmap_0.SetPixel(int_2 + (int_4 - 1), int_3 + (int_5 - 1), color_1);
                return;
            }
            this.solidBrush_0 = new SolidBrush(color_1);
            this.graphics_0.FillRectangle(this.solidBrush_0, int_2, int_3, 1, 1);
            this.graphics_0.FillRectangle(this.solidBrush_0, int_2 + (int_4 - 1), int_3, 1, 1);
            this.graphics_0.FillRectangle(this.solidBrush_0, int_2, int_3 + (int_5 - 1), 1, 1);
            this.graphics_0.FillRectangle(this.solidBrush_0, int_2 + (int_4 - 1), int_3 + (int_5 - 1), 1, 1);
        }
        protected void method_22(Pen pen_0, int int_2, int int_3, int int_4, int int_5, int int_6)
        {
            this.method_25(pen_0, int_2 + int_6, int_3 + int_6, int_4 - int_6 * 2, int_5 - int_6 * 2);
        }
        protected void method_23(Pen pen_0, int int_2)
        {
            this.method_22(pen_0, 0, 0, base.Width, base.Height, int_2);
        }
        protected void method_24(Pen pen_0, Rectangle rectangle_1, int int_2)
        {
            this.method_22(pen_0, rectangle_1.X, rectangle_1.Y, rectangle_1.Width, rectangle_1.Height, int_2);
        }
        protected void method_25(Pen pen_0, int int_2, int int_3, int int_4, int int_5)
        {
            this.graphics_0.DrawRectangle(pen_0, int_2, int_3, int_4 - 1, int_5 - 1);
        }
        protected void method_26(Pen pen_0)
        {
            this.method_25(pen_0, 0, 0, base.Width, base.Height);
        }
        protected void method_27(Pen pen_0, Rectangle rectangle_1)
        {
            this.method_25(pen_0, rectangle_1.X, rectangle_1.Y, rectangle_1.Width, rectangle_1.Height);
        }
        protected void method_28(Brush brush_0, HorizontalAlignment horizontalAlignment_0, int int_2, int int_3)
        {
            this.method_31(brush_0, this.Text, horizontalAlignment_0, int_2, int_3);
        }
        protected void method_29(Brush brush_0, Point point_3)
        {
            this.method_33(brush_0, this.Text, point_3.X, point_3.Y);
        }
        protected void method_30(Brush brush_0, int int_2, int int_3)
        {
            this.method_33(brush_0, this.Text, int_2, int_3);
        }
        protected void method_31(Brush brush_0, string string_1, HorizontalAlignment horizontalAlignment_0, int int_2, int int_3)
        {
            if (string_1.Length == 0)
            {
                return;
            }
            this.size_1 = this.method_17(string_1);
            this.point_1 = this.method_15(this.size_1);
            switch (horizontalAlignment_0)
            {
                case HorizontalAlignment.Left:
                    {
                        this.method_33(brush_0, string_1, int_2, this.point_1.Y + int_3);
                        return;
                    }
                case HorizontalAlignment.Right:
                    {
                        this.method_33(brush_0, string_1, base.Width - this.size_1.Width - int_2, this.point_1.Y + int_3);
                        return;
                    }
                case HorizontalAlignment.Center:
                    {
                        this.method_33(brush_0, string_1, this.point_1.X + int_2, this.point_1.Y + int_3);
                        return;
                    }
                default:
                    {
                        return;
                    }
            }
        }
        protected void method_32(Brush brush_0, string string_1, Point point_3)
        {
            this.method_33(brush_0, string_1, point_3.X, point_3.Y);
        }
        protected void method_33(Brush brush_0, string string_1, int int_2, int int_3)
        {
            if (string_1.Length == 0)
            {
                return;
            }
            this.graphics_0.DrawString(string_1, this.Font, brush_0, (float)int_2, (float)int_3);
        }
        protected void method_34(HorizontalAlignment horizontalAlignment_0, int int_2, int int_3)
        {
            this.method_37(this.image_0, horizontalAlignment_0, int_2, int_3);
        }
        protected void method_35(Point point_3)
        {
            this.method_39(this.image_0, point_3.X, point_3.Y);
        }
        protected void method_36(int int_2, int int_3)
        {
            this.method_39(this.image_0, int_2, int_3);
        }
        protected void method_37(Image image_1, HorizontalAlignment horizontalAlignment_0, int int_2, int int_3)
        {
            if (image_1 == null)
            {
                return;
            }
            this.point_2 = this.method_15(image_1.Size);
            switch (horizontalAlignment_0)
            {
                case HorizontalAlignment.Left:
                    {
                        this.method_39(image_1, int_2, this.point_2.Y + int_3);
                        return;
                    }
                case HorizontalAlignment.Right:
                    {
                        this.method_39(image_1, base.Width - image_1.Width - int_2, this.point_2.Y + int_3);
                        return;
                    }
                case HorizontalAlignment.Center:
                    {
                        this.method_39(image_1, this.point_2.X + int_2, this.point_2.Y + int_3);
                        return;
                    }
                default:
                    {
                        return;
                    }
            }
        }
        protected void method_38(Image image_1, Point point_3)
        {
            this.method_39(image_1, point_3.X, point_3.Y);
        }
        protected void method_39(Image image_1, int int_2, int int_3)
        {
            if (image_1 == null)
            {
                return;
            }
            this.graphics_0.DrawImage(image_1, int_2, int_3, image_1.Width, image_1.Height);
        }
        protected void method_40(ColorBlend colorBlend_0, int int_2, int int_3, int int_4, int int_5)
        {
            this.method_42(colorBlend_0, int_2, int_3, int_4, int_5, 90f);
        }
        protected void method_41(Color color_1, Color color_2, int int_2, int int_3, int int_4, int int_5)
        {
            this.method_43(color_1, color_2, int_2, int_3, int_4, int_5, 90f);
        }
        protected void method_42(ColorBlend colorBlend_0, int int_2, int int_3, int int_4, int int_5, float float_0)
        {
            this.rectangle_0 = new Rectangle(int_2, int_3, int_4, int_5);
            this.method_44(colorBlend_0, this.rectangle_0, float_0);
        }
        protected void method_43(Color color_1, Color color_2, int int_2, int int_3, int int_4, int int_5, float float_0)
        {
            this.rectangle_0 = new Rectangle(int_2, int_3, int_4, int_5);
            this.method_45(color_1, color_2, this.rectangle_0, float_0);
        }
        protected void method_44(ColorBlend colorBlend_0, Rectangle rectangle_1, float float_0)
        {
            this.linearGradientBrush_0 = new LinearGradientBrush(rectangle_1, Color.Empty, Color.Empty, float_0);
            this.linearGradientBrush_0.InterpolationColors = colorBlend_0;
            this.graphics_0.FillRectangle(this.linearGradientBrush_0, rectangle_1);
        }
        protected void method_45(Color color_1, Color color_2, Rectangle rectangle_1, float float_0)
        {
            this.linearGradientBrush_0 = new LinearGradientBrush(rectangle_1, color_1, color_2, float_0);
            this.graphics_0.FillRectangle(this.linearGradientBrush_0, rectangle_1);
        }
    }
}
