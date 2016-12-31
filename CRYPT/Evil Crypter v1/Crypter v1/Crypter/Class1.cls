VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Class1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'DES Encryption/Decryption Class
'------------------------------------
'
'Information concerning the DES
'algorithm can be found at:
'http://csrc.nist.gov/fips/fips46-3.pdf
'
'(c) 2000, Fredrik Qvarfort
'

Option Explicit

'For progress notifications
Event Progress(Percent As Long)

'Key-dependant
Private m_Key(0 To 47, 1 To 16) As Byte

'Buffered key value
Private m_KeyValue As String

'Values given in the DES standard
Private m_E(0 To 63) As Byte
Private m_P(0 To 31) As Byte
Private m_IP(0 To 63) As Byte
Private m_PC1(0 To 55) As Byte
Private m_PC2(0 To 47) As Byte
Private m_IPInv(0 To 63) As Byte
Private m_EmptyArray(0 To 63) As Byte
Private m_LeftShifts(1 To 16) As Byte
Private m_sBox(0 To 7, 0 To 1, 0 To 1, 0 To 1, 0 To 1, 0 To 1, 0 To 1) As Long

Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Static Sub Byte2Bin(ByteArray() As Byte, ByteLen As Long, BinaryArray() As Byte)

  Dim a As Long
  Dim ByteValue As Byte
  Dim BinLength As Long
  
  'Clear the destination array, faster than
  'setting the data to zero in the loop below
  Call CopyMem(BinaryArray(0), m_EmptyArray(0), ByteLen * 8)
  
  'Add binary 1's where needed
  BinLength = 0
  For a = 0 To (ByteLen - 1)
    ByteValue = ByteArray(a)
    If (ByteValue And 128) Then BinaryArray(BinLength) = 1
    If (ByteValue And 64) Then BinaryArray(BinLength + 1) = 1
    If (ByteValue And 32) Then BinaryArray(BinLength + 2) = 1
    If (ByteValue And 16) Then BinaryArray(BinLength + 3) = 1
    If (ByteValue And 8) Then BinaryArray(BinLength + 4) = 1
    If (ByteValue And 4) Then BinaryArray(BinLength + 5) = 1
    If (ByteValue And 2) Then BinaryArray(BinLength + 6) = 1
    If (ByteValue And 1) Then BinaryArray(BinLength + 7) = 1
    BinLength = BinLength + 8
  Next

End Sub
Private Static Sub Bin2Byte(BinaryArray() As Byte, ByteLen As Long, ByteArray() As Byte)

  Dim a As Long
  Dim ByteValue As Byte
  Dim BinLength As Long
  
  'Calculate byte values
  BinLength = 0
  For a = 0 To (ByteLen - 1)
    ByteValue = 0
    If (BinaryArray(BinLength) = 1) Then ByteValue = ByteValue + 128
    If (BinaryArray(BinLength + 1) = 1) Then ByteValue = ByteValue + 64
    If (BinaryArray(BinLength + 2) = 1) Then ByteValue = ByteValue + 32
    If (BinaryArray(BinLength + 3) = 1) Then ByteValue = ByteValue + 16
    If (BinaryArray(BinLength + 4) = 1) Then ByteValue = ByteValue + 8
    If (BinaryArray(BinLength + 5) = 1) Then ByteValue = ByteValue + 4
    If (BinaryArray(BinLength + 6) = 1) Then ByteValue = ByteValue + 2
    If (BinaryArray(BinLength + 7) = 1) Then ByteValue = ByteValue + 1
    ByteArray(a) = ByteValue
    BinLength = BinLength + 8
  Next
  
