VERSION 5.00
Begin VB.UserControl ScrollControl 
   Alignable       =   -1  'True
   Appearance      =   0  'Flat
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ControlContainer=   -1  'True
   MaskPicture     =   "ScrollControl.ctx":0000
   MouseIcon       =   "ScrollControl.ctx":0152
   ScaleHeight     =   240
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   320
   ToolboxBitmap   =   "ScrollControl.ctx":02A4
End
Attribute VB_Name = "ScrollControl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' ------------------------------------------------------
' Autor:    Leandro I. Ascierto
' Web:      www.leandroascierto.com.ar
' Fecha:    21 de Marzo de 2010
'
' History:  06/09/2010  - Se implemento Algunas propiedades y eventos,
'                       - La posibilidad de poder asignar los valores manualmente Max Min y Pos mediante propiedades.
' ------------------------------------------------------

Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Function SetWindowLong Lib "user32.dll" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function CallWindowProc Lib "user32.dll" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function GetModuleHandle Lib "kernel32.dll" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32.dll" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function VirtualAlloc Lib "kernel32.dll" (ByRef lpAddress As Long, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As Long
Private Declare Function VirtualFree Lib "kernel32.dll" (ByRef lpAddress As Long, ByVal dwSize As Long, ByVal dwFreeType As Long) As Long
Private Declare Function SetScrollInfo Lib "user32" (ByVal hwnd As Long, ByVal n As Long, lpcScrollInfo As SCROLLINFO, ByVal bool As Boolean) As Long
Private Declare Function GetScrollInfo Lib "user32" (ByVal hwnd As Long, ByVal n As Long, lpScrollInfo As SCROLLINFO) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function ScrollWindowByNum& Lib "user32" Alias "ScrollWindow" (ByVal hwnd As Long, ByVal XAmount As Long, ByVal YAmount As Long, ByVal lpRect As Long, ByVal lpClipRect As Long)
Private Declare Function GetWindowDC Lib "user32.dll" (ByVal hwnd As Long) As Long
Private Declare Function ReleaseDC Lib "user32.dll" (ByVal hwnd As Long, ByVal hdc As Long) As Long
Private Declare Function GetWindowRect& Lib "user32" (ByVal hwnd As Long, lpRect As RECT)
Private Declare Function ExcludeClipRect Lib "gdi32.dll" (ByVal hdc As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long) As Long
Private Declare Function DrawThemeBackGround Lib "uxtheme.dll" Alias "DrawThemeBackground" (ByVal hTheme As Long, ByVal lhdc As Long, ByVal iPartId As Long, ByVal iStateId As Long, pRect As RECT, pClipRect As RECT) As Long
Private Declare Function OpenThemeData Lib "uxtheme.dll" (ByVal hwnd As Long, ByVal pszClassList As Long) As Long
Private Declare Function CloseThemeData Lib "uxtheme.dll" (ByVal hTheme As Long) As Long
Private Declare Function GetSystemMetrics Lib "user32.dll" (ByVal nIndex As Long) As Long
Private Declare Function GetFocus Lib "user32.dll" () As Long
Private Declare Function GetParent Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function IsChild Lib "user32.dll" (ByVal hWndParent As Long, ByVal hwnd As Long) As Long
Private Declare Function GetClientRect Lib "user32.dll" (ByVal hwnd As Long, ByRef lpRect As RECT) As Long
Private Declare Function ClientToScreen Lib "user32.dll" (ByVal hwnd As Long, ByRef lpPoint As POINTAPI) As Long
Private Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Private Declare Function SetCursor Lib "user32.dll" (ByVal hCursor As Long) As Long

Private Type POINTAPI
    X               As Long
    Y               As Long
End Type

Private Type SCROLLINFO
    cbSize          As Long
    fMask           As Long
    nMin            As Long
    nMax            As Long
    nPage           As Long
    nPos            As Long
    nTrackPos       As Long
End Type

Private Type RECT
    Left            As Long
    Top             As Long
    Right           As Long
    Bottom          As Long
End Type

Private Const MEM_COMMIT                As Long = &H1000
Private Const PAGE_EXECUTE_READWRITE    As Long = &H40
Private Const MEM_RELEASE               As Long = &H8000&

