<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form4
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form4))
        Me.Label1 = New System.Windows.Forms.Label
        Me.MButton4 = New RemoteDesktop.MButton
        Me.FutureTheme1 = New RemoteDesktop.FutureTheme
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(4, 51)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(288, 221)
        Me.Label1.TabIndex = 82
        Me.Label1.Text = resources.GetString("Label1.Text")
        Me.Label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'MButton4
        '
        Me.MButton4.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.MButton4.ForeColor = System.Drawing.Color.DarkGray
        Me.MButton4.Location = New System.Drawing.Point(272, 1)
        Me.MButton4.Name = "MButton4"
        Me.MButton4.Size = New System.Drawing.Size(20, 19)
        Me.MButton4.TabIndex = 80
        Me.MButton4.Text = "X"
        '
        'FutureTheme1
        '
        Me.FutureTheme1.Color1 = System.Drawing.Color.FromArgb(CType(CType(34, Byte), Integer), CType(CType(34, Byte), Integer), CType(CType(34, Byte), Integer))
        Me.FutureTheme1.Color2 = System.Drawing.Color.FromArgb(CType(CType(49, Byte), Integer), CType(CType(49, Byte), Integer), CType(CType(49, Byte), Integer))
        Me.FutureTheme1.Color3 = System.Drawing.Color.FromArgb(CType(CType(22, Byte), Integer), CType(CType(22, Byte), Integer), CType(CType(22, Byte), Integer))
        Me.FutureTheme1.Color4 = System.Drawing.Color.Black
        Me.FutureTheme1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.FutureTheme1.Font = New System.Drawing.Font("Verdana", 7.0!, System.Drawing.FontStyle.Bold)
        Me.FutureTheme1.Location = New System.Drawing.Point(0, 0)
        Me.FutureTheme1.Name = "FutureTheme1"
        Me.FutureTheme1.Size = New System.Drawing.Size(295, 287)
        Me.FutureTheme1.TabIndex = 81
        Me.FutureTheme1.Text = "About"
        '
        'Form4
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(295, 287)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.MButton4)
        Me.Controls.Add(Me.FutureTheme1)
        Me.ForeColor = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "Form4"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Pixel RAT"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents MButton4 As RemoteDesktop.MButton
    Friend WithEvents FutureTheme1 As RemoteDesktop.FutureTheme
    Friend WithEvents Label1 As System.Windows.Forms.Label
End Class
