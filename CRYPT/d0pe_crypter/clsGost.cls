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
'Gost Encryption/Decryption Class
'------------------------------------
'
'Information concerning the Gost
'algorithm can be found at:
'http://www.jetico.sci.fi/index.htm#/gost.htm
'
'(c) 2000, Fredrik Qvarfort
'
Option Explicit

Event Progress(Percent As Long)

Private m_KeyValue As String

Private K(1 To 8) As Long
Private k87(0 To 255) As Byte
Private k65(0 To 255) As Byte
Private k43(0 To 255) As Byte
Private k21(0 To 255) As Byte
Private sBox(0 To 7, 0 To 255) As Byte

'Allow running more optimized code
'while in compiled mode and still
'be able to run the code in the IDE
Private m_RunningCompiled As Boolean

Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Sub addLongs Lib "myDLL" (ByRef number1 As Long, ByVal number2 As Long)

Private Static Sub DecryptBlock(LeftWord As Long, RightWord As Long)

  Dim i As Long
  
  RightWord = RightWord Xor F(LeftWord, K(1))
  LeftWord = LeftWord Xor F(RightWord, K(2))
  RightWord = RightWord Xor F(LeftWord, K(3))
  LeftWord = LeftWord Xor F(RightWord, K(4))
  RightWord = RightWord Xor F(LeftWord, K(5))
  LeftWord = LeftWord Xor F(RightWord, K(6))
  RightWord = RightWord Xor F(LeftWord, K(7))
  LeftWord = LeftWord Xor F(RightWord, K(8))
  For i = 1 To 3
    RightWord = RightWord Xor F(LeftWord, K(8))
    LeftWord = LeftWord Xor F(RightWord, K(7))
    RightWord = RightWord Xor F(LeftWord, K(6))
    LeftWord = LeftWord Xor F(RightWord, K(5))
    RightWord = RightWord Xor F(LeftWord, K(4))
    LeftWord = LeftWord Xor F(RightWord, K(3))
    RightWord = RightWord Xor F(LeftWord, K(2))
    LeftWord = LeftWord Xor F(RightWord, K(1))
  Next

End Sub
Private Static Sub EncryptBlock(LeftWord As Long, RightWord As Long)

  Dim i As Long
  
  For i = 1 To 3
    RightWord = RightWord Xor F(LeftWord, K(1))
    LeftWord = LeftWord Xor F(RightWord, K(2))
    RightWord = RightWord Xor F(LeftWord, K(3))
    LeftWord = LeftWord Xor F(RightWord, K(4))
    RightWord = RightWord Xor F(LeftWord, K(5))
    LeftWord = LeftWord Xor F(RightWord, K(6))
    RightWord = RightWord Xor F(LeftWord, K(7))
    LeftWord = LeftWord Xor F(RightWord, K(8))
  Next
  RightWord = RightWord Xor F(LeftWord, K(8))
  LeftWord = LeftWord Xor F(RightWord, K(7))
  RightWord = RightWord Xor F(LeftWord, K(6))
  LeftWord = LeftWord Xor F(RightWord, K(5))
  RightWord = RightWord Xor F(LeftWord, K(4))
  LeftWord = LeftWord Xor F(RightWord, K(3))
  RightWord = RightWord Xor F(LeftWord, K(2))
  LeftWord = LeftWord Xor F(RightWord, K(1))

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

