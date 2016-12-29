<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FRM_ScreenShot
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
        Me.BTN_TakeScreenShot = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'BTN_TakeScreenShot
        '
        Me.BTN_TakeScreenShot.Font = New System.Drawing.Font("Segoe Condensed", 15.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BTN_TakeScreenShot.Location = New System.Drawing.Point(12, 52)
        Me.BTN_TakeScreenShot.Name = "BTN_TakeScreenShot"
        Me.BTN_TakeScreenShot.Size = New System.Drawing.Size(268, 55)
        Me.BTN_TakeScreenShot.TabIndex = 0
        Me.BTN_TakeScreenShot.Text = "TAKE SCREEN SHOT"
        Me.BTN_TakeScreenShot.UseVisualStyleBackColor = True
        '
        'FRM_ScreenShot
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(292, 169)
        Me.Controls.Add(Me.BTN_TakeScreenShot)
        Me.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.MaximizeBox = False
        Me.Name = "FRM_ScreenShot"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "TAKE SCREEN SHOT"
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents BTN_TakeScreenShot As System.Windows.Forms.Button

End Class
