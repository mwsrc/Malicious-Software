VERSION 5.00
Begin VB.UserControl ThemedButton 
   AutoRedraw      =   -1  'True
   ClientHeight    =   495
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1215
   DefaultCancel   =   -1  'True
   MouseIcon       =   "ThemedButton.ctx":0000
   ScaleHeight     =   33
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   81
   ToolboxBitmap   =   "ThemedButton.ctx":058A
End
Attribute VB_Name = "ThemedButton"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'ThemedButton Control
'
'Author Ben Vonk
'15-10-2008 First version, included: Paul Caton's self Subclass v1.1.0008 and thanks to LaVolpe for his DrawTransparentPicture routine

Option Explicit

' Public Events
Public Event Click()
Public Event DblClick()
Public Event KeyDown(KeyCode As Integer, Shift As Integer)
Public Event KeyPress(KeyAscii As Integer)
Public Event KeyUp(KeyCode As Integer, Shift As Integer)
Public Event MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
Public Event MouseLeave(Button As Integer, Shift As Integer, x As Single, y As Single)
Public Event MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Public Event MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
Public Event OLECompleteDrag(Effect As Long)
Public Event OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
Public Event OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single, State As Integer)
Public Event OLEGiveFeedback(Effect As Long, DefaultCursors As Boolean)
Public Event OLESetData(Data As DataObject, DataFormat As Integer)
Public Event OLEStartDrag(Data As DataObject, AllowedEffects As Long)

' Private Constants
Private Const BNS_DOWNNORMAL    As Long = 5
Private Const BNS_UPHOT         As Long = 2
Private Const BNS_UPNORMAL      As Long = 1
Private Const BNS_UPPRESSED     As Long = 3
Private Const ALL_MESSAGES      As Long = -1
Private Const GWL_WNDPROC       As Long = -4
Private Const PATCH_05          As Long = 93
Private Const PATCH_09          As Long = 137
Private Const WM_LBUTTONDBLCLK  As Long = &H203
Private Const WM_LBUTTONDOWN    As Long = &H201
Private Const WM_LBUTTONUP      As Long = &H202
Private Const WM_MOUSELEAVE     As Long = &H2A3
Private Const WM_MOUSEMOVE      As Long = &H200
Private Const WM_THEMECHANGED   As Long = &H31A

' Public Enumerations
Public Enum PictureAlignConstants
   TopCenter
   LeftAlign
   Center
   RightAlign
   BottomCenter
End Enum

Public Enum PictureSizeConstants
   ps16x16
   ps24x24
   ps32x32
   ps48x48
   ps64x64
End Enum

' Private Enumerations
Private Enum MsgWhen
   MSG_AFTER = 1
   MSG_BEFORE = 2
   MSG_BEFORE_AND_AFTER = MSG_AFTER Or MSG_BEFORE
End Enum

Private Enum TrackMouseEventFlags
   TME_HOVER = &H1&
   TME_LEAVE = &H2&
   TME_QUERY = &H40000000
   TME_CANCEL = &H80000000
End Enum

' Private Types
Private Type MouseStateType
   Button                       As Integer
   Shift                        As Integer
   x                            As Single
   y                            As Single
End Type

Private Type OSVersionInfo
   OSVSize                      As Long
   dwVerMajor                   As Long
   dwVerMinor                   As Long
   dwBuildNumber                As Long
   PlatformID                   As Long
   szCSDVersion                 As String * 128
End Type

Private Type PointAPI
   x                            As Long
   y                            As Long
End Type

Private Type Rect
   Left                         As Long
   Top                          As Long
   Right                        As Long
   Bottom                       As Long
End Type

Private Type ButtonPropertiesType
   ButtonRect                   As Rect
   FocusRect                    As Rect
   PictureSize                  As Long
End Type

Private Type SubclassDataType
   hWnd                         As Long
   nAddrSclass                  As Long
   nAddrOrig                    As Long
   nMsgCountA                   As Long
   nMsgCountB                   As Long
   aMsgTabelA()                 As Long
   aMsgTabelB()                 As Long
End Type

Private Type TrackMouseEventStruct
   cbSize                       As Long
   dwFlags                      As TrackMouseEventFlags
   hwndTrack                    As Long
   dwHoverTime                  As Long
End Type

' Private Variables
Private m_CaptionAlign          As AlignmentConstants
Private m_CaptionShadow         As Boolean
Private InControl               As Boolean
Private IsFocused               As Boolean
Private IsHit                   As Boolean
Private IsThemed                As Boolean
Private IsThemedWindows         As Boolean
Private m_ShowFocusRect         As Boolean
Private MouseDown               As Boolean
Private SpaceKeyPressed         As Boolean
Private TrackUser32             As Boolean
Private ButtonProperties        As ButtonPropertiesType
Private AccessKeyPointer        As Integer
Private ButtonState             As Integer
Private m_BackColor             As Long
Private m_ForeColor             As Long
Private m_HoverColor            As Long
Private SubclassCode(64)        As Long
Private SubclassMemory          As Long
Private MouseState              As MouseStateType
Private m_PictureAlign          As PictureAlignConstants
Private m_PictureSize           As PictureSizeConstants
Private CaptionRect             As Rect
Private m_Picture               As StdPicture
Private m_Caption               As String
Private SubclassData()          As SubclassDataType

