VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmiconhunter 
   BackColor       =   &H00000000&
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   2205
   ClientLeft      =   225
   ClientTop       =   1380
   ClientWidth     =   5415
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmiconhunter.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2205
   ScaleWidth      =   5415
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
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
      Left            =   120
      TabIndex        =   1
      Top             =   1800
      Width           =   3975
   End
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
   Begin MSComctlLib.ListView lvwIcons 
      Height          =   1335
      Left            =   120
      TabIndex        =   0
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
   Begin Crypter.cmd btn 
      Height          =   285
      Index           =   0
      Left            =   4200
      TabIndex        =   2
      Top             =   1800
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   503
      BTYPE           =   14
      TX              =   "Select File"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   128
      BCOLO           =   128
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frmiconhunter.frx":000C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   3
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Crypter.cmd btn 
      Height          =   300
      Index           =   1
      Left            =   5160
      TabIndex        =   3
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   529
      BTYPE           =   8
      TX              =   "X"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   0
      BCOLO           =   0
      FCOL            =   16777215
      FCOLO           =   16777215
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frmiconhunter.frx":0326
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   2
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Label baslýk 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Icon Hunter"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   9.75
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   300
      Left            =   0
      TabIndex        =   4
      Top             =   0
      Width           =   5415
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000080&
      Index           =   1
      X1              =   -75
      X2              =   8085
      Y1              =   300
      Y2              =   300
   End
   Begin VB.Menu mndosy 
      Caption         =   "dosya"
      Visible         =   0   'False
      Begin VB.Menu mnsave 
         Caption         =   "Save"
      End
   End
End
Attribute VB_Name = "frmiconhunter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private m_cI() As cFileIcon
Private m_iIconCount As Long
Private m_bTrueColour As Boolean
Private Declare Function GetDeviceCaps Lib "gdi32" (ByVal hdc As Long, ByVal nIndex As Long) As Long
Private Const BITSPIXEL = 12
Dim sFile As String
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
Dim sFile As String
If (m_iIconCount > 0) Then
If Not lvwIcons.SelectedItem Is Nothing Then
iItem = CLng(Mid$(lvwIcons.SelectedItem.Key, 2))
Debug.Print
Dim cI As New cFileIcon
m_cI(iItem).CloneTo cI

Debug.Print
If (VBGetSaveFileName(sFile, , , "ICO Files (*.ICO)|*.ICO|All Files (*.*)|*.*", , , , "ICO", Me.hWnd)) Then
cI.SaveIcon sFile
'
End If
Else

End If
Else
End If
End Sub
Private Sub pOpen()
Dim sFile As String
Dim lIndex As Long
Dim vItem As Variant
Dim iName As Long
Dim sExt As String
Dim iPos As Long
On Error GoTo ErrorHandler
If VBGetOpenFileName(sFile, , True, , , , "PE Files (*.exe;*.dll)|*.EXE;*.DLL", 1, , , "EXE", Me.hWnd) Then
txt.Text = sFile
m_iIconCount = 0
Erase m_cI
Set lvwIcons.Icons = Nothing
Set lvwIcons.SmallIcons = Nothing
ilsIcons16.ListImages.Clear
ilsIcons32.ListImages.Clear
sExt = "ICO"
For iPos = Len(sFile) To 1 Step -1
If (Mid$(sFile, iPos, 1) = ".") Then
sExt = UCase$(Mid$(sFile, iPos + 1))
Exit For
End If
Next iPos
If (sExt = "ICO") Then
m_iIconCount = 1
ReDim m_cI(1 To 1) As cFileIcon
Set m_cI(1) = New cFileIcon
m_cI(1).LoadIcon sFile
ilsIcons32.ListImages.Add , "C1", m_cI(1).IconPicture(Me.hdc, ClosestIndex(1, 32))
ilsIcons16.ListImages.Add , "C1", m_cI(1).IconPicture(Me.hdc, ClosestIndex(1, 16))
Else
Dim cR As New cResources
cR.file = sFile
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
m_cI(iName).LoadIconFromEXE sFile, vItem
Else
m_cI(iName).LoadIconFromEXE sFile, , vItem
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

Private Sub btn_Click(Index As Integer)
    Select Case Index
        Case 0
            pOpen
            lvwIcons.SortKey = 0
        Case 1
            Unload Me
    End Select
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
tasi Me
End Sub
Private Sub Form_Load()
SaydamYap Me, 230
lvwIcons.MouseIcon = btn(0).MouseIcon
Dim lColourDepth As Long
Dim lHWnd As Long
Dim lStyle As Long
lColourDepth = GetDeviceCaps(Me.hdc, BITSPIXEL)
If (lColourDepth > 8) Then
m_bTrueColour = True
End If
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

