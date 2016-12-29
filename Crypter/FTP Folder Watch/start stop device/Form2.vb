Public Class Form2
    Private Sub Form2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Click
        'If Form1.TextBox6.Text.Contains("\") = True Then System.Diagnostics.Process.Start(Form1.TextBox6.Text)
        Me.Close()
    End Sub

    Private Sub Form2_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.SetDesktopLocation(My.Computer.Screen.WorkingArea.Width - 190, My.Computer.Screen.WorkingArea.Height - 120)
    End Sub
End Class