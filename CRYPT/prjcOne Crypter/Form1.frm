VERSION 5.00
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#12.1#0"; "CODEJO~2.OCX"
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "prjCone [BETA]"
   ClientHeight    =   2175
   ClientLeft      =   45
   ClientTop       =   405
   ClientWidth     =   4185
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2175
   ScaleWidth      =   4185
   StartUpPosition =   2  'CenterScreen
   Begin XtremeSuiteControls.PushButton PushButton1 
      Height          =   255
      Left            =   120
      TabIndex        =   14
      Top             =   1320
      Width           =   1215
      _Version        =   786433
      _ExtentX        =   2143
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "About"
      Appearance      =   6
   End
   Begin XtremeSuiteControls.GroupBox gLOGO 
      Height          =   1815
      Left            =   1560
      TabIndex        =   12
      Top             =   240
      Width           =   2535
      _Version        =   786433
      _ExtentX        =   4471
      _ExtentY        =   3201
      _StockProps     =   79
      Caption         =   "Coder: haZl0oh"
      UseVisualStyle  =   -1  'True
      Begin VB.Image Image1 
         BorderStyle     =   1  'Fixed Single
         Height          =   1065
         Left            =   360
         Picture         =   "Form1.frx":0000
         Top             =   360
         Width           =   1785
      End
   End
   Begin XtremeSuiteControls.GroupBox gMisc 
      Height          =   1815
      Left            =   1560
      TabIndex        =   6
      Top             =   240
      Width           =   2535
      _Version        =   786433
      _ExtentX        =   4471
      _ExtentY        =   3201
      _StockProps     =   79
      Caption         =   "Misc"
      UseVisualStyle  =   -1  'True
   End
   Begin XtremeSuiteControls.GroupBox gClone 
      Height          =   1815
      Left            =   1560
      TabIndex        =   5
      Top             =   240
      Width           =   2535
      _Version        =   786433
      _ExtentX        =   4471
      _ExtentY        =   3201
      _StockProps     =   79
      Caption         =   "Clone"
      UseVisualStyle  =   -1  'True
      Begin XtremeSuiteControls.PushButton cmd_choose2 
         Height          =   255
         Left            =   1560
         TabIndex        =   10
         Top             =   720
         Width           =   855
         _Version        =   786433
         _ExtentX        =   1508
         _ExtentY        =   450
         _StockProps     =   79
         Caption         =   "Browse"
         Appearance      =   6
      End
      Begin XtremeSuiteControls.FlatEdit txtClone 
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   360
         Width           =   2295
         _Version        =   786433
         _ExtentX        =   4048
         _ExtentY        =   450
         _StockProps     =   77
         BackColor       =   -2147483643
      End
      Begin XtremeSuiteControls.CommonDialog cmdClone 
         Left            =   2160
         Top             =   1080
         _Version        =   786433
         _ExtentX        =   423
         _ExtentY        =   423
         _StockProps     =   4
      End
   End
   Begin XtremeSuiteControls.GroupBox gCrypt 
      Height          =   1815
      Left            =   1560
      TabIndex        =   4
      Top             =   240
      Width           =   2535
      _Version        =   786433
      _ExtentX        =   4471
      _ExtentY        =   3201
      _StockProps     =   79
      Caption         =   "Crypt"
      UseVisualStyle  =   -1  'True
      Begin XtremeSuiteControls.PushButton cmd_finish 
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   720
         Width           =   855
         _Version        =   786433
         _ExtentX        =   1508
         _ExtentY        =   450
         _StockProps     =   79
         Caption         =   "Encrypt"
         Appearance      =   6
      End
      Begin XtremeSuiteControls.PushButton cmd_choose1 
         Height          =   255
         Left            =   1560
         TabIndex        =   11
         Top             =   720
         Width           =   855
         _Version        =   786433
         _ExtentX        =   1508
         _ExtentY        =   450
         _StockProps     =   79
         Caption         =   "Browse"
         Appearance      =   6
      End
      Begin XtremeSuiteControls.FlatEdit txtFile 
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   360
         Width           =   2295
         _Version        =   786433
         _ExtentX        =   4048
         _ExtentY        =   450
         _StockProps     =   77
         BackColor       =   -2147483643
         Text            =   "...."
         Appearance      =   6
         UseVisualStyle  =   0   'False
      End
      Begin XtremeSuiteControls.CheckBox cEof 
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   1440
         Width           =   2055
         _Version        =   786433
         _ExtentX        =   3625
         _ExtentY        =   450
         _StockProps     =   79
         Caption         =   "File contains eof data"
         Appearance      =   6
      End
      Begin XtremeSuiteControls.CommonDialog cmdCypt 
         Left            =   2040
         Top             =   1080
         _Version        =   786433
         _ExtentX        =   423
         _ExtentY        =   423
         _StockProps     =   4
      End
   End
   Begin XtremeSuiteControls.PushButton PushButton3 
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   1680
      Width           =   1215
      _Version        =   786433
      _ExtentX        =   2143
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "Close"
      Appearance      =   6
   End
   Begin XtremeSuiteControls.PushButton cmd_misc 
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   960
      Width           =   1215
      _Version        =   786433
      _ExtentX        =   2143
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "Misc"
      Enabled         =   0   'False
      Appearance      =   6
   End
   Begin XtremeSuiteControls.PushButton cmd_clone 
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   1215
      _Version        =   786433
      _ExtentX        =   2143
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "Clone"
      Enabled         =   0   'False
      Appearance      =   6
   End
   Begin XtremeSuiteControls.PushButton cmd_crypt 
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   1215
      _Version        =   786433
      _ExtentX        =   2143
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "Crypt"
      Appearance      =   6
   End
   Begin XtremeSuiteControls.FlatEdit txtShouts 
      Height          =   495
      Left            =   1080
      TabIndex        =   16
      Top             =   2880
      Width           =   2295
      _Version        =   786433
      _ExtentX        =   4048
      _ExtentY        =   873
      _StockProps     =   77
      BackColor       =   -2147483643
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Text            =   "FlatEdit1"
      MultiLine       =   -1  'True
      ScrollBars      =   2
      Appearance      =   6
      UseVisualStyle  =   0   'False
   End
   Begin XtremeSuiteControls.FlatEdit txtCredits 
      Height          =   375
      Left            =   1080
      TabIndex        =   18
      Top             =   3840
      Width           =   2295
      _Version        =   786433
      _ExtentX        =   4048
      _ExtentY        =   661
      _StockProps     =   77
      BackColor       =   -2147483643
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Text            =   "FlatEdit1"
      MultiLine       =   -1  'True
      ScrollBars      =   2
      Appearance      =   6
      UseVisualStyle  =   0   'False
   End
   Begin VB.Image Image2 
      Height          =   1380
      Left            =   1800
      Picture         =   "Form1.frx":28DE
      Top             =   480
      Width           =   1875
   End
   Begin XtremeSuiteControls.Label Label2 
      Height          =   255
      Left            =   1800
      TabIndex        =   17
      Top             =   3480
      Width           =   735
      _Version        =   786433
      _ExtentX        =   1296
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "-Credits-"
   End
   Begin XtremeSuiteControls.Label Label1 
      Height          =   255
      Left            =   1800
      TabIndex        =   15
      Top             =   2400
      Width           =   735
      _Version        =   786433
      _ExtentX        =   1296
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "-Shouts-"
   End
   Begin VB.Line Line1 
      X1              =   1440
      X2              =   1440
      Y1              =   240
      Y2              =   2040
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' haZl0oh
' TheGoonSquad.Org
Private Sub cmd_choose1_Click()
With cmdCypt

    .FileName = ""
    .ShowOpen
    .CancelError = True
    .InitDir = App.Path
    
