Attribute VB_Name = "mXOR"
Public Function XORDecryption(CodeKey As String, DataIn As String) As String
    
    Dim lonDataPtr As Long
    Dim strDataOut As String
    Dim intXOrValue1 As Integer
    Dim intXOrValue2 As Integer
    

    For lonDataPtr = 1 To (Len(DataIn) / 2)
        'The first value to be XOr-ed comes from the data to be encrypted
        intXOrValue1 = Val("&H" & (Mid$(DataIn, (2 * lonDataPtr) - 1, 2)))
        'The second value comes from the code key
        intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))
        
        strDataOut = strDataOut + Chr(intXOrValue1 Xor intXOrValue2)
    Next lonDataPtr
   XORDecryption = strDataOut
End Function


Public Function XOREncryption(CodeKey As String, DataIn As String) As String
    
    Dim lonDataPtr As Long
    Dim strDataOut As String
    Dim temp As Integer
    Dim tempstring As String
    Dim intXOrValue1 As Integer
    Dim intXOrValue2 As Integer
    

    For lonDataPtr = 1 To Len(DataIn)
        'The first value to be XOr-ed comes from the data to be encrypted
        intXOrValue1 = Asc(Mid$(DataIn, lonDataPtr, 1))
        'The second value comes from the code key
        intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))
        
        temp = (intXOrValue1 Xor intXOrValue2)
        tempstring = Hex(temp)
        If Len(tempstring) = 1 Then tempstring = "0" & tempstring
        
        strDataOut = strDataOut + tempstring
    Next lonDataPtr
   XOREncryption = strDataOut
End Function
