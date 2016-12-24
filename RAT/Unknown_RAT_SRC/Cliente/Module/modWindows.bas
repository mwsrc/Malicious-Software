Attribute VB_Name = "ModWindows"
Option Explicit

Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function SetWindowText Lib "user32" Alias "SetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String) As Long
Private Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hwnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
Private Declare Function EnumChildWindows Lib "user32" (ByVal hwndParent As Long, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Private Declare Function GetParent Lib "user32" (ByVal hwnd As Long) As Long
Declare Function GetDesktopWindow Lib "user32" () As Long
Declare Function GetForegroundWindow Lib "user32.dll" () As Long
Declare Function SetForegroundWindow Lib "user32.dll" (ByVal hwnd As Long) As Long
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long

Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Const GWL_EXSTYLE As Long = -20
Private Const GWL_STYLE As Long = -16

Private Const WM_SYSCOMMAND As Long = &H112

Public Enum SYSCOMMAND
    SC_MINIMIZE = &HF020&
    SC_MAXIMIZE = &HF030&
    SC_CLOSE = &HF060&
    SC_RESTORE = &HF120&
End Enum


Private Const WS_POPUP As Long = &H80000000
Private Const WS_CHILD As Long = &H40000000
Private Const WS_VISIBLE As Long = &H10000000
Private Const WS_MINIMIZE As Long = &H20000000

Private Const WS_EX_CONTROLPARENT As Long = &H10000
Private Const WS_EX_APPWINDOW As Long = &H40000
Private Const WS_EX_WINDOWEDGE As Long = &H100&

Private ArrWindows() As Variant
Private ArrCount As Long

Public Function GetWindowStyle(ByVal hwnd As Long) As Long
    GetWindowStyle = GetWindowLong(hwnd, GWL_STYLE)
End Function

Public Sub PutFocusWindows(ByVal hwnd As Long)
    If (GetWindowStyle(hwnd) And WS_MINIMIZE) = WS_MINIMIZE Then
        SetWindowState hwnd, SC_RESTORE
    End If
    SetForegroundWindow hwnd
End Sub

Public Sub SetWindowState(ByVal hwnd As Long, ByVal lState As SYSCOMMAND)
    SendMessage hwnd, WM_SYSCOMMAND, lState, 0&
End Sub

Public Function GetWinText(ByVal hwnd As Long) As String
    Dim MyStr As String
    MyStr = String(100, Chr$(0))
    GetWindowText hwnd, MyStr, 100
    GetWinText = Left$(MyStr, InStr(MyStr, Chr$(0)) - 1)
End Function


Public Function GetWinClassName(hwnd As Long) As String
    Dim lpClassName As String
    Dim Ret As Long
    lpClassName = Space(256)
    Ret = GetClassName(hwnd, lpClassName, 256)
    GetWinClassName = Left$(lpClassName, Ret)
End Function

Public Function GetWindowsList(ArrList() As Variant) As Boolean
    
    ArrCount = -1
    EnumChildWindows GetDesktopWindow, AddressOf EnumChildProc, ByVal 0&
    If ArrCount > -1 Then GetWindowsList = True
    ArrList = ArrWindows
    Erase ArrWindows

End Function

Public Function GetWindowsCount() As Long
    
    ArrCount = -1
    EnumChildWindows GetDesktopWindow, AddressOf EnumChildProc, ByVal 0&
    GetWindowsCount = ArrCount + 1
    Erase ArrWindows

End Function

Private Function EnumChildProc(ByVal hwnd As Long, ByVal lParam As Long) As Long

    If IsStyle(hwnd, WS_VISIBLE) Then
         If GetParent(hwnd) = 0 Then
            If IsExStyle(hwnd, WS_EX_WINDOWEDGE) Or IsExStyle(hwnd, WS_EX_APPWINDOW) Then
                If Not IsStyle(hwnd, WS_POPUP) Or IsExStyle(hwnd, WS_EX_CONTROLPARENT) Then
                    ArrCount = ArrCount + 1
                    ReDim Preserve ArrWindows(ArrCount)
                    ArrWindows(ArrCount) = hwnd
                End If
            End If
        
        End If
    End If
    
    EnumChildProc = 1
    
End Function


Private Function IsExStyle(hwnd As Long, ExStyle As Long) As Boolean
    IsExStyle = (GetWindowLong(hwnd, GWL_EXSTYLE) And ExStyle) = ExStyle
End Function

Private Function IsStyle(hwnd As Long, lStyle As Long) As Boolean
    IsStyle = (GetWindowLong(hwnd, GWL_STYLE) And lStyle) = lStyle
End Function

