VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsRegistry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Private Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hKey As Long, ByVal lpSubKey As String) As Long
Private Declare Function RegEnumKeyEx Lib "advapi32.dll" Alias "RegEnumKeyExA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpName As String, lpcbName As Long, ByVal lpReserved As Long, ByVal lpClass As String, lpcbClass As Long, lpftLastWriteTime As Any) As Long
Private Declare Function RegRestoreKey Lib "advapi32.dll" Alias "RegRestoreKeyA" (ByVal hKey As Long, ByVal lpFile As String, ByVal dwFlags As Long) As Long
Private Declare Function RegSaveKey Lib "advapi32.dll" Alias "RegSaveKeyA" (ByVal hKey As Long, ByVal lpFile As String, ByVal lpSecurityAttributes As Long) As Long
Private Declare Function RegEnumValue Lib "advapi32.dll" Alias "RegEnumValueA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpValueName As String, lpcbValueName As Long, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByRef lpData As Any, lpcbData As Long) As Long
Private Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByRef lpData As Any, ByVal cbData As Long) As Long
Private Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long

Private Declare Function GetCurrentProcess Lib "kernel32" () As Long
Private Declare Function OpenProcessToken Lib "advapi32.dll" (ByVal ProcessHandle As Long, ByVal DesiredAccess As Long, TokenHandle As Long) As Long
Private Declare Function LookupPrivilegeValue Lib "advapi32.dll" Alias "LookupPrivilegeValueA" (ByVal lpSystemName As String, ByVal lpName As String, lpLuid As Luid) As Long
Private Declare Function AdjustTokenPrivileges Lib "advapi32.dll" (ByVal TokenHandle As Long, ByVal DisableAllPrivileges As Long, NewState As TOKEN_PRIVILEGES, ByVal BufferLength As Long, ByVal PreviousState As Long, ByVal ReturnLength As Long) As Long

Private Const ERROR_SUCCESS = 0&
Private Const ERROR_FILE_NOT_FOUND = 2&

Private Const KEY_QUERY_VALUE = &H1&
Private Const KEY_SET_VALUE = &H2&
Private Const KEY_CREATE_SUB_KEY = &H4&
Private Const KEY_ENUMERATE_SUB_KEYS = &H8&
Private Const KEY_NOTIFY = &H10&
Private Const KEY_CREATE_LINK = &H20&
Private Const READ_CONTROL = &H20000
Private Const WRITE_DAC = &H40000
Private Const WRITE_OWNER = &H80000
Private Const SYNCHRONIZE = &H100000
Private Const STANDARD_RIGHTS_REQUIRED = &HF0000
Private Const STANDARD_RIGHTS_READ = READ_CONTROL
Private Const STANDARD_RIGHTS_WRITE = READ_CONTROL
Private Const STANDARD_RIGHTS_EXECUTE = READ_CONTROL
Private Const STANDARD_RIGHTS_ALL = &H1F0000
Private Const KEY_READ = STANDARD_RIGHTS_READ Or KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY
Private Const KEY_WRITE = STANDARD_RIGHTS_WRITE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY
Private Const KEY_EXECUTE = KEY_READ
Private Const KEY_ALL_ACCESS = ((STANDARD_RIGHTS_ALL Or KEY_QUERY_VALUE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY Or KEY_CREATE_LINK) And (Not SYNCHRONIZE))
Private Const REG_FORCE_RESTORE = &H8
Private Const TOKEN_ADJUST_PRIVLEGES = &H20
Private Const TOKEN_QUERY = &H8
Private Const SE_PRIVILEGE_ENABLED = &H2
Private Const SE_RESTORE_NAME = "SeRestorePrivilege"
Private Const SE_BACKUP_NAME = "SeBackupPrivilege"

Private Type Luid
    lowpart As Long
    highpart As Long
End Type

Private Type LUID_AND_ATTRIBUTES
    pLuid As Luid
    Attributes As Long
End Type

Private Type TOKEN_PRIVILEGES
    PrivilegeCount As Long
    Privileges(1) As LUID_AND_ATTRIBUTES
End Type

