Public Class FrmProgramasInstalados
    Public sk As MdClient
    
    Private Sub AtualizarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AtualizarToolStripMenuItem.Click
        sk.Send("EnviarListaProgramas")
    End Sub

    Private Sub DesinstalarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DesinstalarToolStripMenuItem.Click
        For Each x In LVListProgramas.SelectedItems
            sk.Send("DesinsTalarProgramass" & MdSokserver.Y & LVListProgramas.SelectedItems(0).Text & MdSokserver.Y)
        Next
    End Sub
End Class