VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClsZip"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
' ---------------------------------------------------
' Autor:            Leandro I. Ascierto
' Date:             17 de Julio de 2010
' Web:              www.leandroascierto.com.ar
' Requirements:     Windows XP or Later
' History:          06/10/2010 First
' ---------------------------------------------------
Private Declare Function FindWindow Lib "user32.dll" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function ShowWindow Lib "user32.dll" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Private Declare Function GetForegroundWindow Lib "user32.dll" () As Long
Private Declare Function SetForegroundWindow Lib "user32.dll" (ByVal hwnd As Long) As Long
Private Declare Function IsWindowVisible Lib "user32.dll" (ByVal hwnd As Long) As Long
Private Declare Function SetWindowLong Lib "user32.dll" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function IsWindow Lib "user32.dll" (ByVal hwnd As Long) As Long
Private Declare Function FindWindowEx Lib "user32.dll" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Private Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Private Declare Function GetVersion Lib "KERNEL32" () As Long
Private Declare Function SetParent Lib "user32" (ByVal hWndChild As Long, ByVal hWndNewParent As Long) As Long
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long
Private Declare Function GetDesktopWindow Lib "user32.dll" () As Long
Private Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hwnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long

Private Const WM_SYSCOMMAND     As Long = &H112
Private Const SC_CLOSE          As Long = &HF060&
Private Const GWL_EXSTYLE       As Long = -20
Private Const WS_EX_LAYERED     As Long = &H80000
Private Const WS_EX_NOACTIVATE  As Long = &H8000000
Private Const GW_CHILD          As Long = 5
Private Const GW_HWNDNEXT       As Long = 2
Private Const WM_USER           As Long = &H400
Private Const PBM_GETPOS        As Long = (WM_USER + 8)
Private Const PBM_GETRANGE      As Long = (WM_USER + 7)
Private Const SW_HIDE           As Long = 0

Event Progress(ByVal lPercent As Long)
Event EndCompress(ByVal lResult As Boolean)

Private hDialog         As Long
Private hProgress       As Long
Private lPercent        As Long
Private mPercent        As Long
Private hForeGround     As Long
Private OS_Version      As Long
Private SafeCounter     As Long

Private WithEvents cTimer As cTimer
Attribute cTimer.VB_VarHelpID = -1

Public Sub Cancel()
    SendMessage hDialog, WM_SYSCOMMAND, SC_CLOSE, ByVal 0&
End Sub

Public Function UnZipPath(ByVal SrcPath As String, ByVal DestPath As String) As Boolean
    
    On Error GoTo Fail

    Dim oShell As Object
    Dim OrigItem As Object
    Dim DestItem As Object
    
    Set oShell = CreateObject("Shell.Application")
    
    For Each OrigItem In oShell.NameSpace(CVar(SrcPath)).Items
        For Each DestItem In oShell.NameSpace(CVar(DestPath)).Items
            If CBool((OrigItem.Name = DestItem.Name) And (OrigItem.type = DestItem.type)) Then GoTo Fail
        Next
    Next

    Do While FindDialog(hDialog, hProgress)
        SetParent hDialog, FindWindow("Progman", "Program Manager")
    Loop
    
    hDialog = 0
    hProgress = 0
    lPercent = 0
    mPercent = 0
    SafeCounter = 0
    
    hForeGround = GetForegroundWindow
    
    cTimer.CreateTimer 10
    
    oShell.NameSpace(CVar(DestPath)).CopyHere oShell.NameSpace(CVar(SrcPath)).Items
    
    UnZipPath = True
Fail:

End Function


Public Function ZipPath(ByVal SrcPath As String, ByVal DestPath As String) As Boolean
    On Error GoTo Fail

    Dim oShell As Object
    
    If Dir(DestPath) <> "" Then Kill DestPath
    
    Set oShell = CreateObject("Shell.Application")
    
    If Dir(DestPath) = "" Then
        Open DestPath For Binary As #1
            Put #1, , CStr("PK" & Chr(5) & Chr(6) & String(18, Chr(0)))
        Close
    End If
    
    
    Do While FindDialog(hDialog, hProgress)
        SetParent hDialog, FindWindow("Progman", "Program Manager")
    Loop
    
    hDialog = 0
    hProgress = 0
    lPercent = 0
    mPercent = 0
    SafeCounter = 0
    
    hForeGround = GetForegroundWindow

    cTimer.CreateTimer 10
    
    oShell.NameSpace(CVar(DestPath)).CopyHere CVar(SrcPath)

    ZipPath = True
