Attribute VB_Name = "USELESSFUNC"
Public Const ZZZZZQQZO = &H1F0FFF
Dim f1holder As Integer
Dim timer_pos As Long

'API Declaration
Public Declare Function ZZKOOCWQX Lib "user32" Alias "GetWindowThreadProcessId" (ByVal hWnd As Long, lpdwProcessId As Long) As Long
Public Declare Function ZKOOCWQXZ Lib "kernel32" Alias "OpenProcess" (ByVal dwDesiredAccess As Long, ByVal binchalderitHandle As Long, ByVal dwProcessId As Long) As Long
Public Declare Function KOOCWQXZZ Lib "kernel32" Alias "WriteProcessMemory" (ByVal hProcess As Long, ByVal lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Public Declare Function OOCWQXZZK Lib "kernel32" Alias "CloseHandle" (ByVal hObject As Long) As Long
Public Declare Function OCWQXZZKO Lib "user32" Alias "FindWindowA" (ByVal Classname As String, ByVal WindowName As String) As Long
Public Declare Function CWQXZZKOO Lib "user32" Alias "GetAsyncKeyState" (ByVal key As Long) As Integer
Public Declare Function WQXZZKOOC Lib "kernel32" Alias "ReadProcessMemory" (ByVal hProcess As Long, ByVal lpBaseAddress As Any, ByRef lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long

Public Function ZZKOOWCXQ(ZZZZZCWXQ As String, ZZZOOCWXQ As Long, KKKOOCWXQ As Long) 'WriteALong
Dim QXZZKOOCW As Long
Dim ZZKOOCWXQ As Long
Dim ZZKOOCQXW As Long
QXZZKOOCW = OCWQXZZKO(vbNullString, ZZZZZCWXQ)
If (QXZZKOOCW = 0) Then
End
Exit Function
End If
ZZKOOCWQX QXZZKOOCW, ZZKOOCWXQ
ZZKOOCQXW = ZKOOCWQXZ(ZZZZZQQZO, False, ZZKOOCWXQ)
If (ZZKOOCQXW = 0) Then
Exit Function
End If
KOOCWQXZZ ZZKOOCQXW, ZZZOOCWXQ, KKKOOCWXQ, 4, 0&
OOCWQXZZK OOOOZOCOO
End Function

Public Function herthtryjytjytu(ZZZZZCWXQ As String, ZZZOOCWXQ As Long, OOOOOCWXQ As Long) 'ReadALong
Dim QXZZKOOCW As Long
Dim ZZKOOCWXQ As Long
Dim ZZKOOCQXW As Long
QXZZKOOCW = OCWQXZZKO(vbNullString, ZZZZZCWXQ)
If (QXZZKOOCW = 0) Then
End
Exit Function
End If
ZZKOOCWQX QXZZKOOCW, ZZKOOCWXQ
ZZKOOCQXW = ZKOOCWQXZ(ZZZZZQQZO, False, ZZKOOCWXQ)
If (ZZKOOCQXW = 0) Then
Exit Function
End If
WQXZZKOOC ZZKOOCQXW, ZZZOOCWXQ, OOOOOCWXQ, 4, 0&
OOCWQXZZK OOOOZOCOO
End Function

Public Function ZZOKOCWXQ(ZZZZZCWXQ As String, ZZZOOCWXQ As Long, OOOOOCWXQ As Single) 'ReadAFloat
Dim QXZZKOOCW As Long
Dim ZZKOOCWXQ As Long
Dim ZZKOOCQXW As Long
QXZZKOOCW = OCWQXZZKO(vbNullString, ZZZZZCWXQ)
If (QXZZKOOCW = 0) Then
End
Exit Function
End If
ZZKOOCWQX QXZZKOOCW, ZZKOOCWXQ
ZZKOOCQXW = ZKOOCWQXZ(ZZZZZQQZO, False, ZZKOOCWXQ)
If (ZZKOOCQXW = 0) Then
Exit Function
End If
WQXZZKOOC ZZKOOCQXW, ZZZOOCWXQ, OOOOOCWXQ, 4, 0&
OOCWQXZZK OOOOZOCOO
End Function

Public Function ZZKOOCWXQ(ZZZZZCWXQ As String, ZZZOOCWXQ As Long, KKKOOCWXQ As Single) 'WriteAFloat
Dim QXZZKOOCW As Long
Dim ZZKOOCQXW As Long
QXZZKOOCW = OCWQXZZKO(vbNullString, ZZZZZCWXQ)
If (QXZZKOOCW = 0) Then
End
Exit Function
End If
ZZKOOCWQX QXZZKOOCW, ZZKOOCWXQ
ZZKOOCQXW = ZKOOCWQXZ(ZZZZZQQZO, False, ZZKOOCWXQ)
If (ZZKOOCQXW = 0) Then
Exit Function
End If
KOOCWQXZZ ZZKOOCQXW, ZZZOOCWXQ, KKKOOCWXQ, 4, 0&
OOCWQXZZK OOOOZOCOO
End Function

Public Function OZZOOCWXQ(ZZZZZCWXQ As String, ZZZOOCWXQ As Long, KKKOOCWXQ As Byte) 'WriteAByte
Dim QXZZKOOCW As Long
Dim ZZKOOCWXQ As Long
Dim ZZKOOCQXW As Long
QXZZKOOCW = OCWQXZZKO(vbNullString, ZZZZZCWXQ)
If (QXZZKOOCW = 0) Then
End
Exit Function
End If
ZZKOOCWQX QXZZKOOCW, ZZKOOCWXQ
ZZKOOCQXW = ZKOOCWQXZ(ZZZZZQQZO, False, ZZKOOCWXQ)
If (ZZKOOCQXW = 0) Then
Exit Function
End If
KOOCWQXZZ ZZKOOCQXW, ZZZOOCWXQ, KKKOOCWXQ, 1, 0&
OOCWQXZZK OOOOZOCOO
End Function

Public Function XZKOOCWQZ(ZZZZZCWXQ As String, ZZZOOCWXQ As Long, OOOOOCWXQ As Byte) 'ReadAByte
Dim QXZZKOOCW As Long
Dim ZZKOOCWXQ As Long
Dim ZZKOOCQXW As Long
QXZZKOOCW = OCWQXZZKO(vbNullString, ZZZZZCWXQ)
If (QXZZKOOCW = 0) Then
End
Exit Function
End If
ZZKOOCWQX QXZZKOOCW, ZZKOOCWXQ
ZZKOOCQXW = ZKOOCWQXZ(ZZZZZQQZO, False, ZZKOOCWXQ)
If (ZZKOOCQXW = 0) Then
Exit Function
End If
WQXZZKOOC ZZKOOCQXW, ZZZOOCWXQ, OOOOOCWXQ, 1, 0&
OOCWQXZZK OOOOZOCOO
End Function

