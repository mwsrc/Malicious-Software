Public Class Form1
    Dim i As Integer = 1
    Dim gobabygo As Boolean
    Dim username As String
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        OpenFileDialog1.ShowDialog()
        TextBox1.Text = OpenFileDialog1.FileName
    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        System.Diagnostics.Process.Start("Http://www.natespages.ucoz.com")
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        If TextBox2.Text.Contains("ftp://") = True Then
            username = TextBox2.Text
        End If
        If TextBox2.Text.Contains("ftp://") = False Then
            username = "ftp://" & TextBox2.Text
        End If
        If TextBox2.Text.EndsWith("/") = True Then
            username = username
        Else : username = username & "/"
        End If

        GroupBox1.Enabled = False
        GroupBox2.Enabled = False
        Button3.Enabled = True
        Button4.Enabled = False
        Button2.Enabled = False
        BackgroundWorker1.RunWorkerAsync()
    End Sub

    Private Sub BackgroundWorker1_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker1.DoWork
        Do While gobabygo = False
            If BackgroundWorker1.CancellationPending = True Then
                Exit Sub
            End If
            My.Computer.Network.UploadFile(TextBox1.Text, username & (i) & TextBox5.Text, TextBox3.Text, TextBox4.Text)
            i = i + 1
        Loop

    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Me.Close()
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        BackgroundWorker1.CancelAsync()
    End Sub
    Private Sub done() Handles BackgroundWorker1.RunWorkerCompleted
        GroupBox1.Enabled = True
        GroupBox2.Enabled = True
        Button2.Enabled = True
        Button4.Enabled = True
        Button3.Enabled = False
    End Sub
End Class