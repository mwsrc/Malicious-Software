Imports System.Text 'Above Public Class

Public Class StairsEncryption
    Public Shared Function Crypt(ByVal Data As String, ByVal key As String) As String
  Return Encoding.Default.GetString(Crypt(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(key)))
    End Function
    Public Shared Function Crypt(ByVal Data() As Byte, ByVal key() As Byte) As Byte()
  For i = 0 To (Data.Length * 2) + Key.Length
    Data(i Mod Data.Length) = CByte(CInt((Data(i Mod Data.Length)) + CInt(Data((i + 1) Mod Data.Length))) Mod 256) Xor key(i Mod key.Length)
  Next
  Return Data
    End Function
    Public Shared Function DeCrypt(ByVal Data As String, ByVal key As String) As String
  Return Encoding.Default.GetString(DeCrypt(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(key)))
    End Function
    Public Shared Function DeCrypt(ByVal Data() As Byte, ByVal key() As Byte) As Byte()
  For i = (Data.Length * 2) + Key.Length To 0 Step -1
    Data(i Mod Data.Length) = CByte((CInt(Data(i Mod Data.Length) Xor key(i Mod key.Length)) - CInt(Data((i + 1) Mod Data.Length)) + 256) Mod 256)
  Next
  Return Data
    End Function
End Class