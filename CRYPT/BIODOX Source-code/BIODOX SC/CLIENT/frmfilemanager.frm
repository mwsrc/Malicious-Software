VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmfilemanager 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   5760
   ClientLeft      =   4740
   ClientTop       =   1275
   ClientWidth     =   9375
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmfilemanager.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5760
   ScaleWidth      =   9375
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txttextoku 
      Appearance      =   0  'Flat
      Height          =   4335
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   23
      Top             =   5760
      Width           =   9135
   End
   Begin VB.Timer tmrkontrol 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   2280
      Top             =   600
   End
   Begin MSComctlLib.ImageList ilFilesIcons 
      Left            =   8040
      Top             =   600
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   36
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":000C
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":035E
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":06B0
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":0A02
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":0CC4
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":1016
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":1308
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":165A
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":196C
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":1CBE
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":1FD0
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":22B6
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":2608
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":291A
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":2BEC
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":2EDE
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":31F0
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":34D6
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":37E8
            Key             =   ""
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":3AFA
            Key             =   ""
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":3E4C
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":419E
            Key             =   ""
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":44C0
            Key             =   ""
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":4752
            Key             =   ""
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":4AA4
            Key             =   ""
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":4DF6
            Key             =   ""
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":5118
            Key             =   ""
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":543A
            Key             =   ""
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":563C
            Key             =   ""
         EndProperty
         BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":598E
            Key             =   ""
         EndProperty
         BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":5CE0
            Key             =   ""
         EndProperty
         BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":6032
            Key             =   ""
         EndProperty
         BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":6384
            Key             =   ""
         EndProperty
         BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":6916
            Key             =   ""
         EndProperty
         BeginProperty ListImage35 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":6EA8
            Key             =   ""
         EndProperty
         BeginProperty ListImage36 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmfilemanager.frx":7212
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwdrivers 
      Height          =   3735
      Left            =   120
      TabIndex        =   20
      Top             =   480
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   6588
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "ilFilesIcons"
      SmallIcons      =   "ilFilesIcons"
      ColHdrIcons     =   "ilFilesIcons"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      MousePointer    =   99
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Driver's"
         Object.Width           =   2117
      EndProperty
   End
   Begin VB.TextBox txtPath 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      Left            =   9480
      Locked          =   -1  'True
      TabIndex        =   19
      Top             =   2160
      Visible         =   0   'False
      Width           =   8655
   End
   Begin MSComctlLib.ListView lstFiles 
      Height          =   5175
      Left            =   2040
      TabIndex        =   18
      Top             =   480
      Width           =   6735
      _ExtentX        =   11880
      _ExtentY        =   9128
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      GridLines       =   -1  'True
      TextBackground  =   -1  'True
      _Version        =   393217
      Icons           =   "ilFilesIcons"
      SmallIcons      =   "ilFilesIcons"
      ColHdrIcons     =   "ilFilesIcons"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      MousePointer    =   99
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "File"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Type"
         Object.Width           =   2469
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Size"
         Object.Width           =   2469
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Attributes"
         Object.Width           =   2469
      EndProperty
   End
   Begin Client.cmd btn 
      Height          =   375
      Index           =   3
      Left            =   1560
      TabIndex        =   5
      ToolTipText     =   "Show Windows Folder"
      Top             =   2400
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":7654
      PICN            =   "frmfilemanager.frx":796E
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
      Height          =   375
      Index           =   2
      Left            =   1560
      TabIndex        =   4
      ToolTipText     =   "Show Documents Folder"
      Top             =   1920
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":7DF8
      PICN            =   "frmfilemanager.frx":8112
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd cikis 
      Height          =   300
      Left            =   9120
      TabIndex        =   0
      ToolTipText     =   "Close"
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
      MICON           =   "frmfilemanager.frx":8524
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
      Height          =   375
      Index           =   0
      Left            =   1560
      TabIndex        =   2
      ToolTipText     =   "Up"
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":883E
      PICN            =   "frmfilemanager.frx":8B58
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
      Height          =   375
      Index           =   1
      Left            =   1560
      TabIndex        =   3
      ToolTipText     =   "Show Desktop"
      Top             =   1440
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":8EAA
      PICN            =   "frmfilemanager.frx":91C4
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
      Height          =   375
      Index           =   4
      Left            =   1560
      TabIndex        =   6
      ToolTipText     =   "Show System Folder"
      Top             =   2880
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":9516
      PICN            =   "frmfilemanager.frx":9830
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
      Height          =   375
      Index           =   5
      Left            =   1560
      TabIndex        =   7
      ToolTipText     =   "Show Program Files Folder"
      Top             =   3360
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":9B82
      PICN            =   "frmfilemanager.frx":9E9C
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
      Height          =   375
      Index           =   6
      Left            =   1560
      TabIndex        =   8
      ToolTipText     =   "Show Startup Folder"
      Top             =   3840
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":A326
      PICN            =   "frmfilemanager.frx":A640
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
      Height          =   375
      Index           =   8
      Left            =   1560
      TabIndex        =   9
      ToolTipText     =   "Learn Drivers"
      Top             =   960
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":AACA
      PICN            =   "frmfilemanager.frx":ADE4
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
      Height          =   375
      Index           =   11
      Left            =   8880
      TabIndex        =   10
      ToolTipText     =   "Create New Folder"
      Top             =   960
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":B26E
      PICN            =   "frmfilemanager.frx":B588
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
      Height          =   375
      Index           =   12
      Left            =   8880
      TabIndex        =   11
      ToolTipText     =   "Delete File"
      Top             =   1440
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":B84A
      PICN            =   "frmfilemanager.frx":BB64
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
      Height          =   375
      Index           =   13
      Left            =   8880
      TabIndex        =   12
      ToolTipText     =   "Delete Folder"
      Top             =   1920
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":C02A
      PICN            =   "frmfilemanager.frx":C344
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
      Height          =   375
      Index           =   14
      Left            =   8880
      TabIndex        =   13
      ToolTipText     =   "Download File"
      Top             =   4320
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":CB76
      PICN            =   "frmfilemanager.frx":CE90
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
      Height          =   375
      Index           =   15
      Left            =   8880
      TabIndex        =   14
      ToolTipText     =   "Upload File"
      Top             =   4800
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":D76A
      PICN            =   "frmfilemanager.frx":DA84
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
      Height          =   375
      Index           =   16
      Left            =   8880
      TabIndex        =   15
      ToolTipText     =   "Rename File"
      Top             =   2400
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":E1DE
      PICN            =   "frmfilemanager.frx":E4F8
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
      Height          =   375
      Index           =   17
      Left            =   8880
      TabIndex        =   16
      ToolTipText     =   "Run File"
      Top             =   5280
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":EB7A
      PICN            =   "frmfilemanager.frx":EE94
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
      Height          =   375
      Index           =   19
      Left            =   8880
      TabIndex        =   17
      ToolTipText     =   "Refresh"
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":F266
      PICN            =   "frmfilemanager.frx":F580
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
      Height          =   375
      Index           =   7
      Left            =   8880
      TabIndex        =   21
      ToolTipText     =   "Show Text File"
      Top             =   2880
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":FABE
      PICN            =   "frmfilemanager.frx":FDD8
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
      Height          =   375
      Index           =   9
      Left            =   8880
      TabIndex        =   22
      ToolTipText     =   "Set Desktop Background"
      Top             =   3840
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":100AA
      PICN            =   "frmfilemanager.frx":103C4
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
      Height          =   375
      Index           =   10
      Left            =   120
      TabIndex        =   24
      ToolTipText     =   "Show Text Area"
      Top             =   5280
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":10806
      PICN            =   "frmfilemanager.frx":10B20
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
      Height          =   375
      Index           =   18
      Left            =   600
      TabIndex        =   25
      ToolTipText     =   "Hide Text Area"
      Top             =   5280
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":10E72
      PICN            =   "frmfilemanager.frx":1118C
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
      Height          =   375
      Index           =   20
      Left            =   1080
      TabIndex        =   26
      ToolTipText     =   "Save Text Area"
      Top             =   5280
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":114DE
      PICN            =   "frmfilemanager.frx":117F8
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
      Height          =   375
      Index           =   21
      Left            =   1560
      TabIndex        =   27
      ToolTipText     =   "Clear Text Area"
      Top             =   5280
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   0
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":11B4A
      PICN            =   "frmfilemanager.frx":11E64
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
      Height          =   375
      Index           =   22
      Left            =   8880
      TabIndex        =   28
      ToolTipText     =   "Show Text File"
      Top             =   3360
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
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
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frmfilemanager.frx":121B6
      PICN            =   "frmfilemanager.frx":124D0
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Label baslik 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "File Manager"
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
      TabIndex        =   1
      Top             =   0
      Width           =   9375
   End
