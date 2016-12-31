Attribute VB_Name = "basAlwaysOnTop"
'----------------------------------------------------------------------------------------'
'
' Multi Downloader using multithreadings
' Created by Suk Yong Kim, 03/14/2001
'
' This project is my first project to upload to the PSC.
' Many persons contribute to create this project
' I really appreicate their efforts and codes and the great server PSC.
'
' if any question, mail to : techtrans@dreamwiz.com
'----------------------------------------------------------------------------------------'


Option Explicit
Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, _
    ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, _
    ByVal cy As Long, ByVal wFlags As Long) As Long

Public Sub putMeOnTop(Form As Form)
    SetWindowPos Form.hwnd, -1, 0, 0, 0, 0, 1 Or 2
End Sub


Public Sub takeMeDown(Form As Form)
    SetWindowPos Form.hwnd, -2, 0, 0, 0, 0, 1 Or 2
End Sub
