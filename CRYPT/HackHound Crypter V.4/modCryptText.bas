Attribute VB_Name = "modCryptText"
Option Explicit
'   encrypt text messages using AES_Rijndael Block Cipher
'   by Dipankar Basu.
Private oTest  As CRijndael
Public Function strEncrypt(ByVal strMsg As String, ByVal pKey As String) As String
Dim ByteArray() As Byte, byteKey() As Byte, CryptText() As Byte
    On Local Error Resume Next
'   If strMsg = vbNullString Or pKey = vbNullString Then Exit Function
    Set oTest = New CRijndael
    ByteArray() = StrConv(strMsg, vbFromUnicode)
    byteKey() = StrConv(pKey, vbFromUnicode)
    CryptText() = oTest.EncryptData(ByteArray(), byteKey())
    Set oTest = Nothing
    strEncrypt = StrConv(CryptText(), vbUnicode)
End Function
Public Function strDecrypt(ByVal strMsg As String, ByVal pKey As String) As String
Dim ByteArray() As Byte, byteKey() As Byte, CryptText() As Byte
    On Local Error Resume Next
'   If strMsg = vbNullString Or pKey = vbNullString Then Exit Function
    Set oTest = New CRijndael
    ByteArray() = StrConv(strMsg, vbFromUnicode)
    byteKey() = StrConv(pKey, vbFromUnicode)
    CryptText() = oTest.DecryptData(ByteArray(), byteKey())
    Set oTest = Nothing
    strDecrypt = StrConv(CryptText(), vbUnicode)
End Function
Public Function Hex2Str(ByVal strData As String)
Dim i As Long, CryptString As String, tmpChar As String
    On Local Error Resume Next
    For i = 1 To Len(strData) Step 2
        CryptString = CryptString & Chr$(Val("&H" & Mid$(strData, i, 2)))
    Next i
    Hex2Str = CryptString
End Function
Public Function Str2Hex(ByVal strData As String)
Dim i As Long, CryptString As String, tmpAppend As String
    On Local Error Resume Next
    For i = 1 To Len(strData)
        tmpAppend = Hex$(Asc(Mid$(strData, i, 1)))
        If Len(tmpAppend) = 1 Then tmpAppend = Trim$(Str$(0)) & tmpAppend
        CryptString = CryptString & tmpAppend: DoEvents
    Next i
    Str2Hex = CryptString
End Function
Public Function FileExists(ByVal sFilename As String) As Boolean
Dim Fl As Integer: Fl = Len(Dir$(sFilename))
    On Local Error Resume Next
    FileExists = IIf(Err Or Fl = 0, False, True)
End Function
Private Function GenRaND() As Byte
Dim RandomSeed As Integer
    Randomize
    RandomSeed = Int(Rnd * 3) + 1
    If RandomSeed = 1 Then
        GenRaND = Int(26 * Rnd + 65)
    ElseIf RandomSeed = 2 Then
        GenRaND = Int(26 * Rnd + 97)
    Else ' RandomSeed = 3 Then
        GenRaND = Int(10 * Rnd + 48)
    End If
End Function
Public Function GenKey(ByVal PassLength As Integer) As String
Dim tempPassword As String, i As Integer
    For i = 1 To PassLength
        tempPassword = tempPassword & Chr$(GenRaND)
    Next i
    GenKey = tempPassword
End Function
'Copyright (c)2003 by Dipankar Basu
' http://www.geocities.com/basudip_in/

