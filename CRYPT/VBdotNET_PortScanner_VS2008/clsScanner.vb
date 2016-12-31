Imports System.Threading

Public Class clsScanner
    Event PortOpen(ByVal Host As String, ByVal Port As Integer)
    Event PortClosed(ByVal Host As String, ByVal Port As Integer)
    Event ErrorOccurred(ByVal ex As Exception)
    Event ScanComplete()

    Private _Host As String
    Private _PortFrom As Integer
    Private _PortTo As Integer

    Public Enum portState
        Open
        Closed
    End Enum

    Sub New(ByVal Host As String, ByVal PortFrom As Integer, ByVal PortTo As Integer)
        _Host = Host
        _PortFrom = PortFrom
        _PortTo = PortTo
    End Sub

    Friend ReadOnly Property Host() As String
        Get
            Return _Host
        End Get
    End Property

    Friend ReadOnly Property PortFrom() As Integer
        Get
            Return _PortFrom
        End Get
    End Property

    Friend ReadOnly Property PortTo() As Integer
        Get
            Return _PortTo
        End Get
    End Property

    Friend Function Start()
        Dim wcb As WaitCallback = New WaitCallback(AddressOf StarterCallbackMethod)
        Try
            Threading.ThreadPool.QueueUserWorkItem(wcb, 0)
        Catch ex As Exception
            RaiseEvent ErrorOccurred(ex)
        End Try
    End Function

    Private Sub StarterCallbackMethod(ByVal state As Object)
        Dim wcb As WaitCallback = New WaitCallback(AddressOf CallbackMethod)
        Dim i As Integer
        Try
            For i = _PortFrom To _PortTo
                Threading.ThreadPool.QueueUserWorkItem(wcb, i)
            Next
        Catch ex As Exception
            RaiseEvent ErrorOccurred(ex)
        End Try
    End Sub

    Private Sub CallbackMethod(ByVal state As Object)
        Dim returnValue As portState
        returnValue = portState.Closed
        Dim HostAddress As System.Net.IPAddress = System.Net.Dns.Resolve(_Host).AddressList(0)
        Dim EPhost As New System.Net.IPEndPoint(HostAddress, Int(state))
        Dim mySocket As New System.Net.Sockets.Socket(System.Net.Sockets.AddressFamily.InterNetwork, System.Net.Sockets.SocketType.Stream, System.Net.Sockets.ProtocolType.Tcp)
        Try
            mySocket.Connect(EPhost)
            If mySocket.Connected Then
                returnValue = portState.Open
                mySocket.Close()
            Else
                returnValue = portState.Closed
            End If
        Catch ex As Exception
            RaiseEvent ErrorOccurred(ex)
            returnValue = portState.Closed
        Finally
            If returnValue = portState.Open Then
                RaiseEvent PortOpen(_Host, Int(state))
            Else
                RaiseEvent PortClosed(_Host, Int(state))
            End If
        End Try
    End Sub

End Class
