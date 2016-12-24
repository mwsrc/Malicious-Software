Attribute VB_Name = "mdlFormNotify"
Option Explicit

' -------------------------------------------------------------------
' Autor:    Leandro I. Ascierto
' Web:      www.leandroascierto.com.ar
' Fecha:    05 de Septiembre de 2009
' Name:     mdlFormNotify
' -------------------------------------------------------------------

Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function GetWindowRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hwnd As Long, ByVal crey As Byte, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Private Declare Function SetTimer Lib "user32" (ByVal hwnd As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long) As Long
Private Declare Function KillTimer Lib "user32" (ByVal hwnd As Long, ByVal nIDEvent As Long) As Long
Private Declare Function SetProp Lib "user32.dll" Alias "SetPropA" (ByVal hwnd As Long, ByVal lpString As String, ByVal hData As Long) As Long
Private Declare Function GetProp Lib "user32.dll" Alias "GetPropA" (ByVal hwnd As Long, ByVal lpString As String) As Long
Private Declare Function MoveWindow Lib "user32.dll" (ByVal hwnd As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFOEX) As Long
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long

#If Win32 Then
    Private Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (lpszSoundName As Any, ByVal uFlags As Long) As Long
#Else
    Private Declare Function sndPlaySound Lib "MMSYSTEM" (lpszSoundName As Any, ByVal uFlags%) As Integer
#End If

Private Const SND_ASYNC         As Long = &H1
Private Const SND_SYNC          As Long = &H0
Private Const SND_NODEFAULT     As Long = &H2
Private Const SND_MEMORY        As Long = &H4
Private Const GWL_EXSTYLE       As Long = (-20)
Private Const WS_EX_LAYERED     As Long = &H80000
Private Const LWA_ALPHA         As Long = &H2&
Private Const SWP_NOACTIVATE    As Long = &H10
Private Const SWP_SHOWWINDOW    As Long = &H40
Private Const HWND_TOPMOST      As Long = -1
Private Const WM_CLOSE          As Long = &H10


Private Type RECT
    Left                        As Long
    Top                         As Long
    Right                       As Long
    Bottom                      As Long
End Type

Private Type OSVERSIONINFOEX
    dwOSVersionInfoSize         As Long
    dwMajorVersion              As Long
    dwMinorVersion              As Long
    dwBuildNumber               As Long
    dwPlatformId                As Long
    szCSDVersion                As String * 128
End Type

Public Enum ShowStyle
    Slide = 0
    InSide = 1
    Fade = 2
End Enum


Public Sub HideAll(Frm As Form)
    Dim i As Integer
    For i = 0 To Forms.Count - 1
        If Forms(i).Name = Frm.Name Then ShowHide Forms(i)
    Next
    Unload Frm
End Sub


