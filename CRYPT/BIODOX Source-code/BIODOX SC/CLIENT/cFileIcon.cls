VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cFileIcon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private Type ICONDIRENTRY
bWidth As Byte
bHeight As Byte
bColorCount As Byte
bReserved As Byte
wPlanes As Integer
wBitCount As Integer
dwBytesInRes As Long
dwImageOffset As Long
End Type
Private Type ICONDIR
idReserved As Integer
idType As Integer
idCount As Integer
End Type
Private Type MEMICONDIRENTRY
bWidth As Byte
bHeight As Byte
bColorCount As Byte
bReserved As Byte
wPlanes As Integer
wBitCount As Integer
dwBytesInRes As Long
nID As Integer
End Type
Private Type tBits
bBits() As Byte
End Type
Private Const IMAGE_BITMAP = 0
Private Const IMAGE_ICON = 1
Private Const IMAGE_CURSOR = 2
Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Any, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Const GENERIC_READ = &H80000000
Private Const GENERIC_WRITE = &H40000000
Private Const OPEN_EXISTING = 3
Private Const CREATE_ALWAYS = 2
Private Const FILE_ATTRIBUTE_NORMAL = &H80
Private Const INVALID_HANDLE_VALUE = -1
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function ReadFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, lpOverlapped As Any) As Long
Private Declare Function WriteFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, lpOverlapped As Any) As Long
Private Declare Function SetFilePointer Lib "kernel32" (ByVal hFile As Long, ByVal lDistanceToMove As Long, lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long
Private Const FILE_BEGIN = 0
Private Declare Function LoadLibraryEx Lib "kernel32" Alias "LoadLibraryExA" (ByVal lpLibFileName As String, ByVal hFile As Long, ByVal dwFlags As Long) As Long
Private Const LOAD_LIBRARY_AS_DATAFILE = &H2&
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Private Declare Function LoadResource Lib "kernel32" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
Private Declare Function LockResource Lib "kernel32" (ByVal hResData As Long) As Long
Private Declare Function FindResource Lib "kernel32" Alias "FindResourceA" (ByVal hInstance As Long, lpName As Any, lpType As Any) As Long
Private Declare Function SizeofResource Lib "kernel32" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
Private Declare Function FreeResource Lib "kernel32" (ByVal hResData As Long) As Long
Private Const RT_CURSOR = 1
Private Const RT_BITMAP = 2
Private Const RT_ICON = 3
Private Const DIFFERENCE = 11
Private Const RT_GROUP_CURSOR = RT_CURSOR + DIFFERENCE
Private Const RT_GROUP_ICON = RT_ICON + DIFFERENCE
Private Type BITMAPINFOHEADER
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
Private Type BITMAPINFO_1BPP
bmiHeader As BITMAPINFOHEADER
bmiColors(0 To 1) As RGBQUAD
End Type
Private Type BITMAPINFO_4BPP
bmiHeader As BITMAPINFOHEADER
bmiColors(0 To 15) As RGBQUAD
End Type
Private Type BITMAPINFO_8BPP
bmiHeader As BITMAPINFOHEADER
bmiColors(0 To 255) As RGBQUAD
End Type
Private Const DIB_PAL_COLORS = 1
Private Const DIB_PAL_INDICES = 2
Private Const DIB_PAL_LOGINDICES = 4
Private Const DIB_PAL_PHYSINDICES = 2
Private Const DIB_RGB_COLORS = 0
Private Const BI_RGB = 0&
Private Const BI_RLE4 = 2&
Private Const BI_RLE8 = 1&
Private Declare Function GetDIBits Lib "gdi32" (ByVal aHDC As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As Any, ByVal wUsage As Long) As Long
Private Declare Function SetDIBits Lib "gdi32" (ByVal hdc As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As Any, ByVal wUsage As Long) As Long
Private Declare Function SetDIBitsToDevice Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal dx As Long, ByVal dy As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal Scan As Long, ByVal NumScans As Long, Bits As Any, BitsInfo As Any, ByVal wUsage As Long) As Long
Private Type BITMAP
bmType As Long
bmWidth As Long
bmHeight As Long
bmWidthBytes As Long
bmPlanes As Integer
bmBitsPixel As Integer
bmBits As Long
End Type
Private Declare Function GetObjectAPI Lib "gdi32" Alias "GetObjectA" (ByVal hObject As Long, ByVal nCount As Long, lpObject As Any) As Long
Private Declare Function CreateDCAsNull Lib "gdi32" Alias "CreateDCA" (ByVal lpDriverName As String, lpDeviceName As Any, lpOutput As Any, lpInitData As Any) As Long
Private Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
Private Declare Function CreateBitmapIndirect Lib "gdi32" (lpBitmap As BITMAP) As Long
Private Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
Private Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Private Type ICONINFO
fIcon As Long
xHotspot As Long
yHotspot As Long
hBmMask As Long
hbmColor As Long
End Type
Private Declare Function CreateIconIndirect Lib "user32" (piconinfo As ICONINFO) As Long
Private Declare Function GetIconInfo Lib "user32" (ByVal hIcon As Long, piconinfo As ICONINFO) As Long
Private Type PictDesc
cbSizeofStruct As Long
picType As Long
hImage As Long
xExt As Long
yExt As Long
End Type
Private Type Guid
Data1 As Long
Data2 As Integer
Data3 As Integer
Data4(0 To 7) As Byte
End Type
Private Declare Function OleCreatePictureIndirect Lib "olepro32.dll" (lpPictDesc As PictDesc, riid As Guid, ByVal fPictureOwnsHandle As Long, ipic As IPicture) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" ( _
lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)
Public Enum ECFIImageConstants
ecfiImage
ecfiMask
End Enum
Private m_sFile As String
Private m_vID As Variant
Private m_tID As ICONDIR
Private m_tIDE() As ICONDIRENTRY
Private m_tBits() As tBits
Public Sub CloneTo(ByRef cThis As cFileIcon)
cThis.CloneFrom m_sFile, m_vID, m_tID, m_tIDE(), m_tBits()
End Sub
Friend Sub CloneFrom( _
ByRef sFile As String, _
ByRef vId As Variant, _
ByRef tID As ICONDIR, _
ByRef tIDE() As ICONDIRENTRY, _
ByRef tBits() As tBits _
)
Dim i As Long
m_sFile = sFile
m_vID = vId
LSet m_tID = tID
ReDim m_tIDE(0 To m_tID.idCount - 1) As ICONDIRENTRY
ReDim m_tBits(0 To m_tID.idCount - 1) As tBits
For i = 0 To m_tID.idCount - 1
LSet m_tIDE(i) = tIDE(i)
ReDim Preserve m_tBits(i).bBits(0 To tIDE(i).dwBytesInRes - 1) As Byte
CopyMemory m_tBits(i).bBits(0), tBits(i).bBits(0), tIDE(i).dwBytesInRes
Next i
End Sub
Public Property Get Filename() As String
Filename = m_sFile
End Property
Public Property Get ResourceID() As Variant
ResourceID = m_vID
End Property
Private Function IconToPicture(ByVal hIcon As Long) As IPicture
If hIcon = 0 Then Exit Function
Dim NewPic As Picture, PicConv As PictDesc, IGuid As Guid
PicConv.cbSizeofStruct = Len(PicConv)
PicConv.picType = vbPicTypeIcon
PicConv.hImage = hIcon
With IGuid
.Data1 = &H7BF80980
.Data2 = &HBF32
.Data3 = &H101A
.Data4(0) = &H8B
.Data4(1) = &HBB
.Data4(2) = &H0
.Data4(3) = &HAA
.Data4(4) = &H0
.Data4(5) = &H30
.Data4(6) = &HC
.Data4(7) = &HAB
End With
OleCreatePictureIndirect PicConv, IGuid, True, NewPic
Set IconToPicture = NewPic
End Function
Public Property Get IconPicture(ByVal lHDC As Long, ByVal nIndex As Long) As StdPicture
Dim hIcon As Long
hIcon = IconHandle(lHDC, nIndex)
If (hIcon <> 0) Then
Set IconPicture = IconToPicture(hIcon)
End If
End Property
Public Property Get IconHandle(ByVal lHDC As Long, ByVal nIndex As Long) As Long
Dim hBmpAND As Long
Dim hBmpXOR As Long
Dim tII As ICONINFO
tII.fIcon = IMAGE_ICON
tII.hbmColor = GetIconBitmap(lHDC, nIndex, ecfiImage, False, bReturnBmp:=True)
tII.hBmMask = GetIconBitmap(lHDC, nIndex, ecfiMask, False, bReturnBmp:=True)
IconHandle = CreateIconIndirect(tII)
DeleteObject tII.hbmColor
DeleteObject tII.hBmMask
End Property
Public Property Get ImageCount() As Long
ImageCount = m_tID.idCount
End Property
Public Property Get ImageWidth(ByVal nIndex As Long) As Long
ImageWidth = m_tIDE(nIndex - 1).bWidth
End Property
Public Property Get ImageHeight(ByVal nIndex As Long) As Long
ImageHeight = m_tIDE(nIndex - 1).bHeight
End Property
Public Property Get ImageColourCount(ByVal nIndex As Long) As Long
If (m_tIDE(nIndex - 1).bColorCount = 0) Then
ImageColourCount = 2 + m_tIDE(nIndex - 1).wBitCount
Else
ImageColourCount = m_tIDE(nIndex - 1).bColorCount
End If
End Property
Public Property Get ImageSize(ByVal nIndex As Long) As Long
ImageSize = m_tIDE(nIndex - 1).dwBytesInRes
End Property
Public Function RemoveImage(ByVal nIndex As Long) As Long
Dim i As Long
Dim tIDE As ICONDIRENTRY
Dim lShift As Long
Dim bFound As Boolean
If (m_tID.idCount > 1) Then
For i = 0 To m_tID.idCount - 1
If (nIndex = i + 1) Then
bFound = True
lShift = m_tIDE(i).dwBytesInRes
ElseIf (i + 1 >= nIndex) Then
LSet tIDE = m_tIDE(i)
LSet m_tIDE(i - 1) = tIDE
ReDim Preserve m_tBits(i - 1).bBits(0 To tIDE.dwBytesInRes - 1) As Byte
CopyMemory m_tBits(i - 1).bBits(0), m_tBits(i).bBits(0), tIDE.dwBytesInRes
m_tIDE(i - 1).dwImageOffset = m_tIDE(i).dwImageOffset - lShift
End If
Next i
m_tID.idCount = m_tID.idCount - 1
ReDim Preserve m_tIDE(0 To m_tID.idCount - 1) As ICONDIRENTRY
ReDim Preserve m_tBits(0 To m_tID.idCount - 1) As tBits
For i = 0 To m_tID.idCount - 1
m_tIDE(i).dwImageOffset = m_tIDE(i).dwImageOffset + bFound * Len(tIDE)
Next i
Else
Erase m_tIDE
Erase m_tBits
m_tID.idCount = 0
End If
End Function
Public Function AddImage(ByVal nWidth As Long, ByVal nHeight As Long, ByVal nColourCount As Long) As Long
Dim i As Long
Dim iItem As Long
Dim lMaxImageOffset As Long
Dim lNewImageOffset As Long
Dim tBMI As BITMAPINFOHEADER
Dim tRGBQ As RGBQUAD
Dim lPosition As Long
If (m_tID.idCount > 1) Then
For i = 0 To m_tID.idCount - 1
With m_tIDE(i)
If (.bHeight = nHeight) And (.bWidth = nWidth) And ImageColourCount(i + 1) = nColourCount Then
Err.Raise vbObjectError + 1048 + 1, App.EXEName & ".cFileIcon", "Icon already exists."
Exit Function
Else
If .dwImageOffset > lMaxImageOffset Then
lMaxImageOffset = .dwImageOffset
lNewImageOffset = lMaxImageOffset + .dwBytesInRes
End If
End If
End With
Next i
For i = 0 To m_tID.idCount - 1
m_tIDE(i).dwImageOffset = m_tIDE(i).dwImageOffset + Len(m_tIDE(i))
Next i
lNewImageOffset = lNewImageOffset + Len(m_tIDE(0))
End If
m_tID.idCount = m_tID.idCount + 1
iItem = m_tID.idCount - 1
ReDim Preserve m_tIDE(0 To iItem) As ICONDIRENTRY
With m_tIDE(iItem)
If (nColourCount = 2) Then
.wBitCount = 1
.bColorCount = nColourCount
ElseIf (nColourCount = 16) Then
.wBitCount = 4
.bColorCount = nColourCount
ElseIf (nColourCount = 256) Then
.wBitCount = 8
.bColorCount = 0
Else
.wBitCount = 24
.bColorCount = 0
End If
.wPlanes = 1
.bWidth = nWidth
.bHeight = nHeight
If (iItem = 0) Then
.dwImageOffset = Len(m_tID) + Len(m_tIDE(iItem))
Else
.dwImageOffset = lNewImageOffset
End If
If (.bColorCount <= 256) Then
.dwBytesInRes = Len(tBMI) + nColourCount * Len(tRGBQ)
Else
.dwBytesInRes = Len(tBMI)
End If
.dwBytesInRes = .dwBytesInRes + nHeight * WidthBytes(nWidth * .wBitCount * .wPlanes)
.dwBytesInRes = .dwBytesInRes + nHeight * WidthBytes(nWidth)
End With
ReDim Preserve m_tBits(0 To iItem) As tBits
ReDim Preserve m_tBits(iItem).bBits(0 To m_tIDE(iItem).dwBytesInRes - 1) As Byte
tBMI.biSize = Len(tBMI)
tBMI.biWidth = nWidth
tBMI.biHeight = nHeight * 2
tBMI.biPlanes = 1
tBMI.biBitCount = m_tIDE(iItem).wBitCount
tBMI.biCompression = BI_RGB
tBMI.biClrUsed = 0
CopyMemory m_tBits(iItem).bBits(0), tBMI, Len(tBMI)
If (tBMI.biBitCount = 1) Then
tRGBQ.rgbBlue = 255
tRGBQ.rgbRed = 255
tRGBQ.rgbGreen = 255
lPosition = Len(tBMI) + Len(tRGBQ)
CopyMemory m_tBits(iItem).bBits(lPosition), tRGBQ, Len(tRGBQ)
ElseIf (tBMI.biBitCount = 4) Then
ElseIf (tBMI.biBitCount = 8) Then
End If
End Function
Public Function LoadIconFromEXE( _
ByVal sFile As String, _
Optional ByVal lpID As Long = 0, _
Optional ByVal lpName As String = "" _
) As Boolean
Dim hLibrary As Long
Dim hRsrc As Long
Dim hGlobal As Long
Dim lPtr As Long
Dim iEntry As Long
Dim tMIDE As MEMICONDIRENTRY
Dim nID() As Integer
Dim iBaseOffset As Long
Dim lSize As Long
Dim bFail As Boolean
m_sFile = sFile
m_vID = Empty
Erase m_tIDE
Erase m_tBits
With m_tID
.idCount = 0
.idReserved = 0
.idType = 0
End With
hLibrary = LoadLibraryEx(sFile, ByVal 0&, LOAD_LIBRARY_AS_DATAFILE)
If (hLibrary = 0) Then
Err.Raise vbObjectError + 1048 + 6, App.EXEName & ".cFileIcon", "Can't load library."
LoadIconFromEXE = False
Else
If (lpID <> 0) Then
lpName = "#" & CStr(lpID)
hRsrc = FindResource(hLibrary, ByVal lpName, ByVal RT_GROUP_ICON)
m_vID = lpID
Else
hRsrc = FindResource(hLibrary, ByVal lpName, ByVal RT_GROUP_ICON)
m_vID = lpName
End If
If (hRsrc = 0) Then
Err.Raise vbObjectError + 1048 + 7, App.EXEName & ".cFileIcon", "Can't find resource."
LoadIconFromEXE = False
Else
hGlobal = LoadResource(hLibrary, hRsrc)
If (hGlobal = 0) Then
Err.Raise vbObjectError + 1048 + 8, App.EXEName & ".cFileIcon", "Can't load resource."
LoadIconFromEXE = False
Else
lPtr = LockResource(hGlobal)
If (lPtr = 0) Then
Err.Raise vbObjectError + 1048 + 8, App.EXEName & ".cFileIcon", "Can't lock resource."
LoadIconFromEXE = False
Else
CopyMemory m_tID, ByVal lPtr, Len(m_tID)
Debug.Print m_tID.idCount, m_tID.idReserved, m_tID.idType
If (m_tID.idCount > 0) Then
ReDim m_tIDE(0 To m_tID.idCount - 1) As ICONDIRENTRY
ReDim nID(0 To m_tID.idCount - 1) As Integer
ReDim b(0 To Len(m_tID) + Len(tMIDE) * m_tID.idCount - 1) As Byte
CopyMemory b(0), ByVal lPtr, Len(m_tID) + Len(tMIDE) * m_tID.idCount
For iEntry = 0 To m_tID.idCount - 1
CopyMemory tMIDE, b(Len(m_tID) + iEntry * Len(tMIDE)), Len(tMIDE)
nID(iEntry) = tMIDE.nID
CopyMemory m_tIDE(iEntry), tMIDE, Len(tMIDE)
Next iEntry
iBaseOffset = Len(m_tID) + Len(m_tIDE(0)) * m_tID.idCount
m_tIDE(0).dwImageOffset = iBaseOffset
For iEntry = 1 To m_tID.idCount - 1
m_tIDE(iEntry).dwImageOffset = m_tIDE(iEntry - 1).dwImageOffset + m_tIDE(iEntry - 1).dwBytesInRes
Next iEntry
ReDim m_tBits(0 To m_tID.idCount - 1) As tBits
For iEntry = 0 To m_tID.idCount - 1
lpName = "#" & nID(iEntry)
hRsrc = FindResource(hLibrary, ByVal lpName, ByVal RT_ICON)
If (hRsrc = 0) Then
bFail = True
Exit For
Else
hGlobal = LoadResource(hLibrary, hRsrc)
If (hGlobal = 0) Then
bFail = True
Exit For
Else
lSize = SizeofResource(hLibrary, hRsrc)
If (lSize > 0) And (lSize = m_tIDE(iEntry).dwBytesInRes) Then
lPtr = LockResource(hGlobal)
If (lPtr = 0) Then
bFail = True
Exit For
Else
ReDim Preserve m_tBits(iEntry).bBits(0 To lSize - 1) As Byte
CopyMemory m_tBits(iEntry).bBits(0), ByVal lPtr, lSize
End If
Else
bFail = True
End If
End If
End If
Next iEntry
If (bFail) Then
Err.Raise vbObjectError + 1048 + 9, App.EXEName & ".cFileIcon", "Failed to read bitmap bits from resource."
sFile = ""
Erase m_tIDE
Erase m_tBits
m_tID.idCount = 0
m_vID = Empty
End If
LoadIconFromEXE = Not (bFail)
End If
End If
End If
End If
FreeLibrary hLibrary
End If
End Function
Public Function LoadIcon(ByVal sFile As String) As Boolean
Dim hFile As Long
Dim iValue As Long
Dim iType As Long
Dim iEntry As Long
Dim i As Long
Dim dwBytesRead As Long
Dim bFail As Boolean
Dim sFail As String
Dim tBMI As BITMAPINFOHEADER
m_sFile = sFile
m_vID = Empty
Erase m_tIDE
Erase m_tBits
With m_tID
.idCount = 0
.idReserved = 0
.idType = 0
End With
hFile = CreateFile(sFile, GENERIC_READ, 0, ByVal 0&, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0)
If (hFile <> 0) Then
ReadFile hFile, m_tID, Len(m_tID), dwBytesRead, ByVal 0&
If (m_tID.idReserved = 0) Then
If (m_tID.idType = IMAGE_ICON) Then
Debug.Print "Icon contains " & m_tID.idCount & " images."
If (m_tID.idCount > 0) Then
ReDim m_tIDE(0 To m_tID.idCount - 1) As ICONDIRENTRY
For iEntry = 1 To m_tID.idCount
ReadFile hFile, m_tIDE(iEntry - 1), Len(m_tIDE(iEntry - 1)), dwBytesRead, ByVal 0&
If (dwBytesRead <> Len(m_tIDE(iEntry - 1))) Then
sFail = "Icon Directory Array is Corrupt."
bFail = True
Exit For
End If
Next iEntry
If Not (bFail) Then
ReDim m_tBits(0 To m_tID.idCount - 1) As tBits
For iEntry = 1 To m_tID.idCount
SetFilePointer hFile, m_tIDE(iEntry - 1).dwImageOffset, ByVal 0&, FILE_BEGIN
ReDim m_tBits(iEntry - 1).bBits(0 To m_tIDE(iEntry - 1).dwBytesInRes) As Byte
ReadFile hFile, m_tBits(iEntry - 1).bBits(0), m_tIDE(iEntry - 1).dwBytesInRes, dwBytesRead, ByVal 0&
If (dwBytesRead <> m_tIDE(iEntry - 1).dwBytesInRes) Then
sFail = "Icon Images Array is Corrupt."
bFail = True
Exit For
End If
Next iEntry
LoadIcon = Not (bFail)
End If
Else
sFail = "Icon contains no images."
End If
Else
sFail = "File is not icon type (idType <> IMAGE_ICON)"
End If
Else
sFail = "File is not icon type (reserved member is 0)"
End If
CloseHandle hFile
If (bFail) Then
Err.Raise vbObjectError + 1048 + 2, App.EXEName & ".cFileIcon", "Failed to load icon: " & sFail
sFile = ""
Erase m_tIDE
Erase m_tBits
m_tID.idCount = 0
End If
End If
End Function
Public Function SaveIcon( _
Optional ByVal sFileName As String = "" _
) As Boolean
Dim hFile As Long
Dim dwBytesWritten As Long
Dim iEntry As Long
Dim bFail As Boolean
If (m_sFile = "") Then
If (sFileName = "") Then
Err.Raise vbObjectError + 1048 + 3, App.EXEName & ".cFileIcon", "No filename specified."
Exit Function
End If
End If
If (m_tID.idCount = 0) Then
Err.Raise vbObjectError + 1048 + 4, App.EXEName & ".cFileIcon", "Icon contains no images."
Exit Function
End If
If (sFileName <> "") Then
m_sFile = sFileName
End If
hFile = CreateFile(m_sFile, GENERIC_WRITE, 0, ByVal 0&, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, ByVal 0&)
If (hFile = INVALID_HANDLE_VALUE) Then
Err.Raise vbObjectError + 1048 + 4, App.EXEName & ".cFileIcon", "Couldn't open file for writing."
Else
WriteFile hFile, m_tID, Len(m_tID), dwBytesWritten, ByVal 0&
If (dwBytesWritten = Len(m_tID)) Then
For iEntry = 0 To m_tID.idCount - 1
WriteFile hFile, m_tIDE(iEntry), Len(m_tIDE(iEntry)), dwBytesWritten, ByVal 0&
If (dwBytesWritten <> Len(m_tIDE(iEntry))) Then
bFail = True
Exit For
End If
Next iEntry
If Not (bFail) Then
For iEntry = 0 To m_tID.idCount - 1
WriteFile hFile, m_tBits(iEntry).bBits(0), m_tIDE(iEntry).dwBytesInRes, dwBytesWritten, ByVal 0&
If (m_tIDE(iEntry).dwBytesInRes <> dwBytesWritten) Then
bFail = True
Exit For
End If
Next iEntry
End If
Else
bFail = True
End If
CloseHandle hFile
If (bFail) Then
Err.Raise vbObjectError + 1048 + 5, App.EXEName & ".cFileIcon", "General failure writing icon."
End If
SaveIcon = Not (bFail)
End If
End Function
Public Sub DrawIconImage( _
ByVal lHDC As Long, _
ByVal nIndex As Long, _
Optional ByVal eType As ECFIImageConstants = ecfiImage, _
Optional ByVal X As Long = 0, Optional ByVal Y As Long = 0, _
Optional ByVal lWidth As Long = 0, Optional ByVal lHeight As Long = 0, _
Optional ByVal eRasterOp As RasterOpConstants = vbSrcCopy _
)
GetIconBitmap lHDC, nIndex, eType, True, X, Y, lWidth, lHeight, eRasterOp
End Sub
Private Function GetIconBitmap( _
ByVal lHDC As Long, _
ByVal nIndex As Long, _
ByVal eType As ECFIImageConstants, _
Optional ByVal bDrawToDC As Boolean = True, _
Optional ByVal X As Long, Optional ByVal Y As Long, _
Optional ByVal lWidth As Long, Optional ByVal lHeight As Long, _
Optional ByVal eOp As RasterOpConstants, _
Optional ByVal bReturnBmp As Boolean = False _
) As Long
Dim hdc As Long
Dim lR As Long
Dim lAnd As Long, lXor As Long
Dim tBMIH As BITMAPINFOHEADER
Dim tBMIMono As BITMAPINFO_1BPP
Dim hBmp As Long
Dim hBmpOld As Long
If (eType = ecfiImage) Then
hdc = CreateCompatibleDC(lHDC)
If (hdc <> 0) Then
hBmp = CreateCompatibleBitmap(lHDC, m_tIDE(nIndex - 1).bWidth, m_tIDE(nIndex - 1).bHeight)
If (hBmp <> 0) Then
hBmpOld = SelectObject(hdc, hBmp)
If (hBmpOld <> 0) Then
CopyMemory tBMIH, m_tBits(nIndex - 1).bBits(0), Len(tBMIH)
tBMIH.biHeight = tBMIH.biHeight \ 2
CopyMemory m_tBits(nIndex - 1).bBits(0), tBMIH, Len(tBMIH)
lXor = FindDIBits(tBMIH)
lR = SetDIBitsToDevice(hdc, 0, 0, m_tIDE(nIndex - 1).bWidth, m_tIDE(nIndex - 1).bHeight, 0, 0, 0, m_tIDE(nIndex - 1).bHeight, m_tBits(nIndex - 1).bBits(lXor), m_tBits(nIndex - 1).bBits(0), DIB_RGB_COLORS)
If (bDrawToDC) Then
If (lWidth = 0) And (lHeight = 0) Then
BitBlt lHDC, X, Y, m_tIDE(nIndex - 1).bWidth, m_tIDE(nIndex - 1).bHeight, hdc, 0, 0, eOp
Else
If (lWidth = 0) Then
lWidth = m_tIDE(nIndex - 1).bWidth
End If
If (lHeight = 0) Then
lHeight = m_tIDE(nIndex - 1).bHeight
End If
StretchBlt lHDC, X, Y, lWidth, lHeight, hdc, 0, 0, m_tIDE(nIndex - 1).bWidth, m_tIDE(nIndex - 1).bHeight, eOp
End If
End If
CopyMemory tBMIH, m_tBits(nIndex - 1).bBits(0), Len(tBMIH)
tBMIH.biHeight = tBMIH.biHeight * 2
CopyMemory m_tBits(nIndex - 1).bBits(0), tBMIH, Len(tBMIH)
SelectObject hdc, hBmpOld
End If
If (bReturnBmp) Then
GetIconBitmap = hBmp
Else
DeleteObject hBmp
End If
End If
DeleteDC hdc
End If
Else
hdc = CreateCompatibleDC(0&)
If (hdc <> 0) Then
hBmp = CreateCompatibleBitmap(hdc, m_tIDE(nIndex - 1).bWidth, m_tIDE(nIndex - 1).bHeight)
If (hBmp <> 0) Then
hBmpOld = SelectObject(hdc, hBmp)
If (hBmpOld <> 0) Then
CopyMemory tBMIMono.bmiHeader, m_tBits(nIndex - 1).bBits(0), Len(tBMIH)
lXor = FindDIBits(tBMIMono.bmiHeader)
lAnd = lXor + m_tIDE(nIndex - 1).bHeight * 1# * WidthBytes(tBMIMono.bmiHeader.biWidth * tBMIMono.bmiHeader.biPlanes * tBMIMono.bmiHeader.biBitCount)
With tBMIMono
With .bmiHeader
.biHeight = .biHeight \ 2
.biPlanes = 1
.biBitCount = 1
.biCompression = BI_RGB
.biSizeImage = 0
.biXPelsPerMeter = 0
.biYPelsPerMeter = 0
.biClrUsed = 0
.biClrImportant = 0
End With
With .bmiColors(0)
.rgbRed = 0
.rgbGreen = 0
.rgbBlue = 0
.rgbReserved = 0
End With
With .bmiColors(1)
.rgbRed = 255
.rgbGreen = 255
.rgbBlue = 255
.rgbReserved = 0
End With
End With
lR = SetDIBitsToDevice(hdc, 0, 0, m_tIDE(nIndex - 1).bWidth, m_tIDE(nIndex - 1).bHeight, 0, 0, 0, m_tIDE(nIndex - 1).bHeight, m_tBits(nIndex - 1).bBits(lAnd), tBMIMono, DIB_RGB_COLORS)
If (bDrawToDC) Then
If (lWidth = 0) And (lHeight = 0) Then
BitBlt lHDC, X, Y, m_tIDE(nIndex - 1).bWidth, m_tIDE(nIndex - 1).bHeight, hdc, 0, 0, eOp
Else
If (lWidth = 0) Then
lWidth = m_tIDE(nIndex - 1).bWidth
End If
If (lHeight = 0) Then
lHeight = m_tIDE(nIndex - 1).bHeight
End If
StretchBlt lHDC, X, Y, lWidth, lHeight, hdc, 0, 0, m_tIDE(nIndex - 1).bWidth, m_tIDE(nIndex - 1).bHeight, eOp
End If
End If
SelectObject hdc, hBmpOld

End If
If (bReturnBmp) Then
GetIconBitmap = hBmp
Else
DeleteObject hBmp
End If
End If
DeleteObject hdc
End If
End If
End Function

Private Function FindDIBits(ByRef tBMI As BITMAPINFOHEADER) As Long
Dim tRGBQ As RGBQUAD
FindDIBits = Len(tBMI) + DIBNumColors(tBMI) * Len(tRGBQ)
End Function
Private Function DIBNumColors(ByRef tBMI As BITMAPINFOHEADER) As Long
Dim wBitCount As Long
Dim dwClrUsed As Long
dwClrUsed = tBMI.biClrUsed
If (dwClrUsed <> 0) Then
DIBNumColors = dwClrUsed
Else
wBitCount = tBMI.biBitCount
Select Case wBitCount
Case 1
DIBNumColors = 2
Case 4
DIBNumColors = 16
Case 8
DIBNumColors = 256
Case Else
DIBNumColors = 0
End Select
End If
End Function
Private Function WidthBytes(ByVal lWidth As Long) As Long
WidthBytes = ((lWidth + 31) \ 32) * 4
End Function


