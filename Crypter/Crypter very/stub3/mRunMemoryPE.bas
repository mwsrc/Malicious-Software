Attribute VB_Name = "mRunMemoryPE"
'---------------------------------------------------------------------------------------
' Module      : mRunMemoryPE
' DateTime    : 01/06/2008 03:34
' Author      : Cobein
' Mail        : cobein27@hotmail.com
' WebPage     : http://cobein27.googlepages.com/vb6
' Purpose     : Rum a PE from memory
' Usage       : At your own risk
' Requirements: None
' Distribution: You can freely use this code in your own
'               applications, but you may not reproduce
'               or publish this code on any web site,
'               online service, or distribute as source
'               on any media without express permission.
'
' Reference   : Anonymous, http://www.freevbcode.com/ShowCode.asp?ID=8385
'
' History     : 01/06/2008 First Cut....................................................
'---------------------------------------------------------------------------------------
Option Explicit

Private Const IMAGE_DOS_SIGNATURE               As Long = &H5A4D
Private Const IMAGE_NT_SIGNATURE                As Long = &H4550
Private Const IMAGE_SIZEOF_SHORT_NAME           As Long = &H8
Private Const IMAGE_NUMBEROF_DIRECTORY_ENTRIES  As Long = &H10

Private Const CREATE_SUSPENDED                  As Long = &H4

Private Const SIZE_OF_80387_REGISTERS           As Long = 80

Private Const CONTEXT_X86                       As Long = &H10000
Private Const CONTEXT86_CONTROL                 As Long = (CONTEXT_X86 Or &H1)
Private Const CONTEXT86_INTEGER                 As Long = (CONTEXT_X86 Or &H2)
Private Const CONTEXT86_SEGMENTS                As Long = (CONTEXT_X86 Or &H4)
Private Const CONTEXT86_FLOATING_POINT          As Long = (CONTEXT_X86 Or &H8)
Private Const CONTEXT86_DEBUG_REGISTERS         As Long = (CONTEXT_X86 Or &H10)
Private Const CONTEXT86_FULL                    As Long = (CONTEXT86_CONTROL Or CONTEXT86_INTEGER Or CONTEXT86_SEGMENTS)

Public Const MEM_COMMIT                         As Long = &H1000&
Public Const MEM_RESERVE                        As Long = &H2000&
Public Const PAGE_NOCACHE                       As Long = &H200
Public Const PAGE_EXECUTE_READWRITE             As Long = &H40
Public Const PAGE_EXECUTE_WRITECOPY             As Long = &H80
Public Const PAGE_EXECUTE_READ                  As Long = &H20
Public Const PAGE_EXECUTE                       As Long = &H10
Public Const PAGE_READONLY                      As Long = &H2
Public Const PAGE_WRITECOPY                     As Long = &H8
Public Const PAGE_NOACCESS                      As Long = &H1
Public Const PAGE_READWRITE                     As Long = &H4

Private Const OFFSET_4                          As Double = 4294967296#

Private Const MAX_PATH                          As Long = 260

Private Type IMAGE_DOS_HEADER
    e_magic                     As Integer
    e_cblp                      As Integer
    e_cp                        As Integer
    e_crlc                      As Integer
    e_cparhdr                   As Integer
    e_minalloc                  As Integer
    e_maxalloc                  As Integer
    e_ss                        As Integer
    e_sp                        As Integer
    e_csum                      As Integer
    e_ip                        As Integer
    e_cs                        As Integer
    e_lfarlc                    As Integer
    e_ovno                      As Integer
    e_res(0 To 3)               As Integer
    e_oemid                     As Integer
    e_oeminfo                   As Integer
    e_res2(0 To 9)              As Integer
    e_lfanew                    As Long
End Type

Private Type IMAGE_DATA_DIRECTORY
    VirtualAddress              As Long
    Size                        As Long
End Type

