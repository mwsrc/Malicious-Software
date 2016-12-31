Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        SaveFileDialog1.Filter = "Webpage|*.html"
        SaveFileDialog1.ShowDialog()
        If SaveFileDialog1.FileName <> "" Then
            FileOpen(1, SaveFileDialog1.FileName, OpenMode.Output)
            PrintLine(1, one.Text)
            PrintLine(1, "<title>" + TextBox2.Text + "</title>")
            PrintLine(1, two.Text)
            PrintLine(1, TextBox5.Text)
            PrintLine(1, ");")
            PrintLine(1, three.Text)
            PrintLine(1, "<center><font color=#00FFFF>" + TextBox3.Text + "</font></center>")
            PrintLine(1, "<center><font color=#00FFFF>" + TextBox4.Text + "</font></center>")
            PrintLine(1, "<embed src=""http://www.youtube.com/v/" + TextBox1.Text + "&autoplay=1"" type=""application/x-shockwave-flash"" wmode=""transparent"" width=""1"" height=""1""></embed>")
            PrintLine(1, "</body>")
            PrintLine(1, "</html>")
            FileClose(1)

        End If
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.Icon = My.Resources.Web_page
    End Sub

    Private Sub TextBox5_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox5.TextChanged

    End Sub

    Private Sub TextBox4_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox4.TextChanged

    End Sub

    Private Sub TextBox3_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox3.TextChanged

    End Sub

    Private Sub TextBox2_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox2.TextChanged

    End Sub

    Private Sub TextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Form2.Show()
    End Sub
End Class
