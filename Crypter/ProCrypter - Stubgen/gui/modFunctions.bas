Attribute VB_Name = "modFunctions"
Public Declare Function UpdateResource Lib "kernel32" Alias "UpdateResourceA" (ByVal hUpdate As Long, ByVal lpType As Long, ByVal lpName As Long, ByVal wLanguage As Long, lpData As Any, ByVal cbData As Long) As Long
Public Declare Function BeginUpdateResource Lib "kernel32" Alias "BeginUpdateResourceA" (ByVal pFileName As String, ByVal bDeleteExistingResources As Long) As Long
Public Declare Function EndUpdateResource Lib "kernel32" Alias "EndUpdateResourceA" (ByVal hUpdate As Long, ByVal fDiscard As Long) As Long
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Public Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameA" (pOpenFilename As OPENFILENAME) As Long
Public Declare Function GetSaveFileName Lib "comdlg32.dll" Alias "GetSaveFileNameA" (pOpenFilename As OPENFILENAME) As Long

Public Type OPENFILENAME
    lStructSize As Long
    hwndOwner As Long
    hInstance As Long
    lpstrFilter As String
    lpstrCustomFilter As String
    nMaxCustFilter As Long
    nFilterIndex As Long
    lpstrFile As String
    nMaxFile As Long
    lpstrFileTitle As String
    nMaxFileTitle As Long
    lpstrInitialDir As String
    lpstrTitle As String
    flags As Long
    nFileOffset As Integer
    nFileExtension As Integer
    lpstrDefExt As String
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
End Type

Private Const RT_ICON = 3&
Private Const RT_GROUP_ICON = 14

Private Type CursorOrIcon
    Reserved As Integer
    wType As Integer
    Count As Integer
End Type

Private Type ICONDIRENTRY
   bWidth As Byte
   bHeight As Byte
   bColorCount As Byte
   bReserved As Byte
   wPlanes As Integer
   wBitCount As Integer
   dwBytesInRes As Long
   dwImageOffset As Long
End Type

Private Type MEMICONDIRENTRY
   bWidth As Byte
   bHeight As Byte
   bColorCount As Byte
   bReserved As Byte
   wPlanes As Integer
   wBitCount As Integer
   dwBytesInRes As Long
   nID As Integer
End Type

Private Type BITMAPINFOHEADER '40 bytes
    a_Size As Long '=40
    b_Width As Long
    b_Height As Long
    c_Planes As Integer
    d_BitCount As Integer
    e_Compression As Long
    f_SizeImage As Long
    g_XPelsPerMeter As Long
    g_YPelsPerMeter As Long
    h_ClrUsed As Long
    i_ClrImportant As Long
End Type

Dim x_OpenFilename As OPENFILENAME
Dim OpenFile As OPENFILENAME
Dim lReturn As Long
Dim sFilter As String
Dim ICO As CursorOrIcon
Dim Bitm As BITMAPINFOHEADER
Dim IconR() As ICONDIRENTRY
Dim IconE() As MEMICONDIRENTRY
Dim Pic() As Byte
Dim mas() As Byte

Public Function Browse(strFilter As String) As String
    OpenFile.lStructSize = Len(OpenFile)
    OpenFile.hwndOwner = frmMain.hWnd
    OpenFile.hInstance = App.hInstance
    sFilter = "File (*." & strFilter & ")" & Chr(0) & "*." & UCase(strFilter) & Chr(0)
    OpenFile.lpstrFilter = sFilter
    OpenFile.nFilterIndex = 1
    OpenFile.lpstrFile = String(257, 0)
    OpenFile.nMaxFile = Len(OpenFile.lpstrFile) - 1
    OpenFile.lpstrFileTitle = OpenFile.lpstrFile
    OpenFile.nMaxFileTitle = OpenFile.nMaxFile
    OpenFile.lpstrInitialDir = App.Path & "\"
    OpenFile.flags = 0
    lReturn = GetOpenFileName(OpenFile)
    If lReturn = 0 Then
        Exit Function
    Else
        Browse = Trim(OpenFile.lpstrFile)
    End If
End Function

Public Function ShowSaveFileDialog(ByVal sFilter As String, Optional ByVal sDefExt As String, Optional ByVal sInitDir As String, Optional ByVal lFlags As Long, Optional ByVal hParent As Long) As String
    Dim OFN As OPENFILENAME
    On Error Resume Next
    
    With OFN
        .lStructSize = Len(OFN)
        .hwndOwner = hParent
        .lpstrFilter = Replace(sFilter, "|", vbNullChar) & vbNullChar
        .lpstrFile = Space$(255) & vbNullChar & vbNullChar
        .nMaxFile = Len(.lpstrFile)
        .flags = lFlags
        .lpstrInitialDir = sInitDir
        .lpstrDefExt = sDefExt
    End With
    
    If GetSaveFileName(OFN) Then
        ShowSaveFileDialog = Left$(OFN.lpstrFile, InStr(OFN.lpstrFile, vbNullChar) - 1)
    End If
