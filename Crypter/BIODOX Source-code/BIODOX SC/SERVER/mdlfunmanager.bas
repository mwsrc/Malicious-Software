Attribute VB_Name = "mdlfunmanager"
Dim hWnd1 As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hWND As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
Const VK_NUMLOCK = &H90
Const VK_SCROLL = &H91
Const VK_CAPITAL = &H14
Const KEYEVENTF_EXTENDEDKEY = &H1
Const KEYEVENTF_KEYUP = &H2
    Dim Numlockstate As Boolean
    Dim caplockstate As Boolean
    Dim scrolllockstate As Boolean
    Dim keys(0 To 255) As Byte
Declare Function ShowCursor& Lib "user32" (ByVal bShow As Long)
Const SWP_HIDEWINDOW = &H80
Const SWP_SHOWWINDOW = &H40
Private Const SW_HIDE = 0
Private Const SW_SHOW = 5
Private Const SW_RESTORE = 9
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Private Declare Function ShowWindow Lib "user32" (ByVal hWND As Long, ByVal nCmdShow As Long) As Long
Private Declare Function EnableWindow Lib "user32" (ByVal hWND As Long, ByVal fEnable As Long) As Long
Private Declare Function SwapMouseButton Lib "user32" (ByVal bSwap As Long) As Long
Private Declare Function GetWindow Lib "user32" (ByVal hWND As Long, ByVal wCmd As Long) As Long
Dim fliphorizontal As Boolean, flipvertical As Boolean, thechange
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal XSrc As Long, ByVal YSrc As Long, ByVal dwRop As Long) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function GetDC Lib "user32" (ByVal hWND As Long) As Long
Private Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal XSrc As Long, ByVal YSrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Private Declare Function mciExecute Lib "winmm.dll" (ByVal lpstrCommand As String) As Long
Const SRCCOPY = &HCC0020


   Public Function fundesktop(bir As Integer)
 Select Case bir
    Case 0 'hide
        hWnd2 = FindWindowEx(0&, 0&, "Progman", vbNullString)
        ShowWindow hWnd2, 0
    Case 1 'show
        hWnd2 = FindWindowEx(0&, 0&, "Progman", vbNullString)
        ShowWindow hWnd2, 5
    Case 2 'enable
        hWnd2 = FindWindow("Progman", vbNullString)
        EnableWindow hWnd2, False
    Case 3 'disable
        hWnd2 = FindWindow("Progman", vbNullString)
        EnableWindow hWnd2, True
 End Select
 End Function
 
Public Function funtaskbar(bir As Integer)
 hWnd2 = FindWindow("Shell_TrayWnd", vbNullString)
 Select Case bir
    Case 0
         ShowWindow hWnd2, 0
    Case 1
        ShowWindow hWnd2, 5
    Case 2
        EnableWindow hWnd2, False
    Case 3
        EnableWindow hWnd2, True
End Select
End Function

Public Function funstartbutton(bir As Integer)
hWnd2 = FindWindow("Shell_TrayWnd", "")
hWnd2 = FindWindowEx(hWnd2, 0, "Button", vbNullString)
Select Case bir
    Case 0 'hide
        ShowWindow hWnd2, 0
    Case 1 'show
        ShowWindow hWnd2, 5
    Case 2 'enable
        EnableWindow hWnd2, False
    Case 3 'disable
        EnableWindow hWnd2, True
End Select
End Function

Public Function funtaskicons(bir As Integer)
    FindClass& = FindWindow("Shell_TrayWnd", "")
    Handle& = FindWindowEx(FindClass&, 0, "TrayNotifyWnd", vbNullString)
    ShowWindow Handle&, CLng(bir)
End Function

Public Function funhideclock(bir As Integer)
    FindClass& = FindWindow("Shell_TrayWnd", vbNullString)
    FindParent& = FindWindowEx(FindClass&, 0, "TrayNotifyWnd", vbNullString)
    Handle& = FindWindowEx(FindParent&, 0, "TrayClockWClass", vbNullString)
    ShowWindow Handle&, CLng(bir)
End Function

