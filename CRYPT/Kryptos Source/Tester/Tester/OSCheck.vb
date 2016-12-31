Public Class OSCheck
    Public Shared Function is64Bit() As Boolean
        If Not System.Environment.GetEnvironmentVariable("ProgramW6432") = "" Then
            Return True
        Else
            Return False
        End If

    End Function
End Class
