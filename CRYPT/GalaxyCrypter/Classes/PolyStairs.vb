Imports System.Text
Public Class PolyMorphicStairs
    Public Shared Function PolyCrypt(ByRef Data() As Byte, ByVal Key() As Byte, Optional ByVal ExtraRounds As UInteger = 0) As Byte()
        Array.Resize(Data, Data.Length + 1)
        Data(Data.Length - 1) = Convert.ToByte(New Random().Next(1, 255))
        For i = (Data.Length - 1) * (ExtraRounds + 1) To 0 Step -1
            Data(i Mod Data.Length) = CByte(CInt((Data(i Mod Data.Length)) + CInt(Data((i + 1) Mod Data.Length))) Mod 256) Xor Key(i Mod Key.Length)
        Next
        Return Data
    End Function
End Class