Imports System.Text
Imports System.Security.Cryptography 'Above Public Class

Public Class MD5

  Public Shared Function Encrypt(ByVal bytData() As Byte, _
    ByVal sKey As String, _
  Optional ByVal tMode As CipherMode = CipherMode.ECB, _
  Optional ByVal tPadding As PaddingMode = PaddingMode.PKCS7) As Byte()
    Dim keyArray As Byte()

    Dim hashmd5 As New MD5CryptoServiceProvider()
    keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(sKey))
    hashmd5.Clear()

    Dim tdes As New TripleDESCryptoServiceProvider()
    tdes.Key = keyArray
    tdes.Mode = tMode
    tdes.Padding = tPadding

    Dim cTransform As ICryptoTransform = tdes.CreateEncryptor()
    Dim resultArray As Byte() = cTransform.TransformFinalBlock(bytData, 0, bytData.Length)
    tdes.Clear()
    Return resultArray
  End Function

  Public Shared Function Decrypt(ByVal bytData() As Byte, _
  ByVal sKey As String, _
    Optional ByVal tMode As CipherMode = CipherMode.ECB, _
    Optional ByVal tPadding As PaddingMode = PaddingMode.PKCS7) As Byte()
    Dim keyArray As Byte()
    Dim hashmd5 As New MD5CryptoServiceProvider()
    keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(sKey))
    hashmd5.Clear()

    Dim tdes As New TripleDESCryptoServiceProvider()
    tdes.Key = keyArray
    tdes.Mode = tMode
    tdes.Padding = tPadding

    Dim cTransform As ICryptoTransform = tdes.CreateDecryptor()
    Dim resultArray As Byte() = cTransform.TransformFinalBlock(bytData, 0, bytData.Length)
    tdes.Clear()
    Return resultArray
  End Function

    End Class