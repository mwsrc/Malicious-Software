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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.iconpath = New System.Windows.Forms.TextBox()
        Me.IconPicBox = New System.Windows.Forms.PictureBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.chkHide = New System.Windows.Forms.CheckBox()
        Me.chkMelt = New System.Windows.Forms.CheckBox()
        Me.chkRestart = New System.Windows.Forms.CheckBox()
        Me.chkFolder = New System.Windows.Forms.CheckBox()
        Me.chkCMD = New System.Windows.Forms.CheckBox()
        Me.chkTaskManager = New System.Windows.Forms.CheckBox()
        Me.chkStart = New System.Windows.Forms.CheckBox()
        Me.GroupBox3 = New System.Windows.Forms.GroupBox()
        Me.chkPumper = New System.Windows.Forms.CheckBox()
        Me.txtMB = New System.Windows.Forms.TextBox()
        Me.chkMB = New System.Windows.Forms.CheckBox()
        Me.txtKB = New System.Windows.Forms.TextBox()
        Me.chkKB = New System.Windows.Forms.CheckBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.stealth = New System.Windows.Forms.TextBox()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.chkHost = New System.Windows.Forms.CheckBox()
        Me.GroupBox4 = New System.Windows.Forms.GroupBox()
        Me.abc8 = New System.Windows.Forms.CheckBox()
        Me.abc7 = New System.Windows.Forms.CheckBox()
        Me.abc6 = New System.Windows.Forms.CheckBox()
        Me.abc4 = New System.Windows.Forms.CheckBox()
        Me.abc5 = New System.Windows.Forms.CheckBox()
        Me.abc3 = New System.Windows.Forms.CheckBox()
        Me.abc2 = New System.Windows.Forms.CheckBox()
        Me.abc1 = New System.Windows.Forms.CheckBox()
        Me.chkJunk = New System.Windows.Forms.CheckBox()
        Me.GroupBox5 = New System.Windows.Forms.GroupBox()
        Me.startexe = New System.Windows.Forms.ComboBox()
        Me.BullionButton5 = New WindowsApplication1.BullionButton()
        Me.BullionButton4 = New WindowsApplication1.BullionButton()
        Me.BullionButton3 = New WindowsApplication1.BullionButton()
        Me.BullionButton2 = New WindowsApplication1.BullionButton()
        Me.BullionButton1 = New WindowsApplication1.BullionButton()
        Me.BullionTheme1 = New WindowsApplication1.BullionTheme()
        CType(Me.IconPicBox, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        Me.GroupBox5.SuspendLayout()
        Me.SuspendLayout()
        '
        'TextBox1
        '
        Me.TextBox1.BackColor = System.Drawing.Color.White
        Me.TextBox1.ForeColor = System.Drawing.Color.Black
        Me.TextBox1.Location = New System.Drawing.Point(12, 46)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(326, 20)
        Me.TextBox1.TabIndex = 1
        '
        'iconpath
        '
        Me.iconpath.BackColor = System.Drawing.Color.White
        Me.iconpath.ForeColor = System.Drawing.Color.Black
        Me.iconpath.Location = New System.Drawing.Point(12, 101)
        Me.iconpath.Name = "iconpath"
        Me.iconpath.Size = New System.Drawing.Size(326, 20)
        Me.iconpath.TabIndex = 10
        '
        'IconPicBox
        '
        Me.IconPicBox.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.IconPicBox.Location = New System.Drawing.Point(269, 128)
        Me.IconPicBox.Name = "IconPicBox"
        Me.IconPicBox.Size = New System.Drawing.Size(69, 34)
        Me.IconPicBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.IconPicBox.TabIndex = 11
        Me.IconPicBox.TabStop = False
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(196, 127)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(72, 13)
        Me.Label1.TabIndex = 12
        Me.Label1.Text = "Icon Preview:"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.chkHide)
        Me.GroupBox1.Controls.Add(Me.chkMelt)
        Me.GroupBox1.Controls.Add(Me.chkRestart)
        Me.GroupBox1.Controls.Add(Me.chkFolder)
        Me.GroupBox1.Controls.Add(Me.chkCMD)
        Me.GroupBox1.Controls.Add(Me.chkTaskManager)
        Me.GroupBox1.Font = New System.Drawing.Font("Times New Roman", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox1.Location = New System.Drawing.Point(12, 189)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(202, 135)
        Me.GroupBox1.TabIndex = 13
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Special Settings"
        '
        'chkHide
        '
        Me.chkHide.AutoSize = True
        Me.chkHide.Location = New System.Drawing.Point(69, 111)
        Me.chkHide.Name = "chkHide"
        Me.chkHide.Size = New System.Drawing.Size(122, 18)
        Me.chkHide.TabIndex = 20
        Me.chkHide.Text = "Hide after Execution"
        Me.chkHide.UseVisualStyleBackColor = True
        '
        'chkMelt
        '
        Me.chkMelt.AutoSize = True
        Me.chkMelt.Location = New System.Drawing.Point(6, 113)
        Me.chkMelt.Name = "chkMelt"
        Me.chkMelt.Size = New System.Drawing.Size(48, 18)
        Me.chkMelt.TabIndex = 19
        Me.chkMelt.Text = "Melt"
        Me.chkMelt.UseVisualStyleBackColor = True
        '
        'chkRestart
        '
        Me.chkRestart.AutoSize = True
        Me.chkRestart.Location = New System.Drawing.Point(6, 89)
        Me.chkRestart.Name = "chkRestart"
        Me.chkRestart.Size = New System.Drawing.Size(88, 18)
        Me.chkRestart.TabIndex = 3
        Me.chkRestart.Text = "Force Restart"
        Me.chkRestart.UseVisualStyleBackColor = True
        '
        'chkFolder
        '
        Me.chkFolder.AutoSize = True
        Me.chkFolder.Location = New System.Drawing.Point(6, 65)
        Me.chkFolder.Name = "chkFolder"
        Me.chkFolder.Size = New System.Drawing.Size(131, 18)
        Me.chkFolder.TabIndex = 2
        Me.chkFolder.Text = "Disable Folder Options"
        Me.chkFolder.UseVisualStyleBackColor = True
        '
        'chkCMD
        '
        Me.chkCMD.AutoSize = True
        Me.chkCMD.Location = New System.Drawing.Point(6, 41)
        Me.chkCMD.Name = "chkCMD"
        Me.chkCMD.Size = New System.Drawing.Size(148, 18)
        Me.chkCMD.TabIndex = 1
        Me.chkCMD.Text = "Disable Command Prompt"
        Me.chkCMD.UseVisualStyleBackColor = True
        '
        'chkTaskManager
        '
        Me.chkTaskManager.AutoSize = True
        Me.chkTaskManager.Location = New System.Drawing.Point(6, 19)
        Me.chkTaskManager.Name = "chkTaskManager"
        Me.chkTaskManager.Size = New System.Drawing.Size(127, 18)
        Me.chkTaskManager.TabIndex = 0
        Me.chkTaskManager.Text = "Disable Task Manager"
        Me.chkTaskManager.UseVisualStyleBackColor = True
        '
        'chkStart
        '
        Me.chkStart.AutoSize = True
        Me.chkStart.Location = New System.Drawing.Point(6, 20)
        Me.chkStart.Name = "chkStart"
        Me.chkStart.Size = New System.Drawing.Size(66, 18)
        Me.chkStart.TabIndex = 21
        Me.chkStart.Text = "Activate"
        Me.chkStart.UseVisualStyleBackColor = True
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.chkPumper)
        Me.GroupBox3.Controls.Add(Me.txtMB)
        Me.GroupBox3.Controls.Add(Me.chkMB)
        Me.GroupBox3.Controls.Add(Me.txtKB)
        Me.GroupBox3.Controls.Add(Me.chkKB)
        Me.GroupBox3.Font = New System.Drawing.Font("Times New Roman", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox3.Location = New System.Drawing.Point(12, 323)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(151, 94)
        Me.GroupBox3.TabIndex = 16
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "Pumper "
        '
        'chkPumper
        '
        Me.chkPumper.AutoSize = True
        Me.chkPumper.Location = New System.Drawing.Point(6, 71)
        Me.chkPumper.Name = "chkPumper"
        Me.chkPumper.Size = New System.Drawing.Size(66, 18)
        Me.chkPumper.TabIndex = 19
        Me.chkPumper.Text = "Activate"
        Me.chkPumper.UseVisualStyleBackColor = True
        '
        'txtMB
        '
        Me.txtMB.BackColor = System.Drawing.Color.White
        Me.txtMB.Location = New System.Drawing.Point(6, 45)
        Me.txtMB.Name = "txtMB"
        Me.txtMB.Size = New System.Drawing.Size(70, 20)
        Me.txtMB.TabIndex = 18
        '
        'chkMB
        '
        Me.chkMB.AutoSize = True
        Me.chkMB.Location = New System.Drawing.Point(82, 45)
        Me.chkMB.Name = "chkMB"
        Me.chkMB.Size = New System.Drawing.Size(43, 18)
        Me.chkMB.TabIndex = 18
        Me.chkMB.Text = "MB"
        Me.chkMB.UseVisualStyleBackColor = True
        '
        'txtKB
        '
        Me.txtKB.BackColor = System.Drawing.Color.White
        Me.txtKB.Location = New System.Drawing.Point(6, 19)
        Me.txtKB.Name = "txtKB"
        Me.txtKB.Size = New System.Drawing.Size(70, 20)
        Me.txtKB.TabIndex = 17
        '
        'chkKB
        '
        Me.chkKB.AutoSize = True
        Me.chkKB.Location = New System.Drawing.Point(82, 21)
        Me.chkKB.Name = "chkKB"
        Me.chkKB.Size = New System.Drawing.Size(41, 18)
        Me.chkKB.TabIndex = 17
        Me.chkKB.Text = "KB"
        Me.chkKB.UseVisualStyleBackColor = True
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(9, 166)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(202, 13)
        Me.Label2.TabIndex = 17
        Me.Label2.Text = "Custom Stealth Injection Process:"
        '
        'stealth
        '
        Me.stealth.BackColor = System.Drawing.Color.White
        Me.stealth.Location = New System.Drawing.Point(217, 163)
        Me.stealth.Name = "stealth"
        Me.stealth.Size = New System.Drawing.Size(91, 20)
        Me.stealth.TabIndex = 18
        Me.stealth.Text = "moof32"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(311, 170)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(27, 13)
        Me.Label3.TabIndex = 19
        Me.Label3.Text = ".exe"
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.BullionButton5)
        Me.GroupBox2.Controls.Add(Me.chkHost)
        Me.GroupBox2.Font = New System.Drawing.Font("Times New Roman", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox2.Location = New System.Drawing.Point(169, 323)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(171, 94)
        Me.GroupBox2.TabIndex = 20
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Host Editing"
        '
        'chkHost
        '
        Me.chkHost.AutoSize = True
        Me.chkHost.Location = New System.Drawing.Point(14, 19)
        Me.chkHost.Name = "chkHost"
        Me.chkHost.Size = New System.Drawing.Size(74, 18)
        Me.chkHost.TabIndex = 0
        Me.chkHost.Text = "Edit Hosts"
        Me.chkHost.UseVisualStyleBackColor = True
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.abc8)
        Me.GroupBox4.Controls.Add(Me.abc7)
        Me.GroupBox4.Controls.Add(Me.abc6)
        Me.GroupBox4.Controls.Add(Me.abc4)
        Me.GroupBox4.Controls.Add(Me.abc5)
        Me.GroupBox4.Controls.Add(Me.abc3)
        Me.GroupBox4.Controls.Add(Me.abc2)
        Me.GroupBox4.Controls.Add(Me.abc1)
        Me.GroupBox4.Controls.Add(Me.chkJunk)
        Me.GroupBox4.Location = New System.Drawing.Point(12, 423)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(329, 83)
        Me.GroupBox4.TabIndex = 21
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "Polymorphism Options"
        '
        'abc8
        '
        Me.abc8.AutoSize = True
        Me.abc8.Location = New System.Drawing.Point(161, 60)
        Me.abc8.Name = "abc8"
        Me.abc8.Size = New System.Drawing.Size(69, 17)
        Me.abc8.TabIndex = 8
        Me.abc8.Text = "Variables"
        Me.abc8.UseVisualStyleBackColor = True
        '
        'abc7
        '
        Me.abc7.AutoSize = True
        Me.abc7.Location = New System.Drawing.Point(243, 60)
        Me.abc7.Name = "abc7"
        Me.abc7.Size = New System.Drawing.Size(61, 17)
        Me.abc7.TabIndex = 7
        Me.abc7.Text = "Dialogs"
        Me.abc7.UseVisualStyleBackColor = True
        '
        'abc6
        '
        Me.abc6.AutoSize = True
        Me.abc6.Location = New System.Drawing.Point(82, 60)
        Me.abc6.Name = "abc6"
        Me.abc6.Size = New System.Drawing.Size(73, 17)
        Me.abc6.TabIndex = 6
        Me.abc6.Text = "Constants"
        Me.abc6.UseVisualStyleBackColor = True
        '
        'abc4
        '
        Me.abc4.AutoSize = True
        Me.abc4.Location = New System.Drawing.Point(243, 43)
        Me.abc4.Name = "abc4"
        Me.abc4.Size = New System.Drawing.Size(64, 17)
        Me.abc4.TabIndex = 5
        Me.abc4.Text = "Integers"
        Me.abc4.UseVisualStyleBackColor = True
        '
        'abc5
        '
        Me.abc5.AutoSize = True
        Me.abc5.Location = New System.Drawing.Point(82, 44)
        Me.abc5.Name = "abc5"
        Me.abc5.Size = New System.Drawing.Size(58, 17)
        Me.abc5.TabIndex = 4
        Me.abc5.Text = "Strings"
        Me.abc5.UseVisualStyleBackColor = True
        '
        'abc3
        '
        Me.abc3.AutoSize = True
        Me.abc3.Location = New System.Drawing.Point(6, 60)
        Me.abc3.Name = "abc3"
        Me.abc3.Size = New System.Drawing.Size(48, 17)
        Me.abc3.TabIndex = 3
        Me.abc3.Text = "APIs"
        Me.abc3.UseVisualStyleBackColor = True
        '
        'abc2
        '
        Me.abc2.AutoSize = True
        Me.abc2.Location = New System.Drawing.Point(6, 43)
        Me.abc2.Name = "abc2"
        Me.abc2.Size = New System.Drawing.Size(66, 17)
        Me.abc2.TabIndex = 2
        Me.abc2.Text = "Modules"
        Me.abc2.UseVisualStyleBackColor = True
        '
        'abc1
        '
        Me.abc1.AutoSize = True
        Me.abc1.Location = New System.Drawing.Point(161, 43)
        Me.abc1.Name = "abc1"
        Me.abc1.Size = New System.Drawing.Size(72, 17)
        Me.abc1.TabIndex = 1
        Me.abc1.Text = "Functions"
        Me.abc1.UseVisualStyleBackColor = True
        '
        'chkJunk
        '
        Me.chkJunk.AutoSize = True
        Me.chkJunk.Font = New System.Drawing.Font("Comic Sans MS", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.chkJunk.Location = New System.Drawing.Point(82, 19)
        Me.chkJunk.Name = "chkJunk"
        Me.chkJunk.Size = New System.Drawing.Size(140, 19)
        Me.chkJunk.TabIndex = 0
        Me.chkJunk.Text = "------| Use Junks |------"
        Me.chkJunk.UseVisualStyleBackColor = True
        '
        'GroupBox5
        '
        Me.GroupBox5.Controls.Add(Me.startexe)
        Me.GroupBox5.Controls.Add(Me.chkStart)
        Me.GroupBox5.Font = New System.Drawing.Font("Times New Roman", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox5.Location = New System.Drawing.Point(217, 189)
        Me.GroupBox5.Name = "GroupBox5"
        Me.GroupBox5.Size = New System.Drawing.Size(121, 74)
        Me.GroupBox5.TabIndex = 22
        Me.GroupBox5.TabStop = False
        Me.GroupBox5.Text = "Add to Startup"
        '
        'startexe
        '
        Me.startexe.BackColor = System.Drawing.Color.White
        Me.startexe.ForeColor = System.Drawing.Color.Black
        Me.startexe.FormattingEnabled = True
        Me.startexe.Items.AddRange(New Object() {"kernel32", "system32", "msconfig", "regedit", "AppData"})
        Me.startexe.Location = New System.Drawing.Point(6, 41)
        Me.startexe.Name = "startexe"
        Me.startexe.Size = New System.Drawing.Size(108, 22)
        Me.startexe.TabIndex = 22
        Me.startexe.Text = "Select startup"
        '
        'BullionButton5
        '
        Me.BullionButton5.Font = New System.Drawing.Font("Times New Roman", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BullionButton5.Image = CType(resources.GetObject("BullionButton5.Image"), System.Drawing.Image)
        Me.BullionButton5.Location = New System.Drawing.Point(6, 43)
        Me.BullionButton5.Name = "BullionButton5"
        Me.BullionButton5.Size = New System.Drawing.Size(159, 33)
        Me.BullionButton5.TabIndex = 1
        Me.BullionButton5.Text = "Open Host Editing Menu"
        '
        'BullionButton4
        '
        Me.BullionButton4.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.BullionButton4.Image = CType(resources.GetObject("BullionButton4.Image"), System.Drawing.Image)
        Me.BullionButton4.Location = New System.Drawing.Point(12, 127)
        Me.BullionButton4.Name = "BullionButton4"
        Me.BullionButton4.Size = New System.Drawing.Size(117, 23)
        Me.BullionButton4.TabIndex = 9
        Me.BullionButton4.Text = "Browse Icon"
        '
        'BullionButton3
        '
        Me.BullionButton3.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.BullionButton3.Image = CType(resources.GetObject("BullionButton3.Image"), System.Drawing.Image)
        Me.BullionButton3.Location = New System.Drawing.Point(255, 72)
        Me.BullionButton3.Name = "BullionButton3"
        Me.BullionButton3.Size = New System.Drawing.Size(83, 23)
        Me.BullionButton3.TabIndex = 6
        Me.BullionButton3.Text = "Crypt"
        '
        'BullionButton2
        '
        Me.BullionButton2.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.BullionButton2.Image = CType(resources.GetObject("BullionButton2.Image"), System.Drawing.Image)
        Me.BullionButton2.Location = New System.Drawing.Point(12, 72)
        Me.BullionButton2.Name = "BullionButton2"
        Me.BullionButton2.Size = New System.Drawing.Size(84, 23)
        Me.BullionButton2.TabIndex = 5
        Me.BullionButton2.Text = "Browse"
        '
        'BullionButton1
        '
        Me.BullionButton1.Font = New System.Drawing.Font("Verdana", 8.0!)
        Me.BullionButton1.Image = Nothing
        Me.BullionButton1.Location = New System.Drawing.Point(317, 0)
        Me.BullionButton1.Name = "BullionButton1"
        Me.BullionButton1.Size = New System.Drawing.Size(34, 22)
        Me.BullionButton1.TabIndex = 4
        Me.BullionButton1.Text = "X"
        '
        'BullionTheme1
        '
        Me.BullionTheme1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.BullionTheme1.Font = New System.Drawing.Font("Verdana", 7.0!)
        Me.BullionTheme1.Location = New System.Drawing.Point(0, 0)
        Me.BullionTheme1.Name = "BullionTheme1"
        Me.BullionTheme1.Size = New System.Drawing.Size(352, 515)
        Me.BullionTheme1.TabIndex = 8
        Me.BullionTheme1.Text = "[ForcedHacking.com] Polymorphic Crypter v.2.0 - Moof"
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(352, 515)
        Me.Controls.Add(Me.GroupBox5)
        Me.Controls.Add(Me.GroupBox4)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.stealth)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.GroupBox3)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.IconPicBox)
        Me.Controls.Add(Me.iconpath)
        Me.Controls.Add(Me.BullionButton4)
        Me.Controls.Add(Me.BullionButton3)
        Me.Controls.Add(Me.BullionButton2)
        Me.Controls.Add(Me.BullionButton1)
        Me.Controls.Add(Me.TextBox1)
        Me.Controls.Add(Me.BullionTheme1)
        Me.ForeColor = System.Drawing.Color.DimGray
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "Form1"
        Me.Opacity = 0.93R
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "[ForcedHacking.com] Polymorphic Crypter v.1 - Moof"
        CType(Me.IconPicBox, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox3.PerformLayout()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        Me.GroupBox4.ResumeLayout(False)
        Me.GroupBox4.PerformLayout()
        Me.GroupBox5.ResumeLayout(False)
        Me.GroupBox5.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents BullionButton1 As WindowsApplication1.BullionButton
    Friend WithEvents BullionButton2 As WindowsApplication1.BullionButton
    Friend WithEvents BullionButton3 As WindowsApplication1.BullionButton
    Friend WithEvents BullionTheme1 As WindowsApplication1.BullionTheme
    Friend WithEvents BullionButton4 As WindowsApplication1.BullionButton
    Friend WithEvents iconpath As System.Windows.Forms.TextBox
    Friend WithEvents IconPicBox As System.Windows.Forms.PictureBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents chkTaskManager As System.Windows.Forms.CheckBox
    Friend WithEvents chkCMD As System.Windows.Forms.CheckBox
    Friend WithEvents chkFolder As System.Windows.Forms.CheckBox
    Friend WithEvents chkRestart As System.Windows.Forms.CheckBox
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents txtMB As System.Windows.Forms.TextBox
    Friend WithEvents chkMB As System.Windows.Forms.CheckBox
    Friend WithEvents txtKB As System.Windows.Forms.TextBox
    Friend WithEvents chkKB As System.Windows.Forms.CheckBox
    Friend WithEvents chkPumper As System.Windows.Forms.CheckBox
    Friend WithEvents chkMelt As System.Windows.Forms.CheckBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents stealth As System.Windows.Forms.TextBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents chkHide As System.Windows.Forms.CheckBox
    Friend WithEvents chkStart As System.Windows.Forms.CheckBox
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents chkHost As System.Windows.Forms.CheckBox
    Friend WithEvents BullionButton5 As WindowsApplication1.BullionButton
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents abc3 As System.Windows.Forms.CheckBox
    Friend WithEvents abc2 As System.Windows.Forms.CheckBox
    Friend WithEvents abc1 As System.Windows.Forms.CheckBox
    Friend WithEvents chkJunk As System.Windows.Forms.CheckBox
    Friend WithEvents abc7 As System.Windows.Forms.CheckBox
    Friend WithEvents abc6 As System.Windows.Forms.CheckBox
    Friend WithEvents abc4 As System.Windows.Forms.CheckBox
    Friend WithEvents abc5 As System.Windows.Forms.CheckBox
    Friend WithEvents abc8 As System.Windows.Forms.CheckBox
    Friend WithEvents GroupBox5 As System.Windows.Forms.GroupBox
    Friend WithEvents startexe As System.Windows.Forms.ComboBox

End Class
