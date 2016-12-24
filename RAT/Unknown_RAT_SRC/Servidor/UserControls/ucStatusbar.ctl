VERSION 5.00
Begin VB.UserControl ucStatusbar 
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
Attribute VB_Name = "ucStatusbar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'========================================================================================
' User control:  ucStatusbar.ctl
' Author:        Carles P.V. (*)
' Dependencies:  comctl32.dll version 4.71 or later
' Last revision: 2004.11.18
' Version:       1.1.0
'----------------------------------------------------------------------------------------
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
'   * 1.0.0: - First release.
'   * 1.0.1: - Fixed PanelDblClick() event info for right button.
'              Also removed 2nd Click() event after a DblClick.
'              Thanks to CurtW for report.
'   * 1.1.0: - Added SizeGrip() property.
'========================================================================================
'
' Known issues:
'
'   * When XP-theme enabled, font changes (size) do not 'cause' a resize of bar (height).
'
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

Private Const LOGPIXELSY As Long = 90
Private Const FW_NORMAL  As Long = 400
Private Const FW_BOLD    As Long = 700

Private Declare Function CreateFontIndirect Lib "gdi32" Alias "CreateFontIndirectA" (lpLogFont As LOGFONT) As Long
Private Declare Function GetDeviceCaps Lib "gdi32" (ByVal hdc As Long, ByVal nIndex As Long) As Long
Private Declare Function MulDiv Lib "kernel32" (ByVal nNumber As Long, ByVal nNumerator As Long, ByVal nDenominator As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long

Private Const SW_SHOW As Long = 5

Private Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long

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

'//

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long

'== Window

Private Const GWL_STYLE  As Long = (-16)
Private Const WS_CHILD   As Long = &H40000000
Private Const WM_SIZE    As Long = &H5
Private Const WM_SETFONT As Long = &H30
Private Const WM_NOTIFY  As Long = &H4E

Private Declare Function CreateWindowEx Lib "user32" Alias "CreateWindowExA" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, lpParam As Any) As Long
Private Declare Function DestroyWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function MoveWindow Lib "user32" (ByVal hwnd As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long
Private Declare Function EnableWindow Lib "user32" (ByVal hwnd As Long, ByVal fEnable As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long


'== Image list

Private Const ILC_MASK     As Long = &H1
Private Const ILC_COLORDDB As Long = &HFE
Private Const ILC_COLOR32     As Long = &H20

Private Declare Function ImageList_Create Lib "Comctl32" (ByVal MinCx As Long, ByVal MinCy As Long, ByVal Flags As Long, ByVal cInitial As Long, ByVal cGrow As Long) As Long
Private Declare Function ImageList_AddIcon Lib "Comctl32" (ByVal hImageList As Long, ByVal hIcon As Long) As Long
Private Declare Function ImageList_GetIcon Lib "Comctl32" (ByVal hImageList As Long, ByVal ImgIndex As Long, ByVal fuFlags As Long) As Long
Private Declare Function ImageList_Destroy Lib "Comctl32" (ByVal hImageList As Long) As Long
Private Declare Function DestroyIcon Lib "user32" (ByVal hIcon As Long) As Long
Private Declare Function ImageList_Add Lib "Comctl32" (ByVal hImageList As Long, ByVal hBitmap As Long, ByVal hBitmapMask As Long) As Long
Private Declare Function ImageList_AddMasked Lib "Comctl32" (ByVal hImageList As Long, ByVal hbmImage As Long, ByVal crMask As Long) As Long


Private Const CLR_NONE              As Long = &HFFFFFFFF

'== Statusbar
'
'   http://msdn.microsoft.com/library/default.asp?url=/library/en-us/shellcc/platform/commctls/status/reflist.asp

Private Declare Sub InitCommonControls Lib "Comctl32" ()
Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long

Private Const WC_STATUSBAR   As String = "msctls_statusbar32"
Private Const SBARS_SIZEGRIP As Long = &H100
Private Const SBARS_TOOLTIPS As Long = &H800

Private Const SBT_NOBORDERS  As Long = &H100
Private Const SBT_POPOUT     As Long = &H200
Private Const SBT_RTLREADING As Long = &H400
Private Const SBT_TOOLTIPS   As Long = &H800
Private Const SBT_OWNERDRAW  As Long = &H1000

Private Const WM_USER        As Long = &H400
Private Const SB_SETTEXT     As Long = (WM_USER + 1)
Private Const SB_SETPARTS    As Long = (WM_USER + 4)
Private Const SB_GETPARTS    As Long = (WM_USER + 6)
Private Const SB_GETRECT     As Long = (WM_USER + 10)
Private Const SB_SETICON     As Long = (WM_USER + 15)
Private Const SB_SETTIPTEXT  As Long = (WM_USER + 16)
Private Const SB_GETICON     As Long = (WM_USER + 20)

'//

Private Const NM_FIRST       As Long = 0
Private Const NM_CLICK       As Long = (NM_FIRST - 2)
Private Const NM_DBLCLK      As Long = (NM_FIRST - 3)
Private Const NM_RCLICK      As Long = (NM_FIRST - 5)
Private Const NM_RDBLCLK     As Long = (NM_FIRST - 6)

Private Type NMHDR
    hwndFrom As Long
    idfrom   As Long
    code     As Long
End Type

Private Type NMMOUSE
    hdr        As NMHDR
    dwItemSpec As Long
    dwItemData As Long
    PT         As Long
    lParam     As Long
End Type

'//

'-- Public enums.:

Public Enum sbPanelStyleConstants
    [sbNormal] = 0
    [sbNoBorders] = SBT_NOBORDERS
    [sbPopOut] = SBT_POPOUT
End Enum

Public Enum sbAutosizeStyleConstants
    [sbNoAutosize] = 0
    [sbSpring]
    [sbContents]
End Enum

'-- Property variables:

Private WithEvents m_oFont As StdFont
Attribute m_oFont.VB_VarHelpID = -1

'-- Private enumns.:

'-- Private constants:

Private Const MAX_TIPLENGHT  As Long = 80
Private Const MIN_PANELWIDTH As Long = 100

'-- Private types:

Private Type PANEL_INFO
    lStyle     As Long
    lMinWidth  As Long
    lWidth     As Long
    eAutosize  As sbAutosizeStyleConstants
    sText      As String
    sTipText   As String
    lIconIndex As Long
End Type

'-- Private variables:

Private m_bInitialized As Boolean
Private m_hModShell32  As Long
Private m_hStatusBar   As Long
Private m_hImageList   As Long
Private m_hFont        As Long
Private m_uPanelInfo() As PANEL_INFO
Private m_lPanelCount  As Long

'-- Event declarations:

Public Event PanelClick(ByVal Panel As Long, ByVal Button As MouseButtonConstants)
Public Event PanelDblClick(ByVal Panel As Long, ByVal Button As MouseButtonConstants)
Public Event Resize()



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
  
  Dim uNMHDR     As NMHDR
  Dim uNMM       As NMMOUSE
  Dim uRct       As RECT2
  Static bDblClk As Boolean
    
    Select Case lng_hWnd

        Case UserControl.hwnd

            Select Case uMsg

                Case WM_NOTIFY
                    
                    Call CopyMemory(uNMHDR, ByVal lParam, Len(uNMHDR))
                    
                    If (uNMHDR.hwndFrom = m_hStatusBar) Then
                    
                        Select Case uNMHDR.code
                            
                            Case NM_CLICK, NM_RCLICK
                                
                                If (bDblClk = False) Then
                                    Call CopyMemory(uNMM, ByVal lParam, Len(uNMM))
                                    RaiseEvent PanelClick(uNMM.dwItemSpec + 1, IIf(uNMHDR.code = NM_CLICK, vbLeftButton, vbRightButton))
                                End If
                                
                                bDblClk = False
                                
                            Case NM_DBLCLK, NM_RDBLCLK
                                
                                Call CopyMemory(uNMM, ByVal lParam, Len(uNMM))
                                RaiseEvent PanelDblClick(uNMM.dwItemSpec + 1, IIf(uNMHDR.code = NM_DBLCLK, vbLeftButton, vbRightButton))
                                
                                bDblClk = True
                        End Select
                    End If

                Case WM_SIZE
                     
                    Call MoveWindow(m_hStatusBar, 0, 0, UserControl.ScaleWidth, UserControl.ScaleHeight, 0)
                    Call pvResizePanels
                    RaiseEvent Resize

            End Select
        
        Case m_hStatusBar
                   
            If (uMsg = WM_SETFONT) Then
                
                '-- Update control height
                Call SendMessage(m_hStatusBar, SB_GETRECT, 0, uRct)
                Let UserControl.Height = uRct.y2 * Screen.TwipsPerPixelY
            End If
    End Select
End Sub



'========================================================================================
' Usercontrol
'========================================================================================

Private Sub UserControl_Initialize()
    
    '(*) KBID 309366 (http://support.microsoft.com/default.aspx?scid=kb;en-us;309366)
    m_hModShell32 = LoadLibrary("Shell32.dll")
    '-- Initialize common controls
    Call InitCommonControls
    
    '-- Initialize font object
    Set m_oFont = New StdFont
    
'(*) From vbAccelerator
'    http://www.vbaccelerator.com/home/VB/Code/Libraries/XP_Visual_Styles/Preventing_Crashes_at_Shutdown/article.asp
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    Set UserControl.Font = Ambient.Font
End Sub


Private Sub UserControl_Resize()
    Call MoveWindow(m_hStatusBar, 0, 0, UserControl.ScaleWidth, UserControl.ScaleHeight, 0)
End Sub

Private Sub UserControl_Show()
        
    RaiseEvent Resize
End Sub

Private Sub UserControl_Terminate()
  
    On Error GoTo errh:
    
    If (m_bInitialized) Then
        
        '-- Stop subclassing and destroy all
        Call Subclass_StopAll
        Call pvDestroyFont
        Call pvDestroyIconsImagelist
        Call pvDestroyStatusbarIcons
        Call pvDestroyStatusbar
        
        '-- Free library
        Call FreeLibrary(m_hModShell32)
    End If
errh:
End Sub



'========================================================================================
' Methods
'========================================================================================

Public Function Initialize(Optional ByVal SizeGrip As Boolean = False, _
                           Optional ByVal ToolTips As Boolean = False _
                           ) As Boolean

    If (m_bInitialized = False) Then
    
        Initialize = pvCreate(SizeGrip, ToolTips)
        
        If (m_hStatusBar) Then
        
            m_bInitialized = True

            '-- Initialize font
            Set m_oFont = UserControl.Font ': Call m_oFont_FontChanged(vbNullString)

            '-- Subclass
            Call Subclass_Start(UserControl.hwnd)
            Call Subclass_AddMsg(UserControl.hwnd, WM_NOTIFY)
            Call Subclass_AddMsg(UserControl.hwnd, WM_SIZE)
            Call Subclass_Start(m_hStatusBar)
            Call Subclass_AddMsg(m_hStatusBar, WM_SETFONT)
        End If
    End If
End Function

Public Function InitializeIconList(Optional ByVal IconWidth As Long = 16, _
                                   Optional ByVal IconHeight As Long = 16)

    '-- Initialize imagelist
    m_hImageList = ImageList_Create(IconWidth, IconHeight, ILC_MASK Or ILC_COLOR32, 0, 0)
    
    '-- Success [?]
    InitializeIconList = (m_hImageList <> 0)
End Function
        
'//

Public Sub AddPanel(Optional ByVal Style As sbPanelStyleConstants = [sbNormal], _
                    Optional ByVal MinWidth As Long = MIN_PANELWIDTH, _
                    Optional ByVal Width As Long, _
                    Optional ByVal Autosize As sbAutosizeStyleConstants = [sbNoAutosize], _
                    Optional ByVal Text As String = vbNullString, _
                    Optional ByVal TipText As String = vbNullString, _
                    Optional ByVal IconIndex As Long = -1)
    
  Dim lDummy() As Long
  Dim hIcon    As Long
  
    If (m_hStatusBar) Then
        
        '-- Increase panel count
        m_lPanelCount = m_lPanelCount + 1
        
        '-- Add new panel
        ReDim lDummy(1 To m_lPanelCount)
        Call SendMessage(m_hStatusBar, SB_SETPARTS, m_lPanelCount, lDummy(1))
        
        '-- Style/Text
        Call SendMessage(m_hStatusBar, SB_SETTEXT, (m_lPanelCount - 1) Or Style, ByVal Text)
        
        '-- Tip text
        Call SendMessage(m_hStatusBar, SB_SETTIPTEXT, (m_lPanelCount - 1), ByVal TipText)
        
        '-- Icon
        If (IconIndex <> -1) Then
            hIcon = ImageList_GetIcon(m_hImageList, IconIndex, 0)
            If (hIcon) Then
                Call SendMessage(m_hStatusBar, SB_SETICON, (m_lPanelCount - 1), ByVal hIcon)
            End If
        End If
        
        '-- Store panel info
        ReDim Preserve m_uPanelInfo(0 To m_lPanelCount)
        With m_uPanelInfo(m_lPanelCount)
            .lStyle = Style
            .lMinWidth = MinWidth
            .lWidth = IIf(Width < MinWidth, MinWidth, Width)
            .eAutosize = Autosize
            .sText = Text
            .sTipText = TipText
            .lIconIndex = IIf(hIcon, IconIndex, -1)
        End With
        
        '-- Finaly, resize
        Call pvResizePanels
    End If
End Sub

Public Function AddIcon(ByVal hIcon As Long) As Long

    If (m_hStatusBar And m_hImageList) Then
    
        '-- Add icons to toolbar's imagelist
        AddIcon = ImageList_AddIcon(m_hImageList, hIcon)
    End If
End Function

Public Function AddBitmap(ByVal hBitmap As Long, Optional ByVal MaskColor As Long = CLR_NONE) As Boolean
    
    If (m_hStatusBar And m_hImageList) Then
        If (MaskColor <> CLR_NONE) Then
            AddBitmap = ImageList_AddMasked(m_hImageList, hBitmap, MaskColor)
          Else
            AddBitmap = ImageList_Add(m_hImageList, hBitmap, 0)
        End If
    End If
End Function

'//

Public Sub GetPanelRect(ByVal Panel As Long, x1 As Long, y1 As Long, x2 As Long, y2 As Long)
  
  Dim uRct As RECT2
  
    If (m_hStatusBar And pvIsValidPanel(Panel)) Then
        
        Call SendMessage(m_hStatusBar, SB_GETRECT, (Panel - 1), uRct)
        With uRct
            x1 = .x1
            y1 = .y1
            x2 = .x2
            y2 = .y2
        End With
    End If
End Sub



'========================================================================================
' Properties
'========================================================================================

Public Property Get hImageList() As Long
    hImageList = m_hImageList
End Property

Public Property Let hImageList(ByVal hImgList As Long)
    m_hImageList = hImgList
End Property

Public Property Get SizeGrip() As Boolean
    
    If (m_hStatusBar) Then
            
        SizeGrip = CBool(GetWindowLong(m_hStatusBar, GWL_STYLE) And SBARS_SIZEGRIP)
    End If
End Property
Public Property Let SizeGrip(ByVal New_SizeGrip As Boolean)
' There is no way to change (add/remove) SBARS_SIZEGRIP style once
' control has been created. In fact, once removed, 'sizegrip'
' graphic is still painted.
' So, we are forced to destroy and create again our *control*.

  Dim uPanelInfo() As PANEL_INFO
  Dim bToolTips    As Long
  Dim lPanel       As Long
  
    If (m_hStatusBar) Then
    
        If (New_SizeGrip <> CBool(GetWindowLong(m_hStatusBar, GWL_STYLE) And SBARS_SIZEGRIP)) Then
            
            '-- Store current panels info
            uPanelInfo() = m_uPanelInfo()
            '-- Tooltips enabled ?
            bToolTips = CBool(GetWindowLong(m_hStatusBar, GWL_STYLE) And SBARS_TOOLTIPS)
            
            '-- First, destroy control and all related *objects* (preserve imagelist)
            Call Subclass_StopAll
            Call pvDestroyFont
            Call pvDestroyStatusbarIcons
            Call pvDestroyStatusbar
            
            '-- Create again
            m_bInitialized = False
            Call Initialize(New_SizeGrip, bToolTips)
            
            '-- Re-add panels
            m_lPanelCount = 0
            For lPanel = 1 To UBound(uPanelInfo())
                With uPanelInfo(lPanel)
                    Call AddPanel(.lStyle, .lMinWidth, .lWidth, .eAutosize, .sText, .sTipText, .lIconIndex)
                End With
            Next lPanel
            Call SendMessage(m_hStatusBar, WM_SETFONT, m_hFont, ByVal 0)
        End If
    End If
End Property

'//

Public Property Get PanelCount() As Long
Attribute PanelCount.VB_MemberFlags = "400"

    If (m_hStatusBar) Then
    
        PanelCount = m_lPanelCount
    End If
End Property

Public Property Get PanelStyle(ByVal Panel As Long) As sbPanelStyleConstants
Attribute PanelStyle.VB_MemberFlags = "400"
    
    If (m_hStatusBar And pvIsValidPanel(Panel)) Then
            
        PanelStyle = m_uPanelInfo(Panel).lStyle
    End If
End Property
Public Property Let PanelStyle(ByVal Panel As Long, ByVal New_Style As sbPanelStyleConstants)

    If (m_hStatusBar And pvIsValidPanel(Panel)) Then

        Call SendMessage(m_hStatusBar, SB_SETTEXT, (Panel - 1) Or New_Style, ByVal m_uPanelInfo(Panel).sText)
        m_uPanelInfo(Panel).lStyle = New_Style
    End If
End Property

Public Property Get PanelMinWidth(ByVal Panel As Long) As Long
Attribute PanelMinWidth.VB_MemberFlags = "400"
    
    If (m_hStatusBar And pvIsValidPanel(Panel)) Then
            
        PanelMinWidth = m_uPanelInfo(Panel).lMinWidth
    End If
End Property
Public Property Let PanelMinWidth(ByVal Panel As Long, ByVal New_MinWidth As Long)
  
   If (m_hStatusBar And pvIsValidPanel(Panel)) Then

        m_uPanelInfo(Panel).lMinWidth = IIf(New_MinWidth < 0, 0, New_MinWidth)
        Call pvResizePanels
    End If
End Property

Public Property Get PanelWidth(ByVal Panel As Long) As Long
Attribute PanelWidth.VB_MemberFlags = "400"
    
    If (m_hStatusBar And pvIsValidPanel(Panel)) Then
            
        PanelWidth = m_uPanelInfo(Panel).lWidth
    End If
End Property
Public Property Let PanelWidth(ByVal Panel As Long, ByVal New_Width As Long)
  
  Dim lWidths() As Long
   
   If (m_hStatusBar And pvIsValidPanel(Panel)) Then

        If (New_Width > m_uPanelInfo(Panel).lMinWidth) Then
            m_uPanelInfo(Panel).lWidth = New_Width
            Call pvResizePanels
        End If
    End If
End Property

Public Property Get PanelAutosize(ByVal Panel As Long) As sbAutosizeStyleConstants
Attribute PanelAutosize.VB_MemberFlags = "400"
    
    If (m_hStatusBar And pvIsValidPanel(Panel)) Then
            
        PanelAutosize = m_uPanelInfo(Panel).eAutosize
    End If
End Property
Public Property Let PanelAutosize(ByVal Panel As Long, ByVal New_Autosize As sbAutosizeStyleConstants)
  
   If (m_hStatusBar And pvIsValidPanel(Panel)) Then

        m_uPanelInfo(Panel).eAutosize = New_Autosize
        Call pvResizePanels
    End If
End Property

Public Property Get PanelText(ByVal Panel As Long) As String
Attribute PanelText.VB_MemberFlags = "400"
    
    If (m_hStatusBar And pvIsValidPanel(Panel)) Then
            
        PanelText = m_uPanelInfo(Panel).sText
    End If
End Property
Public Property Let PanelText(ByVal Panel As Long, ByVal New_Text As String)

    If (m_hStatusBar And pvIsValidPanel(Panel)) Then
        
        Call SendMessage(m_hStatusBar, SB_SETTEXT, (Panel - 1) Or m_uPanelInfo(Panel).lStyle, ByVal New_Text)
        m_uPanelInfo(Panel).sText = New_Text
        Call pvResizePanels
    End If
End Property

Public Property Get PanelTipText(ByVal Panel As Long) As String
Attribute PanelTipText.VB_MemberFlags = "400"
    
    If (m_hStatusBar And pvIsValidPanel(Panel)) Then

        PanelTipText = m_uPanelInfo(Panel).sTipText
    End If
End Property
Public Property Let PanelTipText(ByVal Panel As Long, ByVal New_TipText As String)

    If (m_hStatusBar And pvIsValidPanel(Panel)) Then
        
        Call SendMessage(m_hStatusBar, SB_SETTIPTEXT, (Panel - 1), ByVal New_TipText)
        m_uPanelInfo(Panel).sTipText = New_TipText
    End If
End Property

Public Property Get PanelIconIndex(ByVal Panel As Long) As Long
Attribute PanelIconIndex.VB_MemberFlags = "400"
    
    If (m_hStatusBar And pvIsValidPanel(Panel)) Then

        PanelIconIndex = m_uPanelInfo(Panel).lIconIndex
    End If
End Property
Public Property Let PanelIconIndex(ByVal Panel As Long, ByVal New_IconIndex As Long)

  Dim hIcon As Long

    If (m_hStatusBar And pvIsValidPanel(Panel)) Then
        
        If (m_uPanelInfo(Panel).lIconIndex <> -1) Then
            Call DestroyIcon(SendMessage(m_hStatusBar, SB_GETICON, (Panel - 1), ByVal 0))
        End If
        
        hIcon = ImageList_GetIcon(m_hImageList, New_IconIndex, 0)
        If (hIcon) Then
            Call SendMessage(m_hStatusBar, SB_SETICON, (Panel - 1), ByVal hIcon)
        End If
        
        m_uPanelInfo(Panel).lIconIndex = IIf(hIcon, New_IconIndex, -1)
        Call pvResizePanels
    End If
End Property

'//

Public Property Get Enabled() As Boolean
Attribute Enabled.VB_MemberFlags = "400"
    Enabled = UserControl.Enabled
End Property
Public Property Let Enabled(ByVal New_Enabled As Boolean)
    If (m_hStatusBar <> 0) Then
        UserControl.Enabled = New_Enabled
        Call EnableWindow(m_hStatusBar, -New_Enabled)
    End If
End Property

Public Property Get Font() As StdFont
Attribute Font.VB_MemberFlags = "400"
    Set Font = m_oFont
End Property
Public Property Set Font(ByVal New_Font As StdFont)

  Dim uLF   As LOGFONT
  Dim lChar As Long

    If (m_bInitialized) Then
    
         Set UserControl.Font = m_oFont
         
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
        
        Call SendMessage(m_hStatusBar, WM_SETFONT, m_hFont, ByVal 1)
    End If
End Property
Private Sub m_oFont_FontChanged(ByVal PropertyName As String)
    Set Font = m_oFont
End Sub

'*

Public Property Get hwnd() As Long
    hwnd = m_hStatusBar
End Property



'========================================================================================
' Private
'========================================================================================

Private Function pvCreate(ByVal SizeGrip As Boolean, _
                          ByVal ToolTips As Boolean) As Boolean

  Dim lStyle As Long
  Dim uRct   As RECT2

    '-- Define style
    lStyle = WS_CHILD
    lStyle = lStyle Or -SizeGrip * SBARS_SIZEGRIP
    lStyle = lStyle Or -ToolTips * SBARS_TOOLTIPS

    '-- Create Toolbar window
    m_hStatusBar = CreateWindowEx(0, WC_STATUSBAR, vbNullString, lStyle, 0, 0, UserControl.ScaleWidth, UserControl.ScaleHeight, UserControl.hwnd, 0, App.hInstance, ByVal 0)

    '-- Success [?]
    If (m_hStatusBar) Then
        
        '-- Update control height
        Call SendMessage(m_hStatusBar, SB_GETRECT, 0, uRct)
        Let UserControl.Height = uRct.y2 * Screen.TwipsPerPixelY
        '-- Force bottom align
        Let UserControl.Extender.Align = vbAlignBottom
        
        '-- Show status bar
        Call ShowWindow(m_hStatusBar, SW_SHOW)

        pvCreate = True
   End If
End Function

Private Sub pvDestroyStatusbar()
    If (m_hStatusBar) Then
        If (DestroyWindow(m_hStatusBar)) Then
            m_hStatusBar = 0
        End If
    End If
End Sub

Private Sub pvDestroyStatusbarIcons()
  
  Dim lPanel As Long
  Dim hIcon  As Long
    
    If (m_lPanelCount) Then
        For lPanel = 1 To m_lPanelCount
            hIcon = SendMessage(m_hStatusBar, SB_GETICON, (lPanel - 1), ByVal 0)
            If (hIcon) Then
                Call DestroyIcon(hIcon)
            End If
        Next lPanel
    End If
End Sub

Private Sub pvDestroyIconsImagelist()

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

Private Sub pvResizePanels()
  
  Const BORDER_PAD  As Long = 4
  Const GRIP_WIDTH  As Long = 16 + BORDER_PAD
  Const ICON_WIDTH  As Long = 16 + BORDER_PAD
  
  Dim lWidths()     As Long
  Dim lPanel        As Long
  Dim lBarWidth     As Long
  Dim lSpringWidth  As Long
  Dim lSpringPanels As Long
  
    If (m_lPanelCount) Then
        
        '-- Bar width
        If ((GetWindowLong(m_hStatusBar, GWL_STYLE) And SBARS_SIZEGRIP) = 0) Then
            lBarWidth = UserControl.ScaleWidth
          Else
            lBarWidth = UserControl.ScaleWidth - GRIP_WIDTH
        End If
        
        '-- Calculate remain width for 'spring-panels' and
        '   calculate width for 'contents-panels'
        For lPanel = 1 To m_lPanelCount
            
            With m_uPanelInfo(lPanel)
            
                Select Case .eAutosize
                    
                    Case [sbNoAutosize]
                        
                        lSpringWidth = lSpringWidth + .lWidth
                    
                    Case [sbSpring]
                        
                        lSpringPanels = lSpringPanels + 1
                    
                    Case [sbContents]
                    
                        .lWidth = 2 * BORDER_PAD
                        If (Len(.sText)) Then
                            .lWidth = .lWidth + UserControl.TextWidth(.sText)
                        End If
                        If (.lIconIndex <> -1) Then
                            .lWidth = .lWidth + ICON_WIDTH
                        End If
                        If (.lWidth < .lMinWidth) Then
                            .lWidth = .lMinWidth
                        End If
                        lSpringWidth = lSpringWidth + .lWidth
                End Select
            End With
        Next lPanel
        
        '-- Divide up
        If (lSpringPanels) Then
            For lPanel = 1 To m_lPanelCount
                With m_uPanelInfo(lPanel)
                    If (.eAutosize = [sbSpring]) Then
                        .lWidth = (lBarWidth - lSpringWidth) \ lSpringPanels
                        If (.lWidth < .lMinWidth) Then
                            .lWidth = .lMinWidth
                        End If
                    End If
                End With
            Next lPanel
        End If
        
        '-- Dim. buffer for parts coords.
        ReDim lWidths(0 To m_lPanelCount)
        
        '-- Calculate parts (panel right coords.)
        For lPanel = 1 To m_lPanelCount
            With m_uPanelInfo(lPanel)
                lWidths(lPanel) = lWidths(lPanel - 1) + .lWidth
                If (lWidths(lPanel) > lBarWidth) Then
                    lWidths(lPanel) = lBarWidth
                End If
            End With
        Next lPanel
        
        '-- Last panel padding
        If (m_uPanelInfo(m_lPanelCount).eAutosize = [sbSpring]) Then
            lWidths(m_lPanelCount) = lBarWidth
        End If
        
        '-- Finaly, assign parts
        Call SendMessage(m_hStatusBar, SB_SETPARTS, m_lPanelCount, lWidths(1))
    End If
End Sub

Private Function pvIsValidPanel(ByVal lPanel As Long) As Boolean
    
    pvIsValidPanel = (lPanel >= 1 And lPanel <= m_lPanelCount)
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
