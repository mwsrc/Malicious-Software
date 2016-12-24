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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmMain))
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.Label10 = New System.Windows.Forms.Label()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.TXT_NOME_ID = New System.Windows.Forms.TextBox()
        Me.BTN_ANALIZAR = New System.Windows.Forms.Button()
        Me.BTN_PROCURAR = New System.Windows.Forms.Button()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.TXT_CHAVE_REGISTRO = New System.Windows.Forms.TextBox()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.TXT_VERSAO = New System.Windows.Forms.TextBox()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.TXT_SPLIT = New System.Windows.Forms.TextBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.TXT_NOME_REGISTRO = New System.Windows.Forms.TextBox()
        Me.CK_COPY = New System.Windows.Forms.CheckBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.TXT_DIRETORIO = New System.Windows.Forms.TextBox()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.TXT_NOME_EXECUTAVEL = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.TXT_PORTA = New System.Windows.Forms.TextBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.TXT_IP_DNS = New System.Windows.Forms.TextBox()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.CK_REGISTRY_STARTUP = New System.Windows.Forms.CheckBox()
        Me.CK_COPY_STARTUP = New System.Windows.Forms.CheckBox()
        Me.CK_PROTECT_PROCESS = New System.Windows.Forms.CheckBox()
        Me.ST = New System.Windows.Forms.StatusStrip()
        Me.LB_STATUS = New System.Windows.Forms.ToolStripStatusLabel()
        Me.CBX_TROJAN = New System.Windows.Forms.ComboBox()
        Me.PictureBox2 = New System.Windows.Forms.PictureBox()
        Me.Panel1.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.ST.SuspendLayout()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Panel1
        '
        Me.Panel1.BackColor = System.Drawing.Color.DodgerBlue
        Me.Panel1.Controls.Add(Me.Label10)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Top
        Me.Panel1.ForeColor = System.Drawing.Color.DodgerBlue
        Me.Panel1.Location = New System.Drawing.Point(0, 0)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(530, 23)
        Me.Panel1.TabIndex = 0
        '
        'Label10
        '
        Me.Label10.AutoSize = True
        Me.Label10.Font = New System.Drawing.Font("Segoe UI", 9.75!, CType((System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label10.ForeColor = System.Drawing.Color.Black
        Me.Label10.Location = New System.Drawing.Point(203, 3)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(124, 17)
        Me.Label10.TabIndex = 0
        Me.Label10.Text = "HACKING SOOFT T"
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.Color.Transparent
        Me.GroupBox1.Controls.Add(Me.Label9)
        Me.GroupBox1.Controls.Add(Me.TXT_NOME_ID)
        Me.GroupBox1.Controls.Add(Me.CBX_TROJAN)
        Me.GroupBox1.Controls.Add(Me.BTN_ANALIZAR)
        Me.GroupBox1.Controls.Add(Me.BTN_PROCURAR)
        Me.GroupBox1.Controls.Add(Me.Label8)
        Me.GroupBox1.Controls.Add(Me.TXT_CHAVE_REGISTRO)
        Me.GroupBox1.Controls.Add(Me.Label7)
        Me.GroupBox1.Controls.Add(Me.TXT_VERSAO)
        Me.GroupBox1.Controls.Add(Me.Label6)
        Me.GroupBox1.Controls.Add(Me.TXT_SPLIT)
        Me.GroupBox1.Controls.Add(Me.Label5)
        Me.GroupBox1.Controls.Add(Me.TXT_NOME_REGISTRO)
        Me.GroupBox1.Controls.Add(Me.CK_COPY)
        Me.GroupBox1.Controls.Add(Me.Label4)
        Me.GroupBox1.Controls.Add(Me.TXT_DIRETORIO)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Controls.Add(Me.TXT_NOME_EXECUTAVEL)
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.TXT_PORTA)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.TXT_IP_DNS)
        Me.GroupBox1.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox1.Location = New System.Drawing.Point(9, 29)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(331, 400)
        Me.GroupBox1.TabIndex = 1
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Informações"
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Location = New System.Drawing.Point(9, 21)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(63, 13)
        Me.Label9.TabIndex = 21
        Me.Label9.Text = "NOME (ID)"
        '
        'TXT_NOME_ID
        '
        Me.TXT_NOME_ID.ForeColor = System.Drawing.Color.Black
        Me.TXT_NOME_ID.Location = New System.Drawing.Point(12, 37)
        Me.TXT_NOME_ID.Name = "TXT_NOME_ID"
        Me.TXT_NOME_ID.ReadOnly = True
        Me.TXT_NOME_ID.Size = New System.Drawing.Size(304, 22)
        Me.TXT_NOME_ID.TabIndex = 20
        '
        'BTN_ANALIZAR
        '
        Me.BTN_ANALIZAR.BackColor = System.Drawing.SystemColors.Control
        Me.BTN_ANALIZAR.Cursor = System.Windows.Forms.Cursors.Hand
        Me.BTN_ANALIZAR.Location = New System.Drawing.Point(107, 362)
        Me.BTN_ANALIZAR.Name = "BTN_ANALIZAR"
        Me.BTN_ANALIZAR.Size = New System.Drawing.Size(93, 28)
        Me.BTN_ANALIZAR.TabIndex = 18
        Me.BTN_ANALIZAR.Text = "ANALIZAR"
        Me.BTN_ANALIZAR.UseVisualStyleBackColor = False
        '
        'BTN_PROCURAR
        '
        Me.BTN_PROCURAR.BackColor = System.Drawing.SystemColors.Control
        Me.BTN_PROCURAR.Cursor = System.Windows.Forms.Cursors.Hand
        Me.BTN_PROCURAR.Location = New System.Drawing.Point(12, 362)
        Me.BTN_PROCURAR.Name = "BTN_PROCURAR"
        Me.BTN_PROCURAR.Size = New System.Drawing.Size(93, 28)
        Me.BTN_PROCURAR.TabIndex = 17
        Me.BTN_PROCURAR.Text = "..."
        Me.BTN_PROCURAR.UseVisualStyleBackColor = False
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Location = New System.Drawing.Point(9, 270)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(96, 13)
        Me.Label8.TabIndex = 16
        Me.Label8.Text = "CHAVE REGISTRO"
        '
        'TXT_CHAVE_REGISTRO
        '
        Me.TXT_CHAVE_REGISTRO.ForeColor = System.Drawing.Color.Black
        Me.TXT_CHAVE_REGISTRO.Location = New System.Drawing.Point(12, 286)
        Me.TXT_CHAVE_REGISTRO.Multiline = True
        Me.TXT_CHAVE_REGISTRO.Name = "TXT_CHAVE_REGISTRO"
        Me.TXT_CHAVE_REGISTRO.ReadOnly = True
        Me.TXT_CHAVE_REGISTRO.Size = New System.Drawing.Size(304, 70)
        Me.TXT_CHAVE_REGISTRO.TabIndex = 15
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(198, 228)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(49, 13)
        Me.Label7.TabIndex = 14
        Me.Label7.Text = "VERSÃO"
        '
        'TXT_VERSAO
        '
        Me.TXT_VERSAO.ForeColor = System.Drawing.Color.Black
        Me.TXT_VERSAO.Location = New System.Drawing.Point(201, 244)
        Me.TXT_VERSAO.Name = "TXT_VERSAO"
        Me.TXT_VERSAO.ReadOnly = True
        Me.TXT_VERSAO.Size = New System.Drawing.Size(115, 22)
        Me.TXT_VERSAO.TabIndex = 13
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(9, 228)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(35, 13)
        Me.Label6.TabIndex = 12
        Me.Label6.Text = "SPLIT"
        '
        'TXT_SPLIT
        '
        Me.TXT_SPLIT.ForeColor = System.Drawing.Color.Black
        Me.TXT_SPLIT.Location = New System.Drawing.Point(12, 244)
        Me.TXT_SPLIT.Name = "TXT_SPLIT"
        Me.TXT_SPLIT.ReadOnly = True
        Me.TXT_SPLIT.Size = New System.Drawing.Size(185, 22)
        Me.TXT_SPLIT.TabIndex = 11
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(9, 187)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(95, 13)
        Me.Label5.TabIndex = 10
        Me.Label5.Text = "NOME REGISTRO"
        '
        'TXT_NOME_REGISTRO
        '
        Me.TXT_NOME_REGISTRO.ForeColor = System.Drawing.Color.Black
        Me.TXT_NOME_REGISTRO.Location = New System.Drawing.Point(12, 203)
        Me.TXT_NOME_REGISTRO.Name = "TXT_NOME_REGISTRO"
        Me.TXT_NOME_REGISTRO.ReadOnly = True
        Me.TXT_NOME_REGISTRO.Size = New System.Drawing.Size(304, 22)
        Me.TXT_NOME_REGISTRO.TabIndex = 9
        '
        'CK_COPY
        '
        Me.CK_COPY.AutoCheck = False
        Me.CK_COPY.AutoSize = True
        Me.CK_COPY.BackColor = System.Drawing.Color.Transparent
        Me.CK_COPY.Location = New System.Drawing.Point(267, 103)
        Me.CK_COPY.Name = "CK_COPY"
        Me.CK_COPY.Size = New System.Drawing.Size(55, 17)
        Me.CK_COPY.TabIndex = 8
        Me.CK_COPY.Text = "COPY"
        Me.CK_COPY.UseVisualStyleBackColor = False
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(9, 145)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(63, 13)
        Me.Label4.TabIndex = 7
        Me.Label4.Text = "DIRETÓRIO"
        '
        'TXT_DIRETORIO
        '
        Me.TXT_DIRETORIO.ForeColor = System.Drawing.Color.Black
        Me.TXT_DIRETORIO.Location = New System.Drawing.Point(12, 161)
        Me.TXT_DIRETORIO.Name = "TXT_DIRETORIO"
        Me.TXT_DIRETORIO.ReadOnly = True
        Me.TXT_DIRETORIO.Size = New System.Drawing.Size(304, 22)
        Me.TXT_DIRETORIO.TabIndex = 6
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(9, 104)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(128, 13)
        Me.Label3.TabIndex = 5
        Me.Label3.Text = "NOME DO EXECUTÁVEL"
        '
        'TXT_NOME_EXECUTAVEL
        '
        Me.TXT_NOME_EXECUTAVEL.ForeColor = System.Drawing.Color.Black
        Me.TXT_NOME_EXECUTAVEL.Location = New System.Drawing.Point(12, 120)
        Me.TXT_NOME_EXECUTAVEL.Name = "TXT_NOME_EXECUTAVEL"
        Me.TXT_NOME_EXECUTAVEL.ReadOnly = True
        Me.TXT_NOME_EXECUTAVEL.Size = New System.Drawing.Size(304, 22)
        Me.TXT_NOME_EXECUTAVEL.TabIndex = 4
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(213, 62)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(42, 13)
        Me.Label2.TabIndex = 3
        Me.Label2.Text = "PORTA"
        '
        'TXT_PORTA
        '
        Me.TXT_PORTA.ForeColor = System.Drawing.Color.Black
        Me.TXT_PORTA.Location = New System.Drawing.Point(216, 78)
        Me.TXT_PORTA.Name = "TXT_PORTA"
        Me.TXT_PORTA.ReadOnly = True
        Me.TXT_PORTA.Size = New System.Drawing.Size(100, 22)
        Me.TXT_PORTA.TabIndex = 2
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(9, 62)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(45, 13)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "IP/DNS"
        '
        'TXT_IP_DNS
        '
        Me.TXT_IP_DNS.ForeColor = System.Drawing.Color.Black
        Me.TXT_IP_DNS.Location = New System.Drawing.Point(12, 78)
        Me.TXT_IP_DNS.Name = "TXT_IP_DNS"
        Me.TXT_IP_DNS.ReadOnly = True
        Me.TXT_IP_DNS.Size = New System.Drawing.Size(200, 22)
        Me.TXT_IP_DNS.TabIndex = 0
        '
        'GroupBox2
        '
        Me.GroupBox2.BackColor = System.Drawing.Color.Transparent
        Me.GroupBox2.Controls.Add(Me.PictureBox2)
        Me.GroupBox2.Controls.Add(Me.PictureBox1)
        Me.GroupBox2.Controls.Add(Me.CK_REGISTRY_STARTUP)
        Me.GroupBox2.Controls.Add(Me.CK_COPY_STARTUP)
        Me.GroupBox2.Controls.Add(Me.CK_PROTECT_PROCESS)
        Me.GroupBox2.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox2.Location = New System.Drawing.Point(344, 29)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(178, 400)
        Me.GroupBox2.TabIndex = 2
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Configurações"
        '
        'PictureBox1
        '
        Me.PictureBox1.Image = Global.SOOFT_T.My.Resources.Resources.maxresdefault
        Me.PictureBox1.Location = New System.Drawing.Point(8, 290)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(162, 104)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PictureBox1.TabIndex = 12
        Me.PictureBox1.TabStop = False
        '
        'CK_REGISTRY_STARTUP
        '
        Me.CK_REGISTRY_STARTUP.AutoCheck = False
        Me.CK_REGISTRY_STARTUP.AutoSize = True
        Me.CK_REGISTRY_STARTUP.BackColor = System.Drawing.Color.Transparent
        Me.CK_REGISTRY_STARTUP.Location = New System.Drawing.Point(8, 67)
        Me.CK_REGISTRY_STARTUP.Name = "CK_REGISTRY_STARTUP"
        Me.CK_REGISTRY_STARTUP.Size = New System.Drawing.Size(126, 17)
        Me.CK_REGISTRY_STARTUP.TabIndex = 11
        Me.CK_REGISTRY_STARTUP.Text = "REGISTRY STARTUP"
        Me.CK_REGISTRY_STARTUP.UseVisualStyleBackColor = False
        '
        'CK_COPY_STARTUP
        '
        Me.CK_COPY_STARTUP.AutoCheck = False
        Me.CK_COPY_STARTUP.AutoSize = True
        Me.CK_COPY_STARTUP.BackColor = System.Drawing.Color.Transparent
        Me.CK_COPY_STARTUP.Location = New System.Drawing.Point(8, 46)
        Me.CK_COPY_STARTUP.Name = "CK_COPY_STARTUP"
        Me.CK_COPY_STARTUP.Size = New System.Drawing.Size(122, 17)
        Me.CK_COPY_STARTUP.TabIndex = 10
        Me.CK_COPY_STARTUP.Text = "COPY TO STARTUP"
        Me.CK_COPY_STARTUP.UseVisualStyleBackColor = False
        '
        'CK_PROTECT_PROCESS
        '
        Me.CK_PROTECT_PROCESS.AutoCheck = False
        Me.CK_PROTECT_PROCESS.AutoSize = True
        Me.CK_PROTECT_PROCESS.BackColor = System.Drawing.Color.Transparent
        Me.CK_PROTECT_PROCESS.Location = New System.Drawing.Point(8, 25)
        Me.CK_PROTECT_PROCESS.Name = "CK_PROTECT_PROCESS"
        Me.CK_PROTECT_PROCESS.Size = New System.Drawing.Size(163, 17)
        Me.CK_PROTECT_PROCESS.TabIndex = 9
        Me.CK_PROTECT_PROCESS.Text = "PROTECT PROCESS [BSOD]"
        Me.CK_PROTECT_PROCESS.UseVisualStyleBackColor = False
        '
        'ST
        '
        Me.ST.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.LB_STATUS})
        Me.ST.Location = New System.Drawing.Point(0, 431)
        Me.ST.Name = "ST"
        Me.ST.Size = New System.Drawing.Size(530, 22)
        Me.ST.SizingGrip = False
        Me.ST.TabIndex = 3
        Me.ST.Text = "StatusStrip1"
        '
        'LB_STATUS
        '
        Me.LB_STATUS.ActiveLinkColor = System.Drawing.Color.Transparent
        Me.LB_STATUS.BackColor = System.Drawing.Color.Transparent
        Me.LB_STATUS.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LB_STATUS.LinkColor = System.Drawing.Color.Transparent
        Me.LB_STATUS.Name = "LB_STATUS"
        Me.LB_STATUS.Size = New System.Drawing.Size(45, 17)
        Me.LB_STATUS.Text = "STATUS"
        '
        'CBX_TROJAN
        '
        Me.CBX_TROJAN.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.CBX_TROJAN.Font = New System.Drawing.Font("Segoe UI", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.CBX_TROJAN.ForeColor = System.Drawing.Color.Black
        Me.CBX_TROJAN.FormattingEnabled = True
        Me.CBX_TROJAN.Items.AddRange(New Object() {"NJRAT 0.7"})
        Me.CBX_TROJAN.Location = New System.Drawing.Point(203, 362)
        Me.CBX_TROJAN.Name = "CBX_TROJAN"
        Me.CBX_TROJAN.Size = New System.Drawing.Size(113, 28)
        Me.CBX_TROJAN.TabIndex = 19
        '
        'PictureBox2
        '
        Me.PictureBox2.Image = Global.SOOFT_T.My.Resources.Resources.brazil_logo_design
        Me.PictureBox2.Location = New System.Drawing.Point(8, 187)
        Me.PictureBox2.Name = "PictureBox2"
        Me.PictureBox2.Size = New System.Drawing.Size(162, 104)
        Me.PictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PictureBox2.TabIndex = 13
        Me.PictureBox2.TabStop = False
        '
        'FrmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(530, 453)
        Me.Controls.Add(Me.ST)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.Panel1)
        Me.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ForeColor = System.Drawing.Color.Black
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.Name = "FrmMain"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "NjRAT - Informações 0.1 [SooftT.blogspot.com]"
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ST.ResumeLayout(False)
        Me.ST.PerformLayout()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Panel1 As System.Windows.Forms.Panel
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents TXT_IP_DNS As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents TXT_PORTA As System.Windows.Forms.TextBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents TXT_NOME_EXECUTAVEL As System.Windows.Forms.TextBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents TXT_DIRETORIO As System.Windows.Forms.TextBox
    Friend WithEvents CK_COPY As System.Windows.Forms.CheckBox
    Friend WithEvents CK_REGISTRY_STARTUP As System.Windows.Forms.CheckBox
    Friend WithEvents CK_COPY_STARTUP As System.Windows.Forms.CheckBox
    Friend WithEvents CK_PROTECT_PROCESS As System.Windows.Forms.CheckBox
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents TXT_SPLIT As System.Windows.Forms.TextBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents TXT_NOME_REGISTRO As System.Windows.Forms.TextBox
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents TXT_VERSAO As System.Windows.Forms.TextBox
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents TXT_CHAVE_REGISTRO As System.Windows.Forms.TextBox
    Friend WithEvents BTN_PROCURAR As System.Windows.Forms.Button
    Friend WithEvents BTN_ANALIZAR As System.Windows.Forms.Button
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents TXT_NOME_ID As System.Windows.Forms.TextBox
    Friend WithEvents ST As System.Windows.Forms.StatusStrip
    Friend WithEvents LB_STATUS As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents CBX_TROJAN As System.Windows.Forms.ComboBox
    Friend WithEvents PictureBox2 As System.Windows.Forms.PictureBox

End Class
