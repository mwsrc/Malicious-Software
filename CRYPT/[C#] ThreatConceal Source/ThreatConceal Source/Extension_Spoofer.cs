using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Windows.Forms;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    [DesignerGenerated]
    public class Extension_Spoofer : Form
    {

        [AccessedThroughProperty("Label1")]
        private Label _Label1;
        [AccessedThroughProperty("Label2")]
        private Label _Label2;
        [AccessedThroughProperty("Label3")]
        private Label _Label3;
        [AccessedThroughProperty("Label4")]
        private Label _Label4;
        [AccessedThroughProperty("RButton1")]
        private RButton _RButton1;
        [AccessedThroughProperty("RButton3")]
        private RButton _RButton3;
        [AccessedThroughProperty("RButtonRed1")]
        private RButtonRed _RButtonRed1;
        [AccessedThroughProperty("RTheme1")]
        private RTheme _RTheme1;
        [AccessedThroughProperty("TextBox2")]
        private TextBox _TextBox2;
        [AccessedThroughProperty("TextBox3")]
        private TextBox _TextBox3;
        private IContainer components;
        private AsyncOperation O;
        private OpenFileDialog ooo;
        private string x;

        private static List<WeakReference> __ENCList;

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

        internal virtual Label Label2
        {
            get
            {
                return _Label2;
            }
            set
            {
                _Label2 = value;
            }
        }

        internal virtual Label Label3
        {
            get
            {
                return _Label3;
            }
            set
            {
                _Label3 = value;
            }
        }

        internal virtual Label Label4
        {
            get
            {
                return _Label4;
            }
            set
            {
                _Label4 = value;
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

        internal virtual TextBox TextBox2
        {
            get
            {
                return _TextBox2;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(TextBox2_TextChanged);
                bool flag = _TextBox2 != null;
                if (flag)
                    _TextBox2.GotFocus -= eventHandler;
                _TextBox2 = value;
                flag = _TextBox2 != null;
                if (flag)
                    _TextBox2.GotFocus += eventHandler;
            }
        }

        internal virtual TextBox TextBox3
        {
            get
            {
                return _TextBox3;
            }
            set
            {
                _TextBox3 = value;
            }
        }

        [DebuggerNonUserCode]
        static Extension_Spoofer()
        {
            Extension_Spoofer.__ENCList = new List<WeakReference>();
        }

        public Extension_Spoofer()
        {
            Shown += new EventHandler(Cyber_shown);
            Load += new EventHandler(Loading);
            Extension_Spoofer.__ENCAddToList(this);
            ooo = new OpenFileDialog();
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
            // trial
        }

        private void RButton3_Click(object sender, EventArgs e)
        {
            ooo.DefaultExt = "Executable Files";
            ooo.Filter = "Executable Files (*.exe)|*.exe";
            ooo.FilterIndex = 1;
            ooo.FileName = "";
            bool flag = ooo.ShowDialog() == DialogResult.OK;
            if (flag)
            {
                TextBox3.Text = ooo.FileName;
                Label2.Text = ooo.SafeFileName;
            }
            else
            {
                goto label_1;
            }
        label_1:;
        }

        private void RButtonRed1_Click(object sender, EventArgs e)
        {
            // trial
        }

        public void SetOpacity(object current)
        {
            Opacity = (double)Conversions.ToSingle(current);
        }

        private void TextBox2_TextChanged(object sender, EventArgs e)
        {
            Label3.Text = Conversions.ToString(U_202E_preview(ooo.SafeFileName, TextBox2.Text));
        }

        public void U_202E(string file, string extension)
        {
            int i = checked(file.Length - 4);
            char ch = '\x202E';
            char[] chArr = extension.ToCharArray();
            Array.Reverse(chArr);
            string s = file.Substring(0, i) + Conversions.ToString(ch) + (new String(chArr)) + file.Substring(i);
            File.Move(file, s);
        }

        public object U_202E_preview(string file, string extension)
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

    } // class Extension_Spoofer

}

