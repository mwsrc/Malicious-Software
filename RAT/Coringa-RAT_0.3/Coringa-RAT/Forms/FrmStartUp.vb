Public Class FrmStartUp

    Public sk As MdClient

    Private Sub AtualizarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AtualizarToolStripMenuItem.Click
        sk.Send("EnviarStartupsssa" & MdSokserver.Y)
    End Sub

    Private Sub ExcluirToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ExcluirToolStripMenuItem.Click
        For Each AA In ListView1.SelectedItems
            If ListView1.SelectedItems(0).ImageIndex = 0 Then
                If ListView1.SelectedItems(0).Group.Header.StartsWith("HKEY_LOCAL_MACHINE") = True Then
                    MsgBox("Aviso : SE O SERVIDOR NÃO FOI EXECUTADO COMO ADMINISTRADOR NÃO VAI PODE EXCLUIR/MODIFICAR NADA DA CHAVE 'HKEY_LOCAL_MACHINE'", MsgBoxStyle.Exclamation, "Infomações")
                End If

                sk.Send("ExcluirKeyyy" & MdSokserver.Y & ListView1.SelectedItems(0).Group.Header & "\" & MdSokserver.Y & ListView1.SelectedItems(0).Text & MdSokserver.Y)

            Else
                sk.Send("ExcluirArquivoStartUp" & MdSokserver.Y & ListView1.SelectedItems(0).Text & MdSokserver.Y)
            End If
        Next
    End Sub
End Class