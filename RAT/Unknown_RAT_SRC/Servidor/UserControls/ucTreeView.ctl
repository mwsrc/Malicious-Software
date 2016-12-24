VERSION 5.00
Begin VB.UserControl ucTreeView 
   ClientHeight    =   3255
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3255
   ClipControls    =   0   'False
   ScaleHeight     =   217
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   217
End
Attribute VB_Name = "ucTreeView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'========================================================================================
' User control:  ucTreeView.ctl
' Author:        Carles P.V. ©2004 (*)
' Dependencies:  mIOIPAOTreeView.bas -> OleGuids3.tlb (in IDE only)
' Last revision: 2004.10.27
' Version:       1.2.0
'----------------------------------------------------------------------------------------
'
' (*) 1. Self-Subclassing UserControl template (IDE safe) by Paul Caton:
'
'        Self-subclassing Controls/Forms - NO dependencies
'        v1.1.0010 2004.10.07
'        http://www.planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeId=54117&lngWId=1
'
'     2. MouseLeave()/MouseEnter() code by Paul Caton.
'
'     3. Some TreeView macros by MH (adapted from AllApiDemo project).
'----------------------------------------------------------------------------------------
'
' History:
'
'   * 1.0.0: - First release.
'
'   * 1.1.0: - Added  <hNode-Key> 'dummy-collection', getting:
'              - Faster Key check (collection built-in).
'              - Faster hNode 'extraction' from Key (collection built-in).
'              Private <hNode-Key> array lets extract directly node Key, as well as
'              operate over node's lParam member.
'              Also hNode (array) is used as 'delete' flag in TVN_DELETEITEM notification.
'              This flag will be used for 'removing/compacting' both collection and array
'              on deleting node(s) (see DeleteNode() function).
'
'              Array could be used to store extra node information for processing in a
'              custom-draw routine (hNode->lParam-> node array index ...).
'
'   * 1.2.0: - Added HoldDeletePostProcess() sub. (See sub's note!).
'            - Added SelectionChanged() event.
'            - Added hWnd property.
'            - Added HitTest() method.
'            - Added NodeFirstVisible() and NodeLastVisible() props.
'            - Added b[ExpandChildren] option (Expand() sub).
'            - Added b[CollapseChildren] option (Collapse() sub).
'            - Added b[SortAllLevels] option (SortChildren() sub).
'
'----------------------------------------------------------------------------------------
'
' Known issues:
'
'   *
'========================================================================================

Option Explicit

'== TreeView

Private Const WC_TREEVIEW  As String = "SysTreeView32"

Private Type TVITEM
    mask           As Long
    hItem          As Long
    State          As Long
    stateMask      As Long
    pszText        As Long
    cchTextMax     As Long
    iImage         As Long
    iSelectedImage As Long
    cChildren      As Long
    lParam         As Long
End Type

Private Type TVINSERTSTRUCT
    hParent      As Long
    hInsertAfter As Long
    Item         As TVITEM
End Type

Private Type NMHDR
    hwndFrom As Long
    idfrom   As Long
    code     As Long
End Type

Private Type POINTAPI
    X As Long
    Y As Long
End Type

Private Type NMTREEVIEW
    hdr     As NMHDR
    action  As Long
    itemOld As TVITEM
    itemNew As TVITEM
    ptDrag  As POINTAPI
End Type

Private Type NMTVDISPINFO
    hdr  As NMHDR
    Item As TVITEM
End Type

Private Type TVHITTESTINFO
    PT    As POINTAPI
    Flags As Long
    hItem As Long
End Type

Private Const GWL_STYLE             As Long = (-16)
Private Const GWL_EXSTYLE           As Long = (-20)

Private Const WS_TABSTOP            As Long = &H10000
Private Const WS_BORDER             As Long = &H800000
Private Const WS_CHILD              As Long = &H40000000

Private Const WS_EX_CLIENTEDGE      As Long = &H200

Private Const TVS_HASBUTTONS        As Long = &H1
Private Const TVS_HASLINES          As Long = &H2
Private Const TVS_LINESATROOT       As Long = &H4
Private Const TVS_EDITLABELS        As Long = &H8
Private Const TVS_SHOWSELALWAYS     As Long = &H20
Private Const TVS_CHECKBOXES        As Long = &H100
Private Const TVS_TRACKSELECT       As Long = &H200
Private Const TVS_SINGLEEXPAND      As Long = &H400
Private Const TVS_FULLROWSELECT     As Long = &H1000

Private Const TVSIL_NORMAL          As Long = &H0
Private Const TVSIL_STATE           As Long = &H2

'//

Private Const WM_SIZE               As Long = &H5
Private Const WM_SETFOCUS           As Long = &H7
Private Const WM_KILLFOCUS          As Long = &H8
Private Const WM_SETREDRAW          As Long = &HB
Private Const WM_SETFONT            As Long = &H30
Private Const WM_MOUSEACTIVATE      As Long = &H21
Private Const WM_NOTIFY             As Long = &H4E
Private Const WM_KEYDOWN            As Long = &H100
Private Const WM_KEYUP              As Long = &H101
Private Const WM_CHAR               As Long = &H102
Private Const WM_HSCROLL            As Long = &H114
Private Const WM_VSCROLL            As Long = &H115
Private Const WM_MOUSEMOVE          As Long = &H200
Private Const WM_LBUTTONUP          As Long = &H202
Private Const WM_LBUTTONDOWN        As Long = &H201
Private Const WM_RBUTTONDOWN        As Long = &H204
Private Const WM_RBUTTONUP          As Long = &H205
Private Const WM_MBUTTONDOWN        As Long = &H207
Private Const WM_MBUTTONUP          As Long = &H208

Private Const H_MAX                 As Long = &HFFFF + 1
Private Const NM_FIRST              As Long = H_MAX
Private Const NM_CLICK              As Long = (NM_FIRST - 2)
Private Const NM_DBLCLK             As Long = (NM_FIRST - 3)
Private Const NM_RCLICK             As Long = (NM_FIRST - 5)
Private Const NM_RDBLCLK            As Long = (NM_FIRST - 6)
Private Const NM_SETFOCUS           As Long = (NM_FIRST - 7)
Private Const NM_CUSTOMDRAW         As Long = (NM_FIRST - 12)

'//

Private Const TVI_ROOT              As Long = &HFFFF0000
Private Const TVI_FIRST             As Long = &HFFFF0001
Private Const TVI_LAST              As Long = &HFFFF0002
Private Const TVI_SORT              As Long = &HFFFF0003

Private Const TVE_COLLAPSE          As Long = &H1
Private Const TVE_EXPAND            As Long = &H2
Private Const TVE_TOGGLE            As Long = &H3

Private Const TVGN_ROOT             As Long = &H0
Private Const TVGN_CARET            As Long = &H9
Private Const TVGN_PARENT           As Long = &H3
Private Const TVGN_CHILD            As Long = &H4
Private Const TVGN_NEXT             As Long = &H1
Private Const TVGN_PREVIOUS         As Long = &H2

Private Const TVGN_FIRSTVISIBLE     As Long = &H5
Private Const TVGN_LASTVISIBLE      As Long = &HA
Private Const TVGN_PREVIOUSVISIBLE  As Long = &H7
Private Const TVGN_NEXTVISIBLE      As Long = &H6

Private Const TVIF_TEXT             As Long = &H1
Private Const TVIF_IMAGE            As Long = &H2
Private Const TVIF_PARAM            As Long = &H4
Private Const TVIF_SELECTEDIMAGE    As Long = &H20
Private Const TVIF_all              As Long = TVIF_TEXT Or TVIF_IMAGE Or TVIF_PARAM Or TVIF_SELECTEDIMAGE
Private Const TVIF_CHILDREN         As Long = &H40
Private Const TVIF_STATE            As Long = &H8
Private Const TVIF_HANDLE           As Long = &H10
    
Private Const TVIS_SELECTED         As Long = &H2
Private Const TVIS_CUT              As Long = &H4
Private Const TVIS_DROPHILITED      As Long = &H8
Private Const TVIS_BOLD             As Long = &H10
Private Const TVIS_EXPANDEDONCE     As Long = &H40
Private Const TVIS_STATEIMAGEMASK   As Long = &HF000

Private Const TVHT_NOWHERE          As Long = &H1
Private Const TVHT_ONITEMICON       As Long = &H2
Private Const TVHT_ONITEMLABEL      As Long = &H4
Private Const TVHT_ONITEMINDENT     As Long = &H8
Private Const TVHT_ONITEMBUTTON     As Long = &H10
Private Const TVHT_ONITEMRIGHT      As Long = &H20
Private Const TVHT_ONITEMSTATEICON  As Long = &H40
Private Const TVHT_ABOVE            As Long = &H100
Private Const TVHT_BELOW            As Long = &H200
Private Const TVHT_TORIGHT          As Long = &H400
Private Const TVHT_TOLEFT           As Long = &H800
Private Const TVHT_ONITEM           As Long = TVHT_ONITEMICON Or TVHT_ONITEMLABEL Or TVHT_ONITEMSTATEICON

Private Const TV_FIRST              As Long = &H1100
Private Const TVM_INSERTITEM        As Long = (TV_FIRST + 0)
Private Const TVM_DELETEITEM        As Long = (TV_FIRST + 1)
Private Const TVM_EXPAND            As Long = (TV_FIRST + 2)
Private Const TVM_GETITEMRECT       As Long = (TV_FIRST + 4)
Private Const TVM_GETCOUNT          As Long = (TV_FIRST + 5)
Private Const TVM_GETINDENT         As Long = (TV_FIRST + 6)
Private Const TVM_SETINDENT         As Long = (TV_FIRST + 7)
Private Const TVM_GETIMAGELIST      As Long = (TV_FIRST + 8)
Private Const TVM_SETIMAGELIST      As Long = (TV_FIRST + 9)
Private Const TVM_GETNEXTITEM       As Long = (TV_FIRST + 10)
Private Const TVM_SELECTITEM        As Long = (TV_FIRST + 11)
Private Const TVM_GETITEM           As Long = (TV_FIRST + 12)
Private Const TVM_SETITEM           As Long = (TV_FIRST + 13)
Private Const TVM_EDITLABEL         As Long = (TV_FIRST + 14)
Private Const TVM_GETEDITCONTROL    As Long = (TV_FIRST + 15)
Private Const TVM_HITTEST           As Long = (TV_FIRST + 17)
Private Const TVM_CREATEDRAGIMAGE   As Long = (TV_FIRST + 18)
Private Const TVM_SORTCHILDREN      As Long = (TV_FIRST + 19)
Private Const TVM_ENSUREVISIBLE     As Long = (TV_FIRST + 20)
Private Const TVM_ENDEDITLABELNOW   As Long = (TV_FIRST + 22)
Private Const TVM_SETITEMHEIGHT     As Long = (TV_FIRST + 27)
Private Const TVM_GETITEMHEIGHT     As Long = (TV_FIRST + 28)
Private Const TVM_SETBKCOLOR        As Long = (TV_FIRST + 29)
Private Const TVM_SETTEXTCOLOR      As Long = (TV_FIRST + 30)
Private Const TVM_GETBKCOLOR        As Long = (TV_FIRST + 31)
Private Const TVM_GETTEXTCOLOR      As Long = (TV_FIRST + 32)
Private Const TVM_SETLINECOLOR      As Long = (TV_FIRST + 40)
Private Const TVM_GETLINECOLOR      As Long = (TV_FIRST + 41)
   
Private Const TVN_FIRST             As Long = -400
Private Const TVN_SELCHANGING       As Long = (TVN_FIRST - 1)
Private Const TVN_SELCHANGED        As Long = (TVN_FIRST - 2)
Private Const TVN_ITEMEXPANDING     As Long = (TVN_FIRST - 5)
Private Const TVN_ITEMEXPANDED      As Long = (TVN_FIRST - 6)
Private Const TVN_BEGINDRAG         As Long = (TVN_FIRST - 7)
Private Const TVN_DELETEITEM        As Long = (TVN_FIRST - 9)
Private Const TVN_BEGINLABELEDIT    As Long = (TVN_FIRST - 10)
Private Const TVN_ENDLABELEDIT      As Long = (TVN_FIRST - 11)

'== Image list

Private Const CLR_NONE     As Long = &HFFFFFFFF
Private Const ILC_MASK     As Long = &H1
Private Const ILC_COLORDDB As Long = &HFE
Private Const ILC_COLOR32     As Long = &H20

Private Declare Function ImageList_Create Lib "Comctl32" (ByVal MinCx As Long, ByVal MinCy As Long, ByVal Flags As Long, ByVal cInitial As Long, ByVal cGrow As Long) As Long
Private Declare Function ImageList_Add Lib "Comctl32" (ByVal hImageList As Long, ByVal hBitmap As Long, ByVal hBitmapMask As Long) As Long
Private Declare Function ImageList_AddMasked Lib "Comctl32" (ByVal hImageList As Long, ByVal hbmImage As Long, ByVal crMask As Long) As Long
Private Declare Function ImageList_AddIcon Lib "Comctl32" (ByVal hImageList As Long, ByVal hIcon As Long) As Long
Private Declare Function ImageList_Destroy Lib "Comctl32" (ByVal hImageList As Long) As Long
Private Declare Function ImageList_GetImageCount Lib "Comctl32" (ByVal hImageList As Long) As Long

