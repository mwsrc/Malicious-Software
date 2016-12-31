Attribute VB_Name = "mdlversionreader"
Public Type FILEVERINFO
    FileVer As String
    ProdVer As String
    FileFlags As String
    FileOS As String
    FileType As String
    FileSubtype As String
    Language As String
    Company As String
    FileDesc As String
    Copyright As String
    ProductName As String
    InternalName As String
    OriginalName As String
    Comments As String
    LegalCopyright As String
    LegalTrademarks As String
    PrivateBuild As String
    SpecialBuild As String
End Type


Public Type FIXEDFILEINFO
    Signature As Long
    StructVerl As Integer
    StructVerh As Integer
    FileVerPart2 As Integer
    FileVerPart1 As Integer
    FileVerPart4 As Integer
    FileVerPart3 As Integer
    ProdVerPart2 As Integer
    ProdVerPart1 As Integer
    ProdVerPart4 As Integer
    ProdVerPart3 As Integer
    FileFlagsMask As Long
    FileFlags As Long
    FileOS As Long
    FileType As Long
    FileSubtype As Long
    FileDateMS As Long
    FileDateLS As Long
End Type

Private Declare Function GetFileVersionInfoSize Lib "Version" Alias "GetFileVersionInfoSizeA" (ByVal lpszFilename As String, lpdwHandle As Long) As Long
Private Declare Function GetFileVersionInfo Lib "Version" Alias "GetFileVersionInfoA" (ByVal lpszFilename As String, ByVal dwhandle As Long, ByVal dwLen As Long, lpData As Any) As Long
Private Declare Function VersionQueryValue Lib "Version" Alias "VerQueryValueA" (lpBlock As Any, ByVal lpSubBlock As String, lpBufPtr As Long, lBufLen As Long) As Long

Private Declare Function VerLanguageName Lib "kernel32" Alias "VerLanguageNameA" (ByVal wLang As Long, ByVal szLang As String, ByVal nSize As Long) As Long

Private Declare Function ShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal lBufLen As Long) As Long
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVerInfo As OSVERSIONINFO) As Long

Private Declare Function pStrToStr Lib "kernel32" Alias "lstrcpyA" (ByVal lpszDest As String, ByVal lpSrc As Long) As Long
Private Declare Function pStrLen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As Long) As Long

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (dest As Any, src As Any, ByVal Length As Long)


Private Const MAXSHORT = 128
Private Const MAXLONG = 260

Private Type OSVERSIONINFO
    dwSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * MAXSHORT
End Type

Private Const ffi_SIGNATURE = &HFEEF04BD
Private Const ffi_STRUCVERSION = &H10000
Private Const ffi_FILEFLAGSMASK = &H3F&


Private Const VS_FF_DEBUG = &H1
Private Const VS_FF_PRERELEASE = &H2
Private Const VS_FF_PATCHED = &H4
Private Const VS_FF_PRIVATEBUILD = &H8
Private Const VS_FF_INFOINFERRED = &H10
Private Const VS_FF_SPECIALBUILD = &H20


Private Const VOS_UNKNOWN = &H0
Private Const VOS_DOS = &H10000
Private Const VOS_OS216 = &H20000
Private Const VOS_OS232 = &H30000
Private Const VOS_NT = &H40000

Private Const VOS__BASE = &H0
Private Const VOS__WINDOWS16 = &H1
Private Const VOS__PM16 = &H2
Private Const VOS__PM32 = &H3
Private Const VOS__WINDOWS32 = &H4

Private Const VOS_DOS_WINDOWS16 = &H10001
Private Const VOS_DOS_WINDOWS32 = &H10004
Private Const VOS_OS216_PM16 = &H20002
Private Const VOS_OS232_PM32 = &H30003
Private Const VOS_NT_WINDOWS32 = &H40004


Private Const VFT_UNKNOWN = &H0
Private Const VFT_APP = &H1
Private Const VFT_DLL = &H2
Private Const VFT_DRV = &H3
Private Const VFT_FONT = &H4
Private Const VFT_VXD = &H5
Private Const VFT_STATIC_LIB = &H7

