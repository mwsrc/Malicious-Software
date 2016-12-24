<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmConexão
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmConexão))
        Me.ST = New System.Windows.Forms.StatusStrip()
        Me.lbStatus = New System.Windows.Forms.ToolStripStatusLabel()
        Me.LVConexões = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader3 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.CM = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.AtualizarToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ColumnHeader4 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.IM = New System.Windows.Forms.ImageList(Me.components)
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
        Me.ST.Size = New System.Drawing.Size(615, 22)
        Me.ST.SizingGrip = False
        Me.ST.TabIndex = 0
        '
        'lbStatus
        '
        Me.lbStatus.Name = "lbStatus"
        Me.lbStatus.Size = New System.Drawing.Size(45, 17)
        Me.lbStatus.Text = "Status :"
        '
        'LVConexões
        '
        Me.LVConexões.BackColor = System.Drawing.Color.Black
        Me.LVConexões.BorderStyle = System.Windows.Forms.BorderStyle.None
        Me.LVConexões.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader3, Me.ColumnHeader4})
        Me.LVConexões.ContextMenuStrip = Me.CM
        Me.LVConexões.Dock = System.Windows.Forms.DockStyle.Fill
        Me.LVConexões.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LVConexões.ForeColor = System.Drawing.Color.White
        Me.LVConexões.FullRowSelect = True
        Me.LVConexões.GridLines = True
        Me.LVConexões.Location = New System.Drawing.Point(0, 0)
        Me.LVConexões.Name = "LVConexões"
        Me.LVConexões.Size = New System.Drawing.Size(615, 364)
        Me.LVConexões.SmallImageList = Me.IM
        Me.LVConexões.TabIndex = 1
        Me.LVConexões.UseCompatibleStateImageBehavior = False
        Me.LVConexões.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Protocolo"
        Me.ColumnHeader1.Width = 63
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "Local EndPoint"
        Me.ColumnHeader2.Width = 200
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "Remote EndPoint"
        Me.ColumnHeader3.Width = 234
        '
        'CM
        '
        Me.CM.BackColor = System.Drawing.Color.Black
        Me.CM.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AtualizarToolStripMenuItem})
        Me.CM.Name = "CM"
        Me.CM.ShowImageMargin = False
        Me.CM.Size = New System.Drawing.Size(96, 26)
        '
        'AtualizarToolStripMenuItem
        '
        Me.AtualizarToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.AtualizarToolStripMenuItem.Name = "AtualizarToolStripMenuItem"
        Me.AtualizarToolStripMenuItem.Size = New System.Drawing.Size(95, 22)
        Me.AtualizarToolStripMenuItem.Text = "Atualizar"
        '
        'ColumnHeader4
        '
        Me.ColumnHeader4.Text = "Status"
        Me.ColumnHeader4.Width = 117
        '
        'IM
        '
        Me.IM.ImageStream = CType(resources.GetObject("IM.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.IM.TransparentColor = System.Drawing.Color.Transparent
        Me.IM.Images.SetKeyName(0, "164.png")
        '
        'FrmConexão
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(615, 386)
        Me.Controls.Add(Me.LVConexões)
        Me.Controls.Add(Me.ST)
        Me.ForeColor = System.Drawing.Color.White
        Me.Name = "FrmConexão"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Conexões"
        Me.ST.ResumeLayout(False)
        Me.ST.PerformLayout()
        Me.CM.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents ST As System.Windows.Forms.StatusStrip
    Friend WithEvents lbStatus As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents LVConexões As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader3 As System.Windows.Forms.ColumnHeader
    Friend WithEvents CM As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents AtualizarToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ColumnHeader4 As System.Windows.Forms.ColumnHeader
    Friend WithEvents IM As System.Windows.Forms.ImageList
End Class
