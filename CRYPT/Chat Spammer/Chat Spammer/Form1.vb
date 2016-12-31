Imports DevComponents.DotNetBar
Public Class Form1
    Dim extra As Boolean = True
    Dim IsDraggingForm As Boolean = False
    Private MousePos As New System.Drawing.Point(0, 0)

    Public Sub Form1_MouseDown(ByVal sender As Object, ByVal e As MouseEventArgs) Handles MyBase.MouseDown, Label2.MouseDown, CheckBox1.MouseDown, Button3.MouseDown, Button2.MouseDown, Button1.MouseDown, ReflectionLabel1.MouseDown, ExpandablePanel1.MouseDown
        If e.Button = MouseButtons.Left Then
            IsDraggingForm = True
            MousePos = e.Location
        End If
    End Sub

    Private Sub Form1_MouseUp(ByVal sender As Object, ByVal e As MouseEventArgs) Handles MyBase.MouseUp, Label2.MouseUp, CheckBox1.MouseUp, Button3.MouseUp, Button2.MouseUp, Button1.MouseUp, ReflectionLabel1.MouseUp, ExpandablePanel1.MouseUp
        If e.Button = MouseButtons.Left Then IsDraggingForm = False
    End Sub

    Private Sub Form1_MouseMove(ByVal sender As Object, ByVal e As MouseEventArgs) Handles MyBase.MouseMove, Label2.MouseMove, CheckBox1.MouseMove, Button3.MouseMove, Button2.MouseMove, Button1.MouseMove, ReflectionLabel1.MouseMove, ExpandablePanel1.MouseMove
        If IsDraggingForm Then
            Dim temp As Point = New Point(Me.Location + (e.Location - MousePos))
            Me.Location = temp
            temp = Nothing
        End If
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        If CheckBox1.Checked = True Then
            If extra = True Then
                SendKeys.Send(TextBox1.Text & TextBox2.Text & "{Enter}")
                extra = False
                Exit Sub
            End If
            If extra = False Then
                SendKeys.Send(TextBox1.Text & "{Enter}")
                extra = True
                Exit Sub
            End If
        End If
        If CheckBox1.Checked = False Then
            SendKeys.Send(TextBox1.Text & "{Enter}")
        End If
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        TextBox1.Enabled = False
        TextBox2.Enabled = False
        CheckBox1.Enabled = False
        speed.Enabled = False
        Button1.Enabled = False
        Button2.Enabled = True
        Button3.Enabled = False
        Timer1.Interval = speed.Value
        Timer1.Enabled = True
        System.Threading.Thread.Sleep(3000)
        Timer1.Start()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Timer1.Stop()
        TextBox1.Enabled = True
        TextBox2.Enabled = True
        CheckBox1.Enabled = True
        speed.Enabled = True
        Button1.Enabled = True
        Button2.Enabled = False
        Button3.Enabled = True
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then
            TextBox2.Enabled = True
        Else : TextBox2.Enabled = False
        End If
    End Sub

    Private Sub Button3_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Me.Close()
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        ExpandablePanel1.Expanded = False
    End Sub

End Class