Public Sub ShowFormNotify(Frm As Form, ShowMode As ShowStyle, Optional TimeOut As Long = 0, Optional Transparency As Long = 255, Optional PathWav As String)

    Dim hTrayWnd As Long
    Dim Rec As RECT
    Dim FormsCount As Long
    Dim i As Integer
    Dim mLeft As Long, mTop As Long
    Dim mWidth As Long, mHeight As Long
    Dim ScreenW As Long, ScreenH As Long
    Dim TaskBarSize As Long, TaskBarPos As Long
    Dim hwnd As Long
    
    hwnd = Frm.hwnd
    
    'Si la versión de Windows es >= 5
    If Not IsLayeredSupported Then
        Transparency = 255
        If ShowMode = Fade Then ShowMode = Slide
    End If
    
    ScreenW = Screen.Width / Screen.TwipsPerPixelX
    ScreenH = Screen.Height / Screen.TwipsPerPixelY

    For i = 0 To Forms.Count - 1
        If Forms(i).Name = Frm.Name Then FormsCount = FormsCount + 1
    Next
    FormsCount = FormsCount - 1

    'El hwnd de la barra de tareas
    hTrayWnd = FindWindow("Shell_TrayWnd", vbNullString)

    If hTrayWnd Then
        GetWindowRect hTrayWnd, Rec
        With Rec
            TaskBarSize = .Bottom - .Top
            If .Left <= 0 And .Top > 0 Then TaskBarPos = 1
            If .Left > 0 And .Top <= 0 Then TaskBarPos = 2: TaskBarSize = (.Right - .Left)
            If .Left <= 0 And .Top <= 0 And .Right < 600 Then TaskBarPos = 3: TaskBarSize = .Right
            If .Left <= 0 And .Top <= 0 And .Right > 600 Then TaskBarPos = 4
        End With
    Else
        TaskBarPos = 1
    End If
    
    GetWindowRect hwnd, Rec
    
    mWidth = Rec.Right - Rec.Left
    mHeight = Rec.Bottom - Rec.Top

    'Dependiendo de la posición barra de tareas...
    Select Case TaskBarPos
        Case 1
            mLeft = ScreenW - mWidth
            mTop = ScreenH - TaskBarSize - (mHeight * FormsCount)
        Case 2
            mLeft = ScreenW - mWidth - TaskBarSize
            mTop = (mHeight * (FormsCount + 1))
        Case 3
            mLeft = TaskBarSize
            mTop = ScreenH - (mHeight * FormsCount)
        Case 4
            mLeft = ScreenW - mWidth
            mTop = TaskBarSize + (mHeight * (FormsCount + 1))
    End Select

    SetProp hwnd, "mAlpha", Transparency
    SetProp hwnd, "mShowMode", ShowMode

    Select Case ShowMode
        Case Slide
            Call SetWindowPos(hwnd, HWND_TOPMOST, 0, ScreenH, 0, 0, SWP_NOACTIVATE Or SWP_SHOWWINDOW)
        Case Fade
            mTop = mTop - mHeight
            Call SetWindowPos(hwnd, HWND_TOPMOST, mLeft, mTop, mWidth, mHeight, SWP_NOACTIVATE Or SWP_SHOWWINDOW)
            Transparency = 0

        Case InSide
            mLeft = mLeft + mWidth / 2
            mTop = mTop - mHeight + (mHeight / 2)
            Call SetWindowPos(hwnd, HWND_TOPMOST, mLeft, mTop, 0, 0, SWP_NOACTIVATE Or SWP_SHOWWINDOW)
    End Select
    
    
    If Transparency < 255 Then
        Call SetWindowLong(hwnd, GWL_EXSTYLE, GetWindowLong(hwnd, GWL_EXSTYLE) Or WS_EX_LAYERED)
        Call SetLayeredWindowAttributes(hwnd, 0, Transparency, LWA_ALPHA)
    End If
    
    SetProp hwnd, "mTop", mTop
    SetProp hwnd, "mLeft", mLeft
    SetProp hwnd, "mWidth", mWidth
    SetProp hwnd, "mHeight", mHeight
    SetProp hwnd, "TimeOut", TimeOut
    SetProp hwnd, "mValue", 0
    
    SetTimer hwnd, 0, 30, AddressOf TimerForShow
    If PathWav <> "" Then sndPlaySound ByVal PathWav, SND_ASYNC Or SND_NODEFAULT
    
End Sub


Private Sub ShowInSide(hwnd As Long, bShow As Boolean)

    Dim mValue As Long
    Dim TimeOut As Long
    Dim mLeft As Long, mTop As Long
    Dim mWidth As Long, mHeight As Long

    mValue = GetProp(hwnd, "mValue")
    mLeft = GetProp(hwnd, "mLeft")
    mTop = GetProp(hwnd, "mTop")
    mWidth = GetProp(hwnd, "mWidth")
    mHeight = GetProp(hwnd, "mHeight")
    
    If bShow Then
        mValue = mValue + 10
        If mValue > 100 Then
            mValue = 100
            KillTimer hwnd, 0
            TimeOut = GetProp(hwnd, "TimeOut")
            If TimeOut Then
                SetTimer hwnd, 0, TimeOut, AddressOf TimerForOut
            End If
        End If
    Else
        mValue = mValue - 10
        If mValue < 0 Then
            mValue = 0
            KillTimer hwnd, 0
            SendMessage hwnd, WM_CLOSE, 0&, ByVal 0&
            Exit Sub
        End If
    End If
    
    mHeight = mValue * mHeight / 100
    mWidth = mValue * mWidth / 100
    mLeft = mLeft - (mWidth / 2)
    mTop = mTop - (mHeight / 2)

    SetProp hwnd, "mValue", mValue
    MoveWindow hwnd, mLeft, mTop, mWidth, mHeight, 1
 
