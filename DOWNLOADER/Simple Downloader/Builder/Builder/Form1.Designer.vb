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
        Me.Label1 = New System.Windows.Forms.Label
        Me.Generate = New System.Windows.Forms.Button
        Me.UsernameBox = New System.Windows.Forms.TextBox
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.BackColor = System.Drawing.Color.Transparent
        Me.Label1.ForeColor = System.Drawing.Color.Gold
        Me.Label1.Location = New System.Drawing.Point(12, 67)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(97, 13)
        Me.Label1.TabIndex = 14
        Me.Label1.Text = "Coded by ViRuzz™"
        '
        'Generate
        '
        Me.Generate.BackColor = System.Drawing.Color.Transparent
        Me.Generate.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.Generate.ForeColor = System.Drawing.Color.Gold
        Me.Generate.Location = New System.Drawing.Point(12, 38)
        Me.Generate.Name = "Generate"
        Me.Generate.Size = New System.Drawing.Size(269, 23)
        Me.Generate.TabIndex = 13
        Me.Generate.Text = "Build Downloader"
        Me.Generate.UseVisualStyleBackColor = False
        '
        'UsernameBox
        '
        Me.UsernameBox.BackColor = System.Drawing.Color.Black
        Me.UsernameBox.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.UsernameBox.ForeColor = System.Drawing.Color.Gold
        Me.UsernameBox.Location = New System.Drawing.Point(12, 12)
        Me.UsernameBox.Name = "UsernameBox"
        Me.UsernameBox.Size = New System.Drawing.Size(269, 20)
        Me.UsernameBox.TabIndex = 12
        Me.UsernameBox.Text = "http:\\www.server.org\server.exe"
        Me.UsernameBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(293, 89)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.Generate)
        Me.Controls.Add(Me.UsernameBox)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Form1"
        Me.ShowIcon = False
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Simple Downloader - by ViRuzz"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Generate As System.Windows.Forms.Button
    Friend WithEvents UsernameBox As System.Windows.Forms.TextBox

End Class
