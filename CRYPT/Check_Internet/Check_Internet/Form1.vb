Public Class Form1
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If IsWebConnected() Then
            PictureBox1.BackgroundImage = My.Resources.Ok
            PictureBox1.BackgroundImageLayout = ImageLayout.Center
            Label1.Text = "You Are Connected To The Internet"
        Else
            PictureBox1.BackgroundImage = My.Resources.Delete
            PictureBox1.BackgroundImageLayout = ImageLayout.Center
            Label1.Text = "You Are Not Connected To The Internet"
        End If
    End Sub
End Class
