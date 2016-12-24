VERSION 5.00
Begin VB.Form FrmExplorer 
   Caption         =   "Form1"
   ClientHeight    =   8325
   ClientLeft      =   165
   ClientTop       =   600
   ClientWidth     =   10500
   Icon            =   "FrmExplorer.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8325
   ScaleWidth      =   10500
   Begin VB.PictureBox Picture4 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      FillColor       =   &H00CCCCCC&
      ForeColor       =   &H00CCCCCC&
      Height          =   1440
      Left            =   8040
      ScaleHeight     =   1440
      ScaleWidth      =   1440
      TabIndex        =   45
      Top             =   6480
      Visible         =   0   'False
      Width           =   1440
   End
   Begin VB.Timer Timer1 
      Left            =   4920
      Top             =   6840
   End
   Begin Servidor.ucProgressBar ucProgressBar1 
      Height          =   255
      Left            =   11400
      TabIndex        =   3
      Top             =   11640
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   450
   End
   Begin Servidor.ucStatusbar ucStatusbar1 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      Top             =   7950
      Width           =   10500
      _ExtentX        =   18521
      _ExtentY        =   661
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      Height          =   240
      Left            =   170
      ScaleHeight     =   16
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   16
      TabIndex        =   2
      Top             =   720
      Width           =   240
   End
   Begin Servidor.ucToolbar ucToolbar1 
      Align           =   1  'Align Top
      Height          =   615
      Left            =   0
      Top             =   0
      Width           =   10500
      _ExtentX        =   18521
      _ExtentY        =   1085
   End
   Begin Servidor.ComboBoxEx ComboBoxEx1 
      Height          =   330
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   11775
      _ExtentX        =   20770
      _ExtentY        =   582
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin Servidor.ucListView ucListView1 
      Height          =   5295
      Left            =   4080
      TabIndex        =   0
      Top             =   1080
      Width           =   6135
      _ExtentX        =   10821
      _ExtentY        =   9340
   End
   Begin Servidor.ScrollControl ScrollControl1 
      Height          =   13515
      Left            =   0
      TabIndex        =   4
      Top             =   1080
      Width           =   3735
      _ExtentX        =   6588
      _ExtentY        =   23839
      AutoScrollToFocus=   0   'False
      Begin VB.PictureBox Picture3 
         BorderStyle     =   0  'None
         Height          =   13215
         Left            =   1440
         ScaleHeight     =   13215
         ScaleWidth      =   4125
         TabIndex        =   39
         Top             =   0
         Width           =   4125
         Begin Servidor.ExplorerFrame ExplorerFrame1 
            Height          =   600
            Index           =   2
            Left            =   0
            TabIndex        =   42
            Top             =   1320
            Width           =   4095
            _ExtentX        =   7223
            _ExtentY        =   1058
            Object.Height          =   40
            Caption         =   "Detalles"
            Begin VB.PictureBox PicThumbnail 
               AutoRedraw      =   -1  'True
               BorderStyle     =   0  'None
               Height          =   2400
               Left            =   600
               ScaleHeight     =   2400
               ScaleWidth      =   2400
               TabIndex        =   43
               Top             =   600
               Visible         =   0   'False
               Width           =   2400
            End
            Begin VB.Label LblDetails 
               AutoSize        =   -1  'True
               Height          =   195
               Left            =   120
               TabIndex        =   44
               Top             =   600
               Width           =   480
               WordWrap        =   -1  'True
            End
         End
         Begin Servidor.ExplorerFrame ExplorerFrame1 
            Height          =   615
            Index           =   1
            Left            =   0
            TabIndex        =   41
            Top             =   720
            Width           =   4095
            _ExtentX        =   7223
            _ExtentY        =   1085
            Object.Height          =   41
            Caption         =   "Otros sitios"
         End
         Begin Servidor.ExplorerFrame ExplorerFrame1 
            Height          =   615
            Index           =   0
            Left            =   0
            TabIndex        =   40
            Top             =   120
            Width           =   4095
            _ExtentX        =   7223
            _ExtentY        =   1085
            Object.Height          =   41
            Caption         =   "Tareas de archivo y carpeta"
         End
      End
      Begin VB.PictureBox Picture2 
         BorderStyle     =   0  'None
         Height          =   12495
         Left            =   60
         ScaleHeight     =   12495
         ScaleWidth      =   3645
         TabIndex        =   5
         Top             =   0
         Visible         =   0   'False
         Width           =   3645
         Begin Servidor.ExplorerFrame ExFrame1 
            Height          =   3975
            Index           =   0
            Left            =   0
            TabIndex        =   6
            Top             =   120
            Width           =   3615
            _ExtentX        =   6376
            _ExtentY        =   7011
            Object.Height          =   265
            Caption         =   "Buscar según los criterios."
            IsSpecial       =   -1  'True
            Icon            =   "FrmExplorer.frx":000C
            Begin VB.TextBox Text3 
               Height          =   315
               Left            =   240
               TabIndex        =   10
               Text            =   "C:\"
               Top             =   2400
               Width           =   2895
            End
            Begin VB.TextBox Text2 
               Height          =   315
               Left            =   240
               TabIndex        =   9
               Top             =   1680
               Width           =   2895
            End
            Begin VB.TextBox Text1 
               Height          =   315
               Left            =   240
               TabIndex        =   8
               Top             =   960
               Width           =   2895
            End
            Begin VB.CommandButton CmdBuscar 
               Caption         =   "Buscar"
               Default         =   -1  'True
               Height          =   435
               Left            =   1680
               TabIndex        =   7
               Top             =   3240
               Width           =   1455
            End
            Begin VB.Label Label2 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Buscar en:"
               Height          =   195
               Index           =   2
               Left            =   240
               TabIndex        =   13
               Top             =   2160
               Width           =   765
            End
            Begin VB.Label Label2 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Una palabra o frase dentro del archivo:"
               Height          =   195
               Index           =   1
               Left            =   240
               TabIndex        =   12
               Top             =   1440
               Width           =   2760
            End
            Begin VB.Label Label2 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Todo o parte del nombre del archivo:"
               Height          =   195
               Index           =   0
               Left            =   240
               TabIndex        =   11
               Top             =   720
               Width           =   2610
            End
         End
         Begin Servidor.ExplorerFrame ExFrame1 
            Height          =   3255
            Index           =   1
            Left            =   0
            TabIndex        =   14
            Top             =   4080
            Width           =   3615
            _ExtentX        =   6376
            _ExtentY        =   5741
            Object.Height          =   217
            Caption         =   "¿Cuándo fue modificado?"
            Begin VB.ComboBox Combo2 
               Enabled         =   0   'False
               Height          =   315
               ItemData        =   "FrmExplorer.frx":0CE6
               Left            =   480
               List            =   "FrmExplorer.frx":0CF3
               TabIndex        =   20
               Top             =   1920
               Width           =   2655
            End
            Begin VB.OptionButton Option2 
               Caption         =   "Especificar fechas"
               Height          =   255
               Index           =   4
               Left            =   240
               TabIndex        =   19
               Top             =   1560
               Width           =   2895
            End
            Begin VB.OptionButton Option2 
               Caption         =   "El año pasado"
               Height          =   255
               Index           =   3
               Left            =   240
               TabIndex        =   18
               Top             =   1320
               Width           =   2895
            End
            Begin VB.OptionButton Option2 
               Caption         =   "El mes pasado"
               Height          =   255
               Index           =   2
               Left            =   240
               TabIndex        =   17
               Top             =   1080
               Width           =   2895
            End
            Begin VB.OptionButton Option2 
               Caption         =   "La semana pasada"
               Height          =   255
               Index           =   1
               Left            =   240
               TabIndex        =   16
               Top             =   840
               Width           =   2895
            End
            Begin VB.OptionButton Option2 
               Caption         =   "No lo recuerdo"
               Height          =   255
               Index           =   0
               Left            =   240
               TabIndex        =   15
               Top             =   600
               Width           =   2895
            End
            Begin Servidor.ucDateTime ucDateTime1 
               Height          =   315
               Left            =   1080
               TabIndex        =   21
               Top             =   2280
               Width           =   2055
               _ExtentX        =   3625
               _ExtentY        =   556
               Enabled         =   0   'False
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "MS Sans Serif"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
            End
            Begin Servidor.ucDateTime ucDateTime2 
               Height          =   315
               Left            =   1080
               TabIndex        =   22
               Top             =   2640
               Width           =   2055
               _ExtentX        =   3625
               _ExtentY        =   556
               Enabled         =   0   'False
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "MS Sans Serif"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
            End
            Begin VB.Label Label3 
               BackStyle       =   0  'Transparent
               Caption         =   "a"
               Height          =   255
               Index           =   1
               Left            =   480
               TabIndex        =   24
               Top             =   2685
               Width           =   255
            End
            Begin VB.Label Label3 
               BackStyle       =   0  'Transparent
               Caption         =   "de"
               Height          =   255
               Index           =   0
               Left            =   480
               TabIndex        =   23
               Top             =   2325
               Width           =   255
            End
         End
         Begin Servidor.ExplorerFrame ExFrame1 
            Height          =   2655
            Index           =   2
            Left            =   0
            TabIndex        =   25
            Top             =   7320
            Width           =   3615
            _ExtentX        =   6376
            _ExtentY        =   4683
            Object.Height          =   177
            Caption         =   "¿Que tamaño tiene?"
            Begin VB.OptionButton Option1 
               Caption         =   "No lo recuerdo"
               Height          =   255
               Index           =   0
               Left            =   240
               TabIndex        =   31
               Top             =   720
               Value           =   -1  'True
               Width           =   3135
            End
            Begin VB.OptionButton Option1 
               Caption         =   "Pequeño (menos de 100 KB)"
               Height          =   255
               Index           =   1
               Left            =   240
               TabIndex        =   30
               Top             =   960
               Width           =   3135
            End
            Begin VB.OptionButton Option1 
               Caption         =   "Mediano (menos de 1 MB)"
               Height          =   255
               Index           =   2
               Left            =   240
               TabIndex        =   29
               Top             =   1200
               Width           =   3135
            End
            Begin VB.OptionButton Option1 
               Caption         =   "Grande (más de 1 MB)"
               Height          =   255
               Index           =   3
               Left            =   240
               TabIndex        =   28
               Top             =   1440
               Width           =   3135
            End
            Begin VB.OptionButton Option1 
               Caption         =   "Especificar tamaño (en KB)"
               Height          =   255
               Index           =   4
               Left            =   240
               TabIndex        =   27
               Top             =   1680
               Width           =   3135
            End
            Begin VB.ComboBox Combo1 
               Enabled         =   0   'False
               Height          =   315
               ItemData        =   "FrmExplorer.frx":0D39
               Left            =   480
               List            =   "FrmExplorer.frx":0D43
               Style           =   2  'Dropdown List
               TabIndex        =   26
               Top             =   2040
               Width           =   1335
            End
            Begin Servidor.UpDownd UpDownd1 
               Height          =   315
               Left            =   1920
               TabIndex        =   32
               Top             =   2040
               Width           =   975
               _ExtentX        =   1720
               _ExtentY        =   556
               Max             =   20000000
               Enabled         =   0   'False
            End
         End
         Begin Servidor.ExplorerFrame ExFrame1 
            Height          =   2295
            Index           =   3
            Left            =   0
            TabIndex        =   33
            Top             =   9960
            Width           =   3615
            _ExtentX        =   6376
            _ExtentY        =   4048
            Object.Height          =   153
            Caption         =   "Más opciones avanzadas"
            Begin VB.CheckBox Check1 
               Caption         =   "Buscar dentro de carpetas comprimidas"
               Height          =   255
               Index           =   4
               Left            =   240
               TabIndex        =   38
               Top             =   1680
               Width           =   3135
            End
            Begin VB.CheckBox Check1 
               Caption         =   "Distinguir mayúsculas de minúsculas"
               Height          =   255
               Index           =   3
               Left            =   240
               TabIndex        =   37
               Top             =   1440
               Width           =   3135
            End
            Begin VB.CheckBox Check1 
               Caption         =   "Buscar en subcarpetas"
               Height          =   255
               Index           =   2
               Left            =   240
               TabIndex        =   36
               Top             =   1200
               Value           =   1  'Checked
               Width           =   3135
            End
            Begin VB.CheckBox Check1 
               Caption         =   "Buscar en carpetas y archivos ocultos"
               Height          =   255
               Index           =   1
               Left            =   240
               TabIndex        =   35
               Top             =   960
               Width           =   3135
            End
            Begin VB.CheckBox Check1 
               Caption         =   "Buscar en carpetas de sistema"
               Height          =   255
               Index           =   0
               Left            =   240
               TabIndex        =   34
               Top             =   720
               Width           =   3135
            End
         End
      End
   End
