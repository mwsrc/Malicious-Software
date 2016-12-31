Attribute VB_Name = "Registry"
' _______________________________________
'|             Registry.bas              |
'|  ©2000 by SHADOWare, Thomas Bachem    |
'|                                       |
'|  Mit Hilfe dieses Moduls kann ganz    |
'|  leicht mit der Registry gearbeitet   |
'|  werden.                              |
'|  Bei Verwendung in eigenen Projekten  |
'|  muss dieser Copyright-Hinweis be-    |
'|  stehen bleiben.                      |
' ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯


'Registry-Schüssel
Public Const HKEY_CLASSES_ROOT = &H80000000
Public Const HKEY_CURRENT_USER = &H80000001
Public Const HKEY_LOCAL_MACHINE = &H80000002
Public Const HKEY_USERS = &H80000003
Public Const HKEY_PERFORMANCE_DATA = &H80000004
Public Const HKEY_CURRENT_CONFIG = &H80000005
Public Const HKEY_DYN_DATA = &H80000006

'Rückgabewerte
Public Const REG_SZ = 1
Public Const REG_BINARY = 3
Public Const REG_DWORD = 4
Public Const ERROR_SUCCESS = 0&

'API-Deklarationen
Public Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Public Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hKey As Long, ByVal lpSubKey As String) As Long
Public Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long
Public Declare Function RegEnumKey Lib "advapi32.dll" Alias "RegEnumKeyA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpName As String, ByVal cbName As Long) As Long
Public Declare Function RegEnumValue Lib "advapi32.dll" Alias "RegEnumValueA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpValueName As String, lpcbValueName As Long, lpReserved As Long, lpType As Long, lpData As Byte, lpcbData As Long) As Long
Public Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Public Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long

'Neuen Registry-Schlüssel anlegen
'Beispiel:   CreateKey HKEY_LOCAL_MACHINE, "Software\SHADOWare"
Public Sub CreateKey(hKey As Long, strPath As String)
   Dim hCurKey As Long
   Dim lRegResult As Long
   
   lRegResult = RegCreateKey(hKey, strPath, hCurKey)
   If lRegResult <> ERROR_SUCCESS Then
      'Irgendetwas ist schiefgegangen
   End If
   lRegResult = RegCloseKey(hCurKey)
End Sub

'Bestehenden Registry-Schlüssel entfernen
'Beispiel:   DeleteKey HKEY_LOCAL_MACHINE, "Software\SHADOWare"
Public Sub DeleteKey(ByVal hKey As Long, ByVal strPath As String)
   Dim lRegResult As Long
   lRegResult = RegDeleteKey(hKey, strPath)
End Sub

'Bestehenden Registry-Eintrag entfernen
'Beispiel:   DeleteValue HKEY_LOCAL_MACHINE, "Software\SHADOWare", "Eintrag"
Public Sub DeleteValue(ByVal hKey As Long, ByVal strPath As String, ByVal strValue As String)
   Dim hCurKey As Long
   Dim lRegResult As Long
   
   lRegResult = RegOpenKey(hKey, strPath, hCurKey)
   lRegResult = RegDeleteValue(hCurKey, strValue)
   lRegResult = RegCloseKey(hCurKey)
End Sub

'Registry-Eintrag auslesen (String, "normaler" Eintrag)
'Beispiel:   Variable = GetSettingString(HKEY_LOCAL_MACHINE, "Software\SHADOWare", "Eintrag", "Vorgabe")
'(die Vorgabe wird zurückgegeben, wenn der Eintrag nicht existiert)
Public Function GetSettingString(hKey As Long, strPath As String, strValue As String, Optional Default As String) As String
   Dim hCurKey As Long
   Dim lValueType As Long
   Dim strBuffer As String
   Dim lDataBufferSize As Long
   Dim intZeroPos As Integer
   Dim lRegResult As Long
   
   If Not IsEmpty(Default) Then
     GetSettingString = Default
   Else
     GetSettingString = ""
   End If
   lRegResult = RegOpenKey(hKey, strPath, hCurKey)
   lRegResult = RegQueryValueEx(hCurKey, strValue, 0&, lValueType, ByVal 0&, lDataBufferSize)
   If lRegResult = ERROR_SUCCESS Then
      If lValueType = REG_SZ Then
         strBuffer = String(lDataBufferSize, " ")
         lRegResult = RegQueryValueEx(hCurKey, strValue, 0&, 0&, ByVal strBuffer, lDataBufferSize)
         intZeroPos = InStr(strBuffer, Chr$(0))
         If intZeroPos > 0 Then
            GetSettingString = Left$(strBuffer, intZeroPos - 1)
         Else
            GetSettingString = strBuffer
         End If
      End If
   Else
      'Irgendetwas ist schiefgegangen
   End If
   lRegResult = RegCloseKey(hCurKey)
End Function

'Registry-Eintrag anlegen/verändern (String, "normaler" Eintrag)
'Beispiel:   SaveSettingString HKEY_LOCAL_MACHINE, "Software\SHADOWare", "Eintrag", "Wert"
Public Sub SaveSettingString(hKey As Long, strPath As String, strValue As String, strData As String)
   Dim hCurKey As Long
   Dim lRegResult As Long
   
   lRegResult = RegCreateKey(hKey, strPath, hCurKey)
   lRegResult = RegSetValueEx(hCurKey, strValue, 0, REG_SZ, ByVal strData, Len(strData))
   If lRegResult <> ERROR_SUCCESS Then
      'Irgendetwas ist schiefgegangen
   End If
   lRegResult = RegCloseKey(hCurKey)
End Sub


