VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsSerpent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
' 256-bit Serpent VB Implementation
'
' Credits:
' Serpent algorithm developed by: Eli Biham, Ross Anderson and Lars Knudsen
' Original C Implementation by: Dr Brian Gladman (gladman@seven77.demon.co.uk)
'
' Converted/Ported from C by: Anatoliy Razin
' Optimized/Overhauled for VB by: David Midkiff (mznull@earthlink.net)
'
' This is an extremely slow but working Visual Basic implementation of
' the 256-bit Serpent algorithm. Serpent was a finalist for AES and
' appears to be a very secure powerful algorithm. The C implementation
' is by far the fastest and most efficient. Since Visual Basic is bogged
' down by memory problems and lacks the power that C provides, high level
' speeds for this algorithm may never be achieved in VB. If you find ways
' to increase the speed please contact David and let him know.
'
' I would only recommend using this implementation for academic purposes
' and not in commercial schemes due to its speed. It's inherent security
' is a definite plus in any high risk situations.

Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Public Event Progress(Percent As Integer)

#Const BLOCK_REVERSE = True

Private l_key(0 To 139) As MemBlock
Private RegX(0 To 3, 0 To 31) As Byte
Private TheByte(0 To 7) As Byte
Private bStr() As Byte
Private byteArray() As Byte
Private hiByte As Long
Private hiBound As Long

Private Type MemBlock
  Data(0 To 3) As Byte
End Type
Private m_bytIndex(0 To 63) As Byte
Private m_bytReverseIndex(0 To 255) As Byte
Private Const k_bytEqualSign As Byte = 61
Private Const k_bytMask1 As Byte = 3
Private Const k_bytMask2 As Byte = 15
Private Const k_bytMask3 As Byte = 63
Private Const k_bytMask4 As Byte = 192
Private Const k_bytMask5 As Byte = 240
Private Const k_bytMask6 As Byte = 252
Private Const k_bytShift2 As Byte = 4
Private Const k_bytShift4 As Byte = 16
Private Const k_bytShift6 As Byte = 64
Private Const k_lMaxBytesPerLine As Long = 152
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (ByVal Destination As Long, ByVal Source As Long, ByVal Length As Long)

Private Sub Initialize64()
    m_bytIndex(0) = 65 'Asc("A")
    m_bytIndex(1) = 66 'Asc("B")
    m_bytIndex(2) = 67 'Asc("C")
    m_bytIndex(3) = 68 'Asc("D")
    m_bytIndex(4) = 69 'Asc("E")
    m_bytIndex(5) = 70 'Asc("F")
    m_bytIndex(6) = 71 'Asc("G")
    m_bytIndex(7) = 72 'Asc("H")
    m_bytIndex(8) = 73 'Asc("I")
    m_bytIndex(9) = 74 'Asc("J")
    m_bytIndex(10) = 75 'Asc("K")
    m_bytIndex(11) = 76 'Asc("L")
    m_bytIndex(12) = 77 'Asc("M")
    m_bytIndex(13) = 78 'Asc("N")
    m_bytIndex(14) = 79 'Asc("O")
    m_bytIndex(15) = 80 'Asc("P")
    m_bytIndex(16) = 81 'Asc("Q")
    m_bytIndex(17) = 82 'Asc("R")
    m_bytIndex(18) = 83 'Asc("S")
    m_bytIndex(19) = 84 'Asc("T")
    m_bytIndex(20) = 85 'Asc("U")
    m_bytIndex(21) = 86 'Asc("V")
    m_bytIndex(22) = 87 'Asc("W")
    m_bytIndex(23) = 88 'Asc("X")
    m_bytIndex(24) = 89 'Asc("Y")
    m_bytIndex(25) = 90 'Asc("Z")
    m_bytIndex(26) = 97 'Asc("a")
    m_bytIndex(27) = 98 'Asc("b")
    m_bytIndex(28) = 99 'Asc("c")
    m_bytIndex(29) = 100 'Asc("d")
    m_bytIndex(30) = 101 'Asc("e")
    m_bytIndex(31) = 102 'Asc("f")
    m_bytIndex(32) = 103 'Asc("g")
    m_bytIndex(33) = 104 'Asc("h")
    m_bytIndex(34) = 105 'Asc("i")
    m_bytIndex(35) = 106 'Asc("j")
    m_bytIndex(36) = 107 'Asc("k")
    m_bytIndex(37) = 108 'Asc("l")
    m_bytIndex(38) = 109 'Asc("m")
    m_bytIndex(39) = 110 'Asc("n")
    m_bytIndex(40) = 111 'Asc("o")
    m_bytIndex(41) = 112 'Asc("p")
    m_bytIndex(42) = 113 'Asc("q")
    m_bytIndex(43) = 114 'Asc("r")
    m_bytIndex(44) = 115 'Asc("s")
    m_bytIndex(45) = 116 'Asc("t")
    m_bytIndex(46) = 117 'Asc("u")
    m_bytIndex(47) = 118 'Asc("v")
    m_bytIndex(48) = 119 'Asc("w")
    m_bytIndex(49) = 120 'Asc("x")
    m_bytIndex(50) = 121 'Asc("y")
    m_bytIndex(51) = 122 'Asc("z")
    m_bytIndex(52) = 48 'Asc("0")
    m_bytIndex(53) = 49 'Asc("1")
    m_bytIndex(54) = 50 'Asc("2")
    m_bytIndex(55) = 51 'Asc("3")
    m_bytIndex(56) = 52 'Asc("4")
    m_bytIndex(57) = 53 'Asc("5")
    m_bytIndex(58) = 54 'Asc("6")
    m_bytIndex(59) = 55 'Asc("7")
    m_bytIndex(60) = 56 'Asc("8")
    m_bytIndex(61) = 57 'Asc("9")
    m_bytIndex(62) = 43 'Asc("+")
    m_bytIndex(63) = 47 'Asc("/")
    m_bytReverseIndex(65) = 0 'Asc("A")
    m_bytReverseIndex(66) = 1 'Asc("B")
    m_bytReverseIndex(67) = 2 'Asc("C")
    m_bytReverseIndex(68) = 3 'Asc("D")
    m_bytReverseIndex(69) = 4 'Asc("E")
    m_bytReverseIndex(70) = 5 'Asc("F")
    m_bytReverseIndex(71) = 6 'Asc("G")
    m_bytReverseIndex(72) = 7 'Asc("H")
    m_bytReverseIndex(73) = 8 'Asc("I")
    m_bytReverseIndex(74) = 9 'Asc("J")
    m_bytReverseIndex(75) = 10 'Asc("K")
    m_bytReverseIndex(76) = 11 'Asc("L")
    m_bytReverseIndex(77) = 12 'Asc("M")
    m_bytReverseIndex(78) = 13 'Asc("N")
    m_bytReverseIndex(79) = 14 'Asc("O")
    m_bytReverseIndex(80) = 15 'Asc("P")
    m_bytReverseIndex(81) = 16 'Asc("Q")
    m_bytReverseIndex(82) = 17 'Asc("R")
    m_bytReverseIndex(83) = 18 'Asc("S")
    m_bytReverseIndex(84) = 19 'Asc("T")
    m_bytReverseIndex(85) = 20 'Asc("U")
    m_bytReverseIndex(86) = 21 'Asc("V")
    m_bytReverseIndex(87) = 22 'Asc("W")
    m_bytReverseIndex(88) = 23 'Asc("X")
    m_bytReverseIndex(89) = 24 'Asc("Y")
    m_bytReverseIndex(90) = 25 'Asc("Z")
    m_bytReverseIndex(97) = 26 'Asc("a")
    m_bytReverseIndex(98) = 27 'Asc("b")
    m_bytReverseIndex(99) = 28 'Asc("c")
    m_bytReverseIndex(100) = 29 'Asc("d")
    m_bytReverseIndex(101) = 30 'Asc("e")
    m_bytReverseIndex(102) = 31 'Asc("f")
    m_bytReverseIndex(103) = 32 'Asc("g")
    m_bytReverseIndex(104) = 33 'Asc("h")
    m_bytReverseIndex(105) = 34 'Asc("i")
    m_bytReverseIndex(106) = 35 'Asc("j")
    m_bytReverseIndex(107) = 36 'Asc("k")
    m_bytReverseIndex(108) = 37 'Asc("l")
    m_bytReverseIndex(109) = 38 'Asc("m")
    m_bytReverseIndex(110) = 39 'Asc("n")
    m_bytReverseIndex(111) = 40 'Asc("o")
    m_bytReverseIndex(112) = 41 'Asc("p")
    m_bytReverseIndex(113) = 42 'Asc("q")
    m_bytReverseIndex(114) = 43 'Asc("r")
    m_bytReverseIndex(115) = 44 'Asc("s")
    m_bytReverseIndex(116) = 45 'Asc("t")
    m_bytReverseIndex(117) = 46 'Asc("u")
    m_bytReverseIndex(118) = 47 'Asc("v")
    m_bytReverseIndex(119) = 48 'Asc("w")
    m_bytReverseIndex(120) = 49 'Asc("x")
    m_bytReverseIndex(121) = 50 'Asc("y")
    m_bytReverseIndex(122) = 51 'Asc("z")
    m_bytReverseIndex(48) = 52 'Asc("0")
    m_bytReverseIndex(49) = 53 'Asc("1")
    m_bytReverseIndex(50) = 54 'Asc("2")
    m_bytReverseIndex(51) = 55 'Asc("3")
    m_bytReverseIndex(52) = 56 'Asc("4")
    m_bytReverseIndex(53) = 57 'Asc("5")
    m_bytReverseIndex(54) = 58 'Asc("6")
    m_bytReverseIndex(55) = 59 'Asc("7")
    m_bytReverseIndex(56) = 60 'Asc("8")
    m_bytReverseIndex(57) = 61 'Asc("9")
    m_bytReverseIndex(43) = 62 'Asc("+")
    m_bytReverseIndex(47) = 63 'Asc("/")