' Private API's
Private Declare Function TrackMouseEventComCtl Lib "ComCtl32" Alias "_TrackMouseEvent" (lpEventTrack As TrackMouseEventStruct) As Long
Private Declare Function BitBlt Lib "GDI32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function CreateBitmap Lib "GDI32" (ByVal nWidth As Long, ByVal nHeight As Long, ByVal nPlanes As Long, ByVal nBitCount As Long, lpBits As Any) As Long
Private Declare Function CreateCompatibleBitmap Lib "GDI32" (ByVal hDC As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Private Declare Function CreateCompatibleDC Lib "GDI32" (ByVal hDC As Long) As Long
Private Declare Function CreateSolidBrush Lib "GDI32" (ByVal crColor As Long) As Long
Private Declare Function DeleteDC Lib "GDI32" (ByVal hDC As Long) As Long
Private Declare Function DeleteObject Lib "GDI32" (ByVal hObject As Long) As Integer
Private Declare Function GetBkColor Lib "GDI32" (ByVal hDC As Long) As Long
Private Declare Function GetMapMode Lib "GDI32" (ByVal hDC As Long) As Long
Private Declare Function GetPixel Lib "GDI32" (ByVal hDC As Long, ByVal x As Long, ByVal y As Long) As Long
Private Declare Function GetTextColor Lib "GDI32" (ByVal hDC As Long) As Long
Private Declare Function PatBlt Lib "GDI32" (ByVal hDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal dwRop As Long) As Long
Private Declare Function RealizePalette Lib "GDI32" (ByVal hDC As Long) As Long
Private Declare Function SelectObject Lib "GDI32" (ByVal hDC As Long, ByVal hObject As Long) As Long
Private Declare Function SetMapMode Lib "GDI32" (ByVal hDC As Long, ByVal nMapMode As Long) As Long
Private Declare Function SelectPalette Lib "GDI32" (ByVal hDC As Long, ByVal hPalette As Long, ByVal bForceBackground As Long) As Long
Private Declare Function SetBkColor Lib "GDI32" (ByVal hDC As Long, ByVal crColor As Long) As Long
Private Declare Function SetTextColor Lib "GDI32" (ByVal hDC As Long, ByVal crColor As Long) As Long
Private Declare Function StretchBlt Lib "GDI32" (ByVal hDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVersionInfo) As Long
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function DrawEdge Lib "User32" (ByVal hDC As Long, qrc As Rect, ByVal edge As Long, ByVal grfFlags As Long) As Long
Private Declare Function DrawFocusRect Lib "User32" (ByVal hDC As Long, ByRef lpRect As Rect) As Long
Private Declare Function DrawIconEx Lib "User32" (ByVal hDC As Long, ByVal xLeft As Long, ByVal yTop As Long, ByVal hIcon As Long, ByVal cxWidth As Long, ByVal cyWidth As Long, ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As Long, ByVal diFlags As Long) As Long
Private Declare Function DrawText Lib "User32" Alias "DrawTextA" (ByVal hDC As Long, ByVal lpStr As String, ByVal nCount As Long, ByRef lpRect As Rect, ByVal wFormat As Long) As Long
Private Declare Function DrawTextW Lib "User32" (ByVal hDC As Long, ByVal lpStr As Long, ByVal nCount As Long, ByRef lpRect As Rect, ByVal wFormat As Long) As Long
Private Declare Function GetSysColor Lib "User32" (ByVal nIndex As Long) As Long
Private Declare Function OffsetRect Lib "User32" (ByRef lpRect As Rect, ByVal x As Long, ByVal y As Long) As Long
Private Declare Function PostMessage Lib "User32" Alias "PostMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function ReleaseCapture Lib "User32" () As Long
Private Declare Function SetCapture Lib "User32" (ByVal hWnd As Long) As Long
Private Declare Function SetWindowLongA Lib "User32" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function TrackMouseEvent Lib "User32" (lpEventTrack As TrackMouseEventStruct) As Long
Private Declare Function CloseThemeData Lib "UxTheme" (ByVal lngTheme As Long) As Long
Private Declare Function DrawThemeBackground Lib "UxTheme" (ByVal hTheme As Long, ByVal lhDC As Long, ByVal iPartId As Long, ByVal iStateId As Long, pRect As Rect, pClipRect As Rect) As Long
Private Declare Function GetCurrentThemeName Lib "UxTheme" (ByVal pszThemeFileName As Long, ByVal cchMaxNameChars As Long, ByVal pszColorBuff As Long, ByVal cchMaxColorChars As Long, ByVal pszSizeBuff As Long, ByVal cchMaxSizeChars As Long) As Long
Private Declare Function GetThemeDocumentationProperty Lib "UxTheme" (ByVal pszThemeName As Long, ByVal pszPropertyName As Long, ByVal pszValueBuff As Long, ByVal cchMaxValChars As Long) As Long
Private Declare Function OpenThemeData Lib "UxTheme" (ByVal hWnd As Long, ByVal pszClassList As Long) As Long

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Sub MouseEvents Lib "User32" Alias "mouse_event" (ByVal dwFlags As Long, ByVal dx As Long, ByVal dy As Long, ByVal cButtons As Long, ByVal dwExtraInfo As Long)

Public Sub Subclass_WndProc(ByVal bBefore As Boolean, ByRef bHandled As Boolean, ByRef lReturn As Long, ByRef lhWnd As Long, ByRef uMsg As Long, ByRef wParam As Long, ByRef lParam As Long)

Const MOUSEEVENTF_LEFTDOWN As Long = &H2

Dim blnMouseLeave          As Boolean
Dim blnMouseMove           As Boolean
Dim intButtonState         As Integer

   intButtonState = ButtonState
   
   Select Case uMsg
      Case WM_LBUTTONDBLCLK
         Call MouseEvents(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
         
      Case WM_LBUTTONDOWN
         MouseDown = True
         IsFocused = True
         ButtonState = BNS_UPPRESSED
         SetCapture UserControl.hWnd
         
      Case WM_LBUTTONUP
         ReleaseCapture
         MouseDown = False
         
         If IsHit Then
            ButtonState = BNS_UPHOT
            
         Else
            ButtonState = BNS_DOWNNORMAL
         End If
         
         If InControl Then Call UserControl_Click
         
      Case WM_MOUSELEAVE
         If SpaceKeyPressed Then Exit Sub
         
         If IsHit Or IsFocused Then
            If ButtonState = BNS_DOWNNORMAL Then intButtonState = -1
            
            ButtonState = BNS_DOWNNORMAL
            UserControl.BackColor = m_BackColor
            
         Else
            If ButtonState = BNS_UPNORMAL Then intButtonState = -1
            
            ButtonState = BNS_UPNORMAL
            UserControl.BackColor = m_BackColor
         End If
         
         InControl = False
         blnMouseLeave = True
         
      Case WM_MOUSEMOVE
         If SpaceKeyPressed Then Exit Sub
         
         Call TrackMouseLeave(lhWnd)
         
         If Not InControl Then
            If MouseDown Then
               ButtonState = BNS_UPHOT
               
            Else
               ButtonState = BNS_UPHOT
            End If
            
            UserControl.BackColor = m_BackColor
            
         Else
            UserControl.BackColor = m_HoverColor
            
            If intButtonState = ButtonState Then intButtonState = -1
         End If
         
         blnMouseMove = True
         
      Case WM_THEMECHANGED
         ' Wait until Windows has changed the system colors
         For intButtonState = 1 To 500
            DoEvents
         Next 'intButtonState
         
         IsThemed = GetTheme
         intButtonState = -1
         
         If Not IsThemed Then
            If InControl Then
               UserControl.BackColor = m_HoverColor
               
            Else
               UserControl.BackColor = m_BackColor
            End If
         End If
   End Select
   
   If ButtonState <> intButtonState Then Call Refresh
   
   If blnMouseLeave Then
      With MouseState
         RaiseEvent MouseLeave(.Button, .Shift, .x, .y)
      End With
   End If
   
   If blnMouseMove Then
      With MouseState
         RaiseEvent MouseMove(.Button, .Shift, .x, .y)
      End With
   End If

End Sub

Private Function Subclass_AddrFunc(ByVal sDLL As String, ByVal sProc As String) As Long

   Subclass_AddrFunc = GetProcAddress(GetModuleHandle(sDLL), sProc)
   Debug.Assert Subclass_AddrFunc

End Function

Private Function Subclass_Index(ByVal lhWnd As Long, Optional ByVal bAdd As Boolean) As Long

   For Subclass_Index = UBound(SubclassData) To 0 Step -1
      If SubclassData(Subclass_Index).hWnd = lhWnd Then
         If Not bAdd Then Exit Function
         
      ElseIf SubclassData(Subclass_Index).hWnd = 0 Then
         If bAdd Then Exit Function
      End If
   Next 'Subclass_Index
   
   If Not bAdd Then Debug.Assert False

End Function

Private Function Subclass_InIDE() As Boolean

   Debug.Assert Subclass_SetTrue(Subclass_InIDE)

End Function

Private Function Subclass_Initialize(ByVal lhWnd As Long) As Long

Const CODE_LEN                  As Long = 200
Const GMEM_FIXED                As Long = 0
Const PATCH_01                  As Long = 18
Const PATCH_02                  As Long = 68
Const PATCH_03                  As Long = 78
Const PATCH_06                  As Long = 116
Const PATCH_07                  As Long = 121
Const PATCH_0A                  As Long = 186
Const FUNC_CWP                  As String = "CallWindowProcA"
Const FUNC_EBM                  As String = "EbMode"
Const FUNC_SWL                  As String = "SetWindowLongA"
Const MOD_USER                  As String = "User32"
Const MOD_VBA5                  As String = "vba5"
Const MOD_VBA6                  As String = "vba6"

Static bytBuffer(1 To CODE_LEN) As Byte
Static lngCWP                   As Long
Static lngEbMode                As Long
Static lngSWL                   As Long

Dim lngCount                    As Long
Dim lngIndex                    As Long
Dim strHex                      As String

   If bytBuffer(1) Then
      lngIndex = Subclass_Index(lhWnd, True)
      
      If lngIndex = -1 Then
         lngIndex = UBound(SubclassData()) + 1
         
         ReDim Preserve SubclassData(lngIndex) As SubclassDataType
      End If
      
      Subclass_Initialize = lngIndex
      
   Else
      strHex = "5589E583C4F85731C08945FC8945F8EB0EE80000000083F802742185C07424E830000000837DF800750AE838000000E84D0000005F8B45FCC9C21000E826000000EBF168000000006AFCFF7508E800000000EBE031D24ABF00000000B900000000E82D000000C3FF7514FF7510FF750CFF75086800000000E8000000008945FCC331D2BF00000000B900000000E801000000C3E33209C978078B450CF2AF75278D4514508D4510508D450C508D4508508D45FC508D45F85052B800000000508B00FF90A4070000C3"
      
      For lngCount = 1 To CODE_LEN
         bytBuffer(lngCount) = Val("&H" & Left(strHex, 2))
         strHex = Mid(strHex, 3)
      Next 'lngCount
      
      If Subclass_InIDE Then
         bytBuffer(16) = &H90
         bytBuffer(17) = &H90
         lngEbMode = Subclass_AddrFunc(MOD_VBA6, FUNC_EBM)
         
         If lngEbMode = 0 Then lngEbMode = Subclass_AddrFunc(MOD_VBA5, FUNC_EBM)
      End If
      
      lngCWP = Subclass_AddrFunc(MOD_USER, FUNC_CWP)
      lngSWL = Subclass_AddrFunc(MOD_USER, FUNC_SWL)
      
      ReDim SubclassData(0) As SubclassDataType
   End If
   
   With SubclassData(lngIndex)
      .hWnd = lhWnd
      .nAddrSclass = GlobalAlloc(GMEM_FIXED, CODE_LEN)
      .nAddrOrig = SetWindowLongA(.hWnd, GWL_WNDPROC, .nAddrSclass)
      
      Call CopyMemory(ByVal .nAddrSclass, bytBuffer(1), CODE_LEN)
      Call Subclass_PatchRel(.nAddrSclass, PATCH_01, lngEbMode)
      Call Subclass_PatchVal(.nAddrSclass, PATCH_02, .nAddrOrig)
      Call Subclass_PatchRel(.nAddrSclass, PATCH_03, lngSWL)
      Call Subclass_PatchVal(.nAddrSclass, PATCH_06, .nAddrOrig)
      Call Subclass_PatchRel(.nAddrSclass, PATCH_07, lngCWP)
      Call Subclass_PatchVal(.nAddrSclass, PATCH_0A, ObjPtr(Me))
   End With

End Function

Private Function Subclass_SetTrue(ByRef bValue As Boolean) As Boolean

   Subclass_SetTrue = True
   bValue = True

End Function

Private Sub Subclass_AddMsg(ByVal lhWnd As Long, ByVal uMsg As Long, Optional ByVal When As MsgWhen = MSG_AFTER)

   With SubclassData(Subclass_Index(lhWnd))
      If When And MSG_BEFORE Then Call Subclass_DoAddMsg(uMsg, .aMsgTabelB, .nMsgCountB, MSG_BEFORE, .nAddrSclass)
      If When And MSG_AFTER Then Call Subclass_DoAddMsg(uMsg, .aMsgTabelA, .nMsgCountA, MSG_AFTER, .nAddrSclass)
   End With

End Sub

Private Sub Subclass_DelMsg(ByVal lhWnd As Long, ByVal uMsg As Long, Optional ByVal When As MsgWhen = MSG_AFTER)

   With SubclassData(Subclass_Index(lhWnd))
      If When And MSG_BEFORE Then Call Subclass_DoDelMsg(uMsg, .aMsgTabelB, .nMsgCountB, MSG_BEFORE, .nAddrSclass)
      If When And MSG_AFTER Then Call Subclass_DoDelMsg(uMsg, .aMsgTabelA, .nMsgCountA, MSG_AFTER, .nAddrSclass)
   End With

End Sub

Private Sub Subclass_DoAddMsg(ByVal uMsg As Long, ByRef aMsgTabel() As Long, ByRef nMsgCount As Long, ByVal When As MsgWhen, ByVal nAddr As Long)

Const PATCH_04 As Long = 88
Const PATCH_08 As Long = 132

Dim lngEntry   As Long

   ReDim lngOffset(1) As Long
   
   If uMsg = ALL_MESSAGES Then
      nMsgCount = ALL_MESSAGES
      
   Else
      For lngEntry = 1 To nMsgCount - 1
         If aMsgTabel(lngEntry) = 0 Then
            aMsgTabel(lngEntry) = uMsg
            
            GoTo ExitSub
            
         ElseIf aMsgTabel(lngEntry) = uMsg Then
            GoTo ExitSub
         End If
      Next 'lngEntry
      
      nMsgCount = nMsgCount + 1
      
      ReDim Preserve aMsgTabel(1 To nMsgCount) As Long
      
      aMsgTabel(nMsgCount) = uMsg
   End If
   
   If When = MSG_BEFORE Then
      lngOffset(0) = PATCH_04
      lngOffset(1) = PATCH_05
      
   Else
      lngOffset(0) = PATCH_08
      lngOffset(1) = PATCH_09
   End If
   
   If uMsg <> ALL_MESSAGES Then Call Subclass_PatchVal(nAddr, lngOffset(0), VarPtr(aMsgTabel(1)))
   
   Call Subclass_PatchVal(nAddr, lngOffset(1), nMsgCount)
   
ExitSub:
   Erase lngOffset

End Sub

Private Sub Subclass_DoDelMsg(ByVal uMsg As Long, ByRef aMsgTabel() As Long, ByRef nMsgCount As Long, ByVal When As MsgWhen, ByVal nAddr As Long)

Dim lngEntry As Long

   If uMsg = ALL_MESSAGES Then
      nMsgCount = 0
      
      If When = MSG_BEFORE Then
         lngEntry = PATCH_05
         
      Else
         lngEntry = PATCH_09
      End If
      
      Call Subclass_PatchVal(nAddr, lngEntry, 0)
      
   Else
      For lngEntry = 1 To nMsgCount - 1
         If aMsgTabel(lngEntry) = uMsg Then
            aMsgTabel(lngEntry) = 0
            Exit For
         End If
      Next 'lngEntry
   End If

End Sub

Private Sub Subclass_PatchRel(ByVal nAddr As Long, ByVal nOffset As Long, ByVal nTargetAddr As Long)

   Call CopyMemory(ByVal nAddr + nOffset, nTargetAddr - nAddr - nOffset - 4, 4)

End Sub

Private Sub Subclass_PatchVal(ByVal nAddr As Long, ByVal nOffset As Long, ByVal nValue As Long)

   Call CopyMemory(ByVal nAddr + nOffset, nValue, 4)

End Sub

Private Sub Subclass_Stop(ByVal lhWnd As Long)

   With SubclassData(Subclass_Index(lhWnd))
      SetWindowLongA .hWnd, GWL_WNDPROC, .nAddrOrig
      
      Call Subclass_PatchVal(.nAddrSclass, PATCH_05, 0)
      Call Subclass_PatchVal(.nAddrSclass, PATCH_09, 0)
      
      GlobalFree .nAddrSclass
      .hWnd = 0
      .nMsgCountA = 0
      .nMsgCountB = 0
      Erase .aMsgTabelA, .aMsgTabelB
   End With

End Sub

Private Sub Subclass_Terminate()

Dim lngCount As Long

   For lngCount = UBound(SubclassData) To 0 Step -1
      If SubclassData(lngCount).hWnd Then Call Subclass_Stop(SubclassData(lngCount).hWnd)
   Next 'lngCount

End Sub

Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Returns/sets the background color used to display text and graphics in an object. (Only if Windows is not themed!)"

   BackColor = m_BackColor

End Property

Public Property Let BackColor(ByVal NewBackColor As OLE_COLOR)

   m_BackColor = NewBackColor
   PropertyChanged "BackColor"
   UserControl.BackColor = NewBackColor
   
   Call Refresh

End Property

Public Property Get Caption() As String
Attribute Caption.VB_Description = "Returns/sets the text displayed in an ThemedButton control."
Attribute Caption.VB_ProcData.VB_Invoke_Property = ";Appearance"
Attribute Caption.VB_UserMemId = -518
Attribute Caption.VB_MemberFlags = "200"

   Caption = m_Caption

End Property

Public Property Let Caption(ByVal NewCaption As String)

Dim intCount As Integer

   intCount = InStrRev(NewCaption, "&")
   AccessKeyPointer = 0
   
   Do While intCount
      If Mid(NewCaption, intCount, 2) = "&&" Then
         intCount = InStrRev(intCount - 1, NewCaption, "&")
         
      Else
         AccessKeyPointer = intCount + 1
         intCount = 0
      End If
   Loop
   
   If AccessKeyPointer Then AccessKeys = UCase(Mid(NewCaption, AccessKeyPointer, 1))
   
   m_Caption = NewCaption
   PropertyChanged "Caption"
   
   If (m_PictureAlign = Center) And Len(m_Caption) Then
      m_PictureAlign = TopCenter
      PropertyChanged "PictureAlign"
   End If
   
   Call GetPictureSize
   Call Refresh

End Property

Public Property Get CaptionAlign() As AlignmentConstants
Attribute CaptionAlign.VB_Description = "Returns/sets a alignment value for the caption of the ThemedButton control."

   CaptionAlign = m_CaptionAlign

End Property

Public Property Let CaptionAlign(ByVal NewCaptionAlign As AlignmentConstants)

   If NewCaptionAlign < vbLeftJustify Then NewCaptionAlign = vbLeftJustify
   If NewCaptionAlign > vbCenter Then NewCaptionAlign = vbCenter
   
   m_CaptionAlign = NewCaptionAlign
   PropertyChanged "CaptionAlign"
   
   Call Refresh

End Property

Public Property Get CaptionShadow() As Boolean
Attribute CaptionShadow.VB_Description = "Determines whether the caption will being displayed with a shadow."

   CaptionShadow = m_CaptionShadow

End Property

Public Property Let CaptionShadow(ByVal NewCaptionShadow As Boolean)

   m_CaptionShadow = NewCaptionShadow
   PropertyChanged "CaptionShadow"
   
   Call Refresh

End Property

Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Returns/sets a value that determines whether an object can respond to user-generated events."

   Enabled = UserControl.Enabled

End Property

Public Property Let Enabled(ByVal NewEnabled As Boolean)

   UserControl.Enabled = NewEnabled
   PropertyChanged "Enabled"
   
   If UserControl.Enabled Then ButtonState = BNS_UPNORMAL
   
   Call Refresh

End Property

Public Property Get Font() As StdFont
Attribute Font.VB_Description = "Returns a Font object."

   Set Font = UserControl.Font

End Property

Public Property Let Font(ByVal NewFont As StdFont)

   Set Font = NewFont

End Property

Public Property Set Font(ByVal NewFont As StdFont)

   Set UserControl.Font = NewFont
   PropertyChanged "Font"
   
   Call Refresh

End Property

Public Property Get ForeColor() As OLE_COLOR
Attribute ForeColor.VB_Description = "Returns/sets the foreground color used to display text and graphics in an object."

   ForeColor = m_ForeColor

End Property

Public Property Let ForeColor(ByVal NewForeColor As OLE_COLOR)

   m_ForeColor = NewForeColor
   PropertyChanged "ForeColor"
   
   Call Refresh

End Property

Public Property Get HoverColor() As OLE_COLOR
Attribute HoverColor.VB_Description = "Returns/sets the color used when the mouse is in an object. (Only if Windows is not themed!)"

   HoverColor = m_HoverColor

End Property

Public Property Let HoverColor(ByVal NewHoverColor As OLE_COLOR)

   m_HoverColor = NewHoverColor
   PropertyChanged "HoverColor"
   
   Call Refresh

End Property

Public Property Get MouseIcon() As StdPicture
Attribute MouseIcon.VB_Description = "Sets a custom mouse icon."

   Set MouseIcon = UserControl.MouseIcon

End Property

Public Property Let MouseIcon(ByRef NewMouseIcon As StdPicture)

   Set MouseIcon = NewMouseIcon

End Property

Public Property Set MouseIcon(ByRef NewMouseIcon As StdPicture)

   On Local Error GoTo ErrorProperty
   Set UserControl.MouseIcon = NewMouseIcon
   
   If Not NewMouseIcon Is Nothing Then
      MousePointer = vbCustom
      PropertyChanged "MouseIcon"
   End If
   
   GoTo ExitProperty

ErrorProperty:
   If Not Ambient.UserMode Then MsgBox "Error: #" & Err.Number & vbCrLf & Err.Description & vbCrLf & "Select .ico or .cur files only.", vbCritical + vbOKOnly, Extender.Name
   
ExitProperty:
   On Local Error GoTo 0

End Property

Public Property Get MousePointer() As MousePointerConstants
Attribute MousePointer.VB_Description = "Returns/sets the type of mouse pointer displayed when over part of an object."

   MousePointer = UserControl.MousePointer

End Property

Public Property Let MousePointer(ByVal NewMousePointer As MousePointerConstants)

   If NewMousePointer < vbDefault Then NewMousePointer = vbDefault
   If (NewMousePointer > vbSizeAll) And (NewMousePointer <> vbCustom) Then NewMousePointer = vbSizeAll
   
   UserControl.MousePointer = NewMousePointer
   PropertyChanged "MousePointer"

End Property

Public Property Get Picture() As StdPicture
Attribute Picture.VB_Description = "Returns/sets a graphic to be displayed in an ThemedButton control."

   Set Picture = m_Picture

End Property

Public Property Let Picture(ByRef NewPicture As StdPicture)

   Set Picture = NewPicture

End Property

Public Property Set Picture(ByRef NewPicture As StdPicture)

   Set m_Picture = NewPicture
   PropertyChanged "Picture"
   
   Call Refresh

End Property

Public Property Get PictureAlign() As PictureAlignConstants
Attribute PictureAlign.VB_Description = "Returns/sets a alignment value for the picture in relation to the caption and/or ThemedButton control."

   PictureAlign = m_PictureAlign

End Property

Public Property Let PictureAlign(ByVal NewPictureAlign As PictureAlignConstants)

   If NewPictureAlign < TopCenter Then NewPictureAlign = TopCenter
   If NewPictureAlign > BottomCenter Then NewPictureAlign = BottomCenter
   If (NewPictureAlign = Center) And Len(m_Caption) Then NewPictureAlign = TopCenter
   
   m_PictureAlign = NewPictureAlign
   PropertyChanged "PictureAlign"
   
   Call GetPictureSize
   Call Refresh

End Property

Public Property Get PictureSize() As PictureSizeConstants
Attribute PictureSize.VB_Description = "Returns/sets a size value for the picture."

   PictureSize = m_PictureSize

End Property

Public Property Let PictureSize(ByVal NewPictureSize As PictureSizeConstants)

   If NewPictureSize < ps16x16 Then NewPictureSize = ps16x16
   If NewPictureSize > ps64x64 Then NewPictureSize = ps64x64
   
   m_PictureSize = NewPictureSize
   PropertyChanged "PictureSize"
   
   Call GetPictureSize
   Call Refresh

End Property

Public Property Get ShowFocusRect() As Boolean
Attribute ShowFocusRect.VB_Description = "Determines whether a focus rectangle will being displayed."

   ShowFocusRect = m_ShowFocusRect

End Property

Public Property Let ShowFocusRect(ByVal NewShowFocusRect As Boolean)

   m_ShowFocusRect = NewShowFocusRect
   PropertyChanged "ShowFocusRect"
   
   Call Refresh

End Property

Public Function hWnd() As Long

   hWnd = UserControl.hWnd

End Function

Public Sub Refresh()

Const BNP_COMMANDBUTTON As Long = 1
Const BNS_UPDISABLED    As Long = 4
Const BDR_RAISED        As Long = &H5
Const BDR_SUNKEN        As Long = &HA
Const BF_RIGHT          As Long = &H4
Const BF_TOP            As Long = &H2
Const BF_LEFT           As Long = &H1
Const BF_BOTTOM         As Long = &H8
Const BF_RECT           As Long = (BF_LEFT Or BF_TOP Or BF_RIGHT Or BF_BOTTOM)

Dim lngBorder           As Long
Dim lngTheme            As Long

   With UserControl
      If Not .Enabled Then ButtonState = BNS_UPDISABLED
      
      With ButtonProperties
         Cls
         
         If IsThemed Then
            lngTheme = OpenThemeData(hWnd, StrPtr("Button"))
            DrawThemeBackground lngTheme, hDC, BNP_COMMANDBUTTON, ButtonState, .ButtonRect, .ButtonRect
            CloseThemeData lngTheme
            
         Else
            If ButtonState = BNS_UPPRESSED Then
               lngBorder = BDR_SUNKEN
               
            ' BNS_UPNORMAL, BNS_UPHOT or BNS_DOWNNORMAL
            Else
               lngBorder = BDR_RAISED
            End If
            
            DrawEdge hDC, .ButtonRect, lngBorder, BF_RECT
            
            If IsFocused Or Ambient.DisplayAsDefault Then Line (0, 0)-(ScaleWidth - 2, ScaleHeight - 2), vbBlack, B
         End If
         
         If Len(m_Caption) Then Call DrawCaption(.PictureSize + 5)
         If Not m_Picture Is Nothing Then Call DrawPicture(.PictureSize)
         
         If IsFocused And m_ShowFocusRect Then
            SetTextColor hDC, vbBlack
            DrawFocusRect hDC, .FocusRect
         End If
      End With
      
      .Refresh
   End With

End Sub

Private Function GetTheme() As Boolean

Const VER_PLATFORM_WIN32_NT As Long = 2

Dim lngLibrary              As Long
Dim osvInfo                 As OSVersionInfo
Dim strTheme                As String
Dim strName                 As String

   With osvInfo
      .OSVSize = Len(osvInfo)
      GetVersionEx osvInfo
      
      If .PlatformID = VER_PLATFORM_WIN32_NT Then
         If ((.dwVerMajor > 4) And .dwVerMinor) Or (.dwVerMajor > 5) Then
            IsThemedWindows = True
            lngLibrary = LoadLibrary("UXTheme")
            
            If lngLibrary Then
               strTheme = String(255, 0)
               GetCurrentThemeName StrPtr(strTheme), Len(strTheme), 0, 0, 0, 0
               strTheme = StripNull(strTheme)
               
               If Len(strTheme) Then
                  strName = String(255, 0)
                  GetThemeDocumentationProperty StrPtr(strTheme), StrPtr("ThemeName"), StrPtr(strName), Len(strName)
                  GetTheme = (StripNull(strName) <> "")
               End If
               
               FreeLibrary lngLibrary
            End If
         End If
      End If
   End With

End Function

Private Function IsFunctionSupported(ByVal sFunction As String, ByVal sModule As String) As Boolean

Dim lngModule As Long

   lngModule = GetModuleHandle(sModule)
   
   If lngModule = 0 Then lngModule = LoadLibrary(sModule)
   
   If lngModule Then
      IsFunctionSupported = GetProcAddress(lngModule, sFunction)
      FreeLibrary lngModule
   End If

End Function

Private Function StripNull(ByVal Text As String) As String

   StripNull = Split(Text, vbNullChar, 2)(0)

End Function

Private Function WordWrap(ByVal Caption As String, ByVal Width As Long) As String

Dim intNewLine As Integer
Dim intPointer As Integer

   If AccessKeyPointer Then Caption = Left(Caption, AccessKeyPointer - 2) & Mid(Caption, AccessKeyPointer)
   
   Do While TextWidth(Caption) > Width
      intNewLine = Len(Caption)
      
      Do
         intNewLine = InStrRev(Caption, " ", intNewLine) - 1
         
         If intNewLine < 1 Then
            intNewLine = Len(Caption)
            Exit Do
         End If
         
         If TextWidth(Left(Caption, intNewLine)) < Width - 1 Then Exit Do
      Loop
      
      WordWrap = WordWrap & Left(Caption, intNewLine) & vbCrLf
      Caption = Mid(Caption, intNewLine + 2)
   Loop
   
   WordWrap = WordWrap & Caption
   
   If AccessKeyPointer Then
      intPointer = AccessKeyPointer - 2
      
      If intPointer = 0 Then
         WordWrap = "&" & WordWrap
         
      Else
         For intNewLine = 1 To Len(WordWrap)
            If Mid(WordWrap, intNewLine, 2) = vbCrLf Then intPointer = intPointer + 2
            
            If intNewLine = intPointer Then
               WordWrap = Left(WordWrap, intNewLine) & "&" & Mid(WordWrap, intNewLine + 1)
               Exit For
            End If
         Next 'intPointer
      End If
   End If

End Function

Private Sub CheckIsDefault()

   If Not Ambient.UserMode Then
      If Ambient.DisplayAsDefault Then
         ButtonState = BNS_DOWNNORMAL
         
      Else
         ButtonState = BNS_UPNORMAL
      End If
      
      Call Refresh
   End If

End Sub

Private Sub DrawCaption(ByVal PictureSpace As Long)

Const DT_CALCRECT  As Long = &H400
Const DT_CENTER    As Long = &H1
Const DT_LEFT      As Long = &H0
Const DT_RIGHT     As Long = &H2
Const DT_WORDBREAK As Long = &H10
Const vbShadow     As Long = &HDCDCDC

Dim blnDown        As Boolean
Dim lngAlignment   As Long
Dim lngBottom      As Long
Dim lngRight       As Long
Dim rctCaption(1)  As Rect
Dim strCaption     As String

   With rctCaption(0)
      If Not m_Picture Is Nothing Then
         If (m_PictureAlign = TopCenter) Or (m_PictureAlign = BottomCenter) Then
            lngBottom = PictureSpace
            
         Else
            lngRight = PictureSpace
         End If
      End If
      
      .Right = ScaleWidth - 12 - lngRight
      .Bottom = ScaleHeight - 12 - lngBottom
      strCaption = WordWrap(m_Caption, .Right)
      OffsetRect rctCaption(0), 6, 6
      
      If IsThemedWindows Then
         DrawTextW hDC, StrPtr(strCaption), Len(strCaption), rctCaption(0), DT_CALCRECT Or DT_WORDBREAK
         
      Else
         DrawText hDC, strCaption, Len(strCaption), rctCaption(0), DT_CALCRECT Or DT_WORDBREAK
      End If
      
      lngRight = -lngRight   ' Picture = LeftAlign
      lngBottom = -lngBottom ' Picture = TopCenter
      OffsetRect rctCaption(0), (ScaleWidth - .Right - 6 - lngRight) / 2, (ScaleHeight - .Bottom - 6 - lngBottom) / 2
      blnDown = (ButtonState = BNS_UPPRESSED)
      .Top = .Top - blnDown
      .Bottom = .Bottom - blnDown
      .Left = 6 - blnDown
      .Right = ScaleWidth - 6 - blnDown
      
      If m_PictureAlign = BottomCenter Then
         .Top = .Top + lngBottom
         
      ElseIf m_PictureAlign = LeftAlign Then
         .Left = .Left - lngRight
         
      ElseIf m_PictureAlign = RightAlign Then
         .Right = .Right + lngRight
      End If
      
      If m_CaptionAlign = vbLeftJustify Then
         lngAlignment = DT_LEFT
         
      ElseIf m_CaptionAlign = vbRightJustify Then
         lngAlignment = DT_RIGHT
         
      ' vbCenter
      Else
         lngAlignment = DT_CENTER
      End If
      
      If UserControl.Enabled Then
         If m_CaptionShadow Then
            SetTextColor hDC, GetPixel(hDC, .Left, .Top) And vbShadow
            rctCaption(1).Top = .Top + 1
            rctCaption(1).Left = .Left + 1
            rctCaption(1).Right = .Right + 1
            rctCaption(1).Bottom = .Bottom + 1
            
            If IsThemedWindows Then
               DrawTextW hDC, StrPtr(strCaption), Len(strCaption), rctCaption(1), lngAlignment
               
            Else
               DrawText hDC, strCaption, Len(strCaption), rctCaption(1), lngAlignment
            End If
         End If
         
         SetTextColor hDC, m_ForeColor
         
      Else
         SetTextColor hDC, vbGrayText
      End If
      
      If IsThemedWindows Then
         DrawTextW hDC, StrPtr(strCaption), Len(strCaption), rctCaption(0), lngAlignment
         
      Else
         DrawText hDC, strCaption, Len(strCaption), rctCaption(0), lngAlignment
      End If
   End With
   
   CaptionRect = rctCaption(0)
   Erase rctCaption

End Sub

Private Sub DrawPicture(ByVal Size As Long)

Const DI_NORMAL     As Long = &H3
Const vbGray        As Long = &H808080
Const vbSrcReplace  As Long = &H220326
Const vbSrcGrayed   As Long = &HBEBABE
Const WHITENESS     As Long = &HFF0062

Dim blnDown         As Boolean
Dim lngBitmap       As Long
Dim lngBrush        As Long
Dim lngColor        As Long
Dim lngColorDC      As Long
Dim lngLeft         As Long
Dim lngMaskDC       As Long
Dim lngMemoryDC     As Long
Dim lngOldBackColor As Long
Dim lngOldBitmap    As Long
Dim lngOldBrush     As Long
Dim lngOldColor     As Long
Dim lngOldMemory    As Long
Dim lngOldObject    As Long
Dim lngSourceDC     As Long
Dim lngSourceWidth  As Long
Dim lngSourceHeight As Long
Dim lngTop          As Long
Dim rctPicture      As Rect

   With CaptionRect
      If m_Caption = "" Then
         .Top = Size + 14
         .Left = Size + 10
         .Right = ScaleWidth - Size - 9
         .Bottom = .Top + Size + 10
      End If
      
      lngLeft = (ScaleWidth - Size) \ 2
      blnDown = (ButtonState = BNS_UPPRESSED)
      
      If m_PictureAlign = TopCenter Then
         lngTop = (.Top - Size) \ 2
         lngLeft = lngLeft - blnDown
         
      ElseIf m_PictureAlign = BottomCenter Then
         lngTop = ScaleHeight - (.Bottom - .Top + Size) \ 2 - 2
         lngLeft = lngLeft - blnDown
         
      ' Center, LeftAlign or RightAlign
      Else
         lngTop = (ScaleHeight - Size) \ 2
         
         If m_PictureAlign = LeftAlign Then
            lngLeft = (.Left - Size) \ 2 + 2
            
         ElseIf m_PictureAlign = RightAlign Then
            lngLeft = .Right + (ScaleWidth - .Right - Size) \ 2 - 2
         End If
      End If
   End With
   
   lngTop = lngTop - blnDown
   
   If m_Picture.Type = vbPicTypeIcon Then
      DrawIconEx hDC, lngLeft, lngTop, m_Picture.Handle, Size, Size, 0, 0, DI_NORMAL
      
   Else
      lngSourceDC = CreateCompatibleDC(hDC)
      
      With m_Picture
         SelectObject lngSourceDC, .Handle
         lngSourceWidth = ScaleX(.Width, vbHimetric, vbPixels)
         lngSourceHeight = ScaleY(.Height, vbHimetric, vbPixels)
      End With
      
      lngColor = GetPixel(lngSourceDC, 0, 0)
      
      If lngColor < 0 Then lngColor = GetSysColor(lngColor And &HFF&)
      
      lngMaskDC = CreateCompatibleDC(hDC)
      lngMemoryDC = CreateCompatibleDC(hDC)
      lngColorDC = CreateCompatibleDC(hDC)
      lngOldColor = SelectObject(lngColorDC, CreateCompatibleBitmap(hDC, lngSourceWidth, lngSourceHeight))
      lngOldMemory = SelectObject(lngMemoryDC, CreateCompatibleBitmap(hDC, Size, Size))
      lngOldObject = SelectObject(lngMaskDC, CreateBitmap(lngSourceWidth, lngSourceHeight, 1, 1, ByVal 0&))
      SetMapMode lngMemoryDC, GetMapMode(hDC)
      SelectPalette lngMemoryDC, 0, True
      RealizePalette lngMemoryDC
      BitBlt lngMemoryDC, 0, 0, Size, Size, hDC, lngLeft, lngTop, vbSrcCopy
      SelectPalette lngColorDC, 0, True
      RealizePalette lngColorDC
      SetBkColor lngColorDC, GetBkColor(lngSourceDC)
      SetTextColor lngColorDC, GetTextColor(lngSourceDC)
      BitBlt lngColorDC, 0, 0, lngSourceWidth, lngSourceHeight, lngSourceDC, 0, 0, vbSrcCopy
      SetBkColor lngColorDC, lngColor
      SetTextColor lngColorDC, vbWhite
      BitBlt lngMaskDC, 0, 0, lngSourceWidth, lngSourceHeight, lngColorDC, 0, 0, vbSrcCopy
      SetBkColor lngColorDC, vbWhite
      SetTextColor lngColorDC, vbBlack
      BitBlt lngColorDC, 0, 0, lngSourceWidth, lngSourceHeight, lngMaskDC, 0, 0, vbSrcReplace
      StretchBlt lngMemoryDC, 0, 0, Size, Size, lngMaskDC, 0, 0, lngSourceWidth, lngSourceHeight, vbSrcAnd
      StretchBlt lngMemoryDC, 0, 0, Size, Size, lngColorDC, 0, 0, lngSourceWidth, lngSourceHeight, vbSrcPaint
      BitBlt hDC, lngLeft, lngTop, Size, Size, lngMemoryDC, 0, 0, vbSrcCopy
      DeleteObject SelectObject(lngColorDC, lngOldColor)
      DeleteObject SelectObject(lngMaskDC, lngOldObject)
      DeleteObject SelectObject(lngMemoryDC, lngOldMemory)
      DeleteDC lngMemoryDC
      DeleteDC lngMaskDC
      DeleteDC lngColorDC
      DeleteDC lngSourceDC
   End If
   
   If Not UserControl.Enabled Then
      lngMemoryDC = CreateCompatibleDC(hDC)
      lngBitmap = CreateCompatibleBitmap(hDC, Size, Size)
      lngOldBitmap = SelectObject(lngMemoryDC, lngBitmap)
      PatBlt lngMemoryDC, 0, 0, Size, Size, WHITENESS
      
      With rctPicture
         .Top = lngTop
         .Left = lngLeft
         .Right = Size
         .Bottom = Size
         OffsetRect rctPicture, -.Left, -.Top
      End With
      
      lngOldBackColor = SetBkColor(hDC, vbWhite)
      lngBrush = CreateSolidBrush(vbGray)
      lngOldBrush = SelectObject(hDC, lngBrush)
      BitBlt hDC, lngLeft, lngTop, Size, Size, lngMemoryDC, 0, 0, vbSrcGrayed
      SetBkColor hDC, lngOldBackColor
      SelectObject hDC, lngOldBrush
      SelectObject lngMemoryDC, lngOldBitmap
      DeleteObject lngBrush
      DeleteObject lngBitmap
      DeleteDC lngMemoryDC
   End If

End Sub

Private Sub GetPictureSize()

   ButtonProperties.PictureSize = 16 + 8 * (m_PictureSize + ((m_PictureSize - 2) And (m_PictureSize > 2)))

End Sub

Private Sub TrackMouseLeave(ByVal lhWnd As Long)

Const TME_LEAVE   As Long = &H2&

Dim tmeMouseTrack As TrackMouseEventStruct

   With tmeMouseTrack
      .cbSize = Len(tmeMouseTrack)
      .dwFlags = TME_LEAVE
      .hwndTrack = lhWnd
   End With
   
   If TrackUser32 Then
      TrackMouseEvent tmeMouseTrack
      
   Else
      TrackMouseEventComCtl tmeMouseTrack
   End If

End Sub

Private Sub UserControl_AccessKeyPress(KeyAscii As Integer)

   If (KeyAscii = vbKeyReturn) Or UCase(Chr(KeyAscii)) = AccessKeys Then
      MouseState.Button = vbLeftButton
      
      Call UserControl_GotFocus
      Call UserControl_Click
   End If
   
   MouseState.Button = vbDefault

End Sub

Private Sub UserControl_AmbientChanged(PropertyName As String)

   If PropertyName = "DisplayAsDefault" Then Call CheckIsDefault

End Sub

Private Sub UserControl_Click()

   Call Refresh
   
   DoEvents
   IsHit = True
   
   If MouseState.Button = vbLeftButton Then RaiseEvent Click

End Sub

Private Sub UserControl_DblClick()

   RaiseEvent DblClick

End Sub

Private Sub UserControl_GotFocus()

   IsFocused = True
   
   If Not MouseDown And Not InControl Then ButtonState = BNS_DOWNNORMAL
   
   Call Refresh

End Sub

Private Sub UserControl_Initialize()

   IsThemed = GetTheme

End Sub

Private Sub UserControl_InitProperties()

   m_CaptionAlign = vbCenter
   m_BackColor = vbButtonFace
   m_Caption = Ambient.DisplayName
   m_ForeColor = vbButtonText
   m_HoverColor = &HE0E0E0
   m_PictureSize = ps32x32
   m_ShowFocusRect = True
   ButtonState = BNS_UPNORMAL
   
   Call GetPictureSize

End Sub

Private Sub UserControl_KeyDown(KeyCode As Integer, Shift As Integer)

Const WM_KEYDOWN As Long = &H100
Const VK_DOWN    As Long = &H28
Const VK_LEFT    As Long = &H25
Const VK_RIGHT   As Long = &H27
Const VK_UP      As Long = &H26

Dim lngKey       As Long
Dim lngParam     As Long

   Select Case KeyCode
      Case vbKeyLeft, vbKeyRight, vbKeyUp, vbKeyDown
         Select Case KeyCode
            Case vbKeyLeft
               lngKey = VK_LEFT
               lngParam = &H4B0001
               
            Case vbKeyRight
               lngKey = VK_RIGHT
               lngParam = &H4D0001
               
            Case vbKeyUp
               lngKey = VK_UP
               lngParam = &H480001
               
            Case vbKeyDown
               lngKey = VK_DOWN
               lngParam = &H500001
         End Select
         
         KeyCode = 0
         PostMessage ContainerHwnd, WM_KEYDOWN, ByVal lngKey, ByVal lngParam
         
      Case vbKeySpace
         ButtonState = BNS_UPPRESSED
         SpaceKeyPressed = True
         
         Call Refresh
         
         RaiseEvent KeyDown(KeyCode, Shift)
   End Select

End Sub

Private Sub UserControl_KeyPress(KeyAscii As Integer)

   RaiseEvent KeyPress(KeyAscii)

End Sub

Private Sub UserControl_KeyUp(KeyCode As Integer, Shift As Integer)

   RaiseEvent KeyUp(KeyCode, Shift)
   
   If KeyCode = vbKeySpace Then
      ButtonState = BNS_UPHOT
      SpaceKeyPressed = False
      
      Call Refresh
      
      RaiseEvent Click
   End If

End Sub

Private Sub UserControl_LostFocus()

   If InControl Then
      ButtonState = BNS_UPHOT
      
   Else
      ButtonState = BNS_UPNORMAL
   End If
   
   IsFocused = False
   IsHit = False
   
   Call Refresh

End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

   With MouseState
      .Button = Button
      .Shift = Shift
      .x = x
      .y = y
   End With
   
   RaiseEvent MouseDown(Button, Shift, x, y)

End Sub

Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)

   If SpaceKeyPressed Then Exit Sub
   
   With ButtonProperties.ButtonRect
      If InControl Then
         If (x < .Left + 1) Or (x > .Right - 1) Or (y < .Top - 1) Or (y > .Bottom - 1) Then
            InControl = False
            ButtonState = BNS_UPHOT
            
         ElseIf MouseDown Then
            ButtonState = BNS_UPPRESSED
            
         Else
            ButtonState = BNS_UPHOT
         End If
         
      ElseIf (x > .Left) And (x < .Right) And (y > .Top) And (y < .Bottom) Then
         InControl = True
      End If
   End With
   
   Call Refresh

End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)

   RaiseEvent MouseUp(Button, Shift, x, y)

