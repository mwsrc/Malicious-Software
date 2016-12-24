Imports Microsoft.Win32

Public Class FrmAutenticacao

    Private Sub btnSair_Click(sender As Object, e As EventArgs) Handles btnSair.Click
        End
    End Sub

    Private Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        If txt_Senha.Text = Nothing Then
            MsgBox("INSIRA SUA SENHA", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        End If
        If Not txt_Senha.Text = DEB(Registry.CurrentUser.OpenSubKey(("System\ST")).GetValue("STUpdate")) Then
            MsgBox("SENHA INCORRETA", MsgBoxStyle.Critical, "Informações")
        Else
            Me.Close()
        End If
    End Sub

    Private Sub txt_Senha_KeyDown(sender As Object, e As KeyEventArgs) Handles txt_Senha.KeyDown
        If e.KeyCode = Keys.Enter Then
            btnLogin.PerformClick()
        End If
    End Sub

End Class