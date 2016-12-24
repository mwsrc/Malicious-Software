Attribute VB_Name = "modGdipThumbnailStream"
Option Explicit

Private Declare Function GdiplusStartup Lib "gdiplus" (Token As Long, inputbuf As GdiplusStartupInput, Optional ByVal outputbuf As Long = 0) As Long
Private Declare Function GdipLoadImageFromFile Lib "GdiPlus.dll" (ByVal mFilename As Long, ByRef mImage As Long) As Long
Private Declare Function GdipDisposeImage Lib "gdiplus" (ByVal Image As Long) As Long
Private Declare Function GdipSaveImageToStream Lib "gdiplus" (ByVal Image As Long, ByVal Stream As IUnknown, clsidEncoder As GUID, encoderParams As Any) As Long
Private Declare Function GdipLoadImageFromStream Lib "gdiplus" (ByVal Stream As Any, ByRef Image As Long) As Long
Private Declare Function GdipGetImageBounds Lib "GdiPlus.dll" (ByVal nImage As Long, SrcRect As RECTF, srcUnit As Long) As Long
Private Declare Function GdipDeleteGraphics Lib "gdiplus" (ByVal graphics As Long) As Long
Private Declare Sub GdiplusShutdown Lib "gdiplus" (ByVal Token As Long)
Private Declare Function CLSIDFromString Lib "ole32" (ByVal str As Long, id As GUID) As Long
Private Declare Function GdipGetImageThumbnail Lib "GdiPlus.dll" (ByVal mImage As Long, ByVal mThumbWidth As Long, ByVal mThumbHeight As Long, ByRef mThumbImage As Long, ByRef mcallback As Long, ByRef mcallbackData As Long) As Long
Private Declare Function GdipCreateFromHDC Lib "GdiPlus.dll" (ByVal mhDC As Long, ByRef mGraphics As Long) As Long
Private Declare Function GdipDrawImageRect Lib "GdiPlus.dll" (ByVal mGraphics As Long, ByVal mImage As Long, ByVal mX As Single, ByVal mY As Single, ByVal mWidth As Single, ByVal mHeight As Single) As Long
Private Declare Function GdipDrawImageRectRectI Lib "gdiplus" (ByVal graphics As Long, ByVal Image As Long, ByVal DstX As Long, ByVal DstY As Long, ByVal DstWidth As Long, ByVal DstHeight As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal SrcWidth As Long, ByVal SrcHeight As Long, ByVal srcUnit As Long, ByVal imageAttributes As Long, Optional ByVal callback As Long = 0, Optional ByVal callbackData As Long = 0) As Long

Private Declare Function VarPtrArray Lib "msvbvm60.dll" Alias "VarPtr" (ByRef Ptr() As Any) As Long
Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Function CreateStreamOnHGlobal Lib "ole32" (ByVal hGlobal As Long, ByVal fDeleteOnRelease As Long, ppstm As Any) As Long
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal uFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalSize Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GetHGlobalFromStream Lib "ole32" (ByVal ppstm As Long, hGlobal As Long) As Long
Private Declare Function GdipCreateHBITMAPFromBitmap Lib "gdiplus" (ByVal BITMAP As Long, ByRef hbmReturn As Long, ByVal background As Long) As Long
Private Declare Sub OleCreatePictureIndirect Lib "oleaut32.dll" (lpPictDesc As PICTDESC, riid As GUID, ByVal fOwn As Boolean, lplpvObj As Object)

'Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
'Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
'Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long


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
    type            As Long
    Value           As Long
End Type
 
Private Type EncoderParameters
    Count           As Long
    Parameter(15)   As EncoderParameter
End Type
 
Private Type GdiplusStartupInput
    GdiplusVersion           As Long
    DebugEventCallback       As Long
    SuppressBackgroundThread As Long
    SuppressExternalCodecs   As Long
End Type

Private Type PICTDESC
    cbSizeOfStruct As Long
    picType As Long
    hgdiObj As Long
    hPalOrXYExt As Long
End Type

 

Const ImageCodecJPG = "{557CF401-1A04-11D3-9A73-0000F81EF32E}"

