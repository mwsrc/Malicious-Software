VERSION 5.00
Begin VB.UserControl ComboBoxEx 
   ClientHeight    =   585
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4365
   ForeColor       =   &H00000000&
   ScaleHeight     =   585
   ScaleWidth      =   4365
End
Attribute VB_Name = "ComboBoxEx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Declare Sub InitCommonControls Lib "comctl32" ()
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function CreateWindowEx Lib "user32" Alias "CreateWindowExA" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, lpParam As Any) As Long
Private Declare Function DestroyWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function GetWindowRect Lib "user32.dll" (ByVal hwnd As Long, ByRef lpRect As RECT) As Long
Private Declare Function SetFocus Lib "user32.dll" (ByVal hwnd As Long) As Long
Private Declare Function MoveWindow Lib "user32.dll" (ByVal hwnd As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long
Private Declare Function DestroyIcon Lib "user32.dll" (ByVal hIcon As Long) As Long
Private Declare Function LoadImage Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal dwImageType As Long, ByVal dwDesiredWidth As Long, ByVal dwDesiredHeight As Long, ByVal dwFlags As Long) As Long
Private Declare Function EnableWindow Lib "user32" (ByVal hwnd As Long, ByVal fEnable As Long) As Long
Private Declare Function ImageList_Create Lib "comctl32" (ByVal MinCx As Long, ByVal MinCy As Long, ByVal Flags As Long, ByVal cInitial As Long, ByVal cGrow As Long) As Long
Private Declare Function ImageList_Add Lib "comctl32" (ByVal hImagelist As Long, ByVal hBitmap As Long, ByVal hBitmapMask As Long) As Long
Private Declare Function ImageList_SetBkColor Lib "comctl32" (ByVal hImagelist As Long, ByVal clrBk As Long) As Long
Private Declare Function ImageList_AddMasked Lib "comctl32" (ByVal hImagelist As Long, ByVal hbmImage As Long, ByVal crMask As Long) As Long
Private Declare Function ImageList_AddIcon Lib "comctl32" (ByVal hImagelist As Long, ByVal hIcon As Long) As Long
Private Declare Function ImageList_Destroy Lib "comctl32" (ByVal hImagelist As Long) As Long
Private Declare Function ImageList_Draw Lib "comctl32" (ByVal hImagelist As Long, ByVal lIndex As Long, ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal fStyle As Long) As Long
Private Declare Function ImageList_Remove Lib "comctl32.dll" (ByVal himl As Long, ByVal i As Long) As Long
Private Declare Function ImageList_ReplaceIcon Lib "comctl32.dll" (ByVal himl As Long, ByVal i As Long, ByVal hIcon As Long) As Long
Private Declare Function ImageList_GetImageCount Lib "comctl32.dll" (ByVal himl As Long) As Long

Private Declare Function OleTranslateColor Lib "olepro32.dll" (ByVal OLE_COLOR As Long, ByVal hPalette As Long, pccolorref As Long) As Long

Private Const LR_LOADFROMFILE       As Long = &H10
Private Const LR_LOADMAP3DCOLORS    As Long = &H1000
Private Const LR_SHARED             As Long = &H8000&
Private Const IMAGE_ICON            As Long = 1

Private Const DI_MASK               As Long = &H1
Private Const DI_IMAGE              As Long = &H2
Private Const DI_NORMAL             As Long = DI_MASK Or DI_IMAGE

Private Const ILC_COLOR32           As Long = &H20
Private Const ILC_MASK              As Long = &H1
Private Const ILD_TRANSPARENT       As Long = &H1
Private Const CLR_NONE              As Long = &HFFFFFFFF

Private Const WC_COMBOBOXEXA        As String = "ComboBoxEx32"

Private Const WS_CHILD              As Long = &H40000000
Private Const WS_OVERLAPPED         As Long = &H0&
Private Const WS_VISIBLE            As Long = &H10000000
Private Const DEFAULT_WS = WS_CHILD Or WS_OVERLAPPED Or WS_VISIBLE

