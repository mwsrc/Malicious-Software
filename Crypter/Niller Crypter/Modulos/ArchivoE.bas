Attribute VB_Name = "ArchivoE"
Public Function ArchivoE(ByVal strPath As String) As Boolean
  On Local Error GoTo ErrFile
  Open strPath For Input Access Read As #1
  Close #1
  ArchivoE = True
  Exit Function
ErrFile:
 ArchivoE = False
End Function