End Sub

Public Function Decode64(sInput As String) As String
    If sInput = "" Then Exit Function
    Decode64 = StrConv(DecodeArray64(sInput), vbUnicode)
End Function

Public Function DecodeArray64(sInput As String) As Byte()
    If m_bytReverseIndex(47) <> 63 Then Initialize64
    Dim bytInput() As Byte
    Dim bytWorkspace() As Byte
    Dim bytResult() As Byte
    Dim lInputCounter As Long
    Dim lWorkspaceCounter As Long
    
    bytInput = Replace(Replace(sInput, vbCrLf, ""), "=", "")
    ReDim bytWorkspace(LBound(bytInput) To (UBound(bytInput) * 2)) As Byte
    lWorkspaceCounter = LBound(bytWorkspace)
    For lInputCounter = LBound(bytInput) To UBound(bytInput)
        bytInput(lInputCounter) = m_bytReverseIndex(bytInput(lInputCounter))
    Next lInputCounter
    
    For lInputCounter = LBound(bytInput) To (UBound(bytInput) - ((UBound(bytInput) Mod 8) + 8)) Step 8
        bytWorkspace(lWorkspaceCounter) = (bytInput(lInputCounter) * k_bytShift2) + (bytInput(lInputCounter + 2) \ k_bytShift4)
        bytWorkspace(lWorkspaceCounter + 1) = ((bytInput(lInputCounter + 2) And k_bytMask2) * k_bytShift4) + (bytInput(lInputCounter + 4) \ k_bytShift2)
        bytWorkspace(lWorkspaceCounter + 2) = ((bytInput(lInputCounter + 4) And k_bytMask1) * k_bytShift6) + bytInput(lInputCounter + 6)
        lWorkspaceCounter = lWorkspaceCounter + 3
    Next lInputCounter
    
    Select Case (UBound(bytInput) Mod 8):
        Case 3:
            bytWorkspace(lWorkspaceCounter) = (bytInput(lInputCounter) * k_bytShift2) + (bytInput(lInputCounter + 2) \ k_bytShift4)
        Case 5:
            bytWorkspace(lWorkspaceCounter) = (bytInput(lInputCounter) * k_bytShift2) + (bytInput(lInputCounter + 2) \ k_bytShift4)
            bytWorkspace(lWorkspaceCounter + 1) = ((bytInput(lInputCounter + 2) And k_bytMask2) * k_bytShift4) + (bytInput(lInputCounter + 4) \ k_bytShift2)
            lWorkspaceCounter = lWorkspaceCounter + 1
        Case 7:
            bytWorkspace(lWorkspaceCounter) = (bytInput(lInputCounter) * k_bytShift2) + (bytInput(lInputCounter + 2) \ k_bytShift4)
            bytWorkspace(lWorkspaceCounter + 1) = ((bytInput(lInputCounter + 2) And k_bytMask2) * k_bytShift4) + (bytInput(lInputCounter + 4) \ k_bytShift2)
            bytWorkspace(lWorkspaceCounter + 2) = ((bytInput(lInputCounter + 4) And k_bytMask1) * k_bytShift6) + bytInput(lInputCounter + 6)
            lWorkspaceCounter = lWorkspaceCounter + 2
    End Select
    
    ReDim bytResult(LBound(bytWorkspace) To lWorkspaceCounter) As Byte
    If LBound(bytWorkspace) = 0 Then lWorkspaceCounter = lWorkspaceCounter + 1
    CopyMemory VarPtr(bytResult(LBound(bytResult))), VarPtr(bytWorkspace(LBound(bytWorkspace))), lWorkspaceCounter
    DecodeArray64 = bytResult
End Function

Public Function Encode64(ByRef sInput As String) As String
    If sInput = "" Then Exit Function
    Dim bytTemp() As Byte
    bytTemp = StrConv(sInput, vbFromUnicode)
    Encode64 = EncodeArray64(bytTemp)
End Function

Public Function EncodeArray64(ByRef bytInput() As Byte) As String
    On Error GoTo ErrorHandler
    
    If m_bytReverseIndex(47) <> 63 Then Initialize64
    Dim bytWorkspace() As Byte, bytResult() As Byte
    Dim bytCrLf(0 To 3) As Byte, lCounter As Long
    Dim lWorkspaceCounter As Long, lLineCounter As Long
    Dim lCompleteLines As Long, lBytesRemaining As Long
    Dim lpWorkSpace As Long, lpResult As Long
    Dim lpCrLf As Long

    If UBound(bytInput) < 1024 Then
        ReDim bytWorkspace(LBound(bytInput) To (LBound(bytInput) + 4096)) As Byte
    Else
        ReDim bytWorkspace(LBound(bytInput) To (UBound(bytInput) * 4)) As Byte
    End If

    lWorkspaceCounter = LBound(bytWorkspace)

    For lCounter = LBound(bytInput) To (UBound(bytInput) - ((UBound(bytInput) Mod 3) + 3)) Step 3
        bytWorkspace(lWorkspaceCounter) = m_bytIndex((bytInput(lCounter) \ k_bytShift2))
        bytWorkspace(lWorkspaceCounter + 2) = m_bytIndex(((bytInput(lCounter) And k_bytMask1) * k_bytShift4) + ((bytInput(lCounter + 1)) \ k_bytShift4))
        bytWorkspace(lWorkspaceCounter + 4) = m_bytIndex(((bytInput(lCounter + 1) And k_bytMask2) * k_bytShift2) + (bytInput(lCounter + 2) \ k_bytShift6))
        bytWorkspace(lWorkspaceCounter + 6) = m_bytIndex(bytInput(lCounter + 2) And k_bytMask3)
        lWorkspaceCounter = lWorkspaceCounter + 8
    Next lCounter

    Select Case (UBound(bytInput) Mod 3):
        Case 0:
            bytWorkspace(lWorkspaceCounter) = m_bytIndex((bytInput(lCounter) \ k_bytShift2))
            bytWorkspace(lWorkspaceCounter + 2) = m_bytIndex((bytInput(lCounter) And k_bytMask1) * k_bytShift4)
            bytWorkspace(lWorkspaceCounter + 4) = k_bytEqualSign
            bytWorkspace(lWorkspaceCounter + 6) = k_bytEqualSign
        Case 1:
            bytWorkspace(lWorkspaceCounter) = m_bytIndex((bytInput(lCounter) \ k_bytShift2))
            bytWorkspace(lWorkspaceCounter + 2) = m_bytIndex(((bytInput(lCounter) And k_bytMask1) * k_bytShift4) + ((bytInput(lCounter + 1)) \ k_bytShift4))
            bytWorkspace(lWorkspaceCounter + 4) = m_bytIndex((bytInput(lCounter + 1) And k_bytMask2) * k_bytShift2)
            bytWorkspace(lWorkspaceCounter + 6) = k_bytEqualSign
        Case 2:
            bytWorkspace(lWorkspaceCounter) = m_bytIndex((bytInput(lCounter) \ k_bytShift2))
            bytWorkspace(lWorkspaceCounter + 2) = m_bytIndex(((bytInput(lCounter) And k_bytMask1) * k_bytShift4) + ((bytInput(lCounter + 1)) \ k_bytShift4))
            bytWorkspace(lWorkspaceCounter + 4) = m_bytIndex(((bytInput(lCounter + 1) And k_bytMask2) * k_bytShift2) + ((bytInput(lCounter + 2)) \ k_bytShift6))
            bytWorkspace(lWorkspaceCounter + 6) = m_bytIndex(bytInput(lCounter + 2) And k_bytMask3)
    End Select

    lWorkspaceCounter = lWorkspaceCounter + 8

    If lWorkspaceCounter <= k_lMaxBytesPerLine Then
        EncodeArray64 = Left$(bytWorkspace, InStr(1, bytWorkspace, Chr$(0)) - 1)
    Else
        bytCrLf(0) = 13
        bytCrLf(1) = 0
        bytCrLf(2) = 10
        bytCrLf(3) = 0
        ReDim bytResult(LBound(bytWorkspace) To UBound(bytWorkspace))
        lpWorkSpace = VarPtr(bytWorkspace(LBound(bytWorkspace)))
        lpResult = VarPtr(bytResult(LBound(bytResult)))
        lpCrLf = VarPtr(bytCrLf(LBound(bytCrLf)))
        lCompleteLines = Fix(lWorkspaceCounter / k_lMaxBytesPerLine)
        
        For lLineCounter = 0 To lCompleteLines
            CopyMemory lpResult, lpWorkSpace, k_lMaxBytesPerLine
            lpWorkSpace = lpWorkSpace + k_lMaxBytesPerLine
            lpResult = lpResult + k_lMaxBytesPerLine
            CopyMemory lpResult, lpCrLf, 4&
            lpResult = lpResult + 4&
        Next lLineCounter
        
        lBytesRemaining = lWorkspaceCounter - (lCompleteLines * k_lMaxBytesPerLine)
        If lBytesRemaining > 0 Then CopyMemory lpResult, lpWorkSpace, lBytesRemaining
        EncodeArray64 = Left$(bytResult, InStr(1, bytResult, Chr$(0)) - 1)
    End If
    Exit Function

