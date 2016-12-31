Attribute VB_Name = "Module3"
Private Declare Function GetVersionExA Lib "kernel32" (lpVersionInformation As OSVERSIONINFO) As Integer
Private Type OSVERSIONINFO
   dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
End Type

Function GetOSVersion() As String
Dim os As OSVERSIONINFO
os.dwOSVersionInfoSize = Len(os)
GetVersionExA os
GetOSVersion = os.dwPlatformId & "." & os.dwMajorVersion & "." & os.dwMinorVersion
End Function
