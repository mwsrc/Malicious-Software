VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Abstract Software Protection                 Anti reverse engineering"
   ClientHeight    =   6885
   ClientLeft      =   45
   ClientTop       =   405
   ClientWidth     =   7365
   FillColor       =   &H00FFFFFF&
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6885
   ScaleWidth      =   7365
   StartUpPosition =   3  'Windows Default
   Begin AbstractProtection.CommandXP CommandXP7 
      Height          =   375
      Left            =   5520
      TabIndex        =   16
      Top             =   3840
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   661
      BTYPE           =   3
      TX              =   "Change Icon"
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
      BCOL            =   16315377
      BCOLO           =   16315377
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form1.frx":17002
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Join with..."
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
      Left            =   120
      TabIndex        =   12
      Top             =   5520
      Width           =   5055
      Begin AbstractProtection.CommandXP CommandXP6 
         Height          =   375
         Left            =   4440
         TabIndex        =   14
         Top             =   360
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   ". . ."
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
         BCOL            =   16315377
         BCOLO           =   16315377
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "Form1.frx":1701E
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.TextBox Text2 
         Enabled         =   0   'False
         Height          =   375
         Left            =   120
         TabIndex        =   13
         Text            =   "File to bind."
         Top             =   360
         Width           =   4215
      End
      Begin VB.Label Label1 
         BackColor       =   &H00FFFFFF&
         Caption         =   "The file will be executed."
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   840
         Width           =   4695
      End
   End
   Begin AbstractProtection.CommandXP CommandXP5 
      Height          =   375
      Left            =   5400
      TabIndex        =   11
      Top             =   6240
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   661
      BTYPE           =   3
      TX              =   "Exit"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   16315377
      BCOLO           =   16315377
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form1.frx":1703A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin AbstractProtection.CommandXP CommandXP4 
      Height          =   375
      Left            =   5400
      TabIndex        =   10
      Top             =   5640
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   661
      BTYPE           =   3
      TX              =   "About"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   16315377
      BCOLO           =   16315377
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form1.frx":17056
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin AbstractProtection.CommandXP CommandXP2 
      Height          =   495
      Left            =   5280
      TabIndex        =   8
      Top             =   4680
      Width           =   1935
      _ExtentX        =   3413
      _ExtentY        =   873
      BTYPE           =   3
      TX              =   "Protect File"
      ENAB            =   0   'False
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   16315377
      BCOLO           =   16315377
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form1.frx":17072
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Options"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2775
      Left            =   120
      TabIndex        =   3
      Top             =   2520
      Width           =   5055
      Begin VB.CheckBox Check4 
         BackColor       =   &H00FFFFFF&
         Caption         =   "PE Entry Point Ofuscation"
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
         Left            =   240
         TabIndex        =   7
         Top             =   960
         Width           =   2655
      End
      Begin VB.CheckBox Check3 
         BackColor       =   &H00FFFFFF&
         Caption         =   "PE Realign"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   6
         Top             =   360
         Value           =   1  'Checked
         Width           =   2055
      End
      Begin VB.CheckBox Check2 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Un-hook All API"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   5
         Top             =   2160
         Width           =   2055
      End
      Begin VB.CheckBox Check1 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Anti-VMWare,      Anti-VirtualPC,    Anti-VirtualBox,    Anti-SandBoxie,    Anti-Anubis,        Anti-Debuggers."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   240
         TabIndex        =   4
         Top             =   1440
         Width           =   4335
      End
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Text            =   "Path exefile to crypt."
      Top             =   1920
      Width           =   5055
   End
   Begin AbstractProtection.CommandXP CommandXP1 
      Height          =   375
      Left            =   5280
      TabIndex        =   1
      Top             =   1920
      Width           =   1935
      _ExtentX        =   3413
      _ExtentY        =   661
      BTYPE           =   3
      TX              =   "Select file"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   16315377
      BCOLO           =   16315377
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form1.frx":1708E
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      FillColor       =   &H00FFFFFF&
      ForeColor       =   &H00FFFFFF&
      Height          =   1935
      Left            =   -120
      Picture         =   "Form1.frx":170AA
      ScaleHeight     =   1905
      ScaleWidth      =   7545
      TabIndex        =   0
      Top             =   -240
      Width           =   7575
   End
   Begin MSComDlg.CommonDialog CD 
      Left            =   5280
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin AbstractProtection.CommandXP CommandXP3 
      Height          =   375
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Width           =   1935
      _ExtentX        =   3413
      _ExtentY        =   661
      BTYPE           =   3
      TX              =   "Protect File"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   16315377
      BCOLO           =   16315377
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form1.frx":1C77A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Image Image1 
      Appearance      =   0  'Flat
      Height          =   795
      Left            =   5880
      Picture         =   "Form1.frx":1C796
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   855
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim icono As String
Dim reg As Object, Pid As Variant, GUID As Variant
Dim LENGUID As Long, LENPID As Long, TempS As String
Dim X As Long, SPID As String, SGUID As String, HWID As String
Const regPID = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProductId"
Const regGUID = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\MachineGuid"