'== Mouse leave/enter support

Private Enum TRACKMOUSEEVENT_FLAGS
    [TME_HOVER] = &H1
    [TME_LEAVE] = &H2
    [TME_QUERY] = &H40000000
    [TME_CANCEL] = &H80000000
End Enum

Private Type TRACKMOUSEEVENT_STRUCT
    cbSize      As Long
    dwFlags     As TRACKMOUSEEVENT_FLAGS
    hwndTrack   As Long
    dwHoverTime As Long
End Type

Private Const WM_MOUSELEAVE As Long = &H2A3

Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Private Declare Function LoadLibraryA Lib "kernel32" (ByVal lpLibFileName As String) As Long
Private Declare Function TrackMouseEvent Lib "user32" (lpEventTrack As TRACKMOUSEEVENT_STRUCT) As Long
Private Declare Function TrackMouseEventComCtl Lib "Comctl32" Alias "_TrackMouseEvent" (lpEventTrack As TRACKMOUSEEVENT_STRUCT) As Long

'== Scroll support

Private Const SB_LINEUP    As Long = 0
Private Const SB_LINELEFT  As Long = 0
Private Const SB_LINEDOWN  As Long = 1
Private Const SB_LINERIGHT As Long = 1
Private Const SB_PAGEUP    As Long = 2
Private Const SB_PAGELEFT  As Long = 2
Private Const SB_PAGEDOWN  As Long = 3
Private Const SB_PAGERIGHT As Long = 3
Private Const SB_TOP       As Long = 6
Private Const SB_LEFT      As Long = 6
Private Const SB_BOTTOM    As Long = 7
Private Const SB_RIGHT     As Long = 7
Private Const SB_ENDSCROLL As Long = 8

'== Misc.

Private Type RECT2
    x1 As Long
    y1 As Long
    x2 As Long
    y2 As Long
End Type

Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Private Declare Function ScreenToClient Lib "user32" (ByVal hwnd As Long, lpPoint As POINTAPI) As Long
Private Declare Function GetClientRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT2) As Long
Private Declare Function IntersectRect Lib "user32" (lpDestRect As RECT2, lpSrc1Rect As RECT2, lpSrc2Rect As RECT2) As Long
Private Declare Function EqualRect Lib "user32" (lpRect1 As RECT2, lpRect2 As RECT2) As Long
Private Declare Function EnableWindow Lib "user32" (ByVal hwnd As Long, ByVal fEnable As Long) As Long

Private Type LOGFONT
    lfHeight         As Long
    lfWidth          As Long
    lfEscapement     As Long
    lfOrientation    As Long
    lfWeight         As Long
    lfItalic         As Byte
    lfUnderline      As Byte
    lfStrikeOut      As Byte
    lfCharSet        As Byte
    lfOutPrecision   As Byte
    lfClipPrecision  As Byte
    lfQuality        As Byte
    lfPitchAndFamily As Byte
    lfFaceName(32)   As Byte
End Type

Private Const LOGPIXELSY        As Long = 90
Private Const FW_NORMAL         As Long = 400
Private Const FW_BOLD           As Long = 700

Private Declare Function GetDeviceCaps Lib "gdi32" (ByVal hdc As Long, ByVal nIndex As Long) As Long
Private Declare Function CreateFontIndirect Lib "gdi32" Alias "CreateFontIndirectA" (lpLogFont As LOGFONT) As Long
Private Declare Function MulDiv Lib "kernel32" (ByVal nNumber As Long, ByVal nNumerator As Long, ByVal nDenominator As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long

Private Const SW_SHOW           As Long = 5

Private Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long

Private Const SWP_NOMOVE        As Long = &H2
Private Const SWP_NOSIZE        As Long = &H1
Private Const SWP_NOOWNERZORDER As Long = &H200
Private Const SWP_NOZORDER      As Long = &H4
Private Const SWP_FRAMECHANGED  As Long = &H20

Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Private Const COLOR_WINDOW      As Long = 5
Private Const COLOR_WINDOWTEXT  As Long = 8

Private Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
Private Declare Function OleTranslateColor Lib "olepro32" (ByVal OLE_COLOR As Long, ByVal hPalette As Long, pccolorref As Long) As Long

'//

Private Declare Sub InitCommonControls Lib "Comctl32" ()
Private Declare Function CreateWindowEx Lib "user32" Alias "CreateWindowExA" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, lpParam As Any) As Long
Private Declare Function DestroyWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function MoveWindow Lib "user32" (ByVal hwnd As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)
Private Declare Function PostMessage Lib "user32.dll" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As String) As Long
 
Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Private Declare Function SetFocus Lib "user32" (ByVal hwnd As Long) As Long

'========================================================================================
' Subclasser declarations
'========================================================================================

Private Enum eMsgWhen
  MSG_AFTER = 1                                                                         'Message calls back after the original (previous) WndProc
  MSG_BEFORE = 2                                                                        'Message calls back before the original (previous) WndProc
  MSG_BEFORE_AND_AFTER = MSG_AFTER Or MSG_BEFORE                                        'Message calls back before and after the original (previous) WndProc
End Enum

Private Const ALL_MESSAGES           As Long = -1                                       'All messages added or deleted
Private Const CODE_LEN               As Long = 200                                      'Length of the machine code in bytes
Private Const GWL_WNDPROC            As Long = -4                                       'Get/SetWindow offset to the WndProc procedure address
Private Const PATCH_04               As Long = 88                                       'Table B (before) address patch offset
Private Const PATCH_05               As Long = 93                                       'Table B (before) entry count patch offset
Private Const PATCH_08               As Long = 132                                      'Table A (after) address patch offset
Private Const PATCH_09               As Long = 137                                      'Table A (after) entry count patch offset

Private Type tSubData                                                                   'Subclass data type
  hwnd                               As Long                                            'Handle of the window being subclassed
  nAddrSub                           As Long                                            'The address of our new WndProc (allocated memory).
  nAddrOrig                          As Long                                            'The address of the pre-existing WndProc
  nMsgCntA                           As Long                                            'Msg after table entry count
  nMsgCntB                           As Long                                            'Msg before table entry count
  aMsgTblA()                         As Long                                            'Msg after table array
  aMsgTblB()                         As Long                                            'Msg Before table array
  sCode                              As String
End Type

Private sc_aSubData()                As tSubData                                        'Subclass data array
Private sc_aBuf(1 To CODE_LEN)       As Byte                                            'Code buffer byte array
Private sc_pCWP                      As Long                                            'Address of the CallWindowsProc
Private sc_pEbMode                   As Long                                            'Address of the EbMode IDE break/stop/running function
Private sc_pSWL                      As Long                                            'Address of the SetWindowsLong function
  
