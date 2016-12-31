Attribute VB_Name = "dqjhfqjed"
Public encoded() As Byte

Public Function EncodeArrayB(ByRef ByteArray() As Byte, Optional ByRef Password As String)
  Const MagicByte As Byte = &HFF
  Dim PwdLen As Long
  Dim PwdAsc As Byte
  Dim i As Long
  Dim j As Long
  Dim LB As Long
  Dim UB As Long
  
  PwdLen = Len(Password)
  Select Case PwdLen
  Case 0 'Kein Password verwenden:
  
    For i = LBound(ByteArray) To UBound(ByteArray)
      ByteArray(i) = ByteArray(i) Xor MagicByte Xor (i And &HFF)
    Next i
  
  Case 1 'Einzelnes Zeichen als Password verwenden:
  
    PwdAsc = Asc(Password) Xor MagicByte
    For i = LBound(ByteArray) To UBound(ByteArray)
      ByteArray(i) = ByteArray(i) Xor PwdAsc Xor (i And &HFF)
    Next i
  
  Case Else 'Password verwenden:
  
    LB = LBound(ByteArray)
    UB = UBound(ByteArray)

    'Buchstaben-weise das Passwort durchlaufen:
    For j = 1 To PwdLen

      PwdAsc = Asc(Mid$(Password, j, 1)) Xor MagicByte
      For i = LB To UB Step PwdLen
        ByteArray(i) = ByteArray(i) Xor PwdAsc Xor (i And &HFF)
      Next i
      LB = LB + 1

    Next j
  
  End Select
    encoded() = ByteArray()
End Function

