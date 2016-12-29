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
        Me.components = New System.ComponentModel.Container
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.GroupPanel1 = New DevComponents.DotNetBar.Controls.GroupPanel
        Me.ContextMenuStrip1 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.StartToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.StopToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.MinimizeToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.ExitToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.ProgressBar1 = New DevComponents.DotNetBar.Controls.ProgressBarX
        Me.GroupBox3 = New System.Windows.Forms.GroupBox
        Me.Label6 = New System.Windows.Forms.Label
        Me.TextBoxX5 = New DevComponents.DotNetBar.Controls.TextBoxX
        Me.Label5 = New System.Windows.Forms.Label
        Me.TextBoxX4 = New DevComponents.DotNetBar.Controls.TextBoxX
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.IntegerInput1 = New DevComponents.Editors.IntegerInput
        Me.Label4 = New System.Windows.Forms.Label
        Me.RadioButton3 = New System.Windows.Forms.RadioButton
        Me.RadioButton2 = New System.Windows.Forms.RadioButton
        Me.RadioButton1 = New System.Windows.Forms.RadioButton
        Me.CheckBoxX1 = New DevComponents.DotNetBar.Controls.CheckBoxX
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.TextBoxX3 = New DevComponents.DotNetBar.Controls.TextBoxX
        Me.TextBoxX1 = New DevComponents.DotNetBar.Controls.TextBoxX
        Me.TextBoxX2 = New DevComponents.DotNetBar.Controls.TextBoxX
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label1 = New System.Windows.Forms.Label
        Me.BackgroundWorker1 = New System.ComponentModel.BackgroundWorker
        Me.GroupPanel1.SuspendLayout()
        Me.ContextMenuStrip1.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        CType(Me.IntegerInput1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupPanel1
        '
        Me.GroupPanel1.BackColor = System.Drawing.Color.Transparent
        Me.GroupPanel1.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel1.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel1.ContextMenuStrip = Me.ContextMenuStrip1
        Me.GroupPanel1.Controls.Add(Me.ProgressBar1)
        Me.GroupPanel1.Controls.Add(Me.GroupBox3)
        Me.GroupPanel1.Controls.Add(Me.GroupBox2)
        Me.GroupPanel1.Controls.Add(Me.GroupBox1)
        Me.GroupPanel1.Location = New System.Drawing.Point(52, 28)
        Me.GroupPanel1.Name = "GroupPanel1"
        Me.GroupPanel1.Size = New System.Drawing.Size(403, 361)
        '
        '
        '
        Me.GroupPanel1.Style.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2
        Me.GroupPanel1.Style.BackColorGradientAngle = 90
        Me.GroupPanel1.Style.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground
        Me.GroupPanel1.Style.BorderBottom = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel1.Style.BorderBottomWidth = 1
        Me.GroupPanel1.Style.BorderColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBorder
        Me.GroupPanel1.Style.BorderLeft = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel1.Style.BorderLeftWidth = 1
        Me.GroupPanel1.Style.BorderRight = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel1.Style.BorderRightWidth = 1
        Me.GroupPanel1.Style.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel1.Style.BorderTopWidth = 1
        Me.GroupPanel1.Style.CornerDiameter = 4
        Me.GroupPanel1.Style.CornerType = DevComponents.DotNetBar.eCornerType.Rounded
        Me.GroupPanel1.Style.TextAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Center
        Me.GroupPanel1.Style.TextColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelText
        Me.GroupPanel1.Style.TextLineAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Near
        Me.GroupPanel1.TabIndex = 0
        Me.GroupPanel1.Text = "Hotmail Bomber By: Nathan72389"
        '
        'ContextMenuStrip1
        '
        Me.ContextMenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.StartToolStripMenuItem, Me.StopToolStripMenuItem, Me.MinimizeToolStripMenuItem, Me.ExitToolStripMenuItem})
        Me.ContextMenuStrip1.Name = "ContextMenuStrip1"
        Me.ContextMenuStrip1.Size = New System.Drawing.Size(125, 92)
        '
        'StartToolStripMenuItem
        '
        Me.StartToolStripMenuItem.Name = "StartToolStripMenuItem"
        Me.StartToolStripMenuItem.Size = New System.Drawing.Size(124, 22)
        Me.StartToolStripMenuItem.Text = "Start"
        '
        'StopToolStripMenuItem
        '
        Me.StopToolStripMenuItem.Name = "StopToolStripMenuItem"
        Me.StopToolStripMenuItem.Size = New System.Drawing.Size(124, 22)
        Me.StopToolStripMenuItem.Text = "Stop"
        '
        'MinimizeToolStripMenuItem
        '
        Me.MinimizeToolStripMenuItem.Name = "MinimizeToolStripMenuItem"
        Me.MinimizeToolStripMenuItem.Size = New System.Drawing.Size(124, 22)
        Me.MinimizeToolStripMenuItem.Text = "Minimize"
        '
        'ExitToolStripMenuItem
        '
        Me.ExitToolStripMenuItem.Name = "ExitToolStripMenuItem"
        Me.ExitToolStripMenuItem.Size = New System.Drawing.Size(124, 22)
        Me.ExitToolStripMenuItem.Text = "Exit"
        '
        'ProgressBar1
        '
        '
        '
        '
        Me.ProgressBar1.BackgroundStyle.BackColorBlend.AddRange(New DevComponents.DotNetBar.BackgroundColorBlend() {New DevComponents.DotNetBar.BackgroundColorBlend(System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer)), 0.0!), New DevComponents.DotNetBar.BackgroundColorBlend(System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(192, Byte), Integer), CType(CType(192, Byte), Integer)), 0.0!)})
        Me.ProgressBar1.Enabled = False
        Me.ProgressBar1.Location = New System.Drawing.Point(3, 308)
        Me.ProgressBar1.Name = "ProgressBar1"
        Me.ProgressBar1.Size = New System.Drawing.Size(384, 23)
        Me.ProgressBar1.TabIndex = 1
        Me.ProgressBar1.Text = "Bombing!"
        '
        'GroupBox3
        '
        Me.GroupBox3.BackColor = System.Drawing.Color.Transparent
        Me.GroupBox3.Controls.Add(Me.Label6)
        Me.GroupBox3.Controls.Add(Me.TextBoxX5)
        Me.GroupBox3.Controls.Add(Me.Label5)
        Me.GroupBox3.Controls.Add(Me.TextBoxX4)
        Me.GroupBox3.Location = New System.Drawing.Point(187, 3)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(200, 299)
        Me.GroupBox3.TabIndex = 3
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "Mail"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(6, 55)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(53, 13)
        Me.Label6.TabIndex = 9
        Me.Label6.Text = "Message:"
        '
        'TextBoxX5
        '
        Me.TextBoxX5.BackColor = System.Drawing.Color.AliceBlue
        '
        '
        '
        Me.TextBoxX5.Border.Class = "TextBoxBorder"
        Me.TextBoxX5.Location = New System.Drawing.Point(6, 32)
        Me.TextBoxX5.Name = "TextBoxX5"
        Me.TextBoxX5.Size = New System.Drawing.Size(188, 20)
        Me.TextBoxX5.TabIndex = 8
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(6, 16)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(46, 13)
        Me.Label5.TabIndex = 7
        Me.Label5.Text = "Subject:"
        '
        'TextBoxX4
        '
        Me.TextBoxX4.BackColor = System.Drawing.Color.AliceBlue
        '
        '
        '
        Me.TextBoxX4.Border.Class = "TextBoxBorder"
        Me.TextBoxX4.Location = New System.Drawing.Point(6, 71)
        Me.TextBoxX4.Multiline = True
        Me.TextBoxX4.Name = "TextBoxX4"
        Me.TextBoxX4.Size = New System.Drawing.Size(188, 222)
        Me.TextBoxX4.TabIndex = 9
        '
        'GroupBox2
        '
        Me.GroupBox2.BackColor = System.Drawing.Color.Transparent
        Me.GroupBox2.Controls.Add(Me.IntegerInput1)
        Me.GroupBox2.Controls.Add(Me.Label4)
        Me.GroupBox2.Controls.Add(Me.RadioButton3)
        Me.GroupBox2.Controls.Add(Me.RadioButton2)
        Me.GroupBox2.Controls.Add(Me.RadioButton1)
        Me.GroupBox2.Controls.Add(Me.CheckBoxX1)
        Me.GroupBox2.Location = New System.Drawing.Point(3, 152)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(178, 150)
        Me.GroupBox2.TabIndex = 3
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Options"
        '
        'IntegerInput1
        '
        Me.IntegerInput1.BackColor = System.Drawing.Color.AliceBlue
        '
        '
        '
        Me.IntegerInput1.BackgroundStyle.BackColor = System.Drawing.Color.AliceBlue
        Me.IntegerInput1.BackgroundStyle.Class = "DateTimeInputBackground"
        Me.IntegerInput1.Colors.Highlight = System.Drawing.Color.AliceBlue
        Me.IntegerInput1.Colors.HighlightText = System.Drawing.Color.Black
        Me.IntegerInput1.DisabledBackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.IntegerInput1.Location = New System.Drawing.Point(12, 114)
        Me.IntegerInput1.MaxValue = 9999
        Me.IntegerInput1.MinValue = 1
        Me.IntegerInput1.Name = "IntegerInput1"
        Me.IntegerInput1.ShowUpDown = True
        Me.IntegerInput1.Size = New System.Drawing.Size(80, 20)
        Me.IntegerInput1.TabIndex = 7
        Me.IntegerInput1.Value = 1
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(91, 117)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(54, 13)
        Me.Label4.TabIndex = 3
        Me.Label4.Text = "-Ammount"
        '
        'RadioButton3
        '
        Me.RadioButton3.AutoSize = True
        Me.RadioButton3.Checked = True
        Me.RadioButton3.Location = New System.Drawing.Point(12, 94)
        Me.RadioButton3.Name = "RadioButton3"
        Me.RadioButton3.Size = New System.Drawing.Size(81, 17)
        Me.RadioButton3.TabIndex = 6
        Me.RadioButton3.TabStop = True
        Me.RadioButton3.Text = "High Priority"
        Me.RadioButton3.UseVisualStyleBackColor = True
        '
        'RadioButton2
        '
        Me.RadioButton2.AutoSize = True
        Me.RadioButton2.Location = New System.Drawing.Point(12, 71)
        Me.RadioButton2.Name = "RadioButton2"
        Me.RadioButton2.Size = New System.Drawing.Size(92, 17)
        Me.RadioButton2.TabIndex = 5
        Me.RadioButton2.Text = "Normal Priority"
        Me.RadioButton2.UseVisualStyleBackColor = True
        '
        'RadioButton1
        '
        Me.RadioButton1.AutoSize = True
        Me.RadioButton1.Location = New System.Drawing.Point(12, 48)
        Me.RadioButton1.Name = "RadioButton1"
        Me.RadioButton1.Size = New System.Drawing.Size(79, 17)
        Me.RadioButton1.TabIndex = 4
        Me.RadioButton1.Text = "Low Priority"
        Me.RadioButton1.UseVisualStyleBackColor = True
        '
        'CheckBoxX1
        '
        Me.CheckBoxX1.Location = New System.Drawing.Point(9, 19)
        Me.CheckBoxX1.Name = "CheckBoxX1"
        Me.CheckBoxX1.Size = New System.Drawing.Size(91, 23)
        Me.CheckBoxX1.TabIndex = 3
        Me.CheckBoxX1.Text = "Html Format"
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.Color.Transparent
        Me.GroupBox1.ContextMenuStrip = Me.ContextMenuStrip1
        Me.GroupBox1.Controls.Add(Me.TextBoxX3)
        Me.GroupBox1.Controls.Add(Me.TextBoxX1)
        Me.GroupBox1.Controls.Add(Me.TextBoxX2)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Location = New System.Drawing.Point(3, 3)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(178, 143)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Information"
        '
        'TextBoxX3
        '
        Me.TextBoxX3.BackColor = System.Drawing.Color.AliceBlue
        '
        '
        '
        Me.TextBoxX3.Border.Class = "TextBoxBorder"
        Me.TextBoxX3.Location = New System.Drawing.Point(9, 110)
        Me.TextBoxX3.Name = "TextBoxX3"
        Me.TextBoxX3.Size = New System.Drawing.Size(163, 20)
        Me.TextBoxX3.TabIndex = 2
        '
        'TextBoxX1
        '
        Me.TextBoxX1.BackColor = System.Drawing.Color.AliceBlue
        '
        '
        '
        Me.TextBoxX1.Border.Class = "TextBoxBorder"
        Me.TextBoxX1.Location = New System.Drawing.Point(9, 32)
        Me.TextBoxX1.Name = "TextBoxX1"
        Me.TextBoxX1.Size = New System.Drawing.Size(163, 20)
        Me.TextBoxX1.TabIndex = 0
        '
        'TextBoxX2
        '
        Me.TextBoxX2.BackColor = System.Drawing.Color.AliceBlue
        '
        '
        '
        Me.TextBoxX2.Border.Class = "TextBoxBorder"
        Me.TextBoxX2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.TextBoxX2.Location = New System.Drawing.Point(9, 71)
        Me.TextBoxX2.Name = "TextBoxX2"
        Me.TextBoxX2.PasswordChar = Global.Microsoft.VisualBasic.ChrW(8226)
        Me.TextBoxX2.Size = New System.Drawing.Size(163, 20)
        Me.TextBoxX2.TabIndex = 1
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(6, 94)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(109, 13)
        Me.Label3.TabIndex = 4
        Me.Label3.Text = "Your Victims Address:"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(6, 55)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(119, 13)
        Me.Label2.TabIndex = 2
        Me.Label2.Text = "Your Hotmail Password:"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(6, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(111, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Your Hotmail Address:"
        '
        'BackgroundWorker1
        '
        Me.BackgroundWorker1.WorkerReportsProgress = True
        Me.BackgroundWorker1.WorkerSupportsCancellation = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink
        Me.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.ClientSize = New System.Drawing.Size(492, 424)
        Me.ControlBox = False
        Me.Controls.Add(Me.GroupPanel1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Form1"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Hotmail Email Bomber"
        Me.TransparencyKey = System.Drawing.SystemColors.ActiveCaption
        Me.GroupPanel1.ResumeLayout(False)
        Me.ContextMenuStrip1.ResumeLayout(False)
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox3.PerformLayout()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        CType(Me.IntegerInput1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GroupPanel1 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents ContextMenuStrip1 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents StartToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents StopToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MinimizeToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ExitToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents TextBoxX3 As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents TextBoxX1 As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents TextBoxX2 As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents CheckBoxX1 As DevComponents.DotNetBar.Controls.CheckBoxX
    Friend WithEvents RadioButton3 As System.Windows.Forms.RadioButton
    Friend WithEvents RadioButton2 As System.Windows.Forms.RadioButton
    Friend WithEvents RadioButton1 As System.Windows.Forms.RadioButton
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents TextBoxX4 As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents IntegerInput1 As DevComponents.Editors.IntegerInput
    Friend WithEvents BackgroundWorker1 As System.ComponentModel.BackgroundWorker
    Friend WithEvents ProgressBar1 As DevComponents.DotNetBar.Controls.ProgressBarX
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents TextBoxX5 As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents Label5 As System.Windows.Forms.Label

End Class