Const EncoderQuality = "{1D5BE4B5-FA4A-452D-9CDD-5DB35105E7EB}"
Const PictureID = "{7BF80981-BF32-101A-8BBB-00AA00300CAB}"

Const EncoderParameterValueTypeLong = 4
Private Const UnitPixel         As Long = &H2&


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


Public Function GetThumbnailStreamFromFile(ByVal SrcPath As String, ByVal lWidth As Long, ByVal lHeight As Long, outStream() As Byte) As Boolean
 
    On Error Resume Next
    
    Dim GDIsi       As GdiplusStartupInput
    Dim gToken      As Long
    Dim hBitmap     As Long
    Dim tEncoder    As GUID
    Dim tParams     As EncoderParameters
    Dim sExt        As String
    Dim lPos        As Long
    Dim IIStream    As IUnknown
    Dim tRect As RECTF
    Dim hImg        As Long
    Dim hGraphics   As Long
    Dim ReqWidth As Long, ReqHeight As Long
    Dim HScale As Double, VScale As Double
    Dim MyScale As Double
    Dim JPG_Quality As Long
                   
                   
    JPG_Quality = 80
    
    GDIsi.GdiplusVersion = 1&
 
    GdiplusStartup gToken, GDIsi
 
    If gToken Then
    
        If GdipLoadImageFromFile(StrPtr(SrcPath), hBitmap) = 0 Then
            
            GdipGetImageBounds hBitmap, tRect, UnitPixel
            
            HScale = lWidth / tRect.nWidth
            VScale = lHeight / tRect.nHeight
            
            MyScale = IIf(VScale >= HScale, HScale, VScale)
            
            ReqWidth = tRect.nWidth * MyScale
            ReqHeight = tRect.nHeight * MyScale

            If GdipGetImageThumbnail(hBitmap, ReqWidth, ReqHeight, hImg, 0&, 0&) = 0 Then

               Erase outStream
               
               Set IIStream = CreateStream(outStream)

               If Not IIStream Is Nothing Then
               
                   CLSIDFromString StrPtr(ImageCodecJPG), tEncoder

                   With tParams
                       .Count = 1
                       .Parameter(0).NumberOfValues = 1
                       .Parameter(0).type = EncoderParameterValueTypeLong
                       .Parameter(0).Value = VarPtr(JPG_Quality)
                       CLSIDFromString StrPtr(EncoderQuality), .Parameter(0).GUID
                   End With

                   If GdipSaveImageToStream(hImg, IIStream, tEncoder, tParams) = 0& Then

                       ArrayFromStream IIStream, outStream()
                       
                       GetThumbnailStreamFromFile = True
                       
                   End If
                   
                End If

                GdipDisposeImage hImg
               
            End If
            
            Call GdipDisposeImage(hBitmap)
 
        End If
 
        GdiplusShutdown gToken
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

Public Function DrawDeskTop(ByVal hdc As Long, ByRef bvData() As Byte, ByRef Cord() As Byte, ByVal Width As Single, ByVal Height As Single) As Boolean
    Dim IStream     As IUnknown
    Dim gToken      As Long
    Dim tRect       As RECTF
    Dim hImage      As Long
    Dim hGraphics   As Long
    Dim pLeft       As Single
    Dim pTop        As Single
    Dim GDIsi       As GdiplusStartupInput
    Dim i As Long, X As Long, Y As Long
    
    If iparseIsArrayEmpty(VarPtrArray(bvData)) = 0& Then Exit Function

    Set IStream = CreateStream(bvData())
    
    If Not IStream Is Nothing Then
 
        GDIsi.GdiplusVersion = 1&
        GdiplusStartup gToken, GDIsi
        
        If gToken Then
        
            If GdipLoadImageFromStream(IStream, hImage) = 0 Then
        
                If GdipCreateFromHDC(hdc, hGraphics) = 0 Then
                
                    For i = 0 To UBound(Cord) Step 2
                        'X = ((Cord(i) \ 8)) * Width
                        'Y = ((Cord(i) Mod 8) - 1) * Height
                        X = Cord(i) * Width
                        Y = Cord(i + 1) * Height
                        
                    
                        GdipDrawImageRectRectI hGraphics, hImage, X, Y, Width, Height, 0, (i / 2) * Height, Width, Height, UnitPixel, 0&, 0&, 0&
                    
                    Next

                    GdipDeleteGraphics hGraphics
                End If
                GdipDisposeImage hImage
            End If
            
            GdiplusShutdown gToken
        
        End If
        
        Set IStream = Nothing
    End If

    
