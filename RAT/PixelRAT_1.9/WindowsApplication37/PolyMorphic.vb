'PolyMorPhic Xor Encryption
'Made By Mihrabi-DoNo
'
'
'All we need to do is to add a random byte to first byte, and the result will be added to the next byte.
'For the decryption, we do it backward.
'
'Usage :
'         Dim Crypter As New PolyMorphic(Key,Method) 'the key is a string, better be long and random, and the method is an Enum.
'         Dim CryptedText As String = Crypter.PolyCrypt("PlainText")
'         Dim DeCryptedText As String = Crypter.PolyDeCrypt(CryptedText)
'
'Same thing for the decryption. You can use String or Byte() as parameters.
'
'
'Give Credits If you Use.
'
'Importing System.Text for the encoding. i will be converting from byte arrays and strings and vise-versa.
Imports System.Text
Public Class PolyMorphic
    'Variable for the Key.
    Private sKey As String = ""
    'Property, will Give us acces to the key.
    Public Property Key() As String
        Get
            Return sKey
        End Get
        Set(ByVal value As String)
            sKey = value
        End Set
    End Property
    'Inisalization. (New Constructor)
    Public Sub New(ByVal Key As String)
        Me.Key = Key
    End Sub
    Public Sub New()
        Me.Key = ""
    End Sub
    'This Will convert String to bytes,then call the other function.
    Public Function PolyCrypt(ByVal Data As String) As String
        Return Encoding.Default.GetString(PolyCrypt(Encoding.Default.GetBytes(Data)))
    End Function
    'This one also Will convert String to bytes,then call the other function.
    Public Function PolyDeCrypt(ByVal Data As String) As String
        Return Encoding.Default.GetString(PolyDeCrypt(Encoding.Default.GetBytes(Data)))
    End Function
    'Main PolyMorphic Encryption.
    Public Function PolyCrypt(ByVal Data() As Byte) As Byte()
        'We declare a byte array, just one byte bigger then the data.
        Dim ReturnBuffer(Data.Length) As Byte
        'we assain The first one with a random byte.
        ReturnBuffer(0) = Convert.ToByte(New Random().Next(1, 127))
        'now for each byte in data
        For i = 0 To Data.Length - 1
            'we add the previous byte to the next byte Mod 128. the first byte is random,
            'so will will get random bytes all the way.
            ReturnBuffer(i + 1) = ModuloByte(ReturnBuffer(i), Data(i))
        Next
        'We Call the Selected Encryption to crypt the randomized Data.
        Return XorCrypt(ReturnBuffer, Encoding.Default.GetBytes(Key))
    End Function
    'Main PolyMorphic Decryption.
    Public Function PolyDeCrypt(ByVal Data() As Byte) As Byte()
        'This Function is the exact reverse of the crypt function.
        'we should Decrypt to get our last randomized data.
        Data = XorCrypt(Data, Encoding.Default.GetBytes(Key))
        'Now in the other function the return value is a one byte bigger array. lets remove that one
        Dim ReturnBuffer(Data.Length - 2) As Byte
        'we started from Byte n# 0 to the last one. we'll play it reversed now. 
        For i = Data.Length - 1 To 1 Step -1
            'We just remove The previous byte value from the current one Mod 128. simple
            ReturnBuffer(i - 1) = ModuloByte(Data(i), -Data(i - 1))
        Next
        'That's it. The Buffer is one byte less then the data. Perfect. Return it.
        Return ReturnBuffer
    End Function
    'A Positive Mod 128. This will prevent a non byte value. the result is always >= 0 and <= 127
    Private Function ModuloByte(ByVal MyByte As Byte, ByVal Addition As Int16) As Byte
        While Addition < 0
            Addition += 128
        End While
        Return Convert.ToByte((MyByte + Addition) Mod 128)
    End Function
    'Xor Encryption.
    Private Function XorCrypt(ByVal Data() As Byte, ByVal Key() As Byte) As Byte()
        If Key.Length <> 0 Then
            For i = 0 To Data.Length - 1
                Data(i) = Data(i) Xor ModuloByte(Key(i Mod Key.Length), [Key](Key(i Mod Key.Length) Mod Key.Length)) Xor [Key](((i + (i Mod 7)) Mod Key.Length) Mod Key.Length)
            Next
        End If
        Return Data
    End Function
    Public Function XorCrypt(ByVal Data As String, ByVal Key As String) As String
        Return Encoding.Default.GetString(XorCrypt(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(Key)))
    End Function
End Class
