Attribute VB_Name = "modIcon"

Option Explicit
Private Type ICONDIRENTRY
   bWidth As Byte               '// Width of the image
   bHeight As Byte              '// Height of the image (times 2)
   bColorCount As Byte          '// Number of colors in image (0 if >=8bpp)
   bReserved As Byte            '// Reserved
   wPlanes As Integer           '// Color Planes
   wBitCount As Integer         '// Bits per pixel
   dwBytesInRes As Long         '// how many bytes in this resource?
   dwImageOffset As Long        '// where in the file is this image
End Type
Private Type IconDir
   idReserved As Integer   '// Reserved
   idType As Integer       '// resource type (1 for icons)
   idCount As Integer      '// how many images?
   ' idEntries() as ICONDIRENTRY array follows.
End Type
' A VB type to store the DIB bits of the icon.
Private Type tBits
   bBits() As Byte
End Type
Private Type MEMICONDIRENTRY
   bWidth As Byte               '// Width of the image
   bHeight As Byte              '// Height of the image (times 2)
   bColorCount As Byte          '// Number of colors in image (0 if >=8bpp)
   bReserved As Byte            '// Reserved
   wPlanes As Integer           '// Color Planes
   wBitCount As Integer         '// Bits per pixel
   dwBytesInRes As Long         '// how many bytes in this resource?
   nID As Integer               '// the ID
End Type
Private Type MemEntry
   arEntry(14) As Byte
End Type
Private Type MemDirEntry
   arEntries() As MemEntry