Private Const WS_EX_LEFT            As Long = &H0&
Private Const WS_EX_RIGHTSCROLLBAR  As Long = &H0&
Private Const WS_EX_LTRREADING      As Long = &H0&
Private Const DEFAULT_WS_EX         As Long = WS_EX_LEFT Or WS_EX_LTRREADING Or WS_EX_RIGHTSCROLLBAR

Private Const WM_GETFONT            As Long = &H31
Private Const WM_SETFONT            As Long = &H30
Private Const WM_SETTEXT            As Long = &HC
Private Const WM_GETTEXT            As Long = &HD
Private Const WM_GETTEXTLENGTH      As Long = &HE
Private Const WM_COMMAND            As Long = &H111
Private Const WM_USER               As Long = &H400

Private Const CBS_DROPDOWN          As Long = &H2&
Private Const CBS_DROPDOWNLIST      As Long = &H3&
Private Const CBS_SIMPLE            As Long = &H1&
Private Const CBS_AUTOHSCROLL       As Long = &H40&

Private Const CB_RESETCONTENT       As Long = &H14B
Private Const CB_DELETESTRING       As Long = &H144
Private Const CB_FINDSTRING         As Long = &H14C
Private Const CB_FINDSTRINGEXACT    As Long = &H158
Private Const CB_GETCURSEL          As Long = &H147
Private Const CB_SETCURSEL          As Long = &H14E
Private Const CB_GETCOUNT           As Long = &H146
Private Const CB_GETLBTEXT          As Long = &H148
Private Const CB_SETDROPPEDWIDTH    As Long = &H160
Private Const CB_GETDROPPEDWIDTH    As Long = &H15F
Private Const CB_SHOWDROPDOWN       As Long = &H14F
Private Const CB_LIMITTEXT          As Long = &H141

Private Const CBN_SELCHANGE         As Long = 1
Private Const CBN_EDITCHANGE        As Long = 5
Private Const CBN_DROPDOWN          As Long = 7
Private Const CBN_CLOSEUP           As Long = 8


Private Const CBEM_INSERTITEMA      As Long = (WM_USER + 1)
Private Const CBEM_SETIMAGELIST     As Long = (WM_USER + 2)
Private Const CBEM_GETIMAGELIST     As Long = (WM_USER + 3)
Private Const CBEM_GETITEMA         As Long = (WM_USER + 4)
Private Const CBEM_SETITEMA         As Long = (WM_USER + 5)
Private Const CBEM_GETCOMBOCONTROL  As Long = (WM_USER + 6)
Private Const CBEM_GETEDITCONTROL   As Long = (WM_USER + 7)

Private Const CBEIF_TEXT            As Long = &H1
Private Const CBEIF_IMAGE           As Long = &H2
Private Const CBEIF_SELECTEDIMAGE   As Long = &H4
Private Const CBEIF_OVERLAY         As Long = &H8
Private Const CBEIF_INDENT          As Long = &H10
Private Const CBEIF_LPARAM          As Long = &H20

Private Const EM_GETSEL             As Long = &HB0
Private Const EM_SETSEL             As Long = &HB1

Private Type RECT
    Left                            As Long
    Top                             As Long
    Right                           As Long
    Bottom                          As Long
End Type

Private Type COMBOBOXEXITEM
    mask                            As Long
    iItem                           As Long
    pszText                         As String
    cchTextMax                      As Long
    iImage                          As Long
    iSelectedImage                  As Long
    iOverlay                        As Long
    iIndent                         As Long
    lParam                          As Long
End Type

Public Event ItemClick(Index As Long)
Public Event TextChange()
Public Event DroppedShow(Visible As Boolean)

Public Enum EnuComboStyle
    [DropDown Combo] = 0
    [Simple Combo] = 1
    [DropDown List] = 2
End Enum

