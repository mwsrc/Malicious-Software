VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClsSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'---------------------------------------------------------------------------------------
' Module      : ClsSearch
' DateTime    : 31/08/2010
' Author      : Leandro Ascierto
' WebPage     : http://www.leandroascierto.com.ar
' Purpose     : File and Folder search class
' Reference   : cFileList by Cobein(http://www.advancevb.com.ar)
' Credits     : raul338 and *PsYkE1* for regular expressions
' Tested on   : XP-SP3, Vista Home Premium and Seven
' Requirements: None
'
' History     : 31/08/2010 - First Cut
'---------------------------------------------------------------------------------------

'Apis
Private Declare Function FindFirstFile Lib "KERNEL32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindNextFile Lib "KERNEL32" Alias "FindNextFileA" (ByVal hFindFile As Long, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindClose Lib "KERNEL32" (ByVal hFindFile As Long) As Long
Private Declare Function lstrlen Lib "KERNEL32" Alias "lstrlenA" (ByVal lpString As String) As Long
Private Declare Function SystemTimeToFileTime Lib "kernel32.dll" (ByRef lpSystemTime As SYSTEMTIME, ByRef lpFileTime As FILETIME) As Long
Private Declare Function CompareFileTime Lib "kernel32.dll" (ByRef lpFileTime1 As FILETIME, ByRef lpFileTime2 As FILETIME) As Long
Private Declare Function CreateFile Lib "KERNEL32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Long, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Declare Function ReadFile Lib "kernel32.dll" (ByVal hFile As Long, ByRef lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, ByRef lpNumberOfBytesRead As Long, ByVal lpOverlapped As Long) As Long
Private Declare Function CloseHandle Lib "kernel32.dll" (ByVal hObject As Long) As Long
Private Declare Function LocalFileTimeToFileTime Lib "KERNEL32" (lpLocalFileTime As FILETIME, lpFileTime As FILETIME) As Long
Private Declare Function FileTimeToLocalFileTime Lib "KERNEL32" (lpFileTime As FILETIME, lpLocalFileTime As FILETIME) As Long
Private Declare Function GetFileSize Lib "kernel32.dll" (ByVal hFile As Long, ByRef lpFileSizeHigh As Long) As Long
Private Declare Function SetFilePointer Lib "kernel32.dll" (ByVal hFile As Long, ByVal lDistanceToMove As Long, ByRef lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function CharUpperBuffA& Lib "user32" (lpsz As Any, ByVal cchLength&)
Private Declare Function GetLogicalDriveStrings Lib "KERNEL32" Alias "GetLogicalDriveStringsA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
Private Declare Function GetDriveType Lib "KERNEL32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long

'Constantes
Private Const DRIVE_FIXED               As Long = 3
Private Const MAX_PATH                  As Long = 260
Private Const INVALID_HANDLE_VALUE      As Long = -1
Private Const FILE_ATTRIBUTE_DIRECTORY  As Long = &H10
Private Const GENERIC_READ              As Long = &H80000000
Private Const FILE_SHARE_READ           As Long = &H1
Private Const OPEN_EXISTING             As Long = 3
Private Const FILE_BEGIN                As Long = 0

'Type
Private Type FILETIME
    dwLowDateTime As Long
    dwHighDateTime As Long
End Type

Private Type LARGE_INTEGER
    LowPart As Long
    HighPart As Long
End Type

Private Type SYSTEMTIME
    wYear As Integer
    wMonth As Integer
    wDayOfWeek As Integer
    wDay As Integer
    wHour As Integer
    wMinute As Integer
    wSecond As Integer
    wMilliseconds As Integer
End Type

Private Type WIN32_FIND_DATA
    dwFileAttributes As Long
    ftCreationTime As FILETIME
    ftLastAccessTime As FILETIME
    ftLastWriteTime As FILETIME
    nFileSizeHigh As Long
    nFileSizeLow As Long
    dwReserved0 As Long
    dwReserved1 As Long
    cFileName As String * MAX_PATH
    cAlternate As String * 14
End Type

'Enumere
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

'Events
Public Event FileFound(ByVal sPath As String, ByVal sFile As String, ByVal bZipFile As Boolean)
Public Event FolderFound(ByVal sPath As String, ByVal sFolder As String, ByVal bZipFolder As Boolean)
Public Event SearchWordInFile(ByVal sFile As String)

Private aUChars(255)        As Byte
Private c_bCancel           As Boolean
Private c_cFolders          As Collection
Private c_cFiles            As Collection
Private m_FindInSubFolder   As Boolean
Private m_DoEvents          As Boolean
Private m_MinDate           As Date
Private m_MaxDate           As Date
Private m_FT_MinDate        As FILETIME
Private m_FT_MaxDate        As FILETIME
Private m_MinSize           As Currency
Private m_MaxSize           As Currency
Private m_SpecificWord      As String
Private m_FilterDateTime    As eDateTimeFilter
Private m_FilterFileSize    As eFileSizeFilter
Private m_SearchInSysFolder As Boolean
Private m_SearchInSubFolder As Boolean
Private m_SearchHidePath    As Boolean
Private m_WindowsDir        As String
Private m_StrMatch          As String
Private m_IgnoreCase        As Boolean
Private m_sPath             As String
Private m_SearchInZipFolder As Boolean
Private oRegExp             As Object
Private objShell            As Object

'Property Let
Public Property Let SearchInZipFolder(ByVal Value As Boolean): m_SearchInZipFolder = Value: End Property
Public Property Let IgnoreCase(ByVal Value As Boolean): m_IgnoreCase = Value: End Property
Public Property Let Path(ByVal sValue As String): m_sPath = sValue: End Property
Public Property Let CallDoEvents(ByVal Value As Boolean): m_DoEvents = Value: End Property
Public Property Let Match(ByVal sValue As String): m_StrMatch = sValue: End Property
Public Property Let SearchInSubFolder(ByVal Value As Boolean): m_SearchInSubFolder = Value: End Property
Public Property Let SearchInSystemFolder(ByVal Value As Boolean): m_SearchInSysFolder = Value: End Property
Public Property Let SearchHidePath(ByVal Value As Boolean): m_SearchHidePath = Value: End Property
Public Property Let SpecificWord(ByVal sWord As String): m_SpecificWord = sWord: End Property
Public Property Let FilterDateTime(ByVal Value As eDateTimeFilter): m_FilterDateTime = Value: End Property
Public Property Let MinFileSize(ByVal NewSize As Currency): m_MinSize = NewSize: End Property
Public Property Let MaxFileSize(ByVal NewSize As Currency): m_MaxSize = NewSize: End Property
Public Property Let FilterFileSize(ByVal Value As eFileSizeFilter): m_FilterFileSize = Value: End Property
Public Property Let MinDate(ByVal NewDate As Date): m_MinDate = NewDate: End Property
Public Property Let MaxDate(ByVal NewDate As Date): m_MaxDate = NewDate: End Property

'Property Get
Public Property Get SearchInZipFolder() As Boolean: SearchInZipFolder = m_SearchInZipFolder: End Property
Public Property Get IgnoreCase() As Boolean: IgnoreCase = m_IgnoreCase: End Property
Public Property Get Path() As String: Path = m_sPath: End Property
Public Property Get CallDoEvents() As Boolean: CallDoEvents = m_DoEvents: End Property
Public Property Get Match() As String: Match = m_StrMatch: End Property
Public Property Get SearchInSubFolder() As Boolean: SearchInSubFolder = m_SearchInSubFolder: End Property
Public Property Get SearchInSystemFolder() As Boolean: SearchInSystemFolder = m_SearchInSysFolder: End Property
Public Property Get SearchHidePath() As Boolean: SearchHidePath = m_SearchHidePath: End Property
Public Property Get SpecificWord() As String: SpecificWord = m_SpecificWord: End Property
Public Property Get FilterDateTime() As eDateTimeFilter: FilterDateTime = m_FilterDateTime: End Property
Public Property Get MinFileSize() As Currency: MinFileSize = m_MinSize: End Property
Public Property Get MaxFileSize() As Currency: MaxFileSize = m_MaxSize: End Property
Public Property Get FilterFileSize() As eFileSizeFilter: FilterFileSize = m_FilterFileSize: End Property
Public Property Get MinDate() As Date: MinDate = m_MinDate: End Property
Public Property Get MaxDate() As Date: MaxDate = m_MaxDate: End Property

Public Function Folders() As Collection: Set Folders = c_cFolders: End Function
Public Function Files() As Collection: Set Files = c_cFiles: End Function

Public Sub Cancel(): c_bCancel = True: End Sub

Public Sub StartSearch()
    Dim ArrPaths() As String
    Dim i As Long
    
    c_bCancel = True

    Set c_cFolders = New Collection
    Set c_cFiles = New Collection
    Set oRegExp = CreateObject("VBScript.RegExp")
    
    m_FT_MinDate = DateToFileTime(m_MinDate)
    m_FT_MaxDate = DateToFileTime(m_MaxDate)

    With oRegExp
        .Pattern = ReplaceFilter(m_StrMatch)
        .Global = True
        .IgnoreCase = m_IgnoreCase
    End With
    
    If m_SearchInZipFolder Then
        Set objShell = CreateObject("Shell.Application")
    End If
    
    ArrPaths = Split(m_sPath, ";")
    
    c_bCancel = False
    
    For i = 0 To UBound(ArrPaths)
        pvFindFiles Trim(ArrPaths(i))
        If c_bCancel Then Exit For
    Next
    
    Set oRegExp = Nothing
    Set objShell = Nothing
End Sub


Private Function pvFindFiles(ByVal sPath As String) As Boolean
    
    Dim lRet                As Long
    Dim lDateDiff           As Long
    Dim lhSearch            As Long
    Dim tWFD                As WIN32_FIND_DATA
    Dim svDirs()            As String
    Dim lCount              As Long
    Dim sDir                As String
    Dim sFile               As String
    Dim i                   As Long
    Dim sFolder             As String
    Dim FileSize            As Currency
    Dim tFT                 As FILETIME
    Dim sMatch              As String
    
    If c_bCancel Then Exit Function
        
    Call NormalizePath(sPath)
    
    lhSearch = FindFirstFile(sPath & "*", tWFD)
    
    If Not lhSearch = INVALID_HANDLE_VALUE Then
    
        Do
            If (tWFD.dwFileAttributes And vbDirectory) <> vbDirectory Then
            
                sFile = StripNulls(tWFD.cFileName)
                
                If m_SearchInZipFolder Then
                    If Len(m_SpecificWord) = 0 Then
                        If UCase$(Right$(sFile, 4)) = ".ZIP" Then
                            Call FindInZipFolder(sPath & sFile)
                        End If
                    End If
                End If
                
                If Not m_SearchHidePath Then
                    If (tWFD.dwFileAttributes And vbHidden) = vbHidden Then GoTo FINDNEXT
                End If

                If m_FilterDateTime <> NoDateTimeFilter Then
                
                    If m_FilterDateTime = LastWriteTime Then
                        tFT = tWFD.ftLastWriteTime
                    ElseIf m_FilterDateTime = CreationTime Then
                        tFT = tWFD.ftCreationTime
                    Else 'If m_FilterDateTime = LastAccessTime Then
                        tFT = tWFD.ftLastAccessTime
                    End If

                    If Not ((CompareFileTime(tFT, m_FT_MinDate) >= 0) And (CompareFileTime(tFT, m_FT_MaxDate) <= 0)) Then GoTo FINDNEXT
            
                End If
                
                
                If m_FilterFileSize <> NoFilterSize Then
                
                    FileSize = LargeIntToCurrency(tWFD.nFileSizeLow, tWFD.nFileSizeHigh)

                    If m_FilterFileSize = MinSize Then
                        If FileSize < m_MinSize Then GoTo FINDNEXT
                    ElseIf m_FilterFileSize = MaxSize Then
                        If FileSize >= m_MaxSize Then GoTo FINDNEXT
                    Else 'if m_FilterFileSize = MinAndMax Then
                        If (FileSize < m_MinSize And FileSize > m_MaxSize) Then GoTo FINDNEXT
                    End If
                    
                End If
                
                If oRegExp Is Nothing Then Call FindClose(lhSearch): Exit Function
                
                If oRegExp.Execute(sFile).Count = 0 Then GoTo FINDNEXT
                
                If Len(m_SpecificWord) Then
                    RaiseEvent SearchWordInFile(sPath & sFile)
                    If Not FindWordInFile(sPath & sFile, m_SpecificWord) Then GoTo FINDNEXT
                End If

                Call c_cFiles.Add(sPath & sFile)

                RaiseEvent FileFound(sPath, sFile, False)
            Else
            
                If Not m_SearchHidePath Then
                    If (tWFD.dwFileAttributes And vbHidden) = vbHidden Then GoTo FINDNEXT
                End If
                                
                sFolder = StripNulls(tWFD.cFileName)
        
                If InStrB(sFolder, ".") <> 1 Then

                    sDir = sPath & sFolder & "\"
                    
                    If Not m_SearchInSysFolder Then
                        If sDir = m_WindowsDir Then GoTo FINDNEXT
                    End If

                    ReDim Preserve svDirs(lCount)
                    svDirs(lCount) = sDir
                    lCount = lCount + 1
                    
                    If m_FilterFileSize <> NoFilterSize Then
                        If m_FilterFileSize = MinSize Then GoTo FINDNEXT
                        If m_FilterFileSize = MinAndMax Then GoTo FINDNEXT
                    End If
                    
                    If oRegExp Is Nothing Then Call FindClose(lhSearch): Exit Function

                    If oRegExp.Execute(sFolder).Count = 0 Then GoTo FINDNEXT

                    Call c_cFolders.Add(sPath & sFolder)
                    RaiseEvent FolderFound(sPath, sFolder, False)
                End If
            End If
            
FINDNEXT:

            If c_bCancel Then Call FindClose(lhSearch): Exit Function
            
            If m_DoEvents Then DoEvents
            
            lRet = FindNextFile(lhSearch, tWFD)
            
        Loop While lRet
        
        Call FindClose(lhSearch)
        
    End If
    

    
    If m_SearchInSubFolder Then
        For i = 0 To lCount - 1
            Call pvFindFiles(svDirs(i))
        Next
    End If
    
End Function

Private Function FindInZipFolder(ByVal Root As String, Optional ByVal sPath As String)
'    Dim objFolder As Object
'    Dim oItem As Object
'    Dim sFolder As String
'    Dim sFile As String
'    Dim ItemName As String
'    Dim FileSize As Currency
'    Dim tFT As FILETIME
'
'    Set objFolder = objShell.NameSpace(CVar(Root & sPath))
'
'    If objFolder Is Nothing Then Exit Function
'
'    For Each oItem In objFolder.Items()
'
'        If Not oItem.IsFolder Then
'
'            ItemName = Right(oItem.Path, Len(oItem.Path) - InStrRev(oItem.Path, "/"))
'
'            If oRegExp Is Nothing Then Exit Function
'
'            If oRegExp.Execute(ItemName).Count = 0 Then GoTo FINDNEXT
'
'            If m_FilterDateTime <> NoDateTimeFilter Then
'
'                If m_FilterDateTime <> LastWriteTime Then
'                    GoTo FINDNEXT
'                End If
'
'                tFT = DateToFileTime(CDate(objFolder.ParentFolder.GetDetailsOf(oItem, 7)))
'
'                If Not ((CompareFileTime(tFT, m_FT_MinDate) >= 0) And (CompareFileTime(tFT, m_FT_MaxDate) <= 0)) Then GoTo FINDNEXT
'
'            End If
'
'            If m_FilterFileSize <> NoFilterSize Then
'
'                FileSize = oItem.SIZE
'
'                If m_FilterFileSize = MinSize Then
'                    If oItem.SIZE < m_MinSize Then GoTo FINDNEXT
'                ElseIf m_FilterFileSize = MaxSize Then
'                    If FileSize >= m_MaxSize Then GoTo FINDNEXT
'                Else 'if m_FilterFileSize = MinAndMax Then
'                    If (FileSize < m_MinSize And FileSize > m_MaxSize) Then GoTo FINDNEXT
'                End If
'
'            End If
'
'            sFile = Root & "\" & oItem.Path
'
'            Call c_cFiles.Add(sFile)
'            RaiseEvent FileFound(Root, oItem.Path, True)
'
'        Else
'
'            If m_FilterFileSize <> NoFilterSize Then
'                If m_FilterFileSize = MinSize Then GoTo FINDNEXTFOLDER
'            End If
'
'            If m_FilterDateTime <> NoDateTimeFilter Then GoTo FINDNEXTFOLDER
'
'            If oRegExp Is Nothing Then Exit Function
'
'            If oRegExp.Execute(oItem).Count = 0 Then GoTo FINDNEXTFOLDER
'
'            sFolder = Root & "\" & oItem.Path
'
'            Call c_cFolders.Add(sFolder)
'            RaiseEvent FolderFound(Root & "\", oItem.Path, True)
'
'FINDNEXTFOLDER:
'
'            If c_bCancel Then Exit Function
'
'            If m_DoEvents Then DoEvents
'
'            FindInZipFolder Root, "\" & oItem.Path
'
'
'        End If
'
'FINDNEXT:
'
'        If c_bCancel Then Exit Function
'
'        If m_DoEvents Then DoEvents
'
'    Next
'
End Function

Private Function FindWordInFile(ByVal sPath As String, ByVal sWord As String, Optional ByVal bUnicode As Boolean) As Boolean
    Dim bArray() As Byte
    Dim lRet As Long
    Dim hFile As Long
    Dim sFind() As Byte
    Dim s As String
    Dim t As Long
    Dim i As Long
    Dim FileSize As Currency
    Dim tLI As LARGE_INTEGER
    Dim LenBuffer As Long
    Dim CurPos As Currency

    sWord = UCase(sWord)
    If bUnicode Then sWord = StrConv(sWord, vbUnicode)
    sFind = StrConv(sWord, vbFromUnicode)

    hFile = CreateFile(sPath, GENERIC_READ, FILE_SHARE_READ, ByVal 0&, OPEN_EXISTING, 0, 0)
    
    If hFile <> INVALID_HANDLE_VALUE Then
    
        
        tLI.LowPart = GetFileSize(hFile, tLI.HighPart)
    
        LenBuffer = &H2800 ' 10 KB
    
        FileSize = LargeIntToCurrency(tLI.LowPart, tLI.HighPart)
        
        If FileSize < UBound(sFind) Then GoTo OutSearch
    
        If LenBuffer > FileSize Then LenBuffer = FileSize
    
        ReDim bArray(LenBuffer - 1)
 
        Do
            ReadFile hFile, bArray(0), UBound(bArray) + 1, lRet, 0&
            
            If lRet = 0 Then Exit Do
            
            CurPos = CurPos + lRet

            If lRet < LenBuffer Then
                ReDim Preserve bArray(lRet)
            End If

            If InBytes(bArray, sFind) <> -1 Then
                FindWordInFile = True
                Exit Do
            End If
            
            If CurPos = FileSize Then Exit Do
            
            tLI = CurrencyToLargeInt(CurPos - UBound(sFind) + 1)
            
            SetFilePointer hFile, tLI.LowPart, tLI.HighPart, FILE_BEGIN
                        
            If c_bCancel Then GoTo OutSearch
        Loop
        
OutSearch:
        
        CloseHandle hFile

    End If
End Function

Private Function InBytes(ByRef bvSource() As Byte, ByRef bvMatch() As Byte) As Long

    Dim i       As Long
    Dim J       As Long
    Dim lChr    As Byte
    Dim LenMach As Long
 
    LenMach = UBound(bvMatch)
    
    lChr = bvMatch(0)
    
    If LenMach > 0 Then
    
        For i = 0 To UBound(bvSource) - LenMach
      
            If (lChr = aUChars(bvSource(i))) Then

                J = LenMach - 1
    
                Do
                    If bvMatch(J) <> aUChars(bvSource(i + J)) Then GoTo NotEqual
                    J = J - 1
                Loop While J
                
                InBytes = i
                
                Exit Function
    
            End If
NotEqual:
        
        Next
    
    Else
        For i = 0 To UBound(bvSource)
            If (lChr = aUChars(bvSource(i))) Then
                InBytes = i
                Exit Function
            End If
        Next
    End If

    InBytes = -1
End Function

Private Function StripNulls(sData As String) As String
    StripNulls = Left$(sData, lstrlen(sData))
End Function

Private Sub NormalizePath(sData As String)
    sData = IIf(Right$(sData, 1) = "\", sData, sData & "\")
End Sub

Private Function DateToFileTime(ByVal vbDate As Date) As FILETIME
    Dim ST As SYSTEMTIME

    With ST
        .wYear = Year(vbDate)
        .wMonth = Month(vbDate)
        .wDay = Day(vbDate)
        .wHour = Hour(vbDate)
        .wMinute = Minute(vbDate)
        .wSecond = Second(vbDate)
    End With

    SystemTimeToFileTime ST, DateToFileTime
    LocalFileTimeToFileTime DateToFileTime, DateToFileTime

End Function

Private Function LargeIntToCurrency(Low As Long, High As Long) As Currency
    Dim LI As LARGE_INTEGER
    LI.LowPart = Low: LI.HighPart = High
    CopyMemory LargeIntToCurrency, LI, LenB(LI)
    LargeIntToCurrency = LargeIntToCurrency * 10000
End Function

Private Function CurrencyToLargeInt(ByVal Curr As Currency) As LARGE_INTEGER
    Curr = Curr / 10000
    CopyMemory CurrencyToLargeInt, Curr, LenB(Curr)
End Function


Private Function ReplaceFilter(ByVal sFilter As String) As String
    sFilter = Replace(sFilter, "+", "\+")
    sFilter = Replace(sFilter, ".", "\.")
    sFilter = Replace(sFilter, "|", "\|")
    sFilter = Replace(sFilter, ";", "|\b")
    sFilter = Replace(sFilter, " ", "|\b")
    sFilter = Replace(sFilter, "{", "\{")
    sFilter = Replace(sFilter, "}", "\}")
    sFilter = Replace(sFilter, "*", ".+")
    sFilter = Replace(sFilter, "?", ".{1}")
    sFilter = Replace(sFilter, "(", "\(")
    sFilter = Replace(sFilter, ")", "\)")
    sFilter = Replace(sFilter, "^", "\^")
    sFilter = Replace(sFilter, "$", "\$")
    sFilter = Replace(sFilter, "[", "\[")
    sFilter = Replace(sFilter, "[", "\]")
    
    Do While InStr(sFilter, "|\b|\b")
        sFilter = Replace$(sFilter, "|\b|\b", "|\b")
    Loop
    
    ReplaceFilter = "^(" & sFilter & ")$|(" & sFilter & ".+)"
End Function

Public Function GetAllDriveFixed() As String
    Dim sBuff As String * 255
    Dim arrDrive() As String
    Dim i As Long

    i = GetLogicalDriveStrings(255, sBuff)

    arrDrive = Split(Left$(sBuff, i - 1), Chr$(0))

    For i = 0 To UBound(arrDrive)
        If GetDriveType(arrDrive(i)) = DRIVE_FIXED Then
            GetAllDriveFixed = GetAllDriveFixed & arrDrive(i) & "; "
        End If
    Next
    
    GetAllDriveFixed = Left(GetAllDriveFixed, Len(GetAllDriveFixed) - 2)

End Function

Private Sub Class_Initialize()
    Dim i As Long

    For i = 0 To 255: aUChars(i) = i: Next
    CharUpperBuffA aUChars(0), 256
    
    m_WindowsDir = Environ("windir")
    NormalizePath m_WindowsDir
    
    m_SearchInSysFolder = True
    m_SearchInSubFolder = True
    m_SearchHidePath = False
    m_IgnoreCase = True
    m_sPath = GetAllDriveFixed
End Sub

Private Sub Class_Terminate()
    c_bCancel = True
    Set c_cFolders = Nothing
    Set c_cFiles = Nothing
    Set oRegExp = Nothing
    Set objShell = Nothing
End Sub


