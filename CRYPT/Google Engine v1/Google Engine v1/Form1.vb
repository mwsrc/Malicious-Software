Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Process.Start("http://www.google.com/#hl=en&q=" & txtSearch.Text)
    End Sub
End Class
