Imports System.Text
Imports System.Security.Cryptography

Public Class _3des
    Public Shared Function a(ByVal b As String, ByVal c As String, ByVal d As Boolean) As String
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
