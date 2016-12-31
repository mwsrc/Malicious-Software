Attribute VB_Name = "Encryption"
Public Function abc(ByVal Data As String, ByVal Password As String) As String
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
abc = StrConv(Key, vbUnicode)
End Function