Private Declare Sub RtlMoveMemory Lib "kernel32" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function GetModuleHandleA Lib "kernel32" (ByVal lpModuleName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function SetWindowLongA Lib "user32" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function VirtualProtect Lib "kernel32" (lpAddress As Any, ByVal dwSize As Long, ByVal flNewProtect As Long, lpflOldProtect As Long) As Long



'========================================================================================
' ucTreeView
'========================================================================================

'-- Public enums.:

Public Enum tvBorderStyleConstants
    [bsNone] = 0
    [bsFixedSingle]
End Enum

Public Enum tvRelationConstants
    [rLast] = 0
    [rFirst]
    [rSort]
    [rNext]
    [rPrevious]
End Enum

Public Enum tvScrollConstants
    [sHome] = 0
    [sPageUp] = 1
    [sUp] = 2
    [sDown] = 3
    [sPageDown] = 4
    [Send] = 5
    [sLeft] = 6
    [sPageLeft] = 7
    [sLineLeft] = 8
    [sLineRight] = 9
    [sPageRight] = 10
    [sRight] = 11
End Enum

'-- Property variables:

Private WithEvents m_oFont   As StdFont
Attribute m_oFont.VB_VarHelpID = -1
Private m_bCheckBoxes        As Boolean
Private m_bFullRowSelect     As Boolean
Private m_bHasButtons        As Boolean
Private m_bHasLines          As Boolean
Private m_bHasRootLines      As Boolean
Private m_bHideSelection     As Boolean
Private m_bLabelEdit         As Boolean
Private m_bSingleExpand      As Boolean
Private m_bTrackSelect       As Boolean

'-- Private constants:

Private Const MAX_PATH       As Long = 260
Private Const PATH_SEPARATOR As String = "\"
Private Const SII_SWAPMASK   As Long = 3
Private Const SII_CHECKED    As Long = 2
Private Const SII_UNCHECKED  As Long = 1
Private Const ALLOCATE_SIZE  As Long = 100

'-- Private types:

Private Type NODE_DATA
    hNode As Long
    sKey  As String
End Type

'-- Private enums.:

Private Enum eStateConstants
    [eStateCut] = TVIS_CUT
    [eStateDropHilited] = TVIS_DROPHILITED
    [eStateBold] = TVIS_BOLD
End Enum

'-- Private variables:

Private m_bInitialized           As Boolean
Private m_hModShell32            As Long
Private m_uIPAO                  As IPAOHookStructTreeView
Private m_hTreeView              As Long
Private m_hImageList             As Long
Private m_lImageListCount        As Long
Private m_hFont                  As Long

Private m_bHoldDeletePostProcess As Boolean
Private m_cKey                   As Collection
Private m_uNodeData()            As NODE_DATA
Private m_lNodeCount             As Long

Private m_bTrack                 As Boolean
Private m_bTrackUser32           As Boolean
Private m_bInControl             As Boolean
Private m_lx                     As Long
Private m_ly                     As Long

'-- Event declarations:

Public Event Click()
Public Event NodeClick(ByVal hNode As Long)
Public Event NodeCheck(ByVal hNode As Long)
Public Event NodeDblClick(ByVal hNode As Long)
Public Event SelectionChanged()
Public Event ExpandBefore(ByVal hNode As Long, ByVal ExpandedOnce As Boolean)
Public Event ExpandAfter(ByVal hNode As Long, ByVal ExpandedOnce As Boolean)
Public Event Collapse(ByVal hNode As Long)
Public Event BeforeLabelEdit(ByVal hNode As Long, Cancel As Integer)
Public Event AfterLabelEdit(ByVal hNode As Long, Cancel As Integer, NewString As String)
Public Event KeyDown(KeyCode As Integer, Shift As Integer)
Public Event KeyPress(KeyAscii As Integer)
Public Event KeyUp(KeyCode As Integer, Shift As Integer)
Public Event MouseDown(Button As Integer, Shift As Integer, X As Long, Y As Long)
Public Event MouseMove(Button As Integer, Shift As Integer, X As Long, Y As Long)
Public Event MouseUp(Button As Integer, Shift As Integer, X As Long, Y As Long)
Public Event MouseEnter()
Public Event MouseLeave()
Public Event Resize()

'========================================================================================
' Usercontrol
'========================================================================================

Private Sub UserControl_Initialize()

    '(*) KBID 309366 (http://support.microsoft.com/default.aspx?scid=kb;en-us;309366)
    m_hModShell32 = LoadLibraryA("shell32.dll")
    '-- Initialize common controls
    Call InitCommonControls
    
    '-- Initialize font object
    Set m_oFont = New StdFont
    '-- Initialize Node data array ('1' based) and Key collection
    ReDim m_uNodeData(0 To 1)
    Set m_cKey = New Collection
    
'(*) From vbAccelerator
'    http://www.vbaccelerator.com/home/VB/Code/Libraries/XP_Visual_Styles/Preventing_Crashes_at_Shutdown/article.asp
End Sub

Private Sub UserControl_Terminate()
  
    On Error Resume Next
  
    If (m_hTreeView) Then
        
        '-- Stop subclassing and destroy all
        Call Subclass_StopAll
        Call mIOIPAOTreeView.TerminateIPAO(m_uIPAO)
        Call pvDestroyFont
        Call pvDestroyImageList
        Call pvDestroyTreeView
        
        '-- Free node data array and key collection
        Erase m_uNodeData()
        Set m_cKey = Nothing
        
        '-- Free library
        Call FreeLibrary(m_hModShell32)
    End If
    
    On Error GoTo 0
End Sub





'========================================================================================
' Subclass handler: MUST be the first Public routine in this file.
'                   That includes public properties also.
'========================================================================================

Public Sub zSubclass_Proc(ByVal bBefore As Boolean, ByRef bHandled As Boolean, ByRef lReturn As Long, ByRef lng_hWnd As Long, ByRef uMsg As Long, ByRef wParam As Long, ByRef lParam As Long)
Attribute zSubclass_Proc.VB_MemberFlags = "40"

'Parameters:
'   bBefore  - Indicates whether the the message is being processed before or after the default handler - only really needed if a message is set to callback both before & after.
'   bHandled - Set this variable to True in a 'before' callback to prevent the message being subsequently processed by the default handler... and if set, an 'after' callback
'   lReturn  - Set this variable as per your intentions and requirements, see the MSDN documentation for each individual message value.
'   lng_hWnd - The window handle
'   uMsg     - The message number
'   wParam   - Message related data
'   lParam   - Message related data
'
'Notes:
'   If you really know what you're doing, it's possible to change the values of the
'   hWnd, uMsg, wParam and lParam parameters in a 'before' callback so that different
'   values get passed to the default handler.. and optionaly, the 'after' callback
  
  Static bNodeClick As Boolean
  
  Dim uNMH    As NMHDR
  Dim uNMTV   As NMTREEVIEW
  Dim uNMTVDI As NMTVDISPINFO
  Dim uTVHTI  As TVHITTESTINFO
  Dim hNode   As Long
  Dim fHit    As Long
  Dim hEdit   As Long
  Dim nCancel As Integer
  Dim sText   As String
  Dim X       As Long
  Dim Y       As Long
       
    Select Case lng_hWnd
                
        Case UserControl.hwnd
           
            Select Case uMsg
                
                Case WM_SETFOCUS
                
                    Call SetFocus(m_hTreeView)
                    
                Case WM_MOUSEACTIVATE
                    
                    Call pvSetIPAO
                    
                Case WM_SIZE
                
                    Call MoveWindow(m_hTreeView, 0, 0, UserControl.ScaleWidth, UserControl.ScaleHeight, bRepaint:=True)
                    RaiseEvent Resize
                    
                Case WM_NOTIFY
                    
                    Call CopyMemory(uNMH, ByVal lParam, Len(uNMH))
                    
                    If (uNMH.hwndFrom = m_hTreeView) Then
                    
                        Select Case uNMH.code
                        
'                           Case NM_CUSTOMDRAW
'
'                               bHandled = True
'                               lReturn = pvYourCustomDrawRoutine(lParam)
                                
                            Case NM_SETFOCUS
                                
                                Call pvSetIPAO
                            
                            Case NM_CLICK, NM_RCLICK
                                
                                Call pvTVHitTest(hNode, fHit)
                               
                                If (hNode) Then
                                    If ((fHit And (TVHT_ONITEMICON Or TVHT_ONITEMLABEL)) Or m_bFullRowSelect) Then
                                        RaiseEvent NodeClick(hNode)
                                        bNodeClick = True
                                        Call pvGetCursorClientPos(X, Y)
                                        RaiseEvent MouseUp((uNMH.code = NM_CLICK) + 2, pvShiftState(), X, Y)
                                        RaiseEvent Click
                                    End If
                                End If
                                
                            Case NM_DBLCLK, NM_RDBLCLK
                                
                                Call pvTVHitTest(hNode, fHit)
                                
                                RaiseEvent NodeDblClick(hNode)
                                
                            Case TVN_SELCHANGED
                                
                                If (Not bNodeClick) Then
                                    Call CopyMemory(uNMTV, ByVal lParam, Len(uNMTV))
                                    RaiseEvent NodeClick(uNMTV.itemNew.hItem)
                                End If
                                bNodeClick = False
                                
                                RaiseEvent SelectionChanged
                                
                            Case TVN_ITEMEXPANDING
                                
                                Call CopyMemory(uNMTV, ByVal lParam, Len(uNMTV))
                                
                                With uNMTV
                                    If (.action = TVE_EXPAND) Then
                                        With .itemNew
                                            RaiseEvent ExpandBefore(.hItem, CBool(.State And TVIS_EXPANDEDONCE))
                                        End With
                                    End If
                                End With
                                
                            Case TVN_ITEMEXPANDED
                            
                                Call CopyMemory(uNMTV, ByVal lParam, Len(uNMTV))
                                
                                With uNMTV
                                    Select Case .action
                                        Case TVE_EXPAND
                                            With .itemNew
                                                RaiseEvent ExpandAfter(.hItem, CBool(.State And TVIS_EXPANDEDONCE))
                                            End With
                                        Case TVE_COLLAPSE
                                            RaiseEvent Collapse(.itemNew.hItem)
                                    End Select
                                End With
                            
                            Case TVN_DELETEITEM
                                 
                                Call CopyMemory(uNMTV, ByVal lParam, Len(uNMTV))
                                
                                m_uNodeData(uNMTV.itemOld.lParam).hNode = 0
                                
                            Case TVN_BEGINLABELEDIT
                                
                                Call CopyMemory(uNMTVDI, ByVal lParam, Len(uNMTVDI))
                                
                                RaiseEvent BeforeLabelEdit(uNMTVDI.Item.hItem, nCancel)
                                If (nCancel) Then
                                    hEdit = SendMessageLong(m_hTreeView, TVM_GETEDITCONTROL, 0, 0)
                                    'Call SendMessageLong(hEdit, WM_KILLFOCUS, 0, 0)
                                    PostMessage hEdit, WM_KILLFOCUS, 0, 0
                                End If
                                
                            Case TVN_ENDLABELEDIT
                                
                                Call CopyMemory(uNMTVDI, ByVal lParam, Len(uNMTVDI))
                                
                                With uNMTVDI.Item
                                    sText = pvStringFromPointer(.pszText, .cchTextMax)
                                    If sText <> vbNullString Then
                                        RaiseEvent AfterLabelEdit(.hItem, nCancel, sText)
                                    
                                        If (nCancel = 0 Xor GetAsyncKeyState(vbKeyEscape)) Then
                                            lReturn = 1
                                            bHandled = True
                                        End If
                                    End If
                                End With
                                
                            Case TVN_BEGINDRAG
                            
                                'UserControl.OLEDrag
                                'To do...
                        End Select
                    End If
            End Select
            
        Case m_hTreeView
            
            Select Case uMsg
            
                Case WM_KEYDOWN
                    
                    RaiseEvent KeyDown(wParam And &H7FFF&, pvShiftState())
                    
                Case WM_CHAR
                    
                    If ((wParam And &H7FFF&) = vbKeySpace) Then
                        If (m_bCheckBoxes) Then
                            RaiseEvent NodeCheck(Me.SelectedNode)
                        End If
                    End If
                    RaiseEvent KeyPress(wParam And &H7FFF&)
                    
                Case WM_KEYUP
                    
                    RaiseEvent KeyUp(wParam And &H7FFF&, pvShiftState())
                    
                Case WM_LBUTTONDOWN, WM_RBUTTONDOWN, WM_MBUTTONDOWN
                    
                    Call pvGetCursorClientPos(X, Y)
                    RaiseEvent MouseDown(pvButton(uMsg), pvShiftState(), X, Y)
                    
                    If (pvButton(uMsg) = vbLeftButton) Then
                        Call pvTVHitTest(hNode, fHit)
                        If (hNode) Then
                            If ((fHit And TVHT_ONITEMSTATEICON) = TVHT_ONITEMSTATEICON) Then
                                Call pvTVSetStateImage(hNode, SII_SWAPMASK - pvTVGetStateImage(hNode))
                                RaiseEvent NodeCheck(hNode)
                                bHandled = True
                            End If
                        End If
                    End If
                    bHandled = bHandled Or (pvButton(uMsg) <> vbLeftButton)
                    
                Case WM_MOUSEMOVE
                    
                    If (Not m_bInControl) Then
                        m_bInControl = True
                        Call pvTrackMouseLeave(lng_hWnd)
                        RaiseEvent MouseEnter
                    End If
                    Call pvGetCursorClientPos(X, Y)
                    If (X <> m_lx Or X <> m_ly) Then
                        m_lx = X
                        m_ly = Y
                        RaiseEvent MouseMove(pvButton(uMsg), pvShiftState(), X, Y)
                    End If
                    
                Case WM_MOUSELEAVE

                    m_bInControl = False
                    m_lx = -1
                    m_ly = -1
                    RaiseEvent MouseLeave
                    
                Case WM_LBUTTONUP, WM_RBUTTONUP, WM_MBUTTONUP
                    
                    Call pvGetCursorClientPos(X, Y)
                    RaiseEvent MouseUp(pvButton(uMsg), pvShiftState(), X, Y)
                    RaiseEvent Click
            End Select
    End Select
End Sub





'========================================================================================
' Methods
'========================================================================================

Public Function Initialize() As Boolean

    If (m_bInitialized = False) Then
    
        Initialize = pvCreateTreeView()
        
        If (m_hTreeView) Then

            '-- Subclass UserControl (parent)
            Call Subclass_Start(UserControl.hwnd)
            Call Subclass_AddMsg(UserControl.hwnd, WM_MOUSEACTIVATE, MSG_AFTER)
            Call Subclass_AddMsg(UserControl.hwnd, WM_SETFOCUS, MSG_AFTER)
            Call Subclass_AddMsg(UserControl.hwnd, WM_SIZE, MSG_AFTER)
            Call Subclass_AddMsg(UserControl.hwnd, WM_NOTIFY, MSG_AFTER)
            
            '-- Subclass TreeView (child)
            Call Subclass_Start(m_hTreeView)
            Call Subclass_AddMsg(m_hTreeView, WM_SIZE, MSG_BEFORE)
            Call Subclass_AddMsg(m_hTreeView, WM_KEYDOWN, MSG_BEFORE)
            Call Subclass_AddMsg(m_hTreeView, WM_CHAR, MSG_BEFORE)
            Call Subclass_AddMsg(m_hTreeView, WM_KEYUP, MSG_BEFORE)
            Call Subclass_AddMsg(m_hTreeView, WM_LBUTTONDOWN, MSG_BEFORE)
            Call Subclass_AddMsg(m_hTreeView, WM_RBUTTONDOWN, MSG_BEFORE)
            Call Subclass_AddMsg(m_hTreeView, WM_MBUTTONDOWN, MSG_BEFORE)
            Call Subclass_AddMsg(m_hTreeView, WM_MOUSEMOVE, MSG_BEFORE)
            Call Subclass_AddMsg(m_hTreeView, WM_LBUTTONUP, MSG_BEFORE)
            Call Subclass_AddMsg(m_hTreeView, WM_RBUTTONUP, MSG_BEFORE)
            Call Subclass_AddMsg(m_hTreeView, WM_MBUTTONUP, MSG_BEFORE)
            
            '-- TreeView mouse enter/leave support and mouse pos. initialization
            m_bTrack = True
            m_bTrackUser32 = pvIsFunctionExported("TrackMouseEvent", "User32")
            If (Not m_bTrackUser32) Then
                If (Not pvIsFunctionExported("_TrackMouseEvent", "Comctl32")) Then
                    m_bTrack = False
                End If
            End If
            If (m_bTrack) Then
                Call Subclass_AddMsg(m_hTreeView, WM_MOUSELEAVE, MSG_BEFORE)
            End If
            m_lx = -1
            m_ly = -1
            
            '-- Initialize OLEInPlaceActiveObject interface
            Call mIOIPAOTreeView.InitIPAO(m_uIPAO, Me)
            
            m_bInitialized = True
        End If
    End If
End Function

Public Function InitializeImageList( _
                Optional ByVal ImageWidth As Long = 16, _
                Optional ByVal ImageHeight As Long = 16) As Boolean
    
    If (m_hTreeView) Then
    
        Call pvDestroyImageList
        m_hImageList = ImageList_Create(ImageWidth, ImageHeight, ILC_COLOR32 Or ILC_MASK, 0, 0)
        
        If (m_hImageList) Then
            Call pvSetImageList(m_hImageList)
            InitializeImageList = True
        End If
    End If
End Function

Public Function AddBitmap( _
                ByVal hBitmap As Long, _
                Optional ByVal MaskColor As Long = CLR_NONE _
                ) As Long
    
    If (m_hImageList) Then
        If (MaskColor <> CLR_NONE) Then
            AddBitmap = ImageList_AddMasked(m_hImageList, hBitmap, MaskColor)
          Else
            AddBitmap = ImageList_Add(m_hImageList, hBitmap, 0)
        End If
        m_lImageListCount = ImageList_GetImageCount(m_hImageList)
    End If
End Function

Public Function AddIcon( _
                ByVal hIcon As Long _
                ) As Long
    
    If (m_hImageList) Then
        AddIcon = ImageList_AddIcon(m_hImageList, hIcon)
        m_lImageListCount = ImageList_GetImageCount(m_hImageList)
    End If
End Function

Public Sub SetRedrawMode(ByVal Enable As Boolean)
    If (m_hTreeView) Then
        Call SendMessageLong(m_hTreeView, WM_SETREDRAW, -Enable, 0)
    End If
End Sub

'== Adding / removing nodes

Public Function AddNode( _
                Optional ByVal hRelative As Long, _
                Optional ByVal Relation As tvRelationConstants, _
                Optional ByVal Key As String, _
                Optional ByVal Text As String, _
                Optional ByVal Image As Long = -1, _
                Optional ByVal SelectedImage As Long = -1, _
                Optional ByVal PlusButton As Boolean = False _
                ) As Long
    
    If (m_hTreeView) Then
        
        AddNode = pvTVAddNode(m_lNodeCount + 1, hRelative, Relation, Text, Image, SelectedImage, PlusButton)
        
        If (AddNode) Then
        
            On Error GoTo errh
            Call m_cKey.Add(AddNode, Key)
            
            m_lNodeCount = m_lNodeCount + 1
            If (m_lNodeCount Mod ALLOCATE_SIZE = 1) Then
                ReDim Preserve m_uNodeData(0 To m_lNodeCount + ALLOCATE_SIZE)
            End If
            With m_uNodeData(m_lNodeCount)
                .sKey = Key
                .hNode = AddNode
            End With
        End If
    End If
    Exit Function

errh:
    Call SendMessageLong(m_hTreeView, TVM_DELETEITEM, 0, AddNode)
    AddNode = 0
End Function

Public Sub Clear()
    
    If (m_hTreeView) Then
        
        '-- Delete all TreeView nodes
        Call SendMessageLong(m_hTreeView, TVM_DELETEITEM, 0, TVI_ROOT)
        
        '-- Erase node data array and key collection
        ReDim m_uNodeData(0 To 1)
        Set m_cKey = Nothing
        Set m_cKey = New Collection
        '-- Reset count
        m_lNodeCount = 0
    End If
End Sub

Public Sub HoldDeletePostProcess(ByVal Hold As Boolean)
' Use this carefuly!
' Use when need to do multiple calls to DeleteNode() function in same routine.
' This will prevent an update for each call done to DeleteNode() function.
' Ex.:
'
'   Call ucTreeView.HoldDeletePostProcess(True)  '-> Stops internal update process of collection and array
'   Call ucTreeView.DeleteNode(hNode1)
'   [...]
'   Call ucTreeView.DeleteNode(hNodeN)
'   Call ucTreeView.HoldDeletePostProcess(False) '-> Proceeds to update

    '-- Hold or proceed ?
    m_bHoldDeletePostProcess = Hold
    If (Hold = False) Then
        Call pvDoDeletePostProcess
    End If
End Sub

Public Function DeleteNode(ByVal hNode As Long) As Boolean
  
    If (m_hTreeView) Then
        
        If (SendMessageLong(m_hTreeView, TVM_DELETEITEM, 0, hNode)) Then
            
            '-- Waiting for multiple DeleteNode() calls ?
            If (m_bHoldDeletePostProcess = False) Then
                '-- Let's proceed to update our collection and array
                Call pvDoDeletePostProcess
            End If
            '-- Success
            DeleteNode = True
        End If
    End If
End Function

'== Validating key / Retrieving Key and hNode

Public Function IsValidKey(ByVal Key As String) As Boolean
    
    On Error GoTo errh
    
    Call m_cKey.Add(0, Key)
    Call m_cKey.Remove(m_cKey.Count)
    IsValidKey = True
    Exit Function
    
errh:
End Function

Public Function GetKeyNode(ByVal Key As String) As Long

    If (m_hTreeView) Then
        
        GetKeyNode = m_cKey(Key)
    End If
End Function

Public Function GetNodeKey(ByVal hNode As Long) As String
    
    If (m_hTreeView) Then
        
        GetNodeKey = m_uNodeData(pvTVGetlParam(hNode)).sKey
    End If
End Function

'== Editing labels (Start/End edition from code)

Public Function StartLabelEdit(ByVal hNode As Long) As Boolean
    If (m_hTreeView) Then
        StartLabelEdit = CBool(SendMessageLong(m_hTreeView, TVM_EDITLABEL, 0, hNode))
    End If
End Function
Public Sub EndLabelEdit(ByVal Cancel As Boolean)
    If (m_hTreeView) Then
        Call SendMessageLong(m_hTreeView, TVM_ENDEDITLABELNOW, -Cancel, 0)
    End If
End Sub

'== Visibility / Expanding and Collapsing / Sorting

Public Sub EnsureVisible(ByVal hNode As Long)
    If (m_hTreeView) Then
        Call SendMessageLong(m_hTreeView, TVM_ENSUREVISIBLE, 0, hNode)
    End If
End Sub

Public Sub Expand(ByVal hNode As Long, Optional ByVal ExpandChildren As Boolean = False)
  
  Dim hNext As Long
  
    If (m_hTreeView) Then
        
        Call SendMessageLong(m_hTreeView, TVM_EXPAND, TVE_EXPAND, hNode)
        
        If (ExpandChildren) Then
            hNext = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_CHILD, hNode)
            Do While hNext
                Call Expand(hNext, ExpandChildren:=True)
                hNext = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_NEXT, hNext)
            Loop
        End If
    End If