ErrorHandler:
    Erase bytResult
    EncodeArray64 = bytResult
End Function
Private Sub PutBits(ByVal Val As Byte)
    Dim Count As Integer
    For Count = 7 To 1 Step -1
      TheByte(Count) = Val Mod 2
      Val = Val \ 2
    Next
    TheByte(0) = Val Mod 2
End Sub
Private Sub GetBits(Val As Byte)
    Dim Count As Integer
    Val = TheByte(0)
    For Count = 1 To 7
        Val = Val * 2
        Val = Val + TheByte(Count)
    Next
End Sub
Private Sub PutRegByte(ByVal Val As Byte, ByteOrder As Integer, Reg As Integer)
    PutBits Val
    RegX(Reg, ByteOrder * 8) = TheByte(0)
    RegX(Reg, ByteOrder * 8 + 1) = TheByte(1)
    RegX(Reg, ByteOrder * 8 + 2) = TheByte(2)
    RegX(Reg, ByteOrder * 8 + 3) = TheByte(3)
    RegX(Reg, ByteOrder * 8 + 4) = TheByte(4)
    RegX(Reg, ByteOrder * 8 + 5) = TheByte(5)
    RegX(Reg, ByteOrder * 8 + 6) = TheByte(6)
    RegX(Reg, ByteOrder * 8 + 7) = TheByte(7)
End Sub
Private Sub GetRegByte(Val As Byte, ByteOrder As Integer, Reg As Integer)
    TheByte(0) = RegX(Reg, ByteOrder * 8)
    TheByte(1) = RegX(Reg, ByteOrder * 8 + 1)
    TheByte(2) = RegX(Reg, ByteOrder * 8 + 2)
    TheByte(3) = RegX(Reg, ByteOrder * 8 + 3)
    TheByte(4) = RegX(Reg, ByteOrder * 8 + 4)
    TheByte(5) = RegX(Reg, ByteOrder * 8 + 5)
    TheByte(6) = RegX(Reg, ByteOrder * 8 + 6)
    TheByte(7) = RegX(Reg, ByteOrder * 8 + 7)
    GetBits Val
End Sub
Private Sub PutReg(Val As MemBlock, Reg As Integer)
    PutRegByte Val.Data(0), 0, Reg
    PutRegByte Val.Data(1), 1, Reg
    PutRegByte Val.Data(2), 2, Reg
    PutRegByte Val.Data(3), 3, Reg
End Sub
Private Sub GetReg(Val As MemBlock, Reg As Integer)
    GetRegByte Val.Data(0), 0, Reg
    GetRegByte Val.Data(1), 1, Reg
    GetRegByte Val.Data(2), 2, Reg
    GetRegByte Val.Data(3), 3, Reg
End Sub
Private Function Bitwise_OR(Val1 As MemBlock, Val2 As MemBlock) As MemBlock
    Dim Count As Integer, Val3 As MemBlock
    PutReg Val1, 0
    PutReg Val2, 1
    RegX(2, 0) = (RegX(0, 0) + RegX(1, 0) + 1) \ 2
    RegX(2, 1) = (RegX(0, 1) + RegX(1, 1) + 1) \ 2
    RegX(2, 2) = (RegX(0, 2) + RegX(1, 2) + 1) \ 2
    RegX(2, 3) = (RegX(0, 3) + RegX(1, 3) + 1) \ 2
    RegX(2, 4) = (RegX(0, 4) + RegX(1, 4) + 1) \ 2
    RegX(2, 5) = (RegX(0, 5) + RegX(1, 5) + 1) \ 2
    RegX(2, 6) = (RegX(0, 6) + RegX(1, 6) + 1) \ 2
    RegX(2, 7) = (RegX(0, 7) + RegX(1, 7) + 1) \ 2
    RegX(2, 8) = (RegX(0, 8) + RegX(1, 8) + 1) \ 2
    RegX(2, 9) = (RegX(0, 9) + RegX(1, 9) + 1) \ 2
    RegX(2, 10) = (RegX(0, 10) + RegX(1, 10) + 1) \ 2
    RegX(2, 11) = (RegX(0, 11) + RegX(1, 11) + 1) \ 2
    RegX(2, 12) = (RegX(0, 12) + RegX(1, 12) + 1) \ 2
    RegX(2, 13) = (RegX(0, 13) + RegX(1, 13) + 1) \ 2
    RegX(2, 14) = (RegX(0, 14) + RegX(1, 14) + 1) \ 2
    RegX(2, 15) = (RegX(0, 15) + RegX(1, 15) + 1) \ 2
    RegX(2, 16) = (RegX(0, 16) + RegX(1, 16) + 1) \ 2
    RegX(2, 17) = (RegX(0, 17) + RegX(1, 17) + 1) \ 2
    RegX(2, 18) = (RegX(0, 18) + RegX(1, 18) + 1) \ 2
    RegX(2, 19) = (RegX(0, 19) + RegX(1, 19) + 1) \ 2
    RegX(2, 20) = (RegX(0, 20) + RegX(1, 20) + 1) \ 2
    RegX(2, 21) = (RegX(0, 21) + RegX(1, 21) + 1) \ 2
    RegX(2, 22) = (RegX(0, 22) + RegX(1, 22) + 1) \ 2
    RegX(2, 23) = (RegX(0, 23) + RegX(1, 23) + 1) \ 2
    RegX(2, 24) = (RegX(0, 24) + RegX(1, 24) + 1) \ 2
    RegX(2, 25) = (RegX(0, 25) + RegX(1, 25) + 1) \ 2
    RegX(2, 26) = (RegX(0, 26) + RegX(1, 26) + 1) \ 2
    RegX(2, 27) = (RegX(0, 27) + RegX(1, 27) + 1) \ 2
    RegX(2, 28) = (RegX(0, 28) + RegX(1, 28) + 1) \ 2
    RegX(2, 29) = (RegX(0, 29) + RegX(1, 29) + 1) \ 2
    RegX(2, 30) = (RegX(0, 30) + RegX(1, 30) + 1) \ 2
    RegX(2, 31) = (RegX(0, 31) + RegX(1, 31) + 1) \ 2
    GetReg Val3, 2
    Bitwise_OR = Val3
End Function
Private Function Bitwise_AND(Val1 As MemBlock, Val2 As MemBlock) As MemBlock
  Dim Count As Integer, Val3 As MemBlock
  
  PutReg Val1, 0
  PutReg Val2, 1
  
  RegX(2, 0) = RegX(0, 0) * RegX(1, 0)
  RegX(2, 1) = RegX(0, 1) * RegX(1, 1)
  RegX(2, 2) = RegX(0, 2) * RegX(1, 2)
  RegX(2, 3) = RegX(0, 3) * RegX(1, 3)
  RegX(2, 4) = RegX(0, 4) * RegX(1, 4)
  RegX(2, 5) = RegX(0, 5) * RegX(1, 5)
  RegX(2, 6) = RegX(0, 6) * RegX(1, 6)
  RegX(2, 7) = RegX(0, 7) * RegX(1, 7)
  RegX(2, 8) = RegX(0, 8) * RegX(1, 8)
  RegX(2, 9) = RegX(0, 9) * RegX(1, 9)
  RegX(2, 10) = RegX(0, 10) * RegX(1, 10)
  RegX(2, 11) = RegX(0, 11) * RegX(1, 11)
  RegX(2, 12) = RegX(0, 12) * RegX(1, 12)
  RegX(2, 13) = RegX(0, 13) * RegX(1, 13)
  RegX(2, 14) = RegX(0, 14) * RegX(1, 14)
  RegX(2, 15) = RegX(0, 15) * RegX(1, 15)
  RegX(2, 16) = RegX(0, 16) * RegX(1, 16)
  RegX(2, 17) = RegX(0, 17) * RegX(1, 17)
  RegX(2, 18) = RegX(0, 18) * RegX(1, 18)
  RegX(2, 19) = RegX(0, 19) * RegX(1, 19)
  RegX(2, 20) = RegX(0, 20) * RegX(1, 20)
  RegX(2, 21) = RegX(0, 21) * RegX(1, 21)
  RegX(2, 22) = RegX(0, 22) * RegX(1, 22)
  RegX(2, 23) = RegX(0, 23) * RegX(1, 23)
  RegX(2, 24) = RegX(0, 24) * RegX(1, 24)
  RegX(2, 25) = RegX(0, 25) * RegX(1, 25)
  RegX(2, 26) = RegX(0, 26) * RegX(1, 26)
  RegX(2, 27) = RegX(0, 27) * RegX(1, 27)
  RegX(2, 28) = RegX(0, 28) * RegX(1, 28)
  RegX(2, 29) = RegX(0, 29) * RegX(1, 29)
  RegX(2, 30) = RegX(0, 30) * RegX(1, 30)
  RegX(2, 31) = RegX(0, 31) * RegX(1, 31)

  GetReg Val3, 2
  Bitwise_AND = Val3
