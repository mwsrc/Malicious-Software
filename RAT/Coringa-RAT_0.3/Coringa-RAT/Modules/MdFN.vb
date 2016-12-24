Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.IO
Imports System.IO.Compression
Imports System.Runtime.InteropServices
Imports System.Security.Cryptography
Imports System.Text
Imports System.Windows.Forms
Imports Microsoft.Win32

Public Module MdFN

    Public Function BS(ByRef B As Byte()) As String
        Return Encoding.Default.GetString(B)
    End Function

    Public Function DEB(ByRef s As String) As String
        Dim str As String
        Dim num As Integer = 0
Label_0002:
        Try
            Dim bytes As Byte() = Convert.FromBase64String(s)
            str = Encoding.UTF8.GetString(bytes)
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            num += 1
            If (num = 3) Then
                str = Nothing
                ProjectData.ClearProjectError()
            Else
                s = (s & "=")
                ProjectData.ClearProjectError()
                GoTo Label_0002
            End If
        End Try
        Return str
    End Function

    Public Function ENB(ByRef s As String) As String
        Return Convert.ToBase64String(Encoding.UTF8.GetBytes(s))
    End Function

    Public Function FDE(ByVal base64 As String) As Byte()
        Return Convert.FromBase64String(base64)
    End Function

    Public Function FEN(ByVal data As Byte()) As String
        Return Convert.ToBase64String(data)
    End Function

    Public Function fx(ByVal b As Byte(), ByVal WRD As String) As Array
        Dim list As New List(Of Byte())
        Dim stream As New MemoryStream
        Dim stream2 As New MemoryStream
        Dim strArray As String() = Strings.Split(MdFN.BS(b), WRD, -1, CompareMethod.Binary)
        stream.Write(b, 0, strArray(0).Length)
        stream2.Write(b, (strArray(0).Length + WRD.Length), (b.Length - (strArray(0).Length + WRD.Length)))
        list.Add(stream.ToArray)
        list.Add(stream2.ToArray)
        stream.Dispose()
        stream2.Dispose()
        Return list.ToArray
    End Function

    Public Function getMD5Hash(ByVal s As String) As String
        Return MdFN.getMD5Hash(MdFN.SB(s))
    End Function

    Public Function getMD5Hash(ByVal B As Byte()) As String
        B = New MD5CryptoServiceProvider().ComputeHash(B)
        Dim str2 As String = ""
        Dim num As Byte
        For Each num In B
            str2 = (str2 & num.ToString("x2"))
        Next
        Return str2
    End Function

    Public Function GFORM(ByVal Name As String) As Form
        Return Application.OpenForms.Item(Name)
    End Function

    Public Function GetValueReg(ByVal Nome As String) As String
        Try
            Dim str As String
            str = Conversions.ToString(Registry.CurrentUser.OpenSubKey(("Software\Coringa-Rat 0.3")).GetValue(Nome))
            Return str
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Function

    Public Function HM() As String
        Return String.Concat(New String() {"[", Conversions.ToString(TimeOfDay.Hour), ":", Conversions.ToString(TimeOfDay.Minute), ":", Conversions.ToString(TimeOfDay.Second), "] "})
    End Function

    Public Function REV(ByVal s As String) As String
        Dim str As String = ""
        Dim ch As Char
        For Each ch In s.ToCharArray
            str = (ch.ToString & str)
        Next
        Return str
    End Function

    Public Function RN(ByVal c As Integer) As String
        Dim random As New Random
        Dim str3 As String = ""
        Dim str As String = "abcdefghijklmnopqrstuvwxyz"
        Dim num2 As Integer = c
        Dim i As Integer = 1
        Do While (i <= num2)
            str3 = (str3 & Conversions.ToString(str.Chars(random.Next(0, str.Length))))
            i += 1
        Loop
        Return str3
    End Function

    Public Function SB(ByRef S As String) As Byte()
        Return Encoding.Default.GetBytes(S)
    End Function

    <DllImport("User32", CharSet:=CharSet.Ansi, SetLastError:=True, ExactSpelling:=True)> _
    Public Function ShowWindow(ByVal HWND As IntPtr, ByVal nCmdShow As Integer) As Boolean
    End Function

    Public Function Siz(ByVal s As Long) As String
        If (s.ToString.Length < 4) Then
            Return (Conversions.ToString(s) & " Bytes")
        End If
        Dim str As String = ""
        Dim num As Double = (CDbl(s) / 1024)
        If (num < 1024) Then
            str = "KB"
        Else
            num = (num / 1024)
            If (num < 1024) Then
                str = "MB"
            Else
                num = (num / 1024)
                str = "GB"
            End If
        End If
        Return (num.ToString(".0") & " " & str)
    End Function

    Public Sub CriarSubKey(ByVal Nome As String, ByVal Dados As String)
        Try
            Registry.CurrentUser.CreateSubKey(("Software\Coringa-Rat 0.3")).SetValue(Nome, Dados)
        Catch ex As Exception

        End Try
    End Sub

    Public Function ZIP(ByVal B As Byte(), ByRef CM As Boolean) As Byte()
        If CM Then
            Dim stream2 As New MemoryStream
            Dim stream As New GZipStream(stream2, CompressionMode.Compress, True)
            stream.Write(B, 0, B.Length)
            stream.Dispose()
            stream2.Position = 0
            Dim buffer2 As Byte() = New Byte((CInt(stream2.Length) + 1) - 1) {}
            stream2.Read(buffer2, 0, buffer2.Length)
            stream2.Dispose()
            Return buffer2
        End If
        Dim stream4 As New MemoryStream(B)
        Dim stream3 As New GZipStream(stream4, CompressionMode.Decompress)
        Dim buffer As Byte() = New Byte(4 - 1) {}
        stream4.Position = (stream4.Length - 5)
        stream4.Read(buffer, 0, 4)
        Dim count As Integer = BitConverter.ToInt32(buffer, 0)
        stream4.Position = 0
        Dim array As Byte() = New Byte(((count - 1) + 1) - 1) {}
        stream3.Read(array, 0, count)
        stream3.Dispose()
        stream4.Dispose()
        Return array
    End Function


    Public Function GEN(ByVal longitud As Integer, ByVal NNNNN As Integer) As String
        Dim cadena As String = "012345678WERTYUIQWERTYUIOPL123456789KJHGFDSAZXC123456789VBNMQWERTY9QWERTYUIQWERTYUIOPLKJHGF123456789DSAZXCVBNMQWERTYUIOPLKJH123456789GFDSAZXCVBNMQWERTYUI123456789OPLKJHGFDSAYUIOPLKJHGFDSAZX123456789123456789123456789CVBNMOPLKJHGFDSAZXCVBNM"
        Dim r As New Random
        Dim l As Integer
        Dim sb As New System.Text.StringBuilder
        For iA = 1 To longitud
            l = r.Next(0, NNNNN)
            sb.Append(cadena.Substring(l, 1))
        Next

        Return sb.ToString()
    End Function

    Public Function StringOfuscador(ByVal longitud As Integer) As String
        Dim cadena As String = "QWERTYUIOPÇLKJHGFDSAZXQWERTYUIOPÇLKJHGFDSAZXCVBNMqwertyuiopçlkjhgfdsazxcvbnmkjsdklfjgkljhdfskjhgkjdhfskHJDSAHFHDFIKHGMJjghkdfhçgdfhjhlQWERTYUIOPÇLKJHGFDSAZXCVBNMqwertyuiopçlkjhgfdsazxcvbnmkjsdklfjgkljhdfskjhgkjdhfskHJDSAHFHDFIKHGMJjghkdfhçgdfhjhlQWERTYUIOPÇLKJHGFDSAZXCVBNMqwertyuiopçlkjhgfdsazxcvbnmkjsdklfjgkljhdfskjhgkjdhfskHJDSAHFHDFIKHGMJjghkdfhçgdfhjhlQWERTYUIOPÇLKJHGFDSAZXCVBNMqwertyuiopçlkjhgfdsazxcvbnmkjsdklfjgkljhdfskjhgkjdhfskHJDSAHFHDFIKHGMJjghkdfhçgdfhjhlQWERTYUIOPÇLKJHGFDSAZXCVBNMqwertyuiopçlkjhgfdsazxcvbnmkjsdklfjgkljhdfskjhgkjdhfskHJDSAHFHDFIKHGMJjghkdfhçgdfhjhlQWERTYUIOPÇLKJHGFDSAZXCVBNMqwertyuiopçlkjhgfdsazxcvbnmkjsdklfjgkljhdfskjhgkjdhfskHJDSAHFHDFIKHGMJjghkdfhçgdfhjhlQWERTYUIOPÇLKJHGFDSAZXCVBNMqwertyuiopçlkjhgfdsazxcvbnmkjsdklfjgkljhdfskjhgkjdhfskHJDSAHFHDFIKHGMJjghkdfhçgdfhjhlQWERTYUIOPÇLKJHGFDSAZXCVBNMqwertyuiopçlkjhgfdsazxcvbnmkjsdklfjgkljhdfskjhgkjdhfskHJDSAHFHDFIKHGMJjghkdfhçgdfhjhlCVBNMqwertyuiopçlkjhgfdsazxcvbnmkjsdklfjgkljhdfskjhgkjdhfskHJDSAHFHDFIKHGMJjghkdfhçgdfhjhl"
        Dim r As New Random
        Dim l As Integer
        Dim sb As New System.Text.StringBuilder
        For iA = 1 To longitud
            l = r.Next(0, 62)
            sb.Append(cadena.Substring(l, 1))
        Next
        Return sb.ToString()
    End Function

    Public Function GENUMERIC()
        Randomize()
        Dim a = Int((10 - 1) * Rnd()) + 1
        Return a
    End Function

End Module
