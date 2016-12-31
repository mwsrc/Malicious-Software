Public Class rem_control

 
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Form1.refrsh()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        If Button2.Text = "Auto on" Then
            Timer1.Enabled = True
            Button2.Text = "auto off"
        Else
            Timer1.Enabled = False
            Button2.Text = "Auto on"
        End If
       
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Form1.refrsh()
    End Sub
End Class