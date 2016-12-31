Attribute VB_Name = "basFileFunctions"
'----------------------------------------------------------------------------------------'
'
' Multi Downloader using multithreadings
' Created by Suk Yong Kim, 03/14/2001
'
' This project is my first project to upload to the PSC.
' Many persons contribute to create this project
' I really appreicate their efforts and codes and the great server PSC.
'
' if any question, mail to : techtrans@dreamwiz.com
'----------------------------------------------------------------------------------------'


Option Explicit

Private Declare Function GetLogicalDriveStrings _
     Lib "kernel32" Alias "GetLogicalDriveStringsA" _
    (ByVal nBufferLength As Long, _
     ByVal lpBuffer As String) As Long

Private Declare Function GetDriveType _
     Lib "kernel32" Alias "GetDriveTypeA" _
    (ByVal nDrive As String) As Long
    
Private Const DRIVE_REMOVABLE = 2
Private Const DRIVE_FIXED = 3
Private Const DRIVE_REMOTE = 4
Private Const DRIVE_CDROM = 5
Private Const DRIVE_RAMDISK = 6

' Structures
Private Type SHFILEOPSTRUCT
    hwnd As Long
    wFunc As Long
    pFrom As String
    pTo As String
    fFlags As Integer
    fAnyOperationsAborted As Long
    hNameMappings As Long
    lpszProgressTitle As Long
End Type

' API
Private Declare Function SHFileOperation Lib "shell32.dll" Alias "SHFileOperationA" (lpFileOp As SHFILEOPSTRUCT) As Long

' Contants
Private Const FO_DELETE = &H3
Private Const FOF_ALLOWUNDO = &H40
Private Const FOF_NOCONFIRMATION = &H10 ' Responds with "yes to all" for any dialog box that is displayed.
Private Const FOF_SILENT = &H4

Public Type BROWSEINFOTYPE
    hOwner As Long
    pidlRoot As Long
    pszDisplayName As String
    lpszTitle As String
    ulFlags As Long
    lpfn As Long
    lParam As Long
    iImage As Long
End Type

Private Declare Function SHBrowseForFolder Lib "shell32.dll" Alias "SHBrowseForFolderA" (lpBROWSEINFOTYPE As BROWSEINFOTYPE) As Long
Private Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long
Private Declare Sub CoTaskMemFree Lib "ole32.dll" (ByVal pv As Long)
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pDest As Any, pSource As Any, ByVal dwLength As Long)

Private Const WM_USER = &H400

Private Const BFFM_SETSELECTIONA As Long = (WM_USER + 102)
Private Const BFFM_SETSELECTIONW As Long = (WM_USER + 103)
Private Declare Function LocalAlloc Lib "kernel32" (ByVal uFlags As Long, ByVal uBytes As Long) As Long
Private Declare Function LocalFree Lib "kernel32" (ByVal hMem As Long) As Long
Private Const LPTR = (&H0 Or &H40)
Declare Function ShellExecute Lib "shell32.dll" _
    Alias "ShellExecuteA" (ByVal hwnd As Long, _
    ByVal lpOperation As String, _
    ByVal lpFile As String, _
    ByVal lpParameters As String, _
    ByVal lpDirectory As String, _
    ByVal nShowCmd As Long) As Long
    
Function ftnRunAnyFile(strFilePathName As String) As Long
    On Error Resume Next
    ftnRunAnyFile = ShellExecute(0, "open", strFilePathName, vbNullString, vbNullString, 1)
End Function

Private Function BrowseCallbackProcStr(ByVal hwnd As Long, ByVal uMsg As Long, ByVal lParam As Long, ByVal lpData As Long) As Long
If uMsg = 1 Then
    Call SendMessage(hwnd, BFFM_SETSELECTIONA, True, ByVal lpData)
End If
End Function

Private Function FunctionPointer(FunctionAddress As Long) As Long
FunctionPointer = FunctionAddress
End Function

Public Function BrowseForFolder(startPath As String, Optional ByVal strTitle As String) As String
Dim Browse_for_folder As BROWSEINFOTYPE
Dim itemID As Long
Dim selectedPathPointer As Long
Dim tmpPath As String * 256
Dim selectedPath As String

