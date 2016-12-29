Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim Proc As Process = New Process
        Dim top As String = "netsh.exe"
        Proc.StartInfo.Arguments = ("firewall set opmode enable")
        Proc.StartInfo.FileName = top
        Proc.StartInfo.UseShellExecute = False
        Proc.StartInfo.RedirectStandardOutput = True
        Proc.StartInfo.CreateNoWindow = True
        Proc.Start()
        Proc.WaitForExit()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim Proc As Process = New Process
        Dim top As String = "netsh.exe"
        Proc.StartInfo.Arguments = ("firewall set opmode disable")
        Proc.StartInfo.FileName = top
        Proc.StartInfo.UseShellExecute = False
        Proc.StartInfo.RedirectStandardOutput = True
        Proc.StartInfo.CreateNoWindow = True
        Proc.Start()
        Proc.WaitForExit()
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        MsgBox("ED Firewall (Enable and Disable Firewall), is a freeware application made in VisualBasic 2008, which enables and disables the firewall. Made by flAmingw0rm. If you found any bugs, report them to RistoSR@gmail.com, or add me on MSN risto@fbi.gov.")
    End Sub
End Class