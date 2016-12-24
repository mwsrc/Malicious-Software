<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmInformações
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmInformações))
        Dim TreeNode1 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Localização :")
        Dim TreeNode2 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Atributos :")
        Dim TreeNode3 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Diretório :")
        Dim TreeNode4 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Port :")
        Dim TreeNode5 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Host :")
        Dim TreeNode6 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Servidor :")
        Dim TreeNode7 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Data de Instalação :")
        Dim TreeNode8 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Informações do Servidor", New System.Windows.Forms.TreeNode() {TreeNode1, TreeNode2, TreeNode3, TreeNode4, TreeNode5, TreeNode6, TreeNode7})
        Dim TreeNode9 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("IPV4 :")
        Dim TreeNode10 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("IP Local :")
        Dim TreeNode11 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Endereço MAC :")
        Dim TreeNode12 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Informações da Rede", New System.Windows.Forms.TreeNode() {TreeNode9, TreeNode10, TreeNode11})
        Dim TreeNode13 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Nome do Computador :")
        Dim TreeNode14 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Nome do Domínio :")
        Dim TreeNode15 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Nome de Usuário :")
        Dim TreeNode16 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Monitors :")
        Dim TreeNode17 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Resolução :")
        Dim TreeNode18 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Sistema Operacional :")
        Dim TreeNode19 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Plataforma do Sistema :")
        Dim TreeNode20 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Versão do Sistema :")
        Dim TreeNode21 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("RAM :")
        Dim TreeNode22 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Bateria :")
        Dim TreeNode23 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Informações CPU :")
        Dim TreeNode24 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Informações GPU :")
        Dim TreeNode25 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("UpTime :")
        Dim TreeNode26 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Identificador :")
        Dim TreeNode27 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Data/Hora :")
        Dim TreeNode28 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Cam :")
        Dim TreeNode29 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Janelas :")
        Dim TreeNode30 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Pasta do Sistema :")
        Dim TreeNode31 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Idioma :")
        Dim TreeNode32 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("País :")
        Dim TreeNode33 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Tipo de Sistema :")
        Dim TreeNode34 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Medelo do Sistema :")
        Dim TreeNode35 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Versao/Data da BIOS :")
        Dim TreeNode36 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Informações do Computador", New System.Windows.Forms.TreeNode() {TreeNode13, TreeNode14, TreeNode15, TreeNode16, TreeNode17, TreeNode18, TreeNode19, TreeNode20, TreeNode21, TreeNode22, TreeNode23, TreeNode24, TreeNode25, TreeNode26, TreeNode27, TreeNode28, TreeNode29, TreeNode30, TreeNode31, TreeNode32, TreeNode33, TreeNode34, TreeNode35})
        Dim TreeNode37 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Proprietário Registrado :")
        Dim TreeNode38 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Organização Registrada :")
        Dim TreeNode39 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Chave do Produto :")
        Dim TreeNode40 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("AntiVirus Instalado :")
        Dim TreeNode41 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Firewall :")
        Dim TreeNode42 As System.Windows.Forms.TreeNode = New System.Windows.Forms.TreeNode("Outras informações", New System.Windows.Forms.TreeNode() {TreeNode37, TreeNode38, TreeNode39, TreeNode40, TreeNode41})
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.PBProgress = New System.Windows.Forms.ProgressBar()
        Me.btnOK = New System.Windows.Forms.Button()
        Me.IM = New System.Windows.Forms.ImageList(Me.components)
        Me.TRInformações = New System.Windows.Forms.TreeView()
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.TRInformações)
        Me.GroupBox1.Controls.Add(Me.PBProgress)
        Me.GroupBox1.Controls.Add(Me.btnOK)
        Me.GroupBox1.ForeColor = System.Drawing.Color.White
        Me.GroupBox1.Location = New System.Drawing.Point(7, 5)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(521, 446)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Informações (Computador)"
        '
        'PBProgress
        '
        Me.PBProgress.Location = New System.Drawing.Point(6, 386)
        Me.PBProgress.Maximum = 38
        Me.PBProgress.Name = "PBProgress"
        Me.PBProgress.Size = New System.Drawing.Size(508, 17)
        Me.PBProgress.TabIndex = 2
        '
        'btnOK
        '
        Me.btnOK.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnOK.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnOK.Location = New System.Drawing.Point(6, 409)
        Me.btnOK.Name = "btnOK"
        Me.btnOK.Size = New System.Drawing.Size(508, 30)
        Me.btnOK.TabIndex = 1
        Me.btnOK.Text = "OK"
        Me.btnOK.UseVisualStyleBackColor = True
        '
        'IM
        '
        Me.IM.ImageStream = CType(resources.GetObject("IM.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.IM.TransparentColor = System.Drawing.Color.Transparent
        Me.IM.Images.SetKeyName(0, "118.png")
        Me.IM.Images.SetKeyName(1, "120.png")
        Me.IM.Images.SetKeyName(2, "121.png")
        Me.IM.Images.SetKeyName(3, "122.png")
        Me.IM.Images.SetKeyName(4, "123.png")
        Me.IM.Images.SetKeyName(5, "124.png")
        Me.IM.Images.SetKeyName(6, "125.png")
        Me.IM.Images.SetKeyName(7, "126.png")
        Me.IM.Images.SetKeyName(8, "127.png")
        Me.IM.Images.SetKeyName(9, "128.png")
        Me.IM.Images.SetKeyName(10, "129.png")
        Me.IM.Images.SetKeyName(11, "130.png")
        Me.IM.Images.SetKeyName(12, "131.png")
        Me.IM.Images.SetKeyName(13, "132.png")
        Me.IM.Images.SetKeyName(14, "133.png")
        Me.IM.Images.SetKeyName(15, "134.png")
        Me.IM.Images.SetKeyName(16, "135.png")
        Me.IM.Images.SetKeyName(17, "136.png")
        Me.IM.Images.SetKeyName(18, "137.png")
        Me.IM.Images.SetKeyName(19, "138.png")
        Me.IM.Images.SetKeyName(20, "139.png")
        Me.IM.Images.SetKeyName(21, "140.png")
        Me.IM.Images.SetKeyName(22, "141.png")
        Me.IM.Images.SetKeyName(23, "142.png")
        Me.IM.Images.SetKeyName(24, "144.png")
        Me.IM.Images.SetKeyName(25, "146.png")
        Me.IM.Images.SetKeyName(26, "147.png")
        Me.IM.Images.SetKeyName(27, "148.png")
        Me.IM.Images.SetKeyName(28, "149.png")
        Me.IM.Images.SetKeyName(29, "150.png")
        Me.IM.Images.SetKeyName(30, "151.png")
        Me.IM.Images.SetKeyName(31, "152.png")
        Me.IM.Images.SetKeyName(32, "153.png")
        Me.IM.Images.SetKeyName(33, "154.png")
        Me.IM.Images.SetKeyName(34, "155.png")
        Me.IM.Images.SetKeyName(35, "156.png")
        Me.IM.Images.SetKeyName(36, "157.png")
        Me.IM.Images.SetKeyName(37, "158.png")
        Me.IM.Images.SetKeyName(38, "159.png")
        Me.IM.Images.SetKeyName(39, "160.png")
        Me.IM.Images.SetKeyName(40, "161.png")
        Me.IM.Images.SetKeyName(41, "162.png")
        '
        'TRInformações
        '
        Me.TRInformações.BackColor = System.Drawing.Color.Black
        Me.TRInformações.Font = New System.Drawing.Font("Arial", 9.0!, System.Drawing.FontStyle.Bold)
        Me.TRInformações.ForeColor = System.Drawing.Color.White
        Me.TRInformações.ImageKey = "application-blue.png"
        Me.TRInformações.ImageList = Me.IM
        Me.TRInformações.Location = New System.Drawing.Point(6, 19)
        Me.TRInformações.Name = "TRInformações"
        TreeNode1.ImageKey = "120.png"
        TreeNode1.Name = "Knoten1"
        TreeNode1.SelectedImageIndex = 1
        TreeNode1.Text = "Localização :"
        TreeNode2.ImageKey = "121.png"
        TreeNode2.Name = "Knoten2"
        TreeNode2.SelectedImageIndex = 2
        TreeNode2.Text = "Atributos :"
        TreeNode3.ImageKey = "122.png"
        TreeNode3.Name = "Node1"
        TreeNode3.Text = "Diretório :"
        TreeNode4.ImageKey = "123.png"
        TreeNode4.Name = "Node2"
        TreeNode4.Text = "Port :"
        TreeNode5.ImageKey = "124.png"
        TreeNode5.Name = "Node3"
        TreeNode5.Text = "Host :"
        TreeNode6.ImageKey = "125.png"
        TreeNode6.Name = "Node4"
        TreeNode6.Text = "Servidor :"
        TreeNode7.ImageKey = "126.png"
        TreeNode7.Name = "Node5"
        TreeNode7.Text = "Data de Instalação :"
        TreeNode8.ImageKey = "118.png"
        TreeNode8.Name = "nodpr"
        TreeNode8.Text = "Informações do Servidor"
        TreeNode9.ImageKey = "128.png"
        TreeNode9.Name = "Knoten4"
        TreeNode9.Text = "IPV4 :"
        TreeNode10.ImageKey = "129.png"
        TreeNode10.Name = "Knoten5"
        TreeNode10.Text = "IP Local :"
        TreeNode11.ImageKey = "130.png"
        TreeNode11.Name = "Knoten6"
        TreeNode11.Text = "Endereço MAC :"
        TreeNode12.ImageKey = "127.png"
        TreeNode12.Name = "Node8"
        TreeNode12.Text = "Informações da Rede"
        TreeNode13.ImageKey = "132.png"
        TreeNode13.Name = "Knoten8"
        TreeNode13.Text = "Nome do Computador :"
        TreeNode14.ImageKey = "133.png"
        TreeNode14.Name = "Knoten10"
        TreeNode14.Text = "Nome do Domínio :"
        TreeNode15.ImageKey = "134.png"
        TreeNode15.Name = "Knoten11"
        TreeNode15.Text = "Nome de Usuário :"
        TreeNode16.ImageKey = "135.png"
        TreeNode16.Name = "Knoten12"
        TreeNode16.Text = "Monitors :"
        TreeNode17.ImageKey = "136.png"
        TreeNode17.Name = "Knoten13"
        TreeNode17.Text = "Resolução :"
        TreeNode18.ImageKey = "137.png"
        TreeNode18.Name = "Knoten15"
        TreeNode18.Text = "Sistema Operacional :"
        TreeNode19.ImageKey = "138.png"
        TreeNode19.Name = "Knoten16"
        TreeNode19.Text = "Plataforma do Sistema :"
        TreeNode20.ImageKey = "139.png"
        TreeNode20.Name = "Knoten17"
        TreeNode20.Text = "Versão do Sistema :"
        TreeNode21.ImageKey = "140.png"
        TreeNode21.Name = "Knoten18"
        TreeNode21.Text = "RAM :"
        TreeNode22.ImageKey = "141.png"
        TreeNode22.Name = "Knoten19"
        TreeNode22.Text = "Bateria :"
        TreeNode23.ImageKey = "142.png"
        TreeNode23.Name = "Knoten21"
        TreeNode23.Text = "Informações CPU :"
        TreeNode24.ImageKey = "144.png"
        TreeNode24.Name = "Knoten22"
        TreeNode24.Text = "Informações GPU :"
        TreeNode25.ImageKey = "146.png"
        TreeNode25.Name = "Knoten23"
        TreeNode25.Text = "UpTime :"
        TreeNode26.ImageKey = "147.png"
        TreeNode26.Name = "Node0"
        TreeNode26.Text = "Identificador :"
        TreeNode27.ImageKey = "148.png"
        TreeNode27.Name = "Node7"
        TreeNode27.Text = "Data/Hora :"
        TreeNode28.ImageKey = "149.png"
        TreeNode28.Name = "Node8"
        TreeNode28.Text = "Cam :"
        TreeNode29.ImageKey = "150.png"
        TreeNode29.Name = "Node10"
        TreeNode29.Text = "Janelas :"
        TreeNode30.ImageKey = "151.png"
        TreeNode30.Name = "Node11"
        TreeNode30.Text = "Pasta do Sistema :"
        TreeNode31.ImageKey = "152.png"
        TreeNode31.Name = "Node12"
        TreeNode31.Text = "Idioma :"
        TreeNode32.ImageKey = "153.png"
        TreeNode32.Name = "Node16"
        TreeNode32.Text = "País :"
        TreeNode33.ImageKey = "154.png"
        TreeNode33.Name = "Node13"
        TreeNode33.Text = "Tipo de Sistema :"
        TreeNode34.ImageKey = "155.png"
        TreeNode34.Name = "Node14"
        TreeNode34.Text = "Medelo do Sistema :"
        TreeNode35.ImageKey = "156.png"
        TreeNode35.Name = "Node15"
        TreeNode35.Text = "Versao/Data da BIOS :"
        TreeNode36.ImageKey = "131.png"
        TreeNode36.Name = "Node12"
        TreeNode36.Text = "Informações do Computador"
        TreeNode37.ImageKey = "158.png"
        TreeNode37.Name = "Knoten25"
        TreeNode37.Text = "Proprietário Registrado :"
        TreeNode38.ImageKey = "159.png"
        TreeNode38.Name = "Node2"
        TreeNode38.Text = "Organização Registrada :"
        TreeNode39.ImageKey = "160.png"
        TreeNode39.Name = "Knoten27"
        TreeNode39.Text = "Chave do Produto :"
        TreeNode40.ImageKey = "161.png"
        TreeNode40.Name = "Knoten28"
        TreeNode40.Text = "AntiVirus Instalado :"
        TreeNode41.ImageKey = "162.png"
        TreeNode41.Name = "Knoten0"
        TreeNode41.Text = "Firewall :"
        TreeNode42.ImageKey = "157.png"
        TreeNode42.Name = "Node26"
        TreeNode42.Text = "Outras informações"
        Me.TRInformações.Nodes.AddRange(New System.Windows.Forms.TreeNode() {TreeNode8, TreeNode12, TreeNode36, TreeNode42})
        Me.TRInformações.SelectedImageIndex = 0
        Me.TRInformações.Size = New System.Drawing.Size(508, 361)
        Me.TRInformações.TabIndex = 3
        '
        'FrmInformações
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 14.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(534, 457)
        Me.Controls.Add(Me.GroupBox1)
        Me.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Bold)
        Me.ForeColor = System.Drawing.Color.White
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.MaximizeBox = False
        Me.Name = "FrmInformações"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Informações"
        Me.GroupBox1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents btnOK As System.Windows.Forms.Button
    Friend WithEvents IM As System.Windows.Forms.ImageList
    Friend WithEvents PBProgress As System.Windows.Forms.ProgressBar
    Friend WithEvents TRInformações As System.Windows.Forms.TreeView
End Class
