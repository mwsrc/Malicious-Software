<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmPortas
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
        Me.btnCancelar = New System.Windows.Forms.Button()
        Me.lbTitulo = New System.Windows.Forms.Label()
        Me.btnOK = New System.Windows.Forms.Button()
        Me.NDPorta = New System.Windows.Forms.NumericUpDown()
        CType(Me.NDPorta, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'btnCancelar
        '
        Me.btnCancelar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnCancelar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnCancelar.Location = New System.Drawing.Point(212, 55)
        Me.btnCancelar.Margin = New System.Windows.Forms.Padding(4)
        Me.btnCancelar.Name = "btnCancelar"
        Me.btnCancelar.Size = New System.Drawing.Size(100, 33)
        Me.btnCancelar.TabIndex = 9
        Me.btnCancelar.Text = "Cancelar"
        Me.btnCancelar.UseVisualStyleBackColor = True
        '
        'lbTitulo
        '
        Me.lbTitulo.AutoSize = True
        Me.lbTitulo.Font = New System.Drawing.Font("Segoe UI", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lbTitulo.Location = New System.Drawing.Point(14, 22)
        Me.lbTitulo.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.lbTitulo.Name = "lbTitulo"
        Me.lbTitulo.Size = New System.Drawing.Size(45, 17)
        Me.lbTitulo.TabIndex = 8
        Me.lbTitulo.Text = "Titulo"
        '
        'btnOK
        '
        Me.btnOK.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnOK.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnOK.Location = New System.Drawing.Point(212, 14)
        Me.btnOK.Margin = New System.Windows.Forms.Padding(4)
        Me.btnOK.Name = "btnOK"
        Me.btnOK.Size = New System.Drawing.Size(100, 33)
        Me.btnOK.TabIndex = 7
        Me.btnOK.Text = "OK"
        Me.btnOK.UseVisualStyleBackColor = True
        '
        'NDPorta
        '
        Me.NDPorta.BackColor = System.Drawing.Color.Black
        Me.NDPorta.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.NDPorta.ForeColor = System.Drawing.Color.White
        Me.NDPorta.Increment = New Decimal(New Integer() {100, 0, 0, 0})
        Me.NDPorta.Location = New System.Drawing.Point(17, 61)
        Me.NDPorta.Maximum = New Decimal(New Integer() {-1486618625, 232830643, 0, 0})
        Me.NDPorta.Minimum = New Decimal(New Integer() {1, 0, 0, 0})
        Me.NDPorta.Name = "NDPorta"
        Me.NDPorta.Size = New System.Drawing.Size(188, 25)
        Me.NDPorta.TabIndex = 12
        Me.NDPorta.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        Me.NDPorta.Value = New Decimal(New Integer() {8000, 0, 0, 0})
        '
        'FrmPortas
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 17.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(327, 103)
        Me.Controls.Add(Me.NDPorta)
        Me.Controls.Add(Me.btnCancelar)
        Me.Controls.Add(Me.lbTitulo)
        Me.Controls.Add(Me.btnOK)
        Me.Font = New System.Drawing.Font("Segoe UI", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ForeColor = System.Drawing.Color.White
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.Margin = New System.Windows.Forms.Padding(4)
        Me.Name = "FrmPortas"
        Me.ShowIcon = False
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Conexão (Port)"
        Me.TopMost = True
        CType(Me.NDPorta, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents btnCancelar As System.Windows.Forms.Button
    Friend WithEvents lbTitulo As System.Windows.Forms.Label
    Friend WithEvents btnOK As System.Windows.Forms.Button
    Friend WithEvents NDPorta As System.Windows.Forms.NumericUpDown
End Class
