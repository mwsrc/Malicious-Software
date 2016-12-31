VERSION 5.00
Begin VB.Form frmAlert 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   1950
   ClientLeft      =   45
   ClientTop       =   45
   ClientWidth     =   2865
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1950
   ScaleWidth      =   2865
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox crosspic2 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   180
      Left            =   2640
      Picture         =   "frmAlert.frx":0000
      ScaleHeight     =   180
      ScaleWidth      =   180
      TabIndex        =   3
      Top             =   120
      Width           =   180
   End
   Begin VB.PictureBox crosspic 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   180
      Left            =   2640
      Picture         =   "frmAlert.frx":01F2
      ScaleHeight     =   180
      ScaleWidth      =   195
      TabIndex        =   2
      Top             =   360
      Width           =   195
   End
   Begin VB.Timer tmrOpen 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   2160
      Top             =   600
   End
   Begin VB.Timer tmrClose 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   2160
      Top             =   1080
   End
   Begin VB.PictureBox picBackground 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   1695
      Left            =   0
      ScaleHeight     =   1665
      ScaleWidth      =   2025
      TabIndex        =   0
      Top             =   0
      Width           =   2055
      Begin VB.Image Image1 
         Height          =   180
         Left            =   1680
         MousePointer    =   99  'Custom
         Top             =   120
         Width           =   195
      End
      Begin VB.Label lblAlert 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Alert Message"
         BeginProperty Font 
            Name            =   "Comic Sans MS"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404040&
         Height          =   735
         Left            =   120
         TabIndex        =   1
         Top             =   600
         Width           =   1815
         WordWrap        =   -1  'True
      End
   End
   Begin VB.Timer tmrAlert 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   2160
      Top             =   120
   End
End
Attribute VB_Name = "frmAlert"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' API Declarations
Private Declare Function GetSystemMetrics& Lib "user32" (ByVal nIndex As Long)

' Constants
Const SM_CXFULLSCREEN = 16   ' Width of window client area
Const SM_CYFULLSCREEN = 17   ' Height of window client area
Const SND_SYNC = &H0
Const SND_ASYNC = &H1
Const SND_NODEFAULT = &H2
Const SND_LOOP = &H8
Const SND_NOSTOP = &H10

' Declarations
Private ClsGradient As New CGradient
Private fX As Long
Private fY As Long
Private lngScaleX As Long
Private lngScaleY As Long
Private AlertIndex As Long


Private Sub Form_Load()
On Local Error Resume Next
End Sub

Private Sub Image1_Click()
Me.Hide
End Sub


Private Sub Image1_MouseMove(Button As Integer, shift As Integer, x As Single, y As Single)
Image1.Picture = crosspic2.Picture

End Sub

 

Private Sub lblAlert_MouseMove(Button As Integer, shift As Integer, x As Single, y As Single)
    ' Show as hyperlink
    If lblAlert.FontUnderline = False Then
        lblAlert.FontUnderline = True
        lblAlert.ForeColor = RGB(0, 0, 255)
    End If
End Sub

Private Sub picBackground_MouseMove(Button As Integer, shift As Integer, x As Single, y As Single)
    ' Show text
    If lblAlert.FontUnderline = True Then
        lblAlert.FontUnderline = False
        lblAlert.ForeColor = &H0
    End If
    Image1.Picture = crosspic.Picture
    lblAlert.BorderStyle = 0
End Sub

Private Sub tmrAlert_Timer()
    ' Alert was displayed, now close it
    tmrAlert.Enabled = False
    tmrClose.Enabled = True
End Sub

Private Sub tmrClose_Timer()
    Dim curHeight As Long
    curHeight = Me.Height
    If curHeight > 120 Then
        Me.Height = curHeight - 30
        Me.Top = Me.Top + 30
    Else
        ' Close form
        If AlertCount = AlertIndex Then AlertCount = 0
        Unload Me
    End If
End Sub

Private Sub tmrOpen_Timer()
    Dim curHeight As Long
    Dim newHeight As Long
    curHeight = Me.Height
    If curHeight < picBackground.Height + lngScaleY Then
        newHeight = curHeight + 30
        If newHeight > picBackground.Height + lngScaleY Then newHeight = picBackground.Height + lngScaleY
        Me.Height = Me.Height + (newHeight - curHeight)
        Me.Top = Me.Top - (newHeight - curHeight)
    Else
        tmrOpen.Enabled = False
        tmrAlert.Enabled = True
    End If
End Sub

Public Sub DisplayAlert(MessageText As String, Duration As Long)
On Error Resume Next
 Dim MakeSound As String
  

If FrmSettings.enpopup.Value = 1 Then
  

    ' Increase the alert count
    AlertCount = AlertCount + 1
    AlertIndex = AlertCount

    ' Set the message
    lblAlert.Caption = MessageText

    ' Set the duration
    tmrAlert.Interval = Duration

    ' Get the system metrics we need
    fX = GetSystemMetrics(SM_CXFULLSCREEN)
    fY = GetSystemMetrics(SM_CYFULLSCREEN)
    lngScaleX = Me.Width - Me.ScaleWidth
    lngScaleY = Me.Height - Me.ScaleHeight
    
    ' Size the form
    Me.Height = 90
    Me.Width = picBackground.Width + lngScaleX
    Me.Left = fX * Screen.TwipsPerPixelX - Me.Width
    Me.Top = (fY * Screen.TwipsPerPixelY) - ((picBackground.Height + lngScaleY) * (AlertCount - 1)) + 300
    Me.Show
     wFlags = SND_ASYNC Or SND_NODEFAULT
     

 
    ' Draw the gradient background
    With ClsGradient
        .Angle = -100
        .Color1 = RGB(222, 223, 239)
        .Color2 = RGB(255, 255, 255)
        
        
        .Draw picBackground
    End With
    picBackground.Refresh

    ' Open the alert box
    tmrOpen.Enabled = True
End If
End Sub
