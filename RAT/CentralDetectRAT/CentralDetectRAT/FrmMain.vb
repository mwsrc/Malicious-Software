Imports Mono.Cecil
Imports Mono.Cecil.Cil
Imports Microsoft.VisualBasic.CompilerServices
Imports Mono.Collections.Generic
Imports System.Text

Public Class FrmMain

    Sub New()
        InitializeComponent()
        CK_COPY.Select()
        CBX_TROJAN.SelectedIndex = 0
    End Sub

    Private Sub BTN_PROCURAR_Click(sender As Object, e As EventArgs) Handles BTN_PROCURAR.Click
        Try
            Dim NewDiag As New OpenFileDialog
            NewDiag.Title = "ABRIR ARQUIVOS"
            NewDiag.Filter = "ARQUIVOS EXECUTÁVEL (*.exe)|*.exe|ARQUIVOS DLL(*.dll)|*.dll"
            If NewDiag.ShowDialog = DialogResult.OK Then
                EXE = AssemblyDefinition.ReadAssembly(NewDiag.FileName)
                LB_STATUS.Text = "STATUS : " & NewDiag.FileName
            End If
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical, "ERROR")
        End Try
    End Sub

    Private Sub BTN_ANALIZAR_Click(sender As Object, e As EventArgs) Handles BTN_ANALIZAR.Click
        If Not EXE Is Nothing Then
            TXT_NOME_ID.Text = GETNome(ANALIZAR(EXE, ".cctor", "j.OK", 0))
            TXT_VERSAO.Text = ANALIZAR(EXE, ".cctor", "j.OK", 2)
            TXT_NOME_EXECUTAVEL.Text = ANALIZAR(EXE, ".cctor", "j.OK", 6)
            TXT_DIRETORIO.Text = ANALIZAR(EXE, ".cctor", "j.OK", 8)
            TXT_NOME_REGISTRO.Text = ANALIZAR(EXE, ".cctor", "j.OK", 10)
            TXT_IP_DNS.Text = ANALIZAR(EXE, ".cctor", "j.OK", 12)
            TXT_PORTA.Text = ANALIZAR(EXE, ".cctor", "j.OK", 14)
            TXT_SPLIT.Text = ANALIZAR(EXE, ".cctor", "j.OK", 16)
            CK_PROTECT_PROCESS.Checked = ANALIZAR(EXE, ".cctor", "j.OK", 18)
            CK_COPY.Checked = ANALIZAR(EXE, ".cctor", "j.OK", 21)
            CK_COPY_STARTUP.Checked = ANALIZAR(EXE, ".cctor", "j.OK", 24)
            CK_REGISTRY_STARTUP.Checked = ANALIZAR(EXE, ".cctor", "j.OK", 27)
            TXT_CHAVE_REGISTRO.Text = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" & vbCrLf & "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
        End If
    End Sub

    Private EXE As AssemblyDefinition
    Private Function ANALIZAR([ARQUIVO] As AssemblyDefinition, [SETOR] As String, [CLASS] As String, [LINHA] As Integer) As String
        Try
            Dim num As Integer = 0
            Dim result As String
            Dim enumerator As Collection(Of ModuleDefinition).Enumerator = [ARQUIVO].Modules.GetEnumerator()
            While enumerator.MoveNext()
                Dim current As ModuleDefinition = enumerator.Current
                Dim enumerator2 As Collection(Of TypeDefinition).Enumerator = current.Types.GetEnumerator()
                While enumerator2.MoveNext()
                    Dim current2 As TypeDefinition = enumerator2.Current
                    Dim enumerator3 As Collection(Of MethodDefinition).Enumerator = current2.Methods.GetEnumerator()
                    While enumerator3.MoveNext()
                        Dim current3 As MethodDefinition = enumerator3.Current
                        Dim flag As Boolean = Operators.CompareString(current3.Name, [SETOR], False) = 0 Or Operators.CompareString([SETOR].Split(New Char() {" "})(0), current3.Name, False) = 0
                        If flag Then
                            Dim flag2 As Boolean = Strings.LCase(current3.FullName).Contains(Strings.LCase([CLASS]))
                            If flag2 Then
                                Dim enumerator4 As Collection(Of Instruction).Enumerator = current3.Body.Instructions.GetEnumerator()
                                While enumerator4.MoveNext()
                                    Dim current4 As Instruction = enumerator4.Current
                                    flag2 = (num = [LINHA])
                                    If flag2 Then
                                        result = current4.Operand.ToString()
                                        Return result
                                    End If
                                    num += 1
                                End While
                            End If
                        End If
                    End While
                End While
            End While
            result = Nothing
            Return result
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical, "ERROR")
        End Try
    End Function

#Region "DECRIPT"

    Private Function GETNome(ByRef StrCode As String) As String
        Return Encoding.UTF8.GetString(Convert.FromBase64String(StrCode))
    End Function

#End Region

#Region "LIST NOMES"

    ' 0 - NOME (ID)
    ' 2 - VERSÃO DO TROJAN
    ' 6 - NOME DO EXECUTAVEL (NOME DO PROCESSO)
    ' 8 - DIRETORIO
    ' 10 - NOME DO REGISTRO (REGEDIT)
    ' 12 - HOST
    ' 14 - PORTA
    ' 16 - SPLIT
    ' 18 - PROTECT PROCESS [BSOD]
    ' 21 - COPY
    ' 24 - COPY STARTUP
    ' 27 - REGISTRY STARTUP
    ' 40 - LOCAL DA CHAVE DO REGISTRO


    'CHAVES HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run
    'CHAVES HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run

#End Region

End Class
