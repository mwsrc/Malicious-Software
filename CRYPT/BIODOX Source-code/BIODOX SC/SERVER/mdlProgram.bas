Attribute VB_Name = "mdlProgram"
Private Declare Function RegQueryValueExA Lib "advapi32" (ByVal HKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Private Declare Function RegOpenKeyExA Lib "advapi32" (ByVal HKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32" (ByVal HKey As Long) As Long
Private Declare Function RegEnumKeyExA Lib "advapi32" (ByVal HKey As Long, ByVal dwIndex As Long, ByVal lpName As String, lpcbName As Long, ByVal lpReserved As Long, ByVal lpClass As String, lpcbClass As Long, lpftLastWriteTime As Any) As Long

Public Function GetInstalledApps() As String
    Dim hParentKey As Long
    Dim HSubKey As Long
    Dim lIndex As Long
    Dim sAppID As String
    Dim lAppID As Long
    Dim sAppName As String
    Dim sAppVer As String
    Dim sAppPub As String
    Dim sAppUns As String
    Dim lAppName As Long
    Dim lAppVer As Long
    Dim lAppPub As Long
    Dim lAppUns As Long
    Dim ValueType As Long

    UbRetArray = -1
    If RegOpenKeyExA(&H80000002, "Software\Microsoft\Windows\CurrentVersion\Uninstall", 0, &H8, hParentKey) = 0 Then
        sAppID = Space(64)
        lAppID = 64
        Do While RegEnumKeyExA(hParentKey, lIndex, sAppID, lAppID, 0, vbNullString, 0, vbNull) = 0
            sAppID = Left(sAppID, lAppID)
            If RegOpenKeyExA(hParentKey, sAppID, 0, &H1, HSubKey) = 0 Then
                lAppName = 0
                If RegQueryValueExA(HSubKey, "DisplayName", 0, ValueType, ByVal 0, lAppName) = 0 Then
                    If ValueType = 1 Then
                        RegQueryValueExA HSubKey, "DisplayVersion", 0, 0, ByVal 0, lAppVer
                        RegQueryValueExA HSubKey, "Publisher", 0, 0, ByVal 0, lAppPub
                        RegQueryValueExA HSubKey, "UninstallString", 0, 0, ByVal 0, lAppUns

                        sAppName = Space(lAppName)
                        sAppVer = Space(lAppVer)
                        sAppPub = Space(lAppPub)
                        sAppUns = Space(lAppUns)

                        RegQueryValueExA HSubKey, "DisplayName", 0, 0, ByVal sAppName, lAppName
                        RegQueryValueExA HSubKey, "DisplayVersion", 0, 0, ByVal sAppVer, lAppVer
                        RegQueryValueExA HSubKey, "Publisher", 0, 0, ByVal sAppPub, lAppPub
                        RegQueryValueExA HSubKey, "UninstallString", 0, 0, ByVal sAppUns, lAppUns

                        GetInstalledApps = GetInstalledApps & _
                                            LPSTRToVBString(sAppName) & Chr(0) & _
                                            LPSTRToVBString(sAppVer) & Chr(0) & _
                                            LPSTRToVBString(sAppPub) & Chr(0) & _
                                            LPSTRToVBString(sAppUns) & Chr(255)
                    End If
                End If
                RegCloseKey HSubKey
                HSubKey = 0
            End If
            lIndex = lIndex + 1
            sAppID = Space(64)
            lAppID = 64
        Loop
        RegCloseKey hParentKey
    End If
End Function