Private Const VFT2_UNKNOWN = &H0
Private Const VFT2_DRV_PRINTER = &H1
Private Const VFT2_DRV_KEYBOARD = &H2
Private Const VFT2_DRV_LANGUAGE = &H3
Private Const VFT2_DRV_DISPLAY = &H4
Private Const VFT2_DRV_MOUSE = &H5
Private Const VFT2_DRV_NETWORK = &H6
Private Const VFT2_DRV_SYSTEM = &H7
Private Const VFT2_DRV_INSTALLABLE = &H8
Private Const VFT2_DRV_SOUND = &H9
Private Const VFT2_DRV_COMM = &HA

Public Function GetVersionInfo(sFileSpec As String, fvi As FILEVERINFO) As Boolean
    If Len(sFileSpec) = 0 Then Err.Raise 5
    If Len(Dir$(sFileSpec)) = 0 Then Err.Raise 53

    If (IsWin9x) Then If (Not ValidLen(sFileSpec)) Then Exit Function

    Dim ffi As FIXEDFILEINFO
    Dim lRet         As Long
    Dim lDummy       As Long
    Dim ayBlock()    As Byte
    Dim ayBuf()      As Byte
    Dim lBufferLen   As Long
    Dim lVerPointer  As Long
    Dim lLangId      As Long
    Dim sTemp        As String
    Dim sLangCharset As String

    On Error GoTo Fail

    lBufferLen = GetFileVersionInfoSize(sFileSpec, lDummy)
    If (lBufferLen = 0) Then Exit Function


    ReDim ayBlock(lBufferLen) As Byte
    lRet = GetFileVersionInfo(sFileSpec, 0&, lBufferLen, ayBlock(0))
    If (lRet = 0) Then Exit Function


    lRet = VersionQueryValue(ayBlock(0), "\", lVerPointer, lBufferLen)
    If (lRet = 0) Then Exit Function

    CopyMemory ffi, ByVal lVerPointer, Len(ffi)



    fvi.FileVer = Format$(ffi.FileVerPart1) & "." & Format$(ffi.FileVerPart2) & "." & _
                  Format$(ffi.FileVerPart3) & "." & Format$(ffi.FileVerPart4)


    fvi.ProdVer = Format$(ffi.ProdVerPart1) & "." & Format$(ffi.ProdVerPart2) & "." & _
                  Format$(ffi.ProdVerPart3) & "." & Format$(ffi.ProdVerPart4)

    fvi.FileFlags = vbNullString
    If ffi.FileFlags And VS_FF_DEBUG Then fvi.FileFlags = "Debug "
    If ffi.FileFlags And VS_FF_PRERELEASE Then fvi.FileFlags = fvi.FileFlags & "PreRel "
    If ffi.FileFlags And VS_FF_PATCHED Then fvi.FileFlags = fvi.FileFlags & "Patched "
    If ffi.FileFlags And VS_FF_PRIVATEBUILD Then fvi.FileFlags = fvi.FileFlags & "Private "
    If ffi.FileFlags And VS_FF_INFOINFERRED Then fvi.FileFlags = fvi.FileFlags & "Info "
    If ffi.FileFlags And VS_FF_SPECIALBUILD Then fvi.FileFlags = fvi.FileFlags & "Special "
    If ffi.FileFlags And VFT2_UNKNOWN Then fvi.FileFlags = fvi.FileFlags + "Unknown "


    Select Case ffi.FileOS
        Case VOS_DOS_WINDOWS16: fvi.FileOS = "DOS-Win16"
        Case VOS_DOS_WINDOWS32: fvi.FileOS = "DOS-Win32"
        Case VOS_OS216_PM16:    fvi.FileOS = "OS/2-16 PM-16"
        Case VOS_OS232_PM32:    fvi.FileOS = "OS/2-16 PM-32"
        Case VOS_NT_WINDOWS32:  fvi.FileOS = "NT-Win32"
        Case Else:              fvi.FileOS = "Unknown"
    End Select

    Select Case ffi.FileType
        Case VFT_APP:        fvi.FileType = "App"
        Case VFT_DLL:        fvi.FileType = "DLL"
        Case VFT_DRV:        fvi.FileType = "Driver"
            Select Case ffi.FileSubtype
                Case VFT2_DRV_PRINTER:     fvi.FileSubtype = "Printer drv"
                Case VFT2_DRV_KEYBOARD:    fvi.FileSubtype = "Keyboard drv"
                Case VFT2_DRV_LANGUAGE:    fvi.FileSubtype = "Language drv"
                Case VFT2_DRV_DISPLAY:     fvi.FileSubtype = "Display drv"
                Case VFT2_DRV_MOUSE:       fvi.FileSubtype = "Mouse drv"
                Case VFT2_DRV_NETWORK:     fvi.FileSubtype = "Network drv"
                Case VFT2_DRV_SYSTEM:      fvi.FileSubtype = "System drv"
                Case VFT2_DRV_INSTALLABLE: fvi.FileSubtype = "Installable"
                Case VFT2_DRV_SOUND:       fvi.FileSubtype = "Sound drv"
                Case VFT2_DRV_COMM:        fvi.FileSubtype = "Comm drv"
                Case VFT2_UNKNOWN:         fvi.FileSubtype = "Unknown"
            End Select
        Case VFT_FONT:       fvi.FileType = "Font"
            Select Case ffi.FileSubtype
                Case VFT_FONT_RASTER:      fvi.FileSubtype = "Raster Font"
                Case VFT_FONT_VECTOR:      fvi.FileSubtype = "Vector Font"
                Case VFT_FONT_TRUETYPE:    fvi.FileSubtype = "TrueType Font"
            End Select
        Case VFT_VXD:        fvi.FileType = "VxD"
        Case VFT_STATIC_LIB: fvi.FileType = "Lib"
        Case Else:           fvi.FileType = "Unknown"
    End Select

    lRet = VersionQueryValue(ayBlock(0), "\VarFileInfo\Translation", lVerPointer, lBufferLen)
    If (lRet = 0) Then Exit Function

    If (lBufferLen = 0) Then Exit Function

    ReDim ayBuf(lBufferLen) As Byte
    CopyMemory ayBuf(0), ByVal lVerPointer, lBufferLen

    CopyMemory lLangId, ayBuf(0), 2
    sTemp = String$(MAXLONG, vbNullChar)
    lRet = VerLanguageName(lLangId, sTemp, MAXLONG)

    fvi.Language = Left$(sTemp, InStr(sTemp, vbNullChar) - 1)

    sLangCharset = Hex$(ayBuf(2) + ayBuf(3) * &H100 + ayBuf(0) * &H10000 + ayBuf(1) * &H1000000)

    Do While Len(sLangCharset) < 8
        sLangCharset = "0" & sLangCharset
    Loop

    rc = VersionQueryValue(ayBlock(0), "\StringFileInfo\" & sLangCharset & "\CompanyName", lVerPointer, lBufferLen)
    If (rc = 0) Then Exit Function

    If (lBufferLen <> 0) Then
        fvi.Company = PointerToStr(lVerPointer)
    End If

    rc = VersionQueryValue(ayBlock(0), "\StringFileInfo\" & sLangCharset & "\FileDescription", lVerPointer, lBufferLen)
    If (rc = 0) Then Exit Function

    If (lBufferLen <> 0) Then
        fvi.FileDesc = PointerToStr(lVerPointer)
    End If

    rc = VersionQueryValue(ayBlock(0), "\StringFileInfo\" & sLangCharset & "\LegalCopyright", lVerPointer, lBufferLen)
    If (rc = 0) Then Exit Function

    If (lBufferLen <> 0) Then
        fvi.Copyright = PointerToStr(lVerPointer)
    End If

    rc = VersionQueryValue(ayBlock(0), "\StringFileInfo\" & sLangCharset & "\ProductName", lVerPointer, lBufferLen)
    If (rc = 0) Then Exit Function

    If (lBufferLen <> 0) Then
        fvi.ProductName = PointerToStr(lVerPointer)
    End If

    rc = VersionQueryValue(ayBlock(0), "\StringFileInfo\" & sLangCharset & "\InternalName", lVerPointer, lBufferLen)
    If (rc = 0) Then Exit Function

    If (lBufferLen <> 0) Then
        fvi.InternalName = PointerToStr(lVerPointer)
    End If

    rc = VersionQueryValue(ayBlock(0), "\StringFileInfo\" & sLangCharset & "\OriginalFilename", lVerPointer, lBufferLen)
    If (rc = 0) Then Exit Function

    If (lBufferLen <> 0) Then
        fvi.OriginalName = PointerToStr(lVerPointer)
    End If

    rc = VersionQueryValue(ayBlock(0), "\StringFileInfo\" & sLangCharset & "\Comments", lVerPointer, lBufferLen)
                fvi.Comments = PointerToStr(lVerPointer)
    rc = VersionQueryValue(ayBlock(0), "\StringFileInfo\" & sLangCharset & "\LegalCopyright", lVerPointer, lBufferLen)
            fvi.LegalCopyright = PointerToStr(lVerPointer)

    rc = VersionQueryValue(ayBlock(0), "\StringFileInfo\" & sLangCharset & "\LegalTrademarks", lVerPointer, lBufferLen)
        fvi.LegalTrademarks = PointerToStr(lVerPointer)
    rc = VersionQueryValue(ayBlock(0), "\StringFileInfo\" & sLangCharset & "\PrivateBuild", lVerPointer, lBufferLen)
        fvi.PrivateBuild = PointerToStr(lVerPointer)
    rc = VersionQueryValue(ayBlock(0), "\StringFileInfo\" & sLangCharset & "\SpecialBuild", lVerPointer, lBufferLen)
        fvi.SpecialBuild = PointerToStr(lVerPointer)


    GetVersionInfo = True
Fail:
End Function

Public Function GetVersionInfoStruct(sFileSpec As String, ffi As FIXEDFILEINFO) As Boolean
    If Len(sFileSpec) = 0 Then Err.Raise 5
    If Len(Dir$(sFileSpec)) = 0 Then Err.Raise 53

    If (IsWin9x) Then If (Not ValidLen(sFileSpec)) Then Exit Function

    Dim lRet         As Long
    Dim lDummy       As Long
    Dim ayBlock()    As Byte
    Dim lBufferLen   As Long
    Dim lVerPointer  As Long

    On Error GoTo Fail
    lBufferLen = GetFileVersionInfoSize(sFileSpec, lDummy)
    If (lBufferLen = 0) Then Exit Function
    ReDim ayBlock(lBufferLen) As Byte
    lRet = GetFileVersionInfo(sFileSpec, 0&, lBufferLen, ayBlock(0))
    If (lRet = 0) Then Exit Function
    lRet = VersionQueryValue(ayBlock(0), "\", lVerPointer, lBufferLen)
    If (lRet = 0) Then Exit Function
    CopyMemory ffi, ByVal lVerPointer, Len(ffi)
    GetVersionInfoStruct = True
Fail:
End Function

Public Function IsNewerVersion(SrcVer As FIXEDFILEINFO, ThanDestVer As FIXEDFILEINFO) As Boolean
   With SrcVer
      If .FileOS <> ThanDestVer.FileOS Then Err.Raise 13
      If .FileType <> ThanDestVer.FileType Then Err.Raise 13

      If .FileVerPart1 > ThanDestVer.FileVerPart1 Then GoTo Newer
      If .FileVerPart1 < ThanDestVer.FileVerPart1 Then Exit Function

      If .FileVerPart2 > ThanDestVer.FileVerPart2 Then GoTo Newer
      If .FileVerPart2 < ThanDestVer.FileVerPart2 Then Exit Function

      If .FileVerPart3 > ThanDestVer.FileVerPart3 Then GoTo Newer
      If .FileVerPart3 < ThanDestVer.FileVerPart3 Then Exit Function

      If .FileVerPart4 > ThanDestVer.FileVerPart4 Then GoTo Newer
   End With
   Exit Function
Newer:
   IsNewerVersion = True
End Function

Private Function PointerToStr(ByVal pStr As Long) As String
    Dim lLen As Long, sTemp As String
    lLen = pStrLen(pStr)
    sTemp = String$(lLen + 1, vbNullChar)
    pStrToStr sTemp, pStr
    PointerToStr = Left$(sTemp, lLen) 'B.Mc
End Function

Private Function ValidLen(sLongPath As String) As Boolean
    Dim rc As Long, sPath As String
    sPath = String$(MAXLONG, vbNullChar)
    rc = ShortPathName(sLongPath, sPath, MAXLONG)
    If (rc) Then ValidLen = (InStr(sPath, vbNullChar) <= MAXSHORT)
End Function

Private Function IsWin9x() As Boolean
    Dim osvi As OSVERSIONINFO: osvi.dwSize = Len(osvi)
    If (GetVersionEx(osvi)) Then IsWin9x = (osvi.dwPlatformId And &H1&)
End Function



