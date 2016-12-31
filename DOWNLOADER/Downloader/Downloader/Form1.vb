Public Class Form1
    Dim b As String = My.Resources.a
    Private Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged
    End Sub

    Private Sub CheckBox2_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox2.CheckedChanged
    End Sub

    Private Sub CheckBox3_CheckedChanged(sender As Object, e As EventArgs)
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'StarT ===>
        If TextBox1.Text = "" Then
            MsgBox("Please PuT UrL")
            End
        End If
        If TextBox2.Text = "" Then
            MsgBox("Please PuT Name")
            End
        End If
        b = b.Replace("UrL", TextBox1.Text)
        b = b.Replace("NaMe", TextBox2.Text)
        If CheckBox2.Checked Then
            b = b.Replace(";$DEV", "$DEV")
            b = b.Replace(";'ping", "'ping")
            b = b.Replace(";'", "'")
            b = b.Replace(";FileWrite", "FileWrite")
            b = b.Replace(";Run", "Run")
            b = b.Replace(";Exit", "Exit")
        End If
        If CheckBox3.Checked = False Then
            b = b.Replace(";a", "")
        End If


        Dim a As New SaveFileDialog
        a.Filter = " DownloaDer | *.au3"
        a.ShowDialog()
        My.Computer.FileSystem.WriteAllText(a.FileName, b, False)
        MsgBox("Save Complete")
    End Sub
End Class
