VERSION 5.00
Begin VB.UserControl ucListView 
   AutoRedraw      =   -1  'True
   ClientHeight    =   1800
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3045
   ClipControls    =   0   'False
   FillColor       =   &H80000008&
   HasDC           =   0   'False
   ScaleHeight     =   120
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   203
End
Attribute VB_Name = "ucListView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'========================================================================================
' User control:  ucListView.ctl
' Author:        Carles P.V. (*)
' Dependencies:  mIOleInPlaceActivate.bas -> OleGuids.tlb (in IDE only)
'                mListViewEx.bas
' Last revision: 2004.12.09
' Version:       1.4.4
'----------------------------------------------------------------------------------------
'
' (*) based on:
'
'     - vbalListViewCtl by Steve McMahon - 2003
'       http://vbaccelerator.com/home/VB/Code/Controls/ListView/article.asp
'
'     - Common Control Routines
'       http://vbnet.mvps.org/index.html?code/comctl
'
'     - MSDN
'       http://msdn.microsoft.com/library/en-us/shellcc/platform/commctls/listview/reflist.asp
'----------------------------------------------------------------------------------------
'
'     Self-Subclassing UserControl template (IDE safe).
'
'     From original post by Paul Caton:
'
'     Self-subclassing Controls/Forms - NO dependencies
'     http://www.planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeId=54117&lngWId=1
'
'----------------------------------------------------------------------------------------
'
'     Traping TabStop + navigation keys.
'
'     From original post by Vlad Vissoultchev:
'
'     How to capture Tab/Enter/Esc on your custom UserControl
'     http://www.planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeId=41506&lngWId=1
'
'========================================================================================
'
' History:
'
'   * 1.0.0: - First release.
'   * 1.1.x: - Added Sort() function.
'   * 1.2.x: - Added Header (column) image support.
'   * 1.3.x: - Improved Header image support and added ColumnFixedWidth property.
'   * 1.4.0: - Added basic custom-draw support (Text fore and back color) in [Details] mode.
'              Notice: Chain of draw-stage notifications is a per-item chain (row). If desired
'                      effect is, for example, highlighting a column, you should specify next
'                      subitems (columns) colors, that is, restore to default.
'            - Added Refresh() Method.
'   * 1.4.1: - Fixed custom-draw routine. Crash when XP theme enabled ([Details] mode).
'              Thanks to Dana Seaman.
'   * 1.4.2: - Custom image size for image-lists).
'              Thanks to Dana Seaman for suggestion.
'   * 1.4.3: - Faster Sort routines: LVM_SORTITEMSEX instead of LVM_SORTITEMS
'              Callback lparam1 and lparam2 are already indexes of both compared items.
'   * 1.4.4: - Fixed crash when XP theme enabled.
'              Cause: when custom-draw (report) the uNMH.hwndFrom param. was not checked.
'========================================================================================
'
' Important:
'
'   Item, column and image (icon) indexing is zero-based.
'
' Quick reference:
'
'   Methods:
'
'     - F  Initialize() :Boolean
'     - F  InitializeImageListSmall([ImageWidth], [ImageHeight]) :Boolean
'     - F  InitializeImageListLarge([ImageWidth], [ImageHeight]) :Boolean
'     - F  InitializeImageListHeader([ImageWidth], [ImageHeight]) :Boolean
'     - S  Refresh()
'
'     - F  Clear() :Boolean
'     - F  Sort([Column], [<SortOrder>], [<SortType>]) :Boolean
'     - F  BackgroundPictureSet(URL) :Boolean
'
'     - F  ColumnAdd(Column, Text, Width, [<Align>], [Icon]) :Boolean
'     - F  ColumnRemove(Column) :Boolean
'     - F  ColumnAutosize(Column, [<AutosizeType>]) :Boolean
'
'     - F  ItemAdd(Item, Text, Icon, Indent) :Boolean
'     - F  ItemRemove(Item) :Boolean
'     - F  ItemEnsureVisible(Item) :Boolean
'     - F  ItemFindText(Text, [StartItem], [<Coincidence>]) :Long
'     - F  ItemFindState(Text, [StartItem], [<State>]) :Long
'     - F  ItemHitTest(x, y) :Long
'     - F  SubItemSet(Item, SubItem, Text, Icon) :Boolean
'
'     - F  ImageListSmall_AddBitmap(hBitmap, [MaskColor]) :Long
'     - F  ImageListSmall_AddIcon(hIcon) :Long
'     - F  ImageListLarge_AddBitmap(hBitmap, [MaskColor]) :Long
'     - F  ImageListLarge_AddIcon(hIcon) :Long
'     - F  ImageListHeader_AddBitmap(hBitmap, [MaskColor]) :Long
'     - F  ImageListHeader_AddIcon(hIcon) :Long
'
'   Properties (run-time):
'
'     - RW ColumnText(Column) :String
'     - RW ColumnWidth(Column) :Long
'     - RW ColumnAlign(Column) :eColumnAlignConstants
'     - RW ColumnIcon(Column) :Long
'
'     - RW ItemText(Item) :String
'     - RW ItemIcon(Item) :Long
'     - RW ItemIndent(Item) :Long
'     - RW ItemSelected(Item) :Boolean (Item = -1 -> all items)
'     - RW ItemFocused(Item) :Boolean
'     - RW ItemChecked(Item) :Boolean (Item = -1 -> all items)
'     - RW ItemGhosted(Item) :Boolean (Item = -1 -> all items)
'     - RW SubItemText(Item, SubItem) :String
'     - RW SubItemIcon(Item, SubItem) :Long
'
'     - RW BackColor() :OLE_COLOR
'     - RW BorderStyle() :eBorderStyleConstants
'     - R  ColumnCount() :Long
'     - R  Count() :Long
'     - RW CheckBoxes() :Boolean
'     - RW Enabled() :Boolean
'     - RW Font() :StdFont
'     - RW ForeColor() :OLE_COLOR
'     - RW FullRowSelect() :Boolean
'     - RW GridLines() :Boolean
'     - RW HeaderDragDrop() :Boolean
'     - RW HeaderFixedWidth() :Boolean
'     - RW HeaderFlat() :Boolean
'     - RW HeaderHide() :Boolean
'     - RW HideSelection() Boolean
'     - RW LabelEdit() :Boolean
'     - RW LabelTips() :Boolean
'     - RW MultiSelect() :Boolean
'     - RW OneClickActivate() :Boolean
'     - RW RaiseSubItemPrePaint() :Boolean
'     - RW ScaleMode() :ScaleModeConstants
'     - RW ScrollBarFlat() :Boolean
'     - R  SelectedCount() :Long
'     - RW SubItemImages() :Boolean
'     - RW TrackSelect() :Boolean
'     - RW UnderlineHot() :Boolean
'     - RW ViewMode() :eViewModeConstants
'
'   Events:
'     -    Click()
'     -    DblClick()
'     -    ItemClick(Item)
'     -    ItemCheck(Item)
'     -    ColumnClick(Column)
'     -    ColumnRightClick(Column)
'     -    KeyDown(KeyCode, Shift)
'     -    KeyPress(KeyAscii)
'     -    KeyUp(KeyCode, Shift)
'     -    MouseDown(Button, Shift, x, y)
'     -    MouseMove(Button, Shift, x, y)
'     -    MouseUp(Button, Shift, x, y)
'     -    MouseEnter()
'     -    MouseLeave()
'     -    BeforeLabelEdit(Cancel)
'     -    AfterLabelEdit(Cancel, NewString)
'     -    Resize()
'     -    OnSubItemPrePaint(Item, SubItem, TextBackColor, TextForeColor, Process)
'========================================================================================
'
'  Known issues:
'
'    * SubItem background incorrectly drawn (image not painted or background erased) when:
'      Background image + [vmDetails] ViewMode + FullRowSelect + SubItemImages
'      Solution?: Trap NM_CUSTOMDRAW notification -> fix SubItem draw.
'                 NM_CUSTOMDRAW: dwDrawStage:CDDS_PREPAINT -> CDRF_NOTIFYITEMDRAW
'                 NM_CUSTOMDRAW: dwDrawStage:CDDS_ITEMPREPAINT -> CDRF_NOTIFYSUBITEMDRAW
'                 NM_CUSTOMDRAW: dwDrawStage:CDDS_SUBITEM | CDDS_ITEMPREPAINT -> ...
'
'    * Slow sorting routines ?
'========================================================================================

Option Explicit

'-- API

'= Common controls initialization =======================================================

Private Declare Sub InitCommonControls Lib "Comctl32" ()

'= Misc =================================================================================

Private Type POINTAPI
    X As Long
    Y As Long
End Type

Private Type RECT2
    x1 As Long
    y1 As Long
    x2 As Long
    y2 As Long
End Type

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

Private Const LOGPIXELSY             As Long = 90
Private Const FW_NORMAL              As Long = 400
Private Const FW_BOLD                As Long = 700
Private Const FF_DONTCARE            As Long = 0
Private Const DEFAULT_QUALITY        As Long = 0
Private Const DEFAULT_PITCH          As Long = 0
Private Const DEFAULT_CHARSET        As Long = 1
Private Const NONANTIALIASED_QUALITY As Long = 3

Private Const CLR_NONE               As Long = &HFFFFFFFF

Private Declare Function GetClientRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT2) As Long
Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Private Declare Function ScreenToClient Lib "user32" (ByVal hwnd As Long, lpPoint As POINTAPI) As Long
Private Declare Function OleTranslateColor Lib "olepro32" (ByVal OLE_COLOR As Long, ByVal hPalette As Long, pccolorref As Long) As Long
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As String) As Long
Private Declare Function SetFocus Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetDeviceCaps Lib "gdi32" (ByVal hdc As Long, ByVal nIndex As Long) As Long
Private Declare Function CreateFontIndirect Lib "gdi32" Alias "CreateFontIndirectA" (lpLogFont As LOGFONT) As Long
Private Declare Function MulDiv Lib "kernel32" (ByVal nNumber As Long, ByVal nNumerator As Long, ByVal nDenominator As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function GetFocus Lib "user32.dll" () As Long

'//
Private Declare Function SetCapture Lib "user32.dll" (ByVal hwnd As Long) As Long
Private Declare Function ReleaseCapture Lib "user32.dll" () As Long
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Private Declare Function LoadLibraryA Lib "kernel32" (ByVal lpLibFileName As String) As Long
Private Declare Function TrackMouseEvent Lib "user32" (lpEventTrack As TRACKMOUSEEVENT_STRUCT) As Long
Private Declare Function TrackMouseEventComCtl Lib "Comctl32" Alias "_TrackMouseEvent" (lpEventTrack As TRACKMOUSEEVENT_STRUCT) As Long

Private Const WM_MOUSELEAVE As Long = &H2A3

Private Enum TRACKMOUSEEVENT_FLAGS
    [TME_HOVER] = &H1&
    [TME_LEAVE] = &H2&
    [TME_QUERY] = &H40000000
    [TME_CANCEL] = &H80000000
End Enum

Private Type TRACKMOUSEEVENT_STRUCT
    cbSize      As Long
    dwFlags     As TRACKMOUSEEVENT_FLAGS
    hwndTrack   As Long
    dwHoverTime As Long
End Type

'= Window general =======================================================================

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpDst As Any, lpSrc As Any, ByVal Length As Long)
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

Private Declare Function CreateWindowEx Lib "user32" Alias "CreateWindowExA" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, lpParam As Any) As Long
Private Declare Function DestroyWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function EnableWindow Lib "user32" (ByVal hwnd As Long, ByVal fEnable As Long) As Long

Private Const GWL_STYLE        As Long = (-16)
Private Const GWL_EXSTYLE      As Long = (-20)
Private Const WS_EX_TOPMOST    As Long = &H8&
Private Const WS_EX_WINDOWEDGE As Long = &H100&
Private Const WS_EX_CLIENTEDGE As Long = &H200&
Private Const WS_EX_STATICEDGE As Long = &H20000
Private Const WS_TABSTOP       As Long = &H10000
Private Const WS_THICKFRAME    As Long = &H40000
Private Const WS_BORDER        As Long = &H800000
Private Const WS_DISABLED      As Long = &H8000000
Private Const WS_VISIBLE       As Long = &H10000000
Private Const WS_CHILD         As Long = &H40000000

Private Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Private Const SW_SHOW  As Long = 5
Private Const GW_CHILD As Long = 5

Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Const SWP_NOMOVE        As Long = &H2
Private Const SWP_NOSIZE        As Long = &H1
Private Const SWP_NOOWNERZORDER As Long = &H200
Private Const SWP_NOZORDER      As Long = &H4
Private Const SWP_FRAMECHANGED  As Long = &H20

'= ListView =============================================================================

Private Const LVS_EX_GRIDLINES         As Long = &H1&
Private Const LVS_EX_SUBITEMIMAGES     As Long = &H2&
Private Const LVS_EX_CHECKBOXES        As Long = &H4&
Private Const LVS_EX_TRACKSELECT       As Long = &H8&
Private Const LVS_EX_HEADERDRAGDROP    As Long = &H10&
Private Const LVS_EX_FULLROWSELECT     As Long = &H20&
Private Const LVS_EX_ONECLICKACTIVATE  As Long = &H40&
Private Const LVS_EX_TWOCLICKACTIVATE  As Long = &H80&
Private Const LVS_EX_FLATSB            As Long = &H100&
Private Const LVS_EX_REGIONAL          As Long = &H200&
Private Const LVS_EX_INFOTIP           As Long = &H400&
Private Const LVS_EX_UNDERLINEHOT      As Long = &H800&
Private Const LVS_EX_UNDERLINECOLD     As Long = &H1000&
Private Const LVS_EX_MULTIWORKAREAS    As Long = &H2000&
Private Const LVS_EX_LABELTIP          As Long = &H4000&
Private Const LVS_EX_BORDERSELECT      As Long = &H8000&
Private Const LVS_EX_DOUBLEBUFFER      As Long = &H10000
Private Const LVS_EX_HIDELABELS        As Long = &H20000
Private Const LVS_EX_SINGLEROW         As Long = &H40000
Private Const LVS_EX_SNAPTOGRID        As Long = &H80000
Private Const LVS_EX_SIMPLESELECT      As Long = &H100000


