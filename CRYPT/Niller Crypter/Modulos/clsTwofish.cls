VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsTwofish"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Twofish Encryption/Decryption Class
'------------------------------------
'
'Information concerning the Twofish
'algorithm can be found at:
'http://www.counterpane.com/twofish.html
'
'(c) 2000, Fredrik Qvarfort
'

Option Explicit

'For progress notifications
Event Progress(Percent As Long)

Public Enum TWOFISHKEYLENGTH
  TWOFISH_256 = 256
  TWOFISH_196 = 196
  TWOFISH_128 = 128
  TWOFISH_64 = 64
End Enum

Private Const ROUNDS = 16
Private Const BLOCK_SIZE = 16
Private Const MAX_ROUNDS = 16
   
Private Const INPUT_WHITEN = 0
Private Const OUTPUT_WHITEN = INPUT_WHITEN + BLOCK_SIZE / 4
Private Const ROUND_SUBKEYS = OUTPUT_WHITEN + BLOCK_SIZE / 4

Private Const GF256_FDBK_2 = &H169 / 2
Private Const GF256_FDBK_4 = &H169 / 4

Private MDS(0 To 3, 0 To 255) As Long
Private P(0 To 1, 0 To 255) As Byte

Private m_RunningCompiled As Boolean

'Key-dependant data
Private sBox(0 To 1023) As Long
Private sKey() As Long

Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Public Sub EncryptFile(SourceFile As String, DestFile As String, Optional Key As String)

  Dim Filenr As Integer
  Dim ByteArray() As Byte
  
  'Make sure the source file do exist
  If (Not FileExist(SourceFile)) Then
    Call Err.Raise(vbObjectError, , "Error in Skipjack EncryptFile procedure (Source file does not exist).")
    Exit Sub
  End If
  
  'Open the source file and read the content
  'into a bytearray to pass onto encryption
  Filenr = FreeFile
  Open SourceFile For Binary As #Filenr
  ReDim ByteArray(0 To LOF(Filenr) - 1)
  Get #Filenr, , ByteArray()
  Close #Filenr
  
  'Encrypt the bytearray
  Call EncryptByte(ByteArray(), Key)

  'If the destination file already exist we need
  'to delete it since opening it for binary use
  'will preserve it if it already exist
  If (FileExist(DestFile)) Then Kill DestFile
  
  'Store the encrypted data in the destination file
  Filenr = FreeFile
  Open DestFile For Binary As #Filenr
  Put #Filenr, , ByteArray()
  Close #Filenr

End Sub

Public Sub DecryptFile(SourceFile As String, DestFile As String, Optional Key As String)

  Dim Filenr As Integer
  Dim ByteArray() As Byte
  
  'Make sure the source file do exist
  If (Not FileExist(SourceFile)) Then
    Call Err.Raise(vbObjectError, , "Error in Skipjack EncryptFile procedure (Source file does not exist).")
    Exit Sub
  End If
  
  'Open the source file and read the content
  'into a bytearray to decrypt
  Filenr = FreeFile
  Open SourceFile For Binary As #Filenr
  ReDim ByteArray(0 To LOF(Filenr) - 1)
  Get #Filenr, , ByteArray()
  Close #Filenr
  
  'Decrypt the bytearray
  Call DecryptByte(ByteArray(), Key)

  'If the destination file already exist we need
  'to delete it since opening it for binary use
  'will preserve it if it already exist
  If (FileExist(DestFile)) Then Kill DestFile

  'Store the decrypted data in the destination file
  Filenr = FreeFile
  Open DestFile For Binary As #Filenr
  Put #Filenr, , ByteArray()
  Close #Filenr

End Sub

Public Function EncryptString(Text As String, Optional Key As String) As String

  Dim ByteArray() As Byte
  
  'Convert the string to a bytearray
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  'Encrypt the array
  Call EncryptByte(ByteArray(), Key)
  
  'Return the encrypted data as a string
  EncryptString = StrConv(ByteArray(), vbUnicode)

End Function
Public Function DecryptString(Text As String, Optional Key As String) As String

  Dim ByteArray() As Byte
  
  'Convert the string to a bytearray
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  'Encrypt the array
  Call DecryptByte(ByteArray(), Key)
  
  'Return the encrypted data as a string
  DecryptString = StrConv(ByteArray(), vbUnicode)

End Function

Private Static Function LFSR1(ByRef x As Long) As Long
   
  LFSR1 = lBSR(x, 1) Xor ((x And 1) * GF256_FDBK_2)

End Function
Private Static Function LFSR2(ByRef x As Long) As Long
    
  LFSR2 = lBSR(x, 2) Xor ((x And &H2) / &H2 * GF256_FDBK_2) Xor ((x And &H1) * GF256_FDBK_4)

End Function
Private Static Function RS_Rem(x As Long) As Long
  
  Dim b As Long
  Dim g2 As Long
  Dim g3 As Long
  
  b = (lBSRU(x, 24) And &HFF)
  g2 = ((lBSL(b, 1) Xor (b And &H80) / &H80 * &H14D) And &HFF)
  g3 = (lBSRU(b, 1) Xor ((b And &H1) * lBSRU(&H14D, 1)) Xor g2)
  RS_Rem = lBSL(x, 8) Xor lBSL(g3, 24) Xor lBSL(g2, 16) Xor lBSL(g3, 8) Xor b

End Function


