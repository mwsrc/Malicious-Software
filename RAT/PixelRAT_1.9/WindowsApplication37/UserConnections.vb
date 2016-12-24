Option Strict On

Imports System.Net.Sockets
Imports System.Text

' The UserConnection class encapsulates the functionality of a TcpClient connection
' with streaming for a single user.
Public Class UserConnection
    Const READ_BUFFER_SIZE As Integer = 255

    ' Overload the New operator to set up a read thread.
    Public Sub New(ByVal client As TcpClient)
        Me.client = client

        ' This starts the asynchronous read thread.  The data will be saved into
        ' readBuffer.
        Me.client.GetStream.BeginRead(readBuffer, 0, READ_BUFFER_SIZE, AddressOf StreamReceiver, Nothing)
    End Sub

    Private client As TcpClient
    Private readBuffer(READ_BUFFER_SIZE) As Byte
    Private strName As String

    ' The Name property uniquely identifies the user connection.
    Public Property Name() As String
        Get
            Return strName
        End Get
        Set(ByVal Value As String)
            strName = Value
        End Set
    End Property


    Public Event LineReceived(ByVal sender As UserConnection, ByVal Data As String)

    ' This subroutine uses a StreamWriter to send a message to the user.
    Public Sub sendback(ByVal Data As String)
        ' Synclock ensure that no other threads try to use the stream at the same time.
        SyncLock client.GetStream
            Dim writer As New IO.StreamWriter(client.GetStream)
            writer.Write(Data & Chr(13) & Chr(10))

            ' Make sure all data is sent now.
            writer.Flush()
        End SyncLock
    End Sub

    ' This is the callback function for TcpClient.GetStream.Begin. It begins an 
    ' asynchronous read from a stream.
    Private Sub StreamReceiver(ByVal ar As IAsyncResult)
        Dim BytesRead As Integer
        Dim strMessage As String

        Try
            ' Ensure that no other threads try to use the stream at the same time.
            SyncLock client.GetStream
                ' Finish asynchronous read into readBuffer and get number of bytes read.
                BytesRead = client.GetStream.EndRead(ar)
            End SyncLock

            ' Convert the byte array the message was saved into, minus one for the
            ' Chr(13).
            strMessage = Encoding.ASCII.GetString(readBuffer, 0, BytesRead - 1)
            RaiseEvent LineReceived(Me, strMessage)

            ' Ensure that no other threads try to use the stream at the same time.
            SyncLock client.GetStream
                ' Start a new asynchronous read into readBuffer.
                client.GetStream.BeginRead(readBuffer, 0, READ_BUFFER_SIZE, AddressOf StreamReceiver, Nothing)
            End SyncLock
        Catch e As Exception
        End Try
    End Sub
End Class
