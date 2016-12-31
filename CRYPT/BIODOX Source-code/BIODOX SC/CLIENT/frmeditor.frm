VERSION 5.00
Begin VB.Form frmeditor 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   5070
   ClientLeft      =   225
   ClientTop       =   1380
   ClientWidth     =   4335
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmeditor.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5070
   ScaleWidth      =   4335
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame frm 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Connection Delay"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   615
      Index           =   7
      Left            =   120
      TabIndex        =   32
      Top             =   4320
      Width           =   1455
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   11
         Left            =   840
         TabIndex        =   33
         Text            =   "10"
         Top             =   240
         Width           =   495
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         BackColor       =   &H00000080&
         BackStyle       =   0  'Transparent
         Caption         =   "Delay :"
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
         Height          =   270
         Index           =   4
         Left            =   120
         TabIndex        =   34
         Top             =   240
         Width           =   1335
      End
   End
   Begin VB.Frame frm 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Registry Settings"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   975
      Index           =   5
      Left            =   120
      TabIndex        =   21
      Top             =   3240
      Width           =   1455
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   7
         Left            =   120
         TabIndex        =   23
         Text            =   "mscsrss32.exe"
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   6
         Left            =   120
         TabIndex        =   22
         Text            =   "mscsrss32"
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.Frame frm 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Server Mode"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   4
      Left            =   120
      TabIndex        =   18
      Top             =   2400
      Width           =   1455
      Begin VB.OptionButton servermode 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Invisible"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   1
         Left            =   120
         TabIndex        =   20
         Top             =   480
         Value           =   -1  'True
         Width           =   975
      End
      Begin VB.OptionButton servermode 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Visible"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   0
         Left            =   120
         TabIndex        =   19
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame frm 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Port Settings"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1695
      Index           =   3
      Left            =   1680
      TabIndex        =   9
      Top             =   1080
      Width           =   2535
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   5
         Left            =   1560
         TabIndex        =   16
         Text            =   "6663"
         Top             =   1320
         Width           =   855
      End
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   4
         Left            =   1560
         TabIndex        =   14
         Text            =   "6662"
         Top             =   960
         Width           =   855
      End
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   3
         Left            =   1560
         TabIndex        =   12
         Text            =   "6661"
         Top             =   600
         Width           =   855
      End
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   2
         Left            =   1560
         TabIndex        =   10
         Text            =   "6660"
         Top             =   240
         Width           =   855
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         BackColor       =   &H00000080&
         BackStyle       =   0  'Transparent
         Caption         =   "Webcam Capture"
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
         Height          =   270
         Index           =   3
         Left            =   120
         TabIndex        =   17
         Top             =   1320
         Width           =   1335
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         BackColor       =   &H00000080&
         BackStyle       =   0  'Transparent
         Caption         =   "Screen Capture"
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
         Height          =   270
         Index           =   1
         Left            =   120
         TabIndex        =   15
         Top             =   960
         Width           =   1215
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         BackColor       =   &H00000080&
         BackStyle       =   0  'Transparent
         Caption         =   "Transfer "
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
         Height          =   270
         Index           =   0
         Left            =   120
         TabIndex        =   13
         Top             =   600
         Width           =   1095
      End
      Begin VB.Label lbl 
         Appearance      =   0  'Flat
         BackColor       =   &H00000080&
         BackStyle       =   0  'Transparent
         Caption         =   "Connection"
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
         Height          =   270
         Index           =   2
         Left            =   120
         TabIndex        =   11
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.Frame frm 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "IP / DNS"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   615
      Index           =   2
      Left            =   1680
      TabIndex        =   7
      Top             =   360
      Width           =   2535
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   1
         Left            =   120
         TabIndex        =   8
         Text            =   "127.0.0.1"
         Top             =   240
         Width           =   2295
      End
   End
   Begin VB.Frame frm 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Victim Name"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   615
      Index           =   1
      Left            =   120
      TabIndex        =   5
      Top             =   1680
      Width           =   1455
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   0
         Left            =   120
         TabIndex        =   6
         Text            =   "lamer"
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.Frame frm 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Icon Settings"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1215
      Index           =   0
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   1455
      Begin Client.cmd btn 
         Height          =   375
         Index           =   0
         Left            =   840
         TabIndex        =   2
         ToolTipText     =   "Durumu Aktif Veya Deaktif Olarak Deðiþtir"
         Top             =   720
         Width           =   495
         _ExtentX        =   873
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
         MICON           =   "frmeditor.frx":000C
         PICN            =   "frmeditor.frx":0326
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
         Left            =   840
         TabIndex        =   3
         ToolTipText     =   "Durumu Aktif Veya Deaktif Olarak Deðiþtir"
         Top             =   240
         Width           =   495
         _ExtentX        =   873
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
         MICON           =   "frmeditor.frx":0828
         PICN            =   "frmeditor.frx":0B42
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Image simge 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   495
         Index           =   0
         Left            =   120
         Top             =   240
         Width           =   615
      End
   End
   Begin Client.cmd cikis 
      Height          =   300
      Left            =   4080
      TabIndex        =   4
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
      BCOL            =   128
      BCOLO           =   128
      FCOL            =   0
      FCOLO           =   16777215
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmeditor.frx":1044
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Frame frm 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Show Message"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1455
      Index           =   6
      Left            =   1680
      TabIndex        =   24
      Top             =   2880
      Width           =   2535
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   9
         Left            =   120
         TabIndex        =   26
         Text            =   "message text"
         Top             =   600
         Width           =   2295
      End
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   8
         Left            =   120
         TabIndex        =   25
         Text            =   "msg title"
         Top             =   240
         Width           =   1215
      End
      Begin Client.cmd mesajicon 
         Height          =   375
         Index           =   0
         Left            =   120
         TabIndex        =   27
         ToolTipText     =   "Durumu Aktif Veya Deaktif Olarak Deðiþtir"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
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
         MICON           =   "frmeditor.frx":135E
         PICN            =   "frmeditor.frx":1678
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd mesajicon 
         Height          =   375
         Index           =   1
         Left            =   720
         TabIndex        =   28
         ToolTipText     =   "Durumu Aktif Veya Deaktif Olarak Deðiþtir"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
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
         MICON           =   "frmeditor.frx":1B7A
         PICN            =   "frmeditor.frx":1E94
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd mesajicon 
         Height          =   375
         Index           =   2
         Left            =   1320
         TabIndex        =   29
         ToolTipText     =   "Durumu Aktif Veya Deaktif Olarak Deðiþtir"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
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
         MICON           =   "frmeditor.frx":2396
         PICN            =   "frmeditor.frx":26B0
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd mesajicon 
         Height          =   375
         Index           =   3
         Left            =   1920
         TabIndex        =   30
         ToolTipText     =   "Durumu Aktif Veya Deaktif Olarak Deðiþtir"
         Top             =   960
         Width           =   495
         _ExtentX        =   873
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
         MICON           =   "frmeditor.frx":2BB2
         PICN            =   "frmeditor.frx":2ECC
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   -1  'True
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin Client.cmd mesajicon 
         Height          =   285
         Index           =   4
         Left            =   1440
         TabIndex        =   31
         ToolTipText     =   "Test"
         Top             =   240
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   503
         BTYPE           =   3
         TX              =   "Test It"
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
         MICON           =   "frmeditor.frx":33CE
         PICN            =   "frmeditor.frx":36E8
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
   Begin Client.cmd mesajicon 
      Height          =   495
      Index           =   5
      Left            =   3600
      TabIndex        =   35
      ToolTipText     =   "Durumu Aktif Veya Deaktif Olarak Deðiþtir"
      Top             =   4440
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
      MICON           =   "frmeditor.frx":3BEA
      PICN            =   "frmeditor.frx":3F04
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
      Caption         =   "Server Editor"
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
      TabIndex        =   0
      Top             =   0
      Width           =   4335
   End
End
Attribute VB_Name = "frmeditor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub baslik_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
tasi Me
End Sub

Private Sub Form_Load()
SaydamYap Me, 230
End Sub
