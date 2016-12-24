<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form7
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form7))
        Me.RichTextBox1 = New System.Windows.Forms.RichTextBox
        Me.CheckBox1 = New System.Windows.Forms.CheckBox
        Me.MButton2 = New RemoteDesktop.MButton
        Me.MButtonnone2 = New RemoteDesktop.MButtonnone
        Me.MButtonnone1 = New RemoteDesktop.MButtonnone
        Me.FutureTheme1 = New RemoteDesktop.FutureTheme
        Me.SuspendLayout()
        '
        'RichTextBox1
        '
        Me.RichTextBox1.BackColor = System.Drawing.SystemColors.ControlDarkDark
        Me.RichTextBox1.Location = New System.Drawing.Point(21, 50)
        Me.RichTextBox1.Name = "RichTextBox1"
        Me.RichTextBox1.ReadOnly = True
        Me.RichTextBox1.Size = New System.Drawing.Size(445, 254)
        Me.RichTextBox1.TabIndex = 1
        Me.RichTextBox1.Text = resources.GetString("RichTextBox1.Text")
        '
        'CheckBox1
        '
        Me.CheckBox1.AutoSize = True
        Me.CheckBox1.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.CheckBox1.Location = New System.Drawing.Point(69, 338)
        Me.CheckBox1.Name = "CheckBox1"
        Me.CheckBox1.Size = New System.Drawing.Size(350, 17)
        Me.CheckBox1.TabIndex = 4
        Me.CheckBox1.Text = "I have read this and I accept these terms, don't show this again"
        Me.CheckBox1.UseVisualStyleBackColor = True
        '
        'MButton2
        '
        Me.MButton2.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.MButton2.Location = New System.Drawing.Point(467, 1)
        Me.MButton2.Name = "MButton2"
        Me.MButton2.Size = New System.Drawing.Size(18, 17)
        Me.MButton2.TabIndex = 91
        Me.MButton2.Text = "X"
        '
        'MButtonnone2
        '
        Me.MButtonnone2.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.MButtonnone2.Location = New System.Drawing.Point(240, 309)
        Me.MButtonnone2.Name = "MButtonnone2"
        Me.MButtonnone2.Size = New System.Drawing.Size(137, 23)
        Me.MButtonnone2.TabIndex = 3
        Me.MButtonnone2.Text = "I DECLINE THE TERMS"
        '
        'MButtonnone1
        '
        Me.MButtonnone1.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.MButtonnone1.Location = New System.Drawing.Point(97, 309)
        Me.MButtonnone1.Name = "MButtonnone1"
        Me.MButtonnone1.Size = New System.Drawing.Size(137, 23)
        Me.MButtonnone1.TabIndex = 2
        Me.MButtonnone1.Text = "I ACCEPT THE TERMS"
        '
        'FutureTheme1
        '
        Me.FutureTheme1.Color1 = System.Drawing.Color.FromArgb(CType(CType(34, Byte), Integer), CType(CType(34, Byte), Integer), CType(CType(34, Byte), Integer))
        Me.FutureTheme1.Color2 = System.Drawing.Color.FromArgb(CType(CType(49, Byte), Integer), CType(CType(49, Byte), Integer), CType(CType(49, Byte), Integer))
        Me.FutureTheme1.Color3 = System.Drawing.Color.FromArgb(CType(CType(22, Byte), Integer), CType(CType(22, Byte), Integer), CType(CType(22, Byte), Integer))
        Me.FutureTheme1.Color4 = System.Drawing.Color.Black
        Me.FutureTheme1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.FutureTheme1.Font = New System.Drawing.Font("Segoe UI Semibold", 18.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.FutureTheme1.Location = New System.Drawing.Point(0, 0)
        Me.FutureTheme1.Name = "FutureTheme1"
        Me.FutureTheme1.Size = New System.Drawing.Size(487, 367)
        Me.FutureTheme1.TabIndex = 0
        Me.FutureTheme1.Text = "End User License Agreement"
        '
        'Form7
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(487, 367)
        Me.Controls.Add(Me.MButton2)
        Me.Controls.Add(Me.CheckBox1)
        Me.Controls.Add(Me.MButtonnone2)
        Me.Controls.Add(Me.MButtonnone1)
        Me.Controls.Add(Me.RichTextBox1)
        Me.Controls.Add(Me.FutureTheme1)
        Me.ForeColor = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "Form7"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Pixel RAT"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents FutureTheme1 As RemoteDesktop.FutureTheme
    Friend WithEvents RichTextBox1 As System.Windows.Forms.RichTextBox
    Friend WithEvents MButtonnone1 As RemoteDesktop.MButtonnone
    Friend WithEvents MButtonnone2 As RemoteDesktop.MButtonnone
    Friend WithEvents CheckBox1 As System.Windows.Forms.CheckBox
    Friend WithEvents MButton2 As RemoteDesktop.MButton
End Class
