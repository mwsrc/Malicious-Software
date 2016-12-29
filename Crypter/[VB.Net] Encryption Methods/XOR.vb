Public Function Encrypt(ByVal CodeKey As String, ByVal DataIn As String) As String
  Dim lonDataPtr As Long
  Dim strDataOut As String
  Dim temp As Integer
  Dim tempstring As String
  Dim intXOrValue1 As Integer
  Dim intXOrValue2 As Integer
  For lonDataPtr = 1 To Len(DataIn)
    intXOrValue1 = Asc(Mid$(DataIn, lonDataPtr, 1))
    intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))

    temp = (intXOrValue1 Xor intXOrValue2)
    tempstring = Hex(temp)
    If Len(tempstring) = 1 Then tempstring = "0" & tempstring
    strDataOut = strDataOut + tempstring
  Next lonDataPtr
  Return strDataOut
    End Function

    Public Function Decrypt(ByVal CodeKey As String, ByVal DataIn As String) As String
  Dim lonDataPtr As Long
  Dim strDataOut As String
  Dim intXOrValue1 As Integer
  Dim intXOrValue2 As Integer

  For lonDataPtr = 1 To (Len(DataIn) / 2)
    intXOrValue1 = Val("&H" & (Mid$(DataIn, (2 * lonDataPtr) - 1, 2)))
    intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))

    strDataOut = strDataOut + Chr(intXOrValue1 Xor intXOrValue2)
  Next lonDataPtr
  Return strDataOut
    End Function
[u]stub :
[/u]

Public Function XOR(ByVal CodeKey As String, ByVal DataIn As String) As String
  Dim lonDataPtr As Long
  Dim strDataOut As String
  Dim intXOrValue1 As Integer
  Dim intXOrValue2 As Integer

  For lonDataPtr = 1 To (Len(DataIn) / 2)
    intXOrValue1 = Val("&H" & (Mid$(DataIn, (2 * lonDataPtr) - 1, 2)))
    intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))

    strDataOut = strDataOut + Chr(intXOrValue1 Xor intXOrValue2)
  Next lonDataPtr
  xEncryption = strDataOut
    End Function