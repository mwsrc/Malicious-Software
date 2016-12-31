Attribute VB_Name = "mdlcdlg"
Option Explicit
Private Const MAX_PATH = 260
Private Type OPENFILENAME
lStructSize As Long
hWndOwner As Long
hInstance As Long
lpstrFilter As String
lpstrCustomFilter As String
nMaxCustFilter As Long
nFilterIndex As Long
lpstrFile As String
nMaxFile As Long
lpstrFileTitle As String
nMaxFileTitle As Long
lpstrInitialDir As String
lpstrTitle As String
flags As Long
nFileOffset As Integer
nFileExtension As Integer
lpstrDefExt As String
lCustData As Long
lpfnHook As Long
lpTemplateName As Long
End Type
Private Declare Function GetOpenFileName Lib "COMDLG32" _
Alias "GetOpenFileNameA" (file As OPENFILENAME) As Long
Private Declare Function GetSaveFileName Lib "COMDLG32" _
Alias "GetSaveFileNameA" (file As OPENFILENAME) As Long
Private Declare Function CommDlgExtendedError Lib "COMDLG32" () As Long
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As String) As Long
Private m_lApiReturn As Long
Private m_lExtendedError As Long
Public Enum EOpenFile
OFN_READONLY = &H1
OFN_OVERWRITEPROMPT = &H2
OFN_HIDEREADONLY = &H4
OFN_NOCHANGEDIR = &H8
OFN_SHOWHELP = &H10
OFN_ENABLEHOOK = &H20
OFN_ENABLETEMPLATE = &H40
OFN_ENABLETEMPLATEHANDLE = &H80
OFN_NOVALIDATE = &H100
OFN_ALLOWMULTISELECT = &H200
OFN_EXTENSIONDIFFERENT = &H400
OFN_PATHMUSTEXIST = &H800
OFN_FILEMUSTEXIST = &H1000
OFN_CREATEPROMPT = &H2000
OFN_SHAREAWARE = &H4000
OFN_NOREADONLYRETURN = &H8000
OFN_NOTESTFILECREATE = &H10000
OFN_NONETWORKBUTTON = &H20000
OFN_NOLONGNAMES = &H40000
OFN_EXPLORER = &H80000
OFN_NODEREFERENCELINKS = &H100000
OFN_LONGNAMES = &H200000
End Enum
Private Const MAX_FILE = 260&
Public Function VBGetOpenFileName(Filename As String, _
Optional FileTitle As String, _
Optional FileMustExist As Boolean = True, _
Optional MultiSelect As Boolean = False, _
Optional ReadOnly As Boolean = False, _
Optional HideReadOnly As Boolean = False, _
Optional Filter As String = "All (*.*)| *.*", _
Optional FilterIndex As Long = 1, _
Optional InitDir As String, _
Optional DlgTitle As String, _
Optional DefaultExt As String, _
Optional Owner As Long = -1, _
Optional flags As Long = 0) As Boolean
Dim opfile As OPENFILENAME, s As String, afFlags As Long
Dim lMax As Long
m_lApiReturn = 0
m_lExtendedError = 0
With opfile
.lStructSize = Len(opfile)
.flags = (-FileMustExist * OFN_FILEMUSTEXIST) Or _
(-MultiSelect * OFN_ALLOWMULTISELECT) Or _
(-ReadOnly * OFN_READONLY) Or _
(-HideReadOnly * OFN_HIDEREADONLY) Or _
(flags And CLng(Not (OFN_ENABLEHOOK Or _
OFN_ENABLETEMPLATE)))
If Owner <> -1 Then .hWndOwner = Owner
.lpstrInitialDir = InitDir
.lpstrDefExt = DefaultExt
.lpstrTitle = DlgTitle
Dim ch As String, i As Integer
For i = 1 To Len(Filter)
ch = Mid$(Filter, i, 1)
If ch = "|" Or ch = ":" Then
s = s & vbNullChar
Else
s = s & ch
End If
Next
s = s & vbNullChar & vbNullChar
.lpstrFilter = s
.nFilterIndex = FilterIndex
lMax = MAX_PATH
If (.flags And OFN_ALLOWMULTISELECT) = OFN_ALLOWMULTISELECT Then
lMax = 8192
End If
s = Filename & String$(lMax - Len(Filename), 0)
.lpstrFile = s
.nMaxFile = lMax
s = FileTitle & String$(lMax - Len(FileTitle), 0)
.lpstrFileTitle = s
.nMaxFileTitle = lMax
m_lApiReturn = GetOpenFileName(opfile)
Select Case m_lApiReturn
Case 1
VBGetOpenFileName = True
If (.flags And OFN_ALLOWMULTISELECT) = OFN_ALLOWMULTISELECT Then
FileTitle = ""
lMax = InStr(.lpstrFile, Chr$(0) & Chr$(0))
If (lMax = 0) Then
Filename = StrZToStr(.lpstrFile)
Else
Filename = Left$(.lpstrFile, lMax - 1)
End If
Else
Filename = StrZToStr(.lpstrFile)
FileTitle = StrZToStr(.lpstrFileTitle)
End If
flags = .flags
FilterIndex = .nFilterIndex
Filter = FilterLookup(.lpstrFilter, FilterIndex)
If (.flags And OFN_READONLY) Then ReadOnly = True
Case 0
VBGetOpenFileName = False
Filename = ""
FileTitle = ""
flags = 0
FilterIndex = -1
Filter = ""
Case Else
m_lExtendedError = CommDlgExtendedError()
VBGetOpenFileName = False
Filename = ""
FileTitle = ""
flags = 0
FilterIndex = -1
Filter = ""
 End Select