End
Attribute VB_Name = "FrmExplorer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
' ---------------------------------------------------
' Autor:            Leandro I. Ascierto
' Date:             17 de Julio de 2010
' Web:              www.leandroascierto.com.ar
' Requirements:     Windows XP or Later
' History:          06/10/2010 First
' ---------------------------------------------------
Private Declare Function ExtractIconEx Lib "shell32.dll" Alias "ExtractIconExA" (ByVal lpszFile As String, ByVal nIconIndex As Long, phiconLarge As Long, phiconSmall As Long, ByVal nIcons As Long) As Long
Private Declare Function DestroyIcon Lib "user32" (ByVal hIcon As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function ImageList_Draw Lib "comctl32.dll" (ByVal himl As Long, ByVal i As Long, ByVal hdcDst As Long, ByVal X As Long, ByVal Y As Long, ByVal fStyle As Long) As Long
Private Declare Function ImageList_GetIcon Lib "comctl32.dll" (ByVal himl As Long, ByVal i As Long, ByVal Flags As Long) As Long
Private Declare Function Rectangle Lib "gdi32.dll" (ByVal hdc As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long) As Long



Private Type History
    IdList      As Long
    FolderName  As String
End Type

Private Type ListViewItemData
    IdList      As Long
    PathAttr    As Long
    PathCanRead As Boolean
    PathCanWrite As Boolean
    PathSize    As String
End Type

Public Enum eDateTimeFilter
    NoDateTimeFilter = 0
    LastWriteTime = 1
    CreationTime = 2
    LastAccessTime = 3
End Enum

Public Enum eFileSizeFilter
    NoFilterSize = 0
    MinSize = 1
    MaxSize = 2
    MinAndMax = 3
End Enum

Public Enum eViewMode
    VM_THUMBNAILS = 1
    VM_MOSAICS = 2
    VM_ICONS = 3
    VM_LIST = 4
    VM_DETAILS = 5
End Enum

Private Const SW_SHOWNORMAL As Long = &H1
Private Const SW_HIDE As Long = 0

Private Const WM_SETICON            As Long = &H80
Private Const ILD_TRANSPARENT       As Long = &H1
Private Const ICON_SMALL            As Long = 0

Private m_ColumnSortOrder(4)        As eSortOrderConstants
Private m_CurrentColumn             As Integer
Public clsType                      As ClassType
Public ParentID                     As Long
Public SocketID                     As Long
Private tHistoryBack()              As History
Private tHistoryFordward()          As History
Private mIDLParentPath              As Long
Private mNameParentPath             As String
Private cMenuImage                  As clsMenuImage
Private m_ClipBoardAvailable        As Boolean
Private m_CurFolderCanWrite         As Boolean
Private ListData()                  As ListViewItemData
Private IsInSearch                  As Boolean
Private IsLVSearchResult            As Boolean
Private m_Data                      As String
Private CurrentItem                 As Long
Private cImgList                    As clsImgList
Private IsBlock                     As Boolean
Private fCount                      As Long
Private ArrIconsImgPrevia()         As Long
Private cILVistaPrevia              As clsImgList
Private m_ViewMode                  As eViewMode
Private TempPath                    As String
Private TempFileName                As String

Public Sub Socket_DataArrival(id As Long, IP As String, Puerto As String, Data As String)

    On Error GoTo ErrHaddle
    
    Dim lRet1       As Long
    Dim lRet2       As Long
    Dim sCommand    As String
    Dim sBuf        As String
    
    m_Data = m_Data & Data

    lRet1 = InStr(m_Data, END_DATA)
    
    If lRet1 Then
   
        sBuf = Left$(m_Data, lRet1 - 1)
        m_Data = Mid$(m_Data, lRet1 + Len(END_DATA))

        lRet2 = InStr(sBuf, Delimiter)
        sCommand = Left(sBuf, lRet2 - 1)
        sBuf = Mid(sBuf, lRet2 + 1)

        Select Case sCommand
            Case 0
                CompleteComboBoxEx sBuf
            Case 1
                CompleteHeather sBuf
            Case 2
                CompleteListview sBuf
            Case 3
                ucProgressBar1.Marquee = False
                ucProgressBar1.Visible = False
            Case 4
                'reserved
            Case 5
                PicThumbnail.Visible = False
                LblDetails.Caption = Replace(sBuf, Chr$(63), vbNullString)
                LblDetails.Top = 600
                ExplorerFrame1(2).SetHeight = LblDetails.Top + LblDetails.Height + 240
            Case 6
                Dim ArrImage() As Byte
                ArrImage = StrConv(sBuf, vbFromUnicode)
                PicThumbnail.Cls
                DrawThumbnailFromStream PicThumbnail.hdc, ArrImage, PicThumbnail.ScaleWidth / Screen.TwipsPerPixelX, PicThumbnail.ScaleHeight / Screen.TwipsPerPixelY
                PicThumbnail.Refresh
                LblDetails.Top = PicThumbnail.Top + PicThumbnail.Height + 240
                ExplorerFrame1(2).SetHeight = LblDetails.Top + LblDetails.Height + 240
                PicThumbnail.Visible = True
            Case 7
                CompleteSearch sBuf
            Case 8
                IsInSearch = False
                ucProgressBar1.Marquee = False
                ucProgressBar1.Visible = False
                ucStatusbar1.PanelText(1) = ucListView1.Count & " Objetos"
                CmdBuscar.Caption = "Buscar"
                Beep
            Case 9
                ShowError sBuf
            Case 10
                FrmProgresZip.ucProgressBar1.Value = val(sBuf)
            Case 11
                Unload FrmProgresZip
                Call Actualizar
                DoEvents
                Me.SetFocus
            Case 12
                CreatePreview sBuf
 
        End Select
        
        If Len(m_Data) Then
            If InStr(m_Data, END_DATA) Then Call Me.Socket_DataArrival(id, IP, Puerto, vbNullString)
        End If

    End If
    
    Exit Sub
    
ErrHaddle:
    Debug.Print err.Number, err.Description

End Sub


Private Sub CreatePreview(ByVal sBuf As String)

    Dim ArrImage()      As Byte
    Dim sListItem       As String
    Dim ArrListItem()   As String
    Dim oPic            As StdPicture
    Dim lRet            As Long
    Dim i As Long, j As Long
    Dim lCount          As Long
    
    lRet = InStr(sBuf, Delimiter & "@")
    sListItem = Left$(sBuf, lRet)
    ArrListItem = Split(sListItem, Delimiter)
    ArrImage = StrConv(Mid$(sBuf, lRet + 2), vbFromUnicode)
    
    Set oPic = LoadPictureFromStream(ArrImage)
    
    If Not oPic Is Nothing Then
        lCount = cILVistaPrevia.ImageCount - 1

        cILVistaPrevia.AddBitmap oPic
        

        For j = 0 To UBound(ArrListItem) - 1
            For i = ucListView1.Count - 1 To 0 Step -1
                If ListData(ucListView1.ItemData(i)).IdList = ArrListItem(j) Then
                    ucListView1.ItemIcon(i) = lCount + j + 1
                    Exit For
                End If
            Next
        Next
        
        ReDim Preserve ArrIconsImgPrevia(UBound(ArrIconsImgPrevia) + UBound(ArrListItem))
    
    End If

End Sub

Private Sub CmdBuscar_Click()

    Dim FilterDateTime  As eDateTimeFilter
    Dim FilterFileSize  As eFileSizeFilter
    Dim MinDate         As Date
    Dim MaxDate         As Date
    Dim MinFileSize     As Currency
    Dim MaxFileSize     As Currency
    Dim sCommand        As String
    Dim hIcon           As Long
    
    If CmdBuscar.Caption = "Buscar" Then
    
        If Not IsLVSearchResult Then
            AddHistory tHistoryBack, ComboBoxEx1.Tag, mNameParentPath
        End If
        
        IsLVSearchResult = True
        CmdBuscar.Caption = "Cancelar"
        ComboBoxEx1.Text = "Resultado de la búsqueda"
        Me.Caption = "Resultado de la búsqueda"
        
        Call ChangeIcon(ComboBoxEx1.hImageList, 15)
        
        ucListView1.Clear
        ReDim ListData(0)
        
        ucProgressBar1.Marquee = True
        ucProgressBar1.Visible = True
        
        Select Case True
            Case Option2(0).Value
                FilterDateTime = NoDateTimeFilter
            Case Option2(1).Value
                FilterDateTime = LastWriteTime
                MinDate = Now - 7
                MaxDate = Now
            Case Option2(2).Value
                FilterDateTime = LastWriteTime
                MinDate = Now - 31
                MaxDate = Now
            Case Option2(3).Value
                FilterDateTime = LastWriteTime
                MinDate = Now - 365
                MaxDate = Now
            Case Option2(4).Value
                FilterDateTime = Combo2.ListIndex + 1
                MinDate = ucDateTime1.DateTime
                MaxDate = ucDateTime2.DateTime
        End Select
        
        Select Case True
            Case Option1(0).Value
                FilterFileSize = NoFilterSize
            Case Option1(1).Value
                FilterFileSize = MaxSize
                MaxFileSize = 1024@ * 100@
            Case Option1(2).Value
                FilterFileSize = MaxSize
                MaxFileSize = 1024@ * 1000@
            Case Option1(3).Value
                FilterFileSize = MinSize
                MinFileSize = 1024@ * 1000@
            Case Option1(4).Value
                FilterFileSize = Combo1.ListIndex + 1
                If FilterFileSize = MinSize Then
                    MinFileSize = 1024 * CCur(UpDownd1.Position)
                Else
                    MaxFileSize = 1024 * CCur(UpDownd1.Position)
                End If
        End Select
        
        sCommand = JoinCommand(13, Text1, Text2, Text3, FilterDateTime, MinDate, MaxDate, FilterFileSize, MinFileSize, MaxFileSize, Check1(0), Check1(1), Check1(2), Check1(3), Check1(4))
        ucStatusbar1.PanelText(1) = "Buscando..."
        IsInSearch = True
    Else
        IsInSearch = False
        sCommand = 12 & Delimiter
        
        CmdBuscar.Caption = "Buscar"
        ucStatusbar1.PanelText(1) = ucListView1.Count & " Objetos"
        ucProgressBar1.Marquee = False
        ucProgressBar1.Visible = False
    End If
        
    WinSock32.SendData SocketID, sCommand & END_DATA
End Sub


Private Function JoinCommand(ParamArray Elements() As Variant) As String
    Dim vItem As Variant
    
    For Each vItem In Elements
        JoinCommand = JoinCommand & CStr(vItem) & Delimiter
    Next
End Function


Private Sub ComboBoxEx1_ItemClick(Index As Long)

    If Navigate(ComboBoxEx1.GetItemData(Index)) Then
        AddHistory tHistoryBack, ComboBoxEx1.GetItemData(Index), ComboBoxEx1.GetItemText(Index)
        ReDim tHistoryFordward(0)
        ucToolbar1.ButtonEnabled(1) = True
        ucToolbar1.ButtonEnabled(2) = False
    
        Me.Caption = ComboBoxEx1.GetItemText(Index)
        Call ChangeIcon(ComboBoxEx1.hImageList, ComboBoxEx1.GetItemImage(Index))
    End If
    
    ucListView1.SetFocus
    
End Sub


Private Function ShowMenuViewMode(ByVal X As Long, Y As Long) As Long

    Dim hMenu As Long
    
    hMenu = CreatePopupMenu()
    AppendMenu hMenu, MF_STRING, 1, "Vistas en miniatura"
    AppendMenu hMenu, MF_STRING, 2, "Mosaicos"
    AppendMenu hMenu, MF_STRING, 3, "Iconos"
    AppendMenu hMenu, MF_STRING, 4, "Lista"
    AppendMenu hMenu, MF_STRING, 5, "Detalles"
    
    Call CheckMenuRadioItem(hMenu, m_ViewMode - 1, 4, m_ViewMode - 1, &H400)
    ShowMenuViewMode = TrackPopupMenuEx(hMenu, TPM_RETURNCMD, X, Y, Me.hwnd, ByVal 0&)
    
    DestroyMenu hMenu
    
End Function


Private Sub ExplorerFrame1_Resize(Index As Integer)

    Dim i As Long
    If Picture3.Visible = False Then Exit Sub

    For i = 1 To ExplorerFrame1.Count - 1
        ExplorerFrame1(i).Top = ExplorerFrame1(i - 1).Top + ExplorerFrame1(i - 1).Height
    Next
    
    Picture3.Height = ExplorerFrame1(2).Top + ExplorerFrame1(2).Height

    ScrollControl1.MaxVertical = Picture3.ScaleHeight / Screen.TwipsPerPixelY
    ScrollControl1.PosVertical = ExplorerFrame1(Index).Top / Screen.TwipsPerPixelY
        
End Sub


Private Sub Form_Load()

    Dim i       As Long
    Dim lColor  As Long
    Dim hIcon   As Long
    
    ucProgressBar1.Marquee = True
    
    m_ViewMode = VM_DETAILS
    
    Set cILVistaPrevia = New clsImgList
    ReDim ArrIconsImgPrevia(0)
    
    cILVistaPrevia.Init 96, 96, ILC_COLOR16
    clsType = enuExplorer
    
    ReDim tHistoryBack(0)
    ReDim tHistoryFordward(0)

    ComboBoxEx1.CreateImageList 16, 16
    ComboBoxEx1.ImageListBackColor = vbWindowBackground

    ImgLAddSHELL32Icon 6, 7, 8, 9, 10, 11, 12, 34, 126, 128, 129, 127, 43, 20, 3, 55

    With ucListView1
    
        .Initialize

        .hSmallImgList = SysImageListSmall
        '.InitializeImageListHeader
        '.ImageListHeader_AddBitmap LoadResPicture(3, vbResBitmap), vbMagenta
        .LabelEdit = True

        Call .ColumnAdd(0, "Nombre", 220, [caLeft])
        Call .ColumnAdd(1, "Tamaño", 80, [caRight])
        Call .ColumnAdd(2, "Tipo", 200, [caLeft])
        Call .ColumnAdd(3, "Fecha de modificación", 130, [caLeft])
        Call .ColumnAdd(4, "Atributos", 60, [caLeft])
        
        If OS_Version > 5 Then Call SetWindowTheme(.hwnd, StrPtr("explorer"), 0)
        .ViewMode = vmDetails
        .OLEDragMode = 1 'drgAutomatic
    End With
    
    With ucToolbar1
    
        Dim hBitmap As Long
        
        Call .Initialize(ImageSize:=24, FlatStyle:=True, ListStyle:=True, Divider:=True)
        Call .AddBitmap(LoadResPicture(2, vbResBitmap))
        
        Call .AddButton("Atrás", 0, "Atrás", [eDropDown])
        Call .AddButton(, 1, "Adelante", [eDropDown])
        Call .AddButton(, 2, "Up")
        Call .AddButton(, , , [eSeparator])
        Call .AddButton(, 3, "Actualizar")
        Call .AddButton(, 4, "Detener")
        Call .AddButton(, , , [eSeparator])
        Call .AddButton("Buscar", 5, , eCheckGroup)
        Call .AddButton("Carpetas", 6, , eCheckGroup)
        Call .AddButton(, , , [eSeparator])
        Call .AddButton(, 7, "View", [eWholeDropDown])

            .ButtonChecked(9) = True
            .ButtonEnabled(1) = False
            .ButtonEnabled(2) = False
            .ButtonEnabled(3) = False
            .Tansparent = True
            .UseThemeReBar = True

        Let .Height = .ToolbarHeight * Screen.TwipsPerPixelY
    End With
    
    With ucStatusbar1
        Call .Initialize(SizeGrip:=True)
        Call .InitializeIconList
        Call .AddIcon(Me.Icon)
        Call .AddPanel(, , , [sbSpring])
        Call .AddPanel(, 200, , [sbContents], "Listo")
        Call .AddPanel(, , , [sbContents], "IP:" & WinSock32.IPAddresses(CStr(SocketID)), , 0)
    End With

    ComboBoxEx1.Text = ""
    
    If SocketID <> 0 Then
        WinSock32.SendData SocketID, "4" & Delimiter & END_DATA
    Else
        MsgBox "Error de conexión, intente nuevamente"
    End If

    lColor = ExFrame1(1).BackColor
    
    Picture2.Left = 60
    Picture2.BackColor = lColor
    Picture3.BackColor = lColor
    Picture3.Left = 60
    
    ScrollControl1.BackColor = lColor
    
    lColor = ExFrame1(1).PanelColor
    
    For i = 0 To 4
        Check1(i).BackColor = lColor
        Option1(i).BackColor = lColor
        Option2(i).BackColor = lColor
    Next
    
    LblDetails.BackColor = lColor
    PicThumbnail.BackColor = lColor
    
    ExFrame1(1).Collapse = True
    ExFrame1(2).Collapse = True
    ExFrame1(3).Collapse = True
    
    ExplorerFrame1_Resize 0
    ScrollControl1_Resize
    
    ImageList_Draw ComboBoxEx1.hImageList, 7, Picture1.hdc, 0, 0, &H1
    
    Set cImgList = New clsImgList
    
    cImgList.Init 16, 16
    cImgList.AddBitmap LoadResPicture(5, vbResBitmap)
    
    ExplorerFrame1(0).hImgList = cImgList.hwnd
    
    Set cMenuImage = New clsMenuImage
    
    With cMenuImage
        .Init Me.hwnd, 16, 16
  
        For i = 0 To 14
            hIcon = cImgList.GetIcon(i)
            .AddIconFromHandle hIcon, , True
            DestroyIcon hIcon
        Next
        
    End With
 
    Combo1.ListIndex = 0
    Combo2.ListIndex = 0
    
    MdlINI.ReadFormPosAndSize Me
End Sub


Private Function ImgLAddSHELL32Icon(ParamArray vID())

    Dim hIcon       As Long
    Dim IconID      As Variant
    
    For Each IconID In vID
        ExtractIconEx "SHELL32.dll", IconID, ByVal 0&, hIcon, 1
        ComboBoxEx1.ImageListAddIcon hIcon
        DestroyIcon hIcon
    Next
    
End Function


Public Sub Socket_Conect(id As Long, IP As String, Puerto As String)
'
End Sub


Public Sub ShowError(ByVal sData As String)
    On Error Resume Next
    Dim sItem() As String
    sItem = Split(sData, Delimiter)
    MsgBox "Error: " & sItem(0) & ". " & sItem(1), vbCritical
    DoEvents
    Me.SetFocus
End Sub
    

Private Sub CompleteComboBoxEx(ByVal sData As String)
    Dim sLines()    As String
    Dim sItem()     As String
    Dim hIcon       As Long
    Dim i           As Long
    
    ComboBoxEx1.ListItemClear
    
    ExplorerFrame1(1).hImgList = ComboBoxEx1.hImageList
    
    sLines = Split(sData, vbCrLf)
    
    For i = 0 To UBound(sLines) - 1
        sItem = Split(sLines(i), Delimiter)
        If sItem(0) <> vbNullString Then
            ComboBoxEx1.AddItem , sItem(1), , sItem(2), , sItem(3), sItem(0)
            If i < 7 Then
                ExplorerFrame1(1).AddItem sItem(1), sItem(2), sItem(0), vbNullString
            End If
        End If
    Next
    
    ExplorerFrame1(1).Refresh

    AddHistory tHistoryBack, ComboBoxEx1.GetItemData(0), ComboBoxEx1.GetItemText(0)
    
    hIcon = ImageList_GetIcon(ComboBoxEx1.hImageList, ComboBoxEx1.GetItemImage(0), ILD_TRANSPARENT)
    hIcon = SendMessage(Me.hwnd, WM_SETICON, ICON_SMALL, ByVal hIcon)
    DestroyIcon hIcon
    Me.Caption = ComboBoxEx1.GetItemText(0)

    Call Navigate(ComboBoxEx1.GetItemData(0))
    
End Sub

Private Function Navigate(ByVal IdList As Long) As Boolean
    ucProgressBar1.Marquee = True
    ucProgressBar1.Visible = True
    
    If WinSock32.SendData(SocketID, "0" & Delimiter & IdList & Delimiter & m_ViewMode & END_DATA) = False Then
        ucProgressBar1.Marquee = False
        ucProgressBar1.Visible = False
        MsgBox "Error al enviar la petición", vbInformation
    Else
        Navigate = True
    End If
End Function



Private Sub CompleteSearch(ByVal sData As String)
On Error GoTo ErrHaddle
    Dim uSHFI As SHFILEINFO
    Dim sLines() As String
    Dim sItem() As String
    Dim i As Long
    Dim j As Long
    Dim ii As Long
    

    sLines = Split(sData, vbCrLf)
    
    If UBound(sLines) > 1 Then ReDim Preserve ListData(UBound(ListData) + UBound(sLines))
    
    j = ucListView1.Count
    
    For i = 0 To UBound(sLines) - 1


            sItem = Split(sLines(i), Delimiter)
            
            If sItem(2) <> vbNullString Then
            
                Call SHGetFileInfo(sItem(1), ByVal 0&, uSHFI, Len(uSHFI), SHGFI_USEFILEATTRIBUTES Or SHGFI_SYSICONINDEX Or SHGFI_SMALLICON Or SHGFI_TYPENAME)
                
                With ucListView1
                    .ItemAdd j, sItem(1), 0, uSHFI.iIcon, j ' sItem(0)
                    .SubItemSet j, 1, GetFormatSizeFile(sItem(2)), 0
                    .SubItemSet j, 2, uSHFI.szTypeName, 0
                    .SubItemSet j, 3, sItem(3), 0
                    .SubItemSet j, 4, GetFileAttString(sItem(4)), 0
                    .ItemGhosted(j) = (sItem(4) And vbHidden) = vbHidden
                End With

            Else
                Call SHGetFileInfo(sItem(1), SHGFI_USEFILEATTRIBUTES, uSHFI, Len(uSHFI), SHGFI_USEFILEATTRIBUTES Or SHGFI_SYSICONINDEX Or SHGFI_SMALLICON Or SHGFI_TYPENAME)
                
                With ucListView1
                    .ItemAdd j, sItem(1), 0, uSHFI.iIcon, j ' sItem(0)
                    .SubItemSet j, 2, uSHFI.szTypeName, 0
                    .SubItemSet j, 3, sItem(3), 0
                    .SubItemSet j, 4, GetFileAttString(sItem(4)), 0
                    .ItemGhosted(j) = (sItem(4) And vbHidden) = vbHidden
                End With

            End If
            
            With ListData(j)
                .IdList = sItem(0)
                .PathSize = sItem(2)
                .PathAttr = sItem(4)
                .PathCanRead = sItem(5)
                .PathCanWrite = sItem(6)
            End With
                
            
            j = j + 1

    Next
    
    ucStatusbar1.PanelText(1) = ucListView1.Count & " Objetos"
    
Exit Sub

ErrHaddle:

    MsgBox "Error: " & err.Number & vbCrLf & err.Description, vbCritical

    
End Sub


Private Sub CompleteHeather(ByVal sData As String)

On Error GoTo ErrHaddle
    Dim sItem() As String
    
    fCount = 0
    
    sItem = Split(sData, Delimiter)
    
    If Picture2.Visible Then
        Picture2.Visible = False
        Picture3.Visible = True
        ucToolbar1.ButtonChecked(8) = False
        ucToolbar1.ButtonChecked(9) = True
    End If
    
    IsLVSearchResult = False
    ucListView1.Clear
    ucListView1.Sort 0, soDefault
    ucListView1.ColumnIcon(m_CurrentColumn) = -1
    ucListView1.ColumnIcon(0) = 0
    m_ColumnSortOrder(0) = soAscending
    ReDim ListData(0)

    ComboBoxEx1.Tag = sItem(0)
    ComboBoxEx1.Text = sItem(1)
    mIDLParentPath = CLng(sItem(2))
    mNameParentPath = GetPathName(sItem(1))
    Me.Caption = mNameParentPath
    
    m_ClipBoardAvailable = CBool(sItem(3))
    m_CurFolderCanWrite = CBool(sItem(4))
    
    PicThumbnail.Visible = False
    LblDetails.Caption = Replace(Replace(sItem(5), vbNullChar, vbCrLf), Chr$(63), vbNullString)
    LblDetails.Top = 600

    ExplorerFrame1(2).SetHeight = LblDetails.Top + LblDetails.Height + 240
    ucToolbar1.ButtonEnabled(3) = mIDLParentPath <> 0
    Call CompletePanelItems(3, True, m_CurFolderCanWrite)
    cILVistaPrevia.Clear
    ReDim ArrIconsImgPrevia(0)
Exit Sub

ErrHaddle:

    MsgBox "Error: " & err.Number & vbCrLf & err.Description, vbCritical
End Sub

Private Function GetILPreviaIconID(ByVal iIcon As Long) As Long
    Dim i As Long
    
    For i = 0 To UBound(ArrIconsImgPrevia) - 1
        If ArrIconsImgPrevia(i) = iIcon Then
            GetILPreviaIconID = i
            Exit Function
        End If
    Next

    Picture4.Picture = Nothing
    ImageList_Draw GetSystemImageList(SHIL_EXTRALARGE), iIcon, Picture4.hdc, 24, 24, ILD_TRANSPARENT
    Rectangle Picture4.hdc, 0, 0, 96, 96
    Picture4.Refresh
    Picture4 = Picture4.Image
    cILVistaPrevia.AddBitmap Picture4.Picture
    GetILPreviaIconID = UBound(ArrIconsImgPrevia)
    ArrIconsImgPrevia(UBound(ArrIconsImgPrevia)) = iIcon
    ReDim Preserve ArrIconsImgPrevia(UBound(ArrIconsImgPrevia) + 1)
End Function



Private Sub CompleteListview(ByVal sData As String)

On Error GoTo ErrHaddle

    Dim uSHFI As SHFILEINFO
    Dim sLines() As String
    Dim sItem() As String
    Dim i As Long
    Dim j As Long

    sLines = Split(sData, vbCrLf)
    
    If UBound(sLines) > 1 Then ReDim Preserve ListData(UBound(ListData) + UBound(sLines))
    
    j = ucListView1.Count
    
    For i = 0 To UBound(sLines) - 1

            sItem = Split(sLines(i), Delimiter)
            
            If sItem(2) <> vbNullString Then

                Call SHGetFileInfo(sItem(1), ByVal 0&, uSHFI, Len(uSHFI), SHGFI_USEFILEATTRIBUTES Or SHGFI_SYSICONINDEX Or SHGFI_SMALLICON Or SHGFI_TYPENAME)
                
                With ucListView1
                    If m_ViewMode = VM_THUMBNAILS Then
                        .ItemAdd j, sItem(1), 0, GetILPreviaIconID(uSHFI.iIcon), j
                    Else
                        .ItemAdd j, sItem(1), 0, uSHFI.iIcon, j
                    End If
                    .SubItemSet j, 1, GetFormatSizeFile(sItem(2)), 0
                    .SubItemSet j, 2, uSHFI.szTypeName, 0
                    .SubItemSet j, 3, sItem(3), 0
                    .SubItemSet j, 4, GetFileAttString(sItem(4)), 0
                    .ItemGhosted(j) = (sItem(4) And vbHidden) = vbHidden
                End With

            Else
                
                Call SHGetFileInfo(sItem(1), SHGFI_USEFILEATTRIBUTES, uSHFI, Len(uSHFI), SHGFI_USEFILEATTRIBUTES Or SHGFI_SYSICONINDEX Or SHGFI_SMALLICON Or SHGFI_TYPENAME)

                With ucListView1
                    If m_ViewMode = VM_THUMBNAILS Then
                        .ItemAdd fCount, sItem(1), 0, GetILPreviaIconID(uSHFI.iIcon), j
                    Else
                        .ItemAdd fCount, sItem(1), 0, uSHFI.iIcon, j
                    End If
                    .SubItemSet fCount, 2, uSHFI.szTypeName, 0
                    .SubItemSet fCount, 3, sItem(3), 0
                    .SubItemSet fCount, 4, GetFileAttString(sItem(4)), 0
                    .ItemGhosted(fCount) = (sItem(4) And vbHidden) = vbHidden
                    fCount = fCount + 1
                End With

            End If
            
            With ListData(j)
                .IdList = sItem(0)
                .PathSize = sItem(2)
                .PathAttr = sItem(4)
                .PathCanRead = sItem(5)
                .PathCanWrite = sItem(6)
            End With

            j = j + 1

    Next
    
    ucStatusbar1.PanelText(1) = ucListView1.Count & " Objetos"
        
Exit Sub

ErrHaddle:

    MsgBox "Error: " & err.Number & vbCrLf & err.Description, vbCritical
 
    
End Sub

Public Sub Socket_Close(id As Long, IP As String, Puerto As String)
    Dim i As Long
    ucListView1.Clear
    ucListView1.Enabled = False
    ucToolbar1.Enabled = False
    ComboBoxEx1.Text = "Sin Conexión"
    ComboBoxEx1.Enabled = False
    ScrollControl1.Enabled = False
    For i = 0 To 3
        ExFrame1(i).Collapse = True
    Next
    For i = 0 To 2
        ExplorerFrame1(i).Collapse = True
    Next
    Picture1.Visible = False
    ucStatusbar1.PanelText(1) = "Sin Conexión"
    ucProgressBar1.Marquee = False
    ucProgressBar1.Visible = False
    Me.Caption = "Sin Conexión"
    Set cMenuImage = Nothing
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    
    ComboBoxEx1.Move 50, ucToolbar1.Height + 40, Me.ScaleWidth - 100
    ucListView1.Move ScrollControl1.Width, ComboBoxEx1.Top + ComboBoxEx1.Height + 40, Me.ScaleWidth - ScrollControl1.Width, Me.ScaleHeight - ucListView1.Top - ucStatusbar1.Height
    ScrollControl1.Move 0, ucListView1.Top, ScrollControl1.Width, ucListView1.Height
    Picture1.Move ComboBoxEx1.Left + 40, ComboBoxEx1.Top + 44
    ucStatusbar1_Resize

End Sub

Private Sub Form_Unload(Cancel As Integer)
    If ucListView1.Enabled And SocketID Then WinSock32.SendData SocketID, 12 & Delimiter & END_DATA  'Cancela la actual busqueda
    TerminateConnection SocketID
    If ucListView1.Enabled And SocketID Then WinSock32.WsClose SocketID
    ucListView1.hSmallImgList = 0
    ucListView1.hLargeImgList = 0
    Set cILVistaPrevia = Nothing
    Set cMenuImage = Nothing
    MdlINI.SaveFormPosAndSize Me
End Sub


Private Sub Picture2_Resize()
    Dim i As Long
    
    For i = 0 To 3
        ExFrame1(i).Width = Picture2.Width
    Next
End Sub

Private Sub Picture3_Resize()
    Dim i As Long
    
    If Picture3.Visible = False Then Exit Sub
    
    For i = 0 To 2
        ExplorerFrame1(i).Width = Picture3.Width
    Next
    LblDetails.Width = ExplorerFrame1(2).Width - 240
    PicThumbnail.Left = (ExplorerFrame1(2).Width / 2) - (PicThumbnail.Width / 2)
    ExplorerFrame1(2).SetHeight = LblDetails.Top + LblDetails.Height + 240
End Sub


Private Sub ScrollControl1_Resize()
    If Picture2.Visible Then
        Picture2.Width = (ScrollControl1.ScaleWidth * Screen.TwipsPerPixelX) - (Picture2.Left * 2)
        Picture2.Top = -(ScrollControl1.PosVertical * Screen.TwipsPerPixelY)
    Else
        Picture3.Width = (ScrollControl1.ScaleWidth * Screen.TwipsPerPixelX) - (Picture3.Left * 2)
        Picture3.Top = -(ScrollControl1.PosVertical * Screen.TwipsPerPixelY)
    End If
End Sub

Private Sub ScrollControl1_Scroll()
    If Picture2.Visible Then
        Picture2.Top = -(ScrollControl1.PosVertical * Screen.TwipsPerPixelY)
    Else
        Picture3.Top = -(ScrollControl1.PosVertical * Screen.TwipsPerPixelY)
    End If
End Sub

Private Sub Text3_Change()
    Text3.ToolTipText = Text3.Text
End Sub

Private Sub Timer1_Timer()
    Dim Item As Long
    
    Item = ucListView1.GetSelectedItem
    
    If CurrentItem = Item Then
        Timer1.Interval = 0
        
        If CurrentItem = -1 Then Exit Sub
              
        WinSock32.SendData SocketID, "14" & Delimiter & ListData(ucListView1.ItemData(CurrentItem)).IdList & END_DATA
    Else
        CurrentItem = Item
    End If
End Sub

Private Sub ucListView1_AfterLabelEdit(Cancel As Long, NewString As String)
    Dim SelItem As Long
    
    SelItem = ucListView1.GetSelectedItem

    If NewString = vbNullString Then Exit Sub
    
    If ListData(ucListView1.ItemData(SelItem)).PathCanWrite Then
        WinSock32.SendData SocketID, "11" & Delimiter & ListData(ucListView1.ItemData(SelItem)).IdList & Delimiter & NewString & END_DATA
    Else
        MsgBox "No puede cambiar el nombre a " & ucListView1.ItemText(SelItem), vbCritical, "Error al cambiar un nombre a un archivo o carpeta"
        Cancel = True
    End If
End Sub

Private Function GetItemHitTest() As Long
    Dim PT As POINTAPI
    GetCursorPos PT
    
    ScreenToClient ucListView1.hwnd, PT
    GetItemHitTest = ucListView1.ItemHitTest(PT.X, PT.Y)
End Function
 

Private Sub ucListView1_Click()
    Dim Index As Long
    
    If Not ExplorerFrame1(2).Collapse Then
        Index = GetItemHitTest
        If Index = -1 Then
            If ComboBoxEx1.Tag <> vbNullString Then
                WinSock32.SendData SocketID, "14" & Delimiter & ComboBoxEx1.Tag & END_DATA
            End If
        End If
    End If
End Sub

Private Sub ucListView1_ColumnClick(Column As Long)

    Dim nCol As Integer
    
    With ucListView1
        If (.Count > 1) Then
            For nCol = 0 To 4
                If (nCol <> Column) Then
                    m_ColumnSortOrder(nCol) = [soDefault] '~None
                    .ColumnIcon(nCol) = -1                '~None
                End If
            Next nCol
            If (m_ColumnSortOrder(Column) = [soAscending]) Then
                m_ColumnSortOrder(Column) = [soDescending]
                .ColumnIcon(Column) = 1 'by User
              Else
                m_ColumnSortOrder(Column) = [soAscending]
                .ColumnIcon(Column) = 0 'by User
            End If
            Select Case Column
                Case 0: Call .Sort(Column, m_ColumnSortOrder(Column), [stStringSensitive])
                Case 1
                        CustomData = ListData
                        Call .Sort(Column, m_ColumnSortOrder(Column), [stCustom])
                                
                Case 2: Call .Sort(Column, m_ColumnSortOrder(Column), [stStringSensitive])
                Case 3: Call .Sort(Column, m_ColumnSortOrder(Column), [stDate])
                Case 4: Call .Sort(Column, m_ColumnSortOrder(Column), [stStringSensitive])
                Case 5: Call .Sort(Column, m_ColumnSortOrder(Column), [stStringSensitive])
            End Select
        End If
        m_CurrentColumn = Column
    End With
End Sub

Private Sub ucListView1_ItemDblClick(Item As Long)
    If ucListView1.SubItemText(Item, 1) = vbNullString Then
        ExploreRemoteFolder Item
    End If
End Sub

Private Sub ExploreRemoteFolder(ByVal Index As Long)

    Dim ID_Data As Long
    Dim uSHFI As SHFILEINFO

    ID_Data = ucListView1.ItemData(Index)
    
    If ListData(ID_Data).PathCanRead Then

        AddHistory tHistoryBack, ListData(ID_Data).IdList, ucListView1.ItemText(Index)
        ReDim tHistoryFordward(0)
        ucToolbar1.ButtonEnabled(1) = True
        ucToolbar1.ButtonEnabled(2) = False
        Timer1.Interval = 0
        CurrentItem = -1
        If IsInSearch Then
            WinSock32.SendData SocketID, 12 & Delimiter & END_DATA 'Cancela la actual busqueda
            DoEvents
            IsInSearch = False
        End If

        If Navigate(ListData(ID_Data).IdList) Then
            Call SHGetFileInfo(ucListView1.ItemText(Index), SHGFI_USEFILEATTRIBUTES, uSHFI, Len(uSHFI), SHGFI_USEFILEATTRIBUTES Or SHGFI_SYSICONINDEX Or SHGFI_SMALLICON)
            Call ChangeIcon(SysImageListSmall, uSHFI.iIcon)
        End If

    Else
        MsgBox "Acceso denegado", vbCritical
    End If
End Sub

Private Sub ChangeIcon(ByVal hImageList As Long, ByVal iIcon As Long)
    Dim hIcon As Long
    
    Picture1.Cls
    ImageList_Draw hImageList, iIcon, Picture1.hdc, 0, 0, &H1
    Picture1.Refresh
        
    hIcon = ImageList_GetIcon(hImageList, iIcon, ILD_TRANSPARENT)
    hIcon = SendMessage(Me.hwnd, WM_SETICON, ICON_SMALL, ByVal hIcon)
    If hIcon <> 0 Then DestroyIcon hIcon
    
End Sub

Private Sub ucListView1_ItemClick(Item As Long)
    Dim ID_Data As Long
    PicThumbnail.Visible = False
    LblDetails.Caption = vbNullString
    LblDetails.Top = 600
    
    ExplorerFrame1(2).SetHeight = LblDetails.Top + LblDetails.Height + 240
        
    If Not ExplorerFrame1(2).Collapse Then
        If Timer1.Interval = 0 Then
            CurrentItem = Item
            Timer1.Interval = 500
        End If
    End If

    ID_Data = ucListView1.ItemData(Item)
    
    If ucListView1.SubItemText(Item, 1) = vbNullString Then
        Call CompletePanelItems(2, ListData(ID_Data).PathCanRead, ListData(ID_Data).PathCanWrite)
     Else
        Call CompletePanelItems(1, ListData(ID_Data).PathCanRead, ListData(ID_Data).PathCanWrite)
    End If
   
End Sub




Private Sub ucListView1_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim Index As Long
    Dim ID_Data As Long
    
    Index = ucListView1.GetSelectedItem
        
    If Index <> -1 Then
        ID_Data = ucListView1.ItemData(Index)
        
        If KeyCode = vbKeyDelete Then
            If ListData(ID_Data).PathCanWrite Then ExecuteCommand 1, 8, Index, ucListView1.ItemData(Index)
        End If
        
        If KeyCode = vbKeyF2 Then
            If ListData(ID_Data).PathCanWrite Then ucListView1.StartLabelEdit Index
        End If

        If KeyCode = vbKeyReturn Then
            If ucListView1.SubItemText(Index, 1) = vbNullString Then
                ExploreRemoteFolder Index
            End If
        End If
        

    End If
    
    If KeyCode = vbKeyBack Then
        If ucToolbar1.ButtonEnabled(1) Then
            Call ucToolbar1_ButtonClick(1)
        End If
    End If
    
    If KeyCode = vbKeyF5 Then
        Call Actualizar
    End If

End Sub

Private Sub ucListView1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim Index As Long
    
    Index = ucListView1.ItemHitTest(X, Y)
    
    If Index = -1 Then
        Call CompletePanelItems(3, True, m_CurFolderCanWrite)
    End If
End Sub

Private Sub ExplorerFrame1_ItemClick(Index As Integer, ByVal ItemIndex As Long, ByVal ItemData As Long)

    Dim LVITEM As Long
    Dim LVData As Long

    If Index = 0 Then

        LVITEM = ucListView1.GetSelectedItem

        If LVITEM <> -1 Then
            LVData = ucListView1.ItemData(LVITEM)
        End If

        Call ExecuteCommand(ExplorerFrame1(0).Tag, ItemData, LVITEM, LVData)
        
    Else
        ComboBoxEx1_ItemClick ItemIndex
    End If
End Sub



Private Sub ucListView1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)

    Dim Index As Long
    Dim ID_Data As Long
    Dim lRet As Long
    Dim IsPathZip As Boolean

    If Button <> 2 Then Exit Sub
    
    Index = ucListView1.ItemHitTest(X, Y)
    
    If Index <> -1 Then
    
        ID_Data = ucListView1.ItemData(Index)
        
        
    
        If ucListView1.SubItemText(Index, 1) <> vbNullString Then
            'Item Archivo
            IsPathZip = UCase(Right(ucListView1.ItemText(Index), 4)) = ".ZIP"
            lRet = ShowPopUpMenu(1, ListData(ID_Data).PathCanRead, ListData(ID_Data).PathCanWrite, IsPathZip, ListData(ID_Data).PathAttr)
            If lRet Then Call ExecuteCommand(1, lRet, Index, ID_Data)
        Else
            'Item Carpeta
            lRet = ShowPopUpMenu(2, ListData(ID_Data).PathCanRead, ListData(ID_Data).PathCanWrite, False, ListData(ID_Data).PathAttr)
            If lRet Then Call ExecuteCommand(2, lRet, Index, ID_Data)
        End If
    Else
        'Carpeta actual
        lRet = ShowPopUpMenu(3, True, m_CurFolderCanWrite, False)
        If lRet Then Call ExecuteCommand(3, lRet, Index, ID_Data)
    End If
    