End Sub

Private Sub UserControl_OLECompleteDrag(Effect As Long)

   RaiseEvent OLECompleteDrag(Effect)

End Sub

Private Sub UserControl_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)

   RaiseEvent OLEDragDrop(Data, Effect, Button, Shift, x, y)

End Sub

Private Sub UserControl_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single, State As Integer)

   RaiseEvent OLEDragOver(Data, Effect, Button, Shift, x, y, State)

End Sub

Private Sub UserControl_OLEGiveFeedback(Effect As Long, DefaultCursors As Boolean)

   RaiseEvent OLEGiveFeedback(Effect, DefaultCursors)

End Sub

Private Sub UserControl_OLESetData(Data As DataObject, DataFormat As Integer)

   RaiseEvent OLESetData(Data, DataFormat)

End Sub

Private Sub UserControl_OLEStartDrag(Data As DataObject, AllowedEffects As Long)

   RaiseEvent OLEStartDrag(Data, AllowedEffects)

End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)

   With PropBag
      m_BackColor = .ReadProperty("BackColor", vbButtonFace)
      m_Caption = .ReadProperty("Caption", Ambient.DisplayName)
      m_CaptionAlign = .ReadProperty("CaptionAlign", vbCenter)
      m_CaptionShadow = .ReadProperty("CaptionShadow", False)
      UserControl.Enabled = .ReadProperty("Enabled", True)
      Set UserControl.Font = .ReadProperty("Font", UserControl.Font)
      m_ForeColor = .ReadProperty("ForeColor", vbButtonText)
      m_HoverColor = .ReadProperty("HoverColor", &HE0E0E0)
      MouseIcon = .ReadProperty("MouseIcon", Nothing)
      Me.MousePointer = .ReadProperty("MousePointer", vbDefault)
      Set m_Picture = .ReadProperty("Picture", Nothing)
      m_PictureAlign = .ReadProperty("PictureAlign", TopCenter)
      m_PictureSize = .ReadProperty("PictureSize", ps32x32)
      m_ShowFocusRect = .ReadProperty("ShowFocusRect", True)
      ButtonState = BNS_UPNORMAL
      UserControl.BackColor = m_BackColor
      Me.Caption = m_Caption
   End With
   
   Call GetPictureSize
   Call Refresh
   
   If Ambient.UserMode Then
      IsThemed = GetTheme
      TrackUser32 = IsFunctionSupported("TrackMouseEvent", "User32")
      
      If Not TrackUser32 Then IsFunctionSupported "_TrackMouseEvent", "ComCtl32"
      
      With UserControl
         Call Subclass_Initialize(.hWnd)
         Call Subclass_AddMsg(.hWnd, WM_LBUTTONDBLCLK, MSG_BEFORE)
         Call Subclass_AddMsg(.hWnd, WM_LBUTTONDOWN, MSG_BEFORE)
         Call Subclass_AddMsg(.hWnd, WM_LBUTTONUP, MSG_BEFORE)
         Call Subclass_AddMsg(.hWnd, WM_MOUSELEAVE)
         Call Subclass_AddMsg(.hWnd, WM_MOUSEMOVE)
         
         If IsThemedWindows Then Call Subclass_AddMsg(.hWnd, WM_THEMECHANGED)
      End With
   End If

