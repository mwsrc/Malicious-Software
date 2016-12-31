VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cResources"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Declare Function LoadLibraryEx Lib "kernel32" Alias "LoadLibraryExA" (ByVal lpLibFileName As String, ByVal hFile As Long, ByVal dwFlags As Long) As Long
' Missing from VB API declarations:
Private Const LOAD_LIBRARY_AS_DATAFILE = &H2&
Private Declare Function LoadImage Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal un1 As Long, ByVal n1 As Long, ByVal n2 As Long, ByVal un2 As Long) As Long
Private Declare Function LoadAccelerators Lib "user32" Alias "LoadAcceleratorsA" (ByVal hInstance As Long, ByVal lpTableName As String) As Long
Private Declare Function LoadMenu Lib "user32" Alias "LoadMenuA" (ByVal hInstance As Long, ByVal lpString As String) As Long
Private Declare Function LoadString Lib "user32" Alias "LoadStringA" (ByVal hInstance As Long, ByVal wID As Long, ByVal lpBuffer As String, ByVal nBufferMax As Long) As Long
Private Declare Function LoadResource Lib "kernel32" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Private Const RT_CURSOR = 1&
Private Const RT_BITMAP = 2&
Private Const RT_ICON = 3&
Private Const RT_MENU = 4&
Private Const RT_DIALOG = 5&
Private Const RT_STRING = 6&
Private Const RT_FONTDIR = 7&
Private Const RT_FONT = 8&
Private Const RT_ACCELERATOR = 9&
Private Const RT_RCDATA = 10&
Private Const RT_MESSAGETABLE = 11&
Private Const RT_GROUP_CURSOR = RT_CURSOR + 11
Private Const RT_GROUP_ICON = RT_ICON + 11
Private Const RT_VERSION = 16&
Private Const RT_DLGINCLUDE = 17&
Private Const RT_PLUGPLAY = 19&
Private Const RT_VXD = 20&
Private Const RT_ANICURSOR = 21&
Private Const RT_ANIICON = 22&
Private Const RT_HTML = 23&

Public Enum CRStandardResourceTypeConstants
crCursor = RT_CURSOR
crBitmap = RT_BITMAP
crIcon = RT_ICON
crMenu = RT_MENU
crDialog = RT_DIALOG
crString = RT_STRING
crFontDir = RT_FONTDIR
crFont = RT_FONT
crAccelerator = RT_ACCELERATOR
crRCData = RT_RCDATA
crMessageTable = RT_MESSAGETABLE
crGroupCursor = RT_GROUP_CURSOR
crGroupIcon = RT_GROUP_ICON
crVersion = RT_VERSION
crDlgInclude = RT_DLGINCLUDE
crPlugPlay = RT_PLUGPLAY
crVXD = RT_VXD
crAniCursor = RT_ANICURSOR
crAniIcon = RT_ANIICON
crHTML = RT_HTML
End Enum
Private m_hMod As Long
Private m_sFile As String
Private Type tResourceTypes
lType As Long
sType As String
End Type
Private m_tRT() As tResourceTypes
Private m_iRTCount As Long
Private Type tResourceNames
lIndex As Long
lCount As Long
vNames() As Variant
End Type
Private m_tRN() As tResourceNames
Private m_iRNCount As Long
Private m_lEnumIndex As Long
Private m_lEnumNameIndex As Long

Public Property Get ResourceTypeName(ByVal eType As CRStandardResourceTypeConstants) As String
Dim s As String
Select Case eType
Case crCursor
s = "Cursor"
Case crBitmap
s = "Bitmap"
Case crIcon
s = "Icon"
Case crMenu
s = "Menu"
Case crDialog
s = "Dialog"
Case crString
s = "String"
Case crFontDir
s = "Font Directory"
Case crFont
s = "Font"
Case crAccelerator
s = "Accelerators"
Case crRCData
s = "RC Data"
Case crMessageTable
s = "Message Table"
Case crGroupCursor
s = "Group Cursor"
Case crGroupIcon
s = "Group Icon"
Case crVersion
s = "Version"
Case crDlgInclude
s = "Dialog Include"
Case crPlugPlay
s = "VXD"
Case crVXD
s = "VXD"
Case crAniCursor
s = "Animated Cursor"
Case crAniIcon
s = "Animated Icon"
Case crHTML
s = "HTML"
Case Else
s = "Other (" & eType & ")"
End Select
ResourceTypeName = s
End Property

