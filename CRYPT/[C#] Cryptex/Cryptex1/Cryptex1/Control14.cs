
using System;
using System.ComponentModel;
using System.Drawing;
using System.Threading;
using System.Windows.Forms;
namespace Cryptex1
{
    [DefaultEvent("CharacterSelection")]
    internal class Control14 : Control13
    {
        public delegate void Delegate1(object s, char c);
        private Graphics graphics_1;
        private Size size_1;
        private Control14.Delegate1 delegate1_0;
        private string string_0 = "ƀƁƂƄƅƆƈƉƋƍƎƏƐƑƒƓƔƕƖƗƘƙƜƛơƣƥƪƩƱƲƳƴǍǎǢǣǤǥǭȄȜȞȣȮփռպֆԄӸӂҿҧ";
        private int int_0 = 2;
        private Brush brush_0 = SystemBrushes.ControlText;
        private int int_1;
        private int int_2;
        private int int_3;
        public char[] char_0;
        private System.Random random_0;
        public event Control14.Delegate1 Event_0
        {
            add
            {
                Control14.Delegate1 @delegate = this.delegate1_0;
                Control14.Delegate1 delegate2;
                do
                {
                    delegate2 = @delegate;
                    Control14.Delegate1 value2 = (Control14.Delegate1)System.Delegate.Combine(delegate2, value);
                    @delegate = System.Threading.Interlocked.CompareExchange<Control14.Delegate1>(ref this.delegate1_0, value2, delegate2);
                }
                while (@delegate != delegate2);
            }
            remove
            {
                Control14.Delegate1 @delegate = this.delegate1_0;
                Control14.Delegate1 delegate2;
                do
                {
                    delegate2 = @delegate;
                    Control14.Delegate1 value2 = (Control14.Delegate1)System.Delegate.Remove(delegate2, value);
                    @delegate = System.Threading.Interlocked.CompareExchange<Control14.Delegate1>(ref this.delegate1_0, value2, delegate2);
                }
                while (@delegate != delegate2);
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
                this.string_0 = value;
                this.method_9();
            }
        }
        public int Int32_2
        {
            get
            {
                return this.int_0;
            }
            set
            {
                this.int_0 = value;
                this.method_9();
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
                this.method_9();
            }
        }
        public override Color ForeColor
        {
            get
            {
                return base.ForeColor;
            }
            set
            {
                base.ForeColor = value;
                this.brush_0 = new SolidBrush(this.ForeColor);
                base.Invalidate();
            }
        }
        public Control14()
        {
            this.graphics_1 = Graphics.FromHwndInternal(base.Handle);
        }
        private void method_9()
        {
            this.size_1 = new Size(0, 0);
            Size size = default(Size);
            for (int i = 0; i <= this.string_0.Length - 1; i++)
            {
                size = this.graphics_1.MeasureString(this.string_0[i].ToString(), this.Font).ToSize();
                size.Width += this.int_0;
                size.Height += this.int_0;
                if (size.Height > this.size_1.Height)
                {
                    this.size_1.Height = size.Height;
                }
                if (size.Width > this.size_1.Width)
                {
                    this.size_1.Width = size.Width;
                }
            }
            this.method_11();
        }
        protected override void OnMouseMove(MouseEventArgs e)
        {
            this.int_2 = this.method_10(e.X, e.Y);
            if (this.int_2 == this.int_3)
            {
                return;
            }
            if (this.delegate1_0 != null)
            {
                this.delegate1_0(this, this.char_0[this.int_2]);
            }
            this.method_13(this.int_2 - this.int_1);
            this.method_13(this.int_2 - 1);
            this.method_13(this.int_2);
            this.method_13(this.int_2 + 1);
            this.method_13(this.int_2 + this.int_1);
            this.int_3 = this.int_2;
            base.Invalidate();
        }
        protected override void OnSizeChanged(System.EventArgs e)
        {
            if (this.size_1.Width == 0)
            {
                this.method_9();
            }
            else
            {
                this.method_11();
            }
            base.OnSizeChanged(e);
        }
        public override void PaintHook()
        {
            this.graphics_0.Clear(this.BackColor);
            for (int i = 0; i <= base.Width - 1; i += this.size_1.Width)
            {
                for (int j = 0; j <= base.Height - 1; j += this.size_1.Height)
                {
                    this.method_10(i, j);
                    this.graphics_0.DrawString(this.char_0[this.method_10(i, j)].ToString(), this.Font, this.brush_0, (float)i, (float)j);
                }
            }
        }
        private int method_10(int int_4, int int_5)
        {
            return int_5 / this.size_1.Height * this.int_1 + int_4 / this.size_1.Width;
        }
        private void method_11()
        {
            this.int_1 = System.Convert.ToInt32(System.Math.Ceiling((double)(base.Width / this.size_1.Width)));
            this.random_0 = new System.Random(System.Guid.NewGuid().GetHashCode());
            this.char_0 = new char[System.Convert.ToInt32(System.Math.Ceiling((double)(base.Width / this.size_1.Width)) * System.Math.Ceiling((double)(base.Height / this.size_1.Height)))];
            this.char_0 = new char[20000];
            for (int i = 0; i <= this.char_0.Length - 1; i++)
            {
                this.char_0[i] = this.string_0[this.random_0.Next(this.string_0.Length)];
            }
            base.Invalidate();
        }
        private string method_12(int int_4)
        {
            string text = "ƀƁƂƄƅƆƈƉƋƍƎƏƐƑƒƓƔƕƖƗƘƙƜƛơƣƥƪƩƱƲƳƴǍǎǢǣǤǥǭȄȜȞȣȮփռպֆԄӸӂҿҧ";
            string text2 = "ƀ";
            for (int i = 0; i < int_4; i++)
            {
                text2 += text[this.random_0.Next(0, text.Length)];
            }
            return text2;
        }
        private void method_13(int int_4)
        {
            if (int_4 > -1 && int_4 < this.char_0.Length)
            {
                this.char_0[int_4] = this.string_0[this.random_0.Next(this.string_0.Length)];
            }
        }
    }
}