selectedPath = startPath ' Take the selected path from startPath
If Len(selectedPath) > 0 Then
    If Not Right$(selectedPath, 1) <> "\" Then selectedPath = Left$(selectedPath, Len(selectedPath) - 1) ' Remove "\" if the user added
End If

With Browse_for_folder
    .hOwner = 0 ' Window Handle
    If Len(strTitle) > 0 Then
        .lpszTitle = strTitle ' Dialog Title
    Else
        .lpszTitle = "Please, Select a folder."
    End If
    .lpfn = FunctionPointer(AddressOf BrowseCallbackProcStr) ' Dialog callback function that preselectes the folder specified
    selectedPathPointer = LocalAlloc(LPTR, Len(selectedPath) + 1) ' Allocate a string
    CopyMemory ByVal selectedPathPointer, ByVal selectedPath, Len(selectedPath) + 1 ' Copy the path to the string
    .lParam = selectedPathPointer ' The folder to preselect
End With
itemID = SHBrowseForFolder(Browse_for_folder) ' Execute the BrowseForFolder API
If itemID Then
    If SHGetPathFromIDList(itemID, tmpPath) Then ' Get the path for the selected folder in the dialog
        BrowseForFolder = Left$(tmpPath, InStr(tmpPath, vbNullChar) - 1) ' Take only the path without the nulls
    End If
    Call CoTaskMemFree(itemID) ' Free the itemID
End If
Call LocalFree(selectedPathPointer) ' Free the string from the memory
End Function

Public Sub fnMoveToRecycleBin(FileName As String, _
    Optional Confirm As Boolean = False, Optional Silent As Boolean = True)
    If Not fnFileExists(FileName) Then Exit Sub 'if file not exists exit sub
    Dim FileOp As SHFILEOPSTRUCT
    On Error GoTo bye
    'fills the file operation structure
    With FileOp
        .wFunc = FO_DELETE
        .pFrom = FileName
        .fFlags = FOF_ALLOWUNDO
        If Not Confirm Then .fFlags = .fFlags + FOF_NOCONFIRMATION
        If Silent Then .fFlags = .fFlags + FOF_SILENT
    End With
    SHFileOperation FileOp
bye:
End Sub

Function fnFolderExists(ByVal strFolderFullName As String) As Boolean
    Dim FSO As Object
    Dim ThisFolder As Object
    Set FSO = CreateObject("Scripting.FileSystemObject")
    fnFolderExists = FSO.folderexists(strFolderFullName)
    
    Set FSO = Nothing
    Set ThisFolder = Nothing
End Function