Private Static Function F(R As Long, K As Long) As Long

  Dim x As Long
  Dim xb(0 To 3) As Byte
  Dim xx(0 To 3) As Byte
  Dim a As Byte, b As Byte, C As Byte, D As Byte
  
  If (m_RunningCompiled) Then
    x = R + K
  Else
    x = UnsignedAdd(R, K)
  End If
  
  'Extract byte sequence
  D = x And &HFF
  x = x \ 256
  C = x And &HFF
  x = x \ 256
  b = x And &HFF
  x = x \ 256
  a = x And &HFF
  
  'Key-dependant substutions
  xb(0) = k21(a)
  xb(1) = k43(b)
  xb(2) = k65(C)
  xb(3) = k87(D)
  
  'LeftShift 11 bits
  xx(0) = ((xb(3) And 31) * 8) Or ((xb(2) And 224) \ 32)
  xx(1) = ((xb(0) And 31) * 8) Or ((xb(3) And 224) \ 32)
  xx(2) = ((xb(1) And 31) * 8) Or ((xb(0) And 224) \ 32)
  xx(3) = ((xb(2) And 31) * 8) Or ((xb(1) And 224) \ 32)
  Call CopyMem(F, xx(0), 4)

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

Public Function EncryptString(Text As String, Optional Key As String) As String

  Dim ByteArray() As Byte
  
  'Convert the text into a byte array
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  'Encrypt the byte array
  Call EncryptByte(ByteArray(), Key)
  
  'Convert the byte array back to a string
  EncryptString = StrConv(ByteArray(), vbUnicode)

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


Public Function EncryptByte(ByteArray() As Byte, Optional Key As String) As String

  Dim Offset As Long
  Dim OrigLen As Long
  Dim LeftWord As Long
  Dim RightWord As Long
  Dim CipherLen As Long
  Dim CipherLeft As Long
  Dim CipherRight As Long
  Dim CurrPercent As Long
  Dim NextPercent As Long
  
  'Set the key if one was passed to the function
  If (Len(Key) > 0) Then Me.Key = Key
  
  'Get the length of the plaintext
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
  
  'Encrypt the data
  For Offset = 0 To (CipherLen - 1) Step 8
    'Get the next block of plaintext
    Call GetWord(LeftWord, ByteArray(), Offset)
    Call GetWord(RightWord, ByteArray(), Offset + 4)
    
    'XOR the plaintext with the previous
    'ciphertext (CBC, Cipher-Block Chaining)
    LeftWord = LeftWord Xor CipherLeft
    RightWord = RightWord Xor CipherRight
    
    'Encrypt the block
    Call EncryptBlock(LeftWord, RightWord)
    
    'Store the block
    Call PutWord(LeftWord, ByteArray(), Offset)
    Call PutWord(RightWord, ByteArray(), Offset + 4)
    
    'Store the cipherblocks (for CBC)
    CipherLeft = LeftWord
    CipherRight = RightWord
    
    'Update the progress if neccessary
    If (Offset >= NextPercent) Then
      CurrPercent = Int((Offset / CipherLen) * 100)
      NextPercent = (CipherLen * ((CurrPercent + 1) / 100)) + 1
      RaiseEvent Progress(CurrPercent)
    End If
  Next
  
  'Make sure we return a 100% progress
  If (CurrPercent <> 100) Then RaiseEvent Progress(100)

End Function
Public Function DecryptByte(ByteArray() As Byte, Optional Key As String) As String

  Dim Offset As Long
  Dim OrigLen As Long
  Dim LeftWord As Long
  Dim RightWord As Long
  Dim CipherLen As Long
  Dim CipherLeft As Long
  Dim CipherRight As Long
  Dim CurrPercent As Long
  Dim NextPercent As Long
  
  'Set the key if one was passed to the function
  If (Len(Key) > 0) Then Me.Key = Key
  
  'Get the size of the ciphertext
  CipherLen = UBound(ByteArray) + 1
  
  'Decrypt the data in 64-bit blocks
  For Offset = 0 To (CipherLen - 1) Step 8
    'Get the next block
    Call GetWord(LeftWord, ByteArray(), Offset)
    Call GetWord(RightWord, ByteArray(), Offset + 4)
    
    'Decrypt the block
    Call DecryptBlock(RightWord, LeftWord)
    
    'XOR with the previous cipherblock
    LeftWord = LeftWord Xor CipherLeft
    RightWord = RightWord Xor CipherRight
    
    'Store the current ciphertext to use
    'XOR with the next block plaintext
    Call GetWord(CipherLeft, ByteArray(), Offset)
    Call GetWord(CipherRight, ByteArray(), Offset + 4)
    
    'Store the encrypted block
    Call PutWord(LeftWord, ByteArray(), Offset)
    Call PutWord(RightWord, ByteArray(), Offset + 4)
    
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
    Call Err.Raise(vbObjectError, , "Incorrect size descriptor in Gost decryption")
  End If
  
  'Resize the bytearray to hold only the plaintext
  'and not the extra information added by the
  'encryption routine
  Call CopyMem(ByteArray(0), ByteArray(12), OrigLen)
  ReDim Preserve ByteArray(OrigLen - 1)

  'Make sure we return a 100% progress
  If (CurrPercent <> 100) Then RaiseEvent Progress(100)

