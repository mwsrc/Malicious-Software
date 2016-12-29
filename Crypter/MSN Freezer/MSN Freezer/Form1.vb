Imports System.Threading.Thread
Public Class Form1

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load


    End Sub

    Private Sub Button1_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If CheckBox1.Checked = True Then

            If CheckBox2.Checked = True Then
                MsgBox("You can't choose Hide and Minimize To Tray both. Please uncheck one.")
                GoTo done
            End If
            Me.Hide()
        End If
        If CheckBox2.Checked = True Then
            If CheckBox1.Checked = True Then
                MsgBox("You can't choose Hide and Minimize To Tray both. Please uncheck one.")
                GoTo done
            End If
            NotifyIcon1.Visible = True
            Me.Hide()
        End If
        Button1.Enabled = False
        Button2.Enabled = True
        WebBrowser1.Navigate("http://mobile.msn.com/hm/folder.phpx")
        Sleep(2000)
        Timer1.Enabled = True
        Label3.Text = "Freezing..."
done:
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        On Error GoTo errordetected


        WebBrowser1.Document.GetElementById("LoginTextBox").SetAttribute("value", (TextBox1.Text))
        WebBrowser1.Document.GetElementById("PasswordTextBox").SetAttribute("value", ("pas13465"))
        Sleep(2000)
        WebBrowser1.Document.GetElementById("PasswordSubmit").InvokeMember("click")
        Label8.Text = Val(Label8.Text + 1)
        If Label8.Text = "10" Then
            Label3.Text = "Frozen!"
        End If
        GoTo done
errordetected:
        Label3.Text = "Frozen!"
        WebBrowser1.Navigate("https://mid.live.com/si/logout.aspx?ct=1266060556&amp;rver=6.0.5285.0&amp;lc=1043&amp;id=64855&amp;ru=http:%2F%2Fmobile.live.com%3Fmkt%3Dnl-nl&amp;MspSty=mobile")
done:

    End Sub

    Private Sub Button2_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Label3.Text = "Ready"
        MsgBox("MSN UnFrozen!")
        Timer1.Enabled = False
        Button2.Enabled = False
        Button1.Enabled = True
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        If CheckBox1.Checked = True Then
            Me.Hide()
        End If
    End Sub




    Private Sub NotifyIcon1_MouseDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles NotifyIcon1.MouseDoubleClick
        Me.Show()
        NotifyIcon1.Visible = False
        CheckBox2.Checked = False
    End Sub

    Private Sub CheckBox2_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox2.CheckedChanged
        If CheckBox2.Checked = True Then
            If CheckBox1.Checked = True Then
                MsgBox("You can't choose Hide and Minimize To Tray both. Please uncheck one.")
                GoTo done1
            End If
            If Timer1.Enabled = True Then
                Me.Hide()
                NotifyIcon1.Visible = True
            End If
        End If
done1:
    End Sub

    
    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        Label5.Text = TimeOfDay
    End Sub
End Class
