
using System;
using System.ComponentModel;
using System.Drawing;
using System.Threading;
using System.Windows.Forms;
namespace Cryptex1
{
    [DefaultEvent("Scroll")]
    internal class Control1 : Control0
    {
        public delegate void Delegate0(object sender);
        private Control1.Delegate0 delegate0_0;
        private int int_2;
        private int int_3 = 10;
        private int int_4;
        private SolidBrush solidBrush_1;
        private SolidBrush solidBrush_2;
        private Pen pen_0;
        private Pen pen_1;
        private Pen pen_2;
        private Pen pen_3;
        private Color color_1;
        private Color color_2;
        private Rectangle rectangle_1;
        private int int_5;
        private bool bool_2;
        public event Control1.Delegate0 Event_0
        {
            add
            {
                Control1.Delegate0 @delegate = this.delegate0_0;
                Control1.Delegate0 delegate2;
                do
                {
                    delegate2 = @delegate;
                    Control1.Delegate0 value2 = (Control1.Delegate0)System.Delegate.Combine(delegate2, value);
                    @delegate = System.Threading.Interlocked.CompareExchange<Control1.Delegate0>(ref this.delegate0_0, value2, delegate2);
                }
                while (@delegate != delegate2);
            }
            remove
            {
                Control1.Delegate0 @delegate = this.delegate0_0;
                Control1.Delegate0 delegate2;
                do
                {
                    delegate2 = @delegate;
                    Control1.Delegate0 value2 = (Control1.Delegate0)System.Delegate.Remove(delegate2, value);
                    @delegate = System.Threading.Interlocked.CompareExchange<Control1.Delegate0>(ref this.delegate0_0, value2, delegate2);
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
                if (value < 0)
                {
                    throw new System.Exception("Property value is not valid.");
                }
                this.int_2 = value;
                if (value > this.int_4)
                {
                    this.int_4 = value;
                }
                if (value > this.int_3)
                {
                    this.int_3 = value;
                }
                base.Invalidate();
            }
        }
        public int Int32_3
        {
            get
            {
                return this.int_3;
            }
            set
            {
                if (value < 0)
                {
                    throw new System.Exception("Property value is not valid.");
                }
                this.int_3 = value;
                if (value < this.int_4)
                {
                    this.int_4 = value;
                }
                if (value < this.int_2)
                {
                    this.int_2 = value;
                }
                base.Invalidate();
            }
        }
        public int Int32_4
        {
            get
            {
                return this.int_4;
            }
            set
            {
                if (value == this.int_4)
                {
                    return;
                }
                if (value <= this.int_3 && value >= this.int_2)
                {
                    this.int_4 = value;
                    base.Invalidate();
                    if (this.delegate0_0 != null)
                    {
                        this.delegate0_0(this);
                    }
                    return;
                }
                throw new System.Exception("Property value is not valid.");
            }
        }
        public Control1()
        {
            base.Int32_1 = 17;
            base.method_6("Track", 100, 100, 100);
            base.method_6("Border", 70, 70, 70);
            base.method_6("Line", 135, 135, 135);
            base.method_6("BarBack", 118, 118, 118);
            base.method_6("BarGloss1", 150, 150, 150);
            base.method_6("BarGloss2", 128, 128, 128);
            base.method_6("BarShine", 165, 165, 165);
            base.method_6("BarBorder", 80, 80, 80);
        }
        protected override void ColorHook()
        {
            this.solidBrush_1 = base.method_3("Track");
            this.solidBrush_2 = base.method_3("BarBack");
            this.pen_0 = base.method_2("Border");
            this.pen_1 = base.method_2("Line");
            this.pen_2 = base.method_2("BarShine");
            this.pen_3 = base.method_2("BarBorder");
            this.color_1 = base.method_4("BarGloss1");
            this.color_2 = base.method_4("BarGloss2");
        }
        protected override void PaintHook()
        {
            this.graphics_0.Clear(this.BackColor);
            this.graphics_0.FillRectangle(this.solidBrush_1, 0, 8, base.Width, 2);
            base.method_25(this.pen_0, 0, 7, base.Width, 4);
            this.graphics_0.DrawLine(this.pen_1, 0, 11, base.Width, 11);
            this.int_5 = System.Convert.ToInt32((double)(this.int_4 - this.int_2) / (double)(this.int_3 - this.int_2) * (double)(base.Width - 9));
            this.rectangle_1 = new Rectangle(this.int_5, 0, 9, 17);
            this.graphics_0.FillRectangle(this.solidBrush_2, this.rectangle_1);
            base.method_41(this.color_1, this.color_2, this.rectangle_1.X, 0, 9, 7);
            this.graphics_0.DrawLine(this.pen_2, this.rectangle_1.X, 1, this.rectangle_1.X + 8, 1);
            this.graphics_0.DrawRectangle(this.pen_3, this.rectangle_1.X, 0, 8, 16);
        }
        protected override void OnMouseDown(MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                this.int_5 = System.Convert.ToInt32((double)(this.int_4 - this.int_2) / (double)(this.int_3 - this.int_2) * (double)(base.Width - 9));
                this.rectangle_1 = new Rectangle(this.int_5, 0, 9, 17);
                this.bool_2 = this.rectangle_1.Contains(e.Location);
            }
            base.OnMouseDown(e);
        }
        protected override void OnMouseMove(MouseEventArgs e)
        {
            if (this.bool_2 && e.X > -1 && e.X < base.Width + 1)
            {
                this.Int32_4 = this.int_2 + System.Convert.ToInt32((double)(this.int_3 - this.int_2) * ((double)e.X / (double)base.Width));
            }
            base.OnMouseMove(e);
        }
        protected override void OnMouseUp(MouseEventArgs e)
        {
            this.bool_2 = false;
            base.OnMouseUp(e);
        }
    }
}
