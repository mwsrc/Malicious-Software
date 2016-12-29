Attribute VB_Name = "GetEofData"
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Dst As Any, Src As Any, ByVal cLen As Long)

Public Function GetEOF(Path As String) As Long

    Dim ByteArray() As Byte
    Dim PE As Long, NumberOfSections As Integer
    Dim BeginLastSection As Long
    Dim RawSize As Long, RawOffset As Long
       
    Open Path For Binary As #1
        ReDim ByteArray(LOF(1) - 1)
        Get #1, , ByteArray
    Close #1
   
    Call CopyMemory(PE, ByteArray(&H3C), 4)
    Call CopyMemory(NumberOfSections, ByteArray(PE + &H6), 2)
    BeginLastSection = PE + &HF8 + ((NumberOfSections - 1) * &H28)
    Call CopyMemory(RawSize, ByteArray(BeginLastSection + 16), 4)
    Call CopyMemory(RawOffset, ByteArray(BeginLastSection + 20), 4)
    GetEOF = RawSize + RawOffset
   
End Function
