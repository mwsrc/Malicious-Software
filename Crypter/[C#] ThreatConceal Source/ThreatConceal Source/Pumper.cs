using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Windows.Forms;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    [DesignerGenerated]
    public class Pumper : Form
    {

        [AccessedThroughProperty("NumericUpDown9")]
        private NumericUpDown _NumericUpDown9;
        [AccessedThroughProperty("RadioButton1")]
        private RadioButton _RadioButton1;
        [AccessedThroughProperty("RadioButton2")]
        private RadioButton _RadioButton2;
        [AccessedThroughProperty("RButton1")]
        private RButton _RButton1;
        [AccessedThroughProperty("RButton2")]
        private RButton _RButton2;
        [AccessedThroughProperty("RButtonRed1")]
        private RButtonRed _RButtonRed1;
        [AccessedThroughProperty("RTheme1")]
        private RTheme _RTheme1;
        [AccessedThroughProperty("TextBox8")]
        private TextBox _TextBox8;
        private IContainer components;
        private AsyncOperation O;
        private OpenFileDialog opfPump;

        private static List<WeakReference> __ENCList;

        internal virtual NumericUpDown NumericUpDown9
        {
            get
            {
                return _NumericUpDown9;
            }
            set
            {
                _NumericUpDown9 = value;
            }
        }

        internal virtual RadioButton RadioButton1
        {
            get
            {
                return _RadioButton1;
            }
            set
            {
                _RadioButton1 = value;
            }
        }

        internal virtual RadioButton RadioButton2
        {
            get
            {
                return _RadioButton2;
            }
            set
            {
                _RadioButton2 = value;
            }
        }

        internal virtual RButton RButton1
        {
            get
            {
                return _RButton1;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButton1_Click);
                bool flag = _RButton1 != null;
                if (flag)
                    _RButton1.Click -= eventHandler;
                _RButton1 = value;
                flag = _RButton1 != null;
                if (flag)
                    _RButton1.Click += eventHandler;
            }
        }

        internal virtual RButton RButton2
        {
            get
            {
                return _RButton2;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButton2_Click);
                bool flag = _RButton2 != null;
                if (flag)
                    _RButton2.Click -= eventHandler;
                _RButton2 = value;
                flag = _RButton2 != null;
                if (flag)
                    _RButton2.Click += eventHandler;
            }
        }

        internal virtual RButtonRed RButtonRed1
        {
            get
            {
                return _RButtonRed1;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButtonRed1_Click);
                bool flag = _RButtonRed1 != null;
                if (flag)
                    _RButtonRed1.Click -= eventHandler;
                _RButtonRed1 = value;
                flag = _RButtonRed1 != null;
                if (flag)
                    _RButtonRed1.Click += eventHandler;
            }
        }

        internal virtual RTheme RTheme1
        {
            get
            {
                return _RTheme1;
            }
            set
            {
                _RTheme1 = value;
            }
        }

        internal virtual TextBox TextBox8
        {
            get
            {
                return _TextBox8;
            }
            set
            {
                _TextBox8 = value;
            }
        }

        [DebuggerNonUserCode]
        static Pumper()
        {
            Pumper.__ENCList = new List<WeakReference>();
        }

        public Pumper()
        {
            Load += new EventHandler(Loading);
            Shown += new EventHandler(Cyber_shown);
            Pumper.__ENCAddToList(this);
            opfPump = new OpenFileDialog();
            O = AsyncOperationManager.CreateOperation(null);
            InitializeComponent();
        }

        private void Cyber_shown(object sender, EventArgs e)
        {
            // trial
        }

        public void Fade(bool out)
        {
            float[] fArr;

            Thread thread = new Thread(new ParameterizedThreadStart(Fade));
            bool flag = out;
            if (flag)
            {
                fArr = new float[] { 1.0F, 0.0F, 0.1F, 50.0F };
                thread.Start(fArr);
            }
            else
            {
                fArr = new float[] { 0.0F, 1.1F, 0.1F, 100.0F };
                thread.Start(fArr);
            }
        }

        public void Fade(object state)
        {
            // trial
        }

        [DebuggerStepThrough]
        private void InitializeComponent()
        {
            Color color;
            Padding padding1;
            Point point1;
            Size size1;
            SizeF sizeF1;

            ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(Pumper));
            RTheme1 = new RTheme();
            RButtonRed1 = new RButtonRed();
            RButton2 = new RButton();
            TextBox8 = new TextBox();
            RButton1 = new RButton();
            RadioButton2 = new RadioButton();
            NumericUpDown9 = new NumericUpDown();
            RadioButton1 = new RadioButton();
            RTheme1.SuspendLayout();
            NumericUpDown9.BeginInit();
            SuspendLayout();
            RTheme1.BackColor = Color.FromArgb(28, 28, 28);
            RTheme1.Controls.Add(RButtonRed1);
            RTheme1.Controls.Add(RButton2);
            RTheme1.Controls.Add(TextBox8);
            RTheme1.Controls.Add(RButton1);
            RTheme1.Controls.Add(RadioButton2);
            RTheme1.Controls.Add(NumericUpDown9);
            RTheme1.Controls.Add(RadioButton1);
            RTheme1.Dock = DockStyle.Fill;
            RTheme1.ForeColor = Color.White;
            RTheme1.Image = null;
            Point point2 = new Point(0, 0);
            RTheme1.Location = point2;
            RTheme1.MoveHeight = 26;
            RTheme1.Name = "RTheme1";
            RTheme1.Resizable = false;
            Size size2 = new Size(159, 141);
            RTheme1.Size = size2;
            RTheme1.TabIndex = 0;
            RTheme1.Text = "Pumper";
            RTheme1.TransparencyKey = Color.Fuchsia;
            RButtonRed1.Image = null;
            point2 = new Point(131, 3);
            RButtonRed1.Location = point2;
            RButtonRed1.Name = "RButtonRed1";
            RButtonRed1.NoRounding = false;
            size2 = new Size(23, 21);
            RButtonRed1.Size = size2;
            RButtonRed1.TabIndex = 160;
            RButton2.Image = null;
            point2 = new Point(12, 91);
            RButton2.Location = point2;
            RButton2.Name = "RButton2";
            RButton2.NoRounding = false;
            size2 = new Size(135, 39);
            RButton2.Size = size2;
            RButton2.TabIndex = 159;
            RButton2.Text = "Pump'Z";
            TextBox8.BackColor = SystemColors.MenuText;
            TextBox8.BorderStyle = BorderStyle.FixedSingle;
            TextBox8.Font = new Font("Calibri", 8.75F, FontStyle.Bold);
            TextBox8.ForeColor = Color.Tomato;
            point2 = new Point(13, 39);
            TextBox8.Location = point2;
            Padding padding2 = new Padding(4, 3, 4, 3);
            TextBox8.Margin = padding2;
            TextBox8.Multiline = true;
            TextBox8.Name = "TextBox8";
            TextBox8.ReadOnly = true;
            size2 = new Size(68, 19);
            TextBox8.Size = size2;
            TextBox8.TabIndex = 158;
            TextBox8.Text = "Select File";
            RButton1.Image = null;
            point2 = new Point(88, 38);
            RButton1.Location = point2;
            RButton1.Name = "RButton1";
            RButton1.NoRounding = false;
            size2 = new Size(59, 21);
            RButton1.Size = size2;
            RButton1.TabIndex = 0;
            RButton1.Text = "*.exe";
            RadioButton2.AutoSize = true;
            RadioButton2.ForeColor = Color.FromArgb(100, 100, 100);
            point2 = new Point(58, 65);
            RadioButton2.Location = point2;
            RadioButton2.Name = "RadioButton2";
            size2 = new Size(41, 17);
            RadioButton2.Size = size2;
            RadioButton2.TabIndex = 24;
            RadioButton2.Text = "MB";
            RadioButton2.UseVisualStyleBackColor = true;
            NumericUpDown9.BackColor = Color.Black;
            NumericUpDown9.BorderStyle = BorderStyle.FixedSingle;
            NumericUpDown9.ForeColor = Color.Transparent;
            point2 = new Point(104, 65);
            NumericUpDown9.Location = point2;
            int[] iArr = new int[] { 1, 0, 0, 0 };
            decimal dec = new Decimal(iArr);
            NumericUpDown9.Minimum = dec;
            NumericUpDown9.Name = "NumericUpDown9";
            size2 = new Size(42, 20);
            NumericUpDown9.Size = size2;
            NumericUpDown9.TabIndex = 22;
            iArr = new int[] { 1, 0, 0, 0 };
            dec = new Decimal(iArr);
            NumericUpDown9.Value = dec;
            RadioButton1.AutoSize = true;
            RadioButton1.CheckAlign = ContentAlignment.TopLeft;
            RadioButton1.Checked = true;
            RadioButton1.ForeColor = Color.FromArgb(100, 100, 100);
            point2 = new Point(13, 65);
            RadioButton1.Location = point2;
            RadioButton1.Name = "RadioButton1";
            size2 = new Size(39, 17);
            RadioButton1.Size = size2;
            RadioButton1.TabIndex = 23;
            RadioButton1.TabStop = true;
            RadioButton1.Text = "KB";
            RadioButton1.UseVisualStyleBackColor = true;
            SizeF sizeF2 = new SizeF(6.0F, 13.0F);
            AutoScaleDimensions = sizeF2;
            AutoScaleMode = AutoScaleMode.Font;
            size2 = new Size(159, 141);
            ClientSize = size2;
            Controls.Add(RTheme1);
            FormBorderStyle = FormBorderStyle.None;
            Icon = (Icon)componentResourceManager.GetObject("$this.Icon");
            Name = "Pumper";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Pumper";
            TopMost = true;
            TransparencyKey = Color.Fuchsia;
            RTheme1.ResumeLayout(false);
            RTheme1.PerformLayout();
            NumericUpDown9.EndInit();
            ResumeLayout(false);
        }

        private void Loading(object sender, EventArgs e)
        {
            Opacity = 0.0;
        }

        private void RButton1_Click(object sender, EventArgs e)
        {
            opfPump.DefaultExt = "Executable Files";
            opfPump.Filter = "Executable Files (*.exe)|*.exe";
            opfPump.FilterIndex = 1;
            opfPump.FileName = "";
            bool flag = opfPump.ShowDialog() == DialogResult.OK;
            if (flag)
                TextBox8.Text = opfPump.FileName;
            else
                goto label_1;
        label_1:;
        }

        private void RButton2_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButtonRed1_Click(object sender, EventArgs e)
        {
            // trial
        }

        public void SetOpacity(object current)
        {
            Opacity = (double)Conversions.ToSingle(current);
        }

        [DebuggerNonUserCode]
        protected override void Dispose(bool disposing)
        {
            // trial
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            int i4;

            List<WeakReference> list = Pumper.__ENCList;
            lock (list)
            {
                bool flag1 = Pumper.__ENCList.get_Count() == Pumper.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(Pumper.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = Pumper.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                Pumper.__ENCList.set_Item(i1, Pumper.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    Pumper.__ENCList.RemoveRange(i1, checked(Pumper.__ENCList.get_Count() - i1));
                    Pumper.__ENCList.set_Capacity(Pumper.__ENCList.get_Count());
                }
                Pumper.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class Pumper

}

