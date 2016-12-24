Public Class FrmConexão

    Public sk As MdClient
    Private Sub FrmConexão_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub

    Private Sub AtualizarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AtualizarToolStripMenuItem.Click
        sk.Send("EnviarConxaoooodd" & MdSokserver.Y)
    End Sub
End Class