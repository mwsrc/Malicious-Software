<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Das Formular überschreibt den Löschvorgang, um die Komponentenliste zu bereinigen.
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

    'Wird vom Windows Form-Designer benötigt.
    Private components As System.ComponentModel.IContainer

    'Hinweis: Die folgende Prozedur ist für den Windows Form-Designer erforderlich.
    'Das Bearbeiten ist mit dem Windows Form-Designer möglich.  
    'Das Bearbeiten mit dem Code-Editor ist nicht möglich.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.TabControl1 = New System.Windows.Forms.TabControl()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.txtCode = New System.Windows.Forms.TextBox()
        Me.AnzahlProjekte = New System.Windows.Forms.NumericUpDown()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.btnOpen = New System.Windows.Forms.Button()
        Me.btnReplace = New System.Windows.Forms.Button()
        Me.btnCopy = New System.Windows.Forms.Button()
        Me.btnOrginal = New System.Windows.Forms.Button()
        Me.ListBox1 = New System.Windows.Forms.ListBox()
        Me.ProgressBar1 = New System.Windows.Forms.ProgressBar()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.GroupBox6 = New System.Windows.Forms.GroupBox()
        Me.txtIconPath = New System.Windows.Forms.TextBox()
        Me.btnIcon = New System.Windows.Forms.Button()
        Me.GroupBox7 = New System.Windows.Forms.GroupBox()
        Me.imgIcon = New System.Windows.Forms.PictureBox()
        Me.cbIconChange = New System.Windows.Forms.CheckBox()
        Me.GroupBox5 = New System.Windows.Forms.GroupBox()
        Me.cbFileInformation = New System.Windows.Forms.CheckBox()
        Me.cbAssemblyName = New System.Windows.Forms.CheckBox()
        Me.GroupBox4 = New System.Windows.Forms.GroupBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.lstJunkSubTrash = New System.Windows.Forms.ListView()
        Me.ColumnHeader9 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.cmsJunkSubTrash = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ToolStripMenuItem3 = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem4 = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem5 = New System.Windows.Forms.ToolStripMenuItem()
        Me.txtJunkSubTo = New System.Windows.Forms.TextBox()
        Me.cbJunkSub = New System.Windows.Forms.CheckBox()
        Me.GroupBox3 = New System.Windows.Forms.GroupBox()
        Me.ComboBoxTrashLevel = New System.Windows.Forms.ComboBox()
        Me.ComboBoxTrash = New System.Windows.Forms.ComboBox()
        Me.lstTrash = New System.Windows.Forms.ListView()
        Me.ColumnHeader17 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.cmsTrash = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.AddTrashToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RemoveTrashToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RemoveAllToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.cbTrash = New System.Windows.Forms.CheckBox()
        Me.PictureBox2 = New System.Windows.Forms.PictureBox()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.cbConst = New System.Windows.Forms.CheckBox()
        Me.cbFunction = New System.Windows.Forms.CheckBox()
        Me.cbComment = New System.Windows.Forms.CheckBox()
        Me.cbVar = New System.Windows.Forms.CheckBox()
        Me.cbSub = New System.Windows.Forms.CheckBox()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.rbBase64 = New System.Windows.Forms.RadioButton()
        Me.rbRC4 = New System.Windows.Forms.RadioButton()
        Me.rbXOR = New System.Windows.Forms.RadioButton()
        Me.rbAES = New System.Windows.Forms.RadioButton()
        Me.cbStr = New System.Windows.Forms.CheckBox()
        Me.imgStr = New System.Windows.Forms.PictureBox()
        Me.TabPage3 = New System.Windows.Forms.TabPage()
        Me.TabControl2 = New System.Windows.Forms.TabControl()
        Me.TabPage5 = New System.Windows.Forms.TabPage()
        Me.lstVar = New System.Windows.Forms.ListView()
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader2 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.cmsVar = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.KopiereAlteVariableToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.KopiereNeueVariableToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.TabPage6 = New System.Windows.Forms.TabPage()
        Me.lstStr = New System.Windows.Forms.ListView()
        Me.ColumnHeader3 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader4 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.cmsStr = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem2 = New System.Windows.Forms.ToolStripMenuItem()
        Me.TabPage7 = New System.Windows.Forms.TabPage()
        Me.lstSub = New System.Windows.Forms.ListView()
        Me.ColumnHeader5 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader6 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.cmsSub = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ToolStripMenuItem6 = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem7 = New System.Windows.Forms.ToolStripMenuItem()
        Me.TabPage8 = New System.Windows.Forms.TabPage()
        Me.lstComment = New System.Windows.Forms.ListView()
        Me.ColumnHeader7 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader8 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.cmsComment = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ToolStripMenuItem8 = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem9 = New System.Windows.Forms.ToolStripMenuItem()
        Me.TabPage9 = New System.Windows.Forms.TabPage()
        Me.lstConst = New System.Windows.Forms.ListView()
        Me.ColumnHeader11 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader12 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.cmsConst = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ToolStripMenuItem10 = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem11 = New System.Windows.Forms.ToolStripMenuItem()
        Me.TabPage10 = New System.Windows.Forms.TabPage()
        Me.lstFunction = New System.Windows.Forms.ListView()
        Me.ColumnHeader15 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader16 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.cmsFunction = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ToolStripMenuItem12 = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripMenuItem13 = New System.Windows.Forms.ToolStripMenuItem()
        Me.TabPage4 = New System.Windows.Forms.TabPage()
        Me.imgAbout = New System.Windows.Forms.PictureBox()
        Me.ImageList1 = New System.Windows.Forms.ImageList(Me.components)
        Me.TabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        CType(Me.AnzahlProjekte, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage2.SuspendLayout()
        Me.GroupBox6.SuspendLayout()
        Me.GroupBox7.SuspendLayout()
        CType(Me.imgIcon, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox5.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        Me.cmsJunkSubTrash.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.cmsTrash.SuspendLayout()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox2.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox1.SuspendLayout()
        CType(Me.imgStr, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage3.SuspendLayout()
        Me.TabControl2.SuspendLayout()
        Me.TabPage5.SuspendLayout()
        Me.cmsVar.SuspendLayout()
        Me.TabPage6.SuspendLayout()
        Me.cmsStr.SuspendLayout()
        Me.TabPage7.SuspendLayout()
        Me.cmsSub.SuspendLayout()
        Me.TabPage8.SuspendLayout()
        Me.cmsComment.SuspendLayout()
        Me.TabPage9.SuspendLayout()
        Me.cmsConst.SuspendLayout()
        Me.TabPage10.SuspendLayout()
        Me.cmsFunction.SuspendLayout()
        Me.TabPage4.SuspendLayout()
        CType(Me.imgAbout, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'TabControl1
        '
        Me.TabControl1.Appearance = System.Windows.Forms.TabAppearance.FlatButtons
        Me.TabControl1.Controls.Add(Me.TabPage1)
        Me.TabControl1.Controls.Add(Me.TabPage2)
        Me.TabControl1.Controls.Add(Me.TabPage3)
        Me.TabControl1.Controls.Add(Me.TabPage4)
        Me.TabControl1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControl1.ImageList = Me.ImageList1
        Me.TabControl1.ImeMode = System.Windows.Forms.ImeMode.NoControl
        Me.TabControl1.Location = New System.Drawing.Point(0, 0)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(680, 476)
        Me.TabControl1.SizeMode = System.Windows.Forms.TabSizeMode.Fixed
        Me.TabControl1.TabIndex = 8
        '
        'TabPage1
        '
        Me.TabPage1.BackColor = System.Drawing.SystemColors.Control
        Me.TabPage1.Controls.Add(Me.txtCode)
        Me.TabPage1.Controls.Add(Me.AnzahlProjekte)
        Me.TabPage1.Controls.Add(Me.Label2)
        Me.TabPage1.Controls.Add(Me.btnOpen)
        Me.TabPage1.Controls.Add(Me.btnReplace)
        Me.TabPage1.Controls.Add(Me.btnCopy)
        Me.TabPage1.Controls.Add(Me.btnOrginal)
        Me.TabPage1.Controls.Add(Me.ListBox1)
        Me.TabPage1.Controls.Add(Me.ProgressBar1)
        Me.TabPage1.ForeColor = System.Drawing.SystemColors.Control
        Me.TabPage1.ImageIndex = 0
        Me.TabPage1.Location = New System.Drawing.Point(4, 26)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(672, 446)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Allgemein"
        '
        'txtCode
        '
        Me.txtCode.Location = New System.Drawing.Point(8, 6)
        Me.txtCode.Multiline = True
        Me.txtCode.Name = "txtCode"
        Me.txtCode.Size = New System.Drawing.Size(441, 368)
        Me.txtCode.TabIndex = 16
        '
        'AnzahlProjekte
        '
        Me.AnzahlProjekte.ForeColor = System.Drawing.Color.Black
        Me.AnzahlProjekte.Location = New System.Drawing.Point(332, 383)
        Me.AnzahlProjekte.Maximum = New Decimal(New Integer() {10, 0, 0, 0})
        Me.AnzahlProjekte.Minimum = New Decimal(New Integer() {1, 0, 0, 0})
        Me.AnzahlProjekte.Name = "AnzahlProjekte"
        Me.AnzahlProjekte.Size = New System.Drawing.Size(38, 20)
        Me.AnzahlProjekte.TabIndex = 15
        Me.AnzahlProjekte.Value = New Decimal(New Integer() {1, 0, 0, 0})
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.ForeColor = System.Drawing.Color.Black
        Me.Label2.Location = New System.Drawing.Point(170, 385)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(163, 13)
        Me.Label2.TabIndex = 14
        Me.Label2.Text = "Anzahl zu generierende Projekte:"
        '
        'btnOpen
        '
        Me.btnOpen.ForeColor = System.Drawing.Color.Black
        Me.btnOpen.Location = New System.Drawing.Point(455, 380)
        Me.btnOpen.Name = "btnOpen"
        Me.btnOpen.Size = New System.Drawing.Size(207, 23)
        Me.btnOpen.TabIndex = 13
        Me.btnOpen.Text = "Open"
        Me.btnOpen.UseVisualStyleBackColor = True
        '
        'btnReplace
        '
        Me.btnReplace.ForeColor = System.Drawing.Color.Black
        Me.btnReplace.Location = New System.Drawing.Point(374, 380)
        Me.btnReplace.Name = "btnReplace"
        Me.btnReplace.Size = New System.Drawing.Size(75, 23)
        Me.btnReplace.TabIndex = 12
        Me.btnReplace.Text = "Replace"
        Me.btnReplace.UseVisualStyleBackColor = True
        '
        'btnCopy
        '
        Me.btnCopy.ForeColor = System.Drawing.Color.Black
        Me.btnCopy.Location = New System.Drawing.Point(89, 380)
        Me.btnCopy.Name = "btnCopy"
        Me.btnCopy.Size = New System.Drawing.Size(75, 23)
        Me.btnCopy.TabIndex = 11
        Me.btnCopy.Text = "Copy"
        Me.btnCopy.UseVisualStyleBackColor = True
        '
        'btnOrginal
        '
        Me.btnOrginal.ForeColor = System.Drawing.SystemColors.ControlText
        Me.btnOrginal.Location = New System.Drawing.Point(8, 380)
        Me.btnOrginal.Name = "btnOrginal"
        Me.btnOrginal.Size = New System.Drawing.Size(75, 23)
        Me.btnOrginal.TabIndex = 2
        Me.btnOrginal.Text = "Orginal"
        Me.btnOrginal.UseVisualStyleBackColor = True
        '
        'ListBox1
        '
        Me.ListBox1.FormattingEnabled = True
        Me.ListBox1.Location = New System.Drawing.Point(455, 6)
        Me.ListBox1.Name = "ListBox1"
        Me.ListBox1.Size = New System.Drawing.Size(207, 368)
        Me.ListBox1.TabIndex = 10
        '
        'ProgressBar1
        '
        Me.ProgressBar1.Location = New System.Drawing.Point(8, 416)
        Me.ProgressBar1.Name = "ProgressBar1"
        Me.ProgressBar1.Size = New System.Drawing.Size(654, 23)
        Me.ProgressBar1.TabIndex = 6
        '
        'TabPage2
        '
        Me.TabPage2.BackColor = System.Drawing.SystemColors.Control
        Me.TabPage2.Controls.Add(Me.GroupBox6)
        Me.TabPage2.Controls.Add(Me.GroupBox5)
        Me.TabPage2.Controls.Add(Me.GroupBox4)
        Me.TabPage2.Controls.Add(Me.GroupBox3)
        Me.TabPage2.Controls.Add(Me.GroupBox2)
        Me.TabPage2.Controls.Add(Me.GroupBox1)
        Me.TabPage2.ForeColor = System.Drawing.Color.Black
        Me.TabPage2.ImageIndex = 1
        Me.TabPage2.Location = New System.Drawing.Point(4, 26)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(672, 446)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Settings"
        '
        'GroupBox6
        '
        Me.GroupBox6.Controls.Add(Me.txtIconPath)
        Me.GroupBox6.Controls.Add(Me.btnIcon)
        Me.GroupBox6.Controls.Add(Me.GroupBox7)
        Me.GroupBox6.Controls.Add(Me.cbIconChange)
        Me.GroupBox6.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox6.ForeColor = System.Drawing.Color.Black
        Me.GroupBox6.Location = New System.Drawing.Point(224, 316)
        Me.GroupBox6.Name = "GroupBox6"
        Me.GroupBox6.Size = New System.Drawing.Size(222, 122)
        Me.GroupBox6.TabIndex = 15
        Me.GroupBox6.TabStop = False
        Me.GroupBox6.Text = "Icon Change "
        '
        'txtIconPath
        '
        Me.txtIconPath.Enabled = False
        Me.txtIconPath.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtIconPath.Location = New System.Drawing.Point(6, 95)
        Me.txtIconPath.Name = "txtIconPath"
        Me.txtIconPath.ReadOnly = True
        Me.txtIconPath.Size = New System.Drawing.Size(204, 20)
        Me.txtIconPath.TabIndex = 7
        '
        'btnIcon
        '
        Me.btnIcon.Enabled = False
        Me.btnIcon.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnIcon.ForeColor = System.Drawing.Color.Black
        Me.btnIcon.Image = Global.Suck_my_Source_Code.My.Resources.Resources._1271015202_plus_32
        Me.btnIcon.Location = New System.Drawing.Point(6, 42)
        Me.btnIcon.Name = "btnIcon"
        Me.btnIcon.Size = New System.Drawing.Size(124, 47)
        Me.btnIcon.TabIndex = 6
        Me.btnIcon.Text = "Choose Icon"
        Me.btnIcon.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnIcon.UseVisualStyleBackColor = True
        '
        'GroupBox7
        '
        Me.GroupBox7.Controls.Add(Me.imgIcon)
        Me.GroupBox7.Enabled = False
        Me.GroupBox7.ForeColor = System.Drawing.Color.Black
        Me.GroupBox7.Location = New System.Drawing.Point(140, 19)
        Me.GroupBox7.Name = "GroupBox7"
        Me.GroupBox7.Size = New System.Drawing.Size(70, 70)
        Me.GroupBox7.TabIndex = 5
        Me.GroupBox7.TabStop = False
        Me.GroupBox7.Text = "Icon"
        '
        'imgIcon
        '
        Me.imgIcon.BackColor = System.Drawing.Color.Transparent
        Me.imgIcon.Location = New System.Drawing.Point(10, 14)
        Me.imgIcon.Name = "imgIcon"
        Me.imgIcon.Size = New System.Drawing.Size(50, 50)
        Me.imgIcon.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.imgIcon.TabIndex = 0
        Me.imgIcon.TabStop = False
        '
        'cbIconChange
        '
        Me.cbIconChange.AutoSize = True
        Me.cbIconChange.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbIconChange.ForeColor = System.Drawing.Color.Black
        Me.cbIconChange.Location = New System.Drawing.Point(10, 19)
        Me.cbIconChange.Name = "cbIconChange"
        Me.cbIconChange.Size = New System.Drawing.Size(87, 17)
        Me.cbIconChange.TabIndex = 0
        Me.cbIconChange.Text = "Icon Change"
        Me.cbIconChange.UseVisualStyleBackColor = True
        '
        'GroupBox5
        '
        Me.GroupBox5.Controls.Add(Me.cbFileInformation)
        Me.GroupBox5.Controls.Add(Me.cbAssemblyName)
        Me.GroupBox5.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox5.ForeColor = System.Drawing.Color.Black
        Me.GroupBox5.Location = New System.Drawing.Point(8, 316)
        Me.GroupBox5.Name = "GroupBox5"
        Me.GroupBox5.Size = New System.Drawing.Size(200, 122)
        Me.GroupBox5.TabIndex = 14
        Me.GroupBox5.TabStop = False
        Me.GroupBox5.Text = "Assembly Change "
        '
        'cbFileInformation
        '
        Me.cbFileInformation.AutoSize = True
        Me.cbFileInformation.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbFileInformation.ForeColor = System.Drawing.Color.Black
        Me.cbFileInformation.Location = New System.Drawing.Point(10, 42)
        Me.cbFileInformation.Name = "cbFileInformation"
        Me.cbFileInformation.Size = New System.Drawing.Size(137, 17)
        Me.cbFileInformation.TabIndex = 1
        Me.cbFileInformation.Text = "Change File Information"
        Me.cbFileInformation.UseVisualStyleBackColor = True
        '
        'cbAssemblyName
        '
        Me.cbAssemblyName.AutoSize = True
        Me.cbAssemblyName.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbAssemblyName.ForeColor = System.Drawing.Color.Black
        Me.cbAssemblyName.Location = New System.Drawing.Point(10, 19)
        Me.cbAssemblyName.Name = "cbAssemblyName"
        Me.cbAssemblyName.Size = New System.Drawing.Size(138, 17)
        Me.cbAssemblyName.TabIndex = 0
        Me.cbAssemblyName.Text = "Change AssemblyName"
        Me.cbAssemblyName.UseVisualStyleBackColor = True
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.Label1)
        Me.GroupBox4.Controls.Add(Me.lstJunkSubTrash)
        Me.GroupBox4.Controls.Add(Me.txtJunkSubTo)
        Me.GroupBox4.Controls.Add(Me.cbJunkSub)
        Me.GroupBox4.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox4.ForeColor = System.Drawing.Color.Black
        Me.GroupBox4.Location = New System.Drawing.Point(452, 6)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(217, 304)
        Me.GroupBox4.TabIndex = 13
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "Trash Code "
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.ForeColor = System.Drawing.Color.Black
        Me.Label1.Location = New System.Drawing.Point(19, 253)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(87, 13)
        Me.Label1.TabIndex = 18
        Me.Label1.Text = "Anzahl JunkSub:"
        '
        'lstJunkSubTrash
        '
        Me.lstJunkSubTrash.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader9})
        Me.lstJunkSubTrash.ContextMenuStrip = Me.cmsJunkSubTrash
        Me.lstJunkSubTrash.Enabled = False
        Me.lstJunkSubTrash.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lstJunkSubTrash.GridLines = True
        Me.lstJunkSubTrash.Location = New System.Drawing.Point(6, 46)
        Me.lstJunkSubTrash.MultiSelect = False
        Me.lstJunkSubTrash.Name = "lstJunkSubTrash"
        Me.lstJunkSubTrash.Size = New System.Drawing.Size(200, 197)
        Me.lstJunkSubTrash.TabIndex = 17
        Me.lstJunkSubTrash.UseCompatibleStateImageBehavior = False
        Me.lstJunkSubTrash.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader9
        '
        Me.ColumnHeader9.Text = "Custom Trash in Junk Sub"
        Me.ColumnHeader9.Width = 196
        '
        'cmsJunkSubTrash
        '
        Me.cmsJunkSubTrash.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
        Me.cmsJunkSubTrash.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripMenuItem3, Me.ToolStripMenuItem4, Me.ToolStripMenuItem5})
        Me.cmsJunkSubTrash.Name = "cmsTrash"
        Me.cmsJunkSubTrash.Size = New System.Drawing.Size(132, 70)
        '
        'ToolStripMenuItem3
        '
        Me.ToolStripMenuItem3.Name = "ToolStripMenuItem3"
        Me.ToolStripMenuItem3.Size = New System.Drawing.Size(131, 22)
        Me.ToolStripMenuItem3.Text = "Add"
        '
        'ToolStripMenuItem4
        '
        Me.ToolStripMenuItem4.Name = "ToolStripMenuItem4"
        Me.ToolStripMenuItem4.Size = New System.Drawing.Size(131, 22)
        Me.ToolStripMenuItem4.Text = "Remove"
        '
        'ToolStripMenuItem5
        '
        Me.ToolStripMenuItem5.Name = "ToolStripMenuItem5"
        Me.ToolStripMenuItem5.Size = New System.Drawing.Size(131, 22)
        Me.ToolStripMenuItem5.Text = "Remove All"
        '
        'txtJunkSubTo
        '
        Me.txtJunkSubTo.Enabled = False
        Me.txtJunkSubTo.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtJunkSubTo.Location = New System.Drawing.Point(115, 249)
        Me.txtJunkSubTo.Name = "txtJunkSubTo"
        Me.txtJunkSubTo.Size = New System.Drawing.Size(58, 20)
        Me.txtJunkSubTo.TabIndex = 15
        Me.txtJunkSubTo.Text = "10"
        Me.txtJunkSubTo.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'cbJunkSub
        '
        Me.cbJunkSub.AutoSize = True
        Me.cbJunkSub.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbJunkSub.ForeColor = System.Drawing.Color.Black
        Me.cbJunkSub.Location = New System.Drawing.Point(10, 19)
        Me.cbJunkSub.Name = "cbJunkSub"
        Me.cbJunkSub.Size = New System.Drawing.Size(93, 17)
        Me.cbJunkSub.TabIndex = 14
        Me.cbJunkSub.Text = "With JunkSub"
        Me.cbJunkSub.UseVisualStyleBackColor = True
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.ComboBoxTrashLevel)
        Me.GroupBox3.Controls.Add(Me.ComboBoxTrash)
        Me.GroupBox3.Controls.Add(Me.lstTrash)
        Me.GroupBox3.Controls.Add(Me.cbTrash)
        Me.GroupBox3.Controls.Add(Me.PictureBox2)
        Me.GroupBox3.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox3.ForeColor = System.Drawing.Color.Black
        Me.GroupBox3.Location = New System.Drawing.Point(224, 6)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(222, 304)
        Me.GroupBox3.TabIndex = 12
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "     - Trash Code "
        '
        'ComboBoxTrashLevel
        '
        Me.ComboBoxTrashLevel.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.ComboBoxTrashLevel.Enabled = False
        Me.ComboBoxTrashLevel.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ComboBoxTrashLevel.FormattingEnabled = True
        Me.ComboBoxTrashLevel.Items.AddRange(New Object() {"Level 1", "Level 2", "Level 3", "Level 4", "Level 5"})
        Me.ComboBoxTrashLevel.Location = New System.Drawing.Point(10, 277)
        Me.ComboBoxTrashLevel.Name = "ComboBoxTrashLevel"
        Me.ComboBoxTrashLevel.Size = New System.Drawing.Size(200, 21)
        Me.ComboBoxTrashLevel.TabIndex = 15
        Me.ComboBoxTrashLevel.Visible = False
        '
        'ComboBoxTrash
        '
        Me.ComboBoxTrash.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.ComboBoxTrash.Enabled = False
        Me.ComboBoxTrash.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ComboBoxTrash.FormattingEnabled = True
        Me.ComboBoxTrash.Items.AddRange(New Object() {"Trashlevel", "Trash every Line"})
        Me.ComboBoxTrash.Location = New System.Drawing.Point(10, 250)
        Me.ComboBoxTrash.Name = "ComboBoxTrash"
        Me.ComboBoxTrash.Size = New System.Drawing.Size(200, 21)
        Me.ComboBoxTrash.TabIndex = 14
        '
        'lstTrash
        '
        Me.lstTrash.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader17})
        Me.lstTrash.ContextMenuStrip = Me.cmsTrash
        Me.lstTrash.Enabled = False
        Me.lstTrash.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lstTrash.GridLines = True
        Me.lstTrash.Location = New System.Drawing.Point(10, 46)
        Me.lstTrash.MultiSelect = False
        Me.lstTrash.Name = "lstTrash"
        Me.lstTrash.Size = New System.Drawing.Size(200, 197)
        Me.lstTrash.TabIndex = 13
        Me.lstTrash.UseCompatibleStateImageBehavior = False
        Me.lstTrash.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader17
        '
        Me.ColumnHeader17.Text = "Custom Trash"
        Me.ColumnHeader17.Width = 196
        '
        'cmsTrash
        '
        Me.cmsTrash.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
        Me.cmsTrash.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AddTrashToolStripMenuItem, Me.RemoveTrashToolStripMenuItem, Me.RemoveAllToolStripMenuItem})
        Me.cmsTrash.Name = "cmsTrash"
        Me.cmsTrash.Size = New System.Drawing.Size(132, 70)
        '
        'AddTrashToolStripMenuItem
        '
        Me.AddTrashToolStripMenuItem.Name = "AddTrashToolStripMenuItem"
        Me.AddTrashToolStripMenuItem.Size = New System.Drawing.Size(131, 22)
        Me.AddTrashToolStripMenuItem.Text = "Add"
        '
        'RemoveTrashToolStripMenuItem
        '
        Me.RemoveTrashToolStripMenuItem.Name = "RemoveTrashToolStripMenuItem"
        Me.RemoveTrashToolStripMenuItem.Size = New System.Drawing.Size(131, 22)
        Me.RemoveTrashToolStripMenuItem.Text = "Remove"
        '
        'RemoveAllToolStripMenuItem
        '
        Me.RemoveAllToolStripMenuItem.Name = "RemoveAllToolStripMenuItem"
        Me.RemoveAllToolStripMenuItem.Size = New System.Drawing.Size(131, 22)
        Me.RemoveAllToolStripMenuItem.Text = "Remove All"
        '
        'cbTrash
        '
        Me.cbTrash.AutoSize = True
        Me.cbTrash.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbTrash.Location = New System.Drawing.Point(10, 23)
        Me.cbTrash.Name = "cbTrash"
        Me.cbTrash.Size = New System.Drawing.Size(59, 17)
        Me.cbTrash.TabIndex = 12
        Me.cbTrash.Text = "Enable"
        Me.cbTrash.UseVisualStyleBackColor = True
        '
        'PictureBox2
        '
        Me.PictureBox2.Image = Global.Suck_my_Source_Code.My.Resources.Resources.bin_closed
        Me.PictureBox2.Location = New System.Drawing.Point(10, -1)
        Me.PictureBox2.Name = "PictureBox2"
        Me.PictureBox2.Size = New System.Drawing.Size(16, 16)
        Me.PictureBox2.TabIndex = 1
        Me.PictureBox2.TabStop = False
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.cbConst)
        Me.GroupBox2.Controls.Add(Me.cbFunction)
        Me.GroupBox2.Controls.Add(Me.cbComment)
        Me.GroupBox2.Controls.Add(Me.cbVar)
        Me.GroupBox2.Controls.Add(Me.cbSub)
        Me.GroupBox2.Controls.Add(Me.PictureBox1)
        Me.GroupBox2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox2.ForeColor = System.Drawing.Color.Black
        Me.GroupBox2.Location = New System.Drawing.Point(8, 165)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(200, 145)
        Me.GroupBox2.TabIndex = 9
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "     - Randomize "
        '
        'cbConst
        '
        Me.cbConst.AutoSize = True
        Me.cbConst.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbConst.Location = New System.Drawing.Point(10, 113)
        Me.cbConst.Name = "cbConst"
        Me.cbConst.Size = New System.Drawing.Size(109, 17)
        Me.cbConst.TabIndex = 22
        Me.cbConst.Text = "Randomize Const"
        Me.cbConst.UseVisualStyleBackColor = True
        '
        'cbFunction
        '
        Me.cbFunction.AutoSize = True
        Me.cbFunction.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbFunction.Location = New System.Drawing.Point(10, 90)
        Me.cbFunction.Name = "cbFunction"
        Me.cbFunction.Size = New System.Drawing.Size(123, 17)
        Me.cbFunction.TabIndex = 21
        Me.cbFunction.Text = "Randomize Function"
        Me.cbFunction.UseVisualStyleBackColor = True
        '
        'cbComment
        '
        Me.cbComment.AutoSize = True
        Me.cbComment.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbComment.Location = New System.Drawing.Point(10, 67)
        Me.cbComment.Name = "cbComment"
        Me.cbComment.Size = New System.Drawing.Size(126, 17)
        Me.cbComment.TabIndex = 20
        Me.cbComment.Text = "Randomize Comment"
        Me.cbComment.UseVisualStyleBackColor = True
        '
        'cbVar
        '
        Me.cbVar.AutoSize = True
        Me.cbVar.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbVar.Location = New System.Drawing.Point(10, 44)
        Me.cbVar.Name = "cbVar"
        Me.cbVar.Size = New System.Drawing.Size(98, 17)
        Me.cbVar.TabIndex = 19
        Me.cbVar.Text = "Randomize Var"
        Me.cbVar.UseVisualStyleBackColor = True
        '
        'cbSub
        '
        Me.cbSub.AutoSize = True
        Me.cbSub.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbSub.Location = New System.Drawing.Point(10, 21)
        Me.cbSub.Name = "cbSub"
        Me.cbSub.Size = New System.Drawing.Size(137, 17)
        Me.cbSub.TabIndex = 18
        Me.cbSub.Text = "Randomize Sub Names"
        Me.cbSub.UseVisualStyleBackColor = True
        '
        'PictureBox1
        '
        Me.PictureBox1.Image = Global.Suck_my_Source_Code.My.Resources.Resources.table_refresh
        Me.PictureBox1.Location = New System.Drawing.Point(10, -1)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(16, 16)
        Me.PictureBox1.TabIndex = 10
        Me.PictureBox1.TabStop = False
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.Color.Transparent
        Me.GroupBox1.Controls.Add(Me.rbBase64)
        Me.GroupBox1.Controls.Add(Me.rbRC4)
        Me.GroupBox1.Controls.Add(Me.rbXOR)
        Me.GroupBox1.Controls.Add(Me.rbAES)
        Me.GroupBox1.Controls.Add(Me.cbStr)
        Me.GroupBox1.Controls.Add(Me.imgStr)
        Me.GroupBox1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox1.ForeColor = System.Drawing.Color.Black
        Me.GroupBox1.Location = New System.Drawing.Point(8, 6)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(200, 153)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "     - String Encryption "
        '
        'rbBase64
        '
        Me.rbBase64.AutoSize = True
        Me.rbBase64.Enabled = False
        Me.rbBase64.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.rbBase64.Location = New System.Drawing.Point(10, 111)
        Me.rbBase64.Name = "rbBase64"
        Me.rbBase64.Size = New System.Drawing.Size(61, 17)
        Me.rbBase64.TabIndex = 17
        Me.rbBase64.Text = "Base64"
        Me.rbBase64.UseVisualStyleBackColor = True
        '
        'rbRC4
        '
        Me.rbRC4.AutoSize = True
        Me.rbRC4.Enabled = False
        Me.rbRC4.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.rbRC4.Location = New System.Drawing.Point(10, 88)
        Me.rbRC4.Name = "rbRC4"
        Me.rbRC4.Size = New System.Drawing.Size(46, 17)
        Me.rbRC4.TabIndex = 16
        Me.rbRC4.Text = "RC4"
        Me.rbRC4.UseVisualStyleBackColor = True
        '
        'rbXOR
        '
        Me.rbXOR.AutoSize = True
        Me.rbXOR.Enabled = False
        Me.rbXOR.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.rbXOR.Location = New System.Drawing.Point(10, 65)
        Me.rbXOR.Name = "rbXOR"
        Me.rbXOR.Size = New System.Drawing.Size(48, 17)
        Me.rbXOR.TabIndex = 15
        Me.rbXOR.Text = "XOR"
        Me.rbXOR.UseVisualStyleBackColor = True
        '
        'rbAES
        '
        Me.rbAES.AutoSize = True
        Me.rbAES.Checked = True
        Me.rbAES.Enabled = False
        Me.rbAES.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.rbAES.Location = New System.Drawing.Point(10, 42)
        Me.rbAES.Name = "rbAES"
        Me.rbAES.Size = New System.Drawing.Size(46, 17)
        Me.rbAES.TabIndex = 14
        Me.rbAES.TabStop = True
        Me.rbAES.Text = "AES"
        Me.rbAES.UseVisualStyleBackColor = True
        '
        'cbStr
        '
        Me.cbStr.AutoSize = True
        Me.cbStr.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cbStr.Location = New System.Drawing.Point(10, 19)
        Me.cbStr.Name = "cbStr"
        Me.cbStr.Size = New System.Drawing.Size(85, 17)
        Me.cbStr.TabIndex = 13
        Me.cbStr.Text = "Crypt Strings"
        Me.cbStr.UseVisualStyleBackColor = True
        '
        'imgStr
        '
        Me.imgStr.Image = Global.Suck_my_Source_Code.My.Resources.Resources.lock
        Me.imgStr.Location = New System.Drawing.Point(10, -1)
        Me.imgStr.Name = "imgStr"
        Me.imgStr.Size = New System.Drawing.Size(16, 16)
        Me.imgStr.TabIndex = 0
        Me.imgStr.TabStop = False
        '
        'TabPage3
        '
        Me.TabPage3.BackColor = System.Drawing.SystemColors.Control
        Me.TabPage3.Controls.Add(Me.TabControl2)
        Me.TabPage3.ImageIndex = 2
        Me.TabPage3.ImeMode = System.Windows.Forms.ImeMode.NoControl
        Me.TabPage3.Location = New System.Drawing.Point(4, 26)
        Me.TabPage3.Name = "TabPage3"
        Me.TabPage3.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage3.Size = New System.Drawing.Size(672, 446)
        Me.TabPage3.TabIndex = 2
        Me.TabPage3.Text = "Replaced"
        '
        'TabControl2
        '
        Me.TabControl2.Appearance = System.Windows.Forms.TabAppearance.FlatButtons
        Me.TabControl2.Controls.Add(Me.TabPage5)
        Me.TabControl2.Controls.Add(Me.TabPage6)
        Me.TabControl2.Controls.Add(Me.TabPage7)
        Me.TabControl2.Controls.Add(Me.TabPage8)
        Me.TabControl2.Controls.Add(Me.TabPage9)
        Me.TabControl2.Controls.Add(Me.TabPage10)
        Me.TabControl2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControl2.Location = New System.Drawing.Point(3, 3)
        Me.TabControl2.Name = "TabControl2"
        Me.TabControl2.SelectedIndex = 0
        Me.TabControl2.Size = New System.Drawing.Size(666, 440)
        Me.TabControl2.SizeMode = System.Windows.Forms.TabSizeMode.Fixed
        Me.TabControl2.TabIndex = 8
        '
        'TabPage5
        '
        Me.TabPage5.BackColor = System.Drawing.SystemColors.Control
        Me.TabPage5.Controls.Add(Me.lstVar)
        Me.TabPage5.Location = New System.Drawing.Point(4, 25)
        Me.TabPage5.Name = "TabPage5"
        Me.TabPage5.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage5.Size = New System.Drawing.Size(658, 411)
        Me.TabPage5.TabIndex = 0
        Me.TabPage5.Text = "Variabeln"
        Me.TabPage5.UseVisualStyleBackColor = True
        '
        'lstVar
        '
        Me.lstVar.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader1, Me.ColumnHeader2})
        Me.lstVar.ContextMenuStrip = Me.cmsVar
        Me.lstVar.FullRowSelect = True
        Me.lstVar.GridLines = True
        Me.lstVar.Location = New System.Drawing.Point(-1, 0)
        Me.lstVar.MultiSelect = False
        Me.lstVar.Name = "lstVar"
        Me.lstVar.Size = New System.Drawing.Size(656, 376)
        Me.lstVar.TabIndex = 5
        Me.lstVar.UseCompatibleStateImageBehavior = False
        Me.lstVar.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Alte Variable:"
        Me.ColumnHeader1.Width = 326
        '
        'ColumnHeader2
        '
        Me.ColumnHeader2.Text = "Neue Variable:"
        Me.ColumnHeader2.Width = 324
        '
        'cmsVar
        '
        Me.cmsVar.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
        Me.cmsVar.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.KopiereAlteVariableToolStripMenuItem, Me.KopiereNeueVariableToolStripMenuItem})
        Me.cmsVar.Name = "cmsVar"
        Me.cmsVar.Size = New System.Drawing.Size(184, 48)
        '
        'KopiereAlteVariableToolStripMenuItem
        '
        Me.KopiereAlteVariableToolStripMenuItem.Name = "KopiereAlteVariableToolStripMenuItem"
        Me.KopiereAlteVariableToolStripMenuItem.Size = New System.Drawing.Size(183, 22)
        Me.KopiereAlteVariableToolStripMenuItem.Text = "Kopiere Alte Variable"
        '
        'KopiereNeueVariableToolStripMenuItem
        '
        Me.KopiereNeueVariableToolStripMenuItem.Name = "KopiereNeueVariableToolStripMenuItem"
        Me.KopiereNeueVariableToolStripMenuItem.Size = New System.Drawing.Size(183, 22)
        Me.KopiereNeueVariableToolStripMenuItem.Text = "Kopiere Neue Variable"
        '
        'TabPage6
        '
        Me.TabPage6.Controls.Add(Me.lstStr)
        Me.TabPage6.Location = New System.Drawing.Point(4, 25)
        Me.TabPage6.Name = "TabPage6"
        Me.TabPage6.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage6.Size = New System.Drawing.Size(658, 411)
        Me.TabPage6.TabIndex = 1
        Me.TabPage6.Text = "Strings"
        Me.TabPage6.UseVisualStyleBackColor = True
        '
        'lstStr
        '
        Me.lstStr.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader3, Me.ColumnHeader4})
        Me.lstStr.ContextMenuStrip = Me.cmsStr
        Me.lstStr.FullRowSelect = True
        Me.lstStr.GridLines = True
        Me.lstStr.Location = New System.Drawing.Point(-1, 0)
        Me.lstStr.MultiSelect = False
        Me.lstStr.Name = "lstStr"
        Me.lstStr.Size = New System.Drawing.Size(656, 376)
        Me.lstStr.TabIndex = 7
        Me.lstStr.UseCompatibleStateImageBehavior = False
        Me.lstStr.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader3
        '
        Me.ColumnHeader3.Text = "Alter String:"
        Me.ColumnHeader3.Width = 326
        '
        'ColumnHeader4
        '
        Me.ColumnHeader4.Text = "Neuer String:"
        Me.ColumnHeader4.Width = 324
        '
        'cmsStr
        '
        Me.cmsStr.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
        Me.cmsStr.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripMenuItem1, Me.ToolStripMenuItem2})
        Me.cmsStr.Name = "cmsVar"
        Me.cmsStr.Size = New System.Drawing.Size(176, 48)
        '
        'ToolStripMenuItem1
        '
        Me.ToolStripMenuItem1.Name = "ToolStripMenuItem1"
        Me.ToolStripMenuItem1.Size = New System.Drawing.Size(175, 22)
        Me.ToolStripMenuItem1.Text = "Kopiere Alter String"
        '
        'ToolStripMenuItem2
        '
        Me.ToolStripMenuItem2.Name = "ToolStripMenuItem2"
        Me.ToolStripMenuItem2.Size = New System.Drawing.Size(175, 22)
        Me.ToolStripMenuItem2.Text = "Kopiere Neuer String"
        '
        'TabPage7
        '
        Me.TabPage7.Controls.Add(Me.lstSub)
        Me.TabPage7.Location = New System.Drawing.Point(4, 25)
        Me.TabPage7.Name = "TabPage7"
        Me.TabPage7.Size = New System.Drawing.Size(658, 411)
        Me.TabPage7.TabIndex = 2
        Me.TabPage7.Text = "Subs"
        Me.TabPage7.UseVisualStyleBackColor = True
        '
        'lstSub
        '
        Me.lstSub.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader5, Me.ColumnHeader6})
        Me.lstSub.ContextMenuStrip = Me.cmsSub
        Me.lstSub.FullRowSelect = True
        Me.lstSub.GridLines = True
        Me.lstSub.Location = New System.Drawing.Point(0, 3)
        Me.lstSub.MultiSelect = False
        Me.lstSub.Name = "lstSub"
        Me.lstSub.Size = New System.Drawing.Size(656, 376)
        Me.lstSub.TabIndex = 13
        Me.lstSub.UseCompatibleStateImageBehavior = False
        Me.lstSub.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader5
        '
        Me.ColumnHeader5.Text = "Alte Sub:"
        Me.ColumnHeader5.Width = 326
        '
        'ColumnHeader6
        '
        Me.ColumnHeader6.Text = "Neue Sub:"
        Me.ColumnHeader6.Width = 324
        '
        'cmsSub
        '
        Me.cmsSub.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
        Me.cmsSub.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripMenuItem6, Me.ToolStripMenuItem7})
        Me.cmsSub.Name = "cmsVar"
        Me.cmsSub.Size = New System.Drawing.Size(176, 48)
        '
        'ToolStripMenuItem6
        '
        Me.ToolStripMenuItem6.Name = "ToolStripMenuItem6"
        Me.ToolStripMenuItem6.Size = New System.Drawing.Size(175, 22)
        Me.ToolStripMenuItem6.Text = "Kopiere Alter String"
        '
        'ToolStripMenuItem7
        '
        Me.ToolStripMenuItem7.Name = "ToolStripMenuItem7"
        Me.ToolStripMenuItem7.Size = New System.Drawing.Size(175, 22)
        Me.ToolStripMenuItem7.Text = "Kopiere Neuer String"
        '
        'TabPage8
        '
        Me.TabPage8.Controls.Add(Me.lstComment)
        Me.TabPage8.Location = New System.Drawing.Point(4, 25)
        Me.TabPage8.Name = "TabPage8"
        Me.TabPage8.Size = New System.Drawing.Size(658, 411)
        Me.TabPage8.TabIndex = 3
        Me.TabPage8.Text = "Comment"
        Me.TabPage8.UseVisualStyleBackColor = True
        '
        'lstComment
        '
        Me.lstComment.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader7, Me.ColumnHeader8})
        Me.lstComment.ContextMenuStrip = Me.cmsComment
        Me.lstComment.FullRowSelect = True
        Me.lstComment.GridLines = True
        Me.lstComment.Location = New System.Drawing.Point(0, 3)
        Me.lstComment.MultiSelect = False
        Me.lstComment.Name = "lstComment"
        Me.lstComment.Size = New System.Drawing.Size(656, 376)
        Me.lstComment.TabIndex = 13
        Me.lstComment.UseCompatibleStateImageBehavior = False
        Me.lstComment.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader7
        '
        Me.ColumnHeader7.Text = "Alter Comment:"
        Me.ColumnHeader7.Width = 326
        '
        'ColumnHeader8
        '
        Me.ColumnHeader8.Text = "Neuer Comment:"
        Me.ColumnHeader8.Width = 324
        '
        'cmsComment
        '
        Me.cmsComment.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
        Me.cmsComment.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripMenuItem8, Me.ToolStripMenuItem9})
        Me.cmsComment.Name = "cmsVar"
        Me.cmsComment.Size = New System.Drawing.Size(176, 48)
        '
        'ToolStripMenuItem8
        '
        Me.ToolStripMenuItem8.Name = "ToolStripMenuItem8"
        Me.ToolStripMenuItem8.Size = New System.Drawing.Size(175, 22)
        Me.ToolStripMenuItem8.Text = "Kopiere Alter String"
        '
        'ToolStripMenuItem9
        '
        Me.ToolStripMenuItem9.Name = "ToolStripMenuItem9"
        Me.ToolStripMenuItem9.Size = New System.Drawing.Size(175, 22)
        Me.ToolStripMenuItem9.Text = "Kopiere Neuer String"
        '
        'TabPage9
        '
        Me.TabPage9.Controls.Add(Me.lstConst)
        Me.TabPage9.Location = New System.Drawing.Point(4, 25)
        Me.TabPage9.Name = "TabPage9"
        Me.TabPage9.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage9.Size = New System.Drawing.Size(658, 411)
        Me.TabPage9.TabIndex = 4
        Me.TabPage9.Text = "Const"
        Me.TabPage9.UseVisualStyleBackColor = True
        '
        'lstConst
        '
        Me.lstConst.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader11, Me.ColumnHeader12})
        Me.lstConst.ContextMenuStrip = Me.cmsConst
        Me.lstConst.FullRowSelect = True
        Me.lstConst.GridLines = True
        Me.lstConst.Location = New System.Drawing.Point(0, 3)
        Me.lstConst.MultiSelect = False
        Me.lstConst.Name = "lstConst"
        Me.lstConst.Size = New System.Drawing.Size(656, 376)
        Me.lstConst.TabIndex = 14
        Me.lstConst.UseCompatibleStateImageBehavior = False
        Me.lstConst.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader11
        '
        Me.ColumnHeader11.Text = "Alter Const:"
        Me.ColumnHeader11.Width = 326
        '
        'ColumnHeader12
        '
        Me.ColumnHeader12.Text = "Neuer Const:"
        Me.ColumnHeader12.Width = 324
        '
        'cmsConst
        '
        Me.cmsConst.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
        Me.cmsConst.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripMenuItem10, Me.ToolStripMenuItem11})
        Me.cmsConst.Name = "cmsVar"
        Me.cmsConst.Size = New System.Drawing.Size(176, 48)
        '
        'ToolStripMenuItem10
        '
        Me.ToolStripMenuItem10.Name = "ToolStripMenuItem10"
        Me.ToolStripMenuItem10.Size = New System.Drawing.Size(175, 22)
        Me.ToolStripMenuItem10.Text = "Kopiere Alter String"
        '
        'ToolStripMenuItem11
        '
        Me.ToolStripMenuItem11.Name = "ToolStripMenuItem11"
        Me.ToolStripMenuItem11.Size = New System.Drawing.Size(175, 22)
        Me.ToolStripMenuItem11.Text = "Kopiere Neuer String"
        '
        'TabPage10
        '
        Me.TabPage10.Controls.Add(Me.lstFunction)
        Me.TabPage10.Location = New System.Drawing.Point(4, 25)
        Me.TabPage10.Name = "TabPage10"
        Me.TabPage10.Size = New System.Drawing.Size(658, 411)
        Me.TabPage10.TabIndex = 5
        Me.TabPage10.Text = "Function"
        Me.TabPage10.UseVisualStyleBackColor = True
        '
        'lstFunction
        '
        Me.lstFunction.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.ColumnHeader15, Me.ColumnHeader16})
        Me.lstFunction.ContextMenuStrip = Me.cmsFunction
        Me.lstFunction.FullRowSelect = True
        Me.lstFunction.GridLines = True
        Me.lstFunction.Location = New System.Drawing.Point(1, 3)
        Me.lstFunction.MultiSelect = False
        Me.lstFunction.Name = "lstFunction"
        Me.lstFunction.Size = New System.Drawing.Size(656, 376)
        Me.lstFunction.TabIndex = 15
        Me.lstFunction.UseCompatibleStateImageBehavior = False
        Me.lstFunction.View = System.Windows.Forms.View.Details
        '
        'ColumnHeader15
        '
        Me.ColumnHeader15.Text = "Alter Function:"
        Me.ColumnHeader15.Width = 326
        '
        'ColumnHeader16
        '
        Me.ColumnHeader16.Text = "Neuer Function:"
        Me.ColumnHeader16.Width = 324
        '
        'cmsFunction
        '
        Me.cmsFunction.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
        Me.cmsFunction.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripMenuItem12, Me.ToolStripMenuItem13})
        Me.cmsFunction.Name = "cmsVar"
        Me.cmsFunction.Size = New System.Drawing.Size(176, 48)
        '
        'ToolStripMenuItem12
        '
        Me.ToolStripMenuItem12.Name = "ToolStripMenuItem12"
        Me.ToolStripMenuItem12.Size = New System.Drawing.Size(175, 22)
        Me.ToolStripMenuItem12.Text = "Kopiere Alter String"
        '
        'ToolStripMenuItem13
        '
        Me.ToolStripMenuItem13.Name = "ToolStripMenuItem13"
        Me.ToolStripMenuItem13.Size = New System.Drawing.Size(175, 22)
        Me.ToolStripMenuItem13.Text = "Kopiere Neuer String"
        '
        'TabPage4
        '
        Me.TabPage4.BackColor = System.Drawing.SystemColors.Control
        Me.TabPage4.Controls.Add(Me.imgAbout)
        Me.TabPage4.ImageIndex = 3
        Me.TabPage4.Location = New System.Drawing.Point(4, 26)
        Me.TabPage4.Name = "TabPage4"
        Me.TabPage4.Size = New System.Drawing.Size(672, 446)
        Me.TabPage4.TabIndex = 3
        Me.TabPage4.Text = "About"
        '
        'imgAbout
        '
        Me.imgAbout.Dock = System.Windows.Forms.DockStyle.Fill
        Me.imgAbout.Image = Global.Suck_my_Source_Code.My.Resources.Resources.SP7UndetectorAboutScreen
        Me.imgAbout.Location = New System.Drawing.Point(0, 0)
        Me.imgAbout.Name = "imgAbout"
        Me.imgAbout.Size = New System.Drawing.Size(672, 446)
        Me.imgAbout.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.imgAbout.TabIndex = 0
        Me.imgAbout.TabStop = False
        '
        'ImageList1
        '
        Me.ImageList1.ImageStream = CType(resources.GetObject("ImageList1.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.ImageList1.TransparentColor = System.Drawing.Color.Transparent
        Me.ImageList1.Images.SetKeyName(0, "cog.png")
        Me.ImageList1.Images.SetKeyName(1, "cog_edit.png")
        Me.ImageList1.Images.SetKeyName(2, "cog_go.png")
        Me.ImageList1.Images.SetKeyName(3, "information.png")
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(680, 476)
        Me.Controls.Add(Me.TabControl1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.Name = "Form1"
        Me.Text = "Suck my Source Code by SP7"
        Me.TabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.TabPage1.PerformLayout()
        CType(Me.AnzahlProjekte, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage2.ResumeLayout(False)
        Me.GroupBox6.ResumeLayout(False)
        Me.GroupBox6.PerformLayout()
        Me.GroupBox7.ResumeLayout(False)
        CType(Me.imgIcon, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox5.ResumeLayout(False)
        Me.GroupBox5.PerformLayout()
        Me.GroupBox4.ResumeLayout(False)
        Me.GroupBox4.PerformLayout()
        Me.cmsJunkSubTrash.ResumeLayout(False)
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox3.PerformLayout()
        Me.cmsTrash.ResumeLayout(False)
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        CType(Me.imgStr, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage3.ResumeLayout(False)
        Me.TabControl2.ResumeLayout(False)
        Me.TabPage5.ResumeLayout(False)
        Me.cmsVar.ResumeLayout(False)
        Me.TabPage6.ResumeLayout(False)
        Me.cmsStr.ResumeLayout(False)
        Me.TabPage7.ResumeLayout(False)
        Me.cmsSub.ResumeLayout(False)
        Me.TabPage8.ResumeLayout(False)
        Me.cmsComment.ResumeLayout(False)
        Me.TabPage9.ResumeLayout(False)
        Me.cmsConst.ResumeLayout(False)
        Me.TabPage10.ResumeLayout(False)
        Me.cmsFunction.ResumeLayout(False)
        Me.TabPage4.ResumeLayout(False)
        CType(Me.imgAbout, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents btnOrginal As System.Windows.Forms.Button
    Friend WithEvents ListBox1 As System.Windows.Forms.ListBox
    Friend WithEvents ProgressBar1 As System.Windows.Forms.ProgressBar
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents ComboBoxTrash As System.Windows.Forms.ComboBox
    Friend WithEvents lstTrash As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader17 As System.Windows.Forms.ColumnHeader
    Friend WithEvents cbTrash As System.Windows.Forms.CheckBox
    Friend WithEvents PictureBox2 As System.Windows.Forms.PictureBox
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents imgStr As System.Windows.Forms.PictureBox
    Friend WithEvents TabPage3 As System.Windows.Forms.TabPage
    Friend WithEvents TabControl2 As System.Windows.Forms.TabControl
    Friend WithEvents TabPage5 As System.Windows.Forms.TabPage
    Friend WithEvents lstVar As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader2 As System.Windows.Forms.ColumnHeader
    Friend WithEvents TabPage6 As System.Windows.Forms.TabPage
    Friend WithEvents lstStr As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader3 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader4 As System.Windows.Forms.ColumnHeader
    Friend WithEvents TabPage7 As System.Windows.Forms.TabPage
    Friend WithEvents lstSub As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader5 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader6 As System.Windows.Forms.ColumnHeader
    Friend WithEvents TabPage8 As System.Windows.Forms.TabPage
    Friend WithEvents lstComment As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader7 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader8 As System.Windows.Forms.ColumnHeader
    Friend WithEvents TabPage9 As System.Windows.Forms.TabPage
    Friend WithEvents lstConst As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader11 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader12 As System.Windows.Forms.ColumnHeader
    Friend WithEvents TabPage10 As System.Windows.Forms.TabPage
    Friend WithEvents lstFunction As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader15 As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader16 As System.Windows.Forms.ColumnHeader
    Friend WithEvents TabPage4 As System.Windows.Forms.TabPage
    Friend WithEvents btnOpen As System.Windows.Forms.Button
    Friend WithEvents btnReplace As System.Windows.Forms.Button
    Friend WithEvents btnCopy As System.Windows.Forms.Button
    Friend WithEvents cbStr As System.Windows.Forms.CheckBox
    Friend WithEvents cbConst As System.Windows.Forms.CheckBox
    Friend WithEvents cbFunction As System.Windows.Forms.CheckBox
    Friend WithEvents cbComment As System.Windows.Forms.CheckBox
    Friend WithEvents cbVar As System.Windows.Forms.CheckBox
    Friend WithEvents cbSub As System.Windows.Forms.CheckBox
    Friend WithEvents rbBase64 As System.Windows.Forms.RadioButton
    Friend WithEvents rbRC4 As System.Windows.Forms.RadioButton
    Friend WithEvents rbXOR As System.Windows.Forms.RadioButton
    Friend WithEvents rbAES As System.Windows.Forms.RadioButton
    Friend WithEvents cmsTrash As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents AddTrashToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents RemoveTrashToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents cmsStr As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem2 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents cmsVar As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents KopiereAlteVariableToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents KopiereNeueVariableToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ImageList1 As System.Windows.Forms.ImageList
    Friend WithEvents ComboBoxTrashLevel As System.Windows.Forms.ComboBox
    Friend WithEvents RemoveAllToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents txtJunkSubTo As System.Windows.Forms.TextBox
    Friend WithEvents cbJunkSub As System.Windows.Forms.CheckBox
    Friend WithEvents lstJunkSubTrash As System.Windows.Forms.ListView
    Friend WithEvents ColumnHeader9 As System.Windows.Forms.ColumnHeader
    Friend WithEvents cmsJunkSubTrash As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ToolStripMenuItem3 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem4 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem5 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents imgAbout As System.Windows.Forms.PictureBox
    Friend WithEvents GroupBox5 As System.Windows.Forms.GroupBox
    Friend WithEvents cbAssemblyName As System.Windows.Forms.CheckBox
    Friend WithEvents cbFileInformation As System.Windows.Forms.CheckBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents AnzahlProjekte As System.Windows.Forms.NumericUpDown
    Friend WithEvents txtCode As System.Windows.Forms.TextBox
    Friend WithEvents cmsSub As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ToolStripMenuItem6 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem7 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents cmsComment As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ToolStripMenuItem8 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem9 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents cmsConst As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ToolStripMenuItem10 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem11 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents cmsFunction As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ToolStripMenuItem12 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem13 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents GroupBox6 As System.Windows.Forms.GroupBox
    Friend WithEvents cbIconChange As System.Windows.Forms.CheckBox
    Friend WithEvents btnIcon As System.Windows.Forms.Button
    Friend WithEvents GroupBox7 As System.Windows.Forms.GroupBox
    Friend WithEvents imgIcon As System.Windows.Forms.PictureBox
    Friend WithEvents txtIconPath As System.Windows.Forms.TextBox

End Class