End Sub

Public Sub Collapse(ByVal hNode As Long, Optional ByVal CollapseChildren As Boolean = False)
  
  Dim hNext As Long
  
    If (m_hTreeView) Then
        
        Call SendMessageLong(m_hTreeView, TVM_EXPAND, TVE_COLLAPSE, hNode)
        
        If (CollapseChildren) Then
            hNext = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_CHILD, hNode)
            Do While hNext
                Call Collapse(hNext, CollapseChildren:=True)
                hNext = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_NEXT, hNext)
            Loop
        End If
    End If
End Sub

Public Sub SortChildren(ByVal hNode As Long, Optional ByVal SortAllLevels As Boolean = False)
'Don't know why, but fRecurse param. is not working.
'So, sort recursively using recursive call.
  
  Dim hNext As Long
    
    If (m_hTreeView) Then
    
        Call SendMessageLong(m_hTreeView, TVM_SORTCHILDREN, 0, hNode)
        
        If (SortAllLevels) Then
            hNext = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_CHILD, hNode)
            Do While hNext
                Call SortChildren(hNext, SortAllLevels:=True)
                hNext = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_NEXT, hNext)
            Loop
        End If
    End If
End Sub

'== HitTest

Public Function HitTest(ByVal X As Long, ByVal Y As Long, Optional ByVal FullRowHit As Boolean = True) As Long
     
  Dim hNode As Long
  Dim fHit  As Long
    
    If (m_hTreeView) Then
        
        Call pvTVHitTest(hNode, fHit)
        
        If (FullRowHit) Then
            HitTest = hNode
          Else
            If (fHit And TVHT_ONITEM) Then
                HitTest = hNode
            End If
        End If
    End If
End Function

'== Scrolling

Public Sub Scroll(ByVal Direction As tvScrollConstants)

    Select Case Direction
    
        Case [sHome]:      Call SendMessageLong(m_hTreeView, WM_VSCROLL, SB_TOP, 0)
        Case [sPageUp]:    Call SendMessageLong(m_hTreeView, WM_VSCROLL, SB_PAGEUP, 0)
        Case [sUp]:        Call SendMessageLong(m_hTreeView, WM_VSCROLL, SB_LINEUP, 0)
        Case [sDown]:      Call SendMessageLong(m_hTreeView, WM_VSCROLL, SB_LINEDOWN, 0)
        Case [sPageDown]:  Call SendMessageLong(m_hTreeView, WM_VSCROLL, SB_PAGEDOWN, 0)
        Case [Send]:       Call SendMessageLong(m_hTreeView, WM_VSCROLL, SB_BOTTOM, 0)
        Case [sLeft]:      Call SendMessageLong(m_hTreeView, WM_HSCROLL, SB_LEFT, 0)
        Case [sPageLeft]:  Call SendMessageLong(m_hTreeView, WM_HSCROLL, SB_PAGELEFT, 0)
        Case [sLineLeft]:  Call SendMessageLong(m_hTreeView, WM_HSCROLL, SB_LINELEFT, 0)
        Case [sLineRight]: Call SendMessageLong(m_hTreeView, WM_HSCROLL, SB_LINERIGHT, 0)
        Case [sPageRight]: Call SendMessageLong(m_hTreeView, WM_HSCROLL, SB_PAGERIGHT, 0)
        Case [sRight]:     Call SendMessageLong(m_hTreeView, WM_HSCROLL, SB_RIGHT, 0)
    End Select
End Sub





'========================================================================================
' Properties: Node
'========================================================================================

'== Node info

Public Property Get SelectedNode() As Long
Attribute SelectedNode.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        SelectedNode = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_CARET, 0)
    End If
End Property
Public Property Let SelectedNode(ByVal hNode As Long)
    If (m_hTreeView) Then
        Call SendMessageLong(m_hTreeView, TVM_SELECTITEM, TVGN_CARET, hNode)
    End If
End Property

Public Property Get NodeChecked(ByVal hNode As Long) As Boolean
Attribute NodeChecked.VB_MemberFlags = "400"
    If (m_hTreeView And m_bCheckBoxes) Then
        NodeChecked = (pvTVGetStateImage(hNode) = SII_CHECKED)
    End If
End Property
Public Property Let NodeChecked(ByVal hNode As Long, ByVal New_NodeChecked As Boolean)
    If (m_hTreeView And m_bCheckBoxes) Then
        If (New_NodeChecked) Then
            Call pvTVSetStateImage(hNode, SII_CHECKED)
          Else
            Call pvTVSetStateImage(hNode, SII_UNCHECKED)
        End If
    End If
End Property

Public Property Get NodeText(ByVal hNode As Long) As String
Attribute NodeText.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        NodeText = pvTVGetText(hNode)
    End If
End Property
Public Property Let NodeText(ByVal hNode As Long, ByVal New_NodeText As String)
    If (m_hTreeView) Then
        Call pvTVSetText(hNode, New_NodeText)
    End If
End Property

Public Property Get NodeImage(ByVal hNode As Long) As Long
Attribute NodeImage.VB_MemberFlags = "400"
  
  Dim lIndex As Long
    
    If (m_hTreeView) Then
        lIndex = pvTVGetImage(hNode)
        If (lIndex < 0 Or lIndex > m_lImageListCount - 1) Then
            NodeImage = -1
          Else
            NodeImage = lIndex
        End If
    End If
End Property
Public Property Let NodeImage(ByVal hNode As Long, ByVal New_NodeImage As Long)
    If (m_hTreeView) Then
        If (New_NodeImage < 0 Or New_NodeImage > m_lImageListCount - 1) Then
            Call pvTVSetImage(hNode, m_lImageListCount)
          Else
            Call pvTVSetImage(hNode, New_NodeImage)
        End If
    End If
End Property

Public Property Get NodeSelectedImage(ByVal hNode As Long) As Long
Attribute NodeSelectedImage.VB_MemberFlags = "400"
  
  Dim lIndex As Long
    
    If (m_hTreeView) Then
        lIndex = pvTVGetSelectedImage(hNode)
        If (lIndex < 0 Or lIndex > m_lImageListCount - 1) Then
            NodeSelectedImage = -1
          Else
            NodeSelectedImage = lIndex
        End If
    End If
End Property
Public Property Let NodeSelectedImage(ByVal hNode As Long, ByVal New_NodeSelectedImage As Long)
    If (m_hTreeView) Then
        If (New_NodeSelectedImage < 0 Or New_NodeSelectedImage > m_lImageListCount - 1) Then
            Call pvTVSetSelectedImage(hNode, m_lImageListCount)
          Else
            Call pvTVSetSelectedImage(hNode, New_NodeSelectedImage)
        End If
    End If
End Property

Public Property Get NodeBold(ByVal hNode As Long) As Boolean
Attribute NodeBold.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        NodeBold = CBool(pvTVGetState(hNode, [eStateBold]))
    End If
End Property
Public Property Let NodeBold(ByVal hNode As Long, ByVal New_NodeBold As Boolean)
    If (m_hTreeView) Then
        Call pvTVSetState(hNode, [eStateBold], New_NodeBold)
    End If
End Property

Public Property Get NodeGhosted(ByVal hNode As Long) As Boolean
Attribute NodeGhosted.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        NodeGhosted = CBool(pvTVGetState(hNode, [eStateCut]))
    End If
End Property
Public Property Let NodeGhosted(ByVal hNode As Long, ByVal New_NodeGhosted As Boolean)
    If (m_hTreeView) Then
        Call pvTVSetState(hNode, [eStateCut], New_NodeGhosted)
    End If
End Property

Public Property Get NodeHilited(ByVal hNode As Long) As Boolean
Attribute NodeHilited.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        NodeHilited = CBool(pvTVGetState(hNode, [eStateDropHilited]))
    End If
End Property
Public Property Let NodeHilited(ByVal hNode As Long, ByVal New_NodeHilited As Boolean)
    If (m_hTreeView) Then
        Call pvTVSetState(hNode, [eStateDropHilited], New_NodeHilited)
    End If
End Property

Public Property Get NodePlusMinusButton(ByVal hNode As Long) As Boolean
Attribute NodePlusMinusButton.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        NodePlusMinusButton = CBool(pvTVGetcChildren(hNode))
    End If
