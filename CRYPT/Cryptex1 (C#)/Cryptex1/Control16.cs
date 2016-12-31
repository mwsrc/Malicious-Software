
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;
namespace Cryptex1
{
    internal class Control16 : Control15
    {
        public class Class1
        {
            public string Name
            {
                get;
                set;
            }
            public Color Value
            {
                get;
                set;
            }
            public Class1()
            {
            }
            public Class1(string name, Color value)
            {
                this.Name = name;
                this.Value = value;
            }
        }
        private ColorBlend colorBlend_0;
        private Color color_1;
        private Color color_2;
        private Color color_3;
        private Color color_4;
        private Color color_5;
        private Pen pen_0;
        private Pen pen_1;
        private Pen pen_2;
        private Pen pen_3;
        private SolidBrush solidBrush_1;
        private SolidBrush solidBrush_2;
        private Rectangle rectangle_2;
        private LinearGradientBrush linearGradientBrush_1;
        private GraphicsPath graphicsPath_0;
        private GraphicsPath graphicsPath_1;
        private Point point_1;
        private Point point_2;
        private Point point_3;
        private System.Collections.Generic.Dictionary<string, Color> dictionary_0 = new System.Collections.Generic.Dictionary<string, Color>();
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        public Control16.Class1[] Class1_0
        {
            get
            {
                System.Collections.Generic.List<Control16.Class1> list = new System.Collections.Generic.List<Control16.Class1>();
                System.Collections.Generic.Dictionary<string, Color>.Enumerator enumerator = this.dictionary_0.GetEnumerator();
                while (enumerator.MoveNext())
                {
                    System.Collections.Generic.List<Control16.Class1> arg_38_0 = list;
                    System.Collections.Generic.KeyValuePair<string, Color> current = enumerator.Current;
                    string arg_33_0 = current.Key;
                    System.Collections.Generic.KeyValuePair<string, Color> current2 = enumerator.Current;
                    arg_38_0.Add(new Control16.Class1(arg_33_0, current2.Value));
                }
                return list.ToArray();
            }
            set
            {
                for (int i = 0; i < value.Length; i++)
                {
                    Control16.Class1 @class = value[i];
                    if (this.dictionary_0.ContainsKey(@class.Name))
                    {
                        this.dictionary_0[@class.Name] = @class.Value;
                    }
                }
                this.method_9();
                base.Invalidate();
            }
        }
        public Control16()
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
            this.BackColor = Color.FromArgb(14, 14, 14);
            this.method_11("BackColor", 14, 14, 14);
            this.method_11("CornerGradient1", 48, 48, 48);
            this.method_11("CornerGradient2", 4, 4, 4);
            this.method_10("TextShadow", Color.Black);
            this.method_10("TextColor", Color.White);
            this.method_11("BorderColor", 45, 45, 45);
            this.method_10("Outline", Color.Black);
            this.method_13("CornerHighlight", 15, Color.White);
            this.method_11("TitleShine", 100, 100, 100);
            this.method_13("TitleGloss", 42, Color.White);
            this.method_13("CornerGloss", 15, Color.White);
            this.method_11("TitleGradient1", 14, 14, 14);
            this.method_11("TitleGradient2", 41, 41, 41);
            this.method_9();
        }
        public void method_9()
        {
            this.colorBlend_0.Colors = new Color[]
           {
               this.dictionary_0["TitleGradient1"], 
               this.dictionary_0["TitleGradient2"], 
               this.dictionary_0["TitleGradient2"], 
               this.dictionary_0["TitleGradient1"]
           };
            this.color_1 = this.dictionary_0["BackColor"];
            this.color_2 = this.dictionary_0["CornerGradient1"];
            this.color_3 = this.dictionary_0["CornerGradient2"];
            this.color_4 = this.dictionary_0["TextShadow"];
            this.color_5 = this.dictionary_0["TextColor"];
            this.pen_0 = new Pen(this.dictionary_0["BorderColor"], 4f);
            this.pen_0.Alignment = PenAlignment.Inset;
            this.pen_1 = new Pen(this.dictionary_0["Outline"]);
            this.pen_2 = new Pen(this.dictionary_0["CornerHighlight"], 2f);
            this.pen_3 = new Pen(this.dictionary_0["TitleShine"]);
            this.solidBrush_1 = new SolidBrush(this.dictionary_0["TitleGloss"]);
            this.solidBrush_2 = new SolidBrush(this.dictionary_0["CornerGloss"]);
        }
        public void method_10(string string_0, Color color_6)
        {
            if (this.dictionary_0.ContainsKey(string_0))
            {
                this.dictionary_0[string_0] = color_6;
                return;
            }
            this.dictionary_0.Add(string_0, color_6);
        }
        public void method_11(string string_0, byte byte_0, byte byte_1, byte byte_2)
        {
            this.method_10(string_0, Color.FromArgb((int)byte_0, (int)byte_1, (int)byte_2));
        }
        public void method_12(string string_0, byte byte_0, byte byte_1, byte byte_2, byte byte_3)
        {
            this.method_10(string_0, Color.FromArgb((int)byte_0, (int)byte_1, (int)byte_2, (int)byte_3));
        }
        public void method_13(string string_0, byte byte_0, Color color_6)
        {
            this.method_10(string_0, Color.FromArgb((int)byte_0, color_6));
        }
        public override void PaintHook()
        {
            this.graphics_0.Clear(this.color_1);
            this.graphics_0.FillRectangle(new SolidBrush(base.Color_0), 0, 0, base.Width, 3);
            this.graphics_0.DrawRectangle(this.pen_0, 0, 20, base.Width, base.Height - 20);
            this.graphics_0.DrawRectangle(this.pen_1, 0, 24, base.Width - 1, base.Height - 25);
            this.graphics_0.DrawRectangle(this.pen_1, 4, 23, base.Width - 9, base.Height - 28);
            this.rectangle_2 = new Rectangle(30, 2, base.Width - 67, 22);
            this.linearGradientBrush_1 = new LinearGradientBrush(this.rectangle_2, Color.Empty, Color.Empty, 0f);
            this.linearGradientBrush_1.InterpolationColors = this.colorBlend_0;
            this.graphics_0.FillRectangle(this.linearGradientBrush_1, this.rectangle_2);
            this.graphics_0.FillRectangle(this.solidBrush_1, 30, 2, base.Width - 67, 11);
            this.graphics_0.DrawLine(this.pen_3, 30, 3, base.Width - 67, 3);
            this.graphics_0.DrawLine(this.pen_1, 30, 2, base.Width - 67, 2);
            this.graphics_0.SetClip(this.graphicsPath_0);
            this.rectangle_2 = new Rectangle(0, 0, base.Width, 24);
            this.linearGradientBrush_1 = new LinearGradientBrush(this.rectangle_2, this.color_2, this.color_3, 90f);
            this.graphics_0.FillRectangle(this.linearGradientBrush_1, this.rectangle_2);
            this.graphics_0.FillRectangle(this.solidBrush_2, 0, 0, base.Width, 11);
            this.graphics_0.DrawPath(this.pen_2, this.graphicsPath_1);
            this.graphics_0.ResetClip();
            this.graphics_0.DrawPath(this.pen_1, this.graphicsPath_0);
            base.method_5(HorizontalAlignment.Center, this.color_4, -21, 3);
            base.method_5(HorizontalAlignment.Center, this.color_5, -20, 2);
            base.method_6(HorizontalAlignment.Left, 11);
        }
        public void method_14(int int_1, int int_2)
        {
            this.point_1 = Point.Empty;
            this.point_2 = Point.Empty;
            this.point_3 = Point.Empty;
            this.point_1 = new Point(int_1, int_2);
        }
        public void method_15(int int_1, int int_2)
        {
            if (this.point_2 == Point.Empty)
            {
                this.point_2 = new Point(int_1, int_2);
                this.graphicsPath_0.AddLine(this.point_1, this.point_2);
                return;
            }
            this.point_3 = new Point(int_1, int_2);
            this.graphicsPath_0.AddLine(this.point_2, this.point_3);
            this.point_2 = this.point_3;
        }
        protected override void OnHandleCreated(System.EventArgs e)
        {
            base.OnHandleCreated(e);
        }
        protected override void OnSizeChanged(System.EventArgs e)
        {
            this.graphicsPath_0.Reset();
            this.method_14(3, 0);
            this.method_15(31, 0);
            this.method_15(55, 24);
            this.method_15(0, 24);
            this.method_15(0, 3);
            this.graphicsPath_0.CloseFigure();
            this.method_14(base.Width - 68, 0);
            this.method_15(base.Width - 4, 0);
            this.method_15(base.Width - 1, 3);
            this.method_15(base.Width - 1, 24);
            this.method_15(base.Width - 92, 24);
            this.graphicsPath_0.CloseFigure();
            this.graphicsPath_1 = (GraphicsPath)this.graphicsPath_0.Clone();
            this.graphicsPath_1.Widen(Pens.Black);
            base.OnSizeChanged(e);
        }
    }
}
