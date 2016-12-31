Public Class Alert
    Private Sub Alert_Load() Handles MyBase.Load
        Me.SetDesktopLocation(My.Computer.Screen.WorkingArea.Width - 129, _
                              My.Computer.Screen.WorkingArea.Height - 84)
    End Sub
    Private Sub Alert_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Click
        Me.Close()
    End Sub

    Private Sub Alert_FormClosing() Handles MyBase.FormClosing
        For FadeOut = 90 To 10 Step -10
            Me.Opacity = FadeOut / 100
            Me.Refresh()
            Threading.Thread.Sleep(40)
        Next
    End Sub
End Class