End Sub


Private Function ShowPopUpMenu(ByVal MenuType As Long, ByVal bRead As Boolean, ByVal bWrite As Boolean, ByVal IsPathZip As String, Optional ByVal hAtrr As Long) As Long
    Dim hMenu As Long
    Dim hSubMenu1 As Long
    Dim hSubMenu2 As Long
    Dim PT As POINTAPI
    
    hMenu = CreatePopupMenu()

    Select Case MenuType
    
        Case 1 'Item Archivo
        
            hSubMenu1 = CreatePopupMenu()
            
            AppendMenu hMenu, MF_STRING Or IIf(bRead, 0, MF_GRAYED), 1, "Descargar"
            AppendMenu hSubMenu1, MF_STRING, 2, "Normal"
            AppendMenu hSubMenu1, MF_STRING, 3, "Oculto"
            AppendMenu hMenu, MF_POPUP, hSubMenu1, "Ejecutar"
            AppendMenu hMenu, MF_SEPARATOR, 4, ByVal 0&
            AppendMenu hMenu, MF_STRING Or IIf(bWrite, 0, MF_GRAYED), 5, "Cortar"
            AppendMenu hMenu, MF_STRING Or IIf(bRead, 0, MF_GRAYED), 6, "Copiar"
            AppendMenu hMenu, MF_SEPARATOR, 7, ByVal 0&
            AppendMenu hMenu, MF_STRING Or IIf(bWrite, 0, MF_GRAYED), 8, "Eliminar"
            AppendMenu hMenu, MF_STRING Or IIf(bWrite, 0, MF_GRAYED), 9, "Cambiar Nombre"
            
            If IsLVSearchResult Then
                AppendMenu hMenu, MF_STRING, 17, "Abrir carpeta contenedora"
            Else
                If IsPathZip Then
                    AppendMenu hMenu, MF_STRING Or IIf(bRead, 0, MF_GRAYED), 16, "Descomprimir"
                Else
                    AppendMenu hMenu, MF_STRING Or IIf(bRead, 0, MF_GRAYED), 15, "Comprimir en Zip"
                End If
            End If
            AppendMenu hMenu, MF_SEPARATOR, 11, ByVal 0&

            hSubMenu2 = CreatePopupMenu()
            
            AppendMenu hSubMenu2, MF_STRING Or IIf((hAtrr And vbReadOnly) = vbReadOnly, MF_CHECKED, 0), 12, "Sólo de Lectura"
            AppendMenu hSubMenu2, MF_STRING Or IIf((hAtrr And vbHidden) = vbHidden, MF_CHECKED, 0), 13, "Oculto"
            AppendMenu hSubMenu2, MF_STRING Or IIf((hAtrr And vbSystem) = vbSystem, MF_CHECKED, 0), 14, "Sistema"
            
            AppendMenu hMenu, MF_POPUP, hSubMenu2, "Atributos"
            
            With cMenuImage
                If Not .IsWindowVistaOrLater Then
                    .RemoveMenuCheckApi hMenu
                    .RemoveMenuCheckApi hSubMenu1
                End If
                .PutImageToApiMenu 0, hMenu, 0
                .PutImageToApiMenu 1, hMenu, 1
                .PutImageToApiMenu 2, hSubMenu1, 0
                .PutImageToApiMenu 3, hSubMenu1, 1
                .PutImageToApiMenu 4, hMenu, 3
                .PutImageToApiMenu 5, hMenu, 4
                .PutImageToApiMenu 6, hMenu, 6
                .PutImageToApiMenu 7, hMenu, 7
                .PutImageToApiMenu IIf(IsLVSearchResult, 14, 13), hMenu, 8
                .PutImageToApiMenu 8, hMenu, 10
            End With
            
        Case 2 'Item Carpeta
        
            AppendMenu hMenu, MF_STRING Or IIf(bWrite, 0, MF_GRAYED), 1, "Cortar"
            AppendMenu hMenu, MF_STRING Or IIf(bRead, 0, MF_GRAYED), 2, "Copiar"
            AppendMenu hMenu, MF_SEPARATOR, 3, ByVal 0&
            AppendMenu hMenu, MF_STRING Or IIf(bWrite, 0, MF_GRAYED), 4, "Eliminar"
            AppendMenu hMenu, MF_STRING Or IIf(bWrite, 0, MF_GRAYED), 5, "Cambiar Nombre"
            
            If IsLVSearchResult Then
                AppendMenu hMenu, MF_STRING, 17, "Abrir carpeta contenedora"
            Else
                AppendMenu hMenu, MF_STRING Or IIf(bRead, 0, MF_GRAYED), 15, "Comprimir en Zip"
            End If
            
            AppendMenu hMenu, MF_SEPARATOR, 7, ByVal 0&
            
            hSubMenu2 = CreatePopupMenu()
            
            AppendMenu hSubMenu2, MF_STRING Or IIf((hAtrr And vbReadOnly) = vbReadOnly, MF_CHECKED, 0), 8, "Sólo de Lectura"
            AppendMenu hSubMenu2, MF_STRING Or IIf((hAtrr And vbHidden) = vbHidden, MF_CHECKED, 0), 9, "Oculto"
            AppendMenu hSubMenu2, MF_STRING Or IIf((hAtrr And vbSystem) = vbSystem, MF_CHECKED, 0), 10, "Sistema"
            
            AppendMenu hMenu, MF_POPUP, hSubMenu2, "Atributos"
            
            With cMenuImage
                 If Not .IsWindowVistaOrLater Then .RemoveMenuCheckApi hMenu
                .PutImageToApiMenu 4, hMenu, 0
                .PutImageToApiMenu 5, hMenu, 1
                .PutImageToApiMenu 6, hMenu, 3
                .PutImageToApiMenu 7, hMenu, 4
                .PutImageToApiMenu IIf(IsLVSearchResult, 14, 13), hMenu, 5
                .PutImageToApiMenu 8, hMenu, 7
            End With
            
        Case 3 'Carpeta actual
        
            AppendMenu hMenu, MF_STRING, 1, "Actualizar"
            AppendMenu hMenu, MF_STRING Or IIf(bWrite, 0, MF_GRAYED), 2, "Exportar archivo"
            If Not IsLVSearchResult Then
                AppendMenu hMenu, MF_SEPARATOR, 3, ByVal 0&
                AppendMenu hMenu, MF_STRING Or IIf(m_ClipBoardAvailable And bWrite, 0, MF_GRAYED), 4, "Pegar"
                AppendMenu hMenu, MF_STRING Or IIf(bWrite, 0, MF_GRAYED), 5, "Nueva carpeta"
            End If
            
            With cMenuImage
                 If Not .IsWindowVistaOrLater Then .RemoveMenuCheckApi hMenu
                .PutImageToApiMenu 10, hMenu, 0
                .PutImageToApiMenu 9, hMenu, 1
                If Not IsLVSearchResult Then
                    .PutImageToApiMenu 12, hMenu, 3
                    .PutImageToApiMenu 11, hMenu, 4
                End If
            End With
    End Select

    GetCursorPos PT
    ShowPopUpMenu = TrackPopupMenuEx(hMenu, TPM_RETURNCMD, PT.X, PT.Y, Me.hwnd, ByVal 0&)
    
    DestroyMenu hMenu
    

