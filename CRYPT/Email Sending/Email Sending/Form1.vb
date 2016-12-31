Public Class Form1
    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        End
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim SMTPClient As New System.Net.Mail.SmtpClient
        If ComboBox1.Text = "Hotmail" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.live.com", 25)
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "Yahoo" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.yahoo.co.uk")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "Gmail" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.gmail.com")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "AOL" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.aol.com")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "BlueYonder" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.blueyonder.co.uk")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "NTLWorld" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.ntlworld.com")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "TalkTalk" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.TalkTalk.net")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "Tiscali" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.tiscali.co.uk")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "Virgin" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.virgin.net")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "Wanadoo" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.wanadooadsl.net")
            MsgBox("Email Sending")
        End If
        SMTPClient.Credentials = New System.Net.NetworkCredential(TextBox1.Text, TextBox2.Text)
        SMTPClient.EnableSsl = True
        SMTPClient.Send(TextBox1.Text, TextBox3.Text, TextBox4.Text, RichTextBox1.Text)
    End Sub

    Private Sub SendMailToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SendMailToolStripMenuItem.Click
        Dim SMTPClient As New System.Net.Mail.SmtpClient
        If ComboBox1.Text = "Hotmail" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.live.com", 25)
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "Yahoo" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.yahoo.co.uk")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "Gmail" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.gmail.com")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "AOL" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.aol.com")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "BlueYonder" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.blueyonder.co.uk")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "NTLWorld" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.ntlworld.com")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "TalkTalk" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.TalkTalk.net")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "Tiscali" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.tiscali.co.uk")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "Virgin" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.virgin.net")
            MsgBox("Email Sending")
        End If
        If ComboBox1.Text = "Wanadoo" Then
            SMTPClient = New System.Net.Mail.SmtpClient("smtp.wanadooadsl.net")
            MsgBox("Email Sending")
        End If
        SMTPClient.Credentials = New System.Net.NetworkCredential(TextBox1.Text, TextBox2.Text)
        SMTPClient.EnableSsl = True
        SMTPClient.Send(TextBox1.Text, TextBox3.Text, TextBox4.Text, RichTextBox1.Text)
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub TextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged
        If TextBox1.Focus Then
            TextBox1.Text = ""
        End If
    End Sub
End Class