End Property
Public Property Let NodePlusMinusButton(ByVal hNode As Long, ByVal New_NodePlusMinusButton As Boolean)
    If (m_hTreeView) Then
        Call pvTVSetcChildren(hNode, IIf(New_NodePlusMinusButton, 1, 0))
    End If
End Property

'== Node navigation (R.O.)

Public Property Get NodeRoot() As Long
Attribute NodeRoot.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        NodeRoot = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_ROOT, 0)
    End If
End Property

Public Property Get NodeParent(ByVal hNode As Long) As Long
Attribute NodeParent.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        NodeParent = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_PARENT, hNode)
    End If
End Property

Public Property Get NodeChild(ByVal hNode As Long) As Long
Attribute NodeChild.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        NodeChild = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_CHILD, hNode)
    End If
End Property

Public Property Get NodeFirstVisible() As Long
    If (m_hTreeView) Then
        NodeFirstVisible = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_FIRSTVISIBLE, 0)
    End If
End Property

Public Property Get NodeLastVisible() As Long
   
  Dim uTVHI       As TVHITTESTINFO
  Dim rctClient   As RECT2
  Dim lItemHeight As Long
  
    If (m_hTreeView) Then
        
        Call GetClientRect(m_hTreeView, rctClient)
        lItemHeight = SendMessageLong(m_hTreeView, TVM_GETITEMHEIGHT, 0, 0)
        uTVHI.PT.Y = rctClient.y2 - lItemHeight 'First fully visible
        
        Do While uTVHI.PT.Y > -1
        
            Call SendMessage(m_hTreeView, TVM_HITTEST, 0, uTVHI)
            If (uTVHI.hItem) Then
                NodeLastVisible = uTVHI.hItem
                Exit Do
            End If
            uTVHI.PT.Y = uTVHI.PT.Y - lItemHeight
        Loop
    End If
End Property

Public Property Get NodePrevious(ByVal hNode As Long) As Long
Attribute NodePrevious.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        NodePrevious = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_PREVIOUSVISIBLE, hNode)
    End If
End Property

Public Property Get NodeNext(ByVal hNode As Long) As Long
Attribute NodeNext.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        NodeNext = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_NEXTVISIBLE, hNode)
    End If
End Property

Public Property Get NodeFirstSibling(ByVal hNode As Long) As Long
Attribute NodeFirstSibling.VB_MemberFlags = "400"
  
  Dim hPrev As Long
    
    hPrev = hNode
    Do
        NodeFirstSibling = hPrev
        hPrev = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_PREVIOUS, hPrev)
    Loop Until hPrev = 0
End Property

Public Property Get NodeLastSibling(ByVal hNode As Long) As Long
Attribute NodeLastSibling.VB_MemberFlags = "400"
  
  Dim hNext As Long
    
    hNext = hNode
    Do
        NodeLastSibling = hNext
        hNext = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_NEXT, hNext)
    Loop Until hNext = 0
End Property

Public Property Get NodePreviousSibling(ByVal hNode As Long) As Long
Attribute NodePreviousSibling.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        NodePreviousSibling = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_PREVIOUS, hNode)
    End If
End Property

Public Property Get NodeNextSibling(ByVal hNode As Long) As Long
Attribute NodeNextSibling.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        NodeNextSibling = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_NEXT, hNode)
    End If
End Property

Public Property Get NodeVisible(ByVal hNode As Long, Optional ByVal OnlyText As Boolean = False) As Boolean
Attribute NodeVisible.VB_MemberFlags = "400"
  
  Dim uRctWnd As RECT2
  Dim uRctItm As RECT2
  Dim uRctInt As RECT2
    
    If (m_hTreeView) Then
    
        Call GetClientRect(m_hTreeView, uRctWnd)
        uRctItm.x1 = hNode
        Call SendMessage(m_hTreeView, TVM_GETITEMRECT, -OnlyText, uRctItm)
        Call IntersectRect(uRctInt, uRctWnd, uRctItm)
        
        NodeVisible = CBool(EqualRect(uRctInt, uRctItm))
    End If
End Property

'== Node count (Total/Children)

Public Property Get NodeCount() As Long
Attribute NodeCount.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        NodeCount = SendMessageLong(m_hTreeView, TVM_GETCOUNT, 0, 0)
    End If
End Property

Public Property Get NodeChildren(ByVal hNode As Long) As Long
Attribute NodeChildren.VB_MemberFlags = "400"
  
  Dim hNext As Long
    
    If (m_hTreeView) Then
        hNext = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_CHILD, hNode)
        If (hNext) Then
            Do
                NodeChildren = NodeChildren + 1
                hNext = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_NEXT, hNext)
            Loop Until hNext = 0
        End If
    End If
End Property

'== Node full path

Public Property Get NodeFullPath(ByVal hNode As Long, Optional ByVal PathSeparator As String = PATH_SEPARATOR)
Attribute NodeFullPath.VB_MemberFlags = "400"
  
  Dim hParent As Long
    
    If (m_hTreeView) Then
        
        If (hNode) Then
        
            NodeFullPath = pvTVGetText(hNode)
            
            hParent = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_PARENT, hNode)
            Do While hParent
                NodeFullPath = pvTVGetText(hParent) & PathSeparator & NodeFullPath
                hParent = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_PARENT, hParent)
            Loop
        End If
    End If
End Property





'========================================================================================
' Properties: TreeView (appearance/styles)
'========================================================================================
    
Public Property Get hwnd() As Long
    hwnd = m_hTreeView
End Property

Public Property Get BorderStyle() As tvBorderStyleConstants
Attribute BorderStyle.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        BorderStyle = -((GetWindowLong(m_hTreeView, GWL_EXSTYLE) And WS_EX_CLIENTEDGE) = WS_EX_CLIENTEDGE)
    End If
End Property
Public Property Let BorderStyle(ByVal New_BorderStyle As tvBorderStyleConstants)
    If (m_hTreeView) Then
        Select Case New_BorderStyle
            Case [bsNone]
                Call SetWindowLong(m_hTreeView, GWL_EXSTYLE, 0)
            Case [bsFixedSingle]
                Call SetWindowLong(m_hTreeView, GWL_EXSTYLE, WS_EX_CLIENTEDGE)
        End Select
    End If
End Property

Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        BackColor = SendMessageLong(m_hTreeView, TVM_GETBKCOLOR, 0, 0)
    End If
End Property
Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  
  Dim lColor As Long
  
    If (m_hTreeView) Then
        Call OleTranslateColor(New_BackColor, 0, lColor)
        Call SendMessageLong(m_hTreeView, TVM_SETBKCOLOR, 0, lColor)
    End If
End Property

Public Property Get ForeColor() As OLE_COLOR
Attribute ForeColor.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        ForeColor = SendMessageLong(m_hTreeView, TVM_GETTEXTCOLOR, 0, 0)
    End If
End Property
Public Property Let ForeColor(ByVal New_ForeColor As OLE_COLOR)
  
  Dim lColor As Long
  
    If (m_hTreeView) Then
        Call OleTranslateColor(New_ForeColor, 0, lColor)
        Call SendMessageLong(m_hTreeView, TVM_SETTEXTCOLOR, 0, lColor)
    End If
End Property

Public Property Get LineColor() As OLE_COLOR
Attribute LineColor.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        LineColor = SendMessageLong(m_hTreeView, TVM_GETLINECOLOR, 0, 0)
    End If
End Property
Public Property Let LineColor(ByVal New_LineColor As OLE_COLOR)
  
  Dim lColor As Long
  
    If (m_hTreeView) Then
        Call OleTranslateColor(New_LineColor, 0, lColor)
        Call SendMessageLong(m_hTreeView, TVM_SETLINECOLOR, 0, lColor)
    End If
End Property

Public Property Get Font() As StdFont
Attribute Font.VB_MemberFlags = "400"
    Set Font = m_oFont
End Property
Public Property Set Font(ByVal New_Font As StdFont)

  Dim uLogFont As LOGFONT

    If (m_hTreeView) Then
    
        Call pvDestroyFont
        Call pvStdFontToLogFont(m_oFont, uLogFont)
        m_hFont = CreateFontIndirect(uLogFont)
        
        Call SendMessageLong(m_hTreeView, WM_SETFONT, m_hFont, 0)
    End If
End Property
Private Sub m_oFont_FontChanged(ByVal PropertyName As String)
    Set Font = m_oFont
End Sub

Public Property Get ItemHeight() As Long
Attribute ItemHeight.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        ItemHeight = SendMessageLong(m_hTreeView, TVM_GETITEMHEIGHT, 0, 0)
    End If
End Property
Public Property Let ItemHeight(ByVal New_ItemHeight As Long)
    If (m_hTreeView) Then
        Call SendMessageLong(m_hTreeView, TVM_SETITEMHEIGHT, New_ItemHeight, 0)
    End If
End Property

Public Property Get ItemIndent() As Long
Attribute ItemIndent.VB_MemberFlags = "400"
    If (m_hTreeView) Then
        ItemIndent = SendMessageLong(m_hTreeView, TVM_GETINDENT, 0, 0)
    End If
End Property
Public Property Let ItemIndent(ByVal New_ItemIndent As Long)
    If (m_hTreeView) Then
        Call SendMessageLong(m_hTreeView, TVM_SETINDENT, New_ItemIndent, 0)
    End If
End Property

'//

Public Property Get CheckBoxes() As Boolean
Attribute CheckBoxes.VB_MemberFlags = "400"
    CheckBoxes = m_bCheckBoxes
End Property
Public Property Let CheckBoxes(ByVal New_CheckBoxes As Boolean)
  
  Dim lNode As Long
    
    If (m_hTreeView) Then
        m_bCheckBoxes = New_CheckBoxes
        If (m_bCheckBoxes) Then
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, TVS_CHECKBOXES, 0)
          Else
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, 0, TVS_CHECKBOXES)
            For lNode = 1 To m_lNodeCount
                Call pvTVSetStateImage(m_uNodeData(lNode).hNode, 0)
            Next lNode
            Call ImageList_Destroy(SendMessageLong(m_hTreeView, TVM_GETIMAGELIST, TVSIL_STATE, 0))
            '* In fact, TVS_CHECKBOXES is not removed.
            '  TreeView window should be destroyed and created again without this style.
            '  This is an intermediate solution to avoid re-add all nodes and their data.
            '  You'll observe that window max. right coordinate is not updated.
        End If
    End If
End Property

Public Property Get FullRowSelect() As Boolean
Attribute FullRowSelect.VB_MemberFlags = "400"
    FullRowSelect = m_bFullRowSelect
End Property
Public Property Let FullRowSelect(ByVal New_FullRowSelect As Boolean)
    If (m_hTreeView) Then
        m_bFullRowSelect = New_FullRowSelect
        If (m_bFullRowSelect) Then
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, TVS_FULLROWSELECT, 0)
          Else
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, 0, TVS_FULLROWSELECT)
        End If
    End If
End Property

Public Property Get HasButtons() As Boolean
Attribute HasButtons.VB_MemberFlags = "400"
    HasButtons = m_bHasButtons
End Property
Public Property Let HasButtons(ByVal New_HasButtons As Boolean)
    If (m_hTreeView) Then
        m_bHasButtons = New_HasButtons
        If (m_bHasButtons) Then
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, TVS_HASBUTTONS, 0)
          Else
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, 0, TVS_HASBUTTONS)
        End If
    End If
End Property

Public Property Get HasLines() As Boolean
Attribute HasLines.VB_MemberFlags = "400"
    HasLines = m_bHasLines
End Property
Public Property Let HasLines(ByVal New_HasLines As Boolean)
    If (m_hTreeView) Then
        m_bHasLines = New_HasLines
        If (m_bHasLines) Then
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, TVS_HASLINES, 0)
          Else
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, 0, TVS_HASLINES)
        End If
    End If
End Property

Public Property Get HasRootLines() As Boolean
Attribute HasRootLines.VB_MemberFlags = "400"
    HasRootLines = m_bHasRootLines
End Property
Public Property Let HasRootLines(ByVal New_HasRootLines As Boolean)
    If (m_hTreeView) Then
        m_bHasRootLines = New_HasRootLines
        If (m_bHasRootLines) Then
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, TVS_LINESATROOT, 0)
          Else
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, 0, TVS_LINESATROOT)
        End If
    End If
End Property

Public Property Get HideSelection() As Boolean
Attribute HideSelection.VB_MemberFlags = "400"
    HideSelection = m_bHideSelection
End Property
Public Property Let HideSelection(ByVal New_HideSelection As Boolean)
    If (m_hTreeView) Then
        m_bHideSelection = New_HideSelection
        If (m_bHideSelection) Then
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, 0, TVS_SHOWSELALWAYS)
          Else
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, TVS_SHOWSELALWAYS, 0)
        End If
    End If
End Property

Public Property Get LabelEdit() As Boolean
Attribute LabelEdit.VB_MemberFlags = "400"
    LabelEdit = m_bLabelEdit
