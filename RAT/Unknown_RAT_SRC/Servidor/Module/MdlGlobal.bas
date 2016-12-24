Attribute VB_Name = "MdlGlobal"
Option Explicit
Private Declare Function PathIsDirectory Lib "shlwapi.dll" Alias "PathIsDirectoryA" (ByVal pszPath As String) As Long
Private Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameA" (pOpenfilename As OPENFILENAME) As Long
Private Declare Function GetSaveFileName Lib "comdlg32.dll" Alias "GetSaveFileNameA" (pOpenfilename As OPENFILENAME) As Long
Private Declare Function SHSimpleIDListFromPath Lib "shell32" Alias "#162" (ByVal szPath As String) As Long
Private Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long
Public Declare Function SHGetFileInfo Lib "shell32" Alias "SHGetFileInfoA" (ByVal pszPath As Any, ByVal dwFileAttributes As Long, psfi As SHFILEINFO, ByVal cbFileInfo As Long, ByVal uFlags As Long) As Long
Public Declare Function LoadImage Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal dwImageType As Long, ByVal dwDesiredWidth As Long, ByVal dwDesiredHeight As Long, ByVal dwFlags As Long) As Long
Public Declare Function CreatePopupMenu Lib "user32" () As Long
Public Declare Function TrackPopupMenuEx Lib "user32" (ByVal hMenu As Long, ByVal wFlags As Long, ByVal X As Long, ByVal Y As Long, ByVal hwnd As Long, ByVal lptpm As Any) As Long
Public Declare Function AppendMenu Lib "user32" Alias "AppendMenuA" (ByVal hMenu As Long, ByVal wFlags As Long, ByVal wIDNewItem As Long, ByVal lpNewItem As Any) As Long
Public Declare Function DestroyMenu Lib "user32" (ByVal hMenu As Long) As Long
Public Declare Function GetCursorPos Lib "user32.dll" (ByRef lpPoint As POINTAPI) As Long
Public Declare Function CheckMenuRadioItem Lib "user32" (ByVal hMenu As Long, ByVal un1 As Long, ByVal un2 As Long, ByVal un3 As Long, ByVal un4 As Long) As Long
Public Declare Function ScreenToClient Lib "user32.dll" (ByVal hwnd As Long, ByRef lpPoint As POINTAPI) As Long
Public Declare Function ClientToScreen Lib "user32.dll" (ByVal hwnd As Long, ByRef lpPoint As POINTAPI) As Long
Public Declare Function SetWindowTheme Lib "uxtheme.dll" (ByVal hwnd As Long, ByVal pszSubAppName As Long, ByVal pszSubIdList As Long) As Long
Public Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long



Public Declare Function DestroyIcon Lib "user32" (ByVal hIcon As Long) As Long
Private Declare Function CLSIDFromString Lib "ole32" (ByVal str As Long, id As GUID) As Long
Private Declare Function SHGetImageList Lib "shell32.dll" (ByVal Flag As Long, id As GUID, lResult As Long) As Long

Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, ByVal lpSecurityAttributes As Long, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function ReadDirectoryChangesW Lib "kernel32.dll" (ByVal hDirectory As Long, ByVal lpBuffer As Long, ByVal nBufferLength As Long, ByVal bWatchSubtree As Boolean, ByVal dwNotifyFilter As Long, lpBytesReturned As Long, ByVal lpOverlapped As Long, ByVal lpCompletionRoutine As Long) As Long
Private Declare Function GetLogicalDriveStrings Lib "kernel32" Alias "GetLogicalDriveStringsA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (ByVal Destination As Long, ByVal Source As Long, ByVal Length As Long)

Private Declare Function RtlGetCompressionWorkSpaceSize Lib "NTDLL" (ByVal flags As Integer, WorkSpaceSize As Long, UNKNOWN_PARAMETER As Long) As Long
Private Declare Function NtAllocateVirtualMemory Lib "ntdll.dll" (ByVal ProcHandle As Long, BaseAddress As Long, ByVal NumBits As Long, regionsize As Long, ByVal flags As Long, ByVal ProtectMode As Long) As Long
Private Declare Function RtlCompressBuffer Lib "NTDLL" (ByVal flags As Integer, ByVal BuffUnCompressed As Long, ByVal UnCompSize As Long, ByVal BuffCompressed As Long, ByVal CompBuffSize As Long, ByVal UNKNOWN_PARAMETER As Long, OutputSize As Long, ByVal WorkSpace As Long) As Long
Private Declare Function RtlDecompressBuffer Lib "NTDLL" (ByVal flags As Integer, ByVal BuffUnCompressed As Long, ByVal UnCompSize As Long, ByVal BuffCompressed As Long, ByVal CompBuffSize As Long, OutputSize As Long) As Long
Private Declare Function NtFreeVirtualMemory Lib "ntdll.dll" (ByVal ProcHandle As Long, BaseAddress As Long, regionsize As Long, ByVal flags As Long) As Long
 