End With
End Function
Function VBGetSaveFileName(Filename As String, _
Optional FileTitle As String, _
Optional OverWritePrompt As Boolean = True, _
Optional Filter As String = "All (*.*)| *.*", _
Optional FilterIndex As Long = 1, _
Optional InitDir As String, _
Optional DlgTitle As String, _
Optional DefaultExt As String, _
Optional Owner As Long = -1, _
Optional flags As Long _
) As Boolean
Dim opfile As OPENFILENAME, s As String
m_lApiReturn = 0
m_lExtendedError = 0
With opfile
.lStructSize = Len(opfile)
.flags = (-OverWritePrompt * OFN_OVERWRITEPROMPT) Or _
OFN_HIDEREADONLY Or _
(flags And CLng(Not (OFN_ENABLEHOOK Or _
OFN_ENABLETEMPLATE)))
If Owner <> -1 Then .hWndOwner = Owner
.lpstrInitialDir = InitDir
.lpstrDefExt = DefaultExt
.lpstrTitle = DlgTitle
Dim ch As String, i As Integer
For i = 1 To Len(Filter)
ch = Mid$(Filter, i, 1)
If ch = "|" Or ch = ":" Then
s = s & vbNullChar
Else
s = s & ch
End If
 Next
s = s & vbNullChar & vbNullChar
.lpstrFilter = s
.nFilterIndex = FilterIndex
s = Filename & String$(MAX_PATH - Len(Filename), 0)
.lpstrFile = s
.nMaxFile = MAX_PATH
s = FileTitle & String$(MAX_FILE - Len(FileTitle), 0)
.lpstrFileTitle = s
.nMaxFileTitle = MAX_FILE
m_lApiReturn = GetSaveFileName(opfile)
Select Case m_lApiReturn
Case 1
VBGetSaveFileName = True
Filename = StrZToStr(.lpstrFile)
FileTitle = StrZToStr(.lpstrFileTitle)
flags = .flags
FilterIndex = .nFilterIndex
Filter = FilterLookup(.lpstrFilter, FilterIndex)
Case 0
VBGetSaveFileName = False
Filename = ""
FileTitle = ""
flags = 0
FilterIndex = 0
Filter = ""
Case Else
VBGetSaveFileName = False
m_lExtendedError = CommDlgExtendedError()
Filename = ""
FileTitle = ""
flags = 0
FilterIndex = 0
Filter = ""
End Select
End With
End Function
Private Function StrZToStr(s As String) As String
StrZToStr = Left$(s, lstrlen(s))
End Function
Private Function FilterLookup(ByVal sFilters As String, ByVal iCur As Long) As String
Dim iStart As Long, iEnd As Long, s As String
iStart = 1
If sFilters = "" Then Exit Function
Do
iEnd = InStr(iStart, sFilters, vbNullChar)
If iEnd = 0 Then Exit Function
iEnd = InStr(iEnd + 1, sFilters, vbNullChar)
If iEnd Then
s = Mid$(sFilters, iStart, iEnd - iStart)
Else
s = Mid$(sFilters, iStart)
End If
iStart = iEnd + 1
If iCur = 1 Then
FilterLookup = s
Exit Function
End If
iCur = iCur - 1
Loop While iCur
End Function




