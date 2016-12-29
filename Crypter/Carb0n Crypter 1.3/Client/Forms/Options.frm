VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Options 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Options"
   ClientHeight    =   1470
   ClientLeft      =   10830
   ClientTop       =   3480
   ClientWidth     =   4155
   Icon            =   "Options.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1470
   ScaleWidth      =   4155
   Begin VB.PictureBox Picture1 
      Height          =   560
      Left            =   120
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   4
      Top             =   840
      Width           =   560
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   2280
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Change Icon"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   180
      Width           =   2895
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   2
      Text            =   "Icon Path ..."
      Top             =   480
      Width           =   2895
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Browse"
      Height          =   255
      Left            =   3120
      TabIndex        =   1
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Save"
      Height          =   255
      Left            =   3120
      TabIndex        =   0
      Top             =   1080
      Width           =   855
   End
End
Attribute VB_Name = "Options"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
If Check1.Value = 1 Then
MsgBox "This will allow you to change your applications icon, please select a proper .ico file.", vbInformation
ElseIf Check1.Value = 0 Then
End If
End Sub

Private Sub Command1_Click()
Options.Hide
End Sub

Private Sub Command2_Click()
On Error Resume Next
CommonDialog1.DialogTitle = "Please select a icon"
CommonDialog1.FileName = vbNullString
CommonDialog1.DefaultExt = "ico"
CommonDialog1.Filter = "Icon Files (*.ico) | *.ico"
CommonDialog1.ShowOpen
Options.Text1.Text = CommonDialog1.FileName
Options.Picture1.Picture = LoadPicture(CommonDialog1.FileName)
End Sub

