<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmDownload
    Inherits System.Windows.Forms.Form

    'Descartar substituições de formulário para limpar a lista de componentes.
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

    'Exigido pelo Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'OBSERVAÇÃO: O procedimento a seguir é exigido pelo Windows Form Designer
    'Ele pode ser modificado usando o Windows Form Designer.  
    'Não o modifique usando o editor de códigos.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmDownload))
        Me.IM = New System.Windows.Forms.ImageList(Me.components)
        Me.LV_Downloads = New RATDownload.ListViewP2P()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader3 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.NT = New System.Windows.Forms.NotifyIcon(Me.components)
        Me.SuspendLayout()
        '
        'IM
        '
        Me.IM.ColorDepth = System.Windows.Forms.ColorDepth.Depth32Bit
        Me.IM.ImageSize = New System.Drawing.Size(16, 16)
        Me.IM.TransparentColor = System.Drawing.Color.Transparent
        '
        'LV_Downloads
        '
        Me.LV_Downloads.BackColor = System.Drawing.Color.White
        Me.LV_Downloads.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader3})
        Me.LV_Downloads.Dock = System.Windows.Forms.DockStyle.Fill
        Me.LV_Downloads.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LV_Downloads.ForeColor = System.Drawing.Color.Black
        Me.LV_Downloads.FullRowSelect = True
        Me.LV_Downloads.GridLines = True
        Me.LV_Downloads.Location = New System.Drawing.Point(0, 0)
        Me.LV_Downloads.Name = "LV_Downloads"
        Me.LV_Downloads.Size = New System.Drawing.Size(449, 317)
        Me.LV_Downloads.SmallImageList = Me.IM
        Me.LV_Downloads.TabIndex = 0
        Me.LV_Downloads.UseCompatibleStateImageBehavior = False
        Me.LV_Downloads.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Nome"
        Me.ColumnHeader1.Width = 173
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "Status"
        Me.ColumnHeader2.Width = 120
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "Tamanho"
        Me.ColumnHeader3.Width = 152
        '
        'NT
        '
        Me.NT.Icon = CType(resources.GetObject("NT.Icon"), System.Drawing.Icon)
        Me.NT.Text = "Informações"
        Me.NT.Visible = True
        '
        'FrmDownload
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(449, 317)
        Me.Controls.Add(Me.LV_Downloads)
        Me.ForeColor = System.Drawing.Color.Black
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "FrmDownload"
        Me.ShowIcon = False
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Download"
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents LV_Downloads As RATDownload.ListViewP2P
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader3 As System.Windows.Forms.ColumnHeader
    Friend WithEvents IM As System.Windows.Forms.ImageList
    Friend WithEvents NT As System.Windows.Forms.NotifyIcon
End Class
