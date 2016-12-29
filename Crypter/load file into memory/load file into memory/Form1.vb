Imports System.Runtime.CompilerServices
Imports System.Reflection

Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim x As New Threading.Thread(AddressOf RunInternalExe)
        x.Start()
    End Sub
    Private Sub RunInternalExe()
        Dim CurrentAssembly As Reflection.Assembly = Reflection.Assembly.GetExecutingAssembly()
        Dim Resource As String = String.Empty
        Dim ArrResources As String() = CurrentAssembly.GetManifestResourceNames()
        For Each Resource In ArrResources
            If Resource.IndexOf("Rc4.exe") > -1 Then Exit For
        Next
        Dim ResourceStream As IO.Stream = CurrentAssembly.GetManifestResourceStream(Resource)
        If ResourceStream Is Nothing Then
            Return
        End If
        Dim ResourcesBuffer(CInt(ResourceStream.Length) - 1) As Byte
        ResourceStream.Read(ResourcesBuffer, 0, ResourcesBuffer.Length)
        ResourceStream.Close()
        Dim assembly As Assembly = assembly.Load(ResourcesBuffer)
        Dim entryPoint As MethodInfo = [assembly].EntryPoint
        Dim objectValue As Object = RuntimeHelpers.GetObjectValue([assembly].CreateInstance(entryPoint.Name))
        entryPoint.Invoke(RuntimeHelpers.GetObjectValue(objectValue), New Object() {New String() {"1"}})

    End Sub
End Class
