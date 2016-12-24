Option Strict On
Imports System.Text


Public Class RandomKeyGenerator
    Dim Key_Letters As String
    Dim Key_Numbers As String
    Dim Key_Chars As Integer
    Dim LettersArray As Char()
    Dim NumbersArray As Char()



    Protected Friend WriteOnly Property KeyLetters() As String
        Set(ByVal Value As String)
            Key_Letters = Value
        End Set
    End Property


    Protected Friend WriteOnly Property KeyNumbers() As String
        Set(ByVal Value As String)
            Key_Numbers = Value
        End Set
    End Property


    Protected Friend WriteOnly Property KeyChars() As Integer
        Set(ByVal Value As Integer)
            Key_Chars = Value
        End Set
    End Property


    Function Generate() As String
        Dim i_key As Integer
        Dim Random1 As Single
        Dim arrIndex As Int16
        Dim sb As New StringBuilder
        Dim RandomLetter As String



        LettersArray = Key_Letters.ToCharArray
        NumbersArray = Key_Numbers.ToCharArray

        For i_key = 1 To Key_Chars


            Randomize()
            Random1 = Rnd()
            arrIndex = -1

            If (CType(Random1 * 111, Integer)) Mod 2 = 0 Then

                Do While arrIndex < 0
                    arrIndex = _
                     Convert.ToInt16(LettersArray.GetUpperBound(0) _
                     * Random1)
                Loop
                RandomLetter = LettersArray(arrIndex)


                If (CType(arrIndex * Random1 * 99, Integer)) Mod 2 <> 0 Then
                    RandomLetter = LettersArray(arrIndex).ToString
                    RandomLetter = RandomLetter.ToUpper
                End If
                sb.Append(RandomLetter)
            Else


                Do While arrIndex < 0
                    arrIndex = _
                      Convert.ToInt16(NumbersArray.GetUpperBound(0) _
                      * Random1)
                Loop
                sb.Append(NumbersArray(arrIndex))
            End If
        Next
        Return sb.ToString
    End Function
End Class