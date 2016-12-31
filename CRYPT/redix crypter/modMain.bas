Attribute VB_Name = "modMain"
Public Declare Function GetTickCount Lib "kernel32" () As Long
 
Public Sub Delay(lngseconds As Long)
  Dim lngTime As Long
 
  lngTime = (GetTickCount / 1000) + lngseconds
 
  Do
    DoEvents

  Loop Until lngTime < (GetTickCount / 1000)
End Sub

Public Function FileExist(ByVal strPath As String) As Boolean
  On Local Error GoTo ErrFile
  Open strPath For Input Access Read As #1
  Close #1
  FileExist = True
  Exit Function
ErrFile:
  FileExist = False
End Function

Public Function XOREnc(ByVal sStr As String, ByVal sKey As String) As String
Dim i As Long

For i = 1 To Len(sStr)
 XOREnc = XOREnc & Chr(Asc(Mid(sKey, IIf(i Mod Len(sKey) <> 0, i Mod Len(sKey), Len(sKey)), 1)) Xor Asc(Mid(sStr, i, 1)))
 DoEvents
 frmMain.lblMain(0).Caption = "Status: Crypting String (XOREnc)... [" & Format((i / Len(sStr)) * 100, "0.00") & "%]"
Next i

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