End Type
' API Declares, Constants, and Types
Private Declare Function ExtractIconEx Lib "shell32.dll" Alias "ExtractIconExA" (ByVal lpszFile As String, ByVal nIconIndex As Long, phiconLarge As Long, phiconSmall As Long, ByVal nIcons As Long) As Long
Private Declare Function DrawIconEx Lib "user32" (ByVal hdc As Long, ByVal xLeft As Long, ByVal yTop As Long, ByVal hIcon As Long, ByVal cxWidth As Long, ByVal cyWidth As Long, ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As Long, ByVal diFlags As Long) As Long
' File read/write through Win32.  Declares are modified from the VB versions to allow null to be passed to lpSecurityAttributes and lpOverlapped:
Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Any, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Const GENERIC_READ = &H80000000
Private Const FILE_SHARE_READ = &H1
Private Const GENERIC_WRITE = &H40000000
Private Const OPEN_EXISTING = 3
Private Const CREATE_ALWAYS = 2
Private Const FILE_ATTRIBUTE_NORMAL = &H80
Private Const FILE_ATTRIBUTE_ARCHIVE = &H20
Private Const INVALID_HANDLE_VALUE = -1
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function ReadFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, lpOverlapped As Any) As Long
Private Declare Function WriteFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, lpOverlapped As Any) As Long
Private Declare Function SetFilePointer Lib "kernel32" (ByVal hFile As Long, ByVal lDistanceToMove As Long, lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long
Private Declare Function GetFileSize Lib "kernel32" (ByVal hFile As Long, lpFileSizeHigh As Long) As Long
Private Const FILE_BEGIN = 0
' The following declares are necessary to find and manipulate resources
Private Const LOAD_LIBRARY_AS_DATAFILE = &H2&
Private Declare Function LoadLibraryEx Lib "kernel32" Alias "LoadLibraryExA" (ByVal lpLibFileName As String, ByVal hFile As Long, ByVal dwFlags As Long) As Long
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Private Declare Function LoadResource Lib "kernel32" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
Private Declare Function LockResource Lib "kernel32" (ByVal hResData As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
' Global Lock: Used to get the starting point for writing to the file
Private Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
' The following functions enable us to find resources within a file
' Note:  FindResource() modified to take Any data type for lpName and lpType arguments
'        lpName and lpType arguments must be passed ByVal
Private Declare Function EnumResourceNames Lib "kernel32" Alias "EnumResourceNamesA" (ByVal hModule As Long, ByVal lpType As Any, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Private Declare Function lstrlenW Lib "kernel32" (ByVal lpString As Long) As Long
Private Declare Function lstrlenA Lib "kernel32" (ByVal lpString As Long) As Long
Private Declare Function FindResource Lib "kernel32" Alias "FindResourceA" (ByVal hInstance As Long, lpName As Any, lpType As Any) As Long
Private Declare Function SizeofResource Lib "kernel32" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
Private Declare Function FreeResource Lib "kernel32" (ByVal hResData As Long) As Long
Private Const RT_ICON = 3
Private Const RT_GROUP_ICON = 14&

Private arIconNames() As String        ' List of available resource names in the exe
Private intResCounter As Integer       ' Used by callback procedure

'*******************************************************************************
' ExtractIcons: Takes two arguments:
'           1) strSource:  The full path of the executable file containing the
'                             icons to be extracted and saved as .ico files
'           2) strDest:    The full path of the .ico file which will be
'                             created and used to store extracted icons
'           Return Value:  Returns the error code
'*******************************************************************************

Public Function ExtractIcons(ByVal strSource As String, ByVal strDest As String) As Long
On Error GoTo ErrHandler:
   
' Handles
   Dim hLib As Long
   Dim hResource As Long
   Dim hLoaded As Long
   Dim lPointer As Long
   Dim hFile As Long
' Icon Information Structures
   Dim SrcDir As IconDir
   Dim SrcEntries() As ICONDIRENTRY
   Dim SrcImages() As tBits
   Dim MemEntry As MEMICONDIRENTRY
' General use variables
   Dim arBytes() As Byte
   Dim arID() As Integer
   Dim lngBytesWritten As Long
   Dim intI As Integer
   Dim intC As Integer
   Dim i As Integer
   Dim intBound As Integer
   Dim intBaseOffset As Integer
   Dim strTemp As String
   
' Clear all memory structures
   hLib = 0: hResource = 0: hLoaded = 0: lPointer = 0: hFile = 0
   SrcDir.idCount = 0: SrcDir.idReserved = 0: SrcDir.idType = 0
   ReDim SrcEntries(0) As ICONDIRENTRY
   ReDim SrcImages(0) As tBits
   With MemEntry
      .bColorCount = 0: .bHeight = 0: .bWidth = 0: .bReserved = 0
      .wPlanes = 0: .wBitCount = 0: .dwBytesInRes = 0: .nID = 0
   End With
   
' Validate arguments
   If strSource = "" Or strDest = "" Then
      Err.Raise 1011, App.EXEName & ".SwapIcon.bas", "File not found"
   Else
      If Right$(strDest, 4) <> ".ico" Then strDest = strDest & ".ico"
   End If
   
' Load the executable into memory as a datafile
   hLib = LoadLibraryEx(strSource, ByVal 0&, LOAD_LIBRARY_AS_DATAFILE)
   If hLib = 0 Then Err.Raise 1011, App.EXEName & ".SwapIcon.bas", "File not found"
' Enumerate the resources in the library
   Call EnumResourceNames(hLib, RT_GROUP_ICON, AddressOf EnumResNameProc, 0)
   If UBound(arIconNames) < 0 Then Err.Raise 1002, App.EXEName & ".ExtractIcons", "No existing resources in source file"
' Loop through all resources found, copying the icons and writing them to file
   For intI = 0 To UBound(arIconNames)
      If Not arIconNames(intI) = "" Then
         ' Find, load, and lock the resource
         hResource = FindResource(hLib, ByVal arIconNames(intI), ByVal RT_GROUP_ICON)
         If hResource = 0 Then Err.Raise 1012, App.EXEName & ".SwapIcon.bas", "Failed to locate resource entry"
         hLoaded = LoadResource(hLib, hResource)
         If hLoaded = 0 Then Err.Raise 1013, App.EXEName & ".SwapIcon.bas", "Failed to load resource"
         lPointer = LockResource(hLoaded)
         If lPointer = 0 Then Err.Raise 1014, App.EXEName & ".SwapIcon.bas", "Failed to get pointer to resource data"
         ' Copy the icon directory structure from the file
         CopyMemory SrcDir, ByVal lPointer, Len(SrcDir)
         ' Check for icons in resource
         If SrcDir.idCount > 0 Then
            ' Copy all directory information into a byte array
            ReDim SrcEntries(SrcDir.idCount) As ICONDIRENTRY
            ReDim SrcImages(SrcDir.idCount) As tBits
            ReDim arID(SrcDir.idCount) As Integer
            intBound = (Len(MemEntry) * (SrcDir.idCount))
            ReDim arBytes(0 To intBound)
            ' Calculate the base offset for the icon bitmaps
            intBaseOffset = (Len(SrcDir) + (SrcDir.idCount * Len(SrcEntries(0))))
            CopyMemory arBytes(0), ByVal (lPointer + Len(SrcDir)), intBound + 1
            ' For each icon in the resource, get the directory entry and the icon bits
            For intC = 0 To (SrcDir.idCount - 1)
               ' Temporarily hold the data in the MemEntry structure
               CopyMemory MemEntry, arBytes(intC * Len(MemEntry)), Len(MemEntry)
               ' Add the icon's ID to the array
               arID(intC) = MemEntry.nID
               ' Copy the temp structure into the IconDirEntry structure
               CopyMemory SrcEntries(intC), MemEntry, Len(MemEntry)
               ' Assign the image offset
               SrcEntries(intC).dwImageOffset = intBaseOffset
               intBaseOffset = intBaseOffset + SrcEntries(intC).dwBytesInRes
            Next intC
            ' Locate and copy the icon images
            For intC = 0 To (SrcDir.idCount - 1)
               hResource = FindResource(hLib, ByVal "#" & CStr(arID(intC)), ByVal RT_ICON)
               If hResource > 0 Then
                  hLoaded = LoadResource(hLib, hResource)
                  If hLoaded > 0 Then
                     lPointer = LockResource(hLoaded)
                     If lPointer > 0 Then
                        ReDim Preserve SrcImages(intC).bBits(0 To SrcEntries(intC).dwBytesInRes)
                        CopyMemory SrcImages(intC).bBits(0), ByVal lPointer, SrcEntries(intC).dwBytesInRes
                     Else
                        Err.Raise 1013, App.EXEName & ".ExtractIcons", "Failed to get resource address."
                     End If
                  Else
                     Err.Raise 1012, App.EXEName & ".ExtractIcons", "Failed to load resource."
                  End If
               Else
                  Err.Raise 1011, App.EXEName & ".ExtractIcons", "Failed to locate resource."
               End If
            Next intC
            ' Append an index to the filename if more than one file will be created
            If intI > 0 Then
               strTemp = Left$(strDest, Len(strDest) - 4)
               strTemp = strTemp & "(" & CStr(intI + 1) & ").ico"
            Else
               strTemp = strDest
            End If
            
            ' Create a new .ico file and write the complete icon resource
            hFile = CreateFile(strTemp, GENERIC_WRITE, 0, ByVal 0&, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, ByVal 0&)
            If hFile = 0 Then Err.Raise 1014, App.EXEName & ".IconSwap.bas", "Failed to get read/write handle"
            ' Write the directory
            WriteFile hFile, SrcDir, Len(SrcDir), lngBytesWritten, ByVal 0&
            ' Write the directory entries
            For intC = 0 To SrcDir.idCount - 1
               WriteFile hFile, SrcEntries(intC), Len(SrcEntries(intC)), lngBytesWritten, ByVal 0&
            Next intC
            ' Write the icon bitmaps
            For intC = 0 To SrcDir.idCount - 1
               WriteFile hFile, SrcImages(intC).bBits(0), SrcEntries(intC).dwBytesInRes, lngBytesWritten, ByVal 0&
            Next intC
            ' Close the file
            CloseHandle hFile
         End If
      End If
   Next intI
   
   ' Release the library and return the error code
   FreeLibrary (hLib)
   ExtractIcons = Err.Number
   Exit Function
   
ErrHandler:
   ExtractIcons = Err.Number
End Function


'*******************************************************************************
' InsertIcons: Takes two arguments:
'             1) strSource:  The full path of the .ico file that contains
'                               the icon(s) to be inserted into the executable
'             2) strDest:    The full path of the executable file into which
'                               the icon(s) will be inserted
'             Return Value:  Returns the error code
'
' IMPORTANT:  Existing icon resources in the executable will be overwritten.
'             If you wish to keep these icons, use the ExtractIcon() function to
'             save these as .ico files before inserting the new icons
'             into the executable!
'*******************************************************************************

Public Function InsertIcons(ByVal strSource As String, ByVal strDest As String) As Long
On Error GoTo ErrHandler:
      
' Handles/pointers
   Dim hFile As Long                 ' Handle to the .ico File
   Dim hResource As Long             ' Handle to the resource being imported (.ico resource)
   Dim hLib As Long                  ' Handle to the destination file
   Dim hExeData                      ' Handle to the dest resource after it is loaded
   Dim lPointer As Long              ' Pointer to the destination icon
   Dim lpTemp As Long                ' Temporary pointer
   Dim lpLibStart As Long            ' Beginning of library in memory
   Dim lpDirectory As Long           ' Pointer to the IconDirectory structure in exe
   Dim lpEntries() As Long           ' Pointers to the IconDirEntry structures in exe
   Dim lpImages() As Long            ' Pointers to the icon images in the exe
   Dim arResSizes() As Long          ' Keeps track of the size of the icons being replaced
' Icon information structures
   Dim DestDir As IconDir            ' Destination IconDir structure
   Dim DestEntries() As MemEntry     ' Destination entries
   Dim TempEntry As MemEntry
   Dim DestImages() As tBits         ' Destination icon images
   Dim MemEntry As MEMICONDIRENTRY   ' Temporarily holds icon directory information
   Dim SourceDir As IconDir          ' Icon Directory for source icon
   Dim SourceEntries() As ICONDIRENTRY ' Directory entry for source icon
   Dim SourceImages() As tBits        ' Holds the actual icon bits
' General use variables
   Dim arID() As Integer             ' Holds ID's of RT_ICON resources
   Dim intC As Integer               ' Loop counter
   Dim intI As Integer               ' Loop counter
   Dim intJ As Integer               ' Loop counter
   Dim intFile As Integer            ' Free file handle for binary output
   Dim intID As Integer              ' The resource ID of the exe's icon
   Dim intNum As Integer             ' The number of entries
   Dim intBound As Integer           ' Holds the ubound of array
   Dim lngBytesRead As Long          ' Number of bytes read by ReadFile()
   Dim lngBytesWritten As Long       ' Number of bytes written by WriteFile()
   Dim lngResOffset As Long          ' Offset of DirEntry in the destination file
   Dim lngImageOffset As Long        ' Offset of the image bytes in the dest file
   Dim lngTemp As Long               ' General purpose long
   Dim lngReturn As Long             ' Intercepts return values for error testing
   
' Clear variables
   With SourceDir
      .idCount = 0: .idReserved = 0: .idType = 0
   End With
   With DestDir
      .idCount = 0: .idReserved = 0: .idType = 0
   End With
   ReDim SourceEntry(0) As ICONDIRENTRY
   ReDim DestEntries(0) As MemEntry
   hLib = 0: lPointer = 0: hFile = 0
   ReDim lpEntries(0) As Long
   ReDim lpImages(0) As Long
   ReDim arID(0) As Integer
   ReDim arIconNames(0) As String
   intResCounter = 0

' Get the icons out of the .ico source file
   
   hFile = CreateFile(strSource, GENERIC_READ, 0, ByVal 0&, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0)
   If hFile = 0 Then Err.Raise 1001, App.EXEName & ".SwapIcon.bas", "Failed to get handle to source file"
   ' If a file handle was obtained, read the directory structure
   ReadFile hFile, SourceDir, Len(SourceDir), lngBytesRead, ByVal 0&
   ' Make sure this file contains at least one icon resource
   If SourceDir.idType <> 1 Or SourceDir.idCount = 0 Then Err.Raise 1002, App.EXEName & ".SwapIcon.bas", "No icon resources found in source file"
   ' If so, then loop through the directory entries, reading the data
   intNum = SourceDir.idCount - 1
   ReDim SourceEntries(0 To intNum) As ICONDIRENTRY
   ReDim SourceImages(0 To intNum) As tBits
   For intI = 0 To intNum
      ReadFile hFile, SourceEntries(intI), Len(SourceEntries(intI)), lngBytesRead, ByVal 0&
      If lngBytesRead <> Len(SourceEntries(intI)) Then Err.Raise 1011, App.EXEName & ".SwapIcon.bas", "Source icon directory is corrupt"
   Next intI
   ' For each entry, set a file pointer to the image and copy the bitmap bits
   For intI = 0 To intNum
      If SourceEntries(intI).dwBytesInRes > 0 Then
         SetFilePointer hFile, SourceEntries(intI).dwImageOffset, ByVal 0&, FILE_BEGIN
         ReDim SourceImages(intI).bBits(SourceEntries(intI).dwBytesInRes) As Byte
         ReadFile hFile, SourceImages(intI).bBits(0), SourceEntries(intI).dwBytesInRes, lngBytesRead, ByVal 0&
         If lngBytesRead <> SourceEntries(intI).dwBytesInRes Then Err.Raise 1012, App.EXEName & "SwapIcon.bas", "Source icon bitmap is corrupt"
      Else
         Err.Raise 1015, App.EXEName & ".SwapIcon.bas", "Invalid icon in source file"
      End If
   Next intI
   ' Close the file
   CloseHandle hFile
   
   
' Locate target executable into memory without executing it
   hLib = LoadLibraryEx(strDest, ByVal 0&, LOAD_LIBRARY_AS_DATAFILE)
   If hLib = 0 Then Err.Raise 1003, App.EXEName & "SwapIcon.bas", "Destination file could not be opened"
   ' Get a pointer to the beginning of the library in memory
   lpTemp = GlobalLock(hLib)
   lpLibStart = lpTemp
   If lpLibStart = 0 Then Err.Raise 1003, App.EXEName & "SwapIcon.bas", "Destination file could not be loaded"
   Call GlobalUnlock(hLib)
   ' If a handle was obtained, enumerate the icon group resources within the file
   Call EnumResourceNames(hLib, RT_GROUP_ICON, AddressOf EnumResNameProc, ByVal 0&)
   ' Now we have an array containing the names of all available resources
   
   ' Load the first resource into memory and get a pointer to the data
   If arIconNames(0) > "" Then
      ' Get a handle to the resource
      hResource = FindResource(hLib, ByVal arIconNames(0), ByVal RT_GROUP_ICON)
      If hResource = 0 Then Err.Raise 1013, App.EXEName & "SwapIcon.bas", "Failed to locate resource in specified file"
      ' Load the resource
      hExeData = LoadResource(hLib, hResource)
      If hExeData = 0 Then Err.Raise 1014, App.EXEName & "SwapIcon.bas", "Failed to load resource in specified file"
      ' Lock the resource to obtain a safe pointer to the data
      lPointer = LockResource(hExeData)
      If lPointer = 0 Then Err.Raise 1014, App.EXEName & "SwapIcon.bas", "Failed to load resource in specified file"
      ' Record the position of the IconDir structure
      lpDirectory = lPointer
      ' Copy the directory structure
      CopyMemory DestDir, ByVal lPointer, 6
      If DestDir.idCount > 0 Then
         ' Resize pointer and ID arrays
         intNum = DestDir.idCount - 1
         ReDim arID(0 To intNum) As Integer
         ReDim lpImages(0 To intNum) As Long
         ReDim arResSizes(0 To intNum) As Long
         ' Loop through the directory entries, recording their positions in memory
         For intC = 0 To intNum
            ' Get the directory entry
            CopyMemory MemEntry, ByVal ((lPointer + 6) + intC * Len(MemEntry)), Len(MemEntry)
            ' Get the resource ID of the current icon bitmap
            arID(intC) = MemEntry.nID
            ' Get the size of the icon resource
            arResSizes(intC) = MemEntry.dwBytesInRes
            ' Locate the icon bitmap and get a pointer for later use
            hResource = FindResource(hLib, ByVal "#" & CStr(arID(intC)), ByVal RT_ICON)
            If hResource = 0 Then Exit For
            hExeData = LoadResource(hLib, hResource)
            If hExeData = 0 Then Exit For
            lpTemp = LockResource(hExeData)
            lpImages(intC) = lpTemp
            lpTemp = lpImages(intC) - lpLibStart
            lpImages(intC) = lpTemp + 1
         Next intC
      End If
   Else
      intResCounter = intResCounter - 1
   End If

   FreeLibrary (hLib)
   
' Copy the source dir entries to the dest arrays
   For intJ = 0 To UBound(lpImages)
      ReDim Preserve DestEntries(intJ + 1) As MemEntry
      If intJ > UBound(SourceEntries) Then
         intNum = UBound(SourceEntries)
      Else
         intNum = intJ
      End If
      CopyMemory DestEntries(intJ).arEntry(0), SourceEntries(intNum).bWidth, 1
      CopyMemory DestEntries(intJ).arEntry(1), SourceEntries(intNum).bHeight, 1
      CopyMemory DestEntries(intJ).arEntry(2), SourceEntries(intNum).bColorCount, 1
      CopyMemory DestEntries(intJ).arEntry(3), SourceEntries(intNum).bReserved, 1
      CopyMemory DestEntries(intJ).arEntry(4), SourceEntries(intNum).wPlanes, 2
      CopyMemory DestEntries(intJ).arEntry(6), SourceEntries(intNum).wBitCount, 2
      CopyMemory DestEntries(intJ).arEntry(8), SourceEntries(intNum).dwBytesInRes, 4
      CopyMemory DestEntries(intJ).arEntry(12), arID(intNum), 2
   Next intJ
         
' Calculate the offset of the directory from the BOF
   lngTemp = lpDirectory - lpLibStart
   lpDirectory = lngTemp + 1
' The lpGroup structure now contains the start record number of all data to be written
   
' Open the target executable and write the new icons
   intFile = FreeFile
   Open strDest For Binary As #intFile
   
   lngImageOffset = lpImages(0)
   ' Write the directory entries
   For intJ = 0 To UBound(lpImages)
      If intJ > UBound(SourceEntries) Then
         intNum = UBound(SourceEntries)
      Else
         intNum = intJ
      End If
      If lpDirectory > lpImages(intJ) Then
         If (lpImages(intJ) + SourceEntries(intNum).dwBytesInRes) >= lpDirectory Then
            Exit For
         End If
      End If
      ' Set the image offset
      lngImageOffset = lpImages(intJ)
      'Write the directory entry structure to file
      For intC = 0 To 13
         Put #intFile, ((lpDirectory + 7) + (intJ * 14)) + intC, DestEntries(intJ).arEntry(intC)
      Next intC
      ' Write the actual icon bitmap bytes to the file
      For intC = 0 To UBound(SourceImages(intNum).bBits)
         Put #intFile, (lngImageOffset + 1) + intC, SourceImages(intNum).bBits(intC)
      Next intC
   Next intJ
   
   Close #intFile
   
   InsertIcons = Err.Number
   Exit Function
   
ErrHandler:
   ' Error handling is deferred to calling procedure
   InsertIcons = Err.Number
End Function

'*******************************************************************************
' Private helper functions
'*******************************************************************************
Private Function EnumResNameProc(ByVal hModule As Long, ByVal lpszType As Long, ByVal lpszName As Long, ByVal lParam As Long) As Long
   'BOOL CALLBACK EnumResNameProc(
   '    HANDLE hModule,  // resource-module handle
   '    LPCTSTR lpszType,   // pointer to resource type
   '    LPTSTR lpszName, // pointer to resource name
   '    LONG lParam   // application-defined parameter
   '   );
   Dim ResName As String
   Dim ResType As String
   Dim Continue As Boolean
   Dim Buffer As String
   Dim nRet As Long
   
   ' Retrieve resource ID.
   ResType = DecodeResTypeName(lpszType)
   ResName = DecodeResTypeName(lpszName)
      
   ' Add resource name to the array
   If ResName > "" Then
      intResCounter = intResCounter + 1
      ReDim Preserve arIconNames(intResCounter) As String
      arIconNames(intResCounter - 1) = ResName
      Continue = True
   Else
      Continue = False
   End If
   
   ' Continue enumeration?
   EnumResNameProc = Continue
End Function

Private Function DecodeResTypeName(ByVal lpszValue As Long) As String
   If HiWord(lpszValue) Then
      ' Pointers will always be >64K
      DecodeResTypeName = PointerToStringA(lpszValue)
   Else
      ' Otherwise we have an ID.
      DecodeResTypeName = "#" & CStr(lpszValue)
   End If
End Function

Private Function PointerToStringA(lpStringA As Long) As String
   Dim Buffer() As Byte
   Dim nLen As Long
   
   If lpStringA Then
      nLen = lstrlenA(ByVal lpStringA)
      If nLen Then
         ReDim Buffer(0 To (nLen - 1)) As Byte
         CopyMemory Buffer(0), ByVal lpStringA, nLen
         PointerToStringA = StrConv(Buffer, vbUnicode)
      End If
   End If
End Function

'*********************************************************************************
' Private utility functions
'*********************************************************************************
Private Function LoWord(LongIn As Long) As Integer
   Call CopyMemory(LoWord, LongIn, 2)
End Function

Private Function HiWord(LongIn As Long) As Integer
   Call CopyMemory(HiWord, ByVal (VarPtr(LongIn) + 2), 2)
End Function





