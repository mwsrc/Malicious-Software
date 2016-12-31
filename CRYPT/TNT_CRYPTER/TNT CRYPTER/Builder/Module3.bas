Attribute VB_Name = "Module3"
Function CryptFile(ByVal Text As String, ByVal Schlüssel As String) As String
   Dim Tmp     As String
   Dim lPos    As Long
   Dim AscOrig As Long
   Dim AscKey  As Long
   Dim countt As Double
   
      
   ' Schlüssel erstellen der lang genug ist...
   While Len(Schlüssel) < Len(Text)
      Schlüssel = Schlüssel & Schlüssel
   Wend
   Schlüssel = Left$(Schlüssel, Len(Text))

   For lPos = 1 To Len(Text)
      AscOrig = Asc(Mid$(Text, lPos, 1))
      AscKey = Asc(Mid$(Schlüssel, lPos, 1))
      Mid$(Text, lPos, 1) = Chr$(AscOrig Xor AscKey)
    
   Next lPos
    CryptFile = Text
End Function

