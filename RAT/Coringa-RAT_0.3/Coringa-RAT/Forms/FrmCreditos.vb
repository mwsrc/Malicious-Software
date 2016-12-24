Public Class FrmCreditos

    Sub New()
        InitializeComponent()
        TMPisca.Start()
    End Sub

    Private Sub LinkLabel1_LinkClicked_1(sender As Object, e As LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        Diagnostics.Process.Start("https://www.facebook.com/profile.php?id=100010000777708")
    End Sub

    Private Sub LinkLabel2_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs) Handles LinkLabel2.LinkClicked
        Diagnostics.Process.Start("https://www.youtube.com/channel/UC6nJR8rFtciy7Z1O3xHX1uA")
    End Sub

    Private Sub LinkLabel3_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs) Handles LinkLabel3.LinkClicked
        Diagnostics.Process.Start("http://sooftt.blogspot.com.br")
    End Sub

    Private Sub TMPisca_Tick(sender As Object, e As EventArgs) Handles TMPisca.Tick
        Application.DoEvents()
        Threading.Thread.Sleep(5)
        If lbPisca.ForeColor = Color.Blue Then
            lbPisca.ForeColor = Color.Yellow
        Else
            lbPisca.ForeColor = Color.Blue
        End If
    End Sub

    Private Sub FrmCreditos_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        TMPisca.Stop()
        TMPisca.Dispose()
    End Sub

End Class