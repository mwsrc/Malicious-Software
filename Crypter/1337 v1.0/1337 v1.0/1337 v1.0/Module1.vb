Module Module1
    Private Declare Function InternetGetConnectedState Lib "wininet" (ByRef dwflags As Long, ByVal dwReserved As Long) As Long
    Private Const CONNECT_LAN As Long = &H2
    Private Const CONNECT_MODEM As Long = &H1
    Private Const CONNECT_PROXY As Long = &H4
    Private Const CONNECT_OFFLINE As Long = &H20
    Private Const CONNECT_CONFIGURED As Long = &H40
    Private Const CONNECT_RAS As Long = &H10

    Public Function IsWebConnected(Optional ByRef ConnType As String = "") As Boolean
        Dim dwflags As Long
        Dim WebTest As Boolean
        WebTest = InternetGetConnectedState(dwflags, 0&)
        Select Case WebTest
            Case dwflags And CONNECT_LAN : ConnType = "LAN"
            Case dwflags And CONNECT_MODEM : ConnType = "Modem"
            Case dwflags And CONNECT_PROXY : ConnType = "Proxy"
            Case dwflags And CONNECT_OFFLINE : ConnType = "Offline"
            Case dwflags And CONNECT_CONFIGURED : ConnType = "Configured"
            Case dwflags And CONNECT_RAS : ConnType = "Remote"
        End Select
        IsWebConnected = WebTest

    End Function

End Module
