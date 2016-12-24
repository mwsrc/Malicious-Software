VERSION 5.00
Begin VB.UserControl TabStrip 
   AutoRedraw      =   -1  'True
   ClientHeight    =   1095
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1950
   ControlContainer=   -1  'True
   ScaleHeight     =   73
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   130
End
Attribute VB_Name = "TabStrip"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private Declare Function MoveWindow Lib "user32" (ByVal hwnd As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long
Private Declare Function CreateWindowEx Lib "user32" Alias "CreateWindowExA" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, lpParam As Any) As Long
Private Declare Function DestroyWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function InitCommonControls Lib "comctl32.dll" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpDst As Any, lpSrc As Any, ByVal Length As Long)

Private Const TCM_FIRST As Long = &H1300
Private Const TCM_ADJUSTRECT As Long = (TCM_FIRST + 40)
Private Const TCM_DELETEALLITEMS As Long = (TCM_FIRST + 9)
Private Const TCM_DELETEITEM As Long = (TCM_FIRST + 8)
Private Const TCM_DESELECTALL As Long = (TCM_FIRST + 50)
Private Const TCM_GETCURFOCUS As Long = (TCM_FIRST + 47)
Private Const TCM_GETCURSEL As Long = (TCM_FIRST + 11)
Private Const TCM_GETEXTENDEDSTYLE As Long = (TCM_FIRST + 53)
Private Const TCM_GETIMAGELIST As Long = (TCM_FIRST + 2)
Private Const TCM_GETITEMA As Long = (TCM_FIRST + 5)
Private Const TCM_GETITEMCOUNT As Long = (TCM_FIRST + 4)
Private Const TCM_GETITEMRECT As Long = (TCM_FIRST + 10)
Private Const TCM_GETITEMW As Long = (TCM_FIRST + 60)
Private Const TCM_GETROWCOUNT As Long = (TCM_FIRST + 44)
Private Const TCM_GETTOOLTIPS As Long = (TCM_FIRST + 45)
'Private Const TCM_GETUNICODEFORMAT As Long = CCM_GETUNICODEFORMAT
Private Const TCM_HIGHLIGHTITEM As Long = (TCM_FIRST + 51)
Private Const TCM_HITTEST As Long = (TCM_FIRST + 13)
Private Const TCM_INSERTITEMA As Long = (TCM_FIRST + 7)
Private Const TCM_INSERTITEMW As Long = (TCM_FIRST + 62)
Private Const TCM_REMOVEIMAGE As Long = (TCM_FIRST + 42)
Private Const TCM_SETCURFOCUS As Long = (TCM_FIRST + 48)
Private Const TCM_SETCURSEL As Long = (TCM_FIRST + 12)
Private Const TCM_SETEXTENDEDSTYLE As Long = (TCM_FIRST + 52)
Private Const TCM_SETIMAGELIST As Long = (TCM_FIRST + 3)
Private Const TCM_SETITEMA As Long = (TCM_FIRST + 6)
Private Const TCM_SETITEMEXTRA As Long = (TCM_FIRST + 14)
Private Const TCM_SETITEMSIZE As Long = (TCM_FIRST + 41)
Private Const TCM_SETITEMW As Long = (TCM_FIRST + 61)
Private Const TCM_SETMINTABWIDTH As Long = (TCM_FIRST + 49)
Private Const TCM_SETPADDING As Long = (TCM_FIRST + 43)
Private Const TCM_SETTOOLTIPS As Long = (TCM_FIRST + 46)
'Private Const TCM_SETUNICODEFORMAT As Long = CCM_SETUNICODEFORMAT

Private Const TCS_SINGLELINE As Long = &H0
Private Const TCS_BOTTOM As Long = &H2
Private Const TCS_BUTTONS As Long = &H100
Private Const TCS_EX_FLATSEPARATORS As Long = &H1
Private Const TCS_EX_REGISTERDROP As Long = &H2
Private Const TCS_FIXEDWIDTH As Long = &H400
Private Const TCS_FLATBUTTONS As Long = &H8
Private Const TCS_FOCUSNEVER As Long = &H8000
Private Const TCS_FOCUSONBUTTONDOWN As Long = &H1000
Private Const TCS_FORCEICONLEFT As Long = &H10
Private Const TCS_FORCELABELLEFT As Long = &H20
Private Const TCS_HOTTRACK As Long = &H40
Private Const TCS_MULTILINE As Long = &H200
Private Const TCS_MULTISELECT As Long = &H4
Private Const TCS_OWNERDRAWFIXED As Long = &H2000
Private Const TCS_RAGGEDRIGHT As Long = &H800
Private Const TCS_RIGHT As Long = &H2
Private Const TCS_RIGHTJUSTIFY As Long = &H0
Private Const TCS_SCROLLOPPOSITE As Long = &H1
Private Const TCS_TABS As Long = &H0
Private Const TCS_TOOLTIPS As Long = &H4000
Private Const TCS_VERTICAL As Long = &H80

