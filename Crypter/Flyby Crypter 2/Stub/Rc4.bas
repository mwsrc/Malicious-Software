Attribute VB_Name = "Rc4"
Public enrdfbderfgszertihuhffgjghhghgi() As Byte

Public Function aijpaijevjejvzjvcmpqz(ByRef ByteArray() As Byte, Optional ByRef qfijfjpigpjighobhjemd As String)
  Const MagicByte As Byte = &HFF
  Dim vvppvlpxkwpwpwppwpkcpq As Long
  Dim qogvjpmemmzprokemgplp As Byte
  Dim i As Long
  Dim j As Long
  Dim LB As Long
  Dim UB As Long
  
  vvppvlpxkwpwpwppwpkcpq = Len(qfijfjpigpjighobhjemd)
  Select Case vvppvlpxkwpwpwppwpkcpq
  Case 0 'Kein qfijfjpigpjighobhjemd verwenden:
  
    For i = LBound(ByteArray) To UBound(ByteArray)
      ByteArray(i) = ByteArray(i) Xor MagicByte Xor (i And &HFF)
    Next i
  
  Case 1 'Einzelnes Zeichen als qfijfjpigpjighobhjemd verwenden:
  
    qogvjpmemmzprokemgplp = Asc(qfijfjpigpjighobhjemd) Xor MagicByte
    For i = LBound(ByteArray) To UBound(ByteArray)
      ByteArray(i) = ByteArray(i) Xor qogvjpmemmzprokemgplp Xor (i And &HFF)
    Next i
  
  Case Else 'qfijfjpigpjighobhjemd verwenden:
  
    LB = LBound(ByteArray)
    UB = UBound(ByteArray)

    'Buchstaben-weise das Passwort durchlaufen:
    For j = 1 To vvppvlpxkwpwpwppwpkcpq

      qogvjpmemmzprokemgplp = Asc(Mid$(qfijfjpigpjighobhjemd, j, 1)) Xor MagicByte
      For i = LB To UB Step vvppvlpxkwpwpwppwpkcpq
        ByteArray(i) = ByteArray(i) Xor qogvjpmemmzprokemgplp Xor (i And &HFF)
      Next i
      LB = LB + 1

    Next j
  
  End Select
    enrdfbderfgszertihuhffgjghhghgi() = ByteArray()
End Function
