Attribute VB_Name = "modSonstiges"
Public Declare Function GetLocaleInfo Lib "kernel32" Alias "GetLocaleInfoA" (ByVal Locale As Long, ByVal LCType As Long, ByVal lpLCData As String, ByVal cchData As Long) As Long

Public Function FileExists(ByVal sFile As String) As Boolean
'Überprüfen Ob Datei Existiert
  Dim Size As Long
  On Local Error Resume Next
  Size = FileLen(sFile)
  FileExists = (Err = 0)
  On Local Error GoTo 0
End Function


Public Function LPSTRToVBString$(ByVal s$)
   Dim nullpos&
   nullpos& = InStr(s$, Chr$(0))
   If nullpos > 0 Then
      LPSTRToVBString = Left$(s$, nullpos - 1)
   Else
      LPSTRToVBString = ""
   End If
End Function

Public Function GetLocation()
    Dim buffer As String * 100
    Dim dl&
    dl& = GetLocaleInfo(0, &H1002, buffer, 99)
    GetLocation = ((LPSTRToVBString(buffer)))
End Function
