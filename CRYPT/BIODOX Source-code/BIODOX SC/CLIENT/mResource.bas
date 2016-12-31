Attribute VB_Name = "mResource"
Option Explicit
Private Declare Function EnumResourceLanguages Lib "kernel32" Alias "EnumResourceLanguagesA" (ByVal hModule As Long, ByVal lpType As String, ByVal lpName As String, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Private Declare Function EnumResourceNamesByNum Lib "kernel32" Alias "EnumResourceNamesA" (ByVal hModule As Long, ByVal lpType As Long, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Private Declare Function EnumResourceNamesByString Lib "kernel32" Alias "EnumResourceNamesA" (ByVal hModule As Long, ByVal lpType As String, ByVal lpEnumFunc As String, ByVal lParam As Long) As Long
Private Declare Function EnumResourceTypes Lib "kernel32" Alias "EnumResourceTypesA" (ByVal hModule As Long, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" ( _
lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)
Private Const FORMAT_MESSAGE_ALLOCATE_BUFFER = &H100
Private Const FORMAT_MESSAGE_ARGUMENT_ARRAY = &H2000
Private Const FORMAT_MESSAGE_FROM_HMODULE = &H800
Private Const FORMAT_MESSAGE_FROM_STRING = &H400
Private Const FORMAT_MESSAGE_FROM_SYSTEM = &H1000
Private Const FORMAT_MESSAGE_IGNORE_INSERTS = &H200
Private Const FORMAT_MESSAGE_MAX_WIDTH_MASK = &HFF
Private Declare Function FormatMessage Lib "kernel32" Alias "FormatMessageA" (ByVal dwFlags As Long, lpSource As Any, ByVal dwMessageId As Long, ByVal dwLanguageId As Long, ByVal lpBuffer As String, ByVal nSize As Long, Arguments As Long) As Long
Private m_cR As cResources
Public Function WinError(ByVal lLastDLLError As Long) As String
Dim sBuff As String
Dim lCount As Long
sBuff = String$(256, 0)
lCount = FormatMessage( _
FORMAT_MESSAGE_FROM_SYSTEM Or FORMAT_MESSAGE_IGNORE_INSERTS, _
0, lLastDLLError, 0&, sBuff, Len(sBuff), ByVal 0)
If lCount Then
WinError = left$(sBuff, lCount)
End If
End Function
Public Function GetResourceNames(cR As cResources, ByVal vType As Variant) As Long
Dim lR As Long
Dim lErr As Long
Dim lType As Long
Dim sType As String
Set m_cR = cR
If (VarType(vType) = vbLong) Then
lType = vType
lR = EnumResourceNamesByNum(cR.hModule, lType, AddressOf EnumResNamesProc, 0)
Else
sType = vType
lR = EnumResourceNamesByString(cR.hModule, sType, AddressOf EnumResNamesProc, 0)
End If
If (lR = 0) Then
lErr = Err.LastDllError
Err.Raise vbObjectError + 1048 + 2, App.EXEName & ".cResource", WinError(lErr)
End If
Set m_cR = Nothing
GetResourceNames = lR
End Function
Public Function EnumResNamesProc( _
ByVal hMod As Long, _
ByVal lpszType As Long, _
ByVal lpszName As Long, _
ByVal lParam As Long _
) As Long
Dim sName As String
Dim lName As Long
Dim b() As Byte
Dim lLen As Long
If (lpszName And &HFFFF0000) = 0 Then
lName = lpszName And &HFFFF&
m_cR.AddResourceName lName, ""
Else
lLen = lstrlen(lpszName)
If (lLen > 0) Then
ReDim b(0 To lLen - 1) As Byte
CopyMemory b(0), ByVal lpszName, lLen
sName = StrConv(b, vbUnicode)
End If
m_cR.AddResourceName 0, sName
End If
EnumResNamesProc = 1
End Function
Public Function GetResourceTypes(cR As cResources) As Long
Dim lR As Long
Dim lErr As Long
Set m_cR = cR
lR = EnumResourceTypes(cR.hModule, AddressOf EnumResTypesProc, 0)
If (lR = 0) Then
Err = Err.LastDllError
Set m_cR = Nothing
Err.Raise vbObjectError + 1048 + 1, App.EXEName & ".cResource", WinError(lErr)
End If
Set m_cR = Nothing
GetResourceTypes = lR
End Function
Private Function EnumResTypesProc( _
ByVal hMod As Long, _
ByVal lpszType As Long, _
ByVal lParam As Long _
) As Long
Dim lType As Long
Dim sType As String
Dim lLen As Long
Dim b() As Byte
If (lpszType And &HFFFF0000) = 0 Then
lType = lpszType And &HFFFF&
m_cR.AddResourceType lType, ""
Else
lLen = lstrlen(lpszType)
If (lLen > 0) Then
ReDim b(0 To lLen - 1) As Byte
CopyMemory b(0), ByVal lpszType, lLen
sType = StrConv(b(0), vbFromUnicode)
End If
m_cR.AddResourceType 0, sType
End If
EnumResTypesProc = 1
End Function
