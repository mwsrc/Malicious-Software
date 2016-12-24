VERSION 5.00
Begin VB.UserControl ucToolbar 
   Alignable       =   -1  'True
   CanGetFocus     =   0   'False
   ClientHeight    =   495
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3735
   ScaleHeight     =   33
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   249
End
Attribute VB_Name = "ucToolbar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'========================================================================================
' User control:  ucToolbar.ctl (basic)
' Author:        Carles P.V. (*)
' Dependencies:  comctl32.dll version 4.71 or later
' Last revision: 2004.10.17
' Version:       3.1.1
'----------------------------------------------------------------------------------------
'
' (*) Part of code from vbAccelerator:
'
'     Toolbar and CoolMenu Control v3.5
'     http://www.vbaccelerator.com/home/VB/Code/Controls/Toolbar/vbAccelerator_ToolBar_and_CoolMenu_Control/article.asp
'
' (*) Self-Subclassing UserControl template (IDE safe) by Paul Caton:
'
'     Self-subclassing Controls/Forms - NO dependencies
'     http://www.planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeId=54117&lngWId=1
'
'----------------------------------------------------------------------------------------
'
' History:
'
'   * x.x.x: - Owner drawn versions.
'   * 3.0.0: - First release.
'   * 3.0.1: - Fixed x/y scaling for ButtonDropDown() event.
'            - Fixed redraw on resize.
'   * 3.1.0: - Added AddBitmap() and AddIcon() methods.
'              Now, images are directly managed through toolbar imagelist.
'   * 3.1.1: - Fixed shutdown crash when using manifest for themes.
'              Thanks to Abhishek.NET for report this.
'              See UserControl_Initialize() and UserControl_Terminate() subs.
'            - Fixed ToolbarEnter() and ButtonEnter() events when button disabled.
'========================================================================================

Option Explicit

'== Misc.

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

Private Declare Function CreateFontIndirect Lib "gdi32" Alias "CreateFontIndirectA" (lpLogFont As LOGFONT) As Long
Private Declare Function GetDeviceCaps Lib "gdi32" (ByVal hdc As Long, ByVal nIndex As Long) As Long
Private Declare Function MulDiv Lib "kernel32" (ByVal nNumber As Long, ByVal nNumerator As Long, ByVal nDenominator As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function OleTranslateColor Lib "oleaut32.dll" (ByVal lOleColor As Long, ByVal lHPalette As Long, lColorRef As Long) As Long
Private Declare Function CreateSolidBrush Lib "gdi32.dll" (ByVal crColor As Long) As Long
Private Declare Function FillRect Lib "user32.dll" (ByVal hdc As Long, ByRef lpRect As RECT2, ByVal hBrush As Long) As Long
Private Declare Function DrawThemeBackGround Lib "uxtheme.dll" Alias "DrawThemeBackground" (ByVal hTheme As Long, ByVal lhdc As Long, ByVal iPartId As Long, ByVal iStateId As Long, pRect As RECT2, pClipRect As Any) As Long
Private Declare Function OpenThemeData Lib "uxtheme.dll" (ByVal hwnd As Long, ByVal pszClassList As Long) As Long
Private Declare Function CloseThemeData Lib "uxtheme.dll" (ByVal hTheme As Long) As Long
Private Declare Function EnableWindow Lib "user32" (ByVal hwnd As Long, ByVal fEnable As Long) As Long

Private Const SW_SHOW                As Long = 5

Private Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long

Private Type POINTAPI
    X As Long
    Y As Long
End Type

Private Type RECT2
    X1 As Long
    Y1 As Long
    X2 As Long
    Y2 As Long
End Type

Private Declare Function GetClientRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT2) As Long
Private Declare Function MapWindowPoints Lib "user32" (ByVal hwndFrom As Long, ByVal hwndTo As Long, lppt As Any, ByVal cPoints As Long) As Long

'//

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

'== Window

Private Const GWL_STYLE        As Long = (-16)

Private Const WS_DISABLED      As Long = &H8000000
Private Const WS_VISIBLE       As Long = &H10000000
Private Const WS_CHILD         As Long = &H40000000
Private Const WS_EX_CLIENTEDGE As Long = &H200