End Function

    Public Function GenActiveX() As String
     Dim iChr As Integer
     Dim c As Long
     Dim strResult As String
     Dim iAsc As String
     Randomize Timer
     
     For i = 1 To 5 'ActiveX contains 5 parts
        
        If i = 1 Then lngLength = 8
        If i = 2 Then lngLength = 4
        If i = 3 Then lngLength = 4
        If i = 4 Then lngLength = 4
        If i = 5 Then lngLength = 12
        
        For c = 1 To lngLength
          iAsc = Int(3 * Rnd + 1)
          Select Case iAsc
            Case 1
              iChr = Int((Asc("F") - Asc("A") + 1) * Rnd + Asc("A"))
            Case 2
              iChr = Int((Asc("f") - Asc("a") + 1) * Rnd + Asc("a"))
            Case 3
              iChr = Int((Asc("9") - Asc("0") + 1) * Rnd + Asc("0"))
          End Select
          strResult = strResult & Chr(iChr)
        Next c
        If i <> 5 Then strResult = strResult & "-"
     Next i
     
     GenActiveX = UCase("{" & strResult & "}")
    End Function

    Public Function File2Str(file As String) As String
        Dim ff As Long
        ff = FreeFile
        
        Open file For Binary Access Read As ff
            File2Str = Input(FileLen(file), ff)
        Close ff
    End Function
    
    Public Function FileExists(fname) As Boolean
        On Local Error Resume Next
            Dim ff
            ff = FreeFile
        Open fname For Input As ff
            If Err Then
            FileExists = False
            Else
            FileExists = True
            End If
        Close ff
    End Function
    
    Public Function EncryptFile(Fil As String)
        Dim arr() As Byte
        Dim str As String
        
        If FileExists(Fil) = False Then End
        str = File2Str(Fil)
        arr = StrConv(EncryptData(str, "872636564726772", False), vbFromUnicode)
        
        Kill Fil
        ff = FreeFile
        Open Fil For Binary Access Write As ff
            Put ff, , arr
        Close ff
    End Function

Public Sub ReplaceIcon(sFileName As String, sIconName As String)
    Dim h As Long
    Dim FileName As String
    FileName = sFileName
    h = BeginUpdateResource(FileName, False)
    Open sIconName For Binary As #1
    Get #1, , ICO
    ReDim IconE(ICO.Count)
    ReDim IconR(ICO.Count)
    For i = 0 To ICO.Count - 1
        Get #1, , IconR(i)
        IconE(i).bColorCount = IconR(i).bColorCount
        IconE(i).bHeight = IconR(i).bHeight
        IconE(i).bReserved = IconR(i).bReserved
        IconE(i).bWidth = IconR(i).bWidth
        IconE(i).dwBytesInRes = IconR(i).dwBytesInRes
        IconE(i).wBitCount = IconR(i).wBitCount
        IconE(i).wPlanes = IconR(i).wPlanes
        IconE(i).nID = i + 1
    Next i
    
    For i = 0 To ICO.Count - 1
        Get #1, IconR(i).dwImageOffset + 1, Bitm
        ReDim Pic(IconR(i).dwBytesInRes)
        Get #1, , Pic
        ReDim mas(IconR(i).dwBytesInRes + Len(Bitm))
        CopyMemory mas(0), Bitm, Len(Bitm)
        CopyMemory mas(Len(Bitm)), Pic(0), IconR(i).dwBytesInRes
        Call UpdateResource(h, ByVal RT_ICON, i + 1, 0, mas(0), IconR(i).dwBytesInRes + Len(Bitm))   '1252 - ????
    Next i
    ReDim mas(Len(ICO) + Len(IconE(1)) * ICO.Count)
    CopyMemory mas(0), ICO, Len(ICO)
    For i = 0 To ICO.Count - 1
        Offset = Len(ICO) + Len(IconE(1)) * i
        CopyMemory mas(Offset), IconE(i), Len(IconE(i))
    Next i
    Call UpdateResource(h, ByVal RT_GROUP_ICON, 1, 0, mas(0), Len(ICO) + Len(IconE(1)) * ICO.Count)     '1252 - ????
    Call EndUpdateResource(h, 0)
    Close #1
End Sub