Private Const LVS_ICON                 As Long = &H0
Private Const LVS_REPORT               As Long = &H1
Private Const LVS_SMALLICON            As Long = &H2
Private Const LVS_LIST                 As Long = &H3

Private Const LVS_ALIGNTOP             As Long = &H0
Private Const LVS_TYPEMASK             As Long = &H3
Private Const LVS_SINGLESEL            As Long = &H4
Private Const LVS_SHOWSELALWAYS        As Long = &H8
Private Const LVS_SORTASCENDING        As Long = &H10
Private Const LVS_SORTDESCENDING       As Long = &H20
Private Const LVS_SHAREIMAGELISTS      As Long = &H40
Private Const LVS_NOLABELWRAP          As Long = &H80
Private Const LVS_AUTOARRANGE          As Long = &H100
Private Const LVS_EDITLABELS           As Long = &H200
Private Const LVS_ALIGNLEFT            As Long = &H800
Private Const LVS_ALIGNMASK            As Long = &HC00
Private Const LVS_OWNERDATA            As Long = &H1000
Private Const LVS_NOSCROLL             As Long = &H2000
Private Const LVS_TYPESTYLEMASK        As Long = &HFC00
Private Const LVS_OWNERDRAWFIXED       As Long = &H400
Private Const LVS_NOCOLUMNHEADER       As Long = &H4000
Private Const LVS_NOSORTHEADER         As Long = &H8000

Private Const LVSCW_AUTOSIZE           As Long = -1
Private Const LVSCW_AUTOSIZE_USEHEADER As Long = -2

Private Const LV_VIEW_ICON             As Long = &H0&
Private Const LV_VIEW_DETAILS          As Long = &H1&
Private Const LV_VIEW_SMALLICON        As Long = &H2&
Private Const LV_VIEW_LIST             As Long = &H3&
Private Const LV_VIEW_TILE             As Long = &H4&

Private Const LVCFMT_IMAGE As Long = &H800
Private Const LVCFMT_BITMAP_ON_RIGHT As Long = &H1000

'//

Private Type LVITEM
    mask       As Long
    iItem      As Long
    iSubItem   As Long
    State      As Long
    stateMask  As Long
    pszText    As String
    cchTextMax As Long
    iImage     As Long
    lParam     As Long
    iIndent    As Long
End Type

Private Type LVITEM_lp
    mask       As Long
    iItem      As Long
    iSubItem   As Long
    State      As Long
    stateMask  As Long
    pszText    As Long
    cchTextMax As Long
    iImage     As Long
    lParam     As Long
    iIndent    As Long
End Type

Private Type LVFINDINFO
    Flags       As Long
    psz         As String
    lParam      As Long
    PT          As POINTAPI
    vkDirection As Long
End Type

Private Const LVIF_TEXT           As Long = &H1
Private Const LVIF_IMAGE          As Long = &H2
Private Const LVIF_PARAM          As Long = &H4
Private Const LVIF_STATE          As Long = &H8
Private Const LVIF_INDENT         As Long = &H10
Private Const LVIF_GROUPID        As Long = &H100
Private Const LVIF_COLUMNS        As Long = &H200

Private Const LVIS_STATEIMAGEMASK As Long = &HF000
Private Const LVIS_FOCUSED        As Long = &H1
Private Const LVIS_SELECTED       As Long = &H2
Private Const LVIS_CUT            As Long = &H4
Private Const LVIS_DROPHILITED    As Long = &H8
Private Const LVIS_OVERLAYMASK    As Long = &HF00

Private Const LVFI_PARAM          As Long = &H1
Private Const LVFI_STRING         As Long = &H2
Private Const LVFI_PARTIAL        As Long = &H8
Private Const LVFI_WRAP           As Long = &H20
Private Const LVFI_NEARESTXY      As Long = &H40

'//

Private Type LVCOLUMN
    mask       As Long
    fmt        As Long
    cx         As Long
    pszText    As String
    cchTextMax As Long
    iSubItem   As Long
    iImage     As Long
    iOrder     As Long
End Type

Private Type LVCOLUMN_lp
    mask       As Long
    fmt        As Long
    cx         As Long
    pszText    As Long
    cchTextMax As Long
    iSubItem   As Long
    iImage     As Long
    iOrder     As Long
End Type

Private Const LVCF_FMT     As Long = &H1
Private Const LVCF_WIDTH   As Long = &H2
Private Const LVCF_TEXT    As Long = &H4
Private Const LVCF_SUBITEM As Long = &H8
Private Const LVCF_IMAGE   As Long = &H10
Private Const LVCF_ORDER   As Long = &H20

'//

Private Type HDITEM
    mask       As Long
    cxy        As Long
    pszText    As String
    hbm        As Long
    cchTextMax As Long
    fmt        As Long
    lParam     As Long
    iImage     As Long
    iOrder     As Long
End Type

Private Const HDS_HORZ            As Long = &H0
Private Const HDS_BUTTONS         As Long = &H2
Private Const HDS_HOTTRACK        As Long = &H4
Private Const HDS_HIDDEN          As Long = &H8
Private Const HDS_DRAGDROP        As Long = &H40
Private Const HDS_FULLDRAG        As Long = &H80

Private Const HDF_LEFT            As Long = 0
Private Const HDF_RIGHT           As Long = 1
Private Const HDF_CENTER          As Long = 2
Private Const HDF_JUSTIFYMASK     As Long = &H3
Private Const HDF_RTLREADING      As Long = 4
Private Const HDF_IMAGE           As Long = &H800
Private Const HDF_OWNERDRAW       As Long = &H8000&
Private Const HDF_STRING          As Long = &H4000
Private Const HDF_BITMAP          As Long = &H2000
Private Const HDF_BITMAP_ON_RIGHT As Long = &H1000
Private Const HDF_SORTDOWN        As Long = &H400
Private Const HDF_SORTUP          As Long = &H200

'//

Private Type LVBKIMAGE
    ulFlags        As Long
    hbm            As Long
    pszImage       As String
    cchImageMax    As Long
    xOffsetPercent As Long
    yOffsetPercent As Long
End Type

Private Const LVBKIF_SOURCE_NONE    As Long = &H0
Private Const LVBKIF_SOURCE_HBITMAP As Long = &H1
Private Const LVBKIF_SOURCE_URL     As Long = &H2
Private Const LVBKIF_SOURCE_MASK    As Long = &H3
Private Const LVBKIF_STYLE_NORMAL   As Long = &H0
Private Const LVBKIF_STYLE_TILE     As Long = &H10
Private Const LVBKIF_STYLE_MASK     As Long = &H10

'//

Private Const WM_KILLFOCUS     As Long = &H8
Private Const WM_SETFOCUS      As Long = &H7
Private Const WM_SETFONT       As Long = &H30
Private Const WM_MOUSEACTIVATE As Long = &H21
Private Const WM_NOTIFY        As Long = &H4E
Private Const WM_KEYDOWN       As Long = &H100
Private Const WM_KEYUP         As Long = &H101
Private Const WM_CHAR          As Long = &H102
Private Const WM_MOUSEMOVE     As Long = &H200
Private Const WM_LBUTTONUP     As Long = &H202
Private Const WM_LBUTTONDOWN   As Long = &H201
Private Const WM_LBUTTONDBLCLK As Long = &H203
Private Const WM_RBUTTONDOWN   As Long = &H204
Private Const WM_RBUTTONUP     As Long = &H205
Private Const WM_MBUTTONDOWN   As Long = &H207
Private Const WM_MBUTTONUP     As Long = &H208

Private Const WM_PAINT              As Long = &HF
Private Const WM_GETFONT            As Long = &H31
Private Const WM_SYSCOLORCHANGE     As Long = &H15
Private Const WM_ERASEBKGND         As Long = &H14

'//
Private Const LVM_FIRST                    As Long = &H1000
Private Const LVM_GETBKCOLOR               As Long = (LVM_FIRST + 0)
Private Const LVM_SETBKCOLOR               As Long = (LVM_FIRST + 1)
Private Const LVM_GETIMAGELIST             As Long = (LVM_FIRST + 2)
Private Const LVM_SETIMAGELIST             As Long = (LVM_FIRST + 3)
Private Const LVM_GETITEMCOUNT             As Long = (LVM_FIRST + 4)
Private Const LVM_GETITEM                  As Long = (LVM_FIRST + 5)
Private Const LVM_SETITEM                  As Long = (LVM_FIRST + 6)
Private Const LVM_INSERTITEM               As Long = (LVM_FIRST + 7)
Private Const LVM_DELETEITEM               As Long = (LVM_FIRST + 8)
Private Const LVM_DELETEALLITEMS           As Long = (LVM_FIRST + 9)
Private Const LVM_GETNEXTITEM              As Long = (LVM_FIRST + 12)
Private Const LVM_FINDITEM                 As Long = (LVM_FIRST + 13)
Private Const LVM_HITTEST                  As Long = (LVM_FIRST + 18)
Private Const LVM_ENSUREVISIBLE            As Long = (LVM_FIRST + 19)
Private Const LVM_SCROLL                   As Long = (LVM_FIRST + 20)
Private Const LVM_REDRAWITEMS              As Long = (LVM_FIRST + 21)
Private Const LVM_ARRANGE                  As Long = (LVM_FIRST + 22)
Private Const LVM_EDITLABEL                As Long = (LVM_FIRST + 23)
Private Const LVM_GETEDITCONTROL           As Long = (LVM_FIRST + 24)
Private Const LVM_GETCOLUMN                As Long = (LVM_FIRST + 25)
Private Const LVM_SETCOLUMN                As Long = (LVM_FIRST + 26)
Private Const LVM_INSERTCOLUMN             As Long = (LVM_FIRST + 27)
Private Const LVM_DELETECOLUMN             As Long = (LVM_FIRST + 28)
Private Const LVM_GETCOLUMNWIDTH           As Long = (LVM_FIRST + 29)
Private Const LVM_SETCOLUMNWIDTH           As Long = (LVM_FIRST + 30)
Private Const LVM_GETHEADER                As Long = (LVM_FIRST + 31)
Private Const LVM_GETTEXTCOLOR             As Long = (LVM_FIRST + 35)
Private Const LVM_SETTEXTCOLOR             As Long = (LVM_FIRST + 36)
Private Const LVM_GETTEXTBKCOLOR           As Long = (LVM_FIRST + 37)
Private Const LVM_SETTEXTBKCOLOR           As Long = (LVM_FIRST + 38)
Private Const LVM_UPDATE                   As Long = (LVM_FIRST + 42)
Private Const LVM_SETITEMSTATE             As Long = (LVM_FIRST + 43)
Private Const LVM_GETITEMSTATE             As Long = (LVM_FIRST + 44)
Private Const LVM_GETITEMTEXT              As Long = (LVM_FIRST + 45)
Private Const LVM_SETITEMTEXT              As Long = (LVM_FIRST + 46)
Private Const LVM_SORTITEMS                As Long = (LVM_FIRST + 48)
Private Const LVM_GETSELECTEDCOUNT         As Long = (LVM_FIRST + 50)
Private Const LVM_SETEXTENDEDLISTVIEWSTYLE As Long = (LVM_FIRST + 54)
Private Const LVM_GETEXTENDEDLISTVIEWSTYLE As Long = (LVM_FIRST + 55)
Private Const LVM_SETHOTITEM               As Long = (LVM_FIRST + 60)
Private Const LVM_GETHOTITEM               As Long = (LVM_FIRST + 61)
Private Const LVM_SETHOTCURSOR             As Long = (LVM_FIRST + 62)
Private Const LVM_GETHOTCURSOR             As Long = (LVM_FIRST + 63)
Private Const LVM_SETBKIMAGE               As Long = (LVM_FIRST + 68)
Private Const LVM_GETBKIMAGE               As Long = (LVM_FIRST + 69)
Private Const LVM_SETVIEW                  As Long = (LVM_FIRST + 142)
Private Const LVM_GETVIEW                  As Long = (LVM_FIRST + 143)
Private Const LVM_GETSELECTIONMARK         As Long = (LVM_FIRST + 66)
'//

Private Const HDM_FIRST                    As Long = &H1200
Private Const HDM_GETITEMCOUNT             As Long = (HDM_FIRST + 0)
Private Const HDM_INSERTITEM               As Long = (HDM_FIRST + 1)
Private Const HDM_DELETEITEM               As Long = (HDM_FIRST + 2)
Private Const HDM_GETITEM                  As Long = (HDM_FIRST + 3)
Private Const HDM_SETITEM                  As Long = (HDM_FIRST + 4)
Private Const HDM_LAYOUT                   As Long = (HDM_FIRST + 5)
Private Const HDM_HITTEST                  As Long = (HDM_FIRST + 6)
Private Const HDM_GETITEMRECT              As Long = (HDM_FIRST + 7)
Private Const HDM_SETIMAGELIST             As Long = (HDM_FIRST + 8)
Private Const HDM_GETIMAGELIST             As Long = (HDM_FIRST + 9)
Private Const HDM_ORDERTOINDEX             As Long = (HDM_FIRST + 15)

'//

Private Type NMHDR
    hwndFrom As Long
    idfrom   As Long
    code     As Long
End Type

Private Type NMLISTVIEW
    hdr       As NMHDR
    iItem     As Long
    iSubItem  As Long
    uNewState As Long
    uOldState As Long
    uChanged  As Long
    ptAction  As POINTAPI
    lParam    As Long
End Type

Private Type NMLVDISPINFO
    hdr  As NMHDR
    Item As LVITEM_lp
End Type