Public Enum rcMainKey
    HKEY_CLASSES_ROOT = &H80000000
    HKEY_CURRENT_USER = &H80000001
    HKEY_LOCAL_MACHINE = &H80000002
    HKEY_USERS = &H80000003
    HKEY_PERFORMANCE_DATA = &H80000004
    HKEY_CURRENT_CONFIG = &H80000005
    HKEY_DYN_DATA = &H80000006
End Enum

Public Enum rcRegType
    REG_NONE = 0
    REG_SZ = 1
    REG_EXPAND_SZ = 2
    REG_BINARY = 3
    REG_DWORD = 4
    REG_DWORD_LITTLE_ENDIAN = 4
    REG_DWORD_BIG_ENDIAN = 5
    REG_LINK = 6
    REG_MULTI_SZ = 7
    REG_RESOURCE_LIST = 8
    REG_FULL_RESOURCE_DESCRIPTOR = 9
    REG_RESOURCE_REQUIREMENTS_LIST = 10
End Enum

Public Event SearchFound(ByVal key As String, ByVal Value As String, ByVal RegType As rcRegType, ByVal Data As Variant)

Private m_hToken        As Long
Private m_TP            As TOKEN_PRIVILEGES

Private hKey             As Long
Private mKey             As Long
Private sKey             As String
Private mFindInKey      As Boolean
Private mFindInValue    As Boolean
Private mFindInData     As Boolean
Private mStrSearch      As String
Private bCancelSearch   As Boolean
Private m_bDoEvents     As Boolean

Public Sub SetSearchOption(ByVal sSearch As String, ByVal FindInKey As Boolean, ByVal FindInValue As Boolean, ByVal FindInData As Boolean, Optional ByVal CallDoEvents As Boolean)
    mStrSearch = sSearch
    mFindInKey = FindInKey
    mFindInValue = FindInValue
    mFindInData = FindInData
    m_bDoEvents = CallDoEvents
End Sub

Public Sub CancelSearch()
    bCancelSearch = True
End Sub

Public Sub StarSearch(ByVal sPath As String)
    Dim i As Long
    Dim ArrKeys() As Variant
    bCancelSearch = False
    If sPath = vbNullString Then
        ArrKeys = Array("HKEY_CLASSES_ROOT", "HKEY_CURRENT_USER", "HKEY_LOCAL_MACHINE", "HKEY_USERS", "HKEY_CURRENT_CONFIG")
        For i = 0 To 4
            If bCancelSearch Then Exit Sub
            If m_bDoEvents Then DoEvents
            PvFindInValueAndData ArrKeys(i)
            PvFindInKeys ArrKeys(i)
        Next
    Else
        PvFindInValueAndData sPath
        PvFindInKeys sPath
    End If
End Sub

Private Sub PvFindInKeys(ByVal sPath As String)
    Dim lCount As Long
    Dim sKeys() As String
    Dim sCurPath As String
    Dim i As Long

    lCount = EnumKeys(sPath, sKeys)

    If lCount Then
        For i = 0 To lCount - 1
            sCurPath = sPath & "\" & sKeys(i)
            
            If mFindInKey Then
                If InStr(sKeys(i), mStrSearch) Then
                    RaiseEvent SearchFound(sCurPath, vbNullString, REG_NONE, vbNull)
                End If
            End If
            
            If (mFindInValue = True) Or (mFindInData = True) Then
                PvFindInValueAndData sCurPath
            End If
            
            If bCancelSearch Then Exit Sub
            If m_bDoEvents Then DoEvents
            PvFindInKeys sCurPath
        Next
    End If

End Sub

Private Sub PvFindInValueAndData(sPath)
    Dim lCount As Long
    Dim sValue() As String
    Dim lRegType() As Long
    Dim sData() As Variant
    Dim i As Long
    Dim bFind As Boolean
    
    lCount = EnumValues(sPath, sValue, lRegType, sData, True)
    
    For i = 0 To lCount - 1
        If bCancelSearch Then Exit Sub
        If mFindInValue Then
            If InStr(sValue(i), mStrSearch) Then
                RaiseEvent SearchFound(sPath, sValue(i), lRegType(i), sData(i))
                bFind = True
            Else
                bFind = False
            End If
        End If
        
        If mFindInData Then
           If Not bFind Then
                If InStr(sData(i), mStrSearch) Then
                    RaiseEvent SearchFound(sPath, sValue(i), lRegType(i), sData(i))
                End If
            End If
        End If
    Next
