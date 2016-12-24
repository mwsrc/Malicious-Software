Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class FrmEnviarURL

    Public sk As MdClient

    Private Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Me.Close()
    End Sub

    Private Sub txtURL_TextChanged(sender As Object, e As EventArgs) Handles txtURL.TextChanged
        Try
            Me.txtExtensao.Text = "." & Strings.Split(Me.txtURL.Text, ".", -1, CompareMethod.Binary)((Strings.Split(Me.txtURL.Text, ".", -1, CompareMethod.Binary).Length - 1))
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        If txtURL.Text = Nothing Then
            MsgBox("INSIRA SUA URL", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        ElseIf txtExtensao.Text = Nothing Then
            MsgBox("INSIRA A EXTENÇÃO DO ARQUIVO", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        ElseIf txtExtensao.Text.StartsWith(".") = False Then
            MsgBox("INSIRA A EXTENÇÃO DO ARQUIVO COMESANDO COM '.' SEM A ASPAS SIMPLES", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        End If

        sk.Send("PBaixarArquivoURL" & MdSokserver.Y & txtURL.Text & MdSokserver.Y & txtExtensao.Text & MdSokserver.Y)
        Me.Close()
    End Sub
End Class