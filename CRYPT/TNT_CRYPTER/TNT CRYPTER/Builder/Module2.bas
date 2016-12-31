Attribute VB_Name = "Module2"
Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long

Global FFFile As String
Global patcher As Integer
Global Icopath As String
Global Exepath As String

Global CpuName As String

Global gene As Double

Global SharK2 As Boolean
Global SharK3 As Boolean
Global PI As Boolean
Global Bifrost As Boolean



Declare Function GetWindowLong Lib "user32.dll" _
Alias "GetWindowLongA" ( _
ByVal hwnd As Long, _
ByVal nIndex As Long) As Long

Declare Function SetWindowLong Lib "user32.dll" _
Alias "SetWindowLongA" ( _
ByVal hwnd As Long, _
ByVal nIndex As Long, _
ByVal dwNewLong As Long) As Long

Declare Function SetLayeredWindowAttributes Lib "user32.dll" ( _
ByVal hwnd As Long, _
ByVal crKey As Long, _
ByVal bAlpha As Byte, _
ByVal dwFlags As Long) As Long

       Declare Function SendMessageByNum Lib "user32" _
        Alias "SendMessageA" (ByVal hwnd As Long, ByVal _
        wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
      Const LB_SETHORIZONTALEXTENT = &H194

Public Const GWL_EXSTYLE = (-20)
Public Const WS_EX_LAYERED = &H80000







' zunächst die benötigte API-Deklaration
 Declare Function SendMessage Lib "user32" _
  Alias "SendMessageA" ( _
  ByVal hwnd As Long, _
  ByVal wMsg As Long, _
  ByVal wParam As Long, _
  ByVal lParam As Long) As Long
 
 Declare Sub Sleep Lib "kernel32" ( _
  ByVal dwMilliseconds As Long)
 
Const PBM_SETBARCOLOR = &H409

