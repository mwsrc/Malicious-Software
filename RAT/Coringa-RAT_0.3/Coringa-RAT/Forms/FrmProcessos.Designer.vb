<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmProcessos
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmProcessos))
        Me.LvListProcess = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader3 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader4 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader5 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.CT = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.AtualizarToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.FinalizarToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ResumeToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SuspenderToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ReniciarToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.IM = New System.Windows.Forms.ImageList(Me.components)
        Me.ST = New System.Windows.Forms.StatusStrip()
        Me.lbStatus = New System.Windows.Forms.ToolStripStatusLabel()
        Me.CT.SuspendLayout()
        Me.ST.SuspendLayout()
        Me.SuspendLayout()
        '
        'LvListProcess
        '
        Me.LvListProcess.BackColor = System.Drawing.Color.Black
        Me.LvListProcess.BorderStyle = System.Windows.Forms.BorderStyle.None
        Me.LvListProcess.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader3, Me.ColumnHeader4, Me.ColumnHeader5})
        Me.LvListProcess.ContextMenuStrip = Me.CT
        Me.LvListProcess.Dock = System.Windows.Forms.DockStyle.Fill
        Me.LvListProcess.Font = New System.Drawing.Font("Arial", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LvListProcess.ForeColor = System.Drawing.Color.White
        Me.LvListProcess.FullRowSelect = True
        Me.LvListProcess.GridLines = True
        Me.LvListProcess.Location = New System.Drawing.Point(0, 0)
        Me.LvListProcess.Name = "LvListProcess"
        Me.LvListProcess.Size = New System.Drawing.Size(614, 337)
        Me.LvListProcess.SmallImageList = Me.IM
        Me.LvListProcess.Sorting = System.Windows.Forms.SortOrder.Ascending
        Me.LvListProcess.TabIndex = 8
        Me.LvListProcess.UseCompatibleStateImageBehavior = False
        Me.LvListProcess.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Nome"
        Me.ColumnHeader1.Width = 112
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "PID"
        Me.ColumnHeader2.Width = 100
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "Diretório"
        Me.ColumnHeader3.Width = 163
        '
        'ColumnHeader4
        '
        Me.ColumnHeader4.Text = "Memoria"
        Me.ColumnHeader4.Width = 100
        '
        'ColumnHeader5
        '
        Me.ColumnHeader5.Text = "Data de Criação"
        Me.ColumnHeader5.Width = 139
        '
        'CT
        '
        Me.CT.BackColor = System.Drawing.Color.Black
        Me.CT.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AtualizarToolStripMenuItem, Me.FinalizarToolStripMenuItem, Me.ResumeToolStripMenuItem, Me.SuspenderToolStripMenuItem, Me.ReniciarToolStripMenuItem})
        Me.CT.Name = "ContextMenuStrip1"
        Me.CT.ShowImageMargin = False
        Me.CT.Size = New System.Drawing.Size(105, 114)
        '
        'AtualizarToolStripMenuItem
        '
        Me.AtualizarToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.AtualizarToolStripMenuItem.Name = "AtualizarToolStripMenuItem"
        Me.AtualizarToolStripMenuItem.Size = New System.Drawing.Size(104, 22)
        Me.AtualizarToolStripMenuItem.Text = "Atualizar"
        '
        'FinalizarToolStripMenuItem
        '
        Me.FinalizarToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.FinalizarToolStripMenuItem.Name = "FinalizarToolStripMenuItem"
        Me.FinalizarToolStripMenuItem.Size = New System.Drawing.Size(104, 22)
        Me.FinalizarToolStripMenuItem.Text = "Finalizar"
        '
        'ResumeToolStripMenuItem
        '
        Me.ResumeToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.ResumeToolStripMenuItem.Name = "ResumeToolStripMenuItem"
        Me.ResumeToolStripMenuItem.Size = New System.Drawing.Size(104, 22)
        Me.ResumeToolStripMenuItem.Text = "Resume"
        '
        'SuspenderToolStripMenuItem
        '
        Me.SuspenderToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.SuspenderToolStripMenuItem.Name = "SuspenderToolStripMenuItem"
        Me.SuspenderToolStripMenuItem.Size = New System.Drawing.Size(104, 22)
        Me.SuspenderToolStripMenuItem.Text = "Suspender"
        '
        'ReniciarToolStripMenuItem
        '
        Me.ReniciarToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.ReniciarToolStripMenuItem.Name = "ReniciarToolStripMenuItem"
        Me.ReniciarToolStripMenuItem.Size = New System.Drawing.Size(104, 22)
        Me.ReniciarToolStripMenuItem.Text = "Reiniciar"
        '
        'IM
        '
        Me.IM.ImageStream = CType(resources.GetObject("IM.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.IM.TransparentColor = System.Drawing.Color.Transparent
        Me.IM.Images.SetKeyName(0, "108.png")
        Me.IM.Images.SetKeyName(1, "107.png")
        Me.IM.Images.SetKeyName(2, "109.png")
        Me.IM.Images.SetKeyName(3, "110.png")
        Me.IM.Images.SetKeyName(4, "111.png")
        Me.IM.Images.SetKeyName(5, "112.png")
        Me.IM.Images.SetKeyName(6, "113.png")
        Me.IM.Images.SetKeyName(7, "114.png")
        Me.IM.Images.SetKeyName(8, "115.png")
        Me.IM.Images.SetKeyName(9, "116.png")
        Me.IM.Images.SetKeyName(10, "166.png")
        '
        'ST
        '
        Me.ST.BackColor = System.Drawing.Color.Black
        Me.ST.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.lbStatus})
        Me.ST.Location = New System.Drawing.Point(0, 337)
        Me.ST.Name = "ST"
        Me.ST.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional
        Me.ST.Size = New System.Drawing.Size(614, 22)
        Me.ST.SizingGrip = False
        Me.ST.TabIndex = 7
        '
        'lbStatus
        '
        Me.lbStatus.Name = "lbStatus"
        Me.lbStatus.Size = New System.Drawing.Size(45, 17)
        Me.lbStatus.Text = "Status :"
        '
        'FrmProcessos
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(614, 359)
        Me.Controls.Add(Me.LvListProcess)
        Me.Controls.Add(Me.ST)
        Me.ForeColor = System.Drawing.Color.White
        Me.Name = "FrmProcessos"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Gerenciador de Tarefas"
        Me.CT.ResumeLayout(False)
        Me.ST.ResumeLayout(False)
        Me.ST.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents LvListProcess As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader3 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader4 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader5 As System.Windows.Forms.ColumnHeader
    Friend WithEvents CT As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents IM As System.Windows.Forms.ImageList
    Friend WithEvents ST As System.Windows.Forms.StatusStrip
    Friend WithEvents lbStatus As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents AtualizarToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents FinalizarToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SuspenderToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ReniciarToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ResumeToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
End Class
