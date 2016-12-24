Attribute VB_Name = "MdlGlobal"

Option Explicit

Private Declare Function PathIsDirectory Lib "shlwapi.dll" Alias "PathIsDirectoryA" (ByVal pszPath As String) As Long
Private Declare Function SHFileOperation Lib "shell32.dll" Alias "SHFileOperationA" (lpFileOp As SHFILEOPSTRUCT) As Long
Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFilename As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Any, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Declare Function DeviceIoControl Lib "kernel32" (ByVal hDevice As Long, ByVal dwIoControlCode As Long, lpInBuffer As Any, ByVal nInBufferSize As Long, lpOutBuffer As Any, ByVal nOutBufferSize As Long, lpBytesReturned As Long, lpOverlapped As Any) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Public Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As DRIVE_TYPE
Private Declare Function GetLogicalDriveStrings Lib "kernel32" Alias "GetLogicalDriveStringsA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
Private Declare Function GetVolumeInformation Lib "kernel32" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Long, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Long) As Long
Private Declare Function WNetGetConnection Lib "mpr.dll" Alias "WNetGetConnectionA" (ByVal lpszLocalName As String, ByVal lpszRemoteName As String, cbRemoteName As Long) As Long
Private Declare Function SHGetSpecialFolderLocation Lib "shell32.dll" (ByVal hwndOwner As Long, ByVal nFolder As Long, pidl As ITEMIDLIST) As Long
Private Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long
'Private Declare Function SHSimpleIDListFromPath Lib "shell32" Alias "#162" (ByVal szPath As String) As Long
Private Declare Function RtlGetVersion Lib "NTDLL" (ByRef lpVersionInformation As Long) As Long
Private Declare Function GetUserNameA Lib "advapi32.dll" (ByVal lpBuffer As String, nSize As Long) As Long
Private Declare Function GetComputerNameA Lib "kernel32" (ByVal lpBuffer As String, nSize As Long) As Long
Private Declare Function GetLocaleInfo Lib "kernel32" Alias "GetLocaleInfoA" (ByVal Locale As Long, ByVal LCType As Long, ByVal lpLCData As String, ByVal cchData As Long) As Long
'Private Declare Function CreateProcessA Lib "kernel32" (ByVal lpApplicationName As String, ByVal lpCommandLine As String, lpProcessAttributes As Any, lpThreadAttributes As Any, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, lpEnvironment As Any, ByVal lpCurrentDriectory As String, lpStartupInfo As STARTUPINFO, lpProcessInformation As Any) As Long
Private Declare Function SetClipboardViewer Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function IsClipboardFormatAvailable Lib "user32" (ByVal wFormat As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

Private Declare Function RtlGetCompressionWorkSpaceSize Lib "NTDLL" (ByVal flags As Integer, WorkSpaceSize As Long, UNKNOWN_PARAMETER As Long) As Long
Private Declare Function NtAllocateVirtualMemory Lib "ntdll.dll" (ByVal ProcHandle As Long, BaseAddress As Long, ByVal NumBits As Long, regionsize As Long, ByVal flags As Long, ByVal ProtectMode As Long) As Long
Private Declare Function RtlCompressBuffer Lib "NTDLL" (ByVal flags As Integer, ByVal BuffUnCompressed As Long, ByVal UnCompSize As Long, ByVal BuffCompressed As Long, ByVal CompBuffSize As Long, ByVal UNKNOWN_PARAMETER As Long, OutputSize As Long, ByVal WorkSpace As Long) As Long
Private Declare Function RtlDecompressBuffer Lib "NTDLL" (ByVal flags As Integer, ByVal BuffUnCompressed As Long, ByVal UnCompSize As Long, ByVal BuffCompressed As Long, ByVal CompBuffSize As Long, OutputSize As Long) As Long
Private Declare Function NtFreeVirtualMemory Lib "ntdll.dll" (ByVal ProcHandle As Long, BaseAddress As Long, regionsize As Long, ByVal flags As Long) As Long
 



Private Const FILE_FLAG_BACKUP_SEMANTICS As Long = &H2000000
Private Const INVALID_HANDLE_VALUE  As Long = (-1)
Private Const OPEN_EXISTING         As Long = 3
Private Const FILE_SHARE_READ       As Long = &H1
Private Const FILE_SHARE_WRITE      As Long = &H2
Private Const IOCTL_STORAGE_BASE    As Long = &H2D
Private Const METHOD_BUFFERED       As Long = 0
Private Const FILE_ANY_ACCESS       As Long = 0

Private Enum STORAGE_PROPERTY_ID
    StorageDeviceProperty = 0
    StorageAdapterProperty
End Enum

Public Enum AccessType
    GENERIC_READ = &H80000000
    GENERIC_WRITE = &H40000000
    GENERIC_READWRITE = &HC0000000
End Enum

Private Enum STORAGE_QUERY_TYPE
    PropertyStandardQuery = 0
    PropertyExistsQuery
    PropertyMaskQuery
    PropertyQueryMaxDefined
End Enum

Public Enum STORAGE_BUS_TYPE
    BusTypeUnknown = 0
    BusTypeScsi = 1
    BusTypeAtapi = 2
    BusTypeAta = 3
    BusType1394 = 4
    BusTypeSsa = 5
    BusTypeFibre = 6
    BusTypeUsb = 7
    BusTypeRAID = 8
    BusTypeMaxReserved = &H7F
End Enum

Private Type STORAGE_PROPERTY_QUERY
    PropertyId                      As STORAGE_PROPERTY_ID
    QueryType                       As STORAGE_QUERY_TYPE
    AdditionalParameters(0)         As Byte
End Type


Private Type OVERLAPPED
    Internal                        As Long
    InternalHigh                    As Long
    offset                          As Long
    OffsetHigh                      As Long
    hEvent                          As Long
End Type

Private Type STORAGE_DEVICE_DESCRIPTOR
    Version                         As Long
    SIZE                            As Long
    DeviceType                      As Byte
    DeviceTypeModifier              As Byte
    RemovableMedia                  As Byte
    CommandQueueing                 As Byte
    VendorIdOffset                  As Long
    ProductIdOffset                 As Long
    ProductRevisionOffset           As Long
    SerialNumberOffset              As Long
    BusType                         As STORAGE_BUS_TYPE
    RawPropertiesLength             As Long
    RawDeviceProperties(0)          As Byte
End Type

Public Enum DRIVE_TYPE
    DRIVE_UNKNOWN = 0
    DRIVE_ABSENT = 1
    DRIVE_REMOVABLE = 2
    DRIVE_FIXED = 3
    DRIVE_REMOTE = 4
    DRIVE_CDROM = 5
    DRIVE_RAMDISK = 6
End Enum

Private Type SHITEMID
    cb As Long
    abID As Byte
End Type

Private Type ITEMIDLIST
    mkid As SHITEMID
End Type


Private Const FO_MOVE                   As Long = &H1
Private Const FO_COPY                   As Long = &H2
Private Const FO_DELETE                 As Long = &H3
Private Const FO_RENAME                 As Long = &H4

Private Const FOF_ALLOWUNDO             As Long = &H40
Private Const FOF_NOCONFIRMATION        As Long = &H10
Private Const FOF_SILENT                As Long = &H4

Private Const LOCALE_USER_DEFAULT       As Long = &H400
Private Const LOCALE_SENGCOUNTRY        As Long = &H1002
Private Const LOCALE_SENGLANGUAGE       As Long = &H1001
Private Const LOCALE_SNATIVELANGNAME    As Long = &H4
Private Const LOCALE_SNATIVECTRYNAME    As Long = &H8
Private Const LOCALE_SISO3166CTRYNAME   As Long = &H5A

Private Const GWL_WNDPROC = (-4)
Private Const WM_DRAWCLIPBOARD As Long = &H308

Private Type SHFILEOPSTRUCT
    hwnd                                As Long
    wFunc                               As Long
    pFrom                               As String
    pTo                                 As String
    fFlags                              As Long
    fAborted                            As Boolean
    hNameMaps                           As Long
    sProgress                           As String
End Type


Public Const Delimiter                  As String = "|"
Public Const END_DATA                   As String = "¡@#@!"

Public cColl            As Collection   'Colección de clases de conexiones, puede ser un ClsExplorer, ClsFileTranser o lo que se implemente en futuro
Public ClipBoard_Cut    As Long         'Almacena el IDList de un archivo para ser cortado.
Public ClipBoard_Copy   As Long         'Almacena el IDList de un archivo simulando un portapapeles
Public Id_List()        As String       'Array que contiene un orden de archivos listados.

Public ServerIP         As String       'Almacena la IP del Servidor
Public ServerPuerto     As String       'Almacena el puerto del servidor
Public ServerName       As String       'Almacena alguna descripción para el Ejecutable/Servidor.

Public m_SockClipboard As Long
Public RemoteClipboardChange As Boolean
Private PrevProc As Long

Public Function Compress(Data() As Byte, Out() As Byte) As Long
    Dim WorkSpaceSize As Long
    Dim WorkSpace As Long
    ReDim Out(UBound(Data) * 1.13 + 4)
 
    RtlGetCompressionWorkSpaceSize 2, WorkSpaceSize, 0
    NtAllocateVirtualMemory -1, WorkSpace, 0, WorkSpaceSize, 4096, 64
    RtlCompressBuffer 2, VarPtr(Data(0)), UBound(Data) + 1, VarPtr(Out(0)), (UBound(Data) * 1.13 + 4), 0, Compress, WorkSpace
    NtFreeVirtualMemory -1, WorkSpace, 0, 16384
    ReDim Preserve Out(Compress)
 
End Function
 


Public Sub HookClipboard(ByVal hwnd As Long, ByVal lSock As Long)
    If PrevProc = 0 Then
        m_SockClipboard = lSock
        SetClipboardViewer hwnd
        PrevProc = SetWindowLong(hwnd, GWL_WNDPROC, AddressOf WindowProc)
    End If
End Sub

Public Sub UnHookClipboard(ByVal hwnd As Long)
    If PrevProc Then
        SetWindowLong hwnd, GWL_WNDPROC, PrevProc
        m_SockClipboard = 0
        PrevProc = 0
    End If
End Sub


Public Function WindowProc(ByVal hwnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    On Error Resume Next
    
    WindowProc = CallWindowProc(PrevProc, hwnd, uMsg, wParam, lParam)
    
    If uMsg = WM_DRAWCLIPBOARD Then
        If Not RemoteClipboardChange Then
            If IsClipboardFormatAvailable(vbCFText) <> 0 Then
                WinSock32.SendData m_SockClipboard, "5" & Delimiter & Clipboard.GetText & END_DATA
                Debug.Print "Portapapeles"
            End If
        End If
    End If
    
End Function



Public Sub TerminateConnection(ByVal ID As Long)
    cColl.Remove (CStr(ID)) 'descarga la clase almacenada.
End Sub


Public Function CheckAccess(ByVal sPath As String, ByVal dwDesiredAccess As AccessType) As Long 'by Karcrack
    Dim lRet        As Long
 
    lRet = CreateFile(sPath, dwDesiredAccess, FILE_SHARE_READ + FILE_SHARE_WRITE, ByVal 0&, OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, 0)
    If (lRet <> INVALID_HANDLE_VALUE) Then
        Call CloseHandle(lRet)
        CheckAccess = 1
    End If
End Function

Public Function SendToRecicler(ByVal sFiles As String)

    Dim tSFO As SHFILEOPSTRUCT

    With tSFO
        .wFunc = FO_DELETE
        .fFlags = FOF_ALLOWUNDO Or FOF_SILENT Or FOF_NOCONFIRMATION
        .pFrom = sFiles & vbNullChar & vbNullChar
    End With
    
    SendToRecicler = SHFileOperation(tSFO) = 0

End Function

Public Function GetCountry() As String
    Dim sBuffer As String * 100
    
    If GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SENGCOUNTRY, sBuffer, 100) Then
        GetCountry = Left$(sBuffer, InStr(sBuffer, Chr$(0)) - 1)
    End If
End Function

Public Function GetCountryCode() As String
    Dim sBuffer As String * 100
    GetLocaleInfo LOCALE_USER_DEFAULT, LOCALE_SISO3166CTRYNAME, sBuffer, 10
    GetCountryCode = Left$(sBuffer, InStr(sBuffer, Chr$(0)) - 1)
End Function
 
Public Function GetUserName() As String
    Dim strUserName As String * 100
    If GetUserNameA(strUserName, 100) Then
        GetUserName = Left$(strUserName, InStr(strUserName, Chr$(0)) - 1)
    End If
End Function

Public Function GetComputerName() As String
    Dim strComputerName As String * 100
    If GetComputerNameA(strComputerName, 100) Then
        GetComputerName = Left$(strComputerName, InStr(strComputerName, Chr$(0)) - 1)
    End If
End Function

Public Function NativeGetVersion() As String
    Dim tOSVw(&H54)     As Long
 
    tOSVw(0) = &H54 * &H4
    Call RtlGetVersion(tOSVw(0))
 
    NativeGetVersion = Join(Array(tOSVw(4), tOSVw(1), tOSVw(2)), ".")
End Function
 
Public Function VersionToName(ByVal sVersion As String) As String
    Select Case sVersion
        Case "1.0.0":     VersionToName = "Windows 95"
        Case "1.1.0":     VersionToName = "Windows 98"
        Case "1.9.0":     VersionToName = "Windows Millenium"
        Case "2.3.0":     VersionToName = "Windows NT 3.51"
        Case "2.4.0":     VersionToName = "Windows NT 4.0"
        Case "2.5.0":     VersionToName = "Windows 2000"
        Case "2.5.1":     VersionToName = "Windows XP"
        Case "2.5.3":     VersionToName = "Windows 2003 (SERVER)"
        Case "2.6.0":     VersionToName = "Windows Vista"
        Case "2.6.1":     VersionToName = "Windows 7"
        Case Else:        VersionToName = "Unknown"
    End Select
End Function

Public Function CopyPath(ByVal sPathOrigen As String, ByVal sPathDestino As String) As Boolean

    Dim tSFO As SHFILEOPSTRUCT

    With tSFO
        .wFunc = FO_COPY
        .fFlags = FOF_SILENT Or FOF_NOCONFIRMATION
        .pFrom = sPathOrigen & vbNullChar & vbNullChar
        .pTo = sPathDestino & vbNullChar & vbNullChar
    End With
    
    CopyPath = SHFileOperation(tSFO) = 0
    
End Function

Public Function MovePath(ByVal sPathOrigen As String, ByVal sPathDestino As String) As Boolean

    Dim tSFO As SHFILEOPSTRUCT

    With tSFO
        .wFunc = FO_MOVE
        .fFlags = FOF_SILENT Or FOF_NOCONFIRMATION
        .pFrom = sPathOrigen & vbNullChar & vbNullChar
        .pTo = sPathDestino & vbNullChar & vbNullChar
    End With
    
    MovePath = SHFileOperation(tSFO) = 0
    
End Function

Public Function RenamePath(ByVal sPathOrigen As String, ByVal sNewName As String) As Boolean

    Dim tSFO As SHFILEOPSTRUCT

    With tSFO
        .wFunc = FO_RENAME
        .fFlags = FOF_SILENT Or FOF_NOCONFIRMATION
        .pFrom = sPathOrigen & vbNullChar & vbNullChar
        .pTo = sNewName & vbNullChar & vbNullChar
    End With
    
    RenamePath = SHFileOperation(tSFO) = 0
    
End Function

Public Function GetDriveBusType(ByVal sDrive As String) As STORAGE_BUS_TYPE 'by Cobein
    Dim lRet                        As Long
    Dim lDevice                     As Long
    Dim tSTORAGE_DEVICE_DESCRIPTOR  As STORAGE_DEVICE_DESCRIPTOR
    Dim tOVERLAPPED                 As OVERLAPPED
    Dim tSTORAGE_PROPERTY_QUERY     As STORAGE_PROPERTY_QUERY
    Const IOCTL_STORAGE_QUERY_PROPERTY = _
       (IOCTL_STORAGE_BASE * 2 ^ 16) Or _
       (FILE_ANY_ACCESS * 2 ^ 14) Or _
       (&H500 * 2 ^ 2) Or _
       (METHOD_BUFFERED)

    sDrive = Left(sDrive, 1) & ":"

    lDevice = CreateFile("\\.\" & sDrive, 0, _
       FILE_SHARE_READ Or FILE_SHARE_WRITE, ByVal 0&, OPEN_EXISTING, 0, 0)
    
    If Not lDevice = INVALID_HANDLE_VALUE Then
        With tSTORAGE_PROPERTY_QUERY
            .PropertyId = StorageDeviceProperty
            .QueryType = PropertyStandardQuery
        End With
    
        Call DeviceIoControl( _
           lDevice, _
           IOCTL_STORAGE_QUERY_PROPERTY, _
           tSTORAGE_PROPERTY_QUERY, _
           LenB(tSTORAGE_PROPERTY_QUERY), _
           tSTORAGE_DEVICE_DESCRIPTOR, _
           LenB(tSTORAGE_DEVICE_DESCRIPTOR), _
           lRet, tOVERLAPPED)
    
        GetDriveBusType = tSTORAGE_DEVICE_DESCRIPTOR.BusType
        Call CloseHandle(lDevice)
    End If
    
End Function

Public Function GetDriveIconIndex(ByVal nDrive As String) As Long

    Select Case GetDriveType(nDrive)
        Case DRIVE_UNKNOWN
            GetDriveIconIndex = 8
        Case DRIVE_ABSENT
            GetDriveIconIndex = 8
        Case DRIVE_REMOVABLE
            GetDriveIconIndex = IIf(GetDriveBusType(nDrive) = BusTypeUsb, 7, 6)
        Case DRIVE_FIXED
            GetDriveIconIndex = 8
        Case DRIVE_REMOTE
            GetDriveIconIndex = IIf(fGetUNCPath(nDrive) <> vbNullString, 9, 10)
        Case DRIVE_CDROM
            GetDriveIconIndex = 11
        Case DRIVE_RAMDISK
            GetDriveIconIndex = 12
    End Select

End Function

Public Function GetLabelDrive(ByVal nDrive As String) As String
    Dim sLabel As String * 255
    GetVolumeInformation nDrive, sLabel, 255, 0&, 0&, 0&, vbNullString, 0&
    GetLabelDrive = Left$(sLabel, InStr(sLabel, Chr$(0)) - 1)
End Function

Public Function fGetDrives() As Variant
    Dim lngRet As Long
    Dim strDrives As String * 255
    lngRet = GetLogicalDriveStrings(Len(strDrives), strDrives)
    fGetDrives = Split(Left(strDrives, lngRet - 1), Chr$(0))
End Function

'Esta función intenta averiguar si una unidad es un disket de 3.5 (no es 100% certero)
Public Function fGetUNCPath(ByVal nDrive As String) As String
    On Local Error Resume Next

    Dim lngReturn As Long
    Dim lpszRemoteName As String * 255
    Dim cbRemoteName As Long
    
    cbRemoteName = Len(lpszRemoteName)
    
    If Right$(nDrive, 1) = "\" Then nDrive = Left(nDrive, Len(nDrive) - 1)
    
    lngReturn = WNetGetConnection(nDrive, lpszRemoteName, cbRemoteName)

    If lngReturn = 0 Then
        fGetUNCPath = Left$(lpszRemoteName, cbRemoteName)
    End If

End Function

Public Function GetSpecialFolder(ByVal ID As Long) As String
    
    Dim lRet         As Long
    Dim IDL          As ITEMIDLIST
    Dim sPath        As String * 512
    
    lRet = SHGetSpecialFolderLocation(100, ID, IDL)
    
    If lRet = 0 Then
        Call SHGetPathFromIDList(ByVal IDL.mkid.cb, ByVal sPath$)
    
        GetSpecialFolder = Left$(sPath, InStr(sPath, Chr$(0)) - 1)
    End If
    
End Function

Public Function GetIDListFromPath(ByVal sPath As String) As Long
    Dim i As Long
    Dim lCount As Long
    
    lCount = UBound(Id_List)
    
    'para no almacenar valores repetidos y obtener un ID unico, por el momento no me es nesesario.
    
    'For i = 0 To lCount
    '    If Id_List(i) = sPath Then
    '        GetIDListFromPath = i
    '        Exit Function
    '    End If
    'Next
    
    lCount = lCount + 1
    
    ReDim Preserve Id_List(lCount)
    Id_List(lCount) = sPath
    GetIDListFromPath = lCount
    
End Function

Public Function GetPathFromIDList(ByVal IDL As Long) As String
    If IDL > 0 And IDL <= UBound(Id_List) Then GetPathFromIDList = Id_List(IDL)
End Function

Public Function GetFileSize(ByVal FileName As String) As Currency
    On Error Resume Next
    Dim ExtValue As Currency
    Dim FstValue As Long
    
    FstValue = FileLen(FileName)
    
    If FstValue < 0 Then
        GetFileSize = (2147483648# * 2) + FstValue
    Else
        GetFileSize = FstValue
    End If
End Function

Public Function GetFileExtention(ByVal sFile As String) As String
    Dim lRet As Long
    lRet = InStrRev(sFile, ".")
    If lRet Then GetFileExtention = Right(sFile, Len(sFile) - lRet + 1)
End Function

Public Sub NormalizePath(sData As String)
    sData = IIf(Right$(sData, 1) = "\", sData, sData & "\")
End Sub

Public Function GetParentPath(ByVal sPath As String) As String
    Dim lRet As Long
    
    If Right$(sPath, 1) = "\" Then sPath = Left$(sPath, Len(sPath) - 1)
    
    lRet = InStrRev(sPath, "\")
    
    If lRet Then GetParentPath = Left$(sPath, lRet)

End Function

Public Function PathIsFolder(ByVal sPath As String) As Boolean
    PathIsFolder = CBool(PathIsDirectory(sPath))
End Function

Public Function GetPathName(ByVal sPath As String) As String
    Dim lRet As Long
    lRet = InStrRev(sPath, "\")
    If lRet Then GetPathName = Right(sPath, Len(sPath) - lRet)
End Function

Public Function GetDrivePath(ByVal sPath As String)
    GetDrivePath = Left$(sPath, InStr(sPath, "\"))
End Function

Public Function GetPathInfo(ByVal sPath As String, Optional sDelimiter As String = vbCrLf) As String
   On Error Resume Next
   
   Dim objFolder As Object
   Dim objShell As Object
   Dim oItem As Object
   Dim sFolder As Variant
   Dim i As Long
   Dim sDetails As String
   Dim sColumn As String
   Dim TempPath As String
   Dim lBarCount As Long
   
   If Right$(sPath, 1) = "\" Then
        TempPath = Left$(sPath, Len(sPath) - 1)
   Else
        TempPath = sPath
   End If
   
   lBarCount = UBound(Split(TempPath, "\"))
   
   If lBarCount > 0 Then
        sPath = UCase(TempPath)
        sFolder = Left(sPath, InStrRev(sPath, "\"))
   Else
        sPath = UCase(TempPath) & "\"
        sFolder = "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}" 'MI PC
   End If
 
   Set objShell = CreateObject("Shell.Application")

   Set objFolder = objShell.NameSpace(sFolder)

   If objFolder Is Nothing Then Exit Function

   For Each oItem In objFolder.Items()
        If UCase(oItem.Path) = sPath Then
            For i = 0 To 40
                sDetails = objFolder.GetDetailsOf(oItem, i)
                sColumn = objFolder.GetDetailsOf(0, i)
                If sDetails <> vbNullString And sColumn <> vbNullString Then
                    GetPathInfo = GetPathInfo & sColumn & ": " & sDetails & sDelimiter
                End If
            Next
            Exit For
        End If
   Next

   Set objShell = Nothing
   Set objFolder = Nothing
 
End Function



