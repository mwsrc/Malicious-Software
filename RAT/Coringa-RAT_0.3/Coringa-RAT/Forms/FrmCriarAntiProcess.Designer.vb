<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmCriarAntiProcess
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmCriarAntiProcess))
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.btnAtualizar = New System.Windows.Forms.Button()
        Me.LVListProcess = New System.Windows.Forms.ListView()
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.CM = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.AdicionarToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.IM = New System.Windows.Forms.ImageList(Me.components)
        Me.btnCriar = New System.Windows.Forms.Button()
        Me.LVProcess = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.CM1 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ExcluirToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.txtNomeProcess = New System.Windows.Forms.TextBox()
        Me.btnAdicionar = New System.Windows.Forms.Button()
        Me.CKAtivarStartUp = New System.Windows.Forms.CheckBox()
        Me.txtNomeStartUp = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.NDDelay = New System.Windows.Forms.NumericUpDown()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.GroupBox1.SuspendLayout()
        Me.CM.SuspendLayout()
        Me.CM1.SuspendLayout()
        CType(Me.NDDelay, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.NDDelay)
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.btnAtualizar)
        Me.GroupBox1.Controls.Add(Me.LVListProcess)
        Me.GroupBox1.Controls.Add(Me.btnCriar)
        Me.GroupBox1.Controls.Add(Me.LVProcess)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.txtNomeProcess)
        Me.GroupBox1.Controls.Add(Me.btnAdicionar)
        Me.GroupBox1.Controls.Add(Me.CKAtivarStartUp)
        Me.GroupBox1.Controls.Add(Me.txtNomeStartUp)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold)
        Me.GroupBox1.ForeColor = System.Drawing.Color.White
        Me.GroupBox1.Location = New System.Drawing.Point(5, 3)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(773, 379)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Configurações"
        '
        'btnAtualizar
        '
        Me.btnAtualizar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnAtualizar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnAtualizar.Location = New System.Drawing.Point(485, 340)
        Me.btnAtualizar.Name = "btnAtualizar"
        Me.btnAtualizar.Size = New System.Drawing.Size(284, 33)
        Me.btnAtualizar.TabIndex = 7
        Me.btnAtualizar.Text = "Atualizar"
        Me.btnAtualizar.UseVisualStyleBackColor = True
        '
        'LVListProcess
        '
        Me.LVListProcess.BackColor = System.Drawing.Color.Black
        Me.LVListProcess.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.LVListProcess.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader2})
        Me.LVListProcess.ContextMenuStrip = Me.CM
        Me.LVListProcess.ForeColor = System.Drawing.Color.White
        Me.LVListProcess.FullRowSelect = True
        Me.LVListProcess.GridLines = True
        Me.LVListProcess.Location = New System.Drawing.Point(485, 16)
        Me.LVListProcess.Name = "LVListProcess"
        Me.LVListProcess.Size = New System.Drawing.Size(284, 273)
        Me.LVListProcess.SmallImageList = Me.IM
        Me.LVListProcess.TabIndex = 6
        Me.LVListProcess.UseCompatibleStateImageBehavior = False
        Me.LVListProcess.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "Lista de Processos"
        Me.ColumnHeader2.Width = 265
        '
        'CM
        '
        Me.CM.BackColor = System.Drawing.Color.Black
        Me.CM.ImageScalingSize = New System.Drawing.Size(18, 18)
        Me.CM.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AdicionarToolStripMenuItem})
        Me.CM.Name = "CM"
        Me.CM.RenderMode = System.Windows.Forms.ToolStripRenderMode.System
        Me.CM.Size = New System.Drawing.Size(128, 28)
        '
        'AdicionarToolStripMenuItem
        '
        Me.AdicionarToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.AdicionarToolStripMenuItem.Image = CType(resources.GetObject("AdicionarToolStripMenuItem.Image"), System.Drawing.Image)
        Me.AdicionarToolStripMenuItem.Name = "AdicionarToolStripMenuItem"
        Me.AdicionarToolStripMenuItem.Size = New System.Drawing.Size(127, 24)
        Me.AdicionarToolStripMenuItem.Text = "Adicionar"
        '
        'IM
        '
        Me.IM.ImageStream = CType(resources.GetObject("IM.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.IM.TransparentColor = System.Drawing.Color.Transparent
        Me.IM.Images.SetKeyName(0, "215.png")
        '
        'btnCriar
        '
        Me.btnCriar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnCriar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnCriar.Location = New System.Drawing.Point(5, 340)
        Me.btnCriar.Name = "btnCriar"
        Me.btnCriar.Size = New System.Drawing.Size(478, 33)
        Me.btnCriar.TabIndex = 5
        Me.btnCriar.Text = "Criar Anti Process"
        Me.btnCriar.UseVisualStyleBackColor = True
        '
        'LVProcess
        '
        Me.LVProcess.BackColor = System.Drawing.Color.Black
        Me.LVProcess.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.LVProcess.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1})
        Me.LVProcess.ContextMenuStrip = Me.CM1
        Me.LVProcess.ForeColor = System.Drawing.Color.White
        Me.LVProcess.FullRowSelect = True
        Me.LVProcess.GridLines = True
        Me.LVProcess.Location = New System.Drawing.Point(5, 16)
        Me.LVProcess.Name = "LVProcess"
        Me.LVProcess.Size = New System.Drawing.Size(478, 273)
        Me.LVProcess.SmallImageList = Me.IM
        Me.LVProcess.TabIndex = 0
        Me.LVProcess.UseCompatibleStateImageBehavior = False
        Me.LVProcess.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Processos"
        Me.ColumnHeader1.Width = 458
        '
        'CM1
        '
        Me.CM1.BackColor = System.Drawing.Color.Black
        Me.CM1.ImageScalingSize = New System.Drawing.Size(18, 18)
        Me.CM1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ExcluirToolStripMenuItem})
        Me.CM1.Name = "CM1"
        Me.CM1.RenderMode = System.Windows.Forms.ToolStripRenderMode.System
        Me.CM1.Size = New System.Drawing.Size(111, 28)
        '
        'ExcluirToolStripMenuItem
        '
        Me.ExcluirToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.ExcluirToolStripMenuItem.Image = CType(resources.GetObject("ExcluirToolStripMenuItem.Image"), System.Drawing.Image)
        Me.ExcluirToolStripMenuItem.Name = "ExcluirToolStripMenuItem"
        Me.ExcluirToolStripMenuItem.Size = New System.Drawing.Size(110, 24)
        Me.ExcluirToolStripMenuItem.Text = "Excluir"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(2, 295)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(167, 13)
        Me.Label1.TabIndex = 4
        Me.Label1.Text = "Nome (Process) > ex : explorer"
        '
        'txtNomeProcess
        '
        Me.txtNomeProcess.BackColor = System.Drawing.Color.Black
        Me.txtNomeProcess.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtNomeProcess.ForeColor = System.Drawing.Color.White
        Me.txtNomeProcess.Location = New System.Drawing.Point(5, 312)
        Me.txtNomeProcess.Name = "txtNomeProcess"
        Me.txtNomeProcess.Size = New System.Drawing.Size(245, 22)
        Me.txtNomeProcess.TabIndex = 3
        '
        'btnAdicionar
        '
        Me.btnAdicionar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnAdicionar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnAdicionar.Location = New System.Drawing.Point(377, 295)
        Me.btnAdicionar.Name = "btnAdicionar"
        Me.btnAdicionar.Size = New System.Drawing.Size(106, 39)
        Me.btnAdicionar.TabIndex = 2
        Me.btnAdicionar.Text = "Adicionar"
        Me.btnAdicionar.UseVisualStyleBackColor = True
        '
        'CKAtivarStartUp
        '
        Me.CKAtivarStartUp.AutoSize = True
        Me.CKAtivarStartUp.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAtivarStartUp.Location = New System.Drawing.Point(489, 294)
        Me.CKAtivarStartUp.Name = "CKAtivarStartUp"
        Me.CKAtivarStartUp.Size = New System.Drawing.Size(128, 17)
        Me.CKAtivarStartUp.TabIndex = 1
        Me.CKAtivarStartUp.Text = "Copiar Para StartUp"
        Me.CKAtivarStartUp.UseVisualStyleBackColor = True
        '
        'txtNomeStartUp
        '
        Me.txtNomeStartUp.BackColor = System.Drawing.Color.Black
        Me.txtNomeStartUp.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtNomeStartUp.Enabled = False
        Me.txtNomeStartUp.ForeColor = System.Drawing.Color.White
        Me.txtNomeStartUp.Location = New System.Drawing.Point(489, 312)
        Me.txtNomeStartUp.Name = "txtNomeStartUp"
        Me.txtNomeStartUp.Size = New System.Drawing.Size(280, 22)
        Me.txtNomeStartUp.TabIndex = 8
        Me.txtNomeStartUp.Text = "Windows Update"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(253, 295)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(90, 13)
        Me.Label2.TabIndex = 9
        Me.Label2.Text = "Verificar Process"
        '
        'NDDelay
        '
        Me.NDDelay.BackColor = System.Drawing.Color.Black
        Me.NDDelay.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.NDDelay.ForeColor = System.Drawing.Color.White
        Me.NDDelay.Increment = New Decimal(New Integer() {2, 0, 0, 0})
        Me.NDDelay.Location = New System.Drawing.Point(256, 312)
        Me.NDDelay.Maximum = New Decimal(New Integer() {1874919423, 2328306, 0, 0})
        Me.NDDelay.Minimum = New Decimal(New Integer() {1, 0, 0, 0})
        Me.NDDelay.Name = "NDDelay"
        Me.NDDelay.Size = New System.Drawing.Size(87, 22)
        Me.NDDelay.TabIndex = 10
        Me.NDDelay.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        Me.NDDelay.Value = New Decimal(New Integer() {1, 0, 0, 0})
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(344, 317)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(29, 13)
        Me.Label3.TabIndex = 11
        Me.Label3.Text = "Seg."
        '
        'FrmCriarAntiProcess
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(782, 387)
        Me.Controls.Add(Me.GroupBox1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ForeColor = System.Drawing.Color.White
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.MaximizeBox = False
        Me.Name = "FrmCriarAntiProcess"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Anti Process"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.CM.ResumeLayout(False)
        Me.CM1.ResumeLayout(False)
        CType(Me.NDDelay, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents LVProcess As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents txtNomeProcess As System.Windows.Forms.TextBox
    Friend WithEvents btnAdicionar As System.Windows.Forms.Button
    Friend WithEvents CKAtivarStartUp As System.Windows.Forms.CheckBox
    Friend WithEvents btnAtualizar As System.Windows.Forms.Button
    Friend WithEvents LVListProcess As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents btnCriar As System.Windows.Forms.Button
    Friend WithEvents IM As System.Windows.Forms.ImageList
    Friend WithEvents CM As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents AdicionarToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CM1 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ExcluirToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents txtNomeStartUp As System.Windows.Forms.TextBox
    Friend WithEvents NDDelay As System.Windows.Forms.NumericUpDown
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
End Class