Private Const TCHT_ONITEMICON As Long = &H2
Private Const TCHT_ONITEMLABEL As Long = &H4
Private Const TCHT_NOWHERE As Long = &H1
Private Const TCHT_ONITEM As Long = (TCHT_ONITEMICON Or TCHT_ONITEMLABEL)

Private Const TCIF_IMAGE As Long = &H2
Private Const TCIF_PARAM As Long = &H8
Private Const TCIF_RTLREADING As Long = &H4
Private Const TCIF_STATE As Long = &H10
Private Const TCIF_TEXT As Long = &H1

Private Const TCIS_BUTTONPRESSED As Long = &H1
Private Const TCIS_HIGHLIGHTED As Long = &H2

Private Const TCN_FIRST As Long = -550
Private Const TCN_FOCUSCHANGE As Long = (TCN_FIRST - 4)
Private Const TCN_GETOBJECT As Long = (TCN_FIRST - 3)
Private Const TCN_KEYDOWN As Long = (TCN_FIRST - 0)
Private Const TCN_LAST As Long = (-580)
Private Const TCN_SELCHANGE As Long = (TCN_FIRST - 1)
Private Const TCN_SELCHANGING As Long = (TCN_FIRST - 2)

Private Const WC_TABCONTROL = "SysTabControl32"

Private Const WS_CHILD = &H40000000
Private Const WS_CLIPCHILDREN = &H2000000
Private Const WS_CLIPSIBLINGS = &H4000000
Private Const WS_OVERLAPPED = &H0&
Private Const WS_VISIBLE = &H10000000
Private Const WS_TABS = (WS_CLIPCHILDREN Or WS_CLIPSIBLINGS Or WS_OVERLAPPED Or WS_VISIBLE Or WS_CHILD)

Private Const WS_EX_LEFT = &H0&
Private Const WS_EX_LTRREADING = &H0&
Private Const WS_EX_RIGHTSCROLLBAR = &H0&
Private Const WS_EX_TABS = (WS_EX_LEFT Or WS_EX_LTRREADING Or WS_EX_RIGHTSCROLLBAR)

Private Const WM_SETFONT As Long = &H30
Private Const WM_NOTIFY As Long = &H4E
Private Const NM_FIRST  As Long = 0
Private Const NM_CLICK  As Long = (NM_FIRST - 2)
Private Const NM_RCLICK As Long = (NM_FIRST - 5)

Private Const GWL_STYLE = (-16)

Private Type TCITEM
    mask As Long
    dwState As Long
    dwStateMask As Long
    pszText As String
    cchTextMax As Long
    iImage As Long
    lParam As Long
End Type

Private Type NMHDR
    hwndFrom As Long
    idfrom   As Long
    code     As Long
End Type

Private WithEvents c_SubClass       As clsSubClass
Attribute c_SubClass.VB_VarHelpID = -1

Public Event BeforeClick(ByVal TabIndex As Long, ByRef Cancel As Boolean)
'Public Event DrawItem(ByVal lTab As Long, ByVal hdc As Long, ByVal bSelected As Boolean, ByVal bHot As Boolean, LeftPixels As Long, TopPixels As Long, RightPixels As Long, BottomPixels As Long, ByRef bDoDefault As Boolean)
'Public Event MeasureItem(ByVal lTab As Long, ByRef WidthPixels As Long, ByRef HeightPixels As Long, ByRef bDoDefault As Boolean)
Public Event TabClick(ByVal lTab As Long)
Public Event TabRightClick()

Dim hTabs As Long

