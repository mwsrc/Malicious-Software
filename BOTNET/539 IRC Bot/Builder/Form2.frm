VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   4  'Festes Werkzeugfenster
   Caption         =   "539 IRC Bot"
   ClientHeight    =   4605
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   4710
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4605
   ScaleWidth      =   4710
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'Bildschirmmitte
   Begin VB.Label LabelCO 
      Alignment       =   2  'Zentriert
      Caption         =   "http://c0derz.com/"
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   0
      MouseIcon       =   "Form2.frx":0000
      MousePointer    =   99  'Benutzerdefiniert
      TabIndex        =   11
      Top             =   4320
      Width           =   4695
   End
   Begin VB.Label LabelBC 
      Alignment       =   2  'Zentriert
      Caption         =   "http://boredcoders.com/"
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   0
      MouseIcon       =   "Form2.frx":0152
      MousePointer    =   99  'Benutzerdefiniert
      TabIndex        =   10
      Top             =   4080
      Width           =   4695
   End
   Begin VB.Label LabelFH 
      Alignment       =   2  'Zentriert
      Caption         =   "http://five-three-nine.org/"
      ForeColor       =   &H00FF0000&
      Height          =   255
      Index           =   0
      Left            =   0
      MouseIcon       =   "Form2.frx":02A4
      MousePointer    =   99  'Benutzerdefiniert
      TabIndex        =   9
      Top             =   3840
      Width           =   4695
   End
   Begin VB.Label Label 
      Alignment       =   2  'Zentriert
      Caption         =   "Visit:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   0
      TabIndex        =   8
      Top             =   3600
      Width           =   4695
   End
   Begin VB.Label Label 
      Alignment       =   2  'Zentriert
      Caption         =   "        crusader727 - f0Gx -  themasterhacker"
      Height          =   255
      Index           =   0
      Left            =   0
      TabIndex        =   7
      Top             =   3240
      Width           =   4695
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Zentriert
      Caption         =   "GreetZ:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   0
      TabIndex        =   6
      Top             =   3000
      Width           =   4695
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Zentriert
      Caption         =   "c0re"
      Height          =   255
      Left            =   0
      TabIndex        =   5
      Top             =   2640
      Width           =   4695
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Zentriert
      Caption         =   "Hamtaro"
      Height          =   255
      Left            =   0
      TabIndex        =   4
      Top             =   2400
      Width           =   4695
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Zentriert
      Caption         =   "Coder:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   0
      TabIndex        =   3
      Top             =   2160
      Width           =   4695
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Zentriert
      Caption         =   "Main Coder:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   0
      TabIndex        =   2
      Top             =   1560
      Width           =   4695
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Zentriert
      Caption         =   "Five-Three-Nine"
      Height          =   255
      Left            =   0
      TabIndex        =   1
      Top             =   1800
      Width           =   4695
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Zentriert
      Caption         =   "539 IRC Bot About:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   1080
      Width           =   4695
   End
   Begin VB.Image Image1 
      Height          =   975
      Left            =   0
      Picture         =   "Form2.frx":03F6
      Top             =   0
      Width           =   4800
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib _
     "shell32.dll" Alias "ShellExecuteA" _
     (ByVal hwnd As Long, ByVal lpOperation _
     As String, ByVal lpFile As String, ByVal _
     lpParameters As String, ByVal lpDirectory _
     As String, ByVal nShowCmd As Long) As Long

Private Sub Form_Load()
Form2.Left = Screen.Width / 2 - Form1.Width / 2
Form2.Top = Screen.Height / 2 - Form1.Height / 2
End Sub


Private Sub LabelBC_Click()
 ShellExecute 0&, vbNullString, "www.boredcoders.com", vbNullString, _
      vbNullString, SW_SHOWNORMAL
End Sub

Private Sub LabelCO_Click()
 ShellExecute 0&, vbNullString, "http://c0derz.com/", vbNullString, _
      vbNullString, SW_SHOWNORMAL
End Sub

Private Sub LabelFH_Click(Index As Integer)
 ShellExecute 0&, vbNullString, "http://five-three-nine.org", vbNullString, _
      vbNullString, SW_SHOWNORMAL
End Sub