Private Static Function F32(k64Cnt As Long, x As Long, k32() As Long) As Long
  
  Dim xb(0 To 3) As Byte
  Dim Key(0 To 3, 0 To 3) As Byte
  
  Call CopyMem(xb(0), x, 4)
  Call CopyMem(Key(0, 0), k32(0), 16)
  
  If ((k64Cnt And 3) = 1) Then
    F32 = MDS(0, P(0, xb(0)) Xor Key(0, 0)) Xor _
          MDS(1, P(0, xb(1)) Xor Key(1, 0)) Xor _
          MDS(2, P(1, xb(2)) Xor Key(2, 0)) Xor _
          MDS(3, P(1, xb(3)) Xor Key(3, 0))
  Else
    If ((k64Cnt And 3) = 0) Then
      xb(0) = P(1, xb(0)) Xor Key(0, 3)
      xb(1) = P(0, xb(1)) Xor Key(1, 3)
      xb(2) = P(0, xb(2)) Xor Key(2, 3)
      xb(3) = P(1, xb(3)) Xor Key(3, 3)
    End If
    If ((k64Cnt And 3) = 3) Or ((k64Cnt And 3) = 0) Then
      xb(0) = P(1, xb(0)) Xor Key(0, 2)
      xb(1) = P(1, xb(1)) Xor Key(1, 2)
      xb(2) = P(0, xb(2)) Xor Key(2, 2)
      xb(3) = P(0, xb(3)) Xor Key(3, 2)
    End If
    F32 = MDS(0, P(0, P(0, xb(0)) Xor Key(0, 1)) Xor Key(0, 0)) Xor _
          MDS(1, P(0, P(1, xb(1)) Xor Key(1, 1)) Xor Key(1, 0)) Xor _
          MDS(2, P(1, P(0, xb(2)) Xor Key(2, 1)) Xor Key(2, 0)) Xor _
          MDS(3, P(1, P(1, xb(3)) Xor Key(3, 1)) Xor Key(3, 0))
  End If
  
End Function
Private Static Function Fe32(x As Long, R As Long) As Long
  
  Dim xb(0 To 3) As Byte
  
  'Extract the byte sequence
  Call CopyMem(xb(0), x, 4)
  
  'Calculate the FE32 function
  Fe32 = sBox(2 * xb(R Mod 4)) Xor _
         sBox(2 * xb((R + 1) Mod 4) + 1) Xor _
         sBox(&H200 + 2 * xb((R + 2) Mod 4)) Xor _
         sBox(&H200 + 2 * xb((R + 3) Mod 4) + 1)

End Function
Private Static Sub KeyCreate(K() As Byte, KeyLength As Long)
  
  Dim i As Long
  Dim lA As Long
  Dim lB As Long
  Dim b(3) As Byte
  Dim k64Cnt As Long
  Dim k32e(3) As Long
  Dim k32o(3) As Long
  Dim subkeyCnt As Long
  Dim sBoxKey(3) As Long
  Dim Key(0 To 3, 0 To 3) As Byte
  
  Const SK_STEP = &H2020202
  Const SK_BUMP = &H1010101
  Const SK_ROTL = 9
  
  k64Cnt = KeyLength \ 8
  subkeyCnt = ROUND_SUBKEYS + 2 * ROUNDS
  
  For i = 0 To IIf(KeyLength < 32, KeyLength \ 8 - 1, 3)
    Call CopyMem(k32e(i), K(i * 8), 4)
    Call CopyMem(k32o(i), K(i * 8 + 4), 4)
    sBoxKey(KeyLength \ 8 - 1 - i) = RS_Rem(RS_Rem(RS_Rem(RS_Rem(RS_Rem(RS_Rem(RS_Rem(RS_Rem(k32o(i))))) Xor k32e(i)))))
  Next
  
  ReDim sKey(subkeyCnt)
  For i = 0 To ((subkeyCnt / 2) - 1)
    lA = F32(k64Cnt, i * SK_STEP, k32e)
    lB = F32(k64Cnt, i * SK_STEP + SK_BUMP, k32o)
    lB = lBSL(lB, 8) Or lBSRU(lB, 24)
    If (m_RunningCompiled) Then
      lA = lA + lB
    Else
      lA = UnsignedAdd(lA, lB)
    End If
    sKey(2 * i) = lA
    If (m_RunningCompiled) Then
      lA = lA + lB
    Else
      lA = UnsignedAdd(lA, lB)
    End If
    sKey(2 * i + 1) = lBSL(lA, SK_ROTL) Or lBSRU(lA, 32 - SK_ROTL)
  Next
  
  Call CopyMem(Key(0, 0), sBoxKey(0), 16)
  
  For i = 0 To 255
    If ((k64Cnt And 3) = 1) Then
      sBox(2 * i) = MDS(0, P(0, i) Xor Key(0, 0))
      sBox(2 * i + 1) = MDS(1, P(0, i) Xor Key(1, 0))
      sBox(&H200 + 2 * i) = MDS(2, P(1, i) Xor Key(2, 0))
      sBox(&H200 + 2 * i + 1) = MDS(3, P(1, i) Xor Key(3, 0))
    Else
      b(0) = i
      b(1) = i
      b(2) = i
      b(3) = i
      If ((k64Cnt And 3) = 0) Then
        b(0) = P(1, b(0)) Xor Key(0, 3)
        b(1) = P(0, b(1)) Xor Key(1, 3)
        b(2) = P(0, b(2)) Xor Key(2, 3)
        b(3) = P(1, b(3)) Xor Key(3, 3)
      End If
      If ((k64Cnt And 3) = 3) Or ((k64Cnt And 3) = 0) Then '(exception = True) Then
        b(0) = P(1, b(0)) Xor Key(0, 2)
        b(1) = P(1, b(1)) Xor Key(1, 2)
        b(2) = P(0, b(2)) Xor Key(2, 2)
        b(3) = P(0, b(3)) Xor Key(3, 2)
      End If
      sBox(2 * i) = MDS(0, P(0, P(0, b(0)) Xor Key(0, 1)) Xor Key(0, 0))
      sBox(2 * i + 1) = MDS(1, P(0, P(1, b(1)) Xor Key(1, 1)) Xor Key(1, 0))
      sBox(&H200 + 2 * i) = MDS(2, P(1, P(0, b(2)) Xor Key(2, 1)) Xor Key(2, 0))
      sBox(&H200 + 2 * i + 1) = MDS(3, P(1, P(1, b(3)) Xor Key(3, 1)) Xor Key(3, 0))
    End If
  Next
  
