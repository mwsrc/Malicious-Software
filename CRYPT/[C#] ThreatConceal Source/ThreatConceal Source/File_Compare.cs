using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Windows.Forms;
using CybeR_CryptZ.My;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    [DesignerGenerated]
    public class File_Compare : Form
    {

        [AccessedThroughProperty("DisSimiliraty")]
        private Label _DisSimiliraty;
        [AccessedThroughProperty("Label12")]
        private Label _Label12;
        [AccessedThroughProperty("Label13")]
        private Label _Label13;
        [AccessedThroughProperty("Label16")]
        private Label _Label16;
        [AccessedThroughProperty("RButton1")]
        private RButton _RButton1;
        [AccessedThroughProperty("RButton2")]
        private RButton _RButton2;
        [AccessedThroughProperty("RButton3")]
        private RButton _RButton3;
        [AccessedThroughProperty("RButtonGreen1")]
        private RButtonGreen _RButtonGreen1;
        [AccessedThroughProperty("RButtonRed1")]
        private RButtonRed _RButtonRed1;
        [AccessedThroughProperty("RTheme1")]
        private RTheme _RTheme1;
        [AccessedThroughProperty("Similarity")]
        private Label _Similarity;
        [AccessedThroughProperty("Sizee")]
        private Label _Sizee;
        [AccessedThroughProperty("TextBox1")]
        private TextBox _TextBox1;
        [AccessedThroughProperty("TextBox2")]
        private TextBox _TextBox2;
        private IContainer components;
        private AsyncOperation O;

        private static List<WeakReference> __ENCList;

        internal virtual Label DisSimiliraty
        {
            get
            {
                return _DisSimiliraty;
            }
            set
            {
                _DisSimiliraty = value;
            }
        }

        internal virtual Label Label12
        {
            get
            {
                return _Label12;
            }
            set
            {
                _Label12 = value;
            }
        }

        internal virtual Label Label13
        {
            get
            {
                return _Label13;
            }
            set
            {
                _Label13 = value;
            }
        }

        internal virtual Label Label16
        {
            get
            {
                return _Label16;
            }
            set
            {
                _Label16 = value;
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

        internal virtual RButtonGreen RButtonGreen1
        {
            get
            {
                return _RButtonGreen1;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButtonGreen1_Click);
                bool flag = _RButtonGreen1 != null;
                if (flag)
                    _RButtonGreen1.Click -= eventHandler;
                _RButtonGreen1 = value;
                flag = _RButtonGreen1 != null;
                if (flag)
                    _RButtonGreen1.Click += eventHandler;
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

        internal virtual Label Similarity
        {
            get
            {
                return _Similarity;
            }
            set
            {
                _Similarity = value;
            }
        }

        internal virtual Label Sizee
        {
            get
            {
                return _Sizee;
            }
            set
            {
                _Sizee = value;
            }
        }

        internal virtual TextBox TextBox1
        {
            get
            {
                return _TextBox1;
            }
            set
            {
                _TextBox1 = value;
            }
        }

        internal virtual TextBox TextBox2
        {
            get
            {
                return _TextBox2;
            }
            set
            {
                _TextBox2 = value;
            }
        }

        [DebuggerNonUserCode]
        static File_Compare()
        {
            File_Compare.__ENCList = new List<WeakReference>();
        }

        public File_Compare()
        {
            Load += new EventHandler(Loading);
            Shown += new EventHandler(Cyber_shown);
            File_Compare.__ENCAddToList(this);
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
            // trial
        }

        private void Loading(object sender, EventArgs e)
        {
            Opacity = 0.0;
        }

        private void RButton1_Click(object sender, EventArgs e)
        {
            long l;

            byte[] bArr1 = MyProject.Computer.FileSystem.ReadAllBytes(TextBox1.Text);
            byte[] bArr2 = MyProject.Computer.FileSystem.ReadAllBytes(TextBox2.Text);
            bool flag = checked((int)bArr1.Length) == checked((int)bArr2.Length);
            if (flag)
            {
                Sizee.Text = Conversions.ToString(true);
            }
            else
            {
                flag = checked((int)bArr1.Length) > checked((int)bArr2.Length);
                if (flag)
                    Sizee.Text = Conversions.ToString(false) + " (" + SetBytes(checked(checked((int)bArr1.Length) - checked((int)bArr2.Length))) + " )";
                else
                    Sizee.Text = Conversions.ToString(false) + " (" + SetBytes(checked(checked((int)bArr2.Length) - checked((int)bArr1.Length))) + " )";
            }
            flag = checked((int)bArr1.Length) > checked((int)bArr2.Length);
            if (flag)
            {
                int i2 = checked(checked((int)bArr2.Length) - 1);
                int i1 = 0;
                while (flag)
                {
                    flag = bArr1[i1] == bArr2[i1];
                    if (flag)
                        l = checked(l + (long)1);
                    i1 = checked(i1 + 1);
                    flag = i1 <= i2;
                }
                Similarity.Text = Conversions.ToString(Math.Round((double)(100.0 / (double)checked((int)bArr1.Length) * (double)l), 9)) + "%";
                DisSimiliraty.Text = Conversions.ToString(100.0 - Conversions.ToDouble(Conversions.ToString(Math.Round((double)(100.0 / (double)checked((int)bArr1.Length) * (double)l), 9)))) + "%";
            }
            else
            {
                int i4 = checked(checked((int)bArr1.Length) - 1);
                int i3 = 0;
                while (flag)
                {
                    flag = bArr1[i3] == bArr2[i3];
                    if (flag)
                        l = checked(l + (long)1);
                    i3 = checked(i3 + 1);
                    flag = i3 <= i4;
                }
                Similarity.Text = Conversions.ToString(Math.Round((double)(100.0 / (double)checked((int)bArr2.Length) * (double)l), 9)) + "%";
                DisSimiliraty.Text = Conversions.ToString(100.0 - Conversions.ToDouble(Conversions.ToString(Math.Round((double)(100.0 / (double)checked((int)bArr2.Length) * (double)l), 9)))) + "%";
            }
        }

        private void RButton2_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.DefaultExt = "";
            openFileDialog.Filter = "All Files (*.*)|*.*";
            openFileDialog.FilterIndex = 1;
            openFileDialog.FileName = "";
            bool flag = openFileDialog.ShowDialog() == DialogResult.OK;
            if (flag)
                TextBox2.Text = openFileDialog.FileName;
        }

        private void RButton3_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButtonGreen1_Click(object sender, EventArgs e)
        {
            Interaction.MsgBox("Maximum DisSimiliraty: 99,78%\r\nAverage DisSimiliraty:    98,21%\r\nMinimum DisSimiliraty: 51,81%", MsgBoxStyle.ApplicationModal, null);
        }

        private void RButtonRed1_Click(object sender, EventArgs e)
        {
            // trial
        }

        public string SetBytes(object Bytes)
        {
            // trial
            return null;
        }

        public void SetOpacity(object current)
        {
            Opacity = (double)Conversions.ToSingle(current);
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

    } // class File_Compare

}

