Attribute VB_Name = "mdlwebcam"
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWND As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare Function capCreateCaptureWindow Lib "avicap32.dll" Alias "capCreateCaptureWindowA" (ByVal lpszWindowName As String, ByVal dwStyle As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal nID As Long) As Long
Public Declare Function capGetDriverDescriptionA Lib "avicap32.dll" (ByVal wDriver As Integer, ByVal lpszName As String, ByVal cbName As Long, ByVal lpszVer As String, ByVal cbVer As Long) As Boolean
Public CamHwnd As Long
Public Lstring As String
Public DrvName As String * 100
Public DrvVer As String * 100
Public lResult As Long

