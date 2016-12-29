Attribute VB_Name = "kaynak"
Public Declare Function ReleaseCapture Lib "user32" () As Long
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Const HTCAPTION = 2
Public Const WM_NCLBUTTONDOWN = &HA1
Public Const WM_SYSCOMMAND = &H112
Public Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal CX As Long, ByVal CY As Long, ByVal wFlags As Long) As Long
Public Declare Function SetWindowText Lib "user32" Alias "SetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String) As Long
Public Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Public Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hWnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Public Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hWnd As Long, ByVal crKey As Byte, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Public bGet As Boolean
Public bSet As Boolean
Public Const HDS_BUTTONS = &H2
Public Const GWL_STYLE = (-16)
Const SWP_DRAWFRAME = &H20
Const SWP_NOMOVE = &H2
Const SWP_NOSIZE = &H1
Const SWP_NOZORDER = &H4
Public Const COLOR_WINDOW = 5
Public Const COLOR_WINDOWTEXT = 8
Public Const SWP_FLAGS = SWP_NOZORDER Or SWP_NOSIZE Or SWP_NOMOVE Or SWP_DRAWFRAME
Public Const SW_NORMAL = 1
Public Const SW_SHOWMAXIMIZED = 3
Public Const SW_SHOWDEFAULT = 10
Public Const SW_SHOWNOACTIVATE = 4
Public Const SW_SHOWNORMAL = 1
Public Const LVM_FIRST = &H1000
Public Const LVM_GETHEADER = (LVM_FIRST + 31)


Public Const GWL_EXSTYLE = -20
Public Const LWA_COLORKEY = &H1
Public Const LWA_ALPHA = &H2&
Public Const WS_EX_LAYERED = &H80000
Public Const WS_EX_TRANSPARENT = &H20&

 
Public Sub SaydamYap(frm As Form, SeffaflikDerecesi As Integer)
Dim stil As Long
stil = GetWindowLong(frm.hWnd, GWL_EXSTYLE)

If (stil And WS_EX_LAYERED) = 0 Then
     SetWindowLong frm.hWnd, GWL_EXSTYLE, stil Or WS_EX_LAYERED
    SetLayeredWindowAttributes frm.hWnd, 0, SeffaflikDerecesi, LWA_ALPHA
End If
End Sub

Public Function tasi(Form As Form)
Call ReleaseCapture
SendMessage Form.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
End Function

Public Function XORSifreCoz(CodeKey As String, DataIn As String) As String
Dim lonDataPtr As Long
Dim strDataOut As String
Dim intXOrValue1 As Integer
Dim intXOrValue2 As Integer
For lonDataPtr = 1 To (Len(DataIn) / 2)
intXOrValue1 = Val("&H" & (Mid$(DataIn, (2 * lonDataPtr) - 1, 2)))
intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))
strDataOut = strDataOut + Chr(intXOrValue1 Xor intXOrValue2)
Next lonDataPtr
XORSifreCoz = strDataOut
End Function

Public Function XORSifrele(CodeKey As String, DataIn As String) As String
Dim lonDataPtr As Long
Dim strDataOut As String
Dim temp As Integer
Dim tempstring As String
Dim intXOrValue1 As Integer
Dim intXOrValue2 As Integer
For lonDataPtr = 1 To Len(DataIn)
intXOrValue1 = Asc(Mid$(DataIn, lonDataPtr, 1))
intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))
temp = (intXOrValue1 Xor intXOrValue2)
tempstring = Hex(temp)
If Len(tempstring) = 1 Then tempstring = "0" & tempstring
strDataOut = strDataOut + tempstring
Next lonDataPtr
XORSifrele = strDataOut
End Function
