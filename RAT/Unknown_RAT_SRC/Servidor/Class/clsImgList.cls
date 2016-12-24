VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsImgList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Name = cImgList

Option Explicit

Private Const MAX_PATH = 260

Public Enum IMAGE_LIST_COLOR
    ILC_MASK = &H1
    ILC_COLOR = &H0
    ILC_COLORDDB = &HFE
    ILC_COLOR4 = &H4
    ILC_COLOR8 = &H8
    ILC_COLOR16 = &H10
    ILC_COLOR24 = &H18
    ILC_COLOR32 = &H20
End Enum

Private Declare Function SHGetFileInfo Lib "shell32.dll" Alias "SHGetFileInfoA" (ByVal pszPath As String, ByVal dwFileAttributes As Long, psfi As SHFILEINFO, ByVal cbFileInfo As Long, ByVal uFlags As Long) As Long
Private Declare Function DestroyIcon Lib "user32" (ByVal hIcon As Long) As Long
Private Declare Sub InitCommonControls Lib "comctl32" ()

Private Const SHGFI_ICON = &H100 ' get icon
Private Const SHGFI_SMALLICON = &H1 ' get small icon
Private Const SHGFI_SYSICONINDEX = &H4000 ' get system icon index

Private Type SHFILEINFO
    hIcon As Long ' out: icon
    iIcon As Long ' out: icon index
    dwAttributes As Long ' out: SFGAO_ flags
    szDisplayName As String * MAX_PATH ' out: display name (or path)
    szTypeName As String * 80 ' out: type name
End Type

Private Declare Function ImageList_Create Lib "comctl32.dll" (ByVal cx As Long, ByVal cy As Long, ByVal Flags As Long, ByVal cInitial As Long, ByVal cGrow As Long) As Long
Private Declare Function ImageList_Destroy Lib "comctl32.dll" (ByVal himl As Long) As Long
Private Declare Function ImageList_ReplaceIcon Lib "comctl32.dll" (ByVal himl As Long, ByVal i As Long, ByVal hIcon As Long) As Long
Private Declare Function ImageList_AddIcon Lib "comctl32.dll" (ByVal hImageList As Long, ByVal hIcon As Long) As Long
Private Declare Function ImageList_GetImageCount Lib "comctl32.dll" (ByVal himl As Long) As Long
Private Declare Function ImageList_SetImageCount Lib "comctl32.dll" (ByVal himl As Long, ByVal uNewCount As Long) As Long
Private Declare Function ImageList_SetBkColor Lib "comctl32" (ByVal hImageList As Long, ByVal clrBk As Long) As Long
Private Declare Function OleTranslateColor Lib "olepro32.dll" (ByVal OLE_COLOR As Long, ByVal hPalette As Long, pccolorref As Long) As Long
Private Declare Function LoadImage Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal dwImageType As Long, ByVal dwDesiredWidth As Long, ByVal dwDesiredHeight As Long, ByVal dwFlags As Long) As Long
Private Declare Function ImageList_Add Lib "comctl32" (ByVal hImageList As Long, ByVal hBitmap As Long, ByVal hBitmapMask As Long) As Long
Private Declare Function ImageList_AddMasked Lib "comctl32" (ByVal hImageList As Long, ByVal hbmImage As Long, ByVal crMask As Long) As Long
Private Declare Function ImageList_GetIcon Lib "comctl32.dll" (ByVal himl As Long, ByVal i As Long, ByVal Flags As Long) As Long

Private Const CLR_NONE              As Long = &HFFFFFFFF
Private Const LR_LOADFROMFILE       As Long = &H10
Private Const LR_LOADMAP3DCOLORS    As Long = &H1000
Private Const LR_SHARED             As Long = &H8000&
Private Const IMAGE_ICON            As Long = 1
Private Const ILD_TRANSPARENT As Long = 1&

Private hwIL        As Long
Private m_Width     As Long
Private m_Height    As Long
Dim NullIcn         As Long

Public Property Let BackColor(ByVal NewColor As OLE_COLOR)
    Dim lColor As Long
    OleTranslateColor NewColor, 0, lColor
    ImageList_SetBkColor hwIL, lColor
End Property



Property Get NullIcon(ByVal h As Long)
    NullIcn = h
End Property

Property Get hwnd() As Long
    hwnd = hwIL
End Property

Property Get ImageCount() As Long
    ImageCount = ImageList_GetImageCount(hwIL)
End Property

Public Function Init(Optional ByVal Width As Long = 16, Optional ByVal Height As Long = 16, Optional ByVal Colors As IMAGE_LIST_COLOR = ILC_COLOR32) As Long
    m_Width = Width: m_Height = Height
    hwIL = ImageList_Create(Width, Height, Colors Or ILC_MASK, 1, 1)
    Init = hwIL
End Function

Sub Clear()
    ImageList_SetImageCount hwIL, 0
    'Call Class_Terminate
    'hwIL = 0
End Sub

Private Sub Class_Initialize()
    InitCommonControls
    'Call CreateMe
End Sub

Private Sub Class_Terminate()
    If hwIL Then Call ImageList_Destroy(hwIL)
End Sub

Public Function GetIcon(ByVal Index As Long) As Long
    If hwIL Then
        GetIcon = ImageList_GetIcon(hwIL, Index, ILD_TRANSPARENT)
    End If
End Function


Sub AddIcon(ByVal hIcon As Long)
    'If hwIL = 0 Then CreateMe
    'Call ImageList_ReplaceIcon(hwIL, -1, hIcon)
    ImageList_AddIcon hwIL, hIcon
End Sub

Function AddIconFromFile2(ByVal Path As String) As Long

    'If hwIL = 0 Then CreateMe
    
    Dim hIcon As Long
    Dim shInfo As SHFILEINFO
    
    If m_Width = 16 And m_Height = 16 Then
        SHGetFileInfo Path, 0, shInfo, Len(shInfo), SHGFI_ICON Or SHGFI_SMALLICON
    Else
        SHGetFileInfo Path, 0, shInfo, Len(shInfo), SHGFI_ICON Or SHGFI_ICON
    End If
    
    If shInfo.hIcon = 0 Then shInfo.hIcon = NullIcn
    hIcon = shInfo.hIcon
    
    AddIcon hIcon
    DestroyIcon hIcon
    AddIconFromFile2 = ImageList_GetImageCount(hwIL) - 1

End Function

Public Function AddIconFromFile(ByVal Path As String) As Boolean
    Dim hIcon As Long
    hIcon = LoadImage(App.hInstance, Path, IMAGE_ICON, m_Width, m_Height, LR_LOADFROMFILE)
    If hIcon Then
        AddIconFromFile = ImageList_AddIcon(hwIL, hIcon)
        DestroyIcon hIcon
    End If
End Function

Public Function AddBitmap(ByVal hBitmap As Long, Optional ByVal MaskColor As Long = CLR_NONE) As Boolean
    
    If (hwIL) Then
        If (MaskColor <> CLR_NONE) Then
            AddBitmap = ImageList_AddMasked(hwIL, hBitmap, MaskColor)
          Else
            AddBitmap = ImageList_Add(hwIL, hBitmap, 0)
        End If
    End If
End Function
