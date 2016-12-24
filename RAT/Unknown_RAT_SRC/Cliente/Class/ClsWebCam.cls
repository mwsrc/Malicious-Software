VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClsWebCam"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private WithEvents Timer1       As cTimer
Attribute Timer1.VB_VarHelpID = -1
Public ID_Connection            As Long
Public mQuality                 As Long
Private m_Data                  As String

Private Sub Class_Initialize()
    Set Timer1 = New cTimer
    mQuality = 60
    If CreateCaptureWindow Then
        '
    End If
End Sub

Private Sub Class_Terminate()
    Set Timer1 = Nothing
    DisconnectDriver
    DestroyCaptureWindow
    If ID_Connection Then WinSock32.WsClose ID_Connection
End Sub

Private Sub SendCapture()
    
    Dim arrBytes() As Byte
    If ID_Connection = 0 Then Exit Sub
    If hwndCap Then
        If capGetImageStream(arrBytes, mQuality) Then
            If ID_Connection Then WinSock32.SendData ID_Connection, "0" & Delimiter
            If ID_Connection Then WinSock32.SendData ID_Connection, arrBytes
            If ID_Connection Then WinSock32.SendData ID_Connection, END_DATA
        End If
        Timer1.CreateTimer 1
    End If
End Sub

Private Sub Timer1_Timer(ByVal ThisTime As Long)
    Timer1.DestroyTimer
    SendCapture
End Sub


    
'Public Sub Socket_DataArrival2(ID As Long, IP As String, Puerto As String, Data As String)
'    Select Case Data
'        Case 0
'            ConnectDriver
'            SendCapture
'        Case 1
'            TerminateConnection ID
'        Case 2
'            mQuality = 30
'        Case 3
'            mQuality = 50
'        Case 4
'            mQuality = 80
'        Case Else
'            TerminateConnection ID
'    End Select
'    Debug.Print Data
'End Sub

Public Sub Socket_DataArrival(ID As Long, IP As String, Puerto As String, Data As String)
    On Error GoTo ErrHaddle
    
    Dim lRet1       As Long
    Dim lRet2       As Long
    Dim sCommand    As String
    Dim sBuf        As String
    
    
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
                ConnectDriver
                SendCapture
            Case 1
                'TerminateConnection ID
                WinSock32.WsClose ID_Connection
                ID_Connection = 0
            Case 2
                mQuality = sBuf
        End Select
        
        Debug.Print sCommand, sBuf
        
        If Len(m_Data) Then
            If InStr(m_Data, END_DATA) Then Call Me.Socket_DataArrival(ID, IP, Puerto, vbNullString)
        End If
        
    End If
    
ErrHaddle:
End Sub

Public Sub Socket_Close(ID As Long, IP As String, Puerto As String)
    ID_Connection = 0
End Sub

Public Sub Socket_Conect(ID As Long, IP As String, Puerto As String)
    
End Sub
