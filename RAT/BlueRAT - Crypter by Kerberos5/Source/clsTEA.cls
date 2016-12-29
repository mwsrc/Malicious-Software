VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsTEA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'TEA Encryption/Decryption Class
'------------------------------------
'
'Information concerning the TEA
'algorithm can be found at:
'http://www.cl.cam.ac.uk/Research/Papers/djw-rmn/djw-rmn-tea.html
'
'(c) 2000, Fredrik Qvarfort
'

Option Explicit

Event Progress(Percent As Long)

Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Private m_RunningCompiled As Boolean

Private Tk(3) As Long
Private Const ROUNDS = 32
Private Const Delta = &H9E3779B9
Private Const DecryptSum = &HC6EF3720  'Delta * Rounds (precalculated to prevent overflow error)
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
Public Sub EncryptByte(ByteArray() As Byte, Optional Key As String)

  Dim x As Long
  Dim sum As Long
  Dim Offset As Long
  Dim OrigLen As Long
  Dim LeftWord As Long
  Dim RightWord As Long
  Dim CipherLen As Long
  Dim CipherLeft As Long
  Dim CipherRight As Long
  Dim CurrPercent As Long
  Dim NextPercent As Long
  Dim Sl As Long
  Dim Sr As Long
  
  'Set the new if provided
  If (Len(Key) > 0) Then Me.Key = Key
  
  'Get the length of the original array
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
    'Get the next 64-bit block as two longs
    Call GetWord(LeftWord, ByteArray(), Offset)
    Call GetWord(RightWord, ByteArray(), Offset + 4)
    
    'XOR the plaintext with the previous
    'ciphertext (CBC, Cipher-Block Chaining)
    LeftWord = LeftWord Xor CipherLeft
    RightWord = RightWord Xor CipherRight
    
    'Encrypt the block
    sum = 0
    For x = 1 To ROUNDS
      If (m_RunningCompiled) Then
        sum = (sum + Delta)
        Sr = ((RightWord And &HFFFFFFE0) \ 32) And &H7FFFFFF
        LeftWord = LeftWord + (((RightWord * 16) + Tk(0)) Xor (RightWord + sum) Xor (Sr + Tk(1)))
        Sl = ((LeftWord And &HFFFFFFE0) \ 32) And &H7FFFFFF
        RightWord = RightWord + (((LeftWord * 16) + Tk(2)) Xor (LeftWord + sum) Xor (Sl + Tk(3)))
      Else
        sum = UnsignedAdd(sum, Delta)
        LeftWord = UnsignedAdd(LeftWord, (UnsignedAdd(LShift4(RightWord), Tk(0)) Xor UnsignedAdd(RightWord, sum) Xor UnsignedAdd(RShift5(RightWord), Tk(1))))
        RightWord = UnsignedAdd(RightWord, (UnsignedAdd(LShift4(LeftWord), Tk(2)) Xor UnsignedAdd(LeftWord, sum) Xor UnsignedAdd(RShift5(LeftWord), Tk(3))))
      End If
    Next
    
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

End Sub
Private Static Function LShift4(Data1 As Long) As Long

  Dim x1(0 To 3) As Byte
  Dim xx(0 To 3) As Byte
  
  Call CopyMem(x1(0), Data1, 4)
  xx(0) = ((x1(0) And 15) * 16)
  xx(1) = ((x1(1) And 15) * 16) Or ((x1(0) And 240) \ 16)
  xx(2) = ((x1(2) And 15) * 16) Or ((x1(1) And 240) \ 16)
  xx(3) = ((x1(3) And 15) * 16) Or ((x1(2) And 240) \ 16)
  Call CopyMem(LShift4, xx(0), 4)
  
End Function
Private Static Function RShift5(Data1 As Long) As Long

  Dim x1(0 To 3) As Byte
  Dim xx(0 To 3) As Byte
  
  Call CopyMem(x1(0), Data1, 4)
  xx(0) = ((x1(0) And 224) \ 32) Or ((x1(1) And 31) * 8)
  xx(1) = ((x1(1) And 224) \ 32) Or ((x1(2) And 31) * 8)
  xx(2) = ((x1(2) And 224) \ 32) Or ((x1(3) And 31) * 8)
  xx(3) = ((x1(3) And 224) \ 32)
  Call CopyMem(RShift5, xx(0), 4)
  
End Function


