VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsGost"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Visual Basic GOST Implementation
' By: David Midkiff (mznull@earthlink.net)
'
' Standard Gost implementation with file support, Base64 conversion,
' and overall optimisations for Visual Basic. Gost supports 256-bit keys
' and is a stable algorithm developed by the former Soviet Union but there
' are many notable weaknesses and it remains in question if it really is
' much stronger than DES. Recommended for medium risk level solutions.
'
' Information on the algorithm can be found at:
' http://www.jetico.sci.fi/index.htm#/gost.htm

Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Sub addLongs Lib "myDLL" (ByRef number1 As Long, ByVal number2 As Long)

Event Progress(Percent As Long)

Private m_KeyValue As String
Private K(1 To 8) As Long
Private k87(0 To 255) As Byte
Private k65(0 To 255) As Byte
Private k43(0 To 255) As Byte
Private k21(0 To 255) As Byte
Private sBox(0 To 7, 0 To 255) As Byte
Private m_RunningCompiled As Boolean

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

Private Function FileExist(Filename As String) As Boolean
    On Error GoTo ErrorHandler
    Call FileLen(Filename)
    FileExist = True
    Exit Function
    
ErrorHandler:
    FileExist = False
End Function
Private Static Function UnsignedAdd(ByVal Data1 As Long, Data2 As Long) As Long
    Dim x1(0 To 3) As Byte, x2(0 To 3) As Byte, xx(0 To 3) As Byte, Rest As Long, Value As Long, a As Long
    Call CopyMem(x1(0), Data1, 4)
    Call CopyMem(x2(0), Data2, 4)
    Rest = 0
    For a = 0 To 3
        Value = CLng(x1(a)) + CLng(x2(a)) + Rest
        xx(a) = Value And 255
        Rest = Value \ 256
    Next
    Call CopyMem(UnsignedAdd, xx(0), 4)
End Function
Private Function UnsignedDel(Data1 As Long, Data2 As Long) As Long
    Dim x1(0 To 3) As Byte, x2(0 To 3) As Byte, xx(0 To 3) As Byte, Rest As Long, Value As Long, a As Long
    Call CopyMem(x1(0), Data1, 4)
    Call CopyMem(x2(0), Data2, 4)
    Call CopyMem(xx(0), UnsignedDel, 4)
    For a = 0 To 3
        Value = CLng(x1(a)) - CLng(x2(a)) - Rest
        If (Value < 0) Then
            Value = Value + 256
            Rest = 1
        Else
            Rest = 0
        End If
        xx(a) = Value
    Next
    Call CopyMem(UnsignedDel, xx(0), 4)
End Function

Private Static Sub PutWord(LongValue As Long, CryptBuffer() As Byte, Offset As Long)
    Dim bb(0 To 3) As Byte
    Call CopyMem(bb(0), LongValue, 4)
    CryptBuffer(Offset) = bb(3)
    CryptBuffer(Offset + 1) = bb(2)
    CryptBuffer(Offset + 2) = bb(1)
    CryptBuffer(Offset + 3) = bb(0)
End Sub
Private Static Sub GetWord(LongValue As Long, CryptBuffer() As Byte, Offset As Long)
    Dim bb(0 To 3) As Byte
    bb(3) = CryptBuffer(Offset)
    bb(2) = CryptBuffer(Offset + 1)
    bb(1) = CryptBuffer(Offset + 2)
    bb(0) = CryptBuffer(Offset + 3)
    Call CopyMem(LongValue, bb(0), 4)
End Sub
Private Static Sub DecryptBlock(LeftWord As Long, RightWord As Long)
    Dim i As Long
    RightWord = RightWord Xor f(LeftWord, K(1))
    LeftWord = LeftWord Xor f(RightWord, K(2))
    RightWord = RightWord Xor f(LeftWord, K(3))
    LeftWord = LeftWord Xor f(RightWord, K(4))
    RightWord = RightWord Xor f(LeftWord, K(5))
    LeftWord = LeftWord Xor f(RightWord, K(6))
    RightWord = RightWord Xor f(LeftWord, K(7))
    LeftWord = LeftWord Xor f(RightWord, K(8))
    For i = 1 To 3
        RightWord = RightWord Xor f(LeftWord, K(8))
        LeftWord = LeftWord Xor f(RightWord, K(7))
        RightWord = RightWord Xor f(LeftWord, K(6))
        LeftWord = LeftWord Xor f(RightWord, K(5))
        RightWord = RightWord Xor f(LeftWord, K(4))
        LeftWord = LeftWord Xor f(RightWord, K(3))
        RightWord = RightWord Xor f(LeftWord, K(2))
        LeftWord = LeftWord Xor f(RightWord, K(1))
    Next
