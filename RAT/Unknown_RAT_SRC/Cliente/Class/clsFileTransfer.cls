VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsFileTransfer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
' ---------------------------------------------------
' Autor:            Leandro I. Ascierto
' Date:             17 de Julio de 2010
' Web:              www.leandroascierto.com.ar
' Requirements:     Windows XP or Later
' History:          06/10/2010 First
' ---------------------------------------------------
Public Enum ClassClientDataType
    enuFileSend = 1
    enuFileRecibed = 2
End Enum
    
Private FF                      As Integer
Private mPath                   As String
Private mFileSize               As Currency
Private ArrArchivo()            As Byte
Private CantidadTrozos          As Long
Private Resto                   As Long
Private Pos                     As Currency
Private cClientDataType         As ClassClientDataType

Public ID_Connection            As Long
Public bCancelarTransferencia   As Boolean

Private WithEvents Timer1       As cTimer
Attribute Timer1.VB_VarHelpID = -1

Private Sub Class_Initialize()
    Set Timer1 = New cTimer
    ID_Connection = WinSock32.WsConnect(ServerIP, ServerPuerto)
End Sub

Public Sub LetCommand(sCommand() As String)
On Error GoTo DestroyConnection
    Select Case sCommand(0)
        Case 1
            cClientDataType = enuFileSend
            mPath = GetPathFromIDList(sCommand(1))
            mFileSize = GetFileSize(mPath)
            
            WinSock32.SendData ID_Connection, 2 & Delimiter & "1" & Delimiter & mPath & Delimiter & mFileSize & Delimiter & sCommand(2)
        Case 2
            cClientDataType = enuFileRecibed
            mPath = GetPathFromIDList(sCommand(1))
            NormalizePath mPath
            mPath = mPath & sCommand(2)
            mFileSize = sCommand(3)
            FF = FreeFile
            If Dir(mPath) <> vbNullString Then Kill mPath
            Open mPath For Binary As #FF

            WinSock32.SendData ID_Connection, 2 & Delimiter & "2" & Delimiter & sCommand(4)
            
            If mFileSize = 0 Then GoTo DestroyConnection

    End Select
    
    Exit Sub
DestroyConnection:

    If ID_Connection Then WinSock32.WsClose ID_Connection
    TerminateConnection ID_Connection
End Sub

Public Sub Socket_Conect(ID As Long, IP As String, Puerto As String)
'
End Sub

Public Sub Socket_DataArrival(ID As Long, IP As String, Puerto As String, Data As String)
    If cClientDataType = enuFileSend Then
        If Data = "OK" Then
            If mFileSize = 0 Then
                If ID_Connection Then WinSock32.WsClose ID_Connection
                TerminateConnection ID_Connection
            Else
                SendFile mPath
            End If
        End If
    Else
        Put #FF, , Data
        Pos = Pos + Len(Data)
        If Pos >= mFileSize Then
            If ID_Connection Then WinSock32.WsClose ID_Connection
            TerminateConnection ID_Connection
        End If
    End If
End Sub

Public Sub Socket_Close(ID As Long, IP As String, Puerto As String)
    bCancelarTransferencia = True
End Sub

Private Sub SendFile(ByVal sPath As String)
On Error GoTo DestroyConnection
    ReDim ArrArchivo(1 To 1024)
    CantidadTrozos = mFileSize \ 1024
    Resto = mFileSize - (CantidadTrozos * 1024)
    FF = FreeFile
    Open sPath For Binary As #FF
    Pos = 1
    Timer1.CreateTimer 1
    Exit Sub
DestroyConnection:
    If ID_Connection Then WinSock32.WsClose ID_Connection
    TerminateConnection ID_Connection
End Sub

Private Sub SendPart()

    If bCancelarTransferencia Then Exit Sub

    If Pos <= CantidadTrozos Then
        
        Get #FF, , ArrArchivo
        If WinSock32.SendData(ID_Connection, ArrArchivo) Then
            Pos = Pos + 1
            Timer1.CreateTimer 1
        Else
            GoTo DestroyConnection
        End If
        
        
    Else
    
        If Resto > 0 Then
            ReDim ArrArchivo(1 To Resto)
            Get #FF, , ArrArchivo
            If WinSock32.SendData(ID_Connection, ArrArchivo) Then
                GoTo DestroyConnection
            Else
                GoTo DestroyConnection
            End If
        Else
            GoTo DestroyConnection
        End If
    End If
    
Exit Sub
DestroyConnection:
    TerminateConnection ID_Connection
    If ID_Connection Then WinSock32.WsClose ID_Connection
End Sub

Private Sub Timer1_Timer(ByVal ThisTime As Long)
    Timer1.DestroyTimer
    SendPart
End Sub

Private Sub Class_Terminate()
    Set Timer1 = Nothing
    If FF Then Close #FF
End Sub


