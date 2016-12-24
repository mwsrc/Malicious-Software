VERSION 5.00
Begin VB.UserControl ExplorerFrame 
   ClientHeight    =   5115
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5190
   ControlContainer=   -1  'True
   ScaleHeight     =   341
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   346
End
Attribute VB_Name = "ExplorerFrame"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Declare Function IsThemeActive Lib "uxtheme.dll" () As Long
Private Declare Function DrawThemeBackGround Lib "uxtheme.dll" Alias "DrawThemeBackground" (ByVal hTheme As Long, ByVal lhDC As Long, ByVal iPartId As Long, ByVal iStateId As Long, pRect As RECT, pClipRect As Any) As Long
Private Declare Function OpenThemeData Lib "uxtheme.dll" (ByVal hwnd As Long, ByVal pszClassList As Long) As Long
Private Declare Function CloseThemeData Lib "uxtheme.dll" (ByVal hTheme As Long) As Long
Private Declare Function GetPixel Lib "gdi32.dll" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function DrawFrameControl Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal un1 As Long, ByVal un2 As Long) As Long
Private Declare Function DrawCaption Lib "user32" (ByVal hwnd As Long, ByVal hdc As Long, pcRect As RECT, ByVal un As Long) As Long
Private Declare Function DrawEdge Lib "user32" (ByVal hdc As Long, qrc As RECT, ByVal edge As Long, ByVal grfFlags As Long) As Long
Private Declare Function GetThemeColor Lib "uxtheme.dll" (ByVal hTheme As Long, ByVal iPartId As Long, ByVal iStateId As Long, ByVal iPropId As Long, pColor As Long) As Long
Private Declare Function DrawThemeText Lib "uxtheme.dll" (ByVal hTheme As Long, ByVal hdc As Long, ByVal iPartId As Long, ByVal iStateId As Long, ByVal pszText As Long, ByVal iCharCount As Long, ByVal dwTextFlag As Long, ByVal dwTextFlags2 As Long, pRect As RECT) As Long
Private Declare Function SetRect Lib "user32.dll" (ByRef lpRect As RECT, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function DrawText Lib "user32.dll" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, ByRef lpRect As RECT, ByVal wFormat As Long) As Long
Private Declare Function LoadCursor Lib "user32" Alias "LoadCursorA" (ByVal hInstance As Long, ByVal lpCursorName As Long) As Long
Private Declare Function DestroyCursor Lib "user32" (ByVal hCursor As Long) As Long
Private Declare Function SetCursor Lib "user32" (ByVal hCursor As Long) As Long
Private Declare Function PtInRect Lib "user32" (lpRect As RECT, ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function ImageList_Draw Lib "comctl32.dll" (ByVal himl As Long, ByVal i As Long, ByVal hdcDst As Long, ByVal X As Long, ByVal Y As Long, ByVal fStyle As Long) As Long
Private Declare Function DrawFocusRect Lib "user32" (ByVal hdc As Long, lpRect As RECT) As Long

Private Type RECT
    Left       As Long
    Top        As Long
    Right      As Long
    Bottom     As Long
End Type

Public Enum DrawTextFlags
    DT_TOP = &H0
    DT_LEFT = &H0
    DT_CENTER = &H1
    DT_RIGHT = &H2
    DT_VCENTER = &H4
    DT_BOTTOM = &H8
    DT_WORDBREAK = &H10
    DT_SINGLELINE = &H20
    DT_EXPANDTABS = &H40
    DT_TABSTOP = &H80
    DT_NOCLIP = &H100
    DT_EXTERNALLEADING = &H200
    DT_CALCRECT = &H400
    DT_NOPREFIX = &H800
    DT_INTERNAL = &H1000
    DT_EDITCONTROL = &H2000
    DT_PATH_ELLIPSIS = &H4000
    DT_END_ELLIPSIS = &H8000
    DT_MODIFYSTRING = &H10000
    DT_RTLREADING = &H20000
    DT_WORD_ELLIPSIS = &H40000
    DT_NOFULLWIDTHCHARBREAK = &H80000
    DT_HIDEPREFIX = &H100000
    DT_PREFIXONLY = &H200000
End Enum

Private Enum colores
  TMT_BORDERCOLOR = 3801
  TMT_FILLCOLOR = 3802
  TMT_TEXTCOLOR = 3803
  TMT_EDGELIGHTCOLOR = 3804
  TMT_EDGEHIGHLIGHTCOLOR = 3805
  TMT_EDGESHADOWCOLOR = 3806
  TMT_EDGEDKSHADOWCOLOR = 3807
  TMT_EDGEFILLCOLOR = 3808
  TMT_TRANSPARENTCOLOR = 3809
  TMT_GRADIENTCOLOR1 = 3810
  TMT_GRADIENTCOLOR2 = 3811
  TMT_GRADIENTCOLOR3 = 3812
  TMT_GRADIENTCOLOR4 = 3813
  TMT_GRADIENTCOLOR5 = 3814
  TMT_SHADOWCOLOR = 3815
  TMT_GLOWCOLOR = 3816
  TMT_TEXTBORDERCOLOR = 3817
  TMT_TEXTSHADOWCOLOR = 3818
  TMT_GLYPHTEXTCOLOR = 3819
  TMT_GLYPHTRANSPARENTCOLOR = 3820
  TMT_FILLCOLORHINT = 3821
  TMT_BORDERCOLORHINT = 3822
  TMT_ACCENTCOLORHINT = 3823
End Enum

Private Const EBP_HEADERBACKGROUND As Long = 1

Private Const EBP_NORMALGROUPBACKGROUND As Long = 5
Private Const EBP_NORMALGROUPCOLLAPSE As Long = 6
Private Const EBP_NORMALGROUPEXPAND As Long = 7
Private Const EBP_NORMALGROUPHEAD As Long = 8

Private Const EBP_SPECIALGROUPBACKGROUND As Long = 9
Private Const EBP_SPECIALGROUPCOLLAPSE As Long = 10
Private Const EBP_SPECIALGROUPEXPAND As Long = 11
Private Const EBP_SPECIALGROUPHEAD As Long = 12

'Private Const TMT_FILLCOLORHINT As Long = 3821

Private Const DFC_SCROLL As Long = 3
Private Const IDC_HAND = 32649&

Const DC_ACTIVE = &H1
Const DC_GRADIENT = &H20
Const DC_TEXT = &H8

Private Const ILD_TRANSPARENT = &H1

Public Event Resize()
Public Event ItemClick(ByVal ItemIndex As Long, ByVal ItemData As Long)

Private Type ITEMS
    Caption As String
    iIcon As Long
    Data As Long
    ToolTips As String
    Rec As RECT
End Type

Private m_BackColor         As OLE_COLOR
Private ButtonState         As Long
Private IsCollapse          As Boolean
Private m_Height            As Long
Private m_Caption           As String
Private m_Icon              As StdPicture
Private m_IsSpecial         As Boolean
Private hCursorHands        As Long
Private m_PixelColor        As Long
Private tItem()             As ITEMS
Private m_hImgList          As Long
Private HotIndex            As Long
Private IsFocus             As Boolean
Private ItemFocus           As Long

Public Sub AddItem(ByVal Caption As String, ByVal iIcon As Long, Optional ByVal Data As Long, Optional ByVal ToolTips As String)

If Caption = vbNullString Then Exit Sub

    With tItem(UBound(tItem))
        .Caption = Caption
        .iIcon = iIcon
        .Data = Data
        .ToolTips = ToolTips
        
        If UBound(tItem) = 0 Then
            .Rec.Top = 43
        Else
            .Rec.Top = tItem(UBound(tItem) - 1).Rec.Bottom + 8
        End If
        
        .Rec.Right = UserControl.ScaleWidth - 8
        .Rec.Left = 37
        DrawText UserControl.hdc, .Caption, Len(.Caption), .Rec, DT_CALCRECT Or DT_LEFT Or DT_WORDBREAK
        .Rec.Left = 13
        
        m_Height = .Rec.Bottom + 24
    End With

    ReDim Preserve tItem(UBound(tItem) + 1)
End Sub

Private Sub DrawItems()
    Dim i As Long
    Dim Rec As RECT
    
    For i = 0 To UBound(tItem) - 1
        If i = HotIndex Then
            UserControl.ForeColor = vbActiveTitleBar
            UserControl.Font.Underline = True
        Else
            UserControl.ForeColor = vbInactiveTitleBar
            UserControl.Font.Underline = False
        End If
       
        
        Rec = tItem(i).Rec
        Rec.Left = 37

        DrawText UserControl.hdc, tItem(i).Caption, Len(tItem(i).Caption), Rec, DT_LEFT Or DT_WORDBREAK
        ImageList_Draw m_hImgList, tItem(i).iIcon, UserControl.hdc, tItem(i).Rec.Left, tItem(i).Rec.Top, ILD_TRANSPARENT
        
        If ItemFocus = i And IsFocus Then
            UserControl.ForeColor = vbButtonText
            SetRect Rec, tItem(i).Rec.Left - 2, tItem(i).Rec.Top - 2, tItem(i).Rec.Right + 4, tItem(i).Rec.Bottom + 4
            DrawFocusRect UserControl.hdc, Rec
        End If
    Next
    
    UserControl.ForeColor = vbButtonText
End Sub

Public Sub Clear()
    m_Height = 56
    HotIndex = -1
    ReDim tItem(0)
    Extender.ToolTipText = vbNullString
End Sub

Public Sub Refresh()
 Me.Collapse = Me.Collapse
End Sub

Public Property Let hImgList(ByVal Value As Long)
    m_hImgList = Value
    Draw
End Property

Public Property Get hImgList() As Long
     hImgList = m_hImgList
End Property

Private Function GetColorTheme(ByVal IdPart As Long, State As Long, PropId As colores) As OLE_COLOR
    Dim lColor As Long
    Dim hTheme As Long
    
    If IsThemeActive Then
    
        hTheme = OpenThemeData(UserControl.hwnd, StrPtr("ExplorerBar"))
    
        If hTheme Then
        
            If GetThemeColor(hTheme, IdPart, State, PropId, lColor) = 0 Then
                 GetColorTheme = lColor
            Else
                 GetColorTheme = vbButtonFace
            End If
        
            Call CloseThemeData(hTheme)
        Else
            GetColorTheme = vbButtonFace
        End If
    
    Else
        GetColorTheme = vbButtonFace
    End If
End Function


Public Property Let IsSpecial(ByVal Value As Boolean)
    m_IsSpecial = Value
    PropertyChanged "IsSpecial"
    Draw
End Property

Public Property Get IsSpecial() As Boolean
     IsSpecial = m_IsSpecial
End Property

Public Property Let Collapse(ByVal Value As Boolean)
    IsCollapse = Value
    UserControl.Width = UserControl.Width
    UserControl.Height = IIf(IsCollapse, 40, m_Height) * Screen.TwipsPerPixelY
End Property

Public Property Get Collapse() As Boolean
    Collapse = IsCollapse
End Property

Private Sub UserControl_EnterFocus()
    ItemFocus = -1
    IsFocus = True
    Draw
End Sub

Private Sub UserControl_ExitFocus()
    IsFocus = False
    Draw
End Sub

Private Sub UserControl_Initialize()
    UserControl.AutoRedraw = True
    ButtonState = 1
    hCursorHands = LoadCursor(0&, IDC_HAND)
    HotIndex = -1
    ReDim tItem(0)
End Sub

Public Function DrawBackGround(ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal Width As Long, Height As Long) As Boolean
    Dim hTheme  As Long
    Dim Rec As RECT

    hTheme = OpenThemeData(0&, StrPtr("ExplorerBar"))

    If (hTheme) Then
        SetRect Rec, X, Y, X + Width, Y + Height
        DrawBackGround = (DrawThemeBackGround(hTheme, hdc, EBP_HEADERBACKGROUND, 1, Rec, ByVal 0&) = 0)
        Call CloseThemeData(hTheme)
    End If
    
End Function

Private Sub Draw()
    Dim hTheme  As Long
    Dim Rec As RECT
    Dim lWidth As Single
    Dim lHeight As Single
    Dim lTop As Single
    Dim lFlag
    UserControl.Cls
    'On Error Resume Next

    If Not CBool(IsThemeActive) Then GoTo DrawClasic
    
    hTheme = OpenThemeData(UserControl.hwnd, StrPtr("ExplorerBar"))
    
    If hTheme = 0 Then GoTo DrawClasic
    
    SetRect Rec, 0, 8, UserControl.ScaleWidth, 33
    lFlag = IIf(m_IsSpecial, EBP_SPECIALGROUPHEAD, EBP_NORMALGROUPHEAD)
    Call DrawThemeBackGround(hTheme, UserControl.hdc, lFlag, 1, Rec, ByVal 0&)

    If Not IsCollapse Then
         SetRect Rec, 0, 33, UserControl.ScaleWidth, UserControl.ScaleHeight - 8
         lFlag = IIf(m_IsSpecial, EBP_SPECIALGROUPBACKGROUND, EBP_NORMALGROUPBACKGROUND)
         Call DrawThemeBackGround(hTheme, UserControl.hdc, lFlag, 1, Rec, ByVal 0&)
         m_PixelColor = GetPixel(UserControl.hdc, 4, 34)
         DrawItems
    End If
    
    SetRect Rec, UserControl.ScaleWidth - 30, 12, UserControl.ScaleWidth, 32
    If m_IsSpecial Then
        lFlag = IIf(IsCollapse = False, EBP_SPECIALGROUPCOLLAPSE, EBP_SPECIALGROUPEXPAND)
    Else
        lFlag = IIf(IsCollapse = False, EBP_NORMALGROUPCOLLAPSE, EBP_NORMALGROUPEXPAND)
    End If
    
    Call DrawThemeBackGround(hTheme, UserControl.hdc, lFlag, ButtonState, Rec, ByVal 0&)

    If Not m_Icon Is Nothing Then
        lWidth = ScaleX(m_Icon.Width, vbHimetric, vbPixels)
        lHeight = ScaleY(m_Icon.Height, vbHimetric, vbPixels)
        lTop = 21 - (lHeight / 2)
        If lTop < 0 Then lTop = 0
        m_Icon.Render UserControl.hdc, 4, lTop, lWidth, lHeight, 0&, m_Icon.Height, m_Icon.Width, -m_Icon.Height, ByVal 0&
    End If

    SetRect Rec, 8 + lWidth, 8, UserControl.ScaleWidth - 30, 33
    lFlag = IIf(m_IsSpecial, EBP_SPECIALGROUPHEAD, EBP_NORMALGROUPHEAD)
    DrawThemeText hTheme, UserControl.hdc, lFlag, ButtonState, StrPtr(m_Caption), -1, DT_VCENTER Or DT_SINGLELINE Or DT_WORD_ELLIPSIS, 0, Rec

    Call CloseThemeData(hTheme)
    
    If IsFocus And ItemFocus = -1 Then
        SetRect Rec, 2, 10, UserControl.ScaleWidth - 2, 31
        DrawFocusRect UserControl.hdc, Rec
    End If
    
    UserControl.Refresh

    Exit Sub
        
DrawClasic:

        SetRect Rec, 0, 0, UserControl.ScaleWidth, UserControl.ScaleHeight
        DrawEdge UserControl.hdc, Rec, &H6, &HF
        
        SetRect Rec, 2, 2, UserControl.ScaleWidth - 2, 22
        DrawCaption UserControl.hwnd, UserControl.hdc, Rec, DC_ACTIVE Or DC_GRADIENT Or DC_TEXT

        SetRect Rec, UserControl.ScaleWidth - 25, 4, UserControl.ScaleWidth - 5, 20
        DrawFrameControl UserControl.hdc, Rec, DFC_SCROLL, IIf(IsCollapse, 1, 4)
        
        If Not m_Icon Is Nothing Then
            lWidth = ScaleX(m_Icon.Width, vbHimetric, vbPixels)
            lHeight = ScaleY(m_Icon.Height, vbHimetric, vbPixels)
            m_Icon.Render UserControl.hdc, 4, 12 - lHeight / 2, lWidth, lHeight, 0&, m_Icon.Height, m_Icon.Width, -m_Icon.Height, ByVal 0&
        End If
        
        SetRect Rec, 8 + lWidth, 0, UserControl.ScaleWidth - 30, 25
        DrawText UserControl.hdc, m_Caption, -1, Rec, DT_VCENTER Or DT_SINGLELINE Or DT_WORD_ELLIPSIS
        
        UserControl.Refresh
        

End Sub

Private Sub UserControl_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        If ItemFocus = -1 Then
            Me.Collapse = Not Me.Collapse
        Else
            RaiseEvent ItemClick(ItemFocus, tItem(ItemFocus).Data)
        End If
    End If
    
    If UBound(tItem) > 0 Then
        If KeyCode = vbKeyDown Then
            If ItemFocus < UBound(tItem) - 1 Then
                ItemFocus = ItemFocus + 1
                Draw
            End If
        End If
        
        If KeyCode = vbKeyUp Then
            If ItemFocus > -1 Then
                ItemFocus = ItemFocus - 1
                Draw
            End If
        End If
    End If
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
 If Y > 7 And Y < 33 Then
    ButtonState = 3
    If hCursorHands Then SetCursor hCursorHands
    Draw
 End If
 
 If HotIndex <> -1 Then
    If hCursorHands Then SetCursor hCursorHands
 End If
End Sub


Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim i As Long
Dim IsHot As Boolean


    If Button = 0 Then
        If Y > 7 And Y < 33 Then
            If hCursorHands Then SetCursor hCursorHands
            If ButtonState = 1 Then
                ButtonState = 2
                Draw
            End If
        Else
            If ButtonState = 2 Then
                ButtonState = 1
                Draw
            End If
        End If
        
        For i = 0 To UBound(tItem) - 1
             If PtInRect(tItem(i).Rec, X, Y) Then
                
                If HotIndex <> i Then
                    HotIndex = i
                    Extender.ToolTipText = tItem(i).ToolTips
                    Draw
                End If
                
                IsHot = True
                Exit For
                
            End If
        Next

        If Not IsHot Then
            If HotIndex <> -1 Then
                HotIndex = -1
                Extender.ToolTipText = vbNullString
                Draw
            End If
        Else
            If hCursorHands Then SetCursor hCursorHands
        End If
        
    End If
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If ButtonState = 3 Then
        If Y > 7 And Y < 33 Then
            If hCursorHands Then SetCursor hCursorHands
            ButtonState = 2
            Me.Collapse = Not Me.Collapse
        Else
            ButtonState = 1
            Draw
        End If
    End If

    If HotIndex <> -1 Then
       If hCursorHands Then SetCursor hCursorHands
       RaiseEvent ItemClick(HotIndex, tItem(HotIndex).Data)
    End If
End Sub

Private Sub UserControl_Resize()
    Draw
    If Not Ambient.UserMode Then
        m_Height = UserControl.ScaleHeight
        PropertyChanged "Height"
    End If
    RaiseEvent Resize
End Sub

Private Sub UserControl_Show()
    UserControl.BackColor = GetColorTheme(EBP_HEADERBACKGROUND, 1, TMT_FILLCOLORHINT)
    Draw
End Sub


Public Property Get Icon() As StdPicture
    Set Icon = m_Icon
End Property

Public Property Set Icon(ByVal oIcon As StdPicture)
    Set m_Icon = oIcon
    PropertyChanged "Icon"
    Draw
End Property


Public Property Get Caption() As String
    Caption = m_Caption
End Property

Public Property Let Caption(ByVal sText As String)
    m_Caption = sText
    PropertyChanged "Caption"
    Draw
End Property

Public Property Get BackColor() As OLE_COLOR
    BackColor = GetColorTheme(EBP_HEADERBACKGROUND, 1, TMT_FILLCOLORHINT)
End Property

Public Property Get PanelColor() As OLE_COLOR
    If m_PixelColor <> 0 Then
        PanelColor = m_PixelColor
    Else
        PanelColor = GetColorTheme(IIf(m_IsSpecial, EBP_SPECIALGROUPBACKGROUND, EBP_NORMALGROUPBACKGROUND), 1, TMT_FILLCOLOR)
    End If
End Property

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    m_Height = PropBag.ReadProperty("Height", 100)
    m_Caption = PropBag.ReadProperty("Caption", Ambient.DisplayName)
    m_IsSpecial = PropBag.ReadProperty("IsSpecial", False)
    Set m_Icon = PropBag.ReadProperty("Icon", Nothing)
End Sub

Private Sub UserControl_Terminate()
    If hCursorHands Then DestroyCursor hCursorHands
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    PropBag.WriteProperty "Height", m_Height, 100
    PropBag.WriteProperty "Caption", m_Caption, Ambient.DisplayName
    PropBag.WriteProperty "IsSpecial", m_IsSpecial, False
    PropBag.WriteProperty "Icon", m_Icon, Nothing
End Sub

Public Property Let SetHeight(ByVal lHeight As Long)
    m_Height = lHeight / Screen.TwipsPerPixelY
    If Not Me.Collapse Then
        UserControl.Height = lHeight
    End If
End Property
