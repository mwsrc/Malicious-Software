VERSION 5.00
Begin VB.Form Form3 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "About - Coded by Carb0n"
   ClientHeight    =   2580
   ClientLeft      =   9270
   ClientTop       =   7680
   ClientWidth     =   4365
   ControlBox      =   0   'False
   LinkTopic       =   "Form4"
   ScaleHeight     =   2580
   ScaleWidth      =   4365
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox Text1 
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   240
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   3
      Text            =   "Form3.frx":0000
      Top             =   1560
      Width           =   3855
   End
   Begin VB.TextBox Text2 
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Height          =   285
      Left            =   240
      TabIndex        =   2
      Text            =   "Registered to: "
      Top             =   2040
      Width           =   1095
   End
   Begin VB.TextBox Text3 
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   285
      Left            =   1320
      TabIndex        =   1
      Text            =   "Hack Hound"
      Top             =   2040
      Width           =   1095
   End
   Begin Project1.chameleonButton chameleonButton2 
      Height          =   525
      Left            =   2880
      TabIndex        =   4
      Top             =   840
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   926
      BTYPE           =   14
      TX              =   "Node Reality"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   12632256
      BCOLO           =   12632256
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form3.frx":00EB
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.chameleonButton cmd2 
      Height          =   525
      Left            =   1560
      TabIndex        =   5
      Top             =   840
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   926
      BTYPE           =   14
      TX              =   "OpenSC"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   12632256
      BCOLO           =   12632256
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form3.frx":0107
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.chameleonButton cmd1 
      Height          =   525
      Left            =   240
      TabIndex        =   6
      Top             =   840
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   926
      BTYPE           =   14
      TX              =   "Hack Hound"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   12632256
      BCOLO           =   12632256
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form3.frx":0123
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.UsrSkin UsrSkin1 
      Height          =   2175
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   4095
      _ExtentX        =   7223
      _ExtentY        =   3836
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'carb0n crypter series
'by carb0n
'http://hackhound.org

Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Const SW_SHOW = 5

Private Sub chameleonButton2_Click()
Hyper "www.nodereality.com"
End Sub

Private Sub cmd1_Click()
Hyper "http://hackhound.org"
End Sub

Private Sub cmd2_Click()
Hyper "www.opensc.ws"
End Sub

Private Sub Form_Load()
UsrSkin1.SkinCaption = Me.Caption
UsrSkin1.SkinActivate
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
UsrSkin1.SkinDeactivate
End Sub

Private Sub Form_Resize()
UsrSkin1.Move 0, 0, ScaleWidth, ScaleHeight
End Sub

Private Sub UsrSkin1_SkinMaximize()
Me.WindowState = IIf(Me.WindowState = vbMaximized, vbNormal, vbMaximized)
End Sub

Private Sub UsrSkin1_SkinMinimize()
Me.WindowState = vbMinimized
End Sub

Private Sub UsrSkin1_SkinMouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbLeftButton Then FormDrag Me
End Sub

Private Sub UsrSkin1_SkinUnload()
Unload Me
End Sub

Private Sub Hyper(URL As String)
Dim Ret As Long
Ret = ShellExecute(Me.hwnd, "open", URL, 0, 0, SW_SHOW)
If Ret <= 32 Then
MsgBox "Error occured"
End If

End Sub