End Sub
Private Function lBSL(ByRef lInput As Long, ByRef bShiftBits As Byte) As Long
  
  lBSL = (lInput And (2 ^ (31 - bShiftBits) - 1)) * 2 ^ bShiftBits
  If (lInput And 2 ^ (31 - bShiftBits)) = 2 ^ (31 - bShiftBits) Then lBSL = (lBSL Or &H80000000)

End Function
Private Function lBSR(ByRef lInput As Long, ByRef bShiftBits As Byte) As Long
  
  If (bShiftBits = 31) Then
    If (lInput < 0) Then lBSR = &HFFFFFFFF Else lBSR = 0
  Else
    lBSR = (lInput And Not (2 ^ bShiftBits - 1)) \ 2 ^ bShiftBits
  End If

End Function

Private Function lBSRU(lInput As Long, bShiftBits As Byte) As Long
  
  If (bShiftBits = 31) Then
    lBSRU = -(lInput < 0)
  Else
    lBSRU = (((lInput And Not (2 ^ bShiftBits - 1)) \ 2 ^ bShiftBits) And Not (&H80000000 + (2 ^ bShiftBits - 2) * 2 ^ (31 - bShiftBits)))
  End If

End Function

Private Static Sub EncryptBlock(DWord() As Long)
  
  Dim t0 As Long
  Dim t1 As Long
  Dim K As Long
  Dim R As Long
  
  DWord(0) = DWord(0) Xor sKey(INPUT_WHITEN)
  DWord(1) = DWord(1) Xor sKey(INPUT_WHITEN + 1)
  DWord(2) = DWord(2) Xor sKey(INPUT_WHITEN + 2)
  DWord(3) = DWord(3) Xor sKey(INPUT_WHITEN + 3)
  
  K = ROUND_SUBKEYS
  For R = 0 To (ROUNDS - 1) Step 2
    If (m_RunningCompiled) Then
      'This is the algorithm when run in compiled
      'mode, where VB won't raise overflow errors
      t0 = Fe32(DWord(0), 0)
      t1 = Fe32(DWord(1), 3)
      t0 = t0 + t1
      DWord(2) = Rot1(DWord(2) Xor (t0 + sKey(K)))
      K = K + 1
      DWord(3) = Rot31(DWord(3)) Xor (t0 + t1 + sKey(K))
      K = K + 1
      t0 = Fe32(DWord(2), 0)
      t1 = Fe32(DWord(3), 3)
      t0 = t0 + t1
      DWord(0) = Rot1(DWord(0) Xor (t0 + sKey(K)))
      K = K + 1
      DWord(1) = Rot31(DWord(1)) Xor (t0 + t1 + sKey(K))
      K = K + 1
    Else
      'This is the algorithm when running in the IDE,
      'although it's slower it makes the code able
      'to run in the IDE without overflow errors
      t0 = Fe32(DWord(0), 0)
      t1 = Fe32(DWord(1), 3)
      t0 = UnsignedAdd(t0, t1)
      DWord(2) = Rot1(DWord(2) Xor (UnsignedAdd(t0, sKey(K))))
      K = K + 1
      DWord(3) = Rot31(DWord(3)) Xor (UnsignedAdd(UnsignedAdd(t0, t1), sKey(K)))
      K = K + 1
      t0 = Fe32(DWord(2), 0)
      t1 = Fe32(DWord(3), 3)
      t0 = UnsignedAdd(t0, t1)
      DWord(0) = Rot1(DWord(0) Xor (UnsignedAdd(t0, sKey(K))))
      K = K + 1
      DWord(1) = Rot31(DWord(1)) Xor (UnsignedAdd(UnsignedAdd(t0, t1), sKey(K)))
      K = K + 1
    End If
  Next

  DWord(2) = DWord(2) Xor sKey(OUTPUT_WHITEN)
  DWord(3) = DWord(3) Xor sKey(OUTPUT_WHITEN + 1)
  DWord(4) = DWord(0) Xor sKey(OUTPUT_WHITEN + 2)
  DWord(5) = DWord(1) Xor sKey(OUTPUT_WHITEN + 3)
  Call CopyMem(DWord(0), DWord(2), 16)