Function fnCreateSubFolder(ByVal strParentFolder As String, ByVal strFolderToCreate As String) As Boolean
    Dim FSO As Object
    Dim ThisFolder As Object
    On Error GoTo bye
    strParentFolder = fnGetPathRemoveEndDelimeter(strParentFolder)
    Set FSO = CreateObject("Scripting.FileSystemObject")
    If fnFolderExists(strParentFolder) Then
        If fnFolderExists(strParentFolder & "\" & strFolderToCreate) = False Then
            Set ThisFolder = FSO.CreateFolder(strParentFolder & "\" & strFolderToCreate)
        End If
        fnCreateSubFolder = True
    Else
        fnCreateSubFolder = False
    End If
    Set FSO = Nothing
    Set ThisFolder = Nothing
    
    Exit Function
bye:
    Set FSO = Nothing
    Set ThisFolder = Nothing
End Function
Function fnCreateFolder(ByVal strFolderToCreate As String) As Boolean
    strFolderToCreate = fnGetPathRemoveEndDelimeter(strFolderToCreate)
    If fnFolderExists(strFolderToCreate) Then fnCreateFolder = True: Exit Function
    Dim vFolder As Variant
    Dim vFolders As Variant
    Dim i As Integer
    vFolders = Split(strFolderToCreate, "\")
    Dim sParentFolder As String
    On Error GoTo Error_Drive
    For Each vFolder In vFolders
        If i = 0 Then
            sParentFolder = CStr(vFolder)
        ElseIf Len(CStr(vFolder)) Then
            fnCreateFolder = fnCreateSubFolder(sParentFolder, CStr(vFolder))
            sParentFolder = sParentFolder & "\" & CStr(vFolder)
        End If
        i = i + 1
    Next
bye:
    Exit Function
Error_Drive:
    fnCreateFolder = False
    MsgBox "No Drive! Creating folder is aborted!"
End Function

Function fnGetParentFolder(strFolder As String, Optional IsAttachDelimeter As Boolean) As String
    Dim Delimeter As String
    Delimeter = IIf(InExists(strFolder, "\"), "\", "/")
    fnGetParentFolder = BeforeRev(fnGetPathRemoveEndDelimeter(strFolder), Delimeter)
    If IsAttachDelimeter Then fnGetParentFolder = fnGetParentFolder & Delimeter
End Function
Function fnGetNetPath(ByVal strPath As String, Optional IsAttachPathDelimeter As Boolean) As String
    Dim tmpParent  As String
    fnGetNetPath = fnGetPathRemoveEndDelimeter(strPath)
    fnGetNetPath = fnGetParentFolder(fnGetNetPath, True)
    fnGetNetPath = Replace(strPath, fnGetNetPath, "")
    If Not IsAttachPathDelimeter Then fnGetNetPath = mID(fnGetNetPath, 1, Len(fnGetNetPath) - 1)
End Function


Function fnFileExists(strURL As String) As Boolean
    Dim IsWebURL As Boolean
'    If fnIsURL(strURL, , , IsWebURL) Then
            Dim FSO As Object
            Dim ThisFile As Object
            Set FSO = CreateObject("Scripting.FileSystemObject")
            fnFileExists = FSO.FileExists(strURL)
            Set FSO = Nothing
            Set ThisFile = Nothing
'    End If
End Function


Public Function fnIsURL(strURL As String, _
        Optional strRtnNetURL As String, Optional IsRootPath As Boolean, _
        Optional IsWebURL As Boolean, Optional Protocol As String, _
        Optional IsConvertPathDelimeter As Boolean, _
        Optional PathDelimeter As String) As Boolean
        
    Dim pos As Long
    
    fnIsURL = True
    
    If InExists(strURL, "http:///", 1, pos) Then
        Protocol = "http:///"
        IsWebURL = False
        fnIsURL = False
    ElseIf InExists(strURL, "http://", 1, pos) Then
        Protocol = "http://"
        IsWebURL = IIf(pos = 1, True, False)
        If IsWebURL Then strRtnNetURL = mID(strURL, pos + 7)
    ElseIf InExists(strURL, "ftp://", 1, pos) Then
        Protocol = "ftp://"
        IsWebURL = IIf(pos = 1, True, False)
        If IsWebURL Then strRtnNetURL = mID(strURL, pos + 6)
    ElseIf InExists(strURL, "pnm://", 1, pos) Then
        Protocol = "pnm://"
        IsWebURL = IIf(pos = 1, True, False)
        If IsWebURL Then strRtnNetURL = mID(strURL, pos + 6)
    ElseIf InExists(strURL, "mms://", 1, pos) Then
        Protocol = "mms://"
        IsWebURL = IIf(pos = 1, True, False)
        If IsWebURL Then strRtnNetURL = mID(strURL, pos + 6)
    ElseIf InExists(strURL, "rtsp://", 1, pos) Then
        Protocol = "rtsp://"
        IsWebURL = IIf(pos = 1, True, False)
        If IsWebURL Then strRtnNetURL = mID(strURL, pos + 7)
    ElseIf InExists(strURL, "file:///", 1, pos) Then
'        Protocol = "file:///"
        IsWebURL = IIf(pos = 1, False, True)
        If Not IsWebURL Then strRtnNetURL = mID(strURL, pos + 8)
    ElseIf InExists(strURL, "file://", 1, pos) Then
'        Protocol = "file://"
        IsWebURL = IIf(pos = 1, False, True)
        If Not IsWebURL Then strRtnNetURL = mID(strURL, pos + 7)
    ElseIf InExists(strURL, "file:", 1, pos) Then
'        Protocol = "file:"
        IsWebURL = IIf(pos = 1, False, True)
        If Not IsWebURL Then strRtnNetURL = mID(strURL, pos + 5)
    ElseIf Len(strURL) >= 3 Then
        IsWebURL = False
        If InExists(fnGetDriveString, Left(strURL, 3)) Then
            strRtnNetURL = strURL
        Else
            fnIsURL = False
        End If
    Else
        IsWebURL = False
        fnIsURL = False
    End If
    
    If fnIsURL Then
        If Len(PathDelimeter) = 0 Then PathDelimeter = IIf(IsWebURL, "/", "\")
        strRtnNetURL = Replace(strRtnNetURL, "?", PathDelimeter)
        strRtnNetURL = ReplaceSCharsInURL(strRtnNetURL)
        If IsConvertPathDelimeter Then
            strRtnNetURL = Replace(strRtnNetURL, "/", PathDelimeter)
            strRtnNetURL = Replace(strRtnNetURL, "\", PathDelimeter)
        ElseIf Not IsWebURL Then
            strRtnNetURL = Replace(strRtnNetURL, "/", PathDelimeter)
        End If
        
        If InCount(strRtnNetURL, PathDelimeter) = 0 Then
            IsRootPath = True
        ElseIf InCount(strRtnNetURL, PathDelimeter) = 1 Then
            If Right(strRtnNetURL, 1) = PathDelimeter Then IsRootPath = True
        End If
    End If
    
End Function
Private Function ReplaceSCharsInURL(ByVal strURL As String) As String
    strURL = Replace(strURL, "&amp;", "&")
    strURL = Replace(strURL, "%20", Space(1))
    ReplaceSCharsInURL = strURL
End Function

Function fnIsRootPath(strURL As String, Optional strRtnRootPath As String, _
    Optional NetURL As String, Optional IsAttachProtocol As Boolean = True, Optional Protocol As String, _
    Optional IsAttachPathDelimeter As Boolean, Optional PathDelimeter As String) As Boolean
    
    Dim IsRootPath As Boolean
    strRtnRootPath = fnGetRootPath(strURL, NetURL, IsAttachProtocol, Protocol, IsAttachPathDelimeter, PathDelimeter, IsRootPath)
    fnIsRootPath = IsRootPath
End Function

Function fnGetRootPath(strURL As String, Optional NetURL As String, _
    Optional IsAttachProtocol As Boolean = True, Optional Protocol As String, _
    Optional IsAttachPathDelimeter As Boolean, Optional PathDelimeter As String, _
    Optional IsRootPath As Boolean) As String
    
    Dim IsWebURL As Boolean

    If fnIsURL(strURL, NetURL, IsRootPath, IsWebURL, Protocol, IsAttachPathDelimeter, PathDelimeter) Then
        Dim pos As Long
        If InExists(NetURL, PathDelimeter, , pos) Then
            fnGetRootPath = mID(NetURL, 1, pos - 1)
        Else
            fnGetRootPath = NetURL
        End If
        If IsAttachProtocol Then fnGetRootPath = Protocol & fnGetRootPath
        If IsAttachPathDelimeter Then fnGetRootPath = fnGetRootPath & PathDelimeter
    End If
End Function
Function fnGetPath(strURL As String, Optional IsAttachPathDelimeter As Boolean, _
    Optional IsAttachProtocol As Boolean = True, _
    Optional IsRootPath As Boolean, _
    Optional strRtnRootPath As String) As String
    
    Dim NetURL As String
    Dim Protocol As String
    Dim PathDelimeter As String
    
    IsRootPath = fnIsRootPath(strURL, strRtnRootPath, NetURL, IsAttachProtocol, Protocol, IsAttachPathDelimeter, PathDelimeter)
    If IsRootPath Then
        fnGetPath = strRtnRootPath
    Else
        Dim pos As Long
        If InExistsRev(NetURL, PathDelimeter, , pos) Then
            fnGetPath = mID(NetURL, 1, pos - 1)
        End If
        If IsAttachProtocol Then fnGetPath = Protocol & fnGetPath
        If IsAttachPathDelimeter Then fnGetPath = fnGetPath & PathDelimeter
    End If
End Function


Function fnGetFileName(strURL As String, Optional IsReturnIndexHtmlIfRootPath As Boolean) As String
    If fnIsRootPath(strURL) Then
         If IsReturnIndexHtmlIfRootPath Then fnGetFileName = "index.html"
    Else
        Dim ii As Integer
        Dim pos As Integer
        For ii = Len(strURL) To 1 Step -1
            If mID(strURL, ii, 1) = "/" Or mID(strURL, ii, 1) = "?" Or mID(strURL, ii, 1) = "\" Then
                fnGetFileName = Right(strURL, Len(strURL) - ii)
                Exit For
            End If
        Next ii
        If Len(fnGetFileName) = 0 And IsReturnIndexHtmlIfRootPath Then
            fnGetFileName = "index.html"
        ElseIf Not InExistsRev(fnGetFileName, ".") And IsReturnIndexHtmlIfRootPath Then
            fnGetFileName = fnGetFileName & ".html"
        End If
    End If
End Function


Function fnGetNetFileName(strURL As String, Optional Prefix As String, Optional IsReturnIndexHtmlIfRootPath As Boolean) As String
    Dim pos As Long
    If fnIsURL(strURL) Then
        fnGetNetFileName = fnGetFileName(strURL, IsReturnIndexHtmlIfRootPath)
        If InExistsRev(fnGetNetFileName, ".", , pos) Then
            fnGetNetFileName = Prefix & mID(fnGetNetFileName, 1, pos - 1)
        End If
    Else
        If InExistsRev(strURL, ".", , pos) Then
            fnGetNetFileName = Prefix & mID(strURL, 1, pos - 1)
        Else
            fnGetNetFileName = Prefix & strURL
        End If
    End If
End Function
Function fnGetExtension(strURL As String, Optional PrefixBeforeDot As String, _
            Optional IsReturnIndexHtmlIfRootPath As Boolean) As String
    Dim pos As Long
    If fnIsURL(strURL) Then
         fnGetExtension = fnGetFileName(strURL, IsReturnIndexHtmlIfRootPath)
    Else
        fnGetExtension = strURL
    End If
    If InExistsRev(fnGetExtension, ".", , pos) Then
        fnGetExtension = mID(fnGetExtension, pos + 1)
    Else
        fnGetExtension = "html"
    End If
    If Len(PrefixBeforeDot) Then fnGetExtension = PrefixBeforeDot & "." & fnGetExtension
End Function

Function fnGetPathRemoveEndDelimeter(strPath As String) As String
    If Len(strPath) Then
        If Right(strPath, 1) = "/" Or Right(strPath, 1) = "?" Or Right(strPath, 1) = "\" Then
            fnGetPathRemoveEndDelimeter = mID(strPath, 1, Len(strPath) - 1)
        Else
            fnGetPathRemoveEndDelimeter = strPath
        End If
    End If
End Function
Function fnGetPortNum(ByVal strURL As String) As String
    fnGetPortNum = After(fnGetRootPath(strURL, , False), ":")
End Function

Public Function fnGetDriveString() As String
  'returns string of available
  'drives each separated by a null
   Dim sBuffer As String
  'possible 26 drives, three characters each
   sBuffer = Space$(26 * 3)
  If GetLogicalDriveStrings(Len(sBuffer), sBuffer) Then
     'do not trim off trailing null!
      fnGetDriveString = Trim$(sBuffer)
   End If
End Function

Function fnGetShortName(sFilePathName As String, Optional MaxLen As Integer = 80) As String
    Dim Path As String
    Dim RootPath As String
    Dim Delimeter As String
    Dim tmpName As String
    Dim FileName As String
    Dim Extension As String
    Dim strNetURL As String
    
    If Len(sFilePathName) <= MaxLen Then
        fnGetShortName = sFilePathName: Exit Function
    End If
    
    Delimeter = IIf(InExists(sFilePathName, "\"), "\", "/")
    Call fnIsRootPath(sFilePathName, RootPath, strNetURL)
    If InCount(strNetURL, Delimeter) <= 2 Then fnGetShortName = sFilePathName: Exit Function
    FileName = fnGetFileName(sFilePathName)
    If Len(FileName) Then ' is file
        Path = Delimeter & fnGetNetPath(fnGetPath(sFilePathName, True), True) & FileName
    Else 'is folder
        Path = Delimeter & fnGetNetPath(fnGetParentFolder(Path, True), True) & fnGetNetPath(sFilePathName, True)
    End If
    If Len(Path) > 50 Then
        fnGetShortName = RootPath & Delimeter & "..." & Right(Path, 50)
    Else
        fnGetShortName = RootPath & Delimeter & "..." & Path
    End If
End Function