End Sub

Private Sub UserControl_Resize()

Static blnBusy As Boolean

   If blnBusy Then Exit Sub
   
   blnBusy = True
   
   If Width / Screen.TwipsPerPixelX < 7 Then Width = 7 * Screen.TwipsPerPixelX
   If Height / Screen.TwipsPerPixelY < 16 Then Height = 16 * Screen.TwipsPerPixelY
   
   With ButtonProperties.ButtonRect
      .Right = ScaleWidth
      .Bottom = ScaleHeight
   End With
   
   With ButtonProperties.FocusRect
      .Top = 5
      .Left = 5
      .Right = ScaleWidth - 5
      .Bottom = ScaleHeight - 5
   End With
   
   Call Refresh
   
   blnBusy = False

End Sub

Private Sub UserControl_Show()

   Call CheckIsDefault

End Sub

Private Sub UserControl_Terminate()

   On Local Error GoTo ExitSub
   
   Call Subclass_Terminate
   
ExitSub:
   On Local Error GoTo 0
   Set m_Picture = Nothing

End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)

   With PropBag
      .WriteProperty "BackColor", m_BackColor, vbButtonFace
      .WriteProperty "Caption", m_Caption, Ambient.DisplayName
      .WriteProperty "CaptionAlign", m_CaptionAlign, vbCenter
      .WriteProperty "CaptionShadow", m_CaptionShadow, False
      .WriteProperty "Enabled", UserControl.Enabled, True
      .WriteProperty "Font", UserControl.Font
      .WriteProperty "ForeColor", m_ForeColor, vbButtonText
      .WriteProperty "HoverColor", m_HoverColor, &HE0E0E0
      .WriteProperty "MouseIcon", UserControl.MouseIcon, Nothing
      .WriteProperty "MousePointer", UserControl.MousePointer, vbDefault
      .WriteProperty "Picture", m_Picture, Nothing
      .WriteProperty "PictureAlign", m_PictureAlign, TopCenter
      .WriteProperty "PictureSize", m_PictureSize, ps32x32
      .WriteProperty "ShowFocusRect", m_ShowFocusRect, True
   End With

End Sub
