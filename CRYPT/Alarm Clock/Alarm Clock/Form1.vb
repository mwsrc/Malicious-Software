
Public Class Form1

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Timer2.Enabled = True
        If TextBox1.Text = "00:00:00" Then
            MsgBox("Insert Time")
        Else
            MsgBox("Alarm ON!")
        End If
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Timer2.Enabled = False
        Timer1.Enabled = True
        MsgBox("Alarm OFF!")
    End Sub
    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        OpenFileDialog1.ShowDialog()
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Label1.Text = TimeString
    End Sub

    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        If TextBox1.Text = Label1.Text Then
            Timer1.Enabled = False
            AxWindowsMediaPlayer1.URL = ComboBox1.SelectedItem
            TextBox1.Clear()
        End If
    End Sub

    Private Sub OpenFileDialog1_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles OpenFileDialog1.FileOk
        For Each track As String In OpenFileDialog1.FileNames
            ComboBox1.Items.Add(track)
        Next

    End Sub
End Class
