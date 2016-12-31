Attribute VB_Name = "Split_mod"
Public Function SplitAlter(ByVal Expression As String, Optional ByVal Delimiter As String, Optional ByVal Limit As Long = -1) As String()
Dim lLastPos As Long
Dim lIncrement As Long
Dim lExpLen As Long
Dim lDelimLen As Long
Dim lUbound As Long
Dim svTemp() As String

lExpLen = Len(Expression)

If Delimiter = vbNullString Then Delimiter = " "
lDelimLen = Len(Delimiter)
If Limit = 0 Then GoTo QuitHere
If lExpLen = 0 Then GoTo QuitHere
If InStr(1, Expression, Delimiter, vbBinaryCompare) = 0 Then GoTo QuitHere

ReDim svTemp(0)
lLastPos = 1
lIncrement = 1

Do
If lUbound + 1 = Limit Then
svTemp(lUbound) = Mid$(Expression, lLastPos)
Exit Do
End If
lIncrement = InStr(lIncrement, Expression, Delimiter, vbBinaryCompare)
If lIncrement = 0 Then
If Not lLastPos = lExpLen Then
svTemp(lUbound) = Mid$(Expression, lLastPos)
End If
Exit Do
End If
svTemp(lUbound) = Mid$(Expression, lLastPos, lIncrement - lLastPos)
lUbound = lUbound + 1
ReDim Preserve svTemp(lUbound)
lLastPos = lIncrement + lDelimLen
lIncrement = lLastPos
Loop

ReDim Preserve svTemp(lUbound)
SplitAlter = svTemp

Exit Function

QuitHere:
ReDim SplitAlter(-1 To -1)
End Function
