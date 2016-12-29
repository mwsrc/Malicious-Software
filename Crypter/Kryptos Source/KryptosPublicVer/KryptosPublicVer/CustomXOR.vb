Public Class CustomXOR

    Public Overridable Function CustomXOR_Encrypt(ByVal Input As String, ByVal pass As String) As String
        Dim out As New System.Text.StringBuilder
        Dim Hash As New System.Security.Cryptography.MD5CryptoServiceProvider
        Dim XorHash As Byte() = Hash.ComputeHash(System.Text.Encoding.ASCII.GetBytes(pass))
        Dim u As Integer
        For i As Integer = 0 To Input.Length - 1
            Dim tmp As String = Hex(Asc(Input(i)) Xor XorHash(u))
            If tmp.Length = 1 Then tmp = "0" & tmp
            out.Append(tmp)
            If u = pass.Length - 1 Then u = 0 Else u = u + 1
        Next
        Return out.ToString
    End Function
End Class