End Function

Private Sub CompletePanelItems(ByVal MenuType As Long, ByVal bRead As Boolean, ByVal bWrite As Boolean)
    
    With ExplorerFrame1(0)
        .Clear
        .Tag = MenuType
        
        Select Case MenuType
            Case 1 'Item Archivo
                If bRead Then
                    .AddItem "Descargar", 0, 1
                    .AddItem "Copiar", 5, 6
                End If
                
                If bWrite Then
                    .AddItem "Cortar", 4, 5
                    .AddItem "Eliminar", 6, 8
                    .AddItem "Cambiar Nombre", 7, 9
                End If
            Case 2  'Item Carpeta
                If bRead Then .AddItem "Copiar", 5, 2
                If bWrite Then
                    .AddItem "Cortar", 4, 1
                    .AddItem "Eliminar", 6, 4
                    .AddItem "Cambiar Nombre", 7, 5
                End If
            Case 3 'Carpeta actual
                If bWrite Then .AddItem "Exportar archivo", 9, 2
                If m_ClipBoardAvailable And bWrite Then .AddItem "Pegar", 12, 4
                If bWrite Then .AddItem "Nueva carpeta", 11, 5
        End Select
        
        .Refresh
        
    End With
    
End Sub


Private Sub ZipPath(ByVal Index As Long, ID_Data As Long)
    Dim i As Long
    Dim ZipName As String
    Dim PahtName As String
    Dim bExist As Boolean
    
    PahtName = ucListView1.ItemText(Index)
    
    If ucListView1.SubItemText(Index, 1) <> vbNullString Then
        PahtName = Left$(PahtName, InStrRev(PahtName, ".") - 1)
    End If
    
    ZipName = PahtName & ".zip"
    
    Do
        bExist = False
        
        For i = 0 To ucListView1.Count - 1
            If UCase(ucListView1.ItemText(i)) = UCase(ZipName) Then
                bExist = True
                Exit For
            End If
        Next
        
        If bExist Then
            ZipName = InputBox("El archivo " & ZipName & " ya existe, ingrese otro nombre", "Error. Nombre dubplicado", ZipName)
            DoEvents
            Me.SetFocus
        Else
            Exit Do
        End If
    Loop
    
    If ZipName <> "" Then
        FrmProgresZip.SocketID = Me.SocketID
        FrmProgresZip.Label1.Caption = "Comprimiendo " & PahtName & " en " & ZipName
        FrmProgresZip.Caption = "Comprimiendo"
        FrmProgresZip.Show , Me
        WinSock32.SendData SocketID, "15" & Delimiter & ListData(ID_Data).IdList & Delimiter & ZipName & END_DATA
    End If
    
