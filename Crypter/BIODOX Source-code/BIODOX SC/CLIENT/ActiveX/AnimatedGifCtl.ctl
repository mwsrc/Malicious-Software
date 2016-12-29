VERSION 5.00
Begin VB.UserControl AnimatedGifCtl 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   2880
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3840
   PaletteMode     =   1  'UseZOrder
   PropertyPages   =   "AnimatedGifCtl.ctx":0000
   ScaleHeight     =   192
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   256
   Begin VB.Timer Timer1 
      Left            =   1680
      Top             =   1080
   End
End
Attribute VB_Name = "AnimatedGifCtl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Animated Gif Ctl Ver 2.0"
Attribute VB_Ext_KEY = "PropPageWizardRun" ,"Yes"
 Option Explicit
 Private Type RECTL
     Left As Long
     Top As Long
     Right As Long
     Bottom As Long
 End Type
 
 Private Type SIZEL
     cx As Long
     cy As Long
 End Type
 
 Private Type POINTAPI
     x As Long
     y As Long
 End Type
 
 Private Type PALETTEENTRY
     peRed As Byte
     peGreen As Byte
     peBlue As Byte
     peFlags As Byte
 End Type
 
 Private Type LOGPALETTE
     palVersion As Integer
     palNumEntries As Integer
     palPalEntry(1) As PALETTEENTRY
 End Type
 
 Private Type RGBQUAD
     RGBBlue As Byte
     RGBGreen As Byte
     RGBRed As Byte
     rgbReserved As Byte
 End Type
 
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
 
 Private Const NUMPICCOLORS = 255
 
 Private Type BITMAPINFO256
     bmiHeader As BITMAPINFOHEADER
     bmiColors(255) As RGBQUAD ' 8 bit RGB
 End Type
 
 Private Type BITMAPINFO2
     bmiHeader As BITMAPINFOHEADER
     bmiColors(0 To 1) As RGBQUAD ' 2 Color RGB
 End Type
 
 Private Type BITMAPINFO
     bmiHeader As BITMAPINFOHEADER
     ' No Colors 24 bit RGB
 End Type
 
 ' Below reTyped - easier to write
 Private Type BITMAPFILEHEADER    '14 bytes
     bfType As Integer
     bfSize(3) As Byte 'Long
     'bfSize As Long
     bfReserved1 As Integer
     bfReserved2 As Integer
     'bfOffBits As Long
     bfOffBits(3) As Byte
 End Type
 
 Private Type DIBSECTION
     dsBm As BITMAP
     dsBmih As BITMAPINFOHEADER
     dsBitfields(2) As Long
     dshSection As Long
     dsOffset As Long
 End Type
 
 Private Const OFS_MAXPATHNAME = 128
 
 ' OpenFile() Structure
 Private Type OFSTRUCT
     cBytes As Byte
     fFixedDisk As Byte
     nErrCode As Integer
     Reserved1 As Integer
     Reserved2 As Integer
     szPathName(OFS_MAXPATHNAME) As Byte
 End Type
 
 Private Type SECURITY_ATTRIBUTES
 nLength As Long
 lpSecurityDescriptor As Long
 bInheritHandle As Long
 End Type
 
 Private Declare Sub InitCommonControls Lib "comctl32.dll" ()
 Private Declare Function SetCapture Lib "user32" (ByVal hwnd As Long) As Long
 Private Declare Function ReleaseCapture Lib "user32" () As Long
 Private Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
 Private Declare Function CreateBitmapIndirect Lib "gdi32" (lpBitmap As BITMAP) As Long
 Private Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
 
 Private Declare Function CreateBitmap Lib "gdi32" _
   (ByVal nWidth As Long, _
    ByVal nHeight As Long, _
    ByVal nPlanes As Long, _
    ByVal nBitCount As Long, _
    lpBits As Any) As Long
 
 Private Declare Function LockWindowUpdate Lib "user32" (ByVal hWndLock As Long) As Long
 'Private Declare Function GetPixel Lib "gdi32" (ByVal hDC As Long, ByVal x As Long, ByVal y As Long) As Long
 Private Declare Function GetPaletteEntries Lib "gdi32" (ByVal hPalette As Long, ByVal wStartIndex As Long, ByVal wNumEntries As Long, lpPaletteEntries As PALETTEENTRY) As Long
 Private Declare Function RealizePalette Lib "gdi32" (ByVal hdc As Long) As Long
 
 Private Declare Function GetDIBColorTable Lib "gdi32" _
 (ByVal hdc As Long, ByVal un1 As Long, ByVal un2 As Long, pRGBQuad As RGBQUAD) As Long
 
 Private Declare Function GetCurrentObject Lib "gdi32" _
 (ByVal hdc As Long, ByVal uObjectType As Long) As Long
 
 Private Declare Function GetStockObject Lib "gdi32" (ByVal nIndex As Long) As Long
 Private Declare Function SetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal crColor As Long) As Long
 
 Private Declare Function GetNearestColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long
 Private Declare Function GetNearestPaletteIndex Lib "gdi32" (ByVal hPalette As Long, ByVal crColor As Long) As Long
 Private Declare Function CreateHalftonePalette Lib "gdi32" (ByVal hdc As Long) As Long
 
 Private Declare Function SelectPalette Lib "gdi32" (ByVal hdc As Long, ByVal hPalette As Long, ByVal bForceBackground As Long) As Long
 Private Declare Function SetBitmapBits Lib "gdi32" ()
 
 Private Declare Function FillRect Lib "user32" _
 (ByVal hdc As Long, lpRect As RECTL, ByVal hBrush As Long) As Long
 
 Private Declare Function GetTempPath Lib "KERNEL32" _
 Alias "GetTempPathA" (ByVal nBufferLength As Long, _
 ByVal lpBuffer As String) As Long
 
 Private Declare Function GetTempFileName _
   Lib "KERNEL32" Alias "GetTempFileNameA" _
   (ByVal lpszPath As String, _
   ByVal lpPrefixString As String, _
   ByVal wUnique As Long, _
   ByVal lpTempFileName As String) As Long
  
 Private Declare Function GetMapMode Lib "gdi32" (ByVal hdc As Long) As Long
 
 ' CHange to allow NULL for PaletteEntry struct.
 ' Function will Return total number of palette entries
 Private Declare Function GetNumSystemPaletteEntries Lib "gdi32" _
 Alias "GetSystemPaletteEntries" _
 (ByVal hdc As Long, ByVal wStartIndex As Long, _
 ByVal wNumEntries As Long, lpPaletteEntries As Long) As Long
 
 Private Declare Function GetSystemPaletteEntries Lib "gdi32" (ByVal hdc As Long, ByVal wStartIndex As Long, ByVal wNumEntries As Long, lpPaletteEntries As PALETTEENTRY) As Long
 Private Declare Function CreatePalette Lib "gdi32" (lpLogPalette As LOGPALETTE) As Long
 Private Declare Function SetDIBColorTable Lib "gdi32" (ByVal hdc As Long, ByVal un1 As Long, ByVal un2 As Long, pcRGBQuad As RGBQUAD) As Long
 
 Private Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
 
 'changed lpbits from ByRef as Any
 Private Declare Function StretchDIBits Lib "gdi32" _
 (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, _
 ByVal dx As Long, ByVal dy As Long, ByVal SrcX As Long, _
 ByVal SrcY As Long, ByVal wSrcWidth As Long, _
 ByVal wSrcHeight As Long, ByVal lpBits As Long, _
 lpBitsInfo As BITMAPINFO, ByVal wUsage As Long, _
 ByVal dwRop As Long) As Long
 
 Private Declare Function WindowFromDC Lib "user32" (ByVal hdc As Long) As Long
 Private Declare Function SetMapMode Lib "gdi32" _
 (ByVal hdc As Long, ByVal nMapMode As Long) As Long
 
 'Private Declare Function GetStockObject Lib "gdi32" (ByVal nIndex As Long) As Long
 Private Declare Function GetStretchBltMode Lib "gdi32" ()
 
 Private Declare Function GetBoundsRect Lib "gdi32" _
 (ByVal hdc As Long, lprcBounds As RECTL, ByVal flags As Long) As Long
 
 Private Declare Function RestoreDC Lib "gdi32" (ByVal hdc As Long, ByVal nSavedDC As Long) As Long
 
 Private Declare Function SaveDC Lib "gdi32" _
 (ByVal hdc As Long) As Long
 
 Private Declare Function GdiFlush Lib "gdi32" () As Long
 
 Private Declare Function GetDeviceCaps Lib "gdi32" _
 (ByVal hdc As Long, ByVal nIndex As Long) As Long
 
 Private Declare Function SetFocus Lib "user32" (ByVal hwnd As Long) As Long
 
 Private Declare Function GetClientRect Lib "user32" _
 (ByVal hwnd As Long, lpRect As RECTL) As Long
 
 Private Declare Function GetWindowRect Lib "user32" _
 (ByVal hwnd As Long, lpRect As RECTL) As Long
 
 Private Declare Sub Sleep Lib "KERNEL32" (ByVal dwMilliseconds As Long)
 
 ' Create an Information Context
  Private Declare Function apiCreateIC Lib "gdi32" Alias "CreateICA" _
   (ByVal lpDriverName As String, ByVal lpDeviceName As String, _
   ByVal lpOutput As String, lpInitData As Any) As Long
   
  ' Close an existing Device Context (or information context)
  Private Declare Function apiDeleteDC Lib "gdi32" Alias "DeleteDC" _
   (ByVal hdc As Long) As Long
 
  Private Declare Function GetSystemMetrics Lib "user32" (ByVal nIndex As Long) As Long
  
 Private Declare Function SetBkMode Lib "gdi32" _
 (ByVal hdc As Long, ByVal nBkMode As Long) As Long
 
 Private Declare Function apiCreateCompatibleBitmap Lib "gdi32" _
  Alias "CreateCompatibleBitmap" _
  (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
  
  Private Declare Sub apiCopyMemory Lib "KERNEL32" Alias "RtlMoveMemory" _
      (Destination As Any, Source As Any, ByVal Length As Long)
  
  Private Declare Function apiGetStockObject Lib "gdi32" Alias "GetStockObject" _
  (ByVal nIndex As Long) As Long
      
  Private Declare Function apiSelectObject Lib "gdi32" _
   Alias "SelectObject" (ByVal hdc As Long, ByVal hObject As Long) As Long
  
  Private Declare Function apiSetTextAlign Lib "gdi32" Alias "SetTextAlign" _
  (ByVal hdc As Long, ByVal wFlags As Long) As Long
  
  Private Declare Function apiSetTextColor Lib "gdi32" Alias "SetTextColor" _
  (ByVal hdc As Long, ByVal crColor As Long) As Long
  
  Private Declare Function apiSetBkColor Lib "gdi32" Alias "SetBkColor" _
  (ByVal hdc As Long, ByVal crColor As Long) As Long
   
  Private Declare Function apiGetDC Lib "user32" _
    Alias "GetDC" (ByVal hwnd As Long) As Long
  
  Private Declare Function apiReleaseDC Lib "user32" _
    Alias "ReleaseDC" (ByVal hwnd As Long, _
    ByVal hdc As Long) As Long
  
  Private Declare Function apiCreateCompatibleDC Lib "gdi32" _
    Alias "CreateCompatibleDC" (ByVal hdc As Long) As Long
  
   Private Declare Function apiBitBlt Lib "gdi32" _
    Alias "BitBlt" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, _
    ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, _
    ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
  
  Private Declare Function apiDeleteObject Lib "gdi32" _
    Alias "DeleteObject" (ByVal hObject As Long) As Long
  
  Private Declare Function apiGetObject Lib "gdi32" Alias "GetObjectA" _
  (ByVal hObject As Long, ByVal nCount As Long, lpObject As Any) As Long
  
  Private Declare Function apiGetDeviceCaps Lib "gdi32" _
    Alias "GetDeviceCaps" (ByVal hdc As Long, ByVal nIndex As Long) As Long
  
 'ннннннннннннннннннннннннннннннннннннннннннннннннна
 Private Declare Function ExtFloodFill Lib "gdi32" _
 (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, _
 ByVal crColor As Long, ftype As Long) As Long
 
  Private Declare Function apiMoveToEx Lib "gdi32" Alias "MoveToEx" _
  (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, lpPoint As Any) As Long
  'above was lpPoint as POINTAPI, changed to Any to allow NULL
  
  Private Declare Function apiCreateDIBSection Lib "gdi32" Alias _
  "CreateDIBSection" (ByVal hdc As Long, pBitmapInfo As BITMAPINFO, _
  ByVal un As Long, lplpVoid As Long, ByVal handle As Long, _
  ByVal dw As Long) As Long
  
   Private Declare Function apiCreateDIBSection2 Lib "gdi32" Alias _
  "CreateDIBSection" (ByVal hdc As Long, pBitmapInfo As BITMAPINFO2, _
  ByVal un As Long, lplpVoid As Long, ByVal handle As Long, _
  ByVal dw As Long) As Long
  
   Private Declare Function apiCreateDIBSection255 Lib "gdi32" Alias _
  "CreateDIBSection" (ByVal hdc As Long, pBitmapInfo As BITMAPINFO256, _
  ByVal un As Long, lplpVoid As Long, ByVal handle As Long, _
  ByVal dw As Long) As Long
  
  Private Declare Function apiFillRect Lib "user32" Alias "FillRect" _
  (ByVal hdc As Long, lpRect As RECTL, ByVal hBrush As Long) As Long
          
  Private Declare Function apiCreateSolidBrush Lib "gdi32" Alias "CreateSolidBrush" _
  (ByVal crColor As Long) As Long
  
  Private Declare Function GlobalLock Lib "KERNEL32" (ByVal hMem As Long) As Long
  Private Declare Function GlobalAlloc Lib "KERNEL32" _
    (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
  
  Private Declare Sub CopyMemory Lib "KERNEL32" Alias "RtlMoveMemory" _
  (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)
  
 Private Declare Function CreateFile Lib "KERNEL32" _
 Alias "CreateFileA" _
 (ByVal lpFileName As String, _
 ByVal dwDesiredAccess As Long, _
 ByVal dwShareMode As Long, _
 lpSecurityAttributes As SECURITY_ATTRIBUTES, _
 ByVal dwCreationDisposition As Long, _
 ByVal dwFlagsAndAttributes As Long, _
 ByVal hTemplateFile As Long) As Long
 
 Private Declare Function CloseHandle Lib "KERNEL32" _
 (ByVal hObject As Long) As Long
 
 Private Declare Function WriteFile Lib "KERNEL32" _
 (ByVal hFile As Long, _
 lpBuffer As Any, _
 ByVal nNumberOfBytesToWrite As Long, _
 lpNumberOfBytesWritten As Long, _
 ByVal lpOverlapped As Long) As Long
 ' For asynchronous operation, change to
 ' lpOverlapped as OVERLAPPED.
 
 Private Declare Function GetDiskFreeSpace Lib "KERNEL32" _
 Alias "GetDiskFreeSpaceA" _
 (ByVal lpRootPathName As String, _
 lpSectorsPerCluster As Long, lpBytesPerSector As Long, _
 lpNumberOfFreeClusters As Long, lpTotalNumberOfClusters As Long) As Long
 
 Private Declare Function ReadFile Lib "KERNEL32" _
 (ByVal hFile As Long, _
 lpBuffer As Any, _
 ByVal nNumberOfBytesToRead As Long, _
 lpNumberOfBytesRead As Long, _
 ByVal lpOverlapped As Long) As Long
 ' For asynchronous operation, change to
 ' lpOverlapped as OVERLAPPED.
 
 Private Declare Function SetFilePointer Lib "KERNEL32" _
 (ByVal hFile As Long, _
 ByVal lDistanceToMove As Long, _
 lpDistanceToMoveHigh As Long, _
 ByVal dwMoveMethod As Long) As Long
 
                  
  ' Constants GDI
  Private Const SM_CXVSCROLL = 2
 
 ' File Constants
 Private Const MAX_PATH = 260
 'Private Const OF_PROMPT = &H2000
 'Private Const OF_READ = &H0
 'Private Const OF_READWRITE = &H2
 'Private Const OF_CREATE = &H1000
 Private Const FILE_SHARE_READ = &H1
 Private Const FILE_SHARE_WRITE = &H2
 Private Const GENERIC_READ = &H80000000
 Private Const GENERIC_WRITE = &H40000000
 Private Const FILE_FLAG_RANDOM_ACCESS = &H10000000
 Private Const FILE_ATTRIBUTE_NORMAL = &H80
 Private Const INVALID_HANDLE_VALUE = -1
 Private Const CREATE_NEW = 1
 Private Const CREATE_ALWAYS = 2
 Private Const OPEN_EXISTING = 3
 Private Const OPEN_ALWAYS = 4
 Private Const TRUNCATE_EXISTING = 5
 Private Const FILE_BEGIN = 0
 Private Const FILE_CURRENT = 1
 Private Const FILE_END = 2
 
 ' GetObject constants
 Private Const OBJ_DC = 3
 Private Const OBJ_METADC = 4
 Private Const OBJ_PAL = 5
 Private Const OBJ_FONT = 6
 Private Const OBJ_BITMAP = 7
 Private Const OBJ_REGION = 8
 Private Const OBJ_METAFILE = 9
 Private Const OBJ_MEMDC = 10
 Private Const OBJ_EXTPEN = 11
 Private Const OBJ_ENHMETADC = 12
 Private Const OBJ_ENHMETAFILE = 13
 
 ' constants for the biCompression field
 Private Const BI_RGB = 0&
 Private Const BI_RLE8 = 1&
 Private Const BI_RLE4 = 2&
 Private Const BI_bitfields = 3&
 
 ' Stock Logical Objects
 Private Const WHITE_BRUSH = 0
 Private Const LTGRAY_BRUSH = 1
 Private Const GRAY_BRUSH = 2
 Private Const DKGRAY_BRUSH = 3
 Private Const BLACK_BRUSH = 4
 Private Const NULL_BRUSH = 5
 Private Const HOLLOW_BRUSH = NULL_BRUSH
 Private Const WHITE_PEN = 6
 Private Const BLACK_PEN = 7
 Private Const NULL_PEN = 8
 Private Const OEM_FIXED_FONT = 10
 Private Const ANSI_FIXED_FONT = 11
 Private Const ANSI_VAR_FONT = 12
 Private Const SYSTEM_FONT = 13
 Private Const DEVICE_DEFAULT_FONT = 14
 Private Const DEFAULT_PALETTE = 15
 Private Const SYSTEM_FIXED_FONT = 16
 Private Const STOCK_LAST = 16
 
 Private Const CLR_INVALID = &HFFFF
 
 ' OpenFile() Flags
 Private Const OF_READ = &H0
 Private Const OF_WRITE = &H1
 Private Const OF_READWRITE = &H2
 Private Const OF_SHARE_COMPAT = &H0
 Private Const OF_SHARE_EXCLUSIVE = &H10
 Private Const OF_SHARE_DENY_WRITE = &H20
 Private Const OF_SHARE_DENY_READ = &H30
 Private Const OF_SHARE_DENY_NONE = &H40
 Private Const OF_PARSE = &H100
 Private Const OF_DELETE = &H200
 Private Const OF_VERIFY = &H400
 Private Const OF_CANCEL = &H800
 Private Const OF_CREATE = &H1000
 Private Const OF_PROMPT = &H2000
 Private Const OF_EXIST = &H4000
 Private Const OF_REOPEN = &H8000
 
 '  Ternary raster operations
 Private Const SRCCOPY = &HCC0020 ' (DWORD) dest = source
 Private Const SRCPAINT = &HEE0086        ' (DWORD) dest = source OR dest
 Private Const SRCAND = &H8800C6  ' (DWORD) dest = source AND dest
 Private Const SRCINVERT = &H660046       ' (DWORD) dest = source XOR dest
 Private Const SRCERASE = &H440328        ' (DWORD) dest = source AND (NOT dest )
 Private Const NOTSRCCOPY = &H330008      ' (DWORD) dest = (NOT source)
 Private Const NOTSRCERASE = &H1100A6     ' (DWORD) dest = (NOT src) AND (NOT dest)
 Private Const MERGECOPY = &HC000CA       ' (DWORD) dest = (source AND pattern)
 Private Const MERGEPAINT = &HBB0226      ' (DWORD) dest = (NOT source) OR dest
 Private Const PATCOPY = &HF00021 ' (DWORD) dest = pattern
 Private Const PATPAINT = &HFB0A09        ' (DWORD) dest = DPSnoo
 Private Const PATINVERT = &H5A0049       ' (DWORD) dest = pattern XOR dest
 Private Const DSTINVERT = &H550009       ' (DWORD) dest = (NOT dest)
 Private Const BLACKNESS = &H42 ' (DWORD) dest = BLACK
 Private Const WHITENESS = &HFF0062       ' (DWORD) dest = WHITE
 Private Const DIB_RGB_COLORS = 0 '  color table in RGBs
   
   ' Background Modes
 Private Const TRANSPARENT = 1
 Private Const OPAQUE = 2
 Private Const BKMODE_LAST = 2
 
 '  Mapping Modes
 Private Const MM_TEXT = 1
 Private Const MM_LOMETRIC = 2
 Private Const MM_HIMETRIC = 3
 Private Const MM_LOENGLISH = 4
 Private Const MM_HIENGLISH = 5
 Private Const MM_TWIPS = 6
 Private Const MM_ISOTROPIC = 7
 Private Const MM_ANISOTROPIC = 8
 
 ' Brush Styles
 Private Const BS_SOLID = 0
 Private Const BS_NULL = 1
 Private Const BS_HOLLOW = BS_NULL
 Private Const BS_HATCHED = 2
 Private Const BS_PATTERN = 3
 Private Const BS_INDEXED = 4
 Private Const BS_DIBPATTERN = 5
 Private Const BS_DIBPATTERNPT = 6
 Private Const BS_PATTERN8X8 = 7
 Private Const BS_DIBPATTERN8X8 = 8
 
 '  Device Parameters for GetDeviceCaps()
 Private Const DRIVERVERSION = 0      '  Device driver version
 Private Const TECHNOLOGY = 2         '  Device classification
 Private Const HORZSIZE = 4           '  Horizontal size in millimeters
 Private Const VERTSIZE = 6           '  Vertical size in millimeters
 Private Const HORZRES = 8            '  Horizontal width in pixels
 Private Const VERTRES = 10           '  Vertical width in pixels
 Private Const BITSPIXEL = 12         '  Number of bits per pixel
 Private Const PLANES = 14            '  Number of planes
 Private Const NUMBRUSHES = 16        '  Number of brushes the device has
 Private Const NUMPENS = 18           '  Number of pens the device has
 Private Const NUMMARKERS = 20        '  Number of markers the device has
 Private Const NUMFONTS = 22          '  Number of fonts the device has
 Private Const NUMCOLORS = 24         '  Number of colors the device supports
 Private Const PDEVICESIZE = 26       '  Size required for device descriptor
 Private Const CURVECAPS = 28         '  Curve capabilities
 Private Const LINECAPS = 30          '  Line capabilities
 Private Const POLYGONALCAPS = 32     '  Polygonal capabilities
 Private Const TEXTCAPS = 34          '  Text capabilities
 Private Const CLIPCAPS = 36          '  Clipping capabilities
 Private Const RASTERCAPS = 38        '  Bitblt capabilities
 Private Const ASPECTX = 40           '  Length of the X leg
 Private Const ASPECTY = 42           '  Length of the Y leg
 Private Const ASPECTXY = 44          '  Length of the hypotenuse
 
 Private Const LOGPIXELSX = 88        '  Logical pixels/inch in X
 Private Const LOGPIXELSY = 90        '  Logical pixels/inch in Y
 
 Private Const SIZEPALETTE = 104      '  Number of entries in physical palette
 Private Const NUMRESERVED = 106      '  Number of reserved entries in palette
 Private Const COLORRES = 108         '  Actual color resolution
 
 ' StretchBlt() Modes
 Private Const BLACKONWHITE = 1
 Private Const WHITEONBLACK = 2
 Private Const COLORONCOLOR = 3
 Private Const HALFTONE = 4
 Private Const MAXSTRETCHBLTMODE = 4
 
 Private Const TWIPSPERINCH = 1440
 
 ' ExtFloodFill style flags
 Private Const FLOODFILLBORDER = 0
 Private Const FLOODFILLSURFACE = 1
 
 ' How many total bytes in our ColorTable
 ' 256*3 RGB Triplets
 Private Const SizeOfMaxLocalColorTable = 768
 
 ' ** START OF OUR VARIABLES **
 
 ' Handle to our Bitmap
 Dim hBMap As Long
 
 ' Screen Compatible DCs
 ' Handle to Access Application Device Context
 Dim hDCApp As Long
 Dim hDCbuffer As Long
 
 ' Not need for this version
 ' Was for version using DIB
 ' Leave in case we want File Save
 Dim bmh256 As BITMAPINFO256
 
 ' I put in then took out support for
 ' palette's to look after 256 Color Mode.
 ' Used in Access Version.
 Dim pal256(0 To 255) As PALETTEENTRY
 ' handle to System generated Halftone palette
 Dim hpalHalfTone As Long
 
 ' hold handle to original bitmap selected into a DC
 Dim hBmpOrig As Long
 
 ' Array holds starting Byte offset for begining of each Gif Frame
 Private mGifStart() As Long
 ' Array holds starting Byte offset for begining of each Gif Frame
 Private mGifEnd() As Long
 
 
 ' *********** CHANGE*********
 ' Change to as Object before release
 ' as it is the only DLL Reference
 ' in this module.
 ' Array of StdPicture objects
 Dim hStdPicture() As Object 'StdPicture
       
 ' Saves declaring Temp vars in every function/sub
 Private lngRet As Long
 Private blRet As Boolean
 Private lngTemp As Long
 Dim hDCtemp As Long
 Dim bTemp As Byte
 Dim x As Integer
 
 'Assorted GDI handles
 Private mImageCtl As Object
 Private mhDCImage As Long
 Private mBitmap As Long
 Private mBitMapAdd As Long
 Private hOrigBitmap As Long
 Private hOrigFont As Long
 Private hBrush As Long
 Private hOldBrush As Long
 Private hOrigBrush As Long
 Dim mForeColor As Long
 Dim mBackColor As Long
 
 
 ' Need some GDI structures
 ' mainly for Access version.
 Private lpBmih As BITMAPINFO
 Dim rc As RECTL
 Dim bm As BITMAP
 Dim bmap As BITMAP
  
 ' Byte array to hold entire Original Animated Disk file.
 Dim bArray() As Byte
 
 ' Logical Screen Descriptor packed bits field
 ' since we will also use this variable in
 ' our processing for each Gif frame.
 ' Don't really need to store this field for
 ' each frame but good idea for debugging
 ' and in case this field is extended or
 ' used for additional purposes.
 Dim PackedFields() As Byte
 
 ' Logical Screen Descriptor
 ' Background color Index
 Dim BackgroundColorIndex As Byte
 
 ' Logical Screen Descriptor
 ' Pixel Aspect Ratio
 Dim PixelASpectRatio As Byte
 
 ' Logical Screen Descriptor
 ' number of bits per primary color in orig pic
 Dim ColorResolution As Byte
 
 ' Logical Screen Descriptor
 ' Is there a Global Color Table immediately
 ' following this Block
 Dim GlobalColorTableFlag As Boolean
 
 ' Max 256 Colors of 8bitx3 RGB triplets values
 Dim GlobalColorTable(0 To 767) As Byte
 
 ' Logical Screen Descriptor
 ' Image Max Width
 Dim LogWidth As Integer
 
 ' Logical Screen Descriptor
 ' Image Max Height
 Dim LogHeight As Integer
 
 ' Logical Screen Descriptor
 ' Is Global Color table Sorted?
 Dim GSortFlag As Boolean
 
 ' Logical Screen Descriptor
 ' raise 2 to the (value of this field + 1)
 ' to get actaul size of Global Color Table
 Dim SizeOfGlobalColorTable As Byte
 
 ' Arrays to store the value for each
 ' individual frame of the Animated Gif.
 Dim ImageLeft() As Integer
 Dim ImageTop() As Integer
 Dim ImageWidth() As Integer
 Dim ImageHeight() As Integer
 Dim LSortFlag() As Boolean
 Dim LocalColorTableFlag() As Boolean
 Dim InterLaceFlag() As Boolean
 Dim SizeOfLocalColorTable() As Byte
 Dim LocalColorTable(0 To 767) As Byte
 Dim LZWMinimumCodeSize() As Byte
 Dim DelayTime() As Integer
 Dim TransparentColorIndex() As Byte
 Dim DisposalMethod() As Byte
 Dim UserInputFlag() As Boolean
 Dim TransparentColorFlag() As Boolean
 
 ' ********* FIX !!!!!!!!!!!!!!!!   *********
 ' Will come back and add more support for
 ' LocalColorTables
 'Dim arrayLocalColorTables() As LocalColorTable()
 
 ' Loop counter
 Dim ctr1 As Long
 
 ' Holder for temp RGB values
 Dim bTemparray(0 To 2) As Byte
 
 ' Another Holder for temp BackGround RGB Value
 Dim bBGarray(0 To 2) As Byte
 
 ' Another Holder for temp Transparent RGB Value comparison
 Dim bTransparentarray(0 To 2) As Byte
      
 ' For createDibSection
 ' Used in Access version
 'Dim bmh As BITMAPINFO256
 
 ' User Defined Delay Property
 Dim mUserDelay As Long
 
 ' Some older Gifs use the Transparent Color
 ' in the actual Image. This property turns on
 ' a function to change the Transparent Color
 ' to a Color not currently used in the Image.
 Dim mChangeTransparentColor As Boolean
 
 ' Prop to Signal Stop Rendering
 Dim mStopRender As Boolean
  
 'Default Property Values:
 Const m_def_strGifFileName = ""
 
 'Property Variables:
 Dim m_strGifFileName As String
 Dim m_hDC As Long
 
 'Event Declarations:
 Event Resize() 'MappingInfo=UserControl,UserControl,-1,Resize
 Event Paint() 'MappingInfo=UserControl,UserControl,-1,Paint
 
 ' Number of Frames in this Animated Gif file
 Dim m_NumberOfFrames As Long
 ' Current Frame Number we are rendering
 Dim m_CurrentFrame As Long
 
 ' Is there a valid stored FileName prop to display
 Dim m_DisplaySavedGifFileName As Boolean
 
 ' Create instance of MS Common Dialog CLass
 
 
 
         
 'DEVELOPED AND TESTED UNDER MICROSOFT VB6 ONLY
 '
 'Copyright: Stephen Lebans - Lebans Holdings 1999 Ltd.
 '
 '
 'Name:      AnimatedGifCtl
 '
 'Version:   2.0
 '
 'Purpose:   Allow for display of Animated Gif files.
 '           I've stuck the code in an ActiveX
 '           control just to make it easier to use.
 '           You can pull the code back out and
 '           use the handle to the Device Context
 '           of a PictureBox control instead of the
 '           UserControl. You would also have to
 '           use the PictureBox BackColor prop instead
 '           of the UserControl BackColor prop.
 '
 'Why?:      Because I have never seen complete source code
 '           in Visual Basic to play Animated Gifs.
 '
 'Author:    Stephen Lebans
 'Email:     Stephen@lebans.com
 'Web Site:  www.lebans.com
 'Date:      May 20, 2000, 10:14:25 PM
 '
 'Called by: Wherever. :-)
 '
 'Calls:     Bunch of API stuff
 '
 'Inputs:    FileName prop. See Inline Comments for explanation.
 
 'Output:    See inline Docs for each Function call
 '
 'Credits:   Dev Ashish, Terry Kreft, the MS KB
 '           and others mentioned directly
 '           in the code comments. :-)
 '
 'BUGS:      No serious ones that I've noticed but something always pops up.
 '           Most problems I have seen relate to Video Drivers,
 '           specifically Hardware Acceleration.
 '           Please report any bugs to my email address.
 '
 'What's Missing:
 '           The actual Gif Render function needs to run in its own
 '           seperate thread. Not really possible in this version of VB.
 '           I may revisit this issue when VB7 arives.
 '
 '           Proper Error handling :-(
 '
 '           An AutoBackColor feature. Remember a lot of
 '           Animated Gif files do nto have Transparent Backgrounds.
 '
 '           Please send me a copy of any enhancements/bug fixes you create for this
 '           function at Stephen@lebans.com
 '
 'Enjoy
 'Stephen Lebans
 '********************************************
 
 
 
 
 '***************** CODE START ***************
 Property Get UserDelay() As Long
Attribute UserDelay.VB_ProcData.VB_Invoke_Property = "PropPage1"
 UserDelay = mUserDelay
 End Property
 
 Property Let UserDelay(lngDelay As Long)
 ' Amount of extra Delay to add to add
 ' to amount specified directly in Gif file
 If IsNumeric(lngDelay) Then
     mUserDelay = lngDelay
 Else
     mUserDelay = 10
 End If
 ' Boundary checking for Max/Min Delay
 If mUserDelay > 1000 Then mUserDelay = 1000
 If mUserDelay < 1 Then mUserDelay = 1
 End Property
 
 Property Get StopRender() As Boolean
Attribute StopRender.VB_ProcData.VB_Invoke_Property = "PropPage1"
 ' Flag to tell us to stop rendering Gif Frame
 StopRender = mStopRender
 End Property
 
 Property Let StopRender(blS As Boolean)
 mStopRender = blS
 End Property
 
 Property Get ChangeTransparentColor() As Boolean
 ' Flag to tell us to change current
 ' Transparent color to a value not used
 ' in the current Image.
 ChangeTransparentColor = mChangeTransparentColor
 End Property
 
 Property Let ChangeTransparentColor(blC As Boolean)
 mChangeTransparentColor = blC
 End Property
 
 Property Get NumberofFrames() As Long
 ' How many individual frames make up
 ' this Animated Gif file.
 NumberofFrames = m_NumberOfFrames
 End Property
 
 Property Let NumberofFrames(nframes As Long)
 m_NumberOfFrames = nframes
 End Property
 
 Property Get CurrentFrame() As Long
 ' The current Frame number we are rendering.
 ' This is a ZERO based index
 CurrentFrame = m_CurrentFrame
 End Property
 
 Property Let CurrentFrame(curframe As Long)
 m_CurrentFrame = curframe
 End Property
 
 Property Get DisplaySavedGifFileName() As Boolean
 ' Did user set the FileName prop in Design View
 DisplaySavedGifFileName = m_DisplaySavedGifFileName
 End Property
 
 Property Let DisplaySavedGifFileName(blSF As Boolean)
 m_DisplaySavedGifFileName = blSF
 End Property
       
 Private Sub ClearControl()
 ' Repaint the background of the Control
 Dim rc1 As RECTL
 Dim hNewBrush As Long
 
 ' For Access Version
 ' Let's use mBackColor
 'lngRet = apiFloodFill(hDC, 0, 0, mBackColor)
 
 If hdc = 0 Then Exit Sub
 rc1.Right = ScaleWidth
 rc1.Bottom = ScaleHeight
 
 lngTemp = ConvertSystemColor(BackColor)
 hNewBrush = apiCreateSolidBrush(lngTemp)
 'holdbrush = apiSelectObject(hDC, hnewbrush)
 'lngRet = apiDeleteObject(holdbrush)
 
 lngRet = apiFillRect(hdc, rc1, hNewBrush)
 lngRet = apiDeleteObject(hNewBrush)
    
 End Sub
      
 
 Public Sub SetBackColor()
 ' Call Color Dialog to select
 ' a new color for the Control's Background
 Dim lngTemp As Long
 
 ' Call the Color Dialog
 
 
 
 ' For Access Version
 'mImageCtl.BackColor = mBackColor
 'lngRet = apiSetBkColor(hDC, mBackColor)
 End Sub
              
              
 Private Function GetUniqueFilename(Optional Path As String = "", _
 Optional Prefix As String = "", _
 Optional UseExtension As String = "") _
 As String
 
 ' originally Posted by Terry Kreft
 ' to: comp.Databases.ms -Access
 ' Subject:  Re: Creating Unique filename ??? (Dev code)
 ' Date: 01/15/2000
 ' Author: Terry Kreft <terry.kreft@mps.co.uk>
 
 ' SL Note: Input strings must be NULL terminated.
 ' Here it is done by the calling function.
 
   Dim wUnique As Long
   Dim lpTempFileName As String
   Dim lngRet As Long
    Dim FileHeader As BITMAPFILEHEADER
   wUnique = 0
   If Path = "" Then Path = CurDir
   lpTempFileName = String(MAX_PATH, 0)
   lngRet = GetTempFileName(Path, Prefix, _
                             wUnique, lpTempFileName)
  
   lpTempFileName = Left(lpTempFileName, _
                         InStr(lpTempFileName, Chr(0)) - 1)
   Call Kill(lpTempFileName)
   If Len(UseExtension) > 0 Then
     lpTempFileName = Left(lpTempFileName, Len(lpTempFileName) - 3) & UseExtension
   End If
   GetUniqueFilename = lpTempFileName
 End Function
 
                 
 Private Function fCreateBitMap() As Boolean
 ' Function to create a Temp Bitmap.
 ' We use this as an off screen buffer
 ' so we elimate screen flashing during redraws
  
 ' Temp handles for GDI objects
 Dim hBrush As Long, origBrush As Long
 
 ' Fill in our Bitmap structure
 bmap.bmBitsPixel = 24
 bmap.bmHeight = LogHeight
 bmap.bmPlanes = 1
 bmap.bmWidth = ((LogWidth + 31) And &HFFFFFE0)
 bmap.bmWidthBytes = bmap.bmWidth * 3
 hBMap = CreateCompatibleBitmap(hdc, bmap.bmWidth, bmap.bmHeight)
 
 ' THis is deleted when Class exits
 hBmpOrig = apiSelectObject(hDCbuffer, hBMap)
 
 ' Fill in our Rectangle structure
 rc.Top = 0
 rc.Bottom = bmap.bmHeight
 rc.Left = 0
 rc.Right = bmap.bmWidth
 
 ' Let's fill our new Bitmap with the Background Color
 ' Make sure we can handle System colors(MSB is set)
 lngTemp = ConvertSystemColor(BackColor) '.BackColor)
 hBrush = apiCreateSolidBrush(lngTemp)
 lngRet = apiFillRect(hDCbuffer, rc, hBrush)
 lngRet = apiDeleteObject(hBrush)
 
 End Function
 
         
 
    Private Function fGifBreakOutFrames() As Boolean
    ' This is the main function. Missing final
    ' support for Local Color Tables. Hopefully
    ' will be included with next revision.
    ' Break an Animated Gif file up into the seperate
    ' GIF frames  that make up the entire animation.
     
    Const Pathlen = 256
     
     ' GIF Block Extension Label Values
     Const ExtensionIntroducer = &H21
     Const ApplicationExtension = &HFF
     Const CommentExtension = &HFE
     Const GraphicControlExtension = &HF9
     Const ImageDescriptor = &H2C
     Const PlainTextExtension = &H1
     Const Trailer = &H3B
     ' Intel Byte ordering
     Const GIF89 = &H38464947
     
     ' Length of Logical Screen Descriptor Block
     Const lenLogicalScreenDescriptor = 7
     
     ' Length of Graphic Control Extension Block
     Const lenGraphicControlExtension = 7
     
     ' Length of Image Descriptor Block
     Const lenImageDescriptor = 10
      
     ' Generally use Hex values but
     ' Decimal is clearer for educational purposes.
     Const Bit8 = 128
     Const Bit7 = 64
     Const Bit6 = 32
     Const Bit5 = 16
     Const Bit4 = 8
     Const Bit3 = 4
     Const Bit2 = 2
     Const Bit1 = 1
     
    ' Length of Gif File Header
    Const lenGifHeader = 6
    
    ' Current Position in our Byte Array
    Dim lngCurPosition As Long
    
     ' Starting offset to  current GIF frame
     Dim lngGifStart As Long
    
     ' Ending offset to current GIF Frame
     Dim lngGifEnd As Long
    
     ' Temp var to  check our Constants against
     Dim varTemp As Variant
    
     ' Need Flag so we can init arrays properly
     ' first time through loops
     Dim blFirstTime As Boolean
     blFirstTime = True
    
     ' Saves typing and necessary logic to
     ' init and Redim our storage arrays
     ' Loop Counter
     Dim lc As Long
    
     ' Self explanatory
     Dim strPath  As String * Pathlen
     Dim strPathandFileName  As String
     Dim lngStartLocalColorTable As Long
     Dim lngStartGlobalColorTable As Long
     Dim lngNewTransparent As Long
     Dim lngIndexDuplicate As Long
     Dim lngMax As Long
     Dim lngMaxPrevious As Long
    
     ' FileHandle Number
     Dim Fnum As Integer
     
     ' Length of file
     Dim FLength As Long
     
     ' Initialize our Class arrays
     ' Most importantly we release all of our handles
     ' to the StdPicture objects that were created the
     ' last time we ran this function.
     CleanUp
     
                 
     ' Is there a valid Filename
     If Len(strGifFileName & vbNullString) < 1 Then Exit Function
                       
      ' Get next avail file handle
     Fnum = FreeFile
     
     Open strGifFileName For Binary As Fnum
     FLength = LOF(Fnum)
     ' Animated Gifs are relatively Small
     ' Read in Entire File!
     ReDim bArray(1 To FLength)
     Get Fnum, , bArray
     Close Fnum
         
          
     ' We need to handle the PackedFlags array seperately
     ' since it is the only array used in this part of the function
     ReDim PackedFields(0)
     
     ' Let's check and make sure we are an Animated Gif!
     apiCopyMemory lngRet, bArray(1), 4
     If lngRet <> GIF89 Then GoTo err_NoGif
        
     ' OK let's fill in our variables we derive from
     ' The Logical Screen Descriptor Block that always follows
     ' the 6 byte File Header with the GIF Signature
     apiCopyMemory LogWidth, bArray(lenGifHeader + 1), 2
     apiCopyMemory LogHeight, bArray(lenGifHeader + 3), 2
     apiCopyMemory PackedFields(0), bArray(lenGifHeader + 5), 1
     apiCopyMemory BackgroundColorIndex, bArray(lenGifHeader + 6), 1
     apiCopyMemory PixelASpectRatio, bArray(lenGifHeader + 7), 1
           
     
     ' update our current position in the buffer
     lngCurPosition = lngCurPosition + lenGifHeader + lenLogicalScreenDescriptor
     
        
     ' Let's derive our props from the packed Bit fields
     If PackedFields(0) And Bit8 Then GlobalColorTableFlag = True
     ' ColorResolution variable is a Byte with really only 3 bits significant
     If PackedFields(0) And Bit7 Then ColorResolution = Bit3
     If PackedFields(0) And Bit6 Then ColorResolution = ColorResolution Or Bit2
     If PackedFields(0) And Bit5 Then ColorResolution = ColorResolution Or Bit1
     
     If PackedFields(0) And Bit4 Then GSortFlag = True
     
     ' SizeOfGlobalColorTable variable is a Byte with really only 3 bits significant
     ' SizeOfGlobalColorTable variable is a Byte with really only 3 bits significant
     ' clear out first in case Bit 3 is still set from last time!!!!!!!!!
     ' Geeze this logic took me 2 hours to figure out. :-(
     SizeOfGlobalColorTable = 0
     If PackedFields(0) And Bit3 Then SizeOfGlobalColorTable = Bit3
     If PackedFields(0) And Bit2 Then SizeOfGlobalColorTable = SizeOfGlobalColorTable Or Bit2
     If PackedFields(0) And Bit1 Then SizeOfGlobalColorTable = SizeOfGlobalColorTable Or Bit1
     
     ' is there a Global Color Table?
     If GlobalColorTableFlag Then
         ' Calculate size of Global Color Table
         ' to calculate offset to jump to start of next Block
         ' Color Table = RGB Triple,  3 bytes per entry
         ' Copy the Color Table to its storage array
         ' Just changed line below to fix problem of starting
         ' to copy color table 2 bytes to soon
         ' 1 byte was index on array other is lngcurposition
         apiCopyMemory GlobalColorTable(0), bArray(lngCurPosition + 1), (3 * (2 ^ (SizeOfGlobalColorTable + 1)))
          lngStartGlobalColorTable = lngCurPosition + 1
         lngCurPosition = lngCurPosition + (3 * (2 ^ (SizeOfGlobalColorTable + 1)))
     End If
     
     
     ' Reset starting point for this Gif
     ' update our current position in the buffer
     lngCurPosition = lngCurPosition + 1
     ' Every temp Gif will have File header above and
     ' Global Color Table if it exists
     lngGifStart = lngCurPosition
           
    'Initialize Loop counter for first time through
    lc = 0
    
    ' Clear out our array of Standard Picture handles
    Erase hStdPicture()
    
    Do While lngCurPosition <= FLength
    ' Now are building the guts for each indiviual Gif frame
    ' of the Animated Gif file.
    ' Let's Redim our storage arrays with the
    ' value of the loop counter,
      
    ReDim Preserve PackedFields(lc)
    ReDim Preserve ImageLeft(lc)
    ReDim Preserve ImageTop(lc)
    ReDim Preserve ImageWidth(lc)
    ReDim Preserve ImageHeight(lc)
    ReDim Preserve LSortFlag(lc)
    ReDim Preserve LocalColorTableFlag(lc)
    ReDim Preserve InterLaceFlag(lc)
    ReDim Preserve SizeOfLocalColorTable(lc)
    
    ReDim Preserve LZWMinimumCodeSize(lc)
    ReDim Preserve DelayTime(lc)
    ReDim Preserve TransparentColorIndex(lc)
    ReDim Preserve DisposalMethod(lc)
    ReDim Preserve UserInputFlag(lc)
    ReDim Preserve TransparentColorFlag(lc)
    
    'ReDim Preserve arrayLocalColorTables(lc)
    
    ' Let's see what the next Block is.
    ' We'll keep moving forward until we hit the
    ' Image Descriptor Block.
    ' Immediately following this Block is the actual
    ' Image data. We will copy from the start of the Gif until the
    ' end of the Image Data to a temporary Disk file.
    ' We will then load this temp GIF file(frame) into an Image Control.
  
    Do While bArray(lngCurPosition) <> ImageDescriptor
  
     ' Usually we find next an Image Descriptor or the Netscape Application Extension Block
     ' Let's check for all Blocks that have are proceeded
     ' by the ExtensionInducer value
     If bArray(lngCurPosition) = ExtensionIntroducer Then
    
     Select Case bArray(lngCurPosition + 1)
     
     Case ApplicationExtension
     ' This needs to check and see if it is
     ' the Netscape App Ext to read the value
     ' for the number of itinerations the loop
     ' should be executed to display the GIF
     
     ' Jump to start of Application Data Sub Blocks
     lngCurPosition = lngCurPosition + 14 'bArray(lngCurPosition + 14)
     lngCurPosition = lngCurPosition + bArray(lngCurPosition)
     
     ' if Next byte is 0 then this is the Block terminator
     'If bArray(lngCurPosition + 1) <> 0 Then
     ' Keep reading Comment Blocks until done
     Do While bArray(lngCurPosition + 1) <> 0
         lngCurPosition = lngCurPosition + bArray(lngCurPosition + 1)
     lngCurPosition = lngCurPosition + 1
    Loop
      
     
     Case CommentExtension
     ' Jump length of first Comment Data Sub Block
     ' First Byte of this Data block is always the Size
     ' not including this Byte!
     lngCurPosition = lngCurPosition + 2
     lngCurPosition = lngCurPosition + bArray(lngCurPosition)
     ' if Next byte is 0 then this is the Block terminator
     'If bArray(lngCurPosition + 1) <> 0 Then
     ' Keep reading Comment Blocks until done
     Do While bArray(lngCurPosition + 1) <> 0
         lngCurPosition = lngCurPosition + bArray(lngCurPosition + 1)
     lngCurPosition = lngCurPosition + 1
     Loop
     'End If
     lngCurPosition = lngCurPosition + 1
    
' **** ERROR
' ** Sharing PackedFields with GraphicControl and ImageDescriptor
' No harm done becasue I store the derived vars from Packed fields individually.
      Case GraphicControlExtension
       ' Here we can derive key props concerning the
       ' playback of the GIF.
       ' OK let's fill in our variables we derive from this block
      apiCopyMemory PackedFields(lc), bArray(lngCurPosition + 2 + 1), 1
      apiCopyMemory DelayTime(lc), bArray(lngCurPosition + 2 + 2), 2
      apiCopyMemory TransparentColorIndex(lc), bArray(lngCurPosition + 2 + 4), 1
  
      ' SizeOfGlobalColorTable variable is a Byte with really only 3 bits significant
      If PackedFields(lc) And Bit5 Then DisposalMethod(lc) = Bit3
      If PackedFields(lc) And Bit4 Then DisposalMethod(lc) = DisposalMethod(lc) Or Bit2
      If PackedFields(lc) And Bit3 Then DisposalMethod(lc) = DisposalMethod(lc) Or Bit1
  
      If PackedFields(lc) And Bit2 Then UserInputFlag(lc) = True
  
      If PackedFields(lc) And Bit1 Then TransparentColorFlag(lc) = True
      lngCurPosition = lngCurPosition + lenGraphicControlExtension
       
         
      Case PlainTextExtension
      ' Jump to start of Plain Text Data Sub Blocks
      lngCurPosition = lngCurPosition + bArray(lngCurPosition + 14)
      ' if Next byte is 0 then this is the Block terminator
      'If bArray(lngCurPosition + 1) <> 0 Then
      ' Keep reading Comment Blocks until done
      Do While bArray(lngCurPosition + 1) <> 0
          lngCurPosition = lngCurPosition + bArray(lngCurPosition + 1)
      lngCurPosition = lngCurPosition + 1
      Loop
      'End If
               
      Case Else
      End Select
  
  ' If not a Block starting with ExtensionIntroducer
  ' we fall through to here
  End If
  
  ' Update our position to continue in loop
  lngCurPosition = lngCurPosition + 1
      
      
  ' Check to make sure we are not at the end of the file
  If bArray(lngCurPosition) = Trailer Then Exit Do
  If lngCurPosition >= FLength Then Exit Do

  lngRet = 0
   

Loop
  
  ' OK if we get to here than we are at the start  of the Image Descriptor Block
  ' or we are all done processing the individual GIf Frames.
  
  
  ' Check to make sure we are not at the end of the file
  If bArray(lngCurPosition) = Trailer Then Exit Do
      If lngCurPosition >= FLength Then Exit Do
      
      
    ' OK let's jump over Image Descriptor Block
    ' and the actual Image Data so we can copy this
    ' Gif Frame to a Temp file.
    ' Here we can derive key props concerning the
    ' playback of this Specific GIF Frame.
    ' OK let's fill in our variables we derive from this block.
    apiCopyMemory ImageLeft(lc), bArray(lngCurPosition + 1), 2
    apiCopyMemory ImageTop(lc), bArray(lngCurPosition + 3), 2
    apiCopyMemory ImageWidth(lc), bArray(lngCurPosition + 5), 2
    apiCopyMemory ImageHeight(lc), bArray(lngCurPosition + 7), 2
    apiCopyMemory PackedFields(lc), bArray(lngCurPosition + 9), 1
      
        
    ' Let's derive our props from the packed Bit fields
    If PackedFields(lc) And Bit8 Then LocalColorTableFlag(lc) = True
    If PackedFields(lc) And Bit7 Then InterLaceFlag(lc) = True
    If PackedFields(lc) And Bit6 Then LSortFlag(lc) = True
    
    ' SizeOfLocalColorTable variable is a Byte with really only 3 bits significant
    If PackedFields(lc) And Bit3 Then SizeOfLocalColorTable(lc) = Bit3
    If PackedFields(lc) And Bit2 Then SizeOfLocalColorTable(lc) = SizeOfLocalColorTable(lc) Or Bit2
    If PackedFields(lc) And Bit1 Then SizeOfLocalColorTable(lc) = SizeOfLocalColorTable(lc) Or Bit1

    ' is there a Local Color Table?
    If LocalColorTableFlag(lc) Then
        ' Calculate size of Local Color Table
        ' to calculate offset to jump to start of next Block
        ' Color Table = RGB Triple,  3 bytes per entry
        ' Just changed line below to fix problem of starting
        ' to copy color table 2 bytes to soon
        ' 1 byte was index on array other is lngcurposition
        apiCopyMemory LocalColorTable(0), bArray(lngCurPosition + 1), (3 * (2 ^ (SizeOfLocalColorTable(lc) + 1)))
        ' Copy over this LocalColorTable to our
        ' array of LocalColorTables. I forgot that I
        ' need to store an array of Local Color Tables.
        ' This is my quick fix until I can come back and
        ' redo the code for the next version!
        ' apiCopyMemory arrayLocalColorTables(0), LocalColorTable(0), (3 * (2 ^ (SizeOfLocalColorTable(lc) + 1)))
        
        lngStartLocalColorTable = lngCurPosition + 1
        
        ' *****************
        ' Normal logic resumes here leave alone!!!!!!!!!!!
        
        ' Skip over length of our Local Color Table
        lngCurPosition = lngCurPosition + (3 * (2 ^ (SizeOfLocalColorTable(lc) + 1)))
    End If
    
    ' Add on length of this Image Descriptor Block
     lngCurPosition = lngCurPosition + lenImageDescriptor
    
    ' Let's jump to First Byte of Image Data
    ' This is the LZW Minimum Code Size
    'lngCurPosition = lngCurPosition + 1
    apiCopyMemory LZWMinimumCodeSize(lc), bArray(lngCurPosition), 1
    
    ' For Image Data Block there is no ZERO Block Terminator
    ' Like there is for the Control Blocks
    ' So we need to Check the first byte of the
    ' Data Block which is the Size field
    ' to find out when we are done reading
    ' Now we need to skip over Image Data Sub Blocks
    'lngCurPosition = lngCurPosition + 1
    Do While bArray(lngCurPosition + 1) <> 0
         lngCurPosition = lngCurPosition + bArray(lngCurPosition + 1)
         lngCurPosition = lngCurPosition + 1
    Loop
   
   
  ' Finally our lngCurPosition is now at end of
  ' this individual GIF Frame
  ' We'll need to add one more byte to allow for TRAILER(&H3B)
  ' that we need to place at end of the file.
  lngCurPosition = lngCurPosition + 1
  lngGifEnd = lngCurPosition
  
  ' Does user want us to change Transparent Color
  ' to a color not found in the current image.
  If ChangeTransparentColor Then


' **** START OF REPLACE DUPLICATE TRANSPARENT RGB VALUES ****

'*******************************************************************
' Let's make sure that if there is a Transparent Color it is
' not the same value as any Color in the Bitmap.

' The reason the TransparentColorIndex value works is that
' this index is ZERO based. This means even when the last palette
' index is specified as the Transparent index value we are in effect
' using this index and pointing to a position 3 bytes before the
' end of the ColorTable
      
If TransparentColorFlag(lc) Then
    lngIndexDuplicate = -1
    If LocalColorTableFlag(lc) Then
    apiCopyMemory bTransparentarray(0), LocalColorTable(TransparentColorIndex(lc) * 3), 3
    For x = 0 To (3 * (2 ^ (SizeOfLocalColorTable(lc) + 1))) - 3 Step 3
        apiCopyMemory bTemparray(0), LocalColorTable(x), 3
        ' Let's store last highest value we've seen through this loop.
        ' When done this will be the second largest value in the palette
        ' lngMaxPrevious = lngMax
        If RGB(bTemparray(0), bTemparray(1), bTemparray(2)) = RGB(bTransparentarray(0), bTransparentarray(1), bTransparentarray(2)) Then
            ' check and ensure we are bot matching up with our Transparent Index itself!!
            If (TransparentColorIndex(lc) * 3) <> x Then lngIndexDuplicate = x
        End If
    Next x
    ' We are done loop.
Else
    
    apiCopyMemory bTransparentarray(0), GlobalColorTable(TransparentColorIndex(lc) * 3), 3
    For x = 0 To (3 * (2 ^ (SizeOfGlobalColorTable + 1))) - 3 Step 3
        apiCopyMemory bTemparray(0), GlobalColorTable(x), 3
        ' Let's store last highest value we've seen through this loop.
        ' When done this will be the second largest value in the palette
        ' lngMaxPrevious = lngMax
        If RGB(bTemparray(0), bTemparray(1), bTemparray(2)) = RGB(bTransparentarray(0), bTransparentarray(1), bTransparentarray(2)) Then
        ' check and ensure we are bot matching up with our Transparent Index itself!!
            If (TransparentColorIndex(lc) * 3) <> x Then lngIndexDuplicate = x
        End If
    Next x
    ' We are done loop.
End If
    
    ' Was there a duplicate Color Value
    If lngIndexDuplicate <> -1 Then
    ' Now let's compare Transparent color to rest of color table
    ' If TransparentColorFlag(lc) Then
    ' Call our function. ByRef return on byte array we pass.
    ' lngBool = fCheckTransparent(bTemparray)
    ' Find the largest RGB value
    lngMax = 0
    If LocalColorTableFlag(lc) Then
    For x = 0 To (3 * (2 ^ (SizeOfLocalColorTable(lc) + 1))) - 3 Step 3
    apiCopyMemory bTemparray(0), LocalColorTable(x), 3
    ' Let's store last highest value we've seen through this loop.
    ' When done this will be the second largest value in the palette
        If RGB(bTemparray(0), bTemparray(1), bTemparray(2)) > lngMax Then
            lngMaxPrevious = lngMax
            lngMax = RGB(bTemparray(0), bTemparray(1), bTemparray(2))
        Else
        If RGB(bTemparray(0), bTemparray(1), bTemparray(2)) > lngMaxPrevious Then lngMaxPrevious = RGB(bTemparray(0), bTemparray(1), bTemparray(2))
        End If
    Next x
    ' We are done loop. Let's calculate a new RGB value for
    ' the Transparency Color. We'll make it halfway between the
    ' second and the largest RGB values
    lngNewTransparent = lngMax - ((lngMax - lngMaxPrevious / 2))
    ' Store this value back in the appropriate ColorTable array
    ' and the raw byte array that will be written
    ' to the disk as a temp Gif file.
    ' Write to ColorTable
    
    'TransparentColorIndex(lc) * 3)
    LocalColorTable(3 * TransparentColorIndex(lc)) = (lngNewTransparent And &HFF)
    LocalColorTable((3 * TransparentColorIndex(lc)) + 1) = (lngNewTransparent And &HFF00&) \ &H100
    LocalColorTable((3 * TransparentColorIndex(lc)) + 2) = (lngNewTransparent And &HFF0000) \ &H10000
    
    ' Write to raw byte array
    bArray(lngStartLocalColorTable + (3 * TransparentColorIndex(lc))) = (lngNewTransparent And &HFF)
    bArray(lngStartLocalColorTable + (3 * TransparentColorIndex(lc)) + 1) = (lngNewTransparent And &HFF00&) \ &H100
    bArray(lngStartLocalColorTable + (3 * TransparentColorIndex(lc)) + 2) = (lngNewTransparent And &HFF0000) \ &H10000
    
    Else
    lngMax = 0
    For x = 0 To (3 * (2 ^ (SizeOfGlobalColorTable + 1))) - 3 Step 3
        apiCopyMemory bTemparray(0), GlobalColorTable(x), 3
        ' Let's store last highest value we've seen through this loop.
        ' When done this will be the second largest value in the palette
    
        If RGB(bTemparray(0), bTemparray(1), bTemparray(2)) > lngMax Then
        lngMaxPrevious = lngMax
        lngMax = RGB(bTemparray(0), bTemparray(1), bTemparray(2))
        Else
        If RGB(bTemparray(0), bTemparray(1), bTemparray(2)) > lngMaxPrevious Then lngMaxPrevious = RGB(bTemparray(0), bTemparray(1), bTemparray(2))
        End If
    
    Next x
    ' We are done loop. Let's calculate a new RGB value for
    ' the Transparency Color. We'll make it halfway between the
    ' second and the largest RGB values
    lngNewTransparent = lngMax - ((lngMax - lngMaxPrevious / 2))
    ' Store this value back in the appropriate ColorTable array
    ' and the raw byte array that will be written
    ' to the disk as a temp Gif file.
    ' Write to ColorTable
    GlobalColorTable(3 * TransparentColorIndex(lc)) = (lngNewTransparent And &HFF)
    GlobalColorTable((3 * TransparentColorIndex(lc)) + 1) = (lngNewTransparent And &HFF00&) \ &H100
    GlobalColorTable((3 * TransparentColorIndex(lc)) + 2) = (lngNewTransparent And &HFF0000) \ &H10000
                
    ' Write to raw byte array
    bArray(lngStartGlobalColorTable + (3 * TransparentColorIndex(lc))) = (lngNewTransparent And &HFF)
    bArray(lngStartGlobalColorTable + (3 * TransparentColorIndex(lc)) + 1) = (lngNewTransparent And &HFF00&) \ &H100
    bArray(lngStartGlobalColorTable + (3 * TransparentColorIndex(lc)) + 2) = (lngNewTransparent And &HFF0000) \ &H10000
    
    End If

  End If
         
 End If
 ' **** END OF REPLACE DUPLICATE TRANSPARENT RGB VALUES ****
     
 ' If we jumped to here then the
 'ChangeTransparentColor propert was false
 End If        ' For debugging

     
    ' *******START LOOP *************
    ' Resize all of our storage arrays each time we come through
    ' this main loop.
    ' Is this the very first time through the loop?
    If blFirstTime Then
    
        ReDim mGifStart(0)
        ReDim mGifEnd(0)
        ' Set our Flag
        blFirstTime = False
    Else
        ReDim Preserve mGifStart(UBound(mGifStart) + 1)
        ReDim Preserve mGifEnd(UBound(mGifEnd) + 1)
    End If
    
    ' Debug.Print "Gif Start:" & lngGifStart
    ' Let's store the actual values we generated in this loop
    mGifStart(UBound(mGifStart)) = lngGifStart
    mGifEnd(UBound(mGifEnd)) = lngGifEnd
                                       
    ' Advance Current Position to start lookin for the NEXT GIF FRAME!
    lngCurPosition = lngCurPosition + 1
    ' Reset start of next GIF Frame
    lngGifStart = lngCurPosition
    ' WriteTemp Gif
    ' Loop and continue
    ' *******************
      
    ' Check to make sure we are not at the end of the file
    If bArray(lngCurPosition) = Trailer Then Exit Do
    'If lngCurPosition < FLength Then
         
    ' Increment our Loop Counter
    lc = lc + 1
    Loop
       
    ' *******************************************
    ' If we get here then we have should have some
    ' GIF Frame pointers in our Arrays
    
    ' Let's take the start and end offsets for our
    ' individual Gif Frames and get a StdPic object
    ' by using LoadPicture
    ' We can then use this Handle directly as a hBitmap!
    ' No kidding!<bg>
    
    ' For System Temp Folder
    ' and temp unique filename
    
    Dim strFixed  As String * Pathlen
    Dim sec As SECURITY_ATTRIBUTES
    Dim lngBytesWritten As Long
    
    ' Handle for our File
    Dim hFile As Long
    
    ' Loop Counter
    Dim GifLoop As Long
    
    ' Init loop counter
    GifLoop = 0
    
    ' Reset Index for array of Start/Stop points
    ctr1 = 0
    
    ' Init our Number of Frames prop
    ' Zero based index
    NumberofFrames = UBound(mGifStart)
    
    ' Here's the LOOP!
    For ctr1 = 0 To UBound(mGifStart)
                 
    ' Get the Systems Temp path
    ' Returns Length of path(num characters in path)
    lngRet = GetTempPath(Pathlen, strPath)
    ' Chop off NULLS and trailing "\"
    strPath = Left(strPath, lngRet) & Chr(0)
    
    ' Now need a unique Filename
    ' locked from a previous aborted attemp.
    strPathandFileName = GetUniqueFilename(strPath, Str(ctr1) & Chr(0), "GIF")
    
    ' Fill in the rest of the structure
    sec.bInheritHandle = True
    sec.lpSecurityDescriptor = 0
    sec.nLength = Len(sec)
     
    ' Create the temp file
    hFile = CreateFile(strPathandFileName, GENERIC_WRITE, 0&, sec, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0)
    
    'ctr = gifstart(ctr)
    ' Write Common Gif File Header
    ' From start of File until Start of First Gif frame
    lngRet = WriteFile(hFile, bArray(1), mGifStart(0) - 1, lngBytesWritten, 0)
    ' Write out entire GIf Frame
    ' This will start at our stored start point.
    ' The length will be our stored ending point minus
    ' the starting point. Think about it!<bg>
    lngRet = WriteFile(hFile, bArray(mGifStart(ctr1)), mGifEnd(ctr1) - mGifStart(ctr1), lngBytesWritten, 0)
    ' Write Block Terminator - ZERO
    lngRet = WriteFile(hFile, 0, 1, lngBytesWritten, 0)
    
    ' Write DUMMY Control Block
    ' Some programs depend on seeing the next Control Block to
    ' know the previous data block is done!!!!
    lngRet = WriteFile(hFile, &HF921, 2, lngBytesWritten, 0)
    
    ' Write the Trailer Block
    lngRet = WriteFile(hFile, Trailer, 1, lngBytesWritten, 0)
    'Debug.Print "ctr:" & ctr & "Start:" & mGifStart(ctr) & " :" & strPathandFileName
    ' Close the Temp GIF file
    CloseHandle (hFile)
    
    
    ' Need as many StdPicture objects as there are Gif Frames
    ' hStdPicture is declared at the module level.
    ReDim Preserve hStdPicture(ctr1)
    ' Load in the Frame we just saved to disk.
    Set hStdPicture(ctr1) = LoadPicture(strPathandFileName)
    
    ' DELETE the TEMP GIF FILE
     Kill strPathandFileName
    
    ' Loop and create next Frame until done
    Next

 
    ' ** All done splitting Gif into its constituent frames **
    
    ' Now we need to Create a Bitmap
    ' matching the properties of this Animated Gif
    ' and the Device Context used to display the file.
    fCreateBitMap
 
 
exit_Gif:
    ' All Done
    Exit Function
 
err_NoGif:
    ' File is not an Animated Gif
    MsgBox "Sorry, not an Animated Gif file", vbOKOnly, "Not a Valid Animated Gif File!"
    ' Clear FileName Prop
    strGifFileName = ""
  End Function
 
 
 
    Public Sub RenderGif(ctr As Long)
    ' Function to render the individual Gif Frames.
    ' They are stored as an array of Standard Picture
    ' objects declared at the module level.
    
    ' Have to find a better method to see if
    ' the array is empty or not
    On Error Resume Next
    Dim varTemp As Long
    varTemp = hStdPicture(0)
    If varTemp < 1 Then Exit Sub
    
    
    ' Get and Create our Device Context handles
    hDCApp = UserControl.hdc 'Form1.Picture1.hDC 'apiGetDC(Form1.hwnd) '0) 'Forms!frmImage.hwnd) 'Application.hWndAccessApp)
    ' Changed line above May 17/2000
    ' trying to fix nonTransparent Background in Win95
    ' Will need to copy hDCTemp's contents into this DC
    'hDCApp = apiCreateCompatibleDC(UserControl.hdc) 'Form1.Picture1.hDC) 'hDCApp)
    
    
    hDCtemp = apiCreateCompatibleDC(UserControl.hdc) 'Form1.Picture1.hDC) 'hDCApp)
    
    ' See if user want to STOP
    If StopRender Then Exit Sub
    
    ' Get the Original Images Width and Height props
    lngRet = apiGetObject(hStdPicture(ctr), Len(bm), bm)
    
    ' Select our Image into its DC
    hBmpOrig = apiSelectObject(hDCtemp, hStdPicture(ctr))
    
    ' ** Trying to fix problem with non transparent
    ' backgroudn in Win95
    
    
    
    ' Check Transparent Color Flag
    ' Clear out our temp byte array
    Erase bTemparray

 
    If TransparentColorFlag(ctr) Then
        If LocalColorTableFlag(ctr) Then
        apiCopyMemory bTemparray(0), LocalColorTable(TransparentColorIndex(ctr) * 3), 3
        Else
        apiCopyMemory bTemparray(0), GlobalColorTable((TransparentColorIndex(ctr) * 3)), 3
        End If
    Else
        ' Grab Background Color
        If GlobalColorTableFlag Then
        apiCopyMemory bTemparray(0), GlobalColorTable((BackgroundColorIndex * 3)), 3
        End If
    End If
 
    ' Set a Rectangle equal to the size of this Gif Frame
    rc.Bottom = ImageHeight(ctr) 'bm.bmHeight 'ImageHeight(lc) 'bm.bmHeight
    rc.Right = ImageWidth(ctr) 'bm.bmWidth ' (lc) 'bm.bmWidth
    rc.Top = ImageTop(ctr)
    rc.Left = ImageLeft(ctr)
    
    ' OK What do we do after we rendered that last Frame.
    ' The Gif file specification dicates if we have to
    ' do anything on screen before we render the
    ' next frame of the Animation.
    
    Select Case DisposalMethod(ctr)
    
    Case 0, 1
    ' do nothing
    
    Case 2
    ' Clear Bitmap to current Background Color
    ' Needs to copy BACKGROUND COLOR directly
    ' because btemparray could be holding Transparent color
    ' Not used here as we use BackColor property.
    'apiCopyMemory bBGarray(0), GlobalColorTable((BackgroundColorIndex * 3)), 3
    
    ' Make sure we can handle System Colors
    lngTemp = ConvertSystemColor(BackColor)
    hBrush = apiCreateSolidBrush(lngTemp)
    hOrigBrush = apiSelectObject(hDCbuffer, hBrush)
    
    Dim rcTemp As RECTL
    rcTemp.Right = bmap.bmWidth
    rcTemp.Bottom = bmap.bmHeight
    ' Fill the Bitmap with the Control's Background COlor
    lngRet = apiFillRect(hDCbuffer, rcTemp, hBrush)
    hBrush = apiSelectObject(hDCbuffer, hOrigBrush)
    lngRet = apiDeleteObject(hBrush)
           
    Case 3
    ' Restore previous frame. Need to add a temp
    ' Bitmap and DC to store the last completed
    ' Frame of Animation. Not done yet.
    
    Case Else
    ' Should never happen.
    
    End Select
    
    
    ' Is this to be a Transparent Color Blit?
    If TransparentColorFlag(ctr) Then
        TransBlt hDCbuffer, hDCtemp, rc, 0 + rc.Left, 0 + rc.Top, RGB(bTemparray(0), bTemparray(1), bTemparray(2))
    Else
        ' Not Transparent. Copy the whole Frame as is!
        lngRet = apiBitBlt(hDCbuffer, rc.Left, rc.Top, rc.Right, rc.Bottom, hDCtemp, 0, 0, SRCCOPY)
    
        ' Copy the copy<bg> to our onscreen Device Context.
        ' This will be the hDC to a UserControl or PictureBox
        lngRet = apiBitBlt(hdc, 0, 0, bmap.bmWidth, bmap.bmHeight, _
            hDCbuffer, 0, 0, SRCCOPY)
    End If
    
    ' Cleanup
    ' ReSelect the original Bitmap back into its DC
    lngRet = apiSelectObject(hDCtemp, hBmpOrig)
    
    ' Release as soon as we are done with the DC
    lngRet = apiReleaseDC(0&, hDCApp)
   ' Changed May 16. Trying tot fix Win95 display Bug
   ' no transparent background
    'lngRet = apiDeleteDC(hDCApp)
    
    lngRet = apiDeleteDC(hDCtemp)
    'lngRet = apiDeleteDC(hDCbuffer)
    End Sub
 
         
    Private Sub CleanUp()
    ' ***********  CLEANUP ******************
    ' StdPic objects are set to nothing in Class Terminate
    ' But we'll do it here for now for debugging
    ' Also need to consider Looping and the fact that
    ' the Class Terminate is only called when the FOrm exits
    ' we need to delete any StdPic objects whenever a new
    ' GIF is loaded for display
    ' Reset handles to StdPic objects
    On Error Resume Next
    Dim varTemp As Long
    varTemp = hStdPicture(0)
    If varTemp > 1 Then
        For x = 0 To UBound(hStdPicture) '- 1
            Set hStdPicture(x) = Nothing
        Next
    End If
    
    
    Erase PackedFields()
    Erase ImageLeft()
    Erase ImageTop()
    Erase ImageWidth()
    Erase ImageHeight()
    Erase LSortFlag()
    Erase LocalColorTableFlag()
    Erase InterLaceFlag()
    Erase SizeOfLocalColorTable()
    
    Erase LZWMinimumCodeSize()
    Erase DelayTime()
    Erase TransparentColorIndex()
    Erase DisposalMethod()
    Erase UserInputFlag()
    Erase TransparentColorFlag()
    ' Have to add full support for Local Color Tables
    'Erase arrayLocalColorTables()
    
    ' Reset Current Frame number
    CurrentFrame = 0
        
    End Sub
    
    
    Private Sub TransBlt(DestinationDC As Long, _
     SourceDC As Long, SourceRectangle As RECTL, _
    DestX As Integer, DestY As Integer, TransColor As Long)
    ' The all important Transparent Blit!
    ' Adapted from logic for Transparent Blits
    ' suggested by John John Hornick of
    ' Microsoft Developer Support.
    ' His logic only required 4 Blits but unfortunately
    ' I couldn't do it in only 4 because of 2 issues.
    ' 1) Had to Copy StdPicture to Temp Bitmap.
    ' 2) Required a seperate Blit to accomodate Animated Gif's
    ' Image Left and Image Top properties.
    
    ' If you place a series of PictureBox controls
    ' named picture1 through picture5 you can uncomment
    ' the code below to display the individual steps
    ' of this Transparent Blit function.
    
    ' Source: The current StdPicture selected into Memory DC
    ' Destination: Another Memory DC so we can avoid any Flickering
    ' because of Screen redraw issues.
          
   ' temp var for DC's current BackColor
    Dim OrigBackColor As Long
    ' Width of Bitmap
    Dim intWidth As Integer
    ' Height of Bitmap
    Dim intHeight As Integer
    
    ' Temp Bitmaps
    Dim hBitmapMaskMono As Long
    Dim hBitmapResultDestination As Long
    Dim hBitmapResultSource As Long
    Dim hBitmapOrigMask As Long
    Dim hBitmapPreviousSource As Long
    Dim hBitmapPreviousDestination As Long
    
    ' Temp Device Contexts
    Dim hDCMaskMono As Long
    Dim hDCResult As Long
    Dim hDCResultSource As Long
    
    ' Bitmap dimensions
    intWidth = SourceRectangle.Right
    intHeight = SourceRectangle.Bottom
     
    'Temp DC's for our Bitmap Masks
    hDCResult = apiCreateCompatibleDC(DestinationDC)
    hDCResultSource = apiCreateCompatibleDC(DestinationDC)
    hDCMaskMono = apiCreateCompatibleDC(DestinationDC)
        
    ' Temp Bitmaps for our Monochrome Mask
    hBitmapMaskMono = CreateBitmap(intWidth, intHeight, 1, 1, ByVal 0&)
    
    ' Create our Temp Bitmaps
    hBitmapResultDestination = apiCreateCompatibleBitmap(DestinationDC, intWidth, intHeight)
    hBitmapResultSource = apiCreateCompatibleBitmap(DestinationDC, intWidth, intHeight)
    
    ' Select Temp Bitmap Masks into Temp DC's
    hBitmapOrigMask = apiSelectObject(hDCMaskMono, hBitmapMaskMono)
    hBitmapPreviousDestination = apiSelectObject(hDCResult, hBitmapResultDestination)
    hBitmapPreviousSource = apiSelectObject(hDCResultSource, hBitmapResultSource)
           
    ' Will need to copy our StdPicture's contents into
    ' Temporary DC. This is due to a bug in the Win9x OS.
    ' See the MS KB Article ID: Q149585
    ' http://support.microsoft.com/support/kb/articles/Q149/5/85.asp
    lngRet = apiBitBlt(hDCResult, 0, 0, intWidth, intHeight, _
             SourceDC, 0, 0, SRCCOPY)
     
    ' I wasn't able to use the Destination DC directly and
    ' accomodate the Animated Gif Image Top & Left props.
    ' So I've used yet another Temp DC. :-(
    lngRet = apiBitBlt(hDCResultSource, 0, 0, intWidth, intHeight, _
             DestinationDC, DestX, DestY, SRCCOPY)
    
    ' Create a monochrome mask from the Source Image.
    ' We do this by Setting the Background Color of
    ' the Source DC to the color we want Transparent.
    OrigBackColor = apiSetBkColor(hDCResult, TransColor)
    
    ' Perform the Blit
    lngRet = apiBitBlt(hDCMaskMono, 0, 0, intWidth, intHeight, _
            hDCResult, 0, 0, SRCCOPY)
           
    ' Reset Original BackGround Color
    TransColor = apiSetBkColor(hDCResult, OrigBackColor)
    
    '*****************************
     'lngRet = apiBitBlt(UserControl.Parent.picture1.hdc, 0, 0, _
     'intWidth, intHeight, hDCMaskMono, 0, 0, SRCCOPY)
    '**************************
        
    ' Now Blit Source Invert from Source Image to outputDC
    lngRet = apiBitBlt(hDCResultSource, 0, 0, intWidth, intHeight, _
             hDCResult, 0, 0, SRCINVERT)
    
    '*****************************
     'lngRet = apiBitBlt(UserControl.Parent.picture2.hdc, 0, 0, _
     'intWidth, intHeight, hDCResultSource, 0, 0, SRCCOPY)
    '**************************
    
    ' SRCAND from the mask image to the outputDC
    lngRet = apiBitBlt(hDCResultSource, 0, 0, intWidth, intHeight, _
             hDCMaskMono, 0, 0, SRCAND)
    
    '*****************************
     'lngRet = apiBitBlt(UserControl.Parent.picture3.hdc, 0, 0, _
     'intWidth, intHeight, hDCResultSource, 0, 0, SRCCOPY)
    '**************************
    
    ' INVERt from the source Image to the outputDC
    lngRet = apiBitBlt(hDCResultSource, 0, 0, intWidth, intHeight, _
             hDCResult, 0, 0, SRCINVERT)
                 
    '*****************************
     'lngRet = apiBitBlt(UserControl.Parent.picture4.hdc, 0, 0, _
     'intWidth, intHeight, hDCResultSource, 0, 0, SRCCOPY)
    '**************************
                                  
    ' Intermediate Copy to accomodate DestX & DestY
    lngRet = apiBitBlt(DestinationDC, DestX, DestY, bmap.bmWidth, bmap.bmHeight, _
              hDCResultSource, 0, 0, SRCCOPY)
                                          
    'Copy from Memory DC to PictureBox or UserControl DC
    lngRet = apiBitBlt(hdc, 0, 0, bmap.bmWidth, bmap.bmHeight, _
              DestinationDC, 0, 0, SRCCOPY)
                           
    '*****************************
     'lngRet = apiBitBlt(UserControl.Parent.picture5.hdc, 0, 0, _
     'bmap.bmWidth, bmap.bmHeight, DestinationDC, 0, 0, SRCCOPY)
    '**************************
                        
    ' Now comes the fun part..we get to cleanup!
    ' Select all of the original Bitmaps back into
    ' the Temp DC's.
    hBitmapMaskMono = apiSelectObject(hDCMaskMono, hBitmapOrigMask)
    hBitmapResultDestination = apiSelectObject(hDCResult, hBitmapPreviousDestination)
    hBitmapResultSource = apiSelectObject(hDCResultSource, hBitmapPreviousSource)
    
    ' Now delete all of our Temp Bitmaps
    apiDeleteObject hBitmapMaskMono
    apiDeleteObject hBitmapResultDestination
    apiDeleteObject hBitmapResultSource
    
    ' Finally delete all of the Temp DC's
    apiDeleteDC hDCMaskMono
    apiDeleteDC hDCResult
    apiDeleteDC hDCResultSource
    
    ' All done!
    End Sub
         
              
     Public Function fGetGifFileName() As String
     ' Function to call API File Dialog
     
     Dim StrTemp As String
     
     ' Fill in the structure
     
Dim resbytes() As Byte
resbytes = LoadResData(102, "CUSTOM")
Open App.Path & "\res.gif" For Binary As #1
    Put #1, , resbytes
Close #1
    
     ' See if user clicked Cancel or even selected
     ' the very same file already selected
     StrTemp = App.Path & "\res.gif"
     If StrTemp <> strGifFileName Then
     strGifFileName = App.Path & "\res.gif"
     Else
     ' Add error handling
     End If
     End Function
     
         
    Private Function ConvertSystemColor(lngColor As Long) As Long
    ' Function to make sure we handle System Colors
    
    'Dim lngColor As Long
    Dim RGBRed As Long, RGBGreen As Long, RGBBlue As Long
     
    ' Set to Access Form Background Color
    'lngColor = -2147483633
     
    ' Check and see if MSB is set in High byte
    If lngColor And &H80000000 Then
        ' Strip off any bits set in High Byte
        ' GetSysColor function retrieves the current color of
        ' the specified display element. In this case it is the
        ' value of 15 -> vbButtonFace    0x8000000F
        lngColor = GetSysColor(lngColor And &HFFFFFF)
    End If
     
    ' Generate individual RGB values.
    RGBRed = lngColor And &HFF
    RGBGreen = (lngColor \ &H100&) And &HFF
    RGBBlue = (lngColor \ &H10000) And &HFF
    
    Dim temphDC As Long
    temphDC = apiGetDC(0&)
    ConvertSystemColor = GetNearestColor(temphDC, lngColor)
    apiReleaseDC 0&, temphDC
    
    'ConvertSystemColor = GetNearestColor(hDC, lngColor)
    ' The result = R(192),G(192),B(192)
    ' That's our favourite plain old Access GREY!
    End Function
 
 
    
    ''WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
    ''MemberInfo=8,0,0,0
    Public Property Get hdc() As Long
    hdc = m_hDC
    End Property
    '
    Public Property Let hdc(ByVal New_hDC As Long)
    
    m_hDC = New_hDC
    PropertyChanged "hDC"
    End Property
    
    
    Private Sub Timer1_Timer()
    ' Here is the actual code called
    ' on the Timer Interval to render
    ' the current Frame of Animation.
    
    ' Has user asked us to Stop Rendering?
    If StopRender Then Exit Sub
    
    ' Draw the current frame
    PaintGif CurrentFrame
    ' Increment CurrentFrame prop for next time here
    CurrentFrame = CurrentFrame + 1
    
    ' Boundary Checking
    If CurrentFrame > NumberofFrames Then CurrentFrame = 0
    
    ' Setup Frame delay
    ' Add in UserDefined Delay
    If DelayTime(CurrentFrame) < 500 Then
     Timer1.Interval = (DelayTime(CurrentFrame) * 10) + mUserDelay
    Else
    Timer1.Interval = 100 + mUserDelay
    End If
    
    End Sub


    Private Sub UserControl_Initialize()
    ' Here we should Initialize any
    ' Module level variables for this control
    
    ' See KB Article ID: Q223152
    InitCommonControls
               
    ' Create instance of MS Common Dialog CLass
               
    ' Change Transparent Color to
    ' a color value not found in the current Image.
    ' A surprising nunber of GIf's do this.
    ' WHile it is understandable from a Bitplane perspective
    ' it does seem to be against accepted standards.
    mChangeTransparentColor = True
              
    ' Set Flag - No Rendering because
    ' we have not loaded a Gif file yet
    mStopRender = True
                           
    ' Device Context For CreateBitmap
    ' This is released in Class_Terminate
    If hDCbuffer = 0 Then
        hDCbuffer = apiCreateCompatibleDC(UserControl.hdc)
    End If
          
    ' DC we will actually use on Screen
    hdc = UserControl.hdc ' or use a PictureBox's hDC
    'MsgBox "Initialize"
    End Sub
    
    'Initialize Properties for User Control
    Private Sub UserControl_InitProperties()
    ' Here we set persisted properties to their
    ' initial values, NOT their default values.
    ' Default values are assigned during
    ' the ReadProperties event.
    m_strGifFileName = m_def_strGifFileName
    
    ' MsgBox "InitProperties"
    End Sub
    
    'Load property values from storage
    Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    
    UserControl.BackColor = PropBag.ReadProperty("BackColor", &H8000000F)
    Set Picture = PropBag.ReadProperty("Picture", Nothing)
    UserControl.MaskColor = PropBag.ReadProperty("MaskColor", -2147483633)
    Set MaskPicture = PropBag.ReadProperty("MaskPicture", Nothing)
    UserControl.BorderStyle = PropBag.ReadProperty("BorderStyle", 0)
      
    m_strGifFileName = PropBag.ReadProperty("strGifFileName", m_def_strGifFileName)
    ' Let's see if this is a valid file
    If (Len(Dir(m_strGifFileName)) > 0) Then
        ' Set our Flag so we will load and draw
        ' this Animated Gif when the Control
        ' is sited for the first time on the Form.
        DisplaySavedGifFileName = True
    End If
    End Sub
    
    
    Private Sub UserControl_Terminate()
    ' Cleanup!
    Dim x As Long
    
    ' Reset handles to StdPic objects
    ' Check and see if array is empty
    On Error Resume Next
    Dim varTemp As Long
    varTemp = hStdPicture(0)
    If varTemp > 1 Then
        For x = 0 To UBound(hStdPicture) '- 1
        Set hStdPicture(x) = Nothing
        Next
    End If
    
    ' Delete out any DC's created
    ' when this class was initialized.
    ' Select out new Bitmap and select
    ' in original Bitmap.
    
    If hBMap > 0 Then
        hBMap = apiSelectObject(hDCbuffer, hBmpOrig)
        lngRet = apiDeleteDC(hDCbuffer)
        lngRet = apiDeleteObject(hBMap)
    End If
    
    ' Let go of PictureBox object
    Set mImageCtl = Nothing
    ' MsgBox "OK terminated everything!!"
    
    ' Release reference to MS Common Dialog Class
 
    End Sub
    
    'Write property values to storage
    Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    
    Call PropBag.WriteProperty("BackColor", UserControl.BackColor, &H8000000F)
    Call PropBag.WriteProperty("Picture", Picture, Nothing)
    Call PropBag.WriteProperty("MaskColor", UserControl.MaskColor, -2147483633)
    Call PropBag.WriteProperty("MaskPicture", MaskPicture, Nothing)
    Call PropBag.WriteProperty("BorderStyle", UserControl.BorderStyle, 0)
    Call PropBag.WriteProperty("strGifFileName", m_strGifFileName, m_def_strGifFileName)
    End Sub
    
    'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
    'MappingInfo=UserControl,UserControl,-1,BackColor
    Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Returns/sets the background color used to display text and graphics in an object."
    BackColor = UserControl.BackColor
    End Property
    
    Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
    UserControl.BackColor() = New_BackColor
    PropertyChanged "BackColor"
    End Property
        
    
    'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
    'MappingInfo=UserControl,UserControl,-1,Picture
    Public Property Get Picture() As Picture
Attribute Picture.VB_Description = "Returns/sets a graphic to be displayed in a control."
      Set Picture = UserControl.Picture
    End Property
    
    Public Property Set Picture(ByVal New_Picture As Picture)
      Set UserControl.Picture = New_Picture
      PropertyChanged "Picture"
    End Property
    
    'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
    'MappingInfo=UserControl,UserControl,-1,MaskColor
    Public Property Get MaskColor() As Long
Attribute MaskColor.VB_Description = "Returns/sets the color that specifies transparent areas in the MaskPicture."
      MaskColor = UserControl.MaskColor
    End Property
    
    Public Property Let MaskColor(ByVal New_MaskColor As Long)
      UserControl.MaskColor() = New_MaskColor
      PropertyChanged "MaskColor"
    End Property
    
    'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
    'MappingInfo=UserControl,UserControl,-1,MaskPicture
    Public Property Get MaskPicture() As Picture
Attribute MaskPicture.VB_Description = "Returns/sets the picture that specifies the clickable/drawable area of the control when BackStyle is 0 (transparent)."
      Set MaskPicture = UserControl.MaskPicture
    End Property
    
    Public Property Set MaskPicture(ByVal New_MaskPicture As Picture)
      Set UserControl.MaskPicture = New_MaskPicture
      PropertyChanged "MaskPicture"
    End Property
    
    'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
    'MappingInfo=UserControl,UserControl,-1,BorderStyle
    Public Property Get BorderStyle() As Integer
Attribute BorderStyle.VB_Description = "Returns/sets the border style for an object."
      BorderStyle = UserControl.BorderStyle
    End Property
    
    Public Property Let BorderStyle(ByVal New_BorderStyle As Integer)
      UserControl.BorderStyle() = New_BorderStyle
      PropertyChanged "BorderStyle"
    End Property
    
    'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
    'MappingInfo=UserControl,UserControl,-1,Refresh
    Public Sub Refresh()
Attribute Refresh.VB_Description = "Forces a complete repaint of a object."
      UserControl.Refresh
    End Sub
    
    Private Sub UserControl_Resize()
      RaiseEvent Resize
    End Sub
    
    Private Sub UserControl_Paint()
      'RaiseEvent Paint
    ' If user selected Cancel then exit
    If Len(strGifFileName & vbNullString) < 1 Then Exit Sub
         
    If DisplaySavedGifFileName Then
      m_DisplaySavedGifFileName = False
      LoadGif False
    Else
    PaintGif 0
    
    End If
    End Sub
    
    'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
    'MemberInfo=5
    Public Sub StopGif()
    ' User wants us to stop rendering Gif
     StopRender = True
    StopTimer
    'DoEvents
    End Sub
    
    'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
    'MemberInfo=14
    Public Function LoadGif(getFname As Boolean) As Variant
    ' Logic to load Animated Gif file.
    
    ' First STOP rendering current Animated Gif.
    StopGif
    
    ' Clear the COntrol to Background Color
    Call ClearControl
    ' Reinit all of the variables.
    Call CleanUp
    
    ' Do we display File Dialog?
    If getFname Then
        strGifFileName = ""
        Call fGetGifFileName
        ' allow time for screen to repaint after
        ' File Dialog Window closes.
        DoEvents
    End If
    
    ' It may take a few seconds to render certain
    ' Animated Gif's that have a large number of Frames.
    ' Let's change the Cursor into an Hourglass
    ' during this process.
    ' We have to Capture the Mouse in case it is
    ' not over our UserControl after
    ' the user click on OK for the File Dialog.
    SetCapture UserControl.hwnd
    
    ' Set the MousePointer to "HOURGLASS"
    UserControl.MousePointer = vbHourglass
    
    ' Function to seperate GIf into individual Frames.
    ' Creates an array of StdPicture objects representing
    ' each individual frame of the animation.
    Call fGifBreakOutFrames
    '
    
    ' Set the MousePointer back to Default
    UserControl.MousePointer = vbDefault
    
    ' Let go of the Mouse Input
    ReleaseCapture
    
    ' If user selected Cancel then exit
    If Len(strGifFileName & vbNullString) < 1 Then Exit Function
        
    ' I didn't have much luck working with the
    ' Palette props. I really spent a lot of time
    ' trying all of the angles. Leave as is for now.
    ' Seems OK as long as your Display is set to 16 or 24/32 bit mode.
    ' Set Palette property to out first Frame
    'UserControl.Palette = LoadPicture(hStdPicture(0))
         
    ' Reset UserDelay prop.
    UserDelay = 0
    
    ' Paint the First Frame Only!
    PaintGif 0
    
    ' All done!
    End Function
    
    
    'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
    'MemberInfo=13,0,0,0
    Public Property Get strGifFileName() As String
Attribute strGifFileName.VB_ProcData.VB_Invoke_Property = "PropPage1"
      strGifFileName = m_strGifFileName
    End Property
    
    Public Property Let strGifFileName(ByVal New_strGifFileName As String)
    m_strGifFileName = New_strGifFileName
      PropertyChanged "strGifFileName"
    End Property
    
    Public Function PaintGif(curframe As Long)
    ' Is there a valid FileName
    If Len(strGifFileName & vbNullString) < 1 Then
      MsgBox "Sorry, you must first select an Animated Gif file to Load"
      Exit Function
    End If
    ' OK Clear Flag..OK to Render
    StopRender = False
    ' Let's draw this Frame
    RenderGif curframe
          
    End Function
    
    
    Public Sub StartTimer()
    ' Check and make sure a Animated Gif
    ' file has been loaded and processed.
    If Len(strGifFileName & vbNullString) < 1 Then
      MsgBox "Sorry, you must first select an Animated Gif file to Load"
      Exit Sub
    End If
    
    ' OK Clear Flag..OK to Render
    StopRender = False
    ' Set Interval to start first frame.
    ' The Interval prop is changed to reflect the
    ' Delay specified to render each Frame.
    ' I just picked 250 to start the process.
    Timer1.Interval = 250
    
    End Sub
    
    
    Public Sub StopTimer()
    ' Stop Rendering
    StopRender = True
    Timer1.Interval = 0
    
    End Sub
 
   
