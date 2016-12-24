Public Class FrmVisualizar

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            Dim N As New SaveFileDialog
            N.Title = "SALVAR ARQUIVOS"
            N.Filter = "IMAGENS (.png)|*.png|TODOS ARQUIVOS (*.*)|*.*"
            If N.ShowDialog = Windows.Forms.DialogResult.OK Then
                PicVisualizar.Image.Save(N.FileName)
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class