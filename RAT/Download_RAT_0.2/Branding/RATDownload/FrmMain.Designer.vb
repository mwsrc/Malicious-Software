<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmMain
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmMain))
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.CBcategorias = New System.Windows.Forms.ComboBox()
        Me.LinkLabel1 = New System.Windows.Forms.LinkLabel()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.btn_Procurar = New System.Windows.Forms.Button()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.TXT_Diretorio = New System.Windows.Forms.TextBox()
        Me.LbStatus = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.LV_Resultado = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.CM = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.TM_Download = New System.Windows.Forms.ToolStripMenuItem()
        Me.InformaçõesToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.IM = New System.Windows.Forms.ImageList(Me.components)
        Me.TXT_Procurar = New System.Windows.Forms.TextBox()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.GroupBox1.SuspendLayout()
        Me.CM.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.CBcategorias)
        Me.GroupBox1.Controls.Add(Me.LinkLabel1)
        Me.GroupBox1.Controls.Add(Me.Label4)
        Me.GroupBox1.Controls.Add(Me.btn_Procurar)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Controls.Add(Me.TXT_Diretorio)
        Me.GroupBox1.Controls.Add(Me.LbStatus)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.LV_Resultado)
        Me.GroupBox1.Controls.Add(Me.TXT_Procurar)
        Me.GroupBox1.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox1.Location = New System.Drawing.Point(6, 163)
        Me.GroupBox1.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Padding = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.GroupBox1.Size = New System.Drawing.Size(601, 477)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "RAT"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(358, 431)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(62, 13)
        Me.Label2.TabIndex = 11
        Me.Label2.Text = "Categorias"
        '
        'CBcategorias
        '
        Me.CBcategorias.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.CBcategorias.FormattingEnabled = True
        Me.CBcategorias.Items.AddRange(New Object() {"Trojans", "Scanners", "Outros [Disabled]"})
        Me.CBcategorias.Location = New System.Drawing.Point(361, 448)
        Me.CBcategorias.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.CBcategorias.Name = "CBcategorias"
        Me.CBcategorias.Size = New System.Drawing.Size(144, 21)
        Me.CBcategorias.TabIndex = 10
        '
        'LinkLabel1
        '
        Me.LinkLabel1.AutoSize = True
        Me.LinkLabel1.Location = New System.Drawing.Point(522, 58)
        Me.LinkLabel1.Name = "LinkLabel1"
        Me.LinkLabel1.Size = New System.Drawing.Size(71, 13)
        Me.LinkLabel1.TabIndex = 9
        Me.LinkLabel1.TabStop = True
        Me.LinkLabel1.Text = "Informações"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Cursor = System.Windows.Forms.Cursors.Hand
        Me.Label4.ForeColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.Label4.Location = New System.Drawing.Point(487, 15)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(106, 13)
        Me.Label4.TabIndex = 8
        Me.Label4.Text = "Senha : SooftT2015"
        '
        'btn_Procurar
        '
        Me.btn_Procurar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btn_Procurar.Image = CType(resources.GetObject("btn_Procurar.Image"), System.Drawing.Image)
        Me.btn_Procurar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btn_Procurar.Location = New System.Drawing.Point(509, 441)
        Me.btn_Procurar.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.btn_Procurar.Name = "btn_Procurar"
        Me.btn_Procurar.Size = New System.Drawing.Size(84, 30)
        Me.btn_Procurar.TabIndex = 7
        Me.btn_Procurar.Text = "Procurar"
        Me.btn_Procurar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btn_Procurar.UseVisualStyleBackColor = True
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(7, 431)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(118, 13)
        Me.Label3.TabIndex = 6
        Me.Label3.Text = "Diretório (Download)"
        '
        'TXT_Diretorio
        '
        Me.TXT_Diretorio.Location = New System.Drawing.Point(10, 448)
        Me.TXT_Diretorio.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.TXT_Diretorio.Name = "TXT_Diretorio"
        Me.TXT_Diretorio.Size = New System.Drawing.Size(345, 22)
        Me.TXT_Diretorio.TabIndex = 5
        '
        'LbStatus
        '
        Me.LbStatus.AutoSize = True
        Me.LbStatus.Location = New System.Drawing.Point(7, 58)
        Me.LbStatus.Name = "LbStatus"
        Me.LbStatus.Size = New System.Drawing.Size(59, 13)
        Me.LbStatus.TabIndex = 4
        Me.LbStatus.Text = "Resultado"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(7, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(39, 13)
        Me.Label1.TabIndex = 3
        Me.Label1.Text = "Nome"
        '
        'LV_Resultado
        '
        Me.LV_Resultado.BackColor = System.Drawing.Color.White
        Me.LV_Resultado.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2})
        Me.LV_Resultado.ContextMenuStrip = Me.CM
        Me.LV_Resultado.ForeColor = System.Drawing.Color.Black
        Me.LV_Resultado.FullRowSelect = True
        Me.LV_Resultado.GridLines = True
        Me.LV_Resultado.Location = New System.Drawing.Point(10, 75)
        Me.LV_Resultado.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.LV_Resultado.Name = "LV_Resultado"
        Me.LV_Resultado.Size = New System.Drawing.Size(583, 351)
        Me.LV_Resultado.SmallImageList = Me.IM
        Me.LV_Resultado.TabIndex = 2
        Me.LV_Resultado.UseCompatibleStateImageBehavior = False
        Me.LV_Resultado.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Nome"
        Me.ColumnHeader1.Width = 342
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "Tamanho"
        Me.ColumnHeader2.Width = 218
        '
        'CM
        '
        Me.CM.ImageScalingSize = New System.Drawing.Size(24, 24)
        Me.CM.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.TM_Download, Me.InformaçõesToolStripMenuItem})
        Me.CM.Name = "CM"
        Me.CM.Size = New System.Drawing.Size(153, 64)
        '
        'TM_Download
        '
        Me.TM_Download.Font = New System.Drawing.Font("Segoe UI", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.TM_Download.Image = CType(resources.GetObject("TM_Download.Image"), System.Drawing.Image)
        Me.TM_Download.Name = "TM_Download"
        Me.TM_Download.Size = New System.Drawing.Size(152, 30)
        Me.TM_Download.Text = "Download"
        '
        'InformaçõesToolStripMenuItem
        '
        Me.InformaçõesToolStripMenuItem.Font = New System.Drawing.Font("Segoe UI", 9.0!, System.Drawing.FontStyle.Bold)
        Me.InformaçõesToolStripMenuItem.Image = CType(resources.GetObject("InformaçõesToolStripMenuItem.Image"), System.Drawing.Image)
        Me.InformaçõesToolStripMenuItem.Name = "InformaçõesToolStripMenuItem"
        Me.InformaçõesToolStripMenuItem.Size = New System.Drawing.Size(152, 30)
        Me.InformaçõesToolStripMenuItem.Text = "Informações"
        '
        'IM
        '
        Me.IM.ImageStream = CType(resources.GetObject("IM.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.IM.TransparentColor = System.Drawing.Color.Transparent
        Me.IM.Images.SetKeyName(0, "02.png")
        Me.IM.Images.SetKeyName(1, "01.png")
        Me.IM.Images.SetKeyName(2, "04.png")
        Me.IM.Images.SetKeyName(3, "05.png")
        Me.IM.Images.SetKeyName(4, "06.png")
        Me.IM.Images.SetKeyName(5, "07.png")
        Me.IM.Images.SetKeyName(6, "08.png")
        Me.IM.Images.SetKeyName(7, "09.png")
        Me.IM.Images.SetKeyName(8, "10.png")
        Me.IM.Images.SetKeyName(9, "11.png")
        Me.IM.Images.SetKeyName(10, "12.png")
        Me.IM.Images.SetKeyName(11, "13.png")
        Me.IM.Images.SetKeyName(12, "14.png")
        Me.IM.Images.SetKeyName(13, "15.png")
        Me.IM.Images.SetKeyName(14, "16.png")
        Me.IM.Images.SetKeyName(15, "17.png")
        Me.IM.Images.SetKeyName(16, "18.png")
        Me.IM.Images.SetKeyName(17, "19.png")
        Me.IM.Images.SetKeyName(18, "20.png")
        Me.IM.Images.SetKeyName(19, "21.png")
        Me.IM.Images.SetKeyName(20, "22.ico")
        Me.IM.Images.SetKeyName(21, "23.png")
        Me.IM.Images.SetKeyName(22, "24.ico")
        Me.IM.Images.SetKeyName(23, "25.png")
        Me.IM.Images.SetKeyName(24, "26.ico")
        Me.IM.Images.SetKeyName(25, "27.png")
        Me.IM.Images.SetKeyName(26, "28.ico")
        Me.IM.Images.SetKeyName(27, "29.png")
        Me.IM.Images.SetKeyName(28, "30.png")
        Me.IM.Images.SetKeyName(29, "31.png")
        Me.IM.Images.SetKeyName(30, "32.png")
        Me.IM.Images.SetKeyName(31, "33.png")
        Me.IM.Images.SetKeyName(32, "34.png")
        Me.IM.Images.SetKeyName(33, "35.png")
        Me.IM.Images.SetKeyName(34, "36.png")
        Me.IM.Images.SetKeyName(35, "37.png")
        Me.IM.Images.SetKeyName(36, "38.png")
        Me.IM.Images.SetKeyName(37, "39.png")
        Me.IM.Images.SetKeyName(38, "40.png")
        Me.IM.Images.SetKeyName(39, "41.png")
        Me.IM.Images.SetKeyName(40, "42.png")
        Me.IM.Images.SetKeyName(41, "43.png")
        Me.IM.Images.SetKeyName(42, "44.png")
        Me.IM.Images.SetKeyName(43, "45.png")
        Me.IM.Images.SetKeyName(44, "46.png")
        Me.IM.Images.SetKeyName(45, "47.png")
        Me.IM.Images.SetKeyName(46, "48.png")
        Me.IM.Images.SetKeyName(47, "49.png")
        Me.IM.Images.SetKeyName(48, "50.png")
        Me.IM.Images.SetKeyName(49, "51.png")
        Me.IM.Images.SetKeyName(50, "52.png")
        Me.IM.Images.SetKeyName(51, "53.png")
        Me.IM.Images.SetKeyName(52, "54.png")
        Me.IM.Images.SetKeyName(53, "55.png")
        Me.IM.Images.SetKeyName(54, "56.png")
        Me.IM.Images.SetKeyName(55, "57.png")
        Me.IM.Images.SetKeyName(56, "58.png")
        Me.IM.Images.SetKeyName(57, "59.png")
        Me.IM.Images.SetKeyName(58, "60.png")
        Me.IM.Images.SetKeyName(59, "61.png")
        Me.IM.Images.SetKeyName(60, "62.png")
        Me.IM.Images.SetKeyName(61, "63.png")
        Me.IM.Images.SetKeyName(62, "64.png")
        Me.IM.Images.SetKeyName(63, "65.png")
        Me.IM.Images.SetKeyName(64, "66.png")
        Me.IM.Images.SetKeyName(65, "67.png")
        '
        'TXT_Procurar
        '
        Me.TXT_Procurar.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.TXT_Procurar.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource
        Me.TXT_Procurar.BackColor = System.Drawing.Color.White
        Me.TXT_Procurar.Location = New System.Drawing.Point(10, 32)
        Me.TXT_Procurar.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.TXT_Procurar.Name = "TXT_Procurar"
        Me.TXT_Procurar.Size = New System.Drawing.Size(583, 22)
        Me.TXT_Procurar.TabIndex = 0
        '
        'PictureBox1
        '
        Me.PictureBox1.BackColor = System.Drawing.Color.Transparent
        Me.PictureBox1.Image = CType(resources.GetObject("PictureBox1.Image"), System.Drawing.Image)
        Me.PictureBox1.Location = New System.Drawing.Point(17, 1)
        Me.PictureBox1.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(579, 178)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.PictureBox1.TabIndex = 1
        Me.PictureBox1.TabStop = False
        '
        'FrmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 17.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(613, 647)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.PictureBox1)
        Me.Font = New System.Drawing.Font("Segoe UI", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ForeColor = System.Drawing.Color.Black
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.MaximizeBox = False
        Me.Name = "FrmMain"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Download RAT 0.2 RC [SooftT.blogspot.com]"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.CM.ResumeLayout(False)
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents TXT_Procurar As System.Windows.Forms.TextBox
    Friend WithEvents LbStatus As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents LV_Resultado As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents IM As System.Windows.Forms.ImageList
    Friend WithEvents btn_Procurar As System.Windows.Forms.Button
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents TXT_Diretorio As System.Windows.Forms.TextBox
    Friend WithEvents CM As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents TM_Download As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents LinkLabel1 As System.Windows.Forms.LinkLabel
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents CBcategorias As System.Windows.Forms.ComboBox
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents InformaçõesToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem

End Class
