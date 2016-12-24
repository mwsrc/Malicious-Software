VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClsDIB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
' En orígen a VBAcelerator.
Private Declare Function CreateDIBSection Lib "gdi32.dll" (ByVal hdc As Long, ByRef pBMI As BITMAPINFO, ByVal iUsage As Long, ByRef ppvBits As Long, ByVal hSection As Long, ByVal dwOffset As Long) As Long
Private Declare Function GetDeviceCaps Lib "gdi32.dll" (ByVal hdc As Long, ByVal nIndex As Long) As Long
Private Declare Function CreateCompatibleDC Lib "gdi32.dll" (ByVal hdc As Long) As Long
Private Declare Function DeleteDC Lib "gdi32.dll" (ByVal hdc As Long) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private Declare Function SelectObject Lib "gdi32.dll" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function GetObject Lib "gdi32" Alias "GetObjectA" (ByVal hObject As Long, ByVal nCount As Long, lpObject As Any) As Long
Private Declare Function VarPtrArray Lib "msvbvm60.dll" Alias "VarPtr" (ptr() As Any) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pDst As Any, pSrc As Any, ByVal ByteLen As Long)

Private Type BITMAPINFOHEADER                               ' 40 bytes
    biSize                      As Long
    biWidth                     As Long
    biHeight                    As Long
    biPlanes                    As Integer
    biBitCount                  As Integer
    biCompression               As Long
    biSizeImage                 As Long
    biXPelsPerMeter             As Long
    biYPelsPerMeter             As Long
    biClrUsed                   As Long
    biClrImportant              As Long
End Type

Private Type SAFEARRAYBOUND
    cElements                   As Long
    lLbound                     As Long
End Type

Private Type SAFEARRAY1D
    cDims                       As Integer
    fFeatures                   As Integer
    cbElements                  As Long
    cLocks                      As Long
    pvData                      As Long
    Bounds(0 To 0)              As SAFEARRAYBOUND
End Type

Private Type BITMAP
    bmType                      As Long
    bmWidth                     As Long
    bmHeight                    As Long
    bmWidthBytes                As Long
    bmPlanes                    As Integer
    bmBitsPixel                 As Integer
    bmBits                      As Long
End Type

Private Type BITMAPINFO
    bmiHeader                   As BITMAPINFOHEADER
    bmiColors(0 To 255)         As Long
End Type

Private Const DIB_RGB_COLORS    As Long = &H0           ' Colour table in RGBs
Private Const HORZSIZE          As Long = &H4           ' Horizontal size in millimetres
Private Const VERTSIZE          As Long = &H6           ' Vertical size in millimetres
Private Const HORZRES           As Long = &H8           ' Horizontal width in pixels
Private Const VERTRES           As Long = &HA           ' Vertical width in pixels
Private Const BI_RGB            As Long = &H0

Dim c_cCRC                      As ClsCRC
Dim Pict()                      As Byte
Dim DibDC                       As Long
Dim DIBInf                      As BITMAPINFO
Dim Safe                        As SAFEARRAY1D
Dim Bmp                         As BITMAP
Dim hOldBMP                     As Long
Dim hDIB                        As Long
Dim BBB As Boolean

Property Get Width() As Long
    Width = DIBInf.bmiHeader.biWidth
End Property


Property Get Height() As Long
    Height = DIBInf.bmiHeader.biHeight
End Property

Property Get hBitmap() As Long
    hBitmap = hDIB
End Property

Property Get hdc() As Long
    hdc = DibDC
End Property


Property Get CRC() As Long
    CRC = CLng(c_cCRC.CalculateBytes(Pict))
End Property


Public Sub Init(ByVal Width As Long, ByVal Height As Long, Optional copyB As Boolean)

    If DibDC <> 0 Then ClearUp

    DibDC = CreateCompatibleDC(0)
    
    With DIBInf.bmiHeader
        .biSize = Len(DIBInf.bmiHeader)
        .biWidth = Width
        .biHeight = Height
        .biPlanes = 1
        .biBitCount = 24
        .biCompression = BI_RGB
        .biSizeImage = AlignScan(.biWidth, .biBitCount) * .biHeight
        .biXPelsPerMeter = (GetDeviceCaps(DibDC, HORZRES) / GetDeviceCaps(DibDC, HORZSIZE)) * 1000
        .biYPelsPerMeter = (GetDeviceCaps(DibDC, VERTRES) / GetDeviceCaps(DibDC, VERTSIZE)) * 1000
    End With
   
    hDIB = CreateDIBSection(DibDC, DIBInf, DIB_RGB_COLORS, 0, 0, 0)
    hOldBMP = SelectObject(DibDC, hDIB)
    
    BBB = copyB
    
    If BBB Then
    
        Set c_cCRC = New ClsCRC
        c_cCRC.Algorithm = CRC32
        
        Call GetObject(hDIB, Len(Bmp), Bmp)
        
        With Safe
            .cbElements = 1
            .cDims = 1
            .Bounds(0).lLbound = 0
            .Bounds(0).cElements = DIBInf.bmiHeader.biSizeImage
            .pvData = Bmp.bmBits
        End With
        
    Call CopyMemory(ByVal VarPtrArray(Pict), VarPtr(Safe), 4)

    End If
End Sub

Private Sub ClearUp()

    DeleteObject SelectObject(DibDC, hOldBMP)
    If BBB Then CopyMemory ByVal VarPtrArray(Pict), 0&, 4
    DeleteDC DibDC
    DibDC = 0: hOldBMP = 0
End Sub


Private Function AlignScan(ByVal inWidth As Long, ByVal inDepth As Integer) As Long
    AlignScan = (((inWidth * inDepth) + &H1F) And Not &H1F&) \ &H8
End Function

Private Sub Class_Terminate()
    If DibDC <> 0 Then ClearUp
    Set c_cCRC = Nothing
End Sub
