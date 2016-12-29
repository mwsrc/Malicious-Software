Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        On Error Resume Next
        My.Computer.Network.DownloadFile((TextBox1.Text), (TextBox2.Text))
        MessageBox.Show("Done!")
    End Sub
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        On Error Resume Next
        My.Computer.Network.UploadFile((TextBox4.Text), (TextBox3.Text))
        MessageBox.Show("Done!")
    End Sub
End Class
