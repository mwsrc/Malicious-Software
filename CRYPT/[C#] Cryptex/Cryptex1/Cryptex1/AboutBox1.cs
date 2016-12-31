
using System;
using System.ComponentModel;
using System.Drawing;
using System.IO;
using System.Reflection;
using System.Windows.Forms;
namespace Cryptex1
{
    internal class AboutBox1 : Form
    {
        private IContainer icontainer_0;
        private Control2 txtInfo;
        private Control12 muButton1;
        private Control3 deumosSeperator1;
        private Control3 deumosSeperator2;
        private Control3 deumosSeperator3;
        private Control9 deumosGroupBox1;
        public string String_0
        {
            get
            {
                object[] customAttributes = System.Reflection.Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(System.Reflection.AssemblyTitleAttribute), false);
                if (customAttributes.Length > 0)
                {
                    System.Reflection.AssemblyTitleAttribute assemblyTitleAttribute = (System.Reflection.AssemblyTitleAttribute)customAttributes[0];
                    if (assemblyTitleAttribute.Title != "")
                    {
                        return assemblyTitleAttribute.Title;
                    }
                }
                return System.IO.Path.GetFileNameWithoutExtension(System.Reflection.Assembly.GetExecutingAssembly().CodeBase);
            }
        }
        public string String_1
        {
            get
            {
                return System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString();
            }
        }
        public string String_2
        {
            get
            {
                object[] customAttributes = System.Reflection.Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(System.Reflection.AssemblyDescriptionAttribute), false);
                if (customAttributes.Length == 0)
                {
                    return "";
                }
                return ((System.Reflection.AssemblyDescriptionAttribute)customAttributes[0]).Description;
            }
        }
        public string String_3
        {
            get
            {
                object[] customAttributes = System.Reflection.Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(System.Reflection.AssemblyProductAttribute), false);
                if (customAttributes.Length == 0)
                {
                    return "";
                }
                return ((System.Reflection.AssemblyProductAttribute)customAttributes[0]).Product;
            }
        }
        public string String_4
        {
            get
            {
                object[] customAttributes = System.Reflection.Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(System.Reflection.AssemblyCopyrightAttribute), false);
                if (customAttributes.Length == 0)
                {
                    return "";
                }
                return ((System.Reflection.AssemblyCopyrightAttribute)customAttributes[0]).Copyright;
            }
        }
        public string String_5
        {
            get
            {
                object[] customAttributes = System.Reflection.Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(System.Reflection.AssemblyCompanyAttribute), false);
                if (customAttributes.Length == 0)
                {
                    return "";
                }
                return ((System.Reflection.AssemblyCompanyAttribute)customAttributes[0]).Company;
            }
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing && this.icontainer_0 != null)
            {
                this.icontainer_0.Dispose();
            }
            base.Dispose(disposing);
        }
        private void InitializeComponent()
        {
            Class0 @class = new Class0();
            Class0 class2 = new Class0();
            Class0 class3 = new Class0();
            Class0 class4 = new Class0();
            Class0 class5 = new Class0();
            Class0 class6 = new Class0();
            Class0 class7 = new Class0();
            Class0 class8 = new Class0();
            Class0 class9 = new Class0();
            Class0 class10 = new Class0();
            Class0 class11 = new Class0();
            Class0 class12 = new Class0();
            Class0 class13 = new Class0();
            Class0 class14 = new Class0();
            Class0 class15 = new Class0();
            Class0 class16 = new Class0();
            Class0 class17 = new Class0();
            Class0 class18 = new Class0();
            Class0 class19 = new Class0();
            this.deumosSeperator1 = new Control3();
            this.deumosSeperator3 = new Control3();
            this.deumosSeperator2 = new Control3();
            this.muButton1 = new Control12();
            this.txtInfo = new Control2();
            this.deumosGroupBox1 = new Control9();
            this.deumosGroupBox1.SuspendLayout();
            base.SuspendLayout();
            @class.String_0 = "Line1";
            @class.Color_0 = Color.Black;
            class2.String_0 = "Line2";
            class2.Color_0 = Color.FromArgb(22, 22, 22);
            this.deumosSeperator1.Class0_0 = new Class0[]
           {
               @class, 
               class2
           };
            this.deumosSeperator1.String_0 = "AAAA/xYWFv8=";
            this.deumosSeperator1.Font = new Font("Verdana", 8f);
            this.deumosSeperator1.Image_0 = null;
            this.deumosSeperator1.Location = new Point(0, 157);
            this.deumosSeperator1.Name = "deumosSeperator1";
            this.deumosSeperator1.Boolean_0 = false;
            this.deumosSeperator1.Orientation_0 = Orientation.Horizontal;
            this.deumosSeperator1.Size = new Size(434, 14);
            this.deumosSeperator1.TabIndex = 2;
            this.deumosSeperator1.Text = "deumosSeperator1";
            this.deumosSeperator1.Boolean_1 = false;
            class3.String_0 = "Line1";
            class3.Color_0 = Color.Black;
            class4.String_0 = "Line2";
            class4.Color_0 = Color.FromArgb(22, 22, 22);
            this.deumosSeperator3.Class0_0 = new Class0[]
           {
               class3, 
               class4
           };
            this.deumosSeperator3.String_0 = "AAAA/xYWFv8=";
            this.deumosSeperator3.Font = new Font("Verdana", 8f);
            this.deumosSeperator3.Image_0 = null;
            this.deumosSeperator3.Location = new Point(-4, 124);
            this.deumosSeperator3.Name = "deumosSeperator3";
            this.deumosSeperator3.Boolean_0 = false;
            this.deumosSeperator3.Orientation_0 = Orientation.Vertical;
            this.deumosSeperator3.Size = new Size(14, 42);
            this.deumosSeperator3.TabIndex = 4;
            this.deumosSeperator3.Text = "deumosSeperator3";
            this.deumosSeperator3.Boolean_1 = false;
            class5.String_0 = "Line1";
            class5.Color_0 = Color.Black;
            class6.String_0 = "Line2";
            class6.Color_0 = Color.FromArgb(22, 22, 22);
            this.deumosSeperator2.Class0_0 = new Class0[]
           {
               class5, 
               class6
           };
            this.deumosSeperator2.String_0 = "AAAA/xYWFv8=";
            this.deumosSeperator2.Font = new Font("Verdana", 8f);
            this.deumosSeperator2.Image_0 = null;
            this.deumosSeperator2.Location = new Point(426, 124);
            this.deumosSeperator2.Name = "deumosSeperator2";
            this.deumosSeperator2.Boolean_0 = false;
            this.deumosSeperator2.Orientation_0 = Orientation.Vertical;
            this.deumosSeperator2.Size = new Size(14, 42);
            this.deumosSeperator2.TabIndex = 3;
            this.deumosSeperator2.Text = "deumosSeperator2";
            this.deumosSeperator2.Boolean_1 = false;
            this.muButton1.Image_0 = null;
            this.muButton1.Location = new Point(150, 7);
            this.muButton1.Name = "muButton1";
            this.muButton1.Boolean_0 = false;
            this.muButton1.Size = new Size(142, 23);
            this.muButton1.TabIndex = 1;
            this.muButton1.Text = "Ok";
            this.muButton1.Click += new System.EventHandler(this.muButton1_Click);
            class7.String_0 = "Text";
            class7.Color_0 = Color.White;
            class8.String_0 = "Back";
            class8.Color_0 = Color.FromArgb(14, 14, 14);
            class9.String_0 = "Border1";
            class9.Color_0 = Color.Black;
            class10.String_0 = "Border2";
            class10.Color_0 = Color.FromArgb(30, 30, 30);
            this.txtInfo.Class0_0 = new Class0[]
           {
               class7, 
               class8, 
               class9, 
               class10
           };
            this.txtInfo.String_0 = "/////w4ODv8AAAD/Hh4e/w==";
            this.txtInfo.Font = new Font("Verdana", 8f);
            this.txtInfo.Image_0 = null;
            this.txtInfo.Location = new Point(0, 1);
            this.txtInfo.Int32_2 = 32767;
            this.txtInfo.Boolean_4 = true;
            this.txtInfo.Name = "txtInfo";
            this.txtInfo.Boolean_0 = false;
            this.txtInfo.Boolean_2 = true;
            this.txtInfo.Size = new Size(434, 122);
            this.txtInfo.TabIndex = 0;
            this.txtInfo.HorizontalAlignment_0 = HorizontalAlignment.Center;
            this.txtInfo.Boolean_1 = false;
            this.txtInfo.Boolean_3 = false;
            this.deumosGroupBox1.BackColor = Color.FromArgb(20, 20, 20);
            this.deumosGroupBox1.FormBorderStyle_0 = FormBorderStyle.None;
            class11.String_0 = "Back";
            class11.Color_0 = Color.FromArgb(14, 14, 14);
            class12.String_0 = "MainFill";
            class12.Color_0 = Color.FromArgb(20, 20, 20);
            class13.String_0 = "MainOutline1";
            class13.Color_0 = Color.FromArgb(32, 32, 32);
            class14.String_0 = "MainOutline2";
            class14.Color_0 = Color.Black;
            class15.String_0 = "TitleShadow";
            class15.Color_0 = Color.FromArgb(50, 0, 0, 0);
            class16.String_0 = "TitleFill";
            class16.Color_0 = Color.FromArgb(20, 20, 20);
            class17.String_0 = "Text";
            class17.Color_0 = Color.White;
            class18.String_0 = "TitleOutline1";
            class18.Color_0 = Color.FromArgb(32, 32, 32);
            class19.String_0 = "TitleOutline2";
            class19.Color_0 = Color.Black;
            this.deumosGroupBox1.Class0_0 = new Class0[]
           {
               class11, 
               class12, 
               class13, 
               class14, 
               class15, 
               class16, 
               class17, 
               class18, 
               class19
           };
            this.deumosGroupBox1.Controls.Add(this.muButton1);
            this.deumosGroupBox1.String_0 = "Dg4O/xQUFP8gICD/AAAA/wAAADIUFBT//////yAgIP8AAAD/";
            this.deumosGroupBox1.Font = new Font("Verdana", 8f);
            this.deumosGroupBox1.Image_0 = null;
            this.deumosGroupBox1.Location = new Point(0, 124);
            this.deumosGroupBox1.Boolean_0 = true;
            this.deumosGroupBox1.Name = "deumosGroupBox1";
            this.deumosGroupBox1.Boolean_3 = false;
            this.deumosGroupBox1.Boolean_1 = true;
            this.deumosGroupBox1.Size = new Size(434, 42);
            this.deumosGroupBox1.TabIndex = 5;
            this.deumosGroupBox1.Color_0 = Color.Empty;
            base.AutoScaleMode = AutoScaleMode.None;
            this.BackColor = Color.FromArgb(14, 14, 14);
            base.ClientSize = new Size(435, 166);
            base.ControlBox = false;
            base.Controls.Add(this.deumosGroupBox1);
            base.Controls.Add(this.deumosSeperator1);
            base.Controls.Add(this.deumosSeperator3);
            base.Controls.Add(this.deumosSeperator2);
            base.Controls.Add(this.txtInfo);
            base.FormBorderStyle = FormBorderStyle.None;
            base.MaximizeBox = false;
            base.MinimizeBox = false;
            base.Name = "AboutBox1";
            base.Padding = new Padding(9);
            base.ShowIcon = false;
            base.ShowInTaskbar = false;
            base.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "AboutBox1";
            this.deumosGroupBox1.ResumeLayout(false);
            base.ResumeLayout(false);
        }
        public AboutBox1()
        {
            this.InitializeComponent();
        }
        public void method_0(string string_0)
        {
            this.txtInfo.Text = string_0;
        }
        private void muButton1_Click(object sender, System.EventArgs e)
        {
            base.Close();
        }
    }
}
