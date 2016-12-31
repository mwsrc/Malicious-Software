VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   Caption         =   "L1ght-Crypt3r 0.1"
   ClientHeight    =   1230
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   3165
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   Picture         =   "frmMain.frx":0CCA
   ScaleHeight     =   82
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   211
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog Dlg 
      Left            =   2760
      Top             =   720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdCrypt 
      Height          =   375
      Left            =   120
      Picture         =   "frmMain.frx":DB42
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   840
      Width           =   2895
   End
   Begin VB.CommandButton cmdBrowse 
      Height          =   255
      Left            =   2520
      Picture         =   "frmMain.frx":1142A
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   120
      Width           =   615
   End
   Begin VB.TextBox txtFile 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      ForeColor       =   &H80000004&
      Height          =   285
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   0
      Text            =   "~Pfad~"
      Top             =   120
      Width           =   2415
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const FileSplit = "<@#@>"
Const Pass = "RC4Passwort"


Private Sub cmdBrowse_Click()
With Dlg
    .Filter = "Ausführbare Datei (*.exe) | *.exe"
    .DialogTitle = "Wähle die zu Cryptende Datei aus!"
    .ShowOpen
End With
txtFile.Text = Dlg.Filename

End Sub

Private Sub cmdCrypt_Click()
On Error GoTo Err
Dim c  As New clsSimpleXOR
Dim sStub As String, sFile As String
Open App.Path & "\stub.exe" For Binary As #1
sStub = Space(LOF(1))
Get #1, , sStub
Close #1
Open txtFile.Text For Binary As #1
sFile = Space(LOF(1))
Get #1, , sFile
Close #1
Open App.Path & "\Crypted by L1ghti.exe" For Binary As #1
Put #1, , sStub & FileSplit & c.EncryptString(sFile, Pass)
Close #1
MsgBox txtFile.Text & " Succesfully Crypted"
Err:
MsgBox "Fehler beim Crypten(" & Err.Description & ")"
End Sub