Public Sub DecryptByte(ByteArray() As Byte, Optional Key As String)

  Dim x As Long
  Dim sum As Long
  Dim Offset As Long
  Dim OrigLen As Long
  Dim LeftWord As Long
  Dim RightWord As Long
  Dim CipherLen As Long
  Dim CipherLeft As Long
  Dim CipherRight As Long
  Dim CurrPercent As Long
  Dim NextPercent As Long
  
  Dim Sr As Long
  Dim Sl As Long
  
  'Set the new key if provided
  If (Len(Key) > 0) Then Me.Key = Key
  
  'Get the length of the bytearray
  CipherLen = UBound(ByteArray) + 1
  
  'Tk(0) = 16
  'Tk(1) = 16
  'Tk(2) = 16
  'Tk(3) = 16
  
  For Offset = 0 To (CipherLen - 1) Step 8
    'Get the next block of ciphertext
    Call GetWord(LeftWord, ByteArray(), Offset)
    Call GetWord(RightWord, ByteArray(), Offset + 4)
    
    sum = DecryptSum
    For x = 1 To ROUNDS
      If (m_RunningCompiled) Then
        Sl = ((LeftWord And &HFFFFFFE0) \ 32) And &H7FFFFFF
        RightWord = RightWord - (((LeftWord * 16) + Tk(2)) Xor (LeftWord + sum) Xor (Sl + Tk(3)))
        Sr = ((RightWord And &HFFFFFFE0) \ 32) And &H7FFFFFF
        LeftWord = LeftWord - (((RightWord * 16) + Tk(0)) Xor (RightWord + sum) Xor (Sr + Tk(1)))
        sum = (sum - Delta)
      Else
        RightWord = UnsignedDel(RightWord, (UnsignedAdd(LShift4(LeftWord), Tk(2)) Xor UnsignedAdd(LeftWord, sum) Xor UnsignedAdd(RShift5(LeftWord), Tk(3))))
        LeftWord = UnsignedDel(LeftWord, (UnsignedAdd(LShift4(RightWord), Tk(0)) Xor UnsignedAdd(RightWord, sum) Xor UnsignedAdd(RShift5(RightWord), Tk(1))))
        sum = UnsignedDel(sum, Delta)
      End If
    Next
    
    'XOR with the previous cipherblock
    LeftWord = LeftWord Xor CipherLeft
    RightWord = RightWord Xor CipherRight
    
    'Store the current ciphertext to use
    'XOR with the next block plaintext
    Call GetWord(CipherLeft, ByteArray(), Offset)
    Call GetWord(CipherRight, ByteArray(), Offset + 4)
    
    'Store the block
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
    Call Err.Raise(vbObjectError, , "Incorrect size descriptor in TEA decryption")
  End If
  
  'Resize the bytearray to hold only the plaintext
  'and not the extra information added by the
  'encryption routine
  Call CopyMem(ByteArray(0), ByteArray(12), OrigLen)
  ReDim Preserve ByteArray(OrigLen - 1)
  
  'Make sure we return a 100% progress
  If (CurrPercent <> 100) Then RaiseEvent Progress(100)

End Sub
Public Property Let Key(New_Value As String)

  Dim K() As Byte
  Dim w(0 To 3) As Byte
  
  'Convert the key to a bytearray and if
  'needed resize it to be exactly 128-bit
  K() = StrConv(New_Value, vbFromUnicode)
  If (Len(New_Value) < 16) Then ReDim Preserve K(15)
  
  w(0) = K(3)
  w(1) = K(2)
  w(2) = K(1)
  w(3) = K(0)
  Call CopyMem(Tk(0), w(0), 4)

  w(0) = K(7)
  w(1) = K(6)
  w(2) = K(5)
  w(3) = K(4)
  Call CopyMem(Tk(1), w(0), 4)

  w(0) = K(11)
  w(1) = K(10)
  w(2) = K(9)
  w(3) = K(8)
  Call CopyMem(Tk(2), w(0), 4)

  w(0) = K(15)
  w(1) = K(14)
  w(2) = K(13)
  w(3) = K(12)
  Call CopyMem(Tk(3), w(0), 4)

End Property
Private Sub Class_Initialize()
  
  'We need to check if we are running in compiled
  '(EXE) mode or in the IDE, this will allow us to
  'use optimized code with unsigned integers in
  'compiled mode without any overflow errors when
  'running the code in the IDE
  On Local Error Resume Next
  m_RunningCompiled = ((2147483647 + 1) < 0)
  
End Sub

