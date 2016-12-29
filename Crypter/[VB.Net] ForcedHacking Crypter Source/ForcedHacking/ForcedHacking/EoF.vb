Imports System.IO
Imports System.Runtime.InteropServices
Module EoF

    Public Function ReadData(ByRef FilePath As String) As String
        On Error GoTo Err_Renamed
        Dim sEOFBuf, sFileBuf, sChar As String
        Dim lPos2, lFF, lPos, lCount As Integer
        If Dir(FilePath) = "" Then GoTo Err_Renamed
        lFF = FreeFile()
        FileOpen(lFF, FilePath, OpenMode.Binary)
        sFileBuf = Space(LOF(lFF))
        FileGet(lFF, sFileBuf)
        FileClose(lFF)
        lPos = InStr(1, StrReverse(sFileBuf), GetNullBytes(30))
        sEOFBuf = (Mid(StrReverse(sFileBuf), 1, lPos - 1))
        ReadData = StrReverse(sEOFBuf)
        If ReadData = "" Then
        End If
        Exit Function
Err_Renamed:
        ReadData = vbNullString
    End Function

    Public Function GetNullBytes(ByRef lNum As Object) As String
        Dim sBuf As String = ""
        Dim i As Short
        For i = 1 To lNum
            sBuf = sBuf & Chr(0)
        Next
        GetNullBytes = sBuf
    End Function

    Sub WriteData(ByRef FilePath As String, ByRef EOFData As String)
        Dim sFileBuf As String
        Dim lFF As Integer
        On Error Resume Next
        If Dir(FilePath) = "" Then Exit Sub
        lFF = FreeFile()
        FileOpen(lFF, FilePath, OpenMode.Binary)
        sFileBuf = Space(LOF(lFF))
        FileGet(lFF, sFileBuf)
        FileClose(lFF)
        Kill(FilePath)
        lFF = FreeFile()
        FileOpen(lFF, FilePath, OpenMode.Binary)
        FilePut(lFF, sFileBuf & EOFData)
        FileClose(lFF)
    End Sub

    Private Function CheckEoF(ByVal FilePath As String) As Boolean
        If EoF.ReadData(FilePath) = vbNullString Then
            Return False
        Else
            Return True
        End If
    End Function

End Module