End Sub
Private Sub DecryptBlock(DWord() As Long)
    
  Dim K As Long
  Dim R As Long
  Dim t0 As Long
  Dim t1 As Long
  
  DWord(2) = DWord(2) Xor sKey(OUTPUT_WHITEN)
  DWord(3) = DWord(3) Xor sKey(OUTPUT_WHITEN + 1)
  DWord(0) = DWord(4) Xor sKey(OUTPUT_WHITEN + 2)
  DWord(1) = DWord(5) Xor sKey(OUTPUT_WHITEN + 3)

  K = ROUND_SUBKEYS + 2 * ROUNDS - 1
  For R = 0 To ROUNDS - 1 Step 2
    If (m_RunningCompiled) Then
      t0 = Fe32(DWord(2), 0)
      t1 = Fe32(DWord(3), 3)
      t0 = t0 + t1
      DWord(1) = Rot1(DWord(1) Xor (t0 + t1 + sKey(K)))
      K = K - 1
      DWord(0) = Rot31(DWord(0)) Xor (t0 + sKey(K))
      K = K - 1
      t0 = Fe32(DWord(0), 0)
      t1 = Fe32(DWord(1), 3)
      t0 = t0 + t1
      DWord(3) = Rot1(DWord(3) Xor (t0 + t1 + sKey(K)))
      K = K - 1
      DWord(2) = Rot31(DWord(2)) Xor (t0 + sKey(K))
      K = K - 1
    Else
      t0 = Fe32(DWord(2), 0)
      t1 = Fe32(DWord(3), 3)
      t0 = UnsignedAdd(t0, t1)
      DWord(1) = Rot1(DWord(1) Xor (UnsignedAdd(UnsignedAdd(t0, t1), sKey(K))))
      K = K - 1
      DWord(0) = Rot31(DWord(0)) Xor (UnsignedAdd(t0, sKey(K)))
      K = K - 1
      t0 = Fe32(DWord(0), 0)
      t1 = Fe32(DWord(1), 3)
      t0 = UnsignedAdd(t0, t1)
      DWord(3) = Rot1(DWord(3) Xor (UnsignedAdd(UnsignedAdd(t0, t1), sKey(K))))
      K = K - 1
      DWord(2) = Rot31(DWord(2)) Xor (UnsignedAdd(t0, sKey(K)))
      K = K - 1
    End If
  Next
    
  DWord(0) = DWord(0) Xor sKey(INPUT_WHITEN)
  DWord(1) = DWord(1) Xor sKey(INPUT_WHITEN + 1)
  DWord(2) = DWord(2) Xor sKey(INPUT_WHITEN + 2)
  DWord(3) = DWord(3) Xor sKey(INPUT_WHITEN + 3)

End Sub
Private Static Function Rot1(Value As Long) As Long

  Dim Temp As Byte
  Dim x(0 To 3) As Byte
  
  Call CopyMem(x(0), Value, 4)
  
  Temp = x(0)
  x(0) = (x(0) \ 2) Or ((x(1) And 1) * 128)
  x(1) = (x(1) \ 2) Or ((x(2) And 1) * 128)
  x(2) = (x(2) \ 2) Or ((x(3) And 1) * 128)
  x(3) = (x(3) \ 2) Or ((Temp And 1) * 128)
  
  Call CopyMem(Rot1, x(0), 4)
  
End Function
Private Static Function Rot31(Value As Long) As Long

  Dim Temp As Byte
  Dim x(0 To 3) As Byte
  
  Call CopyMem(x(0), Value, 4)
  
  Temp = x(3)
  x(3) = ((x(3) And 127) * 2) Or -CBool(x(2) And 128)
  x(2) = ((x(2) And 127) * 2) Or -CBool(x(1) And 128)
  x(1) = ((x(1) And 127) * 2) Or -CBool(x(0) And 128)
  x(0) = ((x(0) And 127) * 2) Or -CBool(Temp And 128)
  
  Call CopyMem(Rot31, x(0), 4)
  
End Function

