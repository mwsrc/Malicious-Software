Imports System.IO

Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim b As Byte() = My.Resources.calc                                '
        Dim TheFIlePath As String = Application.StartupPath & "\calc.exe"  ' 
        Dim TempFile As System.IO.FileStream = IO.File.Create(TheFIlePath) '  all this loads the file
        TempFile.Write(b, 0, b.Length)                                     '  into a byte array and writes 
        TempFile.Close()                                                   '  it to the same folder as the app

        System.Diagnostics.Process.Start(Application.StartupPath & "\calc.exe")  ' start the file

        End Sub
End Class
