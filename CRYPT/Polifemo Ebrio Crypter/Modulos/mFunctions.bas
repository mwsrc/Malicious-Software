Attribute VB_Name = "mFunctions"
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Public File As String, Bin As String, Stb() As Byte, dEOF As String
Public Rc As New Rc4

Public Function ReadEOFData(sFilePath As String) As String
On Error GoTo Err:
 Dim sFileBuf As String, sEOFBuf As String, sChar As String
 Dim lFF As Long, lPos As Long, lPos2 As Long, lCount As Long
 
 If Dir(sFilePath) = "" Then GoTo Err:
 lFF = FreeFile
 Open sFilePath For Binary As #lFF
  sFileBuf = Space(LOF(lFF))
  Get #lFF, , sFileBuf
 Close #lFF
 
 lPos = InStr(1, StrReverse(sFileBuf), GetNullBytes(30))
 sEOFBuf = (Mid(StrReverse(sFileBuf), 1, lPos - 1))
 ReadEOFData = StrReverse(sEOFBuf)
 If frmMain.cEOF.Value = 1 Then If ReadEOFData = "" Then MsgBox "No EOF detected!", vbInformation, frmMain.Caption
 Exit Function

Err:
 ReadEOFData = vbNullString
End Function
Sub WriteEOFData(sFilePath As String, sEOFData As String)
 On Error Resume Next
  Dim sFileBuf As String, lFF As Long
   If Dir(sFilePath) = "" Then Exit Sub
   lFF = FreeFile
   Open sFilePath For Binary As #lFF
    sFileBuf = Space(LOF(lFF))
    Get #lFF, , sFileBuf
   Close #lFF
 
 Kill sFilePath
 lFF = FreeFile
 Open sFilePath For Binary As #lFF
   Put #lFF, , sFileBuf & sEOFData
 Close #lFF
End Sub
Public Function GetNullBytes(lNum) As String
 Dim sBuf As String, i As Integer
   For i = 1 To lNum
    sBuf = sBuf & Chr(0)
   Next
  GetNullBytes = sBuf
End Function