Public Enum SHIL_FLAG
  SHIL_LARGE = &H0      '   The image size is normally 32x32 pixels. However, if the Use large icons option is selected from the Effects section of the Appearance tab in Display Properties, the image is 48x48 pixels.
  SHIL_SMALL = &H1      '   These images are the Shell standard small icon size of 16x16, but the size can be customized by the user.
  SHIL_EXTRALARGE = &H2 '   These images are the Shell standard extra-large icon size. This is typically 48x48, but the size can be customized by the user.
  SHIL_SYSSMALL = &H3   '   These images are the size specified by GetSystemMetrics called with SM_CXSMICON and GetSystemMetrics called with SM_CYSMICON.
  SHIL_JUMBO = &H4      '   Windows Vista and later. The image is normally 256x256 pixels.
End Enum

Public Type POINTAPI
    X           As Long
    Y           As Long
End Type


Private Type OPENFILENAME
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

Private Const OFN_OVERWRITEPROMPT          As Long = &H2

Public Const SHGFI_LARGEICON               As Long = &H0
Public Const SHGFI_SMALLICON               As Long = &H1
Public Const SHGFI_OPENICON                As Long = &H2
Public Const SHGFI_SHELLICONSIZE           As Long = &H4
Public Const SHGFI_PIDL                    As Long = &H8
Public Const SHGFI_USEFILEATTRIBUTES       As Long = &H10
Public Const SHGFI_ICON                    As Long = &H100
Public Const SHGFI_DISPLAYNAME             As Long = &H200
Public Const SHGFI_TYPENAME                As Long = &H400
Public Const SHGFI_ATTRIBUTES              As Long = &H800
Public Const SHGFI_ICONLOCATION            As Long = &H1000
Public Const SHGFI_EXETYPE                 As Long = &H2000
Public Const SHGFI_SYSICONINDEX            As Long = &H4000
Public Const SHGFI_LINKOVERLAY             As Long = &H8000
Public Const SHGFI_SELECTED                As Long = &H10000
Public Const SHGFI_ATTR_SPECIFIED          As Long = &H20000

Public Const LR_LOADFROMFILE       As Long = &H10
Public Const IMAGE_ICON            As Long = 1


Public Const MF_APPEND             As Long = &H100&
Public Const MF_CHECKED            As Long = &H8&
Public Const MF_STRING             As Long = &H0&
Public Const MF_GRAYED             As Long = &H1&
Public Const MF_POPUP              As Long = &H10&
Public Const MF_SEPARATOR          As Long = &H800&
Public Const TPM_RETURNCMD         As Long = &H100&

Public Const MAX_PATH                      As Long = 260

Private Const FILE_SHARE_DELETE             As Long = &H4
Private Const FILE_SHARE_READ               As Long = &H1
Private Const FILE_SHARE_WRITE              As Long = &H2
Private Const FILE_LIST_DIRECTORY           As Long = &H1
Private Const OPEN_EXISTING                 As Long = &H3
Private Const FILE_FLAG_BACKUP_SEMANTICS    As Long = &H2000000
Private Const FILE_FLAG_OVERLAPPED          As Long = &H40000000
Private Const INVALID_HANDLE_VALUE          As Long = (-1)
Private Const FILE_NOTIFY_CHANGE_ALL        As Long = &H17F
Private Const FILE_ACTION_ADDED             As Long = &H1
Private Const FILE_ACTION_MODIFIED          As Long = &H3


Private Type OVERLAPPED
    Internal                        As Long
    InternalHigh                    As Long
    Offset                          As Long
    OffsetHigh                      As Long
    hEvent                          As Long
End Type

Private Type FILE_NOTIFY_INFORMATION
    dwNextEntryOffset               As Long
    dwAction                        As Long
    dwFileNameLength                As Long
    wcFileName(1023)                As Byte
End Type

Public Type SHFILEINFO
    hIcon         As Long
    iIcon         As Long
    dwAttributes  As Long
    szDisplayName As String * MAX_PATH
    szTypeName    As String * 80
