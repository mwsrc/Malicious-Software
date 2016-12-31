Attribute VB_Name = "MFOUR"

Public Function VernamCode(sOriginal As String, _
  sPassword As String) As String
 
  Dim i As Long
  Dim aktpos As Long
  Dim bAkt As Byte
  Dim bCode As Byte
 
  VernamCode = ""
 

  aktpos = 1
  For i = Len(sPassword) + 1 To Len(sOriginal)
    sPassword = sPassword & Mid(sPassword, aktpos, 1)
    aktpos = aktpos + 1
    If aktpos > Len(sPassword) Then aktpos = 1
  Next i
 
  For i = 1 To Len(sOriginal)
    bAkt = Asc(Mid(sOriginal, i, 1))
    bCode = Asc(Mid(sPassword, i, 1))
 
    VernamCode = VernamCode & Chr(bAkt Xor bCode)
  Next i
End Function

