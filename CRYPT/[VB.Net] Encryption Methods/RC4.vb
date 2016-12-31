Private Shared Function Proper_RC4(ByVal Input As Byte(), ByVal Key As Byte()) As Byte()
  'Leave a thanks at least..
  'by d3c0mpil3r from HF
  Dim i, j, swap As UInteger
  Dim s As UInteger() = New UInteger(255) {}
  Dim Output As Byte() = New Byte(Input.Length - 1) {}

  For i = 0 To 255
    s(i) = i
  Next

  For i = 0 To 255
    j = (j + Key(i Mod Key.Length) + s(i)) And 255
    swap = s(i) 'Swapping of s(i) and s(j)
    s(i) = s(j)
    s(j) = swap
  Next

  i = 0 : j = 0
  For c = 0 To Output.Length - 1
    i = (i + 1) And 255
    j = (j + s(i)) And 255
    swap = s(i) 'Swapping of s(i) and s(j)
    s(i) = s(j)
    s(j) = swap
    Output(c) = Input(c) Xor s((s(i) + s(j)) And 255)
  Next

  Return Output
    End Function