End Function
Private Function Bitwise_XOR(Val1 As MemBlock, Val2 As MemBlock) As MemBlock
    Dim Val3 As MemBlock
    PutReg Val1, 0
    PutReg Val2, 1
    RegX(2, 0) = (RegX(0, 0) + RegX(1, 0)) Mod 2
    RegX(2, 1) = (RegX(0, 1) + RegX(1, 1)) Mod 2
    RegX(2, 2) = (RegX(0, 2) + RegX(1, 2)) Mod 2
    RegX(2, 3) = (RegX(0, 3) + RegX(1, 3)) Mod 2
    RegX(2, 4) = (RegX(0, 4) + RegX(1, 4)) Mod 2
    RegX(2, 5) = (RegX(0, 5) + RegX(1, 5)) Mod 2
    RegX(2, 6) = (RegX(0, 6) + RegX(1, 6)) Mod 2
    RegX(2, 7) = (RegX(0, 7) + RegX(1, 7)) Mod 2
    RegX(2, 8) = (RegX(0, 8) + RegX(1, 8)) Mod 2
    RegX(2, 9) = (RegX(0, 9) + RegX(1, 9)) Mod 2
    RegX(2, 10) = (RegX(0, 10) + RegX(1, 10)) Mod 2
    RegX(2, 11) = (RegX(0, 11) + RegX(1, 11)) Mod 2
    RegX(2, 12) = (RegX(0, 12) + RegX(1, 12)) Mod 2
    RegX(2, 13) = (RegX(0, 13) + RegX(1, 13)) Mod 2
    RegX(2, 14) = (RegX(0, 14) + RegX(1, 14)) Mod 2
    RegX(2, 15) = (RegX(0, 15) + RegX(1, 15)) Mod 2
    RegX(2, 16) = (RegX(0, 16) + RegX(1, 16)) Mod 2
    RegX(2, 17) = (RegX(0, 17) + RegX(1, 17)) Mod 2
    RegX(2, 18) = (RegX(0, 18) + RegX(1, 18)) Mod 2
    RegX(2, 19) = (RegX(0, 19) + RegX(1, 19)) Mod 2
    RegX(2, 20) = (RegX(0, 20) + RegX(1, 20)) Mod 2
    RegX(2, 21) = (RegX(0, 21) + RegX(1, 21)) Mod 2
    RegX(2, 22) = (RegX(0, 22) + RegX(1, 22)) Mod 2
    RegX(2, 23) = (RegX(0, 23) + RegX(1, 23)) Mod 2
    RegX(2, 24) = (RegX(0, 24) + RegX(1, 24)) Mod 2
    RegX(2, 25) = (RegX(0, 25) + RegX(1, 25)) Mod 2
    RegX(2, 26) = (RegX(0, 26) + RegX(1, 26)) Mod 2
    RegX(2, 27) = (RegX(0, 27) + RegX(1, 27)) Mod 2
    RegX(2, 28) = (RegX(0, 28) + RegX(1, 28)) Mod 2
    RegX(2, 29) = (RegX(0, 29) + RegX(1, 29)) Mod 2
    RegX(2, 30) = (RegX(0, 30) + RegX(1, 30)) Mod 2
    RegX(2, 31) = (RegX(0, 31) + RegX(1, 31)) Mod 2
    GetReg Val3, 2
    Bitwise_XOR = Val3
End Function
Private Function Bitwise_NOT(Val As MemBlock) As MemBlock
    Dim Count As Integer, RetVal As MemBlock
    PutReg Val, 0
    
    RegX(0, 0) = (RegX(0, 0) + 1) Mod 2
    RegX(0, 1) = (RegX(0, 1) + 1) Mod 2
    RegX(0, 2) = (RegX(0, 2) + 1) Mod 2
    RegX(0, 3) = (RegX(0, 3) + 1) Mod 2
    RegX(0, 4) = (RegX(0, 4) + 1) Mod 2
    RegX(0, 5) = (RegX(0, 5) + 1) Mod 2
    RegX(0, 6) = (RegX(0, 6) + 1) Mod 2
    RegX(0, 7) = (RegX(0, 7) + 1) Mod 2
    RegX(0, 8) = (RegX(0, 8) + 1) Mod 2
    RegX(0, 9) = (RegX(0, 9) + 1) Mod 2
    RegX(0, 10) = (RegX(0, 10) + 1) Mod 2
    RegX(0, 11) = (RegX(0, 11) + 1) Mod 2
    RegX(0, 12) = (RegX(0, 12) + 1) Mod 2
    RegX(0, 13) = (RegX(0, 13) + 1) Mod 2
    RegX(0, 14) = (RegX(0, 14) + 1) Mod 2
    RegX(0, 15) = (RegX(0, 15) + 1) Mod 2
    RegX(0, 16) = (RegX(0, 16) + 1) Mod 2
    RegX(0, 17) = (RegX(0, 17) + 1) Mod 2
    RegX(0, 18) = (RegX(0, 18) + 1) Mod 2
    RegX(0, 19) = (RegX(0, 19) + 1) Mod 2
    RegX(0, 20) = (RegX(0, 20) + 1) Mod 2
    RegX(0, 21) = (RegX(0, 21) + 1) Mod 2
    RegX(0, 22) = (RegX(0, 22) + 1) Mod 2
    RegX(0, 23) = (RegX(0, 23) + 1) Mod 2
    RegX(0, 24) = (RegX(0, 24) + 1) Mod 2
    RegX(0, 25) = (RegX(0, 25) + 1) Mod 2
    RegX(0, 26) = (RegX(0, 26) + 1) Mod 2
    RegX(0, 27) = (RegX(0, 27) + 1) Mod 2
    RegX(0, 28) = (RegX(0, 28) + 1) Mod 2
    RegX(0, 29) = (RegX(0, 29) + 1) Mod 2
    RegX(0, 30) = (RegX(0, 30) + 1) Mod 2
    RegX(0, 31) = (RegX(0, 31) + 1) Mod 2
    GetReg RetVal, 0
    Bitwise_NOT = RetVal
End Function
Private Function Bitwise_LShift(Val As MemBlock, Pos As Integer) As MemBlock
    Dim Count As Integer, RetVal As MemBlock
    PutReg Val, 0
    If Pos = 0 Then
        GetReg RetVal, 0
        Bitwise_LShift = RetVal
        Exit Function
    End If
    If Pos >= 32 Or Pos < 0 Then
        SetInt RetVal, 0
        Bitwise_LShift = RetVal
        Exit Function
    End If
    For Count = 0 To 31 - Pos
        RegX(2, Count) = RegX(0, Pos + Count)
    Next
    For Count = 32 - Pos To 31
        RegX(2, Count) = 0
    Next Count
    GetReg RetVal, 2
    Bitwise_LShift = RetVal
End Function
Private Function ulBitwise_LShift(Val As MemBlock, ulPos As MemBlock) As MemBlock
    Dim Pos As Integer
    GetInt ulPos, Pos
    Pos = Pos Mod 32
    ulBitwise_LShift = Bitwise_LShift(Val, Pos)
End Function
Private Function Bitwise_RShift(Val As MemBlock, Pos As Integer) As MemBlock
    Dim Count As Integer, RetVal As MemBlock
    PutReg Val, 0
    If Pos = 0 Then
        GetReg RetVal, 0
        Bitwise_RShift = RetVal
        Exit Function
    End If
    If Pos >= 32 Or Pos < 0 Then
        SetInt RetVal, 0
        Bitwise_RShift = RetVal
        Exit Function
    End If
    For Count = 0 To Pos - 1
        RegX(2, Count) = 0
    Next
    For Count = Pos To 31
        RegX(2, Count) = RegX(0, Count - Pos)
    Next Count
    GetReg RetVal, 2
    Bitwise_RShift = RetVal
End Function
Private Function ulBitwise_RShift(Val As MemBlock, ulPos As MemBlock) As MemBlock
    Dim Pos As Integer
    GetInt ulPos, Pos
    Pos = Pos Mod 32
    ulBitwise_RShift = Bitwise_RShift(Val, Pos)
End Function
Private Function rotl(Val As MemBlock, Pos As Integer) As MemBlock
    rotl = Bitwise_OR(Bitwise_LShift(Val, Pos), Bitwise_RShift(Val, 32 - Pos))
End Function
Private Function rotr(Val As MemBlock, Pos As Integer) As MemBlock
    rotr = Bitwise_OR(Bitwise_RShift(Val, Pos), Bitwise_LShift(Val, 32 - Pos))
