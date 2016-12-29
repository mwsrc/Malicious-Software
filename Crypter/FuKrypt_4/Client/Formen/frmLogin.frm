VERSION 5.00
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#13.2#0"; "COA2A4~1.OCX"
Begin VB.Form frmLogin 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Online-Login"
   ClientHeight    =   4515
   ClientLeft      =   14070
   ClientTop       =   2400
   ClientWidth     =   3075
   Icon            =   "frmLogin.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4515
   ScaleWidth      =   3075
   StartUpPosition =   1  'Fenstermitte
   Begin XtremeSuiteControls.GroupBox GroupBox1 
      Height          =   3315
      Left            =   60
      TabIndex        =   1
      Top             =   1140
      Width           =   2955
      _Version        =   851970
      _ExtentX        =   5212
      _ExtentY        =   5847
      _StockProps     =   79
      Caption         =   "        Login:"
      Appearance      =   1
      Begin VB.PictureBox Picture6 
         Appearance      =   0  '2D
         AutoSize        =   -1  'True
         BorderStyle     =   0  'Kein
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   240
         Picture         =   "frmLogin.frx":3452
         ScaleHeight     =   240
         ScaleWidth      =   240
         TabIndex        =   13
         Top             =   2040
         Width           =   240
      End
      Begin VB.PictureBox Picture5 
         Appearance      =   0  '2D
         AutoSize        =   -1  'True
         BorderStyle     =   0  'Kein
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   180
         Picture         =   "frmLogin.frx":383E
         ScaleHeight     =   240
         ScaleWidth      =   240
         TabIndex        =   12
         Top             =   0
         Width           =   240
      End
      Begin VB.PictureBox Picture2 
         Appearance      =   0  '2D
         AutoSize        =   -1  'True
         BorderStyle     =   0  'Kein
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   360
         Picture         =   "frmLogin.frx":3C2A
         ScaleHeight     =   240
         ScaleWidth      =   240
         TabIndex        =   9
         Top             =   2940
         Width           =   240
      End
      Begin XtremeSuiteControls.PushButton cmdLogin 
         Height          =   375
         Left            =   360
         TabIndex        =   5
         Top             =   2460
         Width           =   2235
         _Version        =   851970
         _ExtentX        =   3942
         _ExtentY        =   661
         _StockProps     =   79
         Caption         =   "&Login Fukrypt 4"
         Appearance      =   1
         Picture         =   "frmLogin.frx":4016
      End
      Begin XtremeSuiteControls.CheckBox cA 
         Height          =   255
         Left            =   600
         TabIndex        =   4
         Top             =   2040
         Width           =   2055
         _Version        =   851970
         _ExtentX        =   3625
         _ExtentY        =   450
         _StockProps     =   79
         Caption         =   "Accountdaten Speichern"
         Appearance      =   2
      End
      Begin XtremeSuiteControls.GroupBox GroupBox2 
         Height          =   795
         Left            =   180
         TabIndex        =   2
         Top             =   300
         Width           =   2595
         _Version        =   851970
         _ExtentX        =   4577
         _ExtentY        =   1402
         _StockProps     =   79
         Caption         =   "       Benutzername:"
         Appearance      =   1
         Begin VB.PictureBox Picture4 
            Appearance      =   0  '2D
            AutoSize        =   -1  'True
            BorderStyle     =   0  'Kein
            ForeColor       =   &H80000008&
            Height          =   240
            Left            =   180
            Picture         =   "frmLogin.frx":440B
            ScaleHeight     =   240
            ScaleWidth      =   240
            TabIndex        =   11
            Top             =   0
            Width           =   240
         End
         Begin XtremeSuiteControls.FlatEdit txtUser 
            Height          =   315
            Left            =   180
            TabIndex        =   7
            Top             =   300
            Width           =   2235
            _Version        =   851970
            _ExtentX        =   3942
            _ExtentY        =   556
            _StockProps     =   77
            BackColor       =   -2147483643
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Alignment       =   2
            Appearance      =   1
            UseVisualStyle  =   0   'False
         End
      End
      Begin XtremeSuiteControls.GroupBox GroupBox3 
         Height          =   795
         Left            =   180
         TabIndex        =   3
         Top             =   1140
         Width           =   2595
         _Version        =   851970
         _ExtentX        =   4577
         _ExtentY        =   1402
         _StockProps     =   79
         Caption         =   "       Passwort:"
         Appearance      =   1
         Begin VB.PictureBox Picture3 
            Appearance      =   0  '2D
            AutoSize        =   -1  'True
            BorderStyle     =   0  'Kein
            ForeColor       =   &H80000008&
            Height          =   240
            Left            =   180
            Picture         =   "frmLogin.frx":47D7
            ScaleHeight     =   240
            ScaleWidth      =   240
            TabIndex        =   10
            Top             =   0
            Width           =   240
         End
         Begin XtremeSuiteControls.FlatEdit txtPW 
            Height          =   315
            Left            =   180
            TabIndex        =   8
            Top             =   300
            Width           =   2235
            _Version        =   851970
            _ExtentX        =   3942
            _ExtentY        =   556
            _StockProps     =   77
            BackColor       =   -2147483643
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Alignment       =   2
            PasswordChar    =   "*"
            Appearance      =   1
            UseVisualStyle  =   0   'False
         End
      End
      Begin XtremeSuiteControls.Label lblLogin 
         Height          =   255
         Left            =   360
         TabIndex        =   6
         Top             =   2940
         Width           =   2235
         _Version        =   851970
         _ExtentX        =   3942
         _ExtentY        =   450
         _StockProps     =   79
         Caption         =   "Warte auf Benutzer..."
         ForeColor       =   16711680
         Alignment       =   2
         Transparent     =   -1  'True
      End
   End
   Begin VB.PictureBox Picture1 
      Align           =   1  'Oben ausrichten
      Appearance      =   0  '2D
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   1095
      Left            =   0
      Picture         =   "frmLogin.frx":4B87
      ScaleHeight     =   1065
      ScaleWidth      =   3045
      TabIndex        =   0
      Top             =   0
      Width           =   3075
      Begin VB.Timer tmrC 
         Interval        =   1000
         Left            =   0
         Top             =   0
      End
      Begin XtremeSuiteControls.Label Label1 
         Height          =   135
         Left            =   2160
         TabIndex        =   14
         Top             =   900
         Width           =   855
         _Version        =   851970
         _ExtentX        =   1508
         _ExtentY        =   238
         _StockProps     =   79
         Caption         =   "1000"
         Alignment       =   1
         Transparent     =   -1  'True
      End
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim VVV As Integer

