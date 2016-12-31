Public Class Form1

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

    Private Sub Label2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label2.Click
        If bg1.IsBusy = True Then bg1.CancelAsync()
        Me.Close()
    End Sub

    Private Sub Label2_MouseEnter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label2.MouseEnter
        Label2.ForeColor = Color.Red
    End Sub

    Private Sub Label2_MouseLeave(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label2.MouseLeave
        Label2.ForeColor = Color.White
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If TextBox1.Text.Length > 1 = True Then
            TextBox1.Enabled = False
            If bg1.IsBusy = False Then
                MessageBox.Show("You have 3 seconds to click the window you want to spam", "!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                Threading.Thread.Sleep(3000)
                Button1.Text = "Stop"
                bg1.RunWorkerAsync()
            Else : bg1.CancelAsync()
                Button1.Text = "Start"
                TextBox1.Enabled = True
            End If
        Else : MessageBox.Show("Enter some text!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Sub work() Handles bg1.DoWork
        While True
            If bg1.CancellationPending = True Then Exit Sub
            SendKeys.SendWait(TextBox1.Text & "{Enter}")
            Threading.Thread.Sleep(100)
        End While
    End Sub
End Class
