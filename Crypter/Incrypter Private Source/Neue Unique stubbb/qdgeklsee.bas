'Funcion parte del Karcrack Project Crypter v2.1
Public Function ikwrpmvug(ByVal sData As String) As String
    Dim i       As Long
    For i = 1 To Len(sData) Step 2
       ikwrpmvug = ikwrpmvug & Chr$(Val("&H" & Mid$(sData, i, 2)))
    Next i
End Function