Imports System.IO
Public Class FrmDownloadMine


    Public NomeDoArquivo As String
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim nn As New SaveFileDialog
        nn.Filter = "ARQUIVOS (*.*)|*.*"
        nn.Title = "TODOS ARQUIVOS"
        nn.FileName = NomeDoArquivo
        If nn.ShowDialog = Windows.Forms.DialogResult.OK Then
            Try
                Dim by As Byte() = Nothing
                by = ZIP(Convert.FromBase64String(ListView1.Items(2).SubItems(1).Text), False)
                File.WriteAllBytes(nn.FileName, by)
            Catch ex As Exception
                MsgBox("ERRO : " & ex.Message, MsgBoxStyle.Critical, "Infomações")
            End Try
        End If
    End Sub
End Class