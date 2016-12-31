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
        Me.TextFile = New System.Windows.Forms.TextBox
        Me.BtnBrowse = New System.Windows.Forms.Button
        Me.BtnCtypt = New System.Windows.Forms.Button
        Me.OpenFileDialog1 = New System.Windows.Forms.OpenFileDialog
        Me.CheckIcon = New System.Windows.Forms.CheckBox
        Me.TextIcon = New System.Windows.Forms.TextBox
        Me.BtnIcon = New System.Windows.Forms.Button
        Me.CheckClone = New System.Windows.Forms.CheckBox
        Me.TextClone = New System.Windows.Forms.TextBox
        Me.BtnClone = New System.Windows.Forms.Button
        Me.Label1 = New System.Windows.Forms.Label
        Me.TextEnc = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.CheckDES = New System.Windows.Forms.RadioButton
        Me.CheckRC4 = New System.Windows.Forms.RadioButton
        Me.GroupBox3 = New System.Windows.Forms.GroupBox
        Me.TextProc = New System.Windows.Forms.TextBox
        Me.CheckInject = New System.Windows.Forms.CheckBox
        Me.CheckAntis = New System.Windows.Forms.CheckBox
        Me.GroupBox4 = New System.Windows.Forms.GroupBox
        Me.BtnBind = New System.Windows.Forms.Button
        Me.TextBind = New System.Windows.Forms.TextBox
        Me.CheckBind = New System.Windows.Forms.CheckBox
        Me.CheckBytes = New System.Windows.Forms.CheckBox
        Me.TextBytes = New System.Windows.Forms.TextBox
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        Me.SuspendLayout()
        '
        'TextFile
        '
        Me.TextFile.Location = New System.Drawing.Point(23, 53)
        Me.TextFile.Name = "TextFile"
        Me.TextFile.Size = New System.Drawing.Size(237, 20)
        Me.TextFile.TabIndex = 0
        '
        'BtnBrowse
        '
        Me.BtnBrowse.ForeColor = System.Drawing.Color.Black
        Me.BtnBrowse.Location = New System.Drawing.Point(274, 53)
        Me.BtnBrowse.Name = "BtnBrowse"
        Me.BtnBrowse.Size = New System.Drawing.Size(47, 20)
        Me.BtnBrowse.TabIndex = 1
        Me.BtnBrowse.Text = "..."
        Me.BtnBrowse.UseVisualStyleBackColor = True
        '
        'BtnCtypt
        '
        Me.BtnCtypt.Location = New System.Drawing.Point(611, 286)
        Me.BtnCtypt.Name = "BtnCtypt"
        Me.BtnCtypt.Size = New System.Drawing.Size(77, 50)
        Me.BtnCtypt.TabIndex = 2
        Me.BtnCtypt.Text = "Crypt"
        Me.BtnCtypt.UseVisualStyleBackColor = True
        '
        'OpenFileDialog1
        '
        Me.OpenFileDialog1.FileName = "OpenFileDialog1"
        '
        'CheckIcon
        '
        Me.CheckIcon.AutoSize = True
        Me.CheckIcon.BackColor = System.Drawing.Color.Transparent
        Me.CheckIcon.ForeColor = System.Drawing.Color.White
        Me.CheckIcon.Location = New System.Drawing.Point(21, 92)
        Me.CheckIcon.Name = "CheckIcon"
        Me.CheckIcon.Size = New System.Drawing.Size(87, 17)
        Me.CheckIcon.TabIndex = 4
        Me.CheckIcon.Text = "Change Icon"
        Me.CheckIcon.UseVisualStyleBackColor = False
        '
        'TextIcon
        '
        Me.TextIcon.Location = New System.Drawing.Point(20, 115)
        Me.TextIcon.Name = "TextIcon"
        Me.TextIcon.Size = New System.Drawing.Size(237, 20)
        Me.TextIcon.TabIndex = 6
        '
        'BtnIcon
        '
        Me.BtnIcon.ForeColor = System.Drawing.Color.Black
        Me.BtnIcon.Location = New System.Drawing.Point(273, 115)
        Me.BtnIcon.Name = "BtnIcon"
        Me.BtnIcon.Size = New System.Drawing.Size(45, 19)
        Me.BtnIcon.TabIndex = 8
        Me.BtnIcon.Text = "..."
        Me.BtnIcon.UseVisualStyleBackColor = True
        '
        'CheckClone
        '
        Me.CheckClone.AutoSize = True
        Me.CheckClone.BackColor = System.Drawing.Color.Transparent
        Me.CheckClone.ForeColor = System.Drawing.Color.White
        Me.CheckClone.Location = New System.Drawing.Point(21, 30)
        Me.CheckClone.Name = "CheckClone"
        Me.CheckClone.Size = New System.Drawing.Size(91, 17)
        Me.CheckClone.TabIndex = 10
        Me.CheckClone.Text = "Clone with file"
        Me.CheckClone.UseVisualStyleBackColor = False
        '
        'TextClone
        '
        Me.TextClone.Location = New System.Drawing.Point(21, 53)
        Me.TextClone.Name = "TextClone"
        Me.TextClone.Size = New System.Drawing.Size(234, 20)
        Me.TextClone.TabIndex = 11
        '
        'BtnClone
        '
        Me.BtnClone.ForeColor = System.Drawing.Color.Black
        Me.BtnClone.Location = New System.Drawing.Point(273, 53)
        Me.BtnClone.Name = "BtnClone"
        Me.BtnClone.Size = New System.Drawing.Size(46, 19)
        Me.BtnClone.TabIndex = 12
        Me.BtnClone.Text = "..."
        Me.BtnClone.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.BackColor = System.Drawing.Color.Transparent
        Me.Label1.ForeColor = System.Drawing.Color.White
        Me.Label1.Location = New System.Drawing.Point(20, 28)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(67, 13)
        Me.Label1.TabIndex = 13
        Me.Label1.Text = "File to crypt :"
        '
        'TextEnc
        '
        Me.TextEnc.Location = New System.Drawing.Point(120, 53)
        Me.TextEnc.Name = "TextEnc"
        Me.TextEnc.Size = New System.Drawing.Size(73, 20)
        Me.TextEnc.TabIndex = 14
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.BackColor = System.Drawing.Color.Transparent
        Me.Label2.ForeColor = System.Drawing.Color.White
        Me.Label2.Location = New System.Drawing.Point(14, 57)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(83, 13)
        Me.Label2.TabIndex = 15
        Me.Label2.Text = "Encryption key :"
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.Color.Transparent
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.TextFile)
        Me.GroupBox1.Controls.Add(Me.BtnBrowse)
        Me.GroupBox1.ForeColor = System.Drawing.Color.White
        Me.GroupBox1.Location = New System.Drawing.Point(12, 12)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(335, 91)
        Me.GroupBox1.TabIndex = 18
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "File :"
        '
        'GroupBox2
        '
        Me.GroupBox2.BackColor = System.Drawing.Color.Transparent
        Me.GroupBox2.Controls.Add(Me.CheckDES)
        Me.GroupBox2.Controls.Add(Me.CheckRC4)
        Me.GroupBox2.Controls.Add(Me.TextEnc)
        Me.GroupBox2.Controls.Add(Me.Label2)
        Me.GroupBox2.ForeColor = System.Drawing.Color.White
        Me.GroupBox2.Location = New System.Drawing.Point(354, 245)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(217, 91)
        Me.GroupBox2.TabIndex = 19
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Encryption :"
        '
        'CheckDES
        '
        Me.CheckDES.AutoSize = True
        Me.CheckDES.Location = New System.Drawing.Point(120, 21)
        Me.CheckDES.Name = "CheckDES"
        Me.CheckDES.Size = New System.Drawing.Size(73, 17)
        Me.CheckDES.TabIndex = 17
        Me.CheckDES.Text = "TripleDES"
        Me.CheckDES.UseVisualStyleBackColor = True
        '
        'CheckRC4
        '
        Me.CheckRC4.AutoSize = True
        Me.CheckRC4.Checked = True
        Me.CheckRC4.Location = New System.Drawing.Point(17, 23)
        Me.CheckRC4.Name = "CheckRC4"
        Me.CheckRC4.Size = New System.Drawing.Size(46, 17)
        Me.CheckRC4.TabIndex = 16
        Me.CheckRC4.TabStop = True
        Me.CheckRC4.Text = "RC4"
        Me.CheckRC4.UseVisualStyleBackColor = True
        '
        'GroupBox3
        '
        Me.GroupBox3.BackColor = System.Drawing.Color.Transparent
        Me.GroupBox3.Controls.Add(Me.TextBytes)
        Me.GroupBox3.Controls.Add(Me.CheckBytes)
        Me.GroupBox3.Controls.Add(Me.TextProc)
        Me.GroupBox3.Controls.Add(Me.CheckInject)
        Me.GroupBox3.Controls.Add(Me.CheckAntis)
        Me.GroupBox3.ForeColor = System.Drawing.Color.White
        Me.GroupBox3.Location = New System.Drawing.Point(354, 109)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(334, 125)
        Me.GroupBox3.TabIndex = 20
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "Others :"
        '
        'TextProc
        '
        Me.TextProc.Location = New System.Drawing.Point(174, 53)
        Me.TextProc.Name = "TextProc"
        Me.TextProc.Size = New System.Drawing.Size(141, 20)
        Me.TextProc.TabIndex = 2
        Me.TextProc.Text = "explorer"
        '
        'CheckInject
        '
        Me.CheckInject.AutoSize = True
        Me.CheckInject.Location = New System.Drawing.Point(19, 56)
        Me.CheckInject.Name = "CheckInject"
        Me.CheckInject.Size = New System.Drawing.Size(149, 17)
        Me.CheckInject.TabIndex = 1
        Me.CheckInject.Text = "Custom process injection :"
        Me.CheckInject.UseVisualStyleBackColor = True
        '
        'CheckAntis
        '
        Me.CheckAntis.AutoSize = True
        Me.CheckAntis.Checked = True
        Me.CheckAntis.CheckState = System.Windows.Forms.CheckState.Checked
        Me.CheckAntis.Location = New System.Drawing.Point(19, 19)
        Me.CheckAntis.Name = "CheckAntis"
        Me.CheckAntis.Size = New System.Drawing.Size(87, 17)
        Me.CheckAntis.TabIndex = 0
        Me.CheckAntis.Text = "Enable Anti's"
        Me.CheckAntis.UseVisualStyleBackColor = True
        '
        'GroupBox4
        '
        Me.GroupBox4.BackColor = System.Drawing.Color.Transparent
        Me.GroupBox4.Controls.Add(Me.BtnBind)
        Me.GroupBox4.Controls.Add(Me.TextBind)
        Me.GroupBox4.Controls.Add(Me.CheckBind)
        Me.GroupBox4.Controls.Add(Me.CheckClone)
        Me.GroupBox4.Controls.Add(Me.TextClone)
        Me.GroupBox4.Controls.Add(Me.BtnClone)
        Me.GroupBox4.Controls.Add(Me.BtnIcon)
        Me.GroupBox4.Controls.Add(Me.CheckIcon)
        Me.GroupBox4.Controls.Add(Me.TextIcon)
        Me.GroupBox4.ForeColor = System.Drawing.Color.White
        Me.GroupBox4.Location = New System.Drawing.Point(12, 109)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(335, 227)
        Me.GroupBox4.TabIndex = 21
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "Options :"
        '
        'BtnBind
        '
        Me.BtnBind.ForeColor = System.Drawing.Color.Black
        Me.BtnBind.Location = New System.Drawing.Point(272, 180)
        Me.BtnBind.Name = "BtnBind"
        Me.BtnBind.Size = New System.Drawing.Size(44, 19)
        Me.BtnBind.TabIndex = 15
        Me.BtnBind.Text = "..."
        Me.BtnBind.UseVisualStyleBackColor = True
        '
        'TextBind
        '
        Me.TextBind.Location = New System.Drawing.Point(20, 179)
        Me.TextBind.Name = "TextBind"
        Me.TextBind.Size = New System.Drawing.Size(236, 20)
        Me.TextBind.TabIndex = 14
        '
        'CheckBind
        '
        Me.CheckBind.AutoSize = True
        Me.CheckBind.Location = New System.Drawing.Point(21, 156)
        Me.CheckBind.Name = "CheckBind"
        Me.CheckBind.Size = New System.Drawing.Size(85, 17)
        Me.CheckBind.TabIndex = 13
        Me.CheckBind.Text = "Bind with file"
        Me.CheckBind.UseVisualStyleBackColor = True
        '
        'CheckBytes
        '
        Me.CheckBytes.AutoSize = True
        Me.CheckBytes.Location = New System.Drawing.Point(21, 92)
        Me.CheckBytes.Name = "CheckBytes"
        Me.CheckBytes.Size = New System.Drawing.Size(96, 17)
        Me.CheckBytes.TabIndex = 3
        Me.CheckBytes.Text = "Add bytes (mb)"
        Me.CheckBytes.UseVisualStyleBackColor = True
        '
        'TextBytes
        '
        Me.TextBytes.Location = New System.Drawing.Point(174, 90)
        Me.TextBytes.Name = "TextBytes"
        Me.TextBytes.Size = New System.Drawing.Size(140, 20)
        Me.TextBytes.TabIndex = 4
        Me.TextBytes.Text = "5"
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackgroundImage = CType(resources.GetObject("$this.BackgroundImage"), System.Drawing.Image)
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.ClientSize = New System.Drawing.Size(696, 347)
        Me.Controls.Add(Me.GroupBox4)
        Me.Controls.Add(Me.GroupBox3)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.BtnCtypt)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "Form1"
        Me.Text = "Moon Crypter 2 by t0fx"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox3.PerformLayout()
        Me.GroupBox4.ResumeLayout(False)
        Me.GroupBox4.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents TextFile As System.Windows.Forms.TextBox
    Friend WithEvents BtnBrowse As System.Windows.Forms.Button
    Friend WithEvents BtnCtypt As System.Windows.Forms.Button
    Friend WithEvents OpenFileDialog1 As System.Windows.Forms.OpenFileDialog
    Friend WithEvents CheckIcon As System.Windows.Forms.CheckBox
    Friend WithEvents TextIcon As System.Windows.Forms.TextBox
    Friend WithEvents BtnIcon As System.Windows.Forms.Button
    Friend WithEvents CheckClone As System.Windows.Forms.CheckBox
    Friend WithEvents TextClone As System.Windows.Forms.TextBox
    Friend WithEvents BtnClone As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents TextEnc As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents CheckDES As System.Windows.Forms.RadioButton
    Friend WithEvents CheckRC4 As System.Windows.Forms.RadioButton
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents CheckAntis As System.Windows.Forms.CheckBox
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents BtnBind As System.Windows.Forms.Button
    Friend WithEvents TextBind As System.Windows.Forms.TextBox
    Friend WithEvents CheckBind As System.Windows.Forms.CheckBox
    Friend WithEvents TextProc As System.Windows.Forms.TextBox
    Friend WithEvents CheckInject As System.Windows.Forms.CheckBox
    Friend WithEvents TextBytes As System.Windows.Forms.TextBox
    Friend WithEvents CheckBytes As System.Windows.Forms.CheckBox

End Class
