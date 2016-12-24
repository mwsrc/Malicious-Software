<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmServiços
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmServiços))
        Me.ST = New System.Windows.Forms.StatusStrip()
        Me.lbStatus = New System.Windows.Forms.ToolStripStatusLabel()
        Me.ListView1 = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader3 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader4 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.CM = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.AtualizarToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.FinalizarToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ContinuarToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PausarToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.IniciarToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PararToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.IM = New System.Windows.Forms.ImageList(Me.components)
        Me.UpdaterToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ExecutarComandoToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ST.SuspendLayout()
        Me.CM.SuspendLayout()
        Me.SuspendLayout()
        '
        'ST
        '
        Me.ST.BackColor = System.Drawing.Color.Black
        Me.ST.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.lbStatus})
        Me.ST.Location = New System.Drawing.Point(0, 364)
        Me.ST.Name = "ST"
        Me.ST.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional
        Me.ST.Size = New System.Drawing.Size(664, 22)
        Me.ST.SizingGrip = False
        Me.ST.TabIndex = 0
        '
        'lbStatus
        '
        Me.lbStatus.Name = "lbStatus"
        Me.lbStatus.Size = New System.Drawing.Size(45, 17)
        Me.lbStatus.Text = "Status :"
        '
        'ListView1
        '
        Me.ListView1.BackColor = System.Drawing.Color.Black
        Me.ListView1.BorderStyle = System.Windows.Forms.BorderStyle.None
        Me.ListView1.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader3, Me.ColumnHeader4})
        Me.ListView1.ContextMenuStrip = Me.CM
        Me.ListView1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.ListView1.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ListView1.ForeColor = System.Drawing.Color.White
        Me.ListView1.FullRowSelect = True
        Me.ListView1.GridLines = True
        Me.ListView1.Location = New System.Drawing.Point(0, 0)
        Me.ListView1.Name = "ListView1"
        Me.ListView1.Size = New System.Drawing.Size(664, 364)
        Me.ListView1.SmallImageList = Me.IM
        Me.ListView1.TabIndex = 1
        Me.ListView1.UseCompatibleStateImageBehavior = False
        Me.ListView1.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Nome do Serviço"
        Me.ColumnHeader1.Width = 184
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "DisplayName"
        Me.ColumnHeader2.Width = 169
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "Tipo de Serviço"
        Me.ColumnHeader3.Width = 200
        '
        'ColumnHeader4
        '
        Me.ColumnHeader4.Text = "Status"
        Me.ColumnHeader4.Width = 111
        '
        'CM
        '
        Me.CM.BackColor = System.Drawing.Color.Black
        Me.CM.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AtualizarToolStripMenuItem, Me.FinalizarToolStripMenuItem, Me.ContinuarToolStripMenuItem, Me.PausarToolStripMenuItem, Me.IniciarToolStripMenuItem, Me.PararToolStripMenuItem, Me.UpdaterToolStripMenuItem, Me.ExecutarComandoToolStripMenuItem})
        Me.CM.Name = "CM"
        Me.CM.ShowImageMargin = False
        Me.CM.Size = New System.Drawing.Size(150, 202)
        '
        'AtualizarToolStripMenuItem
        '
        Me.AtualizarToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.AtualizarToolStripMenuItem.Name = "AtualizarToolStripMenuItem"
        Me.AtualizarToolStripMenuItem.Size = New System.Drawing.Size(127, 22)
        Me.AtualizarToolStripMenuItem.Text = "Atualizar"
        '
        'FinalizarToolStripMenuItem
        '
        Me.FinalizarToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.FinalizarToolStripMenuItem.Name = "FinalizarToolStripMenuItem"
        Me.FinalizarToolStripMenuItem.Size = New System.Drawing.Size(127, 22)
        Me.FinalizarToolStripMenuItem.Text = "Finalizar"
        '
        'ContinuarToolStripMenuItem
        '
        Me.ContinuarToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.ContinuarToolStripMenuItem.Name = "ContinuarToolStripMenuItem"
        Me.ContinuarToolStripMenuItem.Size = New System.Drawing.Size(127, 22)
        Me.ContinuarToolStripMenuItem.Text = "Continuar"
        '
        'PausarToolStripMenuItem
        '
        Me.PausarToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.PausarToolStripMenuItem.Name = "PausarToolStripMenuItem"
        Me.PausarToolStripMenuItem.Size = New System.Drawing.Size(127, 22)
        Me.PausarToolStripMenuItem.Text = "Pausar"
        '
        'IniciarToolStripMenuItem
        '
        Me.IniciarToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.IniciarToolStripMenuItem.Name = "IniciarToolStripMenuItem"
        Me.IniciarToolStripMenuItem.Size = New System.Drawing.Size(127, 22)
        Me.IniciarToolStripMenuItem.Text = "Iniciar"
        '
        'PararToolStripMenuItem
        '
        Me.PararToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.PararToolStripMenuItem.Name = "PararToolStripMenuItem"
        Me.PararToolStripMenuItem.Size = New System.Drawing.Size(127, 22)
        Me.PararToolStripMenuItem.Text = "Parar"
        '
        'IM
        '
        Me.IM.ImageStream = CType(resources.GetObject("IM.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.IM.TransparentColor = System.Drawing.Color.Transparent
        Me.IM.Images.SetKeyName(0, "165.png")
        '
        'UpdaterToolStripMenuItem
        '
        Me.UpdaterToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.UpdaterToolStripMenuItem.Name = "UpdaterToolStripMenuItem"
        Me.UpdaterToolStripMenuItem.Size = New System.Drawing.Size(144, 22)
        Me.UpdaterToolStripMenuItem.Text = "Atualizar (Serviço)"
        '
        'ExecutarComandoToolStripMenuItem
        '
        Me.ExecutarComandoToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.ExecutarComandoToolStripMenuItem.Name = "ExecutarComandoToolStripMenuItem"
        Me.ExecutarComandoToolStripMenuItem.Size = New System.Drawing.Size(149, 22)
        Me.ExecutarComandoToolStripMenuItem.Text = "Executar Comando"
        '
        'FrmServiços
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(664, 386)
        Me.Controls.Add(Me.ListView1)
        Me.Controls.Add(Me.ST)
        Me.ForeColor = System.Drawing.Color.White
        Me.Name = "FrmServiços"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Serviços"
        Me.ST.ResumeLayout(False)
        Me.ST.PerformLayout()
        Me.CM.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents ST As System.Windows.Forms.StatusStrip
    Friend WithEvents lbStatus As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents ListView1 As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader3 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader4 As System.Windows.Forms.ColumnHeader
    Friend WithEvents CM As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents AtualizarToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents IM As System.Windows.Forms.ImageList
    Friend WithEvents FinalizarToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ContinuarToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PausarToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents IniciarToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PararToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UpdaterToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ExecutarComandoToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
End Class