Private Const WM_MOUSEWHEEL             As Long = &H20A
Private Const WM_VSCROLL                As Long = &H115
Private Const WM_HSCROLL                As Long = &H114
Private Const WM_NCPAINT                As Long = &H85
Private Const WM_DESTROY                As Long = &H2
Private Const WM_NCCALCSIZE             As Long = &H83

Private Const GWL_WNDPROC               As Long = -4
Private Const GWL_STYLE                 As Long = (-16)

Private Const WS_VSCROLL                As Long = &H200000
Private Const WS_HSCROLL                As Long = &H100000

Private Const GW_CHILD                  As Long = 5
Private Const GW_HWNDNEXT               As Long = 2

Private Const SB_HORZ                   As Long = 0
Private Const SB_VERT                   As Long = 1
Private Const SB_BOTH                   As Long = 3
Private Const SB_LINEDOWN               As Long = 1
Private Const SB_LINEUP                 As Long = 0
Private Const SB_PAGEDOWN               As Long = 3
Private Const SB_PAGEUP                 As Long = 2
Private Const SB_THUMBTRACK             As Long = 5
Private Const SB_ENDSCROLL              As Long = 8
Private Const SB_LEFT                   As Long = 6
Private Const SB_RIGHT                  As Long = 7

Private Const SIF_ALL                   As Long = &H17

Private Const SM_CYBORDER               As Long = 6

Public Enum EnuBorderStyle
    vbBSNone
    vbFixedSingle
End Enum

Public Event Resize()
Public Event Scroll()
Public Event Paint()

Private SI                              As SCROLLINFO
Private pASMWrapper                     As Long
Private PrevWndProc                     As Long
Private hSubclassedWnd                  As Long
Private mBorderSize                     As Long
Private OldPosH                         As Long
Private OldPosV                         As Long
Private m_hFocus                        As Long
Private m_AutoScrollToFocus             As Boolean
Private m_UseHandsCursor                As Boolean
Private m_HScrollVisible                As Boolean
Private m_VScrollVisible                As Boolean
Private m_AutoScroll                    As Boolean

