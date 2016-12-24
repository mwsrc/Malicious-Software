<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmMineGerenciadorArquivos
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmMineGerenciadorArquivos))
        Dim TreeNode1 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Documentos")
        Dim TreeNode2 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Imagens")
        Dim TreeNode3 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Músicas")
        Dim TreeNode4 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Vídeos")
        Dim TreeNode5 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Bibliotecas", New System.Windows.Forms.TreeNode() {TreeNode1, TreeNode2, TreeNode3, TreeNode4})
        Dim TreeNode6 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Área de Trabalho")
        Dim TreeNode7 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Arquivos de Programas")
        Dim TreeNode8 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Downloads")
        Dim TreeNode9 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Inicializar")
        Dim TreeNode10 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Windows")
        Dim TreeNode11 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Sistema")
        Dim TreeNode12 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Pastas", New System.Windows.Forms.TreeNode() {TreeNode6, TreeNode7, TreeNode8, TreeNode9, TreeNode10, TreeNode11})
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.lbCaminho = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.GroupBox3 = New System.Windows.Forms.GroupBox()
        Me.ListView1 = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.IM = New System.Windows.Forms.ImageList(Me.components)
        Me.Button1 = New System.Windows.Forms.Button()
        Me.btnVisualizar = New System.Windows.Forms.Button()
        Me.lbArquivos = New System.Windows.Forms.Label()
        Me.btnAtualizar = New System.Windows.Forms.Button()
        Me.btnRenomear = New System.Windows.Forms.Button()
        Me.btnExcluir = New System.Windows.Forms.Button()
        Me.btnUpload = New System.Windows.Forms.Button()
        Me.btnBaixar = New System.Windows.Forms.Button()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.TVDiretoriosPadrao = New System.Windows.Forms.TreeView()
        Me.ProgressBar1 = New System.Windows.Forms.ProgressBar()
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.lbCaminho)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.GroupBox3)
        Me.GroupBox1.Controls.Add(Me.Button1)
        Me.GroupBox1.Controls.Add(Me.btnVisualizar)
        Me.GroupBox1.Controls.Add(Me.lbArquivos)
        Me.GroupBox1.Controls.Add(Me.btnAtualizar)
        Me.GroupBox1.Controls.Add(Me.btnRenomear)
        Me.GroupBox1.Controls.Add(Me.btnExcluir)
        Me.GroupBox1.Controls.Add(Me.btnUpload)
        Me.GroupBox1.Controls.Add(Me.btnBaixar)
        Me.GroupBox1.Controls.Add(Me.GroupBox2)
        Me.GroupBox1.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox1.ForeColor = System.Drawing.Color.White
        Me.GroupBox1.Location = New System.Drawing.Point(5, 3)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(877, 442)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Informações"
        '
        'lbCaminho
        '
        Me.lbCaminho.Location = New System.Drawing.Point(39, 18)
        Me.lbCaminho.Name = "lbCaminho"
        Me.lbCaminho.Size = New System.Drawing.Size(833, 13)
        Me.lbCaminho.TabIndex = 15
        Me.lbCaminho.Text = "None"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(2, 18)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(40, 13)
        Me.Label1.TabIndex = 17
        Me.Label1.Text = "Local :"
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.ListView1)
        Me.GroupBox3.ForeColor = System.Drawing.Color.White
        Me.GroupBox3.Location = New System.Drawing.Point(244, 34)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(628, 370)
        Me.GroupBox3.TabIndex = 22
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "Resultado (Arquivos/Pastas)"
        '
        'ListView1
        '
        Me.ListView1.BackColor = System.Drawing.Color.Black
        Me.ListView1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.ListView1.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2})
        Me.ListView1.ForeColor = System.Drawing.Color.White
        Me.ListView1.FullRowSelect = True
        Me.ListView1.GridLines = True
        Me.ListView1.Location = New System.Drawing.Point(6, 15)
        Me.ListView1.MultiSelect = False
        Me.ListView1.Name = "ListView1"
        Me.ListView1.Size = New System.Drawing.Size(616, 349)
        Me.ListView1.SmallImageList = Me.IM
        Me.ListView1.TabIndex = 6
        Me.ListView1.UseCompatibleStateImageBehavior = False
        Me.ListView1.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Nome"
        Me.ColumnHeader1.Width = 484
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "Tamanho"
        Me.ColumnHeader2.Width = 130
        '
        'IM
        '
        Me.IM.ImageStream = CType(resources.GetObject("IM.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.IM.TransparentColor = System.Drawing.Color.Transparent
        Me.IM.Images.SetKeyName(0, "180.png")
        Me.IM.Images.SetKeyName(1, "181.png")
        Me.IM.Images.SetKeyName(2, "183.png")
        Me.IM.Images.SetKeyName(3, "184.png")
        Me.IM.Images.SetKeyName(4, "185.png")
        Me.IM.Images.SetKeyName(5, "186.png")
        Me.IM.Images.SetKeyName(6, "192.png")
        Me.IM.Images.SetKeyName(7, "188.png")
        Me.IM.Images.SetKeyName(8, "189.png")
        Me.IM.Images.SetKeyName(9, "190.png")
        Me.IM.Images.SetKeyName(10, "191.png")
        Me.IM.Images.SetKeyName(11, "193.png")
        Me.IM.Images.SetKeyName(12, "194.png")
        Me.IM.Images.SetKeyName(13, "195.png")
        Me.IM.Images.SetKeyName(14, "196.png")
        Me.IM.Images.SetKeyName(15, "197.png")
        Me.IM.Images.SetKeyName(16, "198.png")
        Me.IM.Images.SetKeyName(17, "199.png")
        Me.IM.Images.SetKeyName(18, "200.png")
        Me.IM.Images.SetKeyName(19, "201.png")
        Me.IM.Images.SetKeyName(20, "202.png")
        Me.IM.Images.SetKeyName(21, "203.png")
        Me.IM.Images.SetKeyName(22, "204.png")
        Me.IM.Images.SetKeyName(23, "205.png")
        Me.IM.Images.SetKeyName(24, "210.png")
        Me.IM.Images.SetKeyName(25, "211.png")
        Me.IM.Images.SetKeyName(26, "212.png")
        Me.IM.Images.SetKeyName(27, "213.png")
        Me.IM.Images.SetKeyName(28, "214.png")
        '
        'Button1
        '
        Me.Button1.Cursor = System.Windows.Forms.Cursors.Hand
        Me.Button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.Button1.Location = New System.Drawing.Point(154, 410)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(96, 25)
        Me.Button1.TabIndex = 7
        Me.Button1.Text = "Voltar"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'btnVisualizar
        '
        Me.btnVisualizar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnVisualizar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnVisualizar.Location = New System.Drawing.Point(670, 410)
        Me.btnVisualizar.Name = "btnVisualizar"
        Me.btnVisualizar.Size = New System.Drawing.Size(98, 25)
        Me.btnVisualizar.TabIndex = 19
        Me.btnVisualizar.Text = "Visualizar"
        Me.btnVisualizar.UseVisualStyleBackColor = True
        '
        'lbArquivos
        '
        Me.lbArquivos.AutoSize = True
        Me.lbArquivos.Location = New System.Drawing.Point(8, 416)
        Me.lbArquivos.Name = "lbArquivos"
        Me.lbArquivos.Size = New System.Drawing.Size(88, 13)
        Me.lbArquivos.TabIndex = 16
        Me.lbArquivos.Text = "Arquivos : (0/0)"
        '
        'btnAtualizar
        '
        Me.btnAtualizar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnAtualizar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnAtualizar.Location = New System.Drawing.Point(774, 410)
        Me.btnAtualizar.Name = "btnAtualizar"
        Me.btnAtualizar.Size = New System.Drawing.Size(98, 25)
        Me.btnAtualizar.TabIndex = 12
        Me.btnAtualizar.Text = "Atualizar"
        Me.btnAtualizar.UseVisualStyleBackColor = True
        '
        'btnRenomear
        '
        Me.btnRenomear.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnRenomear.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnRenomear.Location = New System.Drawing.Point(566, 410)
        Me.btnRenomear.Name = "btnRenomear"
        Me.btnRenomear.Size = New System.Drawing.Size(98, 25)
        Me.btnRenomear.TabIndex = 11
        Me.btnRenomear.Text = "Renomear"
        Me.btnRenomear.UseVisualStyleBackColor = True
        '
        'btnExcluir
        '
        Me.btnExcluir.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnExcluir.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnExcluir.Location = New System.Drawing.Point(462, 410)
        Me.btnExcluir.Name = "btnExcluir"
        Me.btnExcluir.Size = New System.Drawing.Size(98, 25)
        Me.btnExcluir.TabIndex = 10
        Me.btnExcluir.Text = "Excluir"
        Me.btnExcluir.UseVisualStyleBackColor = True
        '
        'btnUpload
        '
        Me.btnUpload.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnUpload.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnUpload.Location = New System.Drawing.Point(358, 410)
        Me.btnUpload.Name = "btnUpload"
        Me.btnUpload.Size = New System.Drawing.Size(98, 25)
        Me.btnUpload.TabIndex = 9
        Me.btnUpload.Text = "Enviar"
        Me.btnUpload.UseVisualStyleBackColor = True
        '
        'btnBaixar
        '
        Me.btnBaixar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnBaixar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnBaixar.Location = New System.Drawing.Point(256, 410)
        Me.btnBaixar.Name = "btnBaixar"
        Me.btnBaixar.Size = New System.Drawing.Size(96, 25)
        Me.btnBaixar.TabIndex = 8
        Me.btnBaixar.Text = "Baixar"
        Me.btnBaixar.UseVisualStyleBackColor = True
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.TVDiretoriosPadrao)
        Me.GroupBox2.ForeColor = System.Drawing.Color.White
        Me.GroupBox2.Location = New System.Drawing.Point(5, 34)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(235, 370)
        Me.GroupBox2.TabIndex = 21
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Diretórios Padrão"
        '
        'TVDiretoriosPadrao
        '
        Me.TVDiretoriosPadrao.BackColor = System.Drawing.Color.Black
        Me.TVDiretoriosPadrao.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TVDiretoriosPadrao.ForeColor = System.Drawing.Color.White
        Me.TVDiretoriosPadrao.ImageIndex = 0
        Me.TVDiretoriosPadrao.ImageList = Me.IM
        Me.TVDiretoriosPadrao.Indent = 21
        Me.TVDiretoriosPadrao.ItemHeight = 18
        Me.TVDiretoriosPadrao.LineColor = System.Drawing.Color.White
        Me.TVDiretoriosPadrao.Location = New System.Drawing.Point(6, 15)
        Me.TVDiretoriosPadrao.Name = "TVDiretoriosPadrao"
        TreeNode1.ImageKey = "210.png"
        TreeNode1.Name = "Node1"
        TreeNode1.Text = "Documentos"
        TreeNode2.ImageKey = "211.png"
        TreeNode2.Name = "Node2"
        TreeNode2.Text = "Imagens"
        TreeNode3.ImageKey = "212.png"
        TreeNode3.Name = "Node3"
        TreeNode3.Text = "Músicas"
        TreeNode4.ImageKey = "213.png"
        TreeNode4.Name = "Node4"
        TreeNode4.Text = "Vídeos"
        TreeNode5.ImageKey = "214.png"
        TreeNode5.Name = "Node0"
        TreeNode5.Text = "Bibliotecas"
        TreeNode6.Name = "Node6"
        TreeNode6.Text = "Área de Trabalho"
        TreeNode7.Name = "Node7"
        TreeNode7.Text = "Arquivos de Programas"
        TreeNode8.Name = "Node8"
        TreeNode8.Text = "Downloads"
        TreeNode9.Name = "Node9"
        TreeNode9.Text = "Inicializar"
        TreeNode10.Name = "Node10"
        TreeNode10.Text = "Windows"
        TreeNode11.Name = "Node0"
        TreeNode11.Text = "Sistema"
        TreeNode12.Name = "Node5"
        TreeNode12.Text = "Pastas"
        Me.TVDiretoriosPadrao.Nodes.AddRange(New System.Windows.Forms.TreeNode() {TreeNode5, TreeNode12})
        Me.TVDiretoriosPadrao.SelectedImageIndex = 0
        Me.TVDiretoriosPadrao.ShowRootLines = False
        Me.TVDiretoriosPadrao.Size = New System.Drawing.Size(224, 349)
        Me.TVDiretoriosPadrao.TabIndex = 20
        '
        'ProgressBar1
        '
        Me.ProgressBar1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.ProgressBar1.Location = New System.Drawing.Point(0, 449)
        Me.ProgressBar1.Name = "ProgressBar1"
        Me.ProgressBar1.Size = New System.Drawing.Size(886, 14)
        Me.ProgressBar1.TabIndex = 14
        '
        'FrmMineGerenciadorArquivos
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(886, 463)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.ProgressBar1)
        Me.ForeColor = System.Drawing.Color.White
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.MaximizeBox = False
        Me.Name = "FrmMineGerenciadorArquivos"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Mine Gerenciador de Arquivos"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox2.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents ListView1 As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents btnAtualizar As System.Windows.Forms.Button
    Friend WithEvents btnRenomear As System.Windows.Forms.Button
    Friend WithEvents btnExcluir As System.Windows.Forms.Button
    Friend WithEvents btnUpload As System.Windows.Forms.Button
    Friend WithEvents btnBaixar As System.Windows.Forms.Button
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents ProgressBar1 As System.Windows.Forms.ProgressBar
    Friend WithEvents lbCaminho As System.Windows.Forms.Label
    Friend WithEvents IM As System.Windows.Forms.ImageList
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents lbArquivos As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents btnVisualizar As System.Windows.Forms.Button
    Friend WithEvents TVDiretoriosPadrao As System.Windows.Forms.TreeView
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
End Class
