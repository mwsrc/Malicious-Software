using System;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Net;
using System.Net.Cache;
using System.Security.Cryptography;
using System.Security.Principal;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    internal sealed class License
    {

        private delegate void ÒOÒÖ();

        private struct ÄÀÀÁ
        {

            public IntPtr ÂÃÅÁ;
            public IntPtr EÊÉÈ;
            public IntPtr ÈEEÊ;
            public IntPtr ÌIÎÌ;
            public IntPtr ÏÎÎÎ;
            public IntPtr ÕÒÔÔ;

        }

        private class ÉEEÈ
        {

            private MemoryStream ÃÀÀÁ;
            public int EÊÈÉ;
            private byte[] ÓÕÖÕ;
            private UTF8Encoding ÖÒÖO;

            public byte[] ÌÏÍÎ
            {
                get
                {
                    return ÃÀÀÁ.ToArray();
                }
                set
                {
                    ÃÀÀÁ.Close();
                    ÃÀÀÁ = new MemoryStream(value);
                }
            }

            public ÉEEÈ()
            {
                ÃÀÀÁ = new MemoryStream();
                ÖÒÖO = new UTF8Encoding();
            }

            public ÉEEÈ(byte[] ÊËEÈ)
            {
                ÃÀÀÁ = new MemoryStream();
                ÖÒÖO = new UTF8Encoding();
                ÓÕÖÕ = ÊËEÈ;
            }

            public string ÃÃÀÃ(int ÕÔÔÔ)
            {
                // trial
                return null;
            }

            public int ÈEÉE()
            {
                int i = BitConverter.ToInt32(ÓÕÖÕ, EÊÈÉ);
                EÊÈÉ = checked(EÊÈÉ + 4);
                return i;
            }

            public byte ÍIÎÍ()
            {
                // trial
                return 0;
            }

            public void ÎIIÌ(string ÊËEÈ)
            {
                byte[] bArr = ÖÒÖO.GetBytes(ÊËEÈ);
                ÎIIÌ(checked((int)bArr.Length));
                ÎIIÌ(bArr);
            }

            public void ÎIIÌ(byte ÊËEÈ)
            {
                // trial
            }

            public void ÎIIÌ(byte[] ÊËEÈ)
            {
                ÃÀÀÁ.Write(ÊËEÈ, 0, checked((int)ÊËEÈ.Length));
            }

            public void ÎIIÌ(int ÊËEÈ)
            {
                // trial
            }

            public void ÔÖÖÓ()
            {
                ÃÀÀÁ.Close();
                ÃÀÀÁ = null;
                ÖÒÖO = null;
                ÓÕÖÕ = null;
            }

        } // class ÉEEÈ

        private string ÁAÅÀ;
        private string ÁÃÅÅ;
        private TextBox ÀÂÂÀ;
        private int ÀÃÅA;
        private TextBox ÂÂAÄ;
        private Label ÃÄÀÄ;
        private byte[] ÅÁÃÄ;
        private string ÅÁÅÁ;
        private string EÉEË;
        private string[] EÊËÊ;
        private string ÉEËË;
        private byte ÉÉÈÊ;
        private bool ÈEEE;
        private bool ÈÈËE;
        private string ÈÈËË;
        private bool ÈËEE;
        private string ÊËEE;
        private Version ËËÉE;
        private bool IÏÍI;
        private string IÏÌÍ;
        private string ÍÍÌÎ;
        private string ÌÍIÏ;
        private TextBox ÎÍÌÏ;
        private ProgressBar ÎÌÎÏ;
        private string ÎÎÎÏ;
        private string ÏÎÎÎ;
        private TextBox ÏÏIÎ;
        private bool ÒÖÔÔ;
        private UTF8Encoding ÖÒÖO;
        private Icon ÖÒÕO;
        private string ÕÓOO;

        public string Message
        {
            get
            {
                return ÎÎÎÏ;
            }
        }

        private string OÕÓÒ
        {
            get
            {
                return Path.ChangeExtension(ÁAÅÀ, ÊÊÊÈ.ÉÈËÊ[34]);
            }
        }

        private string ÔÕÓÕ
        {
            get
            {
                bool flag = String.IsNullOrEmpty(ÕÓOO);
                if (flag)
                    ÕÓOO = ÓÔÕÖ(WindowsIdentity.GetCurrent().User.AccountDomainSid.ToString() + IÎÍÏ(ÊÊÊÈ.ÉÈËÊ[36], ÊÊÊÈ.ÉÈËÊ[37]));
                return ÕÓOO;
            }
        }

        public string Serial
        {
            get
            {
                return ÍÍÌÎ;
            }
        }

        public string Username
        {
            get
            {
                return ÈÈËË;
            }
        }

        public string Version
        {
            get
            {
                return ËËÉE.ToString().Replace(ÊÊÊÈ.ÉÈËÊ[6], ÊÊÊÈ.ÉÈËÊ[7]);
            }
        }

        public License(string key, string version, bool offline)
        {
            // decompiler error
        }

        private bool ÁÀÁÃ()
        {
            bool flag1, flag2;

            string[] sArr = Environment.GetCommandLineArgs();
            int i = 0;
            while (flag2)
            {
                string s = sArr[i];
                flag2 = Operators.CompareString(s.ToLower(), ÊÊÊÈ.ÉÈËÊ[11], false) == 0;
                if (flag2)
                {
                    return true;
                }
                i = checked(i + 1);
                flag2 = i < checked((int)sArr.Length);
            }
            return false;
        }

        private void ÁÄÁÄ()
        {
            // trial
        }

        private void ÀÀAÄ(object ÒÕÔÖ, AsyncCompletedEventArgs ÎÍÍÎ)
        {
            string s = (string)ÎÍÍÎ.UserState;
            bool flag = (ÎÍÍÎ.Error == null) && !ÎÍÍÎ.Cancelled ? true : false;
            if (flag)
            {
                File.Delete(s);
            }
            else
            {
                File.Move(ÁAÅÀ, OÕÓÒ);
                File.Move(s, ÁAÅÀ);
                Process.Start(ÁAÅÀ, Environment.CommandLine);
            }
            ÉÈÈË(255);
        }

        private bool ÀÂÀÁ()
        {
            bool flag1;
            Color color;
            Point point1;
            Size size1;

            Form form1 = new Form();
            ÀÂÂÀ = new TextBox();
            ÏÏIÎ = new TextBox();
            ÂÂAÄ = new TextBox();
            ÎÍÌÏ = new TextBox();
            Label label1 = new Label();
            Label label2 = new Label();
            ÃÄÀÄ = new Label();
            Button button1 = new Button();
            Font font = new Font(ÊÊÊÈ.ÉÈËÊ[22], 8.25F);
            form1.SuspendLayout();
            TextBox textBox1 = ÀÂÂÀ;
            textBox1.Font = font;
            Point point2 = new Point(78, 51);
            textBox1.Location = point2;
            textBox1.MaxLength = 42;
            Size size2 = new Size(207, 21);
            textBox1.Size = size2;
            textBox1.TextAlign = HorizontalAlignment.Center;
            textBox1 = null;
            TextBox textBox2 = ÏÏIÎ;
            textBox2.Tag = 0;
            textBox2.Font = font;
            point2 = new Point(78, 78);
            textBox2.Location = point2;
            textBox2.MaxLength = 4;
            size2 = new Size(65, 21);
            textBox2.Size = size2;
            textBox2.TextAlign = HorizontalAlignment.Center;
            ÏÏIÎ.TextChanged += new EventHandler(ÓÓÓÒ);
            ÏÏIÎ.KeyDown += new KeyEventHandler(ÎÍÍI);
            textBox2 = null;
            TextBox textBox3 = ÂÂAÄ;
            textBox3.Tag = 1;
            textBox3.Font = font;
            point2 = new Point(149, 78);
            textBox3.Location = point2;
            textBox3.MaxLength = 4;
            size2 = new Size(65, 21);
            textBox3.Size = size2;
            textBox3.TextAlign = HorizontalAlignment.Center;
            ÂÂAÄ.TextChanged += new EventHandler(ÓÓÓÒ);
            textBox3 = null;
            TextBox textBox4 = ÎÍÌÏ;
            textBox4.Font = font;
            point2 = new Point(220, 78);
            textBox4.Location = point2;
            textBox4.MaxLength = 4;
            size2 = new Size(65, 21);
            textBox4.Size = size2;
            textBox4.TextAlign = HorizontalAlignment.Center;
            textBox4 = null;
            Label label3 = label1;
            label3.Font = font;
            point2 = new Point(27, 54);
            label3.Location = point2;
            size2 = new Size(45, 13);
            label3.Size = size2;
            label3.Text = ÊÊÊÈ.ÉÈËÊ[23];
            label3 = null;
            Label label4 = label2;
            label4.Font = font;
            point2 = new Point(27, 81);
            label4.Location = point2;
            size2 = new Size(45, 13);
            label4.Size = size2;
            label4.Text = ÊÊÊÈ.ÉÈËÊ[24];
            label4 = null;
            Label label5 = ÃÄÀÄ;
            label5.Font = font;
            label5.ForeColor = SystemColors.ControlDark;
            point2 = new Point(78, 9);
            label5.Location = point2;
            size2 = new Size(207, 32);
            label5.Size = size2;
            label5.Text = ÊÊÊÈ.ÉÈËÊ[25];
            label5.TextAlign = ContentAlignment.MiddleCenter;
            label5 = null;
            Button button2 = button1;
            button2.Font = font;
            point2 = new Point(78, 105);
            button2.Location = point2;
            size2 = new Size(207, 26);
            button2.Size = size2;
            button2.Text = ÊÊÊÈ.ÉÈËÊ[26];
            button1.Click += new EventHandler(ËÉEÊ);
            button2 = null;
            Form form2 = form1;
            form2.TopMost = true;
            size2 = new Size(312, 148);
            form2.ClientSize = size2;
            form2.Icon = ÖÒÕO;
            form2.Controls.Add(ÀÂÂÀ);
            form2.Controls.Add(ÏÏIÎ);
            form2.Controls.Add(ÂÂAÄ);
            form2.Controls.Add(ÎÍÌÏ);
            form2.Controls.Add(label1);
            form2.Controls.Add(label2);
            form2.Controls.Add(ÃÄÀÄ);
            form2.Controls.Add(button1);
            form2.FormBorderStyle = FormBorderStyle.FixedDialog;
            form2.MaximizeBox = false;
            form2.MinimizeBox = false;
            form2.Text = ÊÊÊÈ.ÉÈËÊ[19];
            form2.ResumeLayout(true);
            form2 = null;
            form1.ShowDialog();
            ÃAÅÀ();
            form1.Close();
            GC.Collect();
            bool flag2 = form1.DialogResult == DialogResult.OK;
            if (flag2)
            {
                return ÈEEE;
            }
            else
            {
                ÔÕÓÒ(14);
                return false;
            }
            return flag1;
        }

        private void ÂÅÃÀ()
        {
            // trial
        }

        private int ÄÀÄÂ()
        {
            TimeSpan timeSpan1, timeSpan2, timeSpan3, timeSpan4, timeSpan5, timeSpan6, timeSpan7, timeSpan8, timeSpan9, timeSpan10, timeSpan11, timeSpan12, timeSpan13, timeSpan14, timeSpan15, timeSpan16;

            DateTime dateTime = new DateTime(1970, 1, 1);
            TimeSpan timeSpan17 = DateTime.Now - dateTime;
            return Convert.ToInt32(timeSpan17.TotalSeconds);
        }

        private void ÃAÅÀ()
        {
            Point point1;
            Size size1;

            bool flag = String.IsNullOrEmpty(ÅÁÅÁ);
            if (flag)
            {
            }
            else
            {
                Form form1 = new Form();
                ÎÌÎÏ = new ProgressBar();
                Label label1 = new Label();
                form1.SuspendLayout();
                Point point2 = new Point(12, 36);
                ÎÌÎÏ.Location = point2;
                Size size2 = new Size(253, 18);
                ÎÌÎÏ.Size = size2;
                Label label2 = label1;
                label2.Font = new Font(ÊÊÊÈ.ÉÈËÊ[22], 6.75F);
                point2 = new Point(12, 9);
                label2.Location = point2;
                size2 = new Size(253, 24);
                label2.Size = size2;
                label2.Text = ÊÊÊÈ.ÉÈËÊ[29];
                label2.TextAlign = ContentAlignment.MiddleLeft;
                label2 = null;
                Form form2 = form1;
                size2 = new Size(277, 66);
                form2.ClientSize = size2;
                form2.Icon = ÖÒÕO;
                form2.Controls.Add(label1);
                form2.Controls.Add(ÎÌÎÏ);
                form2.FormBorderStyle = FormBorderStyle.FixedDialog;
                form2.MaximizeBox = false;
                form2.MinimizeBox = false;
                form2.StartPosition = FormStartPosition.CenterScreen;
                form2.ShowInTaskbar = false;
                form2.Text = ÊÊÊÈ.ÉÈËÊ[30];
                form2.ResumeLayout(true);
                form2 = null;
                WebClient webClient = new WebClient();
                webClient.DownloadProgressChanged += new DownloadProgressChangedEventHandler(ÖÒOÔ);
                webClient.DownloadFileCompleted += new AsyncCompletedEventHandler(ÀÀAÄ);
                ServicePointManager.Expect100Continue = true;
                webClient.Headers.Add(HttpRequestHeader.UserAgent, "Nothing");
                webClient.CachePolicy = new RequestCachePolicy(RequestCacheLevel.BypassCache);
                webClient.Proxy = null;
                string s = Path.Combine(Path.GetTempPath(), Path.GetRandomFileName());
                webClient.DownloadFileAsync(new Uri(ÊÊÊÈ.ÉÈËÊ[31] + ÅÁÅÁ), s, s);
                form1.ShowDialog();
                webClient.CancelAsync();
            }
        }

        public void ClearCache()
        {
            // trial
        }

        private void EÊÈÈ()
        {
            bool flag1;
            uint ui1;

            bool flag2 = Debugger.IsAttached;
            if (flag2)
                ÉÈÈË(10);
            License.ÏIÍI(Process.GetCurrentProcess().Handle, ref flag1);
            flag2 = flag1;
            if (flag2)
                ÉÈÈË(11);
            flag2 = License.ÏIÍI();
            if (flag2)
                ÉÈÈË(12);
            uint ui2 = 0;
            License.ÏÍÌI(Process.GetCurrentProcess().Handle, 7, ref ui1, 4, ref ui2);
            flag2 = (long)(ulong)ui1 > (ulong)(long)0;
            if (flag2)
                ÉÈÈË(13);
            Thread.Sleep(1000);
            flag2 = ÈËEE;
            if (flag2)
            {
            }
            else
            {
                Thread thread = new Thread(new ThreadStart(EÊÈÈ));
                thread.Start();
            }
        }

        private string ÉEÉÈ(string ÊËEÈ)
        {
            RNGCryptoServiceProvider rngcryptoServiceProvider = new RNGCryptoServiceProvider();
            rngcryptoServiceProvider.GetNonZeroBytes(ÅÁÃÄ);
            RijndaelManaged rijndaelManaged = new RijndaelManaged();
            rijndaelManaged.Padding = PaddingMode.Zeros;
            rijndaelManaged.Mode = CipherMode.ECB;
            rijndaelManaged.Key = ÅÁÃÄ;
            rijndaelManaged.IV = ÅÁÃÄ;
            byte[] bArr = ÈÊÉE(ÊËEÈ);
            string s = ËËÈÊ() + Convert.ToBase64String(rijndaelManaged.CreateEncryptor().TransformFinalBlock(bArr, 0, checked((int)bArr.Length)));
            rijndaelManaged.Clear();
            return s;
        }

        private void ÉÉÊÈ()
        {
            // trial
        }

        private void ÉÈÈË(byte ÕÓÕÒ)
        {
            // trial
        }

        private void ÉÊEÈ(object ÒÕÔÖ, ThreadExceptionEventArgs ÎÍÍÎ)
        {
            ÉÈÈË(5);
        }

        private void ÉÊEÈ(object ÒÕÔÖ, UnhandledExceptionEventArgs ÎÍÍÎ)
        {
            // trial
        }

        private string ÈÊÉE(byte[] ÊËEÈ)
        {
            return ÖÒÖO.GetString(ÊËEÈ);
        }

        private byte[] ÈÊÉE(string ÊËEÈ)
        {
            // trial
            return null;
        }

        private bool ÊÉÊË()
        {
            // trial
            return false;
        }

        private void ËÉEÊ(object ÒÕÔÖ, EventArgs ÎÍÍÎ)
        {
            // trial
        }

        private string ËÈÊÊ(Version ÌÌIÎ)
        {
            // trial
            return null;
        }

        private string ËËÈÊ()
        {
            // trial
            return null;
        }

        private string IÎÍÏ(string key, string ËEÈÊ)
        {
            UIntPtr uintPtr1;

            UIntPtr uintPtr2 = new UIntPtr(-2147483646);
            License.ÏÏÏÎ(uintPtr2, key, 0, 131353, ref uintPtr1);
            StringBuilder stringBuilder = new StringBuilder(256);
            uint ui1 = 0, ui2 = 256;
            License.ÎÍÎI(uintPtr1, ËEÈÊ, 0, ref ui1, stringBuilder, ref ui2);
            License.OÓÖÒ(uintPtr1);
            return stringBuilder.ToString();
        }

        private void ÍÍÏÍ()
        {
            EÉEË += new String(EÉEË[checked(EÉEË.Length - 6)], 2);
        }

        private string ÍÌÎÎ(IntPtr ÈEEÉ)
        {
            bool flag2;
            string s1;

            StringBuilder stringBuilder = new StringBuilder(512);
            bool flag1 = (int)License.ÒOÕO(ÈEEÉ, stringBuilder, 512) > 0;
            if (flag1)
            {
                string s2 = stringBuilder.ToString().ToLower();
                string[] sArr = Environment.GetLogicalDrives();
                int i = 0;
                while (flag2)
                {
                    string s3 = sArr[i];
                    flag1 = (int)License.ÂÁÃÄ(s3.Substring(0, 2), stringBuilder, 512) > 0;
                    if (flag1)
                    {
                        flag2 = s2.StartsWith(stringBuilder.ToString().ToLower());
                        if (flag2)
                        {
                            return Path.GetFullPath(s3 + s2.Remove(0, stringBuilder.Length));
                        }
                    }
                    i = checked(i + 1);
                    flag2 = i < checked((int)sArr.Length);
                }
            }
            return String.Empty;
        }

        private void ÌÍÌÎ()
        {
            EÉEË += EÊËÊ[4];
            ÓÕÓÕ();
        }

        private void ÎÍÍI(object ÒÕÔÖ, KeyEventArgs ÎÍÍÎ)
        {
            // trial
        }

        private bool ÎÏÍI()
        {
            // trial
            return false;
        }

        private bool ÏÌÍÏ()
        {
            // trial
            return false;
        }

        private void ÏÎÏÎ()
        {
            EÉEË += EÊËÊ[0];
            ÂÅÃÀ();
        }

        private void ÓÓÓÒ(object ÒÕÔÖ, EventArgs ÎÍÍÎ)
        {
            bool flag;
            int i1;

            switch ((int)((TextBox)ÒÕÔÖ).Tag)
            {
                case 0:
                    flag = ÏÏIÎ.TextLength == 4;
                    if (flag)
                        ÂÂAÄ.Focus();
                    break;

                case 1:
                    flag = ÂÂAÄ.TextLength == 4;
                    if (flag)
                        ÎÍÌÏ.Focus();
                    break;
            }
        }

        private bool ÓÓÕÕ(bool offline)
        {
            // trial
            return false;
        }

        private bool ÓÓÕÕ(string ÍÌÌI, string ÀÀÃA)
        {
            // decompiler error
        }

        private string ÓÔÕÖ(string ÊËEÈ)
        {
            MD5CryptoServiceProvider md5CryptoServiceProvider = new MD5CryptoServiceProvider();
            string s = BitConverter.ToString(md5CryptoServiceProvider.ComputeHash(ÈÊÉE(ÊËEÈ))).Replace(ÊÊÊÈ.ÉÈËÊ[8], String.Empty);
            md5CryptoServiceProvider.Clear();
            return s;
        }

        private void ÓÕÓÕ()
        {
            // trial
        }

        private void ÓÕÖÓ()
        {
            ÉÉÊÈ();
            EÉEË += EÊËÊ[2];
            ÍÍÏÍ();
        }

        private bool ÔÕÓÒ(byte ÕÓÕÒ)
        {
            // decompiler error
        }

        private byte[] ÔÕÖÖ(byte[] ÊËEÈ, bool ÅÀÁÀ)
        {
            // trial
            return null;
        }

        private string ÖOÓÔ(byte[] ÊËEÈ)
        {
            // trial
            return null;
        }

        private void ÖÒOÔ(object ÒÕÔÖ, DownloadProgressChangedEventArgs ÎÍÍÎ)
        {
            // trial
        }

        private 

        private bool ÕÒÒÖ()
        {
            // decompiler error
        }

        public void ReleaseID()
        {
            bool flag = IÏÍI | !ÒÖÔÔ;
            if (flag)
            {
            }
            else
            {
                string s = ÊÊÊÈ.ÉÈËÊ[35];
                WebClient webClient = new WebClient();
                NameValueCollection nameValueCollection = new NameValueCollection();
                webClient.CachePolicy = new RequestCachePolicy(RequestCacheLevel.BypassCache);
                webClient.Credentials = new NetworkCredential(ÊÊÊÈ.ÉÈËÊ[19], ÊÊÊÈ.ÉÈËÊ[20]);
                nameValueCollection.Add(ÊÊÊÈ.ÉÈËÊ[21], ÉEÉÈ(ÏÎÎÎ + ÍÍÌÎ + ÔÕÓÕ));
                IÏÍI = true;
            }
        }

        [PreserveSig]
        [DllImport("kernel32.dll", EntryPoint = "QueryDosDevice", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
        private static extern uint ÂÁÃÄ(string ËEÈÊ, StringBuilder ÌÎÍÏ, uint ÕÔÔÔ);

        [PreserveSig]
        [DllImport("kernel32.dll", EntryPoint = "TerminateProcess", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
        private static extern bool ÈÈÊÉ(IntPtr ÈEEÉ, uint ÕÓÕÒ);

        [PreserveSig]
        [DllImport("kernel32.dll", EntryPoint = "ExitProcess", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
        private static extern void ÌÎÏI(uint ÕÓÕÒ);

        [PreserveSig]
        [DllImport("advapi32.dll", EntryPoint = "RegQueryValueEx", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
        private static extern int ÎÍÎI(UIntPtr ÈEEÉ, string ËEÈÊ, int ÍÍÍI, ref uint ÓÕÖÖ, StringBuilder ÊËEÈ, ref uint ÕÔÔÔ);

        [PreserveSig]
        [DllImport("kernel32.dll", EntryPoint = "GetCurrentProcessId", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
        private static extern uint ÎÏÏÍ();

        [PreserveSig]
        [DllImport("kernel32.dll", EntryPoint = "IsDebuggerPresent", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
        private static extern bool ÏIÍI();

        [PreserveSig]
        [DllImport("kernel32.dll", EntryPoint = "CheckRemoteDebuggerPresent", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
        private static extern bool ÏIÍI(IntPtr ÈEEÉ, ref bool ÔÔOÓ);

        [PreserveSig]
        [DllImport("ntdll.dll", EntryPoint = "NtQueryInformationProcess", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
        private static extern int ÏÍÌI(IntPtr ÈEEÉ, uint ÌÌÌÌ, ref License.ÄÀÀÁ ÕÖÖÒ, int ÕÔÔÔ, ref uint ÔÖÓÕ);

        [PreserveSig]
        [DllImport("ntdll.dll", EntryPoint = "NtQueryInformationProcess", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
        private static extern int ÏÍÌI(IntPtr ÈEEÉ, uint ÌÌÌÌ, ref uint ÕÖÖÒ, int ÕÔÔÔ, ref uint ÔÖÓÕ);

        [PreserveSig]
        [DllImport("advapi32.dll", EntryPoint = "RegOpenKeyEx", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
        private static extern int ÏÏÏÎ(UIntPtr ÔÔÖÔ, string ËEÈÊ, int ÌÏÍÍ, int ÂÀÁÃ, ref UIntPtr ÈEEÉ);

        [PreserveSig]
        [DllImport("advapi32.dll", EntryPoint = "RegCloseKey", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
        private static extern int OÓÖÒ(UIntPtr ÈEEÉ);

        [PreserveSig]
        [DllImport("psapi.dll", EntryPoint = "GetProcessImageFileName", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
        private static extern uint ÒOÕO(IntPtr ÈEEÉ, StringBuilder ËEÈÊ, uint ÅÀAÃ);

        [PreserveSig]
        [DllImport("kernel32.dll", EntryPoint = "OpenProcess", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
        private static extern IntPtr ÕÖÖÖ(uint ÅÀÅÃ, bool ËÊÊË, uint AAÄÄ);

    } // class License

}

