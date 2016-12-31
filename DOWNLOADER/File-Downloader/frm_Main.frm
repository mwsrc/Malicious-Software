VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frm_Main 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "File-Downloader by cIntX"
   ClientHeight    =   3480
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5535
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3480
   ScaleWidth      =   5535
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CMD 
      Left            =   4560
      Top             =   960
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock Socket 
      Left            =   5040
      Top             =   960
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Frame Frame2 
      Caption         =   "Download File"
      Height          =   855
      Left            =   120
      TabIndex        =   10
      Top             =   120
      Width           =   5295
      Begin VB.CommandButton cmd_Download 
         Caption         =   "Download"
         Default         =   -1  'True
         Height          =   255
         Left            =   4200
         TabIndex        =   2
         Top             =   360
         Width           =   975
      End
      Begin VB.TextBox txt_Url 
         Height          =   285
         Left            =   600
         TabIndex        =   1
         Text            =   "http://www.rarlab.com/rar/wrar370.exe"
         Top             =   360
         Width           =   3495
      End
      Begin VB.Label Label4 
         Caption         =   "Url:"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   360
         Width           =   975
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   7
      Top             =   3225
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   450
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   17637
            MinWidth        =   17637
         EndProperty
      EndProperty
   End
   Begin VB.Frame Frame1 
      Caption         =   "Transfer Status"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2175
      Left            =   120
      TabIndex        =   0
      Top             =   1000
      Width           =   5295
      Begin VB.CommandButton cmd_Abort 
         Caption         =   "Cancel"
         Height          =   255
         Left            =   3960
         TabIndex        =   3
         Top             =   1800
         Width           =   1215
      End
      Begin MSComctlLib.ProgressBar PB 
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   1800
         Width           =   3015
         _ExtentX        =   5318
         _ExtentY        =   450
         _Version        =   393216
         Appearance      =   1
      End
      Begin VB.Label lbl_File 
         Height          =   255
         Left            =   1800
         TabIndex        =   16
         Top             =   360
         Width           =   3375
      End
      Begin VB.Label lbl_Loaded 
         Caption         =   "0 B / 0 B"
         Height          =   255
         Left            =   1800
         TabIndex        =   15
         Top             =   1440
         Width           =   3375
      End
      Begin VB.Label lbl_Remain 
         Caption         =   "00:00:00"
         Height          =   255
         Left            =   1800
         TabIndex        =   14
         Top             =   1080
         Width           =   3375
      End
      Begin VB.Label lbl_Speed 
         Caption         =   "0 B/s"
         Height          =   255
         Left            =   1800
         TabIndex        =   13
         Top             =   720
         Width           =   3375
      End
      Begin VB.Label lbl_CaptionRemain 
         Caption         =   "Remaining:"
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   1080
         Width           =   1695
      End
      Begin VB.Label lbl_Done 
         Alignment       =   2  'Center
         Caption         =   "0%"
         Height          =   255
         Left            =   3240
         TabIndex        =   9
         Top             =   1800
         Width           =   495
      End
      Begin VB.Label lbl_CaptionLoaded 
         Caption         =   "Downloaded:"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   1440
         Width           =   1695
      End
      Begin VB.Label lbl_CaptionRate 
         Caption         =   "Speed:"
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   720
         Width           =   1815
      End
      Begin VB.Label lbl_CaptionFile 
         Caption         =   "File:"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   360
         Width           =   1695
      End
   End
End
Attribute VB_Name = "frm_Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Type tDownload
    strFile As String
    strHost As String
    strPort As String
    strRequest As String
    lngLength As Long
    lngRec As Long
    lngStart As Long
    lngStatusTime As Long
    F As Integer
End Type

Dim Download As tDownload

Private Sub cmd_Abort_Click()
    On Error Resume Next
    Socket.Close
    StatusBar1.Panels(1).Text = "Status: Canceled"
    Close #Download.F
    Kill Download.strFile
End Sub

