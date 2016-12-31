Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        TextBox1.Text = Int(Rnd() * 4)
        Select TextBox1.Text
            Case 0
                TextBox1.Text = "G45HY-FKR83-D84KF-LF74F-A83JT"
            Case 1
                TextBox1.Text = "FI4T5-SO3F4-MS4F5-1HI4X-G6J4R"
            Case 2
                TextBox1.Text = "H68GW-7K3R4-6H4FC-HE8FK-8G9D3"
            Case 3
                TextBox1.Text = "F9RFJ-E75GM-HXTDK-7J6ND-2NT4D"
            Case 4
                TextBox1.Text = "YB68K-RD5ME-EJT3D-TC5L6-S67MD"
            Case 5
                TextBox1.Text = "E94JK-SK4D9-JN40R-QPH73-D13KF"
        End Select
    End Sub
End Class
