Attribute VB_Name = "modGdipThumbnailStream"
Option Explicit

Private Declare Function GdiplusStartup Lib "gdiplus" (Token As Long, inputbuf As GdiplusStartupInput, Optional ByVal outputbuf As Long = 0) As Long
Private Declare Function GdipDisposeImage Lib "gdiplus" (ByVal Image As Long) As Long
Private Declare Function GdipSaveImageToStream Lib "gdiplus" (ByVal Image As Long, ByVal Stream As IUnknown, clsidEncoder As GUID, encoderParams As Any) As Long
Private Declare Function GdipGetImageBounds Lib "GdiPlus.dll" (ByVal nImage As Long, srcRect As RECTF, srcUnit As Long) As Long
Private Declare Function GdipDeleteGraphics Lib "gdiplus" (ByVal Graphics As Long) As Long
Private Declare Sub GdiplusShutdown Lib "gdiplus" (ByVal Token As Long)
Private Declare Function GdipDrawImageRect Lib "GdiPlus.dll" (ByVal mGraphics As Long, ByVal mImage As Long, ByVal mX As Single, ByVal mY As Single, ByVal mWidth As Single, ByVal mHeight As Single) As Long
Private Declare Function GdipGetImageGraphicsContext Lib "gdiplus" (ByVal Image As Long, ByRef Graphics As Long) As Long
Private Declare Function GdipCreateBitmapFromScan0 Lib "gdiplus" (ByVal Width As Long, ByVal Height As Long, ByVal stride As Long, ByVal PixelFormat As Long, scan0 As Any, BITMAP As Long) As Long
Private Declare Function GdipGraphicsClear Lib "GdiPlus.dll" (ByVal mGraphics As Long, ByVal mColor As Long) As Long
Private Declare Function GdipCreatePen1 Lib "GdiPlus.dll" (ByVal mColor As Long, ByVal mWidth As Single, ByVal mUnit As Long, ByRef mPen As Long) As Long
Private Declare Function GdipDrawRectangle Lib "GdiPlus.dll" (ByVal mGraphics As Long, ByVal mPen As Long, ByVal mX As Single, ByVal mY As Single, ByVal mWidth As Single, ByVal mHeight As Single) As Long
Private Declare Function GdipDeletePen Lib "GdiPlus.dll" (ByVal mPen As Long) As Long
Private Declare Function GdipCreateBitmapFromHBITMAP Lib "gdiplus" (ByVal hbm As Long, ByVal hpal As Long, ByRef BITMAP As Long) As Long
Private Declare Function GdipCreateBitmapFromGdiDib Lib "GdiPlus.dll" (ByRef mGdiBitmapInfo As Any, ByVal mGdiBitmapData As Long, ByRef mBitmap As Long) As Long

'Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
'Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
'Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function VarPtrArray Lib "msvbvm60.dll" Alias "VarPtr" (ByRef ptr() As Any) As Long
Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal uFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalSize Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GetHGlobalFromStream Lib "ole32" (ByVal ppstm As Long, hGlobal As Long) As Long
Private Declare Function CreateStreamOnHGlobal Lib "ole32" (ByVal hGlobal As Long, ByVal fDeleteOnRelease As Long, ppstm As Any) As Long
Private Declare Function CLSIDFromString Lib "ole32" (ByVal str As Long, ID As GUID) As Long
Private Declare Function OleCreatePictureIndirect Lib "olepro32.dll" (PicDesc As PicBmp, RefIID As UUID, ByVal fPictureOwnsHandle As Long, IPic As IPicture) As Long
Private Declare Function SHGetDesktopFolder Lib "shell32.dll" (ppshf As IVBShellFolder) As Long
Private Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long
Private Declare Sub CoTaskMemFree Lib "ole32.dll" (ByVal pv As Long)