Dim hCBox                           As Long
Dim m_hWndEdit                      As Long
Dim hImgList                        As Long
Dim mIconWidth                      As Long
Dim mIconHeight                     As Long
Dim mDroppedWidth                   As Long
Dim mDroppedHeight                  As Long
Dim mStyle                          As EnuComboStyle
Dim mText                           As String
Dim cColl                           As Collection
Dim bSubClass                       As Boolean
Dim bCreateImgLst                   As Boolean
Dim m_lMaxLength                    As Long
Private WithEvents cSubClass As clsSubClass
Attribute cSubClass.VB_VarHelpID = -1


Public Property Let ImageListBackColor(ByVal NewColor As OLE_COLOR)
    Dim lColor As Long
    OleTranslateColor NewColor, 0, lColor
    ImageList_SetBkColor hImgList, lColor
End Property



Public Property Get Style() As EnuComboStyle
Attribute Style.VB_Description = "Modifica el estilo del ComboBox"
    Style = mStyle
End Property

Public Property Let Style(ByVal NewStyle As EnuComboStyle)
    mStyle = NewStyle
    InitWindows
    PropertyChanged "Style"
End Property


Public Property Get hImagelist() As Long
Attribute hImagelist.VB_MemberFlags = "400"
    hImagelist = hImgList
End Property

Public Property Let hImagelist(ByVal NewImgList As Long)
    
    If bCreateImgLst Then
        ImageList_Destroy hImgList
        bCreateImgLst = False
    End If
    
    hImgList = NewImgList
    
    Call SendMessageLong(hCBox, CBEM_SETIMAGELIST, 0&, hImgList)
    UserControl_Resize
End Property

Public Property Get DroppedWidth() As Long
Attribute DroppedWidth.VB_Description = "Establece el ancho de la lista desplegable"
    DroppedWidth = mDroppedWidth
End Property

Public Property Let DroppedWidth(ByVal NewWidth As Long)
    If NewWidth < UserControl.ScaleWidth / 15 Then
        mDroppedWidth = UserControl.ScaleWidth / 15
    Else
        mDroppedWidth = NewWidth
    End If
    SendMessage hCBox, CB_SETDROPPEDWIDTH, mDroppedWidth, ByVal 0&
    PropertyChanged "DroppedWidth"
End Property

Public Property Get DroppedHeight() As Long
Attribute DroppedHeight.VB_Description = "Establece el alto de la lista desplegable (solo en tiempo de diseño)"
    DroppedHeight = mDroppedHeight
End Property

Public Property Let DroppedHeight(ByVal NewHeight As Long)
    If Ambient.UserMode Then
        MsgBox "Esta propiedad "
    Else
        mDroppedHeight = NewHeight
        PropertyChanged "DroppedHeight"
    End If
End Property

Public Property Get Text() As String

    Dim strBuff As String, lngLen As Long

    lngLen = SendMessage(hCBox, WM_GETTEXTLENGTH, 0, 0)
    
    If lngLen > 0 Then
        lngLen = lngLen + 1
        strBuff = String(lngLen, vbNullChar)
        lngLen = SendMessage(hCBox, WM_GETTEXT, lngLen, ByVal strBuff)
        mText = Left(strBuff, lngLen)
        Text = mText
    End If

End Property

Public Property Let Text(ByVal NewText As String)
    mText = NewText
    PropertyChanged "Text"
    SendMessage hCBox, WM_SETTEXT, 0, ByVal mText
End Property

Public Function GetItemTag(ByVal Index As Long) As String
    GetItemTag = cColl(Index + 1)
End Function

Public Function ShowDropDown(ByVal Visible As Boolean)
    SendMessage hCBox, CB_SHOWDROPDOWN, Visible, ByVal 0&
End Function