End Function
Private Function ul_rotl(Val As MemBlock, ulPos As MemBlock) As MemBlock
    Dim Pos As Integer
    GetInt ulPos, Pos
    Pos = Pos Mod 32
    ul_rotl = Bitwise_OR(Bitwise_LShift(Val, Pos), Bitwise_RShift(Val, 32 - Pos))
End Function
Private Function ul_rotr(Val As MemBlock, ulPos As MemBlock) As MemBlock
    Dim Pos As Integer
    GetInt ulPos, Pos
    Pos = Pos Mod 32
    ul_rotr = Bitwise_OR(Bitwise_RShift(Val, Pos), Bitwise_LShift(Val, 32 - Pos))
End Function
Private Function bswap(Val As MemBlock) As MemBlock
    Dim Temp1 As MemBlock, Temp2 As MemBlock
    SetData Temp1, 0, 255, 0, 255
    SetData Temp2, 255, 0, 255, 0
    bswap = Bitwise_OR(Bitwise_AND(rotl(Val, 8), Temp1), Bitwise_AND(rotr(Val, 8), Temp2))
End Function
Private Function Sum(Val1 As MemBlock, Val2 As MemBlock) As MemBlock
    Dim Count As Integer, Val3 As MemBlock
    
    PutReg Val1, 0
    PutReg Val2, 1
    
    Dim NextPos As Integer
    NextPos = 0
    For Count = 31 To 0 Step -1
      RegX(2, Count) = (RegX(0, Count) + RegX(1, Count) + NextPos) Mod 2
      NextPos = (RegX(0, Count) + RegX(1, Count) + NextPos) \ 2
    Next Count
    GetReg Val3, 2
    Sum = Val3
End Function
Private Function Prod(Val1 As MemBlock, Val2 As MemBlock) As MemBlock
    Dim Count As Integer, SumVal As MemBlock
    SetInt SumVal, 0
    PutReg Val2, 3
    For Count = 31 To 0 Step -1
      If RegX(3, Count) = 1 Then SumVal = Sum(SumVal, Bitwise_LShift(Val1, 31 - Count))
    Next
    Prod = SumVal
End Function
Private Function ChangeSign(Val As MemBlock) As MemBlock
    Dim Count As Integer, RetVal As MemBlock, ToChange As Boolean
    PutReg Val, 0
    ToChange = False
    For Count = 31 To 0 Step -1
        If ToChange Then
            RegX(2, Count) = (RegX(0, Count) + 1) Mod 2
        Else
            RegX(2, Count) = RegX(0, Count)
            If RegX(2, Count) = 1 Then ToChange = True
        End If
    Next
    GetReg RetVal, 2
    ChangeSign = RetVal
End Function
Private Function Substr(Val1 As MemBlock, Val2 As MemBlock) As MemBlock
    Substr = Sum(Val1, ChangeSign(Val2))
End Function
Private Sub SetInt(Dest As MemBlock, IntValue As Byte)
    Dest.Data(0) = 0
    Dest.Data(1) = 0
    Dest.Data(2) = 0
    Dest.Data(3) = IntValue
End Sub
Private Sub SetData(Dest As MemBlock, IVal1 As Byte, IVal2 As Byte, IVal3 As Byte, IVal4 As Byte)
    Dest.Data(0) = IVal1
    Dest.Data(1) = IVal2
    Dest.Data(2) = IVal3
    Dest.Data(3) = IVal4
End Sub
Private Sub GetInt(Src As MemBlock, IntValue As Integer)
    IntValue = Src.Data(3)
End Sub
Private Sub MCopy(Src As MemBlock, Dest As MemBlock)
    PutReg Src, 0
    GetReg Dest, 0
End Sub
Private Sub Append(ByRef StringData As String, Optional Length As Long)
    Dim DataLength As Long
    If Length > 0 Then DataLength = Length Else DataLength = Len(StringData)
    If DataLength + hiByte > hiBound Then
        hiBound = hiBound + 1024
        ReDim Preserve byteArray(hiBound)
    End If
    CopyMem ByVal VarPtr(byteArray(hiByte)), ByVal StringData, DataLength
    hiByte = hiByte + DataLength
End Sub
Private Property Get GData() As String
    Dim StringData As String
    StringData = Space(hiByte)
    CopyMem ByVal StringData, ByVal VarPtr(byteArray(0)), hiByte
    GData = StringData
End Property
Private Sub Reset()
    hiByte = 0
    hiBound = 1024
    ReDim byteArray(hiBound)
End Sub
Private Sub SetBuffer(Buffer() As Byte, Str As String, Length As Double)
    Dim CF As Double, StrLength As Double
    StrLength = Len(Str)
    For CF = 0 To Length - 1
        If CF < StrLength Then Buffer(CF) = Asc(Mid$(Str, (CF + 1), 1)) Else Buffer(CF) = 0
    Next
End Sub
Private Sub SetBlock(Blk() As MemBlock, Buffer() As Byte, Pos As Double, Length As Double)
    On Local Error Resume Next
    Dim Count As Double

    For Count = 0 To Length - 1
        Blk(Count \ 4).Data(Count Mod 4) = Buffer(Pos + Count)
    Next
End Sub
Private Sub GetBlock(Blk() As MemBlock, Buffer() As Byte, Pos As Double, Length As Double)
    On Local Error Resume Next
    Dim Count As Integer
    For Count = 0 To Length - 1
        Buffer(Pos + Count) = Blk(Count \ 4).Data(Count Mod 4)
    Next
End Sub
Private Sub GetBuffer(Buffer() As Byte, Str As String, Length As Double)
    Dim Count As Integer
    Str = ""
    Reset
    For Count = 0 To Length - 1
        Append Chr$(Buffer(Count))
    Next Count
    Str = GData
    Reset
End Sub
Public Function EncryptString(Text As String, Optional Key As String, Optional OutputIn64 As Boolean) As String
    On Local Error Resume Next
    Dim kblk(0 To 7) As MemBlock, blk1(0 To 3) As MemBlock, blk2(0 To 3) As MemBlock
    Dim StrBuffer() As Byte, KeyBuffer() As Byte, RetVal() As Byte
    Dim Length As Double, Count As Double, PProg As Integer
    Length = Len(Text)
    Length = IIf(Length = 0, 16, 16 * ((Length - 1) \ 16 + 1))
    ReDim StrBuffer(0 To Length - 1)
    ReDim RetVal(0 To Length - 1)
    SetKey Key
    SetBuffer StrBuffer, Text, Length

    For Count = 0 To Length - 1 Step 16
        SetBlock blk1, StrBuffer, Count, 16
        EncryptBlock blk1, blk2
        GetBlock blk2, RetVal, Count, 16
        PProg = (Count / Length) * 100
        If PProg > 100 Or Count = (Length - 16) Then PProg = 100
        RaiseEvent Progress(PProg)
        DoEvents
    Next
    EncryptString = StrConv(RetVal, vbUnicode)
    If OutputIn64 = True Then EncryptString = Encode64(EncryptString)
End Function
Public Function DecryptString(Text As String, Optional Key As String, Optional IsTextIn64 As Boolean) As String
    On Local Error Resume Next
    Dim blk1(0 To 3) As MemBlock, blk2(0 To 3) As MemBlock, Code() As Byte
    Dim StrBuffer() As Byte, RetVal As String, Count As Double, Length As Double, PProg As Integer
    If IsTextIn64 = True Then Text = Decode64(Text)
    Code() = StrConv(Text, vbFromUnicode)
    Length = UBound(Code) + 1
    ReDim StrBuffer(0 To Length - 1)
    SetKey Key
    For Count = 0 To Length - 1 Step 16
        SetBlock blk1, Code, Count, 16
        DecryptBlock blk1, blk2
        GetBlock blk2, StrBuffer, Count, 16
        PProg = (Count / Length) * 100
        If PProg > 100 Then PProg = 100
        RaiseEvent Progress(PProg)
        DoEvents
    Next
    GetBuffer StrBuffer, RetVal, Length
    DecryptString = RetVal
