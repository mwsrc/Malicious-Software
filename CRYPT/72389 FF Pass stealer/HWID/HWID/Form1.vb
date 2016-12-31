Imports System.Management
Public Class Form1

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        TextBox1.Text = GetHDSerial()
    End Sub
    Public Function GetHDSerial() As String
        Dim disk As New ManagementObject("Win32_LogicalDisk.DeviceID=""C:""")
        Dim diskPropertyA As PropertyData = _
        disk.Properties("VolumeSerialNumber")
        Return diskPropertyA.Value.ToString()
    End Function

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        System.Diagnostics.Process.Start("http://www.natespages.ucoz.com")
    End Sub
End Class
