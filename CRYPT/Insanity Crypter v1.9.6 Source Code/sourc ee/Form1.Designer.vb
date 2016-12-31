<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Das Formular überschreibt den Löschvorgang, um die Komponentenliste zu bereinigen.
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

    'Wird vom Windows Form-Designer benötigt.
    Private components As System.ComponentModel.IContainer

    'Hinweis: Die folgende Prozedur ist für den Windows Form-Designer erforderlich.
    'Das Bearbeiten ist mit dem Windows Form-Designer möglich.  
    'Das Bearbeiten mit dem Code-Editor ist nicht möglich.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.CrystalClearThemeContainer1 = New WindowsApplication1.CrystalClearThemeContainer
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.CrystalClearTextBox1 = New WindowsApplication1.CrystalClearTextBox
        Me.CrystalClearButton1 = New WindowsApplication1.CrystalClearButton
        Me.CrystalClearButton2 = New WindowsApplication1.CrystalClearButton
        Me.CrystalClearThemeContainer1.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'CrystalClearThemeContainer1
        '
        Me.CrystalClearThemeContainer1.BackColor = System.Drawing.Color.FromArgb(CType(CType(230, Byte), Integer), CType(CType(230, Byte), Integer), CType(CType(230, Byte), Integer))
        Me.CrystalClearThemeContainer1.BorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.CrystalClearThemeContainer1.Controls.Add(Me.GroupBox1)
        Me.CrystalClearThemeContainer1.Controls.Add(Me.CrystalClearButton2)
        Me.CrystalClearThemeContainer1.Customization = "5ubm/9LS0v/m5ub/5ubm/6qqqv8="
        Me.CrystalClearThemeContainer1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.CrystalClearThemeContainer1.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.CrystalClearThemeContainer1.Image = Nothing
        Me.CrystalClearThemeContainer1.Location = New System.Drawing.Point(0, 0)
        Me.CrystalClearThemeContainer1.MinimumSize = New System.Drawing.Size(175, 150)
        Me.CrystalClearThemeContainer1.Movable = True
        Me.CrystalClearThemeContainer1.Name = "CrystalClearThemeContainer1"
        Me.CrystalClearThemeContainer1.NoRounding = False
        Me.CrystalClearThemeContainer1.Rounding = WindowsApplication1.CrystalClearThemeContainer.RoundingType.None
        Me.CrystalClearThemeContainer1.Sizable = True
        Me.CrystalClearThemeContainer1.Size = New System.Drawing.Size(313, 150)
        Me.CrystalClearThemeContainer1.SmartBounds = True
        Me.CrystalClearThemeContainer1.StartPosition = System.Windows.Forms.FormStartPosition.WindowsDefaultLocation
        Me.CrystalClearThemeContainer1.TabIndex = 3
        Me.CrystalClearThemeContainer1.Text = "CrystalClearThemeContainer1"
        Me.CrystalClearThemeContainer1.TransparencyKey = System.Drawing.Color.Fuchsia
        Me.CrystalClearThemeContainer1.Transparent = False
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.CrystalClearTextBox1)
        Me.GroupBox1.Controls.Add(Me.CrystalClearButton1)
        Me.GroupBox1.Location = New System.Drawing.Point(12, 32)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(289, 72)
        Me.GroupBox1.TabIndex = 4
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Selection & Location"
        '
        'CrystalClearTextBox1
        '
        Me.CrystalClearTextBox1.Customization = "AAAA/8i5nf+qqqr/"
        Me.CrystalClearTextBox1.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.CrystalClearTextBox1.Image = Nothing
        Me.CrystalClearTextBox1.Location = New System.Drawing.Point(6, 29)
        Me.CrystalClearTextBox1.MaxLength = 32767
        Me.CrystalClearTextBox1.Multiline = False
        Me.CrystalClearTextBox1.Name = "CrystalClearTextBox1"
        Me.CrystalClearTextBox1.NoRounding = False
        Me.CrystalClearTextBox1.ReadOnly = False
        Me.CrystalClearTextBox1.Size = New System.Drawing.Size(190, 24)
        Me.CrystalClearTextBox1.TabIndex = 3
        Me.CrystalClearTextBox1.Text = "File Location..."
        Me.CrystalClearTextBox1.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
        Me.CrystalClearTextBox1.Transparent = False
        Me.CrystalClearTextBox1.UseSystemPasswordChar = False
        '
        'CrystalClearButton1
        '
        Me.CrystalClearButton1.Customization = "5ubm/9LS0v/m5ub/qqqq/wAAAP//////"
        Me.CrystalClearButton1.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.CrystalClearButton1.Image = Nothing
        Me.CrystalClearButton1.Location = New System.Drawing.Point(202, 29)
        Me.CrystalClearButton1.Name = "CrystalClearButton1"
        Me.CrystalClearButton1.NoRounding = False
        Me.CrystalClearButton1.Size = New System.Drawing.Size(81, 24)
        Me.CrystalClearButton1.TabIndex = 0
        Me.CrystalClearButton1.Text = "Select"
        Me.CrystalClearButton1.Transparent = False
        '
        'CrystalClearButton2
        '
        Me.CrystalClearButton2.Customization = "5ubm/9LS0v/m5ub/qqqq/wAAAP//////"
        Me.CrystalClearButton2.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.CrystalClearButton2.Image = Nothing
        Me.CrystalClearButton2.Location = New System.Drawing.Point(12, 113)
        Me.CrystalClearButton2.Name = "CrystalClearButton2"
        Me.CrystalClearButton2.NoRounding = False
        Me.CrystalClearButton2.Size = New System.Drawing.Size(289, 25)
        Me.CrystalClearButton2.TabIndex = 2
        Me.CrystalClearButton2.Text = "Protect File Data"
        Me.CrystalClearButton2.Transparent = False
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(313, 150)
        Me.Controls.Add(Me.CrystalClearThemeContainer1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MinimumSize = New System.Drawing.Size(175, 150)
        Me.Name = "Form1"
        Me.Text = "Insanity Crypter v1.9.6[Auto-Update is OFF]"
        Me.TransparencyKey = System.Drawing.Color.Fuchsia
        Me.CrystalClearThemeContainer1.ResumeLayout(False)
        Me.GroupBox1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents CrystalClearThemeContainer1 As WindowsApplication1.CrystalClearThemeContainer
    Friend WithEvents CrystalClearButton1 As WindowsApplication1.CrystalClearButton
    Friend WithEvents CrystalClearButton2 As WindowsApplication1.CrystalClearButton
    Friend WithEvents CrystalClearTextBox1 As WindowsApplication1.CrystalClearTextBox
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox

End Class