Public Function AddItem(Optional ByVal Index As Long = -1, _
                        Optional ByVal Text As String, _
                        Optional ByVal Tag As String, _
                        Optional ByVal Image As Long = -1, _
                        Optional ByVal SelImage As Long = -1, _
                        Optional ByVal Indentation As Long = -1, _
                        Optional ByVal ItemData As Long = 0) As Boolean
    
    Dim CBEI    As COMBOBOXEXITEM
    Dim Flag    As Long
    
    If Text <> "" Then Flag = CBEIF_TEXT
    If Image <> -1 Then
        Flag = Flag Or CBEIF_IMAGE Or CBEIF_SELECTEDIMAGE
        If SelImage = -1 Then SelImage = Image
    Else
        If SelImage <> -1 Then
            Flag = Flag Or CBEIF_SELECTEDIMAGE
        End If
    End If
    If Indentation <> -1 Then Flag = Flag Or CBEIF_INDENT

    If ItemData <> 0 Then Flag = Flag Or CBEIF_LPARAM
    
    With CBEI
        .mask = Flag
        .iItem = Index
        .pszText = Text & vbNullChar
        .iImage = Image
        .iSelectedImage = SelImage
        .iIndent = Indentation
        .lParam = ItemData
    End With
    
    AddItem = SendMessage(hCBox, CBEM_INSERTITEMA, 0&, CBEI)
    
    If Index <> -1 Then
        cColl.Add Tag, , Index + 1
    Else
        cColl.Add Tag
    End If
    
End Function


Public Function ModifyItem(ByVal Index As Long, _
                            Optional ByVal Text As String = vbNullChar, _
                            Optional ByVal Tag As String = vbNullChar, _
                            Optional ByVal Image As Long = -1, _
                            Optional ByVal SelImage As Long = -1, _
                            Optional ByVal Indentation As Long = -1, _
                            Optional ByVal ItemData As Long = 0) As Boolean
                            
    Dim CBEI    As COMBOBOXEXITEM
    Dim Flag    As Long

    If Text <> vbNullChar Then Flag = CBEIF_TEXT
    If Image <> -1 Then
        Flag = Flag Or CBEIF_IMAGE Or CBEIF_SELECTEDIMAGE
        If SelImage = -1 Then SelImage = Image
    Else
        If SelImage <> -1 Then
            Flag = Flag Or CBEIF_SELECTEDIMAGE
        End If
    End If
    
    If Indentation <> -1 Then Flag = Flag Or CBEIF_INDENT
    
    If ItemData <> 0 Then Flag = Flag Or CBEIF_LPARAM

    With CBEI
        .mask = Flag
        .iItem = Index
        .pszText = Text & vbNullChar
        .iImage = Image
        .iSelectedImage = SelImage
        .iIndent = Indentation
        .lParam = ItemData
    End With
    
    If Tag <> vbNullChar Then
        cColl.Item(Index) = Tag
    End If
    
   ModifyItem = SendMessage(hCBox, CBEM_SETITEMA, 0&, CBEI)
   
End Function

Public Function DeleteItem(ByVal Index As Long) As Boolean
    cColl.Remove Index + 1
    DeleteItem = SendMessage(hCBox, CB_DELETESTRING, Index, ByVal 0&) <> -1
End Function

Public Sub ListItemClear()
    Call SendMessage(hCBox, CB_RESETCONTENT, 0&, ByVal 0&)
    Set cColl = New Collection
End Sub

Public Function FindItem(ByVal Text As String)
    FindItem = SendMessage(hCBox, CB_FINDSTRINGEXACT, 0&, ByVal Text)
End Function

Public Property Get SelectedItem() As Long
Attribute SelectedItem.VB_MemberFlags = "400"
    SelectedItem = SendMessage(hCBox, CB_GETCURSEL, 0&, ByVal 0&)
End Property

Public Property Let SelectedItem(ByVal NewIndex As Long)
    Call SendMessage(hCBox, CB_SETCURSEL, NewIndex, ByVal 0&)
End Property

Public Function ListItemCount() As Long
    ListItemCount = SendMessage(hCBox, CB_GETCOUNT, 0&, ByVal 0&)
End Function

Public Function GetItemText(ByVal Index As Long) As String
    Dim LenText     As Long
    Dim sText       As String * 256
    
    LenText = SendMessage(hCBox, CB_GETLBTEXT, Index, ByVal sText)
    If LenText <> -1 Then GetItemText = Left(sText, LenText)