End Sub
Private Static Sub EncryptBlock(BlockData() As Byte)

  Dim a As Long
  Dim i As Long
  Dim L(0 To 31) As Byte
  Dim R(0 To 31) As Byte
  Dim RL(0 To 63) As Byte
  Dim sBox(0 To 31) As Byte
  Dim LiRi(0 To 31) As Byte
  Dim ERxorK(0 To 47) As Byte
  Dim BinBlock(0 To 63) As Byte
  
  'Convert the block into a binary array
  '(I do believe this is the best solution
  'in VB for the DES algorithm, but it is
  'still slow as xxxx)
  Call Byte2Bin(BlockData(), 8, BinBlock())
  
  'Apply the IP permutation and split the
  'block into two halves, L[] and R[]
  For a = 0 To 31
    L(a) = BinBlock(m_IP(a))
    R(a) = BinBlock(m_IP(a + 32))
  Next
  
  'Apply the 16 subkeys on the block
  For i = 1 To 16
    'E(R[i]) xor K[i]
    ERxorK(0) = R(31) Xor m_Key(0, i)
    ERxorK(1) = R(0) Xor m_Key(1, i)
    ERxorK(2) = R(1) Xor m_Key(2, i)
    ERxorK(3) = R(2) Xor m_Key(3, i)
    ERxorK(4) = R(3) Xor m_Key(4, i)
    ERxorK(5) = R(4) Xor m_Key(5, i)
    ERxorK(6) = R(3) Xor m_Key(6, i)
    ERxorK(7) = R(4) Xor m_Key(7, i)
    ERxorK(8) = R(5) Xor m_Key(8, i)
    ERxorK(9) = R(6) Xor m_Key(9, i)
    ERxorK(10) = R(7) Xor m_Key(10, i)
    ERxorK(11) = R(8) Xor m_Key(11, i)
    ERxorK(12) = R(7) Xor m_Key(12, i)
    ERxorK(13) = R(8) Xor m_Key(13, i)
    ERxorK(14) = R(9) Xor m_Key(14, i)
    ERxorK(15) = R(10) Xor m_Key(15, i)
    ERxorK(16) = R(11) Xor m_Key(16, i)
    ERxorK(17) = R(12) Xor m_Key(17, i)
    ERxorK(18) = R(11) Xor m_Key(18, i)
    ERxorK(19) = R(12) Xor m_Key(19, i)
    ERxorK(20) = R(13) Xor m_Key(20, i)
    ERxorK(21) = R(14) Xor m_Key(21, i)
    ERxorK(22) = R(15) Xor m_Key(22, i)
    ERxorK(23) = R(16) Xor m_Key(23, i)
    ERxorK(24) = R(15) Xor m_Key(24, i)
    ERxorK(25) = R(16) Xor m_Key(25, i)
    ERxorK(26) = R(17) Xor m_Key(26, i)
    ERxorK(27) = R(18) Xor m_Key(27, i)
    ERxorK(28) = R(19) Xor m_Key(28, i)
    ERxorK(29) = R(20) Xor m_Key(29, i)
    ERxorK(30) = R(19) Xor m_Key(30, i)
    ERxorK(31) = R(20) Xor m_Key(31, i)
    ERxorK(32) = R(21) Xor m_Key(32, i)
    ERxorK(33) = R(22) Xor m_Key(33, i)
    ERxorK(34) = R(23) Xor m_Key(34, i)
    ERxorK(35) = R(24) Xor m_Key(35, i)
    ERxorK(36) = R(23) Xor m_Key(36, i)
    ERxorK(37) = R(24) Xor m_Key(37, i)
    ERxorK(38) = R(25) Xor m_Key(38, i)
    ERxorK(39) = R(26) Xor m_Key(39, i)
    ERxorK(40) = R(27) Xor m_Key(40, i)
    ERxorK(41) = R(28) Xor m_Key(41, i)
    ERxorK(42) = R(27) Xor m_Key(42, i)
    ERxorK(43) = R(28) Xor m_Key(43, i)
    ERxorK(44) = R(29) Xor m_Key(44, i)
    ERxorK(45) = R(30) Xor m_Key(45, i)
    ERxorK(46) = R(31) Xor m_Key(46, i)
    ERxorK(47) = R(0) Xor m_Key(47, i)
    
    'Apply the s-boxes
    Call CopyMem(sBox(0), m_sBox(0, ERxorK(0), ERxorK(1), ERxorK(2), ERxorK(3), ERxorK(4), ERxorK(5)), 4)
    Call CopyMem(sBox(4), m_sBox(1, ERxorK(6), ERxorK(7), ERxorK(8), ERxorK(9), ERxorK(10), ERxorK(11)), 4)
    Call CopyMem(sBox(8), m_sBox(2, ERxorK(12), ERxorK(13), ERxorK(14), ERxorK(15), ERxorK(16), ERxorK(17)), 4)
    Call CopyMem(sBox(12), m_sBox(3, ERxorK(18), ERxorK(19), ERxorK(20), ERxorK(21), ERxorK(22), ERxorK(23)), 4)
    Call CopyMem(sBox(16), m_sBox(4, ERxorK(24), ERxorK(25), ERxorK(26), ERxorK(27), ERxorK(28), ERxorK(29)), 4)
    Call CopyMem(sBox(20), m_sBox(5, ERxorK(30), ERxorK(31), ERxorK(32), ERxorK(33), ERxorK(34), ERxorK(35)), 4)
    Call CopyMem(sBox(24), m_sBox(6, ERxorK(36), ERxorK(37), ERxorK(38), ERxorK(39), ERxorK(40), ERxorK(41)), 4)
    Call CopyMem(sBox(28), m_sBox(7, ERxorK(42), ERxorK(43), ERxorK(44), ERxorK(45), ERxorK(46), ERxorK(47)), 4)
    
    'L[i] xor P(R[i])
    LiRi(0) = L(0) Xor sBox(15)
    LiRi(1) = L(1) Xor sBox(6)
    LiRi(2) = L(2) Xor sBox(19)
    LiRi(3) = L(3) Xor sBox(20)
    LiRi(4) = L(4) Xor sBox(28)
    LiRi(5) = L(5) Xor sBox(11)
    LiRi(6) = L(6) Xor sBox(27)
    LiRi(7) = L(7) Xor sBox(16)
    LiRi(8) = L(8) Xor sBox(0)
    LiRi(9) = L(9) Xor sBox(14)
    LiRi(10) = L(10) Xor sBox(22)
    LiRi(11) = L(11) Xor sBox(25)
    LiRi(12) = L(12) Xor sBox(4)
    LiRi(13) = L(13) Xor sBox(17)
    LiRi(14) = L(14) Xor sBox(30)
    LiRi(15) = L(15) Xor sBox(9)
    LiRi(16) = L(16) Xor sBox(1)
    LiRi(17) = L(17) Xor sBox(7)
    LiRi(18) = L(18) Xor sBox(23)
    LiRi(19) = L(19) Xor sBox(13)
    LiRi(20) = L(20) Xor sBox(31)
    LiRi(21) = L(21) Xor sBox(26)
    LiRi(22) = L(22) Xor sBox(2)
    LiRi(23) = L(23) Xor sBox(8)
    LiRi(24) = L(24) Xor sBox(18)
    LiRi(25) = L(25) Xor sBox(12)
    LiRi(26) = L(26) Xor sBox(29)
    LiRi(27) = L(27) Xor sBox(5)
    LiRi(28) = L(28) Xor sBox(21)
    LiRi(29) = L(29) Xor sBox(10)
    LiRi(30) = L(30) Xor sBox(3)
    LiRi(31) = L(31) Xor sBox(24)
    
    'Prepare for next round
    Call CopyMem(L(0), R(0), 32)
    Call CopyMem(R(0), LiRi(0), 32)
  Next
  
  'Concatenate R[]L[]
  Call CopyMem(RL(0), R(0), 32)
  Call CopyMem(RL(32), L(0), 32)

  'Apply the invIP permutation
  For a = 0 To 63
    BinBlock(a) = RL(m_IPInv(a))
  Next
  
  'Convert the binaries into a byte array
  Call Bin2Byte(BinBlock(), 8, BlockData())

