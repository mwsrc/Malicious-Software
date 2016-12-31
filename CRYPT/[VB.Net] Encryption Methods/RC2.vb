Public Function RC2Encrypt(ByVal strInput As String, ByVal strPassword As String) As String
  Dim RC2 As New System.Security.Cryptography.RC2CryptoServiceProvider
  Dim HashRC2 As New System.Security.Cryptography.MD5CryptoServiceProvider
  Dim strEncrypted As String = ""
  Try
    Dim Hash() As Byte = HashRC2.ComputeHash(System.Text.ASCIIEncoding.ASCII.GetBytes(strPassword))

    RC2.Key = Hash
    RC2.Mode = Security.Cryptography.CipherMode.ECB
    Dim DESEncrypter As System.Security.Cryptography.ICryptoTransform = RC2.CreateEncryptor
    Dim Buffer As Byte() = System.Text.ASCIIEncoding.ASCII.GetBytes(strInput)
    strEncrypted = Convert.ToBase64String(DESEncrypter.TransformFinalBlock(Buffer, 0, Buffer.Length))
    Return strEncrypted
  Catch ex As Exception
  End Try
    End Function

    Public Function RC2Decrypt(ByVal strInput As String, ByVal strPassword As String) As String
  Dim RC2 As New System.Security.Cryptography.RC2CryptoServiceProvider
  Dim HashRC2 As New System.Security.Cryptography.MD5CryptoServiceProvider
  Dim strDecrypted As String = ""
  Try
    Dim Ha