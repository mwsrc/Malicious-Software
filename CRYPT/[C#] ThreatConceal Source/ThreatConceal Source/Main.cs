using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Windows.Forms;
using CybeR_CryptZ.My;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    [DesignerGenerated]
    public class Main : Form
    {

        [AccessedThroughProperty("LicencedTo")]
        private Label _LicencedTo;
        [AccessedThroughProperty("RButton1")]
        private RButton _RButton1;
        [AccessedThroughProperty("RButton2")]
        private RButton _RButton2;
        [AccessedThroughProperty("RButton3")]
        private RButton _RButton3;
        [AccessedThroughProperty("RButton4")]
        private RButton _RButton4;
        [AccessedThroughProperty("RButton5")]
        private RButton _RButton5;
        [AccessedThroughProperty("RButton6")]
        private RButton _RButton6;
        [AccessedThroughProperty("RButton7")]
        private RButton _RButton7;
        [AccessedThroughProperty("RButtonRed1")]
        private RButtonRed _RButtonRed1;
        [AccessedThroughProperty("RTheme1")]
        private RTheme _RTheme1;
        [AccessedThroughProperty("ThreatConceal_News")]
        private Label _ThreatConceal_News;
        [AccessedThroughProperty("VersionInfo_Pane")]
        private ButtonPane _VersionInfo_Pane;
        private IContainer components;
        private AsyncOperation O;

        private static List<WeakReference> __ENCList;
        public static string current_version;

        internal virtual Label LicencedTo
        {
            get
            {
                return _LicencedTo;
            }
            set
            {
                _LicencedTo = value;
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

        internal virtual RButton RButton3
        {
            get
            {
                return _RButton3;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButton3_Click);
                bool flag = _RButton3 != null;
                if (flag)
                    _RButton3.Click -= eventHandler;
                _RButton3 = value;
                flag = _RButton3 != null;
                if (flag)
                    _RButton3.Click += eventHandler;
            }
        }

        internal virtual RButton RButton4
        {
            get
            {
                return _RButton4;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButton4_Click);
                bool flag = _RButton4 != null;
                if (flag)
                    _RButton4.Click -= eventHandler;
                _RButton4 = value;
                flag = _RButton4 != null;
                if (flag)
                    _RButton4.Click += eventHandler;
            }
        }

        internal virtual RButton RButton5
        {
            get
            {
                return _RButton5;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButton5_Click);
                bool flag = _RButton5 != null;
                if (flag)
                    _RButton5.Click -= eventHandler;
                _RButton5 = value;
                flag = _RButton5 != null;
                if (flag)
                    _RButton5.Click += eventHandler;
            }
        }

        internal virtual RButton RButton6
        {
            get
            {
                return _RButton6;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButton6_Click);
                bool flag = _RButton6 != null;
                if (flag)
                    _RButton6.Click -= eventHandler;
                _RButton6 = value;
                flag = _RButton6 != null;
                if (flag)
                    _RButton6.Click += eventHandler;
            }
        }

        internal virtual RButton RButton7
        {
            get
            {
                return _RButton7;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButton7_Click);
                bool flag = _RButton7 != null;
                if (flag)
                    _RButton7.Click -= eventHandler;
                _RButton7 = value;
                flag = _RButton7 != null;
                if (flag)
                    _RButton7.Click += eventHandler;
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

        internal virtual Label ThreatConceal_News
        {
            get
            {
                return _ThreatConceal_News;
            }
            set
            {
                _ThreatConceal_News = value;
            }
        }

        internal virtual ButtonPane VersionInfo_Pane
        {
            get
            {
                return _VersionInfo_Pane;
            }
            set
            {
                _VersionInfo_Pane = value;
            }
        }

        public Main()
        {
            Shown += new EventHandler(Main_Shown);
            Load += new EventHandler(Main_Load);
            Main.__ENCAddToList(this);
            O = AsyncOperationManager.CreateOperation(null);
            InitializeComponent();
        }

        static Main()
        {
            Main.__ENCList = new List<WeakReference>();
            Main.current_version = "1.0.3";
        }

        public void Fade(object state)
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

        [DebuggerStepThrough]
        private void InitializeComponent()
        {
            Color color;
            Point point1;
            Size size1;
            SizeF sizeF1;

            ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(Main));
            RTheme1 = new RTheme();
            LicencedTo = new Label();
            RButton7 = new RButton();
            RButton6 = new RButton();
            RButton2 = new RButton();
            RButton1 = new RButton();
            ThreatConceal_News = new Label();
            RButton5 = new RButton();
            RButtonRed1 = new RButtonRed();
            RButton4 = new RButton();
            RButton3 = new RButton();
            VersionInfo_Pane = new ButtonPane();
            RTheme1.SuspendLayout();
            SuspendLayout();
            RTheme1.BackColor = Color.FromArgb(28, 28, 28);
            RTheme1.Controls.Add(LicencedTo);
            RTheme1.Controls.Add(RButton7);
            RTheme1.Controls.Add(RButton6);
            RTheme1.Controls.Add(RButton2);
            RTheme1.Controls.Add(RButton1);
            RTheme1.Controls.Add(ThreatConceal_News);
            RTheme1.Controls.Add(RButton5);
            RTheme1.Controls.Add(RButtonRed1);
            RTheme1.Controls.Add(RButton4);
            RTheme1.Controls.Add(RButton3);
            RTheme1.Controls.Add(VersionInfo_Pane);
            RTheme1.Dock = DockStyle.Fill;
            RTheme1.ForeColor = Color.White;
            RTheme1.Image = null;
            Point point2 = new Point(0, 0);
            RTheme1.Location = point2;
            RTheme1.MoveHeight = 26;
            RTheme1.Name = "RTheme1";
            RTheme1.Resizable = false;
            Size size2 = new Size(284, 317);
            RTheme1.Size = size2;
            RTheme1.TabIndex = 0;
            RTheme1.Text = "                                ThreatConceal";
            RTheme1.TransparencyKey = Color.Fuchsia;
            point2 = new Point(12, 291);
            LicencedTo.Location = point2;
            LicencedTo.Name = "LicencedTo";
            size2 = new Size(260, 16);
            LicencedTo.Size = size2;
            LicencedTo.TabIndex = 1;
            LicencedTo.TextAlign = ContentAlignment.MiddleCenter;
            RButton7.Image = null;
            point2 = new Point(12, 152);
            RButton7.Location = point2;
            RButton7.Name = "RButton7";
            RButton7.NoRounding = false;
            size2 = new Size(127, 33);
            RButton7.Size = size2;
            RButton7.TabIndex = 9;
            RButton7.Text = "Changelog";
            RButton6.Image = null;
            point2 = new Point(12, 74);
            RButton6.Location = point2;
            RButton6.Name = "RButton6";
            RButton6.NoRounding = false;
            size2 = new Size(127, 33);
            RButton6.Size = size2;
            RButton6.TabIndex = 8;
            RButton6.Text = "Unlimited Binder";
            RButton2.Image = null;
            point2 = new Point(145, 113);
            RButton2.Location = point2;
            RButton2.Name = "RButton2";
            RButton2.NoRounding = false;
            size2 = new Size(127, 33);
            RButton2.Size = size2;
            RButton2.TabIndex = 1;
            RButton2.Text = "File Compare";
            RButton1.Image = null;
            point2 = new Point(12, 35);
            RButton1.Location = point2;
            RButton1.Name = "RButton1";
            RButton1.NoRounding = false;
            size2 = new Size(127, 33);
            RButton1.Size = size2;
            RButton1.TabIndex = 0;
            RButton1.Text = "ThreatConceal";
            ThreatConceal_News.BorderStyle = BorderStyle.FixedSingle;
            point2 = new Point(13, 190);
            ThreatConceal_News.Location = point2;
            ThreatConceal_News.Name = "ThreatConceal_News";
            size2 = new Size(258, 98);
            ThreatConceal_News.Size = size2;
            ThreatConceal_News.TabIndex = 7;
            ThreatConceal_News.Text = "Welcome to ThreatConceal ;)\r\n";
            ThreatConceal_News.TextAlign = ContentAlignment.MiddleCenter;
            RButton5.Image = null;
            point2 = new Point(145, 74);
            RButton5.Location = point2;
            RButton5.Name = "RButton5";
            RButton5.NoRounding = false;
            size2 = new Size(127, 33);
            RButton5.Size = size2;
            RButton5.TabIndex = 6;
            RButton5.Text = "Pumper";
            RButtonRed1.Image = null;
            point2 = new Point(255, 3);
            RButtonRed1.Location = point2;
            RButtonRed1.Name = "RButtonRed1";
            RButtonRed1.NoRounding = false;
            size2 = new Size(23, 21);
            RButtonRed1.Size = size2;
            RButtonRed1.TabIndex = 5;
            RButton4.Image = null;
            point2 = new Point(12, 113);
            RButton4.Location = point2;
            RButton4.Name = "RButton4";
            RButton4.NoRounding = false;
            size2 = new Size(127, 33);
            RButton4.Size = size2;
            RButton4.TabIndex = 3;
            RButton4.Text = "Extension Spoofer";
            RButton3.Image = null;
            point2 = new Point(145, 35);
            RButton3.Location = point2;
            RButton3.Name = "RButton3";
            RButton3.NoRounding = false;
            size2 = new Size(127, 33);
            RButton3.Size = size2;
            RButton3.TabIndex = 2;
            RButton3.Text = "Assembly Changer";
            VersionInfo_Pane.Border1 = Color.Transparent;
            VersionInfo_Pane.Border2 = Color.Transparent;
            VersionInfo_Pane.Color1A = Color.Transparent;
            VersionInfo_Pane.Color1B = Color.Transparent;
            VersionInfo_Pane.Color2A = Color.Black;
            VersionInfo_Pane.Color2B = Color.FromArgb(64, 64, 64);
            VersionInfo_Pane.Font = new Font("Microsoft Sans Serif", 9.0F, FontStyle.Regular, GraphicsUnit.Point, 0);
            VersionInfo_Pane.Font1 = new Font("Microsoft Sans Serif", 7.87F);
            VersionInfo_Pane.Font2 = new Font("Microsoft Sans Serif", 7.0F);
            VersionInfo_Pane.Image = null;
            VersionInfo_Pane.InnerBorder = Color.Transparent;
            point2 = new Point(145, 152);
            VersionInfo_Pane.Location = point2;
            VersionInfo_Pane.Name = "VersionInfo_Pane";
            VersionInfo_Pane.NoGradient = false;
            VersionInfo_Pane.NoRounding = false;
            VersionInfo_Pane.Selection = false;
            VersionInfo_Pane.SelectionToggle = false;
            size2 = new Size(127, 33);
            VersionInfo_Pane.Size = size2;
            VersionInfo_Pane.TabIndex = 4;
            VersionInfo_Pane.Text1 = "Current Version: v1.0.0";
            VersionInfo_Pane.Text2 = "Lastest Version:        v1.0.0";
            VersionInfo_Pane.TextColor1 = Color.DodgerBlue;
            VersionInfo_Pane.TextColor2 = Color.White;
            SizeF sizeF2 = new SizeF(6.0F, 13.0F);
            AutoScaleDimensions = sizeF2;
            AutoScaleMode = AutoScaleMode.Font;
            size2 = new Size(284, 317);
            ClientSize = size2;
            Controls.Add(RTheme1);
            FormBorderStyle = FormBorderStyle.None;
            Icon = (Icon)componentResourceManager.GetObject("$this.Icon");
            Name = "Main";
            Opacity = 0.0;
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Main";
            TopMost = true;
            TransparencyKey = Color.Fuchsia;
            RTheme1.ResumeLayout(false);
            ResumeLayout(false);
        }

        private void Main_Load(object sender, EventArgs e)
        {
            ThreatConceal_News.Text = Licence_Agreement.ThreatConceal_News;
            VersionInfo_Pane.Text1 = Licence_Agreement.VersionInfo_Pane1;
            VersionInfo_Pane.Text2 = Licence_Agreement.VersionInfo_Pane2;
            LicencedTo.Text = Licence_Agreement.LicencedTo;
            Refresh();
            Visible = true;
        }

        private void Main_Shown(object sender, EventArgs e)
        {
            // trial
        }

        private void RButton1_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButton2_Click(object sender, EventArgs e)
        {
            MyProject.Forms.File_Compare.Show();
        }

        private void RButton3_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButton4_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButton5_Click(object sender, EventArgs e)
        {
            MyProject.Forms.Pumper.Show();
        }

        private void RButton6_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButton7_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButtonRed1_Click(object sender, EventArgs e)
        {
            // decompiler error
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

            List<WeakReference> list = Main.__ENCList;
            lock (list)
            {
                bool flag1 = Main.__ENCList.get_Count() == Main.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(Main.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = Main.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                Main.__ENCList.set_Item(i1, Main.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    Main.__ENCList.RemoveRange(i1, checked(Main.__ENCList.get_Count() - i1));
                    Main.__ENCList.set_Capacity(Main.__ENCList.get_Count());
                }
                Main.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class Main

}

