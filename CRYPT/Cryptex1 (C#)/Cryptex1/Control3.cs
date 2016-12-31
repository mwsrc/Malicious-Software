
using System;
using System.Drawing;
using System.Windows.Forms;
namespace Cryptex1
{
    internal class Control3 : Control0
    {
        private Orientation orientation_0;
        private Pen pen_0;
        private Pen pen_1;
        public Orientation Orientation_0
        {
            get
            {
                return this.orientation_0;
            }
            set
            {
                this.orientation_0 = value;
                if (value == Orientation.Vertical)
                {
                    base.Int32_1 = 0;
                    base.Int32_0 = 14;
                }
                else
                {
                    base.Int32_1 = 14;
                    base.Int32_0 = 0;
                }
                base.Invalidate();
            }
        }
        public Control3()
        {
            base.Int32_1 = 14;
            base.method_5("Line1", Color.Black);
            base.method_6("Line2", 22, 22, 22);
        }
        protected override void ColorHook()
        {
            this.pen_0 = base.method_2("Line1");
            this.pen_1 = base.method_2("Line2");
        }
        protected override void PaintHook()
        {
            this.graphics_0.Clear(this.BackColor);
            if (this.orientation_0 == Orientation.Vertical)
            {
                this.graphics_0.DrawLine(this.pen_0, 6, 0, 6, base.Height);
                this.graphics_0.DrawLine(this.pen_1, 7, 0, 7, base.Height);
                return;
            }
            this.graphics_0.DrawLine(this.pen_0, 0, 6, base.Width, 6);
            this.graphics_0.DrawLine(this.pen_1, 0, 7, base.Width, 7);
        }
    }
}
