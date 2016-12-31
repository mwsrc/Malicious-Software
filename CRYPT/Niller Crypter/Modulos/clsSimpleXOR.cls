VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsSimpleXOR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'SimpleXOR Encryption/Decryption Class
'------------------------------------
'
'Information concerning encryption using
'XOR can be found at:
'http://tuath.pair.com/docs/xorencrypt.html
'
'(c) 2000, Fredrik Qvarfort
'
Option Explicit

Private m_Key() As Byte
Private m_KeyLen As Long
Private m_KeyValue As String

Event Progress(Percent As Long)

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

Public Sub DecryptByte(ByteArray() As Byte, Optional Key As String)

  'The same routine is used for encryption
  'as well as decryption so why not reuse
  'some code and make this class smaller
  '(that is if it wasn't for all those damn
  'comments ;))
  Call EncryptByte(ByteArray(), Key)
  
End Sub
Public Sub EncryptByte(ByteArray() As Byte, Optional Key As String)

  Dim Offset As Long
  Dim ByteLen As Long
  Dim ResultLen As Long
  Dim CurrPercent As Long
  Dim NextPercent As Long
  
  'Set the new key if one was provided
  If (Len(Key) > 0) Then Me.Key = Key
  
  'Get the size of the source array
  ByteLen = UBound(ByteArray) + 1
  ResultLen = ByteLen
  
  'Loop thru the data encrypting it with
  'simply XOR´ing with the key
  For Offset = 0 To (ByteLen - 1)
    ByteArray(Offset) = ByteArray(Offset) Xor m_Key(Offset Mod m_KeyLen)
  
    'Update the progress if neccessary
    If (Offset >= NextPercent) Then
      CurrPercent = Int((Offset / ResultLen) * 100)
      NextPercent = (ResultLen * ((CurrPercent + 1) / 100)) + 1
      RaiseEvent Progress(CurrPercent)
    End If
  Next
  
  'Make sure we return a 100% progress
  If (CurrPercent <> 100) Then RaiseEvent Progress(100)

End Sub
Public Function EncryptString(Text As String, Optional Key As String) As String

  Dim a As Long
  Dim ByteLen As Long
  Dim ByteArray() As Byte
  
  'Convert the source string into a byte array
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  'Encrypt the byte array
  Call EncryptByte(ByteArray(), Key)
  
  'Return the encrypted data as a string
  EncryptString = StrConv(ByteArray(), vbUnicode)
  
End Function
Public Function DecryptString(Text As String, Optional Key As String) As String

  Dim a As Long
  Dim ByteLen As Long
  Dim ByteArray() As Byte
  
  'Convert the source string into a byte array
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  'Encrypt the byte array
  Call DecryptByte(ByteArray(), Key)
  
  'Return the encrypted data as a string
  DecryptString = StrConv(ByteArray(), vbUnicode)
  
End Function

Public Property Let Key(New_Value As String)

  'Do nothing if the key is buffered
  If (m_KeyValue = New_Value) Then Exit Property
  
  'Set the new key and convert it to a
  'byte array for faster accessing later
  m_KeyValue = New_Value
  m_KeyLen = Len(New_Value)
  m_Key() = StrConv(m_KeyValue, vbFromUnicode)
  
End Property