Private Type NMLVKEYDOWN
    hdr    As NMHDR
    wVKey  As Integer
    flags1 As Integer
    flags2 As Integer
End Type

Private Type LVHITTESTINFO
    PT       As POINTAPI
    Flags    As Long
    iItem    As Long
    iSubItem As Long
End Type

Private Type NMHEADER
    hdr     As NMHDR
    iItem   As Long
    iButton As Long
    hbm     As Long
    HDI     As HDITEM
End Type

Private Type HDHITTESTINFO
    PT    As POINTAPI
    Flags As Long
    iItem As Long
End Type

Private Const NM_FIRST             As Long = 0
Private Const NM_CLICK             As Long = (NM_FIRST - 2)
Private Const NM_DBLCLK            As Long = (NM_FIRST - 3)
Private Const NM_RETURN            As Long = (NM_FIRST - 4)
Private Const NM_RCLICK            As Long = (NM_FIRST - 5)
Private Const NM_RDBLCLK           As Long = (NM_FIRST - 6)
Private Const NM_SETFOCUS          As Long = (NM_FIRST - 7)
Private Const NM_KILLFOCUS         As Long = (NM_FIRST - 8)
Private Const NM_CUSTOMDRAW        As Long = (NM_FIRST - 12)
Private Const NM_HOVER             As Long = (NM_FIRST - 13)

Private Const LVN_FIRST            As Long = -100
Private Const LVN_ITEMCHANGING     As Long = (LVN_FIRST - 0)
Private Const LVN_ITEMCHANGED      As Long = (LVN_FIRST - 1)
Private Const LVN_INSERTITEM       As Long = (LVN_FIRST - 2)
Private Const LVN_DELETEITEM       As Long = (LVN_FIRST - 3)
Private Const LVN_DELETEALLITEMS   As Long = (LVN_FIRST - 4)
Private Const LVN_BEGINLABELEDIT   As Long = (LVN_FIRST - 5)
Private Const LVN_ENDLABELEDIT     As Long = (LVN_FIRST - 6)
Private Const LVN_COLUMNCLICK      As Long = (LVN_FIRST - 8)
Private Const LVN_BEGINDRAG        As Long = (LVN_FIRST - 9)
Private Const LVN_BEGINRDRAG       As Long = (LVN_FIRST - 11)

Private Const LVNI_ALL             As Long = &H0
Private Const LVNI_FOCUSED         As Long = &H1
Private Const LVNI_SELECTED        As Long = &H2
Private Const LVNI_CUT             As Long = &H4
Private Const LVNI_DROPHILITED     As Long = &H8
Private Const LVNI_ABOVE           As Long = &H100
Private Const LVNI_BELOW           As Long = &H200
Private Const LVNI_TOLEFT          As Long = &H400
Private Const LVNI_TORIGHT         As Long = &H800

Private Const LVHT_NOWHERE         As Long = &H1
Private Const LVHT_ONITEMICON      As Long = &H2
Private Const LVHT_ONITEMLABEL     As Long = &H4
Private Const LVHT_ONITEMSTATEICON As Long = &H8
Private Const LVHT_ONITEM          As Long = (LVHT_ONITEMICON Or LVHT_ONITEMLABEL Or LVHT_ONITEMSTATEICON)
Private Const LVHT_ABOVE           As Long = &H8
Private Const LVHT_BELOW           As Long = &H10
Private Const LVHT_TORIGHT         As Long = &H20
Private Const LVHT_TOLEFT          As Long = &H40

Private Const HDN_FIRST            As Long = -300
Private Const HDN_ITEMCHANGING     As Long = (HDN_FIRST - 0)
Private Const HDN_ITEMCLICK        As Long = (HDN_FIRST - 2)
Private Const HDN_ITEMDBLCLICK     As Long = (HDN_FIRST - 3)
Private Const HDN_DIVIDERDBLCLICK  As Long = (HDN_FIRST - 5)
Private Const HDN_BEGINTRACK       As Long = (HDN_FIRST - 6)
Private Const HDN_ENDTRACK         As Long = (HDN_FIRST - 7)
Private Const HDN_TRACK            As Long = (HDN_FIRST - 8)
Private Const HDN_GETDISPINFO      As Long = (HDN_FIRST - 9)
Private Const HDN_BEGINDRAG        As Long = (HDN_FIRST - 10)
Private Const HDN_ENDDRAG          As Long = (HDN_FIRST - 11)

Private Const HHT_NOWHERE          As Long = &H1
Private Const HHT_ONHEADER         As Long = &H2
Private Const HHT_ONDIVIDER        As Long = &H4
Private Const HHT_ONDIVOPEN        As Long = &H8
Private Const HHT_ABOVE            As Long = &H100
Private Const HHT_BELOW            As Long = &H200
Private Const HHT_TORIGHT          As Long = &H400
Private Const HHT_TOLEFT           As Long = &H800

Private Const HDI_WIDTH            As Long = &H1
Private Const HDI_HEIGHT           As Long = HDI_WIDTH
Private Const HDI_TEXT             As Long = &H2
Private Const HDI_FORMAT           As Long = &H4
Private Const HDI_LPARAM           As Long = &H8
Private Const HDI_BITMAP           As Long = &H10
Private Const HDI_IMAGE            As Long = &H20
Private Const HDI_DI_SETITEM       As Long = &H40
Private Const HDI_ORDER            As Long = &H80

'= Custom draw ==========================================================================

Private Type NMCUSTOMDRAW
    hdr         As NMHDR
    dwDrawStage As Long
    hdc         As Long
    rc          As RECT2
    dwItemSpec  As Long
    uItemState  As Long
    lItemlParam As Long
End Type

Private Type NMLVCUSTOMDRAW
    nmcd      As NMCUSTOMDRAW
    clrText   As Long
    clrTextBk As Long
    iSubItem  As Long
End Type

'- Custom draw paint stages
Private Const CDDS_PREPAINT          As Long = &H1
Private Const CDDS_POSTPAINT         As Long = &H2
Private Const CDDS_PREERASE          As Long = &H3
Private Const CDDS_POSTERASE         As Long = &H4
Private Const CDDS_ITEM              As Long = &H10000
Private Const CDDS_SUBITEM           As Long = &H20000
Private Const CDDS_ITEMPREPAINT      As Long = (CDDS_ITEM Or CDDS_PREPAINT)
Private Const CDDS_ITEMPOSTPAINT     As Long = (CDDS_ITEM Or CDDS_POSTPAINT)
Private Const CDDS_ITEMPREERASE      As Long = (CDDS_ITEM Or CDDS_PREERASE)
Private Const CDDS_ITEMPOSTERASE     As Long = (CDDS_ITEM Or CDDS_POSTERASE)

'- Custom draw Item states
Private Const CDIS_SELECTED          As Long = &H1
Private Const CDIS_GRAYED            As Long = &H2
Private Const CDIS_DISABLED          As Long = &H4
Private Const CDIS_CHECKED           As Long = &H8
Private Const CDIS_FOCUS             As Long = &H10
Private Const CDIS_DEFAULT           As Long = &H20
Private Const CDIS_HOT               As Long = &H40
Private Const CDIS_MARKED            As Long = &H80
Private Const CDIS_INDETERMINATE     As Long = &H100

'- Custom draw return values
Private Const CDRF_DODEFAULT         As Long = &H0
Private Const CDRF_NEWFONT           As Long = &H2
Private Const CDRF_SKIPDEFAULT       As Long = &H4
Private Const CDRF_NOTIFYPOSTPAINT   As Long = &H10
Private Const CDRF_NOTIFYITEMDRAW    As Long = &H20
Private Const CDRF_NOTIFYPOSTERASE   As Long = &H40
Private Const CDRF_NOTIFYSUBITEMDRAW As Long = &H20

'= Image list ===========================================================================

Private Declare Function ImageList_Create Lib "Comctl32" (ByVal MinCx As Long, ByVal MinCy As Long, ByVal Flags As Long, ByVal cInitial As Long, ByVal cGrow As Long) As Long
Private Declare Function ImageList_Add Lib "Comctl32" (ByVal hImageList As Long, ByVal hBitmap As Long, ByVal hBitmapMask As Long) As Long
Private Declare Function ImageList_SetBkColor Lib "Comctl32" (ByVal hImageList As Long, ByVal clrBk As Long) As Long
Private Declare Function ImageList_AddMasked Lib "Comctl32" (ByVal hImageList As Long, ByVal hbmImage As Long, ByVal crMask As Long) As Long
Private Declare Function ImageList_AddIcon Lib "Comctl32" (ByVal hImageList As Long, ByVal hIcon As Long) As Long
Private Declare Function ImageList_Destroy Lib "Comctl32" (ByVal hImageList As Long) As Long
Private Declare Function ImageList_Draw Lib "Comctl32" (ByVal hImageList As Long, ByVal lIndex As Long, ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal fStyle As Long) As Long

Private Const LVSIL_NORMAL    As Long = 0
Private Const LVSIL_SMALL     As Long = 1
Private Const LVSIL_STATE     As Long = 2

Private Const ILD_NORMAL      As Long = 0&
Private Const ILD_TRANSPARENT As Long = 1&
Private Const ILD_BLEND25     As Long = 2&
Private Const ILD_SELECTED    As Long = 4&
Private Const ILD_FOCUS       As Long = 4&
Private Const ILD_MASK        As Long = &H10&
Private Const ILD_IMAGE       As Long = &H20&
Private Const ILD_ROP         As Long = &H40&
Private Const ILD_OVERLAYMASK As Long = 3840&

Private Const DST_COMPLEX     As Long = &H0&
Private Const DST_TEXT        As Long = &H1&
Private Const DST_PREFIXTEXT  As Long = &H2&
Private Const DST_ICON        As Long = &H3&
Private Const DST_BITMAP      As Long = &H4&

Private Const DSS_NORMAL      As Long = &H0&
Private Const DSS_UNION       As Long = &H10&
Private Const DSS_DISABLED    As Long = &H20&
Private Const DSS_MONO        As Long = &H80&
Private Const DSS_RIGHT       As Long = &H8000&

Private Const ILC_COLOR       As Long = &H0
Private Const ILC_MASK        As Long = &H1
Private Const ILC_COLOR4      As Long = &H4
Private Const ILC_COLOR8      As Long = &H8
Private Const ILC_COLOR16     As Long = &H10
Private Const ILC_COLOR24     As Long = &H18
Private Const ILC_COLOR32     As Long = &H20

'//

'-- Public enums.:

Public Enum eViewModeConstants
    [vmIcon] = LVS_ICON
    [vmSmallIcon] = LVS_SMALLICON
    [vmList] = LVS_LIST
    [vmDetails] = LVS_REPORT
End Enum

Public Enum eBorderStyleConstants
    [bsNone] = 0
    [bsThin] = 1
    [bsThick] = 2
End Enum

Public Enum eColumnAlignConstants
    [caLeft] = HDF_LEFT
    [caRight] = HDF_RIGHT
    [caCenter] = HDF_CENTER
End Enum

Public Enum eColumnAutosizeConstants
    [caItem] = LVSCW_AUTOSIZE
    [caHeader] = LVSCW_AUTOSIZE_USEHEADER
End Enum

Public Enum eCoincidenceConstants
    [cWholeWord] = LVFI_STRING
    [cPartial] = LVFI_PARTIAL
End Enum

Public Enum eStateConstants
    [sSelected] = LVNI_SELECTED
    [sFocused] = LVNI_FOCUSED
    [sGhosted] = LVNI_CUT
End Enum

Public Enum eSortOrderConstants
    [soDefault] = 0
    [soAscending] = 1
    [soDescending] = -1
End Enum

Public Enum eSortTypeConstants
    [stString] = 0
    [stStringSensitive] = 1
    [stNumeric] = 2
    [stDate] = 3
    [stCustom] = 4
End Enum

'-- Property variables:

Private m_BorderStyle          As eBorderStyleConstants
Private m_CheckBoxes           As Boolean
Private m_EditLabels           As Boolean
Private m_FullRowSelect        As Boolean
Private m_GridLines            As Boolean
Private m_HeaderDragDrop       As Boolean
Private m_HeaderFixedWidth     As Boolean
Private m_HeaderFlat           As Boolean
Private m_HeaderHide           As Boolean
Private m_HideSelection        As Boolean
Private m_LabelTips            As Boolean
Private m_MultiSelect          As Boolean
Private m_OneClickActivate     As Boolean
Private m_ScrollBarFlat        As Boolean
Private m_SubItemImages        As Boolean
Private m_TrackSelect          As Boolean
Private m_UnderlineHot         As Boolean
Private m_ViewMode             As eViewModeConstants
'//
Private m_RaiseSubItemPrePaint As Boolean
'//

'-- Private constants:

Private Const WC_LISTVIEW  As String = "SysListView32"
 
'-- Private variables:

Private m_hModShell32      As Long
Private m_bInitialized     As Boolean
Private m_bFirstItem       As Boolean
Private m_bTrack           As Boolean
Private m_bTrackUser32     As Boolean
Private m_bInCtrl          As Boolean
Private m_snxL             As Single
Private m_snyL             As Single
Private m_hListView        As Long
Private m_hHeader          As Long
Private m_hILSmall         As Long
Private m_hILLarge         As Long
Private m_hILHeader        As Long
Private m_hFont            As Long
Private m_uIPAO            As IPAOHookStruct
Private WithEvents m_oFont As StdFont
Attribute m_oFont.VB_VarHelpID = -1
Private m_SubItemProgress  As Long

'-- Event declarations:

Public Event Click()
Public Event DblClick()
Public Event ItemClick(Item As Long)
Public Event ItemDblClick(Item As Long)
Public Event ItemCheck(Item As Long)
Public Event ColumnClick(Column As Long)
Public Event ColumnRightClick(Column As Long)
Public Event KeyDown(KeyCode As Integer, Shift As Integer)
Public Event KeyPress(KeyAscii As Integer)
Public Event KeyUp(KeyCode As Integer, Shift As Integer)
Public Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseEnter()
Public Event MouseLeave()
Public Event BeforeLabelEdit(Cancel As Long)
Public Event AfterLabelEdit(Cancel As Long, NewString As String)
Public Event Resize()
'//
Public Event OnSubItemPrePaint(ByVal Item As Long, ByVal SubItem As Long, TextBackColor As Long, TextForeColor As Long, Process As Boolean)
'//
Public Event OLEStartDrag(Data As DataObject, AllowedEffects As Long)
Public Event OLEGiveFeedback(Effect As Long, DefaultCursors As Boolean)
Public Event OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
Public Event OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event OLECompleteDrag(Effect As Long)
Public Event OLESetData(Data As DataObject, DataFormat As Integer)

'# OLED&D
Public Enum lvOLEDragConstants
    [drgNone] = -1
    [drgManual] = vbOLEDragManual
    [drgAutomatic] = vbOLEDragAutomatic
End Enum

'# OLED&D
Public Enum lvOLEDropConstants
    [drpNone] = vbOLEDropNone
    [drpManual] = vbOLEDropManual
End Enum
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
' Subclass handler - MUST be the first Public routine in this file. That includes public properties also
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

  Dim uNMH     As NMHDR
  Dim uNMLV    As NMLISTVIEW
  Dim uNMLVDI  As NMLVDISPINFO
  Dim uNMLVKD  As NMLVKEYDOWN
  Dim uLVHTI   As LVHITTESTINFO
  Dim uHDHTI   As HDHITTESTINFO
  Dim nCancel  As Long
  Dim bMouseUp As Boolean
  Dim snx      As Single
  Dim sny      As Single
  Dim a()      As Byte
  Dim lPos     As Long
  Dim sText    As String
  Dim lIdx     As Long
  
    Select Case lng_hWnd
    
        Case UserControl.hwnd
        
            Select Case uMsg
                
                Case WM_MOUSEACTIVATE
                    
                    Call pvSetIPAO
                                    
                Case WM_NOTIFY
                   
                    Call CopyMemory(uNMH, ByVal lParam, Len(uNMH))
               
                    If (uNMH.hwndFrom = m_hHeader) Then
                         
                        If (m_hHeader) Then
                        
                            With uHDHTI
                                
                                Call GetCursorPos(.PT)
                                Call ScreenToClient(m_hHeader, .PT)
                                Call SendMessage(m_hHeader, HDM_HITTEST, 0, uHDHTI)
    
                                Select Case uNMH.code
                                        
                                    Case HDN_ITEMCHANGING 'HDN_BEGINTRACK not intercepted ?
                                    
                                        If (m_HeaderFixedWidth) Then
                                            lReturn = 1
                                            bHandled = True
                                        End If
                                      
                                    Case HDN_ITEMCLICK
                                  
                                        RaiseEvent ColumnClick(.iItem)
                                    
                                    Case NM_RCLICK
                                          
                                        If (uNMH.hwndFrom = m_hHeader) Then
                                            RaiseEvent ColumnRightClick(.iItem)
                                            Exit Sub
                                        End If
                                End Select
                            End With
                        End If
                        
                    ElseIf (uNMH.hwndFrom = m_hListView) Then
                     
                        Select Case uNMH.code
                           
                            Case NM_CUSTOMDRAW
                                
                                If (m_RaiseSubItemPrePaint) Then
                                    lReturn = pvCustomDraw(lParam)
                                    bHandled = True
                                End If
                                
                            Case NM_CLICK, NM_RCLICK
                                
                                Call CopyMemory(uNMLV, ByVal lParam, Len(uNMLV))
                                With uLVHTI
                                    Call pvUCCoordPixel(.PT.X, .PT.Y)
                                    Call SendMessage(m_hListView, LVM_HITTEST, 0, uLVHTI)
                                    If (Not m_MultiSelect) Then
                                        If (.Flags <> LVHT_NOWHERE) Then
                                            If ((.Flags = LVHT_ONITEMICON) Or _
                                                (.Flags = LVHT_ONITEMLABEL) Or _
                                                (.Flags = LVHT_ONITEM)) Then
                                                bMouseUp = True
                                            End If
                                        End If
                                      Else
                                        If (.Flags <> LVHT_ONITEMSTATEICON) Then
                                            bMouseUp = True
                                        End If
                                    End If
                                End With
                                If (bMouseUp) Then
                                    Call pvUCCoordScale(snx, sny)
                                    RaiseEvent MouseUp((uNMH.code = NM_CLICK) + 2, pvShiftState(), snx, sny)
                                    RaiseEvent Click
                                End If
                                
                            Case NM_DBLCLK, NM_RDBLCLK
                            
                                RaiseEvent DblClick
                    
                            Case LVN_ITEMCHANGED
                            
                                Call CopyMemory(uNMLV, ByVal lParam, Len(uNMLV))
                                With uNMLV
                                    If (.uOldState) Then
                                        If ((.uNewState And LVIS_STATEIMAGEMASK) <> (.uOldState And LVIS_STATEIMAGEMASK)) Then
                                            RaiseEvent ItemCheck(.iItem)
                                        End If
                                      Else
                                        If (Not m_bFirstItem) Then
                                            If ((.uNewState And LVIS_SELECTED)) Then
                                                RaiseEvent ItemClick(.iItem)
                                            End If
                                        End If
                                    End If
                                End With
                                
                            Case LVN_BEGINLABELEDIT
                                
                                RaiseEvent BeforeLabelEdit(nCancel)
                                If (nCancel) Then
                                    Call SendMessageLong(pvEdithWnd(), WM_KILLFOCUS, 0, 0)
                                End If
                                
                            Case LVN_ENDLABELEDIT
                                
                                Call CopyMemory(uNMLVDI, ByVal lParam, Len(uNMLVDI))
                                With uNMLVDI.Item
                                    If (lstrlen(.pszText) > 1) Then
                                        ReDim a(0 To .cchTextMax - 1) As Byte
                                        Call CopyMemory(a(0), ByVal .pszText, .cchTextMax - 1)
                                        sText = StrConv(a(), vbUnicode)
                                        lPos = InStr(sText, vbNullChar)
                                        sText = IIf(lPos > 1, Left$(sText, lPos - 1), vbNullString)
                                    End If
                                    If sText <> vbNullString Then
                                        RaiseEvent AfterLabelEdit(nCancel, sText)
                                        If (nCancel = 0 Xor GetAsyncKeyState(vbKeyEscape)) Then
                                            lReturn = 1
                                            bHandled = True
                                        End If
                                    End If
                                End With
                                
                            Case LVN_BEGINDRAG, LVN_BEGINRDRAG '# OLED&D
                               
                                Call CopyMemory(uNMLV, ByVal lParam, Len(uNMLV))
                                
                                'm_hNodeDrag = uNMLV.iItem
                                
                                Call SetCapture(m_hListView)
                                Call UserControl.OLEDrag
                                
                        End Select
                    End If
            End Select
            
        Case m_hListView
            
            Select Case uMsg
                
                Case WM_SETFOCUS
                    
                    Call pvSetIPAO
                    
                Case WM_KEYDOWN
                    
                    RaiseEvent KeyDown(wParam And &H7FFF&, pvShiftState())
                    
                Case WM_CHAR
                    
                    RaiseEvent KeyPress(wParam And &H7FFF&)
                    If ((wParam And &H7FFF&) = vbKeySpace) Then
                        lIdx = SendMessageLong(m_hListView, LVM_GETNEXTITEM, -1, LVNI_SELECTED Or LVNI_FOCUSED)
                        If (lIdx <> -1) Then
                            RaiseEvent ItemClick(lIdx)
                        End If
                    End If
                    
                Case WM_KEYUP
                    
                    RaiseEvent KeyUp(wParam And &H7FFF&, pvShiftState())
                    
                Case WM_LBUTTONDOWN, WM_RBUTTONDOWN, WM_MBUTTONDOWN
                    
                    Call pvUCCoordScale(snx, sny)
                    RaiseEvent MouseDown(pvButton(uMsg), pvShiftState(), snx, sny)
                    lIdx = pvItemHitTest()
                    If (lIdx <> -1) Then
                        With uLVHTI
                            Call pvUCCoordPixel(.PT.X, .PT.Y)
                            Call SendMessage(m_hListView, LVM_HITTEST, 0, uLVHTI)
                            If ((.Flags = LVHT_ONITEMICON) Or _
                                (.Flags = LVHT_ONITEMLABEL) Or _
                                (.Flags = LVHT_ONITEM)) Then
                                If (SendMessageLong(m_hListView, LVM_GETITEMSTATE, lIdx, LVIS_SELECTED Or LVIS_FOCUSED)) Then
                                    RaiseEvent ItemClick(lIdx)
                                End If
                            End If
                        End With
                    End If
                Case WM_LBUTTONDBLCLK
                    lIdx = pvItemHitTest()
                    If (lIdx <> -1) Then
                        RaiseEvent ItemDblClick(lIdx)
                    End If
                    
                Case WM_MOUSEMOVE
                    
                    If (Not m_bInCtrl) Then
                        m_bInCtrl = True
                        Call pvTrackMouseLeave(lng_hWnd)
                        RaiseEvent MouseEnter
                    End If
                    Call pvUCCoordScale(snx, sny)
                    If (snx <> m_snxL Or sny <> m_snyL) Then
                        m_snxL = snx
                        m_snyL = sny
                        RaiseEvent MouseMove(pvButton(uMsg), pvShiftState(), snx, sny)
                    End If
                    
                Case WM_MOUSELEAVE
                
                    m_bInCtrl = False
                    RaiseEvent MouseLeave
                    m_snxL = -1
                    m_snyL = -1
                    
                Case WM_LBUTTONUP, WM_RBUTTONUP, WM_MBUTTONUP
                    
                    Call pvUCCoordScale(snx, sny)
                    RaiseEvent MouseUp(pvButton(uMsg), pvShiftState(), snx, sny)
                    RaiseEvent Click
                    
                Case WM_PAINT, WM_SYSCOLORCHANGE, WM_ERASEBKGND
                    If m_SubItemProgress <> -1 Then
                        MdlListViewProgress.WndProc bBefore, bHandled, lReturn, lng_hWnd, uMsg, wParam, lParam, m_SubItemProgress
                    End If
                
            End Select
    End Select
End Sub


' by leo
Property Get SubItemProgress() As Long
    SubItemProgress = m_SubItemProgress
End Property

' by leo
Property Let SubItemProgress(ByVal NewSubItemProgress As Long)
   m_SubItemProgress = NewSubItemProgress
End Property


' by leo

Public Property Get hSmallImgList() As Long
    hSmallImgList = m_hILSmall
End Property

Public Property Let hSmallImgList(ByVal hImgList As Long)
    m_hILSmall = hImgList
    Call SendMessageLong(m_hListView, LVM_SETIMAGELIST, LVSIL_SMALL, m_hILSmall)
End Property

Public Property Get hLargeImgList() As Long
    hLargeImgList = m_hILLarge
End Property

Public Property Let hLargeImgList(ByVal hImgList As Long)
    m_hILLarge = hImgList
    Call SendMessageLong(m_hListView, LVM_SETIMAGELIST, LVSIL_NORMAL, m_hILLarge)
End Property

Public Property Get hHeaderImgList() As Long
    hHeaderImgList = m_hILHeader
End Property

Public Property Let hHeaderImgList(ByVal hImgList As Long)
    m_hILHeader = hImgList
End Property





'========================================================================================
' Usercontrol
'========================================================================================

Private Sub UserControl_Initialize()

    m_hModShell32 = LoadLibraryA("shell32.dll") '(*)
    Call InitCommonControls
    Set m_oFont = New StdFont
    m_SubItemProgress = -1
'(*) KBID 309366 (http://support.microsoft.com/default.aspx?scid=kb;en-us;309366)
'    From vbAccelerator
'    http://www.vbaccelerator.com/home/VB/Code/Libraries/XP_Visual_Styles/Preventing_Crashes_at_Shutdown/article.asp
End Sub

Private Sub UserControl_Terminate()
  
  On Error GoTo errh
  
    If (m_bInitialized) Then
    
        Call mIOleInPlaceActivate.TerminateIPAO(m_uIPAO)
        Call Subclass_StopAll
        Call pvDestroyImageListSmall
        Call pvDestroyImageListLarge
        Call pvDestroyImageListHeader
        Call pvDestroyFont
        Call pvDestroyListView
        Call FreeLibrary(m_hModShell32)
    End If
errh:
End Sub

'//

Private Sub UserControl_GotFocus()

    If (m_hListView) Then
    
        Call SetFocus(m_hListView)
    End If
End Sub

Private Sub UserControl_Resize()

  Dim rctClient As RECT2
  
    If (m_hListView) Then
    
        Call GetClientRect(UserControl.hwnd, rctClient)
        With rctClient
            Call SetWindowPos(m_hListView, 0, .x1, .y1, .x2 - .x1, .y2 - .y1, SWP_NOZORDER Or SWP_NOOWNERZORDER)
        End With

        RaiseEvent Resize
    End If
End Sub

'========================================================================================
' Methods
'========================================================================================

