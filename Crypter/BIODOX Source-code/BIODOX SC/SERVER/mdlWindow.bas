Attribute VB_Name = "mdlWindow"
Option Explicit

Private Type RECT
        Left As Long
        Top As Long
        Right As Long
        Bottom As Long
End Type

Public Type POINTAPI
        x As Long
        y As Long
End Type

Public Type WINDOWPLACEMENT
        Length As Long
        flags As Long
        showCmd As Long
        ptMinPosition As POINTAPI
        ptMaxPosition As POINTAPI
        rcNormalPosition As RECT
End Type

Public lstWindows As String
Public Declare Function EnumWindows Lib "user32" (ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long

Private Declare Function GetWindowPlacement Lib "user32" (ByVal hwnd As Long, lpwndpl As WINDOWPLACEMENT) As Long
Private Declare Function SetWindowPlacement Lib "user32" (ByVal hwnd As Long, lpwndpl As WINDOWPLACEMENT) As Long
Private Declare Function GetWindowTextA Lib "user32" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function GetClassNameA Lib "user32" (ByVal hwnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
Private Declare Function IsWindowVisible Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function FindWindowA Lib "user32" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function SendMessageA Lib "user32" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Integer, ByVal lParam As Any) As Long
Private Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hwnd As Long, lpdwProcessId As Long) As Long
Private Declare Function SetWindowTextA Lib "user32" (ByVal hwnd As Long, ByVal lpString As String) As Long
Private Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long

Public Function GetWindows(ByVal hwnd As Long, ByVal lParam As Boolean) As Long
    Dim lTextBuf As Long
    Dim strName As String * 256
    Dim clsWnd As String * 256
    Dim IsWndVis As Boolean
    Dim iPlace As Integer
    Dim PID As Long
    Dim sBuff As Long
    
    IsWndVis = IsWindowVisible(hwnd)

    If IsWndVis = lParam Then
        lTextBuf = GetWindowTextA(hwnd, strName, 256)
        If lTextBuf Then
            sBuff = Len(PID)
            GetWindowThreadProcessId hwnd, sBuff
            GetClassNameA hwnd, clsWnd, 256
            lstWindows = lstWindows & LPSTRToVBString(strName) & Chr(0) & hwnd & Chr(0) & GetWindowState(hwnd) & Chr(0) & sBuff & Chr(0) & LPSTRToVBString(clsWnd) & Chr(255)
    End If
End If

GetWindows = 1
End Function

Private Function GetWindowState(lWnd As Long) As Long
    Dim WNDPLACE As WINDOWPLACEMENT, hWndPlace As Long
    hWndPlace = GetWindowPlacement(lWnd, WNDPLACE)
    GetWindowState = WNDPLACE.showCmd
End Function

Public Function CloseWindow(lWnd As Long) As Long: CloseWindow = SendMessageA(lWnd, &H10, ByVal 0, vbNull): End Function
Public Function SetWindow(lWnd As Long, sFocus As Long) As Long: SetWindow = ShowWindow(lWnd, sFocus): End Function
Public Function ChangeWindowText(lWnd As Long, NewName As String) As Long: ChangeWindowText = SetWindowTextA(lWnd, NewName): End Function
