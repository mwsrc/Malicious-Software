Imports System.Security.Cryptography

Public Class AES
    Public Shared Function Rijndaelcrypt(ByVal File As String, ByVal Key As String)
        Dim oAesProvider As New RijndaelManaged
        Dim btClear() As Byte
        Dim btSalt() As Byte = New Byte() {1, 2, 3, 4, 5, 6, 7, 8}
        Dim oKeyGenerator As New Rfc2898DeriveBytes(Key, btSalt)
        oAesProvider.Key = oKeyGenerator.GetBytes(oAesProvider.Key.Length)
        oAesProvider.IV = oKeyGenerator.GetBytes(oAesProvider.IV.Length)
        Dim ms As New IO.MemoryStream
        Dim cs As New CryptoStream(ms, _
          oAesProvider.CreateEncryptor(), _
          CryptoStreamMode.Write)
        btClear = System.Text.Encoding.UTF8.GetBytes(File)
        cs.Write(btClear, 0, btClear.Length)
        cs.Close()
        File = Convert.ToBase64String(ms.ToArray)
        Return File
    End Function
  
End Class
