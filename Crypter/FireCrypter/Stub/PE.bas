Attribute VB_Name = "PE"
'---------------------------------------------------------------------------------------
' Module      : mPEChecksum
' DateTime    : 19/03/2009 23:17
' Author      : Cobein
' Mail        : cobein27@hotmail.com
' WebPage     : http://www.advancevb.com.ar
' Purpose     : Read and fix PE checksum
' Usage       : At your own risk
' Requirements: None
' Distribution: You can freely use this code in your own
'               applications, but you may not reproduce
'               or publish this code on any web site,
'               online service, or distribute as source
'               on any media without express permission.
'
' Reference   : http://hackhound.org/forum/index.php?topic=11272.0
'
' Credits     : Steve10120 Slayer616
'
' History     : 19/03/2009 First Cut....................................................
'---------------------------------------------------------------------------------------
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
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, Src As Any, ByVal l As Long)

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