End Property
Public Property Let LabelEdit(ByVal New_LabelEdit As Boolean)
    If (m_hTreeView) Then
        m_bLabelEdit = New_LabelEdit
        If (m_bLabelEdit) Then
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, TVS_EDITLABELS, 0)
          Else
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, 0, TVS_EDITLABELS)
        End If
    End If
End Property

Public Property Get SingleExpand() As Boolean
Attribute SingleExpand.VB_MemberFlags = "400"
    SingleExpand = m_bSingleExpand
End Property
Public Property Let SingleExpand(ByVal New_SingleExpand As Boolean)
    If (m_hTreeView) Then
        m_bSingleExpand = New_SingleExpand
        If (m_bSingleExpand) Then
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, TVS_SINGLEEXPAND, 0)
          Else
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, 0, TVS_SINGLEEXPAND)
        End If
    End If
End Property

Public Property Get TrackSelect() As Boolean
Attribute TrackSelect.VB_MemberFlags = "400"
    TrackSelect = m_bTrackSelect
End Property
Public Property Let TrackSelect(ByVal New_TrackSelect As Boolean)
    If (m_hTreeView) Then
        m_bTrackSelect = New_TrackSelect
        If (m_bTrackSelect) Then
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, TVS_TRACKSELECT, 0)
          Else
            Call pvSetWndStyle(m_hTreeView, GWL_STYLE, 0, TVS_TRACKSELECT)
        End If
    End If
End Property

Public Property Get Enabled() As Boolean
    Enabled = UserControl.Enabled
End Property
Public Property Let Enabled(ByVal New_Enabled As Boolean)
    If (m_hTreeView) Then
        UserControl.Enabled = New_Enabled
        Call EnableWindow(m_hTreeView, New_Enabled)
    End If
End Property



'========================================================================================
' Private
'========================================================================================

'== Creating/destroying TreeView / Changing window styles

Private Function pvCreateTreeView() As Boolean

  Dim lExStyle As Long
  Dim lTVStyle As Long
    
    '-- Define window style
    lTVStyle = WS_CHILD Or WS_TABSTOP Or TVS_SHOWSELALWAYS
    lExStyle = WS_EX_CLIENTEDGE
    
    '-- Create TreeView window
    m_hTreeView = CreateWindowEx(lExStyle, WC_TREEVIEW, vbNullString, lTVStyle, 0, 0, UserControl.ScaleWidth, UserControl.ScaleHeight, UserControl.hwnd, 0, App.hInstance, ByVal 0)
    
    '-- Success [?]
    If (m_hTreeView) Then
        
        '-- System background and foreground colors
        Call SendMessageLong(m_hTreeView, TVM_SETBKCOLOR, 0, GetSysColor(COLOR_WINDOW))
        Call SendMessageLong(m_hTreeView, TVM_SETTEXTCOLOR, 0, GetSysColor(COLOR_WINDOWTEXT))
        
        '-- Initialize font
        Set m_oFont = Ambient.Font: Call m_oFont_FontChanged(vbNullString)
        
        '-- Show TreeView
        Call ShowWindow(m_hTreeView, SW_SHOW)
        pvCreateTreeView = True
   End If
End Function

Private Sub pvDestroyTreeView()
    
    If (m_hTreeView) Then
        If (DestroyWindow(m_hTreeView)) Then
            m_hTreeView = 0
        End If
    End If
End Sub

Private Sub pvSetWndStyle(ByVal hwnd As Long, ByVal lType As Long, ByVal lStyle As Long, ByVal lStyleNot As Long)

  Dim lS As Long
    
    lS = GetWindowLong(hwnd, lType)
    lS = (lS And Not lStyleNot) Or lStyle
    Call SetWindowLong(hwnd, lType, lS)
    Call SetWindowPos(hwnd, 0, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE Or SWP_NOOWNERZORDER Or SWP_NOZORDER Or SWP_FRAMECHANGED)
End Sub

'== Image list and logical font

Private Function pvSetImageList(ByVal hImageList As Long) As Long
    
    '-- 'Normal' image list
    pvSetImageList = SendMessageLong(m_hTreeView, TVM_SETIMAGELIST, TVSIL_NORMAL, hImageList)
End Function

Private Function pvDestroyImageList() As Boolean

    If (m_hImageList) Then
        If (ImageList_Destroy(m_hImageList)) Then
            pvDestroyImageList = True
            m_hImageList = 0
            m_lImageListCount = 0
        End If
    End If
End Function

Private Sub pvDestroyFont()

    If (m_hFont) Then
        If (DeleteObject(m_hFont)) Then
            m_hFont = 0
        End If
    End If
End Sub

Private Sub pvStdFontToLogFont(oStdFont As StdFont, uLogFont As LOGFONT)
  
  Dim lChar As Long

     With uLogFont
         
         For lChar = 1 To Len(oStdFont.Name)
             .lfFaceName(lChar - 1) = CByte(Asc(Mid$(oStdFont.Name, lChar, 1)))
         Next lChar
         .lfHeight = -MulDiv(oStdFont.Size, GetDeviceCaps(UserControl.hdc, LOGPIXELSY), 72)
         .lfItalic = oStdFont.Italic
         .lfWeight = IIf(oStdFont.Bold, FW_BOLD, FW_NORMAL)
         .lfUnderline = oStdFont.Underline
         .lfStrikeOut = oStdFont.Strikethrough
         .lfCharSet = oStdFont.Charset
    End With
End Sub

'== Some TreeView macros 'Adapted from AllApiDemo by MH

Private Function pvTVAddNode( _
                 ByVal pvlID As Long, _
                 ByVal hRelative As Long, _
                 ByVal eRelation As Long, _
                 ByVal sText As String, _
                 ByVal lImage As Long, _
                 ByVal lSelectedImage As Long, _
                 ByVal bForcePlusButton As Boolean _
                 ) As Long
                 
  Dim uTVIS     As TVINSERTSTRUCT
  Dim uTVI      As TVITEM
  Dim hPrevious As Long
    
    With uTVI
        .mask = TVIF_all
        .lParam = pvlID
        .pszText = StrPtr(StrConv(sText, vbFromUnicode))
        .cchTextMax = Len(sText)
        If (lImage > -1 And lImage < m_lImageListCount) Then
            .iImage = lImage
          Else
            .iImage = m_lImageListCount
        End If
        If (lSelectedImage > -1 And lSelectedImage < m_lImageListCount) Then
            .iSelectedImage = lSelectedImage
          Else
            .iSelectedImage = m_lImageListCount
        End If
        If (bForcePlusButton) Then
            .cChildren = 1
            .mask = .mask Or TVIF_CHILDREN
        End If
    End With
    
    With uTVIS
        .Item = uTVI
        If (hRelative) Then
            .hParent = hRelative
          Else
            .hParent = TVI_ROOT
        End If
        Select Case eRelation
        Case [rFirst]
            .hInsertAfter = TVI_FIRST
        Case [rLast]
            .hInsertAfter = TVI_LAST
        Case [rSort]
            .hInsertAfter = TVI_SORT
        Case [rNext]
            .hParent = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_PARENT, hRelative)
            .hInsertAfter = hRelative
        Case [rPrevious]
            .hParent = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_PARENT, hRelative)
            hPrevious = SendMessageLong(m_hTreeView, TVM_GETNEXTITEM, TVGN_PREVIOUS, hRelative)
            If (hPrevious) Then
                .hInsertAfter = hPrevious
              Else
                .hInsertAfter = TVI_FIRST
            End If
        Case Else
            .hInsertAfter = TVI_LAST
        End Select
    End With
    
    pvTVAddNode = SendMessage(m_hTreeView, TVM_INSERTITEM, 0, uTVIS)
End Function

Private Function pvTVGetText(ByVal hNode As Long) As String
    
  Dim uTVI   As TVITEM
  Dim aBuf() As Byte
                
    ReDim aBuf(MAX_PATH - 1)
    
    With uTVI
        .hItem = hNode
        .mask = TVIF_TEXT
        .pszText = VarPtr(aBuf(0))
        .cchTextMax = MAX_PATH
    End With
    
    If (SendMessage(m_hTreeView, TVM_GETITEM, 0, uTVI)) Then
        pvTVGetText = pvStripNulls(StrConv(aBuf(), vbUnicode))
    End If
End Function
Private Sub pvTVSetText(ByVal hNode As Long, ByVal sText As String)
    
  Dim uTVI As TVITEM
    
    With uTVI
        .hItem = hNode
        .mask = TVIF_TEXT
        .pszText = StrPtr(StrConv(sText, vbFromUnicode))
        .cchTextMax = Len(sText)
    End With
    
    Call SendMessage(m_hTreeView, TVM_SETITEM, 0, uTVI)
End Sub

Private Function pvTVGetlParam(ByVal hNode As Long) As Long
  
  Dim uTVI As TVITEM
    
    With uTVI
        .hItem = hNode
        .mask = TVIF_PARAM
    End With
    
    If (SendMessage(m_hTreeView, TVM_GETITEM, 0, uTVI)) Then
        pvTVGetlParam = uTVI.lParam
    End If
End Function
Private Sub pvTVSetlParam(ByVal hNode As Long, ByVal lParam As Long)

  Dim uTVI As TVITEM
    
    With uTVI
        .hItem = hNode
        .mask = TVIF_PARAM
        .lParam = lParam
    End With
    
    Call SendMessage(m_hTreeView, TVM_SETITEM, 0, uTVI)
End Sub

Private Function pvTVGetImage(ByVal hNode As Long) As Long
  
  Dim uTVI As TVITEM
    
    With uTVI
        .hItem = hNode
        .mask = TVIF_IMAGE
    End With
    
    If (SendMessage(m_hTreeView, TVM_GETITEM, 0, uTVI)) Then
        pvTVGetImage = uTVI.iImage
    End If
End Function
Private Sub pvTVSetImage(ByVal hNode As Long, ByVal lImage As Long)
  
  Dim uTVI As TVITEM
    
    With uTVI
        .hItem = hNode
        .mask = TVIF_IMAGE
        .iImage = lImage
    End With
    Call SendMessage(m_hTreeView, TVM_SETITEM, 0, uTVI)
End Sub

Private Function pvTVGetSelectedImage(ByVal hNode As Long) As Long
  
  Dim uTVI As TVITEM
    
    With uTVI
        .hItem = hNode
        .mask = TVIF_SELECTEDIMAGE
    End With
    
    If (SendMessage(m_hTreeView, TVM_GETITEM, 0, uTVI)) Then
        pvTVGetSelectedImage = uTVI.iSelectedImage
    End If
End Function
Private Sub pvTVSetSelectedImage(ByVal hNode As Long, ByVal lSelectedImage As Long)
  
  Dim uTVI As TVITEM
    
    With uTVI
        .hItem = hNode
        .mask = TVIF_SELECTEDIMAGE
        .iSelectedImage = lSelectedImage
    End With

    Call SendMessage(m_hTreeView, TVM_SETITEM, 0, uTVI)
End Sub

Private Function pvTVGetStateImage(ByVal hNode As Long) As Long
  
  Dim uTVI As TVITEM

    With uTVI
        .hItem = hNode
        .mask = TVIF_HANDLE Or TVIF_STATE
        .stateMask = TVIS_STATEIMAGEMASK
    End With
    
    If (SendMessage(m_hTreeView, TVM_GETITEM, 0, uTVI)) Then
        pvTVGetStateImage = pvSTATEIMAGEMASKTOINDEX(uTVI.State And TVIS_STATEIMAGEMASK)
    End If
End Function
Private Sub pvTVSetStateImage(ByVal hNode As Long, ByVal lIndex As Long)
  
  Dim uTVI As TVITEM

    With uTVI
        .hItem = hNode
        .mask = TVIF_HANDLE Or TVIF_STATE
        .stateMask = TVIS_STATEIMAGEMASK
        .State = pvINDEXTOSTATEIMAGEMASK(lIndex)
    End With

    Call SendMessage(m_hTreeView, TVM_SETITEM, 0, uTVI)
End Sub
Private Function pvINDEXTOSTATEIMAGEMASK(ByVal lIndex As Long) As Long
    pvINDEXTOSTATEIMAGEMASK = lIndex * (2 ^ 12)
End Function
Private Function pvSTATEIMAGEMASKTOINDEX(ByVal lState As Long) As Long
    pvSTATEIMAGEMASKTOINDEX = lState / (2 ^ 12)
End Function

Private Function pvTVGetState(ByVal hNode As Long, ByVal lState As eStateConstants) As Boolean
  
  Dim uTVI As TVITEM

    With uTVI
        .hItem = hNode
        .mask = TVIF_HANDLE Or TVIF_STATE
    End With
    
    If (SendMessage(m_hTreeView, TVM_GETITEM, 0, uTVI)) Then
        pvTVGetState = (uTVI.State And lState)
    End If