Private Const WM_SIZE          As Long = &H5
Private Const WM_ERASEBKGND    As Long = &H14
Private Const WM_SETFONT       As Long = &H30
Private Const WM_NOTIFY        As Long = &H4E
Private Const WM_COMMAND       As Long = &H111

Private Declare Function CreateWindowEx Lib "user32" Alias "CreateWindowExA" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, lpParam As Any) As Long
Private Declare Function DestroyWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function MoveWindow Lib "user32" (ByVal hwnd As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long

'== Image list

Private Declare Function ImageList_Create Lib "comctl32" (ByVal MinCx As Long, ByVal MinCy As Long, ByVal Flags As Long, ByVal cInitial As Long, ByVal cGrow As Long) As Long
Private Declare Function ImageList_Add Lib "comctl32" (ByVal hImageList As Long, ByVal hBitmap As Long, ByVal hBitmapMask As Long) As Long
Private Declare Function ImageList_AddMasked Lib "comctl32" (ByVal hImageList As Long, ByVal hbmImage As Long, ByVal crMask As Long) As Long
Private Declare Function ImageList_AddIcon Lib "comctl32" (ByVal hImageList As Long, ByVal hIcon As Long) As Long
Private Declare Function ImageList_Destroy Lib "comctl32" (ByVal hImageList As Long) As Long

Private Const CLR_NONE        As Long = &HFFFFFFFF
Private Const ILC_MASK        As Long = &H1
Private Const ILC_COLORDDB    As Long = &HFE
Private Const ILC_COLOR32     As Long = &H20

'== Toolbar
'
'   http://msdn.microsoft.com/library/default.asp?url=/library/en-us/shellcc/platform/commctls/toolbar/toolbar_overview.asp

Private Const WC_TOOLBAR    As String = "ToolbarWindow32"
Private Const CCS_NORESIZE  As Long = &H4
Private Const CCS_NODIVIDER As Long = &H40

Private Type TBBUTTON
   iBitmap    As Long
   IdCommand  As Long
   fsState    As Byte
   fsStyle    As Byte
   bReserved1 As Byte
   bReserved2 As Byte
   dwData     As Long
   iString    As Long
End Type

Private Type TBBUTTONINFO
   cbSize    As Long
   dwMask    As Long
   IdCommand As Long
   iImage    As Long
   fsState   As Byte
   fsStyle   As Byte
   cx        As Integer
   lParam    As Long
   pszText   As Long
   cchText   As Long
End Type

Private Type TBADDBITMAP
    hInst As Long
    nID   As Long
End Type

Private Const TBIF_IMAGE              As Long = &H1
Private Const TBIF_TEXT               As Long = &H2
Private Const TBIF_STATE              As Long = &H4
Private Const TBIF_STYLE              As Long = &H8
Private Const TBIF_LPARAM             As Long = &H10
Private Const TBIF_COMMAND            As Long = &H20
Private Const TBIF_SIZE               As Long = &H40

Private Const TBSTYLE_BUTTON          As Long = &H0
Private Const TBSTYLE_SEP             As Long = &H1
Private Const TBSTYLE_CHECK           As Long = &H2
Private Const TBSTYLE_GROUP           As Long = &H4
Private Const TBSTYLE_CHECKGROUP      As Long = (TBSTYLE_GROUP Or TBSTYLE_CHECK)
Private Const TBSTYLE_DROPDOWN        As Long = &H8
Private Const TBSTYLE_AUTOSIZE        As Long = &H10
Private Const TBSTYLE_WHOLEDROPDOWN   As Long = &H80 'IE5 only ?
Private Const TBSTYLE_TOOLTIPS        As Long = &H100
Private Const TBSTYLE_FLAT            As Long = &H800
Private Const TBSTYLE_LIST            As Long = &H1000
Private Const TBSTYLE_TRANSPARENT     As Long = &H8000&

Private Const TBSTATE_CHECKED         As Long = &H1
Private Const TBSTATE_PRESSED         As Long = &H2
Private Const TBSTATE_ENABLED         As Long = &H4
Private Const TBSTATE_HIDDEN          As Long = &H8

Private Const TBSTYLE_EX_DRAWDDARROWS As Long = &H1

Private Const WM_USER                 As Long = &H400
Private Const TB_SETSTATE             As Long = (WM_USER + 17)
Private Const TB_GETSTATE             As Long = (WM_USER + 18)
Private Const TB_ADDBITMAP            As Long = (WM_USER + 19)
Private Const TB_ADDBUTTONS           As Long = (WM_USER + 20)
Private Const TB_BUTTONCOUNT          As Long = (WM_USER + 24)
Private Const TB_GETITEMRECT          As Long = (WM_USER + 29)
Private Const TB_BUTTONSTRUCTSIZE     As Long = (WM_USER + 30)
Private Const TB_SETBITMAPSIZE        As Long = (WM_USER + 32)
Private Const TB_SETIMAGELIST         As Long = (WM_USER + 48)
Private Const TB_GETBUTTONINFO        As Long = (WM_USER + 65)
Private Const TB_SETBUTTONINFO        As Long = (WM_USER + 66)
Private Const TB_SETEXTENDEDSTYLE     As Long = (WM_USER + 84)
Private Const TB_SETINDENT            As Long = (WM_USER + 47)

'//

Private Type NMHDR
    hwndFrom As Long
    idfrom   As Long
    code     As Long
End Type

Private Type NMTBHOTITEM
    hdr     As NMHDR
    idOld   As Long
    idNew   As Long
    dwFlags As Long
End Type

Private Type NMTOOLBAR_SHORT
    hdr   As NMHDR
    iItem As Long
End Type

Private Type NMTTDISPINFO_SHORT
    hdr      As NMHDR
    lpszText As Long
    szText   As String * 80
    hInst    As Long
    uFlags   As Long
End Type

Private Const TBN_FIRST         As Long = -700
Private Const TBN_DROPDOWN      As Long = (TBN_FIRST - 10)
Private Const TBN_HOTITEMCHANGE As Long = (TBN_FIRST - 13)

Private Const TTN_FIRST         As Long = -520
Private Const TTN_GETDISPINFO   As Long = (TTN_FIRST - 0)
Private Const TTM_SETMAXTIPWIDTH As Long = (WM_USER + 24)

'//

'-- Public enums.:

Public Enum eButtonStyleConstants
    [eNormal] = TBSTYLE_BUTTON
    [eSeparator] = TBSTYLE_SEP
    [eCheck] = TBSTYLE_CHECK
    [eCheckGroup] = TBSTYLE_CHECKGROUP
    [eDropDown] = TBSTYLE_DROPDOWN
    [eWholeDropDown] = TBSTYLE_WHOLEDROPDOWN
End Enum

'-- Property variables:

Private WithEvents m_oFont As StdFont
Attribute m_oFont.VB_VarHelpID = -1

'-- Private enumns.:

Private Enum eButtonStateConstants
    [eChecked] = TBSTATE_CHECKED
    [ePressed] = TBSTATE_PRESSED
    [eEnabled] = TBSTATE_ENABLED
    [eHidden] = TBSTATE_HIDDEN
End Enum

'-- Private constants:

'-- Private types:

'-- Private variables:

Private m_bInitialized As Boolean
Private m_hModShell32  As Long
Private m_hToolbar     As Long
Private m_hImageList   As Long
Private m_hFont        As Long
Private m_sTipText()   As String

'-- Event declarations:

Public Event ButtonClick(ByVal Button As Long)
Public Event ButtonLeave(ByVal Button As Long)
Public Event ButtonEnter(ByVal Button As Long)
Public Event ButtonDropDown(ByVal Button As Long, ByVal X As Long, ByVal Y As Long)
Public Event ToolbarLeave()
Public Event ToolbarEnter()



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


Private mUseThemeReBar As Boolean

'========================================================================================
' Subclass handler - MUST be the first Public routine in this file. That includes public properties also
'========================================================================================

Public Sub zSubclass_Proc(ByVal bBefore As Boolean, ByRef bHandled As Boolean, ByRef lReturn As Long, ByRef lng_hWnd As Long, ByRef uMsg As Long, ByRef wParam As Long, ByRef lParam As Long)

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
  
  Dim uNMHDR  As NMHDR
  Dim uNMTB   As NMTOOLBAR_SHORT
  Dim uNMTBHI As NMTBHOTITEM
  Dim uNMTTDI As NMTTDISPINFO_SHORT
  Dim lc      As Long
  Dim uPt     As POINTAPI
  Dim uRct    As RECT2
  Dim hBrush  As Long
  Dim hTheme  As Long
    
    Select Case lng_hWnd

        Case UserControl.hwnd

            Select Case uMsg

                Case WM_NOTIFY
                    
                    Call CopyMemory(uNMHDR, ByVal lParam, Len(uNMHDR))
                    
                    Select Case uNMHDR.code
                    
                        Case TBN_DROPDOWN
                        
                            If (uNMHDR.hwndFrom = m_hToolbar) Then
                                
                                Call CopyMemory(uNMTB, ByVal lParam, Len(uNMTB))
                                
                                Call SendMessage(m_hToolbar, TB_GETITEMRECT, uNMTB.iItem - 1, uRct)
                                uPt.X = uRct.X1
                                uPt.Y = uRct.Y2
                                
                                Call MapWindowPoints(m_hToolbar, UserControl.Parent.hwnd, uPt, 1)
                                On Error Resume Next
                                uPt.X = UserControl.ScaleX(uPt.X, vbPixels, UserControl.Parent.ScaleMode)
                                uPt.Y = UserControl.ScaleY(uPt.Y, vbPixels, UserControl.Parent.ScaleMode)
                                On Error GoTo 0
                                RaiseEvent ButtonDropDown(uNMTB.iItem, uPt.X, uPt.Y)
                            End If
                            
                        Case TBN_HOTITEMCHANGE
                        
                            If (uNMHDR.hwndFrom = m_hToolbar) Then
                                
                                Call CopyMemory(uNMTBHI, ByVal lParam, Len(uNMTBHI))
                                
                                If (uNMTBHI.idOld) Then
                                    RaiseEvent ButtonLeave(uNMTBHI.idOld)
                                  Else
                                    If (pvGetState(uNMTBHI.idNew, TBSTATE_ENABLED)) Then
                                        RaiseEvent ToolbarEnter
                                    End If
                                End If
                                If (uNMTBHI.idNew) Then
                                    If (pvGetState(uNMTBHI.idNew, TBSTATE_ENABLED)) Then
                                        RaiseEvent ButtonEnter(uNMTBHI.idNew)
                                    End If
                                  Else
                                    RaiseEvent ToolbarLeave
                                End If
                            End If
                            
                        Case TTN_GETDISPINFO
                            
                            If (Len(m_sTipText(uNMHDR.idfrom))) Then
                                '-- Pass tip text
                                Call CopyMemory(uNMTTDI, ByVal lParam, Len(uNMTTDI))
                                uNMTTDI.szText = m_sTipText(uNMHDR.idfrom) & Chr$(0)
                                Call CopyMemory(ByVal lParam, uNMTTDI, Len(uNMTTDI))
                                
                                bHandled = True

                            End If
                    End Select

                Case WM_COMMAND
                
                    If (lParam = m_hToolbar) Then
                        RaiseEvent ButtonClick(wParam)
                    End If
                    
                Case WM_ERASEBKGND
                    
                    '-- Flat style bug [?]
                    'bHandled = True
                    
                   GetClientRect UserControl.hwnd, uRct
                   
                   If mUseThemeReBar Then
                        hTheme = OpenThemeData(0&, StrPtr("ReBar"))
    
                        If (hTheme) Then
                    
                            Call DrawThemeBackGround(hTheme, wParam, 6, 0&, uRct, ByVal 0&)
                            
                            Call CloseThemeData(hTheme)
                        End If
                    Else
                        hBrush = CreateSolidBrush(TranslateColor(UserControl.BackColor))
                   
                        If hBrush Then
                             FillRect wParam, uRct, hBrush
                             DeleteObject hBrush
                        End If
                   End If
                   
                
                Case WM_SIZE
                     
                     Call MoveWindow(m_hToolbar, 0, 0, UserControl.ScaleWidth, UserControl.ScaleHeight, 1)
            End Select
    End Select
End Sub



'========================================================================================
' Usercontrol
'========================================================================================

Private Sub UserControl_Initialize()
    
    '-- Initialize font object
    Set m_oFont = New StdFont
End Sub

Private Sub UserControl_Terminate()
  
  On Error GoTo errH
  
    If (m_bInitialized) Then
        
        '-- Stop subclassing and destroy all
        Call Subclass_StopAll
        Call pvDestroyFont
        Call pvDestroyImageList
        Call pvDestroyToolbar
    End If
errH:
End Sub



'========================================================================================
' Methods
'========================================================================================

Public Function Initialize(ByVal ImageSize As Long, _
                           Optional ByVal FlatStyle As Boolean = False, _
                           Optional ByVal ListStyle As Boolean = False, _
                           Optional ByVal Divider As Boolean = False _
                           ) As Boolean

    If (m_bInitialized = False) Then
    
        Initialize = pvCreate(ImageSize, FlatStyle, ListStyle, Divider)
        
        If (m_hToolbar) Then
        
            m_bInitialized = True

            '-- Initialize font
            Set m_oFont = Ambient.Font: Call m_oFont_FontChanged(vbNullString)

            '-- Subclass
            Call Subclass_Start(UserControl.hwnd)
            Call Subclass_AddMsg(UserControl.hwnd, WM_SIZE, MSG_BEFORE)
            Call Subclass_AddMsg(UserControl.hwnd, WM_NOTIFY, MSG_BEFORE)
            Call Subclass_AddMsg(UserControl.hwnd, WM_COMMAND, MSG_BEFORE)
            Call Subclass_AddMsg(UserControl.hwnd, WM_ERASEBKGND, MSG_BEFORE)
        End If
    End If
End Function

Public Function AddBitmap(ByVal hBitmap As Long, Optional ByVal MaskColor As Long = CLR_NONE) As Long

    If (m_hToolbar And m_hImageList) Then
        
        '-- Add bitmap/s to toolbar's imagelist
        If (MaskColor <> CLR_NONE) Then
            AddBitmap = ImageList_AddMasked(m_hImageList, hBitmap, MaskColor)
          Else
            AddBitmap = ImageList_Add(m_hImageList, hBitmap, 0)
        End If
    End If
End Function

Public Function AddIcon(ByVal hIcon As Long) As Long

    If (m_hToolbar And m_hImageList) Then
    
        '-- Add icons to toolbar's imagelist
        AddIcon = ImageList_AddIcon(m_hImageList, hIcon)
    End If
End Function

Public Sub AddButton(Optional Caption As String, _
                     Optional Image As Long = -1, _
                     Optional TipText As String, _
                     Optional Style As eButtonStyleConstants = [eNormal], _
                     Optional Autosize As Boolean = True, _
                     Optional ItemData As Long = 0)

  Dim uTBB   As TBBUTTON
  Dim lCount As Long
    
    If (m_hToolbar) Then
        
        '-- Button ID
        lCount = SendMessageLong(m_hToolbar, TB_BUTTONCOUNT, 0, 0)
        
        '-- Add button
        With uTBB
            .IdCommand = lCount + 1
            .iString = StrPtr(StrConv(Caption, vbFromUnicode))
            .iBitmap = Image
            .fsStyle = Style Or -(Autosize And Style <> [eSeparator]) * TBSTYLE_AUTOSIZE
            .fsState = TBSTATE_ENABLED
            .dwData = ItemData
        End With
        Call SendMessage(m_hToolbar, TB_ADDBUTTONS, 1, uTBB)
        
        '-- Store button tip text
        ReDim Preserve m_sTipText(uTBB.IdCommand)
        m_sTipText(uTBB.IdCommand) = Left$(TipText, 80)
        
        
    End If
End Sub

Private Function TranslateColor(ByVal oClr As OLE_COLOR, Optional hPal As Long = 0) As Long
    ' Convert Automation color to Windows color
    If OleTranslateColor(oClr, hPal, TranslateColor) Then
        TranslateColor = -1
    End If
End Function


'========================================================================================
' Properties
'========================================================================================


Public Property Let Tansparent(ByVal Value As Boolean)
    Dim lStyle As Long

    lStyle = GetWindowLong(m_hToolbar, GWL_STYLE)
    
    If Value Then
        SetWindowLongA m_hToolbar, GWL_STYLE, lStyle Or TBSTYLE_FLAT Or TBSTYLE_TRANSPARENT
    Else
        SetWindowLongA m_hToolbar, GWL_STYLE, lStyle Or TBSTYLE_FLAT And Not TBSTYLE_TRANSPARENT
    End If
End Property

Public Property Let UseThemeReBar(ByVal Value As Boolean)
    mUseThemeReBar = Value
End Property

Public Property Let SetIdent(ByVal Value As Long)
    If (m_hToolbar) Then Call SendMessage(m_hToolbar, TB_SETINDENT, Value, ByVal 0&)
End Property


Public Property Get ToolbarHeight() As Long
 
  Dim uRct     As RECT2
  Dim lDivider As Long
  
    If (m_hToolbar) Then
        
        '-- Get first buttom rect.
        Call SendMessage(m_hToolbar, TB_GETITEMRECT, 1, uRct)
        '-- Divider [?]
        lDivider = 2 * -((GetWindowLong(m_hToolbar, GWL_STYLE) And CCS_NODIVIDER) = 0)
        
        ToolbarHeight = uRct.Y2 + lDivider
    End If
End Property

Public Property Get ButtonCount() As Long

    If (m_hToolbar) Then
    
        ButtonCount = SendMessageLong(m_hToolbar, TB_BUTTONCOUNT, 0, 0)
    End If
End Property

Public Property Get ButtonCaption(ByVal Button As Long) As String
  
  Dim uTBBI      As TBBUTTONINFO
  Dim aBuff(260) As Byte
    
    If (m_hToolbar) Then
    
        With uTBBI
            .cbSize = Len(uTBBI)
            .dwMask = TBIF_TEXT
            .pszText = VarPtr(aBuff(0))
            .cchText = 261
        End With
        Call SendMessage(m_hToolbar, TB_GETBUTTONINFO, Button, uTBBI)
        
        ButtonCaption = pvStripNulls(pvByteArrayToString(aBuff()))
    End If
End Property
Public Property Let ButtonCaption(ByVal Button As Long, ByVal Caption As String)

  Dim uTBBI As TBBUTTONINFO
  
    If (m_hToolbar) Then
    
        With uTBBI
            .cbSize = Len(uTBBI)
            .dwMask = TBIF_TEXT
            .pszText = StrPtr(StrConv(Caption, vbFromUnicode))
        End With
        Call SendMessage(m_hToolbar, TB_SETBUTTONINFO, Button, uTBBI)
    End If
End Property

Public Property Get ButtonImage(ByVal Button As Long) As Long
  
  Dim uTBBI As TBBUTTONINFO
    
    If (m_hToolbar) Then
    
        With uTBBI
            .cbSize = Len(uTBBI)
            .dwMask = TBIF_IMAGE
        End With
        Call SendMessage(m_hToolbar, TB_GETBUTTONINFO, Button, uTBBI)
        
        ButtonImage = uTBBI.iImage
    End If
End Property
Public Property Let ButtonImage(ByVal Button As Long, ByVal Image As Long)

  Dim uTBBI As TBBUTTONINFO
  
    If (m_hToolbar) Then
    
        With uTBBI
            .cbSize = Len(uTBBI)
            .dwMask = TBIF_IMAGE
            .iImage = Image
        End With
        Call SendMessage(m_hToolbar, TB_SETBUTTONINFO, Button, uTBBI)
    End If
End Property

Public Property Get ButtonTipText(ByVal Button As Long) As String
  
    If (m_hToolbar) Then
        
        On Error Resume Next
        ButtonTipText = m_sTipText(Button)
        On Error GoTo 0
   End If
End Property
Public Property Let ButtonTipText(ByVal Button As Long, ByVal TipText As String)

    If (m_hToolbar) Then
    
        On Error Resume Next
        m_sTipText(Button) = Left$(TipText, 80)
        On Error GoTo 0
    End If
End Property

'//

Public Property Get ButtonEnabled(ByVal Button As Long) As Boolean
    If (m_hToolbar) Then
        ButtonEnabled = pvGetState(Button, TBSTATE_ENABLED)
    End If
End Property
Public Property Let ButtonEnabled(ByVal Button As Long, ByVal bState As Boolean)
    If (m_hToolbar) Then
        Call pvSetState(Button, TBSTATE_ENABLED, bState)
    End If
End Property

Public Property Get ButtonChecked(ByVal Button As Long) As Boolean
    If (m_hToolbar) Then
        ButtonChecked = pvGetState(Button, TBSTATE_CHECKED)
    End If
End Property
Public Property Let ButtonChecked(ByVal Button As Long, ByVal bState As Boolean)
    If (m_hToolbar) Then
        Call pvSetState(Button, TBSTATE_CHECKED, bState)
    End If
End Property

Public Property Get ButtonPressed(ByVal Button As Long) As Boolean
    If (m_hToolbar) Then
        ButtonPressed = pvGetState(Button, TBSTATE_PRESSED)
    End If
End Property
Public Property Let ButtonPressed(ByVal Button As Long, ByVal bState As Boolean)
    If (m_hToolbar) Then
        Call pvSetState(Button, TBSTATE_PRESSED, bState)
    End If
End Property

Public Property Get ButtonVisible(ByVal Button As Long) As Boolean
    If (m_hToolbar) Then
        ButtonVisible = Not (pvGetState(Button, TBSTATE_HIDDEN))
    End If
End Property
Public Property Let ButtonVisible(ByVal Button As Long, ByVal bState As Boolean)
    If (m_hToolbar) Then
        Call pvSetState(Button, TBSTATE_HIDDEN, Not bState)
    End If
End Property

Public Property Get Enabled() As Boolean
    Enabled = UserControl.Enabled
End Property
Public Property Let Enabled(ByVal New_Enabled As Boolean)
    UserControl.Enabled = New_Enabled
    If (m_hToolbar) Then Call EnableWindow(m_hToolbar, New_Enabled)
End Property

Public Property Get hImageList() As Long
    hImageList = m_hImageList
End Property

Public Property Let hImageList(ByVal hImageList As Long)
    m_hImageList = hImageList
End Property
'//

Public Property Get Font() As StdFont
Attribute Font.VB_MemberFlags = "400"
    Set Font = m_oFont
End Property
Public Property Set Font(ByVal New_Font As StdFont)

  Dim uLF   As LOGFONT
  Dim lChar As Long

    If (m_bInitialized) Then
    
         With m_oFont
             For lChar = 1 To Len(.Name)
                 uLF.lfFaceName(lChar - 1) = CByte(Asc(Mid$(.Name, lChar, 1)))
             Next lChar
             uLF.lfHeight = -MulDiv(.Size, GetDeviceCaps(UserControl.hdc, LOGPIXELSY), 72)
             uLF.lfItalic = .Italic
             uLF.lfWeight = IIf(.Bold, FW_BOLD, FW_NORMAL)
             uLF.lfUnderline = .Underline
             uLF.lfStrikeOut = .Strikethrough
             uLF.lfCharSet = .Charset
        End With
        Call pvDestroyFont: m_hFont = CreateFontIndirect(uLF)
        
        Call SendMessageLong(m_hToolbar, WM_SETFONT, m_hFont, 1)
    End If
End Property
Private Sub m_oFont_FontChanged(ByVal PropertyName As String)
    Set Font = m_oFont
End Sub



'========================================================================================
' Private
'========================================================================================

Private Function pvCreate(ByVal ImageSize As Long, _
                          ByVal FlatStyle As Boolean, _
                          ByVal ListStyle As Boolean, _
                          ByVal Divider As Boolean _
                          ) As Boolean

  Dim lStyle  As Long
  Dim uButton As TBBUTTON
  Dim uTBAB   As TBADDBITMAP
    
    '-- Define style
    lStyle = WS_CHILD
    lStyle = lStyle Or CCS_NORESIZE Or -(Not Divider) * CCS_NODIVIDER
    lStyle = lStyle Or -FlatStyle * TBSTYLE_FLAT Or -ListStyle * TBSTYLE_LIST
    lStyle = lStyle Or TBSTYLE_TOOLTIPS
    
    '-- Create Toolbar window
    m_hToolbar = CreateWindowEx(0, WC_TOOLBAR, vbNullString, lStyle, 0, 0, UserControl.ScaleWidth, UserControl.ScaleHeight, UserControl.hwnd, 0, App.hInstance, ByVal 0)
  
    '-- Success [?]
    If (m_hToolbar) Then
        
        '-- Initialize imagelist
        m_hImageList = ImageList_Create(ImageSize, ImageSize, ILC_MASK Or ILC_COLOR32, 0, 0)
        If (m_hImageList) Then
            Call SendMessageLong(m_hToolbar, TB_SETIMAGELIST, 0, m_hImageList)
        End If
        
        '-- Initialize toolbar
        Call SendMessageLong(m_hToolbar, TB_BUTTONSTRUCTSIZE, Len(uButton), 0)
        Call SendMessageLong(m_hToolbar, TB_SETBITMAPSIZE, 0, ImageSize + (ImageSize * &H10000))
        Call SendMessageLong(m_hToolbar, TB_SETEXTENDEDSTYLE, 0, TBSTYLE_EX_DRAWDDARROWS)

        '-- Show
        Call ShowWindow(m_hToolbar, SW_SHOW)
        pvCreate = True
   End If
End Function

Private Sub pvDestroyToolbar()
    
    If (m_hToolbar) Then
        If (DestroyWindow(m_hToolbar)) Then
            m_hToolbar = 0
        End If
    End If
End Sub

Private Sub pvDestroyImageList()

    If (m_hImageList) Then
        If (ImageList_Destroy(m_hImageList)) Then
            m_hImageList = 0
        End If
    End If
End Sub

Private Sub pvDestroyFont()

    If (m_hFont) Then
        If (DeleteObject(m_hFont)) Then
            m_hFont = 0
        End If
    End If
End Sub

'//

Private Function pvGetState(ByVal lButton As Long, ByVal lStateFlag As eButtonStateConstants) As Boolean

  Dim lState As Long
    
    '-- Get current state
    lState = SendMessageLong(m_hToolbar, TB_GETSTATE, lButton, 0)
    pvGetState = ((lState And lStateFlag) = lStateFlag)
End Function

Private Function pvSetState(ByVal lButton As Long, ByVal lStateFlag As eButtonStateConstants, ByVal bState As Boolean)
  
  Dim lState As Long
    
    '-- Get current state
    lState = SendMessageLong(m_hToolbar, TB_GETSTATE, lButton, 0)
    '-- Activate/Deactivate
    If (bState) Then
        lState = lState Or lStateFlag
      Else
        lState = lState And Not lStateFlag
    End If
    '-- Update state
    pvSetState = (SendMessageLong(m_hToolbar, TB_SETSTATE, lButton, lState) <> 0)
End Function

'//

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

Private Function pvByteArrayToString(aBuffer() As Byte) As String
'From AllApiDemo by MH

  Dim iUnicode As Long
  Dim i        As Long

    On Error Resume Next
    
    i = UBound(aBuffer())
    
    If (i < 1) Then
        '-- ANSI, just convert to unicode and return
        pvByteArrayToString = StrConv(aBuffer(), vbUnicode)
        Exit Function
    End If
    i = i + 1

    '-- Examine the first two bytes
    Call CopyMemory(iUnicode, ByVal VarPtr(aBuffer(0)), 2)

    If (iUnicode = aBuffer(0)) Then
    '-- Unicode
        
        '-- Account for terminating null
        If (i Mod 2) Then
            i = i - 1
        End If
        '-- Set up a buffer to recieve the string
        pvByteArrayToString = String$(i / 2, 0)
        '-- Copy to string
        Call CopyMemory(ByVal pvByteArrayToString, ByVal VarPtr(aBuffer(0)), i)
    Else
    '-- ANSI
        pvByteArrayToString = StrConv(aBuffer(), vbUnicode)
    End If
    
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
  Dim J                       As Long                                                   'Loop index
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
    Do While J < CODE_LEN
      J = J + 1
      sc_aBuf(J) = CByte("&H" & Mid$(sSubCode, i, 2))                                   'Convert a pair of hex characters to an eight-bit value and store in the static code buffer array
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

