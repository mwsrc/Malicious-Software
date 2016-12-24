<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmGerenciadorArquivos
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmGerenciadorArquivos))
        Me.ST = New System.Windows.Forms.StatusStrip()
        Me.ToolStripStatusLabel1 = New System.Windows.Forms.ToolStripStatusLabel()
        Me.SL = New System.Windows.Forms.ToolStripStatusLabel()
        Me.pr = New System.Windows.Forms.ToolStripProgressBar()
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.L1 = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.CM = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.RefreshToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MG = New System.Windows.Forms.ImageList(Me.components)
        Me.ContextMenuStrip2 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.UPToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RefreshToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.RunToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.DeleteToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.EditToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RenameToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CopyToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CutToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PastToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.DownloadToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.UploadToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.NewEmptyFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.NewFolderToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.OpenFolderToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.L2 = New System.Windows.Forms.ListView()
        Me.ColumnHeader3 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader4 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader5 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.MG2 = New System.Windows.Forms.ImageList(Me.components)
        Me.ST.SuspendLayout()
        Me.CM.SuspendLayout()
        Me.ContextMenuStrip2.SuspendLayout()
        Me.SuspendLayout()
        '
        'ST
        '
        Me.ST.BackColor = System.Drawing.Color.Black
        Me.ST.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripStatusLabel1, Me.SL, Me.pr})
        Me.ST.Location = New System.Drawing.Point(0, 378)
        Me.ST.Name = "ST"
        Me.ST.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional
        Me.ST.Size = New System.Drawing.Size(824, 22)
        Me.ST.SizingGrip = False
        Me.ST.TabIndex = 0
        '
        'ToolStripStatusLabel1
        '
        Me.ToolStripStatusLabel1.ActiveLinkColor = System.Drawing.Color.White
        Me.ToolStripStatusLabel1.BackColor = System.Drawing.Color.Black
        Me.ToolStripStatusLabel1.ForeColor = System.Drawing.Color.White
        Me.ToolStripStatusLabel1.Name = "ToolStripStatusLabel1"
        Me.ToolStripStatusLabel1.Size = New System.Drawing.Size(42, 17)
        Me.ToolStripStatusLabel1.Text = "Status:"
        '
        'SL
        '
        Me.SL.ActiveLinkColor = System.Drawing.Color.White
        Me.SL.BackColor = System.Drawing.Color.Black
        Me.SL.ForeColor = System.Drawing.Color.White
        Me.SL.Name = "SL"
        Me.SL.Size = New System.Drawing.Size(13, 17)
        Me.SL.Text = ".."
        '
        'pr
        '
        Me.pr.Name = "pr"
        Me.pr.Size = New System.Drawing.Size(100, 16)
        '
        'Timer1
        '
        '
        'L1
        '
        Me.L1.BackColor = System.Drawing.Color.Black
        Me.L1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.L1.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2})
        Me.L1.ContextMenuStrip = Me.CM
        Me.L1.Dock = System.Windows.Forms.DockStyle.Left
        Me.L1.ForeColor = System.Drawing.Color.White
        Me.L1.FullRowSelect = True
        Me.L1.LargeImageList = Me.MG
        Me.L1.Location = New System.Drawing.Point(0, 0)
        Me.L1.Name = "L1"
        Me.L1.Size = New System.Drawing.Size(167, 378)
        Me.L1.SmallImageList = Me.MG
        Me.L1.TabIndex = 1
        Me.L1.UseCompatibleStateImageBehavior = False
        Me.L1.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Nome"
        Me.ColumnHeader1.Width = 80
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "Extensão"
        '
        'CM
        '
        Me.CM.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.RefreshToolStripMenuItem})
        Me.CM.Name = "ContextMenuStrip1"
        Me.CM.Size = New System.Drawing.Size(121, 26)
        '
        'RefreshToolStripMenuItem
        '
        Me.RefreshToolStripMenuItem.BackColor = System.Drawing.Color.Black
        Me.RefreshToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.RefreshToolStripMenuItem.Image = CType(resources.GetObject("RefreshToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RefreshToolStripMenuItem.Name = "RefreshToolStripMenuItem"
        Me.RefreshToolStripMenuItem.Size = New System.Drawing.Size(120, 22)
        Me.RefreshToolStripMenuItem.Text = "Atualizar"
        '
        'MG
        '
        Me.MG.ImageStream = CType(resources.GetObject("MG.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.MG.TransparentColor = System.Drawing.Color.Transparent
        Me.MG.Images.SetKeyName(0, "0.png")
        Me.MG.Images.SetKeyName(1, "1.png")
        Me.MG.Images.SetKeyName(2, "2.png")
        Me.MG.Images.SetKeyName(3, "3.png")
        Me.MG.Images.SetKeyName(4, "4.png")
        Me.MG.Images.SetKeyName(5, "5.png")
        Me.MG.Images.SetKeyName(6, "6.png")
        Me.MG.Images.SetKeyName(7, "7.png")
        Me.MG.Images.SetKeyName(8, "8.png")
        Me.MG.Images.SetKeyName(9, "9.png")
        Me.MG.Images.SetKeyName(10, "10.png")
        Me.MG.Images.SetKeyName(11, "11.png")
        Me.MG.Images.SetKeyName(12, "12.png")
        Me.MG.Images.SetKeyName(13, "13.png")
        Me.MG.Images.SetKeyName(14, "14.png")
        Me.MG.Images.SetKeyName(15, "15.png")
        Me.MG.Images.SetKeyName(16, "16.png")
        Me.MG.Images.SetKeyName(17, "17.png")
        Me.MG.Images.SetKeyName(18, "18.png")
        Me.MG.Images.SetKeyName(19, "19.png")
        Me.MG.Images.SetKeyName(20, "20.png")
        Me.MG.Images.SetKeyName(21, "21.png")
        Me.MG.Images.SetKeyName(22, "22.png")
        Me.MG.Images.SetKeyName(23, "23.png")
        Me.MG.Images.SetKeyName(24, "24.png")
        Me.MG.Images.SetKeyName(25, "25.png")
        Me.MG.Images.SetKeyName(26, "26.png")
        Me.MG.Images.SetKeyName(27, "27.png")
        Me.MG.Images.SetKeyName(28, "28.png")
        Me.MG.Images.SetKeyName(29, "29.png")
        Me.MG.Images.SetKeyName(30, "30.png")
        Me.MG.Images.SetKeyName(31, "31.png")
        Me.MG.Images.SetKeyName(32, "32.png")
        Me.MG.Images.SetKeyName(33, "33.png")
        Me.MG.Images.SetKeyName(34, "34.png")
        '
        'ContextMenuStrip2
        '
        Me.ContextMenuStrip2.BackColor = System.Drawing.Color.Black
        Me.ContextMenuStrip2.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.UPToolStripMenuItem, Me.RefreshToolStripMenuItem1, Me.RunToolStripMenuItem, Me.DeleteToolStripMenuItem, Me.EditToolStripMenuItem, Me.RenameToolStripMenuItem, Me.CopyToolStripMenuItem, Me.CutToolStripMenuItem, Me.PastToolStripMenuItem, Me.DownloadToolStripMenuItem, Me.UploadToolStripMenuItem, Me.NewEmptyFileToolStripMenuItem, Me.NewFolderToolStripMenuItem, Me.OpenFolderToolStripMenuItem})
        Me.ContextMenuStrip2.Name = "ContextMenuStrip2"
        Me.ContextMenuStrip2.RenderMode = System.Windows.Forms.ToolStripRenderMode.System
        Me.ContextMenuStrip2.Size = New System.Drawing.Size(202, 312)
        '
        'UPToolStripMenuItem
        '
        Me.UPToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.UPToolStripMenuItem.Image = CType(resources.GetObject("UPToolStripMenuItem.Image"), System.Drawing.Image)
        Me.UPToolStripMenuItem.Name = "UPToolStripMenuItem"
        Me.UPToolStripMenuItem.Size = New System.Drawing.Size(201, 22)
        Me.UPToolStripMenuItem.Text = "Voltar"
        '
        'RefreshToolStripMenuItem1
        '
        Me.RefreshToolStripMenuItem1.ForeColor = System.Drawing.Color.White
        Me.RefreshToolStripMenuItem1.Image = CType(resources.GetObject("RefreshToolStripMenuItem1.Image"), System.Drawing.Image)
        Me.RefreshToolStripMenuItem1.Name = "RefreshToolStripMenuItem1"
        Me.RefreshToolStripMenuItem1.Size = New System.Drawing.Size(201, 22)
        Me.RefreshToolStripMenuItem1.Text = "Atualizar"
        '
        'RunToolStripMenuItem
        '
        Me.RunToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.RunToolStripMenuItem.Image = CType(resources.GetObject("RunToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RunToolStripMenuItem.Name = "RunToolStripMenuItem"
        Me.RunToolStripMenuItem.Size = New System.Drawing.Size(201, 22)
        Me.RunToolStripMenuItem.Text = "Executar"
        '
        'DeleteToolStripMenuItem
        '
        Me.DeleteToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.DeleteToolStripMenuItem.Image = CType(resources.GetObject("DeleteToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DeleteToolStripMenuItem.Name = "DeleteToolStripMenuItem"
        Me.DeleteToolStripMenuItem.Size = New System.Drawing.Size(201, 22)
        Me.DeleteToolStripMenuItem.Text = "Excluir"
        '
        'EditToolStripMenuItem
        '
        Me.EditToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.EditToolStripMenuItem.Image = CType(resources.GetObject("EditToolStripMenuItem.Image"), System.Drawing.Image)
        Me.EditToolStripMenuItem.Name = "EditToolStripMenuItem"
        Me.EditToolStripMenuItem.Size = New System.Drawing.Size(201, 22)
        Me.EditToolStripMenuItem.Text = "Editar"
        '
        'RenameToolStripMenuItem
        '
        Me.RenameToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.RenameToolStripMenuItem.Image = CType(resources.GetObject("RenameToolStripMenuItem.Image"), System.Drawing.Image)
        Me.RenameToolStripMenuItem.Name = "RenameToolStripMenuItem"
        Me.RenameToolStripMenuItem.Size = New System.Drawing.Size(201, 22)
        Me.RenameToolStripMenuItem.Text = "Renomear"
        '
        'CopyToolStripMenuItem
        '
        Me.CopyToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.CopyToolStripMenuItem.Image = CType(resources.GetObject("CopyToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CopyToolStripMenuItem.Name = "CopyToolStripMenuItem"
        Me.CopyToolStripMenuItem.Size = New System.Drawing.Size(201, 22)
        Me.CopyToolStripMenuItem.Text = "Copiar"
        '
        'CutToolStripMenuItem
        '
        Me.CutToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.CutToolStripMenuItem.Image = CType(resources.GetObject("CutToolStripMenuItem.Image"), System.Drawing.Image)
        Me.CutToolStripMenuItem.Name = "CutToolStripMenuItem"
        Me.CutToolStripMenuItem.Size = New System.Drawing.Size(201, 22)
        Me.CutToolStripMenuItem.Text = "Recotar"
        '
        'PastToolStripMenuItem
        '
        Me.PastToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.PastToolStripMenuItem.Image = CType(resources.GetObject("PastToolStripMenuItem.Image"), System.Drawing.Image)
        Me.PastToolStripMenuItem.Name = "PastToolStripMenuItem"
        Me.PastToolStripMenuItem.Size = New System.Drawing.Size(201, 22)
        Me.PastToolStripMenuItem.Text = "Colar"
        '
        'DownloadToolStripMenuItem
        '
        Me.DownloadToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.DownloadToolStripMenuItem.Image = CType(resources.GetObject("DownloadToolStripMenuItem.Image"), System.Drawing.Image)
        Me.DownloadToolStripMenuItem.Name = "DownloadToolStripMenuItem"
        Me.DownloadToolStripMenuItem.Size = New System.Drawing.Size(201, 22)
        Me.DownloadToolStripMenuItem.Text = "Download"
        '
        'UploadToolStripMenuItem
        '
        Me.UploadToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.UploadToolStripMenuItem.Image = CType(resources.GetObject("UploadToolStripMenuItem.Image"), System.Drawing.Image)
        Me.UploadToolStripMenuItem.Name = "UploadToolStripMenuItem"
        Me.UploadToolStripMenuItem.Size = New System.Drawing.Size(201, 22)
        Me.UploadToolStripMenuItem.Text = "Enviar Arquivo"
        '
        'NewEmptyFileToolStripMenuItem
        '
        Me.NewEmptyFileToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.NewEmptyFileToolStripMenuItem.Image = CType(resources.GetObject("NewEmptyFileToolStripMenuItem.Image"), System.Drawing.Image)
        Me.NewEmptyFileToolStripMenuItem.Name = "NewEmptyFileToolStripMenuItem"
        Me.NewEmptyFileToolStripMenuItem.Size = New System.Drawing.Size(201, 22)
        Me.NewEmptyFileToolStripMenuItem.Text = "Novo Arquivo"
        '
        'NewFolderToolStripMenuItem
        '
        Me.NewFolderToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.NewFolderToolStripMenuItem.Image = CType(resources.GetObject("NewFolderToolStripMenuItem.Image"), System.Drawing.Image)
        Me.NewFolderToolStripMenuItem.Name = "NewFolderToolStripMenuItem"
        Me.NewFolderToolStripMenuItem.Size = New System.Drawing.Size(201, 22)
        Me.NewFolderToolStripMenuItem.Text = "Nova Pasta"
        '
        'OpenFolderToolStripMenuItem
        '
        Me.OpenFolderToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.OpenFolderToolStripMenuItem.Image = CType(resources.GetObject("OpenFolderToolStripMenuItem.Image"), System.Drawing.Image)
        Me.OpenFolderToolStripMenuItem.Name = "OpenFolderToolStripMenuItem"
        Me.OpenFolderToolStripMenuItem.Size = New System.Drawing.Size(201, 22)
        Me.OpenFolderToolStripMenuItem.Text = "Abrir Pasta (Downloads)"
        '
        'TextBox1
        '
        Me.TextBox1.BackColor = System.Drawing.Color.Black
        Me.TextBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBox1.Cursor = System.Windows.Forms.Cursors.Default
        Me.TextBox1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.TextBox1.Enabled = False
        Me.TextBox1.ForeColor = System.Drawing.Color.MediumSlateBlue
        Me.TextBox1.Location = New System.Drawing.Point(167, 358)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.ReadOnly = True
        Me.TextBox1.Size = New System.Drawing.Size(657, 20)
        Me.TextBox1.TabIndex = 5
        '
        'L2
        '
        Me.L2.BackColor = System.Drawing.Color.Black
        Me.L2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.L2.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader3, Me.ColumnHeader4, Me.ColumnHeader5})
        Me.L2.ContextMenuStrip = Me.ContextMenuStrip2
        Me.L2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.L2.ForeColor = System.Drawing.Color.White
        Me.L2.FullRowSelect = True
        Me.L2.LargeImageList = Me.MG2
        Me.L2.Location = New System.Drawing.Point(167, 0)
        Me.L2.Name = "L2"
        Me.L2.Size = New System.Drawing.Size(657, 358)
        Me.L2.SmallImageList = Me.MG2
        Me.L2.TabIndex = 6
        Me.L2.UseCompatibleStateImageBehavior = False
        Me.L2.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "Nome"
        '
        'ColumnHeader4
        '
        Me.ColumnHeader4.Text = "Tamanho"
        '
        'ColumnHeader5
        '
        Me.ColumnHeader5.Text = "Extensão"
        '
        'MG2
        '
        Me.MG2.ImageStream = CType(resources.GetObject("MG2.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.MG2.TransparentColor = System.Drawing.Color.Transparent
        Me.MG2.Images.SetKeyName(0, "0.png")
        Me.MG2.Images.SetKeyName(1, "1.png")
        Me.MG2.Images.SetKeyName(2, "2.png")
        Me.MG2.Images.SetKeyName(3, "3.png")
        Me.MG2.Images.SetKeyName(4, "4.png")
        Me.MG2.Images.SetKeyName(5, "5.png")
        Me.MG2.Images.SetKeyName(6, "6.png")
        Me.MG2.Images.SetKeyName(7, "7.png")
        Me.MG2.Images.SetKeyName(8, "8.png")
        Me.MG2.Images.SetKeyName(9, "9.png")
        Me.MG2.Images.SetKeyName(10, "10.png")
        Me.MG2.Images.SetKeyName(11, "11.png")
        Me.MG2.Images.SetKeyName(12, "12.png")
        Me.MG2.Images.SetKeyName(13, "13.png")
        Me.MG2.Images.SetKeyName(14, "14.png")
        Me.MG2.Images.SetKeyName(15, "15.png")
        Me.MG2.Images.SetKeyName(16, "16.png")
        Me.MG2.Images.SetKeyName(17, "17.png")
        Me.MG2.Images.SetKeyName(18, "18.png")
        Me.MG2.Images.SetKeyName(19, "19.png")
        Me.MG2.Images.SetKeyName(20, "20.png")
        Me.MG2.Images.SetKeyName(21, "21.png")
        Me.MG2.Images.SetKeyName(22, "22.png")
        Me.MG2.Images.SetKeyName(23, "23.png")
        Me.MG2.Images.SetKeyName(24, "24.png")
        Me.MG2.Images.SetKeyName(25, "25.png")
        Me.MG2.Images.SetKeyName(26, "26.png")
        Me.MG2.Images.SetKeyName(27, "27.png")
        Me.MG2.Images.SetKeyName(28, "28.png")
        Me.MG2.Images.SetKeyName(29, "29.png")
        Me.MG2.Images.SetKeyName(30, "30.png")
        Me.MG2.Images.SetKeyName(31, "31.png")
        Me.MG2.Images.SetKeyName(32, "32.png")
        Me.MG2.Images.SetKeyName(33, "33.png")
        Me.MG2.Images.SetKeyName(34, "34.png")
        '
        'FrmGerenciadorArquivos
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(824, 400)
        Me.Controls.Add(Me.L2)
        Me.Controls.Add(Me.TextBox1)
        Me.Controls.Add(Me.L1)
        Me.Controls.Add(Me.ST)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "FrmGerenciadorArquivos"
        Me.Text = "Gerenciador de Arquivos "
        Me.ST.ResumeLayout(False)
        Me.ST.PerformLayout()
        Me.CM.ResumeLayout(False)
        Me.ContextMenuStrip2.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents ST As System.Windows.Forms.StatusStrip
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents L1 As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents CM As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents RefreshToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ContextMenuStrip2 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents UPToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RefreshToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents ColumnHeader3 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader4 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader5 As System.Windows.Forms.ColumnHeader
    Friend WithEvents RunToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DeleteToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents EditToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RenameToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CopyToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CutToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PastToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DownloadToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UploadToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents NewEmptyFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents NewFolderToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents OpenFolderToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripStatusLabel1 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents SL As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents pr As System.Windows.Forms.ToolStripProgressBar
    Friend WithEvents MG2 As System.Windows.Forms.ImageList
    Friend WithEvents MG As System.Windows.Forms.ImageList
    Friend WithEvents L2 As System.Windows.Forms.ListView
End Class