End Sub
Private Static Sub DecryptBlock(BlockData() As Byte)

  Dim a As Long
  Dim i As Long
  Dim L(0 To 31) As Byte
  Dim R(0 To 31) As Byte
  Dim RL(0 To 63) As Byte
  Dim sBox(0 To 31) As Byte
  Dim LiRi(0 To 31) As Byte
  Dim ERxorK(0 To 47) As Byte
  Dim BinBlock(0 To 63) As Byte
  
  'Convert the block into a binary array
  '(I do believe this is the best solution
  'in VB for the DES algorithm, but it is
  'still slow as xxxx)
  Call Byte2Bin(BlockData(), 8, BinBlock())
  
  'Apply the IP permutation and split the
  'block into two halves, L[] and R[]
  For a = 0 To 31
    L(a) = BinBlock(m_IP(a))
    R(a) = BinBlock(m_IP(a + 32))
  Next
  
  'Apply the 16 subkeys on the block
  For i = 16 To 1 Step -1
    'E(R[i]) xor K[i]
    ERxorK(0) = R(31) Xor m_Key(0, i)
    ERxorK(1) = R(0) Xor m_Key(1, i)
    ERxorK(2) = R(1) Xor m_Key(2, i)
    ERxorK(3) = R(2) Xor m_Key(3, i)
    ERxorK(4) = R(3) Xor m_Key(4, i)
    ERxorK(5) = R(4) Xor m_Key(5, i)
    ERxorK(6) = R(3) Xor m_Key(6, i)
    ERxorK(7) = R(4) Xor m_Key(7, i)
    ERxorK(8) = R(5) Xor m_Key(8, i)
    ERxorK(9) = R(6) Xor m_Key(9, i)
    ERxorK(10) = R(7) Xor m_Key(10, i)
    ERxorK(11) = R(8) Xor m_Key(11, i)
    ERxorK(12) = R(7) Xor m_Key(12, i)
    ERxorK(13) = R(8) Xor m_Key(13, i)
    ERxorK(14) = R(9) Xor m_Key(14, i)
    ERxorK(15) = R(10) Xor m_Key(15, i)
    ERxorK(16) = R(11) Xor m_Key(16, i)
    ERxorK(17) = R(12) Xor m_Key(17, i)
    ERxorK(18) = R(11) Xor m_Key(18, i)
    ERxorK(19) = R(12) Xor m_Key(19, i)
    ERxorK(20) = R(13) Xor m_Key(20, i)
    ERxorK(21) = R(14) Xor m_Key(21, i)
    ERxorK(22) = R(15) Xor m_Key(22, i)
    ERxorK(23) = R(16) Xor m_Key(23, i)
    ERxorK(24) = R(15) Xor m_Key(24, i)
    ERxorK(25) = R(16) Xor m_Key(25, i)
    ERxorK(26) = R(17) Xor m_Key(26, i)
    ERxorK(27) = R(18) Xor m_Key(27, i)
    ERxorK(28) = R(19) Xor m_Key(28, i)
    ERxorK(29) = R(20) Xor m_Key(29, i)
    ERxorK(30) = R(19) Xor m_Key(30, i)
    ERxorK(31) = R(20) Xor m_Key(31, i)
    ERxorK(32) = R(21) Xor m_Key(32, i)
    ERxorK(33) = R(22) Xor m_Key(33, i)
    ERxorK(34) = R(23) Xor m_Key(34, i)
    ERxorK(35) = R(24) Xor m_Key(35, i)
    ERxorK(36) = R(23) Xor m_Key(36, i)
    ERxorK(37) = R(24) Xor m_Key(37, i)
    ERxorK(38) = R(25) Xor m_Key(38, i)
    ERxorK(39) = R(26) Xor m_Key(39, i)
    ERxorK(40) = R(27) Xor m_Key(40, i)
    ERxorK(41) = R(28) Xor m_Key(41, i)
    ERxorK(42) = R(27) Xor m_Key(42, i)
    ERxorK(43) = R(28) Xor m_Key(43, i)
    ERxorK(44) = R(29) Xor m_Key(44, i)
    ERxorK(45) = R(30) Xor m_Key(45, i)
    ERxorK(46) = R(31) Xor m_Key(46, i)
    ERxorK(47) = R(0) Xor m_Key(47, i)
    
    'Apply the s-boxes
    Call CopyMem(sBox(0), m_sBox(0, ERxorK(0), ERxorK(1), ERxorK(2), ERxorK(3), ERxorK(4), ERxorK(5)), 4)
    Call CopyMem(sBox(4), m_sBox(1, ERxorK(6), ERxorK(7), ERxorK(8), ERxorK(9), ERxorK(10), ERxorK(11)), 4)
    Call CopyMem(sBox(8), m_sBox(2, ERxorK(12), ERxorK(13), ERxorK(14), ERxorK(15), ERxorK(16), ERxorK(17)), 4)
    Call CopyMem(sBox(12), m_sBox(3, ERxorK(18), ERxorK(19), ERxorK(20), ERxorK(21), ERxorK(22), ERxorK(23)), 4)
    Call CopyMem(sBox(16), m_sBox(4, ERxorK(24), ERxorK(25), ERxorK(26), ERxorK(27), ERxorK(28), ERxorK(29)), 4)
    Call CopyMem(sBox(20), m_sBox(5, ERxorK(30), ERxorK(31), ERxorK(32), ERxorK(33), ERxorK(34), ERxorK(35)), 4)
    Call CopyMem(sBox(24), m_sBox(6, ERxorK(36), ERxorK(37), ERxorK(38), ERxorK(39), ERxorK(40), ERxorK(41)), 4)
    Call CopyMem(sBox(28), m_sBox(7, ERxorK(42), ERxorK(43), ERxorK(44), ERxorK(45), ERxorK(46), ERxorK(47)), 4)
    
    'L[i] xor P(R[i])
    LiRi(0) = L(0) Xor sBox(15)
    LiRi(1) = L(1) Xor sBox(6)
    LiRi(2) = L(2) Xor sBox(19)
    LiRi(3) = L(3) Xor sBox(20)
    LiRi(4) = L(4) Xor sBox(28)
    LiRi(5) = L(5) Xor sBox(11)
    LiRi(6) = L(6) Xor sBox(27)
    LiRi(7) = L(7) Xor sBox(16)
    LiRi(8) = L(8) Xor sBox(0)
    LiRi(9) = L(9) Xor sBox(14)
    LiRi(10) = L(10) Xor sBox(22)
    LiRi(11) = L(11) Xor sBox(25)
    LiRi(12) = L(12) Xor sBox(4)
    LiRi(13) = L(13) Xor sBox(17)
    LiRi(14) = L(14) Xor sBox(30)
    LiRi(15) = L(15) Xor sBox(9)
    LiRi(16) = L(16) Xor sBox(1)
    LiRi(17) = L(17) Xor sBox(7)
    LiRi(18) = L(18) Xor sBox(23)
    LiRi(19) = L(19) Xor sBox(13)
    LiRi(20) = L(20) Xor sBox(31)
    LiRi(21) = L(21) Xor sBox(26)
    LiRi(22) = L(22) Xor sBox(2)
    LiRi(23) = L(23) Xor sBox(8)
    LiRi(24) = L(24) Xor sBox(18)
    LiRi(25) = L(25) Xor sBox(12)
    LiRi(26) = L(26) Xor sBox(29)
    LiRi(27) = L(27) Xor sBox(5)
    LiRi(28) = L(28) Xor sBox(21)
    LiRi(29) = L(29) Xor sBox(10)
    LiRi(30) = L(30) Xor sBox(3)
    LiRi(31) = L(31) Xor sBox(24)
    
    'Prepare for next round
    Call CopyMem(L(0), R(0), 32)
    Call CopyMem(R(0), LiRi(0), 32)
  Next
  
  'Concatenate R[]L[]
  Call CopyMem(RL(0), R(0), 32)
  Call CopyMem(RL(32), L(0), 32)

  'Apply the invIP permutation
  For a = 0 To 63
    BinBlock(a) = RL(m_IPInv(a))
  Next
  
  'Convert the binaries into a byte array
  Call Bin2Byte(BinBlock(), 8, BlockData())