Public Function WindowProc(ByVal hwnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    
    WindowProc = CallWindowProc(PrevWndProc, hwnd, uMsg, wParam, lParam)
    
    Select Case uMsg
        
        Case WM_DESTROY
            Call StopSubclassing

        Case WM_VSCROLL, WM_HSCROLL
        
            Dim xScroll As Long
            
            xScroll = IIf(uMsg = WM_VSCROLL, SB_VERT, SB_HORZ)
            
            GetScrollInfo hwnd, xScroll, SI

            Select Case GetLoWord(wParam)
                Case SB_LINEDOWN
                    SI.nPos = SI.nPos + 10
                Case SB_LINEUP
                    SI.nPos = SI.nPos - 10
                Case SB_PAGEDOWN
                    SI.nPos = SI.nPos + SI.nPage
                Case SB_PAGEUP
                    SI.nPos = SI.nPos - SI.nPage
                Case SB_THUMBTRACK
                    SI.nPos = GetHiWord(wParam)
                Case SB_ENDSCROLL
                    '
                Case SB_LEFT
                    SI.nPos = SI.nMin
                Case SB_RIGHT
                    SI.nPos = SI.nMax
            End Select
            
            SetScrollInfo hwnd, xScroll, SI, True
            
            
            If m_AutoScroll Then
                GetScrollInfo hwnd, xScroll, SI
            
                If uMsg = WM_VSCROLL Then
                    ScrollVerticalWindow -SI.nPos
                Else
                    ScrollHorizontalWindow -SI.nPos
                End If
            End If
            
            RaiseEvent Scroll
            
        Case WM_MOUSEWHEEL
        
            If Me.IsVerticalVisible Then
                xScroll = SB_VERT
            Else
                If Me.IsHorizontalVisible Then
                    xScroll = SB_HORZ
                Else
                    Exit Function
                End If
            End If
            
            GetScrollInfo hwnd, xScroll, SI
            
            If SI.nPage = 0 Then Exit Function
            
            If wParam < 0 Then
                SI.nPos = SI.nPos + 10
            Else
                SI.nPos = SI.nPos - 10
            End If
            
            SetScrollInfo hwnd, xScroll, SI, True
            
                
            If m_AutoScroll Then
            
                GetScrollInfo hwnd, xScroll, SI
                
                If xScroll = SB_VERT Then
                    ScrollVerticalWindow -SI.nPos
                Else
                    ScrollHorizontalWindow -SI.nPos
                End If
                
            End If
            
            RaiseEvent Scroll
            
        Case WM_NCPAINT
        
            If UserControl.BorderStyle = vbFixedSingle Then
                Dim Rec As RECT
                Dim ClipRec As RECT
                Dim hTheme  As Long
                Dim DC As Long
                
                DC = GetWindowDC(UserControl.hwnd)

                GetWindowRect UserControl.hwnd, Rec
                
                Rec.Right = Rec.Right - Rec.Left
                Rec.Bottom = Rec.Bottom - Rec.Top
                Rec.Left = 0
                Rec.Top = 0
                           
                hTheme = OpenThemeData(UserControl.hwnd, StrPtr("Edit"))
                If hTheme Then
                    ExcludeClipRect DC, mBorderSize, mBorderSize, Rec.Right - mBorderSize, Rec.Bottom - mBorderSize
                    If DrawThemeBackGround(hTheme, DC, 0, 0, Rec, Rec) = 0 Then
                    End If
                    Call CloseThemeData(hTheme)
                End If
               
                ReleaseDC hwnd, DC
              
            End If
            
        Case Else

            On Error Resume Next
            
            Dim hFocus As Long
            
            If m_AutoScrollToFocus = False Then Exit Function
            
            hFocus = GetFocus

            If Not hFocus = m_hFocus Then
            
                If IsChildOfMe(hFocus) Then
                
                    m_hFocus = hFocus
                    
                    Call GetChildRectOfMe(hFocus, Rec)
                    
                    GetScrollInfo UserControl.hwnd, SB_VERT, SI
 
                    If Rec.Bottom > SI.nPos + SI.nPage Then
                        SI.nPos = Rec.Bottom - SI.nPage
                    Else
                        If Rec.Top < SI.nPos Then
                            SI.nPos = Rec.Top
                        End If
                    End If
                    
                    SetScrollInfo UserControl.hwnd, SB_VERT, SI, True
                    
                    '----------
                    GetScrollInfo UserControl.hwnd, SB_HORZ, SI

                    If Rec.Right > SI.nPos + SI.nPage Then
                        SI.nPos = Rec.Right - SI.nPage
                    Else
                        If Rec.Left < SI.nPos Then
                            SI.nPos = Rec.Left
                        End If
                    End If
                    
                    SetScrollInfo UserControl.hwnd, SB_HORZ, SI, True
                    
                    If m_AutoScroll Then CheckScroll
                    
                    RaiseEvent Scroll
                End If
          End If

    End Select

End Function

Public Property Get hdc() As Long
    hdc = UserControl.hdc
End Property

Public Property Get BackColor() As OLE_COLOR
    BackColor = UserControl.BackColor
End Property

Public Property Let BackColor(ByVal NewValue As OLE_COLOR)
    UserControl.BackColor = NewValue
    PropertyChanged "BackColor"
End Property

Public Property Get BorderStyle() As EnuBorderStyle
    BorderStyle = UserControl.BorderStyle
End Property

Public Property Let BorderStyle(ByVal NewValue As EnuBorderStyle)
    UserControl.BorderStyle = NewValue
    PropertyChanged "BorderStyle"
End Property


Public Property Get AutoScrollToFocus() As Boolean
    AutoScrollToFocus = m_AutoScrollToFocus
End Property

Public Property Let AutoScrollToFocus(ByVal NewValue As Boolean)
    m_AutoScrollToFocus = NewValue
    PropertyChanged "AutoScrollToFocus"
End Property

Public Property Get AutoScroll() As Boolean
    AutoScroll = m_AutoScroll
End Property

Public Property Let AutoScroll(ByVal NewValue As Boolean)
    m_AutoScroll = NewValue
    PropertyChanged "AutoScroll"
End Property

Public Property Get UseHandsCursor() As Boolean
    UseHandsCursor = m_UseHandsCursor
End Property

Public Property Let UseHandsCursor(ByVal NewValue As Boolean)
    m_UseHandsCursor = NewValue
    PropertyChanged "UseHandsCursor"
End Property

Public Property Get Enabled() As Boolean
    Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal Value As Boolean)
    UserControl.Enabled = Value
    PropertyChanged "Enabled"
End Property

Public Property Get MaxVertical() As Long
    GetScrollInfo UserControl.hwnd, SB_VERT, SI
    MaxVertical = SI.nMax
End Property

