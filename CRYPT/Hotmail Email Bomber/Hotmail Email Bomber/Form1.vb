Imports System.Net.Mail


Public Class Form1
    Dim html As Boolean
    Dim IsDraggingForm As Boolean = False
    Dim sendammount As Integer
    Private MousePos As New System.Drawing.Point(0, 0)

    Public Sub Form1_MouseDown(ByVal sender As Object, ByVal e As MouseEventArgs) Handles MyBase.MouseDown, Label2.MouseDown, GroupPanel1.MouseDown, ProgressBar1.MouseDown
        If e.Button = MouseButtons.Left Then
            IsDraggingForm = True
            MousePos = e.Location
        End If
    End Sub

    Private Sub Form1_MouseUp(ByVal sender As Object, ByVal e As MouseEventArgs) Handles MyBase.MouseUp, Label2.MouseUp, GroupPanel1.MouseUp, ProgressBar1.MouseUp
        If e.Button = MouseButtons.Left Then IsDraggingForm = False
    End Sub

    Private Sub Form1_MouseMove(ByVal sender As Object, ByVal e As MouseEventArgs) Handles MyBase.MouseMove, Label2.MouseMove, GroupPanel1.MouseMove, ProgressBar1.MouseMove
        If IsDraggingForm Then
            Dim temp As Point = New Point(Me.Location + (e.Location - MousePos))
            Me.Location = temp
            temp = Nothing
        End If
    End Sub

    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        Me.Close()
    End Sub

    Private Sub MinimizeToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MinimizeToolStripMenuItem.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub BackgroundWorker1_ProgressChanged(ByVal sender As System.Object, ByVal e As System.ComponentModel.ProgressChangedEventArgs) Handles BackgroundWorker1.ProgressChanged
        ProgressBar1.Value = e.ProgressPercentage
    End Sub
    Private WithEvents TestWorker As System.ComponentModel.BackgroundWorker

    Private Sub BackgroundWorker1_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker1.DoWork
        Dim MyMailMessage1 As New MailMessage()
        Dim Smtp As New SmtpClient(TextBoxX1.Text)
        Dim SmtpUser As New System.Net.NetworkCredential()
        MyMailMessage1.From = New MailAddress(TextBoxX1.Text)
        MyMailMessage1.To.Add(TextBoxX3.Text)
        MyMailMessage1.Subject = (TextBoxX5.Text)
        MyMailMessage1.Body = TextBoxX4.Text
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
        SmtpUser.UserName = TextBoxX1.Text
        SmtpUser.Password = TextBoxX2.Text
        Smtp.Credentials = SmtpUser
        Smtp.EnableSsl = True
        Smtp.Host = "smtp.live.com"
        Smtp.Port = 587
        Do Until sendammount = IntegerInput1.Value
            If BackgroundWorker1.CancellationPending Then
                Exit Sub
            End If
            Smtp.Send(MyMailMessage1)
            sendammount = sendammount + 1
            BackgroundWorker1.ReportProgress(sendammount, sendammount)
        Loop
        MsgBox("Done!")
    End Sub

    Private Sub StopToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StopToolStripMenuItem.Click
        BackgroundWorker1.CancelAsync()
    End Sub

    Private Sub StartToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StartToolStripMenuItem.Click
        If TextBoxX1.Text.Contains("@") = False Then
            MsgBox("You need to have a valid Email address!" + vbNewLine + "Example: username@Email.com")
            Exit Sub
        End If
        If TextBoxX2.Text = "" Then
            MsgBox("You forgot your password!")
            Exit Sub
        End If
        If TextBoxX3.Text.Contains("@") = False Then
            MsgBox("You need to enter a valid email address to send the message to!" + vbNewLine + "Example: anything@anything.com")
            Exit Sub
        End If
        If TextBoxX4.Text = "" Then
            MsgBox("Please do not send blank messages!")
            Exit Sub
        End If
        sendammount = 0
        ProgressBar1.Value = 0
        ProgressBar1.Update()
        If CheckBoxX1.Checked = True Then
            html = True
        Else : html = False
        End If
        MsgBox("Starting!")
        GroupBox1.Enabled = False
        GroupBox2.Enabled = False
        GroupBox3.Enabled = False
        BackgroundWorker1.RunWorkerAsync()
        ProgressBar1.Maximum = IntegerInput1.Value
        ProgressBar1.Value = 0
        TestWorker = New System.ComponentModel.BackgroundWorker
    End Sub

    Public Sub done() Handles BackgroundWorker1.RunWorkerCompleted
        GroupBox1.Enabled = True
        GroupBox2.Enabled = True
        GroupBox3.Enabled = True
    End Sub
End Class
