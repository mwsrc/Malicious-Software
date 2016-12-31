Attribute VB_Name = "mdlService"
Option Explicit

Private Const SC_MANAGER_ALL_ACCESS = (&HF0000 Or &H1 Or &H2 Or &H4 Or &H8 Or &H10 Or &H20)
Private Const SERVICES_ACTIVE_DATABASE = "ServicesActive"
Private Const SERVICE_ALL_ACCESS = (&HF0000 Or &H1 Or &H2 Or &H4 Or &H8 Or &H10 Or &H20 Or &H40 Or &H80 Or &H100)

Private Type SERVICE_STATUS
    dwServiceType As Long
    dwCurrentState As Long
    dwControlsAccepted As Long
    dwWin32ExitCode As Long
    dwServiceSpecificExitCode As Long
    dwCheckPoint As Long
    dwWaitHint As Long
End Type

Private Type ENUM_SERVICE_STATUS
    lpServiceName As Long
    lpDisplayName As Long
    ServiceStatus As SERVICE_STATUS
End Type

Private Type QUERY_SERVICE_CONFIG
    dwServiceType As Long
    dwStartType As Long
    dwErrorControl As Long
    lpBinaryPathName As Long
    lpLoadOrderGroup As Long
    dwTagId As Long
    lpDependencies As Long
    lpServiceStartName As Long
    lpDisplayName As Long
End Type

Private Type ListOfServices
    bInit As Boolean
    lCount As Long
    lLastErr As Long
    sErrMessage As String
    List() As ENUM_SERVICE_STATUS
End Type

Private Declare Function EnumServicesStatusA Lib "advapi32" (ByVal hSCManager As Long, ByVal dwServiceType As Long, ByVal dwServiceState As Long, lpServices As Any, ByVal cbBufSize As Long, pcbBytesNeeded As Long, lpServicesReturned As Long, lpResumeHandle As Long) As Long
Private Declare Function OpenSCManagerA Lib "advapi32" (ByVal lpMachineName As String, ByVal lpDatabaseName As String, ByVal dwDesiredAccess As Long) As Long
Private Declare Function OpenServiceA Lib "advapi32" (ByVal hSCManager As Long, ByVal lpServiceName As String, ByVal dwDesiredAccess As Long) As Long
Private Declare Function StartServiceA Lib "advapi32" (ByVal hService As Long, ByVal dwNumServiceArgs As Long, ByVal lpServiceArgVectors As Long) As Long
Private Declare Function CloseServiceHandle Lib "advapi32" (ByVal hSCObject As Long) As Long
Private Declare Function QueryServiceConfigA Lib "advapi32" (ByVal hService As Long, lpServiceConfig As Byte, ByVal cbBufSize As Long, pcbBytesNeeded As Long) As Long
Private Declare Function QueryServiceStatus Lib "advapi32" (ByVal hService As Long, lpServiceStatus As SERVICE_STATUS) As Long
Private Declare Function ControlService Lib "advapi32" (ByVal hService As Long, ByVal dwControl As Long, lpServiceStatus As SERVICE_STATUS) As Long
'Private Declare Function EnumDependentServicesA Lib "advapi32" (ByVal hService As Long, ByVal dwServiceState As Long, lpServices As Any, ByVal cbBufSize As Long, pcbBytesNeeded As Long, lpServicesReturned As Long) As Long

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pTo As Any, uFrom As Any, ByVal lSize As Long)
Private Declare Function lstrlenW Lib "kernel32" (ByVal lpString As Long) As Long

Dim ServiceConfigInfo As QUERY_SERVICE_CONFIG