End With

txtFile.Text = cmdCypt.FileName

End Sub

Private Sub cmd_choose2_Click()
With cmdClone

    .FileName = ""
    .ShowOpen
    .CancelError = True
    .InitDir = App.Path
    
End With

txtClone.Text = cmdClone.FileName

End Sub

Private Sub cmd_clone_Click()
gCrypt.Visible = False
gClone.Visible = True
gMisc.Visible = False
cmd_misc.Enabled = True
Form1.Height = "2655"

End Sub

Private Sub cmd_crypt_Click()
gCrypt.Visible = True
gClone.Visible = False
gMisc.Visible = False
gLOGO.Visible = False
cmd_clone.Enabled = True

Form1.Height = "2655"

End Sub

Private Sub cmd_finish_Click()
On Error Resume Next
Dim Stub As String
Dim options As String
Dim Key As String
Dim crypted As String
Dim savepath As String
'----------------------------
Key = "0x00923232"
savepath = App.Path & "\Encoded.exe"
'get my stub---------------------------------------------

If Not txtClone.Text = "" Then
CloneFileInformation txtClone.Text, App.Path & "\stub.dll"
ExtractIcons txtClone.Text, App.Path & "\icons" & "\icon.ico"
ChangeIcon App.Path & "\stub.dll", App.Path & "\icons" & "\icon.ico"
End If




