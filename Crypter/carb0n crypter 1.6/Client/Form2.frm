VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form2 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Change Icon"
   ClientHeight    =   2070
   ClientLeft      =   9600
   ClientTop       =   8340
   ClientWidth     =   3765
   ControlBox      =   0   'False
   Icon            =   "Form2.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   2070
   ScaleWidth      =   3765
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   360
      TabIndex        =   5
      Text            =   "Text1"
      Top             =   240
      Visible         =   0   'False
      Width           =   3015
   End
   Begin Project1.chameleonButton chameleonButton3 
      Height          =   285
      Left            =   2400
      TabIndex        =   4
      Top             =   1320
      Width           =   1095
      _ExtentX        =   1296
      _ExtentY        =   503
      BTYPE           =   14
      TX              =   "Save"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
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
      MICON           =   "Form2.frx":0E02
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.chameleonButton chameleonButton2 
      Height          =   285
      Left            =   240
      TabIndex        =   3
      Top             =   1320
      Width           =   1095
      _ExtentX        =   1296
      _ExtentY        =   503
      BTYPE           =   14
      TX              =   "Select Icon"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
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
      MICON           =   "Form2.frx":0E1E
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   2880
      Top             =   720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Change Icon"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   720
      Width           =   1335
   End
   Begin VB.PictureBox Picture1 
      Height          =   560
      Left            =   1560
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   1
      Top             =   1200
      Width           =   560
   End
   Begin Project1.UsrSkin UsrSkin1 
      Height          =   1695
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   3495
      _ExtentX        =   6165
      _ExtentY        =   2990
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'carb0n crypter series
'by carb0n
'http://hackhound.org

Private Sub chameleonButton1_Click()
Form2.Hide
End Sub

Private Sub chameleonButton2_Click()
On Error Resume Next
CommonDialog1.DialogTitle = "Please select a icon"
CommonDialog1.FileName = vbNullString
CommonDialog1.DefaultExt = "ico"
CommonDialog1.Filter = "Icon Files (*.ico) | *.ico"
CommonDialog1.ShowOpen
Form2.Text1.Text = CommonDialog1.FileName
Form2.Picture1.Picture = LoadPicture(CommonDialog1.FileName)
End Sub

Private Sub chameleonButton3_Click()
Form2.Hide
End Sub

Private Sub Form_Load()
If Check1.Value = 1 Then
MsgBox "This will allow you to change your applications icon, please select a proper .ico file.", vbInformation
ElseIf Check1.Value = 0 Then
End If
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
