Public Class Form1

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        WebBrowser1.Navigate("http://scanner.novirusthanks.org/")
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        WebBrowser1.Document.GetElementById("upfile").InvokeMember("click")
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        WebBrowser1.Document.GetElementById("submitfile").InvokeMember("click")
        Label2.Text = ("Scanning...")
        Timer1.Start()
        PictureBox1.Visible = True
        Button1.Enabled = False
        CheckBox1.Enabled = False
        Button2.Enabled = False
        Me.Text = ("NVT Scanner Scanning")
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        If WebBrowser1.DocumentText.Contains("Finished") Then
            Me.Text = ("NVT Scanner Finished")
            Label2.ForeColor = Color.Green
            Label2.Text = ("Finished")
            PictureBox1.Visible = False
            Label3.Visible = True
            checkifinfected()
            Timer1.Stop()
        End If
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        WebBrowser1.Document.GetElementById("submitav").InvokeMember("click")
    End Sub

    Private Sub Label3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label3.Click
        TextBox2.Hide()
        Label2.ForeColor = Color.Black
        Label2.Text = "Select File To Scan"
        WebBrowser1.Navigate("http://scanner.novirusthanks.org/")
        Button1.Enabled = True
        CheckBox1.Enabled = True
        Button2.Enabled = True
        Label3.Visible = False
        Label5.Text = ""
        Me.Text = ("NVT Scanner")
    End Sub


    Sub checkifinfected()
        If WebBrowser1.DocumentText.Contains("CLEAN") Then
            Label5.ForeColor = Color.Green
            Label5.Text = "CLEAN (view results)"
        End If
        If WebBrowser1.DocumentText.Contains("INFECTED") Then
            Label5.ForeColor = Color.Red
            Label5.Text = "INFECTED (view results)"
        End If
    End Sub


    Private Sub Label5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label5.Click
        TextBox2.BringToFront()
        TextBox2.Text = Me.WebBrowser1.Document.Body.InnerText
        TextBox2.Visible = True
    End Sub

End Class
