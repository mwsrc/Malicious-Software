Imports System.Net.Mail
Public Class Form1
    Dim sa1, sa2, sa3, sa4, sa5 As Integer
    Dim name1, pass1, name2, pass2, name3, pass3, name4, pass4, name5, pass5 As String
    Public Sub user1()
        Dim n1 As String = ListView1.Items(0).Text
        Dim p1 As String = ListView1.Items(0).SubItems(1).Text
        name1 = n1
        pass1 = p1
        BackgroundWorker1.RunWorkerAsync()
    End Sub
    Public Sub user2()
        Dim n2 As String = ListView1.Items(1).Text
        Dim p2 As String = ListView1.Items(1).SubItems(1).Text
        name2 = n2
        pass2 = p2
        BackgroundWorker2.RunWorkerAsync()
    End Sub
    Public Sub user3()
        Dim n3 As String = ListView1.Items(2).Text
        Dim p3 As String = ListView1.Items(2).SubItems(1).Text
        name3 = n3
        pass3 = p3
        BackgroundWorker3.RunWorkerAsync()

    End Sub
    Public Sub user4()
        Dim n4 As String = ListView1.Items(3).Text
        Dim p4 As String = ListView1.Items(3).SubItems(1).Text
        name4 = n4
        pass4 = p4
        BackgroundWorker4.RunWorkerAsync()
    End Sub
    Public Sub user5()
        Dim n5 As String = ListView1.Items(4).Text
        Dim p5 As String = ListView1.Items(4).SubItems(1).Text
        name5 = n5
        pass5 = p5
        BackgroundWorker5.RunWorkerAsync()
    End Sub

    Private Sub StartToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StartToolStripMenuItem.Click
        
        If ListView1.Items.Count <= 0 Then
            Exit Sub
        End If
        If ListView1.Items.Count > 5 Then
            Exit Sub
        End If
        ListView1.Enabled = False
        GroupBox1.Enabled = False
        ContextMenuStrip1.Items(0).Enabled = False
        ContextMenuStrip1.Items(1).Enabled = False
        ContextMenuStrip1.Items(2).Enabled = False
        ContextMenuStrip1.Items(4).Enabled = False
        ContextMenuStrip1.Items(3).Enabled = True
        If ListView1.Items.Count = 1 Then
            Call user1()
        End If
        If ListView1.Items.Count = 2 Then
            Call user1()
            Call user2()
        End If
        If ListView1.Items.Count = 3 Then
            Call user1()
            Call user2()
            Call user3()
        End If
        If ListView1.Items.Count = 4 Then
            Call user1()
            Call user2()
            Call user3()
            Call user4()

        End If
        If ListView1.Items.Count = 5 Then
            Call user1()
            Call user2()
            Call user3()
            Call user4()
            Call user5()
        End If
    End Sub


    Private Sub AddUserToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AddUserToolStripMenuItem.Click
        userinfo.Show()
    End Sub

    Private Sub RemoveUserToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RemoveUserToolStripMenuItem.Click
        For Each lvItem As ListViewItem In ListView1.SelectedItems
            lvItem.Remove()
        Next
    End Sub

    Private Sub BackgroundWorker1_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker1.DoWork
        Dim MyMailMessage1 As New MailMessage()
        MyMailMessage1.From = New MailAddress(name1)
        MyMailMessage1.To.Add(TextBox1.Text)
        MyMailMessage1.Subject = (TextBox2.Text)
        MyMailMessage1.Body = TextBox3.Text
        MyMailMessage1.Priority = MailPriority.High
        Dim SMTPServer As New SmtpClient("smtp.gmail.com")
        SMTPServer.Port = 587
        SMTPServer.Credentials = New System.Net.NetworkCredential(name1, pass1)
        SMTPServer.EnableSsl = True
        Do Until sa1 = NumericUpDown1.Value
            If BackgroundWorker1.CancellationPending Then
                Exit Sub
            End If
            SMTPServer.Send(MyMailMessage1)
            sa1 = sa1 + 1
        Loop
    End Sub

    Private Sub BackgroundWorker2_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker2.DoWork
        Dim MyMailMessage2 As New MailMessage()
        MyMailMessage2.From = New MailAddress(name2)
        MyMailMessage2.To.Add(TextBox1.Text)
        MyMailMessage2.Subject = (TextBox2.Text)
        MyMailMessage2.Body = TextBox3.Text
        MyMailMessage2.Priority = MailPriority.High
        Dim SMTPServer As New SmtpClient("smtp.gmail.com")
        SMTPServer.Port = 587
        SMTPServer.Credentials = New System.Net.NetworkCredential(name2, pass2)
        SMTPServer.EnableSsl = True
        Do Until sa2 = NumericUpDown1.Value
            If BackgroundWorker2.CancellationPending Then
                Exit Sub
            End If
            SMTPServer.Send(MyMailMessage2)
            sa2 = sa2 + 1
        Loop
    End Sub

    Private Sub BackgroundWorker3_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker3.DoWork
        Dim MyMailMessage3 As New MailMessage()
        MyMailMessage3.From = New MailAddress(name3)
        MyMailMessage3.To.Add(TextBox1.Text)
        MyMailMessage3.Subject = (TextBox2.Text)
        MyMailMessage3.Body = TextBox3.Text
        MyMailMessage3.Priority = MailPriority.High
        Dim SMTPServer As New SmtpClient("smtp.gmail.com")
        SMTPServer.Port = 587
        SMTPServer.Credentials = New System.Net.NetworkCredential(name3, pass3)
        SMTPServer.EnableSsl = True
        Do Until sa3 = NumericUpDown1.Value
            If BackgroundWorker3.CancellationPending Then
                Exit Sub
            End If
            SMTPServer.Send(MyMailMessage3)
            sa3 = sa3 + 1
        Loop
    End Sub

    Private Sub BackgroundWorker4_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker4.DoWork
        Dim MyMailMessage4 As New MailMessage()
        MyMailMessage4.From = New MailAddress(name3)
        MyMailMessage4.To.Add(TextBox1.Text)
        MyMailMessage4.Subject = (TextBox2.Text)
        MyMailMessage4.Body = TextBox3.Text
        MyMailMessage4.Priority = MailPriority.High
        Dim SMTPServer As New SmtpClient("smtp.gmail.com")
        SMTPServer.Port = 587
        SMTPServer.Credentials = New System.Net.NetworkCredential(name4, pass4)
        SMTPServer.EnableSsl = True
        Do Until sa4 = NumericUpDown1.Value
            If BackgroundWorker4.CancellationPending Then
                Exit Sub
            End If
            SMTPServer.Send(MyMailMessage4)
            sa4 = sa4 + 1
        Loop
    End Sub

    Private Sub BackgroundWorker5_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker5.DoWork
        Dim MyMailMessage5 As New MailMessage()
        MyMailMessage5.From = New MailAddress(name3)
        MyMailMessage5.To.Add(TextBox1.Text)
        MyMailMessage5.Subject = (TextBox2.Text)
        MyMailMessage5.Body = TextBox3.Text
        MyMailMessage5.Priority = MailPriority.High
        Dim SMTPServer As New SmtpClient("smtp.gmail.com")
        SMTPServer.Port = 587
        SMTPServer.Credentials = New System.Net.NetworkCredential(name5, pass5)
        SMTPServer.EnableSsl = True
        Do Until sa5 = NumericUpDown1.Value
            If BackgroundWorker5.CancellationPending Then
                Exit Sub
            End If
            SMTPServer.Send(MyMailMessage5)
            sa5 = sa5 + 1
        Loop
    End Sub

    Public Sub done() Handles BackgroundWorker1.RunWorkerCompleted
        sa1 = 0
        sa2 = 0
        sa3 = 0
        sa4 = 0
        sa5 = 0

        MsgBox("Done!")
        ListView1.Enabled = True
        GroupBox1.Enabled = True
        ContextMenuStrip1.Items(0).Enabled = True
        ContextMenuStrip1.Items(1).Enabled = True
        ContextMenuStrip1.Items(2).Enabled = True
        ContextMenuStrip1.Items(4).Enabled = True
        ContextMenuStrip1.Items(3).Enabled = False
    End Sub

    Private Sub StopToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StopToolStripMenuItem.Click
        BackgroundWorker1.CancelAsync()
        BackgroundWorker2.CancelAsync()
        BackgroundWorker3.CancelAsync()
        BackgroundWorker4.CancelAsync()
        BackgroundWorker5.CancelAsync()

    End Sub

    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        Me.Close()
    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        System.Diagnostics.Process.Start("http://www.natespages.ucoz.com")
    End Sub
End Class