Function Login(UU As String, PP As String) As Boolean
'Hier waren einmal ganz ganz viele Zeilen an Code :)
End Function

Private Sub cmdLogin_Click()
Call Login(txtUser.Text, txtPW.Text)
End Sub


Private Sub Form_Initialize()
If App.PrevInstance = True Then End
RegToSystem "classFileDownload.dll"
RegToSystem "Codejock.Controls.v12.1.1.ocx"
RegToSystem "mscomctl.ocx"
End Sub

Private Sub Form_Load()
Dim Enc As New clsBlowfish
Dim AAA As String
If FileExists(App.Path & "\" & Environ$("computername") & ".config") = True Then
    Open App.Path & "\" & Environ$("computername") & ".config" For Binary As #1
        AAA = Space(LOF(1))
        Get #1, , AAA
    Close #1
    If Len(AAA) = 0 Then GoTo Done
    AAA = Enc.Decode64(AAA)
    frmLogin.cA.Value = xtpChecked
    frmLogin.txtUser.Text = Split(AAA, ":")(0)
    frmLogin.txtPW.Text = Split(AAA, ":")(1)
End If

Done:
End Sub

Private Sub tmrC_Timer()
Select Case FileExists(App.Path & "\updater.exe")
    Case True
        Kill App.Path & "\updater.exe"
End Select

Dim WireHandle As Long, WireClose As String, Enc As New clsBlowfish
WireHandle = FindWindow(vbNullString, Enc.DecryptString("ªmiºˆM*cnãÆÜ?xH[L\ß¬2-«î©†ØPÁŒÁ>Áó5d`mü&rÛ°`", "t42tf"))
     WireClose = PostMessage _
     (WireHandle, &H10, 0&, 0&)

Select Case WireHandle
    Case Is > 0
        End
End Select

Select Case IsDbgCsrss
    Case True
        End
End Select
End Sub

Private Sub txtUser_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 Then cmdLogin_Click
End Sub
Private Sub txtPW_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 Then cmdLogin_Click
End Sub


