
using System;
using System.Drawing;
using System.Windows.Forms;
namespace Cryptex1
{
    internal class Control12 : Control11
    {
        public Control12()
        {
            base.method_0();
        }
        public override void PaintHook()
        {
            this.graphics_0.Clear(Color.FromArgb(14, 14, 14));
            if (this.enum1_0 == Control11.Enum1.const_2)
            {
                base.method_8(Color.FromArgb(14, 14, 14), Color.FromArgb(41, 41, 41), 0, 0, base.Width, base.Height, 90f);
            }
            if (this.enum1_0 == Control11.Enum1.const_1)
            {
                this.graphics_0.FillRectangle(new SolidBrush(Color.FromArgb(5, Color.White)), base.ClientRectangle);
            }
            base.method_8(Color.FromArgb(30, Color.White), Color.FromArgb(5, Color.White), 0, 0, base.Width, base.Height / 2, 90f);
            this.graphics_0.DrawLine(new Pen(Color.FromArgb(62, 62, 62)), 0, 1, base.Width, 1);
            base.method_3(Pens.Black, new Pen(Color.FromArgb(15, Color.White)), base.ClientRectangle);
            base.method_2(Color.Black, new Rectangle(1, 1, base.Width - 2, base.Height - 2));
            base.method_2(this.BackColor, base.ClientRectangle);
            base.method_4(HorizontalAlignment.Center, Color.White, 0);
        }
    }
}
