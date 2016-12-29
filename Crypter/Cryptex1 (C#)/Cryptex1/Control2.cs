
using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
namespace Cryptex1
{
    [DefaultEvent("TextChanged")]
    internal class Control2 : Control0
    {
        private HorizontalAlignment horizontalAlignment_0;
        private int int_2 = 32767;
        private bool bool_2;
        private bool bool_3;
        private bool bool_4;
        private TextBox textBox_0;
        private Color color_1;
        private Pen pen_0;
        private Pen pen_1;
        public HorizontalAlignment HorizontalAlignment_0
        {
            get
            {
                return this.horizontalAlignment_0;
            }
            set
            {
                this.horizontalAlignment_0 = value;
                if (this.textBox_0 != null)
                {
                    this.textBox_0.TextAlign = value;
                }
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
                this.int_2 = value;
                if (this.textBox_0 != null)
                {
                    this.textBox_0.MaxLength = value;
                }
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
                if (this.textBox_0 != null)
                {
                    this.textBox_0.ReadOnly = value;
                }
            }
        }
        public bool Boolean_3
        {
            get
            {
                return this.bool_3;
            }
            set
            {
                this.bool_3 = value;
                if (this.textBox_0 != null)
                {
                    this.textBox_0.UseSystemPasswordChar = value;
                }
            }
        }
        public bool Boolean_4
        {
            get
            {
                return this.bool_4;
            }
            set
            {
                this.bool_4 = value;
                if (this.textBox_0 != null)
                {
                    this.textBox_0.Multiline = value;
                    if (value)
                    {
                        base.Int32_1 = 0;
                        this.textBox_0.Height = base.Height - 11;
                        return;
                    }
                    base.Int32_1 = this.textBox_0.Height + 11;
                }
            }
        }
        public override string Text
        {
            get
            {
                return base.Text;
            }
            set
            {
                base.Text = value;
                if (this.textBox_0 != null)
                {
                    this.textBox_0.Text = value;
                }
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
                if (this.textBox_0 != null)
                {
                    this.textBox_0.Font = value;
                    this.textBox_0.Location = new Point(3, 5);
                    this.textBox_0.Width = base.Width - 6;
                    if (!this.bool_4)
                    {
                        base.Int32_1 = this.textBox_0.Height + 11;
                    }
                }
            }
        }
        protected override void OnCreation()
        {
            if (!base.Controls.Contains(this.textBox_0))
            {
                base.Controls.Add(this.textBox_0);
            }
        }
        public Control2()
        {
            this.textBox_0 = new TextBox();
            this.textBox_0.Font = this.Font;
            this.textBox_0.Text = this.Text;
            this.textBox_0.MaxLength = this.int_2;
            this.textBox_0.Multiline = this.bool_4;
            this.textBox_0.ReadOnly = this.bool_2;
            this.textBox_0.UseSystemPasswordChar = this.bool_3;
            this.textBox_0.BorderStyle = BorderStyle.None;
            this.textBox_0.Location = new Point(5, 5);
            this.textBox_0.Width = base.Width - 10;
            if (this.bool_4)
            {
                this.textBox_0.Height = base.Height - 11;
            }
            else
            {
                base.Int32_1 = this.textBox_0.Height + 11;
            }
            this.textBox_0.TextChanged += new System.EventHandler(this.textBox_0_TextChanged);
            this.textBox_0.KeyDown += new KeyEventHandler(this.textBox_0_KeyDown);
            base.method_5("Text", Color.White);
            base.method_6("Back", 14, 14, 14);
            base.method_5("Border1", Color.Black);
            base.method_6("Border2", 30, 30, 30);
        }
        protected override void ColorHook()
        {
            this.color_1 = base.method_4("Back");
            this.pen_0 = base.method_2("Border1");
            this.pen_1 = base.method_2("Border2");
            this.textBox_0.ForeColor = base.method_4("Text");
            this.textBox_0.BackColor = this.color_1;
        }
        protected override void PaintHook()
        {
            this.graphics_0.Clear(this.color_1);
            base.method_23(this.pen_0, 1);
            base.method_26(this.pen_1);
        }
        private void textBox_0_TextChanged(object sender, System.EventArgs e)
        {
            this.Text = this.textBox_0.Text;
        }
        private void textBox_0_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Control && e.KeyCode == Keys.A)
            {
                this.textBox_0.SelectAll();
                e.SuppressKeyPress = true;
            }
        }
        protected override void OnResize(System.EventArgs e)
        {
            this.textBox_0.Location = new Point(5, 5);
            this.textBox_0.Width = base.Width - 10;
            if (this.bool_4)
            {
                this.textBox_0.Height = base.Height - 11;
            }
            base.OnResize(e);
        }
    }
}