Public Function Initialize() As Boolean
    
    If (m_bInitialized = False) Then
    
        Initialize = pvCreate()
        
        If (m_hListView) Then
        
            m_bInitialized = True
            
            '-- Subclass UserControl (parent) and ListView (child)
            Call Subclass_Start(UserControl.hwnd)
            Call Subclass_Start(m_hListView)
            
            '-- Trap next UserControl messages...
            Call Subclass_AddMsg(UserControl.hwnd, WM_MOUSEACTIVATE, MSG_BEFORE)
            Call Subclass_AddMsg(UserControl.hwnd, WM_NOTIFY, MSG_BEFORE)
            
            '-- Trap next ListView messages...
            Call Subclass_AddMsg(m_hListView, WM_SETFOCUS, MSG_BEFORE)
            Call Subclass_AddMsg(m_hListView, WM_KEYDOWN, MSG_BEFORE)
            Call Subclass_AddMsg(m_hListView, WM_CHAR, MSG_BEFORE)
            Call Subclass_AddMsg(m_hListView, WM_KEYUP, MSG_BEFORE)
            Call Subclass_AddMsg(m_hListView, WM_LBUTTONDOWN, MSG_BEFORE)
            Call Subclass_AddMsg(m_hListView, WM_RBUTTONDOWN, MSG_BEFORE)
            Call Subclass_AddMsg(m_hListView, WM_MBUTTONDOWN, MSG_BEFORE)
            Call Subclass_AddMsg(m_hListView, WM_MOUSEMOVE, MSG_BEFORE)
            Call Subclass_AddMsg(m_hListView, WM_LBUTTONDBLCLK, MSG_BEFORE)
            Call Subclass_AddMsg(m_hListView, WM_LBUTTONUP, MSG_BEFORE)
            Call Subclass_AddMsg(m_hListView, WM_RBUTTONUP, MSG_BEFORE)
            Call Subclass_AddMsg(m_hListView, WM_MBUTTONUP, MSG_BEFORE)
            
            Call Subclass_AddMsg(m_hListView, WM_PAINT, MSG_BEFORE_AND_AFTER)
            Call Subclass_AddMsg(m_hListView, WM_SYSCOLORCHANGE, MSG_AFTER)
            Call Subclass_AddMsg(m_hListView, WM_ERASEBKGND, MSG_BEFORE)
            

            
            '-- ListView mouse enter/leave support // mouse pos. initialization
            m_bTrack = True
            m_bTrackUser32 = pvIsFunctionExported("TrackMouseEvent", "User32")
            If (Not m_bTrackUser32) Then
                If (Not pvIsFunctionExported("_TrackMouseEvent", "Comctl32")) Then
                    m_bTrack = False
                End If
            End If
            If (m_bTrack) Then
                Call Subclass_AddMsg(m_hListView, WM_MOUSELEAVE, MSG_BEFORE)
            End If
            m_snxL = -1
            m_snyL = -1
            
            '-- Initialize IOLEInPlaceActiveObject
            Call mIOleInPlaceActivate.InitIPAO(m_uIPAO, Me)
        End If
    End If
End Function

Public Function InitializeImageListSmall( _
                Optional ByVal ImageWidth As Long = 16, _
                Optional ByVal ImageHeight As Long = 16) As Boolean
    
    If (m_hListView) Then
    
        Call pvDestroyImageListSmall
        m_hILSmall = ImageList_Create(ImageWidth, ImageHeight, ILC_COLOR32 Or ILC_MASK, 0, 0)
        Call SendMessageLong(m_hListView, LVM_SETIMAGELIST, LVSIL_SMALL, m_hILSmall)
        
        InitializeImageListSmall = (m_hILSmall <> 0)
    End If
End Function

Public Function InitializeImageListLarge( _
                Optional ByVal ImageWidth As Long = 32, _
                Optional ByVal ImageHeight As Long = 32) As Boolean
    
    If (m_hListView) Then
    
        Call pvDestroyImageListLarge
        m_hILLarge = ImageList_Create(ImageWidth, ImageHeight, ILC_COLOR32 Or ILC_MASK, 0, 0)
        Call SendMessageLong(m_hListView, LVM_SETIMAGELIST, LVSIL_NORMAL, m_hILLarge)
        
        InitializeImageListLarge = (m_hILLarge <> 0)
    End If
End Function

Public Function InitializeImageListHeader( _
                Optional ByVal ImageWidth As Long = 16, _
                Optional ByVal ImageHeight As Long = 16) As Boolean
    
    If (m_hListView) Then
    
        Call pvDestroyImageListHeader
        m_hILHeader = ImageList_Create(ImageWidth, ImageHeight, ILC_COLOR32 Or ILC_MASK, 0, 0)
        
        InitializeImageListHeader = (m_hILHeader <> 0)
    End If
End Function

Public Sub Refresh()
    
    Call UserControl.Refresh
End Sub

'//

Public Function ImageListSmall_AddBitmap( _
                ByVal hBitmap As Long, _
                Optional ByVal MaskColor As Long = CLR_NONE _
                ) As Long
    
    If (m_hILSmall) Then
    
        If (MaskColor <> CLR_NONE) Then
            ImageListSmall_AddBitmap = ImageList_AddMasked(m_hILSmall, hBitmap, MaskColor)
          Else
            ImageListSmall_AddBitmap = ImageList_Add(m_hILSmall, hBitmap, 0)
        End If
    End If
End Function

Public Function ImageListSmall_AddIcon( _
                ByVal hIcon As Long _
                ) As Long
    
    If (m_hILSmall) Then
    
        ImageListSmall_AddIcon = ImageList_AddIcon(m_hILSmall, hIcon)
    End If
End Function

Public Function ImageListLarge_AddBitmap( _
                ByVal hBitmap As Long, _
                Optional ByVal MaskColor As Long = CLR_NONE _
                ) As Long
    
    If (m_hILLarge) Then
    
        If (MaskColor <> CLR_NONE) Then
            ImageListLarge_AddBitmap = ImageList_AddMasked(m_hILLarge, hBitmap, MaskColor)
          Else
            ImageListLarge_AddBitmap = ImageList_Add(m_hILLarge, hBitmap, 0)
        End If
    End If
End Function

Public Function ImageListLarge_AddIcon( _
                ByVal hIcon As Long _
                ) As Long
    
    If (m_hILLarge) Then
    
        ImageListLarge_AddIcon = ImageList_AddIcon(m_hILLarge, hIcon)
    End If
End Function

Public Function ImageListHeader_AddBitmap( _
                ByVal hBitmap As Long, _
                Optional ByVal MaskColor As Long = CLR_NONE _
                ) As Long
    
    If (m_hILHeader) Then
    
        If (MaskColor <> CLR_NONE) Then
            ImageListHeader_AddBitmap = ImageList_AddMasked(m_hILHeader, hBitmap, MaskColor)
          Else
            ImageListHeader_AddBitmap = ImageList_Add(m_hILHeader, hBitmap, 0)
        End If
    End If
End Function

Public Function ImageListHeader_AddIcon( _
                ByVal hIcon As Long _
                ) As Long
    
    If (m_hILHeader) Then
    
        ImageListHeader_AddIcon = ImageList_AddIcon(m_hILHeader, hIcon)
    End If
End Function

'//

Public Function Clear( _
                ) As Boolean

    If (m_hListView) Then
    
        Clear = CBool(SendMessageLong(m_hListView, LVM_DELETEALLITEMS, 0, 0))
    End If
End Function

Public Function Sort( _
                Optional ByVal Column As Long = 0, _
                Optional ByVal SortOrder As eSortOrderConstants = [soAscending], _
                Optional ByVal SortType As eSortTypeConstants = [stString] _
                ) As Boolean

    Dim uHDI   As HDITEM
    
    If (m_hListView) Then
        If (m_hHeader) Then
            With uHDI
                .mask = HDI_FORMAT
                Call SendMessage(m_hHeader, HDM_GETITEM, Column, uHDI)
                If SortOrder = soAscending Then
                    .fmt = (.fmt And Not HDF_SORTDOWN) Or HDF_SORTUP
                ElseIf SortOrder = soDescending Then
                    .fmt = (.fmt And Not HDF_SORTUP) Or HDF_SORTDOWN
                Else
                    .fmt = .fmt And Not (HDF_SORTUP Or HDF_SORTDOWN)
                End If
            End With
            Call SendMessage(m_hHeader, HDM_SETITEM, Column, uHDI)
        End If
        
        Sort = mListViewEx.Sort(m_hListView, Column, SortOrder, SortType)
    End If


    If (m_hListView) Then
        Sort = mListViewEx.Sort(m_hListView, Column, SortOrder, SortType)
    End If
End Function

Public Function BackgroundPictureSet( _
                ByVal URL As String _
                ) As Boolean
  
  Dim uLBI As LVBKIMAGE
  Dim lRet As Long
   
    If (m_hListView) Then
        
        With uLBI
            .pszImage = URL & vbNullChar
            .cchImageMax = Len(URL) + 1
            .ulFlags = LVBKIF_SOURCE_URL Or LVBKIF_STYLE_TILE
        End With
        lRet = SendMessage(m_hListView, LVM_SETBKIMAGE, 0, uLBI)
        
        If (lRet) Then
            Call SendMessageLong(m_hListView, LVM_SETTEXTBKCOLOR, 0, CLR_NONE)
            BackgroundPictureSet = True
        End If
   End If
End Function

'//

Public Function ColumnAdd( _
                ByVal Column As Long, _
                ByVal Text As String, _
                ByVal Width As Long, _
                Optional ByVal Align As eColumnAlignConstants = [caLeft], _
                Optional ByVal Icon As Long = -1 _
                ) As Boolean
    

    Dim LVC As LVCOLUMN_lp
    
    If (m_hListView) Then
    
        With LVC
            .mask = LVCF_FMT Or LVCF_TEXT Or LVCF_WIDTH Or LVCF_IMAGE * -(Icon > -1)
            .pszText = StrPtr(StrConv(Text, vbFromUnicode))  ' <------- as long
            .fmt = HDF_STRING Or Align * -(Column <> 0) Or HDF_IMAGE * -(Icon > -1) Or HDF_BITMAP_ON_RIGHT 'HDF_STRING Or Align Or LVCFMT_IMAGE Or LVCFMT_BITMAP_ON_RIGHT
            .cx = Width
            .iImage = Icon
            .iOrder = 0
        End With
        
        ColumnAdd = SendMessage(m_hListView, LVM_INSERTCOLUMN, Me.ColumnCount, LVC) > -1
    
        If m_hHeader = 0 Then
            m_hHeader = pvHeaderhWnd()
            Call SendMessageLong(m_hHeader, HDM_SETIMAGELIST, 0, m_hILHeader)
        End If
    
    End If
    
End Function

Public Function ColumnAdd2( _
                ByVal Column As Long, _
                ByVal Text As String, _
                ByVal Width As Long, _
                Optional ByVal Align As eColumnAlignConstants = [caLeft], _
                Optional ByVal Icon As Long = -1 _
                ) As Boolean

  Dim uLVC   As LVCOLUMN
  Dim uHDI   As HDITEM
  Dim bFirst As Boolean
  
    If (m_hListView) Then
        
        bFirst = (Me.ColumnCount = 0)
        ColumnAdd2 = (SendMessage(m_hListView, LVM_INSERTCOLUMN, Column, uLVC) > -1)
        
        If (ColumnAdd2) Then
        
            If (bFirst) Then
                m_hHeader = pvHeaderhWnd()
                Call SendMessageLong(m_hHeader, HDM_SETIMAGELIST, 0, m_hILHeader)
            End If
            
            With uHDI
                .pszText = Text + vbNullChar
                .cchTextMax = Len(Text) + 1
                .cxy = Width
                .iImage = Icon
                .fmt = HDF_STRING Or Align * -(Column <> 0) Or HDF_IMAGE * -(Icon > -1) Or HDF_BITMAP_ON_RIGHT
                .mask = HDI_TEXT Or HDI_WIDTH Or HDI_IMAGE Or HDI_FORMAT
            End With
            Call SendMessage(m_hHeader, HDM_SETITEM, Column, uHDI)
        End If
    End If
End Function

Public Function ColumnRemove( _
                ByVal Column As Long _
                ) As Boolean
           
    If (m_hListView) Then
    
        ColumnRemove = CBool(SendMessageLong(m_hListView, LVM_DELETECOLUMN, Column, 0))
        
        If (Me.ColumnCount = 0) Then
            m_hHeader = 0
        End If
    End If
End Function

Public Function ColumnAutosize( _
                ByVal Column As Long, _
                Optional ByVal AutosizeType As eColumnAutosizeConstants = [caItem] _
                ) As Boolean

    If (m_hListView) Then
    
        ColumnAutosize = CBool(SendMessageLong(m_hListView, LVM_SETCOLUMNWIDTH, Column, AutosizeType))
    End If
End Function

'//

Public Function ItemAdd( _
                ByVal Item As Long, _
                ByVal Text As String, _
                ByVal Indent As Long, _
                ByVal Icon As Long, _
                ByVal ItemData As Long _
                ) As Boolean
   
  Dim uLV As LVITEM
  
    If (m_hListView) Then

        With uLV
            .iItem = Item
            '.lParam = Item
            .lParam = ItemData
            .pszText = Text & vbNullChar
            .cchTextMax = Len(Text) + 1
            .iIndent = Indent
            .iImage = Icon
            .mask = LVIF_TEXT Or LVIF_INDENT Or LVIF_IMAGE Or LVIF_PARAM
        End With
        ItemAdd = (SendMessage(m_hListView, LVM_INSERTITEM, 0, uLV) > -1)
        
        If (SendMessageLong(m_hListView, LVM_GETITEMCOUNT, 0, 0) = 1) Then
            m_bFirstItem = True: Me.ItemFocused(0) = True
          Else
            m_bFirstItem = False
        End If
    End If
End Function

Public Function ItemRemove( _
                ByVal Item As Long _
                ) As Boolean
    
    If (m_hListView) Then
    
        ItemRemove = CBool(SendMessageLong(m_hListView, LVM_DELETEITEM, Item, 0))
    End If
End Function

Public Function ItemEnsureVisible( _
                ByVal Item As Long _
                ) As Boolean

    If (m_hListView) Then
    
        ItemEnsureVisible = CBool(SendMessageLong(m_hListView, LVM_ENSUREVISIBLE, Item, 0))
    End If
End Function

