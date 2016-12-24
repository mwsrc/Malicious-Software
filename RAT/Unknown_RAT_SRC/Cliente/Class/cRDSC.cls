VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClsScreen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'---------------------------------------------------------------------------------------
' Module    : cRDSC, Remote Desktop Screen Capture
' DateTime  : 05/09/2007 00:35
' Authors   : LeandroA, Cobein
' Purpose   :
' -Adatpte to this projet
'---------------------------------------------------------------------------------------

Option Explicit

Private Const HFRAMES                   As Long = 8 '// Horizontal frames
Private Const VFRAMES                   As Long = 8 '// Vertical frames

Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function BitBlt Lib "gdi32.dll" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function StretchBlt Lib "gdi32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Private Declare Function SetStretchBltMode Lib "gdi32" (ByVal hdc As Long, ByVal nStretchMode As Long) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function GetCursorInfo Lib "user32.dll" (ByRef pci As PCURSORINFO) As Long
Private Declare Function DrawIcon Lib "user32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal hIcon As Long) As Long
Private Declare Function GetIconInfo Lib "user32.dll" (ByVal hIcon As Long, ByRef piconinfo As ICONINFO) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private Declare Function ReleaseDC Lib "user32.dll" (ByVal hwnd As Long, ByVal hdc As Long) As Long


Private Const CAPTUREBLT    As Long = &H40000000
Private Const SRCCOPY       As Long = &HCC0020

Private Type POINTAPI
    x As Long
    y As Long
End Type

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

Private Type DataSend
    FrameCount As Long
    LenData As Long
    PT() As POINTAPI
    Data() As Byte
End Type


Public Event FrameChanged(ByVal Change As Boolean, FramesCount As Long, bCoordData() As Byte, bImageData() As Byte)

Private c_lHFrames          As Long         '// Horizontal frames count
Private c_lVFrames          As Long         '// Vertical frames count

Private c_lFrameW           As Long         '// Frame width
Private c_lFrameH           As Long         '// Frame height

Private c_cTempScreen       As ClsDIB
Private c_CaptureScreen     As ClsDIB
Private c_ScreenBuffer      As ClsDIB

Private c_lvCRCTable()      As Long         '// CRC Checksum Table
Private LastCRCTable()      As Long         '// CRC Checksum Table

Private m_PixelFormat       As PixelFormat
Private DeskDC              As Long
Private cDib                As New ClsDIB
Private m_AdjustedCapture   As Boolean
Private m_ScreenWidth       As Long
Private m_ScreenHeight      As Long
Private m_bDrawCursor       As Boolean
Private SW                  As Long
Private SH                  As Long

Property Let AdjustedCapture(ByVal Value As Boolean)
    m_AdjustedCapture = Value
    If Value Then
        Set c_ScreenBuffer = New ClsDIB
        c_ScreenBuffer.Init SW, SH
    Else
        Set c_ScreenBuffer = Nothing
    End If
    ResetFrames
End Property

Property Get AdjustedCapture() As Boolean
    AdjustedCapture = m_AdjustedCapture
End Property

Property Let PaintCursor(ByVal Value As Boolean)
    m_bDrawCursor = Value
End Property

Property Get PaintCursor() As Boolean
    PaintCursor = m_bDrawCursor
End Property

Property Let HorizontalFrames(ByVal lFrames As Long)
    c_lHFrames = lFrames
    ResetFrames
End Property

Property Get HorizontalFrames() As Long
    HorizontalFrames = c_lHFrames
End Property

Property Let VerticalFrames(ByVal lFrames As Long)
    c_lVFrames = lFrames
    ResetFrames
End Property

Property Get VerticalFrames() As Long
    VerticalFrames = c_lVFrames
End Property

Property Let PixelFormatCompress(ByVal New_PixelFormat As PixelFormat)
    m_PixelFormat = New_PixelFormat
End Property

Property Get PixelFormatCompress() As PixelFormat
    PixelFormatCompress = m_PixelFormat
End Property

Property Let ScreenWidth(ByVal Value As Long)
    If Value = 0 Then
        m_ScreenWidth = SW
    Else
        m_ScreenWidth = Value
    End If
    
    ResetFrames
End Property

Property Get ScreenWidth() As Long
    ScreenWidth = m_ScreenWidth
End Property

Property Let ScreenHeight(ByVal Value As Long)
    If Value = 0 Then
        m_ScreenHeight = SH
    Else
        m_ScreenHeight = Value
    End If
    
    ResetFrames
End Property

Property Get ScreenHeight() As Long
    ScreenHeight = m_ScreenHeight
End Property


