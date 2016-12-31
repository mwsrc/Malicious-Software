
using System;
using System.Drawing;
using System.Windows.Forms;
namespace Cryptex1
{
    internal class Control4 : Control0
    {
        private Color color_1;
        private Color color_2;
        private Color color_3;
        private Color color_4;
        private Color color_5;
        private Color color_6;
        private SolidBrush solidBrush_1;
        private SolidBrush solidBrush_2;
        private Pen pen_0;
        private Pen pen_1;
        private Pen pen_2;
        public Control4()
        {
            base.method_6("Back", 14, 14, 14);
            base.method_6("DownGradient1", 14, 14, 14);
            base.method_6("DownGradient2", 41, 41, 41);
            base.method_8("OverShine", 5, Color.White);
            base.method_8("GlossGradient1", 30, Color.White);
            base.method_8("GlossGradient2", 5, Color.White);
            base.method_6("Highlight1", 62, 62, 62);
            base.method_8("Highlight2", 15, Color.White);
            base.method_5("Border", Color.Black);
            base.method_6("Corners", 16, 16, 16);
            base.method_5("Text", Color.White);
        }
        protected override void ColorHook()
        {
            this.color_1 = base.method_4("Back");
            this.color_2 = base.method_4("DownGradient1");
            this.color_3 = base.method_4("DownGradient2");
            this.color_4 = base.method_4("GlossGradient1");
            this.color_5 = base.method_4("GlossGradient2");
            this.color_6 = base.method_4("Corners");
            this.solidBrush_1 = new SolidBrush(base.method_4("OverShine"));
            this.solidBrush_2 = new SolidBrush(base.method_4("Text"));
            this.pen_0 = new Pen(base.method_4("Highlight1"));
            this.pen_1 = new Pen(base.method_4("Highlight2"));
            this.pen_2 = new Pen(base.method_4("Border"));
        }
        protected override void PaintHook()
        {
            this.graphics_0.Clear(this.color_1);
            if (this.enum0_0 == Enum0.const_2)
            {
                base.method_43(this.color_2, this.color_3, 0, 0, base.Width, base.Height, 90f);
            }
            if (this.enum0_0 == Enum0.const_1)
            {
                this.graphics_0.FillRectangle(this.solidBrush_1, base.ClientRectangle);
            }
            base.method_43(this.color_4, this.color_5, 0, 0, base.Width, base.Height / 2, 90f);
            this.graphics_0.DrawLine(this.pen_0, 0, 1, base.Width, 1);
            base.method_24(this.pen_1, base.ClientRectangle, 1);
            base.method_27(this.pen_2, base.ClientRectangle);
            base.method_20(this.color_6, new Rectangle(1, 1, base.Width - 2, base.Height - 2));
            base.method_20(this.BackColor, base.ClientRectangle);
            base.method_28(this.solidBrush_2, HorizontalAlignment.Center, 0, 0);
        }
    }
}