Public Function GetSelectedItem() As Long
    Dim lFlags As Long
    
    If m_hListView Then
        If Me.MultiSelect Then
            GetSelectedItem = SendMessage(m_hListView, LVM_GETSELECTIONMARK, 0&, 0&)
        Else
            lFlags = LVNI_SELECTED
            If GetFocus() = m_hListView Then lFlags = lFlags Or LVNI_FOCUSED
    
            GetSelectedItem = SendMessage(m_hListView, LVM_GETNEXTITEM, &HFFFF, ByVal lFlags)
        End If
    End If
End Function
 
Public Function ItemFindText( _
                ByVal Text As String, _
                Optional ByVal StartItem As Long = -1, _
                Optional ByVal Coincidence As eCoincidenceConstants = [cWholeWord] _
                ) As Long
  
  Dim uLVFI As LVFINDINFO
    
    If (m_hListView) Then
    
        With uLVFI
            .psz = Text + vbNullChar
            .Flags = Coincidence
        End With
        
        ItemFindText = SendMessage(m_hListView, LVM_FINDITEM, StartItem, uLVFI)
    End If
End Function

Public Function ItemFindState( _
                Optional ByVal StartItem As Long = -1, _
                Optional ByVal State As eStateConstants = [sSelected] _
                ) As Long

    If (m_hListView) Then
        
        ItemFindState = SendMessageLong(m_hListView, LVM_GETNEXTITEM, StartItem, State)
    End If
End Function

Public Function ItemHitTest( _
                ByVal X As Single, _
                ByVal Y As Single _
                ) As Long

  Dim uLVHI As LVHITTESTINFO
    
    If (m_hListView) Then
    
        With uLVHI.PT
            .X = ScaleX(X, UserControl.ScaleMode, vbPixels)
            .Y = ScaleY(Y, UserControl.ScaleMode, vbPixels)
        End With
        
        ItemHitTest = SendMessage(m_hListView, LVM_HITTEST, 0, uLVHI)
    End If
End Function

Public Function SubItemSet( _
                ByVal Item As Long, _
                ByVal SubItem As Long, _
                ByVal Text As String, _
                ByVal Icon As Long _
                ) As Boolean
   
  Dim uLV As LVITEM

    If (m_hListView) Then

        With uLV
            .iItem = Item
            .iSubItem = SubItem
            .pszText = Text & vbNullChar
            .cchTextMax = Len(Text) + 1
            .iImage = Icon
            .mask = LVIF_TEXT Or LVIF_IMAGE
        End With
        SubItemSet = CBool(SendMessage(m_hListView, LVM_SETITEM, 0, uLV))
    End If
End Function

'========================================================================================
' Properties
'========================================================================================

Public Property Get ColumnText(ByVal Column As Long) As String
Attribute ColumnText.VB_MemberFlags = "400"

  Dim uLVC   As LVCOLUMN_lp
  Dim a(261) As Byte
  
    If (m_hListView And m_hHeader) Then
        
        With uLVC
            .pszText = VarPtr(a(0))
            .cchTextMax = UBound(a)
            .mask = LVCF_TEXT
        End With
        Call SendMessage(m_hListView, LVM_GETCOLUMN, Column, uLVC)
        
        ColumnText = Left$(StrConv(a(), vbUnicode), uLVC.cchTextMax)
    End If
End Property
Public Property Let ColumnText(ByVal Column As Long, ByVal Text As String)

  Dim uLVC As LVCOLUMN
    
    If (m_hListView And m_hHeader) Then
    
        With uLVC
            .pszText = Text & vbNullChar
            .cchTextMax = Len(Text) + 1
            .mask = LVCF_TEXT
        End With
        Call SendMessage(m_hListView, LVM_SETCOLUMN, Column, uLVC)
    End If
End Property

Public Property Get ColumnWidth(ByVal Column As Long) As Long
Attribute ColumnWidth.VB_MemberFlags = "400"

    If (m_hListView And m_hHeader) Then

        ColumnWidth = SendMessageLong(m_hListView, LVM_GETCOLUMNWIDTH, Column, 0)
    End If
End Property
Public Property Let ColumnWidth(ByVal Column As Long, ByVal Width As Long)

    If (m_hListView And m_hHeader) Then

        Call SendMessageLong(m_hListView, LVM_SETCOLUMNWIDTH, Column, Width)
    End If
End Property

Public Property Get ColumnAlign(ByVal Column As Long) As eColumnAlignConstants

  Const lMask As Long = &H3
  Dim uLVC    As LVCOLUMN
  
    If (m_hListView And m_hHeader) Then
        
        With uLVC
            .mask = LVCF_FMT
        End With
        Call SendMessage(m_hListView, LVM_GETCOLUMN, Column, uLVC)
        
        ColumnAlign = (lMask And uLVC.fmt)
    End If
End Property
Public Property Let ColumnAlign(ByVal Column As Long, ByVal Align As eColumnAlignConstants)

  Dim uLVC As LVCOLUMN
    
    If (m_hListView And m_hHeader) Then
    
        With uLVC
            .fmt = Align * -(Column <> 0)
            .mask = LVCF_FMT
        End With
        Call SendMessage(m_hListView, LVM_SETCOLUMN, Column, uLVC)
    End If
End Property

Public Property Get ColumnIcon(ByVal Column As Long) As Long

  Dim uLVC As LVCOLUMN
  
    If (m_hListView) Then
        
        With uLVC
            .mask = LVCF_IMAGE
        End With
        Call SendMessage(m_hListView, LVM_GETCOLUMN, Column, uLVC)
        
        ColumnIcon = uLVC.iImage
    End If
End Property
Public Property Let ColumnIcon(ByVal Column As Long, ByVal Icon As Long)
  
  Const lMask As Long = &H3
  Dim uHDI    As HDITEM
  Dim lAlign  As Long
  
    If (m_hListView And m_hHeader) Then
                
        With uHDI
            .mask = HDI_FORMAT
        Call SendMessage(m_hHeader, HDM_GETITEM, Column, uHDI): lAlign = lMask And .fmt
            .iImage = Icon
            .fmt = HDF_STRING Or lAlign Or HDF_IMAGE * -(Icon > -1 And m_hILHeader <> 0) Or HDF_BITMAP_ON_RIGHT
            .mask = HDI_IMAGE * -(Icon > -1) Or HDI_FORMAT
        End With
        Call SendMessage(m_hHeader, HDM_SETITEM, Column, uHDI)
    End If
End Property

'//


Public Property Get ItemText(ByVal Item As Long) As String
Attribute ItemText.VB_MemberFlags = "400"
  
  Dim uLVI   As LVITEM_lp
  Dim a(261) As Byte
  Dim lLen   As Long
    
    If (m_hListView) Then
    
        With uLVI
            .pszText = VarPtr(a(0))
            .cchTextMax = UBound(a)
        End With
        lLen = SendMessage(m_hListView, LVM_GETITEMTEXT, Item, uLVI)
        
        ItemText = Left$(StrConv(a(), vbUnicode), lLen)
    End If
End Property
Public Property Let ItemText(ByVal Item As Long, ByVal Text As String)
  
  Dim uLVI As LVITEM
    
    If (m_hListView) Then
    
        With uLVI
            .pszText = Text & vbNullChar
            .cchTextMax = Len(Text) + 1
        End With
        Call SendMessage(m_hListView, LVM_SETITEMTEXT, Item, uLVI)
    End If
End Property

Public Property Get ItemData(ByVal Item As Long) As Long
  
  Dim uLVI As LVITEM
    
    If (m_hListView) Then
    
        With uLVI
            .iItem = Item
            .mask = LVIF_PARAM
        End With
        
        Call SendMessage(m_hListView, LVM_GETITEM, 0, uLVI)
        
        ItemData = uLVI.lParam
    End If
End Property

Public Property Let ItemData(ByVal Item As Long, ByVal lParam As Long)
  
  Dim uLVI As LVITEM
    
    If (m_hListView) Then
    
        With uLVI
            .iItem = Item
            .lParam = lParam
            .mask = LVIF_PARAM
        End With
        Call SendMessage(m_hListView, LVM_SETITEM, 0, uLVI)
    End If
End Property

Public Property Get ItemIcon(ByVal Item As Long) As Long
Attribute ItemIcon.VB_MemberFlags = "400"
  
  Dim uLVI As LVITEM
    
    If (m_hListView) Then
    
        With uLVI
            .iItem = Item
            .mask = LVIF_IMAGE
        End With
        Call SendMessage(m_hListView, LVM_GETITEM, 0, uLVI)
        
        ItemIcon = uLVI.iImage
    End If
End Property
Public Property Let ItemIcon(ByVal Item As Long, ByVal Icon As Long)
  
  Dim uLVI As LVITEM
    
    If (m_hListView) Then
    
        With uLVI
            .iItem = Item
            .iImage = Icon
            .mask = LVIF_IMAGE
        End With
        Call SendMessage(m_hListView, LVM_SETITEM, 0, uLVI)
    End If
End Property

Public Property Get ItemIndent(ByVal Item As Long) As Long
Attribute ItemIndent.VB_MemberFlags = "400"
  
  Dim uLVI As LVITEM
    
    If (m_hListView) Then
    
        With uLVI
            .iItem = Item
            .mask = LVIF_INDENT
        End With
        Call SendMessage(m_hListView, LVM_GETITEM, 0, uLVI)
        
        ItemIndent = uLVI.iIndent
    End If
End Property
Public Property Let ItemIndent(ByVal Item As Long, ByVal Indent As Long)
  
  Dim uLVI As LVITEM
    
    If (m_hListView) Then
    
        With uLVI
            .iItem = Item
            .iIndent = Indent
            .mask = LVIF_INDENT
        End With
        Call SendMessage(m_hListView, LVM_SETITEM, 0, uLVI)
    End If
End Property

Public Property Get ItemSelected(ByVal Item As Long) As Boolean
Attribute ItemSelected.VB_MemberFlags = "400"
  
    If (m_hListView) Then
    
        ItemSelected = CBool(SendMessageLong(m_hListView, LVM_GETITEMSTATE, Item, LVIS_SELECTED))
    End If
End Property
Public Property Let ItemSelected(ByVal Item As Long, ByVal Selected As Boolean)
  
  Dim uLVI As LVITEM
    
    If (m_hListView) Then
        
        With uLVI
            .stateMask = LVIS_SELECTED Or -(Selected And Item > -1) * LVIS_FOCUSED
            .State = -Selected * LVIS_SELECTED Or -(Item > -1) * LVIS_FOCUSED
            .mask = LVIF_STATE
        End With
        Call SendMessage(m_hListView, LVM_SETITEMSTATE, Item, uLVI)
    End If
End Property

Public Property Get ItemFocused(ByVal Item As Long) As Boolean
Attribute ItemFocused.VB_MemberFlags = "400"
  
    If (m_hListView) Then
    
        ItemFocused = CBool(SendMessageLong(m_hListView, LVM_GETITEMSTATE, Item, LVIS_FOCUSED))
    End If
End Property
Public Property Let ItemFocused(ByVal Item As Long, ByVal Focused As Boolean)
  
  Dim uLVI As LVITEM
    
    If (m_hListView) Then
        
        With uLVI
            .stateMask = LVIS_FOCUSED
            .State = -Focused * LVIS_FOCUSED
            .mask = LVIF_STATE
        End With
        Call SendMessage(m_hListView, LVM_SETITEMSTATE, Item, uLVI)
    End If
End Property

Public Property Get ItemChecked(ByVal Item As Long) As Boolean
Attribute ItemChecked.VB_MemberFlags = "400"
  
    If (m_hListView) Then
    
        ItemChecked = ((SendMessageLong(m_hListView, LVM_GETITEMSTATE, Item, LVIS_STATEIMAGEMASK) And &H2000&) = &H2000&)
    End If
End Property
Public Property Let ItemChecked(ByVal Item As Long, ByVal Checked As Boolean)
  
  Dim uLVI As LVITEM
    
    If (m_hListView) Then
        
        With uLVI
            .stateMask = LVIS_STATEIMAGEMASK
            .State = &H1000& * (1 - Checked)
            .mask = LVIF_STATE
        End With
        Call SendMessage(m_hListView, LVM_SETITEMSTATE, Item, uLVI)
    End If
End Property

Public Property Get ItemGhosted(ByVal Item As Long) As Boolean
Attribute ItemGhosted.VB_MemberFlags = "400"
  
    If (m_hListView) Then
    
        ItemGhosted = (SendMessageLong(m_hListView, LVM_GETITEMSTATE, Item, LVIS_CUT))
    End If
End Property
Public Property Let ItemGhosted(ByVal Item As Long, ByVal Ghosted As Boolean)
  
  Dim uLVI As LVITEM
    
    If (m_hListView) Then
        
        With uLVI
            .stateMask = LVIS_CUT
            .State = LVIS_CUT * -Ghosted
            .mask = LVIF_STATE
        End With
        Call SendMessage(m_hListView, LVM_SETITEMSTATE, Item, uLVI)
    End If
End Property

'//

Public Property Get SubItemText(ByVal Item As Long, ByVal SubItem As Long) As String
Attribute SubItemText.VB_MemberFlags = "400"
  
  Dim uLVI   As LVITEM_lp
  Dim a(256) As Byte
  Dim lLen   As Long
    
    If (m_hListView) Then
        
        With uLVI
            .iSubItem = SubItem
            .pszText = VarPtr(a(0))
            .cchTextMax = UBound(a)
            .mask = LVIF_TEXT
        End With
        lLen = SendMessage(m_hListView, LVM_GETITEMTEXT, Item, uLVI)
        
        SubItemText = Left$(StrConv(a(), vbUnicode), lLen)
    End If
End Property
Public Property Let SubItemText(ByVal Item As Long, ByVal SubItem As Long, ByVal Text As String)
  
  Dim uLVI As LVITEM
    
    If (m_hListView) Then
        
        With uLVI
            .iSubItem = SubItem
            .pszText = Text & vbNullChar
            .cchTextMax = Len(Text) + 1
        End With
        Call SendMessage(m_hListView, LVM_SETITEMTEXT, Item, uLVI)
    End If
