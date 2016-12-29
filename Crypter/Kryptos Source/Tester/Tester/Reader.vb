Imports System.Runtime.InteropServices
Module ResourceReader

    <DllImport("kernel32.dll", SetLastError:=True)> _
    Private Function FindResource(ByVal hModule As IntPtr, ByVal lpName As String, ByVal lpType As String) As IntPtr
    End Function

    Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal moduleName As String) As IntPtr
    Private Declare Function SizeofResource Lib "kernel32" (ByVal hModule As IntPtr, ByVal hResInfo As IntPtr) As Integer
    Private Declare Function LoadResource Lib "kernel32" (ByVal hModule As IntPtr, ByVal hResInfo As IntPtr) As IntPtr

    Public Function ReadResource(ByVal filename As String) As Byte()
        Dim hModule As IntPtr = GetModuleHandle(filename)
        Dim loc As IntPtr = FindResource(hModule, "0", "RT_RCDATA")
        Dim x As IntPtr = LoadResource(hModule, loc)
        Dim size = SizeofResource(hModule, loc)
        Dim bPtr As Byte() = New Byte(size - 1) {}
        Marshal.Copy(x, bPtr, 0, CInt(size))
        Return bPtr
    End Function
End Module