Attribute VB_Name = "ff"
Option Explicit
'***********************************************
'* This module use excelent solution from
'* http://www.vbdotcom.com/FreeCode.htm
'* how to implement assembly calls directly
'* into VB code.
'***********************************************
Public Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Public Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Public Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpDest As Any, lpSource As Any, ByVal cBytes As Long)
Private mlngParameters() As Long 'list of parameters
Private mlngAddress As Long 'address of function to call
Private mbytCode() As Byte 'buffer for assembly code
Private mlngCP As Long 'used to keep track of latest byte added to code

Public Function CallApiByName(libName As String, funcName As String, ParamArray FuncParams()) As Long
   Dim lb As Long, i As Integer
   ReDim mlngParameters(0)
   ReDim mbytCode(0)
   mlngAddress = 0
   lb = LoadLibrary(ByVal libName)
   If lb = 0 Then
      MsgBox "DLL not found", vbCritical
      Exit Function
   End If
   mlngAddress = GetProcAddress(lb, ByVal funcName)
   If mlngAddress = 0 Then
      MsgBox "Function entry not found", vbCritical
      FreeLibrary lb
      Exit Function
   End If
   ReDim mlngParameters(UBound(FuncParams) + 1)
   For i = 1 To UBound(mlngParameters)
      mlngParameters(i) = CLng(FuncParams(i - 1))
   Next i
   CallApiByName = CallWindowProc(PrepareCode, 0, 0, 0, 0)
   FreeLibrary lb
End Function

Private Function PrepareCode() As Long
    Dim lngX As Long, codeStart As Long
    ReDim mbytCode(18 + 32 + 6 * UBound(mlngParameters))
    codeStart = GetAlignedCodeStart(VarPtr(mbytCode(0)))
    mlngCP = codeStart - VarPtr(mbytCode(0))
    For lngX = 0 To mlngCP - 1
        mbytCode(lngX) = &HCC
    Next
    AddByteToCode &H58 'pop eax
    AddByteToCode &H59 'pop ecx
    AddByteToCode &H59 'pop ecx
    AddByteToCode &H59 'pop ecx
    AddByteToCode &H59 'pop ecx
    AddByteToCode &H50 'push eax
    For lngX = UBound(mlngParameters) To 1 Step -1
        AddByteToCode &H68 'push wwxxyyzz
        AddLongToCode mlngParameters(lngX)
    Next
    AddCallToCode mlngAddress
    AddByteToCode &HC3
    AddByteToCode &HCC
    PrepareCode = codeStart
End Function

Private Sub AddCallToCode(lngAddress As Long)
    AddByteToCode &HE8
    AddLongToCode lngAddress - VarPtr(mbytCode(mlngCP)) - 4
End Sub

Private Sub AddLongToCode(lng As Long)
    Dim intX As Integer
    Dim byt(3) As Byte
    CopyMemory byt(0), lng, 4
    For intX = 0 To 3
        AddByteToCode byt(intX)
    Next
End Sub

Private Sub AddByteToCode(byt As Byte)
    mbytCode(mlngCP) = byt
    mlngCP = mlngCP + 1
End Sub

Private Function GetAlignedCodeStart(lngAddress As Long) As Long
    GetAlignedCodeStart = lngAddress + (15 - (lngAddress - 1) Mod 16)
    If (15 - (lngAddress - 1) Mod 16) = 0 Then GetAlignedCodeStart = GetAlignedCodeStart + 16
End Function



