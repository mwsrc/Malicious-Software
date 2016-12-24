VERSION 5.00
Begin VB.Form FrmDesktop 
   AutoRedraw      =   -1  'True
   Caption         =   "Escritorio Remoto"
   ClientHeight    =   6000
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   9150
   Icon            =   "FrmDesktop.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6000
   ScaleWidth      =   9150
   StartUpPosition =   3  'Windows Default
   Begin Servidor.ScrollControl ScrollControl1 
      Height          =   2175
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   2655
      _ExtentX        =   4683
      _ExtentY        =   3836
      BackColor       =   0
      BorderStyle     =   0
      AutoScrollToFocus=   0   'False
      Begin VB.PictureBox PicRender 
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   1335
         Left            =   600
         ScaleHeight     =   89
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   97
         TabIndex        =   0
         Top             =   600
         Width           =   1455
      End
   End
   Begin VB.Menu MnuVer 
      Caption         =   "Ver"
      Begin VB.Menu SubMnuVer 
         Caption         =   "Pixel Format 1bpp"
         Index           =   0
      End
      Begin VB.Menu SubMnuVer 
         Caption         =   "Pixel Format 4bpp"
         Checked         =   -1  'True
         Index           =   1
      End
      Begin VB.Menu SubMnuVer 
         Caption         =   "Pixel Format 8bpp"
         Index           =   2
      End
      Begin VB.Menu SubMnuVer 
         Caption         =   "Pixel Format 16bpp"
         Index           =   3
      End
      Begin VB.Menu SubMnuVer 
         Caption         =   "Pixel Format 24bpp"
         Index           =   4
      End
      Begin VB.Menu SubMnuVer 
         Caption         =   "-"
         Index           =   5
      End
      Begin VB.Menu SubMnuVer 
         Caption         =   "Ajustar a la Ventana"
         Index           =   6
      End
      Begin VB.Menu SubMnuVer 
         Caption         =   "-"
         Index           =   7
      End
      Begin VB.Menu SubMnuVer 
         Caption         =   "FullScreen"
         Index           =   8
         Shortcut        =   {F11}
      End
   End
   Begin VB.Menu MnuOpciones 
      Caption         =   "Opciones"
      Begin VB.Menu SubMnuOpciones 
         Caption         =   "Controlar el Cursor"
         Index           =   0
      End
      Begin VB.Menu SubMnuOpciones 
         Caption         =   "Controlar Telado"
         Index           =   1
      End
      Begin VB.Menu SubMnuOpciones 
         Caption         =   "Enviar Portapapeles"
         Index           =   2
      End
      Begin VB.Menu SubMnuOpciones 
         Caption         =   "Recibir Portapapeles"
         Index           =   3
      End
   End
