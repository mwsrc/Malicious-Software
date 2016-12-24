Imports System.Xml
Imports System.Reflection
Imports Microsoft.Win32

Public Class Form7
    Private Sub meload(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If System.IO.File.Exists(Application.StartupPath & "\PixelRAT.config") = True Then
        Else

            My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\PixelRAT.config", My.Resources.String1, False)

        End If


        Dim show As String = System.Configuration.ConfigurationSettings.AppSettings("LSHOW")
        If show = "NO" Then
            Me.Hide()


        End If
    End Sub
    Private Sub MButtonnone1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone1.Click
        If CheckBox1.Checked = True Then
            Dim regKey As RegistryKey
            regKey = Registry.CurrentUser.OpenSubKey("Software\PixelRAT\", True)
            regKey.SetValue("Agree", "1")
            regKey.Close()

            Me.Hide()
            Form1.Show()
        Else
            MsgBox("You did not accept the Terms of Service, the program will now exit.", 0 + 16, "Error")
            End
        End If

    End Sub
    Public Function FileNameWithoutExtension(ByVal FullPath As String) As String

        Return System.IO.Path.GetFileNameWithoutExtension(FullPath)


    End Function
    Private Sub MButtonnone2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone2.Click
        Try
            Dim pProcess() As Process = System.Diagnostics.Process.GetProcessesByName(FileNameWithoutExtension(Application.ExecutablePath))
            pProcess(0).Kill()
            For Each p As Process In pProcess
                p.Kill()
            Next
        Catch ex As Exception
            Application.Exit()
        End Try
    End Sub
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
        ' Assembly.GetExecutingAssembly().Location & ".config"
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

    Private Sub MButton2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton2.Click
        Application.Exit()
    End Sub

    Private Sub FutureTheme1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FutureTheme1.Click

    End Sub
End Class