Fail:

End Function


Private Sub Class_Initialize()
    Set cTimer = New cTimer
    OS_Version = (GetVersion And &HFF)
    
End Sub

Private Sub Class_Terminate()
    Set cTimer = Nothing
End Sub

Private Sub cTimer_Timer(ByVal ThisTime As Long)
    Dim lPos As Long

    Dim lProgressMax As Long
    
    SafeCounter = SafeCounter + 1
    

    If SafeCounter = 1000 Then
        cTimer.DestroyTimer
        RaiseEvent EndCompress(False)
        Exit Sub
    End If
    

    If hDialog = 0 Then
        
        If FindDialog(hDialog, hProgress) Then
            SetWindowLong hDialog, GWL_EXSTYLE, WS_EX_LAYERED Or WS_EX_NOACTIVATE
            
            ShowWindow hDialog, 0
            SetForegroundWindow hForeGround
            SafeCounter = 0
        Else
            Exit Sub
        End If
    Else
        If IsWindowVisible(hDialog) Then
            ShowWindow hDialog, 0
            SetForegroundWindow hForeGround
        End If
    End If
    
    If hProgress Then

        If IsWindow(hDialog) = 0 Then
            cTimer.DestroyTimer
            
            RaiseEvent EndCompress(mPercent = 100)
            Exit Sub
        Else
            If lProgressMax = 0 Then
                lProgressMax = SendMessageLong(hProgress, PBM_GETRANGE, ByVal 0&, ByVal 0&)
                If lProgressMax = 0 Then Exit Sub
            End If
            
            lPos = SendMessageLong(hProgress, PBM_GETPOS, ByVal 0&, ByVal 0&)
            
            If lPos > 0 Then
                SafeCounter = 0
                lPercent = (lPos * 100) / lProgressMax
                
                If (mPercent <> lPercent) Then
                    mPercent = lPercent
                    RaiseEvent Progress(mPercent)
                    
                End If
                
            End If
            
        End If
        
    End If
    
    If hDialog Then
        If IsWindow(hDialog) = 0 Then
            cTimer.DestroyTimer
            RaiseEvent EndCompress(mPercent = 100)
            Exit Sub
        End If
    End If

End Sub

Private Function FindDialog(ByRef hWinDialog As Long, hWinProgress As Long) As Boolean
    Dim sBuff As String * 6
    Dim bWnd As Long
    
    bWnd = GetWindow(GetDesktopWindow, GW_CHILD)
    
    Do While bWnd <> 0
        GetClassName bWnd, sBuff, 7
        If sBuff = "#32770" Then
            hWinProgress = FindProgressBar(bWnd)
            If hWinProgress Then
                hWinDialog = bWnd
                FindDialog = True
                Exit Do
            End If
        End If

        bWnd = GetWindow(bWnd, GW_HWNDNEXT)
    Loop

End Function


Private Function FindProgressBar(ByVal hDialog As Long) As Long
    Dim hCtrlNotifySink As Long
    Dim hDirectUIHWND As Long

    If OS_Version = 5 Then
        FindProgressBar = FindWindowEx(hDialog, ByVal 0&, "msctls_progress32", vbNullString)
    Else
        hDirectUIHWND = FindWindowEx(hDialog, ByVal 0&, "DirectUIHWND", vbNullString)

        If hDirectUIHWND Then
            hCtrlNotifySink = GetWindow(hDirectUIHWND, GW_CHILD)
            Do While hCtrlNotifySink
                FindProgressBar = FindWindowEx(hCtrlNotifySink, ByVal 0&, "msctls_progress32", vbNullString)
                If FindProgressBar Then Exit Do
                hCtrlNotifySink = GetWindow(hCtrlNotifySink, GW_HWNDNEXT)
            Loop
        End If
    End If
    
End Function