End Function

Public Function GetItemData(ByVal Index As Long) As Long
    GetItemData = ItemInfo(Index, CBEIF_LPARAM)
End Function

Public Function GetItemImage(ByVal Index As Long) As Long
    GetItemImage = ItemInfo(Index, CBEIF_IMAGE)
End Function

Public Function GetItemSelImage(ByVal Index As Long) As Long
    GetItemSelImage = ItemInfo(Index, CBEIF_SELECTEDIMAGE)
End Function

Public Function GetItemIndentation(ByVal Index As Long) As Long
    GetItemIndentation = ItemInfo(Index, CBEM_GETITEMA)
End Function


Private Property Get ItemInfo(Index As Long, Flag As Long) As Variant
 Dim CBEI    As COMBOBOXEXITEM
 Dim ret    As Long
 
    CBEI.mask = Flag
    CBEI.iItem = Index
    ret = SendMessage(hCBox, CBEM_GETITEMA, 0&, CBEI)
    Select Case Flag
        Case CBEIF_IMAGE
            ItemInfo = IIf(ret, CBEI.iImage, -1)
        Case CBEIF_SELECTEDIMAGE
            ItemInfo = IIf(ret, CBEI.iSelectedImage, -1)
        Case CBEIF_INDENT
            ItemInfo = IIf(ret, CBEI.iIndent, -1)
        Case CBEIF_LPARAM
            ItemInfo = IIf(ret, CBEI.lParam, -1)
    End Select
End Property

Public Property Get Enabled() As Boolean
    Enabled = UserControl.Enabled
End Property
Public Property Let Enabled(ByVal New_Enabled As Boolean)
    UserControl.Enabled = New_Enabled
    If (hCBox) Then Call EnableWindow(hCBox, New_Enabled)
End Property


Private Sub cSubClass_WindowProc(bBefore As Boolean, bHandled As Boolean, lReturn As Long, hwnd As Long, uMsg As Long, wParam As Long, ItemData As Long)

    Select Case HiWord(wParam)
        Case CBN_SELCHANGE
            RaiseEvent ItemClick(Me.SelectedItem)
        Case CBN_EDITCHANGE
            RaiseEvent TextChange
        Case CBN_DROPDOWN
            RaiseEvent DroppedShow(True)
        Case CBN_CLOSEUP
            RaiseEvent DroppedShow(False)
    End Select
           
End Sub

Private Function HiWord(ByVal Numero As Long) As Long
    HiWord = Numero \ &H10000 And &HFFFF&
End Function

Private Sub UserControl_GotFocus()
    'Dim lStart As Long, lEnd As Long
    'SendMessageLong m_hWndEdit, EM_GETSEL, VarPtr(lStart), VarPtr(lEnd)
    SetFocus hCBox
    'SendMessageLong m_hWndEdit, EM_SETSEL, lStart, lEnd
End Sub


Private Sub InitWindows()
    Dim hFont As Long
    If hCBox Then DestroyWindow hCBox
    
    Dim Flag As String
    
    Select Case mStyle
        Case Is = [DropDown Combo]
            Flag = CBS_DROPDOWN
        Case Is = [Simple Combo]
            Flag = 0
        Case Is = [DropDown List]
            Flag = CBS_DROPDOWN Or CBS_DROPDOWNLIST Or CBS_SIMPLE
    End Select
    
    Flag = Flag Or CBS_AUTOHSCROLL


    hCBox = CreateWindowEx(DEFAULT_WS_EX, WC_COMBOBOXEXA, vbNullString, DEFAULT_WS Or Flag, 0, 0, UserControl.ScaleWidth / 15, mDroppedHeight, UserControl.hwnd, 0&, App.hInstance, 0&)
    CreateImageList
    SendMessage hCBox, WM_SETTEXT, 0, ByVal mText
    SendMessage hCBox, CB_SETDROPPEDWIDTH, mDroppedWidth, ByVal 0&
    hFont = SendMessageLong(UserControl.hwnd, WM_GETFONT, 0&, 0&)
    Call SendMessageLong(hCBox, WM_SETFONT, hFont, True)
    'SendMessageLong hCBox, CB_LIMITTEXT, 0&, 0&
    
    m_hWndEdit = SendMessageLong(hCBox, CBEM_GETEDITCONTROL, 0&, 0&)
    
