Imports System.IO
Imports System.Text
Imports System.Security.Cryptography

Friend Class cTripleDES

    ' define the triple des provider

    Private m_des As New TripleDESCryptoServiceProvider

    ' define the string handler

    Private m_utf8 As New UTF8Encoding

    ' define the local property arrays

    Private m_key() As Byte
    Private m_iv() As Byte

    Public Sub New(ByVal key() As Byte, ByVal iv() As Byte)
        Me.m_key = key
        Me.m_iv = iv
    End Sub

    Public Function Encrypt(ByVal input() As Byte) As Byte()
        Return Transform(input, m_des.CreateEncryptor(m_key, m_iv))
    End Function

    Public Function Decrypt(ByVal input() As Byte) As Byte()
        Return Transform(input, m_des.CreateDecryptor(m_key, m_iv))
    End Function

    Public Function Encrypt(ByVal text As String) As String
        Dim input() As Byte = m_utf8.GetBytes(text)
        Dim output() As Byte = Transform(input, _
                        m_des.CreateEncryptor(m_key, m_iv))
        Return Convert.ToBase64String(output)
    End Function

    Public Function Decrypt(ByVal text As String) As String
        Try
            Dim input() As Byte = Convert.FromBase64String(text)
            Dim output() As Byte = Transform(input, _
                             m_des.CreateDecryptor(m_key, m_iv))
            Return m_utf8.GetString(output)
        Catch ex As Exception
            MsgBox("Error, Please check your characters.")
        End Try

    End Function

    Private Function Transform(ByVal input() As Byte, _
        ByVal CryptoTransform As ICryptoTransform) As Byte()
        ' create the necessary streams

        Dim memStream As MemoryStream = New MemoryStream
        Dim cryptStream As CryptoStream = New  _
            CryptoStream(memStream, CryptoTransform, _
            CryptoStreamMode.Write)
        ' transform the bytes as requested

        cryptStream.Write(input, 0, input.Length)
        cryptStream.FlushFinalBlock()
        ' Read the memory stream and convert it back into byte array

        memStream.Position = 0
        Dim result(CType(memStream.Length - 1, System.Int32)) As Byte
        memStream.Read(result, 0, CType(result.Length, System.Int32))
        ' close and release the streams

        memStream.Close()
        cryptStream.Close()
        ' hand back the encrypted buffer

        Return result
    End Function

End Class

'Public Class cTripleDES

'End Class