End Sub
Private Static Sub EncryptBlock(LeftWord As Long, RightWord As Long)
    Dim i As Long
    For i = 1 To 3
        RightWord = RightWord Xor f(LeftWord, K(1))
        LeftWord = LeftWord Xor f(RightWord, K(2))
        RightWord = RightWord Xor f(LeftWord, K(3))
        LeftWord = LeftWord Xor f(RightWord, K(4))
        RightWord = RightWord Xor f(LeftWord, K(5))
        LeftWord = LeftWord Xor f(RightWord, K(6))
        RightWord = RightWord Xor f(LeftWord, K(7))
        LeftWord = LeftWord Xor f(RightWord, K(8))
    Next
    RightWord = RightWord Xor f(LeftWord, K(8))
    LeftWord = LeftWord Xor f(RightWord, K(7))
    RightWord = RightWord Xor f(LeftWord, K(6))
    LeftWord = LeftWord Xor f(RightWord, K(5))
    RightWord = RightWord Xor f(LeftWord, K(4))
    LeftWord = LeftWord Xor f(RightWord, K(3))
    RightWord = RightWord Xor f(LeftWord, K(2))
    LeftWord = LeftWord Xor f(RightWord, K(1))
End Sub
Public Function EncryptFile(InFile As String, OutFile As String, Overwrite As Boolean, Optional Key As String, Optional OutputIn64 As Boolean) As Boolean
    On Error GoTo ErrorHandler
    If FileExist(InFile) = False Then
        EncryptFile = False
        Exit Function
    End If
    If FileExist(OutFile) = True And Overwrite = False Then
        EncryptFile = False
        Exit Function
    End If
    Dim FileO As Integer, Buffer() As Byte
    FileO = FreeFile
    Open InFile For Binary As #FileO
        ReDim Buffer(0 To LOF(FileO) - 1)
        Get #FileO, , Buffer()
    Close #FileO
    Call EncryptByte(Buffer(), Key)
    If FileExist(OutFile) = True Then Kill OutFile
    FileO = FreeFile
    Open OutFile For Binary As #FileO
        If OutputIn64 = True Then
            Put #FileO, , EncodeArray64(Buffer())
        Else
            Put #FileO, , Buffer()
        End If
    Close #FileO
    EncryptFile = True
    Exit Function

ErrorHandler:
    EncryptFile = False
End Function
Public Function DecryptFile(InFile As String, OutFile As String, Overwrite As Boolean, Optional Key As String, Optional IsFileIn64 As Boolean) As Boolean
    On Error GoTo ErrorHandler
    If FileExist(InFile) = False Then
        DecryptFile = False
        Exit Function
    End If
    If FileExist(OutFile) = True And Overwrite = False Then
        DecryptFile = False
        Exit Function
    End If
    Dim FileO As Integer, Buffer() As Byte
    FileO = FreeFile
    Open InFile For Binary As #FileO
        ReDim Buffer(0 To LOF(FileO) - 1)
        Get #FileO, , Buffer()
    Close #FileO
    If IsFileIn64 = True Then Buffer() = DecodeArray64(StrConv(Buffer(), vbUnicode))
    Call DecryptByte(Buffer(), Key)
    If FileExist(OutFile) = True Then Kill OutFile
    FileO = FreeFile
    Open OutFile For Binary As #FileO
        Put #FileO, , Buffer()
    Close #FileO
    DecryptFile = True
    Exit Function

ErrorHandler:
    DecryptFile = False
