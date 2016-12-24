<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip()
        Me.ToolStripStatusLabel1 = New System.Windows.Forms.ToolStripStatusLabel()
        Me.cmdstop = New System.Windows.Forms.Button()
        Me.cmdUnload = New System.Windows.Forms.Button()
        Me.cmdstart = New System.Windows.Forms.Button()
        Me.lstfsites = New System.Windows.Forms.ListView()
        Me.Directory = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.ColumnHeader1 = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.Label1 = New System.Windows.Forms.Label()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.txttarget = New System.Windows.Forms.TextBox()
        Me.w_flinks = New System.ComponentModel.BackgroundWorker()
        Me.StatusStrip1.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'StatusStrip1
        '
        Me.StatusStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripStatusLabel1})
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 394)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.Size = New System.Drawing.Size(528, 22)
        Me.StatusStrip1.TabIndex = 0
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'ToolStripStatusLabel1
        '
        Me.ToolStripStatusLabel1.Name = "ToolStripStatusLabel1"
        Me.ToolStripStatusLabel1.Size = New System.Drawing.Size(39, 17)
        Me.ToolStripStatusLabel1.Text = "Status"
        '
        'cmdstop
        '
        Me.cmdstop.Enabled = False
        Me.cmdstop.FlatAppearance.BorderSize = 0
        Me.cmdstop.FlatAppearance.MouseDownBackColor = System.Drawing.Color.White
        Me.cmdstop.FlatAppearance.MouseOverBackColor = System.Drawing.Color.White
        Me.cmdstop.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdstop.Font = New System.Drawing.Font("Courier New", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdstop.Location = New System.Drawing.Point(94, 167)
        Me.cmdstop.Name = "cmdstop"
        Me.cmdstop.Size = New System.Drawing.Size(66, 25)
        Me.cmdstop.TabIndex = 1
        Me.cmdstop.Text = "S&top"
        Me.cmdstop.UseVisualStyleBackColor = True
        '
        'cmdUnload
        '
        Me.cmdUnload.FlatAppearance.BorderSize = 0
        Me.cmdUnload.FlatAppearance.MouseDownBackColor = System.Drawing.Color.White
        Me.cmdUnload.FlatAppearance.MouseOverBackColor = System.Drawing.Color.White
        Me.cmdUnload.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdUnload.Font = New System.Drawing.Font("Courier New", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdUnload.Location = New System.Drawing.Point(166, 167)
        Me.cmdUnload.Name = "cmdUnload"
        Me.cmdUnload.Size = New System.Drawing.Size(79, 24)
        Me.cmdUnload.TabIndex = 2
        Me.cmdUnload.Text = "&Close"
        Me.cmdUnload.UseVisualStyleBackColor = True
        '
        'cmdstart
        '
        Me.cmdstart.FlatAppearance.BorderSize = 0
        Me.cmdstart.FlatAppearance.MouseDownBackColor = System.Drawing.Color.White
        Me.cmdstart.FlatAppearance.MouseOverBackColor = System.Drawing.Color.White
        Me.cmdstart.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdstart.Font = New System.Drawing.Font("Courier New", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdstart.Location = New System.Drawing.Point(12, 167)
        Me.cmdstart.Name = "cmdstart"
        Me.cmdstart.Size = New System.Drawing.Size(79, 24)
        Me.cmdstart.TabIndex = 3
        Me.cmdstart.Text = "&Scan"
        Me.cmdstart.UseVisualStyleBackColor = True
        '
        'lstfsites
        '
        Me.lstfsites.Activation = System.Windows.Forms.ItemActivation.OneClick
        Me.lstfsites.BackColor = System.Drawing.Color.White
        Me.lstfsites.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lstfsites.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.Directory, Me.ColumnHeader1})
        Me.lstfsites.FullRowSelect = True
        Me.lstfsites.HideSelection = False
        Me.lstfsites.HoverSelection = True
        Me.lstfsites.Location = New System.Drawing.Point(12, 197)
        Me.lstfsites.Name = "lstfsites"
        Me.lstfsites.Size = New System.Drawing.Size(503, 194)
        Me.lstfsites.TabIndex = 4
        Me.lstfsites.UseCompatibleStateImageBehavior = False
        Me.lstfsites.View = System.Windows.Forms.View.Details
        '
        'Directory
        '
        Me.Directory.Text = "Directory"
        Me.Directory.Width = 295
        '
        'ColumnHeader1
        '
        Me.ColumnHeader1.Text = "Response"
        Me.ColumnHeader1.Width = 198
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Courier New", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(12, 116)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(64, 16)
        Me.Label1.TabIndex = 5
        Me.Label1.Text = "Target:"
        '
        'PictureBox1
        '
        Me.PictureBox1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.PictureBox1.Image = CType(resources.GetObject("PictureBox1.Image"), System.Drawing.Image)
        Me.PictureBox1.Location = New System.Drawing.Point(0, 0)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(527, 113)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox1.TabIndex = 6
        Me.PictureBox1.TabStop = False
        '
        'txttarget
        '
        Me.txttarget.Font = New System.Drawing.Font("Courier New", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txttarget.Location = New System.Drawing.Point(12, 135)
        Me.txttarget.Name = "txttarget"
        Me.txttarget.Size = New System.Drawing.Size(503, 26)
        Me.txttarget.TabIndex = 7
        Me.txttarget.Text = "http://victim.com/startdirectory/"
        '
        'w_flinks
        '
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(528, 416)
        Me.Controls.Add(Me.txttarget)
        Me.Controls.Add(Me.PictureBox1)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.lstfsites)
        Me.Controls.Add(Me.cmdstart)
        Me.Controls.Add(Me.cmdUnload)
        Me.Controls.Add(Me.cmdstop)
        Me.Controls.Add(Me.StatusStrip1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.Name = "Form1"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Login Finder"
        Me.StatusStrip1.ResumeLayout(False)
        Me.StatusStrip1.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents ToolStripStatusLabel1 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents cmdstop As System.Windows.Forms.Button
    Friend WithEvents cmdUnload As System.Windows.Forms.Button
    Friend WithEvents cmdstart As System.Windows.Forms.Button
    Friend WithEvents lstfsites As System.Windows.Forms.ListView
    Friend WithEvents Directory As System.Windows.Forms.ColumnHeader
    Friend WithEvents ColumnHeader1 As System.Windows.Forms.ColumnHeader
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents txttarget As System.Windows.Forms.TextBox
    Friend WithEvents w_flinks As System.ComponentModel.BackgroundWorker

End Class