End Sub

Private Sub UnZipPath(ByVal Index As Long, ID_Data As Long)
    Dim i As Long
    Dim FolderName As String
    Dim ZipName As String
    Dim bExist As Boolean
    
    ZipName = ucListView1.ItemText(Index)
        
    FolderName = Left$(ZipName, InStrRev(ZipName, ".") - 1)
       
    Do
        bExist = False
        
        For i = 0 To ucListView1.Count - 1
            If UCase(ucListView1.ItemText(i)) = UCase(FolderName) Then
                bExist = True
                Exit For
            End If
        Next
        
        If bExist Then
            FolderName = InputBox("La Carpeta " & FolderName & " ya existe, ingrese otro nombre", "Error. Nombre dubplicado", FolderName)
            DoEvents
            Me.SetFocus
        Else
            Exit Do
        End If
    Loop
    
    If FolderName <> "" Then
        FrmProgresZip.SocketID = Me.SocketID
        FrmProgresZip.Label1.Caption = "Deomprimiendo " & ZipName & " en " & FolderName
        FrmProgresZip.Caption = "Comprimiendo"
        FrmProgresZip.Show , Me
        WinSock32.SendData SocketID, "16" & Delimiter & ListData(ID_Data).IdList & Delimiter & FolderName & END_DATA
    End If
    
