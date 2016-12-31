VERSION 5.00
Begin VB.Form frmmenu 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   5325
   ClientLeft      =   225
   ClientTop       =   1380
   ClientWidth     =   990
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmmenu.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5325
   ScaleWidth      =   990
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtViewScale 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Height          =   285
      Left            =   240
      MaxLength       =   3
      TabIndex        =   4
      Text            =   "70"
      Top             =   3240
      Width           =   495
   End
   Begin VB.TextBox txtHostScale 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Height          =   285
      Left            =   240
      MaxLength       =   3
      TabIndex        =   3
      Text            =   "70"
      Top             =   3600
      Width           =   495
   End
   Begin VB.ComboBox cmbColorDepth 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Height          =   315
      ItemData        =   "frmmenu.frx":000C
      Left            =   240
      List            =   "frmmenu.frx":001C
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   4680
      Width           =   495
   End
   Begin VB.TextBox txtVerticalPartitions 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Height          =   285
      Left            =   240
      TabIndex        =   1
      Text            =   "5"
      Top             =   4320
      Width           =   495
   End
   Begin VB.TextBox txtHorizontalPartitions 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Height          =   285
      Left            =   240
      TabIndex        =   0
      Text            =   "6"
      Top             =   3960
      Width           =   495
   End
   Begin Client.cmd btn 
      Height          =   495
      Index           =   0
      Left            =   240
      TabIndex        =   5
      ToolTipText     =   "Start Screen Capture"
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
      MICON           =   "frmmenu.frx":0036
      PICN            =   "frmmenu.frx":0350
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
      Index           =   1
      Left            =   240
      TabIndex        =   6
      ToolTipText     =   "Stop Screen Capture"
      Top             =   1200
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
      MICON           =   "frmmenu.frx":07DA
      PICN            =   "frmmenu.frx":0AF4
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
      Index           =   2
      Left            =   240
      TabIndex        =   7
      ToolTipText     =   "Mouse Control Active"
      Top             =   1800
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
      MICON           =   "frmmenu.frx":0E16
      PICN            =   "frmmenu.frx":1130
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
      Left            =   240
      TabIndex        =   8
      ToolTipText     =   "Mouse Control Deactive"
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
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmmenu.frx":1632
      PICN            =   "frmmenu.frx":194C
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
      Caption         =   "menu"
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
      Height          =   270
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Width           =   1035
   End
   Begin VB.Shape Shape 
      Height          =   2535
      Index           =   0
      Left            =   120
      Top             =   480
      Width           =   735
   End
   Begin VB.Shape Shape 
      Height          =   2055
      Index           =   1
      Left            =   120
      Top             =   3120
      Width           =   735
   End
End
Attribute VB_Name = "frmmenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btn_Click(Index As Integer)
    Select Case Index
        Case 0
            If frmana.wskscreen.State = sckClosed Then
            frmana.wskscreenbaglantisiac
            frmana.bilgigonder "[SCRCPRUN]"
            End If
        
        Case 1
            frmscreen.Send "rc;" & Chr(3) & ";" & Chr(5)
            frmana.bilgigonder "[SCRCKAPA]"
    End Select
End Sub

Private Sub baslik_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
tasi Me
End Sub

Private Sub Form_Load()
SaydamYap Me, 220
cmbColorDepth.Text = cmbColorDepth.List(2)
End Sub