Private Sub Class_Initialize()
  
  Dim i As Long
  Dim j As Long
  Dim m1(0 To 1) As Long
  Dim mX(0 To 1) As Long
  Dim mY(0 To 1) As Long
  
  'We need to check if we are running in compiled
  '(EXE) mode or in the IDE, this will allow us to
  'use optimized code with unsigned integers in
  'compiled mode without any overflow errors when
  'running the code in the IDE
  On Local Error Resume Next
  m_RunningCompiled = ((2147483647 + 1) < 0)
  
  'Initialize P(0,..) array
  P(0, 0) = &HA9
  P(0, 1) = &H67
  P(0, 2) = &HB3
  P(0, 3) = &HE8
  P(0, 4) = &H4
  P(0, 5) = &HFD
  P(0, 6) = &HA3
  P(0, 7) = &H76
  P(0, 8) = &H9A
  P(0, 9) = &H92
  P(0, 10) = &H80
  P(0, 11) = &H78
  P(0, 12) = &HE4
  P(0, 13) = &HDD
  P(0, 14) = &HD1
  P(0, 15) = &H38
  P(0, 16) = &HD
  P(0, 17) = &HC6
  P(0, 18) = &H35
  P(0, 19) = &H98
  P(0, 20) = &H18
  P(0, 21) = &HF7
  P(0, 22) = &HEC
  P(0, 23) = &H6C
  P(0, 24) = &H43
  P(0, 25) = &H75
  P(0, 26) = &H37
  P(0, 27) = &H26
  P(0, 28) = &HFA
  P(0, 29) = &H13
  P(0, 30) = &H94
  P(0, 31) = &H48
  P(0, 32) = &HF2
  P(0, 33) = &HD0
  P(0, 34) = &H8B
  P(0, 35) = &H30
  P(0, 36) = &H84
  P(0, 37) = &H54
  P(0, 38) = &HDF
  P(0, 39) = &H23
  P(0, 40) = &H19
  P(0, 41) = &H5B
  P(0, 42) = &H3D
  P(0, 43) = &H59
  P(0, 44) = &HF3
  P(0, 45) = &HAE
  P(0, 46) = &HA2
  P(0, 47) = &H82
  P(0, 48) = &H63
  P(0, 49) = &H1
  P(0, 50) = &H83
  P(0, 51) = &H2E
  P(0, 52) = &HD9
  P(0, 53) = &H51
  P(0, 54) = &H9B
  P(0, 55) = &H7C
  P(0, 56) = &HA6
  P(0, 57) = &HEB
  P(0, 58) = &HA5
  P(0, 59) = &HBE
  P(0, 60) = &H16
  P(0, 61) = &HC
  P(0, 62) = &HE3
  P(0, 63) = &H61
  P(0, 64) = &HC0
  P(0, 65) = &H8C
  P(0, 66) = &H3A
  P(0, 67) = &HF5
  P(0, 68) = &H73
  P(0, 69) = &H2C
  P(0, 70) = &H25
  P(0, 71) = &HB
  P(0, 72) = &HBB
  P(0, 73) = &H4E
  P(0, 74) = &H89
  P(0, 75) = &H6B
  P(0, 76) = &H53
  P(0, 77) = &H6A
  P(0, 78) = &HB4
  P(0, 79) = &HF1
  P(0, 80) = &HE1
  P(0, 81) = &HE6
  P(0, 82) = &HBD
  P(0, 83) = &H45
  P(0, 84) = &HE2
  P(0, 85) = &HF4
  P(0, 86) = &HB6
  P(0, 87) = &H66
  P(0, 88) = &HCC
  P(0, 89) = &H95
  P(0, 90) = &H3
  P(0, 91) = &H56
  P(0, 92) = &HD4
  P(0, 93) = &H1C
  P(0, 94) = &H1E
  P(0, 95) = &HD7
  P(0, 96) = &HFB
  P(0, 97) = &HC3
  P(0, 98) = &H8E
  P(0, 99) = &HB5
  P(0, 100) = &HE9
  P(0, 101) = &HCF
  P(0, 102) = &HBF
  P(0, 103) = &HBA
  P(0, 104) = &HEA
  P(0, 105) = &H77
  P(0, 106) = &H39
  P(0, 107) = &HAF
  P(0, 108) = &H33
  P(0, 109) = &HC9
  P(0, 110) = &H62
  P(0, 111) = &H71
  P(0, 112) = &H81
  P(0, 113) = &H79
  P(0, 114) = &H9
  P(0, 115) = &HAD
  P(0, 116) = &H24
  P(0, 117) = &HCD
  P(0, 118) = &HF9
  P(0, 119) = &HD8
  P(0, 120) = &HE5
  P(0, 121) = &HC5
  P(0, 122) = &HB9
  P(0, 123) = &H4D
  P(0, 124) = &H44
  P(0, 125) = &H8
  P(0, 126) = &H86
  P(0, 127) = &HE7
  P(0, 128) = &HA1
  P(0, 129) = &H1D
  P(0, 130) = &HAA
  P(0, 131) = &HED
  P(0, 132) = &H6
  P(0, 133) = &H70
  P(0, 134) = &HB2
  P(0, 135) = &HD2
  P(0, 136) = &H41
  P(0, 137) = &H7B
  P(0, 138) = &HA0
  P(0, 139) = &H11
  P(0, 140) = &H31
  P(0, 141) = &HC2
  P(0, 142) = &H27
  P(0, 143) = &H90
  P(0, 144) = &H20
  P(0, 145) = &HF6
  P(0, 146) = &H60
  P(0, 147) = &HFF
  P(0, 148) = &H96
  P(0, 149) = &H5C
  P(0, 150) = &HB1
  P(0, 151) = &HAB
  P(0, 152) = &H9E
  P(0, 153) = &H9C
  P(0, 154) = &H52
  P(0, 155) = &H1B
  P(0, 156) = &H5F
  P(0, 157) = &H93
  P(0, 158) = &HA
  P(0, 159) = &HEF
  P(0, 160) = &H91
  P(0, 161) = &H85
  P(0, 162) = &H49
  P(0, 163) = &HEE
  P(0, 164) = &H2D
  P(0, 165) = &H4F
  P(0, 166) = &H8F
  P(0, 167) = &H3B
  P(0, 168) = &H47
  P(0, 169) = &H87
  P(0, 170) = &H6D
  P(0, 171) = &H46
  P(0, 172) = &HD6
  P(0, 173) = &H3E
  P(0, 174) = &H69
  P(0, 175) = &H64
  P(0, 176) = &H2A
  P(0, 177) = &HCE
  P(0, 178) = &HCB
  P(0, 179) = &H2F
  P(0, 180) = &HFC
  P(0, 181) = &H97
  P(0, 182) = &H5
  P(0, 183) = &H7A
  P(0, 184) = &HAC
  P(0, 185) = &H7F
  P(0, 186) = &HD5
  P(0, 187) = &H1A
  P(0, 188) = &H4B
  P(0, 189) = &HE
  P(0, 190) = &HA7
  P(0, 191) = &H5A
  P(0, 192) = &H28
  P(0, 193) = &H14
  P(0, 194) = &H3F
  P(0, 195) = &H29
  P(0, 196) = &H88
  P(0, 197) = &H3C
  P(0, 198) = &H4C
  P(0, 199) = &H2
  P(0, 200) = &HB8
  P(0, 201) = &HDA
  P(0, 202) = &HB0
  P(0, 203) = &H17
  P(0, 204) = &H55
  P(0, 205) = &H1F
  P(0, 206) = &H8A
  P(0, 207) = &H7D
  P(0, 208) = &H57
  P(0, 209) = &HC7
  P(0, 210) = &H8D
  P(0, 211) = &H74
  P(0, 212) = &HB7
  P(0, 213) = &HC4
  P(0, 214) = &H9F
  P(0, 215) = &H72
  P(0, 216) = &H7E
  P(0, 217) = &H15
  P(0, 218) = &H22
  P(0, 219) = &H12
  P(0, 220) = &H58
  P(0, 221) = &H7
  P(0, 222) = &H99
  P(0, 223) = &H34
  P(0, 224) = &H6E
  P(0, 225) = &H50
  P(0, 226) = &HDE
  P(0, 227) = &H68
  P(0, 228) = &H65
  P(0, 229) = &HBC
  P(0, 230) = &HDB
  P(0, 231) = &HF8
  P(0, 232) = &HC8
  P(0, 233) = &HA8
  P(0, 234) = &H2B
  P(0, 235) = &H40
  P(0, 236) = &HDC
  P(0, 237) = &HFE
  P(0, 238) = &H32
  P(0, 239) = &HA4
  P(0, 240) = &HCA
  P(0, 241) = &H10
  P(0, 242) = &H21
  P(0, 243) = &HF0
  P(0, 244) = &HD3
  P(0, 245) = &H5D
  P(0, 246) = &HF
  P(0, 247) = &H0
  P(0, 248) = &H6F
  P(0, 249) = &H9D
  P(0, 250) = &H36
  P(0, 251) = &H42
  P(0, 252) = &H4A
  P(0, 253) = &H5E
  P(0, 254) = &HC1
  P(0, 255) = &HE0
  
  'Initialize P(1,..) array
  P(1, 0) = &H75
  P(1, 1) = &HF3
  P(1, 2) = &HC6
  P(1, 3) = &HF4
  P(1, 4) = &HDB
  P(1, 5) = &H7B
  P(1, 6) = &HFB
  P(1, 7) = &HC8
  P(1, 8) = &H4A
  P(1, 9) = &HD3
  P(1, 10) = &HE6
  P(1, 11) = &H6B
  P(1, 12) = &H45
  P(1, 13) = &H7D
  P(1, 14) = &HE8
  P(1, 15) = &H4B
  P(1, 16) = &HD6
  P(1, 17) = &H32
  P(1, 18) = &HD8
  P(1, 19) = &HFD
  P(1, 20) = &H37
  P(1, 21) = &H71
  P(1, 22) = &HF1
  P(1, 23) = &HE1
  P(1, 24) = &H30
  P(1, 25) = &HF
  P(1, 26) = &HF8
  P(1, 27) = &H1B
  P(1, 28) = &H87
  P(1, 29) = &HFA
  P(1, 30) = &H6
  P(1, 31) = &H3F
  P(1, 32) = &H5E
  P(1, 33) = &HBA
  P(1, 34) = &HAE
  P(1, 35) = &H5B
  P(1, 36) = &H8A
  P(1, 37) = &H0
  P(1, 38) = &HBC
  P(1, 39) = &H9D
  P(1, 40) = &H6D
  P(1, 41) = &HC1
  P(1, 42) = &HB1
  P(1, 43) = &HE
  P(1, 44) = &H80
  P(1, 45) = &H5D
  P(1, 46) = &HD2
  P(1, 47) = &HD5
  P(1, 48) = &HA0
  P(1, 49) = &H84
  P(1, 50) = &H7
  P(1, 51) = &H14
  P(1, 52) = &HB5
  P(1, 53) = &H90
  P(1, 54) = &H2C
  P(1, 55) = &HA3
  P(1, 56) = &HB2
  P(1, 57) = &H73
  P(1, 58) = &H4C
  P(1, 59) = &H54
  P(1, 60) = &H92
  P(1, 61) = &H74
  P(1, 62) = &H36
  P(1, 63) = &H51
  P(1, 64) = &H38
  P(1, 65) = &HB0
  P(1, 66) = &HBD
  P(1, 67) = &H5A
  P(1, 68) = &HFC
  P(1, 69) = &H60
  P(1, 70) = &H62
  P(1, 71) = &H96
  P(1, 72) = &H6C
  P(1, 73) = &H42
  P(1, 74) = &HF7
  P(1, 75) = &H10
  P(1, 76) = &H7C
  P(1, 77) = &H28
  P(1, 78) = &H27
  P(1, 79) = &H8C
  P(1, 80) = &H13
  P(1, 81) = &H95
  P(1, 82) = &H9C
  P(1, 83) = &HC7
  P(1, 84) = &H24
  P(1, 85) = &H46
  P(1, 86) = &H3B
  P(1, 87) = &H70
  P(1, 88) = &HCA
  P(1, 89) = &HE3
  P(1, 90) = &H85
  P(1, 91) = &HCB
  P(1, 92) = &H11
  P(1, 93) = &HD0
  P(1, 94) = &H93
  P(1, 95) = &HB8
  P(1, 96) = &HA6
  P(1, 97) = &H83
  P(1, 98) = &H20
  P(1, 99) = &HFF
  P(1, 100) = &H9F
  P(1, 101) = &H77
  P(1, 102) = &HC3
  P(1, 103) = &HCC
  P(1, 104) = &H3
  P(1, 105) = &H6F
  P(1, 106) = &H8
  P(1, 107) = &HBF
  P(1, 108) = &H40
  P(1, 109) = &HE7
  P(1, 110) = &H2B
  P(1, 111) = &HE2
  P(1, 112) = &H79
  P(1, 113) = &HC
  P(1, 114) = &HAA
  P(1, 115) = &H82
  P(1, 116) = &H41
  P(1, 117) = &H3A
  P(1, 118) = &HEA
  P(1, 119) = &HB9
  P(1, 120) = &HE4
  P(1, 121) = &H9A
  P(1, 122) = &HA4
  P(1, 123) = &H97
  P(1, 124) = &H7E
  P(1, 125) = &HDA
  P(1, 126) = &H7A
  P(1, 127) = &H17
  P(1, 128) = &H66
  P(1, 129) = &H94
  P(1, 130) = &HA1
  P(1, 131) = &H1D
  P(1, 132) = &H3D
  P(1, 133) = &HF0
  P(1, 134) = &HDE
  P(1, 135) = &HB3
  P(1, 136) = &HB
  P(1, 137) = &H72
  P(1, 138) = &HA7
  P(1, 139) = &H1C
  P(1, 140) = &HEF
  P(1, 141) = &HD1
  P(1, 142) = &H53
  P(1, 143) = &H3E
  P(1, 144) = &H8F
  P(1, 145) = &H33
  P(1, 146) = &H26
  P(1, 147) = &H5F
  P(1, 148) = &HEC
  P(1, 149) = &H76
  P(1, 150) = &H2A
  P(1, 151) = &H49
  P(1, 152) = &H81
  P(1, 153) = &H88
  P(1, 154) = &HEE
  P(1, 155) = &H21
  P(1, 156) = &HC4
  P(1, 157) = &H1A
  P(1, 158) = &HEB
  P(1, 159) = &HD9
  P(1, 160) = &HC5
  P(1, 161) = &H39
  P(1, 162) = &H99
  P(1, 163) = &HCD
  P(1, 164) = &HAD
  P(1, 165) = &H31
  P(1, 166) = &H8B
  P(1, 167) = &H1
  P(1, 168) = &H18
  P(1, 169) = &H23
  P(1, 170) = &HDD
  P(1, 171) = &H1F
  P(1, 172) = &H4E
  P(1, 173) = &H2D
  P(1, 174) = &HF9
  P(1, 175) = &H48
  P(1, 176) = &H4F
  P(1, 177) = &HF2
  P(1, 178) = &H65
  P(1, 179) = &H8E
  P(1, 180) = &H78
  P(1, 181) = &H5C
  P(1, 182) = &H58
  P(1, 183) = &H19
  P(1, 184) = &H8D
  P(1, 185) = &HE5
  P(1, 186) = &H98
  P(1, 187) = &H57
  P(1, 188) = &H67
  P(1, 189) = &H7F
  P(1, 190) = &H5
  P(1, 191) = &H64
  P(1, 192) = &HAF
  P(1, 193) = &H63
  P(1, 194) = &HB6
  P(1, 195) = &HFE
  P(1, 196) = &HF5
  P(1, 197) = &HB7
  P(1, 198) = &H3C
  P(1, 199) = &HA5
  P(1, 200) = &HCE
  P(1, 201) = &HE9
  P(1, 202) = &H68
  P(1, 203) = &H44
  P(1, 204) = &HE0
  P(1, 205) = &H4D
  P(1, 206) = &H43
  P(1, 207) = &H69
  P(1, 208) = &H29
  P(1, 209) = &H2E
  P(1, 210) = &HAC
  P(1, 211) = &H15
  P(1, 212) = &H59
  P(1, 213) = &HA8
  P(1, 214) = &HA
  P(1, 215) = &H9E
  P(1, 216) = &H6E
  P(1, 217) = &H47
  P(1, 218) = &HDF
  P(1, 219) = &H34
  P(1, 220) = &H35
  P(1, 221) = &H6A
  P(1, 222) = &HCF
  P(1, 223) = &HDC
  P(1, 224) = &H22
  P(1, 225) = &HC9
  P(1, 226) = &HC0
  P(1, 227) = &H9B
  P(1, 228) = &H89
  P(1, 229) = &HD4
  P(1, 230) = &HED
  P(1, 231) = &HAB
  P(1, 232) = &H12
  P(1, 233) = &HA2
  P(1, 234) = &HD
  P(1, 235) = &H52
  P(1, 236) = &HBB
  P(1, 237) = &H2
  P(1, 238) = &H2F
  P(1, 239) = &HA9
  P(1, 240) = &HD7
  P(1, 241) = &H61
  P(1, 242) = &H1E
  P(1, 243) = &HB4
  P(1, 244) = &H50
  P(1, 245) = &H4
  P(1, 246) = &HF6
  P(1, 247) = &HC2
  P(1, 248) = &H16
  P(1, 249) = &H25
  P(1, 250) = &H86
  P(1, 251) = &H56
  P(1, 252) = &H55
  P(1, 253) = &H9
  P(1, 254) = &HBE
  P(1, 255) = &H91
  
  'Initialize the MDS array
  For i = 0 To 255
    j = P(0, i)
    m1(0) = j
    mX(0) = j Xor LFSR2(j)
    mY(0) = j Xor LFSR1(j) Xor LFSR2(j)
    
    j = P(1, i)
    m1(1) = j
    mX(1) = j Xor LFSR2(j)
    mY(1) = j Xor LFSR1(j) Xor LFSR2(j)
    
    MDS(0, i) = (m1(1) Or lBSL(mX(1), 8) Or lBSL(mY(1), 16) Or lBSL(mY(1), 24))
    MDS(1, i) = (mY(0) Or lBSL(mY(0), 8) Or lBSL(mX(0), 16) Or lBSL(m1(0), 24))
    MDS(2, i) = (mX(1) Or lBSL(mY(1), 8) Or lBSL(m1(1), 16) Or lBSL(mY(1), 24))
    MDS(3, i) = (mX(0) Or lBSL(m1(0), 8) Or lBSL(mY(0), 16) Or lBSL(mX(0), 24))
  Next

