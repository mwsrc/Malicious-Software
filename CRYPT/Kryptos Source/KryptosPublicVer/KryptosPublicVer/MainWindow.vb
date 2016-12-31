Public Class MainWindow

    Private Sub CyberButton1_Click(sender As System.Object, e As System.EventArgs) Handles CyberButton1.Click
        Form1.Show()

    End Sub

    Private Sub CyberButton2_Click(sender As System.Object, e As System.EventArgs) Handles CyberButton2.Click
        Binder.Show()
    End Sub

    Private Sub CyberButton3_Click(sender As System.Object, e As System.EventArgs) Handles CyberButton3.Click
        Me.Close()
    End Sub

    Private Sub CyberTheme1_Click(sender As System.Object, e As System.EventArgs) Handles CyberTheme1.Click

    End Sub

    Private Sub MainWindow_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        For Fadein = 0.0 To 1.1 Step 0.1
            Me.Opacity = Fadein
            Me.Refresh()
            Threading.Thread.Sleep(100)
        Next
    End Sub
End Class