End Sub



Private Sub UserControl_Initialize()
    InitCommonControls
    Set cSubClass = New clsSubClass
    Set cColl = New Collection
End Sub

Private Sub UserControl_InitProperties()
    mText = Ambient.DisplayName
    UserControl.Font = Ambient.Font
    mDroppedHeight = 255
    mDroppedWidth = UserControl.ScaleWidth / 15
    Call InitWindows
End Sub


Private Sub UserControl_Resize()
    Dim Rec As RECT
    Dim lWidth As Long
    lWidth = UserControl.ScaleWidth / 15
    GetWindowRect hCBox, Rec
    If hCBox Then MoveWindow hCBox, 0, 0, lWidth, 0, 1
    UserControl.Height = (Rec.Bottom - Rec.Top) * 15
    If mDroppedWidth < lWidth Then mDroppedWidth = lWidth
End Sub


Private Sub UserControl_Terminate()
    If bSubClass Then cSubClass.ssc_UnSubclass UserControl.hwnd
    Set cSubClass = Nothing
    bSubClass = False
    If bCreateImgLst Then ImageList_Destroy hImgList
    DestroyWindow hCBox
End Sub

Public Property Get hwnd() As Long
    hwnd = hCBox
End Property

Public Function ImageListAddBitmap(ByVal hBitmap As Long, Optional ByVal MaskColor As Long = CLR_NONE) As Integer
    If (MaskColor <> CLR_NONE) Then
        ImageListAddBitmap = ImageList_AddMasked(hImgList, hBitmap, MaskColor)
      Else
        ImageListAddBitmap = ImageList_Add(hImgList, hBitmap, 0)
    End If
End Function

Public Function ImageListImageCount() As Long
    If hImgList Then ImageListImageCount = ImageList_GetImageCount(hImgList)
End Function

Public Function ImageListAddIcon(hIcon As Long) As Boolean
    If hImgList Then ImageListAddIcon = ImageList_AddIcon(hImgList, hIcon) <> -1
End Function

Public Function ImageListLoadIconFromFile(ByVal Path As String) As Boolean
    Dim hIcon As Long
    hIcon = LoadImage(App.hInstance, Path, IMAGE_ICON, mIconWidth, mIconHeight, LR_LOADFROMFILE)
    If hIcon Then
        ImageListLoadIconFromFile = Me.ImageListAddIcon(hIcon)
        DestroyIcon hIcon
    End If
End Function

Public Function ImageListLoadIconFromResource(ByVal Section As String) As Boolean
    Dim hIcon As Long
    hIcon = LoadImage(App.hInstance, Section, IMAGE_ICON, mIconWidth, mIconHeight, LR_SHARED Or LR_LOADMAP3DCOLORS)
    If hIcon Then
        ImageListLoadIconFromResource = Me.ImageListAddIcon(hIcon)
        DestroyIcon hIcon
    End If
End Function

Public Function ImageListRemoveIcon(Index As Long) As Boolean
    If hImgList Then ImageListRemoveIcon = ImageList_Remove(hImgList, Index) <> -1
End Function

Public Function ImageListReplaceIcon(Index As Long, NewIcon As Long) As Boolean
    If hImgList Then ImageListReplaceIcon = ImageList_ReplaceIcon(hImgList, Index, NewIcon) <> -1
End Function

Public Sub ImageListClear()
    If hImgList Then ImageList_Remove hImgList, -1
End Sub

