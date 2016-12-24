<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmClipboard
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
        Me.txtGetClipboard = New System.Windows.Forms.TextBox()
        Me.btnObterClipboard = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.btnCopiarClipboard = New System.Windows.Forms.Button()
        Me.btnExcluirClipboard = New System.Windows.Forms.Button()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.btnDefinirClipboard = New System.Windows.Forms.Button()
        Me.txtDefinirClipboard = New System.Windows.Forms.TextBox()
        Me.SuspendLayout()
        '
        'txtGetClipboard
        '
        Me.txtGetClipboard.BackColor = System.Drawing.Color.Black
        Me.txtGetClipboard.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtGetClipboard.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.txtGetClipboard.ForeColor = System.Drawing.Color.White
        Me.txtGetClipboard.Location = New System.Drawing.Point(14, 26)
        Me.txtGetClipboard.Multiline = True
        Me.txtGetClipboard.Name = "txtGetClipboard"
        Me.txtGetClipboard.ScrollBars = System.Windows.Forms.ScrollBars.Both
        Me.txtGetClipboard.Size = New System.Drawing.Size(394, 119)
        Me.txtGetClipboard.TabIndex = 0
        '
        'btnObterClipboard
        '
        Me.btnObterClipboard.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnObterClipboard.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnObterClipboard.Location = New System.Drawing.Point(15, 148)
        Me.btnObterClipboard.Name = "btnObterClipboard"
        Me.btnObterClipboard.Size = New System.Drawing.Size(165, 23)
        Me.btnObterClipboard.TabIndex = 1
        Me.btnObterClipboard.Text = "Obter Clipboard"
        Me.btnObterClipboard.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(12, 10)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(180, 13)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "Clipboard (Área de Transferência)"
        '
        'btnCopiarClipboard
        '
        Me.btnCopiarClipboard.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnCopiarClipboard.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnCopiarClipboard.Location = New System.Drawing.Point(186, 148)
        Me.btnCopiarClipboard.Name = "btnCopiarClipboard"
        Me.btnCopiarClipboard.Size = New System.Drawing.Size(165, 23)
        Me.btnCopiarClipboard.TabIndex = 3
        Me.btnCopiarClipboard.Text = "Copiar Clipboard"
        Me.btnCopiarClipboard.UseVisualStyleBackColor = True
        '
        'btnExcluirClipboard
        '
        Me.btnExcluirClipboard.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnExcluirClipboard.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnExcluirClipboard.Location = New System.Drawing.Point(184, 313)
        Me.btnExcluirClipboard.Name = "btnExcluirClipboard"
        Me.btnExcluirClipboard.Size = New System.Drawing.Size(165, 23)
        Me.btnExcluirClipboard.TabIndex = 7
        Me.btnExcluirClipboard.Text = "Excluir Clipboard"
        Me.btnExcluirClipboard.UseVisualStyleBackColor = True
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(10, 175)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(218, 13)
        Me.Label2.TabIndex = 6
        Me.Label2.Text = "Definir Clipboard (Área de Transferência)"
        '
        'btnDefinirClipboard
        '
        Me.btnDefinirClipboard.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnDefinirClipboard.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnDefinirClipboard.Location = New System.Drawing.Point(13, 313)
        Me.btnDefinirClipboard.Name = "btnDefinirClipboard"
        Me.btnDefinirClipboard.Size = New System.Drawing.Size(165, 23)
        Me.btnDefinirClipboard.TabIndex = 5
        Me.btnDefinirClipboard.Text = "Definir Clipboard"
        Me.btnDefinirClipboard.UseVisualStyleBackColor = True
        '
        'txtDefinirClipboard
        '
        Me.txtDefinirClipboard.BackColor = System.Drawing.Color.Black
        Me.txtDefinirClipboard.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtDefinirClipboard.ForeColor = System.Drawing.Color.White
        Me.txtDefinirClipboard.Location = New System.Drawing.Point(12, 191)
        Me.txtDefinirClipboard.Multiline = True
        Me.txtDefinirClipboard.Name = "txtDefinirClipboard"
        Me.txtDefinirClipboard.ScrollBars = System.Windows.Forms.ScrollBars.Both
        Me.txtDefinirClipboard.Size = New System.Drawing.Size(394, 119)
        Me.txtDefinirClipboard.TabIndex = 4
        Me.txtDefinirClipboard.Text = "CORINGÃO"
        '
        'FrmClipboard
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(420, 343)
        Me.Controls.Add(Me.btnExcluirClipboard)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.btnDefinirClipboard)
        Me.Controls.Add(Me.txtDefinirClipboard)
        Me.Controls.Add(Me.btnCopiarClipboard)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.btnObterClipboard)
        Me.Controls.Add(Me.txtGetClipboard)
        Me.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold)
        Me.ForeColor = System.Drawing.Color.White
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.MaximizeBox = False
        Me.Name = "FrmClipboard"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Clipboard"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents txtGetClipboard As System.Windows.Forms.TextBox
    Friend WithEvents btnObterClipboard As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents btnCopiarClipboard As System.Windows.Forms.Button
    Friend WithEvents btnExcluirClipboard As System.Windows.Forms.Button
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents btnDefinirClipboard As System.Windows.Forms.Button
    Friend WithEvents txtDefinirClipboard As System.Windows.Forms.TextBox
End Class
