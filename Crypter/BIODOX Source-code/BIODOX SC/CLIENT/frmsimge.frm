VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{7FDF243A-2E06-4F93-989D-6C9CC526FFC5}#10.0#0"; "HoverButton.ocx"
Begin VB.Form frmsimge 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   2205
   ClientLeft      =   225
   ClientTop       =   1380
   ClientWidth     =   5415
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmsimge.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2205
   ScaleWidth      =   5415
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.ImageList ilsIcons32 
      Left            =   2400
      Top             =   840
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin MSComctlLib.ImageList ilsIcons16 
      Left            =   2040
      Top             =   1680
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin VB.Frame cerceve 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      Height          =   330
      Index           =   1
      Left            =   120
      TabIndex        =   5
      Top             =   1800
      Width           =   3855
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   285
         Left            =   0
         TabIndex        =   6
         Top             =   0
         Width           =   3855
      End
   End
   Begin VB.Frame cerceve 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Height          =   315
      Index           =   0
      Left            =   4080
      MouseIcon       =   "frmsimge.frx":000C
      MousePointer    =   99  'Custom
      TabIndex        =   3
      Top             =   1800
      Width           =   1215
      Begin HoverButton.Button cmd 
         Height          =   285
         Index           =   0
         Left            =   0
         TabIndex        =   4
         Top             =   0
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   503
         BackColor       =   12632256
         HoverBackColor  =   12632256
         Border          =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty FontDown {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BorderColor     =   0
         HilightColor    =   12632256
         ShadowColor     =   12632256
         HoverHilightColor=   12632256
         HoverShadowColor=   12632256
         ForeColor       =   0
         HoverForeColor  =   0
         Caption         =   "Dosya Seç"
         CaptionDown     =   "Dosya Seç"
         CaptionOver     =   "Dosya Seç"
         ShowFocusRect   =   0   'False
         Sink            =   -1  'True
         Picture         =   "frmsimge.frx":015E
         Style           =   2
         PictureLocation =   0
         ButtonStyleX    =   0
         State           =   0
         IconHeight      =   0
         IconWidth       =   0
      End
   End
   Begin VB.Frame cerceve 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   255
      Index           =   6
      Left            =   5160
      MouseIcon       =   "frmsimge.frx":04B0
      MousePointer    =   99  'Custom
      TabIndex        =   0
      Top             =   0
      Width           =   255
      Begin HoverButton.Button cmd 
         Height          =   255
         Index           =   3
         Left            =   0
         TabIndex        =   1
         Top             =   0
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   450
         BackColor       =   0
         HoverBackColor  =   0
         Border          =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty FontDown {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   162
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BorderColor     =   0
         HilightColor    =   0
         ShadowColor     =   0
         HoverHilightColor=   16777215
         HoverShadowColor=   16777215
         ForeColor       =   16777215
         HoverForeColor  =   16777215
         Caption         =   "X"
         CaptionDown     =   "X"
         CaptionOver     =   "X"
         ShowFocusRect   =   0   'False
         Sink            =   -1  'True
         Style           =   0
         PictureLocation =   0
         ButtonStyleX    =   0
         State           =   0
         IconHeight      =   0
         IconWidth       =   0
      End
   End
   Begin MSComctlLib.ListView lvwIcons 
      Height          =   1335
      Left            =   120
      TabIndex        =   7
      Top             =   360
      Width           =   5175
      _ExtentX        =   9128
      _ExtentY        =   2355
      Arrange         =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      TextBackground  =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      MousePointer    =   99
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Icon"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Number of Images"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Label baslýk 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Dosyadan Simge Al"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   -240
      TabIndex        =   2
      Top             =   0
      Width           =   5655
   End
   Begin VB.Menu mndosy 
      Caption         =   "dosya"
      Visible         =   0   'False
      Begin VB.Menu mnsave 
         Caption         =   "Kaydet"
      End
   End
End
Attribute VB_Name = "frmsimge"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private m_cI() As cFileIcon
Private m_iIconCount As Long
Private m_bTrueColour As Boolean
Private Declare Function GetDeviceCaps Lib "gdi32" (ByVal hdc As Long, ByVal nIndex As Long) As Long
Private Const BITSPIXEL = 12
Dim sfile As String
Dim lIndex As Long
Dim vItem As Variant
Dim iName As Long
Dim sExt As String
Dim iPos As Long
Private Function ClosestIndex(ByVal lIndex As Long, ByVal lSize As Long) As Long
Dim i As Long
Dim lMinError As Long
Dim lMinErrorIndex As Long
lMinError = 256
For i = 1 To m_cI(lIndex).ImageCount
If (m_cI(lIndex).ImageWidth(i) = lSize) Then
If (m_bTrueColour) Then
If (m_cI(lIndex).ImageColourCount(i) > 16) Then
ClosestIndex = i
Exit Function
Else
lMinError = 0
lMinErrorIndex = i
End If
Else
If (m_cI(lIndex).ImageColourCount(i) > 16) Then
lMinError = 0
lMinErrorIndex = i
Else
ClosestIndex = i
Exit Function
End If
End If
ElseIf (Abs(m_cI(lIndex).ImageWidth(i) - lSize) < lMinError) Then
lMinError = Abs(m_cI(lIndex).ImageWidth(i) - lSize)
lMinErrorIndex = i
End If
Next i
ClosestIndex = lMinErrorIndex
End Function
Private Sub pRender()
Dim iIcon As Long
Dim itmX As ListItem
lvwIcons.ListItems.Clear
If (m_iIconCount > 0) Then
lvwIcons.SmallIcons = ilsIcons16
lvwIcons.Icons = ilsIcons32
For iIcon = 1 To m_iIconCount
If IsEmpty(m_cI(iIcon).ResourceID) Then
Set itmX = lvwIcons.ListItems.Add(, "C" & iIcon, m_cI(iIcon).Filename, "C" & iIcon, "C" & iIcon)
Else
txt.ToolTipText = m_cI(iIcon).ResourceID
Set itmX = lvwIcons.ListItems.Add(, "C" & iIcon, txt.ToolTipText, "C" & iIcon, "C" & iIcon)
End If
itmX.SubItems(1) = m_cI(iIcon).ImageCount
Next iIcon
lvwIcons.ListItems(1).Selected = True
lvwIcons_ItemClick lvwIcons.SelectedItem
Else
End If
End Sub
Private Sub pSave()
Dim i As Long
Dim bSel() As Boolean
Dim bOneSelected As Boolean
Dim iItem As Long
Dim sfile As String
If (m_iIconCount > 0) Then
If Not lvwIcons.SelectedItem Is Nothing Then
iItem = CLng(Mid$(lvwIcons.SelectedItem.Key, 2))
Debug.Print
Dim cI As New cFileIcon
m_cI(iItem).CloneTo cI

Debug.Print
If (VBGetSaveFileName(sfile, , , "ICO Files (*.ICO)|*.ICO|All Files (*.*)|*.*", , , , "ICO", Me.hwnd)) Then
cI.SaveIcon sfile
End If
Else
MsgBox "Lütfen Kaydedilecek Iconu Seçin...", vbInformation
End If
Else
MsgBox "Lütfen Kaydedilecek Iconu Seçin...", vbInformation
End If
End Sub
Private Sub pOpen()
Dim sfile As String
Dim lIndex As Long
Dim vItem As Variant
Dim iName As Long
Dim sExt As String
Dim iPos As Long
On Error GoTo ErrorHandler
If VBGetOpenFileName(sfile, , True, , , , "PE Files (*.exe;*.dll)|*.EXE;*.DLL", 1, , , "EXE", Me.hwnd) Then
txt.Text = sfile
m_iIconCount = 0
Erase m_cI
Set lvwIcons.Icons = Nothing
Set lvwIcons.SmallIcons = Nothing
ilsIcons16.ListImages.Clear
ilsIcons32.ListImages.Clear
sExt = "ICO"
For iPos = Len(sfile) To 1 Step -1
If (Mid$(sfile, iPos, 1) = ".") Then
sExt = UCase$(Mid$(sfile, iPos + 1))
Exit For
End If
Next iPos
If (sExt = "ICO") Then
m_iIconCount = 1
ReDim m_cI(1 To 1) As cFileIcon
Set m_cI(1) = New cFileIcon
m_cI(1).LoadIcon sfile
ilsIcons32.ListImages.Add , "C1", m_cI(1).IconPicture(Me.hdc, ClosestIndex(1, 32))
ilsIcons16.ListImages.Add , "C1", m_cI(1).IconPicture(Me.hdc, ClosestIndex(1, 16))
Else
Dim cR As New cResources
cR.file = sfile
cR.GetResourceTypes
lIndex = cR.IndexOfResourceType(crGroupIcon)
If (lIndex > 0) Then
cR.GetResourceNames lIndex
cR.UnloadModule
m_iIconCount = cR.ResourceNameCount(lIndex)
If (m_iIconCount > 0) Then
ReDim m_cI(1 To m_iIconCount) As cFileIcon
For iName = 1 To m_iIconCount
Set m_cI(iName) = New cFileIcon
vItem = cR.ResourceName(lIndex, iName)
If (VarType(vItem) = vbLong) Then
m_cI(iName).LoadIconFromEXE sfile, vItem
Else
m_cI(iName).LoadIconFromEXE sfile, , vItem
End If
ilsIcons32.ListImages.Add , "C" & iName, m_cI(iName).IconPicture(Me.hdc, ClosestIndex(iName, 32))
ilsIcons16.ListImages.Add , "C" & iName, m_cI(iName).IconPicture(Me.hdc, ClosestIndex(iName, 16))
Next iName
Else
pSetForIcons False
End If
Else
pSetForIcons False
End If
End If
pRender
End If
Exit Sub
ErrorHandler:
pSetForIcons False
MsgBox "Error: " & Err.Description, vbExclamation
m_iIconCount = 0
Erase m_cI
pRender
Exit Sub
Resume 0
End Sub
Private Sub pSetForIcons(Optional ByVal bIcons As Boolean = False)
If Not (bIcons) Then
End If
End Sub
Private Sub baslýk_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
tasi Me
End Sub
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
tasi Me
End Sub
Private Sub Form_Load()
SaydamYap Me, 200
lvwIcons.MouseIcon = cerceve(0).MouseIcon
Dim lColourDepth As Long
Dim lHWnd As Long
Dim lStyle As Long
lColourDepth = GetDeviceCaps(Me.hdc, BITSPIXEL)
If (lColourDepth > 8) Then
m_bTrueColour = True
End If
End Sub
Private Sub cmd_Click(Index As Integer)
Select Case Index
Case 0
pOpen
lvwIcons.SortKey = 0
Case 3
Unload Me
End Select
End Sub
Private Sub lvwIcons_ItemClick(ByVal Item As MSComctlLib.ListItem)
Dim iItem As Long
pSetForIcons True
iItem = CLng(Mid$(Item.Key, 2))
End Sub
Private Sub lvwIcons_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim i As Long
If (Button And vbRightButton) = vbRightButton Then
PopupMenu mndosy
End If
End Sub
Private Sub mnsave_Click()
pSave
End Sub
Private Sub mntümü_Click()
For j = 1 To lvwIcons.ListItems.Count
lvwIcons.ListItems.Item(j).Selected = True
Next
End Sub
