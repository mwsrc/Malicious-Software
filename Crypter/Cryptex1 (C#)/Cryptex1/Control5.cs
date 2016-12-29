
using System;
using System.ComponentModel;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Threading;
using System.Windows.Forms;
namespace Cryptex1
{
    [DefaultEvent("CheckedChanged")]
    internal class Control5 : Control0
    {
        public delegate void Delegate3(object sender);
        private Color color_1;
        private Color color_2;
        private Color color_3;
        private Color color_4;
        private Color color_5;
        private Color color_6;
        private Pen pen_0;
        private Pen pen_1;
        private SolidBrush solidBrush_1;
        private SolidBrush solidBrush_2;
        private Rectangle rectangle_1;
        private Rectangle rectangle_2;
        private LinearGradientBrush linearGradientBrush_1;
        private int int_2 = 16;
        private bool bool_2;
        private Control5.Delegate3 delegate3_0;
        public event Control5.Delegate3 Event_0
        {
            add
            {
                Control5.Delegate3 @delegate = this.delegate3_0;
                Control5.Delegate3 delegate2;
                do
                {
                    delegate2 = @delegate;
                    Control5.Delegate3 value2 = (Control5.Delegate3)System.Delegate.Combine(delegate2, value);
                    @delegate = System.Threading.Interlocked.CompareExchange<Control5.Delegate3>(ref this.delegate3_0, value2, delegate2);
                }
                while (@delegate != delegate2);
            }
            remove
            {
                Control5.Delegate3 @delegate = this.delegate3_0;
                Control5.Delegate3 delegate2;
                do
                {
                    delegate2 = @delegate;
                    Control5.Delegate3 value2 = (Control5.Delegate3)System.Delegate.Remove(delegate2, value);
                    @delegate = System.Threading.Interlocked.CompareExchange<Control5.Delegate3>(ref this.delegate3_0, value2, delegate2);
                }
                while (@delegate != delegate2);
            }
        }
        public int Int32_2
        {
            get
            {
                return this.int_2;
            }
            set
            {
                if (value < 4)
                {
                    return;
                }
                this.int_2 = value;
                base.Int32_1 = value;
                base.Invalidate();
            }
        }
        public bool Boolean_2
        {
            get
            {
                return this.bool_2;
            }
            set
            {
                this.bool_2 = value;
                this.method_46();
                if (this.delegate3_0 != null)
                {
                    this.delegate3_0(this);
                }
                base.Invalidate();
            }
        }
        public Control5()
        {
            base.Int32_1 = 16;
            base.method_8("Gloss1", 38, Color.White);
            base.method_8("Gloss2", 5, Color.White);
            base.method_5("Checked1", Color.Transparent);
            base.method_8("Checked2", 40, Color.White);
            base.method_6("Unchecked1", 8, 8, 8);
            base.method_6("Unchecked2", 16, 16, 16);
            base.method_8("Glow", 5, Color.White);
            base.method_5("Text", Color.White);
            base.method_5("InnerOutline", Color.Black);
            base.method_8("OuterOutline", 15, Color.White);
        }
        protected override void ColorHook()
        {
            this.color_1 = base.method_4("Gloss1");
            this.color_2 = base.method_4("Gloss2");
            this.color_3 = base.method_4("Checked1");
            this.color_4 = base.method_4("Checked2");
            this.color_5 = base.method_4("Unchecked1");
            this.color_6 = base.method_4("Unchecked2");
            this.solidBrush_1 = new SolidBrush(base.method_4("Glow"));
            this.solidBrush_2 = new SolidBrush(base.method_4("Text"));
            this.pen_0 = new Pen(base.method_4("InnerOutline"));
            this.pen_1 = new Pen(base.method_4("OuterOutline"));
        }
        protected override void PaintHook()
        {
            this.graphics_0.Clear(this.BackColor);
            this.graphics_0.SmoothingMode = SmoothingMode.HighQuality;
            this.rectangle_1 = new Rectangle(4, 2, this.int_2 - 8, this.int_2 / 2 - 1);
            this.rectangle_2 = new Rectangle(4, 2, this.int_2 - 8, this.int_2 / 2);
            this.linearGradientBrush_1 = new LinearGradientBrush(this.rectangle_2, this.color_1, this.color_2, 90f);
            this.graphics_0.FillEllipse(this.linearGradientBrush_1, this.rectangle_1);
            this.rectangle_1 = new Rectangle(2, 2, this.int_2 - 4, this.int_2 - 4);
            if (this.bool_2)
            {
                this.linearGradientBrush_1 = new LinearGradientBrush(this.rectangle_1, this.color_3, this.color_4, 90f);
            }
            else
            {
                this.linearGradientBrush_1 = new LinearGradientBrush(this.rectangle_1, this.color_5, this.color_6, 90f);
            }
            this.graphics_0.FillEllipse(this.linearGradientBrush_1, this.rectangle_1);
            if (this.enum0_0 == Enum0.const_1)
            {
                this.rectangle_1 = new Rectangle(2, 2, this.int_2 - 4, this.int_2 - 4);
                this.graphics_0.FillEllipse(this.solidBrush_1, this.rectangle_1);
            }
            base.method_28(this.solidBrush_2, HorizontalAlignment.Left, this.int_2 + 3, 0);
            this.graphics_0.DrawEllipse(this.pen_0, 2, 2, this.int_2 - 4, this.int_2 - 4);
            this.graphics_0.DrawEllipse(this.pen_1, 1, 1, this.int_2 - 2, this.int_2 - 2);
        }
        protected override void OnMouseDown(MouseEventArgs e)
        {
            if (!this.bool_2)
            {
                this.Boolean_2 = true;
            }
            base.OnMouseDown(e);
        }
        protected override void OnCreation()
        {
            this.method_46();
        }
        private void method_46()
        {
            if (base.IsHandleCreated && this.bool_2)
            {
                foreach (Control control in base.Parent.Controls)
                {
                    if (!object.ReferenceEquals(control, this) && control is Control5)
                    {
                        ((Control5)control).Boolean_2 = false;
                    }
                }
                return;
            }
        }
    }
}
