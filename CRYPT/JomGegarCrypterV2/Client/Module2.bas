Attribute VB_Name = "Module2"
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'  [ACO]Abronsius Code Obfuscator v4.0
'          Scrambler: Func/Sub/Property/
'          Replace:
'          Surround:
'          Randomize: Types/Enums/Alias/Api Vars/Functions/Procedures/Constants/Vars/
'          Encryption:
'          Trash:
'          Fake:
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Begin Code
Option Explicit
Private Const HVm2fmiwQR             As Long = &H3
Private Const dmvjUPPNTBt      As Long = -1
Private Const st4LGs              As Long = &H80000000
Private Const IrR6n1     As Long = &H80
Private Const eJ9DKF                As Long = &H0
Private Const x6sQd6                   As Long = &H3
Private Const KR65ptwm             As Long = &HE
Private Type WVYmU0gtS8S
bWidth          As Byte
bHeight         As Byte
bColorCount     As Byte
bReserved       As Byte
wPlanes         As Integer
wBitCount       As Integer
dwBytesInRes    As Long
dwImageOffset   As Long
End Type
Private Type hUpDvROfF
idReserved      As Integer
idType          As Integer
idCount         As Integer
End Type
Private Type WmfORuS
bWidth          As Byte
bHeight         As Byte
bColorCount     As Byte
bReserved       As Byte
wPlanes         As Integer
wBitCount       As Integer
dwBytesInRes    As Long
nID             As Integer
End Type
Private Type K6eO43mq
idReserved      As Integer
idType          As Integer
idCount         As Integer
idEntries()     As WmfORuS
End Type
Private Declare Function p6cso3k Lib "kernel32" Alias "CreateFileA" (ByVal EqC1h2MiJH As String, ByVal c1XoOi8 As Long, ByVal SY0D18 As Long, boYdcwAD As Any, ByVal b5lhX As Long, ByVal XlHbHUN9PgW As Long, ByVal XnhQSvCZ9 As Long) As Long
Private Declare Function ReadFile Lib "kernel32" (ByVal MD98rfi As Long, TVco43O As Any, ByVal F6SPH30r7krn As Long, TNqyV4St As Long, gJ27a0u2D As Any) As Long
Private Declare Function SetFilePointer Lib "kernel32" (ByVal MD98rfi As Long, ByVal JVRiIcjes As Long, qhF2V As Long, ByVal AFVUdhlbFXO As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal m6QA7xw3H As Long) As Long
Private Declare Function rB6BO Lib "kernel32" Alias "BeginUpdateResourceA" (ByVal EeE7XT7rJ As String, ByVal TT3QsD As Long) As Long
Private Declare Function mbtCEPhbKMpw Lib "kernel32" Alias "UpdateResourceA" (ByVal wlptj As Long, ByVal q95L1vv2 As Long, ByVal WIBXD4LX50ey As Long, ByVal HH4e1Dxy As Long, ngj9DcMKobz As Any, ByVal Wkz6u5yT8TQJ As Long) As Long
Private Declare Function KOXhNM5TW Lib "kernel32" Alias "EndUpdateResourceA" (ByVal wlptj As Long, ByVal Apntb As Long) As Long
Private Declare Sub rnEQwvggNXcJ Lib "kernel32" Alias "RtlMoveMemory" (Sy7Ipk6u As Any, qHWdRcV As Any, ByVal aJQM04 As Long)
Public Function ecztgS231(ByVal SPF9r As String, ByVal R8o9SpPOmZk3 As String) As Boolean
Dim MD98rfi               As Long
Dim wlptj             As Long
Dim zmdUz                As Long
Dim i                   As Integer
Dim hNjtIg            As hUpDvROfF
Dim tUm2fmhvQ7gi         As K6eO43mq
Dim b3FzA()     As WVYmU0gtS8S
Dim e59Zs()         As Byte
Dim NeUTEEblA()    As Byte
MD98rfi = p6cso3k(R8o9SpPOmZk3, st4LGs, 0, ByVal 0&, HVm2fmiwQR, 0, ByVal 0&)
If MD98rfi = dmvjUPPNTBt Then
ecztgS231 = False
CloseHandle (MD98rfi)
Exit Function
End If
Call ReadFile(MD98rfi, hNjtIg, Len(hNjtIg), zmdUz, ByVal 0&)
ReDim b3FzA(hNjtIg.idCount - 1)
For i = 0 To hNjtIg.idCount - 1
Call ReadFile(MD98rfi, b3FzA(i), Len(b3FzA(i)), zmdUz, ByVal 0&)
Next i
ReDim tUm2fmhvQ7gi.idEntries(hNjtIg.idCount - 1)
tUm2fmhvQ7gi.idReserved = hNjtIg.idReserved
tUm2fmhvQ7gi.idType = hNjtIg.idType
tUm2fmhvQ7gi.idCount = hNjtIg.idCount
For i = 0 To tUm2fmhvQ7gi.idCount - 1
tUm2fmhvQ7gi.idEntries(i).bWidth = b3FzA(i).bWidth
tUm2fmhvQ7gi.idEntries(i).bHeight = b3FzA(i).bHeight
tUm2fmhvQ7gi.idEntries(i).bColorCount = b3FzA(i).bColorCount
tUm2fmhvQ7gi.idEntries(i).bReserved = b3FzA(i).bReserved
tUm2fmhvQ7gi.idEntries(i).wPlanes = b3FzA(i).wPlanes
tUm2fmhvQ7gi.idEntries(i).wBitCount = b3FzA(i).wBitCount
tUm2fmhvQ7gi.idEntries(i).dwBytesInRes = b3FzA(i).dwBytesInRes
tUm2fmhvQ7gi.idEntries(i).nID = i + 1
Next i
wlptj = rB6BO(SPF9r, False)
For i = 0 To hNjtIg.idCount - 1
ReDim e59Zs(b3FzA(i).dwBytesInRes)
SetFilePointer MD98rfi, b3FzA(i).dwImageOffset, ByVal 0&, eJ9DKF
Call ReadFile(MD98rfi, e59Zs(0), b3FzA(i).dwBytesInRes, zmdUz, ByVal 0&)
If mbtCEPhbKMpw(wlptj, x6sQd6, tUm2fmhvQ7gi.idEntries(i).nID, 0, e59Zs(0), b3FzA(i).dwBytesInRes) = False Then
ecztgS231 = False
CloseHandle (MD98rfi)
Exit Function
End If
Next i
ReDim NeUTEEblA(6 + 14 * tUm2fmhvQ7gi.idCount)
rnEQwvggNXcJ ByVal VarPtr(NeUTEEblA(0)), ByVal VarPtr(hNjtIg), 6
For i = 0 To tUm2fmhvQ7gi.idCount - 1
rnEQwvggNXcJ ByVal VarPtr(NeUTEEblA(6 + 14 * i)), ByVal VarPtr(tUm2fmhvQ7gi.idEntries(i).bWidth), 14&
Next
If mbtCEPhbKMpw(wlptj, KR65ptwm, 1, 0, ByVal VarPtr(NeUTEEblA(0)), UBound(NeUTEEblA)) = False Then
ecztgS231 = False
CloseHandle (MD98rfi)
Exit Function
End If
If KOXhNM5TW(wlptj, False) = False Then
ecztgS231 = False
CloseHandle (MD98rfi)
End If
Call CloseHandle(MD98rfi)
ecztgS231 = True
End Function
