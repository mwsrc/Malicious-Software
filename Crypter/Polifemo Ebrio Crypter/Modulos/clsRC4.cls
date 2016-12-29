VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Rc4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Event Pr0gress(Percent As Long)

Private BoboKey As String
Private Bobox(0 To 255) As Integer

Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Public Sub DecryptByte(ByteArray() As Byte, Optional Key As String)
  Call EncryptByte(ByteArray(), Key)
End Sub

Public Function EncryptString(Text As String, Optional Key As String) As String

  Dim ByteArray() As Byte
 
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  Call EncryptByte(ByteArray(), Key)
  
  EncryptString = StrConv(ByteArray(), vbUnicode)
  
End Function

Public Function DecryptString(Text As String, Optional Key As String) As String

  Dim ByteArray() As Byte
 
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  Call DecryptByte(ByteArray(), Key)
  
  DecryptString = StrConv(ByteArray(), vbUnicode)
  
End Function
Public Sub EncryptByte(ByteArray() As Byte, Optional Key As String)

  Dim i As Long
  Dim j As Long
  Dim t3mp0 As Byte
  Dim Offset As Long
  Dim OrigLen As Long
  Dim ChipTam As Long
  Dim CurrPercent As Long
  Dim NextPercent As Long
  Dim bB0x(0 To 255) As Integer

  If (Len(Key) > 0) Then Me.Key = Key
  
  Call CopyMem(bB0x(0), Bobox(0), 512)
  
  OrigLen = UBound(ByteArray) + 1
  ChipTam = OrigLen
  
  For Offset = 0 To (OrigLen - 1)
    i = (i + 1) Mod 256
    j = (j + bB0x(i)) Mod 256
    t3mp0 = bB0x(i)
    bB0x(i) = bB0x(j)
    bB0x(j) = t3mp0
    ByteArray(Offset) = ByteArray(Offset) Xor (bB0x((bB0x(i) + bB0x(j)) Mod 256))
    
    If (Offset >= NextPercent) Then
      CurrPercent = Int((Offset / ChipTam) * 100)
      NextPercent = (ChipTam * ((CurrPercent + 1) / 100)) + 1
      RaiseEvent Pr0gress(CurrPercent)
    End If
  Next

  If (CurrPercent <> 100) Then RaiseEvent Pr0gress(100)

End Sub

Public Property Let Key(New_Value As String)

  Dim a As Long
  Dim b As Long
  Dim t3mp0 As Byte
  Dim Key() As Byte
  Dim KeyTam As Long
  
  If (BoboKey = New_Value) Then Exit Property
  
  BoboKey = New_Value
  
  Key() = StrConv(BoboKey, vbFromUnicode)
  KeyTam = Len(BoboKey)
  
  For a = 0 To 255
    Bobox(a) = a
  Next a
  For a = 0 To 255
    b = (b + Bobox(a) + Key(a Mod KeyTam)) Mod 256
    t3mp0 = Bobox(a)
    Bobox(a) = Bobox(b)
    Bobox(b) = t3mp0
  Next
  
End Property



