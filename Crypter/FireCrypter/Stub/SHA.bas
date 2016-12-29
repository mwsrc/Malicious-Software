Attribute VB_Name = "AES"
Option Explicit
'   encrypt text messages using AES_Rijndael Block Cipher
'   by Dipankar Basu
Private oTest As CRijndael
Public Function strEncrypt(ByVal strMsg As String, ByVal pKey As String) As String
On Local Error Resume Next
Dim byteArray() As Byte, byteKey() As Byte, CryptText() As Byte
Set oTest = New CRijndael
byteArray() = StrConv(strMsg, vbFromUnicode)
byteKey() = StrConv(pKey, vbFromUnicode)
CryptText = oTest.EncryptData(byteArray(), byteKey())
Set oTest = Nothing
strEncrypt = StrConv(CryptText(), vbUnicode)
End Function
Public Function strDecrypt(ByVal strMsg As String, ByVal pKey As String) As String
On Local Error Resume Next
Dim byteArray() As Byte, byteKey() As Byte, CryptText() As Byte
Set oTest = New CRijndael
byteArray() = StrConv(strMsg, vbFromUnicode)
byteKey() = StrConv(pKey, vbFromUnicode)
CryptText() = oTest.DecryptData(byteArray(), byteKey())
Set oTest = Nothing
strDecrypt = StrConv(CryptText(), vbUnicode)
End Function
Public Function Hex2Str(ByVal strData As String)
On Local Error Resume Next
Dim i As Long, CryptString As String, tmpChar As String
For i = 1 To Len(strData) Step 2
CryptString = CryptString & _
 Chr(Val("&H" + Mid(strData, i, 2)))
Next i
Hex2Str = CryptString
End Function
Public Function Str2Hex(ByVal strData As String)
On Local Error Resume Next
Dim i As Long, CryptString As String, tmpAppend As String
For i = 1 To Len(strData)
tmpAppend = Hex(Asc(Mid(strData, i, 1)))
If Len(tmpAppend) = 1 Then tmpAppend = Trim(Str(0)) & tmpAppend
CryptString = CryptString & tmpAppend: DoEvents
Next
Str2Hex = CryptString
End Function
Public Function FileExists(sFilename As String) As Boolean
On Local Error Resume Next
Dim Fl As Integer: Fl = Len(Dir$(sFilename))
FileExists = IIf(Err Or Fl = 0, False, True)
End Function


