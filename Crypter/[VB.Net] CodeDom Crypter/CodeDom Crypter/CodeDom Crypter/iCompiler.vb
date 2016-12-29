Imports System.CodeDom.Compiler
Public Class iCompiler
    Public Shared Sub GenerateExecutable(ByVal Output As String, ByVal Source As String, ByVal Icon As String)
        On Error Resume Next

        Dim Compiler As ICodeCompiler = (New VBCodeProvider).CreateCompiler()
        Dim Parameters As New CompilerParameters()
        Dim cResults As CompilerResults

        Parameters.GenerateExecutable = True
        Parameters.OutputAssembly = Output
        Parameters.ReferencedAssemblies.Add("System.dll")
        Parameters.ReferencedAssemblies.Add("System.Data.dll")
        Parameters.ReferencedAssemblies.Add("System.Windows.Forms.dll")
        Parameters.CompilerOptions = "/t:winexe"

        Dim Version = New Dictionary(Of String, String)
        Version.Add("CompilerVersion", "v2.0")

        Dim ICO As String = IO.Path.GetTempPath & "\iCompiler.ico"

        If Icon <> "" Then
            IO.File.Copy(Icon, ICO)
            Parameters.CompilerOptions &= " /win32icon:" & ICO
        End If

        cResults = Compiler.CompileAssemblyFromSource(Parameters, Source)

        If cResults.Errors.Count > 0 Then
            For Each CompilerError In cResults.Errors
                MessageBox.Show("Error: " & CompilerError.ErrorText, "", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Next
        ElseIf cResults.Errors.Count = 0 Then

        End If
        If Icon <> "" Then : IO.File.Delete(ICO) : End If
    End Sub
End Class