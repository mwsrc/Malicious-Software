<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class GUI
    Inherits System.Windows.Forms.Form

    'Form reemplaza a Dispose para limpiar la lista de componentes.
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

    'Requerido por el Diseñador de Windows Forms
    Private components As System.ComponentModel.IContainer

    'NOTA: el Diseñador de Windows Forms necesita el siguiente procedimiento
    'Se puede modificar usando el Diseñador de Windows Forms.  
    'No lo modifique con el editor de código.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(GUI))
        Me.dialogCrypter = New System.Windows.Forms.OpenFileDialog()
        Me.dialogBinder = New System.Windows.Forms.OpenFileDialog()
        Me.dialogIcono = New System.Windows.Forms.OpenFileDialog()
        Me.dialogAssembly = New System.Windows.Forms.OpenFileDialog()
        Me.dialogCrear = New System.Windows.Forms.SaveFileDialog()
        Me.HuraGUI = New CrypterMaster.HuraForm()
        Me.btnCrear = New CrypterMaster.HuraButton()
        Me.progressCrear = New CrypterMaster.HuraProgressBar()
        Me.tabControl = New CrypterMaster.HuraTabControl()
        Me.TabCrypter = New System.Windows.Forms.TabPage()
        Me.HuraGroupBox1 = New CrypterMaster.HuraGroupBox()
        Me.rbtnUnknown_Crypter = New CrypterMaster.HuraRadioButton()
        Me.rbtnStairs_Crypter = New CrypterMaster.HuraRadioButton()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.btnGenerar_Crypter = New CrypterMaster.HuraButton()
        Me.txtClave_Crypter = New CrypterMaster.HuraTextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.btnSeleccionar_Crypter = New CrypterMaster.HuraButton()
        Me.txtArchivo_Crypter = New CrypterMaster.HuraTextBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.TabBinder = New System.Windows.Forms.TabPage()
        Me.comboDrop_Binder = New CrypterMaster.HuraComboBox()
        Me.HuraGroupBox3 = New CrypterMaster.HuraGroupBox()
        Me.chkEjecutar_Binder = New CrypterMaster.HuraCheckBox()
        Me.btnAgregar_Binder = New CrypterMaster.HuraButton()
        Me.btnQuitar_Binder = New CrypterMaster.HuraButton()
        Me.lstArchivos_Binder = New System.Windows.Forms.ListView()
        Me.colArchivo_Binder = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.colEjecutar_Binder = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.TabDownloader = New System.Windows.Forms.TabPage()
        Me.HuraGroupBox4 = New CrypterMaster.HuraGroupBox()
        Me.chkEjecutar_Downloader = New CrypterMaster.HuraCheckBox()
        Me.btnAgregar_Downloader = New CrypterMaster.HuraButton()
        Me.btnQuitar_Downloader = New CrypterMaster.HuraButton()
        Me.lstArchivos_Downloader = New System.Windows.Forms.ListView()
        Me.colURL_Downloader = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.colExtension_Downloader = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.colEjecutar_Downloader = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.comboDrop_Downloader = New CrypterMaster.HuraComboBox()
        Me.tabOpciones = New System.Windows.Forms.TabPage()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.updwnRetraso = New System.Windows.Forms.NumericUpDown()
        Me.btnAssembly = New CrypterMaster.HuraButton()
        Me.btnIcono = New CrypterMaster.HuraButton()
        Me.chkRetraso = New CrypterMaster.HuraCheckBox()
        Me.txtAssembly = New CrypterMaster.HuraTextBox()
        Me.txtIcono = New CrypterMaster.HuraTextBox()
        Me.chkAssembly = New CrypterMaster.HuraCheckBox()
        Me.chkIcono = New CrypterMaster.HuraCheckBox()
        Me.chkAntis = New CrypterMaster.HuraCheckBox()
        Me.tabAcercaDe = New System.Windows.Forms.TabPage()
        Me.PictureBox2 = New System.Windows.Forms.PictureBox()
        Me.LinkLabel1 = New System.Windows.Forms.LinkLabel()
        Me.lblScan = New System.Windows.Forms.LinkLabel()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.HuraGroupBox2 = New CrypterMaster.HuraGroupBox()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.HuraControlBox1 = New CrypterMaster.HuraControlBox()
        Me.HuraGUI.SuspendLayout()
        Me.tabControl.SuspendLayout()
        Me.TabCrypter.SuspendLayout()
        Me.HuraGroupBox1.SuspendLayout()
        Me.TabBinder.SuspendLayout()
        Me.HuraGroupBox3.SuspendLayout()
        Me.TabDownloader.SuspendLayout()
        Me.HuraGroupBox4.SuspendLayout()
        Me.tabOpciones.SuspendLayout()
        CType(Me.updwnRetraso, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.tabAcercaDe.SuspendLayout()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.HuraGroupBox2.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'HuraGUI
        '
        Me.HuraGUI.AccentColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.HuraGUI.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.HuraGUI.ColorScheme = CrypterMaster.HuraForm.ColorSchemes.Dark
        Me.HuraGUI.Controls.Add(Me.btnCrear)
        Me.HuraGUI.Controls.Add(Me.progressCrear)
        Me.HuraGUI.Controls.Add(Me.tabControl)
        Me.HuraGUI.Controls.Add(Me.HuraControlBox1)
        Me.HuraGUI.Dock = System.Windows.Forms.DockStyle.Fill
        Me.HuraGUI.Font = New System.Drawing.Font("Segoe UI", 9.5!)
        Me.HuraGUI.ForeColor = System.Drawing.Color.Gray
        Me.HuraGUI.Location = New System.Drawing.Point(0, 0)
        Me.HuraGUI.Name = "HuraGUI"
        Me.HuraGUI.Size = New System.Drawing.Size(685, 231)
        Me.HuraGUI.TabIndex = 0
        Me.HuraGUI.Text = "CrypterMaster .NET"
        '
        'btnCrear
        '
        Me.btnCrear.BackColor = System.Drawing.Color.Transparent
        Me.btnCrear.BaseColour = System.Drawing.Color.White
        Me.btnCrear.BorderColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.btnCrear.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.btnCrear.HoverColour = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnCrear.Location = New System.Drawing.Point(543, 195)
        Me.btnCrear.Name = "btnCrear"
        Me.btnCrear.PressedColour = System.Drawing.Color.FromArgb(CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer))
        Me.btnCrear.ProgressColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(191, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnCrear.Size = New System.Drawing.Size(130, 26)
        Me.btnCrear.TabIndex = 5
        Me.btnCrear.Text = "Crear"
        '
        'progressCrear
        '
        Me.progressCrear.BaseColour = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.progressCrear.BorderColour = System.Drawing.Color.FromArgb(CType(CType(190, Byte), Integer), CType(CType(190, Byte), Integer), CType(CType(190, Byte), Integer))
        Me.progressCrear.FontColour = System.Drawing.Color.FromArgb(CType(CType(50, Byte), Integer), CType(CType(50, Byte), Integer), CType(CType(50, Byte), Integer))
        Me.progressCrear.Location = New System.Drawing.Point(12, 195)
        Me.progressCrear.Maximum = 100
        Me.progressCrear.Name = "progressCrear"
        Me.progressCrear.ProgressColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.progressCrear.SecondColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(250, Byte), Integer))
        Me.progressCrear.Size = New System.Drawing.Size(525, 26)
        Me.progressCrear.TabIndex = 4
        Me.progressCrear.Text = "HuraProgressBar1"
        Me.progressCrear.TwoColour = True
        Me.progressCrear.Value = 0
        '
        'tabControl
        '
        Me.tabControl.Controls.Add(Me.TabCrypter)
        Me.tabControl.Controls.Add(Me.TabBinder)
        Me.tabControl.Controls.Add(Me.TabDownloader)
        Me.tabControl.Controls.Add(Me.tabOpciones)
        Me.tabControl.Controls.Add(Me.tabAcercaDe)
        Me.tabControl.Font = New System.Drawing.Font("Segoe UI", 9.5!)
        Me.tabControl.ItemSize = New System.Drawing.Size(0, 30)
        Me.tabControl.Location = New System.Drawing.Point(12, 32)
        Me.tabControl.Name = "tabControl"
        Me.tabControl.SelectedIndex = 0
        Me.tabControl.Size = New System.Drawing.Size(662, 161)
        Me.tabControl.TabIndex = 3
        '
        'TabCrypter
        '
        Me.TabCrypter.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.TabCrypter.Controls.Add(Me.HuraGroupBox1)
        Me.TabCrypter.Controls.Add(Me.btnGenerar_Crypter)
        Me.TabCrypter.Controls.Add(Me.txtClave_Crypter)
        Me.TabCrypter.Controls.Add(Me.Label2)
        Me.TabCrypter.Controls.Add(Me.btnSeleccionar_Crypter)
        Me.TabCrypter.Controls.Add(Me.txtArchivo_Crypter)
        Me.TabCrypter.Controls.Add(Me.Label1)
        Me.TabCrypter.Location = New System.Drawing.Point(4, 34)
        Me.TabCrypter.Name = "TabCrypter"
        Me.TabCrypter.Padding = New System.Windows.Forms.Padding(3)
        Me.TabCrypter.Size = New System.Drawing.Size(654, 123)
        Me.TabCrypter.TabIndex = 0
        Me.TabCrypter.Text = "Crypter"
        '
        'HuraGroupBox1
        '
        Me.HuraGroupBox1.BackColor = System.Drawing.Color.White
        Me.HuraGroupBox1.Controls.Add(Me.rbtnUnknown_Crypter)
        Me.HuraGroupBox1.Controls.Add(Me.rbtnStairs_Crypter)
        Me.HuraGroupBox1.Controls.Add(Me.Label3)
        Me.HuraGroupBox1.Location = New System.Drawing.Point(505, 23)
        Me.HuraGroupBox1.Name = "HuraGroupBox1"
        Me.HuraGroupBox1.Size = New System.Drawing.Size(143, 85)
        Me.HuraGroupBox1.TabIndex = 6
        Me.HuraGroupBox1.Text = "HuraGroupBox1"
        '
        'rbtnUnknown_Crypter
        '
        Me.rbtnUnknown_Crypter.BaseColour = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.rbtnUnknown_Crypter.BorderColour = System.Drawing.Color.FromArgb(CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer))
        Me.rbtnUnknown_Crypter.Checked = False
        Me.rbtnUnknown_Crypter.CheckedColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.rbtnUnknown_Crypter.Cursor = System.Windows.Forms.Cursors.Hand
        Me.rbtnUnknown_Crypter.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.rbtnUnknown_Crypter.HighlightColour = System.Drawing.Color.FromArgb(CType(CType(240, Byte), Integer), CType(CType(240, Byte), Integer), CType(CType(240, Byte), Integer))
        Me.rbtnUnknown_Crypter.Location = New System.Drawing.Point(6, 56)
        Me.rbtnUnknown_Crypter.Name = "rbtnUnknown_Crypter"
        Me.rbtnUnknown_Crypter.Size = New System.Drawing.Size(127, 22)
        Me.rbtnUnknown_Crypter.TabIndex = 3
        Me.rbtnUnknown_Crypter.Text = "Unknown"
        '
        'rbtnStairs_Crypter
        '
        Me.rbtnStairs_Crypter.BaseColour = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.rbtnStairs_Crypter.BorderColour = System.Drawing.Color.FromArgb(CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer))
        Me.rbtnStairs_Crypter.Checked = True
        Me.rbtnStairs_Crypter.CheckedColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.rbtnStairs_Crypter.Cursor = System.Windows.Forms.Cursors.Hand
        Me.rbtnStairs_Crypter.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.rbtnStairs_Crypter.HighlightColour = System.Drawing.Color.FromArgb(CType(CType(240, Byte), Integer), CType(CType(240, Byte), Integer), CType(CType(240, Byte), Integer))
        Me.rbtnStairs_Crypter.Location = New System.Drawing.Point(6, 28)
        Me.rbtnStairs_Crypter.Name = "rbtnStairs_Crypter"
        Me.rbtnStairs_Crypter.Size = New System.Drawing.Size(127, 22)
        Me.rbtnStairs_Crypter.TabIndex = 2
        Me.rbtnStairs_Crypter.Text = "Stairs"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.Label3.Location = New System.Drawing.Point(3, 4)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(130, 17)
        Me.Label3.TabIndex = 1
        Me.Label3.Text = "Algoritmo de cifrado"
        '
        'btnGenerar_Crypter
        '
        Me.btnGenerar_Crypter.BackColor = System.Drawing.Color.Transparent
        Me.btnGenerar_Crypter.BaseColour = System.Drawing.Color.White
        Me.btnGenerar_Crypter.BorderColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.btnGenerar_Crypter.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.btnGenerar_Crypter.HoverColour = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnGenerar_Crypter.Location = New System.Drawing.Point(428, 79)
        Me.btnGenerar_Crypter.Name = "btnGenerar_Crypter"
        Me.btnGenerar_Crypter.PressedColour = System.Drawing.Color.FromArgb(CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer))
        Me.btnGenerar_Crypter.ProgressColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(191, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnGenerar_Crypter.Size = New System.Drawing.Size(71, 29)
        Me.btnGenerar_Crypter.TabIndex = 5
        Me.btnGenerar_Crypter.Text = "Generar"
        '
        'txtClave_Crypter
        '
        Me.txtClave_Crypter.BackColor = System.Drawing.Color.Transparent
        Me.txtClave_Crypter.BackgroundColour = System.Drawing.Color.White
        Me.txtClave_Crypter.BorderColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.txtClave_Crypter.Location = New System.Drawing.Point(6, 79)
        Me.txtClave_Crypter.MaxLength = 32767
        Me.txtClave_Crypter.Multiline = False
        Me.txtClave_Crypter.Name = "txtClave_Crypter"
        Me.txtClave_Crypter.ReadOnly = True
        Me.txtClave_Crypter.Size = New System.Drawing.Size(416, 29)
        Me.txtClave_Crypter.Style = CrypterMaster.HuraTextBox.Styles.Normal
        Me.txtClave_Crypter.TabIndex = 4
        Me.txtClave_Crypter.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
        Me.txtClave_Crypter.TextColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.txtClave_Crypter.UseSystemPasswordChar = False
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.Label2.Location = New System.Drawing.Point(3, 59)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(103, 17)
        Me.Label2.TabIndex = 3
        Me.Label2.Text = "Clave de cifrado"
        '
        'btnSeleccionar_Crypter
        '
        Me.btnSeleccionar_Crypter.BackColor = System.Drawing.Color.Transparent
        Me.btnSeleccionar_Crypter.BaseColour = System.Drawing.Color.White
        Me.btnSeleccionar_Crypter.BorderColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.btnSeleccionar_Crypter.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.btnSeleccionar_Crypter.HoverColour = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnSeleccionar_Crypter.Location = New System.Drawing.Point(428, 23)
        Me.btnSeleccionar_Crypter.Name = "btnSeleccionar_Crypter"
        Me.btnSeleccionar_Crypter.PressedColour = System.Drawing.Color.FromArgb(CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer))
        Me.btnSeleccionar_Crypter.ProgressColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(191, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnSeleccionar_Crypter.Size = New System.Drawing.Size(71, 29)
        Me.btnSeleccionar_Crypter.TabIndex = 2
        Me.btnSeleccionar_Crypter.Text = "Seleccionar"
        '
        'txtArchivo_Crypter
        '
        Me.txtArchivo_Crypter.BackColor = System.Drawing.Color.Transparent
        Me.txtArchivo_Crypter.BackgroundColour = System.Drawing.Color.White
        Me.txtArchivo_Crypter.BorderColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.txtArchivo_Crypter.Location = New System.Drawing.Point(6, 23)
        Me.txtArchivo_Crypter.MaxLength = 32767
        Me.txtArchivo_Crypter.Multiline = False
        Me.txtArchivo_Crypter.Name = "txtArchivo_Crypter"
        Me.txtArchivo_Crypter.ReadOnly = True
        Me.txtArchivo_Crypter.Size = New System.Drawing.Size(416, 29)
        Me.txtArchivo_Crypter.Style = CrypterMaster.HuraTextBox.Styles.Normal
        Me.txtArchivo_Crypter.TabIndex = 1
        Me.txtArchivo_Crypter.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
        Me.txtArchivo_Crypter.TextColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.txtArchivo_Crypter.UseSystemPasswordChar = False
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.Label1.Location = New System.Drawing.Point(3, 3)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(118, 17)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Archivo a encriptar"
        '
        'TabBinder
        '
        Me.TabBinder.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.TabBinder.Controls.Add(Me.comboDrop_Binder)
        Me.TabBinder.Controls.Add(Me.HuraGroupBox3)
        Me.TabBinder.Controls.Add(Me.lstArchivos_Binder)
        Me.TabBinder.Location = New System.Drawing.Point(4, 34)
        Me.TabBinder.Name = "TabBinder"
        Me.TabBinder.Padding = New System.Windows.Forms.Padding(3)
        Me.TabBinder.Size = New System.Drawing.Size(654, 123)
        Me.TabBinder.TabIndex = 1
        Me.TabBinder.Text = "Binder"
        '
        'comboDrop_Binder
        '
        Me.comboDrop_Binder.AccentColor = System.Drawing.Color.FromArgb(CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer))
        Me.comboDrop_Binder.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.comboDrop_Binder.ColorScheme = CrypterMaster.HuraComboBox.ColorSchemes.Dark
        Me.comboDrop_Binder.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.comboDrop_Binder.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.comboDrop_Binder.Font = New System.Drawing.Font("Segoe UI", 9.5!)
        Me.comboDrop_Binder.ForeColor = System.Drawing.Color.White
        Me.comboDrop_Binder.FormattingEnabled = True
        Me.comboDrop_Binder.Items.AddRange(New Object() {"%App.Path%", "%Temp%", "%AppData%", "%UserProfile%", "%MyDocuments%"})
        Me.comboDrop_Binder.Location = New System.Drawing.Point(427, 92)
        Me.comboDrop_Binder.Name = "comboDrop_Binder"
        Me.comboDrop_Binder.Size = New System.Drawing.Size(219, 25)
        Me.comboDrop_Binder.TabIndex = 4
        '
        'HuraGroupBox3
        '
        Me.HuraGroupBox3.BackColor = System.Drawing.Color.White
        Me.HuraGroupBox3.Controls.Add(Me.chkEjecutar_Binder)
        Me.HuraGroupBox3.Controls.Add(Me.btnAgregar_Binder)
        Me.HuraGroupBox3.Controls.Add(Me.btnQuitar_Binder)
        Me.HuraGroupBox3.Location = New System.Drawing.Point(427, 6)
        Me.HuraGroupBox3.Name = "HuraGroupBox3"
        Me.HuraGroupBox3.Size = New System.Drawing.Size(220, 80)
        Me.HuraGroupBox3.TabIndex = 3
        Me.HuraGroupBox3.Text = "HuraGroupBox3"
        '
        'chkEjecutar_Binder
        '
        Me.chkEjecutar_Binder.BaseColour = System.Drawing.Color.White
        Me.chkEjecutar_Binder.BorderColour = System.Drawing.Color.FromArgb(CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer))
        Me.chkEjecutar_Binder.Checked = False
        Me.chkEjecutar_Binder.CheckedColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.chkEjecutar_Binder.Cursor = System.Windows.Forms.Cursors.Hand
        Me.chkEjecutar_Binder.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.chkEjecutar_Binder.Location = New System.Drawing.Point(12, 48)
        Me.chkEjecutar_Binder.Name = "chkEjecutar_Binder"
        Me.chkEjecutar_Binder.Size = New System.Drawing.Size(130, 22)
        Me.chkEjecutar_Binder.TabIndex = 3
        Me.chkEjecutar_Binder.Text = "Ejecutar archivo"
        Me.chkEjecutar_Binder.Visible = False
        '
        'btnAgregar_Binder
        '
        Me.btnAgregar_Binder.BackColor = System.Drawing.Color.Transparent
        Me.btnAgregar_Binder.BaseColour = System.Drawing.Color.White
        Me.btnAgregar_Binder.BorderColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.btnAgregar_Binder.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.btnAgregar_Binder.HoverColour = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnAgregar_Binder.Location = New System.Drawing.Point(12, 13)
        Me.btnAgregar_Binder.Name = "btnAgregar_Binder"
        Me.btnAgregar_Binder.PressedColour = System.Drawing.Color.FromArgb(CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer))
        Me.btnAgregar_Binder.ProgressColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(191, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnAgregar_Binder.Size = New System.Drawing.Size(94, 26)
        Me.btnAgregar_Binder.TabIndex = 1
        Me.btnAgregar_Binder.Text = "Agregar archivo"
        '
        'btnQuitar_Binder
        '
        Me.btnQuitar_Binder.BackColor = System.Drawing.Color.Transparent
        Me.btnQuitar_Binder.BaseColour = System.Drawing.Color.White
        Me.btnQuitar_Binder.BorderColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.btnQuitar_Binder.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.btnQuitar_Binder.HoverColour = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnQuitar_Binder.Location = New System.Drawing.Point(116, 13)
        Me.btnQuitar_Binder.Name = "btnQuitar_Binder"
        Me.btnQuitar_Binder.PressedColour = System.Drawing.Color.FromArgb(CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer))
        Me.btnQuitar_Binder.ProgressColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(191, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnQuitar_Binder.Size = New System.Drawing.Size(94, 26)
        Me.btnQuitar_Binder.TabIndex = 2
        Me.btnQuitar_Binder.Text = "Quitar archivo"
        '
        'lstArchivos_Binder
        '
        Me.lstArchivos_Binder.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.colArchivo_Binder, Me.colEjecutar_Binder})
        Me.lstArchivos_Binder.ForeColor = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.lstArchivos_Binder.FullRowSelect = True
        Me.lstArchivos_Binder.GridLines = True
        Me.lstArchivos_Binder.Location = New System.Drawing.Point(3, 6)
        Me.lstArchivos_Binder.MultiSelect = False
        Me.lstArchivos_Binder.Name = "lstArchivos_Binder"
        Me.lstArchivos_Binder.Size = New System.Drawing.Size(418, 111)
        Me.lstArchivos_Binder.TabIndex = 0
        Me.lstArchivos_Binder.UseCompatibleStateImageBehavior = False
        Me.lstArchivos_Binder.View = System.Windows.Forms.View.Details
        '
        'colArchivo_Binder
        '
        Me.colArchivo_Binder.Text = "Archivo"
        Me.colArchivo_Binder.Width = 338
        '
        'colEjecutar_Binder
        '
        Me.colEjecutar_Binder.Text = "Ejecutar"
        Me.colEjecutar_Binder.Width = 58
        '
        'TabDownloader
        '
        Me.TabDownloader.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.TabDownloader.Controls.Add(Me.HuraGroupBox4)
        Me.TabDownloader.Controls.Add(Me.lstArchivos_Downloader)
        Me.TabDownloader.Controls.Add(Me.comboDrop_Downloader)
        Me.TabDownloader.Location = New System.Drawing.Point(4, 34)
        Me.TabDownloader.Name = "TabDownloader"
        Me.TabDownloader.Size = New System.Drawing.Size(654, 123)
        Me.TabDownloader.TabIndex = 2
        Me.TabDownloader.Text = "Downloader"
        '
        'HuraGroupBox4
        '
        Me.HuraGroupBox4.BackColor = System.Drawing.Color.White
        Me.HuraGroupBox4.Controls.Add(Me.chkEjecutar_Downloader)
        Me.HuraGroupBox4.Controls.Add(Me.btnAgregar_Downloader)
        Me.HuraGroupBox4.Controls.Add(Me.btnQuitar_Downloader)
        Me.HuraGroupBox4.Location = New System.Drawing.Point(428, 6)
        Me.HuraGroupBox4.Name = "HuraGroupBox4"
        Me.HuraGroupBox4.Size = New System.Drawing.Size(220, 80)
        Me.HuraGroupBox4.TabIndex = 6
        Me.HuraGroupBox4.Text = "HuraGroupBox4"
        '
        'chkEjecutar_Downloader
        '
        Me.chkEjecutar_Downloader.BaseColour = System.Drawing.Color.White
        Me.chkEjecutar_Downloader.BorderColour = System.Drawing.Color.FromArgb(CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer))
        Me.chkEjecutar_Downloader.Checked = False
        Me.chkEjecutar_Downloader.CheckedColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.chkEjecutar_Downloader.Cursor = System.Windows.Forms.Cursors.Hand
        Me.chkEjecutar_Downloader.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.chkEjecutar_Downloader.Location = New System.Drawing.Point(12, 48)
        Me.chkEjecutar_Downloader.Name = "chkEjecutar_Downloader"
        Me.chkEjecutar_Downloader.Size = New System.Drawing.Size(130, 22)
        Me.chkEjecutar_Downloader.TabIndex = 3
        Me.chkEjecutar_Downloader.Text = "Ejecutar archivo"
        Me.chkEjecutar_Downloader.Visible = False
        '
        'btnAgregar_Downloader
        '
        Me.btnAgregar_Downloader.BackColor = System.Drawing.Color.Transparent
        Me.btnAgregar_Downloader.BaseColour = System.Drawing.Color.White
        Me.btnAgregar_Downloader.BorderColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.btnAgregar_Downloader.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.btnAgregar_Downloader.HoverColour = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnAgregar_Downloader.Location = New System.Drawing.Point(12, 13)
        Me.btnAgregar_Downloader.Name = "btnAgregar_Downloader"
        Me.btnAgregar_Downloader.PressedColour = System.Drawing.Color.FromArgb(CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer))
        Me.btnAgregar_Downloader.ProgressColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(191, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnAgregar_Downloader.Size = New System.Drawing.Size(94, 26)
        Me.btnAgregar_Downloader.TabIndex = 1
        Me.btnAgregar_Downloader.Text = "Agregar URL"
        '
        'btnQuitar_Downloader
        '
        Me.btnQuitar_Downloader.BackColor = System.Drawing.Color.Transparent
        Me.btnQuitar_Downloader.BaseColour = System.Drawing.Color.White
        Me.btnQuitar_Downloader.BorderColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.btnQuitar_Downloader.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.btnQuitar_Downloader.HoverColour = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnQuitar_Downloader.Location = New System.Drawing.Point(116, 13)
        Me.btnQuitar_Downloader.Name = "btnQuitar_Downloader"
        Me.btnQuitar_Downloader.PressedColour = System.Drawing.Color.FromArgb(CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer))
        Me.btnQuitar_Downloader.ProgressColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(191, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnQuitar_Downloader.Size = New System.Drawing.Size(94, 26)
        Me.btnQuitar_Downloader.TabIndex = 2
        Me.btnQuitar_Downloader.Text = "Quitar URL"
        '
        'lstArchivos_Downloader
        '
        Me.lstArchivos_Downloader.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.colURL_Downloader, Me.colExtension_Downloader, Me.colEjecutar_Downloader})
        Me.lstArchivos_Downloader.ForeColor = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.lstArchivos_Downloader.FullRowSelect = True
        Me.lstArchivos_Downloader.GridLines = True
        Me.lstArchivos_Downloader.Location = New System.Drawing.Point(3, 6)
        Me.lstArchivos_Downloader.MultiSelect = False
        Me.lstArchivos_Downloader.Name = "lstArchivos_Downloader"
        Me.lstArchivos_Downloader.Size = New System.Drawing.Size(419, 111)
        Me.lstArchivos_Downloader.TabIndex = 5
        Me.lstArchivos_Downloader.UseCompatibleStateImageBehavior = False
        Me.lstArchivos_Downloader.View = System.Windows.Forms.View.Details
        '
        'colURL_Downloader
        '
        Me.colURL_Downloader.Text = "URL"
        Me.colURL_Downloader.Width = 272
        '
        'colExtension_Downloader
        '
        Me.colExtension_Downloader.Text = "Ext."
        '
        'colEjecutar_Downloader
        '
        Me.colEjecutar_Downloader.Text = "Ejecutar"
        Me.colEjecutar_Downloader.Width = 66
        '
        'comboDrop_Downloader
        '
        Me.comboDrop_Downloader.AccentColor = System.Drawing.Color.FromArgb(CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer))
        Me.comboDrop_Downloader.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.comboDrop_Downloader.ColorScheme = CrypterMaster.HuraComboBox.ColorSchemes.Dark
        Me.comboDrop_Downloader.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.comboDrop_Downloader.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.comboDrop_Downloader.Font = New System.Drawing.Font("Segoe UI", 9.5!)
        Me.comboDrop_Downloader.ForeColor = System.Drawing.Color.White
        Me.comboDrop_Downloader.FormattingEnabled = True
        Me.comboDrop_Downloader.Items.AddRange(New Object() {"%App.Path%", "%Temp%", "%AppData%", "%UserProfile%", "%MyDocuments%"})
        Me.comboDrop_Downloader.Location = New System.Drawing.Point(428, 92)
        Me.comboDrop_Downloader.Name = "comboDrop_Downloader"
        Me.comboDrop_Downloader.Size = New System.Drawing.Size(219, 25)
        Me.comboDrop_Downloader.TabIndex = 7
        '
        'tabOpciones
        '
        Me.tabOpciones.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.tabOpciones.Controls.Add(Me.Label8)
        Me.tabOpciones.Controls.Add(Me.updwnRetraso)
        Me.tabOpciones.Controls.Add(Me.btnAssembly)
        Me.tabOpciones.Controls.Add(Me.btnIcono)
        Me.tabOpciones.Controls.Add(Me.chkRetraso)
        Me.tabOpciones.Controls.Add(Me.txtAssembly)
        Me.tabOpciones.Controls.Add(Me.txtIcono)
        Me.tabOpciones.Controls.Add(Me.chkAssembly)
        Me.tabOpciones.Controls.Add(Me.chkIcono)
        Me.tabOpciones.Controls.Add(Me.chkAntis)
        Me.tabOpciones.Location = New System.Drawing.Point(4, 34)
        Me.tabOpciones.Name = "tabOpciones"
        Me.tabOpciones.Size = New System.Drawing.Size(654, 123)
        Me.tabOpciones.TabIndex = 3
        Me.tabOpciones.Text = "Opciones"
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.ForeColor = System.Drawing.Color.FromArgb(CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer))
        Me.Label8.Location = New System.Drawing.Point(366, 12)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(65, 17)
        Me.Label8.TabIndex = 10
        Me.Label8.Text = "segundos"
        '
        'updwnRetraso
        '
        Me.updwnRetraso.Enabled = False
        Me.updwnRetraso.ForeColor = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.updwnRetraso.Location = New System.Drawing.Point(308, 9)
        Me.updwnRetraso.Name = "updwnRetraso"
        Me.updwnRetraso.Size = New System.Drawing.Size(55, 24)
        Me.updwnRetraso.TabIndex = 8
        '
        'btnAssembly
        '
        Me.btnAssembly.BackColor = System.Drawing.Color.Transparent
        Me.btnAssembly.BaseColour = System.Drawing.Color.White
        Me.btnAssembly.BorderColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.btnAssembly.Enabled = False
        Me.btnAssembly.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.btnAssembly.HoverColour = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnAssembly.Location = New System.Drawing.Point(527, 78)
        Me.btnAssembly.Name = "btnAssembly"
        Me.btnAssembly.PressedColour = System.Drawing.Color.FromArgb(CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer))
        Me.btnAssembly.ProgressColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(191, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnAssembly.Size = New System.Drawing.Size(116, 29)
        Me.btnAssembly.TabIndex = 7
        Me.btnAssembly.Text = "Seleccionar"
        '
        'btnIcono
        '
        Me.btnIcono.BackColor = System.Drawing.Color.Transparent
        Me.btnIcono.BaseColour = System.Drawing.Color.White
        Me.btnIcono.BorderColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.btnIcono.Enabled = False
        Me.btnIcono.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.btnIcono.HoverColour = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnIcono.Location = New System.Drawing.Point(527, 43)
        Me.btnIcono.Name = "btnIcono"
        Me.btnIcono.PressedColour = System.Drawing.Color.FromArgb(CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer), CType(CType(245, Byte), Integer))
        Me.btnIcono.ProgressColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(191, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnIcono.Size = New System.Drawing.Size(116, 29)
        Me.btnIcono.TabIndex = 6
        Me.btnIcono.Text = "Seleccionar"
        '
        'chkRetraso
        '
        Me.chkRetraso.BaseColour = System.Drawing.Color.White
        Me.chkRetraso.BorderColour = System.Drawing.Color.FromArgb(CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer))
        Me.chkRetraso.Checked = False
        Me.chkRetraso.CheckedColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.chkRetraso.Cursor = System.Windows.Forms.Cursors.Hand
        Me.chkRetraso.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.chkRetraso.Location = New System.Drawing.Point(150, 10)
        Me.chkRetraso.Name = "chkRetraso"
        Me.chkRetraso.Size = New System.Drawing.Size(151, 22)
        Me.chkRetraso.TabIndex = 5
        Me.chkRetraso.Text = "Retraso de ejecución"
        '
        'txtAssembly
        '
        Me.txtAssembly.BackColor = System.Drawing.Color.Transparent
        Me.txtAssembly.BackgroundColour = System.Drawing.Color.White
        Me.txtAssembly.BorderColour = System.Drawing.Color.FromArgb(CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer))
        Me.txtAssembly.Location = New System.Drawing.Point(150, 78)
        Me.txtAssembly.MaxLength = 32767
        Me.txtAssembly.Multiline = False
        Me.txtAssembly.Name = "txtAssembly"
        Me.txtAssembly.ReadOnly = True
        Me.txtAssembly.Size = New System.Drawing.Size(371, 29)
        Me.txtAssembly.Style = CrypterMaster.HuraTextBox.Styles.Normal
        Me.txtAssembly.TabIndex = 4
        Me.txtAssembly.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
        Me.txtAssembly.TextColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.txtAssembly.UseSystemPasswordChar = False
        '
        'txtIcono
        '
        Me.txtIcono.BackColor = System.Drawing.Color.Transparent
        Me.txtIcono.BackgroundColour = System.Drawing.Color.White
        Me.txtIcono.BorderColour = System.Drawing.Color.FromArgb(CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer))
        Me.txtIcono.Location = New System.Drawing.Point(150, 43)
        Me.txtIcono.MaxLength = 32767
        Me.txtIcono.Multiline = False
        Me.txtIcono.Name = "txtIcono"
        Me.txtIcono.ReadOnly = True
        Me.txtIcono.Size = New System.Drawing.Size(371, 29)
        Me.txtIcono.Style = CrypterMaster.HuraTextBox.Styles.Normal
        Me.txtIcono.TabIndex = 3
        Me.txtIcono.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
        Me.txtIcono.TextColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.txtIcono.UseSystemPasswordChar = False
        '
        'chkAssembly
        '
        Me.chkAssembly.BaseColour = System.Drawing.Color.White
        Me.chkAssembly.BorderColour = System.Drawing.Color.FromArgb(CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer))
        Me.chkAssembly.Checked = False
        Me.chkAssembly.CheckedColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.chkAssembly.Cursor = System.Windows.Forms.Cursors.Hand
        Me.chkAssembly.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.chkAssembly.Location = New System.Drawing.Point(10, 82)
        Me.chkAssembly.Name = "chkAssembly"
        Me.chkAssembly.Size = New System.Drawing.Size(134, 22)
        Me.chkAssembly.TabIndex = 2
        Me.chkAssembly.Text = "Clonar Assembly"
        '
        'chkIcono
        '
        Me.chkIcono.BaseColour = System.Drawing.Color.White
        Me.chkIcono.BorderColour = System.Drawing.Color.FromArgb(CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer))
        Me.chkIcono.Checked = False
        Me.chkIcono.CheckedColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.chkIcono.Cursor = System.Windows.Forms.Cursors.Hand
        Me.chkIcono.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.chkIcono.Location = New System.Drawing.Point(10, 46)
        Me.chkIcono.Name = "chkIcono"
        Me.chkIcono.Size = New System.Drawing.Size(134, 22)
        Me.chkIcono.TabIndex = 1
        Me.chkIcono.Text = "Cambiar Icono"
        '
        'chkAntis
        '
        Me.chkAntis.BaseColour = System.Drawing.Color.White
        Me.chkAntis.BorderColour = System.Drawing.Color.FromArgb(CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer), CType(CType(180, Byte), Integer))
        Me.chkAntis.Checked = False
        Me.chkAntis.CheckedColour = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.chkAntis.Cursor = System.Windows.Forms.Cursors.Hand
        Me.chkAntis.FontColour = System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(150, Byte), Integer))
        Me.chkAntis.Location = New System.Drawing.Point(10, 10)
        Me.chkAntis.Name = "chkAntis"
        Me.chkAntis.Size = New System.Drawing.Size(68, 22)
        Me.chkAntis.TabIndex = 0
        Me.chkAntis.Text = "Antis"
        '
        'tabAcercaDe
        '
        Me.tabAcercaDe.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.tabAcercaDe.Controls.Add(Me.PictureBox2)
        Me.tabAcercaDe.Controls.Add(Me.LinkLabel1)
        Me.tabAcercaDe.Controls.Add(Me.lblScan)
        Me.tabAcercaDe.Controls.Add(Me.Label7)
        Me.tabAcercaDe.Controls.Add(Me.Label6)
        Me.tabAcercaDe.Controls.Add(Me.Label5)
        Me.tabAcercaDe.Controls.Add(Me.Label4)
        Me.tabAcercaDe.Controls.Add(Me.HuraGroupBox2)
        Me.tabAcercaDe.Location = New System.Drawing.Point(4, 34)
        Me.tabAcercaDe.Name = "tabAcercaDe"
        Me.tabAcercaDe.Size = New System.Drawing.Size(654, 123)
        Me.tabAcercaDe.TabIndex = 4
        Me.tabAcercaDe.Text = "Acerca de"
        '
        'PictureBox2
        '
        Me.PictureBox2.Image = CType(resources.GetObject("PictureBox2.Image"), System.Drawing.Image)
        Me.PictureBox2.Location = New System.Drawing.Point(406, 16)
        Me.PictureBox2.Name = "PictureBox2"
        Me.PictureBox2.Size = New System.Drawing.Size(206, 95)
        Me.PictureBox2.TabIndex = 1
        Me.PictureBox2.TabStop = False
        '
        'LinkLabel1
        '
        Me.LinkLabel1.ActiveLinkColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.LinkLabel1.AutoSize = True
        Me.LinkLabel1.Location = New System.Drawing.Point(240, 12)
        Me.LinkLabel1.Name = "LinkLabel1"
        Me.LinkLabel1.Size = New System.Drawing.Size(62, 17)
        Me.LinkLabel1.TabIndex = 6
        Me.LinkLabel1.TabStop = True
        Me.LinkLabel1.Text = "Ver perfil"
        Me.LinkLabel1.VisitedLinkColor = System.Drawing.Color.Blue
        '
        'lblScan
        '
        Me.lblScan.ActiveLinkColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.lblScan.AutoSize = True
        Me.lblScan.Location = New System.Drawing.Point(237, 68)
        Me.lblScan.Name = "lblScan"
        Me.lblScan.Size = New System.Drawing.Size(116, 17)
        Me.lblScan.TabIndex = 5
        Me.lblScan.TabStop = True
        Me.lblScan.Text = "Ver scan en MaJyx"
        Me.lblScan.VisitedLinkColor = System.Drawing.Color.Blue
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.Label7.Location = New System.Drawing.Point(123, 94)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(191, 17)
        Me.Label7.TabIndex = 4
        Me.Label7.Text = "Fecha de analisis: 09/Julio/2014"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.Label6.Location = New System.Drawing.Point(123, 67)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(111, 17)
        Me.Label6.TabIndex = 3
        Me.Label6.Text = "Detecciones: 1/35"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.Label5.Location = New System.Drawing.Point(123, 40)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(109, 17)
        Me.Label5.TabIndex = 2
        Me.Label5.Text = "Lenguaje: VB.NET"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.Label4.Location = New System.Drawing.Point(123, 12)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(111, 17)
        Me.Label4.TabIndex = 1
        Me.Label4.Text = "Coder: chequinho"
        '
        'HuraGroupBox2
        '
        Me.HuraGroupBox2.BackColor = System.Drawing.Color.White
        Me.HuraGroupBox2.Controls.Add(Me.PictureBox1)
        Me.HuraGroupBox2.Location = New System.Drawing.Point(3, 3)
        Me.HuraGroupBox2.Name = "HuraGroupBox2"
        Me.HuraGroupBox2.Size = New System.Drawing.Size(117, 117)
        Me.HuraGroupBox2.TabIndex = 0
        Me.HuraGroupBox2.Text = "HuraGroupBox2"
        '
        'PictureBox1
        '
        Me.PictureBox1.Image = CType(resources.GetObject("PictureBox1.Image"), System.Drawing.Image)
        Me.PictureBox1.Location = New System.Drawing.Point(3, 3)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(111, 111)
        Me.PictureBox1.TabIndex = 0
        Me.PictureBox1.TabStop = False
        '
        'HuraControlBox1
        '
        Me.HuraControlBox1.AccentColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(178, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.HuraControlBox1.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.HuraControlBox1.BackColor = System.Drawing.Color.White
        Me.HuraControlBox1.ColorScheme = CrypterMaster.HuraControlBox.ColorSchemes.Dark
        Me.HuraControlBox1.ForeColor = System.Drawing.Color.White
        Me.HuraControlBox1.Location = New System.Drawing.Point(582, 3)
        Me.HuraControlBox1.Name = "HuraControlBox1"
        Me.HuraControlBox1.Size = New System.Drawing.Size(100, 25)
        Me.HuraControlBox1.TabIndex = 2
        Me.HuraControlBox1.Text = "HuraControlBox1"
        '
        'GUI
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(685, 231)
        Me.Controls.Add(Me.HuraGUI)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "GUI"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "CrypterMaster .NET"
        Me.HuraGUI.ResumeLayout(False)
        Me.tabControl.ResumeLayout(False)
        Me.TabCrypter.ResumeLayout(False)
        Me.TabCrypter.PerformLayout()
        Me.HuraGroupBox1.ResumeLayout(False)
        Me.HuraGroupBox1.PerformLayout()
        Me.TabBinder.ResumeLayout(False)
        Me.HuraGroupBox3.ResumeLayout(False)
        Me.TabDownloader.ResumeLayout(False)
        Me.HuraGroupBox4.ResumeLayout(False)
        Me.tabOpciones.ResumeLayout(False)
        Me.tabOpciones.PerformLayout()
        CType(Me.updwnRetraso, System.ComponentModel.ISupportInitialize).EndInit()
        Me.tabAcercaDe.ResumeLayout(False)
        Me.tabAcercaDe.PerformLayout()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.HuraGroupBox2.ResumeLayout(False)
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents HuraGUI As CrypterMaster.HuraForm
    Friend WithEvents HuraControlBox1 As CrypterMaster.HuraControlBox
    Friend WithEvents tabControl As CrypterMaster.HuraTabControl
    Friend WithEvents TabCrypter As System.Windows.Forms.TabPage
    Friend WithEvents TabBinder As System.Windows.Forms.TabPage
    Friend WithEvents TabDownloader As System.Windows.Forms.TabPage
    Friend WithEvents tabOpciones As System.Windows.Forms.TabPage
    Friend WithEvents tabAcercaDe As System.Windows.Forms.TabPage
    Friend WithEvents txtArchivo_Crypter As CrypterMaster.HuraTextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents btnSeleccionar_Crypter As CrypterMaster.HuraButton
    Friend WithEvents btnGenerar_Crypter As CrypterMaster.HuraButton
    Friend WithEvents txtClave_Crypter As CrypterMaster.HuraTextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents HuraGroupBox1 As CrypterMaster.HuraGroupBox
    Friend WithEvents rbtnUnknown_Crypter As CrypterMaster.HuraRadioButton
    Friend WithEvents rbtnStairs_Crypter As CrypterMaster.HuraRadioButton
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents HuraGroupBox2 As CrypterMaster.HuraGroupBox
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents lstArchivos_Binder As System.Windows.Forms.ListView
    Friend WithEvents comboDrop_Binder As CrypterMaster.HuraComboBox
    Friend WithEvents HuraGroupBox3 As CrypterMaster.HuraGroupBox
    Friend WithEvents chkEjecutar_Binder As CrypterMaster.HuraCheckBox
    Friend WithEvents btnAgregar_Binder As CrypterMaster.HuraButton
    Friend WithEvents btnQuitar_Binder As CrypterMaster.HuraButton
    Friend WithEvents colArchivo_Binder As System.Windows.Forms.ColumnHeader
    Friend WithEvents colEjecutar_Binder As System.Windows.Forms.ColumnHeader
    Friend WithEvents HuraGroupBox4 As CrypterMaster.HuraGroupBox
    Friend WithEvents chkEjecutar_Downloader As CrypterMaster.HuraCheckBox
    Friend WithEvents btnAgregar_Downloader As CrypterMaster.HuraButton
    Friend WithEvents btnQuitar_Downloader As CrypterMaster.HuraButton
    Friend WithEvents lstArchivos_Downloader As System.Windows.Forms.ListView
    Friend WithEvents colURL_Downloader As System.Windows.Forms.ColumnHeader
    Friend WithEvents colEjecutar_Downloader As System.Windows.Forms.ColumnHeader
    Friend WithEvents comboDrop_Downloader As CrypterMaster.HuraComboBox
    Friend WithEvents btnCrear As CrypterMaster.HuraButton
    Friend WithEvents progressCrear As CrypterMaster.HuraProgressBar
    Friend WithEvents updwnRetraso As System.Windows.Forms.NumericUpDown
    Friend WithEvents btnAssembly As CrypterMaster.HuraButton
    Friend WithEvents btnIcono As CrypterMaster.HuraButton
    Friend WithEvents chkRetraso As CrypterMaster.HuraCheckBox
    Friend WithEvents txtAssembly As CrypterMaster.HuraTextBox
    Friend WithEvents txtIcono As CrypterMaster.HuraTextBox
    Friend WithEvents chkAssembly As CrypterMaster.HuraCheckBox
    Friend WithEvents chkIcono As CrypterMaster.HuraCheckBox
    Friend WithEvents chkAntis As CrypterMaster.HuraCheckBox
    Friend WithEvents LinkLabel1 As System.Windows.Forms.LinkLabel
    Friend WithEvents lblScan As System.Windows.Forms.LinkLabel
    Friend WithEvents dialogCrypter As System.Windows.Forms.OpenFileDialog
    Friend WithEvents dialogBinder As System.Windows.Forms.OpenFileDialog
    Friend WithEvents dialogIcono As System.Windows.Forms.OpenFileDialog
    Friend WithEvents dialogAssembly As System.Windows.Forms.OpenFileDialog
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents colExtension_Downloader As System.Windows.Forms.ColumnHeader
    Friend WithEvents dialogCrear As System.Windows.Forms.SaveFileDialog
    Friend WithEvents PictureBox2 As System.Windows.Forms.PictureBox

End Class
