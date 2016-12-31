Imports System.Net.Mail
Public Class Form1
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
    End Sub
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
    End Sub
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        OpenFileDialog1.ShowDialog()
    End Sub
    Private Sub OpenFileDialog1_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles OpenFileDialog1.FileOk
        For Each track As String In OpenFileDialog1.FileNames
            ListBox1.Items.Add(track)
        Next
    End Sub
    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        For Each track As String In OpenFileDialog1.FileNames
            ListBox1.Items.Clear()
        Next
    End Sub
    Private Sub ListBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBox1.SelectedIndexChanged
    End Sub
    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        End
    End Sub
    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Timer1.Enabled = True
        Button5.Text = ("Sending " + (sendamount.Text) + (" messages."))
    End Sub
    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click
        Timer1.Stop()
        Label6.Text = 0
        ProgressBar1.Value = 0
    End Sub
    Private Sub ProgressBar1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ProgressBar1.Click
    End Sub
    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Dim MyMailMessage As New MailMessage()
        MyMailMessage.From = New MailAddress(usernametext.Text)
        MyMailMessage.To.Add(TextBox1.Text)
        MyMailMessage.Subject = TextBox2.Text
        MyMailMessage.Body = RichTextBox1.Text
        For counter = 0 To ListBox1.Items.Count - 1
            Dim Attach As Net.Mail.Attachment = New Net.Mail.Attachment(ListBox1.Items(counter))
            MyMailMessage.Attachments.Add(Attach)
        Next
        Dim SMTPServer As New SmtpClient("smtp.gmail.com")
        SMTPServer.Port = 587
        SMTPServer.Credentials = New System.Net.NetworkCredential(usernametext.Text, TextBox5.Text)
        SMTPServer.EnableSsl = True
        Dim sendnumber As Integer = sendamount.Text
        If Label6.Text < sendnumber Then
            Timer1.Interval = 100
            ProgressBar1.Value = Label6.Text
            ProgressBar1.Minimum = 0
            ProgressBar1.Maximum = sendnumber
            ProgressBar1.Update()
            Try
                Label6.Text = Val(Label6.Text) + 1
                SMTPServer.Send(MyMailMessage)
            Catch ex As SmtpException
                MessageBox.Show(ex.Message)
            End Try
        ElseIf Label6.Text = sendnumber Then
            Timer1.Stop()
            Label6.Text = 0
            ProgressBar1.Value = 0
            MessageBox.Show("Done sending " + (sendamount.Text) + (" E-Mail's to ") + (TextBox1.Text) + ("!"))
        End If
    End Sub
    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        System.Diagnostics.Process.Start("http://www.natespages.ucoz.com")
    End Sub
    Private Sub sendamount_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles sendamount.TextChanged
        If sendamount.Text = "" Then
            sendamount.Text = 1
        End If
        If sendamount.Text <= 0 Then
            MessageBox.Show("you can not send 0 messages!")
        End If
        If sendamount.Text >= 76 Then
            MessageBox.Show("keep your number to 75 or below to prevent your account from being blocked.")
            sendamount.Text = 75
        End If
    End Sub
    Private Sub usernametext_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles usernametext.TextChanged
    End Sub
    Private Sub Label6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label6.Click
    End Sub
End Class