Public Function EnumerateServices() As String
    On Error Resume Next
    Dim lSCMHandle As Long
    Dim ServiceStatusBuffer() As ENUM_SERVICE_STATUS
    Dim lBytesNeeded As Long
    Dim lServicesReturned As Long
    Dim lServiceStatusInfoBuffer As Long
    Dim lResumeHandle As Long
    Dim lStructsNeeded As Long
    Dim ServiceList As ListOfServices
    Dim ServiceConfigInfo As QUERY_SERVICE_CONFIG
    Dim lResult As Long
    
    lSCMHandle = OpenSCManagerA(vbNullString, vbNullString, &H4)
    lResumeHandle = 0
    EnumServicesStatusA lSCMHandle, &H10 + &H20, &H1 Or &H2, ByVal &H0, &H0, lBytesNeeded, lServicesReturned, lResumeHandle
    lStructsNeeded = lBytesNeeded / Len(ServiceStatusBuffer(0)) + 1
    ReDim ServiceStatusBuffer(lStructsNeeded - 1)
    lServiceStatusInfoBuffer = lStructsNeeded * Len(ServiceStatusBuffer(0))
    lResumeHandle = 0
    EnumServicesStatusA lSCMHandle, &H10 + &H20, &H1 Or &H2, ServiceStatusBuffer(0), lServiceStatusInfoBuffer, lBytesNeeded, lServicesReturned, lResumeHandle
    Dim i As Long
    For i = 0 To lServicesReturned - 1
        ServiceConfigInfo = GetServiceConfig(LPSTRtoSTRING(ServiceStatusBuffer(i).lpServiceName))
        EnumerateServices = EnumerateServices & LPSTRtoSTRING(ServiceStatusBuffer(i).lpServiceName) & Chr(0) & LPSTRtoSTRING(ServiceStatusBuffer(i).lpDisplayName) & Chr(0) & ServiceStatusBuffer(i).ServiceStatus.dwCurrentState & Chr(0) & ServiceConfigInfo.dwStartType & Chr(0) & LPSTRtoSTRING(ServiceConfigInfo.lpBinaryPathName) & Chr(255)
    Next
    CloseServiceHandle (lSCMHandle)
End Function

Private Function GetServiceConfig(sServiceName As String) As QUERY_SERVICE_CONFIG

    Dim abServiceConfigInfo() As Byte
    Dim ServiceConfigInfo As QUERY_SERVICE_CONFIG
    Dim lBytesNeeded As Long
    Dim hSManager As Long
    Dim hService As Long
    
    hSManager = OpenSCManagerA(vbNullString, SERVICES_ACTIVE_DATABASE, SC_MANAGER_ALL_ACCESS)
    If hSManager <> 0 Then
        hService = OpenServiceA(hSManager, sServiceName, &H1)
        If hService <> 0 Then
            ReDim abServiceConfigInfo(0) As Byte
            
            If QueryServiceConfigA(hService, abServiceConfigInfo(0), 0&, lBytesNeeded) = 0 And lBytesNeeded = 0 Then
                CloseServiceHandle hService
                CloseServiceHandle hSManager
                Exit Function
            Else
                If Not Err.LastDllError = 122 Then
                    CloseServiceHandle hService
                    CloseServiceHandle hSManager
                    Exit Function
                End If
            End If
            
            ReDim abServiceConfigInfo(lBytesNeeded) As Byte
            
            If QueryServiceConfigA(hService, abServiceConfigInfo(0), lBytesNeeded, lBytesNeeded) = 0 Then
                CloseServiceHandle hService
                CloseServiceHandle hSManager
                Exit Function
            End If
            
            CopyMemory ServiceConfigInfo, abServiceConfigInfo(0), Len(ServiceConfigInfo)
            GetServiceConfig = ServiceConfigInfo
            CloseServiceHandle hService
        End If
        CloseServiceHandle hSManager
    End If

End Function

Public Function ServiceControl(ServiceName As String, lOpration As Long) As Long
    Dim ServiceStatus As SERVICE_STATUS
    Dim hSManager As Long
    Dim hService As Long

    DoEvents
    hSManager = OpenSCManagerA(vbNullString, SERVICES_ACTIVE_DATABASE, SC_MANAGER_ALL_ACCESS)
    If hSManager <> 0 Then
        hService = OpenServiceA(hSManager, ServiceName, SERVICE_ALL_ACCESS)
        If hService <> 0 Then
            If lOpration = 0 Then
                ServiceControl = StartServiceA(hService, 0, 0)
            Else
                ServiceControl = ControlService(hService, lOpration, ServiceStatus)
            End If
            CloseServiceHandle hService
        End If
        CloseServiceHandle hSManager
    End If

End Function

Private Function LPSTRtoSTRING(ByVal lStringPointer As Long) As String
    Dim lLength As Long
    lLength = lstrlenW(ByVal lStringPointer) * 2
    LPSTRtoSTRING = String(lLength, 0)
    CopyMemory ByVal StrPtr(LPSTRtoSTRING), ByVal lStringPointer, lLength
    LPSTRtoSTRING = LPSTRToVBString(StrConv(LPSTRtoSTRING, vbUnicode))
End Function