Public Sub ResetFrames()

    c_lFrameW = m_ScreenWidth / c_lHFrames   '// Get default frame width
    c_lFrameH = m_ScreenHeight / c_lVFrames  '// Get default frame height

    ReDim c_lvCRCTable(c_lHFrames, c_lVFrames) '// Redim CRC Checksum Table

    cDib.Init c_lFrameW, c_lFrameH, True
    
    c_cTempScreen.Init c_lFrameW, c_lFrameH * (c_lHFrames * c_lVFrames)

    c_CaptureScreen.Init m_ScreenWidth, m_ScreenHeight
    
    If m_AdjustedCapture Then
        SetStretchBltMode c_CaptureScreen.hdc, vbPaletteModeNone
    End If
    
End Sub


Private Sub Class_Initialize()
    Set c_cTempScreen = New ClsDIB

    SW = Screen.Width / Screen.TwipsPerPixelX
    SH = Screen.Height / Screen.TwipsPerPixelY
    
    
    c_lHFrames = HFRAMES '// Set default frames
    c_lVFrames = VFRAMES '// Set default frames
    
    m_ScreenWidth = SW
    m_ScreenHeight = SH
    
    m_PixelFormat = enuPixelFormat8bppIndexed
    
    DeskDC = GetDC(GetDesktopWindow)
    
    Set c_CaptureScreen = New ClsDIB

    ResetFrames
End Sub


Private Sub Class_Terminate()
    '// Cleanup
    ReleaseDC 0&, DeskDC
    Set cDib = Nothing
    Set c_cTempScreen = Nothing
    Set c_CaptureScreen = Nothing
    Set c_ScreenBuffer = Nothing

End Sub


Public Sub UpdateViewport() 'As Boolean
Attribute UpdateViewport.VB_UserMemId = 0
    
    Dim x               As Integer
    Dim y               As Integer
    Dim lRet            As Long
    Dim yPos            As Long
    Dim StrHeather      As String
    Dim bytCoord()      As Byte
    Dim bytData()       As Byte
    Dim FrameCount      As Long
    Dim i               As Long

    If m_AdjustedCapture = False Then
        BitBlt c_CaptureScreen.hdc, 0, 0, c_CaptureScreen.Width, c_CaptureScreen.Height, DeskDC, 0, 0, SRCCOPY Or CAPTUREBLT
        If m_bDrawCursor Then DrawCursor c_CaptureScreen.hdc
    Else
        BitBlt c_ScreenBuffer.hdc, 0, 0, SW, SH, DeskDC, 0, 0, SRCCOPY Or CAPTUREBLT
        If m_bDrawCursor Then DrawCursor c_ScreenBuffer.hdc
        StretchBlt c_CaptureScreen.hdc, 0, 0, c_CaptureScreen.Width, c_CaptureScreen.Height, c_ScreenBuffer.hdc, 0, 0, SW, SH, SRCCOPY
    End If
    

    For x = 0 To c_lHFrames - 1
                
        For y = 0 To c_lVFrames - 1

            BitBlt cDib.hdc, 0, 0, c_lFrameW, c_lFrameH, c_CaptureScreen.hdc, c_lFrameW * x, c_lFrameH * y, vbSrcCopy
            
            lRet = cDib.CRC

            If Not lRet = c_lvCRCTable(x, y) Then
                
                c_lvCRCTable(x, y) = lRet

                ReDim Preserve bytCoord(i + 1)
                
                bytCoord(i) = x
                bytCoord(i + 1) = y
                
                i = i + 2

                BitBlt c_cTempScreen.hdc, 0, yPos, c_lFrameW, c_lFrameH, cDib.hdc, 0, 0, vbSrcCopy
                yPos = yPos + c_lFrameH
                
            End If
           
        Next y
    Next x

    If yPos Then
        GetStreamFromBitmap c_cTempScreen.hBitmap, m_PixelFormat, bytData, c_lFrameW, yPos

        FrameCount = UBound(bytCoord) / 2

        RaiseEvent FrameChanged(True, FrameCount, bytCoord, bytData)
    Else
        RaiseEvent FrameChanged(False, 0, bytCoord, bytData)
    End If
    

End Sub


Private Function DrawCursor(ByVal hdc As Long) As Boolean
    Dim CI  As PCURSORINFO
    Dim II As ICONINFO
    
    CI.cbSize = &H14
    
    If GetCursorInfo(CI) Then
        If GetIconInfo(CI.hCursor, II) Then
            DrawCursor = DrawIcon(hdc, CI.ptScreenPos.x - II.xHotspot, CI.ptScreenPos.y - II.yHotspot, CI.hCursor)
            If II.hbmColor Then DeleteObject II.hbmColor
            If II.hbmMask Then DeleteObject II.hbmMask
        End If
    End If
End Function

