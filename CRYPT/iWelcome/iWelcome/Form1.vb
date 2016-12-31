Imports System.Net.Sockets
Imports System.IO

Public Class Form1
    Friend WithEvents BGW As New System.ComponentModel.BackgroundWorker
    Dim IrcNick, IrcServer, IrcChannel, GlobalMessage As String
    Dim IrcPort As Integer, IsInvisible As Boolean
    Dim IrcConnection As TcpClient, IrcStream As NetworkStream
    Dim IrcWriter As StreamWriter, IrcReader As StreamReader

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        BGW.WorkerReportsProgress = True
        BGW.WorkerSupportsCancellation = True
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        IrcServer = TextBox1.Text
        IrcPort = NumericUpDown1.Value
        IrcChannel = TextBox2.Text
        IrcNick = TextBox3.Text
        IsInvisible = False
        If BGW.IsBusy Then
            IrcWriter.Close()
            IrcReader.Close()
            IrcConnection.Close()
            BGW.CancelAsync()
            GroupBox1.Enabled = True
            TextBox7.Text = ""
            Button1.Text = "Start"
        Else
            GroupBox1.Enabled = False
            Button1.Text = "Stop"
            BGW.RunWorkerAsync()
        End If
    End Sub

    Public Sub Connect() Handles BGW.DoWork
        Try
            IrcConnection = New TcpClient(IrcServer, IrcPort)
            IrcStream = IrcConnection.GetStream()
            IrcReader = New StreamReader(IrcStream)
            IrcWriter = New StreamWriter(IrcStream)
            IrcWrite("USER " & IrcNick & " " & IsInvisible & " * :" & IrcNick)
            IrcWrite("NICK " & IrcNick)
            IrcWrite("JOIN " & IrcChannel)
            
            While True
                Threading.Thread.Sleep(1)
                If BGW.CancellationPending = True Then Exit Sub
                Dim ircCommand As String = IrcReader.ReadLine
                GlobalMessage = (vbNewLine & ircCommand)
                BGW.ReportProgress(0)
                Select Case True
                    Case ircCommand.StartsWith(":" & IrcNick)
                        Exit Select
                    Case ircCommand = "PING :" & IrcServer
                        Dim s As String = ircCommand.Substring(ircCommand.LastIndexOf(":") + 1)
                        IrcWrite("PONG :" & s)
                    Case ircCommand.Contains("JOIN :#")
                        Dim usr As String = ircCommand.Remove(ircCommand.IndexOf("!")).Replace(":", "")
                        IrcWrite("PRIVMSG " & IrcChannel & " " & TextBox4.Text.Replace("%", usr))
                End Select
            End While
        Catch ex As Exception
        End Try
    End Sub

    Sub ReportPgr() Handles BGW.ProgressChanged
        TextBox7.AppendText(GlobalMessage)
    End Sub

    Sub IrcWrite(ByVal Message As String)
        IrcWriter.WriteLine(Message)
        IrcWriter.Flush()
    End Sub

    Private Sub TextBox5_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles TextBox5.KeyPress
        If Asc(e.KeyChar) = Keys.Enter Then
            IrcWrite("PRIVMSG " & IrcChannel & " " & TextBox5.Text)
            TextBox5.Text = ""
            e.Handled = True
        End If
    End Sub

    Private Sub TextBox6_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles TextBox6.KeyPress
        If Asc(e.KeyChar) = Keys.Enter Then
            IrcWrite(TextBox6.Text)
            TextBox6.Text = ""
            e.Handled = True
        End If
    End Sub
End Class
