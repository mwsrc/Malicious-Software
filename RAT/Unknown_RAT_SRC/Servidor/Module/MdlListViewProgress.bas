Attribute VB_Name = "MdlListViewProgress"
Option Explicit

Private Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
Private Declare Function ReleaseDC Lib "user32.dll" (ByVal hwnd As Long, ByVal hdc As Long) As Long
Private Declare Function GetClientRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Private Declare Function Rectangle Lib "gdi32" (ByVal hdc As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long) As Long
Private Declare Function CreateSolidBrush Lib "gdi32.dll" (ByVal crColor As Long) As Long
Private Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Private Declare Function FillRect Lib "user32.dll" (ByVal hdc As Long, ByRef lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function DrawText Lib "user32.dll" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, ByRef lpRect As RECT, ByVal wFormat As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function SetBkMode Lib "gdi32" (ByVal hdc As Long, ByVal nBkMode As Long) As Long
Private Declare Function SetRect Lib "user32.dll" (ByRef lpRect As RECT, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long) As Long
Private Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function EndPaint Lib "user32" (ByVal hwnd As Long, lpPaint As PAINTSTRUCT) As Long
Private Declare Function BeginPaint Lib "user32" (ByVal hwnd As Long, lpPaint As PAINTSTRUCT) As Long
Private Declare Function InvalidateRect Lib "user32.dll" (ByVal hwnd As Long, ByRef lpRect As RECT, ByVal bErase As Long) As Long
Private Declare Function ValidateRect Lib "user32.dll" (ByVal hwnd As Long, ByRef lpRect As RECT) As Long
Private Declare Function DrawThemeBackGround Lib "uxtheme.dll" Alias "DrawThemeBackground" (ByVal hTheme As Long, ByVal lhdc As Long, ByVal iPartId As Long, ByVal iStateId As Long, pRect As RECT, pClipRect As RECT) As Long
Private Declare Function IsThemeActive Lib "uxtheme.dll" () As Boolean
Private Declare Function OpenThemeData Lib "uxtheme.dll" (ByVal hwnd As Long, ByVal pszClassList As Long) As Long
Private Declare Function CloseThemeData Lib "uxtheme.dll" (ByVal hTheme As Long) As Long
Private Declare Function SetTextColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Private Declare Function OleTranslateColor Lib "olepro32.dll" (ByVal OLE_COLOR As Long, ByVal hPalette As Long, pccolorref As Long) As Long

Private Type RECT
    Left                    As Long
    Top                     As Long
    Right                   As Long
    Bottom                  As Long
End Type

Private Type PAINTSTRUCT
    hdc                     As Long
    fErase                  As Long
    rcPaint                 As RECT
    fRestore                As Long
    fIncUpdate              As Long
    rgbReserved(1 To 32)    As Byte
End Type

Private Type LV_ITEM
    mask                    As Long
    iItem                   As Long
    iSubItem                As Long
    State                   As Long
    stateMask               As Long
    pszText                 As Long
    cchTextMax              As Long
    iImage                  As Long
    lParam                  As Long
    iIndent                 As Long
End Type

Private Type LVITEM
    mask                    As Long
    iItem                   As Long
    iSubItem                As Long
    State                   As Long
    stateMask               As Long
    pszText                 As String
    cchTextMax              As Long
    iImage                  As Long
    lParam                  As Long
    iIndent                 As Long
End Type

Private Const LVM_FIRST             As Long = &H1000
Private Const LVM_GETITEMCOUNT      As Long = (LVM_FIRST + 4)
Private Const LVM_GETITEMTEXTA      As Long = (LVM_FIRST + 45)
Private Const LVM_GETSUBITEMRECT    As Long = (LVM_FIRST + 56)
Private Const LVM_GETTOPINDEX       As Long = (LVM_FIRST + 39)
Private Const LVM_GETCOUNTPERPAGE   As Long = (LVM_FIRST + 40)
Private Const LVM_SETITEMTEXT       As Long = (LVM_FIRST + 46)

Private Const LVIF_TEXT = &H1
Private Const LVIR_LABEL = 2

Private Const WM_PAINT              As Long = &HF
Private Const WM_GETFONT            As Long = &H31
Private Const WM_SYSCOLORCHANGE     As Long = &H15
Private Const WM_ERASEBKGND         As Long = &H14


Private Const DT_CENTER = &H1
Private Const DT_SINGLELINE         As Long = &H20
Private Const DT_VCENTER            As Long = &H4

Private Const TRANSPARENT           As Long = 1


Private m_BackColor                 As OLE_COLOR
Private m_BorderColor               As OLE_COLOR
Private m_FillColor                 As OLE_COLOR
Private m_TextColor                 As OLE_COLOR
Private m_TextVisible               As Boolean
Private m_UseWindowsTheme           As Boolean

Private hTheme                      As Long
Private mhwnd                       As Long
Private m_NoEraseBackGroud          As Boolean




Property Get BackColor() As OLE_COLOR
    BackColor = m_BackColor
End Property


Property Let BackColor(ByVal NewBackColor As OLE_COLOR)
    OleTranslateColor NewBackColor, 0, m_BackColor
End Property


Property Get BorderColor() As OLE_COLOR
    BorderColor = m_BorderColor
End Property

Property Let BorderColor(ByVal NewBorderColor As OLE_COLOR)
    OleTranslateColor NewBorderColor, 0, m_BorderColor
End Property


Property Get FillColor() As OLE_COLOR
    FillColor = m_FillColor
End Property


Property Let FillColor(ByVal NewFillColor As OLE_COLOR)
    OleTranslateColor NewFillColor, 0, m_FillColor
End Property


Property Get TextColor() As OLE_COLOR
    TextColor = m_TextColor
End Property


Property Let TextColor(ByVal NewTextColor As OLE_COLOR)
    OleTranslateColor NewTextColor, 0, m_TextColor
End Property


Property Get NoEraseBackGroud() As Boolean
    NoEraseBackGroud = m_NoEraseBackGroud
End Property


Property Let NoEraseBackGroud(ByVal Value As Boolean)
    m_NoEraseBackGroud = Value
End Property


Property Get TextVisible() As Boolean
    TextVisible = m_TextVisible
End Property


Property Let TextVisible(ByVal Value As Boolean)
    m_TextVisible = Value
End Property


Property Get UseWindowsTheme() As Boolean
    UseWindowsTheme = m_UseWindowsTheme
End Property


Property Let UseWindowsTheme(ByVal Value As Boolean)
    
    If Value And IsThemeActive Then
        If hTheme <> 0 Then Call CloseThemeData(hTheme)
        hTheme = OpenThemeData(0&, StrPtr("Progress"))
    Else
        If hTheme Then
            Call CloseThemeData(hTheme)
            hTheme = 0
        End If
    End If
    
    m_UseWindowsTheme = Value
    
End Property


Public Sub Refresh(ByVal hwnd As Long)
    SendMessage hwnd, WM_PAINT, 0&, 0&
End Sub

Public Sub Initialize()
    BackColor = vbButtonFace
    BorderColor = vbButtonShadow
    FillColor = vbGreen
    TextColor = vbWindowText
    TextVisible = True
End Sub

Public Sub Terminate()
    If hTheme Then Call CloseThemeData(hTheme)
End Sub


Private Sub DrawProgressBar(hdc As Long, ItemRect As RECT, Valor As Long)
    Dim hPen        As Long, OldhPen As Long
    Dim hBrush      As Long, OldhBrush As Long
    Dim lWidth      As Long
    Dim Percent     As Long
    
    hPen = CreatePen(0, 1, m_BorderColor)
    hBrush = CreateSolidBrush(m_BackColor)
    
    OldhPen = SelectObject(hdc, hPen)
    OldhBrush = SelectObject(hdc, hBrush)
    
    Rectangle hdc, ItemRect.Left, ItemRect.Top, ItemRect.Right, ItemRect.Bottom
    
    DeleteObject hPen
    DeleteObject hBrush
    
    lWidth = ItemRect.Right - ItemRect.Left - 2
    If lWidth > 0 Then
        Percent = (Valor * lWidth) / 100
        SetRect ItemRect, ItemRect.Left + 1, ItemRect.Top + 1, ItemRect.Left + 1 + Percent, ItemRect.Bottom - 1
        
        hBrush = CreateSolidBrush(m_FillColor)
        SelectObject hdc, hBrush
        FillRect hdc, ItemRect, hBrush
        
        DeleteObject hBrush
    End If
    
    Call SelectObject(hdc, OldhPen)
    Call SelectObject(hdc, OldhBrush)
    
End Sub


Private Function DrawProgressTheme(hdc As Long, hwnd As Long, rtRect As RECT, Valor As Long) As Boolean

    On Error Resume Next
    
    Dim lResult     As Long
    Dim lWidth      As Long
    Dim Percent     As Long

    If hTheme Then
        lResult = DrawThemeBackGround(hTheme, hdc, 1, 0, rtRect, rtRect)
        If lResult Then
            DrawProgressBar hdc, rtRect, Valor
            Call CloseThemeData(hTheme)
            hTheme = 0
        Else
            lWidth = rtRect.Right - rtRect.Left - 4
            If lWidth > 0 Then
                Percent = (Valor * lWidth) / 100
                SetRect rtRect, rtRect.Left + 3, rtRect.Top + 3, rtRect.Left + 1 + Percent, rtRect.Bottom - 3
                lResult = DrawThemeBackGround(hTheme, hdc, 3, 2, rtRect, rtRect)
            End If
        End If
    Else
        DrawProgressBar hdc, rtRect, Valor
    End If

End Function


Private Function GetItemRec(hwnd As Long, ByVal Column As Long, ByVal Index As Long) As RECT
    GetItemRec.Top = Column
    GetItemRec.Left = LVIR_LABEL
    SendMessage hwnd, LVM_GETSUBITEMRECT, Index, GetItemRec
End Function


Public Function GetSubItemText(hwnd As Long, ByVal iItem As Long, ByVal iSubItem As Long) As String
    On Error Resume Next
       Dim objItem As LV_ITEM
       Dim baBuffer(32) As Byte
       Dim lngLength As Long
    
       objItem.mask = LVIF_TEXT
       objItem.iSubItem = iSubItem
       objItem.pszText = VarPtr(baBuffer(0))
       objItem.cchTextMax = UBound(baBuffer)
       lngLength = SendMessageLong(hwnd, LVM_GETITEMTEXTA, iItem, VarPtr(objItem))
    
       GetSubItemText = Left$(StrConv(baBuffer, vbUnicode), lngLength)
End Function

Public Sub SetSubItemText(hwnd As Long, ByVal Item As Long, ByVal SubItem As Long, ByVal NewText As String)
    Dim uLV As LVITEM
    With uLV
        .iSubItem = SubItem
        .pszText = NewText & vbNullChar
        .cchTextMax = Len(NewText) + 1
    End With
    Call SendMessage(hwnd, LVM_SETITEMTEXT, Item, uLV)
End Sub


'Ordinal #1
Public Sub WndProc(ByVal bBefore As Boolean, ByRef bHandled As Boolean, ByRef lReturn As Long, ByVal hwnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long, ByVal lSubItemProgress As Long)

    Dim ItemRect        As RECT
    Dim WinRect         As RECT
    Dim ProgRect        As RECT
    Dim PS              As PAINTSTRUCT
    Dim hdc             As Long
    Dim ItemCount       As Long
    Dim ItemValue       As Long
    Dim i               As Integer
    Dim hFont           As Long
    Dim TopIndex        As Long
    Dim CountPerPage    As Long
    Dim Caption         As String
        
    If uMsg = WM_ERASEBKGND And NoEraseBackGroud Then
        bHandled = True
        Exit Sub
    End If
    
    If uMsg = WM_SYSCOLORCHANGE Then
        If hTheme Then Call CloseThemeData(hTheme)
        If IsThemeActive And m_UseWindowsTheme Then
            hTheme = OpenThemeData(0&, StrPtr("Progress"))
        End If
        Exit Sub
    End If
    
    If uMsg = WM_PAINT Then
        If bBefore Then
            ItemCount = SendMessage(hwnd, LVM_GETITEMCOUNT, 0, 0)
            GetClientRect hwnd, WinRect
            Call BeginPaint(hwnd, PS)
            InvalidateRect hwnd, PS.rcPaint, 0
            TopIndex = SendMessage(hwnd, LVM_GETTOPINDEX, 0&, 0&)
            CountPerPage = SendMessage(hwnd, LVM_GETCOUNTPERPAGE, 0&, 0&)
            
            For i = TopIndex To TopIndex + CountPerPage
                If i >= ItemCount Then Exit For
                ItemRect = GetItemRec(hwnd, lSubItemProgress, i)
                If ItemRect.Bottom > PS.rcPaint.Bottom Then Exit For
                SetRect ProgRect, ItemRect.Left, ItemRect.Top + 1, ItemRect.Right, ItemRect.Bottom - 1
                ValidateRect hwnd, ProgRect
            Next i
        
            Call EndPaint(hwnd, PS)
        Else
            hdc = GetDC(hwnd)
            ItemCount = SendMessage(hwnd, LVM_GETITEMCOUNT, 0, 0)
            GetClientRect hwnd, WinRect
                
            hFont = SendMessage(hwnd, WM_GETFONT, 0&, 0&)
            SelectObject hdc, hFont
            SetBkMode hdc, TRANSPARENT
                    
            TopIndex = SendMessage(hwnd, LVM_GETTOPINDEX, 0&, 0&)
            CountPerPage = SendMessage(hwnd, LVM_GETCOUNTPERPAGE, 0&, 0&)
            
            For i = TopIndex To TopIndex + CountPerPage
                If i >= ItemCount Then Exit For
                ItemRect = GetItemRec(hwnd, lSubItemProgress, i)
                SetRect ProgRect, ItemRect.Left, ItemRect.Top + 1, ItemRect.Right, ItemRect.Bottom - 1
                ItemValue = val(GetSubItemText(hwnd, i, lSubItemProgress))
                If ItemValue < 0 Then ItemValue = 0
                If ItemValue > 100 Then ItemValue = 100
                If hTheme Then
                    DrawProgressTheme hdc, hwnd, ProgRect, ItemValue
                Else
                    DrawProgressBar hdc, ProgRect, ItemValue
                End If
        
                If m_TextVisible Then
                    Caption = ItemValue & " %"
                    SetTextColor hdc, m_TextColor
                    DrawText hdc, Caption, Len(Caption), ItemRect, DT_SINGLELINE Or DT_CENTER Or DT_VCENTER
                End If
            Next i
            ReleaseDC hwnd, hdc
        End If
    End If

End Sub

