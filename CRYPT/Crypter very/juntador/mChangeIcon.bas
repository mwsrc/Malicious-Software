Attribute VB_Name = "mChangeIcon"
Option Explicit

Private Const OPEN_EXISTING             As Long = &H3
Private Const INVALID_HANDLE_VALUE      As Long = -1
Private Const GENERIC_READ              As Long = &H80000000
Private Const FILE_ATTRIBUTE_NORMAL     As Long = &H80
Private Const FILE_BEGIN                As Long = &H0
Private Const RT_ICON                   As Long = &H3
Private Const RT_GROUP_ICON             As Long = &HE

Private Type ICONDIRENTRY
    bWidth          As Byte
    bHeight         As Byte
    bColorCount     As Byte
    bReserved       As Byte
    wPlanes         As Integer
    wBitCount       As Integer
    dwBytesInRes    As Long
    dwImageOffset   As Long
End Type
 
Private Type ICONDIR
    idReserved      As Integer
    idType          As Integer
    idCount         As Integer
End Type
 
Private Type GRPICONDIRENTRY
    bWidth          As Byte
    bHeight         As Byte
    bColorCount     As Byte
    bReserved       As Byte
    wPlanes         As Integer
    wBitCount       As Integer
    dwBytesInRes    As Long
    nID             As Integer
End Type
 
Private Type GRPICONDIR
    idReserved      As Integer
    idType          As Integer
    idCount         As Integer
    idEntries       As GRPICONDIRENTRY
End Type

Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Any, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Declare Function ReadFile Lib "kernel32" (ByVal lFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, lpOverlapped As Any) As Long
Private Declare Function SetFilePointer Lib "kernel32" (ByVal lFile As Long, ByVal lDistanceToMove As Long, lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function BeginUpdateResource Lib "kernel32" Alias "BeginUpdateResourceA" (ByVal pFileName As String, ByVal bDeleteExistingResources As Long) As Long
Private Declare Function UpdateResource Lib "kernel32" Alias "UpdateResourceA" (ByVal lUpdate As Long, ByVal lpType As Long, ByVal lpName As Long, ByVal wLanguage As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function EndUpdateResource Lib "kernel32" Alias "EndUpdateResourceA" (ByVal lUpdate As Long, ByVal fDiscard As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

'---------------------------------------------------------------------------------------
' Procedure : EnumIcons
' Purpose   : Enumerate Images on Icon File
'---------------------------------------------------------------------------------------
Public Function EnumIcons(ByVal sFile As String) As Collection
    Dim lFile           As Long
    Dim i               As Long
    Dim tICONDIRENTRY   As ICONDIRENTRY
    Dim tICONDIR        As ICONDIR
    Dim cCol            As New Collection
    Dim lRet            As Long
        
    Debug.Print Hex(RT_GROUP_ICON)
    lFile = CreateFile(sFile, GENERIC_READ, 0, ByVal 0&, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0)
    
    If Not lFile = INVALID_HANDLE_VALUE Then
 
        Call ReadFile(lFile, tICONDIR, Len(tICONDIR), lRet, ByVal 0&)

        If lRet Then
            For i = 0 To tICONDIR.idCount - 1
                Call ReadFile(lFile, tICONDIRENTRY, Len(tICONDIRENTRY), lRet, ByVal 0&)
                If Not tICONDIRENTRY.bWidth = 0 And Not tICONDIRENTRY.bHeight = 0 Then
                    If tICONDIRENTRY.bWidth = tICONDIRENTRY.bHeight Then
                        cCol.Add tICONDIRENTRY.bWidth & "x" & tICONDIRENTRY.bHeight
                    End If
                End If
            Next
        End If
    
        Call CloseHandle(lFile)
    End If
    Set EnumIcons = cCol
End Function

'---------------------------------------------------------------------------------------
' Procedure : ChangeIcon
' Purpose   : Replace Icon
'---------------------------------------------------------------------------------------
Public Function ChangeIcon(ByVal sIcon As String, ByVal lIndex As Long, ByVal sExe As String) As Boolean
    Dim tICONDIR        As ICONDIR
    Dim tICONDIRENTRY   As ICONDIRENTRY
    Dim tGRPICONDIR     As GRPICONDIR
    Dim lFile           As Long
    Dim lUpdate         As Long
    Dim lRet            As Long
    Dim bvIconData()    As Byte
    Dim bvGroupData()   As Byte
    
    On Error GoTo ChangeIcon_Error

    lFile = CreateFile(sIcon, GENERIC_READ, 0, ByVal 0&, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0)
    
    If Not lFile = INVALID_HANDLE_VALUE Then
        Call ReadFile(lFile, tICONDIR, Len(tICONDIR), lRet, ByVal 0&)
        If lRet = 0 Then GoTo ChangeIcon_Error
    
        Dim i       As Long
        Dim lCount  As Long
    
        For i = 0 To tICONDIR.idCount - 1
            Call ReadFile(lFile, tICONDIRENTRY, Len(tICONDIRENTRY), lRet, ByVal 0&)
            If Not lRet = 0 Then
                If Not tICONDIRENTRY.bWidth = 0 Then
                    If tICONDIRENTRY.bWidth = tICONDIRENTRY.bHeight Then
                        If lCount = lIndex Then Exit For
                        lCount = lCount + 1
                    End If
                End If
            End If
        Next
 
        ReDim bvIconData(tICONDIRENTRY.dwBytesInRes - 1)
        
        SetFilePointer lFile, tICONDIRENTRY.dwImageOffset, ByVal 0&, FILE_BEGIN
        Call ReadFile(lFile, bvIconData(0), tICONDIRENTRY.dwBytesInRes, lRet, ByVal 0&)
        If lRet = 0 Then GoTo ChangeIcon_Error
   
        tGRPICONDIR.idType = 1
        CopyMemory tGRPICONDIR.idEntries, tICONDIRENTRY, Len(tICONDIRENTRY)
      
        ReDim bvGroupData(Len(tGRPICONDIR) - 1)
        CopyMemory bvGroupData(0), tGRPICONDIR, Len(tGRPICONDIR)
    
        lUpdate = BeginUpdateResource(sExe, False)
        If lUpdate Then
            If Not UpdateResource(lUpdate, RT_GROUP_ICON, 1, 0, bvGroupData(0), Len(tGRPICONDIR)) = 0 Then
                If Not UpdateResource(lUpdate, RT_ICON, 1, 0, bvIconData(0), tICONDIRENTRY.dwBytesInRes) = 0 Then
                    ChangeIcon = True
                End If
            End If
            Call EndUpdateResource(lUpdate, False)
        End If
        Call CloseHandle(lFile)
        
    End If
   
    On Error GoTo 0
    Exit Function

ChangeIcon_Error:
    Call CloseHandle(lFile)
End Function
 
 
 
 


