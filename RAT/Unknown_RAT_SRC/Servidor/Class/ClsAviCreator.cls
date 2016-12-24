VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClsAviCreator"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Declare Sub AVIFileInit Lib "avifil32.dll" ()
Private Declare Function AVIFileOpen Lib "avifil32.dll" (ByRef ppfile As Long, ByVal szFile As String, ByVal uMode As Long, ByVal pclsidHandler As Long) As Long  'HRESULT
Private Declare Function AVIFileCreateStream Lib "avifil32.dll" Alias "AVIFileCreateStreamA" (ByVal pFile As Long, ByRef ppavi As Long, ByRef psi As AVI_STREAM_INFO) As Long
Private Declare Function AVISaveOptions Lib "avifil32.dll" (ByVal hwnd As Long, ByVal uiFlags As Long, ByVal nStreams As Long, ByRef ppavi As Long, ByRef ppOptions As Long) As Long 'TRUE if user pressed OK, False if cancel, or error if error
Private Declare Function AVISaveOptionsFree Lib "avifil32.dll" (ByVal nStreams As Long, ByRef ppOptions As Long) As Long
Private Declare Function AVIMakeCompressedStream Lib "avifil32.dll" (ByRef ppsCompressed As Long, ByVal psSource As Long, ByRef lpOptions As AVI_COMPRESS_OPTIONS, ByVal pclsidHandler As Long) As Long '
Private Declare Function AVIStreamSetFormat Lib "avifil32.dll" (ByVal pavi As Long, ByVal lPos As Long, ByRef lpFormat As Any, ByVal cbFormat As Long) As Long
Private Declare Function AVIStreamWrite Lib "avifil32.dll" (ByVal pavi As Long, ByVal lStart As Long, ByVal lSamples As Long, ByVal lpBuffer As Long, ByVal cbBuffer As Long, ByVal dwFlags As Long, ByRef plSampWritten As Long, ByRef plBytesWritten As Long) As Long
Private Declare Function AVIStreamClose Lib "avifil32.dll" Alias "AVIStreamRelease" (ByVal pavi As Long) As Long 'ULONG
Private Declare Function AVIFileRelease Lib "avifil32.dll" (ByVal pFile As Long) As Long
Private Declare Function AVIFileClose Lib "avifil32.dll" Alias "AVIFileRelease" (ByVal pFile As Long) As Long
Private Declare Sub AVIFileExit Lib "avifil32.dll" ()