End Function
Private Static Function f(R As Long, K As Long) As Long
    Dim x As Long, xb(0 To 3) As Byte, xx(0 To 3) As Byte, a As Byte, b As Byte, c As Byte, d As Byte
    If (m_RunningCompiled) Then x = R + K Else x = UnsignedAdd(R, K)
    d = x And &HFF
    x = x \ 256
    c = x And &HFF
    x = x \ 256
    b = x And &HFF
    x = x \ 256
    a = x And &HFF
    xb(0) = k21(a)
    xb(1) = k43(b)
    xb(2) = k65(c)
    xb(3) = k87(d)
    xx(0) = ((xb(3) And 31) * 8) Or ((xb(2) And 224) \ 32)
    xx(1) = ((xb(0) And 31) * 8) Or ((xb(3) And 224) \ 32)
    xx(2) = ((xb(1) And 31) * 8) Or ((xb(0) And 224) \ 32)
    xx(3) = ((xb(2) And 31) * 8) Or ((xb(1) And 224) \ 32)
    Call CopyMem(f, xx(0), 4)
End Function
Public Function DecryptString(Text As String, Optional Key As String, Optional IsTextIn64 As Boolean) As String
    Dim byteArray() As Byte
    If IsTextIn64 = True Then Text = Decode64(Text)
    byteArray() = StrConv(Text, vbFromUnicode)
    Call DecryptByte(byteArray(), Key)
    DecryptString = StrConv(byteArray(), vbUnicode)
End Function
Public Function EncryptString(Text As String, Optional Key As String, Optional OutputIn64 As Boolean) As String
    Dim byteArray() As Byte
    byteArray() = StrConv(Text, vbFromUnicode)
    Call EncryptByte(byteArray(), Key)
    EncryptString = StrConv(byteArray(), vbUnicode)
    If OutputIn64 = True Then EncryptString = Encode64(EncryptString)
End Function
Private Static Function lBSL(ByVal lInput As Long, bShiftBits As Byte) As Long
    lBSL = (lInput And (2 ^ (31 - bShiftBits) - 1)) * 2 ^ bShiftBits
    If (lInput And 2 ^ (31 - bShiftBits)) = 2 ^ (31 - bShiftBits) Then lBSL = (lBSL Or &H80000000)
End Function
Private Static Function lBSR(ByVal lInput As Long, bShiftBits As Byte) As Long
    If bShiftBits = 31 Then
      If lInput < 0 Then lBSR = &HFFFFFFFF Else lBSR = 0
    Else
      lBSR = (lInput And Not (2 ^ bShiftBits - 1)) \ 2 ^ bShiftBits
    End If
End Function
Public Sub EncryptByte(byteArray() As Byte, Optional Key As String)
    Dim Offset As Long, OrigLen As Long, LeftWord As Long, RightWord As Long, CipherLen As Long, CipherLeft As Long, CipherRight As Long, CurrPercent As Long, NextPercent As Long
    
    If (Len(Key) > 0) Then Me.Key = Key
    OrigLen = UBound(byteArray) + 1
    CipherLen = OrigLen + 12
    If (CipherLen Mod 8 <> 0) Then CipherLen = CipherLen + 8 - (CipherLen Mod 8)
    ReDim Preserve byteArray(CipherLen - 1)
    Call CopyMem(byteArray(12), byteArray(0), OrigLen)
    Call CopyMem(byteArray(8), OrigLen, 4)
    Call Randomize
    Call CopyMem(byteArray(0), CLng(2147483647 * Rnd), 4)
    Call CopyMem(byteArray(4), CLng(2147483647 * Rnd), 4)
    For Offset = 0 To (CipherLen - 1) Step 8
        Call GetWord(LeftWord, byteArray(), Offset)
        Call GetWord(RightWord, byteArray(), Offset + 4)
        LeftWord = LeftWord Xor CipherLeft
        RightWord = RightWord Xor CipherRight
        Call EncryptBlock(LeftWord, RightWord)
        Call PutWord(LeftWord, byteArray(), Offset)
        Call PutWord(RightWord, byteArray(), Offset + 4)
        CipherLeft = LeftWord
        CipherRight = RightWord
        If (Offset >= NextPercent) Then
            CurrPercent = Int((Offset / CipherLen) * 100)
            NextPercent = (CipherLen * ((CurrPercent + 1) / 100)) + 1
            RaiseEvent Progress(CurrPercent)
        End If
    Next
    If (CurrPercent <> 100) Then RaiseEvent Progress(100)