End
Attribute VB_Name = "FrmDesktop"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Sub InitCommonControls Lib "Comctl32" ()
Private Declare Function LoadLibrary Lib "kernel32.dll" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function FreeLibrary Lib "kernel32.dll" (ByVal hLibModule As Long) As Long
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal Msg As Long, wParam As Any, lParam As Any) As Long
Private Declare Function GetSystemMetrics Lib "user32" (ByVal nIndex As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Function SetClipboardViewer Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function IsClipboardFormatAvailable Lib "user32" (ByVal wFormat As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetWindowPos Lib "user32.dll" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function GetIconInfo Lib "user32.dll" (ByVal hIcon As Long, ByRef piconinfo As ICONINFO) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private Declare Function CreateIconIndirect Lib "user32.dll" (ByRef piconinfo As ICONINFO) As Long
Private Declare Function CreateIconFromResourceEx Lib "user32.dll" (ByRef presbits As Any, ByVal dwResSize As Long, ByVal fIcon As Long, ByVal dwVer As Long, ByVal cxDesired As Long, ByVal cyDesired As Long, ByVal Flags As Long) As Long
Private Declare Function DestroyIcon Lib "user32.dll" (ByVal hIcon As Long) As Long
Private Declare Function DestroyCursor Lib "user32.dll" (ByVal hCursor As Long) As Long
Private Declare Function SetCursor Lib "user32.dll" (ByVal hCursor As Long) As Long
Private Declare Function RtlGetCompressionWorkSpaceSize Lib "NTDLL" (ByVal Flags As Integer, WorkSpaceSize As Long, UNKNOWN_PARAMETER As Long) As Long
Private Declare Function NtAllocateVirtualMemory Lib "ntdll.dll" (ByVal ProcHandle As Long, BaseAddress As Long, ByVal NumBits As Long, regionsize As Long, ByVal Flags As Long, ByVal ProtectMode As Long) As Long
Private Declare Function RtlCompressBuffer Lib "NTDLL" (ByVal Flags As Integer, ByVal BuffUnCompressed As Long, ByVal UnCompSize As Long, ByVal BuffCompressed As Long, ByVal CompBuffSize As Long, ByVal UNKNOWN_PARAMETER As Long, OutputSize As Long, ByVal WorkSpace As Long) As Long
Private Declare Function RtlDecompressBuffer Lib "NTDLL" (ByVal Flags As Integer, ByVal BuffUnCompressed As Long, ByVal UnCompSize As Long, ByVal BuffCompressed As Long, ByVal CompBuffSize As Long, OutputSize As Long) As Long
Private Declare Function NtFreeVirtualMemory Lib "ntdll.dll" (ByVal ProcHandle As Long, BaseAddress As Long, regionsize As Long, ByVal Flags As Long) As Long
Private Declare Function GetMenu Lib "user32.dll" (ByVal hwnd As Long) As Long
Private Declare Function SetMenu Lib "user32.dll" (ByVal hwnd As Long, ByVal hMenu As Long) As Long
Private Declare Function ClientToScreen Lib "user32.dll" (ByVal hwnd As Long, ByRef lpPoint As POINTAPI) As Long
Private Declare Function ScreenToClient Lib "user32.dll" (ByVal hwnd As Long, ByRef lpPoint As POINTAPI) As Long


Private Const HWND_TOPMOST          As Long = -1
Private Const HWND_NOTOPMOST        As Long = -2

Private Const SWP_NOACTIVATE        As Long = &H10
Private Const SWP_NOSIZE            As Long = &H1
Private Const SWP_NOMOVE            As Long = &H2
Private Const SWP_SHOWWINDOW        As Long = &H40

Private Const GWL_STYLE             As Long = (-16)

Private Const WS_MAXIMIZEBOX        As Long = &H10000
Private Const WS_MINIMIZEBOX        As Long = &H20000
Private Const WS_THICKFRAME         As Long = &H40000
Private Const WS_SYSMENU            As Long = &H80000
Private Const WS_CAPTION            As Long = &HC00000

'// SystemMetrics Constantes (usado en el ancho y alto del los Scroll).
Private Const SM_CYHSCROLL          As Long = 3
Private Const SM_CXVSCROLL          As Long = 2

'// Windows Constantes (para interceptar los eventos del PicRender).
Private Const WM_MOUSEMOVE          As Long = &H200
Private Const WM_LBUTTONDBLCLK      As Long = &H203
Private Const WM_LBUTTONDOWN        As Long = &H201
Private Const WM_LBUTTONUP          As Long = &H202
Private Const WM_RBUTTONDBLCLK      As Long = &H206
Private Const WM_RBUTTONDOWN        As Long = &H204
Private Const WM_RBUTTONUP          As Long = &H205
Private Const WM_KEYDOWN            As Long = &H100
Private Const WM_KEYUP              As Long = &H101
Private Const WM_SYSKEYUP           As Long = &H105
Private Const WM_SYSKEYDOWN         As Long = &H104
Private Const WM_CHAR               As Long = &H102
Private Const WM_CONTEXTMENU        As Long = &H7B
Private Const WM_MOUSEWHEEL         As Long = &H20A
Private Const WM_DRAWCLIPBOARD      As Long = &H308
Private Const WM_ENTERSIZEMOVE      As Long = &H231
Private Const WM_EXITSIZEMOVE       As Long = &H232
Private Const WM_SIZING             As Long = &H214

Private Const ICRESVER              As Long = &H30000
Private Const LR_DEFAULTSIZE        As Long = &H40



' Utilizado para la creación del icono del cursor.
Private Type ICONINFO
    fIcon       As Long
    xHotspot    As Long
    yHotspot    As Long
    hbmMask     As Long
    hbmColor    As Long
End Type

Private Type POINTAPI
    X           As Long
    Y           As Long
End Type


' Tipo para almacenar los cursores en memoria.
Private Type CacheCursors
    id          As Long
    hCursor     As Long
End Type


Private Const Delim3 As String = "@&|?"

Private WithEvents cSubClass        As clsSubClass
Attribute cSubClass.VB_VarHelpID = -1

Public ParentID             As Long
Public SocketID             As Long

Private m_Data              As String
Dim CC()                    As CacheCursors
Dim hCurrentCursor          As Long
Private mCord()             As Byte
Private mImageData()        As Byte
Private mIndexPixelFormat   As Long
Private bAdjustedCapture    As Long
Private bFullScreen         As Long
Private RemScreenW          As Long
Private RemScreenH          As Long
Private hMenu               As Long
Private FrameW              As Long
Private FrameH              As Long
Private bDrawPicture        As Boolean
Private bIsMaximezed        As Boolean
Private bSendMouse          As Boolean
Private bSendKeys           As Boolean
Private bSendClipboard      As Boolean
Private bRecibedClipboard   As Boolean
Private RemoteClipboardChange As Boolean


Private Sub cSubClass_WindowProc(bBefore As Boolean, bHandled As Boolean, lReturn As Long, hwnd As Long, uMsg As Long, wParam As Long, lParam As Long)
    On Error Resume Next
    
    If bFullScreen = True And uMsg = WM_KEYUP And wParam = vbKeyEscape Then
        FormFullScreen False
    End If
    

    If hwnd = Me.hwnd Then
    
    
     If uMsg = WM_KEYUP And wParam = vbKeyF11 Then
        If bFullScreen = False Then
            FormFullScreen True
        Else
            FormFullScreen False
        End If
        Exit Sub
    End If
                        
    
        ' Cuando la captura es de modo ajustado y se cambia el tamaño del formulario,
        ' se crea un efecto estirando y repintando la última captura recibida.
        Select Case uMsg
            Case WM_SIZING
                If bAdjustedCapture = True And bDrawPicture = False Then
                    PicRender = PicRender.Image
                    PicRender = PicRender.Image
                    bDrawPicture = True
                End If
           
            
            Case WM_EXITSIZEMOVE
                If bAdjustedCapture = True And bDrawPicture = True Then
                    bDrawPicture = False
                    FrameW = PicRender.ScaleWidth / 8
                    FrameH = PicRender.ScaleHeight / 8
                    SendMSG 3, PicRender.ScaleWidth, PicRender.ScaleHeight, 1
                    'PicRender = Nothing
                    
                End If
            
            
            Case WM_DRAWCLIPBOARD
                If bSendClipboard = False Then Exit Sub
                If Not RemoteClipboardChange Then
                    If IsClipboardFormatAvailable(vbCFText) <> 0 Then
                        SendMSG 5, Clipboard.GetText
                    End If
                End If
                
        End Select
    
    Else
    
        Select Case uMsg
        
            Case WM_MOUSEMOVE
            
                If bSendMouse = False Then Exit Sub
                
                If hCurrentCursor <> 0 Then SetCursor hCurrentCursor
                If bAdjustedCapture Then
                    Dim PT As POINTAPI
                    Dim PercentX As Single
                    Dim PercentY As Single
                    
                    PT.X = LoWord(lParam)
                    PT.Y = HiWord(lParam)
                    
                    PercentX = (PT.X * 100) / (PicRender.ScaleWidth)
                    PT.X = (RemScreenW * PercentX) / 100
                    
                    PercentY = (PT.Y * 100) / (PicRender.ScaleHeight)
                    PT.Y = (RemScreenH * PercentY) / 100
        
                    SendMSG uMsg, wParam, PT.X, PT.Y
                Else
                    PT.X = LoWord(lParam)
                    PT.Y = HiWord(lParam)
                    SendMSG uMsg, wParam, PT.X, PT.Y
                End If
                
            Case WM_LBUTTONDOWN, WM_LBUTTONUP, WM_LBUTTONDBLCLK, WM_RBUTTONDOWN, WM_RBUTTONUP, WM_RBUTTONDBLCLK, WM_MOUSEWHEEL ', WM_KEYUP, WM_SYSKEYUP, WM_SYSKEYDOWN, WM_CONTEXTMENU, WM_CHAR, WM_KEYDOWN
                If bSendMouse = False Then Exit Sub
                If hCurrentCursor <> 0 Then SetCursor hCurrentCursor
                SendMSG uMsg, wParam, lParam
                
                

        End Select
                
    End If

End Sub

Private Function SendMSG(ByVal wMsg As String, ParamArray vParam()) As Boolean
    Dim sParam As String
    Dim vItem As Variant
    
    If SocketID = 0 Then Exit Function
    
    For Each vItem In vParam
        sParam = sParam & Delimiter & vItem
    Next
    SendMSG = WinSock32.SendData(SocketID, wMsg & sParam & END_DATA)
End Function

' Almacena en un array el handle del cursor creado.
Private Function AddCursorToCache(id As Long, hCursor As Long) As Boolean
    Dim lCount As Long
    lCount = UBound(CC)
    CC(lCount).id = id
    CC(lCount).hCursor = hCursor
    ReDim Preserve CC(lCount + 1)
    hCurrentCursor = hCursor
    SetCursor hCursor
End Function


' Verifica mediante el id (handle del cursor remoto) si el handle ya fue enviado.
Private Function ExistCursorInCache(ByVal id As Long) As Long
    Dim i As Long
    ExistCursorInCache = -1
    For i = 0 To UBound(CC)
        If CC(i).id = id Then
            ExistCursorInCache = i
            Exit Function
        End If
    Next
End Function


' Elimina todos los cursores de la memoria.
Private Sub ClearCacheCursor()
    On Error Resume Next
    Dim i As Long
    For i = 0 To UBound(CC)
        DestroyCursor CC(i).hCursor
    Next
    ReDim CC(0)
    hCurrentCursor = 0
End Sub

' Función para crear un cursor a partir de un array de bytes.
Public Function LoadCursorFromStream(bData() As Byte) As Long

    Dim hIcon As Long
    Dim dwOffset As Long, dwSize As Long
    Dim ICI As ICONINFO

    dwSize = VarPtr(bData(14&))             ' Get size of icon resource
    dwOffset = VarPtr(bData(bData(18&)))    ' Get offset into the array

    hIcon = CreateIconFromResourceEx(ByVal dwOffset, ByVal dwSize, 1, ICRESVER, 0&, 0&, LR_DEFAULTSIZE)
    
    If hIcon Then

        Call GetIconInfo(hIcon, ICI)
        
        ICI.xHotspot = bData(10&)
        ICI.yHotspot = bData(12&)
        ICI.fIcon = 0
        
        LoadCursorFromStream = CreateIconIndirect(ICI)
        
        If ICI.hbmColor <> 0 Then DeleteObject ICI.hbmColor
        If ICI.hbmMask <> 0 Then DeleteObject ICI.hbmMask
        
        DestroyIcon hIcon

    End If

End Function


Public Sub Socket_DataArrival(id As Long, IP As String, Puerto As String, Data As String)
    On Error GoTo ErrHaddle
    
    Dim lRet1       As Long
    Dim lRet2       As Long
    Dim sCommand    As String
    Dim sBuf        As String
    Dim sItem()     As String
    Dim Index As Long
    
    m_Data = m_Data & Data

    lRet1 = InStr(m_Data, END_DATA)
    
    If lRet1 Then
   
        sBuf = Left$(m_Data, lRet1 - 1)
        m_Data = Mid$(m_Data, lRet1 + Len(END_DATA))

        lRet2 = InStr(sBuf, Delimiter)
        sCommand = Left(sBuf, lRet2 - 1)
        sBuf = Mid(sBuf, lRet2 + 1)

        Select Case sCommand
        
            Case 0
            
                mCord = StrConv(sBuf, vbFromUnicode)
                

            Case 1
                mImageData = StrConv(sBuf, vbFromUnicode)
                Call WinSock32.SendData(SocketID, "1" & Delimiter & END_DATA)
                Render
               
            Case 2
                sItem = Split(sBuf, Delimiter)
                RemScreenW = sItem(0)
                RemScreenH = sItem(1)
                FrameW = RemScreenW / 8
                FrameH = RemScreenH / 8
                PicRender.Width = RemScreenW * Screen.TwipsPerPixelX
                PicRender.Height = RemScreenH * Screen.TwipsPerPixelY
                Form_Resize
                DoEvents
                ScrollControl1.RefreshScroll
            Case 3
                Index = ExistCursorInCache(sBuf)
                If Index <> -1 Then
                    hCurrentCursor = CC(Index).hCursor
                    SetCursor hCurrentCursor
                Else
                    SendMSG 4, sBuf
                End If
            Case 4 'Cusor
                sItem = Split(sBuf, Delim3)
                Dim IdCursor As Long
                Dim hCursor As Long
                Dim BitCursor() As Byte
                
                IdCursor = sItem(0)
                BitCursor = StrConv(sItem(1), vbFromUnicode)
                hCursor = LoadCursorFromStream(BitCursor)
                
                If hCursor <> 0 Then
                    AddCursorToCache IdCursor, hCursor
                End If
            Case 5 'Clipboard
                RemoteClipboardChange = True
                Clipboard.Clear
                Clipboard.SetText sBuf
                DoEvents
                RemoteClipboardChange = False
                
        End Select
        
        If Len(m_Data) Then
            If InStr(m_Data, END_DATA) Then Call Me.Socket_DataArrival(id, IP, Puerto, vbNullString)
        End If
        
    End If
    Exit Sub
ErrHaddle:
    'm_Data = vbNullString
    'Call WinSock32.SendData(SocketID, "1" & Delimiter & END_DATA) 'Actualizar
    Debug.Print "Error: " & err.Description
End Sub

Private Sub Render()
    Dim i As Long
    Dim X As Long, Y As Long
    
    If bDrawPicture Then Exit Sub
    DrawDeskTop PicRender.hdc, mImageData, mCord, FrameW, FrameH
    PicRender.Refresh
End Sub

        
Public Sub Socket_Close(id As Long, IP As String, Puerto As String)
    Set cSubClass = Nothing
    Set PicRender.Picture = Nothing
    PicRender.Enabled = False
    TerminateConnection SocketID
    SocketID = 0
    Me.Caption = "Escritorio Remoto - Sin Conexión"
End Sub


Private Sub Form_Load()
    Set cSubClass = New clsSubClass
    Call WinSock32.SendData(SocketID, "0" & Delimiter & END_DATA)
    PicRender.Move 0, 0, Me.ScaleWidth / 2, Me.ScaleHeight / 2
    ScrollControl1.AutoScroll = True
    SetClipboardViewer Me.hwnd
    
    ReDim CC(0)
    
     With cSubClass
        .ssc_Subclass Me.hwnd
        .ssc_AddMsg Me.hwnd, WM_SIZING, MSG_BEFORE
        .ssc_AddMsg Me.hwnd, WM_EXITSIZEMOVE, MSG_AFTER
        .ssc_AddMsg Me.hwnd, WM_DRAWCLIPBOARD, MSG_AFTER
        '-----------------
        .ssc_Subclass PicRender.hwnd                                ' Start Subclass.
        .ssc_AddMsg PicRender.hwnd, WM_MOUSEMOVE, MSG_AFTER
        .ssc_AddMsg PicRender.hwnd, WM_LBUTTONDOWN, MSG_AFTER
        .ssc_AddMsg PicRender.hwnd, WM_LBUTTONUP, MSG_AFTER
        .ssc_AddMsg PicRender.hwnd, WM_LBUTTONDBLCLK, MSG_AFTER
        .ssc_AddMsg PicRender.hwnd, WM_RBUTTONDOWN, MSG_AFTER
        .ssc_AddMsg PicRender.hwnd, WM_RBUTTONUP, MSG_AFTER
        .ssc_AddMsg PicRender.hwnd, WM_RBUTTONDBLCLK, MSG_AFTER
        .ssc_AddMsg PicRender.hwnd, WM_KEYDOWN, MSG_AFTER
        .ssc_AddMsg PicRender.hwnd, WM_KEYUP, MSG_AFTER
        .ssc_AddMsg PicRender.hwnd, WM_SYSKEYUP, MSG_AFTER
        .ssc_AddMsg PicRender.hwnd, WM_SYSKEYDOWN, MSG_AFTER
        .ssc_AddMsg PicRender.hwnd, WM_CHAR, MSG_AFTER
        .ssc_AddMsg PicRender.hwnd, WM_CONTEXTMENU, MSG_AFTER
        .ssc_AddMsg PicRender.hwnd, WM_MOUSEWHEEL, MSG_AFTER
    End With
    
    
    bSendMouse = SubMnuOpciones(0).Checked
    bSendKeys = SubMnuOpciones(1).Checked
    bSendClipboard = SubMnuOpciones(2).Checked
    bRecibedClipboard = SubMnuOpciones(3).Checked
    SendMSG 6, bRecibedClipboard
    MdlINI.ReadFormPosAndSize Me
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    If Me.WindowState = vbMinimized Then Exit Sub
    
    If bAdjustedCapture Then

 
            Dim pLeft As Long, pTop As Long
            Dim ReqWidth As Long, ReqHeight As Long
            Dim HScale As Double, VScale As Double
            Dim MyScale As Double
    
    
            HScale = Me.ScaleWidth / RemScreenW
            VScale = (Me.ScaleHeight - 30) / RemScreenH
            
            MyScale = IIf(VScale >= HScale, HScale, VScale)
    
            ReqWidth = RemScreenW * MyScale
            ReqHeight = RemScreenH * MyScale
        
            pLeft = (Me.ScaleWidth - ReqWidth) / 2
            pTop = (Me.ScaleHeight - ReqHeight) / 2
            
            PicRender.Move pLeft, pTop, ReqWidth, ReqHeight
            
            If bDrawPicture Then
                PicRender.PaintPicture PicRender.Picture, 0, 0, PicRender.ScaleWidth, PicRender.ScaleHeight
            End If

            FrameW = PicRender.ScaleWidth / 8
            FrameH = PicRender.ScaleHeight / 8

            If Me.WindowState = vbMaximized Then
                bIsMaximezed = True
                'DoEvents
                If Not PicRender.Picture Is Nothing Then
                    PicRender.PaintPicture PicRender.Picture, 0, 0, PicRender.ScaleWidth, PicRender.ScaleHeight
                End If
                SendMSG "3", PicRender.ScaleWidth, PicRender.ScaleHeight, 1
                
            Else
                If bIsMaximezed Then
                    bIsMaximezed = False
                    If Not PicRender.Picture Is Nothing Then
                        PicRender.PaintPicture PicRender, 0, 0, PicRender.ScaleWidth, PicRender.ScaleHeight
                    End If
                    SendMSG "3", PicRender.ScaleWidth, PicRender.ScaleHeight, 1
                End If
            End If
    End If
    
    
    ScrollControl1.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If SocketID Then
        'Call WinSock32.SendData(SocketID, "1" & Delimiter & END_DATA)
     
        TerminateConnection SocketID
        WinSock32.WsClose SocketID

    End If
    ClearCacheCursor
    MdlINI.SaveFormPosAndSize Me
End Sub

' Rutina para poner o quitar el formulario de pantalla completa.
Private Sub FormFullScreen(ByVal Value As Boolean)
    On Error Resume Next
    Dim WndStyle As Long
    WndStyle = GetWindowLong(hwnd, GWL_STYLE)
    
    PicRender = PicRender.Image
    bDrawPicture = True
    
    If Value Then
        SetWindowLong hwnd, GWL_STYLE, WndStyle And Not WS_MAXIMIZEBOX And Not WS_MINIMIZEBOX And Not WS_THICKFRAME And Not WS_CAPTION
        If Me.WindowState = vbMaximized Then
            SetWindowPos hwnd, HWND_TOPMOST, 0, 0, Screen.Width / Screen.TwipsPerPixelX, Screen.Height / Screen.TwipsPerPixelY, SWP_NOACTIVATE
        Else
            SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOACTIVATE Or SWP_NOSIZE Or SWP_NOMOVE
        End If
        PicRender.SetFocus
        hMenu = GetMenu(Me.hwnd)
        SetMenu Me.hwnd, 0
        Me.WindowState = vbMaximized
        bFullScreen = True
        SubMnuVer(8).Checked = True
    Else
        SetWindowPos hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOACTIVATE Or SWP_NOSIZE Or SWP_NOMOVE
        SetWindowLong hwnd, GWL_STYLE, WndStyle Or WS_MAXIMIZEBOX Or WS_MINIMIZEBOX Or WS_THICKFRAME Or WS_CAPTION
        SetMenu Me.hwnd, hMenu
        Me.WindowState = vbNormal
        bFullScreen = False
        SubMnuVer(8).Checked = False
    End If
    bDrawPicture = False
End Sub

Private Sub PicRender_GotFocus()
    If bFullScreen Then
        hMenu = GetMenu(Me.hwnd)
        SetMenu Me.hwnd, 0
    End If
End Sub

Private Sub PicRender_KeyDown(KeyCode As Integer, Shift As Integer)
    If bSendKeys = False Then Exit Sub
    If KeyCode <> vbKeyControl And KeyCode <> vbKeyShift And KeyCode <> vbKeyMenu Then
        SendMSG WM_KEYDOWN, KeyCode, Shift
    End If
End Sub



Private Sub SubMnuOpciones_Click(Index As Integer)

    SubMnuOpciones(Index).Checked = Not SubMnuOpciones(Index).Checked
    
    Select Case Index
        Case 0
            SendMSG 7, Not SubMnuOpciones(Index).Checked
            bSendMouse = Not bSendMouse
        Case 1
            bSendKeys = Not bSendKeys
        Case 2
            bSendClipboard = Not bSendClipboard
        Case 3
            SendMSG 6, SubMnuOpciones(Index).Checked
            bRecibedClipboard = Not bRecibedClipboard
    End Select

End Sub

Private Sub SubMnuVer_Click(Index As Integer)
    Dim i As Integer
    Select Case Index
        Case Is < 5 ' Calidad de la captura.
            mIndexPixelFormat = Index
            SendMSG "2", mIndexPixelFormat
            For i = 0 To 4
                 SubMnuVer(i).Checked = Index = i
            Next
            
        Case 6  ' Ajustar a la ventana.
            bAdjustedCapture = Not SubMnuVer(Index).Checked
            
            SubMnuVer(Index).Checked = bAdjustedCapture
            
            If bAdjustedCapture Then
                PicRender.Move 0, 0, 1, 1
                ScrollControl1.RefreshScroll
                Form_Resize
                DoEvents
                PicRender.Picture = PicRender.Image
                SendMSG 3, PicRender.ScaleWidth, PicRender.ScaleHeight, 1
            Else
                PicRender.Picture = Nothing
                FrameW = RemScreenW / 8
                FrameH = RemScreenH / 8
                PicRender.Move 0, 0, RemScreenW * Screen.TwipsPerPixelX, RemScreenH * Screen.TwipsPerPixelY
                ScrollControl1.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight
                DoEvents
                ScrollControl1.RefreshScroll
                SendMSG 3, 0, 0, 0
            End If
            
        Case 8  'FullScreen
            If bFullScreen = False Then
                FormFullScreen True
            Else
                FormFullScreen False
            End If
            
    End Select
End Sub

' Devuelve el DWord de dos números pasado como parámetro.
Function MakeDWord(ByVal LoWord As Long, ByVal HiWord As Long) As Long
      MakeDWord = (HiWord * &H10000) Or (LoWord And &HFFFF&)
End Function

 ' Devuelve el LoWord del número pasado como parámetro.
Private Function LoWord(ByVal Numero As Long) As Long
    LoWord = Numero And &HFFFF&
End Function


' Devuelve el HiWord del número pasado como parámetro.
Private Function HiWord(ByVal Numero As Long) As Long
    HiWord = Numero \ &H10000 And &HFFFF&
End Function

