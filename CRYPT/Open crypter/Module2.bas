Attribute VB_Name = "Module2"
       Public Function XOR3(ByVal sStr As String, ByVal sKey As String) As String
       Dim i As Long
       For i = 1 To Len(sStr)
       XOR3 = XOR3 & Chr(Asc(Mid(sKey, IIf(i Mod Len(sKey) <> 0, i Mod Len(sKey), Len(sKey)), 1)) Xor Asc(Mid(sStr, i, 1)))
       Next i
       End Function
