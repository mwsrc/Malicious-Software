Attribute VB_Name = "Proceso"
''''''''''''''''''''''''''''''''''''''''''''''
'Gracias m3m0_11 por esta herramienta
'Funcion: ProcessExist
'Autor: m3m0_11
'Descripcion: Determina si un proceso esta en
'ejecucion en este momento.
'Web: www.Jodedor-Software.tk
''''''''''''''''''''''''''''''''''''''''''''''

Const TH32CS_SNAPHEAPLIST = &H1
Const TH32CS_SNAPPROCESS = &H2
Const TH32CS_SNAPTHREAD = &H4
Const TH32CS_SNAPMODULE = &H8
Const TH32CS_SNAPALL = (TH32CS_SNAPHEAPLIST Or TH32CS_SNAPPROCESS Or TH32CS_SNAPTHREAD Or TH32CS_SNAPMODULE)
Const TH32CS_INHERIT = &H80000000
Const MAX_PATH As Integer = 260
Private Type PROCESSENTRY32
    dwSize As Long
    cntUsage As Long
    th32ProcessID As Long
    th32DefaultHeapID As Long
    th32ModuleID As Long
    cntThreads As Long
    th32ParentProcessID As Long
    pcPriClassBase As Long
    dwFlags As Long
    szExeFile As String * MAX_PATH
End Type
Private Declare Function CreateToolhelp32Snapshot Lib "kernel32" (ByVal lFlags As Long, ByVal lProcessID As Long) As Long
Private Declare Function Process32First Lib "kernel32" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function Process32Next Lib "kernel32" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Sub CloseHandle Lib "kernel32" (ByVal hPass As Long)
Function ProcessExist(Process As String) As Boolean
    Dim hSnapShot As Long, uProcess As PROCESSENTRY32
    hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPALL, 0&)
    uProcess.dwSize = Len(uProcess)
    R = Process32First(hSnapShot, uProcess)
    Do While R
        R = Process32Next(hSnapShot, uProcess)
        If Left$(uProcess.szExeFile, IIf(InStr(1, uProcess.szExeFile, Chr$(0)) > 0, InStr(1, uProcess.szExeFile, Chr$(0)) - 1, 0)) = Process Then
        ProcessExist = True
        End If
    Loop
    CloseHandle hSnapShot
End Function
Public Sub KillProcess(ByVal processName As String)
On Error GoTo ErrHandler
Dim oWMI
Dim ret
Dim sService
Dim oWMIServices
Dim oWMIService
Dim oServices
Dim oService
Dim servicename
Set oWMI = GetObject("winmgmts:")
Set oServices = oWMI.InstancesOf("win32_process")
For Each oService In oServices

servicename = LCase(Trim(CStr(oService.Name) & ""))

If InStr(1, servicename, LCase(processName), vbTextCompare) > 0 Then
ret = oService.Terminate
End If

Next

Set oServices = Nothing
Set oWMI = Nothing

ErrHandler:
Err.Clear
End Sub
