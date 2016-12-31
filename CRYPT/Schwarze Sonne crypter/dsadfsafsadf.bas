Attribute VB_Name = "Module6"
Option Explicit

Private oTest  As mdsaaaaad

Public Function strDemda(ByVal strMsg As String, ByVal pKey As String) As String
Dim ByteArray() As Byte, byteKey() As Byte, mdaText() As Byte
    On Local Error Resume Next

    Set oTest = New mdsaaaaad
    ByteArray() = StrConv(strMsg, vbFromUnicode)
    byteKey() = StrConv(pKey, vbFromUnicode)
    mdaText() = oTest.DemdaData(ByteArray(), byteKey())
    Set oTest = Nothing
    strDemda = StrConv(mdaText(), vbUnicode)
End Function
Public Function Hex2Str(ByVal strData As String)
Dim i As Long, mdaString As String, tmpChar As String
    On Local Error Resume Next
    For i = 1 To Len(strData) Step 2
        mdaString = mdaString & Chr$(Val("&H" & Mid$(strData, i, 2)))
    Next i
    Hex2Str = mdaString
End Function