End Function
Private Sub pvTVSetState(ByVal hNode As Long, ByVal lState As eStateConstants, ByVal fAdd As Boolean)
  
  Dim uTVI As TVITEM

    With uTVI
        .hItem = hNode
        .mask = TVIF_HANDLE Or TVIF_STATE
        .stateMask = lState
        .State = fAdd And lState
    End With
    
    Call SendMessage(m_hTreeView, TVM_SETITEM, 0, uTVI)
End Sub

Private Function pvTVGetcChildren(ByVal hNode As Long) As Long
  
  Dim uTVI As TVITEM
    
    With uTVI
        .hItem = hNode
        .mask = TVIF_CHILDREN
    End With
    
    If (SendMessage(m_hTreeView, TVM_GETITEM, 0, uTVI)) Then
        pvTVGetcChildren = uTVI.cChildren
    End If
End Function
Private Sub pvTVSetcChildren(ByVal hNode As Long, ByVal cChildren As Long)

  Dim uTVI As TVITEM
    
    With uTVI
        .hItem = hNode
        .mask = TVIF_CHILDREN
        .cChildren = cChildren
    End With
    
    Call SendMessage(m_hTreeView, TVM_SETITEM, 0, uTVI)
End Sub

'//

Private Sub pvTVHitTest(hNode As Long, fHit As Long)

  Dim uTVHI As TVHITTESTINFO
   
    Call GetCursorPos(uTVHI.PT)
    Call ScreenToClient(m_hTreeView, uTVHI.PT)
    
    Call SendMessage(m_hTreeView, TVM_HITTEST, 0, uTVHI)
    With uTVHI
        fHit = .Flags
        hNode = .hItem
    End With
End Sub

'== Post-processing of deleted node(s)

Private Sub pvDoDeletePostProcess()
  
  Dim lNode As Long
  Dim lLast As Long 'Last empty
  Dim uTVI  As TVITEM

    '-- Remove collection items
    For lNode = m_lNodeCount To 1 Step -1
        If (m_uNodeData(lNode).hNode = 0) Then
            Call m_cKey.Remove(m_uNodeData(lNode).sKey)
        End If
    Next lNode

    '-- Remove (move) array items
    uTVI.mask = TVIF_PARAM
    lLast = 0
    For lNode = 1 To m_lNodeCount
        If (m_uNodeData(lNode).hNode = 0) Then
            If lLast = 0 Then lLast = lNode
          Else
            If (lLast) Then
                m_uNodeData(lLast) = m_uNodeData(lNode)
                With uTVI
                    .hItem = m_uNodeData(lLast).hNode
                    .lParam = lLast
                End With
                Call SendMessage(m_hTreeView, TVM_SETITEM, 0, uTVI)
                lLast = lLast + 1
            End If
        End If
    Next lNode
    If (lLast) Then
        m_lNodeCount = lLast - 1
    End If
    
    '-- Resize array
    ReDim Preserve m_uNodeData(0 To m_lNodeCount + ((ALLOCATE_SIZE + 1) - m_lNodeCount Mod ALLOCATE_SIZE))
End Sub

'== String

Private Function pvStripNulls(ByVal sString As String) As String
'From AllApiDemo by MH
    
  Dim lPos As Long

    lPos = InStr(sString, vbNullChar)
    
    If (lPos = 1) Then
        pvStripNulls = vbNullString
    ElseIf (lPos > 1) Then
        pvStripNulls = Left$(sString, lPos - 1)
        Exit Function
    End If
    
    pvStripNulls = sString
End Function

Private Function pvStringFromPointer(ByVal pszText As Long, ByVal cchTextMax As Long) As String
    
  Dim aBuffer() As Byte

    If (lstrlen(pszText) > 1) Then
        
        ReDim aBuffer(0 To cchTextMax - 1) As Byte
        Call CopyMemory(aBuffer(0), ByVal pszText, cchTextMax - 1)
        
        pvStringFromPointer = pvStripNulls(StrConv(aBuffer(), vbUnicode))
    End If
End Function

'== Misc

Private Sub pvGetCursorClientPos(X As Long, Y As Long)

  Dim uPt As POINTAPI

    Call GetCursorPos(uPt)
    Call ScreenToClient(m_hTreeView, uPt)
    X = uPt.X
    Y = uPt.Y
End Sub

Private Function pvButton(ByVal uMsg As Long) As Integer
   
    Select Case uMsg
        Case WM_LBUTTONDOWN, WM_LBUTTONUP
            pvButton = vbLeftButton
        Case WM_RBUTTONDOWN, WM_RBUTTONUP
            pvButton = vbRightButton
        Case WM_MBUTTONDOWN, WM_MBUTTONUP
            pvButton = vbMiddleButton
        Case WM_MOUSEMOVE
            Select Case True
                Case GetAsyncKeyState(vbKeyLButton) < 0
                    pvButton = vbLeftButton
                Case GetAsyncKeyState(vbKeyRButton) < 0
                    pvButton = vbRightButton
                Case GetAsyncKeyState(vbKeyMButton) < 0
                    pvButton = vbMiddleButton
            End Select
    End Select
End Function

Private Function pvShiftState() As Integer

  Dim lS As Integer
   
    If (GetAsyncKeyState(vbKeyShift) < 0) Then
        lS = lS Or vbShiftMask
    End If
    If (GetAsyncKeyState(vbKeyMenu) < 0) Then
        lS = lS Or vbAltMask
    End If
    If (GetAsyncKeyState(vbKeyControl) < 0) Then
        lS = lS Or vbCtrlMask
    End If
    pvShiftState = lS
End Function

'----------------------------------------------------------------------------------------
' MouseEnter/Leave support
'----------------------------------------------------------------------------------------

Private Function pvIsFunctionExported(ByVal sFunction As String, ByVal sModule As String) As Boolean
'-- Determine if the passed function is supported
  
  Dim hMod       As Long
  Dim bLibLoaded As Boolean

    hMod = GetModuleHandleA(sModule)
    
    If (hMod = 0) Then
        hMod = LoadLibraryA(sModule)
        If (hMod) Then
            bLibLoaded = True
        End If
    End If
    
    If (hMod) Then
        If (GetProcAddress(hMod, sFunction)) Then
            pvIsFunctionExported = True
        End If
    End If
    
    If (bLibLoaded) Then
        Call FreeLibrary(hMod)
    End If
End Function

Private Sub pvTrackMouseLeave(ByVal lng_hWnd As Long)
'-- Track the mouse leaving the indicated window
  
  Dim uTME As TRACKMOUSEEVENT_STRUCT
    
    If (m_bTrack) Then
    
        With uTME
            .cbSize = Len(uTME)
            .dwFlags = TME_LEAVE
            .hwndTrack = lng_hWnd
        End With
    
        If (m_bTrackUser32) Then
            Call TrackMouseEvent(uTME)
          Else
            Call TrackMouseEventComCtl(uTME)
        End If
    End If
End Sub

'----------------------------------------------------------------------------------------
' OLEInPlaceActivateObject interface
'----------------------------------------------------------------------------------------

Private Sub pvSetIPAO()

  Dim pOleObject          As IOleObject
  Dim pOleInPlaceSite     As IOleInPlaceSite
  Dim pOleInPlaceFrame    As IOleInPlaceFrame
  Dim pOleInPlaceUIWindow As IOleInPlaceUIWindow
  Dim rcPos               As RECT2
  Dim rcClip              As RECT2
  Dim uFrameInfo          As OLEINPLACEFRAMEINFO
       
    On Error Resume Next
    
    Set pOleObject = Me
    Set pOleInPlaceSite = pOleObject.GetClientSite
    
    If (Not pOleInPlaceSite Is Nothing) Then
        Call pOleInPlaceSite.GetWindowContext(pOleInPlaceFrame, pOleInPlaceUIWindow, VarPtr(rcPos), VarPtr(rcClip), VarPtr(uFrameInfo))
        If (Not pOleInPlaceFrame Is Nothing) Then
            Call pOleInPlaceFrame.SetActiveObject(m_uIPAO.ThisPointer, vbNullString)
        End If
        If (Not pOleInPlaceUIWindow Is Nothing) Then 'And Not m_bMouseActivate
            Call pOleInPlaceUIWindow.SetActiveObject(m_uIPAO.ThisPointer, vbNullString)
          Else
            Call pOleObject.DoVerb(OLEIVERB_UIACTIVATE, 0, pOleInPlaceSite, 0, UserControl.hwnd, VarPtr(rcPos))
        End If
    End If
    
    On Error GoTo 0
End Sub

Friend Function frTranslateAccel(pMsg As Msg) As Boolean
    
  Dim pOleObject      As IOleObject
  Dim pOleControlSite As IOleControlSite
  Dim hEdit           As Long
  
    On Error Resume Next
    
    Select Case pMsg.message
    
        Case WM_KEYDOWN, WM_KEYUP
        
            Select Case pMsg.wParam
            
                Case vbKeyTab
                    
                    If (pvShiftState() And vbCtrlMask) Then
                        Set pOleObject = Me
                        Set pOleControlSite = pOleObject.GetClientSite
                        If (Not pOleControlSite Is Nothing) Then
                            Call pOleControlSite.TranslateAccelerator(VarPtr(pMsg), pvShiftState() And vbShiftMask)
                        End If
                    End If
                    frTranslateAccel = False
                    
                Case vbKeyUp, vbKeyDown, vbKeyLeft, vbKeyRight, vbKeyHome, vbKeyEnd, vbKeyPageDown, vbKeyPageUp
                    
                    With pMsg
                        Call SendMessageLong(m_hTreeView, .message, .wParam, .lParam)
                    End With
                    frTranslateAccel = True
            End Select
    End Select
    
    On Error GoTo 0
End Function

'========================================================================================
' Subclass code - The programmer may call any of the following Subclass_??? routines
'========================================================================================

'Add a message to the table of those that will invoke a callback. You should Subclass_Start first and then add the messages
Private Sub Subclass_AddMsg(ByVal lhWnd As Long, ByVal uMsg As Long, Optional ByVal When As eMsgWhen = MSG_AFTER)
'Parameters:
  'lhWnd  - The handle of the window for which the uMsg is to be added to the callback table
  'uMsg      - The message number that will invoke a callback. NB Can also be ALL_MESSAGES, ie all messages will callback
  'When      - Whether the msg is to callback before, after or both with respect to the the default (previous) handler
  With sc_aSubData(zIdx(lhWnd))
    If When And eMsgWhen.MSG_BEFORE Then
      Call zAddMsg(uMsg, .aMsgTblB, .nMsgCntB, eMsgWhen.MSG_BEFORE, .nAddrSub)
    End If
    If When And eMsgWhen.MSG_AFTER Then
      Call zAddMsg(uMsg, .aMsgTblA, .nMsgCntA, eMsgWhen.MSG_AFTER, .nAddrSub)
    End If
  End With
End Sub

'Delete a message from the table of those that will invoke a callback.
'Private Sub Subclass_DelMsg(ByVal lhWnd As Long, ByVal uMsg As Long, Optional ByVal When As eMsgWhen = MSG_AFTER)
''Parameters:
'  'lhWnd  - The handle of the window for which the uMsg is to be removed from the callback table
'  'uMsg      - The message number that will be removed from the callback table. NB Can also be ALL_MESSAGES, ie all messages will callback
'  'When      - Whether the msg is to be removed from the before, after or both callback tables
'  With sc_aSubData(zIdx(lhWnd))
'    If When And eMsgWhen.MSG_BEFORE Then
'      Call zDelMsg(uMsg, .aMsgTblB, .nMsgCntB, eMsgWhen.MSG_BEFORE, .nAddrSub)
'    End If
'    If When And eMsgWhen.MSG_AFTER Then
'      Call zDelMsg(uMsg, .aMsgTblA, .nMsgCntA, eMsgWhen.MSG_AFTER, .nAddrSub)
'    End If
'  End With
'End Sub

'Return whether we're running in the IDE.
Private Function Subclass_InIDE() As Boolean
  Debug.Assert zSetTrue(Subclass_InIDE)
End Function

'Start subclassing the passed window handle
Private Function Subclass_Start(ByVal lhWnd As Long) As Long
'Parameters:
  'lhWnd  - The handle of the window to be subclassed
'Returns;
  'The sc_aSubData() index
  Dim i                       As Long                                                   'Loop index
  Dim j                       As Long                                                   'Loop index
  Dim nSubIdx                 As Long                                                   'Subclass data index
  Dim sSubCode                As String                                                 'Subclass code string