Private Type IMAGE_OPTIONAL_HEADER
    Magic                       As Integer
    MajorLinkerVersion          As Byte
    MinorLinkerVersion          As Byte
    SizeOfCode                  As Long
    SizeOfInitializedData       As Long
    SizeOfUnitializedData       As Long
    AddressOfEntryPoint         As Long
    BaseOfCode                  As Long
    BaseOfData                  As Long
    lImgBase                    As Long
    SectionAlignment            As Long
    FileAlignment               As Long
    MajorOperatingSystemVersion As Integer
    MinorOperatingSystemVersion As Integer
    MajorImageVersion           As Integer
    MinorImageVersion           As Integer
    MajorSubsystemVersion       As Integer
    MinorSubsystemVersion       As Integer
    W32VersionValue             As Long
    SizeOfImage                 As Long
    SizeOfHeaders               As Long
    CheckSum                    As Long
    SubSystem                   As Integer
    DllCharacteristics          As Integer
    SizeOfStackReserve          As Long
    SizeOfStackCommit           As Long
    SizeOfHeapReserve           As Long
    SizeOfHeapCommit            As Long
    LoaderFlags                 As Long
    NumberOfRvaAndSizes         As Long
    DataDirectory(0 To IMAGE_NUMBEROF_DIRECTORY_ENTRIES - 1) As IMAGE_DATA_DIRECTORY
End Type

Private Type IMAGE_FILE_HEADER
    Machine                     As Integer
    NumberOfSections            As Integer
    TimeDateStamp               As Long
    PointerToSymbolTable        As Long
    NumberOfSymbols             As Long
    SizeOfOptionalHeader        As Integer
    characteristics             As Integer
End Type

Private Type IMAGE_NT_HEADERS
    Signature                   As Long
    FileHeader                  As IMAGE_FILE_HEADER
    OptionalHeader              As IMAGE_OPTIONAL_HEADER
End Type

Private Type IMAGE_SECTION_HEADER
   SecName                      As String * IMAGE_SIZEOF_SHORT_NAME
   VirtualSize                  As Long
   VirtualAddress               As Long
   SizeOfRawData                As Long
   PointerToRawData             As Long
   PointerToRelocations         As Long
   PointerToLinenumbers         As Long
   NumberOfRelocations          As Integer
   NumberOfLinenumbers          As Integer
   characteristics              As Long
End Type

Private Type PROCESS_INFORMATION
   hProcess                     As Long
   hThread                      As Long
   dwProcessId                  As Long
   dwThreadId                   As Long
End Type

Private Type STARTUPINFO
   cb                           As Long
   lpReserved                   As String
   lpDesktop                    As String
   lpTitle                      As String
   dwX                          As Long
   dwY                          As Long
   dwXSize                      As Long
   dwYSize                      As Long
   dwXCountChars                As Long
   dwYCountChars                As Long
   dwFillAttribute              As Long
   dwFlags                      As Long
   wShowWindow                  As Integer
   cbReserved2                  As Integer
   lpReserved2                  As Long
   hStdInput                    As Long
   hStdOutput                   As Long
   hStdError                    As Long
End Type

Private Type FLOATING_SAVE_AREA
     ControlWord                As Long
     StatusWord                 As Long
     TagWord                    As Long
     ErrorOffset                As Long
     ErrorSelector              As Long
     DataOffset                 As Long
     DataSelector               As Long
     RegisterArea(1 To SIZE_OF_80387_REGISTERS) As Byte
     Cr0NpxState                As Long
End Type

Private Type CONTEXT86
    ContextFlags                As Long
    Dr0                         As Long
    Dr1                         As Long
    Dr2                         As Long
    Dr3                         As Long
    Dr6                         As Long
    Dr7                         As Long
    FloatSave                   As FLOATING_SAVE_AREA
    SegGs                       As Long
    SegFs                       As Long
    SegEs                       As Long
    SegDs                       As Long
    Edi                         As Long
    Esi                         As Long
    Ebx                         As Long
    Edx                         As Long
    Ecx                         As Long
    Eax                         As Long
    Ebp                         As Long
    Eip                         As Long
    SegCs                       As Long
    EFlags                      As Long
    Esp                         As Long
    SegSs                       As Long
