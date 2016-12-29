Imports System.Runtime.InteropServices
Module ________

    <DllImport("kernel32.dll", SetLastError:=True)> _
    Private Function FindResource(ByVal [x] As IntPtr, ByVal [xx] As String, ByVal [xxx] As String) As IntPtr
    End Function

    Private Declare Function ___ Lib "kernel32" Alias "GetModuleHandleA" (ByVal moduleName As String) As IntPtr
    Private Declare Function SizeofResource Lib "kernel32" (ByVal hModule As IntPtr, ByVal hResInfo As IntPtr) As Integer
    Private Declare Function LoadResource Lib "kernel32" (ByVal hModule As IntPtr, ByVal hResInfo As IntPtr) As IntPtr

    Public Function [X_x](ByVal [xxxx] As String) As Byte()
        Dim [xxxxx] As IntPtr = ___([xxxx])
        Dim xx As IntPtr = FindResource([xxxxx], "0", "RT_RCDATA")
        Dim x As IntPtr = LoadResource([xxxxx], xx)
        Dim xxxxxx = SizeofResource([xxxxx], xx)
        Dim xxx As Byte() = New Byte(xxxxxx - 1) {}
        Marshal.Copy(x, xxx, 0, CInt(xxxx))
        Return xxx
    End Function
End Module