Friend Sub AddResourceType(ByVal lType As Long, ByVal sType As String)
m_iRTCount = m_iRTCount + 1
ReDim Preserve m_tRT(1 To m_iRTCount) As tResourceTypes
With m_tRT(m_iRTCount)
.lType = lType
.sType = sType
End With
End Sub
Friend Sub AddResourceName(ByVal lName As Long, ByVal sName As String)
With m_tRN(m_lEnumNameIndex)
.lCount = .lCount + 1
ReDim Preserve .vNames(1 To .lCount) As Variant
If (lName = 0) Then
.vNames(.lCount) = sName
Else
.vNames(.lCount) = lName
End If
End With
End Sub

Public Property Get ResourceTypeCount() As Long
ResourceTypeCount = m_iRTCount
End Property
Public Property Get IndexOfResourceType(eType As CRStandardResourceTypeConstants) As Long
Dim iType As Long
For iType = 1 To m_iRTCount
If (m_tRT(iType).lType = eType) Then
IndexOfResourceType = iType
Exit For
End If
Next iType
End Property
Public Property Get ResourceType(ByVal iIndex As Long) As Variant
If (m_tRT(iIndex).sType <> "") Then
ResourceType = m_tRT(iIndex).sType
Else
ResourceType = m_tRT(iIndex).lType
End If
End Property
Public Property Get ResourceNameCount(ByVal iTypeIndex As Long) As Long
ResourceNameCount = m_tRN(plRNIndex(iTypeIndex)).lCount
End Property
Public Property Get ResourceName(ByVal iTypeIndex As Long, ByVal iNameIndex As Long) As Variant
ResourceName = m_tRN(plRNIndex(iTypeIndex)).vNames(iNameIndex)
End Property

Public Function GetResourceTypes() As Long
pClearResourceTypes
GetResourceTypes = mResource.GetResourceTypes(Me)
End Function

Public Function GetResourceNames(ByVal iIndex As Long) As Long
pClearResourceNames iIndex
m_lEnumIndex = iIndex
m_lEnumNameIndex = plRNIndexForce(iIndex)
If m_tRT(iIndex).sType = "" Then
GetResourceNames = mResource.GetResourceNames(Me, m_tRT(iIndex).lType)
Else
GetResourceNames = mResource.GetResourceNames(Me, m_tRT(iIndex).sType)
End If
End Function

Public Property Get file() As String
file = m_sFile
End Property
Public Property Let file(ByVal sFile As String)
ClearUp
m_sFile = sFile
m_hMod = LoadLibraryEx(sFile, ByVal 0&, LOAD_LIBRARY_AS_DATAFILE)
If (m_hMod = 0) Then
Err.Raise vbObjectError + 1048 + 1, App.EXEName & ".cResources", WinError(Err.LastDllError)
End If
End Property
Public Sub UnloadModule()
If (m_hMod <> 0) Then
FreeLibrary m_hMod
End If
m_hMod = 0
End Sub
Public Property Get hModule() As Long
hModule = m_hMod
End Property
Public Sub ClearUp()
UnloadModule
pClearResourceTypes
pClearResourceNames 0
End Sub
Private Sub pClearResourceTypes()
m_iRTCount = 0
Erase m_tRT
End Sub
Private Sub pClearResourceNames(ByVal iIndex As Long)
If (iIndex = 0) Then
Erase m_tRN
m_iRNCount = 0
Else
iIndex = plRNIndex(iIndex)
If (iIndex <> 0) Then
m_tRN(iIndex).lCount = 0
Erase m_tRN(iIndex).vNames
m_tRN(iIndex).lIndex = 0
End If
End If
End Sub
Private Function plRNIndex(ByVal iIndex As Long) As Long
Dim i As Long
For i = 1 To m_iRNCount
If (m_tRN(i).lIndex = iIndex) Then
plRNIndex = i
Exit For
End If
Next i
End Function
Private Function plRNIndexForce(ByVal iIndex As Long) As Long
Dim i As Long
Dim iFirstZero As Long
For i = 1 To m_iRNCount
If (m_tRN(i).lIndex = iIndex) Then
plRNIndexForce = i
Exit Function
ElseIf (m_tRN(i).lIndex = 0) Then
iFirstZero = i
End If
Next i
If (iFirstZero <> 0) Then
m_tRN(iFirstZero).lIndex = iIndex
plRNIndexForce = iFirstZero
Else
m_iRNCount = m_iRNCount + 1
ReDim Preserve m_tRN(1 To m_iRNCount) As tResourceNames
m_tRN(m_iRNCount).lIndex = iIndex
plRNIndexForce = m_iRNCount
End If
End Function

Private Sub Class_Terminate()
ClearUp
End Sub