End Sub

Public Sub EncryptByte(ByteArray() As Byte, Optional Key As String)

  Dim a As Long
  Dim Offset As Long
  Dim OrigLen As Long
  Dim CipherLen As Long
  Dim CurrPercent As Long
  Dim NextPercent As Long
  Dim CurrBlock(0 To 7) As Byte
  Dim CipherBlock(0 To 7) As Byte
  
  'Set the key if provided
  If (Len(Key) > 0) Then Me.Key = Key
  
  'Get the size of the original array
  OrigLen = UBound(ByteArray) + 1
  
  'First we add 12 bytes (4 bytes for the
  'length and 8 bytes for the seed values
  'for the CBC routine), and the ciphertext
  'must be a multiple of 8 bytes
  CipherLen = OrigLen + 12
  If (CipherLen Mod 8 <> 0) Then
    CipherLen = CipherLen + 8 - (CipherLen Mod 8)
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
  
  'Encrypt the data in 64-bit blocks
  For Offset = 0 To (CipherLen - 1) Step 8
    'Get the next block of plaintext
    Call CopyMem(CurrBlock(0), ByteArray(Offset), 8)
    
    'XOR the plaintext with the previous
    'ciphertext (CBC, Cipher-Block Chaining)
    For a = 0 To 7
      CurrBlock(a) = CurrBlock(a) Xor CipherBlock(a)
    Next
    
    'Encrypt the block
    Call EncryptBlock(CurrBlock())
    
    'Store the block
    Call CopyMem(ByteArray(Offset), CurrBlock(0), 8)
    
    'Store the cipherblock (for CBC)
    Call CopyMem(CipherBlock(0), CurrBlock(0), 8)
    
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

  Dim a As Long
  Dim Offset As Long
  Dim OrigLen As Long
  Dim CipherLen As Long
  Dim CurrPercent As Long
  Dim NextPercent As Long
  Dim CurrBlock(0 To 7) As Byte
  Dim CipherBlock(0 To 7) As Byte
  
  'Set the new key if provided
  If (Len(Key) > 0) Then Me.Key = Key
  
  'Get the size of the ciphertext
  CipherLen = UBound(ByteArray) + 1
  
  'Decrypt the data in 64-bit blocks
  For Offset = 0 To (CipherLen - 1) Step 8
    'Get the next block of ciphertext
    Call CopyMem(CurrBlock(0), ByteArray(Offset), 8)
    
    'Decrypt the block
    Call DecryptBlock(CurrBlock())
    
    'XOR with the previous cipherblock
    For a = 0 To 7
      CurrBlock(a) = CurrBlock(a) Xor CipherBlock(a)
    Next
    
    'Store the current ciphertext to use
    'XOR with the next block plaintext
    Call CopyMem(CipherBlock(0), ByteArray(Offset), 8)
    
    'Store the block
    Call CopyMem(ByteArray(Offset), CurrBlock(0), 8)
  
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
  If (CipherLen - OrigLen > 19) Or (CipherLen - OrigLen < 12) Then
    Call Err.Raise(vbObjectError, , "Incorrect size descriptor in DES decryption")
  End If
  
  'Resize the bytearray to hold only the plaintext
  'and not the extra information added by the
  'encryption routine
  Call CopyMem(ByteArray(0), ByteArray(12), OrigLen)
  ReDim Preserve ByteArray(OrigLen - 1)

  'Make sure we return a 100% progress
  If (CurrPercent <> 100) Then RaiseEvent Progress(100)

