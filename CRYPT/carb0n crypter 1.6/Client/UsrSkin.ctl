VERSION 5.00
Begin VB.UserControl UsrSkin 
   ClientHeight    =   5655
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7725
   ScaleHeight     =   5655
   ScaleWidth      =   7725
   Begin VB.Timer TMin 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   2640
      Top             =   3840
   End
   Begin VB.Timer TMinMax 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   3120
      Top             =   3840
   End
   Begin VB.PictureBox ImgMinMaxP 
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   1080
      ScaleHeight     =   255
      ScaleWidth      =   390
      TabIndex        =   3
      Top             =   2760
      Width           =   390
      Begin VB.Image ImgMinC 
         Height          =   255
         Left            =   0
         Picture         =   "UsrSkin.ctx":0000
         Top             =   0
         Width           =   3120
      End
      Begin VB.Image ImgMaxC 
         Height          =   240
         Left            =   0
         Picture         =   "UsrSkin.ctx":29B2
         Top             =   0
         Width           =   3120
      End
   End
   Begin VB.PictureBox ImgMinimP 
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   120
      ScaleHeight     =   255
      ScaleWidth      =   390
      TabIndex        =   2
      Top             =   2640
      Width           =   390
      Begin VB.Image ImgMinimC 
         Height          =   255
         Left            =   0
         Picture         =   "UsrSkin.ctx":50F4
         Top             =   0
         Width           =   3120
      End
   End
   Begin VB.PictureBox ImgInchideP 
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   5160
      ScaleHeight     =   255
      ScaleWidth      =   660
      TabIndex        =   1
      Top             =   4440
      Width           =   660
      Begin VB.Image ImgInchideC 
         Height          =   255
         Left            =   0
         Picture         =   "UsrSkin.ctx":7AA6
         Top             =   0
         Width           =   5280
      End
   End
   Begin VB.Timer TClose 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   3600
      Top             =   3840
   End
   Begin VB.PictureBox PctBlanc 
      Height          =   15
      Left            =   0
      ScaleHeight     =   15
      ScaleWidth      =   15
      TabIndex        =   0
      Top             =   0
      Width           =   15
   End
   Begin VB.Image ImgSColtDreapta 
      Height          =   390
      Left            =   6480
      Picture         =   "UsrSkin.ctx":C108
      Top             =   480
      Width           =   60
   End
   Begin VB.Label lblCaption 
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   6000
   End
   Begin VB.Label lblCaption 
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   4
      Left            =   120
      TabIndex        =   8
      Top             =   135
      Width           =   6000
   End
   Begin VB.Label lblCaption 
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   3
      Left            =   120
      TabIndex        =   7
      Top             =   105
      Width           =   6000
   End
   Begin VB.Label lblCaption 
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   2
      Left            =   135
      TabIndex        =   6
      Top             =   120
      Width           =   6000
   End
   Begin VB.Label lblCaption 
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   105
      TabIndex        =   5
      Top             =   120
      Width           =   6000
   End
   Begin VB.Image ImgJColtDreapta 
      Height          =   60
      Left            =   6480
      Picture         =   "UsrSkin.ctx":C282
      Top             =   2160
      Width           =   60
   End
   Begin VB.Image ImgJColtStanga 
      Height          =   60
      Left            =   1320
      Picture         =   "UsrSkin.ctx":C2F4
      Top             =   2160
      Width           =   60
   End
   Begin VB.Image ImgSColtStanga 
      Height          =   390
      Left            =   1320
      Picture         =   "UsrSkin.ctx":C366
      Top             =   480
      Width           =   60
   End
   Begin VB.Image ImgBaraStanga 
      Height          =   1170
      Left            =   1320
      Picture         =   "UsrSkin.ctx":C4E0
      Stretch         =   -1  'True
      Top             =   960
      Width           =   60
   End
   Begin VB.Image ImgBaraDreapta 
      Height          =   1275
      Left            =   6480
      Picture         =   "UsrSkin.ctx":C6EA
      Stretch         =   -1  'True
      Top             =   840
      Width           =   60
   End
   Begin VB.Image imgBaraSus 
      Height          =   405
      Left            =   1440
      Picture         =   "UsrSkin.ctx":C948
      Stretch         =   -1  'True
      Top             =   480
      Width           =   4935
   End
   Begin VB.Image ImgBaraJos 
      Height          =   60
      Left            =   1440
      Picture         =   "UsrSkin.ctx":F7F2
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   4965
   End
