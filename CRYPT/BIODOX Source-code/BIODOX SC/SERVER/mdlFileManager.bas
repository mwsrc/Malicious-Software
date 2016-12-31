Attribute VB_Name = "mdlFileManager"
Private Type FILETIME
    dwLowDateTime As Long
    dwHighDateTime As Long
End Type

Private Type WIN32_FIND_DATA
    dwFileAttributes As Long
    ftCreationTime As FILETIME
    ftLastAccessTime As FILETIME
    ftLastWriteTime As FILETIME
    nFileSizeHigh As Long
    nFileSizeLow As Long
    dwReserved0 As Long
    dwReserved1 As Long
    cFileName As String * 255
    cAlternate As String * 14
End Type

Private Declare Function FindFirstFileA Lib "kernel32" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindNextFileA Lib "kernel32" (ByVal hFindFile As Long, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long
Private Declare Function GetLogicalDriveStringsA Lib "kernel32" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
Private Declare Function GetDriveTypeA Lib "kernel32" (ByVal nDrive As String) As Long
Private Declare Function GetFileAttributesA Lib "kernel32" (ByVal lpFileName As String) As Long

Public Function EnumDrives() As String
    Dim sEDrives As String * 255
    Dim sDrives As String
    Dim sTmpDrv As String
    sDrives = Left(sEDrives, GetLogicalDriveStringsA(255, sEDrives))
    Do
        sTmpDrv = Mid$(sDrives, 1, InStr(sDrives, vbNullChar) - 1)
        sDrives = Mid$(sDrives, InStr(sDrives, vbNullChar) + 1)
        EnumDrives = EnumDrives & sTmpDrv & Chr(0) & GetDriveTypeA(sTmpDrv) & Chr(255)
    Loop While sDrives <> ""
End Function


Public Function EnumFiles(sDir As String) As String
On Error Resume Next
    Dim hFile As Long
    Dim sFile As String
    Dim oFile As WIN32_FIND_DATA
            hFile = FindFirstFileA(sDir & "\*.*", oFile)
            Do
                sFile = oFile.cFileName
                sFile = Left$(sFile, InStr(sFile, Chr$(0)) - 1)
                If Left(sFile, 1) <> "." Then
                If oFile.dwFileAttributes And 16 Then
                    EnumFiles = EnumFiles & "<" & sFile & Chr(0) & GetFileAttributesA(sDir & "\" & oFile.cFileName) & Chr(255)
                Else
                    EnumFiles = EnumFiles & sFile & Chr(0) & FileLen(sDir & "\" & oFile.cFileName) & Chr(0) & GetFileAttributesA(sDir & "\" & oFile.cFileName) & Chr(255)
                End If
                End If
                If FindNextFileA(hFile, oFile) = 0 Then Exit Do
            Loop
            FindClose hFile
End Function
