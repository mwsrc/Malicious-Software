<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class news
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.VTheme1 = New Onyx.VTheme()
        Me.VTextBox2 = New Onyx.VTextBox()
        Me.VTextBox1 = New Onyx.VTextBox()
        Me.VButton1 = New Onyx.VButton()
        Me.VTheme1.SuspendLayout()
        Me.SuspendLayout()
        '
        'VTheme1
        '
        Me.VTheme1.BorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.VTheme1.Colors = New Onyx.Bloom(-1) {}
        Me.VTheme1.Controls.Add(Me.VButton1)
        Me.VTheme1.Controls.Add(Me.VTextBox2)
        Me.VTheme1.Controls.Add(Me.VTextBox1)
        Me.VTheme1.Customization = ""
        Me.VTheme1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.VTheme1.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.VTheme1.Image = Nothing
        Me.VTheme1.Location = New System.Drawing.Point(0, 0)
        Me.VTheme1.Movable = True
        Me.VTheme1.Name = "VTheme1"
        Me.VTheme1.NoRounding = False
        Me.VTheme1.Sizable = True
        Me.VTheme1.Size = New System.Drawing.Size(284, 262)
        Me.VTheme1.SmartBounds = True
        Me.VTheme1.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.VTheme1.TabIndex = 0
        Me.VTheme1.Text = "News"
        Me.VTheme1.TransparencyKey = System.Drawing.Color.Fuchsia
        Me.VTheme1.Transparent = False
        '
        'VTextBox2
        '
        Me.VTextBox2.Colors = New Onyx.Bloom(-1) {}
        Me.VTextBox2.Customization = ""
        Me.VTextBox2.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.VTextBox2.Image = Nothing
        Me.VTextBox2.Location = New System.Drawing.Point(12, 67)
        Me.VTextBox2.MaxCharacters = 0
        Me.VTextBox2.Multiline = True
        Me.VTextBox2.Name = "VTextBox2"
        Me.VTextBox2.NoRounding = False
        Me.VTextBox2.Size = New System.Drawing.Size(260, 157)
        Me.VTextBox2.TabIndex = 1
        Me.VTextBox2.Transparent = False
        Me.VTextBox2.UsePasswordMask = False
        '
        'VTextBox1
        '
        Me.VTextBox1.Colors = New Onyx.Bloom(-1) {}
        Me.VTextBox1.Customization = ""
        Me.VTextBox1.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.VTextBox1.Image = Nothing
        Me.VTextBox1.Location = New System.Drawing.Point(12, 36)
        Me.VTextBox1.MaxCharacters = 0
        Me.VTextBox1.Multiline = False
        Me.VTextBox1.Name = "VTextBox1"
        Me.VTextBox1.NoRounding = False
        Me.VTextBox1.Size = New System.Drawing.Size(260, 25)
        Me.VTextBox1.TabIndex = 0
        Me.VTextBox1.Transparent = False
        Me.VTextBox1.UsePasswordMask = False
        '
        'VButton1
        '
        Me.VButton1.Colors = New Onyx.Bloom(-1) {}
        Me.VButton1.Customization = ""
        Me.VButton1.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.VButton1.Image = Nothing
        Me.VButton1.Location = New System.Drawing.Point(12, 230)
        Me.VButton1.Name = "VButton1"
        Me.VButton1.NoRounding = False
        Me.VButton1.Size = New System.Drawing.Size(260, 23)
        Me.VButton1.TabIndex = 2
        Me.VButton1.Text = "Close"
        Me.VButton1.Transparent = False
        '
        'news
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 262)
        Me.Controls.Add(Me.VTheme1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Name = "news"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "news"
        Me.TransparencyKey = System.Drawing.Color.Fuchsia
        Me.VTheme1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents VTheme1 As Onyx.VTheme
    Friend WithEvents VTextBox2 As Onyx.VTextBox
    Friend WithEvents VTextBox1 As Onyx.VTextBox
    Friend WithEvents VButton1 As Onyx.VButton
End Class