End
Attribute VB_Name = "UsrSkin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private Declare Function WindowFromPoint Lib "user32" (ByVal xPoint As Long, ByVal yPoint As Long) As Long

Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer

Private Declare Function GetCursorPos Lib "user32.dll" (ByRef lpPoint As POINTAPI) As Long
    Private Type POINTAPI
        X As Long
        Y As Long
    End Type
Public Event SkinUnload()
Public Event SkinMaximize()
Public Event SkinMinimize()
Public Event SkinRButtonDown()
Public Event SkinMouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Private MouseOnItem As Long, MaximizeEnabledValue As Long
Public Sub SkinActivate()
TMin.Enabled = True
TMinMax.Enabled = True
TClose.Enabled = True
End Sub
Public Sub SkinDeactivate()
TMin.Enabled = False
TMinMax.Enabled = False
TClose.Enabled = False
End Sub
Public Property Let SkinCaption(lpCaption)
Dim i1 As Long
For i1 = 0 To 4
    lblCaption(i1).Caption = lpCaption
Next
End Property
Public Property Get SkinCaption()
SkinCaption = lblCaption(0).Caption
End Property

Public Property Let BackColor(lpColor)
UserControl.BackColor = lpColor
End Property
Public Property Get BackColor()
BackColor = UserControl.BackColor
End Property

Private Sub imgBaraSus_DblClick()
RaiseEvent SkinMaximize
End Sub

Private Sub imgBaraSus_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
RaiseEvent SkinMouseMove(Button, Shift, X, Y)
End Sub

Private Sub imgBaraSus_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

'UserControl.Refresh
End Sub

Private Sub ImgInchideC_Click()
RaiseEvent SkinUnload
End Sub
Public Property Let MaximizeEnabled(lpState)
If lpState = True Then
    TMinMax.Enabled = True
    ImgMinC.Left = 0
    MaximizeEnabledValue = 0
Else
    MaximizeEnabledValue = 1
    TMinMax.Enabled = False
    ImgMinC.Left = -104 * 15
End If
End Property
Public Property Get MaximizeEnabled()
    MaximizeEnabled = TMinMax.Enabled
End Property

Private Sub ImgInchideC_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbLeftButton Then
    If MouseOver(ImgInchideP) = True Then
        ImgInchideC.Left = -(44 * 30)
    End If
End If
End Sub

Private Sub ImgMinC_Click()
RaiseEvent SkinMaximize
End Sub

Private Sub ImgMinimC_Click()
RaiseEvent SkinMinimize
End Sub

Private Sub lblCaption_DblClick(Index As Integer)
RaiseEvent SkinMaximize
End Sub

Private Sub lblCaption_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
RaiseEvent SkinMouseMove(Button, Shift, X, Y)
End Sub

Private Sub lblCaption_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
'UserControl.Refresh
End Sub

Private Sub TClose_Timer()
DoEvents
If (MouseOver(ImgInchideP) = True) Then
    If GetAsyncKeyState(1) <> 0 Then
    
        ImgInchideC.Left = -44 * 30
        'MouseOnItem = True
        Exit Sub
    Else
        'MouseOnItem = False
        ImgInchideC.Left = -44 * 15
        Exit Sub
    End If
End If
If (MouseOver(ImgInchideP) = False) Then
 ImgInchideC.Left = 0
End If
End Sub

Private Sub Timer1_Timer()
UserControl.Refresh
End Sub

Private Sub TMin_Timer()
DoEvents
If (MouseOver(ImgMinimP) = True) Then
    If GetAsyncKeyState(1) <> 0 Then
    
        ImgMinimC.Left = -26 * 30
        DoEvents
        'MouseOnItem = True
        Exit Sub
    Else
        'MouseOnItem = False
        ImgMinimC.Left = -26 * 15
        DoEvents
        Exit Sub
    End If
 'ImgMinC.Left = -26 * 15
 'ImgMinimC.Left = -26 * 15
