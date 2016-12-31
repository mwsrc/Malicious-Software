Imports System.Net.Mail
Public Class FrmMain

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If txtuser.Text = "" = True Then
            MsgBox("The username of e-mail address or password is incorrect. Please try again.", MsgBoxStyle.Critical, "Error")
            Exit Sub
        ElseIf txtpass.Text = "" = True Then
            MsgBox("The username of e-mail address or password is incorrect. Please try again.", MsgBoxStyle.Critical, "Error")
            Exit Sub
        End If

        If server.Text = "smtp.gmail.com" Then
            Gmail.Start()
            Button2.Enabled = True
            txtuser.Enabled = False
            txtpass.Enabled = False
            txtsubj.Enabled = False
            txtmsg.Enabled = False
            server.Enabled = False
            Button1.Enabled = False
            txtvictim.Enabled = False
        ElseIf server.Text = "smtp.live.com" Then
            Hotmail.Start()
            Button2.Enabled = True
            txtuser.Enabled = False
            txtpass.Enabled = False
            txtsubj.Enabled = False
            txtmsg.Enabled = False
            server.Enabled = False
            Button1.Enabled = False
            txtvictim.Enabled = False
        ElseIf server.Text = "smtp.uk.aol.com" Then
            AOL.Start()
            Button2.Enabled = True
            txtuser.Enabled = False
            txtpass.Enabled = False
            txtsubj.Enabled = False
            txtmsg.Enabled = False
            server.Enabled = False
            Button1.Enabled = False
            txtvictim.Enabled = False
        ElseIf server.Text = "plus.smtp.mail.yahoo.com" Then
            Yahoo.Start()
            Button2.Enabled = True
            txtuser.Enabled = False
            txtpass.Enabled = False
            txtsubj.Enabled = False
            txtmsg.Enabled = False
            server.Enabled = False
            Button1.Enabled = False
            txtvictim.Enabled = False
        End If
        Exit Sub
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Gmail.Stop()
        Yahoo.Stop()
        Hotmail.Stop()
        AOL.Stop()
        txtuser.Enabled = True
        txtpass.Enabled = True
        txtsubj.Enabled = True
        txtmsg.Enabled = True
        server.Enabled = True
        Button1.Enabled = True
        txtvictim.Enabled = True
        Button2.Enabled = False
    End Sub

    Private Sub Gmail_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Gmail.Tick
        Dim mail As New MailMessage
        mail.To.Add(txtvictim.Text)
        mail.From = New MailAddress(txtuser.Text)
        mail.Subject = txtsubj.Text
        mail.Body = txtmsg.Text
        Dim SMTP As New SmtpClient(server.Text)
        SMTP.Port = 587
        SMTP.EnableSsl = True
        SMTP.Credentials = New System.Net.NetworkCredential(txtuser.Text, txtpass.Text)
        MailZ.Text = Val(MailZ.Text + 1)
        SMTP.Send(mail)

    End Sub

    Private Sub Yahoo_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Yahoo.Tick
        Dim mail As New MailMessage
        mail.To.Add(txtvictim.Text)
        mail.From = New MailAddress(txtuser.Text)
        mail.Subject = txtsubj.Text
        mail.Body = txtmsg.Text
        Dim SMTP As New SmtpClient(server.Text)
        SMTP.Port = 465
        SMTP.EnableSsl = True
        SMTP.Credentials = New System.Net.NetworkCredential(txtuser.Text, txtpass.Text)
        MailZ.Text = Val(MailZ.Text + 1)
        SMTP.Send(mail)

    End Sub

    Private Sub AOL_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AOL.Tick
        Dim mail As New MailMessage
        mail.To.Add(txtvictim.Text)
        mail.From = New MailAddress(txtuser.Text)
        mail.Subject = txtsubj.Text
        mail.Body = txtmsg.Text
        Dim SMTP As New SmtpClient(server.Text)
        SMTP.Port = 587
        SMTP.EnableSsl = True
        SMTP.Credentials = New System.Net.NetworkCredential(txtuser.Text, txtpass.Text)
        MailZ.Text = Val(MailZ.Text + 1)
        SMTP.Send(mail)
    End Sub

    Private Sub Hotmail_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Hotmail.Tick
        Dim mail As New MailMessage
        mail.To.Add(txtvictim.Text)
        mail.From = New MailAddress(txtuser.Text)
        mail.Subject = txtsubj.Text
        mail.Body = txtmsg.Text
        Dim SMTP As New SmtpClient(server.Text)
        SMTP.Port = 25
        SMTP.EnableSsl = True
        SMTP.Credentials = New System.Net.NetworkCredential(txtuser.Text, txtpass.Text)
        MailZ.Text = Val(MailZ.Text + 1)
        SMTP.Send(mail)
    End Sub


    Private Sub txtsubject_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        txtpass.UseSystemPasswordChar = True
    End Sub

    Private Sub server_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles server.SelectedIndexChanged
        If server.Text = "smtp.gmail.com" Then
            txtuser.Text = "@gmail.com"
        ElseIf server.Text = "smtp.live.com" Then
            txtuser.Text = "@hotmail.com"
        ElseIf server.Text = "smtp.uk.aol.com" Then
            txtuser.Text = "@aol.com"
        ElseIf server.Text = "plus.smtp.mail.yahoo.com" Then
            txtuser.Text = "@yahoo.com"
        End If
    End Sub
End Class