End Sub
Public Sub DecryptByte(byteArray() As Byte, Optional Key As String)
    On Error GoTo ErrorHandler
    Dim Offset As Long, OrigLen As Long, LeftWord As Long, RightWord As Long, CipherLen As Long, CipherLeft As Long, CipherRight As Long, CurrPercent As Long, NextPercent As Long
    
    If (Len(Key) > 0) Then Me.Key = Key
    CipherLen = UBound(byteArray) + 1
    For Offset = 0 To (CipherLen - 1) Step 8
        Call GetWord(LeftWord, byteArray(), Offset)
        Call GetWord(RightWord, byteArray(), Offset + 4)
        Call DecryptBlock(RightWord, LeftWord)
        LeftWord = LeftWord Xor CipherLeft
        RightWord = RightWord Xor CipherRight
        Call GetWord(CipherLeft, byteArray(), Offset)
        Call GetWord(CipherRight, byteArray(), Offset + 4)
        Call PutWord(LeftWord, byteArray(), Offset)
        Call PutWord(RightWord, byteArray(), Offset + 4)
        If (Offset >= NextPercent) Then
            CurrPercent = Int((Offset / CipherLen) * 100)
            NextPercent = (CipherLen * ((CurrPercent + 1) / 100)) + 1
            RaiseEvent Progress(CurrPercent)
        End If
    Next
    Call CopyMem(OrigLen, byteArray(8), 4)
    If (CipherLen - OrigLen > 19) Or (CipherLen - OrigLen < 12) Then Call err.Raise(vbObjectError, , "Incorrect size descriptor in Gost decryption")
    Call CopyMem(byteArray(0), byteArray(12), OrigLen)
    ReDim Preserve byteArray(OrigLen - 1)
    If (CurrPercent <> 100) Then RaiseEvent Progress(100)

ErrorHandler:
End Sub
Public Property Let Key(New_Value As String)
    Class_Initialize
    Dim a As Long, Key() As Byte, KeyLen As Long, byteArray() As Byte
    If (m_KeyValue = New_Value) Then Exit Property
    KeyLen = Len(New_Value)
    Key() = StrConv(New_Value, vbFromUnicode)
    ReDim byteArray(0 To 31)
    For a = 0 To 31
        byteArray(a) = Key(a Mod KeyLen)
    Next
    Call CopyMem(K(1), byteArray(0), 32)
    m_KeyValue = New_Value
End Property
Private Sub Class_Initialize()
    Dim a As Long, b As Long, c As Long, LeftWord As Long, S(0 To 7) As Variant
      
    On Local Error Resume Next
    m_RunningCompiled = ((2147483647 + 1) < 0)
      
    S(0) = Array(6, 5, 1, 7, 14, 0, 4, 10, 11, 9, 3, 13, 8, 12, 2, 15)
    S(1) = Array(14, 13, 9, 0, 8, 10, 12, 4, 7, 15, 6, 11, 3, 1, 5, 2)
    S(2) = Array(6, 5, 1, 7, 2, 4, 10, 0, 11, 13, 14, 3, 8, 12, 15, 9)
    S(3) = Array(8, 7, 3, 9, 6, 4, 14, 5, 2, 13, 0, 12, 1, 11, 10, 15)
    S(4) = Array(10, 9, 6, 11, 5, 1, 8, 4, 0, 13, 7, 2, 14, 3, 15, 12)
    S(5) = Array(5, 3, 0, 6, 11, 13, 4, 14, 10, 7, 1, 12, 2, 8, 15, 9)
    S(6) = Array(2, 1, 12, 3, 11, 13, 15, 7, 10, 6, 9, 14, 0, 8, 4, 5)
    S(7) = Array(6, 5, 1, 7, 8, 9, 4, 2, 15, 3, 13, 12, 10, 14, 11, 0)
    
    For a = 0 To 15
        For b = 0 To 7
            sBox(b, a) = S(b)(a)
        Next
    Next
    For a = 0 To 255
        k87(a) = lBSL(CLng(sBox(7, lBSR(a, 4))), 4) Or sBox(6, a And 15)
        k65(a) = lBSL(CLng(sBox(5, lBSR(a, 4))), 4) Or sBox(4, a And 15)
        k43(a) = lBSL(CLng(sBox(3, lBSR(a, 4))), 4) Or sBox(2, a And 15)
        k21(a) = lBSL(CLng(sBox(1, lBSR(a, 4))), 4) Or sBox(0, a And 15)
    Next
End Sub


