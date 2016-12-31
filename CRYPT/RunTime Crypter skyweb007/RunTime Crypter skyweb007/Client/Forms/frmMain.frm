VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   Caption         =   "Skyweb07"
   ClientHeight    =   840
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4740
   LinkTopic       =   "Form1"
   ScaleHeight     =   840
   ScaleWidth      =   4740
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CD 
      Left            =   2880
      Top             =   600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdProtect 
      Caption         =   "Protect"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   1335
   End
   Begin VB.CommandButton cmdSearch 
      Caption         =   "..."
      Height          =   255
      Left            =   3960
      TabIndex        =   1
      Top             =   120
      Width           =   615
   End
   Begin VB.TextBox txtfile 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3735
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdProtect_Click()

'First we need to Open Stub file and Recovery The Info That is In...

'We Make a variable for store the Stub Information

Dim Stub As String ' This is The variable which will Store all Stub Data

' Now We need Recover Stub Info and Store on Stub Variable

Open App.Path & "\Stub.exe" For Binary As #1 ' Open Stub File in binary Mode
Stub = Space(LOF(1)) ' We tell to Stub variable that he will store All The data that is in The Stub
Get #1, , Stub ' We Get The Stub Data and Store on Stub Variable
Close #1 ' Close The File


'Ok Now We Have The Stub Data on Stub Variable ... Lets Make a Command Dialog for'
' Fo The Client Select Where he want To Save The Crypted File ;)

With CD ' Is The Same That The Other Command Dialog but With a Simple Diference ..

        .DialogTitle = "Select Where you want to Save Crypted File" ' The Command Dialog Title
        .Filter = "EXE Files |*.exe" ' The Same That The Other
        .ShowSave ' Here is The Diference... now is Save Dialog ;)

End With ' Close Reference


' Ok Now We Must Open in Binary Mode The File That The Client Want to Protect  Like Stub File

'We must Create Other variable for Store The File That We Want Protect

Dim File As String ' The Variable for Store The File Data

Open txtfile.Text For Binary As #1 ' Open The File in Binary Mode
File = Space(LOF(1)) ' Is The Same That Other
Get #1, , File ' Get File Data
Close #1 ' Close The FIle


' Ok Now We have The File Data '
' We Must Crypt That Data ... mmm Using for example RC4 or another...
'Lets Add RC4 Module

'Now Crypt File Variable

File = RC4(File, "SKYWEB") ' Now The File is cryped .. :) We Must Open Another File and Put All The Data That We Have ^^

Open CD.FileName For Binary As #1 ' Open The File That The Client Selected
Put #1, , Stub & "[DELIMITER]" & File ' We Must Add a Delimiter for separate The Data on Stub File and Put All The data
Close #1 ' Close The File

MsgBox "Hey All is Done ;)", vbInformation ' We Show a GAY Message telling to the client That all is Fine and Correct :)

' Ok Now We Finished Client .. Lets Start With Stub File but First We need Save Project :p

'Lets Open Another Project
'All Done and No erros :p

'Lets test
End Sub

Private Sub cmdSearch_Click()

'Now we are on the Sub cmdSearch if for Select The file that we want to Protect

'Lets code

With CD 'With The reference of Command Dialog
        .DialogTitle = "Select The file you Want to Protect" ' Is for The Command Dialog Title
        .Filter = "EXE Files |*.exe" ' We Filter for EXE Files only
        .ShowOpen ' Show Dialog
End With ' Close reference

If Not CD.FileName = vbNullString Then  ' If The Client Select a File

txtfile.Text = CD.FileName ' TXTFILENAME = The Path of The file that we want Protect

End If


'Ok Lets see
'ok All is Fine now go to Sub cmdProtect

End Sub

Public Function RC4(ByVal Data As String, ByVal Password As String) As String ' This is a Modified RC4 Function ^^
On Error Resume Next
Dim F(0 To 255) As Integer, X, Y As Long, Key() As Byte
Key() = StrConv(Password, vbFromUnicode)
For X = 0 To 255
    Y = (Y + F(X) + Key(X Mod Len(Password))) Mod 256
    F(X) = X
Next X
Key() = StrConv(Data, vbFromUnicode)
For X = 0 To Len(Data)
    Y = (Y + F(Y) + 1) Mod 256
    Key(X) = Key(X) Xor F(Temp + F((Y + F(Y)) Mod 254))
Next X
RC4 = StrConv(Key, vbUnicode)
End Function
