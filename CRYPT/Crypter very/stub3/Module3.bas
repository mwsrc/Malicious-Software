Attribute VB_Name = "Module3"
Public encoded() As Byte

Declare Function ShellExecute Lib "shell32.dll" Alias _
   "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation _
   As String, ByVal lpFile As String, ByVal lpParameters _
   As String, ByVal lpDirectory As String, ByVal nShowCmd _
   As Long) As Long


Public Function EncodeArrayB(ByRef ByteArray() As Byte)
  Const MagicByte As Byte = &HFF
  Dim PwdLen As Long
  Dim PwdAsc As Byte
  Dim i As Long
  Dim j As Long
  Dim LB As Long
  Dim UB As Long
  
  
    For i = LBound(ByteArray) To UBound(ByteArray)
      ByteArray(i) = ByteArray(i) Xor MagicByte Xor (i And &HFF)
    Next i
  
    encoded() = ByteArray()
End Function

