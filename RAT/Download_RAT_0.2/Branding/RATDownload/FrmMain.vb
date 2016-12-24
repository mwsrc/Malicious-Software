Imports Branding
Imports System.Environment
Imports System.IO

Public Class FrmMain

    Sub New()
        InitializeComponent()
        TXT_Diretorio.Text = GetFolderPath(SpecialFolder.Desktop)
        CBcategorias.SelectedIndex = 0
    End Sub

    Private Sub TXT_Procurar_TextChanged(sender As Object, e As EventArgs) Handles TXT_Procurar.TextChanged
        If TXT_Procurar.Text = Nothing Or TXT_Procurar.Text = "" Or TXT_Procurar.Text = " " Or TXT_Procurar.Text = "  " Or TXT_Procurar.Text = "   " Then
            Exit Sub
        End If
        LV_Resultado.Items.Clear()
        Dim I As New CsList
        If CBcategorias.Text = "Trojans" Then
            For Each O In I.WordListTrojans(TXT_Procurar.Text)
                Dim SP As String() = Split(O, " < = > ")
                Dim NewItem As New ListViewItem
                NewItem.Text = SP(0)
                NewItem.SubItems.Add(SP(1))
                NewItem.Tag = SP(2)
                NewItem.ImageIndex = SP(3)
                LV_Resultado.Items.Add(NewItem)
            Next
        ElseIf CBcategorias.Text = "Scanners" Then
            For Each O In I.WordListScanners(TXT_Procurar.Text)
                Dim SP As String() = Split(O, " < = > ")
                Dim NewItem As New ListViewItem
                NewItem.Text = SP(0)
                NewItem.SubItems.Add(SP(1))
                NewItem.Tag = SP(2)
                NewItem.ImageIndex = SP(3)
                LV_Resultado.Items.Add(NewItem)
            Next
        End If
        LbStatus.Text = "Resultado [" & LV_Resultado.Items.Count & "]"
    End Sub

    Private Sub btn_Procurar_Click(sender As Object, e As EventArgs) Handles btn_Procurar.Click
        Dim I As New FolderBrowserDialog
        I.Description = "SELECIONE O DIRETÓRIO."
        I.RootFolder = Environment.SpecialFolder.Desktop
        I.ShowNewFolderButton = True
        If I.ShowDialog = DialogResult.OK Then
            TXT_Diretorio.Text = I.SelectedPath
        End If
    End Sub

    Private Sub TM_Download_Click(sender As Object, e As EventArgs) Handles TM_Download.Click
        For Each I As ListViewItem In LV_Resultado.SelectedItems

            If Not Directory.Exists(TXT_Diretorio.Text) Then
                MsgBox("ESTE DIRETÓRIO NÃO EXISTE", MsgBoxStyle.Exclamation, "Informações")
                Exit Sub
            End If

            Dim N As FrmDownload = FrmDownload
            If N.IsHandleCreated Then
                N.IM.Images.Add(IM.Images.Item(I.ImageIndex))
                N.IniciarDownload(New Uri(I.Tag), TXT_Diretorio.Text, I.Text & ".zip")
            Else
                N.IM.Images.Add(IM.Images.Item(I.ImageIndex))
                N.IniciarDownload(New Uri(I.Tag), TXT_Diretorio.Text, I.Text & ".zip")
                N.Show()
            End If
        Next
    End Sub

    Private Sub LV_Resultado_ColumnWidthChanging(sender As Object, e As ColumnWidthChangingEventArgs) Handles LV_Resultado.ColumnWidthChanging
        e.Cancel = True
        e.NewWidth = LV_Resultado.Columns(e.ColumnIndex).Width
    End Sub

    Private Sub LinkLabel1_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        FrmSobre.Show()
    End Sub

    Private Sub Label4_Click(sender As Object, e As EventArgs) Handles Label4.Click
        Clipboard.SetText("SooftT2015", TextDataFormat.Text)
        MsgBox("Password Copied", MsgBoxStyle.Information, "Informações")
    End Sub

    Private Sub CBcategorias_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CBcategorias.SelectedIndexChanged
        TXT_Procurar_TextChanged(Nothing, Nothing)
    End Sub

    Private Sub InformaçõesToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles InformaçõesToolStripMenuItem.Click
        For Each I As ListViewItem In LV_Resultado.SelectedItems
            Dim N As FrmInformações = FrmInformações
            If N.IsHandleCreated Then
                N.PBicon.Image = IM.Images.Item(I.ImageIndex)
                N.lbPrograma.Text = "- Programa : " & I.Text
                N.lbTamanho.Text = "- Tamanho : " & I.SubItems(1).Text
                N.lbURL.Text = I.Tag
                N.Focus()
            Else
                N.PBicon.Image = IM.Images.Item(I.ImageIndex)
                N.lbPrograma.Text = "- Programa : " & I.Text
                N.lbTamanho.Text = "- Tamanho : " & I.SubItems(1).Text
                N.lbURL.Text = I.Tag
                N.Show()
            End If
        Next
    End Sub
End Class
