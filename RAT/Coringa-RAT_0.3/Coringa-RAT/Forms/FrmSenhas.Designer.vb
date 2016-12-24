<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmSenhas
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmSenhas))
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.PassToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ImageList1 = New System.Windows.Forms.ImageList(Me.components)
        Me.L1 = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader5 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader4 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ContextMenuStrip1 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.CopyUserToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CopyPassToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CopySiteToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.CopyALLToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SaveAllToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.InClipboardToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.InDiskToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.FindToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RemoveEmptyPWToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.OpenFileDialog1 = New System.Windows.Forms.OpenFileDialog()
        Me.sf = New System.Windows.Forms.SaveFileDialog()
        Me.MenuStrip1.SuspendLayout()
        Me.ContextMenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'MenuStrip1
        '
        Me.MenuStrip1.BackColor = System.Drawing.Color.Black
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.PassToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(481, 24)
        Me.MenuStrip1.TabIndex = 0
        '
        'PassToolStripMenuItem
        '
        Me.PassToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.PassToolStripMenuItem.Name = "PassToolStripMenuItem"
        Me.PassToolStripMenuItem.Size = New System.Drawing.Size(56, 20)
        Me.PassToolStripMenuItem.Text = "Senhas"
        '
        'ImageList1
        '
        Me.ImageList1.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit
        Me.ImageList1.ImageSize = New System.Drawing.Size(16, 16)
        Me.ImageList1.TransparentColor = System.Drawing.Color.Transparent
        '
        'L1
        '
        Me.L1.BackColor = System.Drawing.Color.Black
        Me.L1.BorderStyle = System.Windows.Forms.BorderStyle.None
        Me.L1.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader5, Me.ColumnHeader4})
        Me.L1.ContextMenuStrip = Me.ContextMenuStrip1
        Me.L1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.L1.ForeColor = System.Drawing.Color.White
        Me.L1.LargeImageList = Me.ImageList1
        Me.L1.Location = New System.Drawing.Point(0, 24)
        Me.L1.Name = "L1"
        Me.L1.Size = New System.Drawing.Size(481, 234)
        Me.L1.SmallImageList = Me.ImageList1
        Me.L1.TabIndex = 1
        Me.L1.UseCompatibleStateImageBehavior = False
        Me.L1.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Usuário"
        Me.ColumnHeader1.Width = 115
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "Senha"
        Me.ColumnHeader2.Width = 120
        '
        'ColumnHeader5
        '
        Me.ColumnHeader5.Text = "URL"
        Me.ColumnHeader5.Width = 90
        '
        'ColumnHeader4
        '
        Me.ColumnHeader4.Text = "Applicativo"
        Me.ColumnHeader4.Width = 154
        '
        'ContextMenuStrip1
        '
        Me.ContextMenuStrip1.BackColor = System.Drawing.Color.Black
        Me.ContextMenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.CopyUserToolStripMenuItem, Me.CopyPassToolStripMenuItem, Me.CopySiteToolStripMenuItem, Me.CopyALLToolStripMenuItem, Me.SaveAllToolStripMenuItem, Me.FindToolStripMenuItem, Me.RemoveEmptyPWToolStripMenuItem})
        Me.ContextMenuStrip1.Name = "ContextMenuStrip1"
        Me.ContextMenuStrip1.ShowImageMargin = False
        Me.ContextMenuStrip1.Size = New System.Drawing.Size(128, 158)
        '
        'CopyUserToolStripMenuItem
        '
        Me.CopyUserToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.CopyUserToolStripMenuItem.Name = "CopyUserToolStripMenuItem"
        Me.CopyUserToolStripMenuItem.Size = New System.Drawing.Size(127, 22)
        Me.CopyUserToolStripMenuItem.Text = "Copiar Usuário"
        '
        'CopyPassToolStripMenuItem
        '
        Me.CopyPassToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.CopyPassToolStripMenuItem.Name = "CopyPassToolStripMenuItem"
        Me.CopyPassToolStripMenuItem.Size = New System.Drawing.Size(127, 22)
        Me.CopyPassToolStripMenuItem.Text = "Copiar Senha"
        '
        'CopySiteToolStripMenuItem
        '
        Me.CopySiteToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.CopySiteToolStripMenuItem.Name = "CopySiteToolStripMenuItem"
        Me.CopySiteToolStripMenuItem.Size = New System.Drawing.Size(127, 22)
        Me.CopySiteToolStripMenuItem.Text = "Copiar URL"
        '
        'CopyALLToolStripMenuItem
        '
        Me.CopyALLToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.CopyALLToolStripMenuItem.Name = "CopyALLToolStripMenuItem"
        Me.CopyALLToolStripMenuItem.Size = New System.Drawing.Size(127, 22)
        Me.CopyALLToolStripMenuItem.Text = "Copiar Tudo"
        '
        'SaveAllToolStripMenuItem
        '
        Me.SaveAllToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.InClipboardToolStripMenuItem, Me.InDiskToolStripMenuItem})
        Me.SaveAllToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.SaveAllToolStripMenuItem.Name = "SaveAllToolStripMenuItem"
        Me.SaveAllToolStripMenuItem.Size = New System.Drawing.Size(127, 22)
        Me.SaveAllToolStripMenuItem.Text = "Salvar"
        '
        'InClipboardToolStripMenuItem
        '
        Me.InClipboardToolStripMenuItem.Name = "InClipboardToolStripMenuItem"
        Me.InClipboardToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.InClipboardToolStripMenuItem.Text = "in Clipboard"
        '
        'InDiskToolStripMenuItem
        '
        Me.InDiskToolStripMenuItem.Name = "InDiskToolStripMenuItem"
        Me.InDiskToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.InDiskToolStripMenuItem.Text = "in Disk"
        '
        'FindToolStripMenuItem
        '
        Me.FindToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.FindToolStripMenuItem.Name = "FindToolStripMenuItem"
        Me.FindToolStripMenuItem.Size = New System.Drawing.Size(127, 22)
        Me.FindToolStripMenuItem.Text = "Procurar"
        '
        'RemoveEmptyPWToolStripMenuItem
        '
        Me.RemoveEmptyPWToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.RemoveEmptyPWToolStripMenuItem.Name = "RemoveEmptyPWToolStripMenuItem"
        Me.RemoveEmptyPWToolStripMenuItem.Size = New System.Drawing.Size(127, 22)
        Me.RemoveEmptyPWToolStripMenuItem.Text = "Excluir"
        '
        'OpenFileDialog1
        '
        Me.OpenFileDialog1.FileName = "OpenFileDialog1"
        '
        'FrmSenhas
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(481, 258)
        Me.Controls.Add(Me.L1)
        Me.Controls.Add(Me.MenuStrip1)
        Me.ForeColor = System.Drawing.Color.White
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "FrmSenhas"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Senhas "
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.ContextMenuStrip1.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents ImageList1 As System.Windows.Forms.ImageList
    Friend WithEvents L1 As System.Windows.Forms.ListView
    Friend WithEvents OpenFileDialog1 As System.Windows.Forms.OpenFileDialog
    Friend WithEvents ContextMenuStrip1 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents CopyUserToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CopyPassToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CopySiteToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CopyALLToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SaveAllToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents InClipboardToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents InDiskToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents FindToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RemoveEmptyPWToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents sf As System.Windows.Forms.SaveFileDialog
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader5 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader4 As System.Windows.Forms.ColumnHeader
    Friend WithEvents PassToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
End Class
