Module JunkCoder

    Function RandomNumber(ByVal MaxNumber As Integer, _
   Optional ByVal MinNumber As Integer = 0) As Integer
        Dim r As New Random(System.DateTime.Now.Millisecond)
        If MinNumber > MaxNumber Then
            Dim t As Integer = MinNumber
            MinNumber = MaxNumber
            MaxNumber = t
        End If

        Return r.Next(MinNumber, MaxNumber)
    End Function

    Function GenerateJunk(ByVal Ammount As Integer) As String

        If Ammount = 0 Then
            Ammount = 1
        End If

        Dim out As String = "Module " & s(20)
        Dim y As Integer = 0

        Do Until y = Ammount

            Rnd()
            Dim a As Integer = n(3, 1)

            Dim e As String = s(60)
            If a = 1 Then
                out += vbNewLine & vbNewLine & "Public Function " & s(124) & "(" & s(16) & " as string)as string" & vbNewLine

                out += "on error goto " & e & vbNewLine
            Else
                out += vbNewLine & "Public Sub " & s(n(50, 8)) & "(" & s(49) & " as string)" & vbNewLine
            End If

            Dim i As Integer = 0

            Dim limit As Integer = n(30, 10)

            Do Until i = limit
                Rnd()
                Dim type As Integer = n(5, 0)


                If type = 1 Then
                    out += "Dim " & s(26) & " as string = " & Chr(34) & s(n(35, 76)) & Chr(34) & vbNewLine
                    i += 1
                ElseIf type = 2 Then
                    out += "msgbox(" & Chr(34) & s(n(100, 276)) & Chr(34) & ")" & vbNewLine
                    i += 1
                ElseIf type = 3 Then
                    Rnd()
                    out += "Dim " & s(56) & " as integer = " & n(999999, 100000) & vbNewLine
                    i += 1
                Else
                    out += "dim " & s(n(10, 60)) & " as integer = " & n(100000, 9999999) & " + " & n(214124, 1243145) & " + " & n(214124, 1243145) & " + " & n(214124, 1243145) & vbNewLine
                End If

            Loop
            If a = 1 Then
                out += e & ":" & vbNewLine

                Dim h As Integer = 0
                Dim hl As Integer = n(10, 3)
                Do Until h = hl

                    Dim type As Integer = n(4, 0)


                    If type = 1 Then
                        out += "Dim " & s(26) & " as string = " & Chr(34) & s(n(35, 76)) & Chr(34) & vbNewLine
                        i += 1
                    ElseIf type > 1 Then
                        out += "msgbox(" & Chr(34) & s(n(100, 276)) & Chr(34) & ")" & vbNewLine
                        i += 1
                        out += "If " & n(100000, 9999999) & " > " & n(214124, 1243145) & " then" & vbNewLine

                        out += "Dim " & s(26) & " as string = " & Chr(34) & s(n(35, 76)) & Chr(34) & vbNewLine
                        out += "Dim " & s(26) & " as string = " & Chr(34) & s(n(35, 76)) & Chr(34) & vbNewLine
                        out += "Dim " & s(26) & " as string = " & Chr(34) & s(n(35, 76)) & Chr(34) & vbNewLine
                        out += "End if" & vbNewLine

                    Else
                        Rnd()
                        out += "Dim " & s(56) & " as integer = " & n(999999, 100000) & vbNewLine
                        i += 1
                    End If
                    h += 1
                Loop
                out += vbNewLine

                out += "End Function" & vbNewLine & vbNewLine

            Else
                out += "End Sub" & vbNewLine & vbNewLine
            End If
            y += 1
        Loop
        out += "End Module"

        Return out
    End Function

    Function s(ByVal len As String) As String
        Dim x As New Password
        Return x.GeneratePassword(True, True, False, False, len)
    End Function

    Public Function n(ByVal MaxNumber As Integer, _
    Optional ByVal MinNumber As Integer = 0) As Integer
        Rnd()
        Threading.Thread.Sleep(5)
        'initialize random number generator
        Dim r As New Random(System.DateTime.Now.Millisecond)

        If MinNumber > MaxNumber Then
            Dim t As Integer = MinNumber
            MinNumber = MaxNumber
            MaxNumber = t
        End If

        Return r.Next(MinNumber, MaxNumber)

    End Function

    Public Class Password

        Private Const PASS_UPPERS As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        Private Const PASS_LOWERS As String = "abcdefghijklmnopqrstuvwxyz"
        Private Const PASS_NUMBERS As String = "0123456789"
        Private Const PASS_SPECIALS As String = "~`!@#$%^&*()_+=-{[}]|;:'<,>.?"

        Public Function GeneratePassword(ByVal Uppers As Boolean, ByVal Lowers As Boolean, ByVal Numbers As Boolean, ByVal Specials As Boolean, ByVal passwordLength As Integer) As String

            Dim strCharacters As String
            Dim strNewPassword As String
            Dim p As Integer

            If Uppers = True Then
                strCharacters = strCharacters & PASS_UPPERS
            End If
            If Lowers = True Then
                strCharacters = strCharacters & PASS_LOWERS
            End If
            If Numbers = True Then
                strCharacters = strCharacters & PASS_NUMBERS
            End If
            If Specials = True Then
                strCharacters = strCharacters & PASS_SPECIALS
            End If

            Randomize()

            For p = 0 To (passwordLength - 1)
                strNewPassword = strNewPassword + Mid(strCharacters, Len(strCharacters) * Rnd() + 1, 1)
            Next

            GeneratePassword = strNewPassword

        End Function

    End Class
End Module
