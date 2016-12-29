Imports System.Text
Imports System.IO
Module RandomStrings
    Sub Main()
        Dim KeyGen As RandomKeyGenerator
        Dim NumKeys As Integer
        Dim i_Keys As Integer
        Dim RandomKey As String
        Dim encryptionkey As String

        NumKeys = 2

        KeyGen = New RandomKeyGenerator
        KeyGen.KeyLetters = "abcdefghijklmnopqrstuvwxyz"
        KeyGen.KeyNumbers = "0123456789"
        KeyGen.KeyChars = 32
        For i_Keys = 1 To NumKeys
            RandomKey = KeyGen.Generate()
            encryptionkey = RandomKey

        Next
    End Sub
End Module
