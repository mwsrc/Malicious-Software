Attribute VB_Name = "mGUI"
Option Explicit

Public Declare Sub ReleaseCapture Lib "user32" ()
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long

Public Sub FormDrag(frmDrag As Form)
Call ReleaseCapture
Call SendMessage(frmDrag.hwnd, &HA1, 2, 0&)
End Sub







