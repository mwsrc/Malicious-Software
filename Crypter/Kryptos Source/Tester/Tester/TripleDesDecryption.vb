Imports System.Security.Cryptography
Imports System.Text

Public Class TripleDesDecryption
    Public Shared Function DES(ByVal b As String, ByVal c As String, ByVal d As Boolean) As String 'TripleDES
        Dim keyArray As Byte()
        Dim toEncryptArray As Byte() = Convert.FromBase64String(b)
        If d Then
            Dim hashmd5 = New MD5CryptoServiceProvider()
            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(c))
        Else
            keyArray = UTF8Encoding.UTF8.GetBytes(c)
        End If
        Dim tdes = New TripleDESCryptoServiceProvider()
        tdes.Key = keyArray
        tdes.Mode = CipherMode.ECB
        tdes.Padding = PaddingMode.PKCS7
        Dim cTransform As ICryptoTransform = tdes.CreateDecryptor()
        Dim resultArray As Byte() = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length)
        Return UTF8Encoding.UTF8.GetString(resultArray)
    End Function
End Class
