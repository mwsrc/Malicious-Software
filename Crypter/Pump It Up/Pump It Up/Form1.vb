Imports System.IO
Public Class Form1
    Function ExePump(ByVal File As String, ByVal Bytes As Integer) As Object

        Dim buffer As Byte() = New Byte(((Bytes) + 1) - 1) {}
        Dim stream As New FileStream(File, FileMode.Append)
        Try
            stream.Seek(0, SeekOrigin.End)
            Dim num2 As Integer = (buffer.Length - 1)
            Dim i As Integer = 0
            Do While (i <= num2)
                stream.WriteByte(buffer(i))
                i += 1
            Loop
        Finally
            stream.Close()
        End Try
    End Function

    Private Sub pumpbtn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles pumpbtn.Click
        ExePump(filebox.Text, bytesbox.Text)
        MsgBox("File size has been increased by " + (bytesbox.Text) + (" bytes!"))
        filebox.Clear()
        bytesbox.Clear()
    End Sub

    Private Sub loadbtn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles loadbtn.Click
        OpenFileDialog1.ShowDialog()
    End Sub

    Private Sub OpenFileDialog1_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles OpenFileDialog1.FileOk
        For Each file As String In OpenFileDialog1.FileNames()
            filebox.Text = file
        Next
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        End
    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        System.Diagnostics.Process.Start("www.natespages.ucoz.com")
    End Sub
End Class

