Imports System.Net.Mail
Public Class Form1
    Dim sendammount As Integer = 0
    Dim sendammount1 As Integer = 0
    Dim sendammountdevided As Integer
    Dim html As Boolean
    Dim priority As String
    Dim p As Integer
    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Me.Close()
    End Sub
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        BackgroundWorker1.CancelAsync()
        BackgroundWorker2.CancelAsync()
    End Sub

    Private Sub BackgroundWorker1_ProgressChanged(ByVal sender As System.Object, ByVal e As System.ComponentModel.ProgressChangedEventArgs) Handles BackgroundWorker1.ProgressChanged
        ProgressBar1.Value = e.ProgressPercentage * 2
    End Sub
    Private WithEvents TestWorker As System.ComponentModel.BackgroundWorker
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If TextBox1.Text.Contains("@gmail.com") = False Then
            MsgBox("You need to have a valid Gmail address!" + vbNewLine + "Example: username@gmail.com")
            Exit Sub
        End If
        If TextBox2.Text = "" Then
            MsgBox("You forgot your password!")
            Exit Sub
        End If
        If TextBox3.Text.Contains("@") = False Then
            MsgBox("You need to enter a valid email address to send the message to!" + vbNewLine + "Example: anything@anything.com")
            Exit Sub
        End If
        If TextBox5.Text = "" Then
            MsgBox("Please do not send blank messages!")
            Exit Sub
        End If
        sendammountdevided = 0
        sendammount1 = 0
        sendammount = 0
        ProgressBar1.Value = 0
        ProgressBar1.Update()
        If CheckBox1.Checked = True Then
            html = True
        Else : html = False
        End If
        If NumericUpDown1.Value Mod 2 <> 0 Then
            NumericUpDown1.Text = NumericUpDown1.Text + 1
            NumericUpDown1.Update()
            MsgBox("Blah! I hate odd numbers." + vbNewLine + "I will be adding 1 more!" + vbNewLine + "Making the total number of messages sent " + NumericUpDown1.Text + ".")
        End If
        MsgBox("Starting!")
        sendammountdevided = NumericUpDown1.Value / 2
        Button1.Enabled = False
        GroupBox1.Enabled = False
        GroupBox2.Enabled = False
        GroupBox3.Enabled = False
        GroupBox4.Enabled = False
        Button3.Enabled = False
        Button2.Enabled = True
        BackgroundWorker1.RunWorkerAsync()
        BackgroundWorker2.RunWorkerAsync()
        ProgressBar1.Maximum = NumericUpDown1.Value
        ProgressBar1.Value = 0
        TestWorker = New System.ComponentModel.BackgroundWorker
    End Sub

    Private Sub BackgroundWorker1_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker1.DoWork
        Dim MyMailMessage1 As New MailMessage()
        MyMailMessage1.From = New MailAddress(TextBox1.Text)
        MyMailMessage1.To.Add(TextBox3.Text)
        MyMailMessage1.Subject = (TextBox4.Text)
        MyMailMessage1.Body = TextBox5.Text
        For counter = 0 To ListBox1.Items.Count - 1
            Dim Attach As Net.Mail.Attachment = New Net.Mail.Attachment(ListBox1.Items(counter))
            MyMailMessage1.Attachments.Add(Attach)
        Next
        If RadioButton1.Checked = True Then
            MyMailMessage1.Priority = MailPriority.Low
        End If
        If RadioButton2.Checked = True Then
            MyMailMessage1.Priority = MailPriority.Normal
        End If
        If RadioButton3.Checked = True Then
            MyMailMessage1.Priority = MailPriority.High
        End If
        MyMailMessage1.IsBodyHtml = html
        Dim SMTPServer As New SmtpClient("smtp.gmail.com")
        SMTPServer.Port = 587
        SMTPServer.Credentials = New System.Net.NetworkCredential(TextBox1.Text, TextBox2.Text)
        SMTPServer.EnableSsl = True
        Do Until sendammount = sendammountdevided
            If BackgroundWorker1.CancellationPending Then
                Exit Sub
            End If
            SMTPServer.Send(MyMailMessage1)
            sendammount = sendammount + 1
            BackgroundWorker1.ReportProgress(sendammount, sendammount)
        Loop
        MsgBox("Done!")
    End Sub

   
    Private Sub BackgroundWorker2_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker2.DoWork
        Dim MyMailMessage As New MailMessage()
        MyMailMessage.From = New MailAddress(TextBox1.Text)
        MyMailMessage.To.Add(TextBox3.Text)
        MyMailMessage.Subject = (TextBox4.Text)
        MyMailMessage.IsBodyHtml = html
        MyMailMessage.Body = TextBox5.Text
        Dim SMTPServer As New SmtpClient("smtp.gmail.com")
        SMTPServer.Port = 587
        For counter = 0 To ListBox1.Items.Count - 1
            Dim Attach As Net.Mail.Attachment = New Net.Mail.Attachment(ListBox1.Items(counter))
            MyMailMessage.Attachments.Add(Attach)
        Next
        If RadioButton1.Checked = True Then
            MyMailMessage.Priority = MailPriority.Low
        End If
        If RadioButton2.Checked = True Then
            MyMailMessage.Priority = MailPriority.Normal
        End If
        If RadioButton3.Checked = True Then
            MyMailMessage.Priority = MailPriority.High
        End If
        SMTPServer.Credentials = New System.Net.NetworkCredential(TextBox1.Text, TextBox2.Text)
        SMTPServer.EnableSsl = True
        Do Until sendammount1 = sendammountdevided
            If BackgroundWorker2.CancellationPending Then
                Exit Sub
            End If
            SMTPServer.Send(MyMailMessage)
            sendammount1 = sendammount1 + 1
        Loop
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        OpenFileDialog1.ShowDialog()
    End Sub

    Private Sub OpenFileDialog1_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles OpenFileDialog1.FileOk
        For Each track As String In OpenFileDialog1.FileNames
            ListBox1.Items.Add(track)
        Next
    End Sub
    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        For Each track As String In OpenFileDialog1.FileNames
            ListBox1.Items.Clear()
        Next
    End Sub
    Private Sub donework(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BackgroundWorker1.RunWorkerCompleted
        Button1.Enabled = True
        GroupBox1.Enabled = True
        GroupBox2.Enabled = True
        GroupBox3.Enabled = True
        GroupBox4.Enabled = True
        Button3.Enabled = True
        Button2.Enabled = False
    End Sub
End Class