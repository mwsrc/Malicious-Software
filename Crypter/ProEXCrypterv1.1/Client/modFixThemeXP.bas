Attribute VB_Name = "modFixThemeXP"
'=========================================================================
' C:\Work\Temp\FrameXpFix\mdXpThemeSupport.bas
'
'   XP Theme Support for Built-in VB Controls Project
'
'   Portions Copyright (c) 2002-2003 E. Morcillo
'   Portions Copyright (c) 2003 Vlad Vissoultchev (wqweto@myrealbox.com)
'
'   Fixes standard VB controls drawing artifacts under XP themes. Buttons
'   support code based on http://www.mvps.org/emorcillo/cod/tips/grpbtnxp.htm
'   Additionals home-grown tweaks include VB.Frame contained controls fix.
'
'=========================================================================
'Option Explicit

'=========================================================================
Private Const WM_CHANGEUISTATE As Long = &H127
Private Const UISF_HIDEFOCUS As Integer = &H1
Private Const UISF_HIDEACCEL As Integer = &H2
Private Const UIS_CLEAR As Integer = &H2
'=========================================================================


Private Const MODULE_NAME As String = "mdXpThemeSupport"

'==============================================================================
' API declares
'==============================================================================

'--- for Get/SetThemeAppProperties
Private Const STAP_ALLOW_CONTROLS       As Long = 2
'--- windows messages
Private Const WM_SETFOCUS               As Long = &H7
Private Const WM_KILLFOCUS              As Long = &H8
Private Const WM_ENABLE                 As Long = &HA
Private Const WM_SETREDRAW              As Long = &HB
Private Const WM_PAINT                  As Long = &HF
Private Const BM_GETSTATE               As Long = &HF2
Private Const WM_MOUSEMOVE              As Long = &H200
Private Const WM_LBUTTONDOWN            As Long = &H201
Private Const WM_LBUTTONUP              As Long = &H202
Private Const WM_RBUTTONUP              As Long = &H205
Private Const WM_MOUSEHOVER             As Long = &H2A1
Private Const WM_MOUSELEAVE             As Long = &H2A3
Private Const WM_PRINTCLIENT            As Long = &H318
'--- button states
Private Const BST_PUSHED                As Long = &H4
Private Const BST_FOCUS                 As Long = &H8
'--- for DrawText
Private Const DT_CALCRECT               As Long = &H400
Private Const DT_CENTER                 As Long = &H1
Private Const DT_WORDBREAK              As Long = &H10
'--- for TrackMouseEvent
Private Const TME_HOVER                 As Long = 1
Private Const TME_LEAVE                 As Long = 2
'--- for ExtSelectClipRgn
Private Const RGN_DIFF                  As Long = 4
Private Const RGN_COPY                  As Long = 5
'--- for DrawState
Private Const DSS_NORMAL                As Long = &H0&
Private Const DST_ICON                  As Long = &H3&
Private Const DST_BITMAP                As Long = &H4&
Private Const DSS_DISABLED              As Long = &H20&
'--- HRESULTs
Private Const S_OK                      As Long = 0
Private Const ICC_USEREX_CLASSES        As Long = &H200