End Sub
Public Property Let Key(Optional ByVal MinKeyLength As TWOFISHKEYLENGTH, New_Value As String)
    
  Dim KeyLength As Long
  Dim Key() As Byte
  
  'Convert the key into a bytearray
  KeyLength = Len(New_Value) * 8
  Key() = StrConv(New_Value, vbFromUnicode)
  
  'Resize the key array if it is too small
  If (KeyLength < MinKeyLength) Then
    ReDim Preserve Key(MinKeyLength \ 8 - 1)
    KeyLength = MinKeyLength
  End If
  
  'The key array can only be of certain sizes,
  'if the size is invalid resize to the closes
  'size (preferably by making it larger)
  If (KeyLength > 192) Then
    ReDim Preserve Key(31)
    KeyLength = 256
  ElseIf (KeyLength > 128) Then
    ReDim Preserve Key(23)
    KeyLength = 192
  ElseIf (KeyLength > 64) Then
    ReDim Preserve Key(15)
    KeyLength = 128
  ElseIf (KeyLength > 32) Then
    ReDim Preserve Key(7)
    KeyLength = 64
  Else
    ReDim Preserve Key(3)
    KeyLength = 32
  End If
  
  'Create the key-dependant sboxes
  Call KeyCreate(Key, KeyLength \ 8)