End
Attribute VB_Name = "frmfilemanager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public inendosya As String
Dim eleman
Dim sCurrPAth As String
Dim Gecici As String
Dim sayac As Integer
Dim yer As Integer
Dim yer2 As Integer
Dim yeniyol As String
Dim hedefdosya As String
Dim hedefklasör As String
Dim yeniad As String
Dim sFile As String
Dim dosyaboyutu As String
Dim iptaledilecek As Integer

Private Sub baslik_MouseDown(Button As Integer, shift As Integer, x As Single, y As Single)
tasi Me
End Sub

Private Sub btn_Click(Index As Integer)
Select Case Index
    Case 0
        Gecici = sCurrPAth
            If Len(Gecici) > 3 Then
                For sayac = 1 To Len(Gecici)
                    yer = InStr(sayac, Gecici, "\")
                        If yer <> 0 Then yer2 = yer
                Next
                Gecici = Mid(Gecici, 1, yer2 - 1)
                BrowseFolder Gecici
            End If
            
    Case 1, 2, 3, 4, 5, 6
    frmana.bilgigonder "[SHORTYOL]" & Val(Index) - 1
    
    Case 7
    
    If Right(hedefdosya, 3) = "txt" Or Right(hedefdosya, 3) = "log" Then
        frmana.bilgigonder "[TEXTREAD]" & sCurrPAth & "\" & hedefdosya
    End If

    Case 8
        frmana.bilgigonder "[GETDRIVE]"
        lvwdrivers.ListItems.Clear
        lstFiles.ListItems.Clear
        
    Case 9
     If hedefdosya <> "" Then
        If Right(lstFiles.SelectedItem.Text, 3) = "jpg" Or Right(lstFiles.SelectedItem.Text, 3) = "bmp" Or Right(lstFiles.SelectedItem.Text, 3) = "gif" Then
            frmana.bilgigonder "[WALPAPER]" & sCurrPAth & "\" & hedefdosya
        End If
     End If
    
    Case 10
        Me.Height = 10245
    Case 11 'yeni klasor yaratýr
        frmana.bilgigonder "[MAKEADIR]" & sCurrPAth & Chr(255) & InputBox(frmana.dil.List(552), frmana.dil.List(553), frmana.dil.List(554))
    Case 12
        If hedefdosya <> "" Then frmana.bilgigonder "[GETKILFL]" & sCurrPAth & "\" & hedefdosya
        
    Case 13
        If hedefklasör <> "" Then frmana.bilgigonder "[KILFOLDR]" & sCurrPAth & "\" & hedefklasör
        
        
    Case 14 ' download file
        If hedefdosya <> "" Then
            If (VBGetSaveFileName(sFile, , , Right(hedefdosya, 3) & " files (*." & Right(hedefdosya, 3) & ")", , , , "", Me.hwnd)) Then
                frmana.lvwtransfer.ListItems.Add , , sCurrPAth & "\" & hedefdosya, , 48
                frmana.lvwtransfer.ListItems(frmana.lvwtransfer.ListItems.Count).SubItems(1) = sFile
                frmana.lvwtransfer.ListItems(frmana.lvwtransfer.ListItems.Count).SubItems(2) = lstFiles.SelectedItem.ListSubItems(2).Text
                frmana.lvwtransfer.ListItems(frmana.lvwtransfer.ListItems.Count).SubItems(3) = frmana.dil.List(560)
                frmana.lvwtransfer.ListItems(frmana.lvwtransfer.ListItems.Count).SubItems(4) = "D"
            End If
        End If
        
    Case 15 'uploadfile
        sFile = ""
        If VBGetOpenFileName(sFile, , True, , , , "All Files(*.*)|*.*", 1, , , "txt", Me.hwnd) Then
            If FileLen(sFile) > 0 Then
                frmana.lvwtransfer.ListItems.Add , , sFile, , 49
                If sCurrPAth <> "" Then
                    frmana.lvwtransfer.ListItems(frmana.lvwtransfer.ListItems.Count).SubItems(1) = sCurrPAth & "\" & adinigetir(sFile)
                Else
                    frmana.lvwtransfer.ListItems(frmana.lvwtransfer.ListItems.Count).SubItems(1) = adinigetir(sFile)
                End If
                frmana.lvwtransfer.ListItems(frmana.lvwtransfer.ListItems.Count).SubItems(2) = FormatKB(FileLen(sFile))
                frmana.lvwtransfer.ListItems(frmana.lvwtransfer.ListItems.Count).SubItems(3) = frmana.dil.List(560)
                frmana.lvwtransfer.ListItems(frmana.lvwtransfer.ListItems.Count).SubItems(4) = "U"
            Else
                frmana.hk 584
            End If
         End If
        
    Case 16 ' yeniden adlandýr.
        If hedefdosya <> "" Then
            yeniad = InputBox(frmana.dil.List(557), frmana.dil.List(558), hedefdosya)
            frmana.bilgigonder "[GETRENFL]" & sCurrPAth & "\" & hedefdosya & Chr(255) & sCurrPAth & "\" & yeniad
        End If
    
    Case 17 'çalýþtýr
        If hedefdosya <> "" Then frmana.bilgigonder "[SHELAPPL]" & sCurrPAth & "\" & hedefdosya & Chr(255)
    
    Case 19
        If Len(sCurrPAth) > 1 Then BrowseFolder sCurrPAth & "\"
        
        
Case 18
Me.Height = 5790


Case 20
    sFile = "okunan.txt"
        If (VBGetSaveFileName(sFile, , , "Text files (*.txt)", , , , "", Me.hwnd)) Then
            Open sFile For Append As #1
                Print #1, txttextoku.Text
            Close #1
        End If
Case 21
    txttextoku.Text = ""

Case 22
    If Right(hedefdosya, 3) = "doc" Then
        frmana.bilgigonder "[TEXTREAD]" & sCurrPAth & "\" & hedefdosya
    End If
End Select
Exit Sub
hata:
End Sub

Private Sub btn_MouseMove(Index As Integer, Button As Integer, shift As Integer, x As Single, y As Single)
frmana.lbl(0).Caption = btn(Index).ToolTipText
End Sub

Private Sub cikis_Click()
Me.Hide
End Sub

Private Sub Form_Load()
tasi Me
SaydamYap Me, 240
aktiftransferwar = False

hHeader = SendMessageLong(lstFiles.hwnd, LVM_GETHEADER, 0, ByVal 0&)
Style = GetWindowLong(hHeader, GWL_STYLE)
Style = Style Xor HDS_BUTTONS
If Style Then
r = SetWindowLong(hHeader, GWL_STYLE, Style)
r = SetWindowPos(lstFiles.hwnd, Me.hwnd, 0, 0, 0, 0, SWP_FLAGS)
End If
lstFiles.MouseIcon = cikis.MouseIcon

hHeader = SendMessageLong(lvwdrivers.hwnd, LVM_GETHEADER, 0, ByVal 0&)
Style = GetWindowLong(hHeader, GWL_STYLE)
Style = Style Xor HDS_BUTTONS
If Style Then
r = SetWindowLong(hHeader, GWL_STYLE, Style)
r = SetWindowPos(lvwdrivers.hwnd, Me.hwnd, 0, 0, 0, 0, SWP_FLAGS)
End If
lvwdrivers.MouseIcon = cikis.MouseIcon

 

End Sub
Private Sub Form_MouseDown(Button As Integer, shift As Integer, x As Single, y As Single)
tasi Me
End Sub

Private Sub lstFiles_BeforeLabelEdit(Cancel As Integer)
Cancel = 1
End Sub

Private Sub lstFiles_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
 lstFiles.Sorted = True
 lstFiles.SortKey = ColumnHeader.Index - 1
 lstFiles.SortOrder = (lstFiles.SortOrder + 1) Mod 2
End Sub

Private Sub lstFiles_DblClick()
If lstFiles.ListItems.Count > 0 Then If lstFiles.SelectedItem.SubItems(1) = "File Folder" Then BrowseFolder sCurrPAth & "\" & lstFiles.SelectedItem.Text
End Sub

Public Sub BrowseFolder(sPath As String)
On Error Resume Next
    lstFiles.ListItems.Clear
    frmana.bilgigonder "[GETFILES]" & sPath
    sCurrPAth = sPath
    txtPath = sPath
End Sub

Private Sub lstFiles_ItemClick(ByVal Item As MSComctlLib.ListItem)
    If Mid(Right(Item.Text, 4), 1, 1) = "." Then
        hedefdosya = Item.Text
        dosyaboyutu = Item.SubItems(2)
        hedefklasör = ""
    Else
        hedefklasör = Item.Text
        hedefdosya = ""
    End If
End Sub

Private Sub lvwdrivers_BeforeLabelEdit(Cancel As Integer)
Cancel = 1
End Sub

Private Sub lvwdrivers_DblClick()
    On Local Error Resume Next
    BrowseFolder Left(lvwdrivers.SelectedItem.Text, 2)
    hedefklasör = Left(lvwdrivers.SelectedItem.Text, 2)
    sCurrPAth = hedefklasör
End Sub

Function adinigetir(ref3$) As String
         Dim ref1%, ref2%
         adinigetir$ = ref3$
         ref1% = InStr(ref3$, "\")
         Do While ref1%
                  ref2% = ref1%
                 ref1% = InStr(ref2% + 1, ref3$, "\")
         Loop
         If ref2% > 0 Then adinigetir$ = Mid$(ref3$, ref2% + 1)
End Function

