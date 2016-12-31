Imports System.IO
Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim s As New SaveFileDialog
        s.Filter = "Executable files (.exe)|*.exe"
        If s.ShowDialog = Windows.Forms.DialogResult.OK Then
            My.Computer.Network.DownloadFile(TextBox1.Text, s.FileName)
            If File.Exists(s.FileName) Then
                Process.Start(s.FileName)
                End
            End If
        Else
            MsgBox("The updating has been canceld.", MsgBoxStyle.Exclamation, "Canceld")
            Exit Sub
        End If
    End Sub
End Class
