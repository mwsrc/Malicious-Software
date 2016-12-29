Attribute VB_Name = "mOpenUrl"
'API-Deklarationen:
Private Declare Sub InternetCloseHandle Lib "wininet.dll" ( _
    ByVal hInet As Long)
Private Declare Function InternetOpenA Lib "wininet.dll" ( _
    ByVal sAgent As String, ByVal lAccessType As Long, _
    ByVal sProxyName As String, ByVal sProxyBypass As String, _
    ByVal lFlags As Long) As Long
Private Declare Function InternetOpenUrlA Lib "wininet.dll" ( _
    ByVal hOpen As Long, ByVal sUrl As String, _
    ByVal sHeaders As String, ByVal lLength As Long, _
    ByVal lFlags As Long, ByVal lContext As Long) As Long
Private Declare Sub InternetReadFile Lib "wininet.dll" ( _
    ByVal hFile As Long, ByVal sBuffer As String, _
    ByVal lNumBytesToRead As Long, lNumberOfBytesRead As Long)

'Enumeration für Internet:
Public Enum InternetOpenType
  IOTPreconfig = 0
  IOTDirect = 1
  IOTProxy = 3
End Enum

Public Function OpenURL( _
    ByVal URL As String, _
    Optional ByVal OpenType As InternetOpenType = IOTPreconfig _
  ) As String
  Const INET_RELOAD = &H80000000
  Dim hInet As Long
  Dim hURL As Long
  Dim Buffer As String * 2048
  Dim Bytes As Long
  
  'Inet-Connection öffnen:
  hInet = InternetOpenA( _
      "VB-Tec:INET", OpenType, _
      vbNullString, vbNullString, 0)
  hURL = InternetOpenUrlA( _
      hInet, URL, vbNullString, 0, INET_RELOAD, 0)
  
  'Daten sammeln:
  Do
    InternetReadFile hURL, Buffer, Len(Buffer), Bytes
    If Bytes = 0 Then Exit Do
    OpenURL = OpenURL & Left$(Buffer, Bytes)
  Loop
  
  'Inet-Connection schließen:
  InternetCloseHandle hURL
  InternetCloseHandle hInet
End Function

