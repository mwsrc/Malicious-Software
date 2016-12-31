Imports System.Text

Public Class Misc
    Public Shared r As New Random
    Public Shared Function GeneratePassword(len As Integer)
        Dim s As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        Dim sb As New StringBuilder
        For i As Integer = 1 To len
            Dim idx As Integer = r.Next(0, s.Length - 1)
            sb.Append(s.Substring(idx, 1))
        Next
        Return sb.ToString()
    End Function
    Public Shared Function GeneratePassword2(len As Integer)
        Dim s As String = "我會繞過你你的小豬頭笨蛋隨便填了更多的麵條"
        Dim sb As New StringBuilder
        For i As Integer = 1 To len
            Dim idx As Integer = r.Next(0, s.Length - 1)
            sb.Append(s.Substring(idx, 1))
        Next
        Return sb.ToString()
    End Function
End Class
