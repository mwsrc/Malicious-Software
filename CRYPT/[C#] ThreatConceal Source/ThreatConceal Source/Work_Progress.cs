using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    [DesignerGenerated]
    public class Work_Progress : Form
    {

        [AccessedThroughProperty("Current_Operation")]
        private Label _Current_Operation;
        [AccessedThroughProperty("ProgressBar1")]
        private ProgressBar _ProgressBar1;
        [AccessedThroughProperty("RButton1")]
        private RButton _RButton1;
        [AccessedThroughProperty("RTheme1")]
        private RTheme _RTheme1;
        [AccessedThroughProperty("TextBox15")]
        private TextBox _TextBox15;
        private IContainer components;

        private static List<WeakReference> __ENCList;

        internal virtual Label Current_Operation
        {
            get
            {
                return _Current_Operation;
            }
            set
            {
                _Current_Operation = value;
            }
        }

        internal virtual ProgressBar ProgressBar1
        {
            get
            {
                return _ProgressBar1;
            }
            set
            {
                _ProgressBar1 = value;
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

        internal virtual TextBox TextBox15
        {
            get
            {
                return _TextBox15;
            }
            set
            {
                _TextBox15 = value;
            }
        }

        [DebuggerNonUserCode]
        static Work_Progress()
        {
            Work_Progress.__ENCList = new List<WeakReference>();
        }

        [DebuggerNonUserCode]
        public Work_Progress()
        {
            Shown += new EventHandler(_Lambda$__6);
            Work_Progress.__ENCAddToList(this);
            InitializeComponent();
        }

        [CompilerGenerated]
        [DebuggerStepThrough]
        private void _Lambda$__6(object a0, EventArgs a1)
        {
            // trial
        }

        public void dsa()
        {
            // trial
        }

        [DebuggerStepThrough]
        private void InitializeComponent()
        {
            Color color;
            Point point1;
            Size size1;
            SizeF sizeF1;

            ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(Work_Progress));
            RTheme1 = new RTheme();
            Current_Operation = new Label();
            TextBox15 = new TextBox();
            ProgressBar1 = new ProgressBar();
            RButton1 = new RButton();
            RTheme1.SuspendLayout();
            SuspendLayout();
            RTheme1.BackColor = Color.FromArgb(28, 28, 28);
            RTheme1.Controls.Add(RButton1);
            RTheme1.Controls.Add(Current_Operation);
            RTheme1.Controls.Add(TextBox15);
            RTheme1.Controls.Add(ProgressBar1);
            RTheme1.Dock = DockStyle.Fill;
            RTheme1.ForeColor = Color.White;
            RTheme1.Image = null;
            Point point2 = new Point(0, 0);
            RTheme1.Location = point2;
            RTheme1.MoveHeight = 26;
            RTheme1.Name = "RTheme1";
            RTheme1.Resizable = false;
            Size size2 = new Size(392, 454);
            RTheme1.Size = size2;
            RTheme1.TabIndex = 0;
            RTheme1.Text = "                                                  Work Progress";
            RTheme1.TransparencyKey = Color.Fuchsia;
            point2 = new Point(12, 33);
            Current_Operation.Location = point2;
            Current_Operation.Name = "Current_Operation";
            size2 = new Size(368, 19);
            Current_Operation.Size = size2;
            Current_Operation.TabIndex = 247;
            Current_Operation.TextAlign = ContentAlignment.MiddleCenter;
            TextBox15.BackColor = SystemColors.MenuText;
            TextBox15.BorderStyle = BorderStyle.FixedSingle;
            TextBox15.Font = new Font("Comic Sans MS", 8.0F);
            TextBox15.ForeColor = Color.FromArgb(100, 100, 100);
            point2 = new Point(12, 55);
            TextBox15.Location = point2;
            TextBox15.Multiline = true;
            TextBox15.Name = "TextBox15";
            size2 = new Size(368, 324);
            TextBox15.Size = size2;
            TextBox15.TabIndex = 246;
            TextBox15.TextAlign = HorizontalAlignment.Center;
            point2 = new Point(12, 385);
            ProgressBar1.Location = point2;
            ProgressBar1.Name = "ProgressBar1";
            size2 = new Size(368, 19);
            ProgressBar1.Size = size2;
            ProgressBar1.Style = ProgressBarStyle.Marquee;
            ProgressBar1.TabIndex = 245;
            RButton1.Image = null;
            point2 = new Point(12, 410);
            RButton1.Location = point2;
            RButton1.Name = "RButton1";
            RButton1.NoRounding = false;
            size2 = new Size(368, 32);
            RButton1.Size = size2;
            RButton1.TabIndex = 1;
            RButton1.Text = "Continue";
            SizeF sizeF2 = new SizeF(6.0F, 13.0F);
            AutoScaleDimensions = sizeF2;
            AutoScaleMode = AutoScaleMode.Font;
            size2 = new Size(392, 454);
            ClientSize = size2;
            Controls.Add(RTheme1);
            FormBorderStyle = FormBorderStyle.None;
            Icon = (Icon)componentResourceManager.GetObject("$this.Icon");
            Name = "Work_Progress";
            Opacity = 0.0;
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Work_Progress";
            TopMost = true;
            TransparencyKey = Color.Fuchsia;
            RTheme1.ResumeLayout(false);
            RTheme1.PerformLayout();
            ResumeLayout(false);
        }

        private void RButton1_Click(object sender, EventArgs e)
        {
            Close();
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

            List<WeakReference> list = Work_Progress.__ENCList;
            lock (list)
            {
                bool flag1 = Work_Progress.__ENCList.get_Count() == Work_Progress.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(Work_Progress.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = Work_Progress.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                Work_Progress.__ENCList.set_Item(i1, Work_Progress.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    Work_Progress.__ENCList.RemoveRange(i1, checked(Work_Progress.__ENCList.get_Count() - i1));
                    Work_Progress.__ENCList.set_Capacity(Work_Progress.__ENCList.get_Count());
                }
                Work_Progress.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class Work_Progress

}