End Property
Public Sub EncryptByte(ByteArray() As Byte, Optional Key As String)
    
  Dim Offset As Long
  Dim OrigLen As Long
  Dim CipherLen As Long
  Dim CurrPercent As Long
  Dim NextPercent As Long
  Dim DWord(0 To 5) As Long
  Dim CipherWord(0 To 3) As Long
  
  'Set the new key if any was provided
  If (Len(Key) > 0) Then Me.Key = Key
  
  'Get the length of the plaintext
  OrigLen = UBound(ByteArray) + 1
  
  'First we add 12 bytes (4 bytes for the
  'length and 8 bytes for the seed values
  'for the CBC routine), and the ciphertext
  'must be a multiple of 16 bytes
  CipherLen = OrigLen + 12
  If (CipherLen Mod 16 <> 0) Then
    CipherLen = CipherLen + 16 - (CipherLen Mod 16)
  End If
  ReDim Preserve ByteArray(CipherLen - 1)
  Call CopyMem(ByteArray(12), ByteArray(0), OrigLen)
  
  'Store the length descriptor in bytes [9-12]
  Call CopyMem(ByteArray(8), OrigLen, 4)
  
  'Store a block of random data in bytes [1-8],
  'these work as seed values for the CBC routine
  'and is used to produce different ciphertext
  'even when encrypting the same data with the
  'same key)
  Call Randomize
  Call CopyMem(ByteArray(0), CLng(2147483647 * Rnd), 4)
  Call CopyMem(ByteArray(4), CLng(2147483647 * Rnd), 4)
  
  'Encrypt the data in 128-bits blocks
  For Offset = 0 To (CipherLen - 1) Step 16
    'Get the next block
    Call CopyMem(DWord(0), ByteArray(Offset), 16)
    
    'XOR the plaintext with the previous
    'ciphertext (CBC, Cipher-Block Chaining)
    DWord(0) = DWord(0) Xor CipherWord(0)
    DWord(1) = DWord(1) Xor CipherWord(1)
    DWord(2) = DWord(2) Xor CipherWord(2)
    DWord(3) = DWord(3) Xor CipherWord(3)
    
    'Encrypt the block
    Call EncryptBlock(DWord())
    
    'Store the new block
    Call CopyMem(ByteArray(Offset), DWord(0), 16)
    
    'Store the cipherblock (for CBC)
    Call CopyMem(CipherWord(0), DWord(0), 16)
    
    'Update the progress if neccessary
    If (Offset >= NextPercent) Then
      CurrPercent = Int((Offset / CipherLen) * 100)
      NextPercent = (CipherLen * ((CurrPercent + 1) / 100)) + 1
      RaiseEvent Progress(CurrPercent)
    End If
  Next
  
  'Make sure we return a 100% progress
  If (CurrPercent <> 100) Then RaiseEvent Progress(100)