Public Property Let MaxVertical(ByVal Value As Long)
    GetScrollInfo UserControl.hwnd, SB_VERT, SI
    SI.nMax = Value
    SI.nPage = UserControl.ScaleHeight
    SetScrollInfo UserControl.hwnd, SB_VERT, SI, True
    
    
    If SI.nMax >= UserControl.ScaleHeight Then
        If Not m_VScrollVisible Then
            m_VScrollVisible = True
            SetWindowPos UserControl.hwnd, 0, 0, 0, 0, 0, 551
            RaiseEvent Resize
        End If
    Else
        If m_VScrollVisible Then
            m_VScrollVisible = False
            SetWindowPos UserControl.hwnd, 0, 0, 0, 0, 0, 551
            RaiseEvent Resize
        End If
    End If
    
End Property

Public Property Get MaxHorizontal() As Long
    GetScrollInfo UserControl.hwnd, SB_HORZ, SI
    MaxHorizontal = SI.nMax
End Property

Public Property Let MaxHorizontal(ByVal Value As Long)
    GetScrollInfo UserControl.hwnd, SB_HORZ, SI
    SI.nMax = Value
    SI.nPage = UserControl.ScaleWidth
    SetScrollInfo UserControl.hwnd, SB_HORZ, SI, True
    
    If SI.nMax >= UserControl.ScaleWidth Then
        If Not m_HScrollVisible Then
            m_HScrollVisible = True
            SetWindowPos UserControl.hwnd, 0, 0, 0, 0, 0, 551
            RaiseEvent Resize
        End If
    Else
        If m_HScrollVisible Then
            m_HScrollVisible = False
            SetWindowPos UserControl.hwnd, 0, 0, 0, 0, 0, 551
            RaiseEvent Resize
        End If
    End If
End Property

Public Property Get MinVertical() As Long
    GetScrollInfo UserControl.hwnd, SB_VERT, SI
    MinVertical = SI.nMin
End Property

Public Property Let MinVertical(ByVal Value As Long)
    GetScrollInfo UserControl.hwnd, SB_VERT, SI
    SI.nMin = Value
    SI.nPage = UserControl.ScaleHeight
    SetScrollInfo UserControl.hwnd, SB_VERT, SI, True
    SetWindowPos UserControl.hwnd, 0, 0, 0, 0, 0, 551
End Property

Public Property Get MinHorizontal() As Long
    GetScrollInfo UserControl.hwnd, SB_HORZ, SI
    MinHorizontal = SI.nMin
End Property

Public Property Let MinHorizontal(ByVal Value As Long)
    GetScrollInfo UserControl.hwnd, SB_HORZ, SI
    SI.nMin = Value
    SI.nPage = UserControl.ScaleWidth
    SetScrollInfo UserControl.hwnd, SB_HORZ, SI, True
    SetWindowPos UserControl.hwnd, 0, 0, 0, 0, 0, 551
End Property

Public Property Get PosHorizontal() As Long
    GetScrollInfo UserControl.hwnd, SB_HORZ, SI
    PosHorizontal = SI.nPos
End Property

Public Property Let PosHorizontal(ByVal Value As Long)
    GetScrollInfo UserControl.hwnd, SB_HORZ, SI
    SI.nPos = Value
    SI.nPage = UserControl.ScaleWidth
    SetScrollInfo UserControl.hwnd, SB_HORZ, SI, True
    RaiseEvent Scroll
End Property

Public Property Get PosVertical() As Long
    GetScrollInfo UserControl.hwnd, SB_VERT, SI
    PosVertical = SI.nPos
End Property

Public Property Let PosVertical(ByVal Value As Long)
    GetScrollInfo UserControl.hwnd, SB_VERT, SI
    SI.nPos = Value
    SI.nPage = UserControl.ScaleHeight
    SetScrollInfo UserControl.hwnd, SB_VERT, SI, True
    RaiseEvent Scroll
End Property

Public Property Get IsVerticalVisible() As Boolean
    GetScrollInfo UserControl.hwnd, SB_VERT, SI
    IsVerticalVisible = (SI.nMax - SI.nMin) >= SI.nPage
End Property

Public Property Get IsHorizontalVisible() As Boolean
    GetScrollInfo UserControl.hwnd, SB_HORZ, SI
    IsHorizontalVisible = (SI.nMax - SI.nMin) >= SI.nPage
End Property

