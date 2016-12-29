VERSION 5.00
Begin VB.Form TOS 
   BorderStyle     =   0  'None
   Caption         =   "Carbon Crypter TOS"
   ClientHeight    =   1560
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   1560
   ScaleWidth      =   4560
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Exit"
      Height          =   255
      Left            =   720
      TabIndex        =   2
      Top             =   1200
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Continue"
      Height          =   255
      Left            =   2280
      TabIndex        =   1
      Top             =   1200
      Width           =   1455
   End
   Begin VB.Label Label1 
      Caption         =   $"TOS.frx":0000
      Height          =   2655
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4215
   End
End
Attribute VB_Name = "TOS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
frmMain.Show
Unload Me
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