Open App.Path & "\stub.dll" For Binary As #1
    Stub = Space(LOF(1))
    Get #1, , Stub
Close #1



'-------------------------------------------------------


' file for encrypting workthrough ----------------------

If Not txtFile.Text = "" Then
Open txtFile.Text For Binary As #2
    crypted = Space(LOF(2))
Get #2, , crypted
Close #2
Else
    Call MsgBox("No valid File selected", vbInformation, "information")
    Exit Sub
End If

crypted = VernamCode(crypted, Key)


'---------------------------------------


   

' write my stuff into encoded file -------------





Open savepath For Binary As #3

        Put #3, , Stub
        Put #3, , options
        Put #3, , "³³X³³"
        Put #3, , crypted
        Put #3, , "³³X³³"
'        Put #3, , Key
'        Put #3, , "³³X³³"
Close #3

'-----------------------------------------

' eof settings-----------------------------------------
If cEof.Value = 1 Then
        WriteEOFData savepath, GetEOFDatas(txtFile.Text)
   Else
    
End If


'------------------------------------------------------

MsgBox "Processing of file finished", vbInformation


End Sub

Private Sub cmd_misc_Click()
    gCrypt.Visible = False
    gClone.Visible = False
    gMisc.Visible = True
    gLOGO.Visible = False
  Form1.Height = "2655"

End Sub

Private Sub Form_Load()
On Error Resume Next

MkDir App.Path & "\icons"
'---------------------------------------groupbox visibility settings
    gLOGO.Visible = True
    gCrypt.Visible = False
    gClone.Visible = False
    gMisc.Visible = False
    gAbout.Visible = False
'---------------------------------------

txtShouts.Text = "eNvisiOn" & vbCrLf & _
"2sly + Family + Dawg" & vbCrLf & _
"7" & vbCrLf & _
"Exidious" & vbCrLf & _
"Mastermaefju" & vbCrLf & _
"Dalsim" & vbCrLf & _
"Messsy" & vbCrLf & _
"Whole TGS Staff" & vbCrLf & _
"H7labs.com"



txtCredits.Text = "ZeR0/0cm4n" & vbCrLf & _
"Noble" & vbCrLf & _
"Arkadiy Olovyannikov"

End Sub

Private Sub PushButton1_Click()
Form1.Height = "4860"

gCrypt.Visible = False
    gClone.Visible = False
    gMisc.Visible = False
    gLOGO.Visible = False
    txtShouts.Visible = True
    txtCredits.Visible = True
End Sub



Private Sub PushButton3_Click()
End
End Sub