End Sub
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
  
  'Convert the text into a byte array
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  'Encrypt the byte array
  Call EncryptByte(ByteArray(), Key)
  
  'Convert the byte array back to a string
  EncryptString = StrConv(ByteArray(), vbUnicode)

End Function

Public Function DecryptString(Text As String, Optional Key As String) As String

  Dim ByteArray() As Byte
  
  'Convert the text into a byte array
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  'Encrypt the byte array
  Call DecryptByte(ByteArray(), Key)
  
  'Convert the byte array back to a string
  DecryptString = StrConv(ByteArray(), vbUnicode)

End Function


Public Property Let Key(New_Value As String)

  Dim a As Long
  Dim i As Long
  Dim C(0 To 27) As Byte
  Dim D(0 To 27) As Byte
  Dim K(0 To 55) As Byte
  Dim CD(0 To 55) As Byte
  Dim Temp(0 To 1) As Byte
  Dim KeyBin(0 To 63) As Byte
  Dim KeySchedule(0 To 63) As Byte
  
  'Do nothing if the key is buffered
  If (m_KeyValue = New_Value) Then Exit Property
  
  'Store a string value of the buffered key
  m_KeyValue = New_Value
  
  'Convert the key to a binary array
  Call Byte2Bin(StrConv(New_Value, vbFromUnicode), IIf(Len(New_Value) > 8, 8, Len(New_Value)), KeyBin())

  'Apply the PC-2 permutation
  For a = 0 To 55
    KeySchedule(a) = KeyBin(m_PC1(a))
  Next
  
  'Split keyschedule into two halves, C[] and D[]
  Call CopyMem(C(0), KeySchedule(0), 28)
  Call CopyMem(D(0), KeySchedule(28), 28)
  
  'Calculate the key schedule (16 subkeys)
  For i = 1 To 16
    'Perform one or two cyclic left shifts on
    'both C[i-1] and D[i-1] to get C[i] and D[i]
    Call CopyMem(Temp(0), C(0), m_LeftShifts(i))
    Call CopyMem(C(0), C(m_LeftShifts(i)), 28 - m_LeftShifts(i))
    Call CopyMem(C(28 - m_LeftShifts(i)), Temp(0), m_LeftShifts(i))
    Call CopyMem(Temp(0), D(0), m_LeftShifts(i))
    Call CopyMem(D(0), D(m_LeftShifts(i)), 28 - m_LeftShifts(i))
    Call CopyMem(D(28 - m_LeftShifts(i)), Temp(0), m_LeftShifts(i))
    
    'Concatenate C[] and D[]
    Call CopyMem(CD(0), C(0), 28)
    Call CopyMem(CD(28), D(0), 28)
    
    'Apply the PC-2 permutation and store
    'the calculated subkey
    For a = 0 To 47
      m_Key(a, i) = CD(m_PC2(a))
    Next
  Next