End Sub

Public Function CreateKey(ByVal sPath As String) As Boolean
    hKey = GetKeys(sPath, sKey)
    
    If (RegCreateKey(hKey, sKey, mKey) = ERROR_SUCCESS) Then
        RegCloseKey mKey
        CreateKey = True
    End If
End Function

Public Function KillKey(ByVal sPath As String) As Long
    Dim sKeys() As String, nKeys As Long, i As Long
    
    nKeys = EnumKeys(sPath, sKeys)
    If nKeys > 0 Then
        For i = 0 To nKeys - 1
            KillKey sPath & "\" & sKeys(i)
        Next i
    End If
    
    hKey = GetKeys(sPath, sKey)
    
    If (RegOpenKey(hKey, sKey, mKey) = ERROR_SUCCESS) Then
        KillKey = (RegDeleteKey(mKey, "") = ERROR_SUCCESS)
        RegCloseKey mKey
    End If
    
End Function

Public Function KeyExists(ByVal sPath As String) As Boolean
    hKey = GetKeys(sPath, sKey)
    If (RegOpenKey(hKey, sKey, mKey) = ERROR_SUCCESS) Then
        KeyExists = True
        RegCloseKey mKey
    End If
End Function


Function RenameKey(ByVal sKeySource As String, ByVal sNewName As String) As Boolean
    Dim hKeySource As Long
    Dim hKeyDestination As Long
    Dim sFile As String
    
    On Error GoTo ErrHandler
    
    sNewName = Mid(sKeySource, 1, InStrRev(sKeySource, "\")) & sNewName
    hKey = GetKeys(sNewName, sKey)
    sNewName = sKey
    hKey = GetKeys(sKeySource, sKey)

    SetBackupAndRestorePriviliges
    sFile = Environ$("Temp") & "\TempReg.reg"
    If Len(Dir(sFile)) > 0 Then Kill sFile

    If (RegOpenKey(hKey, sKey, hKeySource) = ERROR_SUCCESS) Then
        If (RegSaveKey(hKeySource, sFile, 0&) = ERROR_SUCCESS) Then
            If (RegOpenKey(hKey, sNewName, hKeyDestination) = ERROR_FILE_NOT_FOUND) Then
                If KillKey(sKeySource) = True Then
                    If (RegCreateKey(hKey, sNewName, hKeyDestination) = ERROR_SUCCESS) Then
                        RenameKey = (RegRestoreKey(hKeyDestination, sFile, REG_FORCE_RESTORE) = ERROR_SUCCESS)
                    End If
                End If
                RegCloseKey hKeyDestination
            End If
        End If
        RegCloseKey hKeySource
    End If
    
    ResetBackupAndRestorePriviliges
    If Len(Dir(sFile)) > 0 Then Kill sFile
ErrHandler:

End Function

Public Function EnumKeys(ByVal sPath As String, ByRef key() As String) As Long
    Dim sName As String, RetVal As Long
    
    hKey = GetKeys(sPath, sKey)
    
    Erase key
    
    If (RegOpenKey(hKey, sKey, mKey) = ERROR_SUCCESS) Then

        Do
            sName = String(255, vbNullChar)
            RetVal = Len(sName)
            
            If (RegEnumKeyEx(mKey, EnumKeys, sName, RetVal, ByVal 0&, vbNullString, ByVal 0&, ByVal 0&) <> ERROR_SUCCESS) Then Exit Do
            
            ReDim Preserve key(EnumKeys)
            key(EnumKeys) = Left$(sName, RetVal)
                        
            EnumKeys = EnumKeys + 1

        Loop
    
        RegCloseKey mKey
    Else
        EnumKeys = -1
    End If
End Function

Public Function HaveSubKey(ByVal sPath As String) As Boolean
    Dim sName As String, RetVal As Long
    
    hKey = GetKeys(sPath, sKey)
    
    If (RegOpenKey(hKey, sKey, mKey) = ERROR_SUCCESS) Then
        sName = String(255, 0)
        RetVal = Len(sName)
        HaveSubKey = (RegEnumKeyEx(mKey, 0, sName, RetVal, ByVal 0&, vbNullString, ByVal 0&, ByVal 0&) = ERROR_SUCCESS)
        RegCloseKey mKey
    End If
End Function

Public Function CreateValue(ByVal sPath As String, ByVal sName As String, ByVal nType As rcRegType) As Boolean
    hKey = GetKeys(sPath, sKey)
    If (RegOpenKey(hKey, sKey, mKey) = ERROR_SUCCESS) Then
        CreateValue = (RegSetValueEx(mKey, sName, 0, nType, 0&, 0&) = ERROR_SUCCESS)
        RegCloseKey mKey
    End If
End Function

Public Function KillValue(ByVal sPath As String, ByVal sName As String) As Boolean

    hKey = GetKeys(sPath, sKey)
    
    If (RegOpenKey(hKey, sKey, mKey) = ERROR_SUCCESS) Then
        KillValue = (RegDeleteValue(mKey, sName) = ERROR_SUCCESS)
        RegCloseKey mKey
    End If
    
End Function

Public Function ValueExists(ByVal sPath As String, ByVal sName As String) As Boolean
    
    hKey = GetKeys(sPath, sKey)

    If (RegOpenKey(hKey, sKey, mKey) = ERROR_SUCCESS) Then
        ValueExists = (RegQueryValueEx(mKey, sName, 0&, 0&, ByVal 0&, 0&) = ERROR_SUCCESS)
        RegCloseKey mKey
    End If
    
End Function

Public Function RenameValue(ByVal sPath As String, ByVal sName As String, ByVal sNewName As String) As Boolean
    Dim lLenBuff As Long
    Dim bData() As Byte
    Dim lType As Long

    
    hKey = GetKeys(sPath, sKey)
    
    If (RegOpenKey(hKey, sKey, mKey) = ERROR_SUCCESS) Then
        If RegQueryValueEx(mKey, sName, 0, lType, ByVal 0&, lLenBuff) = ERROR_SUCCESS Then
           If lLenBuff Then
                ReDim bData(lLenBuff - 1)
                If (RegQueryValueEx(mKey, sName, 0, REG_BINARY, bData(0), lLenBuff) = ERROR_SUCCESS) Then
                    If RegSetValueEx(mKey, sNewName, 0, lType, bData(0), lLenBuff) = ERROR_SUCCESS Then
                        RenameValue = (RegDeleteValue(mKey, sName) = ERROR_SUCCESS)
                    End If
                End If
            Else
                If (RegSetValueEx(mKey, sNewName, 0, lType, 0&, 0&) = ERROR_SUCCESS) Then
                    RenameValue = (RegDeleteValue(mKey, sName) = ERROR_SUCCESS)
                End If
            End If
        End If
        RegCloseKey mKey
    End If
End Function

Public Function EnumValues(ByVal sPath As String, ByRef sValue() As String, ByRef lRegType() As Long, ByRef vData() As Variant, Optional ByVal ReturnString As Boolean) As Long
    Dim sValueName As String
    Dim LenName As Long
    Dim LenData As Long
    Dim Index As Long
    Dim EnuRegType As rcRegType

    
    Erase sValue
    Erase vData
    Erase lRegType
    
    hKey = GetKeys(sPath, sKey)
    
    If hKey = 0 Then EnumValues = -1: Exit Function

    If RegOpenKey(hKey, sKey, mKey) = ERROR_SUCCESS Then
        
        Do
            sValueName = String(255, vbNullChar)
            LenName = Len(sValueName)

            If (RegEnumValue(mKey, Index, ByVal sValueName, LenName, 0, EnuRegType, ByVal 0&, LenData) = ERROR_SUCCESS) Then
                sValueName = Left$(sValueName, LenName)
                ReDim Preserve sValue(Index)
                ReDim Preserve vData(Index)
                ReDim Preserve lRegType(Index)
                               
                sValue(Index) = sValueName
                lRegType(Index) = EnuRegType
                
                Select Case EnuRegType
                    Case REG_SZ, REG_MULTI_SZ, REG_EXPAND_SZ
                        Dim sData As String
                        If LenData > 0 Then
                            sData = String(LenData - 1, vbNullChar)
                            Call RegQueryValueEx(mKey, sValueName, 0, EnuRegType, ByVal sData, LenData)
                            vData(Index) = sData
                        Else
                            vData(Index) = vbNullString
                        End If
                        
                    Case REG_DWORD
                        Dim lVal As Long
                        lVal = 0
                        Call RegQueryValueEx(mKey, sValueName, 0, EnuRegType, lVal, 4)
                         vData(Index) = lVal
                    Case REG_BINARY
                        Dim ArrData() As Byte
                        If LenData > 0 Then
                            If ReturnString Then
                                sData = String(LenData, vbNullChar)
                                Call RegQueryValueEx(mKey, sValueName, 0, EnuRegType, ByVal sData, LenData)
                                vData(Index) = sData
                            Else
                                ReDim ArrData(LenData - 1)
                                Call RegQueryValueEx(mKey, sValueName, 0, EnuRegType, ArrData(0), LenData)
                                vData(Index) = ArrData
                            End If
                        End If
                         
                End Select
             
                Index = Index + 1
            Else
                Exit Do
            End If
        Loop
        
        RegCloseKey hKey
        EnumValues = Index
    Else
        EnumValues = -1
    End If
    
End Function

Public Function ReadValue(ByVal sPath As String, ByVal sName As String, Optional vDefault As Variant = vbNullChar) As Variant
    Dim LenData As Long
    Dim EnuRegType As rcRegType

    
    hKey = GetKeys(sPath, sKey)

    If (RegOpenKey(hKey, sKey, mKey) = ERROR_SUCCESS) Then
        
        If (RegQueryValueEx(mKey, sName, 0, EnuRegType, ByVal 0&, LenData) = ERROR_SUCCESS) Then

            Select Case EnuRegType
                Case REG_SZ, REG_MULTI_SZ, REG_EXPAND_SZ
                    Dim sData As String
                    If LenData > 0 Then
                        sData = String$(LenData - 1, vbNullChar)
                        If (RegQueryValueEx(mKey, sName, 0, EnuRegType, ByVal sData, LenData) = ERROR_SUCCESS) Then
                            ReadValue = sData
                        Else
                            ReadValue = CStr(vDefault)
                        End If
                    Else
                        ReadValue = vbNullString
                    End If
                   
                Case REG_DWORD
                    Dim lVal As Long
                               
                    If (RegQueryValueEx(mKey, sName, 0, EnuRegType, lVal, 4) = ERROR_SUCCESS) Then
                        ReadValue = lVal
                    Else
                        ReadValue = CLng(vDefault)
                    End If
                    
                Case REG_BINARY
                    Dim ArrData() As Byte
                    If LenData > 0 Then
                        ReDim ArrData(LenData - 1)
                        If (RegQueryValueEx(mKey, sName, 0, EnuRegType, ArrData(0), LenData) = ERROR_SUCCESS) Then
                            ReadValue = ArrData
                        Else
                            ArrData = vDefault
                        End If
                    Else
                        ArrData = vDefault
                    End If
                     
            End Select
        End If
        RegCloseKey mKey
    End If
End Function

Public Function WriteValue(ByVal sPath As String, ByVal sName As String, ByVal vValue As Variant) As Boolean
    Dim LenData As Long
    Dim bData() As Byte
    Dim EnuRegType As rcRegType
    Dim lRet As Long

    hKey = GetKeys(sPath, sKey)

    If (RegOpenKey(hKey, sKey, mKey) = ERROR_SUCCESS) Then
    
        If sName = vbNullString Then
            EnuRegType = REG_SZ
        Else
            lRet = RegQueryValueEx(mKey, sName, 0, EnuRegType, ByVal 0&, LenData)
        End If
        
        If (lRet = ERROR_SUCCESS) Then
            Select Case EnuRegType
                Case REG_SZ, REG_MULTI_SZ, REG_EXPAND_SZ
                    
                    LenData = Len(vValue)

                    If RegSetValueEx(mKey, sName, 0, EnuRegType, ByVal CStr(vValue), LenData) = ERROR_SUCCESS Then
                        WriteValue = True
                    End If

                Case REG_DWORD
                    If RegSetValueEx(mKey, sName, 0, EnuRegType, CLng(vValue), 4) = ERROR_SUCCESS Then
                        WriteValue = True
                    End If
                Case REG_BINARY
                    Select Case VarType(vValue)
                        Case (vbArray Or vbByte)
                            bData = vValue
                            LenData = UBound(bData) + 1
                            If RegSetValueEx(mKey, sName, 0, EnuRegType, bData(0), LenData) = ERROR_SUCCESS Then
                                WriteValue = True
                            End If
                        Case vbString
                            LenData = Len(vValue)
                            If RegSetValueEx(mKey, sName, 0, EnuRegType, ByVal CStr(vValue), LenData) = ERROR_SUCCESS Then
                                WriteValue = True
                            End If
                        Case 0
                            If RegSetValueEx(mKey, sName, 0, EnuRegType, 0&, 0&) = ERROR_SUCCESS Then
                                WriteValue = VarType(vValue)
                            End If
                    End Select

            End Select
        End If
        RegCloseKey mKey
    End If
    
End Function


Private Function GetKeys(sPath As String, sKey As String) As rcMainKey
    Dim Pos As Long, mk As String
    
    sPath = Replace$(sPath, "HKCR", "HKEY_CLASSES_ROOT", , , 1)
    sPath = Replace$(sPath, "HKCU", "HKEY_CURRENT_USER", , , 1)
    sPath = Replace$(sPath, "HKLM", "HKEY_LOCAL_MACHINE", , , 1)
    sPath = Replace$(sPath, "HKUS", "HKEY_USERS", , , 1)
    sPath = Replace$(sPath, "HKCC", "HKEY_CURRENT_CONFIG", , , 1)
    
    Pos = InStr(1, sPath, "\")

    If (Pos = 0) Then
        mk = UCase$(sPath)
        sKey = ""
    Else
        mk = UCase$(Left$(sPath, Pos - 1))
        sKey = Right$(sPath, Len(sPath) - Pos)
    End If
    
    Select Case mk
        Case "HKEY_CLASSES_ROOT": GetKeys = HKEY_CLASSES_ROOT
        Case "HKEY_CURRENT_USER": GetKeys = HKEY_CURRENT_USER
        Case "HKEY_LOCAL_MACHINE": GetKeys = HKEY_LOCAL_MACHINE
        Case "HKEY_USERS": GetKeys = HKEY_USERS
        Case "HKEY_CURRENT_CONFIG": GetKeys = HKEY_CURRENT_CONFIG
    End Select
    
End Function


Private Sub SetBackupAndRestorePriviliges()
    Dim m_RestoreLuid   As Luid
    Dim m_BackupLuid    As Luid

    Call OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVLEGES Or TOKEN_QUERY, m_hToken)
    Call LookupPrivilegeValue(vbNullString, SE_RESTORE_NAME, m_RestoreLuid)
    Call LookupPrivilegeValue(vbNullString, SE_BACKUP_NAME, m_BackupLuid)
    
    m_TP.PrivilegeCount = 2
    m_TP.Privileges(0).pLuid = m_RestoreLuid
    m_TP.Privileges(0).Attributes = SE_PRIVILEGE_ENABLED
    m_TP.Privileges(1).pLuid = m_BackupLuid
    m_TP.Privileges(1).Attributes = SE_PRIVILEGE_ENABLED
    
    Call AdjustTokenPrivileges(m_hToken, 0, m_TP, Len(m_TP), 0&, 0&)

End Sub

Private Sub ResetBackupAndRestorePriviliges()
    Call AdjustTokenPrivileges(m_hToken, 1, m_TP, Len(m_TP), 0&, 0&)
End Sub

Private Sub Class_Terminate()
    bCancelSearch = True
End Sub