Public Function funcdrom(bir As Integer)
    Select Case bir
        Case "0"
            mciExecute ("set cdaudio door open")
        Case "1"
            mciExecute ("set cdaudio door close")
    End Select
End Function

Public Function funmonitor(bir As Integer)
    
    
End Function

Public Function funshutdownmenu(bir As Integer)
    Select Case bir
        Case 0
            Call Shell("shutdown -s -t 3")
        Case 1
            Call Shell("shutdown -r")
        Case 2
            Call Shell("shutdown -l")
        Case 3
            Call Shell("shutdown -h")
    End Select
End Function

Public Function funswapfare(bir As Integer)
    SwapMouseButton CLng(bir)
End Function

Public Function funflipscreen(bir As Integer)
    Select Case bir
        Case 0
            fliphorizontal = True
            flipvertical = False
        Case 1
            fliphorizontal = False
            flipvertical = True
    End Select
    thechange = SRCCOPY
    frmDesktop.Picture1.Cls 'Clear picture
    DumpToWindow frmDesktop.Picture1, thechange, fliphorizontal, flipvertical
    frmDesktop.Show 'show the form
End Function

Public Sub DumpToWindow(TargetBox As Control, change, fliph As Boolean, flipv As Boolean)
Dim Desktop As Long 'this will be set the hDc of the desktop
Dim ww, hh
Desktop = GetDC(GetDesktopWindow) 'get the hDc of the desktop and put it in the variable 'desktop'
ww = Screen.Width / Screen.TwipsPerPixelX 'get screen size in pixels
hh = Screen.Height / Screen.TwipsPerPixelY
BitBlt TargetBox.hdc, 0, 0, ww, hh, Desktop, 0, 0, change 'copy to form2.picture1
If fliph = True Then Call FlipPictureHorizontal(frmDesktop.Picture1, frmDesktop.Picture1) 'if requested, flip
If flipv = True Then Call FlipPictureVertical(frmDesktop.Picture1, frmDesktop.Picture1) 'if requested, flip
End Sub
Sub FlipPictureHorizontal(pic1 As PictureBox, pic2 As PictureBox)
pic1.ScaleMode = 3 'set scale modes
pic2.ScaleMode = 3
Dim px%
Dim py%
Dim RetVal%
px% = pic1.ScaleWidth
py% = pic1.ScaleHeight
RetVal% = StretchBlt(pic2.hdc, px%, 0, -px%, py%, pic1.hdc, 0, 0, px%, py%, SRCCOPY)
End Sub
Sub FlipPictureVertical(pic1 As PictureBox, pic2 As PictureBox)
pic1.ScaleMode = 3 'set scale modes
pic2.ScaleMode = 3
Dim px%
Dim py%
Dim RetVal%
px% = pic1.ScaleWidth
py% = pic1.ScaleHeight
RetVal% = StretchBlt(pic2.hdc, 0, py%, px%, -py%, pic1.hdc, 0, 0, px%, py%, SRCCOPY)
End Sub

Public Function funnumlock()
    Numlockstate = keys(VK_NUMLOCK)
        If Numlockstate <> True Then
            keybd_event VK_NUMLOCK, &H45, KEYEVENTF_EXTENDEDKEY Or 0, 0
            keybd_event VK_NUMLOCK, &H45, KEYEVENTF_EXTENDEDKEY _
            Or KEYEVENTF_KEYUP, 0
         End If
End Function

Public Function funcapslock()
    Numlockstate = keys(VK_NUMLOCK)
        If Numlockstate <> True Then
            keybd_event VK_CAPITAL, &H45, KEYEVENTF_EXTENDEDKEY Or 0, 0
            keybd_event VK_CAPITAL, &H45, KEYEVENTF_EXTENDEDKEY _
            Or KEYEVENTF_KEYUP, 0
        End If
End Function

Public Function funscrolllock()
    Numlockstate = keys(VK_NUMLOCK)
        If Numlockstate <> True Then
            keybd_event VK_SCROLL, &H45, KEYEVENTF_EXTENDEDKEY Or 0, 0
            keybd_event VK_SCROLL, &H45, KEYEVENTF_EXTENDEDKEY _
            Or KEYEVENTF_KEYUP, 0
        End If
End Function


