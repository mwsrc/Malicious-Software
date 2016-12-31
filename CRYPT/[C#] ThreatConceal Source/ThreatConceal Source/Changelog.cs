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
    public class Changelog : Form
    {

        [AccessedThroughProperty("Changeloglabel")]
        private CypherxLabel _Changeloglabel;
        [AccessedThroughProperty("RButtonRed1")]
        private RButtonRed _RButtonRed1;
        [AccessedThroughProperty("RTheme1")]
        private RTheme _RTheme1;
        private IContainer components;

        private static List<WeakReference> __ENCList;

        internal virtual CypherxLabel Changeloglabel
        {
            get
            {
                return _Changeloglabel;
            }
            set
            {
                _Changeloglabel = value;
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

        [DebuggerNonUserCode]
        static Changelog()
        {
            Changelog.__ENCList = new List<WeakReference>();
        }

        [DebuggerNonUserCode]
        public Changelog()
        {
            Changelog.__ENCAddToList(this);
            InitializeComponent();
        }

        [DebuggerStepThrough]
        private void InitializeComponent()
        {
            Color color;
            Point point1;
            Size size1;
            SizeF sizeF1;

            ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(Changelog));
            RTheme1 = new RTheme();
            RButtonRed1 = new RButtonRed();
            Changeloglabel = new CypherxLabel();
            RTheme1.SuspendLayout();
            SuspendLayout();
            RTheme1.BackColor = Color.FromArgb(28, 28, 28);
            RTheme1.Controls.Add(RButtonRed1);
            RTheme1.Controls.Add(Changeloglabel);
            RTheme1.Dock = DockStyle.Fill;
            RTheme1.ForeColor = Color.White;
            RTheme1.Image = null;
            Point point2 = new Point(0, 0);
            RTheme1.Location = point2;
            RTheme1.MoveHeight = 26;
            RTheme1.Name = "RTheme1";
            RTheme1.Resizable = false;
            Size size2 = new Size(269, 439);
            RTheme1.Size = size2;
            RTheme1.TabIndex = 0;
            RTheme1.Text = "                                 Changelog";
            RTheme1.TransparencyKey = Color.Fuchsia;
            RButtonRed1.Image = null;
            point2 = new Point(241, 3);
            RButtonRed1.Location = point2;
            RButtonRed1.Name = "RButtonRed1";
            RButtonRed1.NoRounding = false;
            size2 = new Size(23, 21);
            RButtonRed1.Size = size2;
            RButtonRed1.TabIndex = 6;
            Changeloglabel.BackColor = Color.Transparent;
            Changeloglabel.BorderStyle = BorderStyle.FixedSingle;
            Changeloglabel.Font = new Font("Arial", 8.0F);
            Changeloglabel.ForeColor = Color.FromArgb(124, 195, 255);
            point2 = new Point(12, 33);
            Changeloglabel.Location = point2;
            Changeloglabel.Name = "Changeloglabel";
            size2 = new Size(245, 394);
            Changeloglabel.Size = size2;
            Changeloglabel.TabIndex = 1;
            Changeloglabel.Text = componentResourceManager.GetString("Changeloglabel.Text");
            SizeF sizeF2 = new SizeF(6.0F, 13.0F);
            AutoScaleDimensions = sizeF2;
            AutoScaleMode = AutoScaleMode.Font;
            size2 = new Size(269, 439);
            ClientSize = size2;
            Controls.Add(RTheme1);
            FormBorderStyle = FormBorderStyle.None;
            Icon = (Icon)componentResourceManager.GetObject("$this.Icon");
            Name = "Changelog";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Changelog";
            TopMost = true;
            TransparencyKey = Color.Fuchsia;
            RTheme1.ResumeLayout(false);
            ResumeLayout(false);
        }

        private void RButtonRed1_Click(object sender, EventArgs e)
        {
            // trial
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

            List<WeakReference> list = Changelog.__ENCList;
            lock (list)
            {
                bool flag1 = Changelog.__ENCList.get_Count() == Changelog.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(Changelog.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = Changelog.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                Changelog.__ENCList.set_Item(i1, Changelog.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    Changelog.__ENCList.RemoveRange(i1, checked(Changelog.__ENCList.get_Count() - i1));
                    Changelog.__ENCList.set_Capacity(Changelog.__ENCList.get_Count());
                }
                Changelog.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class Changelog

}

