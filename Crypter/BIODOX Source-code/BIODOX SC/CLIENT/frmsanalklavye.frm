VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmsanalklavye 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   3135
   ClientLeft      =   225
   ClientTop       =   1380
   ClientWidth     =   13080
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3135
   ScaleWidth      =   13080
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin Client.cmd geri 
      Height          =   255
      Left            =   12840
      TabIndex        =   1
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
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
      MICON           =   "frmsanalklavye.frx":0000
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin MSComctlLib.ListView pencere 
      Height          =   2295
      Left            =   120
      TabIndex        =   2
      Top             =   750
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   4048
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      MousePointer    =   99
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "App Name :"
         Object.Width           =   2593
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "PID"
         Object.Width           =   176
      EndProperty
   End
   Begin Client.cmd listeyiyenile 
      Height          =   330
      Left            =   120
      TabIndex        =   3
      Top             =   360
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "  Refresh List  "
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":031A
      PICN            =   "frmsanalklavye.frx":0634
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd ESC 
      Height          =   330
      Left            =   1920
      TabIndex        =   4
      Top             =   480
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "ESC"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":0906
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd fonk1 
      Height          =   330
      Index           =   0
      Left            =   3000
      TabIndex        =   5
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "F1"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":0C20
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd fonk1 
      Height          =   330
      Index           =   1
      Left            =   3480
      TabIndex        =   6
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "F2"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":0F3A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd fonk1 
      Height          =   330
      Index           =   2
      Left            =   3960
      TabIndex        =   7
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "F3"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":1254
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd fonk1 
      Height          =   330
      Index           =   3
      Left            =   4440
      TabIndex        =   8
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "F4"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":156E
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd fonk1 
      Height          =   330
      Index           =   4
      Left            =   5160
      TabIndex        =   9
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "F5"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":1888
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd fonk1 
      Height          =   330
      Index           =   5
      Left            =   5640
      TabIndex        =   10
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "F6"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":1BA2
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd fonk1 
      Height          =   330
      Index           =   6
      Left            =   6120
      TabIndex        =   11
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "F7"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":1EBC
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd fonk1 
      Height          =   330
      Index           =   7
      Left            =   6600
      TabIndex        =   12
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "F8"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":21D6
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd fonk1 
      Height          =   330
      Index           =   8
      Left            =   7320
      TabIndex        =   13
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "F9"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":24F0
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd fonk1 
      Height          =   330
      Index           =   9
      Left            =   7800
      TabIndex        =   14
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "F10"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":280A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd fonk1 
      Height          =   330
      Index           =   10
      Left            =   8280
      TabIndex        =   15
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "F11"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":2B24
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd fonk1 
      Height          =   330
      Index           =   11
      Left            =   8760
      TabIndex        =   16
      Top             =   480
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "F12"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":2E3E
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd islevler 
      Height          =   330
      Index           =   0
      Left            =   9480
      TabIndex        =   17
      Top             =   480
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "print"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":3158
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd islevler 
      Height          =   330
      Index           =   1
      Left            =   10080
      TabIndex        =   18
      Top             =   480
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "SL"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":3472
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd islevler 
      Height          =   330
      Index           =   2
      Left            =   10680
      TabIndex        =   19
      Top             =   480
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "pause"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":378C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd islevler 
      Height          =   330
      Index           =   3
      Left            =   9480
      TabIndex        =   20
      Top             =   840
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "insert"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":3AA6
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd islevler 
      Height          =   330
      Index           =   4
      Left            =   10080
      TabIndex        =   21
      Top             =   840
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "home"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":3DC0
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd islevler 
      Height          =   330
      Index           =   5
      Left            =   10680
      TabIndex        =   22
      Top             =   840
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "pageu"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":40DA
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd islevler 
      Height          =   330
      Index           =   6
      Left            =   9480
      TabIndex        =   23
      Top             =   1200
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "delete"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":43F4
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd islevler 
      Height          =   330
      Index           =   7
      Left            =   10080
      TabIndex        =   24
      Top             =   1200
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "end"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":470E
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd islevler 
      Height          =   330
      Index           =   8
      Left            =   10680
      TabIndex        =   25
      Top             =   1200
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "paged"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":4A28
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd islevler 
      Height          =   330
      Index           =   9
      Left            =   9480
      TabIndex        =   26
      Top             =   1560
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "power"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":4D42
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd islevler 
      Height          =   330
      Index           =   10
      Left            =   10080
      TabIndex        =   27
      Top             =   1560
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "wake"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":505C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd islevler 
      Height          =   330
      Index           =   11
      Left            =   10680
      TabIndex        =   28
      Top             =   1560
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "sleep"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":5376
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd yön 
      Height          =   330
      Index           =   2
      Left            =   10080
      TabIndex        =   29
      Top             =   2550
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   ""
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":5690
      PICN            =   "frmsanalklavye.frx":59AA
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd yön 
      Height          =   330
      Index           =   1
      Left            =   9480
      TabIndex        =   30
      Top             =   2550
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   ""
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":5D5C
      PICN            =   "frmsanalklavye.frx":6076
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd yön 
      Height          =   330
      Index           =   3
      Left            =   10680
      TabIndex        =   31
      Top             =   2550
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   ""
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":6470
      PICN            =   "frmsanalklavye.frx":678A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd yön 
      Height          =   330
      Index           =   0
      Left            =   10080
      TabIndex        =   32
      Top             =   2160
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   ""
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":6B84
      PICN            =   "frmsanalklavye.frx":6E9E
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd enter 
      Height          =   690
      Index           =   1
      Left            =   12600
      TabIndex        =   36
      Top             =   2160
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   1217
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":7250
      PICN            =   "frmsanalklavye.frx":756A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sayisal 
      Height          =   330
      Index           =   0
      Left            =   11520
      TabIndex        =   37
      Top             =   2520
      Width           =   675
      _ExtentX        =   1191
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "0"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":7CC4
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sayisal 
      Height          =   330
      Index           =   1
      Left            =   11520
      TabIndex        =   38
      Top             =   2160
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "1"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":7FDE
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sayisal 
      Height          =   330
      Index           =   2
      Left            =   11880
      TabIndex        =   39
      Top             =   2160
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "2"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":82F8
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sayisal 
      Height          =   330
      Index           =   3
      Left            =   12240
      TabIndex        =   40
      Top             =   2160
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "3"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":8612
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sayisal 
      Height          =   330
      Index           =   4
      Left            =   11520
      TabIndex        =   41
      Top             =   1800
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "4"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":892C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sayisal 
      Height          =   330
      Index           =   5
      Left            =   11880
      TabIndex        =   42
      Top             =   1800
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "5"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":8C46
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sayisal 
      Height          =   330
      Index           =   6
      Left            =   12240
      TabIndex        =   43
      Top             =   1800
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "6"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":8F60
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sayisal 
      Height          =   330
      Index           =   7
      Left            =   11520
      TabIndex        =   44
      Top             =   1440
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "7"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":927A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sayisal 
      Height          =   330
      Index           =   8
      Left            =   11880
      TabIndex        =   45
      Top             =   1440
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "8"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":9594
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sayisal 
      Height          =   330
      Index           =   9
      Left            =   12240
      TabIndex        =   46
      Top             =   1440
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "9"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":98AE
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd num 
      Height          =   330
      Left            =   11520
      TabIndex        =   47
      Top             =   1080
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "NM"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":9BC8
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd özel 
      Height          =   330
      Index           =   0
      Left            =   11880
      TabIndex        =   48
      Top             =   1080
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "/"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":9EE2
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd özel 
      Height          =   330
      Index           =   1
      Left            =   12240
      TabIndex        =   49
      Top             =   1080
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "*"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":A1FC
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd özel 
      Height          =   330
      Index           =   2
      Left            =   12600
      TabIndex        =   50
      Top             =   1080
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "-"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":A516
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd özel 
      Height          =   690
      Index           =   3
      Left            =   12600
      TabIndex        =   51
      Top             =   1440
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   1217
      BTYPE           =   14
      TX              =   "+"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":A830
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd özel 
      Height          =   330
      Index           =   4
      Left            =   12240
      TabIndex        =   52
      Top             =   2520
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   ","
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":AB4A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd Boþluk 
      Height          =   330
      Left            =   3960
      TabIndex        =   53
      Top             =   2520
      Width           =   3135
      _ExtentX        =   5530
      _ExtentY        =   582
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":AE64
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd winkey 
      Height          =   330
      Index           =   0
      Left            =   2640
      TabIndex        =   54
      Top             =   2520
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":B17E
      PICN            =   "frmsanalklavye.frx":B498
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd winkey 
      Height          =   330
      Index           =   1
      Left            =   7920
      TabIndex        =   55
      Top             =   2520
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":B922
      PICN            =   "frmsanalklavye.frx":BC3C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd enter 
      Height          =   690
      Index           =   0
      Left            =   8280
      TabIndex        =   56
      Top             =   1440
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   1217
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":C0C6
      PICN            =   "frmsanalklavye.frx":C3E0
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd turbo 
      Height          =   330
      Left            =   7920
      TabIndex        =   57
      Top             =   2160
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "turbo"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":CEB2
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd capslock 
      Height          =   330
      Left            =   1920
      TabIndex        =   58
      Top             =   1800
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "Caps Lock"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":D1CC
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd shift 
      Height          =   330
      Index           =   0
      Left            =   1920
      TabIndex        =   59
      Top             =   2160
      Width           =   615
      _ExtentX        =   1720
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "Shift"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":D4E6
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd shift 
      Height          =   330
      Index           =   1
      Left            =   8520
      TabIndex        =   60
      Top             =   2160
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "Shift"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":D800
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd ctrl 
      Height          =   330
      Index           =   0
      Left            =   1920
      TabIndex        =   61
      Top             =   2520
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "Ctrl"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":DB1A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd ctrl 
      Height          =   330
      Index           =   1
      Left            =   8520
      TabIndex        =   62
      Top             =   2520
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "Ctrl"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":DE34
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd alt 
      Height          =   330
      Left            =   3240
      TabIndex        =   63
      Top             =   2520
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "Alt"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":E14E
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd altgr 
      Height          =   330
      Left            =   7200
      TabIndex        =   64
      Top             =   2520
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "Alt Gr"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":E468
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sira2 
      Height          =   330
      Index           =   0
      Left            =   1920
      TabIndex        =   65
      Top             =   1080
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   """"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":E782
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sira2 
      Height          =   330
      Index           =   1
      Left            =   2400
      TabIndex        =   66
      Top             =   1080
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "!"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":EA9C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sira2 
      Height          =   330
      Index           =   2
      Left            =   2880
      TabIndex        =   67
      Top             =   1080
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "'"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":EDB6
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sira2 
      Height          =   330
      Index           =   3
      Left            =   3360
      TabIndex        =   68
      Top             =   1080
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "^"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":F0D0
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sira2 
      Height          =   330
      Index           =   4
      Left            =   3840
      TabIndex        =   69
      Top             =   1080
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "+"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":F3EA
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sira2 
      Height          =   330
      Index           =   5
      Left            =   4320
      TabIndex        =   70
      Top             =   1080
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "%"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":F704
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sira2 
      Height          =   330
      Index           =   6
      Left            =   4800
      TabIndex        =   71
      Top             =   1080
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "&&"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":FA1E
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sira2 
      Height          =   330
      Index           =   7
      Left            =   5280
      TabIndex        =   72
      Top             =   1080
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "/"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":FD38
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sira2 
      Height          =   330
      Index           =   8
      Left            =   5760
      TabIndex        =   73
      Top             =   1080
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "("
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":10052
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sira2 
      Height          =   330
      Index           =   9
      Left            =   6240
      TabIndex        =   74
      Top             =   1080
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   ")"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":1036C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sira2 
      Height          =   330
      Index           =   10
      Left            =   6720
      TabIndex        =   75
      Top             =   1080
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "="
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":10686
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sira2 
      Height          =   330
      Index           =   11
      Left            =   7200
      TabIndex        =   76
      Top             =   1080
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "?"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":109A0
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sira2 
      Height          =   330
      Index           =   12
      Left            =   7680
      TabIndex        =   77
      Top             =   1080
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "-"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":10CBA
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd sira2 
      Height          =   330
      Index           =   13
      Left            =   8160
      TabIndex        =   78
      Top             =   1080
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   ";"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":10FD4
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd bakspace 
      Height          =   330
      Left            =   8640
      TabIndex        =   79
      Top             =   1080
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   ""
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":112EE
      PICN            =   "frmsanalklavye.frx":11608
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd tab 
      Height          =   330
      Left            =   1920
      TabIndex        =   80
      Top             =   1440
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "Tab"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":1197A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   0
      Left            =   2520
      TabIndex        =   81
      Top             =   1440
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "q"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":11C94
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   1
      Left            =   3000
      TabIndex        =   82
      Top             =   1440
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "w"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":11FAE
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   2
      Left            =   3480
      TabIndex        =   83
      Top             =   1440
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "e"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":122C8
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   3
      Left            =   3960
      TabIndex        =   84
      Top             =   1440
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "r"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":125E2
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   4
      Left            =   4440
      TabIndex        =   85
      Top             =   1440
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "t"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":128FC
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   5
      Left            =   4920
      TabIndex        =   86
      Top             =   1440
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "y"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":12C16
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   6
      Left            =   5400
      TabIndex        =   87
      Top             =   1440
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "u"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":12F30
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   7
      Left            =   5880
      TabIndex        =   88
      Top             =   1440
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "ý"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":1324A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   8
      Left            =   6360
      TabIndex        =   89
      Top             =   1440
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "o"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":13564
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   9
      Left            =   6840
      TabIndex        =   90
      Top             =   1440
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "p"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":1387E
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   10
      Left            =   7320
      TabIndex        =   91
      Top             =   1440
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "ð"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":13B98
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   11
      Left            =   7800
      TabIndex        =   92
      Top             =   1440
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "ü"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":13EB2
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   12
      Left            =   3000
      TabIndex        =   93
      Top             =   1800
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "a"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":141CC
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   13
      Left            =   3480
      TabIndex        =   94
      Top             =   1800
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "s"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":144E6
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   14
      Left            =   3960
      TabIndex        =   95
      Top             =   1800
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "d"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":14800
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   15
      Left            =   4440
      TabIndex        =   96
      Top             =   1800
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "f"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":14B1A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   16
      Left            =   4920
      TabIndex        =   97
      Top             =   1800
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "g"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":14E34
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   17
      Left            =   5400
      TabIndex        =   98
      Top             =   1800
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "h"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":1514E
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   18
      Left            =   5880
      TabIndex        =   99
      Top             =   1800
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "j"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":15468
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   19
      Left            =   6360
      TabIndex        =   100
      Top             =   1800
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "k"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":15782
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   20
      Left            =   6840
      TabIndex        =   101
      Top             =   1800
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "l"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":15A9C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   21
      Left            =   7320
      TabIndex        =   102
      Top             =   1800
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "þ"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":15DB6
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   22
      Left            =   7800
      TabIndex        =   103
      Top             =   1800
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "i"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":160D0
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   23
      Left            =   3120
      TabIndex        =   104
      Top             =   2160
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "z"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":163EA
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   24
      Left            =   3600
      TabIndex        =   105
      Top             =   2160
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "x"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":16704
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   25
      Left            =   4080
      TabIndex        =   106
      Top             =   2160
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "c"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":16A1E
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   26
      Left            =   4560
      TabIndex        =   107
      Top             =   2160
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "v"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":16D38
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   27
      Left            =   5040
      TabIndex        =   108
      Top             =   2160
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "b"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":17052
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   28
      Left            =   5520
      TabIndex        =   109
      Top             =   2160
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "n"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":1736C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   29
      Left            =   6000
      TabIndex        =   110
      Top             =   2160
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "m"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":17686
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   30
      Left            =   6480
      TabIndex        =   111
      Top             =   2160
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "ö"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":179A0
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd harf 
      Height          =   330
      Index           =   31
      Left            =   6960
      TabIndex        =   112
      Top             =   2160
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "ç"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":17CBA
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd nokta 
      Height          =   330
      Index           =   0
      Left            =   2640
      TabIndex        =   113
      Top             =   2160
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   "<"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":17FD4
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.cmd nokta 
      Height          =   330
      Index           =   1
      Left            =   7440
      TabIndex        =   114
      Top             =   2160
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   582
      BTYPE           =   14
      TX              =   ":"
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
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmsanalklavye.frx":182EE
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
      Height          =   2655
      Index           =   0
      Left            =   1800
      Top             =   360
      Width           =   7455
   End
   Begin VB.Shape shp 
      Height          =   2055
      Index           =   4
      Left            =   11400
      Top             =   960
      Width           =   1620
   End
   Begin VB.Shape shp 
      Height          =   525
      Index           =   3
      Left            =   11400
      Top             =   360
      Width           =   1590
   End
   Begin VB.Label nlck 
      Appearance      =   0  'Flat
      BackColor       =   &H00008000&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   0
      Left            =   11520
      TabIndex        =   35
      Top             =   480
      Width           =   255
   End
   Begin VB.Label nlck 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   1
      Left            =   12045
      TabIndex        =   34
      Top             =   480
      Width           =   255
   End
   Begin VB.Label nlck 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   2
      Left            =   12525
      TabIndex        =   33
      Top             =   480
      Width           =   255
   End
   Begin VB.Shape shp 
      Height          =   930
      Index           =   2
      Left            =   9360
      Top             =   2085
      Width           =   1935
   End
   Begin VB.Shape shp 
      Height          =   1650
      Index           =   1
      Left            =   9360
      Top             =   360
      Width           =   1935
   End
   Begin VB.Label baslik 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Send Keybord Keys To The Applications Of Server"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   9.75
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   13095
   End
End
Attribute VB_Name = "frmsanalklavye"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Function tusbastir(ne As String)
On Local Error GoTo tushata
    frmana.bilgigonder "[TUSBSTIR]" & ne & Chr(255) & pencere.SelectedItem.SubItems(1) & Chr(255) & pencere.SelectedItem.Text
    Exit Function
tushata:
frmana.hk 583
End Function

Private Sub alt_Click()
    tusbastir "%"
End Sub

Private Sub altgr_Click()
        Select Case sira2(3).Caption
            Case "#"
                sira2(3).Caption = "^"
                sira2(4).Caption = "+"
                sira2(7).Caption = "/"
                sira2(8).Caption = "("
                sira2(9).Caption = ")"
                sira2(10).Caption = "="
                sira2(11).Caption = "?"
                sira2(12).Caption = "-"
            Case "^"
                sira2(3).Caption = "#"
                sira2(4).Caption = "$"
                sira2(7).Caption = "{"
                sira2(8).Caption = "["
                sira2(9).Caption = "]"
                sira2(10).Caption = "}"
                sira2(11).Caption = "\"
                sira2(12).Caption = "_"
        End Select
        tusbastir "%"
End Sub

Private Sub bakspace_Click()
    tusbastir "{BACKSPACE}"
End Sub

Private Sub baslik_MouseDown(Button As Integer, shift As Integer, x As Single, y As Single)
tasi Me
End Sub

Private Sub Boþluk_Click()
    tusbastir Chr(32)
End Sub

Private Sub enter_Click(Index As Integer)
    tusbastir "{ENTER}"
End Sub

Private Sub ESC_Click()
    tusbastir "{ESC}"
End Sub

Private Sub fonk1_Click(Index As Integer)
    tusbastir "{" & fonk1(Index).Caption & "}"
End Sub

Private Sub Form_Load()
            pencere.MouseIcon = geri.MouseIcon
            hHeader = SendMessageLong(pencere.hwnd, LVM_GETHEADER, 0, ByVal 0&)
            Style = GetWindowLong(hHeader, GWL_STYLE)
            Style = Style Xor HDS_BUTTONS
                If Style Then
                    r = SetWindowLong(hHeader, GWL_STYLE, Style)
                    r = SetWindowPos(pencere.hwnd, Me.hwnd, 0, 0, 0, 0, SWP_FLAGS)
                End If
            SaydamYap Me, 230
End Sub

Private Sub geri_Click()
Me.Hide
End Sub

Private Sub capslock_Click()
    Select Case nlck(1).BackColor
        Case vbWhite
            nlck(1).BackColor = &H8000&
                For sayac = 0 To 31
                    harf(sayac).Caption = UCase(harf(sayac).Caption)
                Next
        Case &H8000&
            nlck(1).BackColor = vbWhite
                For sayac = 0 To 31
                    harf(sayac).Caption = LCase(harf(sayac).Caption)
                Next
    End Select
    tusbastir "{CAPSLOCK}"
End Sub

Private Sub harf_Click(Index As Integer)
    tusbastir harf(Index).Caption
End Sub

Private Sub listeyiyenile_Click()
frmana.bilgigonder "[GETWNDLT]" & -1
    bWHidden = False
End Sub

Private Sub nokta_Click(Index As Integer)
    tusbastir nokta(Index).Cancel
End Sub

Private Sub num_Click()
    Select Case nlck(0).BackColor
        Case vbWhite
            nlck(0).BackColor = &H8000&
        Case &H8000&
            nlck(0).BackColor = vbWhite
    End Select
End Sub

Private Sub özel_Click(Index As Integer)
    tusbastir özel(Index).Caption
End Sub

Private Sub sayisal_Click(Index As Integer)
    tusbastir sayisal(Index).Caption
End Sub

Private Sub shift_Click(Index As Integer)
    Select Case nokta(0).Caption
        Case "<"
            nokta(0).Caption = ">"
            nokta(1).Caption = ":"
        Case ">"
            nokta(0).Caption = "<"
            nokta(1).Caption = "."
    End Select
    tusbastir "{+}"
End Sub

Private Sub sira2_Click(Index As Integer)
    tusbastir sira2(Index).Caption
End Sub

Private Sub tab_Click()
    tusbastir "{TAB}"
End Sub

Private Sub islevler_Click(Index As Integer)
    Select Case Index
        Case 0
            tusbastir "{PRNTSC}"
        Case 1
            Select Case nlck(2).BackColor
                Case vbWhite
                    nlck(2).BackColor = &H8000&
                Case &H8000&
                    nlck(2).BackColor = vbWhite
            End Select
            tusbastir "{SCROLLLOCK}"
        Case 2
            tusbastir "{BREAK}"
        Case 3
            tusbastir "{INSERT}"
        Case 4
            tusbastir "{HOME}"
        Case 5
            tusbastir "{PGUP}"
        Case 6
            tusbastir "{DELETE}"
        Case 7
            tusbastir "{END}"
        Case 8
            tusbastir "{PGDN}"
        Case 9
            tusbastir "{POWER}"
        Case 10
            tusbastir "{WAKE}"
        Case 11
            tusbastir "{SLEEP}"
    End Select
End Sub

Private Sub turbo_Click()
    tusbastir "{TURBO}"
End Sub

Private Sub winkey_Click(Index As Integer)
    tusbastir "{WINKEY}"
End Sub

Private Sub yön_Click(Index As Integer)
    Select Case Index
        Case 0
            tusbastir "{UP}"
        Case 1
            tusbastir "{LEFT}"
        Case 2
            tusbastir "{DOWN}"
        Case 3
            tusbastir "{RIGHT}"
    End Select
End Sub
