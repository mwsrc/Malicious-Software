VERSION 5.00
Begin VB.Form frmabout 
   BackColor       =   &H00000000&
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   2790
   ClientLeft      =   225
   ClientTop       =   1380
   ClientWidth     =   4695
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmabout.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2790
   ScaleWidth      =   4695
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin Crypter.cmd btn 
      Height          =   300
      Index           =   7
      Left            =   4440
      TabIndex        =   0
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   529
      BTYPE           =   8
      TX              =   "X"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   0
      BCOLO           =   0
      FCOL            =   16777215
      FCOLO           =   128
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frmabout.frx":000C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   2
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "ABOUSAKR"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   20.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   495
      Index           =   5
      Left            =   1080
      TabIndex        =   8
      Top             =   1560
      Width           =   2280
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000080&
      Index           =   1
      X1              =   0
      X2              =   8160
      Y1              =   315
      Y2              =   315
   End
   Begin VB.Label baslik 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "About This Software"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   11.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   300
      Left            =   0
      TabIndex        =   7
      Top             =   0
      Width           =   4695
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "Ýkinciye Teþebbüs Ederse Üçüncüye Ömrü Yetmez"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   21
      Left            =   480
      TabIndex        =   6
      Top             =   2400
      Width           =   3570
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "Isýrmaya Kalkan Köpeðin Birincide Diþleri Sökülür"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   20
      Left            =   600
      TabIndex        =   5
      Top             =   2160
      Width           =   3405
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Customer"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   195
      Index           =   3
      Left            =   120
      TabIndex        =   4
      Top             =   1320
      Width           =   825
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "search@it_if_u_want.com"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   2
      Left            =   240
      TabIndex        =   3
      Top             =   960
      Width           =   1875
   End
   Begin VB.Label lbl 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "Coded By Who!"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   0
      Left            =   240
      TabIndex        =   2
      Top             =   720
      Width           =   1125
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Author"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   195
      Index           =   1
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   585
   End
End
Attribute VB_Name = "frmabout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub baslik_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    tasi Me
End Sub

Private Sub btn_Click(Index As Integer)
    Unload Me
End Sub

Private Sub Command1_Click()
For sayac = 0 To lbl.UBound
    Text1.Text = Text1.Text & vbCrLf & "lbl(" & sayac & ").caption=" & lbl(sayac).Caption
Next
End Sub

Private Sub Form_Load()
    SaydamYap Me, 240
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    tasi Me
End Sub