End Type

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, Src As Any, ByVal L As Long)
Private Declare Function GetThreadContext Lib "kernel32" (ByVal hThread As Long, lpContext As CONTEXT86) As Long
Private Declare Function SetThreadContext Lib "kernel32" (ByVal hThread As Long, lpContext As CONTEXT86) As Long
Private Declare Function SuspendThread Lib "kernel32" (ByVal hThread As Long) As Long
Private Declare Function ResumeThread Lib "kernel32" (ByVal hThread As Long) As Long
Private Declare Function CreateProcess Lib "kernel32" Alias "CreateProcessA" (ByVal lpAppName As String, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
Private Declare Function ZwUnmapViewOfSection Lib "ntdll.dll" (ByVal hProcess As Long, ByVal BaseAddress As Long) As Long
Private Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function ReadProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function VirtualAllocEx Lib "kernel32" (ByVal hProcess As Long, ByVal lpAddress As Long, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As Long
Private Declare Function VirtualProtectEx Lib "kernel32" (ByVal hProcess As Long, lpAddress As Any, ByVal dwSize As Long, ByVal flNewProtect As Long, lpflOldProtect As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Long, ByVal lpFileName As String, ByVal nSize As Long) As Long
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As String) As Long
Private Declare Function GetModuleHandle Lib "kernel32.dll" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function PathFileExists Lib "shlwapi.dll" Alias "PathFileExistsA" (ByVal pszPath As String) As Long

'---------------------------------------------------------------------------------------
' Procedure : RunPE
' Params    : bvPEData, byte array containig a PE file
'             sHost, optional parameter, indicates the host application to be
'             used to load our PE, if this parameter is null it will use the console
'             while you are in the IDE and the application itself when compiled
'             Returns, True on success
'---------------------------------------------------------------------------------------
Public Function RunPE( _
       ByRef bvPEData() As Byte, _
       Optional ByVal sHost As String) As Boolean
    
    Dim tIMAGE_DOS_HEADER       As IMAGE_DOS_HEADER
    Dim tIMAGE_NT_HEADERS       As IMAGE_NT_HEADERS
    Dim tIMAGE_SECTION_HEADER   As IMAGE_SECTION_HEADER
    Dim tPROCESS_INFORMATION    As PROCESS_INFORMATION
    Dim tSTARTUPINFO            As STARTUPINFO
    Dim tCONTEXT86              As CONTEXT86
    Dim lImgBase                As Long
    Dim lRet                    As Long
    Dim i                       As Long
    Dim lAddress                As Long
    Dim lOffset                 As Long
    
    If sHost = vbNullString Then
        If GetModuleHandle("vba6") Then
            sHost = Environ$("COMSPEC")
            If sHost = vbNullString Then
                Debug.Print "No host": Exit Function
            End If
        Else
            sHost = Space(MAX_PATH)
            Call GetModuleFileName(App.hInstance, sHost, MAX_PATH)
            sHost = Left$(sHost, lstrlen(sHost))
        End If
    Else
        If PathFileExists(sHost) = 0 Then
            Debug.Print "No host": Exit Function
        End If
    End If
    
    Call CopyMemory(tIMAGE_DOS_HEADER, bvPEData(0), Len(tIMAGE_DOS_HEADER))
    
    If Not tIMAGE_DOS_HEADER.e_magic = IMAGE_DOS_SIGNATURE Then
        Debug.Print "Invalid Signature": Exit Function
    End If

    Call CopyMemory(tIMAGE_NT_HEADERS, _
       bvPEData(tIMAGE_DOS_HEADER.e_lfanew), Len(tIMAGE_NT_HEADERS))
    
    If Not tIMAGE_NT_HEADERS.Signature = IMAGE_NT_SIGNATURE Then
        Debug.Print "Invalid Signature": Exit Function
    End If
    
    tSTARTUPINFO.cb = Len(tSTARTUPINFO)
    If CreateProcess(vbNullString, sHost, 0, 0, False, _
       CREATE_SUSPENDED, 0, 0, tSTARTUPINFO, _
       tPROCESS_INFORMATION) = 0 Then
        Debug.Print "Unable to start process": Exit Function
    End If
    
    tCONTEXT86.ContextFlags = CONTEXT86_INTEGER
    
    If GetThreadContext(tPROCESS_INFORMATION.hThread, tCONTEXT86) = 0 Then
        GoTo ClearProcess
    End If
    
    Call ReadProcessMemory(tPROCESS_INFORMATION.hProcess, _
       ByVal tCONTEXT86.Ebx + &H8, lAddress, &H4, 0)
    If lAddress = 0 Then
        GoTo ClearProcess
    End If
    
    If ZwUnmapViewOfSection(tPROCESS_INFORMATION.hProcess, lAddress) Then
        GoTo ClearProcess
    End If
    
    lImgBase = VirtualAllocEx(tPROCESS_INFORMATION.hProcess, _
       ByVal tIMAGE_NT_HEADERS.OptionalHeader.lImgBase, _
       tIMAGE_NT_HEADERS.OptionalHeader.SizeOfImage, _
       MEM_RESERVE Or MEM_COMMIT, PAGE_READWRITE)
       
    If lImgBase = 0 Then
        GoTo ClearProcess
    End If
    
    Call WriteProcessMemory(tPROCESS_INFORMATION.hProcess, _
       ByVal lImgBase, bvPEData(0), _
       tIMAGE_NT_HEADERS.OptionalHeader.SizeOfHeaders, lRet)
    
    lOffset = tIMAGE_DOS_HEADER.e_lfanew + Len(tIMAGE_NT_HEADERS)
        
    For i = 0 To tIMAGE_NT_HEADERS.FileHeader.NumberOfSections - 1
    
        Call CopyMemory(tIMAGE_SECTION_HEADER, _
           bvPEData(lOffset + i * Len(tIMAGE_SECTION_HEADER)), _
           Len(tIMAGE_SECTION_HEADER))
        
        Call WriteProcessMemory(tPROCESS_INFORMATION.hProcess, _
           ByVal lImgBase + tIMAGE_SECTION_HEADER.VirtualAddress, _
           bvPEData(tIMAGE_SECTION_HEADER.PointerToRawData), _
           tIMAGE_SECTION_HEADER.SizeOfRawData, lRet)
        
        Call VirtualProtectEx(tPROCESS_INFORMATION.hProcess, _
           ByVal lImgBase + tIMAGE_SECTION_HEADER.VirtualAddress, _
           tIMAGE_SECTION_HEADER.VirtualSize, _
           Protect(tIMAGE_SECTION_HEADER.characteristics), lAddress)
           
    Next i
    
    Call WriteProcessMemory(tPROCESS_INFORMATION.hProcess, _
       ByVal tCONTEXT86.Ebx + 8, lImgBase, 4, lRet)
    
    tCONTEXT86.Eax = lImgBase + _
       tIMAGE_NT_HEADERS.OptionalHeader.AddressOfEntryPoint
    
    Call SetThreadContext(tPROCESS_INFORMATION.hThread, tCONTEXT86)
    Call ResumeThread(tPROCESS_INFORMATION.hThread)

    RunPE = True
    
ClearProcess:
    Call CloseHandle(tPROCESS_INFORMATION.hThread)
    Call CloseHandle(tPROCESS_INFORMATION.hProcess)
End Function

Private Function Protect(ByVal lCharacteristics As Long) As Long
    Dim vMapping    As Variant
    Dim dValue      As Double
   
    vMapping = Array( _
       PAGE_NOACCESS, _
       PAGE_EXECUTE, _
       PAGE_READONLY, _
       PAGE_EXECUTE_READ, _
       PAGE_READWRITE, _
       PAGE_EXECUTE_READWRITE, _
       PAGE_READWRITE, _
       PAGE_EXECUTE_READWRITE)
   
    dValue = IIf(lCharacteristics < 0, lCharacteristics + OFFSET_4, lCharacteristics)
    lCharacteristics = dValue / (2 ^ 29)
   
    Protect = vMapping(lCharacteristics)
End Function