Private Declare Function IsAppThemed Lib "uxtheme" () As Long
Private Declare Function IsThemeActive Lib "uxtheme" () As Long
Private Declare Function GetThemeAppProperties Lib "uxtheme" () As Long
Private Declare Function DllGetVersion Lib "comctl32.dll" (pdvi As DLLVERSIONINFO) As Long
Private Declare Function SetWindowSubclass Lib "comctl32" (ByVal hwnd As Long, ByVal pfnSubclass As Long, ByVal uIdSubclass As Long, ByVal dwRefData As Long) As Long
Private Declare Function DefSubclassProc Lib "comctl32" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function DefWindowProc Lib "user32" Alias "DefWindowProcA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function IsWindowVisible Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetFocus Lib "user32" () As Long
Private Declare Function ExtSelectClipRgn Lib "gdi32" (ByVal hDC As Long, ByVal hRgn As Long, ByVal fnMode As Long) As Long
Private Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hDC As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Private Declare Function DrawState Lib "user32" Alias "DrawStateA" (ByVal hDC As Long, ByVal hBrush As Long, ByVal lpDrawStateProc As Long, ByVal lData As Long, ByVal wData As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal fFlags As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function GetProp Lib "user32" Alias "GetPropA" (ByVal hwnd As Long, ByVal lpString As String) As Long
Private Declare Function SetProp Lib "user32" Alias "SetPropA" (ByVal hwnd As Long, ByVal lpString As String, ByVal hData As Long) As Long
Private Declare Function BeginPaint Lib "user32" (ByVal hwnd As Long, lpPaint As PAINTSTRUCT) As Long
Private Declare Function EndPaint Lib "user32" (ByVal hwnd As Long, lpPaint As PAINTSTRUCT) As Long
Private Declare Function GetClientRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Private Declare Function InvalidateRect Lib "user32" (ByVal hwnd As Long, lpRect As Any, ByVal bErase As Long) As Long
Private Declare Function ValidateRect Lib "user32" (ByVal hwnd As Long, lpRect As Any) As Long
Private Declare Function InvalidateRgn Lib "user32" (ByVal hwnd As Long, ByVal hRgn As Long, ByVal bErase As Long) As Long
Private Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Private Declare Function FillRect Lib "user32" (ByVal hDC As Long, lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hDC As Long) As Long
Private Declare Function ReleaseDC Lib "user32" (ByVal hwnd As Long, ByVal hDC As Long) As Long
Private Declare Function DeleteDC Lib "gdi32" (ByVal hDC As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hDC As Long, ByVal hObject As Long) As Long
Private Declare Function DrawFocusRect Lib "user32" (ByVal hDC As Long, lpRect As RECT) As Long
Private Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
Private Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hDC As Long, ByVal lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long
Private Declare Function TrackMouseEvent Lib "user32" (lpEventTrack As TRACKMOUSEEVENTSTRUCT) As Long
Private Declare Function TransparentBlt Lib "msimg32" (ByVal hdcDest As Long, ByVal nXOriginDest As Long, ByVal nYOriginDest As Long, ByVal nWidthDest As Long, ByVal hHeightDest As Long, ByVal hdcSrc As Long, ByVal nXOriginSrc As Long, ByVal nYOriginSrc As Long, ByVal nWidthSrc As Long, ByVal nHeightSrc As Long, ByVal crTransparent As Long) As Long
Private Declare Function InitCommonControls Lib "comctl32.dll" () As Long
Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function InflateRect Lib "user32" (lpRect As RECT, ByVal x As Long, ByVal y As Long) As Long
'--- uxtheme API
Private Declare Function DrawThemeBackground Lib "uxtheme" (ByVal hTheme As Long, ByVal hDC As Long, ByVal iPartId As Long, ByVal iStateId As Long, pRect As RECT, pClipRect As RECT) As Long
Private Declare Function DrawThemeText Lib "uxtheme" (ByVal hTheme As Long, ByVal hDC As Long, ByVal iPartId As Long, ByVal iStateId As Long, ByVal pszText As Long, ByVal iCharCount As Long, ByVal dwTextFlags As Long, ByVal dwTextFlags2 As Long, pRect As RECT) As Long
Private Declare Function OpenThemeData Lib "uxtheme" (ByVal hwnd As Long, ByVal pszClassList As Long) As Long
Private Declare Function CloseThemeData Lib "uxtheme" (ByVal hTheme As Long) As Long
Private Declare Function GetThemeBackgroundRegion Lib "uxtheme" (ByVal hTheme As Long, ByVal hDC As Long, ByVal iPartId As Long, ByVal iStateId As Long, pRect As RECT, hRgn As Long) As Long
Private Declare Function GetThemeBackgroundContentRect Lib "uxtheme" (ByVal hTheme As Long, ByVal hDC As Long, ByVal iPartId As Long, ByVal iStateId As Long, pBoundingRect As RECT, pContentRect As RECT) As Long
Private Declare Function DrawThemeParentBackground Lib "uxtheme" (ByVal hwnd As Long, ByVal hDC As Long, pRect As RECT) As Long
Private Declare Function InitCommonControlsEx Lib "comctl32.dll" (iccex As TagInitCommonControlsEx) As Long

Private Type DLLVERSIONINFO
    cbSize              As Long
    dwMajor             As Long
    dwMinor             As Long
    dwBuildNumber       As Long
    dwPlatformID        As Long
End Type

Private Type RECT
    Left                As Long
    Top                 As Long
    Right               As Long
    Bottom              As Long
End Type

Private Type PAINTSTRUCT
    hDC                 As Long
    fErase              As Long
    rcPaint             As RECT
    fRestore            As Long
    fIncUpdate          As Long
    rgbReserved(32)     As Byte
End Type

Private Type TRACKMOUSEEVENTSTRUCT
    cbSize              As Long
    dwFlags             As Long
    hwndTrack           As Long
    dwHoverTime         As Long
End Type

Private Type TagInitCommonControlsEx
   lngSize              As Long
   lngICC               As Long
End Type

Private Enum UxThemeButtonParts
    BP_PUSHBUTTON = 1
'    BP_RADIOBUTTON = 2
'    BP_CHECKBOX = 3
'    BP_GROUPBOX = 4
'    BP_USERBUTTON = 5
End Enum

Private Enum UxThemeButtonStates
    PBS_NORMAL = 1
    PBS_HOT = 2
    PBS_PRESSED = 3
    PBS_DISABLED = 4
    PBS_DEFAULTED = 5
End Enum

'==============================================================================
' Err handling
'==============================================================================

Private Sub PrintError(sFunc As String)
    Debug.Print MODULE_NAME; "."; sFunc; ": "; Err.Description
End Sub

'==============================================================================
' Functions
'==============================================================================

Public Function FixThemeSupport(oControls As Object) As Boolean
    Const FUNC_NAME     As String = "FixThemeSupport"
    Dim oCtl            As Object
    
'==============================================================================
    Dim frm As Object
    For Each oCtl In oControls
        Set frm = oCtl.Parent
        ShowMnemonic frm 'this Fix Mnemonic (ShortCut Underline)
        Exit For
    Next
'==============================================================================
   
    On Error GoTo EH
    If IsComCtl6Loaded() Then
        For Each oCtl In oControls
            If TypeOf oCtl Is VB.Frame Then
                SetWindowSubclass oCtl.hwnd, AddressOf pvRedirectFrame, 0, 0
            Else
                If TypeOf oCtl Is VB.CommandButton Or _
                        TypeOf oCtl Is VB.OptionButton Or _
                        TypeOf oCtl Is VB.CheckBox Then
                    If oCtl.Style = vbButtonGraphical Then
                        SetWindowSubclass oCtl.hwnd, AddressOf pvRedirectButton, 0, ObjPtr(oCtl)
                    End If
                End If
            End If
        Next
        '--- success
        FixThemeSupport = True
    End If
    Exit Function
EH:
    PrintError FUNC_NAME
    Resume Next
End Function

Public Sub PrepareThemeSupport()
    Static bInit        As Boolean
    Dim iccex           As TagInitCommonControlsEx
    
    '--- one-time initialization
    If Not bInit Then
        If IsComCtl6Loaded() Then
            '--- prepare for visual styles
            Call LoadLibrary("shell32.dll")
            With iccex
                .lngSize = LenB(iccex)
                .lngICC = ICC_USEREX_CLASSES
            End With
            Call InitCommonControlsEx(iccex)
        End If
        bInit = True
    End If
End Sub

Public Function InIde() As Boolean
    Debug.Assert pvSetTrue(InIde)
End Function

Public Function IsComCtl6Loaded() As Boolean
    Const FUNC_NAME     As String = "IsComCtl6Loaded"
    Dim uVer            As DLLVERSIONINFO
    
    On Error GoTo EH
    uVer.cbSize = Len(uVer)
    Call DllGetVersion(uVer)
    IsComCtl6Loaded = (uVer.dwMajor >= 6)
    Exit Function
EH:
    PrintError FUNC_NAME
    Resume Next
End Function

Public Function IsThemed() As Boolean
    '--- uxtheme.dll is not present on earlier OS'es
    On Error Resume Next
    IsThemed = True
    If IsAppThemed() = 0 Then
        IsThemed = False
    ElseIf IsThemeActive() = 0 Then
        IsThemed = False
    ElseIf (GetThemeAppProperties() And STAP_ALLOW_CONTROLS) = 0 Then
        IsThemed = False
    End If
    On Error GoTo 0
End Function

'= private ====================================================================

Private Function pvRedirectFrame( _
            ByVal hwnd As Long, _
            ByVal wMsg As Long, _
            ByVal wParam As Long, _
            ByVal lParam As Long, _
            ByVal uIdSubclass As Long, _
            ByVal dwRefData As Long) As Long
    Const FUNC_NAME     As String = "pvRedirectFrame"
    
    On Error GoTo EH
    #If uIdSubclass And dwRefData Then '--- touch args
    #End If
    Select Case wMsg
    Case WM_PRINTCLIENT, WM_MOUSELEAVE
        pvRedirectFrame = DefWindowProc(hwnd, wMsg, wParam, lParam)
    Case Else
        pvRedirectFrame = DefSubclassProc(hwnd, wMsg, wParam, lParam)
    End Select
    Exit Function
EH:
    PrintError FUNC_NAME
    Resume Next
End Function

Private Function pvRedirectButton( _
            ByVal hwnd As Long, _
            ByVal wMsg As Long, _
            ByVal wParam As Long, _
            ByVal lParam As Long, _
            ByVal uIdSubclass As Long, _
            ByVal oButton As Object) As Long
    Const FUNC_NAME     As String = "pvRedirectButton"
    Dim uPS             As PAINTSTRUCT
    Dim uTME            As TRACKMOUSEEVENTSTRUCT
    Dim bSetRedraw      As Boolean
    
    On Error GoTo EH
    #If uIdSubclass Then '--- touch args
    #End If
    Select Case wMsg
    Case WM_PAINT
        If IsThemed() Then
            If pvVisible(hwnd) Then
                pvPainted(hwnd) = True
                pvDrawButton hwnd, BeginPaint(hwnd, uPS), oButton
                EndPaint hwnd, uPS
                Exit Function
            End If
        End If
    Case WM_SETFOCUS, WM_ENABLE
        If IsThemed() Then
            If pvVisible(hwnd) Then
                bSetRedraw = True
                '--- suppress repainting VB tries to force upon recieving focus
                SendMessage hwnd, WM_SETREDRAW, 0, ByVal 0
            End If
        End If
    End Select
    ' Call the previous window procedure
    pvRedirectButton = DefSubclassProc(hwnd, wMsg, wParam, lParam)
    Select Case wMsg
    Case WM_MOUSEHOVER, WM_LBUTTONDOWN
        If IsThemed() Then
            pvHot(hwnd) = True
            pvInvalidateButton hwnd, PBS_HOT
        End If
    Case WM_MOUSELEAVE, WM_KILLFOCUS
        If IsThemed() Then
            pvHot(hwnd) = False
            pvInvalidateButton hwnd, PBS_NORMAL
        End If
    Case WM_MOUSEMOVE
        If IsThemed() Then
            If Not pvHot(hwnd) Then
                With uTME
                    .cbSize = LenB(uTME)
                    .hwndTrack = hwnd
                    .dwFlags = TME_HOVER Or TME_LEAVE
                    .dwHoverTime = 1
                End With
                TrackMouseEvent uTME
            End If
            '--- first-time showing *must* redraw the whole button
            If Not pvPainted(hwnd) Then
                pvInvalidateButton hwnd, PBS_NORMAL
            End If
        End If
    Case WM_SETFOCUS, WM_ENABLE
        If IsThemed() Then
            If bSetRedraw Then
                '--- restore normal painting
                SendMessage hwnd, WM_SETREDRAW, 1, ByVal 0
                '--- redraw whole button is disabling
                If wMsg = WM_ENABLE Then
                    InvalidateRect hwnd, ByVal 0, 0
                Else
                    pvInvalidateButton hwnd, PBS_NORMAL
                End If
            End If
        End If
    Case WM_LBUTTONUP, WM_RBUTTONUP
        If IsThemed() Then
            '--- redraw button
            pvInvalidateButton hwnd, PBS_NORMAL
        End If
    End Select
    Exit Function
EH:
    PrintError FUNC_NAME
    Resume Next
End Function

Private Sub pvInvalidateButton(ByVal hwnd As Long, ByVal eState As UxThemeButtonStates)
    Dim hTheme          As Long
    Dim rcClient        As RECT
    Dim hRgnInval        As Long
    
    '--- get client rect
    GetClientRect hwnd, rcClient
    '--- undo VB invalidation
    ValidateRect hwnd, ByVal 0
    '--- open theme and get clip region
    hTheme = OpenThemeData(hwnd, StrPtr("BUTTON"))
    GetThemeBackgroundRegion hTheme, 0, BP_PUSHBUTTON, PBS_NORMAL, rcClient, hRgnInval
    CloseThemeData hTheme
    InvalidateRgn hwnd, hRgnInval, 0
    '--- delete clip region
    DeleteObject hRgnInval
End Sub

Private Sub pvDrawButton( _
            ByVal hwnd As Long, _
            ByVal hDC As Long, _
            oButton As Object)
    Const FUNC_NAME     As String = "pvDrawButton"
    Dim hTheme          As Long
    Dim eState          As UxThemeButtonStates
    Dim bChecked        As Boolean
    Dim bHot            As Boolean
    Dim bFocused        As Boolean
    Dim bPushed         As Boolean
    Dim bDefault        As Boolean
    Dim lFontOld        As Long
    Dim oPict           As IPicture
    Dim oFont           As IFont
    Dim rcClient        As RECT
    Dim rcText          As RECT
    Dim hRgnClip        As Long
    Dim lW              As Long
    Dim lH              As Long
    Dim lX              As Long
    Dim lY              As Long
    
    On Error GoTo EH
    ' Get the button state
    eState = SendMessage(hwnd, BM_GETSTATE, 0&, ByVal 0&)
    bChecked = oButton.Value
    bHot = pvHot(hwnd)
    bPushed = (eState And BST_PUSHED) <> 0
    bFocused = (eState And BST_FOCUS) <> 0
    '--- oButton migth be missing Default property
    On Error Resume Next
    bDefault = oButton.Default
    If GetFocus() <> hwnd Then
        '--- this fails if Default property is not present and err handler
        '---   resumes in true branch
        If CLng(oButton.Parent.ActiveControl.Default) > 0 Then
        Else
            bDefault = False
        End If
    End If
    On Error GoTo EH
    ' Set the state and picture
    If oButton.Enabled = False Then
        eState = PBS_DISABLED
        Set oPict = pvCoalescePic(oButton.DisabledPicture, oButton.Picture)
    ElseIf bHot And Not bPushed Then
        eState = PBS_HOT
        If bChecked Then
            Set oPict = pvCoalescePic(oButton.DownPicture, oButton.Picture)
        Else
            Set oPict = oButton.Picture
        End If
    ElseIf bChecked Or bPushed Then
        eState = PBS_PRESSED
        Set oPict = pvCoalescePic(oButton.DownPicture, oButton.Picture)
    ElseIf bFocused Or bDefault Then
        eState = PBS_DEFAULTED
        Set oPict = oButton.Picture
    Else
        eState = PBS_NORMAL
        Set oPict = oButton.Picture
    End If
    If Not oPict Is Nothing Then
        If oPict.Handle = 0 Then
            Set oPict = Nothing
        End If
    End If
    ' Get the client rectangle
    GetClientRect hwnd, rcClient
    ' Open the theme
    hTheme = OpenThemeData(hwnd, StrPtr("BUTTON"))
    '--- clip background painting to transparent region only
    GetThemeBackgroundRegion hTheme, hDC, BP_PUSHBUTTON, eState, rcClient, hRgnClip
    ExtSelectClipRgn hDC, hRgnClip, RGN_DIFF
    '--- draw transparent parts
    If DrawThemeParentBackground(hwnd, hDC, rcClient) <> S_OK Then
        pvDrawRect hDC, 0, 0, rcClient.Right, rcClient.Bottom, pvTranslateColor(oButton.BackColor)
    End If
    '--- remove clipping
    ExtSelectClipRgn hDC, 0, RGN_COPY
    DeleteObject hRgnClip
    ' Draw the button background
    DrawThemeBackground hTheme, hDC, BP_PUSHBUTTON, eState, rcClient, rcClient
    GetThemeBackgroundContentRect hTheme, hDC, BP_PUSHBUTTON, eState, rcClient, rcClient
    If bFocused Then
        DrawFocusRect hDC, rcClient
    End If
    If Len(oButton.Caption) > 0 Then
        ' Select the button font
        Set oFont = oButton.Font
        lFontOld = SelectObject(hDC, oFont.hFont)
        ' Calculate the text size
        rcText = rcClient
        DrawText hDC, oButton.Caption, -1, rcText, DT_CALCRECT Or DT_WORDBREAK
        rcText.Left = rcClient.Left
        rcText.Right = rcClient.Right
        If oPict Is Nothing Then
            rcText.Top = (rcClient.Bottom - rcText.Bottom) / 2 + 2
            rcText.Bottom = rcText.Top + rcText.Bottom
        Else
            rcText.Top = rcClient.Bottom - rcText.Bottom + 1
            rcText.Bottom = rcClient.Bottom
        End If
        ' Draw the text
        DrawThemeText hTheme, hDC, BP_PUSHBUTTON, eState, StrPtr(oButton.Caption), -1, DT_CENTER Or DT_WORDBREAK, 0, rcText
        ' Restore the original font
        SelectObject hDC, lFontOld
        rcClient.Bottom = rcText.Top
    End If
    ' Close the theme
    CloseThemeData hTheme
    If Not oPict Is Nothing Then
        ' Convert from HIMETRIC to Pixels
        lW = pvHM2Pix(oPict.Width)
        lH = pvHM2Pix(oPict.Height)
        lX = rcClient.Left + ((rcClient.Right - rcClient.Left - lW) / 2)
        lY = rcClient.Top + ((rcClient.Bottom - rcClient.Left - lH) / 2)
        If oButton.Enabled Then
            If oButton.UseMaskColor Then
                ' Draw the image using the mask color
                pvDrawTransparentPicture oPict, hDC, lX, lY, lW, lH, pvTranslateColor(oButton.MaskColor)
            Else
                ' Draw the image without using the mask color
                oPict.Render hDC, lX, lY + lH, lW, -lH, 0, 0, oPict.Width, oPict.Height, ByVal 0&
            End If
        Else
            ' Draw the image in disabled mode
            pvDrawDisabledPicture oPict, hDC, lX, lY, lW, lH, pvTranslateColor(oButton.MaskColor)
        End If
    End If
    Exit Sub
EH:
    PrintError FUNC_NAME
    Resume Next
End Sub

Private Sub pvDrawTransparentPicture( _
            ByVal picSource As Picture, _
            ByVal hdcDest As Long, _
            ByVal xDest As Long, _
            ByVal yDest As Long, _
            ByVal cxDest As Long, _
            ByVal cyDest As Long, _
            ByVal clrMask As Long, _
            Optional ByVal xSrc As Long, _
            Optional ByVal ySrc As Long, _
            Optional ByVal cxSrc As Long, _
            Optional ByVal cySrc As Long)
    Const FUNC_NAME     As String = "pvDrawTransparentPicture"
    Dim hDcScreen       As Long
    Dim hdcSrc          As Long
    Dim hBmpOld         As Long
    
    On Error GoTo EH
    If picSource Is Nothing Then Exit Sub
    If picSource.Handle = 0 Then Exit Sub
    If cxSrc = 0 Then cxSrc = cxDest
    If cySrc = 0 Then cySrc = cyDest
    ' Select passed picture into an HDC
    hDcScreen = GetDC(0)
    hdcSrc = CreateCompatibleDC(hDcScreen)
    hBmpOld = SelectObject(hdcSrc, CreateCompatibleBitmap(hDcScreen, cxSrc, cySrc))
    If picSource.Type = vbPicTypeIcon Then
        pvDrawRect hdcSrc, 0, 0, cxSrc, cxSrc, clrMask
        Call DrawState(hdcSrc, 0, 0, picSource.Handle, 0, 0, 0, cxSrc, cySrc, DST_ICON Or DSS_NORMAL)
    ElseIf picSource.Type = vbPicTypeBitmap Then
        Call DrawState(hdcSrc, 0, 0, picSource.Handle, 0, 0, 0, cxSrc, cySrc, DST_BITMAP Or DSS_NORMAL)
    End If
    ' Draw the bitmap in the destination DC
    TransparentBlt hdcDest, xDest, yDest, cxDest, cyDest, hdcSrc, xSrc, ySrc, cxSrc, cySrc, clrMask
    '--- cleanup
    Call DeleteObject(SelectObject(hdcSrc, hBmpOld))
    Call DeleteDC(hdcSrc)
    Call ReleaseDC(0, hDcScreen)
    Exit Sub
EH:
    PrintError FUNC_NAME
    Resume Next
End Sub

Private Sub pvDrawDisabledPicture( _
            ByVal picSource As Picture, _
            ByVal hdcDest As Long, _
            ByVal xDest As Long, _
            ByVal yDest As Long, _
            ByVal cxDest As Long, _
            ByVal cyDest As Long, _
            ByVal clrMask As Long)
    Const FUNC_NAME     As String = "pvDrawDisabledPicture"
    Dim hDcScreen       As Long
    Dim hdcSrc          As Long
    Dim hBmp            As Long
    Dim hBmpOld         As Long
    
    On Error GoTo EH
    If picSource Is Nothing Then Exit Sub
    If picSource.Handle = 0 Then Exit Sub
    '--- prepare
    hDcScreen = GetDC(0)
    hdcSrc = CreateCompatibleDC(hDcScreen)
    hBmp = CreateCompatibleBitmap(hDcScreen, cxDest, cyDest)
    hBmpOld = SelectObject(hdcSrc, hBmp)
    '--- draw
    Call pvDrawRect(hdcSrc, 0, 0, cxDest, cyDest, &HFFFFFF)
    Call pvDrawTransparentPicture(picSource, hdcSrc, 0, 0, cxDest, cyDest, clrMask)
    Call SelectObject(hdcSrc, hBmpOld)
    Call DrawState(hdcDest, 0, 0, hBmp, 0, xDest, yDest, cxDest, cyDest, DST_BITMAP Or DSS_DISABLED)
    '--- cleanup
    Call DeleteObject(hBmp)
    Call DeleteDC(hdcSrc)
    Call ReleaseDC(0, hDcScreen)
    Exit Sub
EH:
    PrintError FUNC_NAME
    Resume Next
End Sub

Private Sub pvDrawRect( _
            ByVal hDC As Long, _
            ByVal xDest As Long, _
            ByVal yDest As Long, _
            ByVal cxDest As Long, _
            ByVal cyDest As Long, _
            ByVal clrFill As Long)
    Const FUNC_NAME     As String = "pvDrawRect"
    Dim rc              As RECT
    Dim hBrush          As Long
    
    On Error GoTo EH
    hBrush = CreateSolidBrush(clrFill)
    With rc
        .Left = xDest
        .Top = yDest
        .Right = xDest + cxDest
        .Bottom = yDest + cyDest
    End With
    Call FillRect(hDC, rc, hBrush)
'    Call ThemedFillRect(hDC, VarPtr(rc), hBrush)
    Call DeleteObject(hBrush)
    Exit Sub
EH:
    PrintError FUNC_NAME
    Resume Next
End Sub

Private Function pvCoalescePic(oPic As StdPicture, oDefault As StdPicture) As StdPicture
    If oPic Is Nothing Then
        Set pvCoalescePic = oDefault
    ElseIf oPic.Handle = 0 Then
        Set pvCoalescePic = oDefault
    Else
        Set pvCoalescePic = oPic
    End If
End Function

Private Function pvTranslateColor(ByVal clrValue As OLE_COLOR)
    If (clrValue And &H80000000) <> 0 Then
        pvTranslateColor = GetSysColor(clrValue And &HFF)
    Else
        pvTranslateColor = clrValue
    End If
End Function

Private Function pvHM2Pix(dblWidth As Double) As Long
    pvHM2Pix = dblWidth / 2540 * (1440 / Screen.TwipsPerPixelX)
End Function

Private Property Get pvHot(ByVal hwnd As Long) As Boolean
    pvHot = (GetProp(hwnd, "Hot") <> 0)
End Property

Private Property Let pvHot(ByVal hwnd As Long, ByVal bValue As Boolean)
    Call SetProp(hwnd, "Hot", -bValue)
End Property

Private Property Get pvPainted(ByVal hwnd As Long) As Boolean
    pvPainted = (GetProp(hwnd, "Painted") <> 0)
End Property

Private Property Let pvPainted(ByVal hwnd As Long, ByVal bValue As Boolean)
    Call SetProp(hwnd, "Painted", -bValue)
End Property

Private Property Get pvVisible(ByVal hwnd As Long) As Boolean
    pvVisible = (IsWindowVisible(hwnd) <> 0)
End Property

Private Function pvSetTrue(bValue As Boolean) As Boolean
    bValue = True
    pvSetTrue = True
End Function

'=========================================================================
Private Sub ShowMnemonic(frm As Object)
   Dim uiState As Long
   uiState = MakeLong(UIS_CLEAR, UISF_HIDEFOCUS Or UISF_HIDEACCEL)
   SendMessage frm.hwnd, WM_CHANGEUISTATE, uiState, ByVal 0
End Sub

Private Function MakeLong(ByVal wLow As Integer, ByVal wHigh As Integer) As Long
   MakeLong = wHigh * &H10000 + wLow
End Function
'==========================================================================


