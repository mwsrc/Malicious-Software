Imports System.Net
Imports System.Management
Imports System.IO
Imports System.Text
Imports System.Collections.Generic






Public Class Form6

    Public Function Md5Get() As String
        Dim xvpauqxdTTNhuflsjslnausqyXjtgJ As New System.Security.Cryptography.MD5CryptoServiceProvider
        Dim Data() As Byte
        Dim hash() As Byte
        Dim MrtblmRvTiqzjsqlbfGfHzWzpvudfg As String = IO.File.ReadAllText(Application.ExecutablePath)
        Data = System.Text.Encoding.UTF8.GetBytes(MrtblmRvTiqzjsqlbfGfHzWzpvudfg)
        hash = xvpauqxdTTNhuflsjslnausqyXjtgJ.ComputeHash(Data)
        xvpauqxdTTNhuflsjslnausqyXjtgJ = Nothing
        Dim nzhEvMnxmovBlrLfsedqiqjlylroWv As New System.Text.StringBuilder(hash.Length)
        For i As Integer = 0 To hash.Length - 1
            nzhEvMnxmovBlrLfsedqiqjlylroWv.Append(hash(i).ToString("X2"))
        Next
        Return nzhEvMnxmovBlrLfsedqiqjlylroWv.ToString().ToLower
    End Function


    Dim tfRnlrzhRLqCzopFpswrHlllnyCguc As Boolean = False
    Dim SBdeamuqiZBlyciHxFRRfJpendPyly As String = "1.78"
    Dim pMumxpvXwcksvwbnkyaqtdhcrppprk As String
    Dim sverrytVresihxrCxSZfvvppdhnclb As String = "yes"


    Private Sub Form6_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load



        Dim cKQKjGpozrwZXdMMWxdoftcrUfidtq As String = "hi"
        Dim wc = New System.Net.WebClient
        Try
            cKQKjGpozrwZXdMMWxdoftcrUfidtq = wc.DownloadString("http://www.pixelfrag.com/pixelrat/md5hashchecker.txt") ' < You Url here with the xvpauqxdTTNhuflsjslnausqyXjtgJ textfile: www.example.com/md5.txt
        Catch ex As Exception
            MsgBox("Error x000 Please check your internet connection.")
            Try
                Dim pProcess() As Process = System.Diagnostics.Process.GetProcessesByName(FileNameWithoutExtension(Application.ExecutablePath))
                pProcess(0).Kill()
                For Each p As Process In pProcess
                    p.Kill()
                Next

            Catch exds As Exception
            End Try
        End Try

        If cKQKjGpozrwZXdMMWxdoftcrUfidtq.Contains(Md5Get()) Then
            Dim jiKDzdsgyGIKGsgVomgqlhoSkkewKv As String = String.Empty
            Dim ipgOHjWqpMVtfqcFdjlsdEinKzHQBk As New ManagementClass("win32_processor")
            Dim gbqvvuwpmpFLLtUwsfmiBRsDrtbgqw As ManagementObjectCollection = ipgOHjWqpMVtfqcFdjlsdEinKzHQBk.GetInstances()

            For Each mo As ManagementObject In gbqvvuwpmpFLLtUwsfmiBRsDrtbgqw
                If jiKDzdsgyGIKGsgVomgqlhoSkkewKv = "" Then
                    jiKDzdsgyGIKGsgVomgqlhoSkkewKv = mo.Properties("processorID").Value.ToString()
                    Exit For
                End If
            Next



            pMumxpvXwcksvwbnkyaqtdhcrppprk = jiKDzdsgyGIKGsgVomgqlhoSkkewKv
            '
            Me.Focus()
        Else
            MsgBox("Corrupted file, please contact VipeX")
 

            Try
                Dim pProcess() As Process = System.Diagnostics.Process.GetProcessesByName(FileNameWithoutExtension(Application.ExecutablePath))
                pProcess(0).Kill()
                For Each p As Process In pProcess
                    p.Kill()
                Next
            Catch ex As Exception
            End Try
        End If






    End Sub



    Public Function FileNameWithoutExtension(ByVal FullPath As String) As String

        Return System.IO.Path.GetFileNameWithoutExtension(FullPath)


    End Function
    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        If WebBrowser1.Document.Body.InnerText.Contains("Invalid username or") Then
            Label6.Text = "Incorrect username or password"
            MProgress2.Current = 0
        Else
            If WebBrowser1.DocumentTitle = "PixelFrag | User Panel" Then
                If tfRnlrzhRLqCzopFpswrHlllnyCguc = False Then
                    Label6.Text = "Authenticating Machine"
                    MProgress2.Current = 40
                    tfRnlrzhRLqCzopFpswrHlllnyCguc = True
                End If
                Dim cNkzbqtdhcrpppRkNRzmMuPqmYndcs As String = WebBrowser1.Document.Body.InnerText

                If cNkzbqtdhcrpppRkNRzmMuPqmYndcs.Contains(pMumxpvXwcksvwbnkyaqtdhcrppprk) Then  'If it does, show the program.

                    If sverrytVresihxrCxSZfvvppdhnclb = "yes" Then
                        MProgress2.Current = 100


                        Dim whichversion() As String = WebBrowser1.Document.Body.InnerText.Split("`")
                        If XOREncryption("ads", "U]X") = whichversion(1) Then
                            Label6.Text = "Log in successful, starting up PixelRAT"
                            sverrytVresihxrCxSZfvvppdhnclb = "no"
                            Form1.Show()
                            Me.Hide()
                        Else
                            If whichversion(2) = "Down" Then
                                Label6.Text = "Tool is currently out of use."
                                sverrytVresihxrCxSZfvvppdhnclb = "no"
                                MessageBox.Show("This tool is currently out of use. Please check your email for more information. Please wait patiently for the next update, we apologize for the inconvenience.", "Attention", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                                Try
                                    Dim pProcess() As Process = System.Diagnostics.Process.GetProcessesByName(FileNameWithoutExtension(Application.ExecutablePath))
                                    pProcess(0).Kill()
                                    For Each p As Process In pProcess
                                        p.Kill()
                                    Next
                                Catch ex As Exception
                                End Try
                            Else
                                Label6.Text = "An update is available..."
                                sverrytVresihxrCxSZfvvppdhnclb = "no"
                                MessageBox.Show("Please contact Vipex via PERSONAL MESSAGE ON HACKFORUMS to obtain the update. Client will start up now.", "Update Available", MessageBoxButtons.OK, MessageBoxIcon.Question)


10:                             Form1.Show()
                                Me.Hide()
                                Timer1.Stop()
                            End If




                        End If

                        sverrytVresihxrCxSZfvvppdhnclb = "no"
                    Else
                        Timer1.Stop()

                    End If
                    Timer1.Stop()
                    sverrytVresihxrCxSZfvvppdhnclb = "no"
                Else
                    Label6.Text = "Machine Authentication failed."
                    If sverrytVresihxrCxSZfvvppdhnclb = "yes" Then
                        sverrytVresihxrCxSZfvvppdhnclb = "no"
                        MessageBox.Show("This program is unregistered. Please contact Vipex with details of purchase at hand. Thank You" & vbNewLine & "Please note it may take upto 24 hours for your program to be activated once purchased. ", "Not Registered", MessageBoxButtons.OK, MessageBoxIcon.Error)
                        Timer1.Stop()
                        MProgress2.Current = 0
                        Me.Close() 'If not, close the program and give a message.


                    End If

                End If
            Else

            End If
        End If

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        If WebBrowser1.DocumentTitle = "PixelPanel | Log in" Then

            Try
                WebBrowser1.Document.GetElementById("username").SetAttribute("value", TextBox30.Text)
                WebBrowser1.Document.GetElementById("password").SetAttribute("value", TextBox4.Text)

                WebBrowser1.Document.GetElementById("login").InvokeMember("click")

                MProgress2.Current = 20
                Timer2.Stop()

                Timer1.Start()
            Catch ex As Exception
            End Try
        Else

        End If


    End Sub

    Private Sub MButton4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton4.Click
        Application.Exit()
    End Sub
    Public Function XOREncryption(ByVal CodeKey As String, ByVal DataIn As String) As String
        Dim gqlhnsKkEervCpzpbkqkJgpnYqWyXd As Long
        Dim mmXxdoftcrufJetqrqsliLBoHoqsob As String
        Dim zphfzjfahmeeWqepVDtcUwkEDzjhse As Integer, intXOrValue2 As Integer


        For gqlhnsKkEervCpzpbkqkJgpnYqWyXd = 1 To Len(DataIn)
            'The first value to be XOr-ed comes from
            '     the data to be encrypted
            zphfzjfahmeeWqepVDtcUwkEDzjhse = Asc(Mid$(DataIn, gqlhnsKkEervCpzpbkqkJgpnYqWyXd, 1))
            'The second value comes from the code ke
            '     y
            intXOrValue2 = Asc(Mid$(CodeKey, ((gqlhnsKkEervCpzpbkqkJgpnYqWyXd Mod Len(CodeKey)) + 1), 1))
            mmXxdoftcrufJetqrqsliLBoHoqsob = mmXxdoftcrufJetqrqsliLBoHoqsob + Chr(zphfzjfahmeeWqepVDtcUwkEDzjhse Xor intXOrValue2)
        Next gqlhnsKkEervCpzpbkqkJgpnYqWyXd
        XOREncryption = mmXxdoftcrufJetqrqsliLBoHoqsob
    End Function


    Private Sub MButtonnone2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone2.Click
        WebBrowser1.Navigate("www.pixelfrag.com/pixelrat/login.php")
        Label6.Text = "Authenticating Log in"
        MProgress2.Current = 10
        Timer2.Start()
    End Sub

    Private Sub FutureTheme2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FutureTheme2.Click

    End Sub

    Private Sub MButton2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton2.Click
        Try
            Dim pProcess() As Process = System.Diagnostics.Process.GetProcessesByName(FileNameWithoutExtension(Application.ExecutablePath))
            pProcess(0).Kill()
            For Each p As Process In pProcess
                p.Kill()
            Next
        Catch ex As Exception
        End Try
    End Sub
End Class

