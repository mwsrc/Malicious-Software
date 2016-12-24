Public Class FrmServiços

    Public sk As MdClient

    Private Sub AtualizarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AtualizarToolStripMenuItem.Click
        sk.Send("EnviarDadosssServiços" & MdSokserver.Y)
    End Sub

    Private Sub FinalizarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles FinalizarToolStripMenuItem.Click
        For Each u In ListView1.SelectedItems
            sk.Send("FinalizarServicoss" & MdSokserver.Y & ListView1.SelectedItems(0).Text & MdSokserver.Y)
        Next
    End Sub

    Private Sub ContinuarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ContinuarToolStripMenuItem.Click
        For Each u In ListView1.SelectedItems
            sk.Send("ContinuarServicesss" & MdSokserver.Y & ListView1.SelectedItems(0).Text & MdSokserver.Y)
        Next
    End Sub

    Private Sub PausarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PausarToolStripMenuItem.Click
        For Each u In ListView1.SelectedItems
            sk.Send("PausarrServicesss" & MdSokserver.Y & ListView1.SelectedItems(0).Text & MdSokserver.Y)
        Next
    End Sub

    Private Sub IniciarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles IniciarToolStripMenuItem.Click
        For Each u In ListView1.SelectedItems
            sk.Send("IniciarrServicesss" & MdSokserver.Y & ListView1.SelectedItems(0).Text & MdSokserver.Y)
        Next
    End Sub

    Private Sub PararToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PararToolStripMenuItem.Click
        For Each u In ListView1.SelectedItems
            sk.Send("PararrServicesss" & MdSokserver.Y & ListView1.SelectedItems(0).Text & MdSokserver.Y)
        Next
    End Sub

    Private Sub UpdaterToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles UpdaterToolStripMenuItem.Click
        For Each u In ListView1.SelectedItems
            sk.Send("AtualizarrServicesss" & MdSokserver.Y & ListView1.SelectedItems(0).Text & MdSokserver.Y)
        Next
    End Sub

    Private Sub ExecutarComandoToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ExecutarComandoToolStripMenuItem.Click
        For Each u In ListView1.SelectedItems
            Try
                Dim str As String = InputBox("Por favor, digite o comando que você deseja executar no serviço.", "Informações", "", -1, -1)
                If ((Not str Is Nothing) AndAlso (str.Length <> 0)) Then
                    sk.Send("ExecutarComandoServicess" & MdSokserver.Y & ListView1.SelectedItems(0).Text & MdSokserver.Y & str.ToString & MdSokserver.Y)
                End If
            Catch exception1 As Exception

            End Try
        Next
    End Sub

End Class