Private Declare Function GetObject Lib "gdi32" Alias "GetObjectA" (ByVal hObject As Long, ByVal nCount As Long, lpObject As Any) As Long
Private Declare Function GetBitmapBits Lib "gdi32" (ByVal hBitmap As Long, ByVal dwCount As Long, lpBits As Any) As Long
Private Declare Function GetDIBits Lib "gdi32" (ByVal aHDC As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, ByRef lpBits As Any, ByRef lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
Private Declare Function GetDC Lib "user32.dll" (ByVal hwnd As Long) As Long
Private Declare Function ReleaseDC Lib "user32.dll" (ByVal hwnd As Long, ByVal hdc As Long) As Long

Private Type BITMAP
    bmType As Long
    bmWidth As Long
    bmHeight As Long
    bmWidthBytes As Long
    bmPlanes As Integer
    bmBitsPixel As Integer
    bmBits As Long
End Type

Private Type BITMAPINFOHEADER '40 bytes
   biSize As Long
   biWidth As Long
   biHeight As Long
   biPlanes As Integer
   biBitCount As Integer
   biCompression As Long
   biSizeImage As Long
   biXPelsPerMeter As Long
   biYPelsPerMeter As Long
   biClrUsed As Long
   biClrImportant As Long
End Type

Private Type RGBQUAD
    rgbBlue As Byte
    rgbGreen As Byte
    rgbRed As Byte
    rgbReserved As Byte
End Type

Private Type BITMAPINFO
    bmiHeader As BITMAPINFOHEADER
    bmiColors(0 To 255) As RGBQUAD
End Type

Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Private Type AVI_STREAM_INFO
    fccType As Long
    fccHandler As Long
    dwFlags As Long
    dwCaps As Long
    wPriority As Integer
    wLanguage As Integer
    dwScale As Long
    dwRate As Long
    dwStart As Long
    dwLength As Long
    dwInitialFrames As Long
    dwSuggestedBufferSize As Long
    dwQuality As Long
    dwSampleSize As Long
    rcFrame As RECT
    dwEditCount  As Long
    dwFormatChangeCount As Long
    szName As String * 64
End Type

Private Type AVI_COMPRESS_OPTIONS
    fccType As Long
    fccHandler As Long
    dwKeyFrameEvery As Long
    dwQuality As Long
    dwBytesPerSecond As Long
    dwFlags As Long
    lpFormat As Long
    cbFormat As Long
    lpParms As Long
    cbParms As Long
    dwInterleaveEvery As Long
End Type

Private Const AVIERR_OK                 As Long = 0&
Private Const OF_WRITE                  As Long = &H1
Private Const OF_CREATE                 As Long = &H1000
Private Const AVIIF_KEYFRAME            As Long = &H10
Private Const ICMF_CHOOSE_KEYFRAME      As Long = &H1
Private Const ICMF_CHOOSE_DATARATE      As Long = &H2

Dim bytData()           As Byte
Dim tBMP                As BITMAP
Dim tBI                 As BITMAPINFO
Dim lpFile              As Long
Dim lpStream            As Long
Dim lpStreamCompressed  As Long
Dim lhdc                As Long
Dim lImgSize            As Long
Dim lFramePos           As Long

Public Function CreateAviFile(ByVal sDestPath As String, _
                              ByVal lBMP As Long, _
                              Optional ByVal lRate As Integer = 1, _
                              Optional ByVal bShowSaveOptions As Boolean, _
                              Optional ByVal Owner As Long) As Boolean
                              
    On Error Resume Next

    Dim lRet As Long
    Dim tACO As AVI_COMPRESS_OPTIONS
    Dim lpACO As Long
    Dim tASI As AVI_STREAM_INFO
    Dim tBIH As BITMAPINFOHEADER
    Dim lStride As Long
    
    If Dir(sDestPath, vbArchive) <> vbNullString Then Kill sDestPath
    If Err.Number Then Exit Function
    
    If GetObject(lBMP, Len(tBMP), tBMP) Then
            
        Select Case tBMP.bmBitsPixel
            Case 1:  lStride = ((tBMP.bmWidth + 31) And Not 31) \ 8
            Case 4:  lStride = ((tBMP.bmWidth + 7) And Not 7) \ 2
            Case 8:  lStride = (tBMP.bmWidth + 3) And Not 3
            Case 16: lStride = ((tBMP.bmWidth * 2) + 2) And Not 2
            Case 24: lStride = ((tBMP.bmWidth * 3) + 3) And Not 3
            Case 32: lStride = tBMP.bmWidth * 4
        End Select
        
        lImgSize = (tBMP.bmHeight * lStride) - 1
        
        ReDim bytData(lImgSize)
        
        With tBI.bmiHeader
            .biBitCount = tBMP.bmBitsPixel
            .biWidth = tBMP.bmWidth
            .biHeight = tBMP.bmHeight
            .biPlanes = tBMP.bmPlanes
            .biSize = Len(tBIH)
            .biSizeImage = lImgSize
        End With

        With tASI
            .fccType = 1935960438 ' mmioStringToFOURCC("vids", 0&)
            .dwScale = 1
            .dwRate = lRate
            .dwSuggestedBufferSize = lImgSize
            .rcFrame.Right = tBMP.bmWidth
            .rcFrame.Bottom = tBMP.bmHeight
        End With
                        
        If AVIFileOpen(lpFile, sDestPath, OF_WRITE Or OF_CREATE, 0&) <> AVIERR_OK Then GoTo error
        If AVIFileCreateStream(lpFile, lpStream, tASI) <> AVIERR_OK Then GoTo error

        If bShowSaveOptions Then
            lpACO = VarPtr(tACO)
            lRet = AVISaveOptions(Owner, ICMF_CHOOSE_KEYFRAME Or ICMF_CHOOSE_DATARATE, 1, lpStream, lpACO)
            If lRet <> 1 Then
                Call AVISaveOptionsFree(1, lpACO)
                GoTo error
            End If
        End If
               
        If AVIMakeCompressedStream(lpStreamCompressed, lpStream, tACO, 0&) <> AVIERR_OK Then GoTo error
        If AVIStreamSetFormat(lpStreamCompressed, 0, ByVal VarPtr(tBI), Len(tBI)) <> AVIERR_OK Then GoTo error
 
        lhdc = GetDC(0&)
        lFramePos = 0
        CreateAviFile = WriteFrame(lBMP)

    End If

    Exit Function
error:
    Call CloseAviFile
    If Dir(sDestPath, vbArchive) <> vbNullString Then Kill sDestPath
End Function

Public Function WriteFrame(ByVal lBMP As Long) As Boolean
    If lImgSize And lhdc Then
        If GetDIBits(lhdc, lBMP, 0&, tBMP.bmHeight, bytData(0), tBI, 0&) Then
            If AVIStreamWrite(lpStreamCompressed, lFramePos, 1, VarPtr(bytData(0)), lImgSize, AVIIF_KEYFRAME, ByVal 0&, ByVal 0&) = AVIERR_OK Then
               WriteFrame = True
               lFramePos = lFramePos + 1
            End If
        End If
    End If
End Function

Public Sub CloseAviFile()
    If lpStream Then Call AVIStreamClose(lpStream): lpStream = 0
    If lpStreamCompressed Then Call AVIStreamClose(lpStreamCompressed): lpStreamCompressed = 0
    If lpFile Then Call AVIFileClose(lpFile): lpFile = 0
    If lhdc Then Call ReleaseDC(0&, lhdc): lhdc = 0
    Call AVIFileExit
    Erase bytData
    lImgSize = 0
End Sub


Private Sub Class_Terminate()
    Me.CloseAviFile
End Sub
