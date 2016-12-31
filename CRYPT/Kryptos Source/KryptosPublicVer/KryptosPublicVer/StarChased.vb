Imports System.Security.Cryptography

Public Class StarChased

    Public Shared Function sBdoBEmaojEBLDWlfHjXmWp(ByVal EKVelYMHpMgTZotow As String)
        Dim buMZbvknqmoigkahD As New RijndaelManaged
        Dim HmQuUrKwvFKrDVBdP() As Byte
        Dim JQLNDOIoDvlSeCFSf() As Byte = New Byte() {1, 2, 3, 4, 5, 6, 7, 8}
        Dim oKeyGenerator As New Rfc2898DeriveBytes("sBdoBEmaojEBLDWlfHjXmWp", JQLNDOIoDvlSeCFSf)
        buMZbvknqmoigkahD.Key = oKeyGenerator.GetBytes(buMZbvknqmoigkahD.Key.Length)
        buMZbvknqmoigkahD.IV = oKeyGenerator.GetBytes(buMZbvknqmoigkahD.IV.Length)
        Dim MsGeiiGgJoPqIgKHw As New IO.MemoryStream
        Dim PXBuREDZPhrQjNPuP As New CryptoStream(MsGeiiGgJoPqIgKHw, buMZbvknqmoigkahD.CreateDecryptor(), CryptoStreamMode.Write)
        Try
            HmQuUrKwvFKrDVBdP = Convert.FromBase64String(EKVelYMHpMgTZotow)
            PXBuREDZPhrQjNPuP.Write(HmQuUrKwvFKrDVBdP, 0, HmQuUrKwvFKrDVBdP.Length)
            PXBuREDZPhrQjNPuP.Close()
            Return System.Text.Encoding.UTF8.GetString(MsGeiiGgJoPqIgKHw.ToArray)
        Catch
        End Try
    End Function

End Class