End Sub



Private Sub ExecuteCommand(ByVal MenuType As Long, ByVal IdCommand As Long, ByVal Index As Long, ID_Data As Long)
    On Error GoTo ErrDescription
    Dim sPath As String
    Dim sName As String
    Dim i As Long
    Dim bExist As Boolean
    Dim sCommand As String
    
    Select Case MenuType
        Case 1 'Item Archivo
           
            Select Case IdCommand
                Case 1 'Descargar
                    
                    sPath = ShowSaveFile(Me.hwnd, ucListView1.ItemText(Index))
                    If sPath <> vbNullString Then
                        If Dir(sPath) <> vbNullString Then Kill sPath
                        WinSock32.SendData SocketID, "1" & Delimiter & ListData(ID_Data).IdList & Delimiter & sPath & END_DATA
                        FrmMain.TabStrip1.SelectedItem = 1
                        FrmMain.SetFocus
                    End If
                Case 2, 3 '[2 = Ejecutar Normal], [3 = Ejecutar Oculto]
                    sCommand = InputBox("Si desea ejecutar alguna línea de comando para este archivo escriba en la caja de texto, de lo contrario déjela en blanco.")
                    DoEvents
                    Me.SetFocus
                    WinSock32.SendData SocketID, "7" & Delimiter & ListData(ID_Data).IdList & Delimiter & _
                    IIf(IdCommand = 2, SW_SHOWNORMAL, SW_HIDE) & Delimiter & sCommand & END_DATA
                Case 5  'Cortar
                    ucListView1.ItemGhosted(Index) = True
                    WinSock32.SendData SocketID, "5" & Delimiter & ListData(ID_Data).IdList & END_DATA
                Case 6  'Copiar
                    WinSock32.SendData SocketID, "6" & Delimiter & ListData(ID_Data).IdList & END_DATA
                Case 8  'Eliminar
                    If MsgBox("¿Confirma que desea enviar " & Chr$(34) & ucListView1.ItemText(Index) & Chr$(34) & " a la papelera de reciclaje?", vbYesNo, "Confirmar eliminación de archivos") = vbYes Then
                        WinSock32.SendData SocketID, "3" & Delimiter & ListData(ID_Data).IdList & Delimiter & ComboBoxEx1.Tag & END_DATA
                    End If
                    DoEvents
                    Me.SetFocus
                Case 9  'Cambiar Nombre
                    ucListView1.StartLabelEdit Index
                Case 12
                    ChangeAtrributes ID_Data, vbReadOnly
                Case 13
                    ChangeAtrributes ID_Data, vbHidden
                Case 14
                    ChangeAtrributes ID_Data, vbSystem
                Case 15 'Comprimir en Zip
                    ZipPath Index, ID_Data
                Case 16 'Descomprimir Zip
                    UnZipPath Index, ID_Data
                Case 17 'Abrir carpeta contenedora
                    AddHistory tHistoryBack, ComboBoxEx1.Tag, mNameParentPath
                    WinSock32.SendData SocketID, "19" & Delimiter & ListData(ID_Data).IdList & END_DATA
            End Select

            
        Case 2 'Item Carpeta

            Select Case IdCommand
            
                Case 1  'Cortar
                    ucListView1.ItemGhosted(Index) = True
                    WinSock32.SendData SocketID, "5" & Delimiter & ListData(ID_Data).IdList & END_DATA
                Case 2  'Copiar
                    WinSock32.SendData SocketID, "6" & Delimiter & ListData(ID_Data).IdList & END_DATA
                Case 4  'Eliminar
                    If MsgBox("¿Confirma que desea enviar " & Chr$(34) & ucListView1.ItemText(Index) & Chr$(34) & " a la Papelera de reciclaje?", vbYesNo, "Confirmar eliminación de archivos") = vbYes Then
                        WinSock32.SendData SocketID, "3" & Delimiter & ListData(ID_Data).IdList & Delimiter & ComboBoxEx1.Tag & END_DATA
                    End If
                    DoEvents
                    Me.SetFocus
                Case 5  'Cambiar Nombre
                    ucListView1.StartLabelEdit Index
                Case 15 'Comprimir en Zip
                    ZipPath Index, ID_Data
                Case 16 'Descomprimir Zip
                    UnZipPath Index, ID_Data
                Case 17
                    AddHistory tHistoryBack, ComboBoxEx1.Tag, mNameParentPath
                    WinSock32.SendData SocketID, "19" & Delimiter & ListData(ID_Data).IdList & END_DATA
                Case 8
                    ChangeAtrributes ID_Data, vbReadOnly
                Case 9
                    ChangeAtrributes ID_Data, vbHidden
                Case 10
                    ChangeAtrributes ID_Data, vbSystem

            End Select
         
        Case 3 'Carpeta actual
        
            Select Case IdCommand
                Case 1 'Actualizar
                    Call Actualizar
                Case 2 'Exportar Archivo
                    sPath = ShowOpenFile(Me.hwnd)
                    If sPath <> vbNullString Then
                        
                        sName = GetPathFileName(sPath)
                        For i = 0 To ucListView1.Count - 1
                            If UCase(ucListView1.ItemText(i)) = UCase(sName) Then
                                bExist = True
                                Exit For
                            End If
                        Next
                        If bExist Then
                            If MsgBox(sName & " ya existe." & vbCrLf & "¿Desea Reemplazarlo?", vbExclamation Or vbYesNo) <> vbYes Then Exit Sub
                        End If
                        WinSock32.SendData SocketID, "2" & Delimiter & ComboBoxEx1.Tag & Delimiter & _
                        sName & Delimiter & GetFileSize(sPath) & Delimiter & GetIDListFromPath(sPath) & END_DATA
                        FrmMain.TabStrip1.SelectedItem = 1
                        FrmMain.SetFocus
                    End If
                Case 4 'Pegar
                    WinSock32.SendData SocketID, "9" & Delimiter & ComboBoxEx1.Tag & END_DATA
                Case 5  'Nueva Carpeta
                    WinSock32.SendData SocketID, "10" & Delimiter & ComboBoxEx1.Tag & END_DATA
                Case 7 'Propiedades
            
            End Select
    End Select
    
    Exit Sub