Public Property Get AutoRedraw() As Boolean
    AutoRedraw = UserControl.AutoRedraw
End Property

Public Property Let AutoRedraw(ByVal Value As Boolean)
    UserControl.AutoRedraw = Value
    PropertyChanged "AutoRedraw"
End Property

Public Property Get ScaleWidth() As Long
    ScaleWidth = UserControl.ScaleWidth
End Property

Public Property Get ScaleHeight() As Long
    ScaleHeight = UserControl.ScaleHeight
End Property

Public Sub Refresh()
    UserControl.Refresh
End Sub

Public Sub Cls()
    UserControl.Cls
End Sub

Private Sub UserControl_Paint()
    RaiseEvent Paint
End Sub

Private Sub UserControl_InitProperties()
    m_AutoScrollToFocus = True
    m_UseHandsCursor = True
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If m_UseHandsCursor And Button = 1 Then
        If m_VScrollVisible Or m_HScrollVisible Then
            SetCursor UserControl.MaskPicture
        End If
    End If
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If m_UseHandsCursor And Button = 1 Then
        If m_VScrollVisible Or m_HScrollVisible Then
            SetCursor UserControl.MouseIcon
        End If
    End If
End Sub


Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Static mY As Single
    Static mX As Single
    
    If m_UseHandsCursor = False Then Exit Sub
    
    If Button = 1 Then
        If m_VScrollVisible Then
            GetScrollInfo UserControl.hwnd, SB_VERT, SI
        
            SI.nPos = -(Y - mY)
        
            SetScrollInfo UserControl.hwnd, SB_VERT, SI, True
            
            If m_AutoScroll Then
                GetScrollInfo UserControl.hwnd, SB_VERT, SI
                ScrollVerticalWindow -SI.nPos
            End If
            
            RaiseEvent Scroll
        End If
        
        If m_HScrollVisible Then
            GetScrollInfo UserControl.hwnd, SB_HORZ, SI
            
            SI.nPos = -(X - mX)
        
            SetScrollInfo UserControl.hwnd, SB_HORZ, SI, True
            
            If m_AutoScroll Then
                GetScrollInfo UserControl.hwnd, SB_HORZ, SI
                ScrollHorizontalWindow -SI.nPos
            End If
            
            RaiseEvent Scroll
        End If
        
    Else
        If m_VScrollVisible Then
            GetScrollInfo UserControl.hwnd, SB_VERT, SI
            mY = Y + SI.nPos
        End If
        
        If m_HScrollVisible Then
            GetScrollInfo UserControl.hwnd, SB_HORZ, SI
            mX = X + SI.nPos
        End If
        
    End If
    
    If m_VScrollVisible Or m_HScrollVisible Then
        If Button = 1 Then
            SetCursor UserControl.MaskPicture
        Else
            If Button = 0 Then SetCursor UserControl.MouseIcon
        End If
    End If

End Sub



Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    With PropBag
        Me.BackColor = .ReadProperty("BackColor", vbButtonFace)
        Me.BorderStyle = .ReadProperty("BorderStyle", vbFixedSingle)
        m_AutoScrollToFocus = .ReadProperty("AutoScrollToFocus", True)
        m_UseHandsCursor = .ReadProperty("UseHandsCursor", True)
        Me.Enabled = .ReadProperty("Enabled", True)
        Me.AutoRedraw = .ReadProperty("AutoRedraw", False)
        Me.AutoScroll = .ReadProperty("AutoScroll", False)
    End With

    If Ambient.UserMode Then
        SetSubclassing UserControl.hwnd
    End If
End Sub

Private Sub UserControl_Resize()
   GetScrollInfo UserControl.hwnd, SB_VERT, SI
   SI.nPage = UserControl.ScaleHeight
   SetScrollInfo UserControl.hwnd, SB_VERT, SI, True

   GetScrollInfo UserControl.hwnd, SB_HORZ, SI
   SI.nPage = UserControl.ScaleWidth
   SetScrollInfo UserControl.hwnd, SB_HORZ, SI, True

   If m_AutoScroll Then CheckScroll
   
   RaiseEvent Resize
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    With PropBag
        .WriteProperty "BackColor", UserControl.BackColor, vbButtonFace
        .WriteProperty "BorderStyle", UserControl.BorderStyle, vbFixedSingle
        .WriteProperty "AutoScrollToFocus", m_AutoScrollToFocus, True
        .WriteProperty "UseHandsCursor", m_UseHandsCursor, True
        .WriteProperty "Enabled", UserControl.Enabled, True
        .WriteProperty "AutoRedraw", UserControl.AutoRedraw, False
        .WriteProperty "AutoScroll", m_AutoScroll, False
    End With
