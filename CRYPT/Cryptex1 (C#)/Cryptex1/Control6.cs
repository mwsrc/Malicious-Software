
using System;
using System.ComponentModel;
using System.Drawing;
using System.Threading;
using System.Windows.Forms;
namespace Cryptex1
{
    [DefaultEvent("CheckedChanged")]
    internal class Control6 : Control0
    {
        public delegate void Delegate4(object sender);
        private Color color_1;
        private Color color_2;
        private Color color_3;
        private Color color_4;
        private Color color_5;
        private Color color_6;
        private Pen pen_0;
        private Pen pen_1;
        private Pen pen_2;
        private SolidBrush solidBrush_1;
        private SolidBrush solidBrush_2;
        private int int_2 = 16;
        private bool bool_2;
        private Control6.Delegate4 delegate4_0;
        public event Control6.Delegate4 Event_0
        {
            add
            {
                Control6.Delegate4 @delegate = this.delegate4_0;
                Control6.Delegate4 delegate2;
                do
                {
                    delegate2 = @delegate;
                    Control6.Delegate4 value2 = (Control6.Delegate4)System.Delegate.Combine(delegate2, value);
                    @delegate = System.Threading.Interlocked.CompareExchange<Control6.Delegate4>(ref this.delegate4_0, value2, delegate2);
                }
                while (@delegate != delegate2);
            }
            remove
            {
                Control6.Delegate4 @delegate = this.delegate4_0;
                Control6.Delegate4 delegate2;
                do
                {
                    delegate2 = @delegate;
                    Control6.Delegate4 value2 = (Control6.Delegate4)System.Delegate.Remove(delegate2, value);
                    @delegate = System.Threading.Interlocked.CompareExchange<Control6.Delegate4>(ref this.delegate4_0, value2, delegate2);
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
                base.Invalidate();
            }
        }
        public Control6()
        {
            base.Int32_1 = 16;
            base.method_6("Border", 26, 26, 26);
            base.method_8("Gloss1", 35, Color.White);
            base.method_8("Gloss2", 5, Color.White);
            base.method_5("Checked1", Color.Transparent);
            base.method_8("Checked2", 40, Color.White);
            base.method_6("Unchecked1", 8, 8, 8);
            base.method_6("Unchecked2", 16, 16, 16);
            base.method_8("Glow", 5, Color.White);
            base.method_5("Text", Color.White);
            base.method_5("InnerOutline", Color.Black);
            base.method_5("OuterOutline", Color.Black);
        }
        protected override void ColorHook()
        {
            this.color_1 = base.method_4("Gloss1");
            this.color_2 = base.method_4("Gloss2");
            this.color_3 = base.method_4("Checked1");
            this.color_4 = base.method_4("Checked2");
            this.color_5 = base.method_4("Unchecked1");
            this.color_6 = base.method_4("Unchecked2");
            this.pen_0 = new Pen(base.method_4("Border"));
            this.pen_1 = new Pen(base.method_4("InnerOutline"));
            this.pen_2 = new Pen(base.method_4("OuterOutline"));
            this.solidBrush_1 = new SolidBrush(base.method_4("Glow"));
            this.solidBrush_2 = new SolidBrush(base.method_4("Text"));
        }
        protected override void PaintHook()
        {
            this.graphics_0.Clear(this.BackColor);
            base.method_22(this.pen_0, 0, 0, this.int_2, this.int_2, 1);
            base.method_41(this.color_1, this.color_2, 0, 0, this.int_2, this.int_2 / 2);
            if (this.bool_2)
            {
                base.method_41(this.color_3, this.color_4, 2, 2, this.int_2 - 4, this.int_2 - 4);
            }
            else
            {
                base.method_43(this.color_5, this.color_6, 2, 2, this.int_2 - 4, this.int_2 - 4, 90f);
            }
            if (this.enum0_0 == Enum0.const_1)
            {
                this.graphics_0.FillRectangle(this.solidBrush_1, 0, 0, this.int_2, this.int_2);
            }
            base.method_28(this.solidBrush_2, HorizontalAlignment.Left, this.int_2 + 3, 0);
            base.method_22(this.pen_1, 0, 0, this.int_2, this.int_2, 2);
            base.method_25(this.pen_2, 0, 0, this.int_2, this.int_2);
            base.method_21(this.BackColor, 0, 0, this.int_2, this.int_2);
        }
        protected override void OnMouseDown(MouseEventArgs e)
        {
            this.bool_2 = !this.bool_2;
            if (this.delegate4_0 != null)
            {
                this.delegate4_0(this);
            }
            base.OnMouseDown(e);
        }
    }
}