'Private Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
'Private Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
'Private Declare Function ReleaseDC Lib "user32" (ByVal hwnd As Long, ByVal hdc As Long) As Long
'Private Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
'Private Declare Function GetObj Lib "gdi32" Alias "GetObjectA" (ByVal hObject As Long, ByVal nCount As Long, lpObject As Any) As Long
'Private Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
'Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
'Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
'Private Declare Function DrawDibOpen Lib "msvfw32.dll" () As Long
'Private Declare Function DrawDibDraw Lib "msvfw32.dll" (ByVal hdd As Long, ByVal hdc As Long, ByVal xDst As Long, ByVal yDst As Long, ByVal dxDst As Long, ByVal dyDst As Long, ByRef lpbi As BITMAPINFOHEADER, lpBits As Any, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dxSrc As Long, ByVal dySrc As Long, ByVal wFlags As Long) As Long
'Private Declare Function DrawDibClose Lib "msvfw32.dll" (ByVal hdd As Long) As Long
Private Declare Function GetDIBits Lib "gdi32.dll" (ByVal aHDC As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, ByRef lpBits As Any, ByRef lpBI As Any, ByVal wUsage As Long) As Long
'Private Declare Function capCreateCaptureWindowA Lib "avicap32.dll" (ByVal lpszWindowName As String, ByVal dwStyle As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Integer, ByVal hWndParent As Long, ByVal nID As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
'Private Declare Function DestroyWindow Lib "user32" (ByVal hndw As Long) As Long
Private Declare Function GetObject Lib "gdi32" Alias "GetObjectA" (ByVal hObject As Long, ByVal nCount As Long, ByRef lpObject As Any) As Long
Private Declare Function CreateCompatibleBitmap Lib "gdi32.dll" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Private Declare Function CreateCompatibleDC Lib "gdi32.dll" (ByVal hdc As Long) As Long
Private Declare Function GetDC Lib "user32.dll" (ByVal hwnd As Long) As Long
Private Declare Function FillRect Lib "user32.dll" (ByVal hdc As Long, ByRef lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function ImageList_Draw Lib "comctl32.dll" (ByVal himl As Long, ByVal i As Long, ByVal hdcDst As Long, ByVal x As Long, ByVal y As Long, ByVal fStyle As Long) As Long
Private Declare Function SelectObject Lib "gdi32.dll" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private Declare Function CreateSolidBrush Lib "gdi32.dll" (ByVal crColor As Long) As Long
Private Declare Function ReleaseDC Lib "user32.dll" (ByVal hwnd As Long, ByVal hdc As Long) As Long
Private Declare Function DeleteDC Lib "gdi32.dll" (ByVal hdc As Long) As Long
Private Declare Function SHGetFileInfo Lib "shell32.dll" Alias "SHGetFileInfoA" (ByVal pszPath As String, ByVal dwFileAttributes As Long, psfi As SHFILEINFO, ByVal cbFileInfo As Long, ByVal uFlags As Long) As Long
Private Declare Function DrawIconEx Lib "user32.dll" (ByVal hdc As Long, ByVal xLeft As Long, ByVal yTop As Long, ByVal hIcon As Long, ByVal cxWidth As Long, ByVal cyWidth As Long, ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As Long, ByVal diFlags As Long) As Long

Private Type SHFILEINFO
    hIcon As Long
    iIcon As Long
    dwAttributes As Long
    szDisplayName As String * 260
    szTypeName As String * 80
End Type

Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Private Const ILD_TRANSPARENT = &H1
Private Const SHGFI_SMALLICON = &H1
Private Const SHGFI_SYSICONINDEX = &H4000
Private Const SHGFI_USEFILEATTRIBUTES As Long = &H10

Private Const WM_GETICON As Long = &H7F
Private Const ICON_SMALL As Long = 0

Private Const DI_MASK = &H1
Private Const DI_IMAGE = &H2
Private Const DI_NORMAL = DI_MASK Or DI_IMAGE

Private Const BI_RGB            As Long = &H0
Private Const DIB_RGB_COLORS    As Long = &H0



Public Enum PixelFormat
    enuPixelFormat1bppIndexed = 1
    enuPixelFormat4bppIndexed = 4
    enuPixelFormat8bppIndexed = 8
    enuPixelFormat16bppRGB = 16
    enuPixelFormat24bppRGB = 24
    enuPixelFormat32bppRGB = 32
End Enum

Private Type BITMAP
    bmType                      As Long
    bmWidth                     As Long
    bmHeight                    As Long
    bmWidthBytes                As Long
    bmPlanes                    As Integer
    bmBitsPixel                 As Integer
    bmBits                      As Long
End Type


Public Type BITMAPINFOHEADER '40 bytes
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

Public Type RGBQUAD
    rgbBlue         As Byte
    rgbGreen        As Byte
    rgbRed          As Byte
    rgbReserved     As Byte
End Type

Public Type BITMAPINFO
    bmiHeader       As BITMAPINFOHEADER
    bmiColors       As RGBQUAD
End Type

Private Type BITMAPINFO256
    bmiHeader                   As BITMAPINFOHEADER
    bmiColors(0 To 255)         As RGBQUAD
End Type


Private Type VIDEOHDR
    lpData          As Long
    dwBufferLength  As Long
    dwBytesUsed     As Long
    dwTimeCaptured  As Long
    dwUser          As Long
    dwFlags         As Long
    dwReserved(3)   As Long
End Type

Private Type PicBmp
    SIZE As Long
    Type As Long
    hBMP As Long
    hpal As Long
    Reserved As Long
End Type

Private Type RECTF
    nLeft           As Single
    nTop            As Single
    nWidth          As Single
    nHeight         As Single
End Type

Private Type GUID
    Data1           As Long
    Data2           As Integer
    Data3           As Integer
    Data4(0 To 7)   As Byte
End Type
 
Private Type EncoderParameter
    GUID            As GUID
    NumberOfValues  As Long
    Type            As Long
    Value           As Long
End Type
 
Private Type EncoderParameters
    Count           As Long
    Parameter(15)   As EncoderParameter
End Type
 
Private Type GdiplusStartupInput
    GdiPlusVersion           As Long
    DebugEventCallback       As Long
    SuppressBackgroundThread As Long
    SuppressExternalCodecs   As Long
End Type

Private Const WM_USER                       As Long = &H400
Private Const WM_CAP_START                  As Long = WM_USER
Private Const WM_CAP_SET_CALLBACK_FRAME     As Long = WM_CAP_START + 5
Private Const WM_CAP_DRIVER_CONNECT         As Long = WM_CAP_START + 10
Private Const WM_CAP_DRIVER_DISCONNECT      As Long = WM_CAP_START + 11
Private Const WM_CAP_GET_VIDEOFORMAT        As Long = WM_CAP_START + 44
Private Const WM_CAP_GRAB_FRAME             As Long = WM_CAP_START + 60

Private Const MAX_PATH                  As Long = 260
Private Const PixelFormat16bppARGB1555  As Long = &H61007
Private Const PixelFormat24bppRGB       As Long = &H21808
Private Const PixelFormat32bppRGB       As Long = &H22009
Private Const UnitPixel                 As Long = &H2&

Private Const ImageCodecJPG = "{557CF401-1A04-11D3-9A73-0000F81EF32E}"
Private Const ImageCodecPNG = "{557CF406-1A04-11D3-9A73-0000F81EF32E}"
Private Const EncoderQuality = "{1D5BE4B5-FA4A-452D-9CDD-5DB35105E7EB}"
Private Const EncoderParameterValueTypeLong As Long = 4
Private Const GdiPlusVersion As Long = 1&


Public hwndCap As Long
Dim m_hImage As Long

Public Function GetStreamFromBitmap(ByVal hBitmap As Long, ByVal BitsPerPixel As PixelFormat, ByRef OutStream() As Byte, Optional ByVal Width As Long, Optional ByVal Height As Long) As Boolean
    
    Dim lngDC               As Long
    Dim lngBitmap           As Long
    Dim lngStride           As Long
    Dim tBitmap             As BITMAP
    Dim tBITMAPINFO         As BITMAPINFO256
    Dim bytData()           As Byte
    Dim GDIsi               As GdiplusStartupInput
    Dim gToken              As Long
    
    GDIsi.GdiPlusVersion = GdiPlusVersion
    
    GdiplusStartup gToken, GDIsi

    If gToken <> 0 Then
            
        If GetObject(hBitmap, Len(tBitmap), tBitmap) <> 0 Then
        
            With tBITMAPINFO.bmiHeader
                .biHeight = IIf(Height, Height, tBitmap.bmHeight)
                .biWidth = IIf(Width, Width, tBitmap.bmWidth)
                .biPlanes = tBitmap.bmPlanes
                .biBitCount = BitsPerPixel
                .biSize = Len(tBITMAPINFO.bmiHeader)
                .biCompression = BI_RGB
            End With
            
            lngStride = AlignScan(tBitmap.bmWidth, BitsPerPixel)
            
            ReDim bytData((tBitmap.bmHeight * lngStride) - 1)
            
            lngDC = GetDC(0&)
            
            If GetDIBits(lngDC, hBitmap, 0&, tBitmap.bmHeight, bytData(0), tBITMAPINFO, DIB_RGB_COLORS) <> 0 Then

                If GdipCreateBitmapFromGdiDib(tBITMAPINFO, VarPtr(bytData(0)), lngBitmap) = 0 Then
                    
                    SaveImageToStream lngBitmap, OutStream, , True
                    
                    Call GdipDisposeImage(lngBitmap)
                    
                End If
                
            End If
            
            ReleaseDC ByVal 0&, lngDC
            
        End If
        
        GdiplusShutdown gToken
        
    End If
            

End Function

Private Function AlignScan(ByVal inWidth As Long, ByVal inDepth As Integer) As Long
    AlignScan = (((inWidth * inDepth) + &H1F) And Not &H1F&) \ &H8
End Function

Public Function CreateListImage(FileList() As Variant, OutStream() As Byte, bWindows As Boolean) As Boolean
    Dim DC As Long
    Dim TempDC As Long
    Dim hBMP As Long, OldBmp As Long
    Dim hBrush As Long
    Dim Rec As RECT
    Dim hImageList As Long
    Dim tSFI As SHFILEINFO
    Dim hIcon As Long
    Dim i As Long
    Dim hGDIPlusBitmap As Long

    Rec.Right = (UBound(FileList) + 1) * 16
    Rec.Bottom = 16
    
    TempDC = GetDC(0)
    hBMP = CreateCompatibleBitmap(TempDC, Rec.Right, Rec.Bottom)
    ReleaseDC 0&, TempDC
    DC = CreateCompatibleDC(0)
    OldBmp = SelectObject(DC, hBMP)
    
    hBrush = CreateSolidBrush(vbWhite)
    
    FillRect DC, Rec, hBrush
    DeleteObject hBrush

    If bWindows Then
        For i = 0 To UBound(FileList)
            hIcon = SendMessage(FileList(i), WM_GETICON, ICON_SMALL, 0&)
            If hIcon Then
                DrawIconEx DC, 16 * i, 0, hIcon, 16, 16, 0, 0, DI_NORMAL
            Else
                hImageList = SHGetFileInfo(GetWindowPath(FileList(i)), ByVal 0&, tSFI, Len(tSFI), SHGFI_SYSICONINDEX Or SHGFI_SMALLICON Or SHGFI_USEFILEATTRIBUTES)
                ImageList_Draw hImageList, tSFI.iIcon, DC, 16 * i, 0, ILD_TRANSPARENT
            End If
        Next
    Else
        For i = 0 To UBound(FileList)
            hImageList = SHGetFileInfo(FileList(i), ByVal 0&, tSFI, Len(tSFI), SHGFI_SYSICONINDEX Or SHGFI_SMALLICON Or SHGFI_USEFILEATTRIBUTES)
            ImageList_Draw hImageList, tSFI.iIcon, DC, 16 * i, 0, ILD_TRANSPARENT
        Next
    End If
    
    Dim GDIsi       As GdiplusStartupInput
    Dim gToken      As Long
    
    GDIsi.GdiPlusVersion = GdiPlusVersion
    
    GdiplusStartup gToken, GDIsi
    
    If GdipCreateBitmapFromHBITMAP(hBMP, 0, hGDIPlusBitmap) = 0 Then
        CreateListImage = SaveImageToStream(hGDIPlusBitmap, OutStream, , True)
        Call GdipDisposeImage(hGDIPlusBitmap)
    End If
    
    GdiplusShutdown gToken
    

    DeleteObject SelectObject(DC, OldBmp)
    DeleteDC DC
End Function





Public Function CreateListThumbnail(ByVal cCol As Collection, ByVal lSize As Long, OutStream() As Byte) As Boolean
    Dim GDIsi       As GdiplusStartupInput
    Dim hGraphics   As Long
    Dim gToken      As Long
    Dim hBitmap     As Long
    Dim tRect       As RECTF
    Dim hImg        As Long
    Dim PLeft       As Double
    Dim PTop        As Double
    Dim hPen        As Long
    Dim ReqWidth As Long, ReqHeight As Long
    Dim HScale As Double, VScale As Double
    Dim MyScale As Double
    Dim JPG_Quality As Long
    
    Dim i As Long

    JPG_Quality = 80
    
    GDIsi.GdiPlusVersion = GdiPlusVersion
    
    GdiplusStartup gToken, GDIsi
     
    If GdipCreateBitmapFromScan0(lSize * cCol.Count, lSize, 0&, PixelFormat24bppRGB, ByVal 0&, hImg) = 0 Then

        If GdipGetImageGraphicsContext(hImg, hGraphics) = 0 Then
            GdipGraphicsClear hGraphics, &HFFFFFFFF
            GdipCreatePen1 &HFFCCCCCC, 1, UnitPixel, hPen

            For i = 1 To cCol.Count
                If GdipCreateBitmapFromHBITMAP(cCol(i), 0, hBitmap) = 0 Then
                
                    GdipGetImageBounds hBitmap, tRect, UnitPixel
                    
                    HScale = lSize / tRect.nWidth
                    VScale = lSize / tRect.nHeight
                    
                    MyScale = IIf(VScale >= HScale, HScale, VScale)
                    
                    ReqWidth = tRect.nWidth * MyScale
                    ReqHeight = tRect.nHeight * MyScale
                    
                    PLeft = (lSize - ReqWidth) / 2
                    PTop = (lSize - ReqHeight) / 2
            
                    Call GdipDrawImageRect(hGraphics, hBitmap, (lSize * (i - 1)) + PLeft, PTop, ReqWidth, ReqHeight)
                    Call GdipDrawRectangle(hGraphics, hPen, (lSize * (i - 1)), 0, lSize - 1, lSize - 1)
                   
                    Call GdipDisposeImage(hBitmap)
                End If
            Next
            
            GdipDeletePen hPen
            GdipDeleteGraphics hGraphics
        End If

        CreateListThumbnail = SaveImageToStream(hImg, OutStream, JPG_Quality)

        Call GdipDisposeImage(hImg)
    End If
    
    GdiplusShutdown gToken
End Function

Private Function CreateStream(byteContent() As Byte, Optional byteOffset As Long = 0&) As stdole.IUnknown
    
    ' Purpose: Create an IStream-compatible IUnknown interface containing the
    ' passed byte aray. This IUnknown interface can be passed to GDI+ functions
    ' that expect an IStream interface -- neat hack
    
    On Error GoTo HandleError
    Dim o_lngLowerBound As Long
    Dim o_lngByteCount  As Long
    Dim o_hMem As Long
    Dim o_lpMem  As Long
     
    If iparseIsArrayEmpty(VarPtrArray(byteContent)) = 0& Then ' create a growing stream as needed
         Call CreateStreamOnHGlobal(0, 1, CreateStream)
    Else                                        ' create a fixed stream
         o_lngByteCount = UBound(byteContent) - byteOffset + 1
         o_hMem = GlobalAlloc(&H2&, o_lngByteCount)
         If o_hMem <> 0 Then
             o_lpMem = GlobalLock(o_hMem)
             If o_lpMem <> 0 Then
                 CopyMemory ByVal o_lpMem, byteContent(byteOffset), o_lngByteCount
                 Call GlobalUnlock(o_hMem)
                 Call CreateStreamOnHGlobal(o_hMem, 1, CreateStream)
             End If
         End If
     End If
    
HandleError:
End Function

Public Function GetThumbNail(ByRef sFilePath As String, ByVal lWidth As Long, ByVal lHeight As Long) As Long
    
    On Error Resume Next
    
    Dim Folder          As IVBShellFolder
    Dim Item            As IVBShellFolder
    Dim ExtractImage    As IExtractImage
    Dim idEnum          As IVBEnumIDList
    Dim iidShellFolder  As UUID
    'Dim iiDispatch      As UUID
    Dim iidExtractImage As UUID
    Dim tSize           As SIZE
    'Dim lpPic           As PicBmp
    Dim sRet            As String
    Dim sPath           As String
    Dim sFileName       As String
    Dim sName           As String
    Dim pidlMain        As Long
    Dim pidl            As Long
    Dim hRes            As Long
    
    sPath = Left$(sFilePath, InStrRev(sFilePath, "\"))
    
    sFileName = UCase$(Mid$(sFilePath, Len(sPath) + 1))

    Call SHGetDesktopFolder(Folder)

    Folder.ParseDisplayName 0&, 0&, sPath, 0&, pidlMain, 0&
    
    IIDFromString "{000214E6-0000-0000-C000-000000000046}", iidShellFolder

    Folder.BindToObject pidlMain, 0&, iidShellFolder, Item

    If pidlMain Then CoTaskMemFree pidlMain
      
    Item.EnumObjects 0&, SHCONTF_FOLDERS Or SHCONTF_NONFOLDERS Or SHCONTF_INCLUDEHIDDEN, idEnum
      
    Do While idEnum.Next(1, pidl, 0&) = 0

        sPath = PathFromPidl(pidl)
        
        sName = UCase$(Right$(sPath, Len(sPath) - InStrRev(sPath, "\")))

        If (sName = sFileName) Then
        
            IIDFromString "{BB2E617C-0920-11d1-9A0B-00C04FC2D6C1}", iidExtractImage
            
            Item.GetUIObjectOf 0&, 1&, pidl, iidExtractImage, 0&, ExtractImage
            
            CoTaskMemFree pidl
            
            If ExtractImage Is Nothing Then Exit Function
            
            sRet = String$(MAX_PATH, 0)
            
            tSize.cx = lWidth
            tSize.cy = lHeight
            
            ExtractImage.GetLocation sRet, MAX_PATH, 0&, tSize, 32, IEIFLAG_NOBORDER Or IEIFLAG_SCREEN Or IEIFLAG_OFFLINE
            
            'IIDFromString "{00020400-0000-0000-C000-000000000046}", iiDispatch
            
            If err.Number Then err.Clear
            
            'With lpPic
            '    .SIZE = Len(lpPic)
            '    .Type = vbPicTypeBitmap
            '    ExtractImage.Extract .hBmp
            '    If .hBmp = 0 Then Exit Function
            'End With
            
            Dim hBMP As Long
            
            ExtractImage.Extract hBMP
            
            If hBMP = 0 Then Exit Function
            
            
            If err.Number Then
                err.Clear
                Exit Function
            End If
            
            'OleCreatePictureIndirect lpPic, iiDispatch, 1, GetThumbNail
  
            GetThumbNail = hBMP
       
            Exit Do
        Else
            If pidl Then CoTaskMemFree pidl
        End If

    Loop
    
End Function

Public Function PathFromPidl(ByVal pidl As Long) As String
   Dim sPath As String * MAX_PATH
   If SHGetPathFromIDList(pidl, sPath) Then
      PathFromPidl = Left$(sPath, InStr(sPath, Chr$(0)) - 1)
   End If
End Function

 Private Function ArrayFromStream(Stream As IUnknown, arrayBytes() As Byte) As Boolean

    ' Purpose: Return the array contained in an IUnknown interface
    
    Dim o_hMem As Long, o_lpMem As Long
    Dim o_lngByteCount As Long
    
    If Not Stream Is Nothing Then
    
        If GetHGlobalFromStream(ByVal ObjPtr(Stream), o_hMem) = 0 Then
            o_lngByteCount = GlobalSize(o_hMem)
            If o_lngByteCount > 0 Then
                o_lpMem = GlobalLock(o_hMem)
                If o_lpMem <> 0 Then
                    ReDim arrayBytes(0 To o_lngByteCount - 1)
                    CopyMemory arrayBytes(0), ByVal o_lpMem, o_lngByteCount
                    GlobalUnlock o_hMem
                    ArrayFromStream = True
                End If
            End If
        End If

    End If
    
End Function
 
Public Function IsGdiPlusInstaled() As Boolean
'    Dim hLib As Long
'
'    hLib = LoadLibrary("gdiplus.dll")
'    If hLib Then
'        If GetProcAddress(hLib, "GdiplusStartup") Then
'            IsGdiPlusInstaled = True
'        End If
'        FreeLibrary hLib
'    End If
'
End Function



Public Function iparseIsArrayEmpty(FarPointer As Long) As Long
  ' test to see if an array has been initialized
  CopyMemory iparseIsArrayEmpty, ByVal FarPointer, 4&
End Function

Public Function SaveImageToStream(ByVal hImage As Long, ByRef OutStream() As Byte, Optional ByVal JPG_Quality As Long = 80, Optional ByVal PNGFormat As Boolean) As Boolean
    Dim IIStream    As IUnknown
    Dim tEncoder    As GUID
    Dim tParams     As EncoderParameters
    
    Erase OutStream
       
    Set IIStream = CreateStream(OutStream)

    If Not IIStream Is Nothing Then
        
        If PNGFormat Then
            CLSIDFromString StrPtr(ImageCodecPNG), tEncoder
        If GdipSaveImageToStream(hImage, IIStream, tEncoder, ByVal 0&) = 0& Then
            SaveImageToStream = ArrayFromStream(IIStream, OutStream())
        End If
        Else
            CLSIDFromString StrPtr(ImageCodecJPG), tEncoder
    
            With tParams
                .Count = 1
                .Parameter(0).NumberOfValues = 1
                .Parameter(0).Type = EncoderParameterValueTypeLong
                .Parameter(0).Value = VarPtr(JPG_Quality)
                CLSIDFromString StrPtr(EncoderQuality), .Parameter(0).GUID
            End With
            
            If GdipSaveImageToStream(hImage, IIStream, tEncoder, tParams) = 0& Then
                SaveImageToStream = ArrayFromStream(IIStream, OutStream())
            End If
        End If


        
    End If
End Function


Public Function capGetImageStream(ByRef OutStream() As Byte, Optional ByVal JPG_Quality As Long = 80) As Boolean
    Dim GdipToken As Long
    
    Dim GdipStartupInput As GdiplusStartupInput
    GdipStartupInput.GdiPlusVersion = GdiPlusVersion
    Call GdiplusStartup(GdipToken, GdipStartupInput, ByVal 0)
    
    If GdipToken Then
    
        Call SendMessage(hwndCap, WM_CAP_GRAB_FRAME, ByVal 0&, ByVal 0&)
    
        If m_hImage Then
            capGetImageStream = SaveImageToStream(m_hImage, OutStream, JPG_Quality)
            GdipDisposeImage m_hImage
        End If
        
        Call GdiplusShutdown(GdipToken)
    End If
    
    
End Function

Public Function CreateCaptureWindow() As Boolean

    hwndCap = Invoke("avicap32.dll", "capCreateCaptureWindowA", StrPtr("vbNullString"), 0&, 0&, 0&, 0&, 0&, 0&, 0&)   'hwndCap = capCreateCaptureWindowA(vbNullString, 0&, 0&, 0&, 0&, 0&, 0&, 0&)

    If hwndCap Then
        Call SendMessage(hwndCap, WM_CAP_SET_CALLBACK_FRAME, 0, AddressOf FrameCallBack)
        CreateCaptureWindow = True
    End If
End Function

Function capGetVideoFormat(ByVal hCapWnd As Long, ByVal CapFormatSize As Long, ByVal BmpFormat As Long) As Long
   capGetVideoFormat = SendMessage(hCapWnd, WM_CAP_GET_VIDEOFORMAT, CapFormatSize, BmpFormat)
End Function

Public Function DestroyCaptureWindow() As Boolean
    If hwndCap Then DestroyCaptureWindow = Invoke("user32", "DestroyWindow", hwndCap): hwndCap = 0
End Function

Public Function ConnectDriver() As Boolean
    If hwndCap Then ConnectDriver = SendMessage(hwndCap, WM_CAP_DRIVER_CONNECT, 0&, 0&)
End Function

Public Function DisconnectDriver() As Boolean
    If hwndCap Then
        Call SendMessage(hwndCap, WM_CAP_SET_CALLBACK_FRAME, 0&, vbNull)
        DisconnectDriver = SendMessage(hwndCap, WM_CAP_DRIVER_DISCONNECT, 0&, 0&)
    End If
End Function

Private Function FrameCallBack(ByVal lWnd As Long, ByVal lpVHdr As Long) As Long
    Dim VideoHeader As VIDEOHDR
    Dim StreamBMI As BITMAPINFO
    Dim DrawDibhDC As Long
    Dim ScreenhDC As Long
    Dim BMhDC As Long
    Dim BMHandle As Long
    Dim BMHandleOld As Long
    Dim hImage As Long
    Dim hGraphic As Long
    
    CopyMemory VideoHeader, ByVal lpVHdr, Len(VideoHeader)
    capGetVideoFormat lWnd, Len(StreamBMI), VarPtr(StreamBMI)
    
    If StreamBMI.bmiHeader.biCompression = 0 Then

        Call GdipCreateBitmapFromGdiDib(StreamBMI, VideoHeader.lpData, m_hImage)
        
    Else

        ScreenhDC = Invoke("user32.dll", "GetDC", 0&) 'ScreenhDC = GetDC(0&)
        
        BMhDC = Invoke("gdi32.dll", "CreateCompatibleDC", ScreenhDC) 'BMhDC = CreateCompatibleDC(ScreenhDC)
        BMHandle = Invoke("gdi32.dll", "CreateCompatibleBitmap", ScreenhDC, StreamBMI.bmiHeader.biWidth, StreamBMI.bmiHeader.biHeight) 'BMHandle = CreateCompatibleBitmap(ScreenhDC, StreamBMI.bmiHeader.biWidth, StreamBMI.bmiHeader.biHeight)
        
        BMHandleOld = Invoke("gdi32.dll", "SelectObject", BMhDC, BMHandle) 'BMHandleOld = SelectObject(BMhDC, BMHandle)
        
        Call Invoke("user32.dll", "ReleaseDC", 0&, ScreenhDC)  'ReleaseDC ScreenhWnd, ScreenhDC
 
        DrawDibhDC = Invoke("msvfw32.dll", "DrawDibOpen") 'DrawDibhDC =  DrawDibOpen
        Call Invoke("msvfw32.dll", "DrawDibDraw", DrawDibhDC, BMhDC, 0&, 0&, -1&, -1&, VarPtr(StreamBMI.bmiHeader), VideoHeader.lpData, 0&, 0&, StreamBMI.bmiHeader.biWidth, StreamBMI.bmiHeader.biHeight, 0&)  'DrawDibDraw DrawDibhDC, BMhDC, 0, 0, -1, -1, StreamBMI.bmiHeader, ByVal VideoHeader.lpData, 0, 0, StreamBMI.bmiHeader.biWidth, StreamBMI.bmiHeader.biHeight, 0
        Call Invoke("msvfw32.dll", "DrawDibClose", DrawDibhDC) 'DrawDibClose DrawDibhDC
        
        Call Invoke("gdi32.dll", "SelectObject", BMhDC, BMHandleOld) 'SelectObject BMhDC, BMHandleOld
        
        Call Invoke("gdi32.dll", "DeleteDC", BMhDC) 'DeleteDC BMhDC
        
        Call Invoke("gdi32.dll", "DeleteObject", BMHandleOld) 'DeleteObject BMHandleOld
        
        Call GdipCreateBitmapFromHBITMAP(BMHandle, 0&, m_hImage)
        
        Call Invoke("gdi32.dll", "DeleteObject", BMHandle) 'DeleteObject BMHandle
    End If
    
    
End Function
