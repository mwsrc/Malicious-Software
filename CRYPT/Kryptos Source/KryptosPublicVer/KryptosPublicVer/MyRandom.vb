Public Class MyRandom

#Region "GenerateRandomString()"
    Public Shared Function GenerateRandomString(ByVal Uppers As Boolean, ByVal Lowers As Boolean, ByVal Numbers As Boolean, ByVal Specials As Boolean, ByVal Length As Integer) As String
        Const STR_UPPERS As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        Const STR_LOWERS As String = "abcdefghijklmnopqrstuvwxyz"
        Const STR_NUMBERS As String = "0123456789"
        Const STR_SPECIALS As String = "~`!@#$%^&*()_+=-{[}]|;:'<,>.?"

        Dim Characters As String = Nothing
        Dim RandomString As String = Nothing


        If Uppers = True Then
            Characters &= STR_UPPERS
        End If

        If Lowers = True Then
            Characters &= STR_LOWERS
        End If

        If Numbers = True Then
            Characters &= STR_NUMBERS
        End If

        If Specials = True Then
            Characters &= STR_SPECIALS
        End If


        Randomize()

        For i As Integer = 0 To Length - 1
            RandomString &= Mid(Characters, Len(Characters) * Rnd() + 1, 1)
        Next



        Return RandomString
    End Function
#End Region

#Region "GenerateRandomNumber()"
    Public Shared Function GenerateRandomNumber(ByVal Max As Integer, Optional ByVal Min As Integer = 0, Optional ByVal Seed As Integer = 0) As Integer
        Dim myRandom As Random

        If Seed <> Nothing Then
            myRandom = New Random(Seed)
        Else
            myRandom = New Random(Now.Millisecond)
        End If


        If Min > Max Then
            Dim newMin As Integer = Min

            Min = Max
            Max = newMin
        End If



        Return myRandom.Next(Min, Max)
    End Function
#End Region

#Region "GenerateRandomVersion()"
    Public Shared Function GenerateRandomVersion() As String
        Dim First As String = GenerateRandomNumber(9).ToString()

        Randomize()
        Dim Second As String = GenerateRandomNumber(9, 0, First * CInt(Rnd())).ToString()

        Randomize()
        Dim Third As String = GenerateRandomNumber(9, 0, Second * CInt(Rnd())).ToString()

        Randomize()
        Dim Fourth As String = GenerateRandomNumber(9, 0, Third * CInt(Rnd())).ToString()


        Return First & "." & Second & "." & Third & "." & Fourth
    End Function
#End Region

#Region "GenerateRandomActiveX()"
    Public Shared Function GenerateRandomActiveX() As String
FirstStep: Dim First As String = GenerateRandomString(True, True, True, False, 8)

        If First.Length <> 8 Then
            GoTo FirstStep
        End If


SecondStep: Dim Second As String = GenerateRandomString(True, True, True, False, 4)

        If Second.Length <> 4 Then
            GoTo SecondStep
        End If


ThirdStep: Dim Third As String = GenerateRandomString(True, True, True, False, 4)

        If Third.Length <> 4 Then
            GoTo ThirdStep
        End If


FourthStep: Dim Fourth As String = GenerateRandomString(True, True, True, False, 4)

        If Fourth.Length <> 4 Then
            GoTo FourthStep
        End If


FifthStep: Dim Fifth As String = GenerateRandomString(True, True, True, False, 12)

        If Fifth.Length <> 12 Then
            GoTo FifthStep
        End If



        Return "{" & First & "-" & Second & "-" & Third & "-" & Fourth & "-" & Fifth & "}"
    End Function
#End Region


End Class