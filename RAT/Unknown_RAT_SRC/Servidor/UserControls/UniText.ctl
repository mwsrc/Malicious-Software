VERSION 5.00
Begin VB.UserControl UniText 
   BackColor       =   &H80000005&
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   DataBindingBehavior=   1  'vbSimpleBound
   EditAtDesignTime=   -1  'True
   ForeColor       =   &H80000008&
   ScaleHeight     =   240
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   320
End
Attribute VB_Name = "UniText"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'*************************************************************************************************
'* UniText 0.9.9.3 - Unicode textbox user control
'* ----------------------------------------------
'* By Vesa Piittinen aka Merri, http://vesa.piittinen.name/ <vesa@piittinen.name>
'* Unicode on 2000/XP/Vista
'*
'* LICENSE
'* -------
'* http://creativecommons.org/licenses/by-sa/1.0/fi/deed.en
'*
'* Terms: 1) If you make your own version, share using this same license.
'*        2) When used in a program, mention my name in the program's credits.
'*        3) May not be used as a part of commercial (unicode) controls suite.
'*        4) Free for any other commercial and non-commercial usage.
'*        5) Use at your own risk. No support guaranteed.
'*
'* SUPPORT FOR UNICONTROLS
'* -----------------------
'* http://www.vbforums.com/showthread.php?t=500026
'* http://www.planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeId=69738&lngWId=1
'*
'* REQUIREMENTS
'* ------------
'* Note: TLBs are compiled to your program so you don't need to distribute the files
'* - OleGuids3.tlb      = Ole Guid and interface definitions 3.0
'* - UniTextModule.bas
'*
'* HOW TO ADD TO YOUR PROGRAM
'* --------------------------
'* 1) OPTIONAL: Copy OleGuids3.tlb to Windows system folder.
'* 2) Copy UniTextModule.bas, UniText.ctl and UniText.ctx to your project folder.
'* 3) In your project, add a reference to OleGuids3.tlb (Project > References...)
'* 4) Add UniTextModule.bas
'* 5) Add UniText.ctl
'*
'* VERSION HISTORY
'* ---------------
'* Version 0.9.9.3 RELEASE CANDIDATE 3 (2008-06-14)
'* - Added Appearance, FileCodepage, ScrollHorizontal and ScrollVertical.
'* - Support for Unicode paths and filenames.
'* - Fix: bug in saving UTF-32 with surrogate conversion.
'* - Fix: remember BOM information when saving a file.
'* - Fix: Scroll event.
'* - Fix: Text is now saved as a byte array (StrConv caused errors).
'*
'* Version 0.9.9.2 RELEASE CANDIDATE 2 (2008-06-10)
'* - Added BOM, CanUndo, ClearUndo, LoadFile, Modified and Undo.
'* - Support for loading and saving UTF-7, UTF-8, UTF-16 and UTF-32 (both little endian and big endian).
'* - Fix: KeyPress event with the Escape key.
'*
'* Version 0.9.9 RELEASE CANDIDATE 1 (2008-06-09)
'* - Added data binding, Enabled, font properties, ForeColor, Length and MouseWheel event.
'* - Categorized properties.
'* - Optimized speed: PropertyChanged is very slow and unnecessary in run time.
'*
'* Version 0.9.8 BETA (2008-06-08)
'* - Full rewrite abandoning complex and resource eating hooking.
'*
'* CREDITS
'* -------
'* - Mike Gainer, Matt Curland and Bill Storage for their work on IOLEInPlaceActivate
'* - Paul Caton and LaVolpe for their work on SelfSub, SelfHook and SelfCallback
'*************************************************************************************************
Option Explicit

' these strings hold byte-order marks used in Unicode files
Private UTF32BE As String * 2, UTF32LE As String * 2, UTF16BE As String * 1, UTF16LE As String * 1
Private UTF8 As String * 3, UTF8save As String
Private UTF7 As String * 2, UTF7save As String

Public Event Change()
Public Event Click(Button As UniTextMouseButton)
Public Event ContextMenu(Cancel As Boolean)
Public Event DblClick(Button As UniTextMouseButton)
Public Event FontChanged()
Public Event KeyDown(KeyCode As Integer, ByVal Shift As UniTextShift)
Public Event KeyPress(KeyAscii As Integer)
Public Event KeyUp(KeyCode As Integer, ByVal Shift As UniTextShift)
Public Event MouseDown(Button As UniTextMouseButton, ByVal Shift As UniTextShift, X As Single, Y As Single)
Public Event MouseEnter()
Public Event MouseLeave()
Public Event MouseMove(Button As UniTextMouseButton, ByVal Shift As UniTextShift, X As Single, Y As Single)
Public Event MouseUp(Button As UniTextMouseButton, ByVal Shift As UniTextShift, X As Single, Y As Single)
Public Event MouseWheel(ByVal Wheel As UniTextMouseWheel, ByVal Shift As UniTextShift)
'Public Event OLECompleteDrag(Effect As Long)
'Public Event OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
'Public Event OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
'Public Event OLEGiveFeedback(Effect As Long, DefaultCursors As Boolean)
'Public Event OLESetData(Data As DataObject, DataFormat As Integer)
'Public Event OLEStartDrag(Data As DataObject, AllowedEffects As Long)
Public Event Scroll(ByVal Direction As UniTextScrollDirection)
'Public Event SelectionChange()
Public Event Update()

Private Type NMHDR
    hwndFrom As Long
    idfrom As Long
    code As Long
End Type

Private Type MSGFILTER
    NMHDR As NMHDR
    MSG As Long
    wParam As Long
    lParam As Long
End Type

Private Enum TRACKMOUSEEVENT_FLAGS
    TME_HOVER = &H1&
    TME_LEAVE = &H2&
    TME_QUERY = &H40000000
    TME_CANCEL = &H80000000
End Enum

Public Enum UniTextAppearance
    [Classic 3D]
    [Windows 3D]
End Enum

Public Enum UniTextAutoBOM
    [No autodetect] = 0
    [Autodetect for UTF8] = 1
End Enum

Public Enum UniTextBOM
    [No BOM / ANSI] = 0
    [No BOM / UTF-8] = 1
    [UTF-16 big endian] = 1201
    [UTF-16 little endian] = 1200
    [UTF-32 big endian] = 12001
    [UTF-32 little endian] = 12000
    [UTF-7 BOM] = 65000
    [UTF-8 BOM] = 65001
End Enum

Public Enum UniTextBorderStyle
    [No Border] = 0&
    [Flat3D] = 1&
    [3D] = 2&
End Enum

' http://www.microsoft.com/globaldev/reference/cphome.mspx
' http://web.archive.org/web/20040225223721/http://www.sharmahd.com/tm/codepages.html
Public Enum UniTextFileCodepage
    [System Codepage] = 0
    ' ISO 8859 Character Sets
    [ISO-8859-1: Latin 1] = 28591
    [ISO-8859-2: Latin 2] = 28592
    [ISO-8859-3: Latin 3] = 28593
    [ISO-8859-4: Baltic] = 28594
    [ISO-8859-5: Cyrillic] = 28595
    [ISO-8859-6: Arabic] = 28596
    [ISO-8859-7: Greek] = 28597
    [ISO-8859-8: Hebrew] = 28598
    [ISO-8859-9: Turkish] = 28599
    [ISO-8859-15: Latin 9] = 28605
    ' Windows XP
    [GB 18030: Chinese National Standard] = 54936
    ' Windows Double Byte Character Sets
    [CP932 DBCS: Japanese Shift-JIS] = 932
    [CP936 DBCS: Simplified Chinese GBK] = 936
    [CP949 DBCS: Korean] = 949
    [CP950 DBCS: Traditional Chinese Big5] = 950
    ' Windows Single Byte Character Sets
    [CP1250 SBCS: Central Europe] = 1250
    [CP1251 SBCS: Cyrillic] = 1251
    [CP1252 SBCS: Latin I] = 1252
    [CP1253 SBCS: Greek] = 1253
    [CP1254 SBCS: Turkish] = 1254
    [CP1255 SBCS: Hebrew] = 1255
    [CP1256 SBCS: Arabic] = 1256
    [CP1257 SBCS: Baltic] = 1257
    [CP1258 SBCS: Vietnam] = 1258
    [CP874 SBCS: Thai] = 874
    ' Windows OEM Code Pages
    [CP437 OEM: US] = 437
    [CP720 OEM: Arabic] = 720
    [CP737 OEM: Greek] = 737
    [CP775 OEM: Baltic] = 775
    [CP850 OEM: Multilingual Latin I] = 850
    [CP852 OEM: Latin II] = 852
    [CP855 OEM: Cyrillic] = 855
    [CP857 OEM: Turkish] = 857
    [CP858 OEM: Multilingual Latin I + Euro] = 858
    [CP862 OEM: Hebrew] = 862
    [CP866 OEM: Russian] = 866
    ' Macintosh
    [CP10000 Mac: Roman] = 10000
    [CP10001 Mac: Japanese] = 10001
    [CP10004 Mac: Arabic] = 10004
    [CP10006 Mac: Greek] = 10006
    [CP10007 Mac: Cyrillic] = 10007
    [CP10029 Mac: Central Europe] = 10029
    [CP10081 Mac: Turkish] = 10081
    ' Windows 95
    [CP1361 Win95: Korean Johab] = 1361
End Enum

' Mouse button constants
Public Enum UniTextMouseButton
    [No Button] = 0
    [Left Button] = vbLeftButton
    [Right Button] = vbRightButton
    [Left And Right Button] = vbLeftButton Or vbRightButton
    [Middle Button] = vbMiddleButton
    [Left And Middle Button] = vbLeftButton Or vbMiddleButton
    [Right And Middle Button] = vbRightButton Or vbMiddleButton
    [All Buttons] = vbLeftButton Or vbRightButton Or vbMiddleButton
End Enum

Public Enum UniTextMouseWheel
    [Wheel Down]
    [Wheel Up]
End Enum

' Scroll direction constants
Public Enum UniTextScrollDirection
    [Scroll Horizontal] = vbHorizontal
    [Scroll Vertical] = vbVertical
End Enum

Public Enum UniTextSelectionPosition
    [Selection Start]
    [Selection End]
End Enum

' Shift constants
Public Enum UniTextShift
    [No Mask] = 0
    [Shift Mask] = vbShiftMask
    [Ctrl Mask] = vbCtrlMask
    [Shift And Ctrl Mask] = vbShiftMask Or vbCtrlMask
    [Alt Mask] = vbAltMask
    [Shift And Alt Mask] = vbShiftMask Or vbAltMask
    [Ctrl And Alt Mask] = vbCtrlMask Or vbAltMask
    [All Masks] = vbShiftMask Or vbCtrlMask Or vbAltMask
End Enum

Private Const BDR_INNER = &HC
Private Const BDR_OUTER = &H3
Private Const BDR_RAISED = &H5
Private Const BDR_RAISEDINNER = &H4
Private Const BDR_RAISEDOUTER = &H1
Private Const BDR_SUNKEN = &HA
Private Const BDR_SUNKENINNER = &H8
Private Const BDR_SUNKENOUTER = &H2
Private Const BF_BOTTOM = &H8
Private Const BF_LEFT = &H1
Private Const BF_RIGHT = &H4
Private Const BF_TOP = &H2
Private Const BF_RECT = (BF_LEFT Or BF_TOP Or BF_RIGHT Or BF_BOTTOM)
Private Const EDGE_BUMP = (BDR_RAISEDOUTER Or BDR_SUNKENINNER)
Private Const EDGE_ETCHED = (BDR_SUNKENOUTER Or BDR_RAISEDINNER)
Private Const EDGE_RAISED = (BDR_RAISEDOUTER Or BDR_RAISEDINNER)
Private Const EDGE_SUNKEN = (BDR_SUNKENOUTER Or BDR_SUNKENINNER)

Private Const EN_ALIGN_LTR_EC = &H700&
Private Const EN_ALIGN_RTL_EC = &H701&
Private Const EN_CHANGE = &H300&
Private Const EN_HSCROLL = &H601&
Private Const EN_LINK = &H70B&
Private Const EN_MSGFILTER = &H700&
Private Const EN_PROTECTED = &H704&
Private Const EN_SELCHANGE = &H702&
Private Const EN_SETFOCUS = &H100
Private Const EN_UPDATE = &H400&
Private Const EN_VSCROLL = &H602&

Private Const ES_AUTOVSCROLL = &H40&
Private Const ES_AUTOHSCROLL = &H80&
Private Const ES_CENTER = &H1&
Private Const ES_LEFT = &H0&
Private Const ES_MULTILINE = &H4&
Private Const ES_NOHIDESEL = &H100&
Private Const ES_PASSWORD = &H20&
Private Const ES_READONLY = &H800&
Private Const ES_RIGHT = &H2&
Private Const ES_WANTRETURN = &H1000&

Private Const GWL_EXSTYLE As Long = -20&
Private Const GWL_STYLE As Long = -16&

Private Const VK_DOWN = &H28
Private Const VK_END = &H23
Private Const VK_HOME = &H24
Private Const VK_LEFT = &H25
Private Const VK_RETURN = &HD
Private Const VK_RIGHT = &H27
Private Const VK_TAB = &H9
Private Const VK_UP = &H26

Private Const WS_BORDER = &H800000
Private Const WS_CHILD = &H40000000
Private Const WS_HSCROLL = &H100000
Private Const WS_VISIBLE = &H10000000
Private Const WS_VSCROLL = &H200000

' WM_MOUSEMOVE and others
Private Const MK_LBUTTON = &H1&
Private Const MK_RBUTTON = &H2&
Private Const MK_SHIFT = &H4&
Private Const MK_CONTROL = &H8&
Private Const MK_MBUTTON = &H10&

' window messages
Private Const WM_CHAR = &H102&
Private Const WM_COMMAND = &H111&
Private Const WM_CONTEXTMENU = &H7B&
Private Const WM_CREATE = &H1&
Private Const WM_CTLCOLOREDIT = &H133&
Private Const WM_CTLCOLORSTATIC = &H138&
Private Const WM_DESTROY = &H2&
Private Const WM_ERASEBKGND = &H14
Private Const WM_GETDLGCODE = &H87
Private Const WM_GETTEXT = &HD
Private Const WM_GETTEXTLENGTH = &HE
Private Const WM_HSCROLL = &H114
Private Const WM_KEYDOWN = &H100
Private Const WM_KEYUP = &H101
Private Const WM_KILLFOCUS = &H8
Private Const WM_LBUTTONDBLCLK = &H203&
Private Const WM_LBUTTONDOWN = &H201&
Private Const WM_LBUTTONUP = &H202&
Private Const WM_MBUTTONDBLCLK = &H209&
Private Const WM_MBUTTONDOWN = &H207&
Private Const WM_MBUTTONUP = &H208&
Private Const WM_MOUSEACTIVATE = &H21
Private Const WM_MOUSEFIRST = &H200
Private Const WM_MOUSELAST = &H209
Private Const WM_MOUSEMOVE = &H200&
Private Const WM_MOUSELEAVE = &H2A3&
Private Const WM_MOUSEWHEEL = &H20A
Private Const WM_PAINT = &HF&
Private Const WM_RBUTTONDBLCLK = &H206
Private Const WM_RBUTTONDOWN = &H204&
Private Const WM_RBUTTONUP = &H205&
Private Const WM_SETFOCUS = &H7
Private Const WM_SETFONT = &H30
Private Const WM_SETTEXT = &HC
Private Const WM_UNDO As Integer = &H304
Private Const WM_USER As Long = &H400
Private Const WM_VSCROLL = &H115

Private Const WS_EX_CLIENTEDGE = &H200
Private Const WS_EX_LAYOUTRTL = &H400000

Private Const EM_CANUNDO = &HC6
Private Const EM_CHARFROMPOS = &HD7
Private Const EM_EMPTYUNDOBUFFER = &HCD
Private Const EM_FMTLINES = &HC8
Private Const EM_GETFIRSTVISIBLELINE = &HCE
Private Const EM_GETHANDLE = &HBD
Private Const EM_GETLIMITTEXT = &HD5
Private Const EM_GETLINE = &HC4
Private Const EM_GETLINECOUNT = &HBA
Private Const EM_GETMODIFY = &HB8
Private Const EM_GETPASSWORDCHAR = &HD2
Private Const EM_GETRECT = &HB2
Private Const EM_GETSEL = &HB0
Private Const EM_GETTHUMB = &HBE
Private Const EM_GETWORDBREAKPROC = &HD1
Private Const EM_LIMITTEXT = &HC5
Private Const EM_LINEFROMCHAR = &HC9
Private Const EM_LINEINDEX = &HBB
Private Const EM_LINELENGTH = &HC1
Private Const EM_LINESCROLL = &HB6
Private Const EM_REPLACESEL = &HC2
Private Const EM_SCROLL = &HB5
Private Const EM_SCROLLCARET = &HB7
Private Const EM_SETHANDLE = &HBC
Private Const EM_SETLIMITTEXT = &HC5
Private Const EM_SETMODIFY = &HB9
Private Const EM_SETPASSWORDCHAR = &HCC
Private Const EM_SETREADONLY = &HCF
Private Const EM_SETRECT = &HB3
Private Const EM_SETRECTNP = &HB4
Private Const EM_SETSEL = &HB1
Private Const EM_SETTABSTOPS = &HCB
Private Const EM_SETWORDBREAKPROC = &HD0
Private Const EM_UNDO = &HC7

