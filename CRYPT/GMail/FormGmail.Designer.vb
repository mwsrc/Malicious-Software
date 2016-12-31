<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FormGMail
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FormGMail))
        Dim DataGridViewCellStyle1 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle
        Me.GroupBoxGMailLogin = New System.Windows.Forms.GroupBox
        Me.ButtonCancel = New System.Windows.Forms.Button
        Me.ButtonSignin = New System.Windows.Forms.Button
        Me.TextBoxPassword = New System.Windows.Forms.TextBox
        Me.LabelPassword = New System.Windows.Forms.Label
        Me.TextBoxUsername = New System.Windows.Forms.TextBox
        Me.LabelUserName = New System.Windows.Forms.Label
        Me.DataGridViewGMail = New System.Windows.Forms.DataGridView
        Me.Colcontactname = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.Colemailaddress = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.StatusStripMain = New System.Windows.Forms.StatusStrip
        Me.PrgStatus = New System.Windows.Forms.ToolStripProgressBar
        Me.ToolStripStatusLabelBorderOne = New System.Windows.Forms.ToolStripStatusLabel
        Me.ToolStripStatusLabelDescription = New System.Windows.Forms.ToolStripStatusLabel
        Me.GroupBoxDetails = New System.Windows.Forms.GroupBox
        Me.ButtonDownload = New System.Windows.Forms.Button
        Me.TextBoxMost = New System.Windows.Forms.TextBox
        Me.LabelMost = New System.Windows.Forms.Label
        Me.TextBoxMy = New System.Windows.Forms.TextBox
        Me.LabelMy = New System.Windows.Forms.Label
        Me.WebBrowserGMail = New System.Windows.Forms.WebBrowser
        Me.GroupBoxGMailLogin.SuspendLayout()
        CType(Me.DataGridViewGMail, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.StatusStripMain.SuspendLayout()
        Me.GroupBoxDetails.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupBoxGMailLogin
        '
        Me.GroupBoxGMailLogin.BackgroundImage = CType(resources.GetObject("GroupBoxGMailLogin.BackgroundImage"), System.Drawing.Image)
        Me.GroupBoxGMailLogin.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.GroupBoxGMailLogin.Controls.Add(Me.ButtonCancel)
        Me.GroupBoxGMailLogin.Controls.Add(Me.ButtonSignin)
        Me.GroupBoxGMailLogin.Controls.Add(Me.TextBoxPassword)
        Me.GroupBoxGMailLogin.Controls.Add(Me.LabelPassword)
        Me.GroupBoxGMailLogin.Controls.Add(Me.TextBoxUsername)
        Me.GroupBoxGMailLogin.Controls.Add(Me.LabelUserName)
        Me.GroupBoxGMailLogin.Location = New System.Drawing.Point(8, 0)
        Me.GroupBoxGMailLogin.Name = "GroupBoxGMailLogin"
        Me.GroupBoxGMailLogin.Size = New System.Drawing.Size(472, 120)
        Me.GroupBoxGMailLogin.TabIndex = 0
        Me.GroupBoxGMailLogin.TabStop = False
        Me.GroupBoxGMailLogin.Text = "                                      Connect To GMail"
        '
        'ButtonCancel
        '
        Me.ButtonCancel.BackColor = System.Drawing.Color.FromArgb(CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer))
        Me.ButtonCancel.Font = New System.Drawing.Font("Verdana", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ButtonCancel.Location = New System.Drawing.Point(368, 80)
        Me.ButtonCancel.Name = "ButtonCancel"
        Me.ButtonCancel.Size = New System.Drawing.Size(96, 32)
        Me.ButtonCancel.TabIndex = 5
        Me.ButtonCancel.Text = "Cancel"
        Me.ButtonCancel.UseVisualStyleBackColor = False
        '
        'ButtonSignin
        '
        Me.ButtonSignin.BackColor = System.Drawing.Color.FromArgb(CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer))
        Me.ButtonSignin.Font = New System.Drawing.Font("Verdana", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ButtonSignin.Location = New System.Drawing.Point(264, 80)
        Me.ButtonSignin.Name = "ButtonSignin"
        Me.ButtonSignin.Size = New System.Drawing.Size(96, 32)
        Me.ButtonSignin.TabIndex = 4
        Me.ButtonSignin.Text = "Sign In"
        Me.ButtonSignin.UseVisualStyleBackColor = False
        '
        'TextBoxPassword
        '
        Me.TextBoxPassword.Font = New System.Drawing.Font("Wingdings 2", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.TextBoxPassword.ForeColor = System.Drawing.Color.Red
        Me.TextBoxPassword.Location = New System.Drawing.Point(200, 56)
        Me.TextBoxPassword.MaxLength = 1000
        Me.TextBoxPassword.Name = "TextBoxPassword"
        Me.TextBoxPassword.PasswordChar = Global.Microsoft.VisualBasic.ChrW(174)
        Me.TextBoxPassword.Size = New System.Drawing.Size(264, 23)
        Me.TextBoxPassword.TabIndex = 3
        '
        'LabelPassword
        '
        Me.LabelPassword.AutoSize = True
        Me.LabelPassword.Location = New System.Drawing.Point(128, 56)
        Me.LabelPassword.Name = "LabelPassword"
        Me.LabelPassword.Size = New System.Drawing.Size(65, 14)
        Me.LabelPassword.TabIndex = 2
        Me.LabelPassword.Text = "Password :"
        '
        'TextBoxUsername
        '
        Me.TextBoxUsername.Location = New System.Drawing.Point(200, 32)
        Me.TextBoxUsername.MaxLength = 1000
        Me.TextBoxUsername.Name = "TextBoxUsername"
        Me.TextBoxUsername.Size = New System.Drawing.Size(264, 22)
        Me.TextBoxUsername.TabIndex = 1
        '
        'LabelUserName
        '
        Me.LabelUserName.AutoSize = True
        Me.LabelUserName.Location = New System.Drawing.Point(128, 32)
        Me.LabelUserName.Name = "LabelUserName"
        Me.LabelUserName.Size = New System.Drawing.Size(69, 14)
        Me.LabelUserName.TabIndex = 0
        Me.LabelUserName.Text = "Username :"
        '
        'DataGridViewGMail
        '
        Me.DataGridViewGMail.AllowUserToAddRows = False
        Me.DataGridViewGMail.AllowUserToDeleteRows = False
        Me.DataGridViewGMail.AllowUserToResizeColumns = False
        Me.DataGridViewGMail.AllowUserToResizeRows = False
        DataGridViewCellStyle1.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(232, Byte), Integer))
        DataGridViewCellStyle1.Font = New System.Drawing.Font("Consolas", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DataGridViewGMail.AlternatingRowsDefaultCellStyle = DataGridViewCellStyle1
        Me.DataGridViewGMail.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.DataGridViewGMail.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.Raised
        Me.DataGridViewGMail.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridViewGMail.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.Colcontactname, Me.Colemailaddress})
        Me.DataGridViewGMail.EnableHeadersVisualStyles = False
        Me.DataGridViewGMail.GridColor = System.Drawing.Color.FromArgb(CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer))
        Me.DataGridViewGMail.Location = New System.Drawing.Point(8, 88)
        Me.DataGridViewGMail.MultiSelect = False
        Me.DataGridViewGMail.Name = "DataGridViewGMail"
        Me.DataGridViewGMail.RowHeadersWidth = 10
        Me.DataGridViewGMail.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.DisableResizing
        Me.DataGridViewGMail.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.CellSelect
        Me.DataGridViewGMail.Size = New System.Drawing.Size(456, 375)
        Me.DataGridViewGMail.TabIndex = 11
        Me.DataGridViewGMail.TabStop = False
        '
        'Colcontactname
        '
        Me.Colcontactname.HeaderText = "Name"
        Me.Colcontactname.MaxInputLength = 1000
        Me.Colcontactname.Name = "Colcontactname"
        Me.Colcontactname.Resizable = System.Windows.Forms.DataGridViewTriState.[False]
        Me.Colcontactname.Width = 180
        '
        'Colemailaddress
        '
        Me.Colemailaddress.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.Colemailaddress.HeaderText = "EMail Address {Default}"
        Me.Colemailaddress.MaxInputLength = 1000
        Me.Colemailaddress.Name = "Colemailaddress"
        '
        'StatusStripMain
        '
        Me.StatusStripMain.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.PrgStatus, Me.ToolStripStatusLabelBorderOne, Me.ToolStripStatusLabelDescription})
        Me.StatusStripMain.Location = New System.Drawing.Point(0, 598)
        Me.StatusStripMain.Name = "StatusStripMain"
        Me.StatusStripMain.Size = New System.Drawing.Size(487, 23)
        Me.StatusStripMain.TabIndex = 2
        Me.StatusStripMain.Text = "StatusStrip1"
        '
        'PrgStatus
        '
        Me.PrgStatus.BackColor = System.Drawing.Color.White
        Me.PrgStatus.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(150, Byte), Integer), CType(CType(250, Byte), Integer))
        Me.PrgStatus.Name = "PrgStatus"
        Me.PrgStatus.Size = New System.Drawing.Size(152, 17)
        Me.PrgStatus.Style = System.Windows.Forms.ProgressBarStyle.Continuous
        Me.PrgStatus.Value = 50
        '
        'ToolStripStatusLabelBorderOne
        '
        Me.ToolStripStatusLabelBorderOne.Name = "ToolStripStatusLabelBorderOne"
        Me.ToolStripStatusLabelBorderOne.Size = New System.Drawing.Size(42, 18)
        Me.ToolStripStatusLabelBorderOne.Text = "<< >>"
        Me.ToolStripStatusLabelBorderOne.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'ToolStripStatusLabelDescription
        '
        Me.ToolStripStatusLabelDescription.AutoSize = False
        Me.ToolStripStatusLabelDescription.BackColor = System.Drawing.Color.White
        Me.ToolStripStatusLabelDescription.BorderSides = CType((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom), System.Windows.Forms.ToolStripStatusLabelBorderSides)
        Me.ToolStripStatusLabelDescription.BorderStyle = System.Windows.Forms.Border3DStyle.SunkenInner
        Me.ToolStripStatusLabelDescription.Font = New System.Drawing.Font("Verdana", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ToolStripStatusLabelDescription.ForeColor = System.Drawing.Color.Red
        Me.ToolStripStatusLabelDescription.Name = "ToolStripStatusLabelDescription"
        Me.ToolStripStatusLabelDescription.Size = New System.Drawing.Size(149, 18)
        Me.ToolStripStatusLabelDescription.Text = "ToolStripStatusLabel1"
        '
        'GroupBoxDetails
        '
        Me.GroupBoxDetails.Controls.Add(Me.ButtonDownload)
        Me.GroupBoxDetails.Controls.Add(Me.TextBoxMost)
        Me.GroupBoxDetails.Controls.Add(Me.LabelMost)
        Me.GroupBoxDetails.Controls.Add(Me.DataGridViewGMail)
        Me.GroupBoxDetails.Controls.Add(Me.TextBoxMy)
        Me.GroupBoxDetails.Controls.Add(Me.LabelMy)
        Me.GroupBoxDetails.Controls.Add(Me.WebBrowserGMail)
        Me.GroupBoxDetails.Location = New System.Drawing.Point(8, 120)
        Me.GroupBoxDetails.Name = "GroupBoxDetails"
        Me.GroupBoxDetails.Size = New System.Drawing.Size(472, 472)
        Me.GroupBoxDetails.TabIndex = 6
        Me.GroupBoxDetails.TabStop = False
        Me.GroupBoxDetails.Text = "Details"
        '
        'ButtonDownload
        '
        Me.ButtonDownload.BackColor = System.Drawing.Color.FromArgb(CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer))
        Me.ButtonDownload.Font = New System.Drawing.Font("Verdana", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ButtonDownload.Location = New System.Drawing.Point(8, 16)
        Me.ButtonDownload.Name = "ButtonDownload"
        Me.ButtonDownload.Size = New System.Drawing.Size(456, 32)
        Me.ButtonDownload.TabIndex = 13
        Me.ButtonDownload.Text = "Download"
        Me.ButtonDownload.UseVisualStyleBackColor = False
        '
        'TextBoxMost
        '
        Me.TextBoxMost.BackColor = System.Drawing.Color.White
        Me.TextBoxMost.Font = New System.Drawing.Font("Verdana", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.TextBoxMost.ForeColor = System.Drawing.Color.Red
        Me.TextBoxMost.Location = New System.Drawing.Point(344, 56)
        Me.TextBoxMost.MaxLength = 10
        Me.TextBoxMost.Name = "TextBoxMost"
        Me.TextBoxMost.ReadOnly = True
        Me.TextBoxMost.Size = New System.Drawing.Size(112, 23)
        Me.TextBoxMost.TabIndex = 10
        Me.TextBoxMost.TabStop = False
        Me.TextBoxMost.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'LabelMost
        '
        Me.LabelMost.AutoSize = True
        Me.LabelMost.Font = New System.Drawing.Font("Verdana", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelMost.Location = New System.Drawing.Point(224, 56)
        Me.LabelMost.Name = "LabelMost"
        Me.LabelMost.Size = New System.Drawing.Size(114, 16)
        Me.LabelMost.TabIndex = 9
        Me.LabelMost.Text = "Most Contacted"
        '
        'TextBoxMy
        '
        Me.TextBoxMy.BackColor = System.Drawing.Color.White
        Me.TextBoxMy.Font = New System.Drawing.Font("Verdana", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.TextBoxMy.ForeColor = System.Drawing.Color.Red
        Me.TextBoxMy.Location = New System.Drawing.Point(104, 56)
        Me.TextBoxMy.MaxLength = 10
        Me.TextBoxMy.Name = "TextBoxMy"
        Me.TextBoxMy.ReadOnly = True
        Me.TextBoxMy.Size = New System.Drawing.Size(112, 23)
        Me.TextBoxMy.TabIndex = 8
        Me.TextBoxMy.TabStop = False
        Me.TextBoxMy.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'LabelMy
        '
        Me.LabelMy.AutoSize = True
        Me.LabelMy.Font = New System.Drawing.Font("Verdana", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelMy.Location = New System.Drawing.Point(8, 56)
        Me.LabelMy.Name = "LabelMy"
        Me.LabelMy.Size = New System.Drawing.Size(92, 16)
        Me.LabelMy.TabIndex = 7
        Me.LabelMy.Text = "My Contacts"
        '
        'WebBrowserGMail
        '
        Me.WebBrowserGMail.Location = New System.Drawing.Point(16, 112)
        Me.WebBrowserGMail.MinimumSize = New System.Drawing.Size(20, 20)
        Me.WebBrowserGMail.Name = "WebBrowserGMail"
        Me.WebBrowserGMail.Size = New System.Drawing.Size(440, 336)
        Me.WebBrowserGMail.TabIndex = 12
        Me.WebBrowserGMail.TabStop = False
        '
        'FormGMail
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 14.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.FromArgb(CType(CType(245, Byte), Integer), CType(CType(251, Byte), Integer), CType(CType(251, Byte), Integer))
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.ClientSize = New System.Drawing.Size(487, 621)
        Me.Controls.Add(Me.GroupBoxDetails)
        Me.Controls.Add(Me.StatusStripMain)
        Me.Controls.Add(Me.GroupBoxGMailLogin)
        Me.Font = New System.Drawing.Font("Calibri", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.Name = "FormGMail"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Download GMail Contact List"
        Me.GroupBoxGMailLogin.ResumeLayout(False)
        Me.GroupBoxGMailLogin.PerformLayout()
        CType(Me.DataGridViewGMail, System.ComponentModel.ISupportInitialize).EndInit()
        Me.StatusStripMain.ResumeLayout(False)
        Me.StatusStripMain.PerformLayout()
        Me.GroupBoxDetails.ResumeLayout(False)
        Me.GroupBoxDetails.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents GroupBoxGMailLogin As System.Windows.Forms.GroupBox
    Friend WithEvents TextBoxUsername As System.Windows.Forms.TextBox
    Friend WithEvents LabelUserName As System.Windows.Forms.Label
    Friend WithEvents TextBoxPassword As System.Windows.Forms.TextBox
    Friend WithEvents LabelPassword As System.Windows.Forms.Label
    Friend WithEvents ButtonCancel As System.Windows.Forms.Button
    Friend WithEvents ButtonSignin As System.Windows.Forms.Button
    Friend WithEvents DataGridViewGMail As System.Windows.Forms.DataGridView
    Friend WithEvents StatusStripMain As System.Windows.Forms.StatusStrip
    Friend WithEvents PrgStatus As System.Windows.Forms.ToolStripProgressBar
    Friend WithEvents GroupBoxDetails As System.Windows.Forms.GroupBox
    Friend WithEvents TextBoxMost As System.Windows.Forms.TextBox
    Friend WithEvents LabelMost As System.Windows.Forms.Label
    Friend WithEvents TextBoxMy As System.Windows.Forms.TextBox
    Friend WithEvents LabelMy As System.Windows.Forms.Label
    Friend WithEvents Colcontactname As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Colemailaddress As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents WebBrowserGMail As System.Windows.Forms.WebBrowser
    Friend WithEvents ToolStripStatusLabelBorderOne As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents ToolStripStatusLabelDescription As System.Windows.Forms.ToolStripStatusLabel

    Private Sub FormGMail_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing

        WebBrowserGMail.Dispose()

    End Sub
    Friend WithEvents ButtonDownload As System.Windows.Forms.Button

End Class
