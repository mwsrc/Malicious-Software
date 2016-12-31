Attribute VB_Name = "mdlRegistry"
Public Const REG_SZ = 1
Public Const REG_BINARY = 3
Public Const REG_DWORD = 4

Public Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long
Public Declare Function RegCreateKeyA Lib "advapi32" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegDeleteKeyA Lib "advapi32" (ByVal hKey As Long, ByVal lpSubKey As String) As Long
Public Declare Function RegDeleteValueA Lib "advapi32" (ByVal hKey As Long, ByVal lpValueName As String) As Long
Public Declare Function RegOpenKeyA Lib "advapi32" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegQueryValueExA Lib "advapi32" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Public Declare Function RegSetValueExA Lib "advapi32" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
Public Declare Function RegEnumKeyExA Lib "advapi32" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpName As String, lpcbName As Long, ByVal lpReserved As Long, ByVal lpClass As String, lpcbClass As Long, lpftLastWriteTime As Any) As Long
Public Declare Function RegEnumValueA Lib "advapi32" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpValueName As String, lpcbValueName As Long, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long

Public Function EnumKeysValues(lRootKey As String, Optional sPath As String) As String
    Dim hKey As Long
    Dim lCounter As Long
    Dim lVCounter As Long
    Dim sValue As String
    Dim bValue(0 To 1) As Byte
    Dim sData As String
    Dim vData As Variant
    Dim lValueType As Long
    
    If Len(sPath) Then sPath = Right(sPath, Len(sPath) - 1)
    RegOpenKeyA GetRootValue(lRootKey), sPath, hKey
    sValue = Space(255)
    While RegEnumKeyExA(hKey, lCounter, sValue, 255, ByVal 0&, vbNullString, ByVal 0&, ByVal 0&) <> 259&
        EnumKeysValues = EnumKeysValues & "\" & LPSTRToVBString(sValue) & Chr(255)
        lCounter = lCounter + 1
        sValue = Space$(255)
    Wend
    lCounter = 0
    While RegEnumValueA(hKey, lCounter, sValue, 255, 0, lValueType, 0, 255) <> 259&
        ReDim vData(0) As Variant
        sData = ""
        Select Case lValueType
            Case 3
            vData = Reg.regread(lRootKey & "\" & sPath & "\" & LPSTRToVBString(sValue))
            For lVCounter = 0 To UBound(vData)
                sData = sData & Format(Hex(vData(lVCounter)), "00")
            Next
        Case 1, 4
            sData = Reg.regread(lRootKey & "\" & sPath & "\" & LPSTRToVBString(sValue))
        End Select
        EnumKeysValues = EnumKeysValues & LPSTRToVBString(sValue) & Chr(0) & lValueType & Chr(0) & sData & Chr(255)
        lCounter = lCounter + 1
        sValue = Space$(255)
        sData = Space$(255)
    Wend
    RegCloseKey hKey
End Function

Public Function GetKeys(ByVal hKey As Long, ByVal hSubDir As String) As String
    Dim hCurKey As Long
    Dim Counter As Long
    Dim sValue As String
    Dim sData As String
    Dim lValueType As Long
    Dim lDataBufferSize As Long

    Debug.Print RegOpenKeyA(hKey, hSubDir, hCurKey)
    Do
     sValue = Space$(255)
     sData = Space$(255)
     If RegEnumKeyExA(hCurKey, Counter, sValue, 255, 0, vbNullString, ByVal 0&, ByVal 0&) <> 0 Then Exit Do
     Debug.Print RegEnumKeyExA(hCurKey, Counter, sValue, 255, 0, vbNullString, ByVal 0&, ByVal 0&)
     If RegQueryValueExA(hCurKey, LPSTRToVBString(sValue), 0&, lValueType, ByVal 0&, 255) = 0 Then
     
        If lValueType = REG_SZ Then
            Debug.Print RegQueryValueExA(hCurKey, sValue, 0&, 0&, ByVal sData, 255)
            GetKeys = GetKeys & LPSTRToVBString(sValue) & "~" & 1 & "~" & LPSTRToVBString(sData) & vbCrLf
        End If
     End If
     
     Counter = Counter + 1
    Loop
    RegCloseKey hCurKey
End Function

Public Function GetValues(ByVal hKey As Long, ByVal HSubKey As String) As String
    Dim hCurKey As Long
    Dim Counter As Long
    Dim sSave As String
    RegOpenKeyA hKey, HSubKey, hCurKey
    Do
     sSave = Space$(255)
     If RegEnumValueA(hCurKey, Counter, sSave, 255, 0, ByVal 0&, ByVal 0&, ByVal 0&) <> 0 Then Exit Do
     If sSave = "" Then sSave = "(default)"
     GetValues = GetValues & LPSTRToVBString(sSave) & vbCrLf
     Counter = Counter + 1
  Loop
  RegCloseKey hCurKey
End Function

Public Function DeleteKey(hKey As Long, ByVal strPath As String) As Long
    DeleteKey = RegDeleteKeyA(hKey, strPath)
End Function

Public Sub DeleteSettingString(ByVal hKey As Long, ByVal strPath As String, ByVal strValue As String)
    Dim hCurKey As Long
    RegOpenKeyA hKey, strPath, hCurKey
    RegDeleteValueA hCurKey, strValue
    RegCloseKey hCurKey
End Sub

Public Sub SaveSettingString(hKey As Long, ByVal strPath As String, ByVal strValue As String, ByVal strdata As String)
    Dim hCurKey As Long
    RegCreateKeyA hKey, strPath, hCurKey
    RegSetValueExA hCurKey, strValue, 0, 1, ByVal strdata, Len(strdata)
    RegCloseKey hCurKey
End Sub

Public Sub CreateKey(hKey As Long, strPath As String)
Dim hCurKey As Long
    RegCreateKeyA hKey, strPath, hCurKey
    RegCloseKey hCurKey
End Sub

Public Function GetValueData(ByVal hCurKey As Long, ByVal strPath As String, ByVal strValue As String, Optional Default As String) As String

'Dim hCurKey As Long
Dim lValueType As Long
Dim strBuffer As String
Dim lDataBufferSize As Long
'Dim intZeroPos As Integer

If Len(Default) Then GetSettingString = Default

RegOpenKeyA hKey, strPath, hCurKey
If RegQueryValueExA(hCurKey, strValue, 0&, lValueType, ByVal 0&, lDataBufferSize) = 0 Then
    If lValueType = REG_SZ Then
        strBuffer = Space$(lDataBufferSize)
        RegQueryValueExA hCurKey, strValue, 0&, 0&, ByVal strBuffer, lDataBufferSize
        GetValueData = LPSTRToVBString(strBuffer)
    End If
End If

RegCloseKey hCurKey
End Function

Public Function GetSettingByte(ByVal hKey As Long, ByVal strPath As String, ByVal strValueName As String) As Variant
    Dim lValueType As Long
    Dim byBuffer() As Byte
    Dim lDataBufferSize As Long
    Dim lRegResult As Long
    Dim hCurKey As Long
    ReDim byBuffer(0 To 1) As Byte
    byBuffer(0) = 0
    RegOpenKeyA hKey, strPath, hCurKey
    RegQueryValueExA hCurKey, strValueName, 0&, lValueType, ByVal 0&, lDataBufferSize
    If lRegResult = ERROR_SUCCESS Then
        If lValueType = 3 Then
            If lDataBufferSize = 0 Then
                ReDim byBuffer(0) As Byte
                byBuffer(0) = 0
                GetSettingByte = byBuffer
            Else
                ReDim byBuffer(lDataBufferSize - 1) As Byte
                lRegResult = RegQueryValueExA(hCurKey, strValueName, 0&, lValueType, byBuffer(0), lDataBufferSize)
                GetSettingByte = byBuffer
            End If
        End If
    Else
    End If
    lRegResult = RegCloseKey(hCurKey)
End Function

Public Function GetRootValue(sRoot As String) As Long
    Select Case sRoot
        Case "HKEY_CLASSES_ROOT": GetRootValue = &H80000000
        Case "HKEY_CURRENT_USER": GetRootValue = &H80000001
        Case "HKEY_LOCAL_MACHINE": GetRootValue = &H80000002
        Case "HKEY_USERS": GetRootValue = &H80000003
        Case "HKEY_CURRENT_CONFIG": GetRootValue = &H80000004
    End Select
End Function
