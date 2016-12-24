Imports System.Windows.Forms

Public Class FrmPortas

    Protected m_BlankValid As Boolean = True
    Protected m_ReturnText As String = ""

    Public Overloads Function ShowDialog(ByVal TitleText As String, ByVal PromptText As String, ByVal DefaultText As String, ByRef EnteredText As String, ByVal BlankValid As Boolean) As System.Windows.Forms.DialogResult
        m_BlankValid = BlankValid
        Me.lbTitulo.Text = PromptText
        Me.Text = TitleText
        Me.NDPorta.Value = DefaultText
        Me.ShowDialog()
        EnteredText = m_ReturnText
        Return Me.DialogResult
    End Function

    Private Sub btnOK_Click(sender As Object, e As EventArgs) Handles btnOK.Click
        Me.DialogResult = System.Windows.Forms.DialogResult.OK
        m_ReturnText = Me.NDPorta.Value
        Me.Close()
    End Sub

    Private Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Me.DialogResult = System.Windows.Forms.DialogResult.Cancel
        m_ReturnText = ""
        Me.Close()
    End Sub

    Private Sub lbTitulo_Click(sender As Object, e As EventArgs) Handles lbTitulo.Click

    End Sub
End Class