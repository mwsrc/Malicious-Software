Public Class FrmInformações
    Public sk As MdClient

    Private Sub btnOK_Click(sender As Object, e As EventArgs) Handles btnOK.Click
        sk.Send("TextoInformacoes")
        btnOK.Enabled = False
    End Sub

    Private Sub TRInformações_AfterSelect(sender As Object, e As TreeViewEventArgs) Handles TRInformações.AfterSelect
        TRInformações.SelectedNode.SelectedImageKey = TRInformações.SelectedNode.ImageKey
    End Sub
End Class