End Property




Public Property Get SubItemIcon(ByVal Item As Long, ByVal SubItem As Long) As Long
Attribute SubItemIcon.VB_MemberFlags = "400"
  
  Dim uLVI As LVITEM
    
    If (m_hListView) Then
        
        With uLVI
            .iItem = Item
            .iSubItem = SubItem
            .mask = LVIF_IMAGE
        End With
        Call SendMessage(m_hListView, LVM_GETITEM, 0, uLVI)
        
        SubItemIcon = uLVI.iImage
    End If
End Property
Public Property Let SubItemIcon(ByVal Item As Long, ByVal SubItem As Long, ByVal Icon As Long)
  
  Dim uLVI As LVITEM
    
    If (m_hListView) Then
            
        With uLVI
            .iItem = Item
            .iSubItem = SubItem
            .iImage = Icon
            .mask = LVIF_IMAGE
        End With
        Call SendMessage(m_hListView, LVM_SETITEM, 0, uLVI)
    End If
End Property

'//

Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_MemberFlags = "400"
    
    If (m_hListView) Then
        BackColor = SendMessageLong(m_hListView, LVM_GETBKCOLOR, 0, 0)
    End If
End Property
Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
    
  Dim lColor As Long
    
    If (m_hListView) Then
        Call OleTranslateColor(New_BackColor, 0, lColor)
        Call SendMessageLong(m_hListView, LVM_SETBKCOLOR, 0, lColor)
        Call SendMessageLong(m_hListView, LVM_SETTEXTBKCOLOR, 0, lColor)
        Call UserControl.Refresh
    End If
End Property

Public Property Get BorderStyle() As eBorderStyleConstants
    BorderStyle = m_BorderStyle
End Property
Public Property Let BorderStyle(ByVal New_BorderStyle As eBorderStyleConstants)
    m_BorderStyle = New_BorderStyle
    Call pvSetBorderStyle(UserControl.hwnd, m_BorderStyle)
    Call UserControl_Resize
End Property

Public Property Get CheckBoxes() As Boolean
Attribute CheckBoxes.VB_MemberFlags = "400"
    CheckBoxes = m_CheckBoxes
End Property
Public Property Let CheckBoxes(ByVal New_CheckBoxes As Boolean)
    If (m_hListView) Then
        m_CheckBoxes = New_CheckBoxes
        If (m_CheckBoxes) Then
            Call pvSetExStyle(LVS_EX_CHECKBOXES, 0)
          Else
            Call pvSetExStyle(0, LVS_EX_CHECKBOXES)
        End If
    End If
End Property

Public Property Get Count() As Long
Attribute Count.VB_MemberFlags = "400"
    If (m_hListView) Then
        Count = SendMessageLong(m_hListView, LVM_GETITEMCOUNT, 0, 0)
    End If
End Property

Public Property Get ColumnCount() As Long
Attribute ColumnCount.VB_MemberFlags = "400"
    If (m_hListView) Then
        ColumnCount = SendMessageLong(pvHeaderhWnd(), HDM_GETITEMCOUNT, 0, 0)
    End If
End Property

Public Property Get Enabled() As Boolean
Attribute Enabled.VB_MemberFlags = "400"
    Enabled = UserControl.Enabled
End Property
Public Property Let Enabled(ByVal New_Enabled As Boolean)
    If (m_hListView) Then
        UserControl.Enabled = New_Enabled
        Call EnableWindow(m_hListView, New_Enabled)
    End If
End Property

Public Property Get Font() As StdFont
Attribute Font.VB_MemberFlags = "400"
    Set Font = m_oFont
End Property
Public Property Set Font(ByVal New_Font As StdFont)

  Dim uLF   As LOGFONT
  Dim nChar As Integer

    If (m_hListView) Then
    
         With uLF
             For nChar = 1 To Len(m_oFont.Name)
                 .lfFaceName(nChar - 1) = CByte(Asc(Mid$(m_oFont.Name, nChar, 1)))
             Next nChar
             .lfHeight = -MulDiv(m_oFont.Size, GetDeviceCaps(hdc, LOGPIXELSY), 72)
             .lfItalic = m_oFont.Italic
             .lfWeight = IIf(m_oFont.Bold, FW_BOLD, FW_NORMAL)
             .lfUnderline = m_oFont.Underline
             .lfStrikeOut = m_oFont.Strikethrough
             .lfCharSet = m_oFont.Charset
        End With
        Call pvDestroyFont: m_hFont = CreateFontIndirect(uLF)
        
        Call SendMessageLong(m_hListView, WM_SETFONT, m_hFont, True)
    End If
End Property
Private Sub m_oFont_FontChanged(ByVal PropertyName As String)
    Set Font = m_oFont
End Sub

Public Property Get ForeColor() As OLE_COLOR
    If (m_hListView) Then
        ForeColor = SendMessageLong(m_hListView, LVM_GETTEXTCOLOR, 0, 0)
    End If
End Property
Public Property Let ForeColor(ByVal New_ForeColor As OLE_COLOR)
Attribute ForeColor.VB_MemberFlags = "400"
    
  Dim lColor As Long
    
    If (m_hListView) Then
        Call OleTranslateColor(New_ForeColor, 0, lColor)
        Call SendMessageLong(m_hListView, LVM_SETTEXTCOLOR, 0, lColor)
        Call UserControl.Refresh
    End If
End Property

Public Property Get FullRowSelect() As Boolean
Attribute FullRowSelect.VB_MemberFlags = "400"
    FullRowSelect = m_FullRowSelect
End Property
Public Property Let FullRowSelect(ByVal New_FullRowSelect As Boolean)
    If (m_hListView) Then
        m_FullRowSelect = New_FullRowSelect
        If (m_FullRowSelect) Then
            Call pvSetExStyle(LVS_EX_FULLROWSELECT, 0)
          Else
            Call pvSetExStyle(0, LVS_EX_FULLROWSELECT)
        End If
    End If
End Property

Public Property Get GridLines() As Boolean
Attribute GridLines.VB_MemberFlags = "400"
    GridLines = m_GridLines
End Property
Public Property Let GridLines(ByVal New_GridLines As Boolean)
    If (m_hListView) Then
        m_GridLines = New_GridLines
        If (m_GridLines) Then
            Call pvSetExStyle(LVS_EX_GRIDLINES, 0)
          Else
            Call pvSetExStyle(0, LVS_EX_GRIDLINES)
        End If
    End If
End Property

Public Property Get HeaderDragDrop() As Boolean
Attribute HeaderDragDrop.VB_MemberFlags = "400"
    HeaderDragDrop = m_HeaderDragDrop
End Property
Public Property Let HeaderDragDrop(ByVal New_HeaderDragDrop As Boolean)
    If (m_hListView) Then
        m_HeaderDragDrop = New_HeaderDragDrop
        If (m_HeaderDragDrop) Then
            Call pvSetExStyle(LVS_EX_HEADERDRAGDROP, 0)
          Else
            Call pvSetExStyle(0, LVS_EX_HEADERDRAGDROP)
        End If
    End If
End Property

Public Property Get HeaderFixedWidth() As Boolean
Attribute HeaderFixedWidth.VB_MemberFlags = "400"
    HeaderFixedWidth = m_HeaderFixedWidth
End Property
Public Property Let HeaderFixedWidth(ByVal New_HeaderFixedWidth As Boolean)
    m_HeaderFixedWidth = New_HeaderFixedWidth
End Property

Public Property Get HeaderFlat() As Boolean
Attribute HeaderFlat.VB_MemberFlags = "400"
    HeaderFlat = m_HeaderFlat
End Property
Public Property Let HeaderFlat(ByVal New_HeaderFlat As Boolean)

  Dim lS    As Long
  Dim lhWnd As Long
  
    If (m_hListView) Then
        m_HeaderFlat = New_HeaderFlat
        lhWnd = pvHeaderhWnd()
        If (lhWnd) Then
            lS = GetWindowLong(lhWnd, GWL_STYLE)
            If (m_HeaderFlat) Then
                lS = lS And Not HDS_BUTTONS
              Else
                lS = lS Or HDS_BUTTONS
            End If
            Call SetWindowLong(lhWnd, GWL_STYLE, lS)
        End If
    End If
End Property

Public Property Get HeaderHide() As Boolean
Attribute HeaderHide.VB_MemberFlags = "400"
    HeaderHide = m_HeaderHide
End Property
Public Property Let HeaderHide(ByVal New_HeaderHide As Boolean)
    If (m_hListView) Then
        m_HeaderHide = New_HeaderHide
        If (m_HeaderHide) Then
            Call pvSetStyle(LVS_NOCOLUMNHEADER, 0)
          Else
            Call pvSetStyle(0, LVS_NOCOLUMNHEADER)
        End If
    End If
End Property

Public Property Get HideSelection() As Boolean
Attribute HideSelection.VB_MemberFlags = "400"
    HideSelection = m_HideSelection
End Property
Public Property Let HideSelection(ByVal New_HideSelection As Boolean)
    If (m_hListView) Then
        m_HideSelection = New_HideSelection
        If (m_HideSelection) Then
            Call pvSetStyle(0, LVS_SHOWSELALWAYS)
          Else
            Call pvSetStyle(LVS_SHOWSELALWAYS, 0)
        End If
    End If
End Property

Public Property Get LabelEdit() As Boolean
Attribute LabelEdit.VB_MemberFlags = "400"
    LabelEdit = m_EditLabels
End Property
Public Property Let LabelEdit(ByVal New_LabelEdit As Boolean)
    If (m_hListView) Then
        m_EditLabels = New_LabelEdit
        If (m_EditLabels) Then
            Call pvSetStyle(LVS_EDITLABELS, 0)
          Else
            Call pvSetStyle(0, LVS_EDITLABELS)
        End If
    End If
End Property

Public Sub StartLabelEdit(ByVal Index As Long)
    Call SetFocus(m_hListView)
    DoEvents
    Call SendMessageLong(m_hListView, LVM_EDITLABEL, Index, 0)
End Sub

Public Property Get LabelTips() As Boolean
Attribute LabelTips.VB_MemberFlags = "400"
    LabelTips = m_LabelTips
End Property
Public Property Let LabelTips(ByVal New_LabelTips As Boolean)
    If (m_hListView) Then
        m_LabelTips = New_LabelTips
        If (m_LabelTips) Then
            Call pvSetExStyle(LVS_EX_LABELTIP, 0)
          Else
            Call pvSetExStyle(0, LVS_EX_LABELTIP)
        End If
    End If
End Property

Public Property Get MultiSelect() As Boolean
    MultiSelect = m_MultiSelect
End Property
Public Property Let MultiSelect(ByVal New_MultiSelect As Boolean)
Attribute MultiSelect.VB_MemberFlags = "400"
    If (m_hListView) Then
        m_MultiSelect = New_MultiSelect
        If (m_MultiSelect) Then
            Call pvSetStyle(0, LVS_SINGLESEL)
          Else
            Call pvSetStyle(LVS_SINGLESEL, 0)
        End If
    End If
End Property

Public Property Get OneClickActivate() As Boolean
Attribute OneClickActivate.VB_MemberFlags = "400"
    OneClickActivate = m_OneClickActivate
End Property
Public Property Let OneClickActivate(ByVal New_OneClickActivate As Boolean)
    If (m_hListView) Then
        m_OneClickActivate = New_OneClickActivate
        If (m_OneClickActivate) Then
            Call pvSetExStyle(LVS_EX_ONECLICKACTIVATE, 0)
          Else
            Call pvSetExStyle(0, LVS_EX_ONECLICKACTIVATE)
        End If
    End If
End Property

Public Property Get ScaleMode() As ScaleModeConstants
   ScaleMode = UserControl.ScaleMode
End Property
Public Property Let ScaleMode(ByVal New_ScaleMode As ScaleModeConstants)
   UserControl.ScaleMode = New_ScaleMode
End Property

Public Property Get hwnd() As Long
    hwnd = m_hListView
End Property

Public Property Get ScrollBarFlat() As Boolean
Attribute ScrollBarFlat.VB_MemberFlags = "400"
    ScrollBarFlat = m_ScrollBarFlat
End Property
Public Property Let ScrollBarFlat(ByVal New_ScrollBarFlat As Boolean)
    If (m_hListView) Then
        m_ScrollBarFlat = New_ScrollBarFlat
        If (m_ScrollBarFlat) Then
            Call pvSetExStyle(LVS_EX_FLATSB, 0)
          Else
            Call pvSetExStyle(0, LVS_EX_FLATSB)
        End If
    End If
End Property

Public Property Get SelectedCount() As Long
Attribute SelectedCount.VB_MemberFlags = "400"
    If (m_hListView) Then
        SelectedCount = SendMessageLong(m_hListView, LVM_GETSELECTEDCOUNT, 0, 0)
    End If
End Property

Public Property Get SubItemImages() As Boolean
Attribute SubItemImages.VB_MemberFlags = "400"
    SubItemImages = m_SubItemImages
End Property
Public Property Let SubItemImages(ByVal New_SubItemImages As Boolean)
    If (m_hListView) Then
        m_SubItemImages = New_SubItemImages
        If (m_SubItemImages) Then
            Call pvSetExStyle(LVS_EX_SUBITEMIMAGES, 0)
          Else
            Call pvSetExStyle(0, LVS_EX_SUBITEMIMAGES)
        End If
    End If
End Property

Public Property Get TrackSelect() As Boolean
Attribute TrackSelect.VB_MemberFlags = "400"
    TrackSelect = m_TrackSelect
End Property
Public Property Let TrackSelect(ByVal New_TrackSelect As Boolean)
    If (m_hListView) Then
        m_TrackSelect = New_TrackSelect
        If (m_TrackSelect) Then
            Call pvSetExStyle(LVS_EX_TRACKSELECT, 0)
          Else
            Call pvSetExStyle(0, LVS_EX_TRACKSELECT)
        End If
    End If