End Sub
Public Sub DecryptByte(ByteArray() As Byte, Optional Key As String)
    
  Dim Offset As Long
  Dim OrigLen As Long
  Dim CipherLen As Long
  Dim CurrPercent As Long
  Dim NextPercent As Long
  Dim DWord(0 To 5) As Long
  Dim CipherWord(0 To 3) As Long
  
  'Set the new key if any was provided
  If (Len(Key) > 0) Then Me.Key = Key
  
  'Get the length of the ciphertext
  CipherLen = UBound(ByteArray) + 1
  
  'Decrypt the data in 128-bits blocks
  For Offset = 0 To (CipherLen - 1) Step 16
    'Get the next block
    Call CopyMem(DWord(2), ByteArray(Offset), 16)
    
    'Decrypt the block
    Call DecryptBlock(DWord())
    
    'XOR with the previous cipherblock
    DWord(0) = DWord(0) Xor CipherWord(0)
    DWord(1) = DWord(1) Xor CipherWord(1)
    DWord(2) = DWord(2) Xor CipherWord(2)
    DWord(3) = DWord(3) Xor CipherWord(3)
    
    'Store the current ciphertext to use
    'XOR with the next block plaintext
    Call CopyMem(CipherWord(0), ByteArray(Offset), 16)
    
    'Store the block
    Call CopyMem(ByteArray(Offset), DWord(0), 16)
    
    'Update the progress if neccessary
    If (Offset >= NextPercent) Then
      CurrPercent = Int((Offset / CipherLen) * 100)
      NextPercent = (CipherLen * ((CurrPercent + 1) / 100)) + 1
      RaiseEvent Progress(CurrPercent)
    End If
  Next
  
  'Get the size of the original array
  Call CopyMem(OrigLen, ByteArray(8), 4)
  
  'Make sure OrigLen is a reasonable value,
  'if we used the wrong key the next couple
  'of statements could be dangerous (GPF)
  If (CipherLen - OrigLen > 27) Or (CipherLen - OrigLen < 12) Then
    Call Err.Raise(vbObjectError, , "Incorrect size descriptor in Twofish decryption")
  End If
  
  'Resize the bytearray to hold only the plaintext
  'and not the extra information added by the
  'encryption routine
  Call CopyMem(ByteArray(0), ByteArray(12), OrigLen)
  ReDim Preserve ByteArray(OrigLen - 1)

  'Make sure we return a 100% progress
  If (CurrPercent <> 100) Then RaiseEvent Progress(100)

End Sub
