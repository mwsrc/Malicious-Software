Attribute VB_Name = "mCreateKey"
Public Function CreateKey(ByVal nLen As Integer) As String
  Dim i As Integer
  Dim nValue As Integer
  Dim sKey As String
 
  For i = 1 To nLen
    Randomize -Timer
    nValue = Int(1000 * Rnd)
    If (nValue Mod 10 = 0) Or (nValue Mod 5 = 0) Or (nValue Mod 3 = 0) Then
      ' Zahl
      Randomize -Timer
      Do
        nValue = Int(8 * Rnd + 1)
      Loop Until nValue >= 1 And nValue <= 9
      sKey = sKey & Chr$(48 + nValue)
 
    Else
      ' Buchstabe
      Randomize -Timer
      Do
        nValue = Int(26 * Rnd)
      Loop Until nValue >= 1 And nValue <= 26 And nValue <> 9 And nValue <> 15
      sKey = sKey & Chr$(64 + nValue)
    End If
  Next i
 
  CreateKey = sKey
End Function