End Sub


Private Function GetChildRectOfMe(hwnd As Long, ByRef SrcRect As RECT)
    Dim PT As POINTAPI
    
    ClientToScreen UserControl.hwnd, PT
    Call GetWindowRect(hwnd, SrcRect)
    
    With SrcRect
        .Left = .Left - PT.X - OldPosH
        .Top = .Top - PT.Y - OldPosV
        .Right = .Right - PT.X - OldPosH
        .Bottom = .Bottom - PT.Y - OldPosV
    End With

End Function


Private Function IsChildOfMe(hwnd As Long) As Boolean
    Dim hParent As Long
    
    hParent = GetParent(hwnd)
    
    Do While hParent <> 0
        If hParent = UserControl.hwnd Then
            IsChildOfMe = True
            Exit Do
        End If
        hParent = GetParent(hParent)
    Loop
End Function


' ActiveVB
Private Function SetSubclassing(ByVal hwnd As Long) As Boolean

    'Setzt Subclassing, sofern nicht schon gesetzt
    
    If PrevWndProc = 0 Then
        If pASMWrapper <> 0 Then
            PrevWndProc = SetWindowLong(hwnd, GWL_WNDPROC, pASMWrapper)
            If PrevWndProc <> 0 Then
                hSubclassedWnd = hwnd
                SetSubclassing = True
            End If
        End If
    End If

End Function

' ActiveVB
Private Function StopSubclassing() As Boolean

    'Stopt Subclassing, sofern gesetzt

    If hSubclassedWnd <> 0 Then
        If PrevWndProc <> 0 Then
            Call SetWindowLong(hSubclassedWnd, GWL_WNDPROC, PrevWndProc)
            hSubclassedWnd = 0
            PrevWndProc = 0
            StopSubclassing = True
        End If
    End If

End Function


Private Sub UserControl_Initialize()

    Dim ASM(0 To 104) As Byte
    Dim pVar As Long
    Dim ThisClass As Long
    Dim CallbackFunction As Long
    Dim pVirtualFree
    Dim sCode As String
    Dim i As Long
        
    SI.cbSize = Len(SI)
    SI.fMask = SIF_ALL
    
    mBorderSize = GetSystemMetrics(SM_CYBORDER)

    pASMWrapper = VirtualAlloc(ByVal 0&, 104, MEM_COMMIT, PAGE_EXECUTE_READWRITE)
    If pASMWrapper <> 0 Then
    

        ThisClass = ObjPtr(Me)
        Call CopyMemory(pVar, ByVal ThisClass, 4)
        Call CopyMemory(CallbackFunction, ByVal (pVar + 1956), 4)

        pVirtualFree = GetProcAddress(GetModuleHandle("kernel32.dll"), "VirtualFree")
        
        sCode = "90FF05000000006A0054FF742418FF742418FF742418FF7424186800000000B800000000FFD0FF0D00000000A10000000085C075" & _
                "0458C21000A10000000085C0740458C2100058595858585868008000006A00680000000051B800000000FFE00000000000000000"
                
        For i = 0 To Len(sCode) - 1 Step 2
            ASM(i / 2) = CByte("&h" & Mid$(sCode, i + 1, 2))
        Next
        
        
        Call CopyMemory(ASM(3), pASMWrapper + 96, 4)
        Call CopyMemory(ASM(40), pASMWrapper + 96, 4)
        Call CopyMemory(ASM(58), pASMWrapper + 96, 4)
        Call CopyMemory(ASM(45), pASMWrapper + 100, 4)
        Call CopyMemory(ASM(84), pASMWrapper, 4)
        Call CopyMemory(ASM(27), ThisClass, 4)
        Call CopyMemory(ASM(32), CallbackFunction, 4)
        Call CopyMemory(ASM(90), pVirtualFree, 4)
        Call CopyMemory(ByVal pASMWrapper, ASM(0), 104)
        

                
    End If
End Sub

Public Sub RefreshScroll()
    m_hFocus = 0
    CheckScroll
    UserControl_Resize
End Sub

