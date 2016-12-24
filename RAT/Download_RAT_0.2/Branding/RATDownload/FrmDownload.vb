Imports System
Imports System.Net

Public Class FrmDownload

    Dim LogsItem As New Dictionary(Of WebClient, ListViewItem)

    Public Sub IniciarDownload(ByVal URL As Uri, ByVal Diretorio As String, ByVal Nome As String)
        Try

            Dim NewItem As New ListViewItem

            NewItem.Text = Nome

            NewItem.SubItems.Add("")

            NewItem.SubItems.Add("Verificando...")

            NewItem.ImageIndex = IM.Images.Count - 1

            LV_Downloads.Items.Add(NewItem)

            LV_Downloads.AddProgressBar("ST" & NewItem.Index, NewItem.Index, 1)

            Using I As New WebClient

                AddHandler I.DownloadProgressChanged, AddressOf Carregando

                AddHandler I.DownloadFileCompleted, AddressOf Completo

                I.DownloadFileTaskAsync(URL, Diretorio & "\" & Nome)

                LogsItem.Add(I, NewItem)

            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub Carregando(ByVal R As Object, ByVal e As DownloadProgressChangedEventArgs)
        On Error Resume Next
        LV_Downloads.UpdateProgressBar("ST" & LogsItem.Item(R).Index, e.ProgressPercentage)
        LV_Downloads.Items(LogsItem.Item(R).Index).SubItems(2).Text = StringFormat(e.BytesReceived) & "/" & StringFormat(e.TotalBytesToReceive) & " " & e.ProgressPercentage & "%"
    End Sub

    Private Sub Completo(ByVal R As Object, ByVal e As System.ComponentModel.AsyncCompletedEventArgs)
        On Error Resume Next
        NT.BalloonTipIcon = ToolTipIcon.Info
        NT.BalloonTipText = "Nome : " & LogsItem.Item(R).Text & vbNewLine & "Tamanho : " & LogsItem.Item(R).SubItems(2).Text & vbNewLine & "Status : Concluído           "
        NT.BalloonTipTitle = LogsItem.Item(R).Text.Replace(".zip", "")
        NT.ShowBalloonTip(3000)
        LV_Downloads.Items(LogsItem.Item(R).Index).SubItems(2).Text = "Concluído..."
    End Sub

    Private Function StringFormat(Tamanho) As String
        Try
            If Tamanho > 1000000000.0 Then
                Return Format(Tamanho / 1024 / 1024 / 1024, "#0.00") & " GB"
            ElseIf Tamanho > 125000 Then
                Return Format(Tamanho / 1024 / 1024, "#0.00") & " MB"
            ElseIf Tamanho < 125000 Then
                Return Format(Tamanho / 1024, "#0.00") & " KB"
            Else
                Return Format(Tamanho, "#0.00") & " KB"
            End If
        Catch ex As Exception
            Return Format(Tamanho, "#0.00") & " KB"
        End Try
    End Function

End Class