End Type

Private Type DriveChange
    hDrive                          As Long
    sDrive                          As String
    Buff(0 To 1024 * 9 - 1)         As Byte
End Type

Private Type GUID
    Data1 As Long
    Data2 As Integer
    Data3 As Integer
    Data4(0 To 7) As Byte
End Type


Public Const Delimiter As String = "|"
Public Const END_DATA As String = "¡@#@!"

Public Enum ClassType
    enuClientInfo = 0
    enuExplorer = 1
    enuFileTransfer = 2
    enuWebCam = 3
    enuKeyLooger = 4
    enuConsole = 5
    enuRegistry = 6
    enuProcess = 7
    enuWindows = 8
    enuAudio = 9
    enuDesktop = 10
End Enum

Public SysImageListSmall As Long
Public SysImageListLarge As Long
Public SysImageListExtraLarge As Long

Public OS_Version       As Long
Public m_Port           As Long
Public IsInDrag         As Boolean
Public cColl            As Collection   'Coleccion de clases de conexiones, puede ser un ClsExplorer, ClsFileTranser o lo que se implemente en futuro
Public Id_List()        As String       'Array que contiene un orden de archivos listados.
Private aChange()       As DriveChange

Public Function DeCompress(Data() As Byte, dest() As Byte) As Long
    If UBound(Data) Then
        Dim lBufferSize As Long
        ReDim dest(UBound(Data) * 12.5)
        RtlDecompressBuffer 2, VarPtr(dest(0)), (UBound(Data) * 12.5), VarPtr(Data(0)), UBound(Data), lBufferSize
        If lBufferSize Then
            ReDim Preserve dest(lBufferSize - 1)
            DeCompress = lBufferSize - 1
        End If
    End If
End Function


Public Sub TerminateConnection(ByVal id As Long)
    On Error Resume Next
    FrmMain.RefreshList
    cColl.Remove (CStr(id))
End Sub

Public Sub DelegateConection(ByVal id As Long, Obj As Object)
    cColl.Remove (CStr(id))
    Obj.SocketID = id
    cColl.Add Obj, CStr(id)
End Sub

