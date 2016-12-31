Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        System.Diagnostics.Process.Start _
        ("http://www.google.com/search?hl=en&q=-inurl%3A%28htm|html|dyndns|php%29+intitle%3A%22index+of%22+%2B%22last+modified%22+%2B%22parent+directory%22+%2Bdescription+%2Bsize+%2B%28.mp3%29+%22" & TextBox1.Text.Replace(" ", "%20") & "%22")

    End Sub

    Private Sub TextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged
        AcceptButton = Button1
    End Sub
End Class
