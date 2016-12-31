Imports System.CodeDom.Compiler

Public Class clsCodeDom
    Public Shared Sub Compile(ByVal Output As String, ByVal cSource As String)
        Dim Compiler As ICodeCompiler = New VBCodeProvider().CreateCompiler
        Dim Parameters As New CompilerParameters
        Dim cResults As CompilerResults
        Parameters.GenerateExecutable = True
        Parameters.OutputAssembly = Output

        Parameters.ReferencedAssemblies.Add("System.dll")
        Parameters.ReferencedAssemblies.Add("System.Data.dll")

        Parameters.ReferencedAssemblies.Add("System.Windows.Forms.dll")

        Parameters.CompilerOptions = "/optimize+ /platform:X86 /debug- /target:winexe"

        cResults = Compiler.CompileAssemblyFromSource(Parameters, cSource)
        If cResults.Errors.Count > 0 Then
            For Each CompilerError In cResults.Errors
                MessageBox.Show("ERROR: &" & CompilerError.errorText, "", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Next
        ElseIf cResults.Errors.Count = 0 Then
        End If
    End Sub
End Class
