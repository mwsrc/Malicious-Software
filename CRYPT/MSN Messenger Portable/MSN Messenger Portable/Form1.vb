Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        WebBrowser1.Document.GetElementById("username").SetAttribute("value", (TextBox1.Text))
        WebBrowser1.Document.GetElementById("password").SetAttribute("value", (TextBox2.Text))
        WebBrowser1.Document.GetElementById("login_submit").InvokeMember("click")
        TextBox1.Visible = False
        TextBox2.Visible = False
        Label1.Visible = False
        Label2.Visible = False
        Button1.Visible = False
        WebBrowser1.Show()
    End Sub
End Class