End Sub


Private Sub ShowFade(hwnd As Long, bShow As Boolean)

    Dim mValue  As Long
    Dim TimeOut As Long
    Dim mAlpha  As Long
    
    mValue = GetProp(hwnd, "mValue")
    mAlpha = GetProp(hwnd, "mAlpha")
    
    If bShow Then
        mValue = mValue + 10
        If mValue > mAlpha Then
            mValue = mAlpha
            KillTimer hwnd, 0
            TimeOut = GetProp(hwnd, "TimeOut")
            If TimeOut Then
                SetTimer hwnd, 0, TimeOut, AddressOf TimerForOut
            End If
        End If
    Else
        mValue = mValue - 10
        If mValue < 0 Then
            mValue = 0
            KillTimer hwnd, 0
            SendMessage hwnd, WM_CLOSE, 0&, ByVal 0&
            Exit Sub
        End If
    End If
    
    SetProp hwnd, "mValue", mValue
    Call SetLayeredWindowAttributes(hwnd, 0, mValue, LWA_ALPHA)
    
End Sub


Private Sub ShowSlide(hwnd As Long, bShow As Boolean)

    Dim mValue As Long
    Dim TimeOut As Long
    Dim mLeft As Long, mTop As Long
    Dim mWidth As Long, mHeight As Long
   
    mValue = GetProp(hwnd, "mValue")
    mLeft = GetProp(hwnd, "mLeft")
    mWidth = GetProp(hwnd, "mWidth")
    mHeight = GetProp(hwnd, "mHeight")
    mTop = GetProp(hwnd, "mTop")

    If bShow Then
        mValue = mValue + 10
        If mValue > mHeight Then
            mValue = mHeight
            KillTimer hwnd, 0
            TimeOut = GetProp(hwnd, "TimeOut")
            If TimeOut Then
                SetTimer hwnd, 0, TimeOut, AddressOf TimerForOut
            End If
        End If
    Else
        mValue = mValue - 10
        If mValue <= 0 Then
            KillTimer hwnd, 0
            SendMessage hwnd, WM_CLOSE, 0&, ByVal 0&
            Exit Sub
        End If
    End If

    mTop = mTop - mValue
    SetProp hwnd, "mValue", mValue
    MoveWindow hwnd, mLeft, mTop, mWidth, mValue, 1

End Sub


Private Sub TimerForShow(ByVal hwnd As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long)

    Dim mShowMode As ShowStyle

    mShowMode = GetProp(hwnd, "mShowMode")
    
    Select Case mShowMode
        Case Fade
            ShowFade hwnd, True
        Case InSide
            ShowInSide hwnd, True
        Case Slide
            ShowSlide hwnd, True
    End Select
    
End Sub


Private Sub TimerForOut(ByVal hwnd As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long)
    KillTimer hwnd, 0
    SetTimer hwnd, 0, 30, AddressOf TimerForHiden
End Sub


Private Sub TimerForHiden(ByVal hwnd As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long)

    Dim mShowMode As ShowStyle
    mShowMode = GetProp(hwnd, "mShowMode")
    
    Select Case mShowMode
        Case Fade
            ShowFade hwnd, False
        Case InSide
            ShowInSide hwnd, False
        Case Slide
            ShowSlide hwnd, False
    End Select
    
End Sub


Public Sub ShowHide(Frm As Form)
    KillTimer Frm.hwnd, 0
    SetTimer Frm.hwnd, 0, 30, AddressOf TimerForHiden
End Sub


Public Function IsLayeredSupported() As Boolean
    Dim T_Version As OSVERSIONINFOEX
    T_Version.dwOSVersionInfoSize = Len(T_Version)
    GetVersionEx T_Version
    If T_Version.dwMajorVersion >= 5 Then IsLayeredSupported = True
End Function






