VERSION 5.00
Begin VB.Form frmscreen 
   Appearance      =   0  'Flat
   BackColor       =   &H00808080&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   8835
   ClientLeft      =   3930
   ClientTop       =   1125
   ClientWidth     =   13080
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmscreen.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8835
   ScaleWidth      =   13080
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox kalite 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   300
      Left            =   1440
      TabIndex        =   8
      Text            =   "25"
      Top             =   0
      Width           =   495
   End
   Begin Client.cmd btn 
      Height          =   300
      Index           =   0
      Left            =   0
      TabIndex        =   0
      ToolTipText     =   "Start Screen Capture"
      Top             =   0
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   529
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
      BCOL            =   0
      BCOLO           =   0
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmscreen.frx":000C
      PICN            =   "frmscreen.frx":0326
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
      Height          =   300
      Index           =   1
      Left            =   360
      TabIndex        =   1
      ToolTipText     =   "Stop Screen Capture"
      Top             =   0
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   529
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
      BCOL            =   0
      BCOLO           =   0
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmscreen.frx":0720
      PICN            =   "frmscreen.frx":0A3A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Client.ISPanel ISPanel1 
      Height          =   8550
      Left            =   -15
      Negotiate       =   -1  'True
      TabIndex        =   2
      Top             =   300
      Width           =   13095
      _ExtentX        =   23098
      _ExtentY        =   15081
      BackColor       =   0
      Begin VB.Timer tekrarla 
         Enabled         =   0   'False
         Interval        =   1
         Left            =   3720
         Top             =   840
      End
      Begin VB.PictureBox picCapture 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1935
         Left            =   0
         ScaleHeight     =   1935
         ScaleWidth      =   2415
         TabIndex        =   3
         Top             =   0
         Width           =   2415
      End
   End
   Begin Client.cmd cikis 
      Height          =   300
      Left            =   12840
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
      BCOL            =   0
      BCOLO           =   0
      FCOL            =   16777215
      FCOLO           =   16777215
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmscreen.frx":0E34
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
      Height          =   300
      Index           =   2
      Left            =   1080
      TabIndex        =   6
      ToolTipText     =   "Mouse Control Deactive"
      Top             =   0
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   529
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
      BCOL            =   0
      BCOLO           =   0
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16776960
      MPTR            =   99
      MICON           =   "frmscreen.frx":114E
      PICN            =   "frmscreen.frx":1468
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
      Height          =   300
      Index           =   3
      Left            =   720
      TabIndex        =   7
      ToolTipText     =   "Mouse Control Active"
      Top             =   0
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   529
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
      BCOL            =   0
      BCOLO           =   0
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   0
      MPTR            =   99
      MICON           =   "frmscreen.frx":18AA
      PICN            =   "frmscreen.frx":1BC4
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
      Height          =   300
      Index           =   4
      Left            =   1920
      TabIndex        =   9
      ToolTipText     =   "Full Screen Capture"
      Top             =   0
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   529
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
      BCOL            =   0
      BCOLO           =   0
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frmscreen.frx":2006
      PICN            =   "frmscreen.frx":2320
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
      Caption         =   "Screen Capture"
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
      TabIndex        =   5
      Top             =   0
      Width           =   13095
   End
End
Attribute VB_Name = "frmscreen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Private Type POINTAPI
    x As Long
    y As Long
    End Type
    Dim pp As POINTAPI
Private Declare Function SetCursorPos Lib "user32" (ByVal x As Long, ByVal y As Long) As Long
Private Declare Sub mouse_event Lib "user32" (ByVal dwFlags As Long, ByVal dx As Long, ByVal dy As Long, ByVal cButtons As Long, ByVal dwExtraInfo As Long)
Private Const MOUSEEVENTF_LEFTDOWN = &H2
Private Const MOUSEEVENTF_LEFTUP = &H4
Private Const MOUSEEVENTF_RIGHTDOWN = &H8
Private Const MOUSEEVENTF_RIGHTUP = &H10
Dim OldSize As Long
Dim serverkontrol As Boolean

Private Sub btn_Click(Index As Integer)
    Select Case Index
        Case 0
            frmana.wskscreen.Close
            frmana.wskscreen.LocalPort = frmana.lvw(7).ListItems(3).SubItems(1)
            frmana.wskscreen.Listen
            frmana.bilgigonder "[EKRANBAG]" & kalite.Text
            frmana.hk 550
        Case 1
            frmana.bilgigonder "[EKRANDUR]"
            frmana.lvw(7).ListItems(3).SmallIcon = 34
            frmana.wskscreen.Close
            frmana.hk 551
        Case 2
            serverkontrol = False
        Case 3
            serverkontrol = True
            
        Case 4
            If Me.WindowState = 2 Then
                Me.WindowState = 0
                Me.Width = 13110
                Me.Height = 8865
            Else
                Me.WindowState = 2
            End If
                ISPanel1.Width = Me.Width
                ISPanel1.Height = Me.Height - 310
                cikis.Left = ISPanel1.Width - cikis.Width
                baslik.Width = Me.Width
    End Select
End Sub

Private Sub cikis_Click()
frmana.bilgigonder "[EKRANDUR]"
frmana.lvw(7).ListItems(3).SmallIcon = 34
frmana.wskscreen.Close
frmana.hk 551
Unload Me
End Sub

Private Sub Form_Load()
    SaydamYap Me, 250
    ISPanel1.Attatch picCapture
    serverkontrol = False
End Sub

Private Sub baslik_MouseDown(Button As Integer, shift As Integer, x As Single, y As Single)
tasi Me
End Sub

Private Sub Form_MouseMove(Button As Integer, shift As Integer, x As Single, y As Single)
tasi Me
End Sub





Public Function GetMouseX(PicBox As PictureBox, x As Single) As Long
Dim First, Secound As Double
First = x / Screen.TwipsPerPixelX
Secound = Screen.Width / PicBox.Width
GetMouseX = First * (Secound + 0.002)
End Function

Public Function GetMouseY(PicBox As PictureBox, y As Single) As Long
Dim First, Secound As Double
First = y / Screen.TwipsPerPixelY
Secound = Screen.Height / PicBox.Height
GetMouseY = First * (Secound + 0.002)
End Function
Public Function ScreenX() As Long
ScreenX = Screen.Width / Screen.TwipsPerPixelX
End Function
Public Function ScreenY() As Long
ScreenY = Screen.Height / Screen.TwipsPerPixelY
End Function
 
Private Sub picCapture_MouseDown(Button As Integer, shift As Integer, x As Single, y As Single)
    If serverkontrol = True Then
       frmana.bilgigonder "[TIKLADIM]" & Button & Chr(255) & GetMouseX(picCapture, x) & Chr(255) & GetMouseY(picCapture, y) & Chr(255) & ScreenX & Chr(255) & ScreenY
    End If
End Sub

Private Sub tekrarla_Timer()
frmana.bilgigonder "[EKRANBAS]"
tekrarla.Enabled = False
End Sub