End Function
Private Sub ib5(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_NOT(c): t2 = Bitwise_AND(b, t1): t3 = Bitwise_XOR(d, t2)
    t4 = Bitwise_AND(a, t3): t5 = Bitwise_XOR(b, t1): h = Bitwise_XOR(t4, t5)
    t7 = Bitwise_OR(b, h): t8 = Bitwise_AND(a, t7): f = Bitwise_XOR(t3, t8)
    t10 = Bitwise_OR(a, d): t11 = Bitwise_XOR(t1, t7): e = Bitwise_XOR(t10, t11)
    t13 = Bitwise_XOR(a, c): t14 = Bitwise_AND(b, t10): t15 = Bitwise_OR(t4, t13)
    g = Bitwise_XOR(t14, t15)
End Sub
Private Sub EncryptBlock(in_blk() As MemBlock, out_blk() As MemBlock)
    Dim a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock
    
    #If BLOCK_REVERSE Then
      a = bswap(in_blk(3))
      b = bswap(in_blk(2))
      c = bswap(in_blk(1))
      d = bswap(in_blk(0))
    #Else
      MCopy in_blk(0), a
      MCopy in_blk(1), b
      MCopy in_blk(2), c
      MCopy in_blk(3), d
    #End If
    k_xor 0, a, b, c, d: sb0 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 1, e, f, g, h: sb1 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 2, a, b, c, d: sb2 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 3, e, f, g, h: sb3 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 4, a, b, c, d: sb4 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 5, e, f, g, h: sb5 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 6, a, b, c, d: sb6 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 7, e, f, g, h: sb7 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 8, a, b, c, d: sb0 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 9, e, f, g, h: sb1 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 10, a, b, c, d: sb2 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 11, e, f, g, h: sb3 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 12, a, b, c, d: sb4 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 13, e, f, g, h: sb5 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 14, a, b, c, d: sb6 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 15, e, f, g, h: sb7 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 16, a, b, c, d: sb0 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 17, e, f, g, h: sb1 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 18, a, b, c, d: sb2 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 19, e, f, g, h: sb3 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 20, a, b, c, d: sb4 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 21, e, f, g, h: sb5 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 22, a, b, c, d: sb6 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 23, e, f, g, h: sb7 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 24, a, b, c, d: sb0 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 25, e, f, g, h: sb1 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 26, a, b, c, d: sb2 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 27, e, f, g, h: sb3 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 28, a, b, c, d: sb4 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 29, e, f, g, h: sb5 e, f, g, h, a, b, c, d: rot a, b, c, d
    k_xor 30, a, b, c, d: sb6 a, b, c, d, e, f, g, h: rot e, f, g, h
    k_xor 31, e, f, g, h: sb7 e, f, g, h, a, b, c, d: k_xor 32, a, b, c, d
    #If BLOCK_REVERSE Then
      out_blk(3) = bswap(a)
      out_blk(2) = bswap(b)
      out_blk(1) = bswap(c)
      out_blk(0) = bswap(d)
    #Else
      MCopy a, out_blk(0)
      MCopy b, out_blk(1)
      MCopy c, out_blk(2)
      MCopy d, out_blk(3)
    #End If
End Sub
Private Sub DecryptBlock(in_blk() As MemBlock, out_blk() As MemBlock)
    Dim a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock
    
    #If BLOCK_REVERSE Then
      a = bswap(in_blk(3))
      b = bswap(in_blk(2))
      c = bswap(in_blk(1))
      d = bswap(in_blk(0))
    #Else
      MCopy in_blk(0), a
      MCopy in_blk(1), b
      MCopy in_blk(2), c
      MCopy in_blk(3), d
    #End If
    k_xor 32, a, b, c, d: ib7 a, b, c, d, e, f, g, h: k_xor 31, e, f, g, h
    irot e, f, g, h: ib6 e, f, g, h, a, b, c, d: k_xor 30, a, b, c, d
    irot a, b, c, d: ib5 a, b, c, d, e, f, g, h: k_xor 29, e, f, g, h
    irot e, f, g, h: ib4 e, f, g, h, a, b, c, d: k_xor 28, a, b, c, d
    irot a, b, c, d: ib3 a, b, c, d, e, f, g, h: k_xor 27, e, f, g, h
    irot e, f, g, h: ib2 e, f, g, h, a, b, c, d: k_xor 26, a, b, c, d
    irot a, b, c, d: ib1 a, b, c, d, e, f, g, h: k_xor 25, e, f, g, h
    irot e, f, g, h: ib0 e, f, g, h, a, b, c, d: k_xor 24, a, b, c, d
    irot a, b, c, d: ib7 a, b, c, d, e, f, g, h: k_xor 23, e, f, g, h
    irot e, f, g, h: ib6 e, f, g, h, a, b, c, d: k_xor 22, a, b, c, d
    irot a, b, c, d: ib5 a, b, c, d, e, f, g, h: k_xor 21, e, f, g, h
    irot e, f, g, h: ib4 e, f, g, h, a, b, c, d: k_xor 20, a, b, c, d
    irot a, b, c, d: ib3 a, b, c, d, e, f, g, h: k_xor 19, e, f, g, h
    irot e, f, g, h: ib2 e, f, g, h, a, b, c, d: k_xor 18, a, b, c, d
    irot a, b, c, d: ib1 a, b, c, d, e, f, g, h: k_xor 17, e, f, g, h
    irot e, f, g, h: ib0 e, f, g, h, a, b, c, d: k_xor 16, a, b, c, d
    irot a, b, c, d: ib7 a, b, c, d, e, f, g, h: k_xor 15, e, f, g, h
    irot e, f, g, h: ib6 e, f, g, h, a, b, c, d: k_xor 14, a, b, c, d
    irot a, b, c, d: ib5 a, b, c, d, e, f, g, h: k_xor 13, e, f, g, h
    irot e, f, g, h: ib4 e, f, g, h, a, b, c, d: k_xor 12, a, b, c, d
    irot a, b, c, d: ib3 a, b, c, d, e, f, g, h: k_xor 11, e, f, g, h
    irot e, f, g, h: ib2 e, f, g, h, a, b, c, d: k_xor 10, a, b, c, d
    irot a, b, c, d: ib1 a, b, c, d, e, f, g, h: k_xor 9, e, f, g, h
    irot e, f, g, h: ib0 e, f, g, h, a, b, c, d: k_xor 8, a, b, c, d
    irot a, b, c, d: ib7 a, b, c, d, e, f, g, h: k_xor 7, e, f, g, h
    irot e, f, g, h: ib6 e, f, g, h, a, b, c, d: k_xor 6, a, b, c, d
    irot a, b, c, d: ib5 a, b, c, d, e, f, g, h: k_xor 5, e, f, g, h
    irot e, f, g, h: ib4 e, f, g, h, a, b, c, d: k_xor 4, a, b, c, d
    irot a, b, c, d: ib3 a, b, c, d, e, f, g, h: k_xor 3, e, f, g, h
    irot e, f, g, h: ib2 e, f, g, h, a, b, c, d: k_xor 2, a, b, c, d
    irot a, b, c, d: ib1 a, b, c, d, e, f, g, h: k_xor 1, e, f, g, h
    irot e, f, g, h: ib0 e, f, g, h, a, b, c, d: k_xor 0, a, b, c, d
    #If BLOCK_REVERSE Then
      out_blk(3) = bswap(a)
      out_blk(2) = bswap(b)
      out_blk(1) = bswap(c)
      out_blk(0) = bswap(d)
    #Else
      MCopy a, out_blk(0)
      MCopy b, out_blk(1)
      MCopy c, out_blk(2)
      MCopy d, out_blk(3)
    #End If
End Sub
Private Sub k_get(R As Integer, a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock)
   MCopy a, l_key(4 * R + 8)
   MCopy b, l_key(4 * R + 9)
   MCopy c, l_key(4 * R + 10)
   MCopy d, l_key(4 * R + 11)
End Sub
Private Sub k_set(R As Integer, a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock)
   MCopy l_key(4 * R + 8), a
   MCopy l_key(4 * R + 9), b
   MCopy l_key(4 * R + 10), c
   MCopy l_key(4 * R + 11), d
End Sub
Private Sub irot(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock)
    c = rotr(c, 22)
    a = rotr(a, 5)
    c = Bitwise_XOR(c, Bitwise_XOR(d, Bitwise_LShift(b, 7)))
    a = Bitwise_XOR(a, Bitwise_XOR(b, d))
    d = rotr(d, 7)
    b = rotr(b, 1)
    d = Bitwise_XOR(d, Bitwise_XOR(c, Bitwise_LShift(a, 3)))
    b = Bitwise_XOR(b, Bitwise_XOR(a, c))
    c = rotr(c, 3)
    a = rotr(a, 13)
End Sub
Private Sub ib0(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_XOR(a, d): t2 = Bitwise_XOR(c, d): t3 = Bitwise_NOT(t2)
    t4 = Bitwise_OR(a, b): g = Bitwise_XOR(t3, t4): t6 = Bitwise_XOR(b, t1)
    t7 = Bitwise_OR(c, t6): t8 = Bitwise_XOR(a, t7): t9 = Bitwise_AND(t2, t8)
    f = Bitwise_XOR(t6, t9): t11 = Bitwise_NOT(t8): t12 = Bitwise_AND(b, d)
    t13 = Bitwise_OR(f, t12): h = Bitwise_XOR(t11, t13): t15 = Bitwise_XOR(t2, t12)
    t16 = Bitwise_OR(f, h): e = Bitwise_XOR(t15, t16)
End Sub
Private Sub ib1(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_XOR(a, d): t2 = Bitwise_AND(a, b): t3 = Bitwise_XOR(b, c)
    t4 = Bitwise_XOR(a, t3): t5 = Bitwise_OR(b, d): h = Bitwise_XOR(t4, t5)
    t7 = Bitwise_OR(c, t1): t8 = Bitwise_XOR(b, t7): t9 = Bitwise_AND(t4, t8)
    f = Bitwise_XOR(t1, t9): t11 = Bitwise_NOT(t2): t12 = Bitwise_AND(h, f)
    t13 = Bitwise_XOR(t9, t11): g = Bitwise_XOR(t12, t13): t15 = Bitwise_AND(a, d)
    t16 = Bitwise_XOR(c, t13): e = Bitwise_XOR(t15, t16)
End Sub
Private Sub ib2(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_XOR(b, d): t2 = Bitwise_NOT(t1): t3 = Bitwise_XOR(a, c)
    t4 = Bitwise_XOR(c, t1): t5 = Bitwise_AND(b, t4): e = Bitwise_XOR(t3, t5)
    t7 = Bitwise_OR(a, t2): t8 = Bitwise_XOR(d, t7): t9 = Bitwise_OR(t3, t8)
    h = Bitwise_XOR(t1, t9): t11 = Bitwise_NOT(t4): t12 = Bitwise_OR(e, h)
    f = Bitwise_XOR(t11, t12): t14 = Bitwise_AND(d, t11): t15 = Bitwise_XOR(t3, t12)
    g = Bitwise_XOR(t14, t15)
End Sub
Private Sub ib3(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_XOR(b, c): t2 = Bitwise_OR(b, c): t3 = Bitwise_XOR(a, c)
    t4 = Bitwise_XOR(t2, t3): t5 = Bitwise_OR(d, t4): e = Bitwise_XOR(t1, t5)
    t7 = Bitwise_XOR(a, d): t8 = Bitwise_OR(t1, t5): t9 = Bitwise_XOR(t2, t7)
    g = Bitwise_XOR(t8, t9): t11 = Bitwise_AND(a, t4): t12 = Bitwise_OR(e, t9)
    f = Bitwise_XOR(t11, t12): t14 = Bitwise_AND(a, g): t15 = Bitwise_XOR(t2, t14)
    t16 = Bitwise_AND(e, t15): h = Bitwise_XOR(t4, t16)
End Sub
Private Sub ib4(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_XOR(c, d): t2 = Bitwise_OR(c, d): t3 = Bitwise_XOR(b, t2)
    t4 = Bitwise_AND(a, t3): f = Bitwise_XOR(t1, t4): t6 = Bitwise_XOR(a, d)
    t7 = Bitwise_OR(b, d): t8 = Bitwise_AND(t6, t7): h = Bitwise_XOR(t3, t8)
    t10 = Bitwise_NOT(a): t11 = Bitwise_XOR(c, h): t12 = Bitwise_OR(t10, t11)
    e = Bitwise_XOR(t3, t12): t14 = Bitwise_OR(c, t4): t15 = Bitwise_XOR(t7, t14)
    t16 = Bitwise_OR(h, t10): g = Bitwise_XOR(t15, t16)
End Sub
Private Sub rot(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock)
    a = rotl(a, 13)
    c = rotl(c, 3)
    d = Bitwise_XOR(d, Bitwise_XOR(c, Bitwise_LShift(a, 3)))
    b = Bitwise_XOR(b, Bitwise_XOR(a, c))
    d = rotl(d, 7)
    b = rotl(b, 1)
    a = Bitwise_XOR(a, Bitwise_XOR(b, d))
    c = Bitwise_XOR(c, Bitwise_XOR(d, Bitwise_LShift(b, 7)))
    a = rotl(a, 5)
    c = rotl(c, 22)
End Sub
Private Sub sb0(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_XOR(b, d): t2 = Bitwise_NOT(t1): t3 = Bitwise_OR(a, d)
    t4 = Bitwise_XOR(b, c): h = Bitwise_XOR(t3, t4): t6 = Bitwise_XOR(a, b)
    t7 = Bitwise_OR(a, t4): t8 = Bitwise_AND(c, t6): t9 = Bitwise_OR(t2, t8)
    e = Bitwise_XOR(t7, t9): t11 = Bitwise_XOR(a, h): t12 = Bitwise_AND(t1, t6)
    t13 = Bitwise_XOR(e, t11): f = Bitwise_XOR(t12, t13): t15 = Bitwise_OR(e, f)
    t16 = Bitwise_AND(t3, t15): g = Bitwise_XOR(b, t16)
End Sub
Private Sub sb1(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_XOR(a, d): t2 = Bitwise_XOR(b, d): t3 = Bitwise_AND(a, b)
    t4 = Bitwise_NOT(c): t5 = Bitwise_XOR(t2, t3): g = Bitwise_XOR(t4, t5)
    t7 = Bitwise_XOR(a, t2): t8 = Bitwise_OR(b, t4): t9 = Bitwise_OR(d, g)
    t10 = Bitwise_AND(t7, t9): f = Bitwise_XOR(t8, t10): t12 = Bitwise_XOR(c, d)
    t13 = Bitwise_OR(t1, t2): t14 = Bitwise_XOR(f, t12): h = Bitwise_XOR(t13, t14)
    t16 = Bitwise_OR(t1, g): t17 = Bitwise_XOR(t8, t14): e = Bitwise_XOR(t16, t17)
End Sub
Private Sub sb2(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_NOT(a): t2 = Bitwise_XOR(b, d): t3 = Bitwise_AND(c, t1)
    e = Bitwise_XOR(t2, t3): t5 = Bitwise_XOR(c, t1): t6 = Bitwise_XOR(c, e)
    t7 = Bitwise_AND(b, t6): h = Bitwise_XOR(t5, t7): t9 = Bitwise_OR(d, t7)
    t10 = Bitwise_OR(e, t5): t11 = Bitwise_AND(t9, t10): g = Bitwise_XOR(a, t11)
    t13 = Bitwise_OR(d, t1): t14 = Bitwise_XOR(t2, h): t15 = Bitwise_XOR(g, t13)
    f = Bitwise_XOR(t14, t15)
End Sub
Private Sub sb3(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_XOR(a, c): t2 = Bitwise_OR(a, d): t3 = Bitwise_AND(a, b)
    t4 = Bitwise_AND(a, d): t5 = Bitwise_OR(b, t4): t6 = Bitwise_AND(t1, t2)
    f = Bitwise_XOR(t5, t6): t8 = Bitwise_XOR(b, d): t9 = Bitwise_OR(c, t3)
    t10 = Bitwise_XOR(t6, t8): h = Bitwise_XOR(t9, t10): t12 = Bitwise_XOR(c, t3)
    t13 = Bitwise_AND(t2, h): g = Bitwise_XOR(t12, t13): t15 = Bitwise_NOT(g)
    t16 = Bitwise_XOR(t2, t3): t17 = Bitwise_AND(f, t15): e = Bitwise_XOR(t16, t17)
End Sub
Private Sub sb4(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_NOT(a): t2 = Bitwise_XOR(a, d): t3 = Bitwise_XOR(a, b)
    t4 = Bitwise_XOR(c, t1): t5 = Bitwise_OR(t2, t3): e = Bitwise_XOR(t4, t5)
    t7 = Bitwise_NOT(e): t8 = Bitwise_OR(b, t7): h = Bitwise_XOR(t2, t8)
    t10 = Bitwise_AND(a, e): t11 = Bitwise_XOR(b, h): t12 = Bitwise_AND(t8, t11)
    g = Bitwise_XOR(t10, t12): t14 = Bitwise_OR(a, t7): t15 = Bitwise_XOR(t3, t14)
    t16 = Bitwise_AND(h, g): f = Bitwise_XOR(t15, t16)
End Sub
Private Sub sb5(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_NOT(a): t2 = Bitwise_XOR(a, b): t3 = Bitwise_XOR(a, d)
    t4 = Bitwise_XOR(c, t1): t5 = Bitwise_OR(t2, t3): e = Bitwise_XOR(t4, t5)
    t7 = Bitwise_NOT(d): t8 = Bitwise_AND(e, t7): f = Bitwise_XOR(t2, t8)
    t10 = Bitwise_OR(b, f): t11 = Bitwise_OR(c, e): t12 = Bitwise_XOR(t7, t10)
    h = Bitwise_XOR(t11, t12): t14 = Bitwise_OR(d, f): t15 = Bitwise_XOR(t1, t14)
    t16 = Bitwise_OR(e, h): g = Bitwise_XOR(t15, t16)
End Sub
Private Sub sb7(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_NOT(c): t2 = Bitwise_XOR(b, c): t3 = Bitwise_OR(b, t1)
    t4 = Bitwise_XOR(d, t3): t5 = Bitwise_AND(a, t4): h = Bitwise_XOR(t2, t5)
    t7 = Bitwise_XOR(a, d): t8 = Bitwise_XOR(b, t5): t9 = Bitwise_OR(t2, t8)
    f = Bitwise_XOR(t7, t9): t11 = Bitwise_AND(d, t3): t12 = Bitwise_XOR(t5, f)
    t13 = Bitwise_AND(h, t12): g = Bitwise_XOR(t11, t13): t15 = Bitwise_OR(t1, t4)
    t16 = Bitwise_XOR(t12, g): e = Bitwise_XOR(t15, t16)
End Sub
Private Sub ib6(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_NOT(c): t2 = Bitwise_XOR(a, c): t3 = Bitwise_XOR(b, d)
    t4 = Bitwise_OR(a, t1): f = Bitwise_XOR(t3, t4): t6 = Bitwise_OR(a, b)
    t7 = Bitwise_AND(b, t2): t8 = Bitwise_XOR(f, t6): t9 = Bitwise_OR(t7, t8)
    e = Bitwise_XOR(c, t9): t11 = Bitwise_NOT(f): t12 = Bitwise_OR(d, t2)
    t13 = Bitwise_XOR(t9, t11): h = Bitwise_XOR(t12, t13): t15 = Bitwise_XOR(b, t11)
    t16 = Bitwise_AND(e, h): g = Bitwise_XOR(t15, t16)
End Sub
Private Sub sb6(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_XOR(a, c): t2 = Bitwise_OR(b, d): t3 = Bitwise_XOR(b, c)
    t4 = Bitwise_NOT(t3): t5 = Bitwise_AND(a, d): f = Bitwise_XOR(t4, t5)
    t7 = Bitwise_OR(b, c): t8 = Bitwise_XOR(d, t1): t9 = Bitwise_AND(t7, t8)
    h = Bitwise_XOR(t2, t9): t11 = Bitwise_AND(t1, t7): t12 = Bitwise_XOR(t4, t8)
    t13 = Bitwise_AND(h, t11): e = Bitwise_XOR(t12, t13): t15 = Bitwise_XOR(t3, t11)
    t16 = Bitwise_OR(h, t15): g = Bitwise_XOR(t12, t16)
End Sub
Private Sub ib7(a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock)
    Dim t1 As MemBlock, t2 As MemBlock, t3 As MemBlock, t4 As MemBlock, t5 As MemBlock
    Dim t6 As MemBlock, t7 As MemBlock, t8 As MemBlock, t9 As MemBlock, t10 As MemBlock
    Dim t11 As MemBlock, t12 As MemBlock, t13 As MemBlock, t14 As MemBlock, t15 As MemBlock
    Dim t16 As MemBlock, t17 As MemBlock, t18 As MemBlock
    t1 = Bitwise_AND(a, b): t2 = Bitwise_OR(a, b): t3 = Bitwise_OR(c, t1)
    t4 = Bitwise_AND(d, t2): h = Bitwise_XOR(t3, t4): t6 = Bitwise_NOT(d)
    t7 = Bitwise_XOR(b, t4): t8 = Bitwise_XOR(h, t6): t9 = Bitwise_OR(t7, t8)
    f = Bitwise_XOR(a, t9): t11 = Bitwise_XOR(c, t7): t12 = Bitwise_OR(d, f)
    e = Bitwise_XOR(t11, t12): t14 = Bitwise_AND(a, h): t15 = Bitwise_XOR(t3, f)
    t16 = Bitwise_XOR(e, t14): g = Bitwise_XOR(t15, t16)
End Sub
Private Sub k_xor(R As Integer, a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock)
   a = Bitwise_XOR(a, l_key(4 * R + 8))
   b = Bitwise_XOR(b, l_key(4 * R + 9))
   c = Bitwise_XOR(c, l_key(4 * R + 10))
   d = Bitwise_XOR(d, l_key(4 * R + 11))
End Sub
Private Function set_key(in_key() As MemBlock, key_len As Integer) As MemBlock()
    Dim i As Integer, lk As Integer, a As MemBlock, b As MemBlock, c As MemBlock, d As MemBlock, e As MemBlock, f As MemBlock, g As MemBlock, h As MemBlock, RetVal(0 To 0) As MemBlock
    Dim lk1 As MemBlock, One As MemBlock, Temp1 As MemBlock, Temp2 As MemBlock

    If key_len < 0 Or key_len > 256 Then
        SetInt RetVal(0), 0
        set_key = RetVal
        Exit Function
    End If

    i = 0
    lk = (key_len + 31) \ 32
      
    While i < lk
        #If BLOCK_REVERSE Then
            l_key(i) = bswap(in_key(lk - i - 1))
        #Else
            l_key(i) = in_key(i)
        #End If
        i = i + 1
    Wend
    If key_len < 256 Then
        While i < 8
            SetInt l_key(i), 0
            i = i + 1
        Wend
        i = key_len \ 32
        SetInt One, 1
        lk1 = Bitwise_LShift(One, key_len Mod 32)
        l_key(i) = Bitwise_OR(Bitwise_AND(l_key(i), Substr(lk1, One)), lk1)
    End If
    For i = 0 To 131
        lk1 = Bitwise_XOR(l_key(i), l_key(i + 3))
        lk1 = Bitwise_XOR(lk1, l_key(i + 5))
        lk1 = Bitwise_XOR(lk1, l_key(i + 7))
        SetData Temp1, 158, 55, 121, 185
        SetInt Temp2, CByte(i)
        lk1 = Bitwise_XOR(lk1, Temp1)
        lk1 = Bitwise_XOR(lk1, Temp2)
        l_key(i + 8) = Bitwise_OR(Bitwise_LShift(lk1, 11), Bitwise_RShift(lk1, 21))
    Next
    
    k_set 0, a, b, c, d: sb3 a, b, c, d, e, f, g, h: k_get 0, e, f, g, h
    k_set 1, a, b, c, d: sb2 a, b, c, d, e, f, g, h: k_get 1, e, f, g, h
    k_set 2, a, b, c, d: sb1 a, b, c, d, e, f, g, h: k_get 2, e, f, g, h
    k_set 3, a, b, c, d: sb0 a, b, c, d, e, f, g, h: k_get 3, e, f, g, h
    k_set 4, a, b, c, d: sb7 a, b, c, d, e, f, g, h: k_get 4, e, f, g, h
    k_set 5, a, b, c, d: sb6 a, b, c, d, e, f, g, h: k_get 5, e, f, g, h
    k_set 6, a, b, c, d: sb5 a, b, c, d, e, f, g, h: k_get 6, e, f, g, h
    k_set 7, a, b, c, d: sb4 a, b, c, d, e, f, g, h: k_get 7, e, f, g, h
    k_set 8, a, b, c, d: sb3 a, b, c, d, e, f, g, h: k_get 8, e, f, g, h
    k_set 9, a, b, c, d: sb2 a, b, c, d, e, f, g, h: k_get 9, e, f, g, h
    k_set 10, a, b, c, d: sb1 a, b, c, d, e, f, g, h: k_get 10, e, f, g, h
    k_set 11, a, b, c, d: sb0 a, b, c, d, e, f, g, h: k_get 11, e, f, g, h
    k_set 12, a, b, c, d: sb7 a, b, c, d, e, f, g, h: k_get 12, e, f, g, h
    k_set 13, a, b, c, d: sb6 a, b, c, d, e, f, g, h: k_get 13, e, f, g, h
    k_set 14, a, b, c, d: sb5 a, b, c, d, e, f, g, h: k_get 14, e, f, g, h
    k_set 15, a, b, c, d: sb4 a, b, c, d, e, f, g, h: k_get 15, e, f, g, h
    k_set 16, a, b, c, d: sb3 a, b, c, d, e, f, g, h: k_get 16, e, f, g, h
    k_set 17, a, b, c, d: sb2 a, b, c, d, e, f, g, h: k_get 17, e, f, g, h
    k_set 18, a, b, c, d: sb1 a, b, c, d, e, f, g, h: k_get 18, e, f, g, h
    k_set 19, a, b, c, d: sb0 a, b, c, d, e, f, g, h: k_get 19, e, f, g, h
    k_set 20, a, b, c, d: sb7 a, b, c, d, e, f, g, h: k_get 20, e, f, g, h
    k_set 21, a, b, c, d: sb6 a, b, c, d, e, f, g, h: k_get 21, e, f, g, h
    k_set 22, a, b, c, d: sb5 a, b, c, d, e, f, g, h: k_get 22, e, f, g, h
    k_set 23, a, b, c, d: sb4 a, b, c, d, e, f, g, h: k_get 23, e, f, g, h
    k_set 24, a, b, c, d: sb3 a, b, c, d, e, f, g, h: k_get 24, e, f, g, h
    k_set 25, a, b, c, d: sb2 a, b, c, d, e, f, g, h: k_get 25, e, f, g, h
    k_set 26, a, b, c, d: sb1 a, b, c, d, e, f, g, h: k_get 26, e, f, g, h
    k_set 27, a, b, c, d: sb0 a, b, c, d, e, f, g, h: k_get 27, e, f, g, h
    k_set 28, a, b, c, d: sb7 a, b, c, d, e, f, g, h: k_get 28, e, f, g, h
    k_set 29, a, b, c, d: sb6 a, b, c, d, e, f, g, h: k_get 29, e, f, g, h
    k_set 30, a, b, c, d: sb5 a, b, c, d, e, f, g, h: k_get 30, e, f, g, h
    k_set 31, a, b, c, d: sb4 a, b, c, d, e, f, g, h: k_get 31, e, f, g, h
    k_set 32, a, b, c, d: sb3 a, b, c, d, e, f, g, h: k_get 32, e, f, g, h
    set_key = l_key
End Function
Private Sub SetKey(Key As String)
    Dim kblk(0 To 7) As MemBlock, KeyBuffer() As Byte
    ReDim KeyBuffer(0 To 31) As Byte
    SetBuffer KeyBuffer, Key, 32
    SetBlock kblk, KeyBuffer, 0, 32
    set_key kblk, 32 * 8
End Sub

