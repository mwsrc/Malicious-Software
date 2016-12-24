Public Class FrmSkype

    Sub New()
        InitializeComponent()
        LVContatos.Columns(0).DisplayIndex = 1
    End Sub

    Public sk As MdClient

    Private Sub btnIniciar_Click(sender As Object, e As EventArgs) Handles btnIniciar.Click
        sk.Send("|PIniciarSkyppee|" & MdSokserver.Y)
    End Sub

    Private Sub btnFechar_Click(sender As Object, e As EventArgs) Handles btnFechar.Click
        sk.Send("|PFecharSkyppee|" & MdSokserver.Y)
    End Sub
End Class