Public Function CreateImageList(Optional ByVal ImageWidth As Integer = 16, Optional ByVal ImageHeight As Integer = 16) As Boolean
    mIconWidth = ImageWidth
    mIconHeight = ImageHeight
    If bCreateImgLst Then ImageList_Destroy hImgList
    hImgList = ImageList_Create(ImageWidth, ImageHeight, ILC_COLOR32 Or ILC_MASK, 0, 0)
    CreateImageList = SendMessageLong(hCBox, CBEM_SETIMAGELIST, 0&, hImgList)
    bCreateImgLst = hImgList <> 0
    UserControl_Resize
End Function

Public Property Get Font() As Font
Attribute Font.VB_ProcData.VB_Invoke_Property = "StandardFont;Fuente"
Attribute Font.VB_UserMemId = -512
    Set Font = UserControl.Font
End Property

Public Property Set Font(ByVal objFont As Font)
    Dim hFont As Long
    Set UserControl.Font = objFont
    PropertyChanged "Font"
    hFont = SendMessageLong(UserControl.hwnd, WM_GETFONT, 0&, 0&)
    Call SendMessageLong(hCBox, WM_SETFONT, hFont, True)
    UserControl_Resize
End Property


Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    With PropBag
        mStyle = .ReadProperty("Style", [DropDown Combo])
        Set UserControl.Font = .ReadProperty("Font", Ambient.Font)
        mText = .ReadProperty("Text", Ambient.DisplayName)
        mDroppedHeight = .ReadProperty("DroppedHeight", 255)
        mDroppedWidth = .ReadProperty("DroppedWidth", UserControl.ScaleWidth / 15)
        InitWindows
        If Ambient.UserMode And bSubClass = False Then
            If cSubClass.ssc_Subclass(UserControl.hwnd) Then
                bSubClass = True
                cSubClass.ssc_AddMsg UserControl.hwnd, WM_COMMAND, MSG_AFTER
        End If
    End If
    End With
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    With PropBag
        .WriteProperty "Style", mStyle, [DropDown Combo]
        .WriteProperty "Text", mText, Ambient.DisplayName
        .WriteProperty "DroppedHeight", mDroppedHeight, 255
        .WriteProperty "DroppedWidth", mDroppedWidth, UserControl.ScaleWidth / 15
        .WriteProperty "Font", UserControl.Font, Ambient.Font
    End With
End Sub

Public Property Get SelLength() As Long
Attribute SelLength.VB_MemberFlags = "400"
    Dim lStart As Long, lEnd As Long
    SendMessageLong m_hWndEdit, EM_GETSEL, lStart, lEnd
    SelLength = lEnd - lStart
End Property

Public Property Let SelLength(ByVal lNew As Long)
    Dim lStart As Long, lEnd As Long
    SendMessageLong m_hWndEdit, EM_GETSEL, VarPtr(lStart), VarPtr(lEnd)
    SendMessageLong m_hWndEdit, EM_SETSEL, lStart, lStart + lNew
End Property

Public Property Get SelStart() As Long
Attribute SelStart.VB_MemberFlags = "400"
    SendMessageLong m_hWndEdit, EM_GETSEL, VarPtr(SelStart), 0&
End Property

Public Property Let SelStart(ByVal lNew As Long)
    Dim lStart As Long, lEnd As Long
    SendMessageLong m_hWndEdit, EM_GETSEL, VarPtr(lStart), VarPtr(lEnd)
    SendMessageLong m_hWndEdit, EM_SETSEL, lNew, lEnd - lStart
End Property

Public Property Get MaxLength() As Long
    MaxLength = m_lMaxLength
End Property

Public Property Let MaxLength(ByVal iNew As Long)
    m_lMaxLength = iNew
    SendMessageLong hCBox, CB_LIMITTEXT, m_lMaxLength, 0
End Property

Public Property Get SelText() As String
    On Error Resume Next
    Dim lStart As Long, lEnd As Long
    SendMessageLong m_hWndEdit, EM_GETSEL, VarPtr(lStart), VarPtr(lEnd)
    SelText = Mid(Me.Text, lStart + 1, lEnd - lStart)
End Property