Private Const OPAQUE = 2
Private Const TRANSPARENT = 1

Private Type TRACKMOUSEEVENT_STRUCT
    cbSize As Long
    dwFlags As TRACKMOUSEEVENT_FLAGS
    hWndTrack As Long
    dwHoverTime As Long
End Type

Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Private Declare Function LoadLibraryA Lib "kernel32" (ByVal lpLibFileName As String) As Long

Private Type OVERLAPPED
    Internal As Long
    InternalHigh As Long
    Offset As Long
    OffsetHigh As Long
    hEvent As Long
End Type

Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function CreateFileW Lib "kernel32" (ByVal lpFileName As Long, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Long, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Declare Function GetACP Lib "kernel32" () As Long
Private Declare Function GetFileSize Lib "kernel32" (ByVal hFile As Long, lpFileSizeHigh As Long) As Long
Private Declare Function ReadFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, lpOverlapped As OVERLAPPED) As Long
Private Declare Function WriteFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, lpOverlapped As OVERLAPPED) As Long

Private Const SB_THUMBPOSITION = 4
Private Const SBS_HORZ = &H0&
Private Const SBS_VERT = &H1&

Private Declare Function GetScrollPos Lib "user32" (ByVal hWnd As Long, ByVal nBar As Long) As Long
Private Declare Function PostMessageW Lib "user32" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function SetScrollPos Lib "user32" (ByVal hWnd As Long, ByVal nBar As Long, ByVal nPos As Long, ByVal bRedraw As Long) As Long