Private Sub c_SubClass_WindowProc(bBefore As Boolean, bHandled As Boolean, lReturn As Long, hwnd As Long, uMsg As Long, wParam As Long, lParam As Long)


    Dim uNMH        As NMHDR
    Dim bCancel     As Boolean

    'If uMsg = WM_NOTIFY Then
        Call CopyMemory(uNMH, ByVal lParam, Len(uNMH))
        
        If uNMH.code = NM_CLICK Then
            
        End If
        
        If uNMH.code = TCN_SELCHANGE Then
            RaiseEvent TabClick(Me.SelectedItem)
        End If
        
        If uNMH.code = TCN_SELCHANGING Then
            RaiseEvent BeforeClick(Me.SelectedItem, bCancel)
            bHandled = bCancel
        End If
    'end if

End Sub

Private Sub UserControl_Initialize()
    InitCommonControls
    CrearTabStrip
End Sub

Private Sub UserControl_Resize()
    Call MoveWindow(hTabs, 0, 0, UserControl.ScaleWidth, UserControl.ScaleHeight, 1)
End Sub

Private Sub UserControl_Show()
    If Ambient.UserMode Then
        Set c_SubClass = New clsSubClass
        c_SubClass.ssc_Subclass UserControl.hwnd
        c_SubClass.ssc_AddMsg UserControl.hwnd, WM_NOTIFY, MSG_BEFORE
    End If
End Sub

Private Sub UserControl_Terminate()
    If hTabs <> 0 Then
        If Not c_SubClass Is Nothing Then
            c_SubClass.ssc_UnSubclass UserControl.hwnd
            Set c_SubClass = Nothing
        End If
    
        DestroyWindow hTabs
        hTabs = 0
    End If
End Sub

Public Function AddTab(ByVal Index As Long, ByVal Caption As String, Optional ByVal ItemData As Long, Optional ByVal ImageIndex As Long = -1) As Boolean
    Dim sTabSrip As TCITEM
    
    If hTabs = 0 Then Exit Function

    With sTabSrip
        .mask = TCIF_TEXT Or TCIF_IMAGE Or TCIF_PARAM
        .iImage = ImageIndex
        .lParam = ItemData
        .pszText = StrConv(Caption, vbUnicode)
    End With

    AddTab = SendMessage(hTabs, TCM_INSERTITEMW, Index, sTabSrip)

End Function

Private Sub CrearTabStrip()
    Dim oFont As IFont
    hTabs = CreateWindowEx(WS_EX_TABS, WC_TABCONTROL, vbNullString, WS_TABS, 0, 0, (UserControl.ScaleWidth), (UserControl.ScaleHeight), UserControl.hwnd, 0, App.hInstance, ByVal 0&)
    Set oFont = UserControl.Font
    SendMessage hTabs, WM_SETFONT, oFont.hFont, 0&
End Sub


Public Property Let FlatSeparatos(ByVal NewValue As Boolean)
    Dim ExtendedStyle As Long
    ExtendedStyle = SendMessage(hTabs, TCM_GETEXTENDEDSTYLE, 0, 0)
    Call SendMessage(hTabs, TCM_SETEXTENDEDSTYLE, 0, ExtendedStyle And TCS_EX_FLATSEPARATORS)
End Property


Public Property Let MultiRow(ByVal NewValue As Boolean)
    If NewValue Then
        SetWindowLong hTabs, GWL_STYLE, GetWindowLong(hTabs, GWL_STYLE) Or TCS_MULTILINE
    Else
        SetWindowLong hTabs, GWL_STYLE, GetWindowLong(hTabs, GWL_STYLE) And Not TCS_MULTILINE
    End If
End Property

Public Property Let hImageList(ByVal hwnd As Long)
    Call SendMessageLong(hTabs, TCM_SETIMAGELIST, 0, hwnd)
End Property

Public Sub SetItemText(ByVal Index As Long, Text As String)
    Dim sTabSrip As TCITEM
    sTabSrip.mask = TCIF_TEXT
    sTabSrip.pszText = Text
    SendMessage hTabs, TCM_SETITEMA, Index, sTabSrip
End Sub

Public Property Let SelectedItem(ByVal Index As Long)
    Dim bCancel As Boolean
    
    RaiseEvent BeforeClick(Me.SelectedItem, bCancel)
    
    If Not bCancel Then
        SendMessage hTabs, TCM_SETCURSEL, Index, 0
        RaiseEvent TabClick(Index)
    End If
End Property

Public Property Get SelectedItem() As Long
    SelectedItem = SendMessage(hTabs, TCM_GETCURSEL, 0, 0)
End Property