End Property
Private Sub Class_Initialize()

  Dim i As Long
  Dim vE As Variant
  Dim vP As Variant
  Dim vIP As Variant
  Dim vPC1 As Variant
  Dim vPC2 As Variant
  Dim vIPInv As Variant
  Dim vSbox(0 To 7) As Variant
  
  'Initialize the permutation IP
  vIP = Array(58, 50, 42, 34, 26, 18, 10, 2, _
              60, 52, 44, 36, 28, 20, 12, 4, _
              62, 54, 46, 38, 30, 22, 14, 6, _
              64, 56, 48, 40, 32, 24, 16, 8, _
              57, 49, 41, 33, 25, 17, 9, 1, _
              59, 51, 43, 35, 27, 19, 11, 3, _
              61, 53, 45, 37, 29, 21, 13, 5, _
              63, 55, 47, 39, 31, 23, 15, 7)
  
  'Create the permutation IP
  For i = LBound(vIP) To UBound(vIP)
    m_IP(i) = (vIP(i) - 1)
  Next
  
  'Initialize the expansion function E
  vE = Array(32, 1, 2, 3, 4, 5, _
             4, 5, 6, 7, 8, 9, _
             8, 9, 10, 11, 12, 13, _
             12, 13, 14, 15, 16, 17, _
             16, 17, 18, 19, 20, 21, _
             20, 21, 22, 23, 24, 25, _
             24, 25, 26, 27, 28, 29, _
             28, 29, 30, 31, 32, 1)
  
  'Create the expansion array
  For i = LBound(vE) To UBound(vE)
    m_E(i) = (vE(i) - 1)
  Next
  
  'Initialize the PC1 function
  vPC1 = Array(57, 49, 41, 33, 25, 17, 9, _
               1, 58, 50, 42, 34, 26, 18, _
               10, 2, 59, 51, 43, 35, 27, _
               19, 11, 3, 60, 52, 44, 36, _
               63, 55, 47, 39, 31, 23, 15, _
               7, 62, 54, 46, 38, 30, 22, _
               14, 6, 61, 53, 45, 37, 29, _
               21, 13, 5, 28, 20, 12, 4)

  'Create the PC1 function
  For i = LBound(vPC1) To UBound(vPC1)
    m_PC1(i) = (vPC1(i) - 1)
  Next
  
  'Initialize the PC2 function
  vPC2 = Array(14, 17, 11, 24, 1, 5, _
               3, 28, 15, 6, 21, 10, _
               23, 19, 12, 4, 26, 8, _
               16, 7, 27, 20, 13, 2, _
               41, 52, 31, 37, 47, 55, _
               30, 40, 51, 45, 33, 48, _
               44, 49, 39, 56, 34, 53, _
               46, 42, 50, 36, 29, 32)
  
  'Create the PC2 function
  For i = LBound(vPC2) To UBound(vPC2)
    m_PC2(i) = (vPC2(i) - 1)
  Next
  
  'Initialize the inverted IP
  vIPInv = Array(40, 8, 48, 16, 56, 24, 64, 32, _
                 39, 7, 47, 15, 55, 23, 63, 31, _
                 38, 6, 46, 14, 54, 22, 62, 30, _
                 37, 5, 45, 13, 53, 21, 61, 29, _
                 36, 4, 44, 12, 52, 20, 60, 28, _
                 35, 3, 43, 11, 51, 19, 59, 27, _
                 34, 2, 42, 10, 50, 18, 58, 26, _
                 33, 1, 41, 9, 49, 17, 57, 25)
  
  'Create the inverted IP
  For i = LBound(vIPInv) To UBound(vIPInv)
    m_IPInv(i) = (vIPInv(i) - 1)
  Next
    
  'Initialize permutation P
  vP = Array(16, 7, 20, 21, _
             29, 12, 28, 17, _
             1, 15, 23, 26, _
             5, 18, 31, 10, _
             2, 8, 24, 14, _
             32, 27, 3, 9, _
             19, 13, 30, 6, _
             22, 11, 4, 25)

  'Create P
  For i = LBound(vP) To UBound(vP)
    m_P(i) = (vP(i) - 1)
  Next
  
  'Initialize the leftshifts array
  For i = 1 To 16
    Select Case i
    Case 1, 2, 9, 16
      m_LeftShifts(i) = 1
    Case Else
      m_LeftShifts(i) = 2
    End Select
  Next
  
  'Initialize the eight s-boxes
  vSbox(0) = Array(14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0, 7, _
                   0, 15, 7, 4, 14, 2, 13, 1, 10, 6, 12, 11, 9, 5, 3, 8, _
                   4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0, _
                   15, 12, 8, 2, 4, 9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 13)

  vSbox(1) = Array(15, 1, 8, 14, 6, 11, 3, 4, 9, 7, 2, 13, 12, 0, 5, 10, _
                   3, 13, 4, 7, 15, 2, 8, 14, 12, 0, 1, 10, 6, 9, 11, 5, _
                   0, 14, 7, 11, 10, 4, 13, 1, 5, 8, 12, 6, 9, 3, 2, 15, _
                   13, 8, 10, 1, 3, 15, 4, 2, 11, 6, 7, 12, 0, 5, 14, 9)

  vSbox(2) = Array(10, 0, 9, 14, 6, 3, 15, 5, 1, 13, 12, 7, 11, 4, 2, 8, _
                   13, 7, 0, 9, 3, 4, 6, 10, 2, 8, 5, 14, 12, 11, 15, 1, _
                   13, 6, 4, 9, 8, 15, 3, 0, 11, 1, 2, 12, 5, 10, 14, 7, _
                   1, 10, 13, 0, 6, 9, 8, 7, 4, 15, 14, 3, 11, 5, 2, 12)

  vSbox(3) = Array(7, 13, 14, 3, 0, 6, 9, 10, 1, 2, 8, 5, 11, 12, 4, 15, _
                   13, 8, 11, 5, 6, 15, 0, 3, 4, 7, 2, 12, 1, 10, 14, 9, _
                   10, 6, 9, 0, 12, 11, 7, 13, 15, 1, 3, 14, 5, 2, 8, 4, _
                   3, 15, 0, 6, 10, 1, 13, 8, 9, 4, 5, 11, 12, 7, 2, 14)

  vSbox(4) = Array(2, 12, 4, 1, 7, 10, 11, 6, 8, 5, 3, 15, 13, 0, 14, 9, _
                   14, 11, 2, 12, 4, 7, 13, 1, 5, 0, 15, 10, 3, 9, 8, 6, _
                   4, 2, 1, 11, 10, 13, 7, 8, 15, 9, 12, 5, 6, 3, 0, 14, _
                   11, 8, 12, 7, 1, 14, 2, 13, 6, 15, 0, 9, 10, 4, 5, 3)
  
  vSbox(5) = Array(12, 1, 10, 15, 9, 2, 6, 8, 0, 13, 3, 4, 14, 7, 5, 11, _
                   10, 15, 4, 2, 7, 12, 9, 5, 6, 1, 13, 14, 0, 11, 3, 8, _
                   9, 14, 15, 5, 2, 8, 12, 3, 7, 0, 4, 10, 1, 13, 11, 6, _
                   4, 3, 2, 12, 9, 5, 15, 10, 11, 14, 1, 7, 6, 0, 8, 13)
  
  vSbox(6) = Array(4, 11, 2, 14, 15, 0, 8, 13, 3, 12, 9, 7, 5, 10, 6, 1, _
                   13, 0, 11, 7, 4, 9, 1, 10, 14, 3, 5, 12, 2, 15, 8, 6, _
                   1, 4, 11, 13, 12, 3, 7, 14, 10, 15, 6, 8, 0, 5, 9, 2, _
                   6, 11, 13, 8, 1, 4, 10, 7, 9, 5, 0, 15, 14, 2, 3, 12)
  
  vSbox(7) = Array(13, 2, 8, 4, 6, 15, 11, 1, 10, 9, 3, 14, 5, 0, 12, 7, _
                   1, 15, 13, 8, 10, 3, 7, 4, 12, 5, 6, 11, 0, 14, 9, 2, _
                   7, 11, 4, 1, 9, 12, 14, 2, 0, 6, 10, 13, 15, 3, 5, 8, _
                   2, 1, 14, 7, 4, 10, 8, 13, 15, 12, 9, 0, 3, 5, 6, 11)
  
  Dim lBox As Long
  Dim lRow As Long
  Dim lColumn As Long
  Dim TheByte(0) As Byte
  Dim TheBin(0 To 7) As Byte
  Dim a As Byte, b As Byte, C As Byte, D As Byte, e As Byte, f As Byte
  
  'Create an optimized version of the s-boxes
  'this is not in the standard but much faster
  'than calculating the Row/Column index later
  For lBox = 0 To 7
    For a = 0 To 1
      For b = 0 To 1
        For C = 0 To 1
          For D = 0 To 1
            For e = 0 To 1
              For f = 0 To 1
                lRow = a * 2 + f
                lColumn = b * 8 + C * 4 + D * 2 + e
                TheByte(0) = vSbox(lBox)(lRow * 16 + lColumn)
                Call Byte2Bin(TheByte(), 1, TheBin())
                Call CopyMem(m_sBox(lBox, a, b, C, D, e, f), TheBin(4), 4)
              Next
            Next
          Next
        Next
      Next
    Next
  Next

End Sub