End Function

Public Property Let Key(New_Value As String)

  Dim a As Long
  Dim Key() As Byte
  Dim KeyLen As Long
  Dim ByteArray() As Byte
  
  'Do nothing if no change was made
  If (m_KeyValue = New_Value) Then Exit Property
  
  'Convert the key into a bytearray
  KeyLen = Len(New_Value)
  Key() = StrConv(New_Value, vbFromUnicode)
  
  'Create a 32-byte key
  ReDim ByteArray(0 To 31)
  For a = 0 To 31
    ByteArray(a) = Key(a Mod KeyLen)
  Next
  
  'Create the key
  Call CopyMem(K(1), ByteArray(0), 32)
  
  'Show this key is buffered
  m_KeyValue = New_Value
  
End Property
Private Sub Class_Initialize()

  Dim a As Long
  Dim b As Long
  Dim C As Long
  Dim LeftWord As Long
  Dim S(0 To 7) As Variant
  
  'We need to check if we are running in compiled
  '(EXE) mode or in the IDE, this will allow us to
  'use optimized code with unsigned integers in
  'compiled mode without any overflow errors when
  'running the code in the IDE
  On Local Error Resume Next
  m_RunningCompiled = ((2147483647 + 1) < 0)
  
  'Initialize s-boxes
  S(0) = Array(6, 5, 1, 7, 14, 0, 4, 10, 11, 9, 3, 13, 8, 12, 2, 15)
  S(1) = Array(14, 13, 9, 0, 8, 10, 12, 4, 7, 15, 6, 11, 3, 1, 5, 2)
  S(2) = Array(6, 5, 1, 7, 2, 4, 10, 0, 11, 13, 14, 3, 8, 12, 15, 9)
  S(3) = Array(8, 7, 3, 9, 6, 4, 14, 5, 2, 13, 0, 12, 1, 11, 10, 15)
  S(4) = Array(10, 9, 6, 11, 5, 1, 8, 4, 0, 13, 7, 2, 14, 3, 15, 12)
  S(5) = Array(5, 3, 0, 6, 11, 13, 4, 14, 10, 7, 1, 12, 2, 8, 15, 9)
  S(6) = Array(2, 1, 12, 3, 11, 13, 15, 7, 10, 6, 9, 14, 0, 8, 4, 5)
  S(7) = Array(6, 5, 1, 7, 8, 9, 4, 2, 15, 3, 13, 12, 10, 14, 11, 0)

  'Convert the variants to a 2-dimensional array
  For a = 0 To 15
    For b = 0 To 7
      sBox(b, a) = S(b)(a)
    Next
  Next
  
  'Calculate the substitutions
  For a = 0 To 255
    k87(a) = lBSL(CLng(sBox(7, lBSR(a, 4))), 4) Or sBox(6, a And 15)
    k65(a) = lBSL(CLng(sBox(5, lBSR(a, 4))), 4) Or sBox(4, a And 15)
    k43(a) = lBSL(CLng(sBox(3, lBSR(a, 4))), 4) Or sBox(2, a And 15)
    k21(a) = lBSL(CLng(sBox(1, lBSR(a, 4))), 4) Or sBox(0, a And 15)
  Next

End Sub