Private Sub CheckScroll()
    On Error Resume Next
    
    Dim bWnd As Long
    Dim Rec As RECT
    Dim mRec As RECT

    bWnd = GetWindow(UserControl.hwnd, GW_CHILD)
    Do While bWnd <> 0
    
        Call GetChildRectOfMe(bWnd, Rec)
        
        If Rec.Left < mRec.Left Then mRec.Left = Rec.Left
        If Rec.Top < mRec.Top Then mRec.Top = Rec.Top
        If Rec.Right > mRec.Right Then mRec.Right = Rec.Right
        If Rec.Bottom > mRec.Bottom Then mRec.Bottom = Rec.Bottom
        
        bWnd = GetWindow(bWnd, GW_HWNDNEXT)
    Loop
      
    If mRec.Bottom + Abs(mRec.Top) > UserControl.ScaleHeight Or (mRec.Top < 0) Then
        GetScrollInfo UserControl.hwnd, SB_VERT, SI
        SI.nMin = mRec.Top
        SI.nMax = mRec.Bottom
        SI.nPage = UserControl.ScaleHeight
        SetScrollInfo UserControl.hwnd, SB_VERT, SI, True
        GetScrollInfo UserControl.hwnd, SB_VERT, SI
        ScrollVerticalWindow -SI.nPos
        m_VScrollVisible = True
    Else
        SI.nPos = 0
        SI.nPage = 0
        SI.nMax = 0
        SI.nMin = 0
        SetScrollInfo UserControl.hwnd, SB_VERT, SI, True
        ScrollVerticalWindow 0
        m_VScrollVisible = False
    End If
    
    If mRec.Right + Abs(mRec.Left) > UserControl.ScaleWidth Or (mRec.Left < 0) Then
        GetScrollInfo UserControl.hwnd, SB_HORZ, SI
        SI.nMin = mRec.Left
        SI.nMax = mRec.Right
        SI.nPage = UserControl.ScaleWidth
        SetScrollInfo UserControl.hwnd, SB_HORZ, SI, True
        GetScrollInfo UserControl.hwnd, SB_HORZ, SI
        ScrollHorizontalWindow -SI.nPos
        m_HScrollVisible = True
    Else
        SI.nPos = 0
        SI.nPage = 0
        SI.nMax = 0
        SI.nMin = 0
        SetScrollInfo UserControl.hwnd, SB_HORZ, SI, True
        ScrollHorizontalWindow 0
        m_HScrollVisible = False
    End If
        
    SetWindowPos UserControl.hwnd, 0, 0, 0, 0, 0, 551
    
End Sub

Public Function ResetScroll()
    ScrollVerticalWindow 0
    ScrollHorizontalWindow 0
    'SetWindowPos ScrollControl1.hwnd, 0, 0, 0, 0, 0, 551
End Function


Private Sub ScrollVerticalWindow(ByVal NewPos As Long)
    ScrollWindowByNum UserControl.hwnd, 0&, NewPos - OldPosV, 0&, 0&
    OldPosV = NewPos
End Sub

Private Sub ScrollHorizontalWindow(ByVal NewPos As Long)
    ScrollWindowByNum UserControl.hwnd, NewPos - OldPosH, 0&, 0&, 0&
    OldPosH = NewPos
End Sub

Private Function GetLoWord(dw As Long) As Long
    If dw And &H8000& Then
       GetLoWord = &H8000 Or (dw And &H7FFF&)
    Else
       GetLoWord = dw And &HFFFF&
    End If
End Function

Private Function GetHiWord(dw As Long) As Long
    If dw And &H80000000 Then
       GetHiWord = (dw \ 65535) - 1
    Else
       GetHiWord = dw \ 65535
    End If
End Function

Private Sub UserControl_Show()
    If m_AutoScroll Then
        Me.RefreshScroll
        CheckScroll
    End If
End Sub

Private Sub UserControl_Terminate()
    Dim Counter As Long
    Dim Flag As Long

    If pASMWrapper <> 0 Then
        Call StopSubclassing
        
        Call CopyMemory(Counter, ByVal (pASMWrapper + 104), 4)
        
        If Counter = 0 Then
            Call VirtualFree(ByVal pASMWrapper, 0, MEM_RELEASE)
        Else
            Flag = 1
            Call CopyMemory(ByVal (pASMWrapper + 108), Flag, 4)
        End If
        
    End If

End Sub