End Property

Public Property Get UnderlineHot() As Boolean
Attribute UnderlineHot.VB_MemberFlags = "400"
    UnderlineHot = m_UnderlineHot
End Property
Public Property Let UnderlineHot(ByVal New_UnderlineHot As Boolean)
    If (m_hListView) Then
        m_UnderlineHot = New_UnderlineHot
        If (m_UnderlineHot) Then
            Call pvSetExStyle(LVS_EX_UNDERLINEHOT, 0)
          Else
            Call pvSetExStyle(0, LVS_EX_UNDERLINEHOT)
        End If
    End If
End Property

Public Property Let ViewMode(ByVal New_ViewMode As eViewModeConstants)
    If (m_hListView) Then
        m_ViewMode = New_ViewMode
        Call pvSetStyle(m_ViewMode, (LVS_ICON Or LVS_SMALLICON Or LVS_REPORT Or LVS_LIST))
    End If
End Property
Public Property Get ViewMode() As eViewModeConstants
Attribute ViewMode.VB_MemberFlags = "400"
    ViewMode = m_ViewMode
End Property

'//
Public Property Get RaiseSubItemPrePaint() As Boolean
Attribute RaiseSubItemPrePaint.VB_MemberFlags = "400"
    RaiseSubItemPrePaint = m_RaiseSubItemPrePaint
End Property
Public Property Let RaiseSubItemPrePaint(ByVal New_RaiseSubItemPrePaint As Boolean)
    m_RaiseSubItemPrePaint = New_RaiseSubItemPrePaint
End Property
'//
'========================================================================================
' OLE Drag & Drop support
'========================================================================================


Public Property Get OLEDragMode() As lvOLEDragConstants
    OLEDragMode = UserControl.OLEDropMode
End Property

Public Property Let OLEDragMode(ByVal New_OLEDragMode As lvOLEDragConstants)
    UserControl.OLEDropMode = New_OLEDragMode
End Property

Public Property Get OLEDropMode() As lvOLEDropConstants
    OLEDropMode = UserControl.OLEDropMode
End Property
Public Property Let OLEDropMode(ByVal New_OLEDropMode As lvOLEDropConstants)
    UserControl.OLEDropMode = New_OLEDropMode
End Property

Private Sub UserControl_OLEStartDrag(Data As DataObject, AllowedEffects As Long)
    Call Data.Clear
    RaiseEvent OLEStartDrag(Data, AllowedEffects)
End Sub

Private Sub UserControl_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
    RaiseEvent OLEDragOver(Data, Effect, Button, Shift, X, Y, State)
End Sub

Private Sub UserControl_OLEGiveFeedback(Effect As Long, DefaultCursors As Boolean)
    RaiseEvent OLEGiveFeedback(Effect, DefaultCursors)
End Sub

Private Sub UserControl_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Call ReleaseCapture
    RaiseEvent OLEDragDrop(Data, Effect, Button, Shift, X, Y)
End Sub

Private Sub UserControl_OLECompleteDrag(Effect As Long)
    Call ReleaseCapture
    RaiseEvent OLECompleteDrag(Effect)
End Sub

Private Sub UserControl_OLESetData(Data As DataObject, DataFormat As Integer)
    RaiseEvent OLESetData(Data, DataFormat)
End Sub



'========================================================================================
' Private
'========================================================================================

Private Function pvCreate() As Boolean

  Dim lExStyle As Long
  Dim lLVStyle As Long
  
    Call pvDestroyListView
    
    lExStyle = GetWindowLong(UserControl.hwnd, GWL_EXSTYLE) Or WS_EX_CLIENTEDGE
    lLVStyle = WS_CHILD Or WS_TABSTOP Or LVS_LIST Or LVS_AUTOARRANGE Or LVS_SINGLESEL Or LVS_SHOWSELALWAYS Or LVS_SHAREIMAGELISTS Or LVS_TYPEMASK

    m_hListView = CreateWindowEx( _
                  lExStyle, WC_LISTVIEW, vbNullString, lLVStyle, _
                  0, 0, UserControl.ScaleWidth, UserControl.ScaleHeight, _
                  UserControl.hwnd, 0, App.hInstance, ByVal 0)
    
    If (m_hListView) Then
        Call ShowWindow(m_hListView, SW_SHOW)
        pvCreate = True
    End If
End Function

Private Function pvDestroyListView() As Boolean
    
    If (m_hListView) Then
        If (DestroyWindow(m_hListView)) Then
            pvDestroyListView = True
            m_hListView = 0
        End If
    End If
End Function

Private Function pvDestroyImageListSmall() As Boolean

    If (m_hILSmall) Then
        If (ImageList_Destroy(m_hILSmall)) Then
            pvDestroyImageListSmall = True
            m_hILSmall = 0
        End If
    End If
End Function

Private Function pvDestroyImageListLarge() As Boolean

    If (m_hILLarge) Then
        If (ImageList_Destroy(m_hILLarge)) Then
            pvDestroyImageListLarge = True
            m_hILLarge = 0
        End If
    End If
End Function

Private Function pvDestroyImageListHeader() As Boolean

    If (m_hILHeader) Then
        If (ImageList_Destroy(m_hILHeader)) Then
            pvDestroyImageListHeader = True
            m_hILHeader = 0
        End If
    End If
End Function

Private Function pvDestroyFont() As Boolean

    If (m_hFont) Then
        If (DeleteObject(m_hFont)) Then
            pvDestroyFont = True
            m_hFont = 0
        End If
    End If
End Function

Private Function pvHeaderhWnd() As Long
    If (m_hListView) Then
        pvHeaderhWnd = SendMessageLong(m_hListView, LVM_GETHEADER, 0, 0)
    End If
End Function

Private Function pvEdithWnd() As Long
    If (m_hListView) Then
        pvEdithWnd = SendMessageLong(m_hListView, LVM_GETEDITCONTROL, 0, 0)
    End If
End Function

'//

Private Sub pvSetStyle(ByVal lStyle As Long, ByVal lStyleNot As Long)

  Dim lS As Long
    
    If (m_hListView) Then
        lS = GetWindowLong(m_hListView, GWL_STYLE)
        lS = lS And Not lStyleNot
        lS = lS Or lStyle
        Call SetWindowLong(m_hListView, GWL_STYLE, lS)
        Call SetWindowPos(m_hListView, 0, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE Or SWP_NOOWNERZORDER Or SWP_NOZORDER Or SWP_FRAMECHANGED)
   End If
End Sub

Public Sub SetStyle(ByVal lStyle As Long)

  Dim lS As Long
    
 If (m_hListView) Then
     lS = GetWindowLong(m_hListView, GWL_STYLE)
     lS = lS Or lStyle
     Call SetWindowLong(m_hListView, GWL_STYLE, lS)
     Call SetWindowPos(m_hListView, 0, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE Or SWP_NOOWNERZORDER Or SWP_NOZORDER Or SWP_FRAMECHANGED)
End If

End Sub


Private Sub pvSetExStyle(ByVal lStyle As Long, ByVal lStyleNot As Long)

  Dim lS As Long
   
    If (m_hListView) Then
        lS = SendMessageLong(m_hListView, LVM_GETEXTENDEDLISTVIEWSTYLE, 0, 0)
        lS = lS And Not lStyleNot
        lS = lS Or lStyle
        Call SendMessageLong(m_hListView, LVM_SETEXTENDEDLISTVIEWSTYLE, 0, lS)
    End If
End Sub

Private Sub pvSetBorderStyle(ByVal lhWnd As Long, ByVal eStyle As eBorderStyleConstants)
    
    Select Case eStyle
        Case [bsNone]
            Call pvSetWinExStyle(lhWnd, GWL_STYLE, 0, WS_BORDER Or WS_THICKFRAME)
            Call pvSetWinExStyle(lhWnd, GWL_EXSTYLE, 0, WS_EX_STATICEDGE Or WS_EX_CLIENTEDGE Or WS_EX_WINDOWEDGE)
        Case [bsThin]
            Call pvSetWinExStyle(lhWnd, GWL_STYLE, 0, WS_BORDER Or WS_THICKFRAME)
            Call pvSetWinExStyle(lhWnd, GWL_EXSTYLE, WS_EX_STATICEDGE, WS_EX_CLIENTEDGE Or WS_EX_WINDOWEDGE)
        Case [bsThick]
            Call pvSetWinExStyle(lhWnd, GWL_STYLE, 0, WS_BORDER Or WS_THICKFRAME)
            Call pvSetWinExStyle(lhWnd, GWL_EXSTYLE, WS_EX_CLIENTEDGE, WS_EX_STATICEDGE Or WS_EX_WINDOWEDGE)
    End Select
End Sub

Private Sub pvSetWinExStyle(ByVal lhWnd As Long, ByVal lType As Long, ByVal lStyle As Long, ByVal lStyleNot As Long)

  Dim lS As Long
    
    lS = GetWindowLong(lhWnd, lType)
    lS = (lS And Not lStyleNot) Or lStyle
    Call SetWindowLong(lhWnd, lType, lS)
    Call SetWindowPos(lhWnd, 0, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE Or SWP_NOOWNERZORDER Or SWP_NOZORDER Or SWP_FRAMECHANGED)
End Sub

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

Private Sub pvUCCoordPixel(X As Long, Y As Long)

  Dim uPt As POINTAPI

    Call GetCursorPos(uPt)
    Call ScreenToClient(m_hListView, uPt)
    X = uPt.X
    Y = uPt.Y
End Sub

Private Sub pvUCCoordScale(X As Single, Y As Single)

  Dim uPt As POINTAPI

    Call GetCursorPos(uPt)
    Call ScreenToClient(m_hListView, uPt)
    X = ScaleX(uPt.X, vbPixels, UserControl.ScaleMode)
    Y = ScaleY(uPt.Y, vbPixels, UserControl.ScaleMode)
End Sub

Private Function pvItemHitTest() As Long

  Dim uLVHI As LVHITTESTINFO
   
    Call GetCursorPos(uLVHI.PT)
    Call ScreenToClient(m_hListView, uLVHI.PT)
    pvItemHitTest = SendMessage(m_hListView, LVM_HITTEST, 0, uLVHI)
End Function

'----------------------------------------------------------------------------------------
' Custom draw routine
'----------------------------------------------------------------------------------------

Private Function pvCustomDraw(ByVal lParam As Long) As Long
'   Customizing a Control's Appearance Using Custom Draw:
'   http://msdn.microsoft.com/library/default.asp?url=/library/en-us/shellcc/platform/commctls/custdraw/custdraw.asp
  
  Dim uNMLVCD   As NMLVCUSTOMDRAW
  Dim bProcess  As Boolean
  Dim clrTextBk As OLE_COLOR
  Dim clrText   As OLE_COLOR

    Call CopyMemory(uNMLVCD, ByVal lParam, Len(uNMLVCD))
      
    With uNMLVCD
    
        Select Case .nmcd.dwDrawStage
          
            Case CDDS_PREPAINT
            
                pvCustomDraw = CDRF_NOTIFYITEMDRAW
          
            Case CDDS_ITEMPREPAINT
            
                pvCustomDraw = CDRF_NOTIFYSUBITEMDRAW
            
            Case CDDS_ITEMPREPAINT Or CDDS_SUBITEM '(*)
                
                RaiseEvent OnSubItemPrePaint(.nmcd.dwItemSpec, .iSubItem, clrTextBk, clrText, bProcess)
                If (bProcess) Then
                    Call OleTranslateColor(clrTextBk, 0, .clrTextBk)
                    Call OleTranslateColor(clrText, 0, .clrText)
                    Call CopyMemory(ByVal lParam, uNMLVCD, Len(uNMLVCD))
                End If
                pvCustomDraw = CDRF_DODEFAULT
        End Select
    End With
    
'(*) SubItem prepaint notification -> [Details] mode only.
'    For other view modes ('single-item'), process CDDS_ITEMPREPAINT draw stage.
End Function

'----------------------------------------------------------------------------------------
' MouseEnter/Leave support
'----------------------------------------------------------------------------------------

'Determine if the passed function is supported
Private Function pvIsFunctionExported(ByVal sFunction As String, ByVal sModule As String) As Boolean
  
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

'Track the mouse leaving the indicated window
Private Sub pvTrackMouseLeave(ByVal lng_hWnd As Long)
  
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
' IOLEInPlaceActiveObject interface
'----------------------------------------------------------------------------------------

Private Sub pvSetIPAO()

  Dim pOleObject          As IOleObject
  Dim pOleInPlaceSite     As IOleInPlaceSite
  Dim pOleInPlaceFrame    As IOleInPlaceFrame
  Dim pOleInPlaceUIWindow As IOleInPlaceUIWindow
  Dim rcPos               As RECT
  Dim rcClip              As RECT
  Dim uFrameInfo          As OLEINPLACEFRAMEINFO
       
    On Error Resume Next
    
    Set pOleObject = Me
    Set pOleInPlaceSite = pOleObject.GetClientSite
    
    If (Not pOleInPlaceSite Is Nothing) Then
        Call pOleInPlaceSite.GetWindowContext(pOleInPlaceFrame, pOleInPlaceUIWindow, VarPtr(rcPos), VarPtr(rcClip), VarPtr(uFrameInfo))
        If (Not pOleInPlaceFrame Is Nothing) Then
            Call pOleInPlaceFrame.SetActiveObject(m_uIPAO.ThisPointer, vbNullString)
        End If
        If (Not pOleInPlaceUIWindow Is Nothing) Then '-- And Not m_bMouseActivate
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
                     
                    hEdit = pvEdithWnd()
                    If (hEdit) Then
                        Call SendMessageLong(hEdit, pMsg.message, pMsg.wParam, pMsg.lParam)
                      Else
                        Call SendMessageLong(m_hListView, pMsg.message, pMsg.wParam, pMsg.lParam)
                    End If
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


