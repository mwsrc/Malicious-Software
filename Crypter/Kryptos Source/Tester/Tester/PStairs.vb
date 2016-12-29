Imports System.Text 'Place above Public Class

Public Class PolyMorphicStairs
    Overloads Shared Function PolyCrypt(ByVal Data As String, ByVal Key As String, Optional ByVal ExtraRounds As UInteger = 0) As String
        Dim buff() As Byte = PolyCrypt(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(Key), ExtraRounds)
        PolyCrypt = Encoding.Default.GetString(buff)
        Erase buff
    End Function
    Overloads Shared Function PolyDeCrypt(ByVal Data As String, ByVal Key As String, Optional ByVal ExtraRounds As UInteger = 0) As String
        Dim buff() As Byte = PolyDeCrypt(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(Key), ExtraRounds)
        PolyDeCrypt = Encoding.Default.GetString(buff)
        Erase buff
    End Function
    Overloads Shared Function PolyCrypt(ByRef Data() As Byte, ByVal Key() As Byte, Optional ByVal ExtraRounds As UInteger = 0) As Byte()
        Array.Resize(Data, Data.Length + 1)
        Data(Data.Length - 1) = Convert.ToByte(New Random().Next(1, 255))
        For i = (Data.Length - 1) * (ExtraRounds + 1) To 0 Step -1
            Data(i Mod Data.Length) = CByte(CInt((Data(i Mod Data.Length)) + CInt(Data((i + 1) Mod Data.Length))) Mod 256) Xor Key(i Mod Key.Length)
        Next
        Return Data
    End Function
    Overloads Shared Function PolyDeCrypt(ByRef Data() As Byte, ByVal Key() As Byte, Optional ByVal ExtraRounds As UInteger = 0) As Byte()
        For i = 0 To (Data.Length - 1) * (ExtraRounds + 1)
            Data(i Mod Data.Length) = CByte((CInt(Data(i Mod Data.Length) Xor Key(i Mod Key.Length)) - CInt(Data((i + 1) Mod Data.Length)) + 256) Mod 256)
        Next
        Array.Resize(Data, Data.Length - 1)
        Return Data
    End Function
End Class