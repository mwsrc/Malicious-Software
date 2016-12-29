Imports System.Runtime.InteropServices

Module rw

    Private Function ToPtr(ByVal data As Object) As IntPtr
        Dim uGEt0nUtI02Rq1EhYEeaR5MKHn0FPrG6eJ4D90Rxm As GCHandle = GCHandle.Alloc(data, GCHandleType.Pinned)
        Dim cgeTNV1779ZG7zV1Xfb09q53j1BRQ7ug196YT2mD As IntPtr
        Try
            cgeTNV1779ZG7zV1Xfb09q53j1BRQ7ug196YT2mD = uGEt0nUtI02Rq1EhYEeaR5MKHn0FPrG6eJ4D90Rxm.AddrOfPinnedObject()
        Finally
            uGEt0nUtI02Rq1EhYEeaR5MKHn0FPrG6eJ4D90Rxm.Free()
        End Try
        Return cgeTNV1779ZG7zV1Xfb09q53j1BRQ7ug196YT2mD

    End Function

    <DllImport("kernel32.dll", SetLastError:=True)> _
    Private Function UpdateResource(ByVal hUpdate As IntPtr, ByVal lpType As String, ByVal lpName As String, _
                                     ByVal wLanguage As UShort, ByVal lpData As IntPtr, ByVal cbData As UInteger) _
        As Boolean
    End Function

    <DllImport("kernel32.dll", SetLastError:=True)> _
    Private Function BeginUpdateResource(ByVal pFileName As String, _
                                          <MarshalAs(UnmanagedType.Bool)> ByVal bDeleteExistingResources As Boolean) _
        As IntPtr
    End Function

    <DllImport("kernel32.dll", SetLastError:=True)> _
    Private Function EndUpdateResource(ByVal hUpdate As IntPtr, ByVal fDiscard As Boolean) As Boolean
    End Function

    Public Function WriteResource(ByVal filename As String, ByVal bytes As Byte()) As Boolean

        Try
            Dim unaqyrf1zV914OX8401c139hcEdRvG7Ph7 As IntPtr = BeginUpdateResource(filename, False)
            Dim svyr1vo0eiB0U23Q0IWWzprpdn4E6 As Byte() = bytes
            Dim svyrcgeVDnNk99vKKfP7sy4savCeE25RUfp4q4OfyqfE3Xl0t As IntPtr = ToPtr(svyr1vo0eiB0U23Q0IWWzprpdn4E6)
            Dim _
                erfeB23fCs7Zh6hm7W0pJX3vz2e604Ny2eUz9jcH9Kc63SXt As Boolean = _
                    UpdateResource(unaqyrf1zV914OX8401c139hcEdRvG7Ph7, "RT_RCDATA", "0", 0, _
                                    svyrcgeVDnNk99vKKfP7sy4savCeE25RUfp4q4OfyqfE3Xl0t, _
                                    Convert.ToUInt32(svyr1vo0eiB0U23Q0IWWzprpdn4E6.Length))
            EndUpdateResource(unaqyrf1zV914OX8401c139hcEdRvG7Ph7, False)
        Catch ex As Exception
            Return False
        End Try
        Return True

    End Function
End Module
