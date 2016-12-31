
using System;
using System.Drawing;
namespace Cryptex1
{
    internal class Control9 : Control8
    {
        private Color color_2;
        private SolidBrush solidBrush_1;
        private SolidBrush solidBrush_2;
        private SolidBrush solidBrush_3;
        private Pen pen_0;
        private Pen pen_1;
        private Pen pen_2;
        private Pen pen_3;
        private Pen pen_4;
        private Size size_2;
        private Rectangle rectangle_2;
        public Control9()
        {
            base.Boolean_2 = true;
            base.method_6("Back", 14, 14, 14);
            base.method_6("MainFill", 20, 20, 20);
            base.method_6("MainOutline1", 32, 32, 32);
            base.method_5("MainOutline2", Color.Black);
            base.method_8("TitleShadow", 50, Color.Black);
            base.method_6("TitleFill", 20, 20, 20);
            base.method_5("Text", Color.White);
            base.method_6("TitleOutline1", 32, 32, 32);
            base.method_5("TitleOutline2", Color.Black);
            this.BackColor = Color.FromArgb(20, 20, 20);
        }
        protected override void ColorHook()
        {
            this.color_2 = base.method_4("Back");
            this.solidBrush_1 = new SolidBrush(base.method_4("MainFill"));
            this.solidBrush_2 = new SolidBrush(base.method_4("TitleFill"));
            this.solidBrush_3 = new SolidBrush(base.method_4("Text"));
            this.pen_0 = new Pen(base.method_4("MainOutline1"));
            this.pen_1 = new Pen(base.method_4("MainOutline2"));
            this.pen_2 = new Pen(base.method_4("TitleShadow"));
            this.pen_3 = new Pen(base.method_4("TitleOutline1"));
            this.pen_4 = new Pen(base.method_4("TitleOutline2"));
            this.BackColor = base.method_4("MainFill");
        }
        protected override void PaintHook()
        {
            this.graphics_0.Clear(this.color_2);
            if (this.Text.Length == 0)
            {
                this.graphics_0.FillRectangle(this.solidBrush_1, base.ClientRectangle);
                base.method_23(this.pen_0, 1);
                base.method_26(this.pen_1);
                return;
            }
            this.graphics_0.FillRectangle(this.solidBrush_1, 0, 13, base.Width, base.Height - 13);
            base.method_22(this.pen_0, 0, 13, base.Width, base.Height - 13, 1);
            base.method_25(this.pen_1, 0, 13, base.Width, base.Height - 13);
            this.size_2 = base.method_18();
            this.rectangle_2 = new Rectangle(8, 0, this.size_2.Width + 16, 26);
            base.method_25(this.pen_2, 7, 0, this.rectangle_2.Width + 1, 27);
            this.graphics_0.FillRectangle(this.solidBrush_2, this.rectangle_2);
            base.method_29(this.solidBrush_3, base.method_10(this.rectangle_2, this.size_2));
            base.method_24(this.pen_3, this.rectangle_2, 1);
            base.method_27(this.pen_4, this.rectangle_2);
            base.method_21(this.color_2, 0, 13, base.Width, base.Height - 13);
        }
    }
}
