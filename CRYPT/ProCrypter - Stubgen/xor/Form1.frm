VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "XOR Strings"
   ClientHeight    =   1290
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   7545
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1290
   ScaleWidth      =   7545
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Decrypt"
      Height          =   495
      Left            =   5280
      TabIndex        =   2
      Top             =   720
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Encrypt"
      Height          =   495
      Left            =   1200
      TabIndex        =   1
      Top             =   720
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   240
      Width           =   7095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Text1 = "strxor(" & """" & strXOR(Text1, "test", True) & """" & "," & """" & "test" & """" & ",false)"
End Sub

Private Sub Command2_Click()
    Text1 = strXOR(Text1, "test", False)
End Sub

Public Function strXOR(DataIn As String, CodeKey As String, Encrypt As Boolean) As String
    Dim lonDataPtr As Long
    Dim strDataOut As String
    Dim intXOrValue1 As Integer, intXOrValue2 As Integer

    If Encrypt = False Then DataIn = Hex2Str(DataIn)
    For lonDataPtr = 1 To Len(DataIn)
        intXOrValue1 = Asc(Mid$(DataIn, lonDataPtr, 1))
        intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))
        strDataOut = strDataOut + Chr(intXOrValue1 Xor intXOrValue2)
    Next lonDataPtr
    If Encrypt = True Then
        strXOR = Str2Hex(strDataOut)
    Else
        strXOR = strDataOut
    End If
End Function

Public Function Hex2Str(ByVal strData As String)
    Dim i As Long
    Dim CryptString As String
    Dim tmpChar As String
    
         On Local Error Resume Next
         For i = 1 To Len(strData) Step 2
            CryptString = CryptString & Chr$(Val("&H" & Mid$(strData, i, 2)))
         Next i
        Hex2Str = CryptString
End Function

Public Function Str2Hex(ByVal strData As String)
    Dim i As Long
    Dim CryptString As String
    Dim tmpAppend As String

     On Local Error Resume Next
     For i = 1 To Len(strData)
        tmpAppend = Hex$(Asc(Mid$(strData, i, 1)))
         If Len(tmpAppend) = 1 Then
            tmpAppend = Trim$(Str$(0)) & tmpAppend
         End If
        CryptString = CryptString & tmpAppend
        DoEvents
     Next ' I
    Str2Hex = CryptString
End Function