Private Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Private Declare Function DrawEdge Lib "user32" (ByVal hDC As Long, qrc As RECT, ByVal edge As Long, ByVal grfFlags As Long) As Long
Private Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hWnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
Private Declare Function GetFocus Lib "user32" () As Long
Private Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
Private Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
Private Declare Function InvalidateRect Lib "user32" (ByVal hWnd As Long, lpRect As RECT, ByVal bErase As Long) As Long
Private Declare Function MulDiv Lib "kernel32" (ByVal nNumber As Long, ByVal nNumerator As Long, ByVal nDenominator As Long) As Long
Private Declare Function SetBkColor Lib "gdi32" (ByVal hDC As Long, ByVal crColor As Long) As Long
Private Declare Function SetBkMode Lib "gdi32" (ByVal hDC As Long, ByVal nBkMode As Long) As Long
Private Declare Function SetFocus Lib "user32" (ByVal hWnd As Long) As Long
Private Declare Function SetTextColor Lib "gdi32" (ByVal hDC As Long, ByVal crColor As Long) As Long
Private Declare Function TrackMouseEventUser32 Lib "user32" Alias "TrackMouseEvent" (lpEventTrack As TRACKMOUSEEVENT_STRUCT) As Long
Private Declare Function TrackMouseEventComCtl Lib "comctl32" Alias "_TrackMouseEvent" (lpEventTrack As TRACKMOUSEEVENT_STRUCT) As Long

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function CreateWindowExW Lib "user32" (ByVal dwExStyle As Long, ByVal lpClassName As Long, ByVal lpWindowName As Long, ByVal dwStyle As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, lpParam As Any) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function DestroyWindow Lib "user32" (ByVal hWnd As Long) As Long
Private Declare Function GetDC Lib "user32" (ByVal hWnd As Long) As Long
Private Declare Function GetDeviceCaps Lib "gdi32" (ByVal hDC As Long, ByVal nIndex As Long) As Long
Private Declare Function GetWindowLongW Lib "user32" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Private Declare Function MoveWindow Lib "user32" (ByVal hWnd As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long
Private Declare Function MultiByteToWideChar Lib "kernel32" (ByVal CodePage As Long, ByVal dwFlags As Long, ByVal lpMultiByteStr As Long, ByVal cchMultiByte As Long, ByVal lpWideCharStr As Long, ByVal cchWideChar As Long) As Long
Private Declare Function SendMessageW Lib "user32" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function WideCharToMultiByte Lib "kernel32" (ByVal CodePage As Long, ByVal dwFlags As Long, ByVal lpWideCharStr As Long, ByVal cchWideChar As Long, ByVal lpMultiByteStr As Long, ByVal cchMultiByte As Long, ByVal lpDefaultChar As Long, lpUsedDefaultChar As Long) As Long

Private Declare Function GetKeyboardState Lib "user32" (pbKeyState As Byte) As Long
Private Declare Function SetKeyboardState Lib "user32" (pbKeyState As Byte) As Long

Private Declare Function LocalLock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function LocalUnlock Lib "kernel32" (ByVal hMem As Long) As Long

Private m_Alignment As AlignmentConstants
Private m_Appearance As UniTextAppearance
Private m_BorderStyle As UniTextBorderStyle
Private m_Enabled As Boolean
Private m_FileCodepage As UniTextFileCodepage
Private WithEvents m_Font As StdFont
Attribute m_Font.VB_VarHelpID = -1
Private m_ForeColor As OLE_COLOR
Private m_HasFocus As Boolean
Private m_HideSelection As Boolean
Private m_InContext As Boolean
Private m_Locked As Boolean
Private m_MaxLength As Long
Private m_MouseOver As Boolean
Private m_MultiLine As Boolean
Private m_PasswordChar As String
Private m_RightToLeft As Boolean
Private m_ScrollBars As ScrollBarConstants
Private m_Text As String
Private m_UseEvents As Boolean

Private m_BackClr As Long
Private m_BackClrBrush As Long
Private m_BOM As UniTextBOM
Private m_bytText() As Byte
Private m_FCP As Long
Private m_Focus As Boolean
Private m_ForeClr As Long
Private m_hDC As Long
Private m_hWnd As Long
Private m_IPAO As UniText_IPAOHook
Private m_RC As RECT
Private m_ContainerScaleMode As ScaleModeConstants   ' Container ScaleMode
Private m_TrackComCtl As Boolean
Private m_TrackUser32 As Boolean

' for fixing XP Theme problem with a certain version of comctl32.dll
Private m_FreeShell32 As Boolean
Private m_Shell32 As Long

Dim blnDesignTime As Boolean                ' True if in IDE design time

    Private z_scFunk            As Collection   'hWnd/thunk-address collection; initialized as needed
    Private z_hkFunk            As Collection   'hook/thunk-address collection; initialized as needed
    Private z_cbFunk            As Collection   'callback/thunk-address collection; initialized as needed
    Private Const IDX_INDEX     As Long = 2     'index of the subclassed hWnd OR hook type
    Private Const IDX_PREVPROC  As Long = 9     'Thunk data index of the original WndProc
    Private Const IDX_BTABLE    As Long = 11    'Thunk data index of the Before table for messages
    Private Const IDX_ATABLE    As Long = 12    'Thunk data index of the After table for messages
    Private Const IDX_CALLBACKORDINAL As Long = 36 ' Ubound(callback thunkdata)+1, index of the callback

  ' Declarations:
    Private Declare Sub RtlMoveMemory Lib "kernel32" (ByVal Destination As Long, ByVal Source As Long, ByVal Length As Long)
    Private Declare Function IsBadCodePtr Lib "kernel32" (ByVal lpfn As Long) As Long
    Private Declare Function VirtualAlloc Lib "kernel32" (ByVal lpAddress As Long, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As Long
    Private Declare Function VirtualFree Lib "kernel32" (ByVal lpAddress As Long, ByVal dwSize As Long, ByVal dwFreeType As Long) As Long
    Private Declare Function GetModuleHandleA Lib "kernel32" (ByVal lpModuleName As String) As Long
    Private Declare Function GetModuleHandleW Lib "kernel32" (ByVal lpModuleName As Long) As Long
    Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
    Private Enum eThunkType
        SubclassThunk = 0
        HookThunk = 1
        CallbackThunk = 2
    End Enum

    Private Enum eMsgWhen                                                   'When to callback
      MSG_BEFORE = 1                                                        'Callback before the original WndProc
      MSG_AFTER = 2                                                         'Callback after the original WndProc
      MSG_BEFORE_AFTER = MSG_BEFORE Or MSG_AFTER                            'Callback before and after the original WndProc
    End Enum
    
    ' see ssc_Subclass for complete listing of indexes and what they relate to
    Private Const IDX_PARM_USER As Long = 13    'Thunk data index of the User-defined callback parameter data index
    Private Const IDX_UNICODE   As Long = 107   'Must be UBound(subclass thunkdata)+1; index for unicode support
    Private Const MSG_ENTRIES   As Long = 32    'Number of msg table entries. Set to 1 if using ALL_MESSAGES for all subclassed windows
    Private Const ALL_MESSAGES  As Long = -1    'All messages will callback
    
    Private Declare Function CallWindowProcA Lib "user32" (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal MSG As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    Private Declare Function CallWindowProcW Lib "user32" (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal MSG As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
    Private Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hWnd As Long, lpdwProcessId As Long) As Long
    Private Declare Function IsWindow Lib "user32" (ByVal hWnd As Long) As Long
    Private Declare Function IsWindowUnicode Lib "USER32.DLL" (ByVal hWnd As Long) As Long
    Private Declare Function SetWindowLongA Lib "user32" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
    Private Declare Function SetWindowLongW Lib "user32" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long

    '-SelfHook specific declarations----------------------------------------------------------------------------
    Private Declare Function SetWindowsHookExA Lib "user32" (ByVal idHook As Long, ByVal lpfn As Long, ByVal hMod As Long, ByVal dwThreadId As Long) As Long
    Private Declare Function SetWindowsHookExW Lib "user32" (ByVal idHook As Long, ByVal lpfn As Long, ByVal hMod As Long, ByVal dwThreadId As Long) As Long
    Private Declare Function UnhookWindowsHookEx Lib "user32" (ByVal hHook As Long) As Long
    Private Declare Function CallNextHookEx Lib "USER32.DLL" (ByVal hHook As Long, ByVal nCode As Long, ByVal wParam As Long, ByRef lParam As Any) As Long
    Private Declare Function GetDesktopWindow Lib "USER32.DLL" () As Long
    
    Private Enum eHookType  ' http://msdn2.microsoft.com/en-us/library/ms644990.aspx
      WH_MSGFILTER = -1
      WH_JOURNALRECORD = 0
      WH_JOURNALPLAYBACK = 1
      WH_KEYBOARD = 2
      WH_GETMESSAGE = 3
      WH_CALLWNDPROC = 4
      WH_CBT = 5
      WH_SYSMSGFILTER = 6
      WH_MOUSE = 7
      WH_DEBUG = 9
      WH_SHELL = 10
      WH_FOREGROUNDIDLE = 11
      WH_CALLWNDPROCRET = 12
      WH_KEYBOARD_LL = 13       ' NT/2000/XP+ only, Global hook only
      WH_MOUSE_LL = 14          ' NT/2000/XP+ only, Global hook only
    End Enum

Public Property Get Alignment() As AlignmentConstants
    Alignment = m_Alignment
End Property
Public Property Let Alignment(ByVal NewValue As AlignmentConstants)
    If NewValue <> m_Alignment And m_MultiLine Then
        m_Alignment = NewValue
        Private_Init
        If Not blnDesignTime Then Else PropertyChanged "Alignment"
    End If
End Property
Public Property Get Appearance() As UniTextAppearance
    Appearance = m_Appearance
End Property
Public Property Let Appearance(ByVal NewValue As UniTextAppearance)
    m_Appearance = NewValue
    Private_Init
End Property
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_ProcData.VB_Invoke_Property = ";Appearance"
Attribute BackColor.VB_UserMemId = -501
    BackColor = UserControl.BackColor
End Property
Public Property Let BackColor(ByVal NewColor As OLE_COLOR)
    UserControl.BackColor = NewColor
    UserControl.Refresh
    If NewColor < 0 Then m_BackClr = GetSysColor(NewColor And &HFF&) Else m_BackClr = NewColor
    DeleteObject m_BackClrBrush
    m_BackClrBrush = CreateSolidBrush(m_BackClr)
    If Not blnDesignTime Then Else PropertyChanged "BackColor"
    InvalidateRect m_hWnd, m_RC, -1&
End Property
Public Property Get BOM() As UniTextBOM
Attribute BOM.VB_MemberFlags = "400"
    BOM = m_BOM
End Property
Public Property Let BOM(ByVal NewValue As UniTextBOM)
    m_BOM = NewValue
End Property
Public Property Get BorderStyle() As UniTextBorderStyle
Attribute BorderStyle.VB_ProcData.VB_Invoke_Property = ";Appearance"
    BorderStyle = m_BorderStyle
End Property
Public Property Let BorderStyle(ByVal NewValue As UniTextBorderStyle)
    m_BorderStyle = NewValue
    If Not blnDesignTime Then Else PropertyChanged "BorderStyle"
    If m_Appearance = [Classic 3D] Then
        UserControl_Resize
    Else
        Private_Init
    End If
End Property
Public Function CanUndo() As Boolean
    If m_hWnd Then CanUndo = (SendMessageW(m_hWnd, EM_CANUNDO, 0&, ByVal 0&) <> 0&)
End Function
Public Sub ClearUndo()
    If m_hWnd Then SendMessageW m_hWnd, EM_EMPTYUNDOBUFFER, 0&, ByVal 0&
End Sub
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_ProcData.VB_Invoke_Property = ";Behavior"
    Enabled = m_Enabled
End Property
Public Property Let Enabled(ByVal NewValue As Boolean)
    Dim lngStyle As Long
    If (m_Enabled <> NewValue) And (m_hWnd <> 0) Then
        UserControl.Enabled = NewValue
        m_Enabled = NewValue
        If Not blnDesignTime Then Else PropertyChanged "Enabled"
    End If
End Property
Public Property Get FileCodepage() As UniTextFileCodepage
    FileCodepage = m_FileCodepage
End Property
Public Property Let FileCodepage(ByVal NewValue As UniTextFileCodepage)
    m_FileCodepage = NewValue
    If m_FileCodepage = [System Codepage] Then
        m_FCP = GetACP
    Else
        m_FCP = m_FileCodepage
    End If
    If Not blnDesignTime Then Else PropertyChanged "FileCodepage"
End Property
Public Function FirstVisibleLine() As Long
    If m_hWnd Then FirstVisibleLine = SendMessageW(m_hWnd, EM_GETFIRSTVISIBLELINE, 0&, ByVal 0&)
End Function
Public Property Get Font() As Font
Attribute Font.VB_ProcData.VB_Invoke_Property = ";Font"
Attribute Font.VB_UserMemId = -512
    Set Font = m_Font
End Property
Public Property Set Font(ByVal NewValue As Font)
    Dim NewFont As New StdFont
    ' have to do it this way because otherwise we'd link with existing font object
    NewFont.Bold = NewValue.Bold
    NewFont.Charset = NewValue.Charset
    NewFont.Italic = NewValue.Italic
    NewFont.Name = NewValue.Name
    NewFont.Size = NewValue.Size
    NewFont.Strikethrough = NewValue.Strikethrough
    NewFont.Underline = NewValue.Underline
    NewFont.Weight = NewValue.Weight
    Set m_Font = NewFont
    If Not blnDesignTime Then Else PropertyChanged "Font"
    m_Font_FontChanged vbNullString
    InvalidateRect m_hWnd, m_RC, -1&
End Property
Public Property Get FontBold() As Boolean
Attribute FontBold.VB_ProcData.VB_Invoke_Property = ";Font"
Attribute FontBold.VB_MemberFlags = "400"
    FontBold = m_Font.Bold
End Property
Public Property Let FontBold(ByVal NewValue As Boolean)
    m_Font.Bold = NewValue
    If Not blnDesignTime Then Else PropertyChanged "Font"
    InvalidateRect m_hWnd, m_RC, -1&
End Property
Public Property Get FontItalic() As Boolean
Attribute FontItalic.VB_ProcData.VB_Invoke_Property = ";Font"
Attribute FontItalic.VB_MemberFlags = "400"
    FontItalic = m_Font.Italic
End Property
Public Property Let FontItalic(ByVal NewValue As Boolean)
    m_Font.Italic = NewValue
    If Not blnDesignTime Then Else PropertyChanged "Font"
    InvalidateRect m_hWnd, m_RC, -1&
End Property
Public Property Get FontName() As String
Attribute FontName.VB_ProcData.VB_Invoke_Property = ";Font"
Attribute FontName.VB_MemberFlags = "400"
    FontName = m_Font.Name
End Property
Public Property Let FontName(ByRef NewValue As String)
    m_Font.Name = NewValue
    If Not blnDesignTime Then Else PropertyChanged "Font"
    InvalidateRect m_hWnd, m_RC, -1&
End Property
Public Property Get FontSize() As Single
Attribute FontSize.VB_ProcData.VB_Invoke_Property = ";Font"
Attribute FontSize.VB_MemberFlags = "400"
    FontSize = m_Font.Size
End Property
Public Property Let FontSize(ByVal NewValue As Single)
    m_Font.Size = NewValue
    If Not blnDesignTime Then Else PropertyChanged "Font"
    InvalidateRect m_hWnd, m_RC, -1&
End Property
Public Property Get FontStrikethru() As Boolean
Attribute FontStrikethru.VB_ProcData.VB_Invoke_Property = ";Font"
Attribute FontStrikethru.VB_MemberFlags = "400"
    FontStrikethru = m_Font.Strikethrough
End Property
Public Property Let FontStrikethru(ByVal NewValue As Boolean)
    m_Font.Strikethrough = NewValue
    If Not blnDesignTime Then Else PropertyChanged "Font"
    InvalidateRect m_hWnd, m_RC, -1&
End Property
Public Property Get FontUnderline() As Boolean
Attribute FontUnderline.VB_ProcData.VB_Invoke_Property = ";Font"
Attribute FontUnderline.VB_MemberFlags = "400"
    FontUnderline = m_Font.Underline
End Property
Public Property Let FontUnderline(ByVal NewValue As Boolean)
    m_Font.Underline = NewValue
    If Not blnDesignTime Then Else PropertyChanged "Font"
    InvalidateRect m_hWnd, m_RC, -1&
End Property
Public Property Get ForeColor() As OLE_COLOR
Attribute ForeColor.VB_ProcData.VB_Invoke_Property = ";Appearance"
Attribute ForeColor.VB_UserMemId = -513
    ForeColor = m_ForeColor
End Property
Public Property Let ForeColor(ByVal NewValue As OLE_COLOR)
    m_ForeColor = NewValue
    If m_ForeColor < 0 Then m_ForeClr = GetSysColor(m_ForeColor And &HFF&) Else m_ForeClr = m_ForeColor
    If Not blnDesignTime Then Else PropertyChanged "ForeColor"
    InvalidateRect m_hWnd, m_RC, -1&
End Property
Public Function GetLine(Optional ByVal Line As Long, Optional ByVal MaxLength As Integer = 1024) As String
    Dim lngLines As Long, strBuffer As String, lngLen As Long
    If MaxLength < 1 Then Exit Function
    If m_hWnd Then
        lngLines = SendMessageW(m_hWnd, EM_GETLINECOUNT, 0&, ByVal 0&)
        If Line > 0 And Line <= lngLines Then
            Line = Line - 1
        ElseIf Line = 0 Then
            Line = SendMessageW(m_hWnd, EM_LINEFROMCHAR, -1&, ByVal 0&)
        ElseIf Line < 0 And -Line < lngLines Then
            Line = lngLines + Line - 1
        Else
            Exit Function
        End If
        strBuffer = ChrW$(MaxLength) & String$(MaxLength - 1, vbNullChar)
        lngLen = SendMessageW(m_hWnd, EM_GETLINE, Line, ByVal StrPtr(strBuffer))
        If lngLen > 0 Then GetLine = Left$(strBuffer, lngLen)
    End If
End Function
Public Sub GetSel(ByRef SelStart As Long, ByRef SelEnd As Long)
    If m_hWnd Then SendMessageW m_hWnd, EM_GETSEL, VarPtr(SelStart), SelEnd
End Sub
Public Property Get hDC() As Long
    hDC = m_hDC
End Property
Public Property Get HideSelection() As Boolean
    HideSelection = m_HideSelection
End Property
Public Property Let HideSelection(ByVal NewValue As Boolean)
    If NewValue <> m_HideSelection Then: m_HideSelection = NewValue: Private_Init: If Not blnDesignTime Then Else PropertyChanged "HideSelection"
End Property
Public Property Get hWnd() As Long
Attribute hWnd.VB_UserMemId = -515
    hWnd = m_hWnd
End Property
Public Function LastVisibleLine() As Long
    Dim udtRC As RECT, lngXY As Long
    If m_hWnd Then
        SendMessageW m_hWnd, EM_GETRECT, 0&, udtRC
        lngXY = CLng(udtRC.Bottom - udtRC.Top) * &H10000 + CLng(udtRC.Right - udtRC.Left)
        lngXY = SendMessageW(m_hWnd, EM_CHARFROMPOS, 0&, ByVal lngXY)
        If lngXY <> -1& Then LastVisibleLine = SendMessageW(m_hWnd, EM_LINEFROMCHAR, lngXY And &HFFFF&, ByVal 0&)
    End If
End Function
Public Function Length() As Long
    If m_hWnd Then
        Length = SendMessageW(m_hWnd, WM_GETTEXTLENGTH, 0&, ByVal 0&)
    End If
End Function
Public Function Line(Optional ByVal Selection As UniTextSelectionPosition = [Selection Start]) As Long
    Dim lngStart As Long, lngEnd As Long
    If m_hWnd Then
        If Selection = [Selection Start] Then
            Line = SendMessageW(m_hWnd, EM_LINEFROMCHAR, -1&, ByVal 0&)
        Else
            SendMessageW m_hWnd, EM_GETSEL, VarPtr(lngStart), lngEnd
            Line = SendMessageW(m_hWnd, EM_LINEFROMCHAR, lngEnd, ByVal 0&)
        End If
    End If
End Function
Public Function LineHeight() As Byte
    Dim udtRC As RECT, lngXY As Long, lngLines As Long
    If m_hWnd Then
        SendMessageW m_hWnd, EM_GETRECT, 0&, udtRC
        lngXY = CLng(udtRC.Bottom - udtRC.Top) * &H10000 + CLng(udtRC.Right - udtRC.Left)
        lngXY = SendMessageW(m_hWnd, EM_CHARFROMPOS, 0&, ByVal lngXY)
        If lngXY <> -1& Then
            lngLines = (SendMessageW(m_hWnd, EM_LINEFROMCHAR, lngXY And &HFFFF&, ByVal 0&) - SendMessageW(m_hWnd, EM_GETFIRSTVISIBLELINE, 0&, ByVal 0&))
            If lngLines Then LineHeight = (udtRC.Bottom - udtRC.Top) \ lngLines
        End If
    End If
End Function
Public Function Lines() As Long
    If m_hWnd Then Lines = SendMessageW(m_hWnd, EM_GETLINECOUNT, 0&, ByVal 0&)
End Function
Public Function LoadFile(ByRef Filename As String, Optional ByVal IfNoByteOrderMark As UniTextAutoBOM = [Autodetect for UTF8]) As Boolean
    Dim bytBOM(3) As Byte, strUTF32 As String * 2, strUTF16 As String * 1, strUTF8 As String * 3
    Dim bytFile() As Byte, lngFile As Long, lngLen As Long, lngRead As Long, udtO As OVERLAPPED
    Dim bytA As Byte, lngA As Long, lngB As Long, lngChar As Long, lngChar2 As Long
    ' validate filename, check file exists
    If LenB(Filename) Then
        ' GENERIC_READ, SHARED READ & WRITE, OPEN_EXISTING, OVERLAPPED & NORMAL
        lngFile = CreateFileW(StrPtr(Filename), &H80000000, 3&, 0&, 3&, &H40000080, 0&)
        If lngFile Then
            lngLen = GetFileSize(lngFile, 0)
            If lngLen > 0 Then
                ' look for byte-order mark
                ReadFile lngFile, bytBOM(0), 4, lngRead, udtO
                strUTF32 = bytBOM
                strUTF16 = strUTF32
                strUTF8 = StrConv(strUTF32, vbUnicode)
                If (strUTF32 = UTF32BE) And (lngLen > 4) Then
                    m_BOM = [UTF-32 big endian]
                    ReDim Preserve bytFile(lngLen - 5)
                    udtO.Offset = 4
                ElseIf (strUTF32 = UTF32LE) And (lngLen > 4) Then
                    m_BOM = [UTF-32 little endian]
                    ReDim Preserve bytFile(lngLen - 5)
                    udtO.Offset = 4
                ElseIf (strUTF16 = UTF16BE) And (lngLen > 2) Then
                    m_BOM = [UTF-16 big endian]
                    ReDim Preserve bytFile(lngLen - 3)
                    udtO.Offset = 2
                ElseIf (strUTF16 = UTF16LE) And (lngLen > 2) Then
                    m_BOM = [UTF-16 little endian]
                    ReDim Preserve bytFile(lngLen - 3)
                    udtO.Offset = 2
                ElseIf (strUTF8 = UTF8) And (lngLen > 3) Then
                    m_BOM = [UTF-8 BOM]
                    ReDim Preserve bytFile(lngLen - 4)
                    udtO.Offset = 3
                ElseIf (strUTF32 = UTF7) And (lngLen > 5) Then
                    udtO.Offset = 4
                    ReadFile lngFile, bytA, 1, lngRead, udtO
                    If bytA = 45 Then ' ChrW$(bytA) = "-"
                        m_BOM = [UTF-7 BOM]
                        ReDim Preserve bytFile(lngLen - 6)
                        udtO.Offset = 5
                    Else
                        m_BOM = [No BOM / ANSI]
                        ReDim Preserve bytFile(lngLen - 1)
                        udtO.Offset = 0
                    End If
                Else
                    m_BOM = [No BOM / ANSI]
                    ReDim Preserve bytFile(lngLen - 1)
                    udtO.Offset = 0
                End If
                ' read entire file (but without BOM if there is one)
                ReadFile lngFile, bytFile(0), UBound(bytFile) + 1, lngRead, udtO
                ' we are done, close the file
                CloseHandle lngFile
                ' now we do conversions to UTF16LE which is used by Windows and thus VB6
                Select Case m_BOM
                    Case [No BOM / ANSI]
                        If IfNoByteOrderMark = [Autodetect for UTF8] Then
                            If Private_IsUTF8(bytFile) Then
                                m_BOM = [No BOM / UTF-8]
                                m_Text = Private_UTF8toUTF16(CStr(bytFile))
                            Else
                                m_Text = Private_FCPtoUTF16(CStr(bytFile))
                            End If
                        Else
                            m_Text = Private_FCPtoUTF16(CStr(bytFile))
                        End If
                    Case [UTF-8 BOM]
                        m_Text = Private_UTF8toUTF16(CStr(bytFile))
                    Case [UTF-16 little endian]
                        m_Text = bytFile
                    Case [UTF-7 BOM]
                        m_Text = Private_UTF7toUTF16(CStr(bytFile))
                    Case [UTF-16 big endian]
                        For lngA = 0 To UBound(bytFile) - 1 Step 2
                            bytA = bytFile(lngA)
                            bytFile(lngA) = bytFile(lngA + 1)
                            bytFile(lngA + 1) = bytA
                        Next lngA
                        m_Text = bytFile
                    ' UTF-32 conversions based on http://svn.mysql.com/svnpublic/connector-odbc3/tags/5.1.0-alpha/driver/unicode_transcode.c
                    Case [UTF-32 little endian]
                        lngB = 0
                        For lngA = 0 To UBound(bytFile) - 3 Step 4
                            lngChar = bytFile(lngA) Or (bytFile(lngA + 1) * &H100&) Or (bytFile(lngA + 2) * &H10000)
                            If lngChar < &HFFFF& Then
                                bytFile(lngB) = bytFile(lngA)
                                bytFile(lngB + 1) = bytFile(lngA + 1)
                                lngB = lngB + 2
                            ElseIf lngChar < &H10FFFF Then
                                lngChar2 = lngChar - &H10000
                                lngChar = &HD800& Or (lngChar2 \ 1024)
                                bytFile(lngB) = lngChar And &HFF&
                                bytFile(lngB + 1) = (lngChar And &HFF00&) \ &H100&
                                lngChar = &HDC00& Or (lngChar2 And &H3FF&)
                                bytFile(lngB + 2) = lngChar And &HFF&
                                bytFile(lngB + 3) = (lngChar And &HFF00&) \ &H100&
                                lngB = lngB + 4
                            End If
                        Next lngA
                        ReDim Preserve bytFile(lngB - 1)
                        m_Text = bytFile
                    Case [UTF-32 big endian]
                        lngB = 0
                        For lngA = 0 To UBound(bytFile) - 3 Step 4
                            lngChar = bytFile(lngA + 3) Or (bytFile(lngA + 2) * &H100&) Or (bytFile(lngA + 1) * &H10000)
                            If lngChar < &HFFFF& Then
                                bytFile(lngB) = bytFile(lngA + 3)
                                bytFile(lngB + 1) = bytFile(lngA + 2)
                                lngB = lngB + 2
                            ElseIf lngChar < &H10FFFF Then
                                lngChar2 = lngChar - &H10000
                                lngChar = &HD800& Or (lngChar2 \ 1024)
                                bytFile(lngB) = lngChar And &HFF&
                                bytFile(lngB + 1) = (lngChar And &HFF00&) \ &H100&
                                lngChar = &HDC00& Or (lngChar2 And &H3FF&)
                                bytFile(lngB + 2) = lngChar And &HFF&
                                bytFile(lngB + 3) = (lngChar And &HFF00&) \ &H100&
                                lngB = lngB + 4
                            End If
                        Next lngA
                        ReDim Preserve bytFile(lngB - 1)
                        m_Text = bytFile
                    ' risk garbage
                    Case Else
                        m_Text = bytFile
                End Select
                Erase bytFile
            Else
                m_Text = vbNullString
            End If
            If m_hWnd Then SendMessageW m_hWnd, WM_SETTEXT, 0&, ByVal StrPtr(m_Text)
            LoadFile = True
        End If
    End If
End Function
Public Property Get Locked() As Boolean
Attribute Locked.VB_ProcData.VB_Invoke_Property = ";Behavior"
    Locked = m_Locked
End Property
Public Property Let Locked(ByVal NewValue As Boolean)
    If m_Locked <> NewValue Then m_Locked = NewValue: Private_Init: If Not blnDesignTime Then Else PropertyChanged "Locked"
End Property
Public Property Get MaxLength() As Long
Attribute MaxLength.VB_ProcData.VB_Invoke_Property = ";Behavior"
    If m_hWnd Then m_MaxLength = SendMessageW(m_hWnd, EM_GETLIMITTEXT, 0&, ByVal 0&)
    If m_MaxLength = &H7FFFFFFE Or m_MaxLength = -1& Then
        m_MaxLength = -1&
    Else
        MaxLength = m_MaxLength
    End If
End Property
Public Property Let MaxLength(ByVal NewValue As Long)
    If NewValue <> 0 Then
        m_MaxLength = NewValue
    Else
        m_MaxLength = -1&
    End If
    If m_hWnd Then SendMessageW m_hWnd, EM_SETLIMITTEXT, m_MaxLength, ByVal 0&
    If Not blnDesignTime Then Else PropertyChanged "MaxLength"
End Property
Public Property Get Modified() As Boolean
Attribute Modified.VB_MemberFlags = "400"
    If m_hWnd Then Modified = (SendMessageW(m_hWnd, EM_GETMODIFY, 0&, ByVal 0&) <> 0&)
End Property
Public Property Let Modified(ByVal NewValue As Boolean)
    If m_hWnd Then SendMessageW m_hWnd, EM_SETMODIFY, CLng(NewValue), ByVal 0&
End Property
Public Property Get MouseIcon() As IPictureDisp
    Set MouseIcon = UserControl.MouseIcon
End Property
Public Property Set MouseIcon(ByRef NewValue As IPictureDisp)
    Set UserControl.MouseIcon = NewValue
    If Not blnDesignTime Then Else PropertyChanged "MouseIcon"
End Property
Public Property Get MousePointer() As MousePointerConstants
    MousePointer = UserControl.MousePointer
End Property
Public Property Let MousePointer(ByVal NewValue As MousePointerConstants)
    UserControl.MousePointer = NewValue
    If Not blnDesignTime Then Else PropertyChanged "MousePointer"
End Property
Public Function MouseOver() As Boolean
    MouseOver = m_MouseOver
End Function
Public Property Get MultiLine() As Boolean
Attribute MultiLine.VB_ProcData.VB_Invoke_Property = ";Behavior"
    MultiLine = m_MultiLine
End Property
Public Property Let MultiLine(ByVal NewValue As Boolean)
    If m_MultiLine <> NewValue Then m_MultiLine = NewValue: Private_Init: If Not blnDesignTime Then Else PropertyChanged "MultiLine"
End Property
Public Property Get PasswordChar() As String
    PasswordChar = m_PasswordChar
End Property
Public Property Let PasswordChar(ByRef NewValue As String)
    If LenB(NewValue) = 0 Then
        If LenB(m_PasswordChar) Then
            m_PasswordChar = vbNullString
            Private_Init
        End If
    ElseIf m_PasswordChar <> NewValue Then
        If LenB(m_PasswordChar) = 0 Then
            m_PasswordChar = ChrW$(AscW(NewValue))
            Private_Init
        Else
            m_PasswordChar = ChrW$(AscW(NewValue))
            SendMessageW m_hWnd, EM_SETPASSWORDCHAR, AscW(m_PasswordChar), 0&
        End If
    End If
End Property
Private Function Private_FCPtoUTF16(ByRef Text As String, Optional lFlags As Long) As String
    Static tmpArr() As Byte
    Dim tmpLen As Long, textLen As Long
    If LenB(Text) Then
        textLen = LenB(Text)
        tmpLen = textLen * 2
        ReDim Preserve tmpArr(tmpLen + 1)
        tmpLen = MultiByteToWideChar(m_FCP, lFlags, ByVal StrPtr(Text), textLen, ByVal VarPtr(tmpArr(0)), tmpLen) * 2
        If tmpLen > 0 Then
            If UBound(tmpArr) <> tmpLen Then ReDim Preserve tmpArr(tmpLen - 1)
            Private_FCPtoUTF16 = CStr(tmpArr)
        End If
    End If
End Function
Private Function Private_GetContainerScaleMode() As ScaleModeConstants
    ' this should be called only when we know scalemode has changed
    Select Case Ambient.ScaleUnits
        Case "Twip"
            Private_GetContainerScaleMode = vbTwips
        Case "Point"
            Private_GetContainerScaleMode = vbPoints
        Case "Pixel"
            Private_GetContainerScaleMode = vbPixels
        Case "Character"
            Private_GetContainerScaleMode = vbCharacters
        Case "Inch"
            Private_GetContainerScaleMode = vbInches
        Case "Millimeter"
            Private_GetContainerScaleMode = vbMillimeters
        Case "Centimeter"
            Private_GetContainerScaleMode = vbCentimeters
        Case "User"
            ' prevent user scalemode
            UserControl.Extender.Container.ScaleMode = vbTwips
            Private_GetContainerScaleMode = vbTwips
    End Select
End Function
Private Function Private_GetShiftMask() As Integer
    Private_GetShiftMask = Abs((GetKeyState(vbKeyShift) And &H8000) = &H8000) * vbShiftMask _
        Or Abs((GetKeyState(vbKeyControl) And &H8000) = &H8000) * vbCtrlMask _
        Or Abs((GetKeyState(vbKeyMenu) And &H8000) = &H8000) * vbAltMask
End Function
Private Function Private_GetShiftState() As Long
    Private_GetShiftState = Abs((GetKeyState(vbKeyShift) And &H8000) = &H8000) * vbShiftMask _
        Or Abs((GetKeyState(vbKeyControl) And &H8000) = &H8000) * vbCtrlMask _
        Or Abs((GetKeyState(vbKeyMenu) And &H8000) = &H8000) * vbAltMask
End Function
Private Sub Private_Init()
    Dim lngStyle As Long, lngExStyle As Long
    Dim lngSelStart As Long, lngSelEnd As Long, lngScrollH As Long, lngScrollV As Long
    ' remove old
    If m_hWnd Then
        lngScrollH = Me.ScrollHorizontal
        lngScrollV = Me.ScrollVertical
        Me.GetSel lngSelStart, lngSelEnd
        ssc_UnSubclass m_hWnd
        m_Text = Me.Text
        DestroyWindow m_hWnd
    End If
    ' init styles
    lngStyle = WS_VISIBLE Or WS_CHILD
    If Not m_HideSelection Then lngStyle = lngStyle Or ES_NOHIDESEL
    If m_MultiLine Then
        Select Case m_Alignment
            Case vbLeftJustify
                lngStyle = lngStyle Or ES_LEFT
            Case vbRightJustify
                lngStyle = lngStyle Or ES_RIGHT
            Case vbCenter
                lngStyle = lngStyle Or ES_CENTER
        End Select
        Select Case m_ScrollBars
            Case vbSBNone
                lngStyle = lngStyle Or ES_MULTILINE Or ES_WANTRETURN Or ES_AUTOVSCROLL Or ES_AUTOHSCROLL
            Case vbHorizontal
                lngStyle = lngStyle Or ES_MULTILINE Or ES_WANTRETURN Or ES_AUTOHSCROLL Or WS_HSCROLL
            Case vbVertical
                lngStyle = lngStyle Or ES_MULTILINE Or ES_WANTRETURN Or ES_AUTOVSCROLL Or WS_VSCROLL
            Case vbBoth
                lngStyle = lngStyle Or ES_MULTILINE Or ES_WANTRETURN Or ES_AUTOHSCROLL Or WS_HSCROLL Or WS_VSCROLL
        End Select
    Else
        lngStyle = lngStyle Or ES_AUTOHSCROLL
    End If
    If m_Locked Then lngStyle = lngStyle Or ES_READONLY
    If LenB(m_PasswordChar) Then lngStyle = lngStyle Or ES_PASSWORD
    
    If m_RightToLeft Then lngExStyle = WS_EX_LAYOUTRTL
    
    ' create new textbox
    If m_Appearance = [Classic 3D] Then
        m_hWnd = CreateWindowExW(lngExStyle, StrPtr("Edit"), StrPtr(m_Text), _
            lngStyle, _
            m_BorderStyle, m_BorderStyle, m_RC.Right - m_BorderStyle * 2, m_RC.Bottom - m_BorderStyle * 2, _
            UserControl.hWnd, 0&, App.hInstance, 0&)
    Else
        Select Case m_BorderStyle
            Case [Flat3D]
                lngStyle = lngStyle Or WS_BORDER
            Case [3D]
                lngExStyle = lngExStyle Or WS_EX_CLIENTEDGE
        End Select
    
        m_hWnd = CreateWindowExW(lngExStyle, StrPtr("Edit"), StrPtr(m_Text), _
            lngStyle, _
            0, 0, UserControl.ScaleWidth, UserControl.ScaleHeight, _
            UserControl.hWnd, 0&, App.hInstance, 0&)
    End If
    'SetWindowLong UserControl.hWnd, GWL_EXSTYLE, WS_CHILD Or WS_VISIBLE Or WS_TABSTOP Or ES_WANTRETURN
    If m_hWnd Then
        ' get device context
        m_hDC = GetDC(m_hWnd)
        If LenB(m_PasswordChar) Then SendMessageW m_hWnd, EM_SETPASSWORDCHAR, AscW(m_PasswordChar), 0&
        SendMessageW m_hWnd, EM_SETLIMITTEXT, m_MaxLength, ByVal 0&
        ' set font
        m_Font_FontChanged vbNullString
        ' start subclassing
        If ssc_Subclass(m_hWnd, , 2, , Not blnDesignTime, True) Then
            ssc_AddMsg m_hWnd, MSG_BEFORE, _
                WM_CHAR, _
                WM_CONTEXTMENU, _
                WM_LBUTTONDOWN, _
                WM_MBUTTONDOWN, _
                WM_RBUTTONDOWN, _
                WM_MOUSEACTIVATE, _
                WM_KEYDOWN
            ssc_AddMsg m_hWnd, MSG_AFTER, _
                WM_CONTEXTMENU, _
                WM_KEYUP, _
                WM_MOUSELEAVE, _
                WM_MOUSEMOVE, _
                WM_MOUSEWHEEL, _
                WM_LBUTTONUP, _
                WM_MBUTTONUP, _
                WM_RBUTTONUP, _
                WM_LBUTTONDBLCLK, _
                WM_MBUTTONDBLCLK, _
                WM_RBUTTONDBLCLK, _
                WM_SETFOCUS, _
                WM_HSCROLL, _
                WM_VSCROLL
        End If
        If lngSelStart Or lngSelEnd Then
            Me.SetSel lngSelStart, lngSelEnd
        End If
        If lngScrollH Then Me.ScrollHorizontal = lngScrollH
        If lngScrollV Then Me.ScrollVertical = lngScrollV
    Else
        m_hDC = 0
    End If
End Sub
Private Function Private_IsFunctionSupported(ByRef FunctionName As String, ByRef ModuleName As String) As Boolean
    Dim lngModule As Long, blnUnload As Boolean
    ' get handle to module
    lngModule = GetModuleHandleA(ModuleName)
    ' if getting the handle failed...
    If lngModule = 0 Then
        ' try loading the module
        lngModule = LoadLibraryA(ModuleName)
        ' we have to unload it too if that succeeded
        blnUnload = (lngModule <> 0)
    End If
    ' now if we have a handle to module...
    If lngModule Then
        ' see if the queried function is supported; return True if so, False if not
        Private_IsFunctionSupported = (GetProcAddress(lngModule, FunctionName) <> 0)
        ' see if we have to unload the module
        If blnUnload Then FreeLibrary lngModule
    End If
End Function
' Source: http://www.geocities.co.jp/SilkRoad/4511/vb/utf8.htm
Private Function Private_IsUTF8(ByRef bytArray() As Byte, Optional ByVal lngReadSize As Long = 2048) As Boolean
    Dim lngArraySize As Long, lngReadPosition As Long, lngUtf8ByteSize As Long, lngIsUtf8 As Long
    Dim i As Long
 
    If lngReadSize < 0 Then Exit Function
    lngArraySize = UBound(bytArray) + 1
    If lngReadSize > lngArraySize Then lngReadSize = lngArraySize
    
    Do While lngReadPosition < lngReadSize
        If bytArray(lngReadPosition) <= &H7F Then
            lngReadPosition = lngReadPosition + 1
        ElseIf bytArray(lngReadPosition) < &HC0 Then
            Exit Function
        ElseIf (bytArray(lngReadPosition) >= &HC0) And (bytArray(lngReadPosition) <= &HFD) Then
            If (bytArray(lngReadPosition) And &HFC) = &HFC Then
                lngUtf8ByteSize = 5
            ElseIf (bytArray(lngReadPosition) And &HF8) = &HF8 Then
                lngUtf8ByteSize = 4
            ElseIf (bytArray(lngReadPosition) And &HF0) = &HF0 Then
                lngUtf8ByteSize = 3
            ElseIf (bytArray(lngReadPosition) And &HE0) = &HE0 Then
                lngUtf8ByteSize = 2
            ElseIf (bytArray(lngReadPosition) And &HC0) = &HC0 Then
                lngUtf8ByteSize = 1
            End If
            If (lngReadPosition + lngUtf8ByteSize) >= lngReadSize Then Exit Do
            For i = (lngReadPosition + 1) To (lngReadPosition + lngUtf8ByteSize) Step 1
                If Not ((bytArray(i) >= &H80) And (bytArray(i) <= &HBF)) Then Exit Function
            Next i
            lngIsUtf8 = lngIsUtf8 + 1
            lngReadPosition = lngReadPosition + lngUtf8ByteSize + 1
        Else
            lngReadPosition = lngReadPosition + 1
        End If
    Loop
    Private_IsUTF8 = lngIsUtf8 > 0
End Function
Private Sub Private_SetIPAO()
    Dim pOleObject As IOleObject
    Dim pOleInPlaceSite As IOleInPlaceSite
    Dim pOleInPlaceFrame As IOleInPlaceFrame
    Dim pOleInPlaceUIWindow As IOleInPlaceUIWindow
    Dim rcPos As RECT
    Dim rcClip As RECT
    Dim uFrameInfo As OLEINPLACEFRAMEINFO

    On Error Resume Next
    Set pOleObject = Me
    Set pOleInPlaceSite = pOleObject.GetClientSite
    If Not pOleInPlaceSite Is Nothing Then
        pOleInPlaceSite.GetWindowContext pOleInPlaceFrame, pOleInPlaceUIWindow, VarPtr(rcPos), VarPtr(rcClip), VarPtr(uFrameInfo)
        If Not pOleInPlaceFrame Is Nothing Then
            pOleInPlaceFrame.SetActiveObject m_IPAO.ThisPointer, vbNullString
        End If
        If Not pOleInPlaceUIWindow Is Nothing Then '-- And Not m_bMouseActivate
            pOleInPlaceUIWindow.SetActiveObject m_IPAO.ThisPointer, vbNullString
        Else
            pOleObject.DoVerb OLEIVERB_UIACTIVATE, 0, pOleInPlaceSite, 0, UserControl.hWnd, VarPtr(rcPos)
        End If
    End If
End Sub
Private Function Private_UTF16toFCP(ByRef Text As String, Optional lFlags As Long) As String
    Static tmpArr() As Byte
    Dim tmpLen As Long, textLen As Long
    If LenB(Text) Then
        textLen = Len(Text)
        tmpLen = LenB(Text) * 2 + 1
        ReDim Preserve tmpArr(tmpLen - 1)
        tmpLen = WideCharToMultiByte(m_FCP, lFlags, ByVal StrPtr(Text), textLen, ByVal VarPtr(tmpArr(0)), tmpLen, ByVal 0&, ByVal 0&)
        If tmpLen > 0 Then
            If UBound(tmpArr) <> tmpLen Then ReDim Preserve tmpArr(tmpLen - 1)
            Private_UTF16toFCP = CStr(tmpArr)
        End If
    End If
End Function
Private Function Private_UTF16toUTF7(ByRef Text As String, Optional lFlags As Long) As String
    Static tmpArr() As Byte
    Dim tmpLen As Long, textLen As Long
    If LenB(Text) Then
        textLen = Len(Text)
        tmpLen = LenB(Text) * 2 + 1
        ReDim Preserve tmpArr(tmpLen - 1)
        tmpLen = WideCharToMultiByte(65000, lFlags, ByVal StrPtr(Text), textLen, ByVal VarPtr(tmpArr(0)), tmpLen, ByVal 0&, ByVal 0&)
        If tmpLen > 0 Then
            If UBound(tmpArr) <> tmpLen Then ReDim Preserve tmpArr(tmpLen - 1)
            Private_UTF16toUTF7 = CStr(tmpArr)
        End If
    End If
End Function
Private Function Private_UTF16toUTF8(ByRef Text As String, Optional lFlags As Long) As String
    Static tmpArr() As Byte
    Dim tmpLen As Long, textLen As Long
    If LenB(Text) Then
        textLen = Len(Text)
        tmpLen = LenB(Text) * 2 + 1
        ReDim Preserve tmpArr(tmpLen - 1)
        tmpLen = WideCharToMultiByte(65001, lFlags, ByVal StrPtr(Text), textLen, ByVal VarPtr(tmpArr(0)), tmpLen, ByVal 0&, ByVal 0&)
        If tmpLen > 0 Then
            If UBound(tmpArr) <> tmpLen Then ReDim Preserve tmpArr(tmpLen - 1)
            Private_UTF16toUTF8 = CStr(tmpArr)
        End If
    End If
End Function
Private Function Private_UTF7toUTF16(ByRef Text As String, Optional lFlags As Long) As String
    Static tmpArr() As Byte
    Dim tmpLen As Long, textLen As Long
    If LenB(Text) Then
        textLen = LenB(Text)
        tmpLen = textLen * 2
        ReDim Preserve tmpArr(tmpLen + 1)
        tmpLen = MultiByteToWideChar(65000, lFlags, ByVal StrPtr(Text), textLen, ByVal VarPtr(tmpArr(0)), tmpLen) * 2
        If tmpLen > 0 Then
            If UBound(tmpArr) <> tmpLen Then ReDim Preserve tmpArr(tmpLen - 1)
            Private_UTF7toUTF16 = CStr(tmpArr)
        End If
    End If
End Function
Private Function Private_UTF8toUTF16(ByRef Text As String, Optional lFlags As Long) As String
    Static tmpArr() As Byte
    Dim tmpLen As Long, textLen As Long
    If LenB(Text) Then
        textLen = LenB(Text)
        tmpLen = textLen * 2
        ReDim Preserve tmpArr(tmpLen + 1)
        tmpLen = MultiByteToWideChar(65001, lFlags, ByVal StrPtr(Text), textLen, ByVal VarPtr(tmpArr(0)), tmpLen) * 2
        If tmpLen > 0 Then
            If UBound(tmpArr) <> tmpLen Then ReDim Preserve tmpArr(tmpLen - 1)
            Private_UTF8toUTF16 = CStr(tmpArr)
        End If
    End If
End Function
Public Property Get RightToLeft() As Boolean
Attribute RightToLeft.VB_ProcData.VB_Invoke_Property = ";Behavior"
Attribute RightToLeft.VB_UserMemId = -611
    RightToLeft = m_RightToLeft
End Property
Public Property Let RightToLeft(ByVal NewValue As Boolean)
    If NewValue <> m_RightToLeft Then
        m_RightToLeft = NewValue
        Private_Init
        If Not blnDesignTime Then Else PropertyChanged "RightToLeft"
    End If
End Property
Public Function SaveFile(ByRef Filename As String, Optional ByVal ByteOrderMark As UniTextBOM = [No BOM / UTF-8], Optional OverwriteExisting As Boolean = True) As Boolean
    Dim bytFile() As Byte, lngUTF32() As Long
    Dim bytA As Byte, lngA As Long, lngB As Long, lngChar As Long, lngMax As Long
    Dim lngFile As Long, lngWrote As Long, udtO As OVERLAPPED
    ' make sure we have a filename
    If LenB(Filename) Then
        ' make sure we have something to save
        If Me.Length Then
            ' see whether we may overwrite a file
            If OverwriteExisting Then
                ' GENERIC_WRITE, NO SHARE, CREATE_ALWAYS, NORMAL (no OVERLAPPED &H40000000)
                lngFile = CreateFileW(StrPtr(Filename), &H40000000, 0&, 0&, 2&, &H80&, 0&)
            Else
                ' GENERIC_WRITE, NO SHARE, CREATE_NEW, NORMAL (no OVERLAPPED &H40000000)
                lngFile = CreateFileW(StrPtr(Filename), &H40000000, 0&, 0&, 1&, &H80&, 0&)
            End If
            If lngFile Then
                ' generate data to save
                Select Case ByteOrderMark
                    Case [No BOM / ANSI]
                        bytFile = Private_UTF16toFCP(Me.Text)
                        WriteFile lngFile, bytFile(0), UBound(bytFile) + 1, lngWrote, udtO
                    Case [No BOM / UTF-8]
                        bytFile = Private_UTF16toUTF8(Me.Text)
                        WriteFile lngFile, bytFile(0), UBound(bytFile) + 1, lngWrote, udtO
                    Case [UTF-8 BOM]
                        bytFile = UTF8save & Private_UTF16toUTF8(Me.Text)
                        WriteFile lngFile, bytFile(0), UBound(bytFile) + 1, lngWrote, udtO
                    Case [UTF-7 BOM]
                        bytFile = StrConv("+/v8-", vbFromUnicode) & Private_UTF16toUTF7(Me.Text)
                        WriteFile lngFile, bytFile(0), UBound(bytFile) + 1, lngWrote, udtO
                    Case [UTF-16 little endian]
                        bytFile = UTF16LE & Me.Text
                        WriteFile lngFile, bytFile(0), UBound(bytFile) + 1, lngWrote, udtO
                    Case [UTF-16 big endian]
                        bytFile = UTF16LE & Me.Text
                        For lngA = 0 To UBound(bytFile) - 1 Step 2
                            bytA = bytFile(lngA)
                            bytFile(lngA) = bytFile(lngA + 1)
                            bytFile(lngA + 1) = bytA
                        Next lngA
                        WriteFile lngFile, bytFile(0), UBound(bytFile) + 1, lngWrote, udtO
                    ' http://svn.mysql.com/svnpublic/connector-odbc3/tags/5.1.0-alpha/driver/unicode_transcode.c
                    Case [UTF-32 little endian]
                        bytFile = UTF16LE & Me.Text
                        lngMax = UBound(bytFile)
                        ' reserve space for save
                        ReDim lngUTF32(lngMax)
                        Do While lngA < lngMax
                            lngChar = bytFile(lngA) Or (bytFile(lngA + 1) * &H100&)
                            If lngChar < &HD800& Or lngChar > &HDBFF& Then
                                lngUTF32(lngB) = lngChar
                                lngA = lngA + 2
                                lngB = lngB + 1
                            Else
                                lngUTF32(lngB) = &H10000 + ((lngChar And &H3FF&) * 1024&)
                                lngChar = bytFile(lngA + 2) Or (bytFile(lngA + 3) * &H100&)
                                ' validate character; we ignore the character entirely if it is in invalid range
                                If lngChar >= &HDC00& And lngChar <= &HDFFF& Then
                                    lngUTF32(lngB) = lngUTF32(lngB) Or (lngChar And &H3FF&)
                                    lngB = lngB + 1
                                End If
                                lngA = lngA + 4
                            End If
                        Loop
                        If lngB Then
                            'ReDim Preserve lngUTF32(lngB - 1)
                            WriteFile lngFile, lngUTF32(0), lngB * 4&, lngWrote, udtO
                        End If
                    Case [UTF-32 big endian]
                        bytFile = UTF16LE & Me.Text
                        lngMax = UBound(bytFile)
                        ' reserve space for save
                        ReDim lngUTF32(lngMax)
                        Do While lngA < lngMax
                            lngChar = bytFile(lngA) Or (bytFile(lngA + 1) * &H100&)
                            If lngChar < &HD800& Or lngChar > &HDBFF& Then
                                If (bytFile(lngA) And &H80) = 0 Then
                                    lngUTF32(lngB) = (bytFile(lngA) * &H1000000) Or (bytFile(lngA + 1) * &H10000)
                                Else
                                    lngUTF32(lngB) = &H80000000 Or ((bytFile(lngA) And &H7F&) * &H1000000) Or (bytFile(lngA + 1) * &H10000)
                                End If
                                lngA = lngA + 2
                                lngB = lngB + 1
                            Else
                                lngChar = &H10000 + (lngChar And &H3FF&) * 1024&
                                If (lngChar And &H80) = 0 Then
                                    lngUTF32(lngB) = (lngChar And &HFF&) * &H1000000 Or _
                                        (lngChar And &HFF00&) * &H100& Or _
                                        (lngChar And &HFF0000) \ &H100&
                                Else
                                    lngUTF32(lngB) = &H80000000 Or (lngChar And &H7F&) * &H1000000 Or _
                                        (lngChar And &HFF00&) * &H100& Or _
                                        (lngChar And &HFF0000) \ &H100&
                                End If
                                lngChar = bytFile(lngA + 2) Or (bytFile(lngA + 3) * &H100&)
                                ' validate character; we ignore the character entirely if it is in invalid range
                                If lngChar >= &HDC00& And lngChar <= &HDFFF& Then
                                    If (bytFile(lngA + 2) And &H80) = 0 Then
                                        lngChar = (bytFile(lngA + 2) * &H1000000) Or (bytFile(lngA + 3) * &H10000)
                                    Else
                                        lngChar = &H80000000 Or ((bytFile(lngA + 2) And &H7F&) * &H1000000) Or (bytFile(lngA + 3) * &H10000)
                                    End If
                                    lngUTF32(lngB) = lngUTF32(lngB) Or (lngChar And &HFF030000)
                                    lngB = lngB + 1
                                End If
                                lngA = lngA + 4
                            End If
                        Loop
                        If lngB Then
                            'ReDim Preserve lngUTF32(lngB - 1)
                            WriteFile lngFile, lngUTF32(0), lngB * 4&, lngWrote, udtO
                        End If
                End Select
                CloseHandle lngFile
                ' set BOM information
                m_BOM = ByteOrderMark
                ' success
                SaveFile = True
            End If
        End If
    End If
End Function
Public Property Get ScrollBars() As ScrollBarConstants
Attribute ScrollBars.VB_ProcData.VB_Invoke_Property = ";Behavior"
    ScrollBars = m_ScrollBars
End Property
Public Property Let ScrollBars(ByVal NewValue As ScrollBarConstants)
    ' only change if really changed
    If m_ScrollBars <> NewValue Then
        m_ScrollBars = NewValue
        Private_Init
    End If
End Property
Public Property Get ScrollHorizontal() As Long
Attribute ScrollHorizontal.VB_MemberFlags = "400"
    If m_hWnd <> 0 And (m_ScrollBars = vbHorizontal Or m_ScrollBars = vbBoth) Then
        ScrollHorizontal = GetScrollPos(m_hWnd, SBS_HORZ)
    End If
End Property
Public Property Let ScrollHorizontal(ByVal NewValue As Long)
    If m_hWnd <> 0 And (m_ScrollBars = vbHorizontal Or m_ScrollBars = vbBoth) Then
        If NewValue >= 0& And NewValue <= &H7FFF& Then
            If SetScrollPos(m_hWnd, SBS_HORZ, NewValue, -1&) <> -1& Then
                PostMessageW m_hWnd, WM_HSCROLL, SB_THUMBPOSITION Or (&H10000 * NewValue), 0&
            End If
        End If
    End If
End Property
Public Sub ScrollToCaret()
    If m_hWnd Then SendMessageW m_hWnd, EM_SCROLLCARET, 0&, ByVal 0&
End Sub
Public Property Get ScrollVertical() As Long
Attribute ScrollVertical.VB_MemberFlags = "400"
    If m_hWnd <> 0 And (m_ScrollBars = vbVertical Or m_ScrollBars = vbBoth) Then
        ScrollVertical = GetScrollPos(m_hWnd, SBS_VERT)
    End If
End Property
Public Property Let ScrollVertical(ByVal NewValue As Long)
    If m_hWnd <> 0 And (m_ScrollBars = vbVertical Or m_ScrollBars = vbBoth) Then
        If NewValue >= 0& And NewValue <= &H7FFF& Then
            If SetScrollPos(m_hWnd, SBS_VERT, NewValue, -1&) <> -1& Then
                PostMessageW m_hWnd, WM_VSCROLL, SB_THUMBPOSITION Or (&H10000 * NewValue), 0&
            End If
        End If
    End If
End Property
Public Function SelLength() As Long
    Dim lngStart As Long, lngEnd As Long
    If m_hWnd Then
        SendMessageW m_hWnd, EM_GETSEL, VarPtr(lngStart), lngEnd
        SelLength = lngEnd - lngStart
    End If
End Function
Public Function SelStart() As Long
    If m_hWnd Then SendMessageW m_hWnd, EM_GETSEL, VarPtr(SelStart), ByVal 0&
End Function
Public Property Get SelText() As String
Attribute SelText.VB_ProcData.VB_Invoke_Property = ";Text"
Attribute SelText.VB_MemberFlags = "400"
    Dim lngStart As Long, lngEnd As Long, lngLen As Long, lngMem As Long, lngHandle As Long, bytText() As Byte
    If m_hWnd Then
        SendMessageW m_hWnd, EM_GETSEL, VarPtr(lngStart), lngEnd
        lngLen = (lngEnd - lngStart) * 2
        If lngLen Then
            lngMem = SendMessageW(m_hWnd, EM_GETHANDLE, 0&, ByVal 0&)
            If lngMem Then
                lngHandle = LocalLock(lngMem)
                ReDim bytText(lngLen - 1)
                CopyMemory bytText(0), ByVal lngHandle + lngStart * 2, lngLen
                LocalUnlock lngHandle
                SelText = CStr(bytText)
                Erase bytText
            End If
        End If
    End If
End Property
Public Property Let SelText(ByRef NewValue As String)
    If m_hWnd Then SendMessageW m_hWnd, EM_REPLACESEL, -1&, ByVal StrPtr(NewValue)
End Property
Public Sub SetSel(ByVal SelStart As Long, ByVal SelEnd As Long)
    If m_hWnd Then SendMessageW m_hWnd, EM_SETSEL, SelStart, ByVal SelEnd
End Sub
Public Property Get Text() As String
    Dim lngLen As Long
    If m_hWnd Then
        lngLen = SendMessageW(m_hWnd, WM_GETTEXTLENGTH, 0&, ByVal 0&) * 2 + 1
        If lngLen > 1 Then
            ReDim Preserve m_bytText(lngLen)
            lngLen = SendMessageW(m_hWnd, WM_GETTEXT, lngLen, ByVal VarPtr(m_bytText(0))) * 2 - 1
            If lngLen >= 0 Then
                ReDim Preserve m_bytText(lngLen)
                Text = m_bytText
            End If
        End If
    Else
        Text = m_Text
    End If
End Property
Public Property Let Text(ByRef NewValue As String)
Attribute Text.VB_ProcData.VB_Invoke_PropertyPut = ";Text"
Attribute Text.VB_UserMemId = -517
Attribute Text.VB_MemberFlags = "1624"
    If m_hWnd Then
        SendMessageW m_hWnd, WM_SETTEXT, 0&, ByVal StrPtr(NewValue)
    Else
        m_Text = NewValue
    End If
End Property
Friend Function TranslateAccel(pMsg As MSG) As Boolean
    Dim pOleObject As IOleObject
    Dim pOleControlSite As IOleControlSite
    Dim lngShiftState As Long, bytKeyState(255) As Byte, bytOldState As Byte, intChar As Integer
    
    If GetFocus <> m_hWnd Then SetFocus m_hWnd  'Private_WndEventFocus:
    
    Select Case pMsg.message
        Case WM_KEYDOWN, WM_KEYUP
            Select Case pMsg.wParam
                Case vbKeyTab
                    lngShiftState = Private_GetShiftState
                    ' Ctrl + Tab & Shift + Tab move focus out of control
                    If (lngShiftState And vbCtrlMask) = vbCtrlMask Or (lngShiftState And vbShiftMask) = vbShiftMask Then
                        Set pOleObject = Me
                        Set pOleControlSite = pOleObject.GetClientSite
                        If Not pOleControlSite Is Nothing Then
                            pOleControlSite.TranslateAccelerator VarPtr(pMsg), lngShiftState And vbShiftMask
                        End If
                    Else
                        ' hack Ctrl key so that the tab works
                        GetKeyboardState bytKeyState(0)
                        bytOldState = bytKeyState(vbKeyControl)
                        bytKeyState(vbKeyControl) = bytKeyState(vbKeyTab)
                        SetKeyboardState bytKeyState(0)
                        ' send tab
                        SendMessageW m_hWnd, pMsg.message, pMsg.wParam, pMsg.lParam
                        ' restore original Ctrl key state
                        bytKeyState(vbKeyControl) = bytOldState
                        SetKeyboardState bytKeyState(0)
                    End If
                    ' Ignore the message
                    TranslateAccel = True
                Case vbKeyReturn
                    If m_MultiLine Then
                        ' Check whether the control processes the Enter key
                        SendMessageW m_hWnd, pMsg.message, pMsg.wParam, pMsg.lParam
                        ' for some reason we do not get WM_CHAR message so here we have a special manual handling for enter key
                        If pMsg.message = WM_KEYDOWN And Not blnDesignTime Then
                            intChar = vbKeyReturn
                            RaiseEvent KeyPress(intChar)
                            If intChar = vbKeyReturn Then
                                SendMessageW m_hWnd, EM_REPLACESEL, -1&, ByVal StrPtr(vbNewLine)
                            ElseIf intChar <> 0 Then
                                SendMessageW m_hWnd, EM_REPLACESEL, -1&, ByVal StrPtr(ChrW$(intChar))
                            End If
                        End If
                        ' Ignore the message
                        TranslateAccel = True
                    End If
                Case vbKeyEscape
                    If m_MultiLine Then
                        SendMessageW m_hWnd, pMsg.message, pMsg.wParam, pMsg.lParam
                        If pMsg.message = WM_KEYDOWN Then RaiseEvent KeyPress(vbKeyEscape)
                        ' Ignore the message
                        TranslateAccel = True
                    End If
                Case vbKeyUp, vbKeyDown, vbKeyLeft, vbKeyRight, vbKeyHome, _
                     vbKeyEnd, vbKeyPageDown, vbKeyPageUp
                    ' Navigation keys filter
                    SendMessageW m_hWnd, pMsg.message, pMsg.wParam, pMsg.lParam
                    TranslateAccel = True
                Case Else
                    ' if locked prevent every key
                    If m_Locked Then TranslateAccel = True
            End Select
        Case WM_CHAR
            ' If the control is read-only
            ' eat every char
            If m_Locked Or Not m_Enabled Then TranslateAccel = True
    End Select
End Function
Public Sub Undo()
    If m_hWnd Then SendMessageW m_hWnd, WM_UNDO, 0&, ByVal 0&
End Sub
Public Property Get UseEvents() As Boolean
Attribute UseEvents.VB_ProcData.VB_Invoke_Property = ";Behavior"
    UseEvents = m_UseEvents
End Property
Public Property Let UseEvents(ByVal NewValue As Boolean)
    m_UseEvents = NewValue
End Property
Private Sub m_Font_FontChanged(ByVal PropertyName As String)
    Dim objFont As IFont
    If m_hWnd Then
        If m_Font Is Nothing Then Exit Sub
        Set objFont = m_Font
        SendMessageW m_hWnd, WM_SETFONT, objFont.hFont, ByVal 0&
        RaiseEvent FontChanged
    End If
End Sub
Private Sub UserControl_AmbientChanged(PropertyName As String)
    ' see if container scalemode has changed
    If LenB(PropertyName) = 20 Then If PropertyName = "ScaleUnits" Then m_ContainerScaleMode = Private_GetContainerScaleMode
End Sub
Private Sub UserControl_EnterFocus()
    If blnDesignTime Then m_Focus = True
    Private_SetIPAO
    If m_hWnd Then If GetFocus <> m_hWnd Then SetFocus m_hWnd
End Sub
Private Sub UserControl_ExitFocus()
    If blnDesignTime Then PropertyChanged "Text": m_Focus = False
End Sub
Private Sub UserControl_Initialize()
    ' byte-order marks
    UTF32BE = vbNullChar & ChrW$(&HFFFE&)
    UTF32LE = ChrW$(&HFEFF&) & vbNullChar
    UTF16BE = ChrW$(&HFFFE&)
    UTF16LE = ChrW$(&HFEFF&)
    UTF8 = ChrW$(&HEF&) & ChrW$(&HBB&) & ChrW$(&HBF&)
    UTF7 = StrConv("+/v8", vbFromUnicode)
    UTF8save = StrConv(UTF8, vbFromUnicode)
    UTF7save = StrConv("+/v8-", vbFromUnicode)
    If Not App.LogMode = 0 Then
        ' this will fix a problem with some versions of comctl32.dll when using XP Themes
        ' http://www.vbaccelerator.com/home/vb/Code/Libraries/XP_Visual_Styles/Preventing_Crashes_at_Shutdown/article.asp
        m_Shell32 = GetModuleHandleA("shell32.dll")
        If m_Shell32 = 0 Then m_Shell32 = LoadLibraryA("shell32.dll"): m_FreeShell32 = True
    End If
    ' see if mouse tracking is supported (WM_MOUSELEAVE)
    m_TrackUser32 = Private_IsFunctionSupported("TrackMouseEvent", "user32.dll")
    If Not m_TrackUser32 Then m_TrackComCtl = Private_IsFunctionSupported("_TrackMouseEvent", "comctl32.dll")
End Sub
Private Sub UserControl_InitProperties()
    ' design time?
    blnDesignTime = (Not Ambient.UserMode)
    If Not blnDesignTime Then UniText_Init m_IPAO, Me
    ' container scalemode
    m_ContainerScaleMode = Private_GetContainerScaleMode
    ' default property values
    m_Appearance = [Classic 3D]
    If UserControl.BackColor < 0 Then m_BackClr = GetSysColor(UserControl.BackColor And &HFF&) Else m_BackClr = UserControl.BackColor
    m_BackClrBrush = CreateSolidBrush(m_BackClr)
    m_BorderStyle = [3D]
    m_Enabled = True
    m_FCP = GetACP
    m_FileCodepage = [System Codepage]
    Set m_Font = Ambient.Font
    m_ForeColor = vbWindowText
    If m_ForeColor < 0 Then m_ForeClr = GetSysColor(m_ForeColor And &HFF&) Else m_ForeClr = m_ForeColor
    m_HideSelection = True
    m_MultiLine = False
    m_ScrollBars = vbSBNone
    m_UseEvents = True
    ' subclass
    If ssc_Subclass(UserControl.hWnd, , 1, , Ambient.UserMode, True) Then
        ssc_AddMsg UserControl.hWnd, MSG_BEFORE, WM_COMMAND, WM_DESTROY, WM_ERASEBKGND, WM_CTLCOLOREDIT, WM_CTLCOLORSTATIC, WM_SETFOCUS
        ssc_AddMsg UserControl.hWnd, MSG_AFTER, WM_COMMAND, WM_PAINT
        If m_TrackUser32 Or m_TrackComCtl Then ssc_AddMsg UserControl.hWnd, MSG_AFTER, WM_MOUSELEAVE
        'Debug.Print Ambient.DisplayName & ": Started subclassing! " & Hex$(UserControl.hWnd)
    Else
        'Debug.Print Ambient.DisplayName & ": Failed to subclass! " & Hex$(UserControl.hWnd)
    End If
    ' initial show
    Private_Init
End Sub
'Private Sub UserControl_OLECompleteDrag(Effect As Long)
'    RaiseEvent OLECompleteDrag(Effect)
'End Sub
'Private Sub UserControl_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
'    RaiseEvent OLEDragDrop(Data, Effect, Button, Shift, X, Y)
'End Sub
'Private Sub UserControl_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
'    RaiseEvent OLEDragOver(Data, Effect, Button, Shift, X, Y, State)
'End Sub
'Private Sub UserControl_OLEGiveFeedback(Effect As Long, DefaultCursors As Boolean)
'    RaiseEvent OLEGiveFeedback(Effect, DefaultCursors)
'End Sub
'Private Sub UserControl_OLESetData(Data As DataObject, DataFormat As Integer)
'    RaiseEvent OLESetData(Data, DataFormat)
'End Sub
'Private Sub UserControl_OLEStartDrag(Data As DataObject, AllowedEffects As Long)
'    RaiseEvent OLEStartDrag(Data, AllowedEffects)
'End Sub
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    ' design time?
    blnDesignTime = (Not Ambient.UserMode)
    If Not blnDesignTime Then UniText_Init m_IPAO, Me
    ' container scalemode
    m_ContainerScaleMode = Private_GetContainerScaleMode
    ' load property values
    m_Alignment = PropBag.ReadProperty("Alignment", vbLeftJustify)
    m_Appearance = PropBag.ReadProperty("Appearance", [Classic 3D])
    UserControl.BackColor = PropBag.ReadProperty("BackColor", vbWindowBackground)
    If UserControl.BackColor < 0 Then m_BackClr = GetSysColor(UserControl.BackColor And &HFF&) Else m_BackClr = UserControl.BackColor
    m_BackClrBrush = CreateSolidBrush(m_BackClr)
    m_BorderStyle = PropBag.ReadProperty("BorderStyle", [3D])
    m_Enabled = PropBag.ReadProperty("Enabled", True)
    UserControl.Enabled = m_Enabled
    m_FileCodepage = PropBag.ReadProperty("FileCodepage", [System Codepage])
    If m_FileCodepage = [System Codepage] Then
        m_FCP = GetACP
    Else
        m_FCP = m_FileCodepage
    End If
    Set m_Font = PropBag.ReadProperty("Font", Ambient.Font)
    m_ForeColor = PropBag.ReadProperty("ForeColor", vbWindowText)
    If m_ForeColor < 0 Then m_ForeClr = GetSysColor(m_ForeColor And &HFF&) Else m_ForeClr = m_ForeColor
    m_HideSelection = PropBag.ReadProperty("HideSelection", True)
    m_Locked = PropBag.ReadProperty("Locked", False)
    m_MaxLength = PropBag.ReadProperty("MaxLength", -1)
    Set UserControl.MouseIcon = PropBag.ReadProperty("MouseIcon", Nothing)
    UserControl.MousePointer = PropBag.ReadProperty("MousePointer", vbDefault)
    m_MultiLine = PropBag.ReadProperty("MultiLine", False)
    m_PasswordChar = PropBag.ReadProperty("PasswordChar", vbNullString)
    m_RightToLeft = PropBag.ReadProperty("RightToLeft", False)
    m_ScrollBars = PropBag.ReadProperty("ScrollBars", vbSBNone)
    m_bytText = PropBag.ReadProperty("Text", vbNullString)
    m_Text = m_bytText
    m_UseEvents = PropBag.ReadProperty("UseEvents", True)
    ' subclass
    If ssc_Subclass(UserControl.hWnd, , 1, , Ambient.UserMode, True) Then
        ssc_AddMsg UserControl.hWnd, MSG_BEFORE, WM_COMMAND, WM_DESTROY, WM_ERASEBKGND, WM_CTLCOLOREDIT, WM_CTLCOLORSTATIC, WM_SETFOCUS
        ssc_AddMsg UserControl.hWnd, MSG_AFTER, WM_COMMAND, WM_PAINT
        If m_TrackUser32 Or m_TrackComCtl Then ssc_AddMsg UserControl.hWnd, MSG_AFTER, WM_MOUSELEAVE
        'Debug.Print Ambient.DisplayName & ": Started subclassing! " & Hex$(UserControl.hWnd)
    Else
        'Debug.Print Ambient.DisplayName & ": Failed to subclass! " & Hex$(UserControl.hWnd)
    End If
    ' initial show
    Private_Init
End Sub
Private Sub UserControl_Resize()
    ' update rectangle
    m_RC.Right = UserControl.ScaleWidth
    m_RC.Bottom = UserControl.ScaleHeight
    If m_Appearance = [Classic 3D] Then
        ' exit if missing
        If m_hWnd Then
            ' borderstyle value tells us how deep we go...
            MoveWindow m_hWnd, 0, 0, m_RC.Right, m_RC.Bottom, -1&  '********* by lia for window theme look *******' restore
            'MoveWindow m_hWnd, m_BorderStyle, m_BorderStyle, m_RC.Right - m_BorderStyle * 2, m_RC.Bottom - m_BorderStyle * 2, -1&
        End If
    Else
        If m_hWnd Then
            MoveWindow m_hWnd, 0, 0, UserControl.ScaleWidth, UserControl.ScaleHeight, -1&
        End If
    End If
End Sub
Private Sub UserControl_Terminate()
    UniText_Terminate m_IPAO
    ' remove backcolor
    If m_BackClrBrush Then DeleteObject m_BackClrBrush
    ' remove textbox
    If m_hWnd Then
        ssc_UnSubclass m_hWnd
        m_Text = Me.Text
        DestroyWindow m_hWnd
        m_hWnd = 0
    End If
    ' unload shell32 if it was loaded by this control
    If m_FreeShell32 Then FreeLibrary m_Shell32
End Sub
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    ' save settings
    PropBag.WriteProperty "Alignment", m_Alignment
    PropBag.WriteProperty "Appearance", m_Appearance
    PropBag.WriteProperty "BackColor", UserControl.BackColor
    PropBag.WriteProperty "BorderStyle", m_BorderStyle
    PropBag.WriteProperty "Enabled", m_Enabled
    PropBag.WriteProperty "FileCodepage", m_FileCodepage
    PropBag.WriteProperty "Font", m_Font
    PropBag.WriteProperty "ForeColor", m_ForeColor
    PropBag.WriteProperty "HideSelection", m_HideSelection
    PropBag.WriteProperty "Locked", m_Locked
    PropBag.WriteProperty "MaxLength", m_MaxLength
    PropBag.WriteProperty "MouseIcon", UserControl.MouseIcon
    PropBag.WriteProperty "MousePointer", UserControl.MousePointer
    PropBag.WriteProperty "MultiLine", m_MultiLine
    PropBag.WriteProperty "PasswordChar", m_PasswordChar
    PropBag.WriteProperty "RightToLeft", m_RightToLeft
    PropBag.WriteProperty "ScrollBars", m_ScrollBars
    m_bytText = Me.Text
    PropBag.WriteProperty "Text", m_bytText
    PropBag.WriteProperty "UseEvents", m_UseEvents
End Sub

'-SelfSub code------------------------------------------------------------------------------------
'-The following routines are exclusively for the ssc_Subclass routines----------------------------
Private Function ssc_Subclass(ByVal lng_hWnd As Long, _
                    Optional ByVal lParamUser As Long = 0, _
                    Optional ByVal nOrdinal As Long = 1, _
                    Optional ByVal oCallback As Object = Nothing, _
                    Optional ByVal bIdeSafety As Boolean = True, _
                    Optional ByRef bUnicode As Boolean = False, _
                    Optional ByVal bIsAPIwindow As Boolean = False) As Boolean 'Subclass the specified window handle

    '*************************************************************************************************
    '* lng_hWnd   - Handle of the window to subclass
    '* lParamUser - Optional, user-defined callback parameter
    '* nOrdinal   - Optional, ordinal index of the callback procedure. 1 = last private method, 2 = second last private method, etc.
    '* oCallback  - Optional, the object that will receive the callback. If undefined, callbacks are sent to this object's instance
    '* bIdeSafety - Optional, enable/disable IDE safety measures. There is not reason to set this to False
    '* bUnicode - Optional, if True, Unicode API calls should be made to the window vs ANSI calls
    '*            Parameter is byRef and its return value should be checked to know if ANSI to be used or not
    '* bIsAPIwindow - Optional, if True DestroyWindow will be called if IDE ENDs
    '*****************************************************************************************
    '** Subclass.asm - subclassing thunk
    '**
    '** Paul_Caton@hotmail.com
    '** Copyright free, use and abuse as you see fit.
    '**
    '** v2.0 Re-write by LaVolpe, based mostly on Paul Caton's original thunks....... 20070720
    '** .... Reorganized & provided following additional logic
    '** ....... Unsubclassing only occurs after thunk is no longer recursed
    '** ....... Flag used to bypass callbacks until unsubclassing can occur
    '** ....... Timer used as delay mechanism to free thunk memory afer unsubclassing occurs
    '** .............. Prevents crash when one window subclassed multiple times
    '** .............. More END safe, even if END occurs within the subclass procedure
    '** ....... Added ability to destroy API windows when IDE terminates
    '** ....... Added auto-unsubclass when WM_NCDESTROY received
    '*****************************************************************************************
    ' Subclassing procedure must be declared identical to the one at the end of this class (Sample at Ordinal #1)

    Dim z_Sc(0 To IDX_UNICODE) As Long                 'Thunk machine-code initialised here
    
    Const SUB_NAME      As String = "ssc_Subclass"     'This routine's name
    Const CODE_LEN      As Long = 4 * IDX_UNICODE + 4  'Thunk length in bytes
    Const PAGE_RWX      As Long = &H40&                'Allocate executable memory
    Const MEM_COMMIT    As Long = &H1000&              'Commit allocated memory
    Const MEM_RELEASE   As Long = &H8000&              'Release allocated memory flag
    Const GWL_WNDPROC   As Long = -4                   'SetWindowsLong WndProc index
    Const WNDPROC_OFF   As Long = &H60                 'Thunk offset to the WndProc execution address
    Const MEM_LEN       As Long = CODE_LEN + (8 * (MSG_ENTRIES + 1)) 'Bytes to allocate per thunk, data + code + msg tables
    
  ' This is the complete listing of thunk offset values and what they point/relate to.
  ' Those rem'd out are used elsewhere or are initialized in Declarations section
  
  'Const IDX_RECURSION  As Long = 0     'Thunk data index of callback recursion count
  'Const IDX_SHUTDOWN   As Long = 1     'Thunk data index of the termination flag
  'Const IDX_INDEX      As Long = 2     'Thunk data index of the subclassed hWnd
   Const IDX_EBMODE     As Long = 3     'Thunk data index of the EbMode function address
   Const IDX_CWP        As Long = 4     'Thunk data index of the CallWindowProc function address
   Const IDX_SWL        As Long = 5     'Thunk data index of the SetWindowsLong function address
   Const IDX_FREE       As Long = 6     'Thunk data index of the VirtualFree function address
   Const IDX_BADPTR     As Long = 7     'Thunk data index of the IsBadCodePtr function address
   Const IDX_OWNER      As Long = 8     'Thunk data index of the Owner object's vTable address
  'Const IDX_PREVPROC   As Long = 9     'Thunk data index of the original WndProc
   Const IDX_CALLBACK   As Long = 10    'Thunk data index of the callback method address
  'Const IDX_BTABLE     As Long = 11    'Thunk data index of the Before table
  'Const IDX_ATABLE     As Long = 12    'Thunk data index of the After table
  'Const IDX_PARM_USER  As Long = 13    'Thunk data index of the User-defined callback parameter data index
   Const IDX_DW         As Long = 14    'Thunk data index of the DestroyWinodw function address
   Const IDX_ST         As Long = 15    'Thunk data index of the SetTimer function address
   Const IDX_KT         As Long = 16    'Thunk data index of the KillTimer function address
   Const IDX_EBX_TMR    As Long = 20    'Thunk code patch index of the thunk data for the delay timer
   Const IDX_EBX        As Long = 26    'Thunk code patch index of the thunk data
  'Const IDX_UNICODE    As Long = xx    'Must be UBound(subclass thunkdata)+1; index for unicode support
    
    Dim z_ScMem       As Long           'Thunk base address
    Dim nAddr         As Long
    Dim nID           As Long
    Dim nMyID         As Long
    Dim bIDE          As Boolean

    If IsWindow(lng_hWnd) = 0 Then      'Ensure the window handle is valid
        zError SUB_NAME, "Invalid window handle"
        Exit Function
    End If
    
    nMyID = GetCurrentProcessId                         'Get this process's ID
    GetWindowThreadProcessId lng_hWnd, nID              'Get the process ID associated with the window handle
    If nID <> nMyID Then                                'Ensure that the window handle doesn't belong to another process
        zError SUB_NAME, "Window handle belongs to another process"
        Exit Function
    End If
    
    If oCallback Is Nothing Then Set oCallback = Me     'If the user hasn't specified the callback owner
    
    nAddr = zAddressOf(oCallback, nOrdinal)             'Get the address of the specified ordinal method
    If nAddr = 0 Then                                   'Ensure that we've found the ordinal method
        zError SUB_NAME, "Callback method not found"
        Exit Function
    End If
        
    z_ScMem = VirtualAlloc(0, MEM_LEN, MEM_COMMIT, PAGE_RWX) 'Allocate executable memory
    
    If z_ScMem <> 0 Then                                  'Ensure the allocation succeeded
    
      If z_scFunk Is Nothing Then Set z_scFunk = New Collection 'If this is the first time through, do the one-time initialization
      On Error GoTo CatchDoubleSub                              'Catch double subclassing
        z_scFunk.Add z_ScMem, "h" & lng_hWnd                    'Add the hWnd/thunk-address to the collection
      On Error GoTo 0
      
   'z_Sc (0) thru z_Sc(17) are used as storage for the thunks & IDX_ constants above relate to these thunk positions which are filled in below
    z_Sc(18) = &HD231C031: z_Sc(19) = &HBBE58960: z_Sc(21) = &H21E8F631: z_Sc(22) = &HE9000001: z_Sc(23) = &H12C&: z_Sc(24) = &HD231C031: z_Sc(25) = &HBBE58960: z_Sc(27) = &H3FFF631: z_Sc(28) = &H75047339: z_Sc(29) = &H2873FF23: z_Sc(30) = &H751C53FF: z_Sc(31) = &HC433913: z_Sc(32) = &H53FF2274: z_Sc(33) = &H13D0C: z_Sc(34) = &H18740000: z_Sc(35) = &H875C085: z_Sc(36) = &H820443C7: z_Sc(37) = &H90000000: z_Sc(38) = &H87E8&: z_Sc(39) = &H22E900: z_Sc(40) = &H90900000: z_Sc(41) = &H2C7B8B4A: z_Sc(42) = &HE81C7589: z_Sc(43) = &H90&: z_Sc(44) = &H75147539: z_Sc(45) = &H6AE80F: z_Sc(46) = &HD2310000: z_Sc(47) = &HE8307B8B: z_Sc(48) = &H7C&: z_Sc(49) = &H7D810BFF: z_Sc(50) = &H8228&: z_Sc(51) = &HC7097500: z_Sc(52) = &H80000443: z_Sc(53) = &H90900000: z_Sc(54) = &H44753339: z_Sc(55) = &H74047339: z_Sc(56) = &H2473FF3F: z_Sc(57) = &HFFFFFC68
    z_Sc(58) = &H2475FFFF: z_Sc(59) = &H811453FF: z_Sc(60) = &H82047B: z_Sc(61) = &HC750000: z_Sc(62) = &H74387339: z_Sc(63) = &H2475FF07: z_Sc(64) = &H903853FF: z_Sc(65) = &H81445B89: z_Sc(66) = &H484443: z_Sc(67) = &H73FF0000: z_Sc(68) = &H646844: z_Sc(69) = &H56560000: z_Sc(70) = &H893C53FF: z_Sc(71) = &H90904443: z_Sc(72) = &H10C261: z_Sc(73) = &H53E8&: z_Sc(74) = &H3075FF00: z_Sc(75) = &HFF2C75FF: z_Sc(76) = &H75FF2875: z_Sc(77) = &H2473FF24: z_Sc(78) = &H891053FF: z_Sc(79) = &H90C31C45: z_Sc(80) = &H34E30F8B: z_Sc(81) = &H1078C985: z_Sc(82) = &H4C781: z_Sc(83) = &H458B0000: z_Sc(84) = &H75AFF228: z_Sc(85) = &H90909023: z_Sc(86) = &H8D144D8D: z_Sc(87) = &H8D503443: z_Sc(88) = &H75FF1C45: z_Sc(89) = &H2C75FF30: z_Sc(90) = &HFF2875FF: z_Sc(91) = &H51502475: z_Sc(92) = &H2073FF52: z_Sc(93) = &H902853FF: z_Sc(94) = &H909090C3: z_Sc(95) = &H74447339: z_Sc(96) = &H4473FFF7
    z_Sc(97) = &H4053FF56: z_Sc(98) = &HC3447389: z_Sc(99) = &H89285D89: z_Sc(100) = &H45C72C75: z_Sc(101) = &H800030: z_Sc(102) = &H20458B00: z_Sc(103) = &H89145D89: z_Sc(104) = &H81612445: z_Sc(105) = &H4C4&: z_Sc(106) = &H1862FF00

    ' cache callback related pointers & offsets
      z_Sc(IDX_EBX) = z_ScMem                                                 'Patch the thunk data address
      z_Sc(IDX_EBX_TMR) = z_ScMem                                             'Patch the thunk data address
      z_Sc(IDX_INDEX) = lng_hWnd                                              'Store the window handle in the thunk data
      z_Sc(IDX_BTABLE) = z_ScMem + CODE_LEN                                   'Store the address of the before table in the thunk data
      z_Sc(IDX_ATABLE) = z_ScMem + CODE_LEN + ((MSG_ENTRIES + 1) * 4)         'Store the address of the after table in the thunk data
      z_Sc(IDX_OWNER) = ObjPtr(oCallback)                                     'Store the callback owner's object address in the thunk data
      z_Sc(IDX_CALLBACK) = nAddr                                              'Store the callback address in the thunk data
      z_Sc(IDX_PARM_USER) = lParamUser                                        'Store the lParamUser callback parameter in the thunk data
      
      ' validate unicode request & cache unicode usage
      If bUnicode Then bUnicode = (IsWindowUnicode(lng_hWnd) <> 0&)
      z_Sc(IDX_UNICODE) = bUnicode                                            'Store whether the window is using unicode calls or not
      
      ' get function pointers for the thunk
      If bIdeSafety = True Then                                               'If the user wants IDE protection
          Debug.Assert zInIDE(bIDE)
          If bIDE = True Then z_Sc(IDX_EBMODE) = zFnAddr("vba6", "EbMode", bUnicode) 'Store the EbMode function address in the thunk data
                                                        '^^ vb5 users, change vba6 to vba5
      End If
      If bIsAPIwindow Then                                                    'If user wants DestroyWindow sent should IDE end
          z_Sc(IDX_DW) = zFnAddr("user32", "DestroyWindow", bUnicode)
      End If
      z_Sc(IDX_FREE) = zFnAddr("kernel32", "VirtualFree", bUnicode)           'Store the VirtualFree function address in the thunk data
      z_Sc(IDX_BADPTR) = zFnAddr("kernel32", "IsBadCodePtr", bUnicode)        'Store the IsBadCodePtr function address in the thunk data
      z_Sc(IDX_ST) = zFnAddr("user32", "SetTimer", bUnicode)                  'Store the SetTimer function address in the thunk data
      z_Sc(IDX_KT) = zFnAddr("user32", "KillTimer", bUnicode)                 'Store the KillTimer function address in the thunk data
      
      If bUnicode Then
          z_Sc(IDX_CWP) = zFnAddr("user32", "CallWindowProcW", bUnicode)      'Store CallWindowProc function address in the thunk data
          z_Sc(IDX_SWL) = zFnAddr("user32", "SetWindowLongW", bUnicode)       'Store the SetWindowLong function address in the thunk data
          RtlMoveMemory z_ScMem, VarPtr(z_Sc(0)), CODE_LEN                    'Copy the thunk code/data to the allocated memory
          z_Sc(IDX_PREVPROC) = SetWindowLongW(lng_hWnd, GWL_WNDPROC, z_ScMem + WNDPROC_OFF) 'Set the new WndProc, return the address of the original WndProc
      Else
          z_Sc(IDX_CWP) = zFnAddr("user32", "CallWindowProcA", bUnicode)      'Store CallWindowProc function address in the thunk data
          z_Sc(IDX_SWL) = zFnAddr("user32", "SetWindowLongA", bUnicode)       'Store the SetWindowLong function address in the thunk data
          RtlMoveMemory z_ScMem, VarPtr(z_Sc(0)), CODE_LEN                    'Copy the thunk code/data to the allocated memory
          z_Sc(IDX_PREVPROC) = SetWindowLongA(lng_hWnd, GWL_WNDPROC, z_ScMem + WNDPROC_OFF) 'Set the new WndProc, return the address of the original WndProc
      End If
      If z_Sc(IDX_PREVPROC) = 0 Then                                          'Ensure the new WndProc was set correctly
          zError SUB_NAME, "SetWindowLong failed, error #" & Err.LastDllError
          GoTo ReleaseMemory
      End If
      'Store the original WndProc address in the thunk data
      RtlMoveMemory z_ScMem + IDX_PREVPROC * 4, VarPtr(z_Sc(IDX_PREVPROC)), 4&
      ssc_Subclass = True                                                     'Indicate success
      
    Else
        zError SUB_NAME, "VirtualAlloc failed, error: " & Err.LastDllError
        
    End If

 Exit Function                                                                'Exit ssc_Subclass
    
CatchDoubleSub:
 zError SUB_NAME, "Window handle is already subclassed"
      
ReleaseMemory:
      VirtualFree z_ScMem, 0, MEM_RELEASE                                     'ssc_Subclass has failed after memory allocation, so release the memory
      
End Function

'Terminate all subclassing
Private Sub ssc_Terminate()
    ' can be made public, can be removed & zTerminateThunks can be called instead
    zTerminateThunks SubclassThunk
End Sub

'UnSubclass the specified window handle
Private Sub ssc_UnSubclass(ByVal lng_hWnd As Long)
    ' can be made public, can be removed & zUnthunk can be called instead
    zUnThunk lng_hWnd, SubclassThunk
End Sub

'Add the message value to the window handle's specified callback table
Private Sub ssc_AddMsg(ByVal lng_hWnd As Long, ByVal When As eMsgWhen, ParamArray Messages() As Variant)
    
    Dim z_ScMem       As Long                                   'Thunk base address
    
    z_ScMem = zMap_VFunction(lng_hWnd, SubclassThunk)           'Ensure that the thunk hasn't already released its memory
    If z_ScMem Then
      Dim M As Long
      For M = LBound(Messages) To UBound(Messages)
        Select Case VarType(Messages(M))                        ' ensure no strings, arrays, doubles, objects, etc are passed
        Case vbByte, vbInteger, vbLong
            If When And MSG_BEFORE Then                         'If the message is to be added to the before original WndProc table...
              If zAddMsg(Messages(M), IDX_BTABLE, z_ScMem) = False Then 'Add the message to the before table
                When = (When And Not MSG_BEFORE)
              End If
            End If
            If When And MSG_AFTER Then                          'If message is to be added to the after original WndProc table...
              If zAddMsg(Messages(M), IDX_ATABLE, z_ScMem) = False Then 'Add the message to the after table
                When = (When And Not MSG_AFTER)
              End If
            End If
        End Select
      Next
    End If
End Sub

'Delete the message value from the window handle's specified callback table
Private Sub ssc_DelMsg(ByVal lng_hWnd As Long, ByVal When As eMsgWhen, ParamArray Messages() As Variant)
    
    Dim z_ScMem       As Long                                                   'Thunk base address
    
    z_ScMem = zMap_VFunction(lng_hWnd, SubclassThunk)                           'Ensure that the thunk hasn't already released its memory
    If z_ScMem Then
      Dim M As Long
      For M = LBound(Messages) To UBound(Messages)                              ' ensure no strings, arrays, doubles, objects, etc are passed
        Select Case VarType(Messages(M))
        Case vbByte, vbInteger, vbLong
            If When And MSG_BEFORE Then                                         'If the message is to be removed from the before original WndProc table...
              zDelMsg Messages(M), IDX_BTABLE, z_ScMem                          'Remove the message to the before table
            End If
            If When And MSG_AFTER Then                                          'If message is to be removed from the after original WndProc table...
              zDelMsg Messages(M), IDX_ATABLE, z_ScMem                          'Remove the message to the after table
            End If
        End Select
      Next
    End If
End Sub

'Call the original WndProc
Private Function ssc_CallOrigWndProc(ByVal lng_hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    ' can be made public, can be removed if you will not use this in your window procedure
    Dim z_ScMem       As Long                           'Thunk base address
    z_ScMem = zMap_VFunction(lng_hWnd, SubclassThunk)
    If z_ScMem Then                                     'Ensure that the thunk hasn't already released its memory
        If zData(IDX_UNICODE, z_ScMem) Then
            ssc_CallOrigWndProc = CallWindowProcW(zData(IDX_PREVPROC, z_ScMem), lng_hWnd, uMsg, wParam, lParam) 'Call the original WndProc of the passed window handle parameter
        Else
            ssc_CallOrigWndProc = CallWindowProcA(zData(IDX_PREVPROC, z_ScMem), lng_hWnd, uMsg, wParam, lParam) 'Call the original WndProc of the passed window handle parameter
        End If
    End If
End Function

'Get the subclasser lParamUser callback parameter
Private Function zGet_lParamUser(ByVal hWnd_Hook_ID As Long, ByVal vType As eThunkType) As Long
    ' can be removed if you never will retrieve or replace the user-defined parameter
    If vType <> CallbackThunk Then
        Dim z_ScMem       As Long                                       'Thunk base address
        z_ScMem = zMap_VFunction(hWnd_Hook_ID, vType)
        If z_ScMem Then                                                 'Ensure that the thunk hasn't already released its memory
          zGet_lParamUser = zData(IDX_PARM_USER, z_ScMem)               'Get the lParamUser callback parameter
        End If
    End If
End Function

'Let the subclasser lParamUser callback parameter
Private Sub zSet_lParamUser(ByVal hWnd_Hook_ID As Long, ByVal vType As eThunkType, ByVal NewValue As Long)
    ' can be removed if you never will retrieve or replace the user-defined parameter
    If vType <> CallbackThunk Then
        Dim z_ScMem       As Long                                       'Thunk base address
        z_ScMem = zMap_VFunction(hWnd_Hook_ID, vType)
        If z_ScMem Then                                                 'Ensure that the thunk hasn't already released its memory
          zData(IDX_PARM_USER, z_ScMem) = NewValue                      'Set the lParamUser callback parameter
        End If
    End If
End Sub

'Add the message to the specified table of the window handle
Private Function zAddMsg(ByVal uMsg As Long, ByVal nTable As Long, ByVal z_ScMem As Long) As Boolean
      Dim nCount As Long                                                        'Table entry count
      Dim nBase  As Long
      Dim i      As Long                                                        'Loop index
    
      zAddMsg = True
      nBase = zData(nTable, z_ScMem)                                            'Map zData() to the specified table
      
      If uMsg = ALL_MESSAGES Then                                               'If ALL_MESSAGES are being added to the table...
        nCount = ALL_MESSAGES                                                   'Set the table entry count to ALL_MESSAGES
      Else
        
        nCount = zData(0, nBase)                                                'Get the current table entry count
        For i = 1 To nCount                                                     'Loop through the table entries
          If zData(i, nBase) = 0 Then                                           'If the element is free...
            zData(i, nBase) = uMsg                                              'Use this element
            GoTo Bail                                                           'Bail
          ElseIf zData(i, nBase) = uMsg Then                                    'If the message is already in the table...
            GoTo Bail                                                           'Bail
          End If
        Next i                                                                  'Next message table entry
    
        nCount = i                                                             'On drop through: i = nCount + 1, the new table entry count
        If nCount > MSG_ENTRIES Then                                           'Check for message table overflow
          zError "zAddMsg", "Message table overflow. Either increase the value of Const MSG_ENTRIES or use ALL_MESSAGES instead of specific message values"
          zAddMsg = False
          GoTo Bail
        End If
        
        zData(nCount, nBase) = uMsg                                            'Store the message in the appended table entry
      End If
    
      zData(0, nBase) = nCount                                                 'Store the new table entry count
Bail:
End Function

'Delete the message from the specified table of the window handle
Private Sub zDelMsg(ByVal uMsg As Long, ByVal nTable As Long, ByVal z_ScMem As Long)
      Dim nCount As Long                                                        'Table entry count
      Dim nBase  As Long
      Dim i      As Long                                                        'Loop index
    
      nBase = zData(nTable, z_ScMem)                                            'Map zData() to the specified table
    
      If uMsg = ALL_MESSAGES Then                                               'If ALL_MESSAGES are being deleted from the table...
        zData(0, nBase) = 0                                                     'Zero the table entry count
      Else
        nCount = zData(0, nBase)                                                'Get the table entry count
        
        For i = 1 To nCount                                                     'Loop through the table entries
          If zData(i, nBase) = uMsg Then                                        'If the message is found...
            zData(i, nBase) = 0                                                 'Null the msg value -- also frees the element for re-use
            GoTo Bail                                                           'Bail
          End If
        Next i                                                                  'Next message table entry
        
       ' zError "zDelMsg", "Message &H" & Hex$(uMsg) & " not found in table"
      End If
Bail:
End Sub

'-The following routines are used for each of the three types of thunks ----------------------------

'Maps zData() to the memory address for the specified thunk type
Private Function zMap_VFunction(vFuncTarget As Long, _
                                vType As eThunkType, _
                                Optional oCallback As Object, _
                                Optional bIgnoreErrors As Boolean) As Long
    
    Dim thunkCol As Collection
    Dim colID As String
    Dim z_ScMem       As Long         'Thunk base address
    
    If vType = CallbackThunk Then
        Set thunkCol = z_cbFunk
        If oCallback Is Nothing Then Set oCallback = Me
        colID = "h" & ObjPtr(oCallback) & "." & vFuncTarget
    ElseIf vType = HookThunk Then
        Set thunkCol = z_hkFunk
        colID = "h" & vFuncTarget
    ElseIf vType = SubclassThunk Then
        Set thunkCol = z_scFunk
        colID = "h" & vFuncTarget
    Else
        zError "zMap_Vfunction", "Invalid thunk type passed"
        Exit Function
    End If
    
    If thunkCol Is Nothing Then
        zError "zMap_VFunction", "Thunk hasn't been initialized"
    Else
        If thunkCol.Count Then
            On Error GoTo Catch
            z_ScMem = thunkCol(colID)               'Get the thunk address
            If IsBadCodePtr(z_ScMem) Then z_ScMem = 0&
            zMap_VFunction = z_ScMem
        End If
    End If
    Exit Function                                               'Exit returning the thunk address
    
Catch:
    ' error ignored when zUnThunk is called, error handled there
    If Not bIgnoreErrors Then zError "zMap_VFunction", "Thunk type for " & vType & " does not exist"
End Function

' sets/retrieves data at the specified offset for the specified memory address
Private Property Get zData(ByVal nIndex As Long, ByVal z_ScMem As Long) As Long
  RtlMoveMemory VarPtr(zData), z_ScMem + (nIndex * 4), 4
End Property

Private Property Let zData(ByVal nIndex As Long, ByVal z_ScMem As Long, ByVal nValue As Long)
  RtlMoveMemory z_ScMem + (nIndex * 4), VarPtr(nValue), 4
End Property

'Error handler
Private Sub zError(ByRef sRoutine As String, ByVal sMsg As String)
  ' Note. These two lines can be rem'd out if you so desire. But don't remove the routine
  App.LogEvent TypeName(Me) & "." & sRoutine & ": " & sMsg, vbLogEventTypeError
  MsgBox sMsg & ".", vbExclamation + vbApplicationModal, "Error in " & TypeName(Me) & "." & sRoutine
End Sub

'Return the address of the specified DLL/procedure
Private Function zFnAddr(ByVal sDLL As String, ByVal sProc As String, ByVal asUnicode As Boolean) As Long
  If asUnicode Then
    zFnAddr = GetProcAddress(GetModuleHandleW(StrPtr(sDLL)), sProc)         'Get the specified procedure address
  Else
    zFnAddr = GetProcAddress(GetModuleHandleA(sDLL), sProc)                 'Get the specified procedure address
  End If
  Debug.Assert zFnAddr                                                      'In the IDE, validate that the procedure address was located
  ' ^^ FYI VB5 users. Search for zFnAddr("vba6", "EbMode") and replace with zFnAddr("vba5", "EbMode")
End Function

'Return the address of the specified ordinal method on the oCallback object, 1 = last private method, 2 = second last private method, etc
Private Function zAddressOf(ByVal oCallback As Object, ByVal nOrdinal As Long) As Long
    ' Note: used both in subclassing and hooking routines
  Dim bSub  As Byte                                                         'Value we expect to find pointed at by a vTable method entry
  Dim bVal  As Byte
  Dim nAddr As Long                                                         'Address of the vTable
  Dim i     As Long                                                         'Loop index
  Dim j     As Long                                                         'Loop limit
  
  RtlMoveMemory VarPtr(nAddr), ObjPtr(oCallback), 4                         'Get the address of the callback object's instance
  If Not zProbe(nAddr + &H1C, i, bSub) Then                                 'Probe for a Class method
    If Not zProbe(nAddr + &H6F8, i, bSub) Then                              'Probe for a Form method
      If Not zProbe(nAddr + &H710, i, bSub) Then                            'Probe for a PropertyPage method
        If Not zProbe(nAddr + &H7A4, i, bSub) Then                          'Probe for a UserControl method
            Exit Function                                                   'Bail...
        End If
      End If
    End If
  End If
  
  i = i + 4                                                                 'Bump to the next entry
  j = i + 1024                                                              'Set a reasonable limit, scan 256 vTable entries
  Do While i < j
    RtlMoveMemory VarPtr(nAddr), i, 4                                       'Get the address stored in this vTable entry
    
    If IsBadCodePtr(nAddr) Then                                             'Is the entry an invalid code address?
      RtlMoveMemory VarPtr(zAddressOf), i - (nOrdinal * 4), 4               'Return the specified vTable entry address
      Exit Do                                                               'Bad method signature, quit loop
    End If

    RtlMoveMemory VarPtr(bVal), nAddr, 1                                    'Get the byte pointed to by the vTable entry
    If bVal <> bSub Then                                                    'If the byte doesn't match the expected value...
      RtlMoveMemory VarPtr(zAddressOf), i - (nOrdinal * 4), 4               'Return the specified vTable entry address
      Exit Do                                                               'Bad method signature, quit loop
    End If
    
    i = i + 4                                                               'Next vTable entry
  Loop
End Function

'Probe at the specified start address for a method signature
Private Function zProbe(ByVal nStart As Long, ByRef nMethod As Long, ByRef bSub As Byte) As Boolean
  Dim bVal    As Byte
  Dim nAddr   As Long
  Dim nLimit  As Long
  Dim nEntry  As Long
  
  nAddr = nStart                                                            'Start address
  nLimit = nAddr + 32                                                       'Probe eight entries
  Do While nAddr < nLimit                                                   'While we've not reached our probe depth
    RtlMoveMemory VarPtr(nEntry), nAddr, 4                                  'Get the vTable entry
    
    If nEntry <> 0 Then                                                     'If not an implemented interface
      RtlMoveMemory VarPtr(bVal), nEntry, 1                                 'Get the value pointed at by the vTable entry
      If bVal = &H33 Or bVal = &HE9 Then                                    'Check for a native or pcode method signature
        nMethod = nAddr                                                     'Store the vTable entry
        bSub = bVal                                                         'Store the found method signature
        zProbe = True                                                       'Indicate success
        Exit Do                                                             'Return
      End If
    End If
    
    nAddr = nAddr + 4                                                       'Next vTable entry
  Loop
End Function

Private Function zInIDE(ByRef bIDE As Boolean) As Boolean
    ' only called in IDE, never called when compiled
    bIDE = True
    zInIDE = bIDE
End Function

Private Sub zUnThunk(ByVal thunkID As Long, ByVal vType As eThunkType, Optional ByVal oCallback As Object)

    ' thunkID, depends on vType:
    '   - Subclassing:  the hWnd of the window subclassed
    '   - Hooking:      the hook type created
    '   - Callbacks:    the ordinal of the callback
    '       ensure KillTimer is already called, if any callback used for SetTimer
    ' oCallback only used when vType is CallbackThunk

    Const IDX_SHUTDOWN  As Long = 1
    Const MEM_RELEASE As Long = &H8000&             'Release allocated memory flag
    
    Dim z_ScMem       As Long                       'Thunk base address
    
    z_ScMem = zMap_VFunction(thunkID, vType, oCallback, True)
    Select Case vType
    Case SubclassThunk
        If z_ScMem Then                                 'Ensure that the thunk hasn't already released its memory
            zData(IDX_SHUTDOWN, z_ScMem) = 1            'Set the shutdown indicator
            zDelMsg ALL_MESSAGES, IDX_BTABLE, z_ScMem   'Delete all before messages
            zDelMsg ALL_MESSAGES, IDX_ATABLE, z_ScMem   'Delete all after messages
        End If
        If thunkID <> 0 Then z_scFunk.Remove "h" & thunkID                   'Remove the specified thunk from the collection
        
    Case HookThunk
        If z_ScMem Then                                 'Ensure that the thunk hasn't already released its memory
            ' if not unhooked, then unhook now
            If zData(IDX_SHUTDOWN, z_ScMem) = 0 Then UnhookWindowsHookEx zData(IDX_PREVPROC, z_ScMem)
            If zData(0, z_ScMem) = 0 Then               ' not recursing then
                VirtualFree z_ScMem, 0, MEM_RELEASE     'Release allocated memory
                z_hkFunk.Remove "h" & thunkID           'Remove the specified thunk from the collection
            Else
                zData(IDX_SHUTDOWN, z_ScMem) = 1        ' Set the shutdown indicator
                zData(IDX_ATABLE, z_ScMem) = 0          ' want no more After messages
                zData(IDX_BTABLE, z_ScMem) = 0          ' want no more Before messages
                ' when zTerminate is called this thunk's memory will be released
            End If
        Else
            z_hkFunk.Remove "h" & thunkID       'Remove the specified thunk from the collection
        End If
    Case CallbackThunk
        If z_ScMem Then                         'Ensure that the thunk hasn't already released its memory
            VirtualFree z_ScMem, 0, MEM_RELEASE 'Release allocated memory
        End If
        z_cbFunk.Remove "h" & ObjPtr(oCallback) & "." & thunkID           'Remove the specified thunk from the collection
    End Select

End Sub

Private Sub zTerminateThunks(ByVal vType As eThunkType)

    ' Terminates all thunks of a specific type
    ' Any subclassing, hooking, recurring callbacks should have already been canceled

    Dim i As Long
    Dim oCallback As Object
    Dim thunkCol As Collection
    Dim z_ScMem       As Long                           'Thunk base address
    Const INDX_OWNER As Long = 0
    
    Select Case vType
    Case SubclassThunk
        Set thunkCol = z_scFunk
    Case HookThunk
        Set thunkCol = z_hkFunk
    Case CallbackThunk
        Set thunkCol = z_cbFunk
    Case Else
        Exit Sub
    End Select
    
    If Not (thunkCol Is Nothing) Then                 'Ensure that hooking has been started
      With thunkCol
        For i = .Count To 1 Step -1                   'Loop through the collection of hook types in reverse order
          z_ScMem = .Item(i)                          'Get the thunk address
          If IsBadCodePtr(z_ScMem) = 0 Then           'Ensure that the thunk hasn't already released its memory
            Select Case vType
                Case SubclassThunk
                    zUnThunk zData(IDX_INDEX, z_ScMem), SubclassThunk    'Unsubclass
                Case HookThunk
                    zUnThunk zData(IDX_INDEX, z_ScMem), HookThunk        'Unhook
                Case CallbackThunk
                    ' zUnThunk expects object not pointer, convert pointer to object
                    RtlMoveMemory VarPtr(oCallback), VarPtr(zData(INDX_OWNER, z_ScMem)), 4&
                    zUnThunk zData(IDX_CALLBACKORDINAL, z_ScMem), CallbackThunk, oCallback ' release callback
                    ' remove the object pointer reference
                    RtlMoveMemory VarPtr(oCallback), VarPtr(INDX_OWNER), 4&
            End Select
          End If
        Next i                                        'Next member of the collection
      End With
      Set thunkCol = Nothing                         'Destroy the hook/thunk-address collection
    End If


End Sub

' WNDPROC RELATED PROCEDURES

Private Function Private_WndEventKeyboard(MF As MSGFILTER) As Long
    Dim intShift As Integer
    Dim intChar As Integer
    Select Case MF.MSG
        Case WM_KEYDOWN
            ' set the intShift parameter
            intShift = Private_GetShiftMask
            ' set the KeyCode parameter
            intChar = MF.wParam And &HFFFF&
            ' raise the event
            RaiseEvent KeyDown(intChar, intShift)
        Case WM_KEYUP
            intShift = Private_GetShiftMask
            intChar = MF.wParam And &HFFFF&
            RaiseEvent KeyUp(intChar, intShift)
        Case WM_CHAR
            intChar = MF.wParam And &HFFFF&
            RaiseEvent KeyPress(intChar)
    End Select
    Private_WndEventKeyboard = Abs(intChar = 0)
End Function

Private Sub Private_WndProcEdit(ByVal bBefore As Boolean, ByRef bHandled As Boolean, ByRef lReturn As Long, ByVal lng_hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long, ByRef lParamUser As Long)
    Static KeyShift As Integer
    Dim TME As TRACKMOUSEEVENT_STRUCT
    Dim XY(1) As Integer, Shift As UniTextShift, Button As UniTextMouseButton
    Dim NH As NMHDR, MF As MSGFILTER
    
    If blnDesignTime And Not m_Focus Then Exit Sub
    
    If bBefore Then
        If uMsg = WM_MOUSEACTIVATE Then
            If GetFocus <> m_hWnd Then SetFocus UserControl.hWnd
        ElseIf uMsg = WM_CONTEXTMENU Then
            m_InContext = True
            If m_UseEvents Then
                RaiseEvent ContextMenu(bHandled)
                m_InContext = Not bHandled
            End If
        ElseIf m_UseEvents Then
            Select Case uMsg
                Case WM_KEYDOWN, WM_CHAR
                    MF.MSG = uMsg
                    MF.lParam = lParam
                    MF.wParam = wParam
                    bHandled = Private_WndEventKeyboard(MF) <> 0
                Case WM_LBUTTONDOWN, WM_MBUTTONDOWN, WM_RBUTTONDOWN
                    ' this horribility is one reason to not use events...
                    CopyMemory XY(0), lParam, 4&
                    ' see key states
                    Shift = Private_GetShiftMask
                    ' button states
                    If (wParam And MK_LBUTTON) = MK_LBUTTON Then Button = [Left Button]
                    If (wParam And MK_MBUTTON) = MK_MBUTTON Then Button = Button Or [Middle Button]
                    If (wParam And MK_RBUTTON) = MK_RBUTTON Then Button = Button Or [Right Button]
                    ' raise the event
                    RaiseEvent MouseDown(Button, Shift, ScaleX(XY(0), vbPixels, m_ContainerScaleMode), ScaleY(XY(1), vbPixels, m_ContainerScaleMode))
            End Select
        End If
    ' BEFORE
    Else
    ' AFTER
        Select Case uMsg
            Case WM_VSCROLL
                RaiseEvent Scroll([Scroll Vertical])
            Case WM_HSCROLL
                RaiseEvent Scroll([Scroll Horizontal])
            Case WM_SETFOCUS
                Private_SetIPAO
                SetFocus m_hWnd
            Case WM_CONTEXTMENU
                m_InContext = False
            Case WM_KEYUP
                MF.MSG = WM_KEYUP
                MF.lParam = lParam
                MF.wParam = wParam
                bHandled = Private_WndEventKeyboard(MF) <> 1
            Case WM_MOUSEMOVE
                ' see if entering into the control
                If Not m_MouseOver Then
                    ' initialize TrackMouseEvent structure
                    TME.cbSize = Len(TME)
                    TME.dwFlags = TME_LEAVE
                    TME.hWndTrack = lng_hWnd
                    ' see which tracking API is available, if any
                    If m_TrackUser32 Then
                        TrackMouseEventUser32 TME
                    ElseIf m_TrackComCtl Then
                        TrackMouseEventComCtl TME
                    End If
                    ' set mouseover
                    m_MouseOver = True
                    ' raise event if using events
                    If m_UseEvents And (Not blnDesignTime) Then RaiseEvent MouseEnter
                End If
                ' see if need to raise events...
                If m_UseEvents Then
                    ' this horribility is one reason to not use events...
                    CopyMemory XY(0), lParam, 4&
                    ' see key states
                    Shift = Private_GetShiftMask
                    ' button states
                    If (wParam And MK_LBUTTON) = MK_LBUTTON Then Button = [Left Button]
                    If (wParam And MK_MBUTTON) = MK_MBUTTON Then Button = Button Or [Middle Button]
                    If (wParam And MK_RBUTTON) = MK_RBUTTON Then Button = Button Or [Right Button]
                    ' raise the event
                    RaiseEvent MouseMove(Button, Shift, ScaleX(XY(0), vbPixels, m_ContainerScaleMode), ScaleY(XY(1), vbPixels, m_ContainerScaleMode))
                End If
            Case WM_MOUSELEAVE
                m_MouseOver = False
                ' raise event if using events
                If m_UseEvents And (Not blnDesignTime) Then RaiseEvent MouseLeave
            Case WM_MOUSEWHEEL
                If m_UseEvents And (Not blnDesignTime) Then
                    If wParam > 0 Then
                        RaiseEvent MouseWheel([Wheel Up], Private_GetShiftMask)
                    Else
                        RaiseEvent MouseWheel([Wheel Down], Private_GetShiftMask)
                    End If
                End If
            Case WM_LBUTTONUP
                If m_UseEvents Then
                    ' this horribility is one reason to not use events...
                    CopyMemory XY(0), lParam, 4&
                    ' see key states
                    Shift = Private_GetShiftMask
                    ' button states
                    If (wParam And MK_LBUTTON) = MK_LBUTTON Then Button = [Left Button]
                    If (wParam And MK_MBUTTON) = MK_MBUTTON Then Button = Button Or [Middle Button]
                    If (wParam And MK_RBUTTON) = MK_RBUTTON Then Button = Button Or [Right Button]
                    ' raise the event
                    RaiseEvent MouseUp(Button, Shift, ScaleX(XY(0), vbPixels, m_ContainerScaleMode), ScaleY(XY(1), vbPixels, m_ContainerScaleMode))
                    ' click
                    If m_MouseOver Then RaiseEvent Click(vbLeftButton)
                End If
            Case WM_MBUTTONUP
                If m_UseEvents Then
                    ' this horribility is one reason to not use events...
                    CopyMemory XY(0), lParam, 4&
                    ' see key states
                    Shift = Private_GetShiftMask
                    ' button states
                    If (wParam And MK_LBUTTON) = MK_LBUTTON Then Button = [Left Button]
                    If (wParam And MK_MBUTTON) = MK_MBUTTON Then Button = Button Or [Middle Button]
                    If (wParam And MK_RBUTTON) = MK_RBUTTON Then Button = Button Or [Right Button]
                    ' raise the event
                    RaiseEvent MouseUp(Button, Shift, ScaleX(XY(0), vbPixels, m_ContainerScaleMode), ScaleY(XY(1), vbPixels, m_ContainerScaleMode))
                    ' click
                    If m_MouseOver Then RaiseEvent Click(vbMiddleButton)
                End If
            Case WM_RBUTTONUP
                If m_UseEvents Then
                    ' this horribility is one reason to not use events...
                    CopyMemory XY(0), lParam, 4&
                    ' see key states
                    Shift = Private_GetShiftMask
                    ' button states
                    If (wParam And MK_LBUTTON) = MK_LBUTTON Then Button = [Left Button]
                    If (wParam And MK_MBUTTON) = MK_MBUTTON Then Button = Button Or [Middle Button]
                    If (wParam And MK_RBUTTON) = MK_RBUTTON Then Button = Button Or [Right Button]
                    ' raise the event
                    RaiseEvent MouseUp(Button, Shift, ScaleX(XY(0), vbPixels, m_ContainerScaleMode), ScaleY(XY(1), vbPixels, m_ContainerScaleMode))
                    ' click
                    If m_MouseOver Then RaiseEvent Click(vbRightButton)
                End If
            Case WM_LBUTTONDBLCLK
                If m_UseEvents Then RaiseEvent DblClick(vbLeftButton)
            Case WM_MBUTTONDBLCLK
                If m_UseEvents Then RaiseEvent DblClick(vbMiddleButton)
            Case WM_RBUTTONDBLCLK
                If m_UseEvents Then RaiseEvent DblClick(vbRightButton)
        End Select
    End If
End Sub
Private Sub Private_WndProcMain(ByVal bBefore As Boolean, ByRef bHandled As Boolean, ByRef lReturn As Long, ByVal lng_hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long, ByRef lParamUser As Long)
    Dim XY(1) As Integer, Button As UniTextMouseButton, Shift As UniTextShift
    
    If bBefore Then
        Select Case uMsg
            Case WM_CTLCOLOREDIT, WM_CTLCOLORSTATIC
                SetBkMode wParam, OPAQUE
                lReturn = m_BackClrBrush
                SetBkColor wParam, m_BackClr
                SetTextColor wParam, m_ForeClr
                bHandled = True
            Case WM_DESTROY
                ssc_UnSubclass lng_hWnd
                'Debug.Print "UniText: Ended subclassing! " & Hex$(lng_hWnd)
            Case WM_ERASEBKGND
                bHandled = True
                lReturn = -1&
            Case WM_COMMAND
                Select Case ((wParam And &HFFFF0000) \ &H10000) And &HFFFF&
                    Case EN_SETFOCUS
                        'Debug.Print "EN_SETFOCUS"
                        'Private_WndEventFocus
                        'SetFocus m_hWnd
                        bHandled = True
                End Select
        End Select
        If m_UseEvents And Not bHandled Then
            Select Case uMsg
                Case WM_COMMAND
                    Select Case ((wParam And &HFFFF0000) \ &H10000) And &HFFFF&
                        Case EN_CHANGE
                            RaiseEvent Change
                        Case EN_UPDATE
                            RaiseEvent Update
                        Case EN_ALIGN_LTR_EC
                            
                        Case EN_ALIGN_RTL_EC
                            
                    End Select
            End Select
        End If
    ' BEFORE
    Else
    ' AFTER
        Select Case uMsg
            Case WM_PAINT
                If m_BorderStyle = [No Border] Then
                    Exit Sub
                ElseIf m_Appearance = [Classic 3D] Then
                    If m_BorderStyle = [Flat3D] Then
                        DrawEdge UserControl.hDC, m_RC, BDR_SUNKENOUTER, BF_RECT
                    Else
                        DrawEdge UserControl.hDC, m_RC, EDGE_SUNKEN, BF_RECT
                    End If
                End If
        End Select
    End If
End Sub