Const PUB_CLASSES             As Long = 0                                               'The number of UserControl public classes
Const GMEM_FIXED              As Long = 0                                               'Fixed memory GlobalAlloc flag
Const PAGE_EXECUTE_READWRITE  As Long = &H40&                                           'Allow memory to execute without violating XP SP2 Data Execution Prevention
Const PATCH_01                As Long = 18                                              'Code buffer offset to the location of the relative address to EbMode
Const PATCH_02                As Long = 68                                              'Address of the previous WndProc
Const PATCH_03                As Long = 78                                              'Relative address of SetWindowsLong
Const PATCH_06                As Long = 116                                             'Address of the previous WndProc
Const PATCH_07                As Long = 121                                             'Relative address of CallWindowProc
Const PATCH_0A                As Long = 186                                             'Address of the owner object
Const FUNC_CWP                As String = "CallWindowProcA"                             'We use CallWindowProc to call the original WndProc
Const FUNC_EBM                As String = "EbMode"                                      'VBA's EbMode function allows the machine code thunk to know if the IDE has stopped or is on a breakpoint
Const FUNC_SWL                As String = "SetWindowLongA"                              'SetWindowLongA allows the cSubclasser machine code thunk to unsubclass the subclasser itself if it detects via the EbMode function that the IDE has stopped
Const MOD_USER                As String = "user32"                                      'Location of the SetWindowLongA & CallWindowProc functions
Const MOD_VBA5                As String = "vba5"                                        'Location of the EbMode function if running VB5
Const MOD_VBA6                As String = "vba6"                                        'Location of the EbMode function if running VB6

'If it's the first time through here..
  If sc_aBuf(1) = 0 Then

'Build the hex pair subclass string
    sSubCode = "5589E583C4F85731C08945FC8945F8EB0EE80000000083F802742185C07424E830000000837DF800750AE838000000E84D00" & _
               "00005F8B45FCC9C21000E826000000EBF168000000006AFCFF7508E800000000EBE031D24ABF00000000B900000000E82D00" & _
               "0000C3FF7514FF7510FF750CFF75086800000000E8000000008945FCC331D2BF00000000B900000000E801000000C3E33209" & _
               "C978078B450CF2AF75278D4514508D4510508D450C508D4508508D45FC508D45F85052B800000000508B00FF90" & _
               Hex$(&HA4 + (PUB_CLASSES * 12)) & "070000C3"
    
'Convert the string from hex pairs to bytes and store in the machine code buffer
    i = 1
    Do While j < CODE_LEN
      j = j + 1
      sc_aBuf(j) = CByte("&H" & Mid$(sSubCode, i, 2))                                   'Convert a pair of hex characters to an eight-bit value and store in the static code buffer array
      i = i + 2
    Loop                                                                                'Next pair of hex characters
    
'Get API function addresses
    If Subclass_InIDE Then                                                              'If we're running in the VB IDE
      sc_aBuf(16) = &H90                                                                'Patch the code buffer to enable the IDE state code
      sc_aBuf(17) = &H90                                                                'Patch the code buffer to enable the IDE state code
      sc_pEbMode = zAddrFunc(MOD_VBA6, FUNC_EBM)                                        'Get the address of EbMode in vba6.dll
      If sc_pEbMode = 0 Then                                                            'Found?
        sc_pEbMode = zAddrFunc(MOD_VBA5, FUNC_EBM)                                      'VB5 perhaps
      End If
    End If
    
    Call zPatchVal(VarPtr(sc_aBuf(1)), PATCH_0A, ObjPtr(Me))                            'Patch the address of this object instance into the static machine code buffer
    
    sc_pCWP = zAddrFunc(MOD_USER, FUNC_CWP)                                             'Get the address of the CallWindowsProc function
    sc_pSWL = zAddrFunc(MOD_USER, FUNC_SWL)                                             'Get the address of the SetWindowLongA function
    ReDim sc_aSubData(0 To 0) As tSubData                                               'Create the first sc_aSubData element
  Else
    nSubIdx = zIdx(lhWnd, True)
    If nSubIdx = -1 Then                                                                'If an sc_aSubData element isn't being re-cycled
      nSubIdx = UBound(sc_aSubData()) + 1                                               'Calculate the next element
      ReDim Preserve sc_aSubData(0 To nSubIdx) As tSubData                              'Create a new sc_aSubData element
    End If
    
    Subclass_Start = nSubIdx
  End If

  With sc_aSubData(nSubIdx)
    .sCode = sc_aBuf
    .nAddrSub = StrPtr(.sCode)
    '.nAddrSub = GlobalAlloc(GMEM_FIXED, CODE_LEN)                                       'Allocate memory for the machine code WndProc
    Call VirtualProtect(ByVal .nAddrSub, CODE_LEN, PAGE_EXECUTE_READWRITE, i)           'Mark memory as executable
    'Call RtlMoveMemory(ByVal .nAddrSub, sc_aBuf(1), CODE_LEN)                           'Copy the machine code from the static byte array to the code array in sc_aSubData
    
    .hwnd = lhWnd                                                                       'Store the hWnd
    .nAddrOrig = SetWindowLongA(.hwnd, GWL_WNDPROC, .nAddrSub)                          'Set our WndProc in place
    
    Call zPatchRel(.nAddrSub, PATCH_01, sc_pEbMode)                                     'Patch the relative address to the VBA EbMode api function, whether we need to not.. hardly worth testing
    Call zPatchVal(.nAddrSub, PATCH_02, .nAddrOrig)                                     'Original WndProc address for CallWindowProc, call the original WndProc
    Call zPatchRel(.nAddrSub, PATCH_03, sc_pSWL)                                        'Patch the relative address of the SetWindowLongA api function
    Call zPatchVal(.nAddrSub, PATCH_06, .nAddrOrig)                                     'Original WndProc address for SetWindowLongA, unsubclass on IDE stop
    Call zPatchRel(.nAddrSub, PATCH_07, sc_pCWP)                                        'Patch the relative address of the CallWindowProc api function
  End With
End Function

'Stop all subclassing
Private Sub Subclass_StopAll()
  Dim i As Long
  
  i = UBound(sc_aSubData())                                                             'Get the upper bound of the subclass data array
  Do While i >= 0                                                                       'Iterate through each element
    With sc_aSubData(i)
      If .hwnd <> 0 Then                                                                'If not previously Subclass_Stop'd
        Call Subclass_Stop(.hwnd)                                                       'Subclass_Stop
      End If
    End With
    
    i = i - 1                                                                           'Next element
  Loop
End Sub

'Stop subclassing the passed window handle
Private Sub Subclass_Stop(ByVal lhWnd As Long)
'Parameters:
  'lhWnd  - The handle of the window to stop being subclassed
  With sc_aSubData(zIdx(lhWnd))
    Call SetWindowLongA(.hwnd, GWL_WNDPROC, .nAddrOrig)                                 'Restore the original WndProc
    Call zPatchVal(.nAddrSub, PATCH_05, 0)                                              'Patch the Table B entry count to ensure no further 'before' callbacks
    Call zPatchVal(.nAddrSub, PATCH_09, 0)                                              'Patch the Table A entry count to ensure no further 'after' callbacks
    'Call GlobalFree(.nAddrSub)                                                          'Release the machine code memory
    .hwnd = 0                                                                           'Mark the sc_aSubData element as available for re-use
    .nMsgCntB = 0                                                                       'Clear the before table
    .nMsgCntA = 0                                                                       'Clear the after table
    Erase .aMsgTblB                                                                     'Erase the before table
    Erase .aMsgTblA                                                                     'Erase the after table
  End With
End Sub

'----------------------------------------------------------------------------------------
'These z??? routines are exclusively called by the Subclass_??? routines.
'----------------------------------------------------------------------------------------

'Worker sub for Subclass_AddMsg
Private Sub zAddMsg(ByVal uMsg As Long, ByRef aMsgTbl() As Long, ByRef nMsgCnt As Long, ByVal When As eMsgWhen, ByVal nAddr As Long)
  Dim nEntry  As Long                                                                   'Message table entry index
  Dim nOff1   As Long                                                                   'Machine code buffer offset 1
  Dim nOff2   As Long                                                                   'Machine code buffer offset 2
  
  If uMsg = ALL_MESSAGES Then                                                           'If all messages
    nMsgCnt = ALL_MESSAGES                                                              'Indicates that all messages will callback
  Else                                                                                  'Else a specific message number
    Do While nEntry < nMsgCnt                                                           'For each existing entry. NB will skip if nMsgCnt = 0
      nEntry = nEntry + 1
      
      If aMsgTbl(nEntry) = 0 Then                                                       'This msg table slot is a deleted entry
        aMsgTbl(nEntry) = uMsg                                                          'Re-use this entry
        Exit Sub                                                                        'Bail
      ElseIf aMsgTbl(nEntry) = uMsg Then                                                'The msg is already in the table!
        Exit Sub                                                                        'Bail
      End If
    Loop                                                                                'Next entry

    nMsgCnt = nMsgCnt + 1                                                               'New slot required, bump the table entry count
    ReDim Preserve aMsgTbl(1 To nMsgCnt) As Long                                        'Bump the size of the table.
    aMsgTbl(nMsgCnt) = uMsg                                                             'Store the message number in the table
  End If

  If When = eMsgWhen.MSG_BEFORE Then                                                    'If before
    nOff1 = PATCH_04                                                                    'Offset to the Before table
    nOff2 = PATCH_05                                                                    'Offset to the Before table entry count
  Else                                                                                  'Else after
    nOff1 = PATCH_08                                                                    'Offset to the After table
    nOff2 = PATCH_09                                                                    'Offset to the After table entry count
  End If

  If uMsg <> ALL_MESSAGES Then
    Call zPatchVal(nAddr, nOff1, VarPtr(aMsgTbl(1)))                                    'Address of the msg table, has to be re-patched because Redim Preserve will move it in memory.
  End If
  Call zPatchVal(nAddr, nOff2, nMsgCnt)                                                 'Patch the appropriate table entry count
End Sub

'Return the memory address of the passed function in the passed dll
Private Function zAddrFunc(ByVal sDLL As String, ByVal sProc As String) As Long
  zAddrFunc = GetProcAddress(GetModuleHandleA(sDLL), sProc)
  Debug.Assert zAddrFunc                                                                'You may wish to comment out this line if you're using vb5 else the EbMode GetProcAddress will stop here everytime because we look for vba6.dll first
End Function

'Worker sub for Subclass_DelMsg
'Private Sub zDelMsg(ByVal uMsg As Long, ByRef aMsgTbl() As Long, ByRef nMsgCnt As Long, ByVal When As eMsgWhen, ByVal nAddr As Long)
'  Dim nEntry As Long
'
'  If uMsg = ALL_MESSAGES Then                                                           'If deleting all messages
'    nMsgCnt = 0                                                                         'Message count is now zero
'    If When = eMsgWhen.MSG_BEFORE Then                                                  'If before
'      nEntry = PATCH_05                                                                 'Patch the before table message count location
'    Else                                                                                'Else after
'      nEntry = PATCH_09                                                                 'Patch the after table message count location
'    End If
'    Call zPatchVal(nAddr, nEntry, 0)                                                    'Patch the table message count to zero
'  Else                                                                                  'Else deleteting a specific message
'    Do While nEntry < nMsgCnt                                                           'For each table entry
'      nEntry = nEntry + 1
'      If aMsgTbl(nEntry) = uMsg Then                                                    'If this entry is the message we wish to delete
'        aMsgTbl(nEntry) = 0                                                             'Mark the table slot as available
'        Exit Do                                                                         'Bail
'      End If
'    Loop                                                                                'Next entry
'  End If
'End Sub

'Get the sc_aSubData() array index of the passed hWnd
Private Function zIdx(ByVal lhWnd As Long, Optional ByVal bAdd As Boolean = False) As Long
'Get the upper bound of sc_aSubData() - If you get an error here, you're probably Subclass_AddMsg-ing before Subclass_Start
  zIdx = UBound(sc_aSubData)
  Do While zIdx >= 0                                                                    'Iterate through the existing sc_aSubData() elements
    With sc_aSubData(zIdx)
      If .hwnd = lhWnd Then                                                             'If the hWnd of this element is the one we're looking for
        If Not bAdd Then                                                                'If we're searching not adding
          Exit Function                                                                 'Found
        End If
      ElseIf .hwnd = 0 Then                                                             'If this an element marked for reuse.
        If bAdd Then                                                                    'If we're adding
          Exit Function                                                                 'Re-use it
        End If
      End If
    End With
    zIdx = zIdx - 1                                                                     'Decrement the index
  Loop
  
  If Not bAdd Then
    Debug.Assert False                                                                  'hWnd not found, programmer error
  End If

'If we exit here, we're returning -1, no freed elements were found
End Function

'Patch the machine code buffer at the indicated offset with the relative address to the target address.
Private Sub zPatchRel(ByVal nAddr As Long, ByVal nOffset As Long, ByVal nTargetAddr As Long)
  Call RtlMoveMemory(ByVal nAddr + nOffset, nTargetAddr - nAddr - nOffset - 4, 4)
End Sub

'Patch the machine code buffer at the indicated offset with the passed value
Private Sub zPatchVal(ByVal nAddr As Long, ByVal nOffset As Long, ByVal nValue As Long)
  Call RtlMoveMemory(ByVal nAddr + nOffset, nValue, 4)
End Sub

'Worker function for Subclass_InIDE
Private Function zSetTrue(ByRef bValue As Boolean) As Boolean
  zSetTrue = True
  bValue = True
End Function
