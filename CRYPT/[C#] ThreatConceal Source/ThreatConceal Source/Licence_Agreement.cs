using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows.Forms;
using CybeR_CryptZ.My;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    [DesignerGenerated]
    public class Licence_Agreement : Form
    {

        [AccessedThroughProperty("CypherxLabel1")]
        private CypherxLabel _CypherxLabel1;
        [AccessedThroughProperty("Label1")]
        private Label _Label1;
        [AccessedThroughProperty("RButton1")]
        private RButton _RButton1;
        [AccessedThroughProperty("RButton2")]
        private RButton _RButton2;
        [AccessedThroughProperty("RTheme1")]
        private RTheme _RTheme1;
        [AccessedThroughProperty("Timer1")]
        private Timer _Timer1;
        private IContainer components;
        private string LocalAppDataSF;

        private static List<WeakReference> __ENCList;
        public static string LicencedTo;
        public static string ThreatConceal_News;
        public static string VersionInfo_Pane1;
        public static string VersionInfo_Pane2;

        internal virtual CypherxLabel CypherxLabel1
        {
            get
            {
                return _CypherxLabel1;
            }
            set
            {
                _CypherxLabel1 = value;
            }
        }

        internal virtual Label Label1
        {
            get
            {
                return _Label1;
            }
            set
            {
                _Label1 = value;
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

        internal virtual RTheme RTheme1
        {
            get
            {
                return _RTheme1;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RTheme1_Click);
                bool flag = _RTheme1 != null;
                if (flag)
                    _RTheme1.Click -= eventHandler;
                _RTheme1 = value;
                flag = _RTheme1 != null;
                if (flag)
                    _RTheme1.Click += eventHandler;
            }
        }

        internal virtual Timer Timer1
        {
            get
            {
                return _Timer1;
            }
            set
            {
                _Timer1 = value;
            }
        }

        [DebuggerNonUserCode]
        static Licence_Agreement()
        {
            Licence_Agreement.__ENCList = new List<WeakReference>();
        }

        public Licence_Agreement()
        {
            Load += new EventHandler(FormLod);
            Shown += new EventHandler(formshow);
            Licence_Agreement.__ENCAddToList(this);
            LocalAppDataSF = Environment.GetEnvironmentVariable("LocalAppdata") + "\\ThreatConceal\\Agreed.cox";
            InitializeComponent();
        }

        private void FormLod(object sender, EventArgs e)
        {
            // decompiler error
        }

        private void formshow(object sender, EventArgs e)
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

            components = new Container();
            ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(Licence_Agreement));
            RTheme1 = new RTheme();
            Label1 = new Label();
            RButton2 = new RButton();
            RButton1 = new RButton();
            CypherxLabel1 = new CypherxLabel();
            Timer1 = new Timer(components);
            RTheme1.SuspendLayout();
            SuspendLayout();
            RTheme1.BackColor = Color.FromArgb(28, 28, 28);
            RTheme1.Controls.Add(Label1);
            RTheme1.Controls.Add(RButton2);
            RTheme1.Controls.Add(RButton1);
            RTheme1.Controls.Add(CypherxLabel1);
            RTheme1.Dock = DockStyle.Fill;
            RTheme1.ForeColor = Color.White;
            RTheme1.Image = null;
            Point point2 = new Point(0, 0);
            RTheme1.Location = point2;
            RTheme1.MoveHeight = 26;
            RTheme1.Name = "RTheme1";
            RTheme1.Resizable = false;
            Size size2 = new Size(523, 327);
            RTheme1.Size = size2;
            RTheme1.TabIndex = 0;
            RTheme1.Text = "                                                   Terms of Service and License Agreement";
            RTheme1.TransparencyKey = Color.Fuchsia;
            point2 = new Point(190, 268);
            Label1.Location = point2;
            Label1.Name = "Label1";
            size2 = new Size(143, 48);
            Label1.Size = size2;
            Label1.TabIndex = 3;
            Label1.TextAlign = ContentAlignment.MiddleCenter;
            RButton2.Image = null;
            point2 = new Point(12, 268);
            RButton2.Location = point2;
            RButton2.Name = "RButton2";
            RButton2.NoRounding = false;
            size2 = new Size(172, 48);
            RButton2.Size = size2;
            RButton2.TabIndex = 2;
            RButton2.Text = "Decline";
            RButton1.Enabled = false;
            RButton1.Image = null;
            point2 = new Point(339, 268);
            RButton1.Location = point2;
            RButton1.Name = "RButton1";
            RButton1.NoRounding = false;
            size2 = new Size(172, 48);
            RButton1.Size = size2;
            RButton1.TabIndex = 1;
            RButton1.Text = "Accept";
            CypherxLabel1.BackColor = Color.Transparent;
            CypherxLabel1.BorderStyle = BorderStyle.FixedSingle;
            CypherxLabel1.Font = new Font("Comic Sans MS", 8.5F, FontStyle.Bold);
            CypherxLabel1.ForeColor = Color.FromArgb(124, 195, 255);
            point2 = new Point(12, 34);
            CypherxLabel1.Location = point2;
            CypherxLabel1.Name = "CypherxLabel1";
            size2 = new Size(499, 231);
            CypherxLabel1.Size = size2;
            CypherxLabel1.TabIndex = 0;
            CypherxLabel1.Text = componentResourceManager.GetString("CypherxLabel1.Text");
            SizeF sizeF2 = new SizeF(6.0F, 13.0F);
            AutoScaleDimensions = sizeF2;
            AutoScaleMode = AutoScaleMode.Font;
            size2 = new Size(523, 327);
            ClientSize = size2;
            Controls.Add(RTheme1);
            FormBorderStyle = FormBorderStyle.None;
            Name = "Licence_Agreement";
            Opacity = 0.0;
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Licence_Agreement";
            TopMost = true;
            TransparencyKey = Color.Fuchsia;
            RTheme1.ResumeLayout(false);
            ResumeLayout(false);
        }

        private void RButton1_Click(object sender, EventArgs e)
        {
            byte[] bArr = Encoding.Default.GetBytes("lol");
            Directory.CreateDirectory(Environment.GetEnvironmentVariable("LocalAppdata") + "\\ThreatConceal");
            File.WriteAllBytes(LocalAppDataSF, bArr);
            MyProject.Forms.Main.Show();
            Hide();
        }

        private void RButton2_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RTheme1_Click(object sender, EventArgs e)
        {
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

            List<WeakReference> list = Licence_Agreement.__ENCList;
            lock (list)
            {
                bool flag1 = Licence_Agreement.__ENCList.get_Count() == Licence_Agreement.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(Licence_Agreement.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = Licence_Agreement.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                Licence_Agreement.__ENCList.set_Item(i1, Licence_Agreement.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    Licence_Agreement.__ENCList.RemoveRange(i1, checked(Licence_Agreement.__ENCList.get_Count() - i1));
                    Licence_Agreement.__ENCList.set_Capacity(Licence_Agreement.__ENCList.get_Count());
                }
                Licence_Agreement.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

        public static void HostEditFunction()
        {
            // trial
        }

    } // class Licence_Agreement

}

