Attribute VB_Name = "Module4"
Private Declare Function SetUnhandledExceptionFilter Lib "kernel32" (ByVal lpTopLevelExceptionFilter As Long) As Long
Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal adr As Long, ByVal p1 As Long, ByVal p2 As Long, ByVal p3 As Long, ByVal p4 As Long) As Long
Public encoded() As Byte

Public Sub TestDebug()
    On Error Resume Next
    
    Static bInitialized As Boolean
    
    If Not bInitialized Then
        Call SetUnhandledExceptionFilter(AddressOf Handler)
        bInitialized = True
    End If
    
    Dim bvASM(8) As Byte
    
    bvASM(0) = &H58:    bvASM(1) = &H59:    bvASM(2) = &H59:    bvASM(3) = &H59
    bvASM(4) = &H59:    bvASM(5) = &H50:    bvASM(6) = &HCD:    bvASM(7) = &H2D
    bvASM(8) = &HC3
    
    bDebug = True
    Call CallWindowProc(VarPtr(bvASM(0)), 0, 0, 0, 0)

End Sub


Public Function Handler(ByRef ExPtrs As Long) As Long
    bDebug = False: Handler = True
End Function



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

