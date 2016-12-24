Public Class FrmSobre

    Private Sub LinkLabel1_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        Process.Start("http://connect-trojan.blogspot.com.br/", AppWinStyle.NormalFocus)
    End Sub

    Private Sub LinkLabel2_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs) Handles LinkLabel2.LinkClicked
        Process.Start("https://www.youtube.com/channel/UCaqF0HH2UQktDQ62VpWNk1Q", AppWinStyle.NormalFocus)
    End Sub

    Private Sub FrmSobre_Load(sender As Object, e As EventArgs) Handles Me.Load
        lbTrojans.Text = "Trojans (" & LB_Trojans.Items.Count & ")"
        lbScanners.Text = "Scanners (" & LB_Scanners.Items.Count & ")"
    End Sub

End Class