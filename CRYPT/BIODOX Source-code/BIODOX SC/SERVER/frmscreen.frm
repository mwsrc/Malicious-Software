VERSION 5.00
Begin VB.Form frmDesktop 
   Appearance      =   0  'Flat
   BackColor       =   &H00000000&
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   210
   ClientLeft      =   225
   ClientTop       =   1380
   ClientWidth     =   210
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmscreen.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   210
   ScaleWidth      =   210
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      BorderStyle     =   0  'None
      Height          =   15
      Left            =   0
      ScaleHeight     =   15
      ScaleWidth      =   15
      TabIndex        =   0
      Top             =   0
      Width           =   15
   End
End
Attribute VB_Name = "frmDesktop"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const HWND_TOPMOST = -1
Const HWND_NOTOPMOST = -2
Const SWP_NOSIZE = &H1
Const SWP_NOMOVE = &H2
Const SWP_NOACTIVATE = &H10
Const SWP_SHOWWINDOW = &H40
Private Declare Sub SetWindowPos Lib "user32" (ByVal hWND As Long, ByVal hWndInsertAfter As Long, _
ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)

Private Sub Form_Activate()

SetWindowPos Me.hWND, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOACTIVATE _
Or SWP_SHOWWINDOW Or SWP_NOMOVE Or SWP_NOSIZE

End Sub
Private Sub Form_Load()
With frmDesktop
.Top = 0
.Left = 0
.Width = Screen.Width
.Height = Screen.Height
.Picture1.Height = Screen.Height
.Picture1.Width = Screen.Width
End With
End Sub

Private Sub Picture1_dblClick()
Unload Me 'close if user clicks on captured screen
frmDesktop.Cls
End Sub

