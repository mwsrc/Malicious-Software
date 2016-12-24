<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmServidor
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmServidor))
        Dim TreeNode1 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Conexão", 10, 10)
        Dim TreeNode2 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Instalação", 3, 3)
        Dim TreeNode3 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Mensagem", 4, 4)
        Dim TreeNode4 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Icones", 5, 5)
        Dim TreeNode5 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Anti Process", 6, 6)
        Dim TreeNode6 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Bloquear Sites", 7, 7)
        Dim TreeNode7 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Windows", 8, 8)
        Dim TreeNode8 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Shield", 9, 9)
        Dim TreeNode9 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Ofuscação", 11, 11)
        Dim TreeNode10 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Descrição", 13, 13)
        Dim TreeNode11 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Finalização", 1, 1)
        Me.Button1 = New System.Windows.Forms.Button()
        Me.CKProtectProcess = New System.Windows.Forms.CheckBox()
        Me.CBDiretorio = New System.Windows.Forms.ComboBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.txtNomeProcesso = New System.Windows.Forms.TextBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.txtNomeVitima = New System.Windows.Forms.TextBox()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.NDPorta = New System.Windows.Forms.NumericUpDown()
        Me.txtHost = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.GroupBox7 = New System.Windows.Forms.GroupBox()
        Me.CKAntiILSpy = New System.Windows.Forms.CheckBox()
        Me.CKAntiReflector = New System.Windows.Forms.CheckBox()
        Me.CKAntiCodeReflect = New System.Windows.Forms.CheckBox()
        Me.CKAntidnSpy = New System.Windows.Forms.CheckBox()
        Me.CKAntiMsconfig = New System.Windows.Forms.CheckBox()
        Me.CKAntiGerenciadorDeTarefas = New System.Windows.Forms.CheckBox()
        Me.CKAntiProcesshacker = New System.Windows.Forms.CheckBox()
        Me.CKAntiSandboxie_Control = New System.Windows.Forms.CheckBox()
        Me.CKAntiNetSnifferCs = New System.Windows.Forms.CheckBox()
        Me.CKAntiexeinfoPE = New System.Windows.Forms.CheckBox()
        Me.CKAntiSmsniff = New System.Windows.Forms.CheckBox()
        Me.CKAntiTiGeR_Firewall = New System.Windows.Forms.CheckBox()
        Me.CKAntiIPBlocker = New System.Windows.Forms.CheckBox()
        Me.CKAntiapateDNS = New System.Windows.Forms.CheckBox()
        Me.CKAntiWireshark = New System.Windows.Forms.CheckBox()
        Me.CKAntiSpyTheSpy = New System.Windows.Forms.CheckBox()
        Me.CKAntiSbieCtrl = New System.Windows.Forms.CheckBox()
        Me.CKAntiProcessExplorer = New System.Windows.Forms.CheckBox()
        Me.GBSites = New System.Windows.Forms.GroupBox()
        Me.CBListaSites = New System.Windows.Forms.ComboBox()
        Me.LVListSites = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.CT = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ExcluirToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ExcluirTodosToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.IM1 = New System.Windows.Forms.ImageList(Me.components)
        Me.CKBlockSites = New System.Windows.Forms.CheckBox()
        Me.btnAdiconarSites = New System.Windows.Forms.Button()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.PictureBox7 = New System.Windows.Forms.PictureBox()
        Me.GroupBox6 = New System.Windows.Forms.GroupBox()
        Me.PictureBox21 = New System.Windows.Forms.PictureBox()
        Me.CKBypassFirewall = New System.Windows.Forms.CheckBox()
        Me.CKAntiKillProcess = New System.Windows.Forms.CheckBox()
        Me.CKOcutarServidor = New System.Windows.Forms.CheckBox()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.CKAgendarServidor = New System.Windows.Forms.CheckBox()
        Me.CKExcluirArquivo = New System.Windows.Forms.CheckBox()
        Me.CKAtivarEncryptarHost = New System.Windows.Forms.CheckBox()
        Me.GroupBox5 = New System.Windows.Forms.GroupBox()
        Me.NDQuantidadeStrings = New System.Windows.Forms.NumericUpDown()
        Me.Label11 = New System.Windows.Forms.Label()
        Me.txtStringOfuscador = New System.Windows.Forms.TextBox()
        Me.CBStorageMethod = New System.Windows.Forms.ComboBox()
        Me.Label10 = New System.Windows.Forms.Label()
        Me.CKAtivarOfuscaçao = New System.Windows.Forms.CheckBox()
        Me.RandomST1 = New Coringa.RandomST()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.CKAtivarDelay = New System.Windows.Forms.CheckBox()
        Me.GroupBox3 = New System.Windows.Forms.GroupBox()
        Me.GroupBox14 = New System.Windows.Forms.GroupBox()
        Me.RBbuttonOkCancelarAjuda = New System.Windows.Forms.RadioButton()
        Me.RBButtonSimNaoCancelar = New System.Windows.Forms.RadioButton()
        Me.RBButtonAnularRepetirIgnorar = New System.Windows.Forms.RadioButton()
        Me.RBButtonRepetirCancelar = New System.Windows.Forms.RadioButton()
        Me.RBButtonSimNao = New System.Windows.Forms.RadioButton()
        Me.RBButtonOk = New System.Windows.Forms.RadioButton()
        Me.TBButtonOkCencelar = New System.Windows.Forms.RadioButton()
        Me.GroupBox13 = New System.Windows.Forms.GroupBox()
        Me.PictureBox3 = New System.Windows.Forms.PictureBox()
        Me.RDPergunta = New System.Windows.Forms.RadioButton()
        Me.PictureBox2 = New System.Windows.Forms.PictureBox()
        Me.RDNenhum = New System.Windows.Forms.RadioButton()
        Me.PictureBox6 = New System.Windows.Forms.PictureBox()
        Me.PictureBox5 = New System.Windows.Forms.PictureBox()
        Me.PictureBox4 = New System.Windows.Forms.PictureBox()
        Me.RDInformacao = New System.Windows.Forms.RadioButton()
        Me.RDErro = New System.Windows.Forms.RadioButton()
        Me.RDAtencao = New System.Windows.Forms.RadioButton()
        Me.btnTestMensagem = New System.Windows.Forms.Button()
        Me.txtTitulo = New System.Windows.Forms.TextBox()
        Me.txtMensagem = New System.Windows.Forms.TextBox()
        Me.lbMSG = New System.Windows.Forms.Label()
        Me.CKAtivarMensagem = New System.Windows.Forms.CheckBox()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.Label16 = New System.Windows.Forms.Label()
        Me.CBTamanhoICO = New System.Windows.Forms.ComboBox()
        Me.lbIcones = New System.Windows.Forms.Label()
        Me.Label12 = New System.Windows.Forms.Label()
        Me.CBIcones = New System.Windows.Forms.ComboBox()
        Me.btnListarPadraoIcones = New System.Windows.Forms.Button()
        Me.LVIcones = New System.Windows.Forms.ListView()
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader3 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.IM3 = New System.Windows.Forms.ImageList(Me.components)
        Me.btnTirarIco = New System.Windows.Forms.Button()
        Me.btnIco = New System.Windows.Forms.Button()
        Me.PicIco = New System.Windows.Forms.PictureBox()
        Me.CKPermisaoAdmin = New System.Windows.Forms.CheckBox()
        Me.CBextensão = New System.Windows.Forms.ComboBox()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.txtEncryptHost = New System.Windows.Forms.TextBox()
        Me.GroupBox8 = New System.Windows.Forms.GroupBox()
        Me.PictureBox16 = New System.Windows.Forms.PictureBox()
        Me.PictureBox18 = New System.Windows.Forms.PictureBox()
        Me.PictureBox9 = New System.Windows.Forms.PictureBox()
        Me.CKDesativarFirewall = New System.Windows.Forms.CheckBox()
        Me.CKDesativarBarraDeTarefas = New System.Windows.Forms.CheckBox()
        Me.CKDesativarMenuContexto = New System.Windows.Forms.CheckBox()
        Me.CKDesativarOpçõesdePasta = New System.Windows.Forms.CheckBox()
        Me.CKDesativarPainelControle = New System.Windows.Forms.CheckBox()
        Me.CKDesativarUAC = New System.Windows.Forms.CheckBox()
        Me.CKDesativarExecutar = New System.Windows.Forms.CheckBox()
        Me.CKDesativarRegedit = New System.Windows.Forms.CheckBox()
        Me.CKDesativarCMD = New System.Windows.Forms.CheckBox()
        Me.CKDesativarGerenciadorTarefas = New System.Windows.Forms.CheckBox()
        Me.GroupBox10 = New System.Windows.Forms.GroupBox()
        Me.btnGerarMutex = New System.Windows.Forms.Button()
        Me.PictureBox20 = New System.Windows.Forms.PictureBox()
        Me.PictureBox19 = New System.Windows.Forms.PictureBox()
        Me.txtPolicies2 = New System.Windows.Forms.TextBox()
        Me.CKPolicies2 = New System.Windows.Forms.CheckBox()
        Me.txtPolicies = New System.Windows.Forms.TextBox()
        Me.CKPolicies = New System.Windows.Forms.CheckBox()
        Me.txtHKEY_LOCAL_MACHINE = New System.Windows.Forms.TextBox()
        Me.txtHKEY_CURRENT_USER = New System.Windows.Forms.TextBox()
        Me.CKHKEY_LOCAL_MACHINE = New System.Windows.Forms.CheckBox()
        Me.CKHKEY_CURRENT_USER = New System.Windows.Forms.CheckBox()
        Me.txtMutex = New System.Windows.Forms.TextBox()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.IM2 = New System.Windows.Forms.ImageList(Me.components)
        Me.TreeView1 = New System.Windows.Forms.TreeView()
        Me.TabControl1 = New System.Windows.Forms.TabControl()
        Me.TBConexão = New System.Windows.Forms.TabPage()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.NDDelaySegundos = New System.Windows.Forms.NumericUpDown()
        Me.TBInstalação = New System.Windows.Forms.TabPage()
        Me.GroupBox4 = New System.Windows.Forms.GroupBox()
        Me.txtNomePasta = New System.Windows.Forms.TextBox()
        Me.Label14 = New System.Windows.Forms.Label()
        Me.txtNomeSpreadDiscoLocal = New System.Windows.Forms.TextBox()
        Me.PictureBox22 = New System.Windows.Forms.PictureBox()
        Me.CKSpreadDiscoLocal = New System.Windows.Forms.CheckBox()
        Me.txtNomeStartUp = New System.Windows.Forms.TextBox()
        Me.CKCopiarStartUp = New System.Windows.Forms.CheckBox()
        Me.TBMensagem = New System.Windows.Forms.TabPage()
        Me.TBIcones = New System.Windows.Forms.TabPage()
        Me.TBAntiProcess = New System.Windows.Forms.TabPage()
        Me.TBBloquearSites = New System.Windows.Forms.TabPage()
        Me.TBWindows = New System.Windows.Forms.TabPage()
        Me.Label15 = New System.Windows.Forms.Label()
        Me.TBShield = New System.Windows.Forms.TabPage()
        Me.TBOfuscação = New System.Windows.Forms.TabPage()
        Me.TBDescricao = New System.Windows.Forms.TabPage()
        Me.CKAtivardescricao = New System.Windows.Forms.CheckBox()
        Me.GroupBox9 = New System.Windows.Forms.GroupBox()
        Me.btnGerarDescricao = New System.Windows.Forms.Button()
        Me.N1 = New System.Windows.Forms.NumericUpDown()
        Me.Label17 = New System.Windows.Forms.Label()
        Me.Label18 = New System.Windows.Forms.Label()
        Me.N8 = New System.Windows.Forms.NumericUpDown()
        Me.N7 = New System.Windows.Forms.NumericUpDown()
        Me.N6 = New System.Windows.Forms.NumericUpDown()
        Me.N5 = New System.Windows.Forms.NumericUpDown()
        Me.N4 = New System.Windows.Forms.NumericUpDown()
        Me.N3 = New System.Windows.Forms.NumericUpDown()
        Me.N2 = New System.Windows.Forms.NumericUpDown()
        Me.Label19 = New System.Windows.Forms.Label()
        Me.Label20 = New System.Windows.Forms.Label()
        Me.Label21 = New System.Windows.Forms.Label()
        Me.Label22 = New System.Windows.Forms.Label()
        Me.Label23 = New System.Windows.Forms.Label()
        Me.TXT_Marca = New System.Windows.Forms.TextBox()
        Me.TXT_Copyright = New System.Windows.Forms.TextBox()
        Me.TXT_Produto = New System.Windows.Forms.TextBox()
        Me.TXT_Nome = New System.Windows.Forms.TextBox()
        Me.TXT_Descricao = New System.Windows.Forms.TextBox()
        Me.TBFinalização = New System.Windows.Forms.TabPage()
        Me.CBUpx = New System.Windows.Forms.ComboBox()
        Me.CKUpx = New System.Windows.Forms.CheckBox()
        Me.Label13 = New System.Windows.Forms.Label()
        Me.CBGrupos = New System.Windows.Forms.ComboBox()
        Me.PLPreviaCores = New System.Windows.Forms.Panel()
        Me.CBCores = New System.Windows.Forms.ComboBox()
        Me.txtStatus = New System.Windows.Forms.TextBox()
        Me.Label24 = New System.Windows.Forms.Label()
        Me.CT1 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.AdicionarToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ExcluirToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.Panel3 = New System.Windows.Forms.Panel()
        Me.Panel4 = New System.Windows.Forms.Panel()
        Me.PictureBox8 = New System.Windows.Forms.PictureBox()
        CType(Me.NDPorta, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox7.SuspendLayout()
        Me.GBSites.SuspendLayout()
        Me.CT.SuspendLayout()
        CType(Me.PictureBox7, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox6.SuspendLayout()
        CType(Me.PictureBox21, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox5.SuspendLayout()
        CType(Me.NDQuantidadeStrings, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox14.SuspendLayout()
        Me.GroupBox13.SuspendLayout()
        CType(Me.PictureBox3, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox6, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox5, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox4, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox2.SuspendLayout()
        CType(Me.PicIco, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox8.SuspendLayout()
        CType(Me.PictureBox16, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox18, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox9, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox10.SuspendLayout()
        CType(Me.PictureBox20, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox19, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabControl1.SuspendLayout()
        Me.TBConexão.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        CType(Me.NDDelaySegundos, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TBInstalação.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        CType(Me.PictureBox22, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TBMensagem.SuspendLayout()
        Me.TBIcones.SuspendLayout()
        Me.TBAntiProcess.SuspendLayout()
        Me.TBBloquearSites.SuspendLayout()
        Me.TBWindows.SuspendLayout()
        Me.TBShield.SuspendLayout()
        Me.TBOfuscação.SuspendLayout()
        Me.TBDescricao.SuspendLayout()
        Me.GroupBox9.SuspendLayout()
        CType(Me.N1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.N8, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.N7, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.N6, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.N5, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.N4, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.N3, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.N2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TBFinalização.SuspendLayout()
        Me.CT1.SuspendLayout()
        CType(Me.PictureBox8, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Button1
        '
        Me.Button1.Cursor = System.Windows.Forms.Cursors.Hand
        Me.Button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.Button1.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Button1.Location = New System.Drawing.Point(4, 241)
        Me.Button1.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(440, 40)
        Me.Button1.TabIndex = 31
        Me.Button1.Text = "Criar Servidor"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'CKProtectProcess
        '
        Me.CKProtectProcess.AutoSize = True
        Me.CKProtectProcess.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKProtectProcess.Location = New System.Drawing.Point(6, 17)
        Me.CKProtectProcess.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CKProtectProcess.Name = "CKProtectProcess"
        Me.CKProtectProcess.Size = New System.Drawing.Size(145, 17)
        Me.CKProtectProcess.TabIndex = 29
        Me.CKProtectProcess.Text = "Protect Process [BSOD]"
        Me.CKProtectProcess.UseVisualStyleBackColor = True
        '
        'CBDiretorio
        '
        Me.CBDiretorio.BackColor = System.Drawing.Color.Black
        Me.CBDiretorio.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.CBDiretorio.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.CBDiretorio.ForeColor = System.Drawing.Color.White
        Me.CBDiretorio.FormattingEnabled = True
        Me.CBDiretorio.Items.AddRange(New Object() {"%TEMP%", "%AppData%", "%UserProfile%", "%ProgramData%", "%CommonProgramFiles%", "%Cookies%", "%Desktop%", "%Favorites%", "%History%", "%InternetCache%", "%LocalApplicationData%", "%MyDocuments%", "%MyMusic%", "%MyPictures%", "%ProgramFiles%", "%Programs%", "%System%", "%Templates%"})
        Me.CBDiretorio.Location = New System.Drawing.Point(5, 108)
        Me.CBDiretorio.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CBDiretorio.Name = "CBDiretorio"
        Me.CBDiretorio.Size = New System.Drawing.Size(208, 20)
        Me.CBDiretorio.TabIndex = 26
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(2, 92)
        Me.Label5.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(53, 13)
        Me.Label5.TabIndex = 25
        Me.Label5.Text = "Diretório"
        '
        'txtNomeProcesso
        '
        Me.txtNomeProcesso.BackColor = System.Drawing.Color.Black
        Me.txtNomeProcesso.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtNomeProcesso.ForeColor = System.Drawing.Color.White
        Me.txtNomeProcesso.Location = New System.Drawing.Point(5, 69)
        Me.txtNomeProcesso.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.txtNomeProcesso.Name = "txtNomeProcesso"
        Me.txtNomeProcesso.Size = New System.Drawing.Size(208, 21)
        Me.txtNomeProcesso.TabIndex = 24
        Me.txtNomeProcesso.Text = "explorer.exe"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(2, 54)
        Me.Label4.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(96, 13)
        Me.Label4.TabIndex = 23
        Me.Label4.Text = "Nome (Processo)"
        '
        'txtNomeVitima
        '
        Me.txtNomeVitima.BackColor = System.Drawing.Color.Black
        Me.txtNomeVitima.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtNomeVitima.ForeColor = System.Drawing.Color.White
        Me.txtNomeVitima.Location = New System.Drawing.Point(9, 33)
        Me.txtNomeVitima.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.txtNomeVitima.Name = "txtNomeVitima"
        Me.txtNomeVitima.Size = New System.Drawing.Size(232, 21)
        Me.txtNomeVitima.TabIndex = 22
        Me.txtNomeVitima.Text = "CORINGA"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(6, 18)
        Me.Label3.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(83, 13)
        Me.Label3.TabIndex = 21
        Me.Label3.Text = "Nome (Vitima)"
        '
        'NDPorta
        '
        Me.NDPorta.BackColor = System.Drawing.Color.Black
        Me.NDPorta.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.NDPorta.ForeColor = System.Drawing.Color.White
        Me.NDPorta.Increment = New Decimal(New Integer() {100, 0, 0, 0})
        Me.NDPorta.Location = New System.Drawing.Point(9, 112)
        Me.NDPorta.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.NDPorta.Maximum = New Decimal(New Integer() {-1304428545, 434162106, 542, 0})
        Me.NDPorta.Name = "NDPorta"
        Me.NDPorta.Size = New System.Drawing.Size(231, 21)
        Me.NDPorta.TabIndex = 20
        Me.NDPorta.Value = New Decimal(New Integer() {8000, 0, 0, 0})
        '
        'txtHost
        '
        Me.txtHost.BackColor = System.Drawing.Color.Black
        Me.txtHost.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtHost.ForeColor = System.Drawing.Color.White
        Me.txtHost.Location = New System.Drawing.Point(9, 73)
        Me.txtHost.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.txtHost.Name = "txtHost"
        Me.txtHost.Size = New System.Drawing.Size(231, 21)
        Me.txtHost.TabIndex = 19
        Me.txtHost.Text = "127.0.0.1"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(7, 97)
        Me.Label2.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(35, 13)
        Me.Label2.TabIndex = 18
        Me.Label2.Text = "Porta"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(7, 60)
        Me.Label1.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(31, 13)
        Me.Label1.TabIndex = 17
        Me.Label1.Text = "Host"
        '
        'GroupBox7
        '
        Me.GroupBox7.Controls.Add(Me.CKAntiILSpy)
        Me.GroupBox7.Controls.Add(Me.CKAntiReflector)
        Me.GroupBox7.Controls.Add(Me.CKAntiCodeReflect)
        Me.GroupBox7.Controls.Add(Me.CKAntidnSpy)
        Me.GroupBox7.Controls.Add(Me.CKAntiMsconfig)
        Me.GroupBox7.Controls.Add(Me.CKAntiGerenciadorDeTarefas)
        Me.GroupBox7.Controls.Add(Me.CKAntiProcesshacker)
        Me.GroupBox7.Controls.Add(Me.CKAntiSandboxie_Control)
        Me.GroupBox7.Controls.Add(Me.CKAntiNetSnifferCs)
        Me.GroupBox7.Controls.Add(Me.CKAntiexeinfoPE)
        Me.GroupBox7.Controls.Add(Me.CKAntiSmsniff)
        Me.GroupBox7.Controls.Add(Me.CKAntiTiGeR_Firewall)
        Me.GroupBox7.Controls.Add(Me.CKAntiIPBlocker)
        Me.GroupBox7.Controls.Add(Me.CKAntiapateDNS)
        Me.GroupBox7.Controls.Add(Me.CKAntiWireshark)
        Me.GroupBox7.Controls.Add(Me.CKAntiSpyTheSpy)
        Me.GroupBox7.Controls.Add(Me.CKAntiSbieCtrl)
        Me.GroupBox7.Controls.Add(Me.CKAntiProcessExplorer)
        Me.GroupBox7.ForeColor = System.Drawing.Color.White
        Me.GroupBox7.Location = New System.Drawing.Point(150, 6)
        Me.GroupBox7.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.GroupBox7.Name = "GroupBox7"
        Me.GroupBox7.Padding = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.GroupBox7.Size = New System.Drawing.Size(265, 273)
        Me.GroupBox7.TabIndex = 49
        Me.GroupBox7.TabStop = False
        Me.GroupBox7.Text = "Process (Extras)"
        '
        'CKAntiILSpy
        '
        Me.CKAntiILSpy.AutoSize = True
        Me.CKAntiILSpy.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiILSpy.Location = New System.Drawing.Point(145, 70)
        Me.CKAntiILSpy.Name = "CKAntiILSpy"
        Me.CKAntiILSpy.Size = New System.Drawing.Size(79, 17)
        Me.CKAntiILSpy.TabIndex = 18
        Me.CKAntiILSpy.Text = "Anti ILSpy"
        Me.CKAntiILSpy.UseVisualStyleBackColor = True
        '
        'CKAntiReflector
        '
        Me.CKAntiReflector.AutoSize = True
        Me.CKAntiReflector.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiReflector.Location = New System.Drawing.Point(145, 52)
        Me.CKAntiReflector.Name = "CKAntiReflector"
        Me.CKAntiReflector.Size = New System.Drawing.Size(97, 17)
        Me.CKAntiReflector.TabIndex = 17
        Me.CKAntiReflector.Text = "Anti Reflector"
        Me.CKAntiReflector.UseVisualStyleBackColor = True
        '
        'CKAntiCodeReflect
        '
        Me.CKAntiCodeReflect.AutoSize = True
        Me.CKAntiCodeReflect.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiCodeReflect.Location = New System.Drawing.Point(145, 34)
        Me.CKAntiCodeReflect.Name = "CKAntiCodeReflect"
        Me.CKAntiCodeReflect.Size = New System.Drawing.Size(116, 17)
        Me.CKAntiCodeReflect.TabIndex = 16
        Me.CKAntiCodeReflect.Text = "Anti Code Reflect"
        Me.CKAntiCodeReflect.UseVisualStyleBackColor = True
        '
        'CKAntidnSpy
        '
        Me.CKAntidnSpy.AutoSize = True
        Me.CKAntidnSpy.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntidnSpy.Location = New System.Drawing.Point(145, 16)
        Me.CKAntidnSpy.Name = "CKAntidnSpy"
        Me.CKAntidnSpy.Size = New System.Drawing.Size(84, 17)
        Me.CKAntidnSpy.TabIndex = 15
        Me.CKAntidnSpy.Text = "Anti dnSpy"
        Me.CKAntidnSpy.UseVisualStyleBackColor = True
        '
        'CKAntiMsconfig
        '
        Me.CKAntiMsconfig.AutoSize = True
        Me.CKAntiMsconfig.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiMsconfig.Location = New System.Drawing.Point(6, 253)
        Me.CKAntiMsconfig.Name = "CKAntiMsconfig"
        Me.CKAntiMsconfig.Size = New System.Drawing.Size(100, 17)
        Me.CKAntiMsconfig.TabIndex = 14
        Me.CKAntiMsconfig.Text = "Anti Msconfig"
        Me.CKAntiMsconfig.UseVisualStyleBackColor = True
        '
        'CKAntiGerenciadorDeTarefas
        '
        Me.CKAntiGerenciadorDeTarefas.AutoSize = True
        Me.CKAntiGerenciadorDeTarefas.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiGerenciadorDeTarefas.Location = New System.Drawing.Point(6, 235)
        Me.CKAntiGerenciadorDeTarefas.Name = "CKAntiGerenciadorDeTarefas"
        Me.CKAntiGerenciadorDeTarefas.Size = New System.Drawing.Size(169, 17)
        Me.CKAntiGerenciadorDeTarefas.TabIndex = 13
        Me.CKAntiGerenciadorDeTarefas.Text = "Anti Gerenciador de Tarefas"
        Me.CKAntiGerenciadorDeTarefas.UseVisualStyleBackColor = True
        '
        'CKAntiProcesshacker
        '
        Me.CKAntiProcesshacker.AutoSize = True
        Me.CKAntiProcesshacker.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiProcesshacker.Location = New System.Drawing.Point(6, 217)
        Me.CKAntiProcesshacker.Name = "CKAntiProcesshacker"
        Me.CKAntiProcesshacker.Size = New System.Drawing.Size(128, 17)
        Me.CKAntiProcesshacker.TabIndex = 12
        Me.CKAntiProcesshacker.Text = "Anti Process Hacker"
        Me.CKAntiProcesshacker.UseVisualStyleBackColor = True
        '
        'CKAntiSandboxie_Control
        '
        Me.CKAntiSandboxie_Control.AutoSize = True
        Me.CKAntiSandboxie_Control.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiSandboxie_Control.Location = New System.Drawing.Point(6, 199)
        Me.CKAntiSandboxie_Control.Name = "CKAntiSandboxie_Control"
        Me.CKAntiSandboxie_Control.Size = New System.Drawing.Size(148, 17)
        Me.CKAntiSandboxie_Control.TabIndex = 11
        Me.CKAntiSandboxie_Control.Text = "Anti Sandboxie Control"
        Me.CKAntiSandboxie_Control.UseVisualStyleBackColor = True
        '
        'CKAntiNetSnifferCs
        '
        Me.CKAntiNetSnifferCs.AutoSize = True
        Me.CKAntiNetSnifferCs.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiNetSnifferCs.Location = New System.Drawing.Point(6, 180)
        Me.CKAntiNetSnifferCs.Name = "CKAntiNetSnifferCs"
        Me.CKAntiNetSnifferCs.Size = New System.Drawing.Size(116, 17)
        Me.CKAntiNetSnifferCs.TabIndex = 10
        Me.CKAntiNetSnifferCs.Text = "Anti NetSnifferCs"
        Me.CKAntiNetSnifferCs.UseVisualStyleBackColor = True
        '
        'CKAntiexeinfoPE
        '
        Me.CKAntiexeinfoPE.AutoSize = True
        Me.CKAntiexeinfoPE.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiexeinfoPE.Location = New System.Drawing.Point(6, 162)
        Me.CKAntiexeinfoPE.Name = "CKAntiexeinfoPE"
        Me.CKAntiexeinfoPE.Size = New System.Drawing.Size(103, 17)
        Me.CKAntiexeinfoPE.TabIndex = 9
        Me.CKAntiexeinfoPE.Text = "Anti exeinfoPE"
        Me.CKAntiexeinfoPE.UseVisualStyleBackColor = True
        '
        'CKAntiSmsniff
        '
        Me.CKAntiSmsniff.AutoSize = True
        Me.CKAntiSmsniff.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiSmsniff.Location = New System.Drawing.Point(6, 144)
        Me.CKAntiSmsniff.Name = "CKAntiSmsniff"
        Me.CKAntiSmsniff.Size = New System.Drawing.Size(90, 17)
        Me.CKAntiSmsniff.TabIndex = 8
        Me.CKAntiSmsniff.Text = "Anti Smsniff"
        Me.CKAntiSmsniff.UseVisualStyleBackColor = True
        '
        'CKAntiTiGeR_Firewall
        '
        Me.CKAntiTiGeR_Firewall.AutoSize = True
        Me.CKAntiTiGeR_Firewall.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiTiGeR_Firewall.Location = New System.Drawing.Point(6, 126)
        Me.CKAntiTiGeR_Firewall.Name = "CKAntiTiGeR_Firewall"
        Me.CKAntiTiGeR_Firewall.Size = New System.Drawing.Size(125, 17)
        Me.CKAntiTiGeR_Firewall.TabIndex = 7
        Me.CKAntiTiGeR_Firewall.Text = "Anti TiGeR-Firewall"
        Me.CKAntiTiGeR_Firewall.UseVisualStyleBackColor = True
        '
        'CKAntiIPBlocker
        '
        Me.CKAntiIPBlocker.AutoSize = True
        Me.CKAntiIPBlocker.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiIPBlocker.Location = New System.Drawing.Point(6, 107)
        Me.CKAntiIPBlocker.Name = "CKAntiIPBlocker"
        Me.CKAntiIPBlocker.Size = New System.Drawing.Size(99, 17)
        Me.CKAntiIPBlocker.TabIndex = 6
        Me.CKAntiIPBlocker.Text = "Anti IPBlocker"
        Me.CKAntiIPBlocker.UseVisualStyleBackColor = True
        '
        'CKAntiapateDNS
        '
        Me.CKAntiapateDNS.AutoSize = True
        Me.CKAntiapateDNS.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiapateDNS.Location = New System.Drawing.Point(6, 89)
        Me.CKAntiapateDNS.Name = "CKAntiapateDNS"
        Me.CKAntiapateDNS.Size = New System.Drawing.Size(103, 17)
        Me.CKAntiapateDNS.TabIndex = 5
        Me.CKAntiapateDNS.Text = "Anti apateDNS"
        Me.CKAntiapateDNS.UseVisualStyleBackColor = True
        '
        'CKAntiWireshark
        '
        Me.CKAntiWireshark.AutoSize = True
        Me.CKAntiWireshark.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiWireshark.Location = New System.Drawing.Point(6, 70)
        Me.CKAntiWireshark.Name = "CKAntiWireshark"
        Me.CKAntiWireshark.Size = New System.Drawing.Size(103, 17)
        Me.CKAntiWireshark.TabIndex = 4
        Me.CKAntiWireshark.Text = "Anti Wireshark"
        Me.CKAntiWireshark.UseVisualStyleBackColor = True
        '
        'CKAntiSpyTheSpy
        '
        Me.CKAntiSpyTheSpy.AutoSize = True
        Me.CKAntiSpyTheSpy.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiSpyTheSpy.Location = New System.Drawing.Point(6, 52)
        Me.CKAntiSpyTheSpy.Name = "CKAntiSpyTheSpy"
        Me.CKAntiSpyTheSpy.Size = New System.Drawing.Size(108, 17)
        Me.CKAntiSpyTheSpy.TabIndex = 3
        Me.CKAntiSpyTheSpy.Text = "Anti SpyTheSpy"
        Me.CKAntiSpyTheSpy.UseVisualStyleBackColor = True
        '
        'CKAntiSbieCtrl
        '
        Me.CKAntiSbieCtrl.AutoSize = True
        Me.CKAntiSbieCtrl.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiSbieCtrl.Location = New System.Drawing.Point(6, 34)
        Me.CKAntiSbieCtrl.Name = "CKAntiSbieCtrl"
        Me.CKAntiSbieCtrl.Size = New System.Drawing.Size(91, 17)
        Me.CKAntiSbieCtrl.TabIndex = 2
        Me.CKAntiSbieCtrl.Text = "Anti SbieCtrl"
        Me.CKAntiSbieCtrl.UseVisualStyleBackColor = True
        '
        'CKAntiProcessExplorer
        '
        Me.CKAntiProcessExplorer.AutoSize = True
        Me.CKAntiProcessExplorer.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiProcessExplorer.Location = New System.Drawing.Point(6, 16)
        Me.CKAntiProcessExplorer.Name = "CKAntiProcessExplorer"
        Me.CKAntiProcessExplorer.Size = New System.Drawing.Size(136, 17)
        Me.CKAntiProcessExplorer.TabIndex = 0
        Me.CKAntiProcessExplorer.Text = "Anti Process Explorer"
        Me.CKAntiProcessExplorer.UseVisualStyleBackColor = True
        '
        'GBSites
        '
        Me.GBSites.Controls.Add(Me.CBListaSites)
        Me.GBSites.Controls.Add(Me.LVListSites)
        Me.GBSites.Controls.Add(Me.CKBlockSites)
        Me.GBSites.Controls.Add(Me.btnAdiconarSites)
        Me.GBSites.Controls.Add(Me.Label6)
        Me.GBSites.Controls.Add(Me.PictureBox7)
        Me.GBSites.ForeColor = System.Drawing.Color.White
        Me.GBSites.Location = New System.Drawing.Point(118, 14)
        Me.GBSites.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.GBSites.Name = "GBSites"
        Me.GBSites.Padding = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.GBSites.Size = New System.Drawing.Size(329, 256)
        Me.GBSites.TabIndex = 48
        Me.GBSites.TabStop = False
        Me.GBSites.Text = "Bloquear (Sites)"
        '
        'CBListaSites
        '
        Me.CBListaSites.BackColor = System.Drawing.Color.Black
        Me.CBListaSites.Enabled = False
        Me.CBListaSites.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.CBListaSites.ForeColor = System.Drawing.Color.White
        Me.CBListaSites.FormattingEnabled = True
        Me.CBListaSites.Items.AddRange(New Object() {"refud.me", "www.nodistribute.com", "razorscanner.com", "viruscheckmate.com", "virusimmune.com", "check4you.net", "fuckingscan.me", "22h.net", "v2.scan.majyx.net", "xcscanner.com", "www.metascan-online.com", "virusscan.jotti.org", "www.virustotal.com"})
        Me.CBListaSites.Location = New System.Drawing.Point(5, 230)
        Me.CBListaSites.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CBListaSites.Name = "CBListaSites"
        Me.CBListaSites.Size = New System.Drawing.Size(233, 20)
        Me.CBListaSites.TabIndex = 5
        '
        'LVListSites
        '
        Me.LVListSites.BackColor = System.Drawing.Color.Black
        Me.LVListSites.BorderStyle = System.Windows.Forms.BorderStyle.None
        Me.LVListSites.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1})
        Me.LVListSites.ContextMenuStrip = Me.CT
        Me.LVListSites.Enabled = False
        Me.LVListSites.ForeColor = System.Drawing.Color.White
        Me.LVListSites.FullRowSelect = True
        Me.LVListSites.GridLines = True
        Me.LVListSites.Location = New System.Drawing.Point(5, 30)
        Me.LVListSites.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.LVListSites.Name = "LVListSites"
        Me.LVListSites.Size = New System.Drawing.Size(318, 196)
        Me.LVListSites.SmallImageList = Me.IM1
        Me.LVListSites.TabIndex = 4
        Me.LVListSites.UseCompatibleStateImageBehavior = False
        Me.LVListSites.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "URL"
        Me.ColumnHeader1.Width = 318
        '
        'CT
        '
        Me.CT.BackColor = System.Drawing.Color.Black
        Me.CT.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ExcluirToolStripMenuItem, Me.ExcluirTodosToolStripMenuItem})
        Me.CT.Name = "CT"
        Me.CT.ShowImageMargin = False
        Me.CT.Size = New System.Drawing.Size(120, 48)
        '
        'ExcluirToolStripMenuItem
        '
        Me.ExcluirToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.ExcluirToolStripMenuItem.Name = "ExcluirToolStripMenuItem"
        Me.ExcluirToolStripMenuItem.Size = New System.Drawing.Size(119, 22)
        Me.ExcluirToolStripMenuItem.Text = "Excluir"
        '
        'ExcluirTodosToolStripMenuItem
        '
        Me.ExcluirTodosToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.ExcluirTodosToolStripMenuItem.Name = "ExcluirTodosToolStripMenuItem"
        Me.ExcluirTodosToolStripMenuItem.Size = New System.Drawing.Size(119, 22)
        Me.ExcluirTodosToolStripMenuItem.Text = "Excluir Todos"
        Me.ExcluirTodosToolStripMenuItem.TextDirection = System.Windows.Forms.ToolStripTextDirection.Horizontal
        '
        'IM1
        '
        Me.IM1.ImageStream = CType(resources.GetObject("IM1.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.IM1.TransparentColor = System.Drawing.Color.Transparent
        Me.IM1.Images.SetKeyName(0, "254.png")
        '
        'CKBlockSites
        '
        Me.CKBlockSites.AutoSize = True
        Me.CKBlockSites.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKBlockSites.Location = New System.Drawing.Point(200, 13)
        Me.CKBlockSites.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CKBlockSites.Name = "CKBlockSites"
        Me.CKBlockSites.Size = New System.Drawing.Size(108, 17)
        Me.CKBlockSites.TabIndex = 45
        Me.CKBlockSites.Text = "Bloquear (Sites)"
        Me.CKBlockSites.UseVisualStyleBackColor = True
        '
        'btnAdiconarSites
        '
        Me.btnAdiconarSites.BackColor = System.Drawing.Color.Black
        Me.btnAdiconarSites.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnAdiconarSites.Enabled = False
        Me.btnAdiconarSites.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnAdiconarSites.Location = New System.Drawing.Point(242, 230)
        Me.btnAdiconarSites.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.btnAdiconarSites.Name = "btnAdiconarSites"
        Me.btnAdiconarSites.Size = New System.Drawing.Size(81, 21)
        Me.btnAdiconarSites.TabIndex = 2
        Me.btnAdiconarSites.Text = "Adicionar"
        Me.btnAdiconarSites.UseVisualStyleBackColor = False
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(1, 17)
        Me.Label6.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(31, 13)
        Me.Label6.TabIndex = 1
        Me.Label6.Text = "Lista"
        '
        'PictureBox7
        '
        Me.PictureBox7.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox7.Image = CType(resources.GetObject("PictureBox7.Image"), System.Drawing.Image)
        Me.PictureBox7.Location = New System.Drawing.Point(307, 11)
        Me.PictureBox7.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PictureBox7.Name = "PictureBox7"
        Me.PictureBox7.Size = New System.Drawing.Size(17, 18)
        Me.PictureBox7.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.PictureBox7.TabIndex = 43
        Me.PictureBox7.TabStop = False
        '
        'GroupBox6
        '
        Me.GroupBox6.Controls.Add(Me.PictureBox21)
        Me.GroupBox6.Controls.Add(Me.CKBypassFirewall)
        Me.GroupBox6.Controls.Add(Me.CKAntiKillProcess)
        Me.GroupBox6.Controls.Add(Me.CKOcutarServidor)
        Me.GroupBox6.Controls.Add(Me.PictureBox1)
        Me.GroupBox6.Controls.Add(Me.CKAgendarServidor)
        Me.GroupBox6.Controls.Add(Me.CKProtectProcess)
        Me.GroupBox6.Controls.Add(Me.CKExcluirArquivo)
        Me.GroupBox6.ForeColor = System.Drawing.Color.White
        Me.GroupBox6.Location = New System.Drawing.Point(135, 80)
        Me.GroupBox6.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.GroupBox6.Name = "GroupBox6"
        Me.GroupBox6.Padding = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.GroupBox6.Size = New System.Drawing.Size(294, 125)
        Me.GroupBox6.TabIndex = 47
        Me.GroupBox6.TabStop = False
        Me.GroupBox6.Text = "Shield"
        '
        'PictureBox21
        '
        Me.PictureBox21.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox21.Image = CType(resources.GetObject("PictureBox21.Image"), System.Drawing.Image)
        Me.PictureBox21.Location = New System.Drawing.Point(159, 84)
        Me.PictureBox21.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PictureBox21.Name = "PictureBox21"
        Me.PictureBox21.Size = New System.Drawing.Size(17, 18)
        Me.PictureBox21.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.PictureBox21.TabIndex = 48
        Me.PictureBox21.TabStop = False
        '
        'CKBypassFirewall
        '
        Me.CKBypassFirewall.AutoSize = True
        Me.CKBypassFirewall.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKBypassFirewall.Location = New System.Drawing.Point(6, 85)
        Me.CKBypassFirewall.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CKBypassFirewall.Name = "CKBypassFirewall"
        Me.CKBypassFirewall.Size = New System.Drawing.Size(157, 17)
        Me.CKBypassFirewall.TabIndex = 47
        Me.CKBypassFirewall.Text = "Bypass Firewall Windows"
        Me.CKBypassFirewall.UseVisualStyleBackColor = True
        '
        'CKAntiKillProcess
        '
        Me.CKAntiKillProcess.AutoCheck = False
        Me.CKAntiKillProcess.AutoSize = True
        Me.CKAntiKillProcess.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAntiKillProcess.Location = New System.Drawing.Point(6, 102)
        Me.CKAntiKillProcess.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CKAntiKillProcess.Name = "CKAntiKillProcess"
        Me.CKAntiKillProcess.Size = New System.Drawing.Size(137, 17)
        Me.CKAntiKillProcess.TabIndex = 46
        Me.CKAntiKillProcess.Text = "Anti Kill Process /OFF"
        Me.CKAntiKillProcess.UseVisualStyleBackColor = True
        '
        'CKOcutarServidor
        '
        Me.CKOcutarServidor.AutoSize = True
        Me.CKOcutarServidor.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKOcutarServidor.Location = New System.Drawing.Point(6, 68)
        Me.CKOcutarServidor.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CKOcutarServidor.Name = "CKOcutarServidor"
        Me.CKOcutarServidor.Size = New System.Drawing.Size(110, 17)
        Me.CKOcutarServidor.TabIndex = 45
        Me.CKOcutarServidor.Text = "Ocutar Arquivos"
        Me.CKOcutarServidor.UseVisualStyleBackColor = True
        '
        'PictureBox1
        '
        Me.PictureBox1.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox1.Image = CType(resources.GetObject("PictureBox1.Image"), System.Drawing.Image)
        Me.PictureBox1.Location = New System.Drawing.Point(147, 16)
        Me.PictureBox1.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(17, 18)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.PictureBox1.TabIndex = 43
        Me.PictureBox1.TabStop = False
        '
        'CKAgendarServidor
        '
        Me.CKAgendarServidor.AutoSize = True
        Me.CKAgendarServidor.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAgendarServidor.Location = New System.Drawing.Point(6, 51)
        Me.CKAgendarServidor.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CKAgendarServidor.Name = "CKAgendarServidor"
        Me.CKAgendarServidor.Size = New System.Drawing.Size(153, 17)
        Me.CKAgendarServidor.TabIndex = 41
        Me.CKAgendarServidor.Text = "Agendar Servidor 1 Min."
        Me.CKAgendarServidor.UseVisualStyleBackColor = True
        '
        'CKExcluirArquivo
        '
        Me.CKExcluirArquivo.AutoSize = True
        Me.CKExcluirArquivo.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKExcluirArquivo.Location = New System.Drawing.Point(6, 34)
        Me.CKExcluirArquivo.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CKExcluirArquivo.Name = "CKExcluirArquivo"
        Me.CKExcluirArquivo.Size = New System.Drawing.Size(140, 17)
        Me.CKExcluirArquivo.TabIndex = 36
        Me.CKExcluirArquivo.Text = "Excluir Arquivo (Melt)"
        Me.CKExcluirArquivo.UseVisualStyleBackColor = True
        '
        'CKAtivarEncryptarHost
        '
        Me.CKAtivarEncryptarHost.AutoSize = True
        Me.CKAtivarEncryptarHost.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAtivarEncryptarHost.Location = New System.Drawing.Point(139, 56)
        Me.CKAtivarEncryptarHost.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CKAtivarEncryptarHost.Name = "CKAtivarEncryptarHost"
        Me.CKAtivarEncryptarHost.Size = New System.Drawing.Size(102, 17)
        Me.CKAtivarEncryptarHost.TabIndex = 45
        Me.CKAtivarEncryptarHost.Text = "Encryptar Host"
        Me.CKAtivarEncryptarHost.UseVisualStyleBackColor = True
        '
        'GroupBox5
        '
        Me.GroupBox5.Controls.Add(Me.NDQuantidadeStrings)
        Me.GroupBox5.Controls.Add(Me.Label11)
        Me.GroupBox5.Controls.Add(Me.txtStringOfuscador)
        Me.GroupBox5.Controls.Add(Me.CBStorageMethod)
        Me.GroupBox5.Controls.Add(Me.Label10)
        Me.GroupBox5.Controls.Add(Me.CKAtivarOfuscaçao)
        Me.GroupBox5.Controls.Add(Me.RandomST1)
        Me.GroupBox5.ForeColor = System.Drawing.Color.White
        Me.GroupBox5.Location = New System.Drawing.Point(30, 29)
        Me.GroupBox5.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.GroupBox5.Name = "GroupBox5"
        Me.GroupBox5.Padding = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.GroupBox5.Size = New System.Drawing.Size(504, 226)
        Me.GroupBox5.TabIndex = 46
        Me.GroupBox5.TabStop = False
        Me.GroupBox5.Text = "Ofuscação"
        '
        'NDQuantidadeStrings
        '
        Me.NDQuantidadeStrings.BackColor = System.Drawing.Color.Black
        Me.NDQuantidadeStrings.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.NDQuantidadeStrings.Enabled = False
        Me.NDQuantidadeStrings.ForeColor = System.Drawing.Color.White
        Me.NDQuantidadeStrings.Increment = New Decimal(New Integer() {100, 0, 0, 0})
        Me.NDQuantidadeStrings.Location = New System.Drawing.Point(412, 104)
        Me.NDQuantidadeStrings.Maximum = New Decimal(New Integer() {-727379969, 232, 0, 0})
        Me.NDQuantidadeStrings.Minimum = New Decimal(New Integer() {1, 0, 0, 0})
        Me.NDQuantidadeStrings.Name = "NDQuantidadeStrings"
        Me.NDQuantidadeStrings.Size = New System.Drawing.Size(80, 21)
        Me.NDQuantidadeStrings.TabIndex = 58
        Me.NDQuantidadeStrings.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        Me.NDQuantidadeStrings.Value = New Decimal(New Integer() {300, 0, 0, 0})
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.Location = New System.Drawing.Point(6, 17)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(43, 13)
        Me.Label11.TabIndex = 53
        Me.Label11.Text = "Strings"
        '
        'txtStringOfuscador
        '
        Me.txtStringOfuscador.BackColor = System.Drawing.Color.Black
        Me.txtStringOfuscador.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtStringOfuscador.Enabled = False
        Me.txtStringOfuscador.ForeColor = System.Drawing.Color.White
        Me.txtStringOfuscador.Location = New System.Drawing.Point(9, 31)
        Me.txtStringOfuscador.Multiline = True
        Me.txtStringOfuscador.Name = "txtStringOfuscador"
        Me.txtStringOfuscador.Size = New System.Drawing.Size(483, 55)
        Me.txtStringOfuscador.TabIndex = 52
        Me.txtStringOfuscador.Text = resources.GetString("txtStringOfuscador.Text")
        '
        'CBStorageMethod
        '
        Me.CBStorageMethod.BackColor = System.Drawing.Color.Black
        Me.CBStorageMethod.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.CBStorageMethod.Enabled = False
        Me.CBStorageMethod.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.CBStorageMethod.ForeColor = System.Drawing.Color.White
        Me.CBStorageMethod.FormattingEnabled = True
        Me.CBStorageMethod.Items.AddRange(New Object() {"Native Resources", "Managed Resources", "String Variable", "Numeric Variable"})
        Me.CBStorageMethod.Location = New System.Drawing.Point(9, 105)
        Me.CBStorageMethod.Name = "CBStorageMethod"
        Me.CBStorageMethod.Size = New System.Drawing.Size(397, 20)
        Me.CBStorageMethod.TabIndex = 49
        '
        'Label10
        '
        Me.Label10.AutoSize = True
        Me.Label10.Location = New System.Drawing.Point(6, 89)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(92, 13)
        Me.Label10.TabIndex = 50
        Me.Label10.Text = "Storage Method"
        '
        'CKAtivarOfuscaçao
        '
        Me.CKAtivarOfuscaçao.AutoSize = True
        Me.CKAtivarOfuscaçao.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAtivarOfuscaçao.Location = New System.Drawing.Point(443, 13)
        Me.CKAtivarOfuscaçao.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CKAtivarOfuscaçao.Name = "CKAtivarOfuscaçao"
        Me.CKAtivarOfuscaçao.Size = New System.Drawing.Size(57, 17)
        Me.CKAtivarOfuscaçao.TabIndex = 51
        Me.CKAtivarOfuscaçao.Text = "Ativar"
        Me.CKAtivarOfuscaçao.UseVisualStyleBackColor = True
        '
        'RandomST1
        '
        Me.RandomST1.Enabled = False
        Me.RandomST1.Location = New System.Drawing.Point(1, 131)
        Me.RandomST1.Name = "RandomST1"
        Me.RandomST1.Size = New System.Drawing.Size(499, 94)
        Me.RandomST1.TabIndex = 59
        Me.RandomST1.Text = "RandomST1"
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Location = New System.Drawing.Point(211, 158)
        Me.Label8.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(29, 13)
        Me.Label8.TabIndex = 36
        Me.Label8.Text = "Seg."
        '
        'CKAtivarDelay
        '
        Me.CKAtivarDelay.AutoSize = True
        Me.CKAtivarDelay.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAtivarDelay.Location = New System.Drawing.Point(9, 136)
        Me.CKAtivarDelay.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CKAtivarDelay.Name = "CKAtivarDelay"
        Me.CKAtivarDelay.Size = New System.Drawing.Size(123, 17)
        Me.CKAtivarDelay.TabIndex = 35
        Me.CKAtivarDelay.Text = "Execução Atrasada"
        Me.CKAtivarDelay.UseVisualStyleBackColor = True
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.GroupBox14)
        Me.GroupBox3.Controls.Add(Me.GroupBox13)
        Me.GroupBox3.Controls.Add(Me.btnTestMensagem)
        Me.GroupBox3.Controls.Add(Me.txtTitulo)
        Me.GroupBox3.Controls.Add(Me.txtMensagem)
        Me.GroupBox3.Controls.Add(Me.lbMSG)
        Me.GroupBox3.Controls.Add(Me.CKAtivarMensagem)
        Me.GroupBox3.ForeColor = System.Drawing.Color.White
        Me.GroupBox3.Location = New System.Drawing.Point(27, 20)
        Me.GroupBox3.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Padding = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.GroupBox3.Size = New System.Drawing.Size(510, 245)
        Me.GroupBox3.TabIndex = 45
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "Mensagem"
        '
        'GroupBox14
        '
        Me.GroupBox14.Controls.Add(Me.RBbuttonOkCancelarAjuda)
        Me.GroupBox14.Controls.Add(Me.RBButtonSimNaoCancelar)
        Me.GroupBox14.Controls.Add(Me.RBButtonAnularRepetirIgnorar)
        Me.GroupBox14.Controls.Add(Me.RBButtonRepetirCancelar)
        Me.GroupBox14.Controls.Add(Me.RBButtonSimNao)
        Me.GroupBox14.Controls.Add(Me.RBButtonOk)
        Me.GroupBox14.Controls.Add(Me.TBButtonOkCencelar)
        Me.GroupBox14.Enabled = False
        Me.GroupBox14.ForeColor = System.Drawing.Color.White
        Me.GroupBox14.Location = New System.Drawing.Point(151, 40)
        Me.GroupBox14.Name = "GroupBox14"
        Me.GroupBox14.Size = New System.Drawing.Size(160, 172)
        Me.GroupBox14.TabIndex = 51
        Me.GroupBox14.TabStop = False
        Me.GroupBox14.Text = "Botões"
        '
        'RBbuttonOkCancelarAjuda
        '
        Me.RBbuttonOkCancelarAjuda.AutoSize = True
        Me.RBbuttonOkCancelarAjuda.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBbuttonOkCancelarAjuda.Location = New System.Drawing.Point(6, 149)
        Me.RBbuttonOkCancelarAjuda.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.RBbuttonOkCancelarAjuda.Name = "RBbuttonOkCancelarAjuda"
        Me.RBbuttonOkCancelarAjuda.Size = New System.Drawing.Size(126, 17)
        Me.RBbuttonOkCancelarAjuda.TabIndex = 53
        Me.RBbuttonOkCancelarAjuda.Text = "OK, Cancelar, Ajuda"
        Me.RBbuttonOkCancelarAjuda.UseVisualStyleBackColor = True
        '
        'RBButtonSimNaoCancelar
        '
        Me.RBButtonSimNaoCancelar.AutoSize = True
        Me.RBButtonSimNaoCancelar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBButtonSimNaoCancelar.Location = New System.Drawing.Point(6, 105)
        Me.RBButtonSimNaoCancelar.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.RBButtonSimNaoCancelar.Name = "RBButtonSimNaoCancelar"
        Me.RBButtonSimNaoCancelar.Size = New System.Drawing.Size(122, 17)
        Me.RBButtonSimNaoCancelar.TabIndex = 51
        Me.RBButtonSimNaoCancelar.Text = "Sim, Não, Cancelar"
        Me.RBButtonSimNaoCancelar.UseVisualStyleBackColor = True
        '
        'RBButtonAnularRepetirIgnorar
        '
        Me.RBButtonAnularRepetirIgnorar.AutoSize = True
        Me.RBButtonAnularRepetirIgnorar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBButtonAnularRepetirIgnorar.Location = New System.Drawing.Point(6, 128)
        Me.RBButtonAnularRepetirIgnorar.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.RBButtonAnularRepetirIgnorar.Name = "RBButtonAnularRepetirIgnorar"
        Me.RBButtonAnularRepetirIgnorar.Size = New System.Drawing.Size(145, 17)
        Me.RBButtonAnularRepetirIgnorar.TabIndex = 52
        Me.RBButtonAnularRepetirIgnorar.Text = "Anular, Repetir, Ignorar"
        Me.RBButtonAnularRepetirIgnorar.UseVisualStyleBackColor = True
        '
        'RBButtonRepetirCancelar
        '
        Me.RBButtonRepetirCancelar.AutoSize = True
        Me.RBButtonRepetirCancelar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBButtonRepetirCancelar.Location = New System.Drawing.Point(6, 60)
        Me.RBButtonRepetirCancelar.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.RBButtonRepetirCancelar.Name = "RBButtonRepetirCancelar"
        Me.RBButtonRepetirCancelar.Size = New System.Drawing.Size(111, 17)
        Me.RBButtonRepetirCancelar.TabIndex = 49
        Me.RBButtonRepetirCancelar.Text = "Repetir, Cancelar"
        Me.RBButtonRepetirCancelar.UseVisualStyleBackColor = True
        '
        'RBButtonSimNao
        '
        Me.RBButtonSimNao.AutoSize = True
        Me.RBButtonSimNao.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBButtonSimNao.Location = New System.Drawing.Point(6, 82)
        Me.RBButtonSimNao.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.RBButtonSimNao.Name = "RBButtonSimNao"
        Me.RBButtonSimNao.Size = New System.Drawing.Size(72, 17)
        Me.RBButtonSimNao.TabIndex = 50
        Me.RBButtonSimNao.Text = "Sim, Não"
        Me.RBButtonSimNao.UseVisualStyleBackColor = True
        '
        'RBButtonOk
        '
        Me.RBButtonOk.AutoSize = True
        Me.RBButtonOk.Checked = True
        Me.RBButtonOk.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBButtonOk.Location = New System.Drawing.Point(6, 15)
        Me.RBButtonOk.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.RBButtonOk.Name = "RBButtonOk"
        Me.RBButtonOk.Size = New System.Drawing.Size(40, 17)
        Me.RBButtonOk.TabIndex = 47
        Me.RBButtonOk.TabStop = True
        Me.RBButtonOk.Text = "OK"
        Me.RBButtonOk.UseVisualStyleBackColor = True
        '
        'TBButtonOkCencelar
        '
        Me.TBButtonOkCencelar.AutoSize = True
        Me.TBButtonOkCencelar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.TBButtonOkCencelar.Location = New System.Drawing.Point(6, 38)
        Me.TBButtonOkCencelar.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.TBButtonOkCencelar.Name = "TBButtonOkCencelar"
        Me.TBButtonOkCencelar.Size = New System.Drawing.Size(90, 17)
        Me.TBButtonOkCencelar.TabIndex = 48
        Me.TBButtonOkCencelar.Text = "OK, Cancelar"
        Me.TBButtonOkCencelar.UseVisualStyleBackColor = True
        '
        'GroupBox13
        '
        Me.GroupBox13.Controls.Add(Me.PictureBox3)
        Me.GroupBox13.Controls.Add(Me.RDPergunta)
        Me.GroupBox13.Controls.Add(Me.PictureBox2)
        Me.GroupBox13.Controls.Add(Me.RDNenhum)
        Me.GroupBox13.Controls.Add(Me.PictureBox6)
        Me.GroupBox13.Controls.Add(Me.PictureBox5)
        Me.GroupBox13.Controls.Add(Me.PictureBox4)
        Me.GroupBox13.Controls.Add(Me.RDInformacao)
        Me.GroupBox13.Controls.Add(Me.RDErro)
        Me.GroupBox13.Controls.Add(Me.RDAtencao)
        Me.GroupBox13.Enabled = False
        Me.GroupBox13.ForeColor = System.Drawing.Color.White
        Me.GroupBox13.Location = New System.Drawing.Point(5, 40)
        Me.GroupBox13.Name = "GroupBox13"
        Me.GroupBox13.Size = New System.Drawing.Size(142, 172)
        Me.GroupBox13.TabIndex = 50
        Me.GroupBox13.TabStop = False
        Me.GroupBox13.Text = "Ícone da Mensagem"
        '
        'PictureBox3
        '
        Me.PictureBox3.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox3.Image = CType(resources.GetObject("PictureBox3.Image"), System.Drawing.Image)
        Me.PictureBox3.Location = New System.Drawing.Point(5, 20)
        Me.PictureBox3.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PictureBox3.Name = "PictureBox3"
        Me.PictureBox3.Size = New System.Drawing.Size(31, 24)
        Me.PictureBox3.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PictureBox3.TabIndex = 47
        Me.PictureBox3.TabStop = False
        '
        'RDPergunta
        '
        Me.RDPergunta.AutoSize = True
        Me.RDPergunta.Checked = True
        Me.RDPergunta.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RDPergunta.Location = New System.Drawing.Point(40, 24)
        Me.RDPergunta.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.RDPergunta.Name = "RDPergunta"
        Me.RDPergunta.Size = New System.Drawing.Size(73, 17)
        Me.RDPergunta.TabIndex = 45
        Me.RDPergunta.TabStop = True
        Me.RDPergunta.Text = "Pergunta"
        Me.RDPergunta.UseVisualStyleBackColor = True
        '
        'PictureBox2
        '
        Me.PictureBox2.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox2.Image = CType(resources.GetObject("PictureBox2.Image"), System.Drawing.Image)
        Me.PictureBox2.Location = New System.Drawing.Point(5, 50)
        Me.PictureBox2.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PictureBox2.Name = "PictureBox2"
        Me.PictureBox2.Size = New System.Drawing.Size(31, 24)
        Me.PictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PictureBox2.TabIndex = 47
        Me.PictureBox2.TabStop = False
        '
        'RDNenhum
        '
        Me.RDNenhum.AutoSize = True
        Me.RDNenhum.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RDNenhum.Location = New System.Drawing.Point(40, 143)
        Me.RDNenhum.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.RDNenhum.Name = "RDNenhum"
        Me.RDNenhum.Size = New System.Drawing.Size(71, 17)
        Me.RDNenhum.TabIndex = 45
        Me.RDNenhum.Text = "Nenhum"
        Me.RDNenhum.UseVisualStyleBackColor = True
        '
        'PictureBox6
        '
        Me.PictureBox6.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox6.Location = New System.Drawing.Point(5, 139)
        Me.PictureBox6.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PictureBox6.Name = "PictureBox6"
        Me.PictureBox6.Size = New System.Drawing.Size(31, 24)
        Me.PictureBox6.TabIndex = 47
        Me.PictureBox6.TabStop = False
        '
        'PictureBox5
        '
        Me.PictureBox5.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox5.Image = CType(resources.GetObject("PictureBox5.Image"), System.Drawing.Image)
        Me.PictureBox5.Location = New System.Drawing.Point(5, 80)
        Me.PictureBox5.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PictureBox5.Name = "PictureBox5"
        Me.PictureBox5.Size = New System.Drawing.Size(31, 24)
        Me.PictureBox5.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PictureBox5.TabIndex = 47
        Me.PictureBox5.TabStop = False
        '
        'PictureBox4
        '
        Me.PictureBox4.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox4.Image = CType(resources.GetObject("PictureBox4.Image"), System.Drawing.Image)
        Me.PictureBox4.Location = New System.Drawing.Point(5, 109)
        Me.PictureBox4.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PictureBox4.Name = "PictureBox4"
        Me.PictureBox4.Size = New System.Drawing.Size(31, 24)
        Me.PictureBox4.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PictureBox4.TabIndex = 47
        Me.PictureBox4.TabStop = False
        '
        'RDInformacao
        '
        Me.RDInformacao.AutoSize = True
        Me.RDInformacao.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RDInformacao.Location = New System.Drawing.Point(40, 113)
        Me.RDInformacao.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.RDInformacao.Name = "RDInformacao"
        Me.RDInformacao.Size = New System.Drawing.Size(84, 17)
        Me.RDInformacao.TabIndex = 45
        Me.RDInformacao.Text = "Informação"
        Me.RDInformacao.UseVisualStyleBackColor = True
        '
        'RDErro
        '
        Me.RDErro.AutoSize = True
        Me.RDErro.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RDErro.Location = New System.Drawing.Point(40, 54)
        Me.RDErro.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.RDErro.Name = "RDErro"
        Me.RDErro.Size = New System.Drawing.Size(46, 17)
        Me.RDErro.TabIndex = 46
        Me.RDErro.Text = "Erro"
        Me.RDErro.UseVisualStyleBackColor = True
        '
        'RDAtencao
        '
        Me.RDAtencao.AutoSize = True
        Me.RDAtencao.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RDAtencao.Location = New System.Drawing.Point(40, 84)
        Me.RDAtencao.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.RDAtencao.Name = "RDAtencao"
        Me.RDAtencao.Size = New System.Drawing.Size(68, 17)
        Me.RDAtencao.TabIndex = 46
        Me.RDAtencao.Text = "Atenção"
        Me.RDAtencao.UseVisualStyleBackColor = True
        '
        'btnTestMensagem
        '
        Me.btnTestMensagem.BackColor = System.Drawing.Color.Black
        Me.btnTestMensagem.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnTestMensagem.Enabled = False
        Me.btnTestMensagem.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnTestMensagem.Location = New System.Drawing.Point(5, 215)
        Me.btnTestMensagem.Name = "btnTestMensagem"
        Me.btnTestMensagem.Size = New System.Drawing.Size(499, 25)
        Me.btnTestMensagem.TabIndex = 49
        Me.btnTestMensagem.Text = "OK"
        Me.btnTestMensagem.UseVisualStyleBackColor = False
        '
        'txtTitulo
        '
        Me.txtTitulo.BackColor = System.Drawing.Color.Black
        Me.txtTitulo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtTitulo.Enabled = False
        Me.txtTitulo.ForeColor = System.Drawing.Color.White
        Me.txtTitulo.Location = New System.Drawing.Point(314, 47)
        Me.txtTitulo.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.txtTitulo.Name = "txtTitulo"
        Me.txtTitulo.Size = New System.Drawing.Size(190, 21)
        Me.txtTitulo.TabIndex = 48
        Me.txtTitulo.Text = "Coringa-RAT"
        '
        'txtMensagem
        '
        Me.txtMensagem.BackColor = System.Drawing.Color.Black
        Me.txtMensagem.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtMensagem.Enabled = False
        Me.txtMensagem.ForeColor = System.Drawing.Color.White
        Me.txtMensagem.Location = New System.Drawing.Point(314, 69)
        Me.txtMensagem.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.txtMensagem.Multiline = True
        Me.txtMensagem.Name = "txtMensagem"
        Me.txtMensagem.Size = New System.Drawing.Size(190, 143)
        Me.txtMensagem.TabIndex = 43
        Me.txtMensagem.Text = "Foda-se"
        '
        'lbMSG
        '
        Me.lbMSG.AutoSize = True
        Me.lbMSG.Enabled = False
        Me.lbMSG.Location = New System.Drawing.Point(311, 34)
        Me.lbMSG.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.lbMSG.Name = "lbMSG"
        Me.lbMSG.Size = New System.Drawing.Size(37, 13)
        Me.lbMSG.TabIndex = 44
        Me.lbMSG.Text = "Titulo"
        '
        'CKAtivarMensagem
        '
        Me.CKAtivarMensagem.AutoSize = True
        Me.CKAtivarMensagem.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAtivarMensagem.Location = New System.Drawing.Point(7, 18)
        Me.CKAtivarMensagem.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CKAtivarMensagem.Name = "CKAtivarMensagem"
        Me.CKAtivarMensagem.Size = New System.Drawing.Size(116, 17)
        Me.CKAtivarMensagem.TabIndex = 43
        Me.CKAtivarMensagem.Text = "Exibir Mensagem"
        Me.CKAtivarMensagem.UseVisualStyleBackColor = True
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.Label16)
        Me.GroupBox2.Controls.Add(Me.CBTamanhoICO)
        Me.GroupBox2.Controls.Add(Me.lbIcones)
        Me.GroupBox2.Controls.Add(Me.Label12)
        Me.GroupBox2.Controls.Add(Me.CBIcones)
        Me.GroupBox2.Controls.Add(Me.btnListarPadraoIcones)
        Me.GroupBox2.Controls.Add(Me.LVIcones)
        Me.GroupBox2.Controls.Add(Me.btnTirarIco)
        Me.GroupBox2.Controls.Add(Me.btnIco)
        Me.GroupBox2.Controls.Add(Me.PicIco)
        Me.GroupBox2.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox2.ForeColor = System.Drawing.SystemColors.ButtonHighlight
        Me.GroupBox2.Location = New System.Drawing.Point(4, 2)
        Me.GroupBox2.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Padding = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.GroupBox2.Size = New System.Drawing.Size(555, 276)
        Me.GroupBox2.TabIndex = 41
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Icones"
        '
        'Label16
        '
        Me.Label16.AutoSize = True
        Me.Label16.ForeColor = System.Drawing.Color.White
        Me.Label16.Location = New System.Drawing.Point(3, 150)
        Me.Label16.Name = "Label16"
        Me.Label16.Size = New System.Drawing.Size(55, 13)
        Me.Label16.TabIndex = 41
        Me.Label16.Text = "Tamanho"
        '
        'CBTamanhoICO
        '
        Me.CBTamanhoICO.BackColor = System.Drawing.Color.Black
        Me.CBTamanhoICO.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.CBTamanhoICO.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.CBTamanhoICO.ForeColor = System.Drawing.Color.DodgerBlue
        Me.CBTamanhoICO.FormattingEnabled = True
        Me.CBTamanhoICO.Items.AddRange(New Object() {"16,16", "24,24", "32,32", "48,48", "64,64"})
        Me.CBTamanhoICO.Location = New System.Drawing.Point(6, 166)
        Me.CBTamanhoICO.Name = "CBTamanhoICO"
        Me.CBTamanhoICO.Size = New System.Drawing.Size(137, 21)
        Me.CBTamanhoICO.TabIndex = 40
        '
        'lbIcones
        '
        Me.lbIcones.AutoSize = True
        Me.lbIcones.ForeColor = System.Drawing.Color.White
        Me.lbIcones.Location = New System.Drawing.Point(5, 68)
        Me.lbIcones.Name = "lbIcones"
        Me.lbIcones.Size = New System.Drawing.Size(68, 13)
        Me.lbIcones.TabIndex = 39
        Me.lbIcones.Text = "Icones (0/0)"
        '
        'Label12
        '
        Me.Label12.AutoSize = True
        Me.Label12.ForeColor = System.Drawing.Color.White
        Me.Label12.Location = New System.Drawing.Point(3, 190)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(70, 13)
        Me.Label12.TabIndex = 38
        Me.Label12.Text = "Visualização"
        '
        'CBIcones
        '
        Me.CBIcones.BackColor = System.Drawing.Color.Black
        Me.CBIcones.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.CBIcones.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.CBIcones.ForeColor = System.Drawing.Color.DodgerBlue
        Me.CBIcones.FormattingEnabled = True
        Me.CBIcones.Items.AddRange(New Object() {"LargeIcon", "Details", "SmallIcon", "List", "Tile"})
        Me.CBIcones.Location = New System.Drawing.Point(5, 205)
        Me.CBIcones.Name = "CBIcones"
        Me.CBIcones.Size = New System.Drawing.Size(137, 21)
        Me.CBIcones.TabIndex = 37
        '
        'btnListarPadraoIcones
        '
        Me.btnListarPadraoIcones.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnListarPadraoIcones.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnListarPadraoIcones.ForeColor = System.Drawing.Color.White
        Me.btnListarPadraoIcones.Location = New System.Drawing.Point(5, 232)
        Me.btnListarPadraoIcones.Name = "btnListarPadraoIcones"
        Me.btnListarPadraoIcones.Size = New System.Drawing.Size(136, 38)
        Me.btnListarPadraoIcones.TabIndex = 36
        Me.btnListarPadraoIcones.Text = "Lista Padrão (ICO)"
        Me.btnListarPadraoIcones.UseVisualStyleBackColor = True
        '
        'LVIcones
        '
        Me.LVIcones.BackColor = System.Drawing.Color.Black
        Me.LVIcones.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.LVIcones.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader2, Me.ColumnHeader3})
        Me.LVIcones.Cursor = System.Windows.Forms.Cursors.Hand
        Me.LVIcones.ForeColor = System.Drawing.Color.White
        Me.LVIcones.FullRowSelect = True
        Me.LVIcones.GridLines = True
        Me.LVIcones.LargeImageList = Me.IM3
        Me.LVIcones.Location = New System.Drawing.Point(147, 19)
        Me.LVIcones.Name = "LVIcones"
        Me.LVIcones.Size = New System.Drawing.Size(403, 251)
        Me.LVIcones.SmallImageList = Me.IM3
        Me.LVIcones.TabIndex = 35
        Me.LVIcones.UseCompatibleStateImageBehavior = False
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "Nome"
        Me.ColumnHeader2.Width = 137
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "Diretório"
        Me.ColumnHeader3.Width = 264
        '
        'IM3
        '
        Me.IM3.ColorDepth = System.Windows.Forms.ColorDepth.Depth32Bit
        Me.IM3.ImageSize = New System.Drawing.Size(30, 30)
        Me.IM3.TransparentColor = System.Drawing.Color.Transparent
        '
        'btnTirarIco
        '
        Me.btnTirarIco.BackColor = System.Drawing.Color.Black
        Me.btnTirarIco.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnTirarIco.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnTirarIco.ForeColor = System.Drawing.Color.White
        Me.btnTirarIco.Location = New System.Drawing.Point(8, 44)
        Me.btnTirarIco.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.btnTirarIco.Name = "btnTirarIco"
        Me.btnTirarIco.Size = New System.Drawing.Size(65, 21)
        Me.btnTirarIco.TabIndex = 34
        Me.btnTirarIco.Text = "X"
        Me.btnTirarIco.UseVisualStyleBackColor = False
        '
        'btnIco
        '
        Me.btnIco.BackColor = System.Drawing.Color.Black
        Me.btnIco.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnIco.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnIco.ForeColor = System.Drawing.Color.White
        Me.btnIco.Location = New System.Drawing.Point(8, 19)
        Me.btnIco.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.btnIco.Name = "btnIco"
        Me.btnIco.Size = New System.Drawing.Size(65, 21)
        Me.btnIco.TabIndex = 34
        Me.btnIco.Text = "Procurar"
        Me.btnIco.UseVisualStyleBackColor = False
        '
        'PicIco
        '
        Me.PicIco.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.PicIco.Location = New System.Drawing.Point(77, 19)
        Me.PicIco.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PicIco.Name = "PicIco"
        Me.PicIco.Size = New System.Drawing.Size(65, 46)
        Me.PicIco.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PicIco.TabIndex = 32
        Me.PicIco.TabStop = False
        '
        'CKPermisaoAdmin
        '
        Me.CKPermisaoAdmin.AutoSize = True
        Me.CKPermisaoAdmin.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKPermisaoAdmin.Location = New System.Drawing.Point(9, 186)
        Me.CKPermisaoAdmin.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CKPermisaoAdmin.Name = "CKPermisaoAdmin"
        Me.CKPermisaoAdmin.Size = New System.Drawing.Size(195, 17)
        Me.CKPermisaoAdmin.TabIndex = 45
        Me.CKPermisaoAdmin.Text = "For. Permissão de Administrador"
        Me.CKPermisaoAdmin.UseVisualStyleBackColor = True
        '
        'CBextensão
        '
        Me.CBextensão.BackColor = System.Drawing.Color.Black
        Me.CBextensão.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.CBextensão.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.CBextensão.ForeColor = System.Drawing.Color.White
        Me.CBextensão.FormattingEnabled = True
        Me.CBextensão.Items.AddRange(New Object() {"Arquivo Executavel [.exe]", "Arquivo Scr [.scr]", "Arquivo Com [.com]", "Arquivo Batch [.bat]", "Arquivo Pif [.pif]"})
        Me.CBextensão.Location = New System.Drawing.Point(5, 217)
        Me.CBextensão.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CBextensão.Name = "CBextensão"
        Me.CBextensão.Size = New System.Drawing.Size(171, 20)
        Me.CBextensão.TabIndex = 34
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(1, 203)
        Me.Label7.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(54, 13)
        Me.Label7.TabIndex = 46
        Me.Label7.Text = "Extensão"
        '
        'txtEncryptHost
        '
        Me.txtEncryptHost.BackColor = System.Drawing.Color.Black
        Me.txtEncryptHost.BorderStyle = System.Windows.Forms.BorderStyle.None
        Me.txtEncryptHost.Cursor = System.Windows.Forms.Cursors.Default
        Me.txtEncryptHost.Enabled = False
        Me.txtEncryptHost.ForeColor = System.Drawing.Color.White
        Me.txtEncryptHost.Location = New System.Drawing.Point(6, 260)
        Me.txtEncryptHost.Name = "txtEncryptHost"
        Me.txtEncryptHost.ReadOnly = True
        Me.txtEncryptHost.Size = New System.Drawing.Size(552, 14)
        Me.txtEncryptHost.TabIndex = 47
        Me.txtEncryptHost.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'GroupBox8
        '
        Me.GroupBox8.Controls.Add(Me.PictureBox16)
        Me.GroupBox8.Controls.Add(Me.PictureBox18)
        Me.GroupBox8.Controls.Add(Me.PictureBox9)
        Me.GroupBox8.Controls.Add(Me.CKDesativarFirewall)
        Me.GroupBox8.Controls.Add(Me.CKDesativarBarraDeTarefas)
        Me.GroupBox8.Controls.Add(Me.CKDesativarMenuContexto)
        Me.GroupBox8.Controls.Add(Me.CKDesativarOpçõesdePasta)
        Me.GroupBox8.Controls.Add(Me.CKDesativarPainelControle)
        Me.GroupBox8.Controls.Add(Me.CKDesativarUAC)
        Me.GroupBox8.Controls.Add(Me.CKDesativarExecutar)
        Me.GroupBox8.Controls.Add(Me.CKDesativarRegedit)
        Me.GroupBox8.Controls.Add(Me.CKDesativarCMD)
        Me.GroupBox8.Controls.Add(Me.CKDesativarGerenciadorTarefas)
        Me.GroupBox8.Controls.Add(Me.CKPermisaoAdmin)
        Me.GroupBox8.ForeColor = System.Drawing.Color.White
        Me.GroupBox8.Location = New System.Drawing.Point(170, 39)
        Me.GroupBox8.Name = "GroupBox8"
        Me.GroupBox8.Size = New System.Drawing.Size(224, 207)
        Me.GroupBox8.TabIndex = 50
        Me.GroupBox8.TabStop = False
        Me.GroupBox8.Text = "Windows"
        '
        'PictureBox16
        '
        Me.PictureBox16.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox16.Image = CType(resources.GetObject("PictureBox16.Image"), System.Drawing.Image)
        Me.PictureBox16.Location = New System.Drawing.Point(202, 135)
        Me.PictureBox16.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PictureBox16.Name = "PictureBox16"
        Me.PictureBox16.Size = New System.Drawing.Size(17, 18)
        Me.PictureBox16.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.PictureBox16.TabIndex = 56
        Me.PictureBox16.TabStop = False
        '
        'PictureBox18
        '
        Me.PictureBox18.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox18.Image = CType(resources.GetObject("PictureBox18.Image"), System.Drawing.Image)
        Me.PictureBox18.Location = New System.Drawing.Point(202, 168)
        Me.PictureBox18.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PictureBox18.Name = "PictureBox18"
        Me.PictureBox18.Size = New System.Drawing.Size(17, 18)
        Me.PictureBox18.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.PictureBox18.TabIndex = 56
        Me.PictureBox18.TabStop = False
        '
        'PictureBox9
        '
        Me.PictureBox9.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox9.Image = CType(resources.GetObject("PictureBox9.Image"), System.Drawing.Image)
        Me.PictureBox9.Location = New System.Drawing.Point(202, 83)
        Me.PictureBox9.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PictureBox9.Name = "PictureBox9"
        Me.PictureBox9.Size = New System.Drawing.Size(17, 18)
        Me.PictureBox9.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.PictureBox9.TabIndex = 56
        Me.PictureBox9.TabStop = False
        '
        'CKDesativarFirewall
        '
        Me.CKDesativarFirewall.AutoSize = True
        Me.CKDesativarFirewall.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKDesativarFirewall.Location = New System.Drawing.Point(9, 169)
        Me.CKDesativarFirewall.Name = "CKDesativarFirewall"
        Me.CKDesativarFirewall.Size = New System.Drawing.Size(117, 17)
        Me.CKDesativarFirewall.TabIndex = 55
        Me.CKDesativarFirewall.Text = "Desativar Firewall"
        Me.CKDesativarFirewall.UseVisualStyleBackColor = True
        '
        'CKDesativarBarraDeTarefas
        '
        Me.CKDesativarBarraDeTarefas.AutoSize = True
        Me.CKDesativarBarraDeTarefas.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKDesativarBarraDeTarefas.Location = New System.Drawing.Point(9, 152)
        Me.CKDesativarBarraDeTarefas.Name = "CKDesativarBarraDeTarefas"
        Me.CKDesativarBarraDeTarefas.Size = New System.Drawing.Size(159, 17)
        Me.CKDesativarBarraDeTarefas.TabIndex = 54
        Me.CKDesativarBarraDeTarefas.Text = "Desativar Barra de Tarefas"
        Me.CKDesativarBarraDeTarefas.UseVisualStyleBackColor = True
        '
        'CKDesativarMenuContexto
        '
        Me.CKDesativarMenuContexto.AutoSize = True
        Me.CKDesativarMenuContexto.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKDesativarMenuContexto.Location = New System.Drawing.Point(9, 135)
        Me.CKDesativarMenuContexto.Name = "CKDesativarMenuContexto"
        Me.CKDesativarMenuContexto.Size = New System.Drawing.Size(159, 17)
        Me.CKDesativarMenuContexto.TabIndex = 53
        Me.CKDesativarMenuContexto.Text = "Desativar Menu Contexto"
        Me.CKDesativarMenuContexto.UseVisualStyleBackColor = True
        '
        'CKDesativarOpçõesdePasta
        '
        Me.CKDesativarOpçõesdePasta.AutoSize = True
        Me.CKDesativarOpçõesdePasta.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKDesativarOpçõesdePasta.Location = New System.Drawing.Point(9, 118)
        Me.CKDesativarOpçõesdePasta.Name = "CKDesativarOpçõesdePasta"
        Me.CKDesativarOpçõesdePasta.Size = New System.Drawing.Size(162, 17)
        Me.CKDesativarOpçõesdePasta.TabIndex = 52
        Me.CKDesativarOpçõesdePasta.Text = "Desativar Opções de Pasta"
        Me.CKDesativarOpçõesdePasta.UseVisualStyleBackColor = True
        '
        'CKDesativarPainelControle
        '
        Me.CKDesativarPainelControle.AutoSize = True
        Me.CKDesativarPainelControle.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKDesativarPainelControle.Location = New System.Drawing.Point(9, 101)
        Me.CKDesativarPainelControle.Name = "CKDesativarPainelControle"
        Me.CKDesativarPainelControle.Size = New System.Drawing.Size(173, 17)
        Me.CKDesativarPainelControle.TabIndex = 51
        Me.CKDesativarPainelControle.Text = "Desativar Painel de Controle"
        Me.CKDesativarPainelControle.UseVisualStyleBackColor = True
        '
        'CKDesativarUAC
        '
        Me.CKDesativarUAC.AutoSize = True
        Me.CKDesativarUAC.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKDesativarUAC.Location = New System.Drawing.Point(9, 84)
        Me.CKDesativarUAC.Name = "CKDesativarUAC"
        Me.CKDesativarUAC.Size = New System.Drawing.Size(100, 17)
        Me.CKDesativarUAC.TabIndex = 50
        Me.CKDesativarUAC.Text = "Desativar UAC"
        Me.CKDesativarUAC.UseVisualStyleBackColor = True
        '
        'CKDesativarExecutar
        '
        Me.CKDesativarExecutar.AutoSize = True
        Me.CKDesativarExecutar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKDesativarExecutar.Location = New System.Drawing.Point(9, 67)
        Me.CKDesativarExecutar.Name = "CKDesativarExecutar"
        Me.CKDesativarExecutar.Size = New System.Drawing.Size(121, 17)
        Me.CKDesativarExecutar.TabIndex = 49
        Me.CKDesativarExecutar.Text = "Desativar Executar"
        Me.CKDesativarExecutar.UseVisualStyleBackColor = True
        '
        'CKDesativarRegedit
        '
        Me.CKDesativarRegedit.AutoSize = True
        Me.CKDesativarRegedit.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKDesativarRegedit.Location = New System.Drawing.Point(9, 50)
        Me.CKDesativarRegedit.Name = "CKDesativarRegedit"
        Me.CKDesativarRegedit.Size = New System.Drawing.Size(117, 17)
        Me.CKDesativarRegedit.TabIndex = 48
        Me.CKDesativarRegedit.Text = "Desativar Regedit"
        Me.CKDesativarRegedit.UseVisualStyleBackColor = True
        '
        'CKDesativarCMD
        '
        Me.CKDesativarCMD.AutoSize = True
        Me.CKDesativarCMD.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKDesativarCMD.Location = New System.Drawing.Point(9, 33)
        Me.CKDesativarCMD.Name = "CKDesativarCMD"
        Me.CKDesativarCMD.Size = New System.Drawing.Size(103, 17)
        Me.CKDesativarCMD.TabIndex = 47
        Me.CKDesativarCMD.Text = "Desativar CMD"
        Me.CKDesativarCMD.UseVisualStyleBackColor = True
        '
        'CKDesativarGerenciadorTarefas
        '
        Me.CKDesativarGerenciadorTarefas.AutoSize = True
        Me.CKDesativarGerenciadorTarefas.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKDesativarGerenciadorTarefas.Location = New System.Drawing.Point(9, 16)
        Me.CKDesativarGerenciadorTarefas.Name = "CKDesativarGerenciadorTarefas"
        Me.CKDesativarGerenciadorTarefas.Size = New System.Drawing.Size(195, 17)
        Me.CKDesativarGerenciadorTarefas.TabIndex = 46
        Me.CKDesativarGerenciadorTarefas.Text = "Desativar Gerenciador de Tarefas"
        Me.CKDesativarGerenciadorTarefas.UseVisualStyleBackColor = True
        '
        'GroupBox10
        '
        Me.GroupBox10.Controls.Add(Me.btnGerarMutex)
        Me.GroupBox10.Controls.Add(Me.PictureBox20)
        Me.GroupBox10.Controls.Add(Me.PictureBox19)
        Me.GroupBox10.Controls.Add(Me.txtPolicies2)
        Me.GroupBox10.Controls.Add(Me.CKPolicies2)
        Me.GroupBox10.Controls.Add(Me.txtPolicies)
        Me.GroupBox10.Controls.Add(Me.CKPolicies)
        Me.GroupBox10.Controls.Add(Me.txtHKEY_LOCAL_MACHINE)
        Me.GroupBox10.Controls.Add(Me.txtHKEY_CURRENT_USER)
        Me.GroupBox10.Controls.Add(Me.CKHKEY_LOCAL_MACHINE)
        Me.GroupBox10.Controls.Add(Me.CKHKEY_CURRENT_USER)
        Me.GroupBox10.Controls.Add(Me.txtMutex)
        Me.GroupBox10.Controls.Add(Me.Label9)
        Me.GroupBox10.ForeColor = System.Drawing.Color.White
        Me.GroupBox10.Location = New System.Drawing.Point(271, 32)
        Me.GroupBox10.Name = "GroupBox10"
        Me.GroupBox10.Size = New System.Drawing.Size(243, 221)
        Me.GroupBox10.TabIndex = 52
        Me.GroupBox10.TabStop = False
        Me.GroupBox10.Text = "Registro"
        '
        'btnGerarMutex
        '
        Me.btnGerarMutex.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnGerarMutex.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnGerarMutex.Location = New System.Drawing.Point(194, 194)
        Me.btnGerarMutex.Name = "btnGerarMutex"
        Me.btnGerarMutex.Size = New System.Drawing.Size(44, 23)
        Me.btnGerarMutex.TabIndex = 50
        Me.btnGerarMutex.Text = "R"
        Me.btnGerarMutex.UseVisualStyleBackColor = True
        '
        'PictureBox20
        '
        Me.PictureBox20.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox20.Image = CType(resources.GetObject("PictureBox20.Image"), System.Drawing.Image)
        Me.PictureBox20.Location = New System.Drawing.Point(153, 97)
        Me.PictureBox20.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PictureBox20.Name = "PictureBox20"
        Me.PictureBox20.Size = New System.Drawing.Size(17, 18)
        Me.PictureBox20.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.PictureBox20.TabIndex = 45
        Me.PictureBox20.TabStop = False
        '
        'PictureBox19
        '
        Me.PictureBox19.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox19.Image = CType(resources.GetObject("PictureBox19.Image"), System.Drawing.Image)
        Me.PictureBox19.Location = New System.Drawing.Point(198, 139)
        Me.PictureBox19.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PictureBox19.Name = "PictureBox19"
        Me.PictureBox19.Size = New System.Drawing.Size(17, 18)
        Me.PictureBox19.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.PictureBox19.TabIndex = 44
        Me.PictureBox19.TabStop = False
        '
        'txtPolicies2
        '
        Me.txtPolicies2.BackColor = System.Drawing.Color.Black
        Me.txtPolicies2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtPolicies2.Enabled = False
        Me.txtPolicies2.ForeColor = System.Drawing.Color.White
        Me.txtPolicies2.Location = New System.Drawing.Point(5, 159)
        Me.txtPolicies2.Name = "txtPolicies2"
        Me.txtPolicies2.Size = New System.Drawing.Size(233, 21)
        Me.txtPolicies2.TabIndex = 7
        Me.txtPolicies2.Text = "Adobe Update"
        '
        'CKPolicies2
        '
        Me.CKPolicies2.AutoSize = True
        Me.CKPolicies2.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKPolicies2.Location = New System.Drawing.Point(5, 141)
        Me.CKPolicies2.Name = "CKPolicies2"
        Me.CKPolicies2.Size = New System.Drawing.Size(196, 17)
        Me.CKPolicies2.TabIndex = 6
        Me.CKPolicies2.Text = "HKEY_LOCAL_MACHINE, Policies"
        Me.CKPolicies2.UseVisualStyleBackColor = True
        '
        'txtPolicies
        '
        Me.txtPolicies.BackColor = System.Drawing.Color.Black
        Me.txtPolicies.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtPolicies.Enabled = False
        Me.txtPolicies.ForeColor = System.Drawing.Color.White
        Me.txtPolicies.Location = New System.Drawing.Point(5, 75)
        Me.txtPolicies.Name = "txtPolicies"
        Me.txtPolicies.Size = New System.Drawing.Size(233, 21)
        Me.txtPolicies.TabIndex = 5
        Me.txtPolicies.Text = "Windows Update"
        '
        'CKPolicies
        '
        Me.CKPolicies.AutoSize = True
        Me.CKPolicies.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKPolicies.Location = New System.Drawing.Point(5, 57)
        Me.CKPolicies.Name = "CKPolicies"
        Me.CKPolicies.Size = New System.Drawing.Size(186, 17)
        Me.CKPolicies.TabIndex = 4
        Me.CKPolicies.Text = "HKEY_CURRENT_USER, Policies"
        Me.CKPolicies.UseVisualStyleBackColor = True
        '
        'txtHKEY_LOCAL_MACHINE
        '
        Me.txtHKEY_LOCAL_MACHINE.BackColor = System.Drawing.Color.Black
        Me.txtHKEY_LOCAL_MACHINE.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtHKEY_LOCAL_MACHINE.Enabled = False
        Me.txtHKEY_LOCAL_MACHINE.ForeColor = System.Drawing.Color.White
        Me.txtHKEY_LOCAL_MACHINE.Location = New System.Drawing.Point(5, 117)
        Me.txtHKEY_LOCAL_MACHINE.Name = "txtHKEY_LOCAL_MACHINE"
        Me.txtHKEY_LOCAL_MACHINE.Size = New System.Drawing.Size(233, 21)
        Me.txtHKEY_LOCAL_MACHINE.TabIndex = 3
        Me.txtHKEY_LOCAL_MACHINE.Text = "Skype Update"
        '
        'txtHKEY_CURRENT_USER
        '
        Me.txtHKEY_CURRENT_USER.BackColor = System.Drawing.Color.Black
        Me.txtHKEY_CURRENT_USER.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtHKEY_CURRENT_USER.Enabled = False
        Me.txtHKEY_CURRENT_USER.ForeColor = System.Drawing.Color.White
        Me.txtHKEY_CURRENT_USER.Location = New System.Drawing.Point(5, 33)
        Me.txtHKEY_CURRENT_USER.Name = "txtHKEY_CURRENT_USER"
        Me.txtHKEY_CURRENT_USER.Size = New System.Drawing.Size(233, 21)
        Me.txtHKEY_CURRENT_USER.TabIndex = 2
        Me.txtHKEY_CURRENT_USER.Text = "Java Update"
        '
        'CKHKEY_LOCAL_MACHINE
        '
        Me.CKHKEY_LOCAL_MACHINE.AutoSize = True
        Me.CKHKEY_LOCAL_MACHINE.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKHKEY_LOCAL_MACHINE.Location = New System.Drawing.Point(5, 99)
        Me.CKHKEY_LOCAL_MACHINE.Name = "CKHKEY_LOCAL_MACHINE"
        Me.CKHKEY_LOCAL_MACHINE.Size = New System.Drawing.Size(151, 17)
        Me.CKHKEY_LOCAL_MACHINE.TabIndex = 1
        Me.CKHKEY_LOCAL_MACHINE.Text = "HKEY_LOCAL_MACHINE"
        Me.CKHKEY_LOCAL_MACHINE.UseVisualStyleBackColor = True
        '
        'CKHKEY_CURRENT_USER
        '
        Me.CKHKEY_CURRENT_USER.AutoSize = True
        Me.CKHKEY_CURRENT_USER.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKHKEY_CURRENT_USER.Location = New System.Drawing.Point(5, 15)
        Me.CKHKEY_CURRENT_USER.Name = "CKHKEY_CURRENT_USER"
        Me.CKHKEY_CURRENT_USER.Size = New System.Drawing.Size(141, 17)
        Me.CKHKEY_CURRENT_USER.TabIndex = 0
        Me.CKHKEY_CURRENT_USER.Text = "HKEY_CURRENT_USER"
        Me.CKHKEY_CURRENT_USER.UseVisualStyleBackColor = True
        '
        'txtMutex
        '
        Me.txtMutex.BackColor = System.Drawing.Color.Black
        Me.txtMutex.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtMutex.ForeColor = System.Drawing.Color.White
        Me.txtMutex.Location = New System.Drawing.Point(5, 196)
        Me.txtMutex.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.txtMutex.Name = "txtMutex"
        Me.txtMutex.ReadOnly = True
        Me.txtMutex.Size = New System.Drawing.Size(186, 21)
        Me.txtMutex.TabIndex = 49
        Me.txtMutex.Text = "{WEQ2-67R1-YUU3-EEQ2-TY74}"
        Me.txtMutex.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Location = New System.Drawing.Point(1, 182)
        Me.Label9.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(41, 13)
        Me.Label9.TabIndex = 48
        Me.Label9.Text = "Mutex"
        '
        'IM2
        '
        Me.IM2.ImageStream = CType(resources.GetObject("IM2.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.IM2.TransparentColor = System.Drawing.Color.Transparent
        Me.IM2.Images.SetKeyName(0, "0.png")
        Me.IM2.Images.SetKeyName(1, "1.png")
        Me.IM2.Images.SetKeyName(2, "76.png")
        Me.IM2.Images.SetKeyName(3, "77.png")
        Me.IM2.Images.SetKeyName(4, "78.png")
        Me.IM2.Images.SetKeyName(5, "79.png")
        Me.IM2.Images.SetKeyName(6, "80.png")
        Me.IM2.Images.SetKeyName(7, "81.png")
        Me.IM2.Images.SetKeyName(8, "82.png")
        Me.IM2.Images.SetKeyName(9, "83.png")
        Me.IM2.Images.SetKeyName(10, "84.png")
        Me.IM2.Images.SetKeyName(11, "85.png")
        Me.IM2.Images.SetKeyName(12, "86.png")
        Me.IM2.Images.SetKeyName(13, "24.png")
        '
        'TreeView1
        '
        Me.TreeView1.BackColor = System.Drawing.Color.Black
        Me.TreeView1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TreeView1.Cursor = System.Windows.Forms.Cursors.Hand
        Me.TreeView1.ForeColor = System.Drawing.Color.White
        Me.TreeView1.FullRowSelect = True
        Me.TreeView1.HideSelection = False
        Me.TreeView1.ImageIndex = 1
        Me.TreeView1.ImageList = Me.IM2
        Me.TreeView1.Indent = 15
        Me.TreeView1.ItemHeight = 18
        Me.TreeView1.LineColor = System.Drawing.Color.White
        Me.TreeView1.Location = New System.Drawing.Point(5, 7)
        Me.TreeView1.Name = "TreeView1"
        TreeNode1.ImageIndex = 10
        TreeNode1.Name = "NDConexão"
        TreeNode1.SelectedImageIndex = 10
        TreeNode1.Text = "Conexão"
        TreeNode2.ImageIndex = 3
        TreeNode2.Name = "Node1"
        TreeNode2.SelectedImageIndex = 3
        TreeNode2.Text = "Instalação"
        TreeNode3.ImageIndex = 4
        TreeNode3.Name = "Node2"
        TreeNode3.SelectedImageIndex = 4
        TreeNode3.Text = "Mensagem"
        TreeNode4.ImageIndex = 5
        TreeNode4.Name = "Node3"
        TreeNode4.SelectedImageIndex = 5
        TreeNode4.Text = "Icones"
        TreeNode5.ImageIndex = 6
        TreeNode5.Name = "Node4"
        TreeNode5.SelectedImageIndex = 6
        TreeNode5.Text = "Anti Process"
        TreeNode6.ImageIndex = 7
        TreeNode6.Name = "Node5"
        TreeNode6.SelectedImageIndex = 7
        TreeNode6.Text = "Bloquear Sites"
        TreeNode7.ImageIndex = 8
        TreeNode7.Name = "Node0"
        TreeNode7.SelectedImageIndex = 8
        TreeNode7.Text = "Windows"
        TreeNode8.ImageIndex = 9
        TreeNode8.Name = "Node1"
        TreeNode8.SelectedImageIndex = 9
        TreeNode8.Text = "Shield"
        TreeNode9.ImageIndex = 11
        TreeNode9.Name = "Node3"
        TreeNode9.SelectedImageIndex = 11
        TreeNode9.Text = "Ofuscação"
        TreeNode10.ImageIndex = 13
        TreeNode10.Name = "Node0"
        TreeNode10.SelectedImageIndex = 13
        TreeNode10.Text = "Descrição"
        TreeNode11.ImageIndex = 1
        TreeNode11.Name = "Node4"
        TreeNode11.SelectedImageIndex = 1
        TreeNode11.Text = "Finalização"
        Me.TreeView1.Nodes.AddRange(New System.Windows.Forms.TreeNode() {TreeNode1, TreeNode2, TreeNode3, TreeNode4, TreeNode5, TreeNode6, TreeNode7, TreeNode8, TreeNode9, TreeNode10, TreeNode11})
        Me.TreeView1.Scrollable = False
        Me.TreeView1.SelectedImageIndex = 0
        Me.TreeView1.Size = New System.Drawing.Size(156, 287)
        Me.TreeView1.TabIndex = 54
        '
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.TBConexão)
        Me.TabControl1.Controls.Add(Me.TBInstalação)
        Me.TabControl1.Controls.Add(Me.TBMensagem)
        Me.TabControl1.Controls.Add(Me.TBIcones)
        Me.TabControl1.Controls.Add(Me.TBAntiProcess)
        Me.TabControl1.Controls.Add(Me.TBBloquearSites)
        Me.TabControl1.Controls.Add(Me.TBWindows)
        Me.TabControl1.Controls.Add(Me.TBShield)
        Me.TabControl1.Controls.Add(Me.TBOfuscação)
        Me.TabControl1.Controls.Add(Me.TBDescricao)
        Me.TabControl1.Controls.Add(Me.TBFinalização)
        Me.TabControl1.Location = New System.Drawing.Point(164, -13)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(572, 309)
        Me.TabControl1.TabIndex = 55
        '
        'TBConexão
        '
        Me.TBConexão.BackColor = System.Drawing.Color.Black
        Me.TBConexão.Controls.Add(Me.GroupBox1)
        Me.TBConexão.Controls.Add(Me.txtEncryptHost)
        Me.TBConexão.Location = New System.Drawing.Point(4, 21)
        Me.TBConexão.Name = "TBConexão"
        Me.TBConexão.Padding = New System.Windows.Forms.Padding(3)
        Me.TBConexão.Size = New System.Drawing.Size(564, 284)
        Me.TBConexão.TabIndex = 0
        Me.TBConexão.Text = "Conexão"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.NDDelaySegundos)
        Me.GroupBox1.Controls.Add(Me.txtNomeVitima)
        Me.GroupBox1.Controls.Add(Me.Label8)
        Me.GroupBox1.Controls.Add(Me.txtHost)
        Me.GroupBox1.Controls.Add(Me.CKAtivarDelay)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Controls.Add(Me.NDPorta)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.CKAtivarEncryptarHost)
        Me.GroupBox1.ForeColor = System.Drawing.Color.White
        Me.GroupBox1.Location = New System.Drawing.Point(157, 51)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(250, 182)
        Me.GroupBox1.TabIndex = 49
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Conexão"
        '
        'NDDelaySegundos
        '
        Me.NDDelaySegundos.BackColor = System.Drawing.Color.Black
        Me.NDDelaySegundos.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.NDDelaySegundos.Enabled = False
        Me.NDDelaySegundos.ForeColor = System.Drawing.Color.White
        Me.NDDelaySegundos.Location = New System.Drawing.Point(9, 154)
        Me.NDDelaySegundos.Maximum = New Decimal(New Integer() {276447231, 23283, 0, 0})
        Me.NDDelaySegundos.Minimum = New Decimal(New Integer() {1, 0, 0, 0})
        Me.NDDelaySegundos.Name = "NDDelaySegundos"
        Me.NDDelaySegundos.Size = New System.Drawing.Size(200, 21)
        Me.NDDelaySegundos.TabIndex = 49
        Me.NDDelaySegundos.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        Me.NDDelaySegundos.Value = New Decimal(New Integer() {15, 0, 0, 0})
        '
        'TBInstalação
        '
        Me.TBInstalação.BackColor = System.Drawing.Color.Black
        Me.TBInstalação.Controls.Add(Me.GroupBox4)
        Me.TBInstalação.Controls.Add(Me.GroupBox10)
        Me.TBInstalação.Location = New System.Drawing.Point(4, 21)
        Me.TBInstalação.Name = "TBInstalação"
        Me.TBInstalação.Size = New System.Drawing.Size(564, 284)
        Me.TBInstalação.TabIndex = 1
        Me.TBInstalação.Text = "Instalação"
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.txtNomePasta)
        Me.GroupBox4.Controls.Add(Me.Label14)
        Me.GroupBox4.Controls.Add(Me.txtNomeSpreadDiscoLocal)
        Me.GroupBox4.Controls.Add(Me.PictureBox22)
        Me.GroupBox4.Controls.Add(Me.CKSpreadDiscoLocal)
        Me.GroupBox4.Controls.Add(Me.txtNomeStartUp)
        Me.GroupBox4.Controls.Add(Me.CKCopiarStartUp)
        Me.GroupBox4.Controls.Add(Me.CBDiretorio)
        Me.GroupBox4.Controls.Add(Me.txtNomeProcesso)
        Me.GroupBox4.Controls.Add(Me.Label4)
        Me.GroupBox4.Controls.Add(Me.Label5)
        Me.GroupBox4.ForeColor = System.Drawing.Color.White
        Me.GroupBox4.Location = New System.Drawing.Point(50, 32)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(218, 221)
        Me.GroupBox4.TabIndex = 53
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "Instalação/Drop"
        '
        'txtNomePasta
        '
        Me.txtNomePasta.BackColor = System.Drawing.Color.Black
        Me.txtNomePasta.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtNomePasta.ForeColor = System.Drawing.Color.White
        Me.txtNomePasta.Location = New System.Drawing.Point(5, 31)
        Me.txtNomePasta.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.txtNomePasta.Name = "txtNomePasta"
        Me.txtNomePasta.Size = New System.Drawing.Size(208, 21)
        Me.txtNomePasta.TabIndex = 47
        Me.txtNomePasta.Text = "InstallDir"
        '
        'Label14
        '
        Me.Label14.AutoSize = True
        Me.Label14.Location = New System.Drawing.Point(2, 16)
        Me.Label14.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(78, 13)
        Me.Label14.TabIndex = 46
        Me.Label14.Text = "Nome (Pasta)"
        '
        'txtNomeSpreadDiscoLocal
        '
        Me.txtNomeSpreadDiscoLocal.BackColor = System.Drawing.Color.Black
        Me.txtNomeSpreadDiscoLocal.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtNomeSpreadDiscoLocal.Enabled = False
        Me.txtNomeSpreadDiscoLocal.ForeColor = System.Drawing.Color.White
        Me.txtNomeSpreadDiscoLocal.Location = New System.Drawing.Point(5, 191)
        Me.txtNomeSpreadDiscoLocal.Name = "txtNomeSpreadDiscoLocal"
        Me.txtNomeSpreadDiscoLocal.Size = New System.Drawing.Size(208, 21)
        Me.txtNomeSpreadDiscoLocal.TabIndex = 45
        Me.txtNomeSpreadDiscoLocal.Text = "Notepad.exe"
        '
        'PictureBox22
        '
        Me.PictureBox22.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox22.Image = CType(resources.GetObject("PictureBox22.Image"), System.Drawing.Image)
        Me.PictureBox22.Location = New System.Drawing.Point(128, 172)
        Me.PictureBox22.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.PictureBox22.Name = "PictureBox22"
        Me.PictureBox22.Size = New System.Drawing.Size(17, 18)
        Me.PictureBox22.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.PictureBox22.TabIndex = 44
        Me.PictureBox22.TabStop = False
        '
        'CKSpreadDiscoLocal
        '
        Me.CKSpreadDiscoLocal.AutoSize = True
        Me.CKSpreadDiscoLocal.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKSpreadDiscoLocal.Location = New System.Drawing.Point(5, 174)
        Me.CKSpreadDiscoLocal.Name = "CKSpreadDiscoLocal"
        Me.CKSpreadDiscoLocal.Size = New System.Drawing.Size(123, 17)
        Me.CKSpreadDiscoLocal.TabIndex = 29
        Me.CKSpreadDiscoLocal.Text = "Spread Disco Local"
        Me.CKSpreadDiscoLocal.UseVisualStyleBackColor = True
        '
        'txtNomeStartUp
        '
        Me.txtNomeStartUp.BackColor = System.Drawing.Color.Black
        Me.txtNomeStartUp.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtNomeStartUp.Enabled = False
        Me.txtNomeStartUp.ForeColor = System.Drawing.Color.White
        Me.txtNomeStartUp.Location = New System.Drawing.Point(5, 150)
        Me.txtNomeStartUp.Name = "txtNomeStartUp"
        Me.txtNomeStartUp.Size = New System.Drawing.Size(208, 21)
        Me.txtNomeStartUp.TabIndex = 28
        Me.txtNomeStartUp.Text = "Microsoft Corporation"
        '
        'CKCopiarStartUp
        '
        Me.CKCopiarStartUp.AutoSize = True
        Me.CKCopiarStartUp.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKCopiarStartUp.Location = New System.Drawing.Point(5, 132)
        Me.CKCopiarStartUp.Name = "CKCopiarStartUp"
        Me.CKCopiarStartUp.Size = New System.Drawing.Size(102, 17)
        Me.CKCopiarStartUp.TabIndex = 27
        Me.CKCopiarStartUp.Text = "Copiar StartUp"
        Me.CKCopiarStartUp.UseVisualStyleBackColor = True
        '
        'TBMensagem
        '
        Me.TBMensagem.BackColor = System.Drawing.Color.Black
        Me.TBMensagem.Controls.Add(Me.GroupBox3)
        Me.TBMensagem.Location = New System.Drawing.Point(4, 21)
        Me.TBMensagem.Name = "TBMensagem"
        Me.TBMensagem.Padding = New System.Windows.Forms.Padding(3)
        Me.TBMensagem.Size = New System.Drawing.Size(564, 284)
        Me.TBMensagem.TabIndex = 2
        Me.TBMensagem.Text = "Mensagem"
        '
        'TBIcones
        '
        Me.TBIcones.BackColor = System.Drawing.Color.Black
        Me.TBIcones.Controls.Add(Me.GroupBox2)
        Me.TBIcones.Location = New System.Drawing.Point(4, 21)
        Me.TBIcones.Name = "TBIcones"
        Me.TBIcones.Padding = New System.Windows.Forms.Padding(3)
        Me.TBIcones.Size = New System.Drawing.Size(564, 284)
        Me.TBIcones.TabIndex = 3
        Me.TBIcones.Text = "Icones"
        '
        'TBAntiProcess
        '
        Me.TBAntiProcess.BackColor = System.Drawing.Color.Black
        Me.TBAntiProcess.Controls.Add(Me.GroupBox7)
        Me.TBAntiProcess.Location = New System.Drawing.Point(4, 21)
        Me.TBAntiProcess.Name = "TBAntiProcess"
        Me.TBAntiProcess.Padding = New System.Windows.Forms.Padding(3)
        Me.TBAntiProcess.Size = New System.Drawing.Size(564, 284)
        Me.TBAntiProcess.TabIndex = 4
        Me.TBAntiProcess.Text = "Anti Process"
        '
        'TBBloquearSites
        '
        Me.TBBloquearSites.BackColor = System.Drawing.Color.Black
        Me.TBBloquearSites.Controls.Add(Me.GBSites)
        Me.TBBloquearSites.Location = New System.Drawing.Point(4, 21)
        Me.TBBloquearSites.Name = "TBBloquearSites"
        Me.TBBloquearSites.Padding = New System.Windows.Forms.Padding(3)
        Me.TBBloquearSites.Size = New System.Drawing.Size(564, 284)
        Me.TBBloquearSites.TabIndex = 5
        Me.TBBloquearSites.Text = "Bloquear Sites"
        '
        'TBWindows
        '
        Me.TBWindows.BackColor = System.Drawing.Color.Black
        Me.TBWindows.Controls.Add(Me.Label15)
        Me.TBWindows.Controls.Add(Me.GroupBox8)
        Me.TBWindows.Location = New System.Drawing.Point(4, 21)
        Me.TBWindows.Name = "TBWindows"
        Me.TBWindows.Padding = New System.Windows.Forms.Padding(3)
        Me.TBWindows.Size = New System.Drawing.Size(564, 284)
        Me.TBWindows.TabIndex = 6
        Me.TBWindows.Text = "Windows"
        '
        'Label15
        '
        Me.Label15.AutoSize = True
        Me.Label15.Location = New System.Drawing.Point(46, 256)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(473, 13)
        Me.Label15.TabIndex = 51
        Me.Label15.Text = "Obs : Caso vc Marque as opções, para fazer efeito precisa reiniciar o Computador/" & _
    "Explorer"
        '
        'TBShield
        '
        Me.TBShield.BackColor = System.Drawing.Color.Black
        Me.TBShield.Controls.Add(Me.GroupBox6)
        Me.TBShield.Location = New System.Drawing.Point(4, 21)
        Me.TBShield.Name = "TBShield"
        Me.TBShield.Padding = New System.Windows.Forms.Padding(3)
        Me.TBShield.Size = New System.Drawing.Size(564, 284)
        Me.TBShield.TabIndex = 7
        Me.TBShield.Text = "Shield"
        '
        'TBOfuscação
        '
        Me.TBOfuscação.BackColor = System.Drawing.Color.Black
        Me.TBOfuscação.Controls.Add(Me.GroupBox5)
        Me.TBOfuscação.Location = New System.Drawing.Point(4, 21)
        Me.TBOfuscação.Name = "TBOfuscação"
        Me.TBOfuscação.Padding = New System.Windows.Forms.Padding(3)
        Me.TBOfuscação.Size = New System.Drawing.Size(564, 284)
        Me.TBOfuscação.TabIndex = 9
        Me.TBOfuscação.Text = "Ofuscação"
        '
        'TBDescricao
        '
        Me.TBDescricao.BackColor = System.Drawing.Color.Black
        Me.TBDescricao.Controls.Add(Me.CKAtivardescricao)
        Me.TBDescricao.Controls.Add(Me.GroupBox9)
        Me.TBDescricao.ForeColor = System.Drawing.Color.White
        Me.TBDescricao.Location = New System.Drawing.Point(4, 21)
        Me.TBDescricao.Name = "TBDescricao"
        Me.TBDescricao.Size = New System.Drawing.Size(564, 284)
        Me.TBDescricao.TabIndex = 11
        Me.TBDescricao.Text = "Descrição"
        '
        'CKAtivardescricao
        '
        Me.CKAtivardescricao.AutoSize = True
        Me.CKAtivardescricao.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKAtivardescricao.Location = New System.Drawing.Point(118, 17)
        Me.CKAtivardescricao.Name = "CKAtivardescricao"
        Me.CKAtivardescricao.Size = New System.Drawing.Size(57, 17)
        Me.CKAtivardescricao.TabIndex = 70
        Me.CKAtivardescricao.Text = "Ativar"
        Me.CKAtivardescricao.UseVisualStyleBackColor = True
        '
        'GroupBox9
        '
        Me.GroupBox9.Controls.Add(Me.btnGerarDescricao)
        Me.GroupBox9.Controls.Add(Me.N1)
        Me.GroupBox9.Controls.Add(Me.Label17)
        Me.GroupBox9.Controls.Add(Me.Label18)
        Me.GroupBox9.Controls.Add(Me.N8)
        Me.GroupBox9.Controls.Add(Me.N7)
        Me.GroupBox9.Controls.Add(Me.N6)
        Me.GroupBox9.Controls.Add(Me.N5)
        Me.GroupBox9.Controls.Add(Me.N4)
        Me.GroupBox9.Controls.Add(Me.N3)
        Me.GroupBox9.Controls.Add(Me.N2)
        Me.GroupBox9.Controls.Add(Me.Label19)
        Me.GroupBox9.Controls.Add(Me.Label20)
        Me.GroupBox9.Controls.Add(Me.Label21)
        Me.GroupBox9.Controls.Add(Me.Label22)
        Me.GroupBox9.Controls.Add(Me.Label23)
        Me.GroupBox9.Controls.Add(Me.TXT_Marca)
        Me.GroupBox9.Controls.Add(Me.TXT_Copyright)
        Me.GroupBox9.Controls.Add(Me.TXT_Produto)
        Me.GroupBox9.Controls.Add(Me.TXT_Nome)
        Me.GroupBox9.Controls.Add(Me.TXT_Descricao)
        Me.GroupBox9.Enabled = False
        Me.GroupBox9.ForeColor = System.Drawing.Color.White
        Me.GroupBox9.Location = New System.Drawing.Point(118, 35)
        Me.GroupBox9.Name = "GroupBox9"
        Me.GroupBox9.Size = New System.Drawing.Size(329, 214)
        Me.GroupBox9.TabIndex = 0
        Me.GroupBox9.TabStop = False
        Me.GroupBox9.Text = "Informações do Servidor"
        '
        'btnGerarDescricao
        '
        Me.btnGerarDescricao.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnGerarDescricao.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnGerarDescricao.Location = New System.Drawing.Point(6, 185)
        Me.btnGerarDescricao.Name = "btnGerarDescricao"
        Me.btnGerarDescricao.Size = New System.Drawing.Size(316, 23)
        Me.btnGerarDescricao.TabIndex = 69
        Me.btnGerarDescricao.Text = "Gerar"
        Me.btnGerarDescricao.UseVisualStyleBackColor = True
        '
        'N1
        '
        Me.N1.BackColor = System.Drawing.Color.Black
        Me.N1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.N1.ForeColor = System.Drawing.Color.White
        Me.N1.Location = New System.Drawing.Point(121, 136)
        Me.N1.Margin = New System.Windows.Forms.Padding(4)
        Me.N1.Name = "N1"
        Me.N1.Size = New System.Drawing.Size(48, 21)
        Me.N1.TabIndex = 68
        '
        'Label17
        '
        Me.Label17.AutoSize = True
        Me.Label17.BackColor = System.Drawing.Color.Transparent
        Me.Label17.ForeColor = System.Drawing.Color.White
        Me.Label17.Location = New System.Drawing.Point(8, 166)
        Me.Label17.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.Label17.Name = "Label17"
        Me.Label17.Size = New System.Drawing.Size(110, 13)
        Me.Label17.TabIndex = 67
        Me.Label17.Text = "Versão do Produto :"
        '
        'Label18
        '
        Me.Label18.AutoSize = True
        Me.Label18.BackColor = System.Drawing.Color.Transparent
        Me.Label18.ForeColor = System.Drawing.Color.White
        Me.Label18.Location = New System.Drawing.Point(9, 139)
        Me.Label18.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.Label18.Name = "Label18"
        Me.Label18.Size = New System.Drawing.Size(109, 13)
        Me.Label18.TabIndex = 66
        Me.Label18.Text = "Versão do Arquivo :"
        '
        'N8
        '
        Me.N8.BackColor = System.Drawing.Color.Black
        Me.N8.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.N8.ForeColor = System.Drawing.Color.White
        Me.N8.Location = New System.Drawing.Point(274, 160)
        Me.N8.Margin = New System.Windows.Forms.Padding(4)
        Me.N8.Name = "N8"
        Me.N8.Size = New System.Drawing.Size(48, 21)
        Me.N8.TabIndex = 65
        '
        'N7
        '
        Me.N7.BackColor = System.Drawing.Color.Black
        Me.N7.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.N7.ForeColor = System.Drawing.Color.White
        Me.N7.Location = New System.Drawing.Point(223, 160)
        Me.N7.Margin = New System.Windows.Forms.Padding(4)
        Me.N7.Name = "N7"
        Me.N7.Size = New System.Drawing.Size(48, 21)
        Me.N7.TabIndex = 64
        '
        'N6
        '
        Me.N6.BackColor = System.Drawing.Color.Black
        Me.N6.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.N6.ForeColor = System.Drawing.Color.White
        Me.N6.Location = New System.Drawing.Point(172, 160)
        Me.N6.Margin = New System.Windows.Forms.Padding(4)
        Me.N6.Name = "N6"
        Me.N6.Size = New System.Drawing.Size(48, 21)
        Me.N6.TabIndex = 63
        '
        'N5
        '
        Me.N5.BackColor = System.Drawing.Color.Black
        Me.N5.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.N5.ForeColor = System.Drawing.Color.White
        Me.N5.Location = New System.Drawing.Point(121, 160)
        Me.N5.Margin = New System.Windows.Forms.Padding(4)
        Me.N5.Name = "N5"
        Me.N5.Size = New System.Drawing.Size(48, 21)
        Me.N5.TabIndex = 62
        '
        'N4
        '
        Me.N4.BackColor = System.Drawing.Color.Black
        Me.N4.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.N4.ForeColor = System.Drawing.Color.White
        Me.N4.Location = New System.Drawing.Point(274, 136)
        Me.N4.Margin = New System.Windows.Forms.Padding(4)
        Me.N4.Name = "N4"
        Me.N4.Size = New System.Drawing.Size(48, 21)
        Me.N4.TabIndex = 61
        '
        'N3
        '
        Me.N3.BackColor = System.Drawing.Color.Black
        Me.N3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.N3.ForeColor = System.Drawing.Color.White
        Me.N3.Location = New System.Drawing.Point(223, 136)
        Me.N3.Margin = New System.Windows.Forms.Padding(4)
        Me.N3.Name = "N3"
        Me.N3.Size = New System.Drawing.Size(48, 21)
        Me.N3.TabIndex = 60
        '
        'N2
        '
        Me.N2.BackColor = System.Drawing.Color.Black
        Me.N2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.N2.ForeColor = System.Drawing.Color.White
        Me.N2.Location = New System.Drawing.Point(172, 136)
        Me.N2.Margin = New System.Windows.Forms.Padding(4)
        Me.N2.Name = "N2"
        Me.N2.Size = New System.Drawing.Size(48, 21)
        Me.N2.TabIndex = 59
        '
        'Label19
        '
        Me.Label19.AutoSize = True
        Me.Label19.BackColor = System.Drawing.Color.Transparent
        Me.Label19.ForeColor = System.Drawing.Color.White
        Me.Label19.Location = New System.Drawing.Point(15, 116)
        Me.Label19.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.Label19.Name = "Label19"
        Me.Label19.Size = New System.Drawing.Size(103, 13)
        Me.Label19.TabIndex = 58
        Me.Label19.Text = "Marca Registrada :"
        '
        'Label20
        '
        Me.Label20.AutoSize = True
        Me.Label20.BackColor = System.Drawing.Color.Transparent
        Me.Label20.ForeColor = System.Drawing.Color.White
        Me.Label20.Location = New System.Drawing.Point(53, 92)
        Me.Label20.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.Label20.Name = "Label20"
        Me.Label20.Size = New System.Drawing.Size(65, 13)
        Me.Label20.TabIndex = 57
        Me.Label20.Text = "Copyright :"
        '
        'Label21
        '
        Me.Label21.AutoSize = True
        Me.Label21.BackColor = System.Drawing.Color.Transparent
        Me.Label21.ForeColor = System.Drawing.Color.White
        Me.Label21.Location = New System.Drawing.Point(62, 68)
        Me.Label21.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.Label21.Name = "Label21"
        Me.Label21.Size = New System.Drawing.Size(56, 13)
        Me.Label21.TabIndex = 56
        Me.Label21.Text = "Produto :"
        '
        'Label22
        '
        Me.Label22.AutoSize = True
        Me.Label22.BackColor = System.Drawing.Color.Transparent
        Me.Label22.ForeColor = System.Drawing.Color.White
        Me.Label22.Location = New System.Drawing.Point(73, 20)
        Me.Label22.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.Label22.Name = "Label22"
        Me.Label22.Size = New System.Drawing.Size(45, 13)
        Me.Label22.TabIndex = 55
        Me.Label22.Text = "Nome :"
        '
        'Label23
        '
        Me.Label23.AutoSize = True
        Me.Label23.BackColor = System.Drawing.Color.Transparent
        Me.Label23.ForeColor = System.Drawing.Color.White
        Me.Label23.Location = New System.Drawing.Point(56, 44)
        Me.Label23.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.Label23.Name = "Label23"
        Me.Label23.Size = New System.Drawing.Size(62, 13)
        Me.Label23.TabIndex = 54
        Me.Label23.Text = "Descrição :"
        '
        'TXT_Marca
        '
        Me.TXT_Marca.BackColor = System.Drawing.Color.Black
        Me.TXT_Marca.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TXT_Marca.ForeColor = System.Drawing.Color.White
        Me.TXT_Marca.Location = New System.Drawing.Point(121, 112)
        Me.TXT_Marca.Margin = New System.Windows.Forms.Padding(4)
        Me.TXT_Marca.Name = "TXT_Marca"
        Me.TXT_Marca.Size = New System.Drawing.Size(201, 21)
        Me.TXT_Marca.TabIndex = 52
        '
        'TXT_Copyright
        '
        Me.TXT_Copyright.BackColor = System.Drawing.Color.Black
        Me.TXT_Copyright.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TXT_Copyright.ForeColor = System.Drawing.Color.White
        Me.TXT_Copyright.Location = New System.Drawing.Point(121, 88)
        Me.TXT_Copyright.Margin = New System.Windows.Forms.Padding(4)
        Me.TXT_Copyright.Name = "TXT_Copyright"
        Me.TXT_Copyright.Size = New System.Drawing.Size(201, 21)
        Me.TXT_Copyright.TabIndex = 51
        '
        'TXT_Produto
        '
        Me.TXT_Produto.BackColor = System.Drawing.Color.Black
        Me.TXT_Produto.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TXT_Produto.ForeColor = System.Drawing.Color.White
        Me.TXT_Produto.Location = New System.Drawing.Point(121, 64)
        Me.TXT_Produto.Margin = New System.Windows.Forms.Padding(4)
        Me.TXT_Produto.Name = "TXT_Produto"
        Me.TXT_Produto.Size = New System.Drawing.Size(201, 21)
        Me.TXT_Produto.TabIndex = 50
        '
        'TXT_Nome
        '
        Me.TXT_Nome.BackColor = System.Drawing.Color.Black
        Me.TXT_Nome.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TXT_Nome.ForeColor = System.Drawing.Color.White
        Me.TXT_Nome.Location = New System.Drawing.Point(121, 16)
        Me.TXT_Nome.Margin = New System.Windows.Forms.Padding(4)
        Me.TXT_Nome.Name = "TXT_Nome"
        Me.TXT_Nome.Size = New System.Drawing.Size(201, 21)
        Me.TXT_Nome.TabIndex = 49
        '
        'TXT_Descricao
        '
        Me.TXT_Descricao.BackColor = System.Drawing.Color.Black
        Me.TXT_Descricao.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TXT_Descricao.ForeColor = System.Drawing.Color.White
        Me.TXT_Descricao.Location = New System.Drawing.Point(121, 40)
        Me.TXT_Descricao.Margin = New System.Windows.Forms.Padding(4)
        Me.TXT_Descricao.Name = "TXT_Descricao"
        Me.TXT_Descricao.Size = New System.Drawing.Size(201, 21)
        Me.TXT_Descricao.TabIndex = 48
        '
        'TBFinalização
        '
        Me.TBFinalização.BackColor = System.Drawing.Color.Black
        Me.TBFinalização.Controls.Add(Me.CBUpx)
        Me.TBFinalização.Controls.Add(Me.CKUpx)
        Me.TBFinalização.Controls.Add(Me.Label13)
        Me.TBFinalização.Controls.Add(Me.CBGrupos)
        Me.TBFinalização.Controls.Add(Me.PLPreviaCores)
        Me.TBFinalização.Controls.Add(Me.CBCores)
        Me.TBFinalização.Controls.Add(Me.txtStatus)
        Me.TBFinalização.Controls.Add(Me.Button1)
        Me.TBFinalização.Controls.Add(Me.CBextensão)
        Me.TBFinalização.Controls.Add(Me.Label7)
        Me.TBFinalização.Controls.Add(Me.Label24)
        Me.TBFinalização.Location = New System.Drawing.Point(4, 21)
        Me.TBFinalização.Name = "TBFinalização"
        Me.TBFinalização.Padding = New System.Windows.Forms.Padding(3)
        Me.TBFinalização.Size = New System.Drawing.Size(564, 284)
        Me.TBFinalização.TabIndex = 10
        Me.TBFinalização.Text = "Finalização"
        '
        'CBUpx
        '
        Me.CBUpx.BackColor = System.Drawing.Color.Black
        Me.CBUpx.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.CBUpx.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.CBUpx.ForeColor = System.Drawing.Color.White
        Me.CBUpx.FormattingEnabled = True
        Me.CBUpx.Items.AddRange(New Object() {"-01", "-02"})
        Me.CBUpx.Location = New System.Drawing.Point(496, 251)
        Me.CBUpx.Name = "CBUpx"
        Me.CBUpx.Size = New System.Drawing.Size(62, 20)
        Me.CBUpx.TabIndex = 61
        '
        'CKUpx
        '
        Me.CKUpx.AutoSize = True
        Me.CKUpx.Cursor = System.Windows.Forms.Cursors.Hand
        Me.CKUpx.Location = New System.Drawing.Point(448, 253)
        Me.CKUpx.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.CKUpx.Name = "CKUpx"
        Me.CKUpx.Size = New System.Drawing.Size(48, 17)
        Me.CKUpx.TabIndex = 60
        Me.CKUpx.Text = "UPX"
        Me.CKUpx.UseVisualStyleBackColor = True
        '
        'Label13
        '
        Me.Label13.AutoSize = True
        Me.Label13.Location = New System.Drawing.Point(178, 203)
        Me.Label13.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(45, 13)
        Me.Label13.TabIndex = 59
        Me.Label13.Text = "Grupos"
        '
        'CBGrupos
        '
        Me.CBGrupos.BackColor = System.Drawing.Color.Black
        Me.CBGrupos.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.CBGrupos.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.CBGrupos.ForeColor = System.Drawing.Color.White
        Me.CBGrupos.FormattingEnabled = True
        Me.CBGrupos.Location = New System.Drawing.Point(181, 217)
        Me.CBGrupos.Name = "CBGrupos"
        Me.CBGrupos.Size = New System.Drawing.Size(150, 20)
        Me.CBGrupos.TabIndex = 58
        '
        'PLPreviaCores
        '
        Me.PLPreviaCores.BackColor = System.Drawing.Color.AliceBlue
        Me.PLPreviaCores.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.PLPreviaCores.Location = New System.Drawing.Point(336, 207)
        Me.PLPreviaCores.Name = "PLPreviaCores"
        Me.PLPreviaCores.Size = New System.Drawing.Size(44, 30)
        Me.PLPreviaCores.TabIndex = 56
        '
        'CBCores
        '
        Me.CBCores.BackColor = System.Drawing.Color.Black
        Me.CBCores.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.CBCores.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.CBCores.ForeColor = System.Drawing.Color.White
        Me.CBCores.FormattingEnabled = True
        Me.CBCores.Location = New System.Drawing.Point(386, 217)
        Me.CBCores.Name = "CBCores"
        Me.CBCores.Size = New System.Drawing.Size(173, 20)
        Me.CBCores.TabIndex = 55
        '
        'txtStatus
        '
        Me.txtStatus.BackColor = System.Drawing.Color.Black
        Me.txtStatus.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtStatus.Cursor = System.Windows.Forms.Cursors.Default
        Me.txtStatus.ForeColor = System.Drawing.Color.Yellow
        Me.txtStatus.Location = New System.Drawing.Point(4, 6)
        Me.txtStatus.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.txtStatus.Multiline = True
        Me.txtStatus.Name = "txtStatus"
        Me.txtStatus.ReadOnly = True
        Me.txtStatus.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.txtStatus.Size = New System.Drawing.Size(554, 195)
        Me.txtStatus.TabIndex = 54
        '
        'Label24
        '
        Me.Label24.AutoSize = True
        Me.Label24.Location = New System.Drawing.Point(383, 203)
        Me.Label24.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label24.Name = "Label24"
        Me.Label24.Size = New System.Drawing.Size(134, 13)
        Me.Label24.TabIndex = 57
        Me.Label24.Text = "Cor do Texto (Marcação)"
        '
        'CT1
        '
        Me.CT1.BackColor = System.Drawing.Color.Black
        Me.CT1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AdicionarToolStripMenuItem, Me.ExcluirToolStripMenuItem1})
        Me.CT1.Name = "ContextMenuStrip1"
        Me.CT1.ShowImageMargin = False
        Me.CT1.Size = New System.Drawing.Size(101, 48)
        '
        'AdicionarToolStripMenuItem
        '
        Me.AdicionarToolStripMenuItem.ForeColor = System.Drawing.Color.White
        Me.AdicionarToolStripMenuItem.Name = "AdicionarToolStripMenuItem"
        Me.AdicionarToolStripMenuItem.Size = New System.Drawing.Size(100, 22)
        Me.AdicionarToolStripMenuItem.Text = "Adicionar"
        '
        'ExcluirToolStripMenuItem1
        '
        Me.ExcluirToolStripMenuItem1.ForeColor = System.Drawing.Color.White
        Me.ExcluirToolStripMenuItem1.Name = "ExcluirToolStripMenuItem1"
        Me.ExcluirToolStripMenuItem1.Size = New System.Drawing.Size(100, 22)
        Me.ExcluirToolStripMenuItem1.Text = "Excluir"
        '
        'Panel1
        '
        Me.Panel1.Location = New System.Drawing.Point(145, -22)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(611, 29)
        Me.Panel1.TabIndex = 56
        '
        'Panel2
        '
        Me.Panel2.Location = New System.Drawing.Point(733, -13)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Size = New System.Drawing.Size(45, 321)
        Me.Panel2.TabIndex = 57
        '
        'Panel3
        '
        Me.Panel3.Location = New System.Drawing.Point(114, 293)
        Me.Panel3.Name = "Panel3"
        Me.Panel3.Size = New System.Drawing.Size(692, 17)
        Me.Panel3.TabIndex = 58
        '
        'Panel4
        '
        Me.Panel4.Location = New System.Drawing.Point(149, -8)
        Me.Panel4.Name = "Panel4"
        Me.Panel4.Size = New System.Drawing.Size(18, 327)
        Me.Panel4.TabIndex = 59
        '
        'PictureBox8
        '
        Me.PictureBox8.Image = CType(resources.GetObject("PictureBox8.Image"), System.Drawing.Image)
        Me.PictureBox8.Location = New System.Drawing.Point(7, 253)
        Me.PictureBox8.Name = "PictureBox8"
        Me.PictureBox8.Size = New System.Drawing.Size(153, 40)
        Me.PictureBox8.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PictureBox8.TabIndex = 49
        Me.PictureBox8.TabStop = False
        '
        'FrmServidor
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 12.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(739, 299)
        Me.Controls.Add(Me.PictureBox8)
        Me.Controls.Add(Me.TreeView1)
        Me.Controls.Add(Me.Panel4)
        Me.Controls.Add(Me.Panel2)
        Me.Controls.Add(Me.Panel1)
        Me.Controls.Add(Me.Panel3)
        Me.Controls.Add(Me.TabControl1)
        Me.Font = New System.Drawing.Font("Segoe UI", 7.8!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ForeColor = System.Drawing.Color.White
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Margin = New System.Windows.Forms.Padding(2, 3, 2, 3)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "FrmServidor"
        Me.ShowIcon = False
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Servidor"
        CType(Me.NDPorta, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox7.ResumeLayout(False)
        Me.GroupBox7.PerformLayout()
        Me.GBSites.ResumeLayout(False)
        Me.GBSites.PerformLayout()
        Me.CT.ResumeLayout(False)
        CType(Me.PictureBox7, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox6.ResumeLayout(False)
        Me.GroupBox6.PerformLayout()
        CType(Me.PictureBox21, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox5.ResumeLayout(False)
        Me.GroupBox5.PerformLayout()
        CType(Me.NDQuantidadeStrings, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox3.PerformLayout()
        Me.GroupBox14.ResumeLayout(False)
        Me.GroupBox14.PerformLayout()
        Me.GroupBox13.ResumeLayout(False)
        Me.GroupBox13.PerformLayout()
        CType(Me.PictureBox3, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox6, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox5, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox4, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        CType(Me.PicIco, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox8.ResumeLayout(False)
        Me.GroupBox8.PerformLayout()
        CType(Me.PictureBox16, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox18, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox9, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox10.ResumeLayout(False)
        Me.GroupBox10.PerformLayout()
        CType(Me.PictureBox20, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox19, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabControl1.ResumeLayout(False)
        Me.TBConexão.ResumeLayout(False)
        Me.TBConexão.PerformLayout()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        CType(Me.NDDelaySegundos, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TBInstalação.ResumeLayout(False)
        Me.GroupBox4.ResumeLayout(False)
        Me.GroupBox4.PerformLayout()
        CType(Me.PictureBox22, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TBMensagem.ResumeLayout(False)
        Me.TBIcones.ResumeLayout(False)
        Me.TBAntiProcess.ResumeLayout(False)
        Me.TBBloquearSites.ResumeLayout(False)
        Me.TBWindows.ResumeLayout(False)
        Me.TBWindows.PerformLayout()
        Me.TBShield.ResumeLayout(False)
        Me.TBOfuscação.ResumeLayout(False)
        Me.TBDescricao.ResumeLayout(False)
        Me.TBDescricao.PerformLayout()
        Me.GroupBox9.ResumeLayout(False)
        Me.GroupBox9.PerformLayout()
        CType(Me.N1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.N8, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.N7, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.N6, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.N5, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.N4, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.N3, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.N2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TBFinalização.ResumeLayout(False)
        Me.TBFinalização.PerformLayout()
        Me.CT1.ResumeLayout(False)
        CType(Me.PictureBox8, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents PicIco As System.Windows.Forms.PictureBox
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents CKProtectProcess As System.Windows.Forms.CheckBox
    Friend WithEvents CBDiretorio As System.Windows.Forms.ComboBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents txtNomeProcesso As System.Windows.Forms.TextBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents txtNomeVitima As System.Windows.Forms.TextBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents NDPorta As System.Windows.Forms.NumericUpDown
    Friend WithEvents txtHost As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents CKExcluirArquivo As System.Windows.Forms.CheckBox
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents CKAgendarServidor As System.Windows.Forms.CheckBox
    Friend WithEvents txtMensagem As System.Windows.Forms.TextBox
    Friend WithEvents lbMSG As System.Windows.Forms.Label
    Friend WithEvents CKAtivarMensagem As System.Windows.Forms.CheckBox
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents btnTirarIco As System.Windows.Forms.Button
    Friend WithEvents btnIco As System.Windows.Forms.Button
    Friend WithEvents GroupBox5 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox6 As System.Windows.Forms.GroupBox
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents RDErro As System.Windows.Forms.RadioButton
    Friend WithEvents RDPergunta As System.Windows.Forms.RadioButton
    Friend WithEvents PictureBox5 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox3 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox6 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox4 As System.Windows.Forms.PictureBox
    Friend WithEvents RDAtencao As System.Windows.Forms.RadioButton
    Friend WithEvents RDNenhum As System.Windows.Forms.RadioButton
    Friend WithEvents PictureBox2 As System.Windows.Forms.PictureBox
    Friend WithEvents RDInformacao As System.Windows.Forms.RadioButton
    Friend WithEvents txtTitulo As System.Windows.Forms.TextBox
    Friend WithEvents CKAtivarEncryptarHost As System.Windows.Forms.CheckBox
    Friend WithEvents GBSites As System.Windows.Forms.GroupBox
    Friend WithEvents btnAdiconarSites As System.Windows.Forms.Button
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents LVListSites As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents CBListaSites As System.Windows.Forms.ComboBox
    Friend WithEvents CT As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ExcluirToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ExcluirTodosToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CKBlockSites As System.Windows.Forms.CheckBox
    Friend WithEvents PictureBox7 As System.Windows.Forms.PictureBox
    Friend WithEvents CKOcutarServidor As System.Windows.Forms.CheckBox
    Friend WithEvents CKPermisaoAdmin As System.Windows.Forms.CheckBox
    Friend WithEvents CBextensão As System.Windows.Forms.ComboBox
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents CKAtivarDelay As System.Windows.Forms.CheckBox
    Friend WithEvents GroupBox7 As System.Windows.Forms.GroupBox
    Friend WithEvents CKAntiMsconfig As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiGerenciadorDeTarefas As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiProcesshacker As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiSandboxie_Control As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiNetSnifferCs As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiexeinfoPE As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiSmsniff As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiTiGeR_Firewall As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiIPBlocker As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiapateDNS As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiWireshark As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiSpyTheSpy As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiSbieCtrl As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiProcessExplorer As System.Windows.Forms.CheckBox
    Friend WithEvents txtEncryptHost As System.Windows.Forms.TextBox
    Friend WithEvents CKAntiKillProcess As System.Windows.Forms.CheckBox
    Friend WithEvents PictureBox8 As System.Windows.Forms.PictureBox
    Friend WithEvents btnTestMensagem As System.Windows.Forms.Button
    Friend WithEvents GroupBox8 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox10 As System.Windows.Forms.GroupBox
    Friend WithEvents txtPolicies As System.Windows.Forms.TextBox
    Friend WithEvents CKPolicies As System.Windows.Forms.CheckBox
    Friend WithEvents txtHKEY_LOCAL_MACHINE As System.Windows.Forms.TextBox
    Friend WithEvents txtHKEY_CURRENT_USER As System.Windows.Forms.TextBox
    Friend WithEvents CKHKEY_LOCAL_MACHINE As System.Windows.Forms.CheckBox
    Friend WithEvents CKHKEY_CURRENT_USER As System.Windows.Forms.CheckBox
    Friend WithEvents IM2 As System.Windows.Forms.ImageList
    Friend WithEvents TreeView1 As System.Windows.Forms.TreeView
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents TBConexão As System.Windows.Forms.TabPage
    Friend WithEvents TBInstalação As System.Windows.Forms.TabPage
    Friend WithEvents TBMensagem As System.Windows.Forms.TabPage
    Friend WithEvents TBIcones As System.Windows.Forms.TabPage
    Friend WithEvents TBAntiProcess As System.Windows.Forms.TabPage
    Friend WithEvents TBBloquearSites As System.Windows.Forms.TabPage
    Friend WithEvents TBWindows As System.Windows.Forms.TabPage
    Friend WithEvents TBShield As System.Windows.Forms.TabPage
    Friend WithEvents TBOfuscação As System.Windows.Forms.TabPage
    Friend WithEvents TBFinalização As System.Windows.Forms.TabPage
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents txtPolicies2 As System.Windows.Forms.TextBox
    Friend WithEvents CKPolicies2 As System.Windows.Forms.CheckBox
    Friend WithEvents CKAtivarOfuscaçao As System.Windows.Forms.CheckBox
    Friend WithEvents CBStorageMethod As System.Windows.Forms.ComboBox
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents txtStatus As System.Windows.Forms.TextBox
    Friend WithEvents CKAntiILSpy As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiReflector As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntiCodeReflect As System.Windows.Forms.CheckBox
    Friend WithEvents CKAntidnSpy As System.Windows.Forms.CheckBox
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents txtStringOfuscador As System.Windows.Forms.TextBox
    Friend WithEvents Panel1 As System.Windows.Forms.Panel
    Friend WithEvents Panel2 As System.Windows.Forms.Panel
    Friend WithEvents Panel3 As System.Windows.Forms.Panel
    Friend WithEvents Panel4 As System.Windows.Forms.Panel
    Friend WithEvents NDQuantidadeStrings As System.Windows.Forms.NumericUpDown
    Friend WithEvents CKDesativarGerenciadorTarefas As System.Windows.Forms.CheckBox
    Friend WithEvents CKDesativarCMD As System.Windows.Forms.CheckBox
    Friend WithEvents CKDesativarRegedit As System.Windows.Forms.CheckBox
    Friend WithEvents CKDesativarExecutar As System.Windows.Forms.CheckBox
    Friend WithEvents CKDesativarUAC As System.Windows.Forms.CheckBox
    Friend WithEvents CKDesativarPainelControle As System.Windows.Forms.CheckBox
    Friend WithEvents CKDesativarOpçõesdePasta As System.Windows.Forms.CheckBox
    Friend WithEvents CKDesativarMenuContexto As System.Windows.Forms.CheckBox
    Friend WithEvents CKDesativarBarraDeTarefas As System.Windows.Forms.CheckBox
    Friend WithEvents CKDesativarFirewall As System.Windows.Forms.CheckBox
    Friend WithEvents Label15 As System.Windows.Forms.Label
    Friend WithEvents PictureBox16 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox18 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox9 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox19 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox20 As System.Windows.Forms.PictureBox
    Friend WithEvents CKCopiarStartUp As System.Windows.Forms.CheckBox
    Friend WithEvents txtNomeStartUp As System.Windows.Forms.TextBox
    Friend WithEvents CKBypassFirewall As System.Windows.Forms.CheckBox
    Friend WithEvents PictureBox21 As System.Windows.Forms.PictureBox
    Friend WithEvents CT1 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents AdicionarToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ExcluirToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CKSpreadDiscoLocal As System.Windows.Forms.CheckBox
    Friend WithEvents PictureBox22 As System.Windows.Forms.PictureBox
    Friend WithEvents NDDelaySegundos As System.Windows.Forms.NumericUpDown
    Friend WithEvents txtNomeSpreadDiscoLocal As System.Windows.Forms.TextBox
    Friend WithEvents GroupBox14 As System.Windows.Forms.GroupBox
    Friend WithEvents RBButtonSimNaoCancelar As System.Windows.Forms.RadioButton
    Friend WithEvents RBButtonAnularRepetirIgnorar As System.Windows.Forms.RadioButton
    Friend WithEvents RBButtonRepetirCancelar As System.Windows.Forms.RadioButton
    Friend WithEvents RBButtonSimNao As System.Windows.Forms.RadioButton
    Friend WithEvents RBButtonOk As System.Windows.Forms.RadioButton
    Friend WithEvents TBButtonOkCencelar As System.Windows.Forms.RadioButton
    Friend WithEvents GroupBox13 As System.Windows.Forms.GroupBox
    Friend WithEvents RBbuttonOkCancelarAjuda As System.Windows.Forms.RadioButton
    Friend WithEvents PLPreviaCores As System.Windows.Forms.Panel
    Friend WithEvents CBCores As System.Windows.Forms.ComboBox
    Friend WithEvents Label24 As System.Windows.Forms.Label
    Friend WithEvents CBGrupos As System.Windows.Forms.ComboBox
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents txtNomePasta As System.Windows.Forms.TextBox
    Friend WithEvents Label14 As System.Windows.Forms.Label
    Friend WithEvents txtMutex As System.Windows.Forms.TextBox
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents btnGerarMutex As System.Windows.Forms.Button
    Friend WithEvents IM1 As System.Windows.Forms.ImageList
    Friend WithEvents LVIcones As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader3 As System.Windows.Forms.ColumnHeader
    Friend WithEvents btnListarPadraoIcones As System.Windows.Forms.Button
    Friend WithEvents CBIcones As System.Windows.Forms.ComboBox
    Friend WithEvents Label12 As System.Windows.Forms.Label
    Friend WithEvents lbIcones As System.Windows.Forms.Label
    Friend WithEvents CBTamanhoICO As System.Windows.Forms.ComboBox
    Friend WithEvents IM3 As System.Windows.Forms.ImageList
    Friend WithEvents Label16 As System.Windows.Forms.Label
    Friend WithEvents RandomST1 As Coringa.RandomST
    Friend WithEvents CBUpx As System.Windows.Forms.ComboBox
    Friend WithEvents CKUpx As System.Windows.Forms.CheckBox
    Friend WithEvents TBDescricao As System.Windows.Forms.TabPage
    Friend WithEvents GroupBox9 As System.Windows.Forms.GroupBox
    Friend WithEvents N1 As System.Windows.Forms.NumericUpDown
    Friend WithEvents Label17 As System.Windows.Forms.Label
    Friend WithEvents Label18 As System.Windows.Forms.Label
    Friend WithEvents N8 As System.Windows.Forms.NumericUpDown
    Friend WithEvents N7 As System.Windows.Forms.NumericUpDown
    Friend WithEvents N6 As System.Windows.Forms.NumericUpDown
    Friend WithEvents N5 As System.Windows.Forms.NumericUpDown
    Friend WithEvents N4 As System.Windows.Forms.NumericUpDown
    Friend WithEvents N3 As System.Windows.Forms.NumericUpDown
    Friend WithEvents N2 As System.Windows.Forms.NumericUpDown
    Friend WithEvents Label19 As System.Windows.Forms.Label
    Friend WithEvents Label20 As System.Windows.Forms.Label
    Friend WithEvents Label21 As System.Windows.Forms.Label
    Friend WithEvents Label22 As System.Windows.Forms.Label
    Friend WithEvents Label23 As System.Windows.Forms.Label
    Friend WithEvents TXT_Marca As System.Windows.Forms.TextBox
    Friend WithEvents TXT_Copyright As System.Windows.Forms.TextBox
    Friend WithEvents TXT_Produto As System.Windows.Forms.TextBox
    Friend WithEvents TXT_Nome As System.Windows.Forms.TextBox
    Friend WithEvents TXT_Descricao As System.Windows.Forms.TextBox
    Friend WithEvents btnGerarDescricao As System.Windows.Forms.Button
    Friend WithEvents CKAtivardescricao As System.Windows.Forms.CheckBox
End Class