End Function

Public Function DrawThumbnailFromStream(ByVal hdc As Long, ByRef bvData() As Byte, ByVal Width As Single, ByVal Height As Single) As Boolean
    Dim IStream     As IUnknown
    Dim gToken      As Long
    Dim tRect       As RECTF
    Dim hImage      As Long
    Dim hGraphics   As Long
    Dim pLeft       As Single
    Dim pTop        As Single
    Dim GDIsi       As GdiplusStartupInput
    
    If iparseIsArrayEmpty(VarPtrArray(bvData)) = 0& Then Exit Function

    Set IStream = CreateStream(bvData())
    
    If Not IStream Is Nothing Then
 
        GDIsi.GdiplusVersion = 1&
        GdiplusStartup gToken, GDIsi
        
        If gToken Then
        
            If GdipLoadImageFromStream(IStream, hImage) = 0 Then
        
                If GdipCreateFromHDC(hdc, hGraphics) = 0 Then
                    GdipGetImageBounds hImage, tRect, UnitPixel
                    pLeft = (Width / 2) - (tRect.nWidth / 2)
                    pTop = (Height / 2) - (tRect.nHeight / 2)
                    DrawThumbnailFromStream = GdipDrawImageRect(hGraphics, hImage, pLeft, pTop, tRect.nWidth, tRect.nHeight) = 0
                    GdipDeleteGraphics hGraphics
                End If
                GdipDisposeImage hImage
            End If
            
            GdiplusShutdown gToken
        
        End If
        
        Set IStream = Nothing
    End If

    
End Function


Public Function LoadPictureFromStream(ByRef bvData() As Byte) As StdPicture
    Dim IStream     As IUnknown
    Dim gToken      As Long
    Dim tRect       As RECTF
    Dim hImage      As Long
    Dim hBitmap     As Long
    Dim hGraphics   As Long
    Dim pLeft       As Single
    Dim pTop        As Single
    Dim GDIsi       As GdiplusStartupInput
    
    If iparseIsArrayEmpty(VarPtrArray(bvData)) = 0& Then Exit Function

    Set IStream = CreateStream(bvData())
    
    If Not IStream Is Nothing Then
 
        GDIsi.GdiplusVersion = 1&
        GdiplusStartup gToken, GDIsi
        
        If gToken Then
        
            If GdipLoadImageFromStream(IStream, hImage) = 0 Then
        
                If GdipCreateHBITMAPFromBitmap(hImage, hBitmap, 0) = 0 Then
                    
                     Set LoadPictureFromStream = HandleToPicture(hBitmap, vbPicTypeBitmap)
                     
                End If

                GdipDisposeImage hImage
            End If
            
            GdiplusShutdown gToken
        
        End If
        
        Set IStream = Nothing
    End If

    
End Function

Public Function iparseIsArrayEmpty(FarPointer As Long) As Long
  ' test to see if an array has been initialized
  CopyMemory iparseIsArrayEmpty, ByVal FarPointer, 4&
End Function

Private Function HandleToPicture(ByVal hGDIHandle As Long, ByVal ObjectType As PictureTypeConstants, Optional ByVal hpal As Long = 0) As StdPicture
    
    Dim tPictDesc As PICTDESC
    Dim IID_IPicture As GUID
    Dim oPicture As IPicture
    
    With tPictDesc
        .cbSizeOfStruct = Len(tPictDesc)
        .picType = ObjectType
        .hgdiObj = hGDIHandle
        .hPalOrXYExt = hpal
    End With
    
    CLSIDFromString StrPtr(PictureID), IID_IPicture

    OleCreatePictureIndirect tPictDesc, IID_IPicture, True, oPicture
    
    Set HandleToPicture = oPicture
    
End Function