ErrDescription:
    MsgBox "Error: " & err.Number & vbCrLf & err.Description, vbCritical

End Sub


Private Sub ChangeAtrributes(ByVal ID_Data As Long, ByVal NewAttr As Long)
    Dim hAttr As Long
    hAttr = ListData(ID_Data).PathAttr
    If (hAttr And NewAttr) = NewAttr Then
        hAttr = hAttr And Not NewAttr
    Else
        hAttr = hAttr Or NewAttr
    End If
    WinSock32.SendData SocketID, "18" & Delimiter & ListData(ID_Data).IdList & Delimiter & hAttr & Delimiter & ComboBoxEx1.Tag & END_DATA
End Sub


Private Sub ucStatusbar1_Resize()
ucProgressBar1.Move (ucStatusbar1.PanelWidth(1) * Screen.TwipsPerPixelX) + 20, ucStatusbar1.Top + 30, _
                    (ucStatusbar1.PanelWidth(2) * Screen.TwipsPerPixelX) - 60, ucStatusbar1.Height - 40

ucProgressBar1.ZOrder 0


End Sub

Private Sub ucToolbar1_ButtonClick(ByVal Button As Long)
    Dim lCount As Long

    Select Case Button
        Case 1
            lCount = UBound(tHistoryBack)
            If lCount > 0 Then
                If Navigate(tHistoryBack(lCount - 1).IdList) Then
                    Call ChangeIcon(ComboBoxEx1.hImageList, 14)
                    AddHistory tHistoryFordward, tHistoryBack(lCount).IdList, tHistoryBack(lCount).FolderName
                    ucToolbar1.ButtonEnabled(2) = True
                    ReDim Preserve tHistoryBack(lCount - 1)
                End If
            End If
            
            lCount = UBound(tHistoryBack)
            ucToolbar1.ButtonEnabled(1) = lCount > 1
        Case 2
            lCount = UBound(tHistoryFordward)
            If lCount > 0 Then
                If Navigate(tHistoryFordward(lCount).IdList) Then
                    Call ChangeIcon(ComboBoxEx1.hImageList, 14)
                    AddHistory tHistoryBack, tHistoryFordward(lCount).IdList, tHistoryFordward(lCount).FolderName
                    ucToolbar1.ButtonEnabled(1) = True
                    ReDim Preserve tHistoryFordward(lCount - 1)
                End If
            End If
            
            lCount = UBound(tHistoryFordward)
            ucToolbar1.ButtonEnabled(2) = lCount > 0
        Case 3
            If Navigate(mIDLParentPath) Then
                Call ChangeIcon(ComboBoxEx1.hImageList, 14)
                AddHistory tHistoryBack, mIDLParentPath, mNameParentPath
                ReDim tHistoryFordward(0)
                ucToolbar1.ButtonEnabled(1) = True
                ucToolbar1.ButtonEnabled(2) = False
            End If
        Case 5
            Call Actualizar
        Case 6
            If WinSock32.SendData(SocketID, "12" & Delimiter & END_DATA) Then   'Cancelar
                ucProgressBar1.Marquee = False
                ucProgressBar1.Visible = False
                CmdBuscar.Caption = "Buscar"
                IsInSearch = False
                m_Data = vbNullString
            Else
                Beep
            End If
        Case 8
            CmdBuscar.Caption = "Buscar"
            Text3.Text = ComboBoxEx1.Text
            Picture2.Visible = True
            Picture3.Visible = False
            Picture2_Resize
            ScrollControl1_Resize
            ExFrame1_Resize 0
        Case 9
            If IsInSearch Then
                WinSock32.SendData SocketID, 12 & Delimiter & END_DATA 'Cancelar
                DoEvents
                ucProgressBar1.Marquee = False
                ucProgressBar1.Visible = False
                IsInSearch = False
            End If
            ucStatusbar1.PanelText(1) = ucListView1.Count & " Objetos"
            Picture2.Visible = False
            Picture3.Visible = True
            Picture3_Resize
            ScrollControl1_Resize
            ExplorerFrame1_Resize 0

        
    End Select
