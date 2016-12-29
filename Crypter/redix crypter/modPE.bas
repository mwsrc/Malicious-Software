Attribute VB_Name = "modPE"

Option Explicit

Private Type IMAGE_DOS_HEADER
    e_magic                 As Integer
    e_cblp                  As Integer
    e_cp                    As Integer
    e_crlc                  As Integer
    e_cparhdr               As Integer
    e_minalloc              As Integer
    e_maxalloc              As Integer
    e_ss                    As Integer
    e_sp                    As Integer
    e_csum                  As Integer
    e_ip                    As Integer
    e_cs                    As Integer
    e_lfarlc                As Integer
    e_onvo                  As Integer
    e_res(3)                As Integer
    e_oemid                 As Integer
    e_oeminfo               As Integer
    e_res2(9)               As Integer
    e_lfanew                As Long
End Type


Private Type IMAGE_FILE_HEADER
    Machine                 As Integer
    NumberOfSections        As Integer
    TimeDataStamp           As Long
    PointerToSymbolTable    As Long
    NumberOfSymbols         As Long
    SizeOfOptionalHeader    As Integer
    Characteristics         As Integer
End Type

Private Type IMAGE_DATA_DIRECTORY
  VirtualAddress As Long
  isize As Long
End Type

Private Type IMAGE_OPTIONAL_HEADER32
    Magic                   As Integer
    MajorLinkerVersion      As Byte
    MinorLinkerVersion      As Byte
    SizeOfCode              As Long
    SizeOfInitalizedData    As Long
    SizeOfUninitalizedData  As Long
    AddressOfEntryPoint     As Long
    BaseOfCode              As Long
    BaseOfData              As Long
    ImageBase               As Long
    SectionAlignment        As Long
    FileAlignment           As Long
    MajorOperatingSystemVer As Integer
    MinorOperatingSystemVer As Integer
    MajorImageVersion       As Integer
    MinorImageVersion       As Integer
    MajorSubsystemVersion   As Integer
    MinorSubsystemVersion   As Integer
    Reserved1               As Long
    SizeOfImage             As Long
    SizeOfHeaders           As Long
    Checksum                As Long
    Subsystem               As Integer
    DllCharacteristics      As Integer
    SizeOfStackReserve      As Long
    SizeOfStackCommit       As Long
    SizeOfHeapReserve       As Long
    SizeOfHeapCommit        As Long
    LoaerFlags              As Long
    NumberOfRvaAndSizes     As Long
    DataDirectory(1 To 16) As IMAGE_DATA_DIRECTORY
End Type

Private Type IMAGE_SECTION_HEADER
    Name As String * 8
    VirtualSize As Long
    VirtualAddress As Long
    SizeOfRawData As Long
    PointerToRawData As Long
    PointerToRelocations As Long
    PointerToLinenumbers As Long
    NumberOfRelocations As Integer
    NumberOfLinenumbers As Integer
    Characteristics As Long
End Type


Private Type IMAGE_NT_HEADERS
    Signature As Long
    FileHeader As IMAGE_FILE_HEADER
    OptionalHeader As IMAGE_OPTIONAL_HEADER32
End Type

Private Function Align(ByVal dwValue As Long, ByVal dwAlign As Long) As Long

If dwAlign <> 0 Then

    If dwValue Mod dwAlign <> 0 Then
    
        Align = (dwValue + dwAlign) - (dwValue Mod dwAlign)
        
        Exit Function
        
    End If
    
End If

Align = dwValue

End Function


Public Function GetEOFData(strFile As String) As Byte()
Dim dos As IMAGE_DOS_HEADER
Dim NT As IMAGE_NT_HEADERS
Dim section() As IMAGE_SECTION_HEADER
Dim i As Integer, eof As Integer
Dim ret() As Byte

Open strFile For Binary As #1

Get #1, 1, dos

Get #1, 1 + dos.e_lfanew, NT

ReDim section(0 To NT.FileHeader.NumberOfSections - 1) As IMAGE_SECTION_HEADER

Get #1, 1 + dos.e_lfanew + 24 + NT.FileHeader.SizeOfOptionalHeader, section()

eof = LBound(section)

For i = LBound(section) To UBound(section)

    If section(i).PointerToRawData + section(i).SizeOfRawData > section(eof).PointerToRawData + section(eof).SizeOfRawData Then eof = i
    
Next i

If (LOF(1) > section(eof).PointerToRawData + section(eof).SizeOfRawData) Then

    ReDim ret(0 To (LOF(1) - (section(eof).PointerToRawData + section(eof).SizeOfRawData)) - 1) As Byte
    
    Get #1, 1 + section(eof).PointerToRawData + section(eof).SizeOfRawData, ret()
    
End If

Close #1

GetEOFData = ret

End Function


