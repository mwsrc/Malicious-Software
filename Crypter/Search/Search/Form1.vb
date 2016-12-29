Public Class Form1
    
    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click
        End
    End Sub

    Private Sub TextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged
        Dim Google As String("www.google.com")
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        System.Diagnostics.Process.Start("http://www.google.com/search?hl=en&q=" + TextBox1.Text + "&aq=f&oq=")
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        System.Diagnostics.Process.Start("http://www.dogpile.com/dogpile/ws/results/Web/" + TextBox1.Text + "/1/417/TopNavigation/Relevance/iq=true/zoom=off/_iceUrlFlag=7?_IceUrl=true")
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        System.Diagnostics.Process.Start("http://www.ask.com/web?q=" + TextBox1.Text + "&search=search&qsrc=0&o=0&l=dir")
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        System.Diagnostics.Process.Start("http://search.msn.com/results.aspx?q=" + TextBox1.Text + "&FORM=MSNH11")
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        System.Diagnostics.Process.Start("http://search.yahoo.com/search?p=" + TextBox1.Text + "&fr=yfp-t-501&type=&toggle=1&cop=&ei=UTF-8")
    End Sub

End Class
