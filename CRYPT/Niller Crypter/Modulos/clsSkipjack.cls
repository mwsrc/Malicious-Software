VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsSkipjack"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Skipjack Encryption/Decryption Class
'------------------------------------
'
'Information concerning the skipjack
'algorithm can be found at:
'http://csrc.nist.gov/encryption/skipjack-kea.htm
'
'Skipjack is property of the NSA.
'
'(c) 2000, Fredrik Qvarfort
'

Option Explicit

'For progress notifications
Event Progress(Percent As Long)

'To store a buffered key
Private m_KeyValue As String

'Key-dependant data
Private m_F(0 To 255) As Byte
Private m_Key(0 To 127) As Byte

Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Public Function DecryptByte(ByteArray() As Byte, Optional Key As String) As String

  Dim i As Long
  Dim u As Long
  Dim k As Long
  Dim temp As Byte
  Dim Round As Long
  Dim Offset As Long
  Dim OrigLen As Long
  Dim CipherLen As Long
  Dim G(0 To 5) As Byte
  Dim NextPercent As Long
  Dim CurrPercent As Long
  Dim Counter(0 To 32) As Byte
  Dim w(0 To 3, 0 To 33) As Integer
  
  'Set the new key
  If (Len(Key) > 0) Then Me.Key = Key
  
  'Get the size of the bytearray
  CipherLen = UBound(ByteArray) + 1
  
  'Switch bytes to convert bytes into integers
  For Offset = 0 To (CipherLen - 1) Step 2
    temp = ByteArray(Offset)
    ByteArray(Offset) = ByteArray(Offset + 1)
    ByteArray(Offset + 1) = temp
  Next
  
  'Decrypt the data 8-bytes at a time
  For Offset = 0 To (CipherLen - 1) Step 8
    'Read the next 4 integers from the bytearray
    Call CopyMem(w(0, 32), ByteArray(Offset), 8)
    
    k = 32
    u = 31
    For i = 0 To 32
      Counter(i) = i + 1
    Next
    
    For Round = 1 To 2
      'Execute Rule B(inv)
      For i = 1 To 8
        Call CopyMem(G(4), w(1, k), 2)
        G(3) = m_F(G(5) Xor m_Key(4 * u + 3)) Xor G(4)
        G(2) = m_F(G(3) Xor m_Key(4 * u + 2)) Xor G(5)
        G(0) = m_F(G(2) Xor m_Key(4 * u + 1)) Xor G(3)
        G(1) = m_F(G(0) Xor m_Key(4 * u)) Xor G(2)
        Call CopyMem(w(0, k - 1), G(0), 2)
        w(1, k - 1) = w(0, k - 1) Xor w(2, k) Xor Counter(k - 1)
        w(2, k - 1) = w(3, k)
        w(3, k - 1) = w(0, k)
        u = u - 1
        k = k - 1
      Next
      
      'Execute Rule A(inv)
      For i = 1 To 8
        Call CopyMem(G(4), w(1, k), 2)
        G(3) = m_F(G(5) Xor m_Key(4 * u + 3)) Xor G(4)
        G(2) = m_F(G(3) Xor m_Key(4 * u + 2)) Xor G(5)
        G(0) = m_F(G(2) Xor m_Key(4 * u + 1)) Xor G(3)
        G(1) = m_F(G(0) Xor m_Key(4 * u)) Xor G(2)
        Call CopyMem(w(0, k - 1), G(0), 2)
        w(1, k - 1) = w(2, k)
        w(2, k - 1) = w(3, k)
        w(3, k - 1) = w(0, k) Xor w(1, k) Xor Counter(k - 1)
        u = u - 1
        k = k - 1
      Next
    Next
    
    'XOR with the previous encrypted data
    w(0, 0) = w(0, 0) Xor w(0, 33)
    w(1, 0) = w(1, 0) Xor w(1, 33)
    w(2, 0) = w(2, 0) Xor w(2, 33)
    w(3, 0) = w(3, 0) Xor w(3, 33)
    
    'Store the updated integer values in the bytearray
    Call CopyMem(ByteArray(Offset), w(0, 0), 8)
    
    'Update the progress if neccessary
    If (Offset >= NextPercent) Then
      CurrPercent = Int((Offset / CipherLen) * 100)
      NextPercent = (CipherLen * ((CurrPercent + 1) / 100)) + 1
      RaiseEvent Progress(CurrPercent)
    End If
    
    'Save the encrypted data for later use
    'where blocks are XOR'ed (CBC, Cipher-
    'Block Chaining) for increased security
    Call CopyMem(w(0, 33), w(0, 32), 8)
  Next
  
  'Switch bytes to convert bytes into integers
  For Offset = 0 To (CipherLen - 1) Step 2
    temp = ByteArray(Offset)
    ByteArray(Offset) = ByteArray(Offset + 1)
    ByteArray(Offset + 1) = temp
  Next
  
  'Get the size of the original array
  Call CopyMem(OrigLen, ByteArray(8), 4)
  
  'Make sure OrigLen is a reasonable value,
  'if we used the wrong key the next couple
  'of statements could be dangerous (GPF)
  If (CipherLen - OrigLen > 19) Or (CipherLen - OrigLen < 12) Then
    Call Err.Raise(vbObjectError, , "Incorrect size descriptor in Skipjack decryption")
  End If
  
  'Resize the bytearray to hold only the plaintext
  'and not the extra information added by the
  'encryption routine
  Call CopyMem(ByteArray(0), ByteArray(12), OrigLen)
  ReDim Preserve ByteArray(OrigLen - 1)
  
  'Make sure we raise a 100% progress event
  If (CurrPercent <> 100) Then RaiseEvent Progress(100)
  
End Function
Public Function DecryptString(Text As String, Optional Key As String) As String

  Dim ByteArray() As Byte
  
  'Convert the string into a bytearray
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  'Encrypt the bytearray
  Call DecryptByte(ByteArray(), Key)
  
  'Convert the bytearray back to a string
  DecryptString = StrConv(ByteArray(), vbUnicode)
  
End Function

Public Sub EncryptByte(ByteArray() As Byte, Optional Key As String)

  Dim i As Long
  Dim k As Long
  Dim temp As Byte
  Dim Round As Long
  Dim Offset As Long
  Dim OrigLen As Long
  Dim Counter As Long
  Dim G(0 To 5) As Byte
  Dim CipherLen As Long
  Dim NextPercent As Long
  Dim CurrPercent As Long
  Dim w(0 To 3, 0 To 32) As Integer
  
  'Be sure the key is initialized
  If (Len(Key) > 0) Then Me.Key = Key
  
  'Save the size of the bytearray for future
  'reference (for the length descriptor)
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
  
  'Switch array of bytes into array of integers
  For Offset = 0 To (CipherLen - 1) Step 2
    temp = ByteArray(Offset)
    ByteArray(Offset) = ByteArray(Offset + 1)
    ByteArray(Offset + 1) = temp
  Next
  
  'Encrypt the data 8-bytes at a time
  For Offset = 0 To (CipherLen - 1) Step 8
    'Read the next 4 integers from the bytearray
    Call CopyMem(w(0, 0), ByteArray(Offset), 8)
    
    'XOR the plaintext with the previous
    'ciphertext (CBC, Cipher-Block Chaining)
    w(0, 0) = w(0, 0) Xor w(0, 32)
    w(1, 0) = w(1, 0) Xor w(1, 32)
    w(2, 0) = w(2, 0) Xor w(2, 32)
    w(3, 0) = w(3, 0) Xor w(3, 32)
    
    k = 0
    Counter = 1
    
    For Round = 1 To 2
      'Execute RULE A
      For i = 1 To 8
        Call CopyMem(G(0), w(0, k), 2)
        G(2) = m_F(G(0) Xor m_Key(4 * k)) Xor G(1)
        G(3) = m_F(G(2) Xor m_Key(4 * k + 1)) Xor G(0)
        G(5) = m_F(G(3) Xor m_Key(4 * k + 2)) Xor G(2)
        G(4) = m_F(G(5) Xor m_Key(4 * k + 3)) Xor G(3)
        Call CopyMem(w(1, k + 1), G(4), 2)
        w(0, k + 1) = w(1, k + 1) Xor w(3, k) Xor Counter
        w(2, k + 1) = w(1, k)
        w(3, k + 1) = w(2, k)
        Counter = Counter + 1
        k = k + 1
      Next
    
      'Execute RULE B
      For i = 1 To 8
        Call CopyMem(G(0), w(0, k), 2)
        G(2) = m_F(G(0) Xor m_Key(4 * k)) Xor G(1)
        G(3) = m_F(G(2) Xor m_Key(4 * k + 1)) Xor G(0)
        G(5) = m_F(G(3) Xor m_Key(4 * k + 2)) Xor G(2)
        G(4) = m_F(G(5) Xor m_Key(4 * k + 3)) Xor G(3)
        Call CopyMem(w(1, k + 1), G(4), 2)
        w(0, k + 1) = w(3, k)
        w(2, k + 1) = w(0, k) Xor w(1, k) Xor Counter
        w(3, k + 1) = w(2, k)
        Counter = Counter + 1
        k = k + 1
      Next
    Next

    'Store the new integer values into the array
    Call CopyMem(ByteArray(Offset), w(0, 32), 8)
  
    'Update the progress if neccessary
    If (Offset >= NextPercent) Then
      CurrPercent = Int((Offset / CipherLen) * 100)
      NextPercent = (CipherLen * ((CurrPercent + 1) / 100)) + 1
      RaiseEvent Progress(CurrPercent)
    End If
  Next
  
  'Switch array of integers back to array of bytes
  For Offset = 0 To (CipherLen - 1) Step 2
    temp = ByteArray(Offset)
    ByteArray(Offset) = ByteArray(Offset + 1)
    ByteArray(Offset + 1) = temp
  Next
  
  'Make sure we raise a 100% progress event
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
  
  'Convert the string into a bytearray
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  'Encrypt the bytearray
  Call EncryptByte(ByteArray(), Key)
  
  'Convert the bytearray back to a string
  EncryptString = StrConv(ByteArray(), vbUnicode)
  
End Function

Public Property Let Key(New_Value As String)

  Dim i As Long
  Dim Pass() As Byte
  Dim PassLen As Long
  
  'Do nothing if the new key is the same as the last
  'one used because that it is already initialized
  If (New_Value = m_KeyValue) Then Exit Property
  
  'The key must have at least one character
  If (Len(New_Value) = 0) Then
    Err.Raise vbObjectError, , "Invalid key given to SkipJack encryption or decryption (Zero Length)"
  End If
  
  'Convert the password into a bytearray
  PassLen = Len(New_Value)
  Pass() = StrConv(New_Value, vbFromUnicode)
  
  'Extract a 128-bit key from the bytearray
  For i = 0 To 127
    m_Key(i) = Pass(i Mod PassLen)
  Next

  'Store a copy of the key as string value to
  'show that this key is buffered
  m_KeyValue = New_Value
  
End Property
Private Sub Class_Initialize()

  Dim a As Long
  Dim Ftable As Variant
  
  'Initialize the F-table
  Ftable = Array("A3", "D7", "09", "83", "F8", "48", "F6", "F4", "B3", "21", "15", "78", "99", "B1", "AF", "F9", _
                 "E7", "2D", "4D", "8A", "CE", "4C", "CA", "2E", "52", "95", "D9", "1E", "4E", "38", "44", "28", _
                 "0A", "DF", "02", "A0", "17", "F1", "60", "68", "12", "B7", "7A", "C3", "E9", "FA", "3D", "53", _
                 "96", "84", "6B", "BA", "F2", "63", "9A", "19", "7C", "AE", "E5", "F5", "F7", "16", "6A", "A2", _
                 "39", "B6", "7B", "0F", "C1", "93", "81", "1B", "EE", "B4", "1A", "EA", "D0", "91", "2F", "B8", _
                 "55", "B9", "DA", "85", "3F", "41", "BF", "E0", "5A", "58", "80", "5F", "66", "0B", "D8", "90", _
                 "35", "D5", "C0", "A7", "33", "06", "65", "69", "45", "00", "94", "56", "6D", "98", "9B", "76", _
                 "97", "FC", "B2", "C2", "B0", "FE", "DB", "20", "E1", "EB", "D6", "E4", "DD", "47", "4A", "1D", _
                 "42", "ED", "9E", "6E", "49", "3C", "CD", "43", "27", "D2", "07", "D4", "DE", "C7", "67", "18", _
                 "89", "CB", "30", "1F", "8D", "C6", "8F", "AA", "C8", "74", "DC", "C9", "5D", "5C", "31", "A4", _
                 "70", "88", "61", "2C", "9F", "0D", "2B", "87", "50", "82", "54", "64", "26", "7D", "03", "40", _
                 "34", "4B", "1C", "73", "D1", "C4", "FD", "3B", "CC", "FB", "7F", "AB", "E6", "3E", "5B", "A5", _
                 "AD", "04", "23", "9C", "14", "51", "22", "F0", "29", "79", "71", "7E", "FF", "8C", "0E", "E2", _
                 "0C", "EF", "BC", "72", "75", "6F", "37", "A1", "EC", "D3", "8E", "62", "8B", "86", "10", "E8", _
                 "08", "77", "11", "BE", "92", "4F", "24", "C5", "32", "36", "9D", "CF", "F3", "A6", "BB", "AC", _
                 "5E", "6C", "A9", "13", "57", "25", "B5", "E3", "BD", "A8", "3A", "01", "05", "59", "2A", "46")
  
  'Convert the F-table into a linear byte
  'array for faster access later
  For a = 0 To 255
    m_F(a) = Val("&H" & Ftable(a))
  Next
  
  'Initialize the CBC (random) seed values to work
  'as a starting ground for the CRC XOR (this is
  'optional but must be the same for the both
  'transmitter and receiver)
  'm_CBCSeed(0) = -923
  'm_CBCSeed(1) = 19843
  'm_CBCSeed(2) = 154
  'm_CBCSeed(3) = 8123

End Sub
