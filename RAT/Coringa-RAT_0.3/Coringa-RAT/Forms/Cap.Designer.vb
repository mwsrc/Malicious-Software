<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Cap
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
        Me.components = New System.ComponentModel.Container()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.lbStatus = New System.Windows.Forms.Label()
        Me.C = New System.Windows.Forms.NumericUpDown()
        Me.btnSalvar = New System.Windows.Forms.Button()
        Me.CheckBox1 = New System.Windows.Forms.CheckBox()
        Me.CheckBox2 = New System.Windows.Forms.CheckBox()
        Me.btnIniciar = New System.Windows.Forms.Button()
        Me.C2 = New System.Windows.Forms.ComboBox()
        Me.C1 = New System.Windows.Forms.ComboBox()
        Me.P1 = New System.Windows.Forms.PictureBox()
        Me.Timer2 = New System.Windows.Forms.Timer(Me.components)
        Me.Panel1.SuspendLayout()
        CType(Me.C, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.P1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Panel1
        '
        Me.Panel1.BackColor = System.Drawing.Color.Black
        Me.Panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Panel1.Controls.Add(Me.lbStatus)
        Me.Panel1.Controls.Add(Me.C)
        Me.Panel1.Controls.Add(Me.btnSalvar)
        Me.Panel1.Controls.Add(Me.CheckBox1)
        Me.Panel1.Controls.Add(Me.CheckBox2)
        Me.Panel1.Controls.Add(Me.btnIniciar)
        Me.Panel1.Controls.Add(Me.C2)
        Me.Panel1.Controls.Add(Me.C1)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Panel1.ForeColor = System.Drawing.Color.White
        Me.Panel1.Location = New System.Drawing.Point(0, 345)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(644, 49)
        Me.Panel1.TabIndex = 14
        '
        'lbStatus
        '
        Me.lbStatus.AutoSize = True
        Me.lbStatus.Location = New System.Drawing.Point(3, 30)
        Me.lbStatus.Name = "lbStatus"
        Me.lbStatus.Size = New System.Drawing.Size(45, 13)
        Me.lbStatus.TabIndex = 15
        Me.lbStatus.Text = "Status :"
        '
        'C
        '
        Me.C.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.C.BackColor = System.Drawing.Color.Black
        Me.C.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.C.ForeColor = System.Drawing.Color.White
        Me.C.Increment = New Decimal(New Integer() {10, 0, 0, 0})
        Me.C.Location = New System.Drawing.Point(360, 4)
        Me.C.Minimum = New Decimal(New Integer() {20, 0, 0, 0})
        Me.C.Name = "C"
        Me.C.Size = New System.Drawing.Size(74, 22)
        Me.C.TabIndex = 10
        Me.C.TabStop = False
        Me.C.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        Me.C.Value = New Decimal(New Integer() {50, 0, 0, 0})
        '
        'btnSalvar
        '
        Me.btnSalvar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnSalvar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnSalvar.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold)
        Me.btnSalvar.Location = New System.Drawing.Point(94, 3)
        Me.btnSalvar.Name = "btnSalvar"
        Me.btnSalvar.Size = New System.Drawing.Size(87, 23)
        Me.btnSalvar.TabIndex = 14
        Me.btnSalvar.Text = "Salvar"
        Me.btnSalvar.UseVisualStyleBackColor = True
        '
        'CheckBox1
        '
        Me.CheckBox1.AutoSize = True
        Me.CheckBox1.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CheckBox1.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold)
        Me.CheckBox1.Location = New System.Drawing.Point(248, 6)
        Me.CheckBox1.Name = "CheckBox1"
        Me.CheckBox1.Size = New System.Drawing.Size(112, 17)
        Me.CheckBox1.TabIndex = 13
        Me.CheckBox1.TabStop = False
        Me.CheckBox1.Text = "Mostrar (Linhas)"
        Me.CheckBox1.UseVisualStyleBackColor = True
        '
        'CheckBox2
        '
        Me.CheckBox2.AutoSize = True
        Me.CheckBox2.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CheckBox2.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold)
        Me.CheckBox2.Location = New System.Drawing.Point(187, 6)
        Me.CheckBox2.Name = "CheckBox2"
        Me.CheckBox2.Size = New System.Drawing.Size(62, 17)
        Me.CheckBox2.TabIndex = 12
        Me.CheckBox2.TabStop = False
        Me.CheckBox2.Text = "Mouse"
        Me.CheckBox2.UseVisualStyleBackColor = True
        '
        'btnIniciar
        '
        Me.btnIniciar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnIniciar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnIniciar.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold)
        Me.btnIniciar.Location = New System.Drawing.Point(3, 3)
        Me.btnIniciar.Name = "btnIniciar"
        Me.btnIniciar.Size = New System.Drawing.Size(87, 23)
        Me.btnIniciar.TabIndex = 11
        Me.btnIniciar.Text = "Iniciar"
        Me.btnIniciar.UseVisualStyleBackColor = True
        '
        'C2
        '
        Me.C2.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.C2.BackColor = System.Drawing.Color.Black
        Me.C2.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.C2.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.C2.ForeColor = System.Drawing.Color.White
        Me.C2.FormattingEnabled = True
        Me.C2.Location = New System.Drawing.Point(437, 4)
        Me.C2.Name = "C2"
        Me.C2.Size = New System.Drawing.Size(86, 21)
        Me.C2.TabIndex = 4
        Me.C2.TabStop = False
        '
        'C1
        '
        Me.C1.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.C1.BackColor = System.Drawing.Color.Black
        Me.C1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.C1.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.C1.ForeColor = System.Drawing.Color.White
        Me.C1.FormattingEnabled = True
        Me.C1.Location = New System.Drawing.Point(526, 4)
        Me.C1.Name = "C1"
        Me.C1.Size = New System.Drawing.Size(112, 21)
        Me.C1.TabIndex = 2
        Me.C1.TabStop = False
        '
        'P1
        '
        Me.P1.BackColor = System.Drawing.Color.Black
        Me.P1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.P1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.P1.Location = New System.Drawing.Point(0, 0)
        Me.P1.Name = "P1"
        Me.P1.Size = New System.Drawing.Size(644, 394)
        Me.P1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.P1.TabIndex = 15
        Me.P1.TabStop = False
        '
        'Timer2
        '
        Me.Timer2.Interval = 500
        '
        'Cap
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(644, 394)
        Me.Controls.Add(Me.Panel1)
        Me.Controls.Add(Me.P1)
        Me.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold)
        Me.MinimumSize = New System.Drawing.Size(652, 425)
        Me.Name = "Cap"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Área de Trabalho"
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        CType(Me.C, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.P1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents Panel1 As System.Windows.Forms.Panel
    Friend WithEvents btnSalvar As System.Windows.Forms.Button
    Friend WithEvents CheckBox1 As System.Windows.Forms.CheckBox
    Friend WithEvents CheckBox2 As System.Windows.Forms.CheckBox
    Friend WithEvents btnIniciar As System.Windows.Forms.Button
    Friend WithEvents C As System.Windows.Forms.NumericUpDown
    Friend WithEvents C2 As System.Windows.Forms.ComboBox
    Friend WithEvents C1 As System.Windows.Forms.ComboBox
    Friend WithEvents P1 As System.Windows.Forms.PictureBox
    Friend WithEvents Timer2 As System.Windows.Forms.Timer
    Friend WithEvents lbStatus As System.Windows.Forms.Label
End Class
