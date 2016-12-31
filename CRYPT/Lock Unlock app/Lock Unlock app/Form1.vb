Imports System.Management
Imports System.IO
Public Class Form1
    Dim key, lic, file As String
    Dim path As String = System.IO.Path.GetTempPath

    Public Function GetHDSerial() As String
        Dim disk As New ManagementObject("Win32_LogicalDisk.DeviceID=""C:""")
        Dim diskPropertyA As PropertyData = _
        disk.Properties("VolumeSerialNumber")
        Return diskPropertyA.Value.ToString()
    End Function
    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        
        lic = GetHDSerial()
        If My.Settings.Active = True And My.Settings.HWID.Equals(lic) Then
            GroupBox1.Enabled = True
            My.Settings.Save()
            Exit Sub
        Else : GroupBox1.Enabled = False
        End If

        If System.IO.File.Exists(path & "\" & "lic.tmp") = True Then
            System.IO.File.Delete(path & "\" & "lic.tmp")
        End If

        My.Computer.Network.DownloadFile("http://481217.t35.com/ffpassunblock.txt", path & "\" & "lic.tmp")
        Dim FILE_NAME As String = path & "\" & "lic.tmp"
        Dim objReader As New System.IO.StreamReader(FILE_NAME)
        file = objReader.ReadToEnd
        Dim kkv As String
        kkv = file
        If System.IO.File.Exists(path & "\" & "lic.tmp") = True And kkv.Contains(lic) = True Then
            MsgBox(" License Accepted")
            My.Settings.Active = True
            My.Settings.HWID = lic
            My.Settings.Save()
            GroupBox1.Enabled = True
            Button4.Enabled = False
            objReader.Close()
            If System.IO.File.Exists(path & "\" & "lic.tmp") = True Then
                System.IO.File.Delete(path & "\" & "lic.tmp")
            End If
        Else
            My.Settings.Active = False
            MsgBox("License Not Accepted")
            objReader.Close()
            If System.IO.File.Exists(path & "\" & "lic.tmp") = True Then
                System.IO.File.Delete(path & "\" & "lic.tmp")
            End If
            Me.Close()
        End If
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If My.Settings.Active = True And My.Settings.HWID.Equals(GetHDSerial()) Then
            GroupBox1.Enabled = True
            Button4.Enabled = False
            Exit Sub
        Else : GroupBox1.Enabled = False
        End If
    End Sub
    Private Sub bye() Handles Me.FormClosing

    End Sub
End Class
