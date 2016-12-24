Public Class GenerateAPIs

    Public Shared Function Gen(amount As Integer)
        Dim APIs As String() = New String() {" Declare Auto Function ", " Lib ", " Alias "}
        Dim final As String = Nothing
        For i = 1 To amount
            Dim built As String = String.Format("{0}{1}{2}{3}{4}{5}{6}", APIs(0), Misc.GeneratePassword(8), APIs(1), Chr(34) & Misc.GeneratePassword(8) & "." & Misc.GeneratePassword(3) & Chr(34), APIs(2), Chr(34) & Misc.GeneratePassword(6) & Chr(34), " (ByVal " & Misc.GeneratePassword(5) & " As String) As Long")
            final += built & vbCrLf
        Next
        Return final
    End Function
End Class
