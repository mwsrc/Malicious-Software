Module StringExtension
    Public Function GetBetween(s As String, bet As String, ween As String, Optional startposition As Integer = 0) As String
        Try
            Dim result As String
            Dim length As Integer = bet.Length
            Dim text As String = String.Empty
            Dim firstIndex As Integer = s.IndexOf(bet, startposition)
            Dim secondIndex As Integer = s.IndexOf(ween, firstIndex + length)
            Dim flag As Boolean = firstIndex <> -1 AndAlso secondIndex <> -1
            If flag Then
                text = s.Substring(firstIndex + length, secondIndex - (firstIndex + length))
            End If
            result = text
            Return result
        Catch
            Return Nothing
        End Try

    End Function
End Module
