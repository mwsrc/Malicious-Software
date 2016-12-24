Imports System.IO
Imports System.Threading
Imports System.Text
Imports NotificationWindow
Imports Microsoft.Win32

Public Class FrmPesonalizaçao

    Sub New()

        InitializeComponent()
        Me.Text = "Configurações : " & Environment.MachineName & "/" & Environment.UserName
        Try

            PLBodyColor.BackColor = My.Settings.MyBodyColor
            PLBorderColor.BackColor = My.Settings.MyBorderColor
            PLButtonBorderColor.BackColor = My.Settings.MyButtonBorderColor
            PLButtonHoverColor.BackColor = My.Settings.MyButtonHoverColor
            PLContentColor.BackColor = My.Settings.MyContentColor
            PLContentHoverColor.BackColor = My.Settings.MyContentHoverColor
            PLHeaderColor.BackColor = My.Settings.MyHeaderColor
            PLTitleColor.BackColor = My.Settings.MyTitleColor

            CKMostrarIco.Checked = My.Settings.MyMostrarIcone
            CKMostrarBotaoFechar.Checked = My.Settings.MyMostrarBotaodeFechar
            CKMostrarMenu.Checked = My.Settings.MyMostrarMenudeOpcoes
            CKMostrarGrip.Checked = My.Settings.MyMostrarGrip
            CKEfeito.Checked = My.Settings.MyEfeito

            NDDuracao.Value = My.Settings.MyDuracao
            NDIntervaloAnimacao.Value = My.Settings.MyIntervalodeAnimacao
            NDDuracaoAnimacao.Value = My.Settings.MyDuracaodaAnimacao
            NDTituloPadding.Value = My.Settings.MyTituloPadding
            NDDescricaoPadding.Value = My.Settings.MyDescricaoPadding
            NDIconePadding.Value = My.Settings.MyIconePadding


            Try
                Dim U As String = String.Empty
                For N = 0 To My.Settings.MeusGupos.Count - 1
                    U += My.Settings.MeusGupos.Item(N).ToString & vbNewLine
                Next

                Dim I As String() = Split(U, vbNewLine)
                For Each P In I
                    Dim ua As String() = Split(P, "|")
                    Dim Y As New ListViewItem
                    Y.Text = ua(0)
                    Y.SubItems.Add(ua(1))
                    Y.SubItems.Add(ua(2))
                    Y.ImageIndex = 3
                    LVGrupos.Items.Add(Y)
                Next
            Catch ex As Exception

            End Try

        Catch ex As Exception

        End Try
    End Sub

    Dim MinhaImagem1 As String = Application.StartupPath & "\Imagens\img-1.png"
    Dim MinhaImagem2 As String = Application.StartupPath & "\Imagens\img-2.png"
    Dim MinhaPastaImagens As String = Application.StartupPath & "\Imagens"

    Private Sub btnAddImagem_Click(sender As Object, e As EventArgs) Handles btnAddImagem.Click
        Try
            Dim AddItem As New OpenFileDialog
            AddItem.Title = "ADICIONAR ARQUIVOS"
            AddItem.Filter = "ARQUIVOS (*.gif)|*.gif|ARQUIVOS (*.jpg)|*.jpg|ARQUIVOS (*.jpeg)|*.jpeg|ARQUIVOS (*.png)|*.png|ARQUIVOS (*.bmp)|*.bmp|TODOS ARQUIVOS (*.*)|*.*"
            If AddItem.ShowDialog = Windows.Forms.DialogResult.OK Then

                If Not Directory.Exists(MinhaPastaImagens) Then
                    Directory.CreateDirectory(MinhaPastaImagens)
                End If

                File.Copy(AddItem.FileName, MinhaImagem1, True)

                Dim img As Image
                Dim img2 As Bitmap
                img = Image.FromFile(AddItem.FileName)
                img2 = New Bitmap(img)
                img.Dispose()
                PBBackGroundFundo.Image = img2

                Try
                    Using bmp1 = New Bitmap(FrmMain.L1.ClientSize.Width, FrmMain.L1.ClientSize.Height)
                        Using g1 = Graphics.FromImage(bmp1)
                            g1.DrawImage(Image.FromFile(Application.StartupPath & "\Imagens\img-1.png"), 0, 0, bmp1.Width, bmp1.Height)
                            FrmMain.L1.BackgroundImage = bmp1.Clone
                        End Using
                    End Using
                Catch ex As Exception

                End Try

            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btTirarImagem_Click(sender As Object, e As EventArgs) Handles btTirarImagem.Click
        If File.Exists(MinhaImagem1) Then
            FrmMain.L1.BackgroundImage = Nothing
            PBBackGroundFundo.Image = Nothing
            Try
                File.Delete(MinhaImagem1)
            Catch ex As Exception
                MsgBox("ERRO : " & ex.Message, MsgBoxStyle.Critical, "Informações")
            End Try
        Else
            PBBackGroundFundo.Image = Nothing
            FrmMain.L1.BackgroundImage = Nothing
        End If
    End Sub

    Private Sub FrmPesonalizaçao_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Try
            If File.Exists(MinhaImagem1) Then
                Dim img As Image
                Dim img2 As Bitmap
                img = Image.FromFile(MinhaImagem1)
                img2 = New Bitmap(img)
                img.Dispose()
                PBBackGroundFundo.Image = img2
            End If
        Catch ex As Exception

        End Try

        Try
            If File.Exists(MinhaImagem2) Then
                Dim img As Image
                Dim img2 As Bitmap
                img = Image.FromFile(MinhaImagem2)
                img2 = New Bitmap(img)
                img.Dispose()
                PBFundoContext.Image = img2
            End If
        Catch ex As Exception

        End Try
        Try
            PLCor.BackColor = My.Settings.SeleCor
            CKGridLines.Checked = My.Settings.SeleGridLins

            If My.Settings.MostrarNotificação = True Then
                CKMostrarNotificação.Checked = True
            Else
                CKMostrarNotificação.Checked = False
            End If
        Catch ex As Exception

        End Try

    End Sub

    Private Sub btnOK_Click(sender As Object, e As EventArgs) Handles btnOK.Click
        Try
            My.Settings.MyDuracao = NDDuracao.Value
            My.Settings.MyIntervalodeAnimacao = NDIntervaloAnimacao.Value
            My.Settings.MyDuracaodaAnimacao = NDDuracaoAnimacao.Value
            My.Settings.MyTituloPadding = NDTituloPadding.Value
            My.Settings.MyDescricaoPadding = NDDescricaoPadding.Value
            My.Settings.MyIconePadding = NDIconePadding.Value
            My.Settings.Save()
            Me.Close()
        Catch ex As Exception
            MsgBox("ERRO : " & ex.Message, MsgBoxStyle.Critical, "Informações")
        Finally
            Me.Close()
        End Try
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles btnProcurarContext.Click
        Try
            Dim AddItem As New OpenFileDialog
            AddItem.Title = "ADICIONAR ARQUIVOS"
            AddItem.Filter = "ARQUIVOS (*.gif)|*.gif|ARQUIVOS (*.jpg)|*.jpg|ARQUIVOS (*.jpeg)|*.jpeg|ARQUIVOS (*.png)|*.png|ARQUIVOS (*.bmp)|*.bmp|TODOS ARQUIVOS (*.*)|*.*"
            If AddItem.ShowDialog = Windows.Forms.DialogResult.OK Then

                If Not Directory.Exists(MinhaPastaImagens) Then
                    Directory.CreateDirectory(MinhaPastaImagens)
                End If

                File.Copy(AddItem.FileName, MinhaImagem2, True)

                Dim img As Image
                Dim img2 As Bitmap
                img = Image.FromFile(AddItem.FileName)
                img2 = New Bitmap(img)
                img.Dispose()
                PBFundoContext.Image = img2
                FrmMain.CM.BackgroundImage = img2

            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try

            Dim C As New ColorDialog
            C.FullOpen = True

            If C.ShowDialog = Windows.Forms.DialogResult.OK Then
                FrmMain.ForeColor = C.Color

                FrmMain.LVListInfoO.Items.Item(0).ForeColor = C.Color
                FrmMain.LVListInfoO.Items.Item(1).ForeColor = C.Color
                FrmMain.LVListInfoO.Items.Item(2).ForeColor = C.Color
                FrmMain.LVListInfoO.Items.Item(3).ForeColor = C.Color
                FrmMain.LVListInfoO.Items.Item(4).ForeColor = C.Color
                FrmMain.LVListInfoO.Items.Item(5).ForeColor = C.Color
                FrmMain.LVListInfoO.Items.Item(6).ForeColor = C.Color
                FrmMain.LVListInfoO.Items.Item(7).ForeColor = C.Color
                FrmMain.LVListInfoO.Items.Item(8).ForeColor = C.Color
                FrmMain.LVListInfoO.Items.Item(9).ForeColor = C.Color
                FrmMain.LVListInfoO.Items.Item(10).ForeColor = C.Color

                PLCor.BackColor = C.Color
                My.Settings.SeleCor = C.Color
                My.Settings.Save()
            End If

        Catch ex As Exception

        End Try
    End Sub

    Private Sub btnTirarContext_Click(sender As Object, e As EventArgs) Handles btnTirarContext.Click
        If File.Exists(MinhaImagem2) Then
            PBFundoContext.Image = Nothing
            FrmMain.CM.BackgroundImage = Nothing
            Try
                File.Delete(MinhaImagem2)
            Catch ex As Exception
                MsgBox("ERRO : " & ex.Message, MsgBoxStyle.Critical, "Informações")
            End Try
        Else
            PBFundoContext.Image = Nothing
            FrmMain.CM.BackgroundImage = Nothing
        End If
    End Sub

    Private Sub CKGridLines_CheckedChanged(sender As Object, e As EventArgs) Handles CKGridLines.CheckedChanged
        Try
            If CKGridLines.Checked Then
                FrmMain.L1.GridLines = True
                My.Settings.SeleGridLins = CKGridLines.Checked.ToString
                My.Settings.Save()
            Else
                FrmMain.L1.GridLines = False
                My.Settings.SeleGridLins = CKGridLines.Checked.ToString
                My.Settings.Save()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btnBodyColor_Click(sender As Object, e As EventArgs) Handles btnBodyColor.Click
        MinhaCor(1)
    End Sub

    Private Sub btnBorderColor_Click(sender As Object, e As EventArgs) Handles btnBorderColor.Click
        MinhaCor(2)
    End Sub

    Private Sub btnButtonBorderColor_Click(sender As Object, e As EventArgs) Handles btnButtonBorderColor.Click
        MinhaCor(3)
    End Sub

    Private Sub btnButtonHoverColor_Click(sender As Object, e As EventArgs) Handles btnButtonHoverColor.Click
        MinhaCor(4)
    End Sub

    Private Sub btnContentColor_Click(sender As Object, e As EventArgs) Handles btnContentColor.Click
        MinhaCor(5)
    End Sub

    Private Sub btnContentHoverColor_Click(sender As Object, e As EventArgs) Handles btnContentHoverColor.Click
        MinhaCor(6)
    End Sub

    Private Sub btnHeaderColor_Click(sender As Object, e As EventArgs) Handles btnHeaderColor.Click
        MinhaCor(7)
    End Sub

    Private Sub btnTitleColor_Click(sender As Object, e As EventArgs) Handles btnTitleColor.Click
        MinhaCor(8)
    End Sub

    Public Sub MinhaCor(ByVal Tipo As Integer)
        Dim N As New ColorDialog
        N.FullOpen = True
        If N.ShowDialog = Windows.Forms.DialogResult.OK Then
            If Tipo = 1 Then 'BodyColor
                PLBodyColor.BackColor = N.Color
                My.Settings.MyBodyColor = N.Color

            ElseIf Tipo = 2 Then 'BorderColor
                PLBorderColor.BackColor = N.Color
                My.Settings.MyBorderColor = N.Color

            ElseIf Tipo = 3 Then 'ButtonBorderColor
                PLButtonBorderColor.BackColor = N.Color
                My.Settings.MyButtonBorderColor = N.Color

            ElseIf Tipo = 4 Then 'ButtonHoverColor
                PLButtonHoverColor.BackColor = N.Color
                My.Settings.MyButtonHoverColor = N.Color

            ElseIf Tipo = 5 Then 'ContentColor
                PLContentColor.BackColor = N.Color
                My.Settings.MyContentColor = N.Color

            ElseIf Tipo = 6 Then 'ContentHoverColor
                PLContentHoverColor.BackColor = N.Color
                My.Settings.MyContentHoverColor = N.Color

            ElseIf Tipo = 7 Then 'HeaderColor
                PLHeaderColor.BackColor = N.Color
                My.Settings.MyHeaderColor = N.Color

            ElseIf Tipo = 8 Then 'TitleColor
                PLTitleColor.BackColor = N.Color
                My.Settings.MyTitleColor = N.Color

            End If

            My.Settings.Save()

        End If
    End Sub

    Private Sub CKMostrarNotificação_CheckedChanged(sender As Object, e As EventArgs) Handles CKMostrarNotificação.CheckedChanged
        My.Settings.MostrarNotificação = CKMostrarNotificação.Checked.ToString
        My.Settings.Save()
    End Sub

    Private Sub CKMostrarIco_CheckedChanged(sender As Object, e As EventArgs) Handles CKMostrarIco.CheckedChanged
        My.Settings.MyMostrarIcone = CKMostrarIco.Checked.ToString
        My.Settings.Save()
    End Sub

    Private Sub CKMostrarBotaoFechar_CheckedChanged(sender As Object, e As EventArgs) Handles CKMostrarBotaoFechar.CheckedChanged
        My.Settings.MyMostrarBotaodeFechar = CKMostrarBotaoFechar.Checked.ToString
        My.Settings.Save()
    End Sub

    Private Sub CKMostrarMenu_CheckedChanged(sender As Object, e As EventArgs) Handles CKMostrarMenu.CheckedChanged
        My.Settings.MyMostrarMenudeOpcoes = CKMostrarMenu.Checked.ToString
        My.Settings.Save()
    End Sub

    Private Sub CKMostrarGrip_CheckedChanged(sender As Object, e As EventArgs) Handles CKMostrarGrip.CheckedChanged
        My.Settings.MyMostrarGrip = CKMostrarGrip.Checked.ToString
        My.Settings.Save()
    End Sub

    Private Sub CKEfeito_CheckedChanged(sender As Object, e As EventArgs) Handles CKEfeito.CheckedChanged
        My.Settings.MyEfeito = CKEfeito.Checked.ToString
        My.Settings.Save()
    End Sub

    Private Sub btnMostrarNotificacao_Click(sender As Object, e As EventArgs) Handles btnMostrarNotificacao.Click
        Try
            Dim N As New PopupNotifier
            N.TitleText = "Teste (Notificação)"
            N.ContentText = "Coringa-RAT"
            N.ShowCloseButton = My.Settings.MyMostrarBotaodeFechar
            N.ShowOptionsButton = My.Settings.MyMostrarMenudeOpcoes
            N.ShowGrip = My.Settings.MyMostrarGrip
            N.Scroll = My.Settings.MyEfeito
            N.Delay = Integer.Parse(NDDuracao.Value)
            N.AnimationInterval = Integer.Parse(NDIntervaloAnimacao.Value)
            N.AnimationDuration = Integer.Parse(NDDuracaoAnimacao.Value)
            N.TitlePadding = New Padding(Integer.Parse(NDTituloPadding.Value))
            N.ContentPadding = New Padding(Integer.Parse(NDDescricaoPadding.Value))
            N.ImagePadding = New Padding(Integer.Parse(NDIconePadding.Value))
            N.OptionsMenu = FrmMain.CMNotificação
            N.BodyColor = My.Settings.MyBodyColor
            N.BorderColor = My.Settings.MyBorderColor
            N.ButtonBorderColor = My.Settings.MyButtonBorderColor
            N.ButtonHoverColor = My.Settings.MyButtonHoverColor
            N.ContentColor = My.Settings.MyContentColor
            N.ContentHoverColor = My.Settings.MyContentHoverColor
            N.HeaderColor = My.Settings.MyHeaderColor
            N.TitleColor = My.Settings.MyTitleColor
            If My.Settings.MyMostrarIcone = True Then
                N.Image = My.Resources._59
            Else
                N.Image = Nothing
            End If
            N.Popup()
        Catch ex As Exception
            MsgBox("ERRO : " & ex.Message, MsgBoxStyle.Critical, "Informações")
        End Try
    End Sub

    Private Sub btnAdicionar_Click(sender As Object, e As EventArgs) Handles btnAdicionar.Click
        If txtNomeGrupo.Text = Nothing Then
            MsgBox("INSIRA NOME DO GRUPO", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        End If

        If txtNomeGrupo.Text.Contains("|") Then
            MsgBox("ESTE NOME CONTEM SÍMBOLOS - |", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        End If

        Dim R As New Random
        Dim number As Integer = R.Next(1, 100000)
        Dim digits As String = number.ToString("000000")
        Dim N As New ListViewItem
        N.Text = digits
        N.SubItems.Add(txtNomeGrupo.Text)
        N.SubItems.Add(Date.Today.ToString("dd/MM/yyyy"))
        N.ImageIndex = 3
        LVGrupos.Items.Add(N)

        Try
            My.Settings.MeusGupos.Add(N.Text & "|" & N.SubItems(1).Text & "|" & N.SubItems(2).Text & "|")
            My.Settings.Save()
        Catch ex As Exception
            MsgBox("ERRO : " & ex.Message, MsgBoxStyle.Critical, "Informações")
        End Try

        txtNomeGrupo.Text = Nothing

    End Sub

    Private Sub txtNomeGrupo_KeyDown(sender As Object, e As KeyEventArgs) Handles txtNomeGrupo.KeyDown
        If e.KeyCode = Keys.Enter Then
            btnAdicionar.PerformClick()
        End If
    End Sub

    Private Sub ExcluirToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ExcluirToolStripMenuItem.Click
        For Each N As ListViewItem In LVGrupos.SelectedItems
            If LVGrupos.Items.Count = 1 Then
                MsgBox("VOCÊ NÃO PODE EXCLUIR TODOS, DEIXA UM DE IDENTIFICAÇÃO", MsgBoxStyle.Exclamation, "Informações")
                Exit Sub
            End If
            Try
                My.Settings.MeusGupos.Remove(N.Text & "|" & N.SubItems(1).Text & "|" & N.SubItems(2).Text & "|")
                N.Remove()
                My.Settings.Save()
            Catch ex As Exception
                MsgBox("ERRO : " & ex.Message, MsgBoxStyle.Critical, "Informações")
            End Try
        Next
    End Sub

    Private Sub ResetarMeusGruposToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ResetarMeusGruposToolStripMenuItem.Click
        My.Settings.Reset()
        My.Settings.Save()
        Try
            LVGrupos.Items.Clear()
            Dim U As String = String.Empty
            For N = 0 To My.Settings.MeusGupos.Count - 1
                U += My.Settings.MeusGupos.Item(N).ToString & vbNewLine
            Next

            Dim I As String() = Split(U, vbNewLine)
            For Each P In I
                Dim ua As String() = Split(P, "|")
                Dim Y As New ListViewItem
                Y.Text = ua(0)
                Y.SubItems.Add(ua(1))
                Y.SubItems.Add(ua(2))
                Y.ImageIndex = 3
                LVGrupos.Items.Add(Y)
            Next
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Button2_Click_1(sender As Object, e As EventArgs) Handles Button2.Click
        If TXT_Senha.Text = Nothing Then
            MsgBox("INSIRA SUA SENHA", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        ElseIf TXT_RedigitarSenha.Text = Nothing Then
            MsgBox("INSIRA SUA SENHA", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        ElseIf Not TXT_Senha.Text = TXT_RedigitarSenha.Text Then
            MsgBox("SENHAS NÃO ESTÃO CORRETAS", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        End If

        Try
            Registry.CurrentUser.CreateSubKey(("System\ST")).SetValue("STUpdate", ENB(TXT_Senha.Text), RegistryValueKind.String)
            MsgBox("SENHA ADICIONADA", MsgBoxStyle.Information, "Informações")
        Catch ex As Exception
            MsgBox("ERRO : " & ex.Message, MsgBoxStyle.Critical, "Informações")
        End Try
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Try
            Registry.CurrentUser.DeleteSubKey("System\ST", False)
            MsgBox("SENHA EXCLUÍDA", MsgBoxStyle.Information, "Informações")
        Catch ex As Exception
            MsgBox("ERRO : " & ex.Message, MsgBoxStyle.Critical, "Informações")
        End Try

    End Sub
End Class