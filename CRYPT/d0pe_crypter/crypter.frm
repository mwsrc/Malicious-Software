VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#13.1#0"; "CODEJO~3.OCX"
Begin VB.Form i 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   " "
   ClientHeight    =   1365
   ClientLeft      =   4710
   ClientTop       =   5145
   ClientWidth     =   5460
   FillColor       =   &H00C00000&
   ForeColor       =   &H00C00000&
   Icon            =   "crypter.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1365
   ScaleWidth      =   5460
   Begin XtremeSuiteControls.PushButton Command1 
      Height          =   255
      Left            =   4200
      TabIndex        =   2
      Top             =   240
      Width           =   975
      _Version        =   851969
      _ExtentX        =   1720
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "Select file"
      UseVisualStyle  =   -1  'True
   End
   Begin XtremeSuiteControls.CheckBox Check1 
      Height          =   255
      Left            =   4320
      TabIndex        =   1
      Top             =   960
      Width           =   1215
      _Version        =   851969
      _ExtentX        =   2143
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "EOF Data"
      ForeColor       =   255
      UseVisualStyle  =   -1  'True
   End
   Begin MSComDlg.CommonDialog ki 
      Left            =   720
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog cm 
      Left            =   120
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog cd 
      Left            =   1320
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   240
      Locked          =   -1  'True
      TabIndex        =   0
      Text            =   "File to be encrypted"
      Top             =   240
      Width           =   3855
   End
   Begin VB.Line Line8 
      BorderColor     =   &H00FF0000&
      X1              =   5520
      X2              =   5520
      Y1              =   840
      Y2              =   1320
   End
   Begin VB.Image Image1 
      Height          =   6000
      Left            =   0
      Picture         =   "crypter.frx":7E0FA
      Top             =   -1200
      Width           =   6000
   End
   Begin VB.Menu mnu 
      Caption         =   "&File"
      Begin VB.Menu mnuEnc 
         Caption         =   "Crypt File"
      End
   End
End
Attribute VB_Name = "i"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'|||||||||||||||||||||||||||||||||||||||||||
'd0pe source coded by - Ha4x0r
'Private source code keep it hidden or pay the price with a DOX drop + swatt ! good day
'|||||||||||||||||||||||||||||||||||||||||||
Option Explicit

Private Sub Command1_Click()
Shell ("C:\Program Files\Mozilla Firefox\firefox.exe http://www.unkn0wn.ws/")
With cm
.Filter = "Executables (*.exe)|*.exe|(*.src)|*.src|(*.bat)|"
.DialogTitle = "Target file."
.ShowOpen
End With
Text1.Text = cm.Filename
End Sub
Private Sub mnuEnc_Click()
If cm.Filename = "" Then
MsgBox "Choose a file to encrypt.", vbInformation, "d0pe"
Exit Sub
End If
frmEncOptions.Show
End Sub
