Public Class FrmJanelas
    Public sk As MdClient
    Private Sub FrmJanelas_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub

    Private Sub AtualizarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AtualizarToolStripMenuItem.Click
        sk.Send("EnviarJanelasFf")
    End Sub
End Class