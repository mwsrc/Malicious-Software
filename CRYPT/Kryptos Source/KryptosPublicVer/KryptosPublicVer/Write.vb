
Imports System.Runtime.InteropServices
Module ResourceWriter
    Private Function ToPtr(ByVal data As Object) As IntPtr
        Dim h As GCHandle = GCHandle.Alloc(data, GCHandleType.Pinned)
        Dim ptr As IntPtr
        Try
            ptr = h.AddrOfPinnedObject()
        Finally
            h.Free()
        End Try
        Return ptr

    End Function

    <DllImport("kernel32.dll", SetLastError:=True)> _
    Private Function UpdateResource(ByVal hUpdate As IntPtr, ByVal lpType As String, ByVal lpName As String, ByVal wLanguage As UShort, ByVal lpData As IntPtr, ByVal cbData As UInteger) As Boolean
    End Function
    <DllImport("kernel32.dll", SetLastError:=True)> _
    Private Function BeginUpdateResource(ByVal pFileName As String, <MarshalAs(UnmanagedType.Bool)> ByVal bDeleteExistingResources As Boolean) As IntPtr
    End Function
    <DllImport("kernel32.dll", SetLastError:=True)> _
    Private Function EndUpdateResource(ByVal hUpdate As IntPtr, ByVal fDiscard As Boolean) As Boolean
    End Function

    Public Function WriteResource(ByVal filename As String, ByVal bytes As Byte()) As Boolean

        Try
            Dim handle As IntPtr = BeginUpdateResource(filename, False)
            Dim file1 As Byte() = bytes
            Dim fileptr As IntPtr = ToPtr(file1)
            Dim res As Boolean = UpdateResource(handle, "RT_RCDATA", "0", 0, fileptr, Convert.ToUInt32(file1.Length))
            EndUpdateResource(handle, False)
        Catch ex As Exception
            Return False
        End Try
        Return True

    End Function
End Module