Private Sub cmd_Download_Click()
    Dim strFile As String
    Dim I As Integer

    On Error Resume Next
    
    strFile = GetFilename(txt_Url)
    CMD.Filter = "Alle Dateien (*.*)|*.*"
    CMD.FileName = strFile
    CMD.Flags = &H2
    CMD.ShowSave
    If InStr(CMD.FileName, "\") Then
        If FileExists(CMD.FileName) = True Then
            Do While FileExists(CMD.FileName) = True
                Kill CMD.FileName
                DoEvents
                I = I + 1
                If I = 5 Then
                    MsgBox "Error: Unable to overwrite the File", vbOKOnly + vbExclamation, "Error"
                    Exit Sub
                End If
            Loop
        End If

        Download.strFile = CMD.FileName
        Download.F = FreeFile
        Open Download.strFile For Binary As #Download.F
        
        'Start Download
        ParseUrl txt_Url, Download.strHost, Download.strPort, Download.strRequest
        If Not Val(Download.strPort) = 0 Then
            'Url is valid download
            Download.lngRec = 0
            Socket.Close
            Socket.Connect Download.strHost, Download.strPort
            lbl_File.Caption = strFile
        Else
            MsgBox "Error: The entered URL is not valid", vbOKOnly + vbExclamation, "Error"
        End If
    End If
End Sub

Private Sub Socket_Close()
    StatusBar1.Panels(1).Text = "Status: Download beendet"
    FinishStatus
    Close #Download.F
    Download.F = 0
    Socket.Close
End Sub

Private Sub Socket_Connect()
    Dim strHeader As String
    
    strHeader = "GET " & Download.strRequest & " HTTP/1.0" & vbCrLf & _
                "Host: " & Download.strHost & vbCrLf & _
                "Connection: close" & vbCrLf & _
                "Accept: */*" & vbCrLf & _
                "Accept-Encoding: binary" & vbCrLf & vbCrLf
                
    Download.lngStart = GetTickCount 'Download started at this time
    StatusBar1.Panels(1).Text = "Status: Connected"
    
    If Socket.State = sckConnected Then
        Socket.SendData strHeader
    End If
End Sub

Private Sub Socket_DataArrival(ByVal bytesTotal As Long)
    Dim strData As String
    
    If Not bytesTotal = 0 Then 'Length is not 0
        Socket.GetData strData, vbString, bytesTotal
        
        'Check if a filehandle exists
        If Download.F = 0 Then
            Socket.Close
            Exit Sub
        End If
        
        If Left(strData, 4) = "HTTP" Then
            'HTTP Header in Packet
            ProcessHeader strData
        Else
            'File-Content
            ProcessContent strData
        End If
    End If
End Sub

Sub ProcessHeader(ByVal strData As String)
    Dim strStatus() As String
    Dim strHeader As String
    Dim strSub As String
    Dim strLocation As String
    Dim I As Integer
    
    I = InStr(strData, vbCrLf & vbCrLf)
    If Not I = 0 Then
        'Trim Header from Data
        strHeader = Left(strData, I - 1)
        strData = Mid(strData, I + 4)
                    
        'HTTP Status
        strSub = Split(strHeader, vbCrLf)(0)
        strStatus = Split(strSub, " ")   'HTTP/1.0 200 OK
                                         'strStatus(1) = 200
                                            
        If strStatus(1) = "200" Then   '200 = OK/Found
            'Collect Informations
            I = InStr(1, strHeader, "Content-Length: ", vbTextCompare) 'Filesize
            If Not I = 0 Then
                strSub = Mid(strHeader, I + Len("Content-Length: "))
                I = InStr(strSub, vbCrLf)
                If Not I = 0 Then
                    Download.lngLength = Val(Left(strSub, I - 1))
                Else
                    Download.lngLength = Val(strSub)
                End If
            Else
                Download.lngLength = -1
                'Unknown size
            End If
            
            'Header had content attached
            If Len(strData) <> 0 Then
                'Size was not 0
                Put #Download.F, , strData 'Save
                Download.lngRec = Len(strData)
            End If
        ElseIf strStatus(1) = "302" Then    'Redirection
            'Location: http://new.url.com
            I = InStr(1, strHeader, "Location: ", vbTextCompare)
            If Not I = 0 Then
                StatusBar1.Panels(1).Text = "Status: Redirection"
                strSub = Mid(strHeader, I + Len("Location: "))
                I = InStr(strSub, vbCrLf)
                If Not I = 0 Then
                    strLocation = Left(strSub, I - 1)
                Else
                    strLocation = strSub
                End If
                ParseUrl strLocation, Download.strHost, Download.strPort, Download.strRequest
                If Not Val(Download.strPort) = 0 Then
                    PB.Value = 100
                    Socket.Close
                    Socket.Connect Download.strHost, Download.strPort
                Else
                    PB.Value = 100
                    MsgBox "Error: The new Location URL is not valid.", vbOKOnly + vbExclamation, "Error"
                End If
            End If
        ElseIf strStatus(1) = "404" Then
            PB.Value = 100
            StatusBar1.Panels(1).Text = "Error: File not found"
            Close #Download.F
            Download.F = 0
            Socket.Close
        Else
            'Fehler
            Debug.Print strHeader
            Socket.Close
            StatusBar1.Panels(1).Text = "Error: Unknown Status (" & strStatus(1) & " " & strStatus(2) & ")"
        End If
    End If
End Sub

Sub ProcessContent(ByVal strData As String)
    Dim lngPos As Long
    
    lngPos = (LOF(Download.F) + 1) 'File-Pos
    If lngPos = 0 Then
        Put #Download.F, , strData
    Else
        Put #Download.F, lngPos, strData
    End If
    Download.lngRec = Download.lngRec + Len(strData)
    
    ProcessStatus
End Sub

Sub ProcessStatus()
    Dim lngTimed As Long
    Dim lngRemain As Long
    Dim lngSpeed As Long
        
    On Error Resume Next
    
    If Download.lngStatusTime = 0 Then
        Download.lngStatusTime = GetTickCount
    End If
    
    If (GetTickCount - Download.lngStatusTime) / 1000 >= 1 Then
        'Update all second
        Download.lngStatusTime = GetTickCount
        
        'Speed
        lngTimed = (GetTickCount - Download.lngStart) / 1000
        lngSpeed = Download.lngRec / lngTimed
                
        'Remaining
        lngRemain = (Download.lngLength - Download.lngRec) / lngSpeed
        
        'Display Status
        lbl_Loaded.Caption = SizeCalc(Download.lngRec) & " / " & SizeCalc(Download.lngLength)
        lbl_Speed.Caption = SizeCalc(lngSpeed) & "/s"
        lbl_Remain.Caption = Format(lngRemain / 86400, "hh:nn:ss")
        lbl_Done.Caption = Format((Download.lngRec / Download.lngLength * 100), 0) & "%"
        
        PB.Value = Download.lngRec / Download.lngLength * 100
    End If
End Sub

Sub FinishStatus()
    lbl_Loaded.Caption = SizeCalc(LOF(Download.F)) & " / " & SizeCalc(Download.lngLength)
    lbl_Speed.Caption = "0 B/s"
    lbl_Remain.Caption = "00:00:00"
    lbl_Done.Caption = "100%"
    PB.Value = 100
End Sub