End If
If (MouseOver(ImgMinimP) = False) Then
 ImgMinimC.Left = 0
End If
End Sub

Private Sub TMinMax_Timer()
If MaximizeEnabledValue <> 0 Then Exit Sub
DoEvents
If (MouseOver(ImgMinMaxP) = True) Then
    If GetAsyncKeyState(1) <> 0 Then
    
        ImgMinC.Left = -26 * 30
        'MouseOnItem = True
        DoEvents
        Exit Sub
    Else
        'MouseOnItem = False
        ImgMinC.Left = -26 * 15
        DoEvents
        Exit Sub
    End If
 'ImgMinC.Left = -26 * 15
End If
If (MouseOver(ImgMinMaxP) = False) Then
 ImgMinC.Left = 0
End If

End Sub

Private Sub UserControl_Initialize()
PozitionarE

End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'If Button = vbRightButton Then RaiseEvent SkinRButtonDown
'UserControl.Refresh
RaiseEvent SkinMouseMove(Button, Shift, X, Y)
End Sub

Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
MouseOver PctBlanc
End Sub

Private Sub UserControl_Resize()
PozitionarE
End Sub

Sub PozitionarE()
On Error Resume Next
 ImgSColtStanga.Left = 0
 ImgSColtStanga.Top = 0
 
 
 imgBaraSus.Top = 0
 imgBaraSus.Width = UserControl.ScaleWidth - ImgSColtDreapta.Width
 imgBaraSus.Left = ImgSColtStanga.Width
 
 
 ImgBaraStanga.Left = 0
 ImgBaraStanga.Top = ImgSColtStanga.Height
 ImgBaraStanga.Height = UserControl.ScaleHeight - ImgJColtDreapta.Height
 
 
 
 ImgSColtDreapta.Top = 0
 ImgSColtDreapta.Left = UserControl.ScaleWidth - ImgSColtDreapta.Width
 
 
 ImgBaraDreapta.Left = UserControl.ScaleWidth - ImgBaraDreapta.Width
 ImgBaraDreapta.Top = ImgSColtDreapta.Height
 ImgBaraDreapta.Height = UserControl.ScaleHeight - ImgJColtDreapta.Height
 
 
 ImgJColtStanga.Left = 0
 ImgJColtStanga.Top = UserControl.ScaleHeight - ImgSColtStanga.Height
 
 ImgBaraJos.Top = UserControl.ScaleHeight - ImgBaraJos.Height
 ImgBaraJos.Left = ImgJColtStanga.Width
 ImgBaraJos.Width = UserControl.ScaleWidth - ImgJColtDreapta.Width
 
 ImgJColtDreapta.Left = UserControl.ScaleWidth - ImgJColtDreapta.Width
 ImgJColtDreapta.Top = UserControl.ScaleHeight - ImgJColtDreapta.Width
 
 ImgInchideP.Top = 30
 ImgInchideP.Left = UserControl.ScaleWidth - ImgInchideP.Width - 100
 
 ImgMinMaxP.Top = 30
 ImgMinMaxP.Left = UserControl.ScaleWidth - ImgInchideP.Width - ImgMinimP.Width - 100
 ImgMinimP.Top = 30
 ImgMinimP.Left = UserControl.ScaleWidth - ImgMinMaxP.Width - ImgInchideP.Width - ImgMinimP.Width - 100
 
 
End Sub

Private Function MouseOver(Optional buton As PictureBox) As Boolean
  Dim pt As POINTAPI
  GetCursorPos pt
  If WindowFromPoint(pt.X, pt.Y) = buton.hwnd Then
   MouseOver = True

  Else
   MouseOver = False
   
  End If
  
End Function


 
Private Sub UserControl_Terminate()

'Dim t1 As Timer
'For Each t1 In UserControl
'    t1.Enabled = False
'Next

    
End Sub
