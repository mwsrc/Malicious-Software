Public Class Form5

    Private Sub MButtonnone12_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButtonnone12.Click

        If CheckBox1.Checked = True Then
      
            ConfigSettings.WriteSetting("TITLE", TextBox30.Text)
            ConfigSettings.WriteSetting("DESCRIPTION", TextBox1.Text)
            ConfigSettings.WriteSetting("COMPANY", TextBox2.Text)
            ConfigSettings.WriteSetting("PRODUCT", TextBox3.Text)
            ConfigSettings.WriteSetting("COPYRIGHT", TextBox4.Text)
            ConfigSettings.WriteSetting("TRADEMARK", TextBox5.Text)

        End If
        Me.Hide()
    End Sub
End Class