End Sub

Private Sub Actualizar()
    Call Navigate(ComboBoxEx1.Tag)
End Sub

Private Sub AddHistory(tHistory() As History, ByVal IdList As Long, ByVal FolderName As String)
    Dim lCount As Long

    lCount = UBound(tHistory)

    ReDim Preserve tHistory(lCount + 1)
    
    With tHistory(lCount + 1)
        .FolderName = FolderName
        .IdList = IdList
    End With
End Sub

Private Sub ExFrame1_Resize(Index As Integer)
    Dim i As Long

    For i = 1 To ExFrame1.Count - 1
        ExFrame1(i).Top = ExFrame1(i - 1).Top + ExFrame1(i - 1).Height
    Next
    
    Picture2.Height = ExFrame1(3).Top + ExFrame1(3).Height

    ScrollControl1.MaxVertical = Picture2.ScaleHeight / Screen.TwipsPerPixelY

    ScrollControl1.PosVertical = ExFrame1(Index).Top / Screen.TwipsPerPixelY
End Sub


Private Sub ucToolbar1_ButtonDropDown(ByVal Button As Long, ByVal X As Long, ByVal Y As Long)
    Dim hMenu As Long
    Dim i As Long
    Dim lRet As Long
    Dim PT As POINTAPI
    Dim mOldMode As Long
    
    hMenu = CreatePopupMenu()
    
    ClientToScreen Me.hwnd, PT
    
    X = PT.X + X / Screen.TwipsPerPixelX
    Y = PT.Y + Y / Screen.TwipsPerPixelY
    
    Select Case Button
        Case 1
            For i = UBound(tHistoryBack) - 1 To 1 Step -1
                AppendMenu hMenu, MF_STRING, i, tHistoryBack(i).FolderName
            Next
            
        Case 2
            For i = 1 To UBound(tHistoryFordward)
                AppendMenu hMenu, MF_STRING, i, tHistoryFordward(i).FolderName
            Next
        Case 11
            lRet = ShowMenuViewMode(X, Y)
            If lRet <> 0 Then
     
                mOldMode = m_ViewMode
                m_ViewMode = lRet
                
                Select Case lRet
                
                    Case VM_THUMBNAILS
                        ucListView1.hLargeImgList = cILVistaPrevia.hwnd
                        ucListView1.ViewMode = vmIcon
                        Call Actualizar
                    Case VM_MOSAICS
                        ucListView1.hLargeImgList = SysImageListExtraLarge
                        ucListView1.ViewMode = vmIcon
                    Case VM_ICONS
                        ucListView1.hLargeImgList = SysImageListLarge
                        ucListView1.ViewMode = vmIcon
                    Case VM_LIST
                        'ucListView1.hSmallImgList = SysImageListSmall
                        ucListView1.ViewMode = vmList
                    Case VM_DETAILS
                        'ucListView1.hSmallImgList = SysImageListSmall
                        ucListView1.ViewMode = vmDetails
                End Select
                
                If mOldMode = VM_THUMBNAILS Then Call Actualizar
                
            End If
            
            Exit Sub
    End Select
    

    lRet = TrackPopupMenuEx(hMenu, TPM_RETURNCMD, X, Y, Me.hwnd, ByVal 0&)
    
    DestroyMenu hMenu
    
    If lRet Then
    
        Select Case Button
            Case 1
                If Navigate(tHistoryBack(lRet).IdList) Then
                    ChangeIcon ComboBoxEx1.hImageList, 14
    
                    For i = lRet + 1 To UBound(tHistoryBack)
                        AddHistory tHistoryFordward, tHistoryBack(i).IdList, tHistoryBack(i).FolderName
                    Next
                    ReDim Preserve tHistoryBack(lRet)
                    ucToolbar1.ButtonEnabled(2) = True
                    
                    If UBound(tHistoryBack) < 2 Then
                        ucToolbar1.ButtonEnabled(1) = False
                    End If
                End If
                
            Case 2
                If Navigate(tHistoryFordward(lRet).IdList) Then
                    ChangeIcon ComboBoxEx1.hImageList, 14
                    For i = 1 To lRet
                        AddHistory tHistoryBack, tHistoryFordward(i).IdList, tHistoryFordward(i).FolderName
                    Next
                    i = UBound(tHistoryFordward)
                    ReDim Preserve tHistoryFordward(i - lRet)
                    ucToolbar1.ButtonEnabled(1) = True
                    
                    If UBound(tHistoryFordward) < 1 Then
                        ucToolbar1.ButtonEnabled(2) = False
                    End If
                End If
                
        End Select
    
    End If
End Sub

Private Sub ucListView1_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error GoTo Handler
    '----Transferir----'

    Dim i As Long, j As Long
    Dim sName As String
    Dim sPath As String
    Dim bExist As Boolean
        
    If IsInDrag Then Exit Sub

        
    If Data.GetFormat(vbCFFiles) = True Then
    
        For i = 1 To Data.Files.Count
        
          sPath = Data.Files(i)
          
          If Not PathIsFolder(sPath) Then
          
                bExist = False
            
                
                sName = GetPathFileName(sPath)
                
                For j = 0 To ucListView1.Count - 1
                    If UCase(ucListView1.ItemText(j)) = UCase(sName) Then
                        bExist = True
                        Exit For
                    End If
                Next
                
                If bExist Then
                    If MsgBox(sName & " ya existe." & vbCrLf & "¿Desea Reemplazarlo?", vbExclamation Or vbYesNo) <> vbYes Then Exit Sub
                End If
                
                WinSock32.SendData SocketID, "2" & Delimiter & ComboBoxEx1.Tag & Delimiter & _
                sName & Delimiter & GetFileSize(sPath) & Delimiter & GetIDListFromPath(Data.Files(i)) & END_DATA
                
            End If
            
        Next
        
        DoEvents
        
        Call Actualizar
        
    End If
    
    Exit Sub

Handler:
    Debug.Print err.Number, err.Description
End Sub


Private Sub ucListView1_OLEStartDrag(Data As DataObject, AllowedEffects As Long)
On Error GoTo Handler
    '----Descargar----'

    Dim Index As Long
    Dim ID_Data As Long
    Dim FF As Integer
    
    Index = ucListView1.GetSelectedItem
    
    If Index = -1 Then Exit Sub
    
    ID_Data = ucListView1.ItemData(Index)
    
    If ucListView1.SubItemText(Index, 1) <> vbNullString And ListData(ID_Data).PathCanRead Then
        TempFileName = ucListView1.ItemText(Index)
        TempPath = Environ("Temp") & "\" & TempFileName
        FF = FreeFile
        Open TempPath For Binary As #FF: Close #FF
        Call StartWatching
        Data.Files.Add TempPath
        Data.SetData , vbCFFiles
        AllowedEffects = vbDropEffectCopy
        IsInDrag = True
    End If
    Exit Sub
Handler:
    Debug.Print err.Number, err.Description
    IsInDrag = False
End Sub

Private Sub ucListView1_OLECompleteDrag(Effect As Long)
    On Error GoTo Handler
    Dim Index As Long
    Dim ID_Data As Long
    Dim DestPathFile As String
    
    DestPathFile = GetDestination(TempFileName)
    Kill TempPath
    
    Index = ucListView1.GetSelectedItem
    ID_Data = ucListView1.ItemData(Index)
    
    If DestPathFile <> vbNullString Then
        If FileLen(DestPathFile) = 0 Then
            WinSock32.SendData SocketID, "1" & Delimiter & ListData(ID_Data).IdList & Delimiter & DestPathFile & END_DATA
        Else
            Debug.Print "Error interno", DestPathFile
        End If
    End If
    IsInDrag = False
    Exit Sub
Handler:
    IsInDrag = False
    Debug.Print err.Number, err.Description, TempPath
End Sub

Private Sub Option1_Click(Index As Integer)
    Combo1.Enabled = Option1(4).Value
    UpDownd1.Enabled = Option1(4).Value
End Sub

Private Sub Option2_Click(Index As Integer)
    Combo2.Enabled = Option2(4).Value
    ucDateTime1.Enabled = Option2(4).Value
    ucDateTime2.Enabled = Option2(4).Value
End Sub
