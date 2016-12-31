<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form remplace la méthode Dispose pour nettoyer la liste des composants.
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

    'Requise par le Concepteur Windows Form
    Private components As System.ComponentModel.IContainer

    'REMARQUE : la procédure suivante est requise par le Concepteur Windows Form
    'Elle peut être modifiée à l'aide du Concepteur Windows Form.  
    'Ne la modifiez pas à l'aide de l'éditeur de code.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.Closei = New System.Windows.Forms.PictureBox
        Me.Mini = New System.Windows.Forms.PictureBox
        Me.iMenu = New System.Windows.Forms.TabControl
        Me.Bots = New System.Windows.Forms.TabPage
        Me.BList = New System.Windows.Forms.ListView
        Me.Online = New System.Windows.Forms.ColumnHeader
        Me.OS = New System.Windows.Forms.ColumnHeader
        Me.Version = New System.Windows.Forms.ColumnHeader
        Me.Username = New System.Windows.Forms.ColumnHeader
        Me.BMenu = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ScreenshotToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.FireFoxToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.ToolStripMenuItem1 = New System.Windows.Forms.ToolStripSeparator
        Me.DownloadFileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.UpdateServerToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.UninstallBotsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.Passwords = New System.Windows.Forms.TabPage
        Me.NIco = New System.Windows.Forms.NotifyIcon(Me.components)
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        CType(Me.Closei, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Mini, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.iMenu.SuspendLayout()
        Me.Bots.SuspendLayout()
        Me.BMenu.SuspendLayout()
        Me.SuspendLayout()
        '
        'Closei
        '
        Me.Closei.BackgroundImage = CType(resources.GetObject("Closei.BackgroundImage"), System.Drawing.Image)
        Me.Closei.Cursor = System.Windows.Forms.Cursors.Hand
        Me.Closei.Image = CType(resources.GetObject("Closei.Image"), System.Drawing.Image)
        Me.Closei.Location = New System.Drawing.Point(580, 15)
        Me.Closei.Name = "Closei"
        Me.Closei.Size = New System.Drawing.Size(10, 10)
        Me.Closei.TabIndex = 0
        Me.Closei.TabStop = False
        '
        'Mini
        '
        Me.Mini.BackgroundImage = CType(resources.GetObject("Mini.BackgroundImage"), System.Drawing.Image)
        Me.Mini.Cursor = System.Windows.Forms.Cursors.Hand
        Me.Mini.Image = CType(resources.GetObject("Mini.Image"), System.Drawing.Image)
        Me.Mini.Location = New System.Drawing.Point(560, 15)
        Me.Mini.Name = "Mini"
        Me.Mini.Size = New System.Drawing.Size(10, 10)
        Me.Mini.TabIndex = 1
        Me.Mini.TabStop = False
        '
        'iMenu
        '
        Me.iMenu.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.iMenu.Controls.Add(Me.Bots)
        Me.iMenu.Controls.Add(Me.Passwords)
        Me.iMenu.ItemSize = New System.Drawing.Size(96, 19)
        Me.iMenu.Location = New System.Drawing.Point(10, 13)
        Me.iMenu.Margin = New System.Windows.Forms.Padding(0)
        Me.iMenu.Name = "iMenu"
        Me.iMenu.SelectedIndex = 0
        Me.iMenu.Size = New System.Drawing.Size(580, 205)
        Me.iMenu.SizeMode = System.Windows.Forms.TabSizeMode.Fixed
        Me.iMenu.TabIndex = 2
        '
        'Bots
        '
        Me.Bots.Controls.Add(Me.BList)
        Me.Bots.Location = New System.Drawing.Point(4, 23)
        Me.Bots.Margin = New System.Windows.Forms.Padding(0)
        Me.Bots.Name = "Bots"
        Me.Bots.Size = New System.Drawing.Size(572, 178)
        Me.Bots.TabIndex = 0
        Me.Bots.Text = "Zombies"
        Me.Bots.UseVisualStyleBackColor = True
        '
        'BList
        '
        Me.BList.BackColor = System.Drawing.Color.White
        Me.BList.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.BList.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.Online, Me.OS, Me.Version, Me.Username})
        Me.BList.ContextMenuStrip = Me.BMenu
        Me.BList.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BList.FullRowSelect = True
        Me.BList.GridLines = True
        Me.BList.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable
        Me.BList.Location = New System.Drawing.Point(3, 6)
        Me.BList.Name = "BList"
        Me.BList.Size = New System.Drawing.Size(566, 172)
        Me.BList.TabIndex = 1
        Me.BList.UseCompatibleStateImageBehavior = False
        Me.BList.View = System.Windows.Forms.View.Details
        '
        'Online
        '
        Me.Online.Text = "Zombies en ligne : 0"
        Me.Online.Width = 157
        '
        'OS
        '
        Me.OS.Text = "System d'exploitation"
        Me.OS.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        Me.OS.Width = 172
        '
        'Version
        '
        Me.Version.Text = "Version"
        Me.Version.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        Me.Version.Width = 83
        '
        'Username
        '
        Me.Username.Text = "Username"
        Me.Username.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        Me.Username.Width = 151
        '
        'BMenu
        '
        Me.BMenu.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BMenu.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ScreenshotToolStripMenuItem, Me.FireFoxToolStripMenuItem, Me.ToolStripMenuItem1, Me.DownloadFileToolStripMenuItem, Me.UpdateServerToolStripMenuItem, Me.UninstallBotsToolStripMenuItem})
        Me.BMenu.Name = "BMenu"
        Me.BMenu.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional
        Me.BMenu.Size = New System.Drawing.Size(140, 120)
        '
        'ScreenshotToolStripMenuItem
        '
        Me.ScreenshotToolStripMenuItem.Name = "ScreenshotToolStripMenuItem"
        Me.ScreenshotToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.ScreenshotToolStripMenuItem.Text = "Screenshot"
        '
        'FireFoxToolStripMenuItem
        '
        Me.FireFoxToolStripMenuItem.Name = "FireFoxToolStripMenuItem"
        Me.FireFoxToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.FireFoxToolStripMenuItem.Text = "FireFox"
        '
        'ToolStripMenuItem1
        '
        Me.ToolStripMenuItem1.Name = "ToolStripMenuItem1"
        Me.ToolStripMenuItem1.Size = New System.Drawing.Size(149, 6)
        '
        'DownloadFileToolStripMenuItem
        '
        Me.DownloadFileToolStripMenuItem.Name = "DownloadFileToolStripMenuItem"
        Me.DownloadFileToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.DownloadFileToolStripMenuItem.Text = "Telecharger"
        '
        'UpdateServerToolStripMenuItem
        '
        Me.UpdateServerToolStripMenuItem.Name = "UpdateServerToolStripMenuItem"
        Me.UpdateServerToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.UpdateServerToolStripMenuItem.Text = "Mise a jour"
        '
        'UninstallBotsToolStripMenuItem
        '
        Me.UninstallBotsToolStripMenuItem.Name = "UninstallBotsToolStripMenuItem"
        Me.UninstallBotsToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.UninstallBotsToolStripMenuItem.Text = "Desinstaller"
        '
        'Passwords
        '
        Me.Passwords.Location = New System.Drawing.Point(4, 23)
        Me.Passwords.Name = "Passwords"
        Me.Passwords.Padding = New System.Windows.Forms.Padding(3)
        Me.Passwords.Size = New System.Drawing.Size(572, 178)
        Me.Passwords.TabIndex = 1
        Me.Passwords.Text = "Passwords"
        Me.Passwords.UseVisualStyleBackColor = True
        '
        'NIco
        '
        Me.NIco.Icon = CType(resources.GetObject("NIco.Icon"), System.Drawing.Icon)
        Me.NIco.Text = "iDDoSeR"
        '
        'Timer1
        '
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 14.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.BackgroundImage = CType(resources.GetObject("$this.BackgroundImage"), System.Drawing.Image)
        Me.ClientSize = New System.Drawing.Size(600, 230)
        Me.Controls.Add(Me.Mini)
        Me.Controls.Add(Me.iMenu)
        Me.Controls.Add(Me.Closei)
        Me.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.MaximizeBox = False
        Me.Name = "Form1"
        Me.Text = "iDDoSeR - Version 1.0"
        CType(Me.Closei, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Mini, System.ComponentModel.ISupportInitialize).EndInit()
        Me.iMenu.ResumeLayout(False)
        Me.Bots.ResumeLayout(False)
        Me.BMenu.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents Closei As System.Windows.Forms.PictureBox
    Friend WithEvents Mini As System.Windows.Forms.PictureBox
    Friend WithEvents iMenu As System.Windows.Forms.TabControl
    Friend WithEvents Passwords As System.Windows.Forms.TabPage
    Friend WithEvents Bots As System.Windows.Forms.TabPage
    Friend WithEvents BMenu As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ScreenshotToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents BList As System.Windows.Forms.ListView
    Friend WithEvents Online As System.Windows.Forms.ColumnHeader
    Friend WithEvents OS As System.Windows.Forms.ColumnHeader
    Friend WithEvents Version As System.Windows.Forms.ColumnHeader
    Friend WithEvents Username As System.Windows.Forms.ColumnHeader
    Friend WithEvents NIco As System.Windows.Forms.NotifyIcon
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents FireFoxToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripMenuItem1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents DownloadFileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UpdateServerToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UninstallBotsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem

End Class
