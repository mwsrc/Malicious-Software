<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmProgramasInstalados
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmProgramasInstalados))
        Me.LVListProgramas = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.CT = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.AtualizarToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.DesinstalarToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.IM = New System.Windows.Forms.ImageList(Me.components)
        Me.ST = New System.Windows.Forms.StatusStrip()
        Me.lbStatus = New System.Windows.Forms.ToolStripStatusLabel()
        Me.CT.SuspendLayout()
        Me.ST.SuspendLayout()
        Me.SuspendLayout()
        '
        'LVListProgramas
        '
        Me.LVListProgramas.BackColor = System.Drawing.Color.Black
        Me.LVListProgramas.BorderStyle = System.Windows.Forms.BorderStyle.None
        Me.LVListProgramas.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1})
        Me.LVListProgramas.ContextMenuStrip = Me.CT
        Me.LVListProgramas.Dock = System.Windows.Forms.DockStyle.Fill
        Me.LVListProgramas.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LVListProgramas.ForeColor = System.Drawing.Color.White
        Me.LVListProgramas.FullRowSelect = True
        Me.LVListProgramas.GridLines = True
        Me.LVListProgramas.Location = New System.Drawing.Point(0, 0)
        Me.LVListProgramas.Name = "LVListProgramas"
        Me.LVListProgramas.Size = New System.Drawing.Size(642, 438)
        Me.LVListProgramas.SmallImageList = Me.IM
        Me.LVListProgramas.TabIndex = 0
        Me.LVListProgramas.UseCompatibleStateImageBehavior = False
        Me.LVListProgramas.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Nome"
        Me.ColumnHeader1.Width = 642
        '
        'CT
        '
        Me.CT.BackColor = System.Drawing.Color.Black
        Me.CT.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AtualizarToolStripMenuItem, Me.DesinstalarToolStripMenuItem})
        Me.CT.Name = "CT"
        Me.CT.ShowImageMargin = False
        Me.CT.Size = New System.Drawing.Size(107, 48)
        '
        'AtualizarToolStripMenuItem
        '
        Me.AtualizarToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.AtualizarToolStripMenuItem.Name = "AtualizarToolStripMenuItem"
        Me.AtualizarToolStripMenuItem.Size = New System.Drawing.Size(106, 22)
        Me.AtualizarToolStripMenuItem.Text = "Atualizar"
        '
        'DesinstalarToolStripMenuItem
        '
        Me.DesinstalarToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.DesinstalarToolStripMenuItem.Name = "DesinstalarToolStripMenuItem"
        Me.DesinstalarToolStripMenuItem.Size = New System.Drawing.Size(106, 22)
        Me.DesinstalarToolStripMenuItem.Text = "Desinstalar"
        '
        'IM
        '
        Me.IM.ImageStream = CType(resources.GetObject("IM.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.IM.TransparentColor = System.Drawing.Color.Transparent
        Me.IM.Images.SetKeyName(0, "117.png")
        '
        'ST
        '
        Me.ST.BackColor = System.Drawing.Color.Black
        Me.ST.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.lbStatus})
        Me.ST.Location = New System.Drawing.Point(0, 438)
        Me.ST.Name = "ST"
        Me.ST.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional
        Me.ST.Size = New System.Drawing.Size(642, 22)
        Me.ST.SizingGrip = False
        Me.ST.TabIndex = 2
        '
        'lbStatus
        '
        Me.lbStatus.Name = "lbStatus"
        Me.lbStatus.Size = New System.Drawing.Size(45, 17)
        Me.lbStatus.Text = "Status :"
        '
        'FrmProgramasInstalados
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(642, 460)
        Me.Controls.Add(Me.LVListProgramas)
        Me.Controls.Add(Me.ST)
        Me.ForeColor = System.Drawing.Color.White
        Me.Name = "FrmProgramasInstalados"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Programas Instalados"
        Me.CT.ResumeLayout(False)
        Me.ST.ResumeLayout(False)
        Me.ST.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents LVListProgramas As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents CT As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents AtualizarToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ST As System.Windows.Forms.StatusStrip
    Friend WithEvents lbStatus As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents IM As System.Windows.Forms.ImageList
    Friend WithEvents DesinstalarToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
End Class