Private Sub CommandXP1_Click()
CD.Filter = "Exe files(.exe)|*.exe|"
CD.Action = 1
Text1.Text = CD.FileName
CommandXP2.Enabled = True
End Sub

Private Sub CommandXP2_Click()
Dim EOFData() As Byte
Dim p() As Byte, s() As Byte, protect() As Byte, bind() As Byte
Dim longitud As Long, i As Long
Dim ext() As String
longitud = FileLen(Text1) - 1
ReDim p(longitud)
'ReDim s(FileLen("runpe.exe") - 1)
ReDim protect(longitud)


If Check4.Value = 1 Then
    If ChangeOEPFromFile(Text1) Then
    Else
        MsgBox "Can't change Entry point, please unselect option", , "ERROR"
        GoTo fin
    End If
End If

Open Text1 For Binary As #1
    Get 1#, , p
    EOFData = GetEOFData(1)
Close 1#


'For i = 0 To longitud
'   If (i Mod 5) = 0 Then
'        protect(i) = p(i) Xor &HF
'    ElseIf (i Mod 5) = 1 Then
 '       protect(i) = p(i) Xor &HC
'     ElseIf (i Mod 5) = 2 Then
'        protect(i) = p(i) Xor &H8
'    ElseIf (i Mod 5) = 3 Then
'        protect(i) = p(i) Xor &H7
''    ElseIf (i Mod 5) = 4 Then
'        protect(i) = p(i) Xor &HB
'    End If
'Next i
EncodeArrayB p()


If Check1.Value = 0 And Check2.Value = 0 Then
        s() = LoadResData(101, "CUSTOM")
End If

If Check1.Value = 1 And Check2.Value = 0 Then
        s() = LoadResData(102, "CUSTOM")
End If

If Check1.Value = 0 And Check2.Value = 1 Then
        s() = LoadResData(103, "CUSTOM")
End If


If Check1.Value = 1 And Check2.Value = 1 Then
        s() = LoadResData(104, "CUSTOM")
End If
    
'Open "runpe.exe" For Binary As #2
'    Get 2#, , s
'Close 2#

If Text2 <> "File to bind." And Text2 <> "" Then
ReDim bind(FileLen(Text2))
    Open Text2 For Binary As #3
        Get #3, , bind
    Close 3#
    ext = Split(Text2, ".")
    ext(0) = ext(UBound(ext))

End If

Open Text1 For Binary As #1
    Put 1#, , s
    Put 1#, , "|\/RoCa\/|"
    Put 1#, , encoded()
    Put 1#, , "|\/RoCa\/|"
    Put 1#, , bind
    Put 1#, , "|\/RoCa\/|"
    On Error Resume Next
    Put 1#, , ext(0)
    Put 1#, , "|\/RoCa\/|"
    Put 1#, , EOFData
Close 1#

If icono <> "" Then
Dim errx As String
MsgBox "Some icons may break the file. Test it.", , "Abstract"
ReplaceIcons icono, Text1, errx
End If

If Check3.Value = 1 Then
     RealignPEFromFile Text1
End If

s() = LoadResData(105, "CUSTOM")
Open Environ("TMP") & "/upx.exe" For Binary As #1
    Put 1#, , s
Close 1#

Shell Environ("TMP") & "\upx.exe -9 " & """" & Text1 & """", vbHide


MsgBox "Crypt succeful!!", , "Crypt"
fin:
End Sub

Private Sub CommandXP4_Click()
Form2.Show
End Sub

Private Sub CommandXP5_Click()
End
End Sub

Private Sub CommandXP6_Click()
CD.Filter = "Todos los archivos."
CD.Action = 1
Text2.Text = CD.FileName
End Sub

Private Sub CommandXP7_Click()
CD.Filter = "Exe files(.ico)|*.ico|"
CD.Action = 1
icono = CD.FileName
Image1.ToolTipText = icono
Image1.Picture = LoadPicture(Image1.ToolTipText)
End Sub

Private Sub Form_Load()
'Call TestDebug
'Dim ola As String
'ola = CreateID()
'If ola <> "dfsdfsdf" Then
'    End
'End If

End Sub
Public Function CreateID() As String
On Error Resume Next
Call TestDebug
Set reg = CreateObject("wscript.shell")
Pid = Replace(reg.regread(regPID), "-", "")
GUID = Replace(reg.regread(regGUID), "-", "")

LENPID = Len(Pid)
LENGUID = Len(GUID)
    
For X = 1 To LENPID
TempS = Hex((Asc(Mid$(Pid, X, 1)) Xor 23) Xor 14)
SPID = SPID & TempS
Next X
SPID = StrReverse(SPID)

For X = 1 To LENGUID
TempS = Hex((Asc(Mid$(GUID, X, 1)) Xor 23) Xor 14)
SGUID = SGUID & TempS
Next X
SGUID = StrReverse(SGUID)
HWID = StrReverse(SGUID & SPID)
CreateID = HWID
End Function
