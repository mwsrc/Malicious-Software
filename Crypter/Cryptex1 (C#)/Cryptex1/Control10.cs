
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;
namespace Cryptex1
{
    internal class Control10 : Control8
    {
        private ColorBlend colorBlend_0;
        private Color color_2;
        private Color color_3;
        private Color color_4;
        private Pen pen_0;
        private Pen pen_1;
        private Pen pen_2;
        private Pen pen_3;
        private Pen pen_4;
        private SolidBrush solidBrush_1;
        private SolidBrush solidBrush_2;
        private SolidBrush solidBrush_3;
        private SolidBrush solidBrush_4;
        private Rectangle rectangle_2;
        private LinearGradientBrush linearGradientBrush_1;
        private GraphicsPath graphicsPath_0;
        private GraphicsPath graphicsPath_1;
        public Control10()
        {
            base.Int32_0 = 24;
            base.Color_0 = Color.Fuchsia;
            this.graphicsPath_0 = new GraphicsPath();
            this.colorBlend_0 = new ColorBlend();
            this.colorBlend_0.Positions = new float[]
           {
               0f, 
               0.4f, 
               0.6f, 
               1f
           };
            base.method_6("BackColor", 14, 14, 14);
            base.method_6("CornerGradient1", 48, 48, 48);
            base.method_6("CornerGradient2", 4, 4, 4);
            base.method_5("TextShadow", Color.Black);
            base.method_5("Text", Color.White);
            base.method_8("BorderHighlight", 26, Color.White);
            base.method_6("Border", 45, 45, 45);
            base.method_5("Outline", Color.Black);
            base.method_8("CornerHighlight", 15, Color.White);
            base.method_6("TitleShine", 100, 100, 100);
            base.method_8("TitleGloss", 42, Color.White);
            base.method_8("CornerGloss", 15, Color.White);
            base.method_6("TitleGradient1", 14, 14, 14);
            base.method_6("TitleGradient2", 41, 41, 41);
            this.BackColor = Color.FromArgb(14, 14, 14);
        }
        protected override void ColorHook()
        {
            this.colorBlend_0.Colors = new Color[]
           {
               base.method_4("TitleGradient1"), 
               base.method_4("TitleGradient2"), 
               base.method_4("TitleGradient2"), 
               base.method_4("TitleGradient1")
           };
            this.color_2 = base.method_4("BackColor");
            this.color_3 = base.method_4("CornerGradient1");
            this.color_4 = base.method_4("CornerGradient2");
            this.pen_0 = new Pen(base.method_4("Border"), 8f);
            this.pen_0.Alignment = PenAlignment.Inset;
            this.pen_1 = new Pen(base.method_4("Outline"));
            this.pen_2 = new Pen(base.method_4("CornerHighlight"), 2f);
            this.pen_3 = new Pen(base.method_4("TitleShine"));
            this.pen_4 = new Pen(base.method_4("BorderHighlight"));
            this.solidBrush_1 = new SolidBrush(base.method_4("TitleGloss"));
            this.solidBrush_2 = new SolidBrush(base.method_4("CornerGloss"));
            this.solidBrush_3 = new SolidBrush(base.method_4("TextShadow"));
            this.solidBrush_4 = new SolidBrush(base.method_4("Text"));
            this.BackColor = this.color_2;
        }
        protected override void PaintHook()
        {
            this.graphics_0.Clear(this.color_2);
            this.graphics_0.FillRectangle(Brushes.Fuchsia, 0, 0, base.Width, 3);
            base.method_25(this.pen_0, 0, 17, base.Width + 1, base.Height - 16);
            base.method_25(this.pen_4, 1, 23, base.Width - 2, base.Height - 24);
            base.method_25(this.pen_1, 0, 24, base.Width, base.Height - 24);
            base.method_25(this.pen_1, 7, 23, base.Width - 14, base.Height - 30);
            this.rectangle_2 = new Rectangle(30, 2, base.Width - 67, 22);
            this.linearGradientBrush_1 = new LinearGradientBrush(this.rectangle_2, Color.Empty, Color.Empty, 0f);
            this.linearGradientBrush_1.InterpolationColors = this.colorBlend_0;
            this.graphics_0.FillRectangle(this.linearGradientBrush_1, this.rectangle_2);
            this.graphics_0.FillRectangle(this.solidBrush_1, 30, 2, base.Width - 67, 11);
            this.graphics_0.DrawLine(this.pen_3, 30, 3, base.Width - 67, 3);
            this.graphics_0.DrawLine(this.pen_1, 30, 2, base.Width - 67, 2);
            this.graphics_0.SetClip(this.graphicsPath_0);
            this.rectangle_2 = new Rectangle(0, 0, base.Width, 24);
            this.linearGradientBrush_1 = new LinearGradientBrush(this.rectangle_2, this.color_3, this.color_4, 90f);
            this.graphics_0.FillRectangle(this.linearGradientBrush_1, this.rectangle_2);
            this.graphics_0.FillRectangle(this.solidBrush_2, 0, 0, base.Width, 11);
            this.graphics_0.DrawPath(this.pen_2, this.graphicsPath_1);
            this.graphics_0.ResetClip();
            this.graphics_0.DrawPath(this.pen_1, this.graphicsPath_0);
            base.method_28(this.solidBrush_3, HorizontalAlignment.Center, -21, 3);
            base.method_28(this.solidBrush_4, HorizontalAlignment.Center, -20, 2);
            base.method_34(HorizontalAlignment.Left, 11, 0);
        }
        protected override void OnCreation()
        {
            base.Parent.MinimumSize = new Size(120, 80);
        }
        protected override void OnResize(System.EventArgs e)
        {
            this.graphicsPath_0.Reset();
            this.graphicsPath_0.AddLine(3, 0, 31, 0);
            this.graphicsPath_0.AddLine(55, 24, 0, 24);
            this.graphicsPath_0.AddLine(0, 24, 0, 3);
            this.graphicsPath_0.CloseFigure();
            this.graphicsPath_0.AddLine(base.Width - 68, 0, base.Width - 4, 0);
            this.graphicsPath_0.AddLine(base.Width - 1, 3, base.Width - 1, 24);
            this.graphicsPath_0.AddLine(base.Width - 1, 24, base.Width - 92, 24);
            this.graphicsPath_0.CloseFigure();
            this.graphicsPath_1 = (GraphicsPath)this.graphicsPath_0.Clone();
            this.graphicsPath_1.Widen(Pens.Black);
            base.OnResize(e);
        }
    }
}