Public Function GetPathName(ByVal sPath As String) As String
    If Right$(sPath, 1) = "\" Then sPath = Left$(sPath, Len(sPath) - 1)
    GetPathName = Right(sPath, Len(sPath) - InStrRev(sPath, "\"))
End Function

Public Function GetPathFileName(ByVal sPath As String) As String
    GetPathFileName = Right(sPath, Len(sPath) - InStrRev(sPath, "\"))
End Function

Public Function GetDirFromPath(ByVal sPath As String) As String
    If Right$(sPath, 1) = "\" Then sPath = Left$(sPath, Len(sPath) - 1)
    GetDirFromPath = Left(sPath, InStrRev(sPath, "\"))
End Function

Public Function PathIsFolder(ByVal sPath As String) As Boolean
    PathIsFolder = CBool(PathIsDirectory(sPath))
End Function


Public Function ShowSaveFile(ByVal hOwner As Long, ByVal Filename As String) As String
    Dim OFName As OPENFILENAME

     With OFName
        .hwndOwner = hOwner
        .flags = OFN_OVERWRITEPROMPT
        .lStructSize = Len(OFName)
        .hInstance = App.hInstance
        .nMaxFile = 255
        .lpstrFile = Filename & String$(254 - Len(Filename), Chr$(0))
        .lpstrDefExt = Right(Filename, Len(Filename) - InStrRev(Filename, "."))
     End With
    
     If GetSaveFileName(OFName) Then
        ShowSaveFile = Left$(OFName.lpstrFile, InStr(OFName.lpstrFile, Chr$(0)) - 1)
     End If
     
End Function

Public Function GetIconFlagByCode(ByVal sCode As String) As Long
    
    Const Country_Code = "ad,ae,af,ag,ai,al,am,an,ao,ar,as,at,au,aw,ax,az,ba,bb,bd,be,bf,bg,bh,bi,bj,bm,bn,bo,br,bs,bt,bv,bw,by,bz,ca,catalonia," & _
                            "cc,cd,cf,cg,ch,ci,ck,cl,cm,cn,co,cr,cs,cu,cv,cx,cy,cz,de,dj,dk,dm,do,dz,ec,ee,eg,eh,england,er,es,et,europeanunion,fam," & _
                            "fi,fj,fk,fm,fo,fr,ga,gb,gd,ge,gf,gh,gi,gl,gm,gn,gp,gq,gr,gs,gt,gu,gw,gy,hk,hm,hn,hr,ht,hu,id,ie,il,in,io,iq,ir,is,it,jm," & _
                            "jo,jp,ke,kg,kh,ki,km,kn,kp,kr,kw,ky,kz,la,lb,lc,li,lk,lr,ls,lt,lu,lv,ly,ma,mc,md,me,mg,mh,mk,ml,mm,mn,mo,mp,mq,mr,ms,mt,mu," & _
                            "mv,mw,mx,my,mz,na,nc,ne,nf,ng,ni,nl,no,np,nr,nu,nz,om,pa,pe,pf,pg,ph,pk,pl,pm,pn,pr,ps,pt,pw,py,qa,re,ro,rs,ru,rw,sa,sb,sc," & _
                            "scotland,sd,se,sg,sh,si,sj,sk,sl,sm,sn,so,sr,st,sv,sy,sz,tc,td,tf,tg,th,tj,tk,tl,tm,tn,to,tr,tt,tv,tw,tz,ua,ug,um,us,uy,uz,va," & _
                            "vc,ve,vg,vi,vn,vu,wales,wf,ws,ye,yt,za,zm,zw"
    Dim vCode() As String
    Dim i As Long
                        
    sCode = LCase(sCode)
    
    vCode = Split(Country_Code, ",")
    
    For i = 0 To UBound(vCode)
        If sCode = vCode(i) Then
            GetIconFlagByCode = i
            Exit Function
        End If
    Next
    
    GetIconFlagByCode = i
End Function

Public Function GetFileAttString(ByVal hAttr As Long) As String
    If (hAttr And vbReadOnly) = vbReadOnly Then GetFileAttString = "R"
    If (hAttr And vbHidden) = vbHidden Then GetFileAttString = GetFileAttString & "H"
    If (hAttr And vbSystem) = vbSystem Then GetFileAttString = GetFileAttString & "S"
    If (hAttr And vbArchive) = vbArchive Then GetFileAttString = GetFileAttString & "A"
    If (hAttr And &H800) = &H800 Then GetFileAttString = GetFileAttString & "C"
End Function

Public Function ShowOpenFile(ByVal hOwner As Long) As String
    Dim OFName As OPENFILENAME
 
    With OFName
        .hwndOwner = hOwner
       .lStructSize = Len(OFName)
       .hInstance = App.hInstance
       .lpstrFile = String$(254, Chr$(0))
       .nMaxFile = 255
    End With

    If GetOpenFileName(OFName) Then
       ShowOpenFile = Left$(OFName.lpstrFile, InStr(OFName.lpstrFile, Chr$(0)) - 1)
    End If
End Function

Public Function GetFileSize(Filename As String) As Currency
    On Error Resume Next
    Dim ExtValue As Currency
    Dim FstValue As Long
    
    FstValue = FileLen(Filename)
    
    If FstValue < 0 Then
        GetFileSize = (2147483648# * 2) + FstValue
    Else
        GetFileSize = FstValue
    End If
End Function

Public Function GetFormatSizeFile(ByVal Bytes As Currency) As String
    If Bytes >= 1024 Then
        If Bytes >= 1073741824 Then
            GetFormatSizeFile = Format((Bytes / 1073741824), "##,###,##0.00") & " GB"
        Else
            If Bytes >= 1048576 Then
                GetFormatSizeFile = Format((Bytes / 1048576), "##,###,##0.00") & " MB"
            Else
                GetFormatSizeFile = Format((Bytes \ 1024), "##,###,##0") & " KB"
            End If
        End If
    Else
        GetFormatSizeFile = Format(Bytes, "##,###,##0") & " Bytes"
    End If
End Function

'Public Function GetSystemImageList(ByVal uSize As Long) As Long
'    Dim uSHFI As SHFILEINFO
'    GetSystemImageList = SHGetFileInfo("C:\", 0, uSHFI, Len(uSHFI), SHGFI_SYSICONINDEX Or uSize)
'End Function

Public Function GetSystemImageList(ByVal lFlag As SHIL_FLAG) As Long
    Dim IID_IImageList As GUID
    Dim uSHFI As SHFILEINFO
    
    On Error GoTo Handler
    
    CLSIDFromString StrPtr("{46EB5926-582E-4017-9FDF-E8998DAA0950}"), IID_IImageList
    SHGetImageList lFlag, IID_IImageList, GetSystemImageList
    
    If GetSystemImageList Then Exit Function
    
Handler:
    GetSystemImageList = SHGetFileInfo("C:\", 0, uSHFI, Len(uSHFI), SHGFI_SYSICONINDEX Or lFlag)

End Function


'Public Function GetPathFromIDList(ByVal IDL As Long) As String
'    Dim sPath        As String * 512
'    Call SHGetPathFromIDList(ByVal IDL, ByVal sPath$)
'    GetPathFromIDList = Left$(sPath, InStr(sPath, Chr$(0)) - 1)
'End Function

'Public Function GetIDListFromPath(ByVal sPath As String) As String
'    GetIDListFromPath = SHSimpleIDListFromPath(StrConv(sPath, vbUnicode))
'End Function


Public Function GetIDListFromPath(ByVal sPath As String) As Long
    Dim i As Long
    Dim lCount As Long
    
    lCount = UBound(Id_List)
    
    For i = 0 To lCount
        If Id_List(i) = sPath Then
            GetIDListFromPath = i
            Exit Function
        End If
    Next
    lCount = lCount + 1
    
    ReDim Preserve Id_List(lCount)
    Id_List(lCount) = sPath
    GetIDListFromPath = lCount
    
End Function

Public Function GetPathFromIDList(ByVal IDL As Long) As String
    If IDL > 0 And IDL <= UBound(Id_List) Then GetPathFromIDList = Id_List(IDL)
End Function

Public Sub NormalizePath(sData As String)
    sData = IIf(Right$(sData, 1) = "\", sData, sData & "\")
End Sub


Public Sub StartWatching()
    Dim lRet As Long
    Dim sBuff As String * 255
    Dim arrDrive() As String
    Dim lPos As Long
    Dim i As Long
    Dim tOLAP As OVERLAPPED
    
    lRet = GetLogicalDriveStrings(255, sBuff)

    arrDrive = Split(Left$(sBuff, lRet - 1), Chr$(0))

    For i = 0 To UBound(arrDrive)
        lRet = CreateFile(arrDrive(i), FILE_LIST_DIRECTORY, FILE_SHARE_READ Or FILE_SHARE_DELETE Or FILE_SHARE_WRITE, 0&, OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS Or FILE_FLAG_OVERLAPPED, 0&)
    
        If lRet <> INVALID_HANDLE_VALUE Then
            ReDim Preserve aChange(lPos)
            aChange(lPos).hDrive = lRet
            aChange(lPos).sDrive = arrDrive(i)
            lPos = lPos + 1
        End If
    Next
    
    For i = 0 To UBound(aChange)
        Call ReadDirectoryChangesW(aChange(i).hDrive, VarPtr(aChange(i).Buff(0)), 9216, True, FILE_NOTIFY_CHANGE_ALL, 0&, VarPtr(tOLAP), 0&)
    Next
    
End Sub

Public Function GetDestination(ByVal sName As String) As String
    Dim i As Long
    Dim sData As String
    Dim lPos As Long
    Dim lRet As Long
    Dim tFNI As FILE_NOTIFY_INFORMATION
    Dim tOLAP As OVERLAPPED
    
    Dim SafeCounter As Long
    
    Do While SafeCounter < 1000

        For i = 0 To UBound(aChange)
            lPos = 0
            
            Do
                Call CopyMemory(VarPtr(tFNI), VarPtr(aChange(i).Buff(lPos)), Len(tFNI))
    
                sData = Left$(tFNI.wcFileName, tFNI.dwFileNameLength / 2)
     
                If tFNI.dwAction = FILE_ACTION_ADDED Or tFNI.dwAction = FILE_ACTION_MODIFIED Then
                    If InStr(sData, sName) Then
                        GetDestination = aChange(i).sDrive & sData
                        GoTo StopWatching
                    End If
                End If
                
                If tFNI.dwNextEntryOffset = 0 Then Exit Do
                
                lPos = lPos + tFNI.dwNextEntryOffset
            Loop
            
            Call ReadDirectoryChangesW(aChange(i).hDrive, VarPtr(aChange(i).Buff(0)), 9216, True, FILE_NOTIFY_CHANGE_ALL, 0&, VarPtr(tOLAP), 0&)
        
            DoEvents
        Next
        SafeCounter = SafeCounter + 1
        
    Loop
    
    Debug.Print "Error or Cancel"
    
StopWatching:

    For i = 0 To UBound(aChange)
        Call CloseHandle(aChange(i).hDrive)
    Next
    
    Erase aChange
    
End Function

